Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E861A3607
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMYHJ-0005K2-M1; Thu, 09 Apr 2020 14:35:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9neF=5Z=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jMYHI-0005Jt-AW
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:35:36 +0000
X-Inumbo-ID: 5cc8ecc2-7a6f-11ea-82d9-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cc8ecc2-7a6f-11ea-82d9-12813bfff9fa;
 Thu, 09 Apr 2020 14:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 46C4A2FEF;
 Thu,  9 Apr 2020 16:35:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gVfgDPR9TGcI; Thu,  9 Apr 2020 16:35:28 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id ED6A32FBC;
 Thu,  9 Apr 2020 16:35:27 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jMYH9-001zYH-6l; Thu, 09 Apr 2020 16:35:27 +0200
Date: Thu, 9 Apr 2020 16:35:27 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] mini-os: fix several memory leaks related to xenbus
Message-ID: <20200409143527.co3uensu2czln3mf@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, wl@xen.org
References: <20200409141240.28876-1-jgross@suse.com>
 <20200409141240.28876-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141240.28876-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le jeu. 09 avril 2020 16:12:40 +0200, a ecrit:
> There are several instances of calls to xenbus functions which don't
> test for an error and in consequence are not freeing the returned
> error strings, or which are just not freeing the string after e.g.
> printing it.
> 
> Fix that by either adding the needed calls of free().
> 
> Coverity-ID: 1433632
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  blkfront.c       |  4 ++--
>  console/xenbus.c |  2 +-
>  fbfront.c        |  4 ++--
>  netfront.c       |  2 +-
>  pcifront.c       | 28 +++++++++++++---------------
>  shutdown.c       |  2 +-
>  xenbus/xenbus.c  |  2 ++
>  7 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/blkfront.c b/blkfront.c
> index f747216..834a978 100644
> --- a/blkfront.c
> +++ b/blkfront.c
> @@ -200,7 +200,7 @@ done:
>  
>          snprintf(path, sizeof(path), "%s/state", dev->backend);
>  
> -        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
> +        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
>  
>          msg = NULL;
>          state = xenbus_read_integer(path);
> @@ -208,7 +208,7 @@ done:
>              msg = xenbus_wait_for_state_change(path, &state, &dev->events);
>          if (msg != NULL || state != XenbusStateConnected) {
>              printk("backend not available, state=%d\n", state);
> -            xenbus_unwatch_path_token(XBT_NIL, path, path);
> +            free(xenbus_unwatch_path_token(XBT_NIL, path, path));
>              goto error;
>          }
>  
> diff --git a/console/xenbus.c b/console/xenbus.c
> index 654b469..05fc31c 100644
> --- a/console/xenbus.c
> +++ b/console/xenbus.c
> @@ -164,7 +164,7 @@ done:
>          char path[strlen(dev->backend) + strlen("/state") + 1];
>          snprintf(path, sizeof(path), "%s/state", dev->backend);
>          
> -	xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
> +	free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
>          msg = NULL;
>          state = xenbus_read_integer(path);
>          while (msg == NULL && state < XenbusStateConnected)
> diff --git a/fbfront.c b/fbfront.c
> index 9cc07b4..d3b3848 100644
> --- a/fbfront.c
> +++ b/fbfront.c
> @@ -163,7 +163,7 @@ done:
>  
>          snprintf(path, sizeof(path), "%s/state", dev->backend);
>  
> -        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
> +        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
>  
>          err = NULL;
>          state = xenbus_read_integer(path);
> @@ -530,7 +530,7 @@ done:
>  
>          snprintf(path, sizeof(path), "%s/state", dev->backend);
>  
> -        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
> +        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
>  
>          err = NULL;
>          state = xenbus_read_integer(path);
> diff --git a/netfront.c b/netfront.c
> index fe7bb62..66f2bbc 100644
> --- a/netfront.c
> +++ b/netfront.c
> @@ -513,7 +513,7 @@ done:
>              err = xenbus_wait_for_state_change(path, &state, &dev->events);
>          if (state != XenbusStateConnected) {
>              printk("backend not avalable, state=%d\n", state);
> -            xenbus_unwatch_path_token(XBT_NIL, path, path);
> +            free(xenbus_unwatch_path_token(XBT_NIL, path, path));
>              goto error;
>          }
>  
> diff --git a/pcifront.c b/pcifront.c
> index 0fc5b30..5642356 100644
> --- a/pcifront.c
> +++ b/pcifront.c
> @@ -70,28 +70,28 @@ void pcifront_watches(void *opaque)
>  
>      while (1) {
>          printk("pcifront_watches: waiting for backend path to appear %s\n", path);
> -        xenbus_watch_path_token(XBT_NIL, path, path, &events);
> +        free(xenbus_watch_path_token(XBT_NIL, path, path, &events));
>          while ((err = xenbus_read(XBT_NIL, path, &be_path)) != NULL) {
>              free(err);
>              xenbus_wait_for_watch(&events);
>          }
> -        xenbus_unwatch_path_token(XBT_NIL, path, path);
> +        free(xenbus_unwatch_path_token(XBT_NIL, path, path));
>          printk("pcifront_watches: waiting for backend to get into the right state %s\n", be_path);
>          be_state = (char *) malloc(strlen(be_path) +  7);
>          snprintf(be_state, strlen(be_path) +  7, "%s/state", be_path);
> -        xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events);
> +        free(xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events));
>          while ((err = xenbus_read(XBT_NIL, be_state, &msg)) != NULL || msg[0] > '4') {
>              free(msg);
>              free(err);
>              xenbus_wait_for_watch(&events);
>          }
> -        xenbus_unwatch_path_token(XBT_NIL, be_state, be_state);
> +        free(xenbus_unwatch_path_token(XBT_NIL, be_state, be_state));
>          if (init_pcifront(NULL) == NULL) {
>              free(be_state);
>              free(be_path);
>              continue;
>          }
> -        xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events);
> +        free(xenbus_watch_path_token(XBT_NIL, be_state, be_state, &events));
>          state = XenbusStateConnected;
>          printk("pcifront_watches: waiting for backend events %s\n", be_state);
>          while ((err = xenbus_wait_for_state_change(be_state, &state, &events)) == NULL &&
> @@ -103,10 +103,9 @@ void pcifront_watches(void *opaque)
>                  if ((err = xenbus_switch_state(XBT_NIL, fe_state, XenbusStateReconfiguring)) != NULL) {
>                      printk("pcifront_watches: error changing state to %d: %s\n",
>                              XenbusStateReconfiguring, err);
> -                    if (!strcmp(err, "ENOENT")) {
> -                        xenbus_write(XBT_NIL, fe_state, "7");
> -                        free(err);
> -                    }
> +                    if (!strcmp(err, "ENOENT"))
> +                        free(xenbus_write(XBT_NIL, fe_state, "7"));
> +                    free(err);
>                  }
>              } else if (state == XenbusStateReconfigured) {
>                  printk("pcifront_watches: writing %s %d\n", fe_state, XenbusStateConnected);
> @@ -114,10 +113,9 @@ void pcifront_watches(void *opaque)
>                  if ((err = xenbus_switch_state(XBT_NIL, fe_state, XenbusStateConnected)) != NULL) {
>                      printk("pcifront_watches: error changing state to %d: %s\n",
>                              XenbusStateConnected, err);
> -                    if (!strcmp(err, "ENOENT")) {
> -                        xenbus_write(XBT_NIL, fe_state, "4");
> -                        free(err);
> -                    }
> +                    if (!strcmp(err, "ENOENT"))
> +                        free(xenbus_write(XBT_NIL, fe_state, "4"));
> +                    free(err);
>                  }
>              } else if (state == XenbusStateClosing)
>                  break;
> @@ -135,7 +133,7 @@ void pcifront_watches(void *opaque)
>          pcidev = NULL;
>      }
>  
> -    xenbus_unwatch_path_token(XBT_NIL, path, path);
> +    free(xenbus_unwatch_path_token(XBT_NIL, path, path));
>  }
>  
>  struct pcifront_dev *init_pcifront(char *_nodename)
> @@ -243,7 +241,7 @@ done:
>          XenbusState state;
>          snprintf(path, sizeof(path), "%s/state", dev->backend);
>  
> -        xenbus_watch_path_token(XBT_NIL, path, path, &dev->events);
> +        free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
>  
>          err = NULL;
>          state = xenbus_read_integer(path);
> diff --git a/shutdown.c b/shutdown.c
> index c7c92cb..4c0b13c 100644
> --- a/shutdown.c
> +++ b/shutdown.c
> @@ -71,7 +71,7 @@ static void shutdown_thread(void *p)
>      char *shutdown, *err;
>      unsigned int shutdown_reason;
>  
> -    xenbus_watch_path_token(XBT_NIL, path, token, &events);
> +    free(xenbus_watch_path_token(XBT_NIL, path, token, &events));
>  
>      for ( ;; ) {
>          xenbus_wait_for_watch(&events);
> diff --git a/xenbus/xenbus.c b/xenbus/xenbus.c
> index b12cef7..9e61930 100644
> --- a/xenbus/xenbus.c
> +++ b/xenbus/xenbus.c
> @@ -198,6 +198,8 @@ exit:
>          }
>          if (msg == NULL && msg2 != NULL)
>              msg = msg2;
> +        else
> +            free(msg2);
>      } while (retry);
>  
>      return msg;
> -- 
> 2.16.4
> 

