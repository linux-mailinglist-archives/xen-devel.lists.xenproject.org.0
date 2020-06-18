Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F211FF7A0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:44:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwhf-0000NK-9R; Thu, 18 Jun 2020 15:43:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/Oj=77=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jlwhd-0000NC-Od
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:43:45 +0000
X-Inumbo-ID: 7dc8a56b-b17a-11ea-bab1-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dc8a56b-b17a-11ea-bab1-12813bfff9fa;
 Thu, 18 Jun 2020 15:43:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bgtLkhZLDUWS9ieYmtFGFJuIM0D//NLNSt4C9yZ3MtD1/PE9EPQkRbB4yBKnsHoyXViP++4o5d
 Sr08uTpYh7QDCzV/SyxN+5XxJxO8kSPJ4AN2360fdPqJUhzcHa11YqMKCYGVto6p7I+lNUHrLU
 NiH/APdJWgB63N1dQ0LvSYFkNpTlvAKfma6hDyftoip6A1pSxVXG57c/noNAmS9+pbtKHvY6Cm
 UktYCLZbodYncTmBTE4gP8/sQru55NTJh74Qd+86BzhbuepZO2Ft6qxguK6FxmgNL4avRgWcJj
 GKo=
X-SBRS: 2.7
X-MesageID: 20613185
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20613185"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24299.35750.218855.454255@mariner.uk.xensource.com>
Date: Thu, 18 Jun 2020 16:43:34 +0100
To: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <xadimgnik@gmail.com>
Subject: Re: [PATCH for-4.14] xl: Allow shutdown wait for domain death
In-Reply-To: <20200617023642.80594-1-jandryuk@gmail.com>
References: <20200617023642.80594-1-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH] xl: Allow shutdown wait for domain death"):
> `xl shutdown -w` waits for the first of either domain shutdown or death.
> Shutdown is the halting of the guest operating system, and death is the
> freeing of domain resources.
> 
> Allow specifying -w multiple times to wait for only domain death.  This
> is useful in scripts so that all resources are free before the script
> continues.

Thanks!

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Paul, I think this is a candidate for 4.14.  Without this patch it is
not possible to reliably wait for a domain, with xl, and then restart
it.  (At least not without a good deal of pratting about and polling
with xl list.)  osstest has a `sleep' as a workaround...

I have reviewed this patch particularly carefully with a view to
understanding what happens if you pass just one `-w' as before.
I have convinced myself that there is definitely no change, so I don't
think this patch can introduce a regression.

Ian.

> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  docs/man/xl.1.pod.in    |  4 +++-
>  tools/xl/xl_vmcontrol.c | 17 +++++++++++------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index 09339282e6..52a47a6fbd 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -743,7 +743,9 @@ of a Xen system.
>  
>  =item B<-w>, B<--wait>
>  
> -Wait for the domain to complete shutdown before returning.
> +Wait for the domain to complete shutdown before returning.  If given once,
> +the wait is for domain shutdown or domain death.  If given multiple times,
> +the wait is for domain death only.
>  
>  =item B<-F>
>  
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 17b4514c94..435155a033 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -162,7 +162,8 @@ static void shutdown_domain(uint32_t domid,
>      }
>  }
>  
> -static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr)
> +static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr,
> +                                   int wait_for_shutdown_or_death)
>  {
>      int rc, count = 0;
>      LOG("Waiting for %d domains", nr);
> @@ -183,8 +184,12 @@ static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr)
>          case LIBXL_EVENT_TYPE_DOMAIN_SHUTDOWN:
>              LOG("Domain %d has been shut down, reason code %d",
>                  event->domid, event->u.domain_shutdown.shutdown_reason);
> -            libxl_evdisable_domain_death(ctx, deathws[event->for_user]);
> -            count++;
> +            if (wait_for_shutdown_or_death) {
> +                libxl_evdisable_domain_death(ctx, deathws[event->for_user]);
> +                count++;
> +            } else {
> +                LOG("Domain %d continue waiting for death", event->domid);
> +            }
>              break;
>          default:
>              LOG("Unexpected event type %d", event->type);
> @@ -214,7 +219,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
>          all = 1;
>          break;
>      case 'w':
> -        wait_for_it = 1;
> +        wait_for_it++;
>          break;
>      case 'F':
>          fallback_trigger = 1;
> @@ -246,7 +251,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
>          }
>  
>          if (deathws) {
> -            wait_for_domain_deaths(deathws, nrdeathws);
> +            wait_for_domain_deaths(deathws, nrdeathws, wait_for_it == 1);
>              free(deathws);
>          }
>  
> @@ -258,7 +263,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
>          fn(domid, wait_for_it ? &deathw : NULL, 0, fallback_trigger);
>  
>          if (wait_for_it)
> -            wait_for_domain_deaths(&deathw, 1);
> +            wait_for_domain_deaths(&deathw, 1, wait_for_it == 1);
>      }
>  
>  
> -- 
> 2.25.1
> 

