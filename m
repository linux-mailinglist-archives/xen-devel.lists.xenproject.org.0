Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516161FF815
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwq6-0001rZ-3z; Thu, 18 Jun 2020 15:52:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTxy=77=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlwq4-0001rU-4w
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:52:28 +0000
X-Inumbo-ID: b5552afc-b17b-11ea-8496-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5552afc-b17b-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 15:52:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q11so6606820wrp.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=li8oNN6ew0XxeSaemvQowz7zMpb4IhYQRYuOZlpR9iA=;
 b=VdI3CU3HVI9QgOOl87oggvIpp4Aqg9NOkOszxFc1laqe5BnG3mQonGGokUwkQPAV0O
 K71zW3qNISPdk5L1mL2gQzivk5/9hbzNLfBtUay9ksQuaeaEws4H+SnnvIYO3lQIKL4C
 acal+12kgAdPhH1mFzyG2GIc+xAOKTQwid1aSrV0laDea5F7JenwVE8aWscnUh1Iao5o
 i1hWbZawt1y2PG2GzjlR/1endJxWMLFaOLRRokppQgJc6Kbv8Ol0XPXNj1gPCDdiHjDr
 Ml9aU63adOPpQsomH8fiM0+wXVceCYzQBamiQWaOPwqK6EbcYRWCSdXrFNee9+JEBGd1
 2f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=li8oNN6ew0XxeSaemvQowz7zMpb4IhYQRYuOZlpR9iA=;
 b=I10lA5H9DLZxJCWEPjMGM4ThUid2RqomhF7zKj9gBHsqqoTADzhPbpOC7eOxv11Kue
 xN4Hbvk4rm12D3I4ZpXAntBJsRCCHkSHGul1hT40wIBpfCqWsrQGY3MuGkqLAyeGeYlo
 x5qpKVVutzP9A/6htGiqiZK/x4xH0pakXWV9LSqANoSyQ2bzhMmKroxTmrMFh3NvRRPH
 Z8N1CzjcZni2crbmyBSrTLo2kXJA7Yr2W7iR0ov5bQlI3aO/OYp2U7sXJOgQ5hBGuS/J
 rQMhfA4LibRcWERlhiZYCOp4w9FjFpmSIhXL5+w13TjXdgiJEwOOlrTQiCjnv3vaG+7N
 xjqA==
X-Gm-Message-State: AOAM530r82aEZXV/rBUzdDqGHJh7gm77mEps+7voA+TRoT+9owgyPoU3
 8EQwsczLgVx/mI+7eAZ7LzU=
X-Google-Smtp-Source: ABdhPJywNomNciTkbMbtXKWzCsoWo4d59SvcZqmmWsJ7oz3AIpANNz9Gp2RzmwOH2FiGybsyNZZ/rQ==
X-Received: by 2002:adf:fd4b:: with SMTP id h11mr5092570wrs.209.1592495546649; 
 Thu, 18 Jun 2020 08:52:26 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id v24sm4706202wrd.92.2020.06.18.08.52.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jun 2020 08:52:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Jason Andryuk'" <jandryuk@gmail.com>,
 "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200617023642.80594-1-jandryuk@gmail.com>
 <24299.35750.218855.454255@mariner.uk.xensource.com>
In-Reply-To: <24299.35750.218855.454255@mariner.uk.xensource.com>
Subject: RE: [PATCH for-4.14] xl: Allow shutdown wait for domain death
Date: Thu, 18 Jun 2020 16:52:24 +0100
Message-ID: <006701d64588$768bf1c0$63a3d540$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQETCCTnF9zzaa9ZdYDjbhQPQhOWdgHtT5ikqlWV2OA=
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
Reply-To: paul@xen.org
Cc: 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 18 June 2020 16:44
> To: Jason Andryuk <jandryuk@gmail.com>; Paul Durrant <xadimgnik@gmail.com>
> Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Anthony Perard <anthony.perard@citrix.com>
> Subject: Re: [PATCH for-4.14] xl: Allow shutdown wait for domain death
> 
> Jason Andryuk writes ("[PATCH] xl: Allow shutdown wait for domain death"):
> > `xl shutdown -w` waits for the first of either domain shutdown or death.
> > Shutdown is the halting of the guest operating system, and death is the
> > freeing of domain resources.
> >
> > Allow specifying -w multiple times to wait for only domain death.  This
> > is useful in scripts so that all resources are free before the script
> > continues.
> 
> Thanks!
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Paul, I think this is a candidate for 4.14.  Without this patch it is
> not possible to reliably wait for a domain, with xl, and then restart
> it.  (At least not without a good deal of pratting about and polling
> with xl list.)  osstest has a `sleep' as a workaround...
> 

Yes, it would nice to drop such workarounds.

> I have reviewed this patch particularly carefully with a view to
> understanding what happens if you pass just one `-w' as before.
> I have convinced myself that there is definitely no change, so I don't
> think this patch can introduce a regression.

Ok, I'll trust your judgement.

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> Ian.
> 
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  docs/man/xl.1.pod.in    |  4 +++-
> >  tools/xl/xl_vmcontrol.c | 17 +++++++++++------
> >  2 files changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> > index 09339282e6..52a47a6fbd 100644
> > --- a/docs/man/xl.1.pod.in
> > +++ b/docs/man/xl.1.pod.in
> > @@ -743,7 +743,9 @@ of a Xen system.
> >
> >  =item B<-w>, B<--wait>
> >
> > -Wait for the domain to complete shutdown before returning.
> > +Wait for the domain to complete shutdown before returning.  If given once,
> > +the wait is for domain shutdown or domain death.  If given multiple times,
> > +the wait is for domain death only.
> >
> >  =item B<-F>
> >
> > diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> > index 17b4514c94..435155a033 100644
> > --- a/tools/xl/xl_vmcontrol.c
> > +++ b/tools/xl/xl_vmcontrol.c
> > @@ -162,7 +162,8 @@ static void shutdown_domain(uint32_t domid,
> >      }
> >  }
> >
> > -static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr)
> > +static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr,
> > +                                   int wait_for_shutdown_or_death)
> >  {
> >      int rc, count = 0;
> >      LOG("Waiting for %d domains", nr);
> > @@ -183,8 +184,12 @@ static void wait_for_domain_deaths(libxl_evgen_domain_death **deathws, int nr)
> >          case LIBXL_EVENT_TYPE_DOMAIN_SHUTDOWN:
> >              LOG("Domain %d has been shut down, reason code %d",
> >                  event->domid, event->u.domain_shutdown.shutdown_reason);
> > -            libxl_evdisable_domain_death(ctx, deathws[event->for_user]);
> > -            count++;
> > +            if (wait_for_shutdown_or_death) {
> > +                libxl_evdisable_domain_death(ctx, deathws[event->for_user]);
> > +                count++;
> > +            } else {
> > +                LOG("Domain %d continue waiting for death", event->domid);
> > +            }
> >              break;
> >          default:
> >              LOG("Unexpected event type %d", event->type);
> > @@ -214,7 +219,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
> >          all = 1;
> >          break;
> >      case 'w':
> > -        wait_for_it = 1;
> > +        wait_for_it++;
> >          break;
> >      case 'F':
> >          fallback_trigger = 1;
> > @@ -246,7 +251,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
> >          }
> >
> >          if (deathws) {
> > -            wait_for_domain_deaths(deathws, nrdeathws);
> > +            wait_for_domain_deaths(deathws, nrdeathws, wait_for_it == 1);
> >              free(deathws);
> >          }
> >
> > @@ -258,7 +263,7 @@ static int main_shutdown_or_reboot(int do_reboot, int argc, char **argv)
> >          fn(domid, wait_for_it ? &deathw : NULL, 0, fallback_trigger);
> >
> >          if (wait_for_it)
> > -            wait_for_domain_deaths(&deathw, 1);
> > +            wait_for_domain_deaths(&deathw, 1, wait_for_it == 1);
> >      }
> >
> >
> > --
> > 2.25.1
> >


