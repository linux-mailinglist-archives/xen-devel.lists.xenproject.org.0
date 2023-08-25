Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF9787FFF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 08:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590516.922820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZQR9-0003V3-Tl; Fri, 25 Aug 2023 06:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590516.922820; Fri, 25 Aug 2023 06:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZQR9-0003SU-Qs; Fri, 25 Aug 2023 06:36:51 +0000
Received: by outflank-mailman (input) for mailman id 590516;
 Fri, 25 Aug 2023 06:36:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SuHx=EK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qZQR8-0003SM-Gp
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 06:36:50 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4583995-4311-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 08:36:49 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68a3cae6d94so584311b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 23:36:49 -0700 (PDT)
Received: from leoy-huanghe.lan ([8.45.48.113])
 by smtp.gmail.com with ESMTPSA id
 ix7-20020a170902f80700b001ae0a4b1d3fsm342124plb.153.2023.08.24.23.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 23:36:47 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c4583995-4311-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692945407; x=1693550207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IagkuslkEu2uMFDqeQIGs0GfH6Lx0fZjmecnqMYJevM=;
        b=ZLZdV6jTF3Hgir6lIfhGPbwd1aZAn3dGfSj45KYb6xRJBTSxcEtysi12hjGapZfAIb
         6/Jx+jrRbDDTbE8zY0H/DubIf8fNLDpNi0VJWqSlUymefdd5blhqYGLcE75BB2MEVeLj
         mMk8k9DYjRFTJa6GgLiMDs+tl87beVJqTFWXzh8fFCkWdlG2PDnNI6qxw9LZezXXmJ+O
         8oSc4I7/pu7ktp2G30tplelGuDLDM0BNvFg2W5OjdrrthYiONd9xieEde8+pT3fPERp7
         LASFDONBuK0t0+7AOHiwbvGMZpznYX8/htZpfakZcMYHOXHWX1lTAC9z86pBfwMFF3MV
         qw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692945407; x=1693550207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IagkuslkEu2uMFDqeQIGs0GfH6Lx0fZjmecnqMYJevM=;
        b=Bbv34YnEJ6okRlbtPMXaUEdfGeir5/hLGe91OisMJd9MCdO9phtysjHI6hXRerL0p6
         CUp4Sg8XOyNv8GBeeNcHtH3QU4fmc+IPwjNkzbIcxK1ZVU+o2nlqg/n47O76zqAjZigY
         +purJDOFbOyvpFOlSfEztxjnQKMVbJwuUGw8zFPD2uj/SPgem+3Sp0QGm24gb5b30lVT
         qADylF7R5ZzY04yv7HquBfJkVqHUUx8zL0cd1jX/Z/5ZGjJgVvPHYOesI7/xF1pwqQuv
         kJ5yAz6+w1aXgKIEmiAhOUwdFTGs7EhLtvkZiL7oWpcsEUR1QiczgeLTYxY47acB1MOS
         Cfmw==
X-Gm-Message-State: AOJu0Yzvq1ZAIGF8Xg8cW+IbR2qc6w33oTYxJFFL2j4arUQqKsZPVoA3
	RNmg6NF+jv9OoJ6bOdNQKtsB3Q==
X-Google-Smtp-Source: AGHT+IGnaAxjecM3j6Qdc56OWjh2Lb5vMdzVPz/IBznWNfWNlCL92Lz9YSV+XUib0iEt288iSuI55Q==
X-Received: by 2002:a05:6a20:5518:b0:13a:6413:9004 with SMTP id ko24-20020a056a20551800b0013a64139004mr15261430pzb.43.1692945407563;
        Thu, 24 Aug 2023 23:36:47 -0700 (PDT)
Date: Fri, 25 Aug 2023 14:36:40 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH v1] tools/hotplug: systemd: Make dependency on Xen device
 nodes
Message-ID: <20230825063640.GA228998@leoy-huanghe.lan>
References: <20230825033616.3402812-1-leo.yan@linaro.org>
 <CV1D227LZPCW.2ELMBHY8LE53X@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CV1D227LZPCW.2ELMBHY8LE53X@fedora>

On Fri, Aug 25, 2023 at 07:02:33AM +0200, Erik Schilling wrote:
> On Fri Aug 25, 2023 at 5:36 AM CEST, Leo Yan wrote:
> > When system booting up, the kernel module xen_gntdev.ko is loaded and
> > the device node '/dev/xen/gntdev' is created; later the xenstored
> > service in systemd launches daemon to open this device node.
> >
> > This flow has a race condition between creating the device node in the
> > kernel module and using the device node in the systemd service.  It's
> > possible that the xenstored service fails to open the device node due
> > to the delay of creating the device node.  In the end, xenbus cannot be
> > used between the Dom0 kernel and the Xen hypervisor.
> >
> > To resolve this issue, we need to synchronize between udev and systemd
> > for the device node.  There have an extra change in the udev rules for
> > tagging 'systemd' for Xen device nodes, which notifies device node
> > creating to systemd; besides udev change, this patch adds dependency in
> > systemd service for waiting the device node.
> >
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >
> >  The udev rules change is on github:
> >  https://github.com/systemd/systemd/pull/28962/commits/520340dfea3b6cf9fe7a24c9238313b1a5fe8539
> 
> Let's see what they think, but I fear systemd may not be the correct
> upstream to carry this... Skimming through the rules that they have
> there, it mostly looks like they only carry rules that are relevant for
> systemd-related services directly.

Yeah, I share the same concern.  But seems to me, upstreaming change
to the systemd is the most neat fixing.

> >  tools/hotplug/Linux/systemd/xenstored.service.in | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools/hotplug/Linux/systemd/xenstored.service.in
> > index 261077dc92..6e48cdb0e7 100644
> > --- a/tools/hotplug/Linux/systemd/xenstored.service.in
> > +++ b/tools/hotplug/Linux/systemd/xenstored.service.in
> > @@ -1,7 +1,7 @@
> >  [Unit]
> >  Description=The Xen xenstore
> > -Requires=proc-xen.mount
> > -After=proc-xen.mount
> > +Requires=proc-xen.mount dev-xen-gntdev.device
> > +After=proc-xen.mount dev-xen-gntdev.device
> 
> I must admit that I am a bit confused why this is enough... During our
> discussion on Slack, when you quoted from your rule it included
> `ENV{SYSTEMD_WANTS}="xenstored.service"`. Did you drop that during later
> development? Was there additional reasearch involved in dropping it?

Yes, I dropped ENV{SYSTEMD_WANTS}="xenstored.service" and it works well
at my side.

My purpose is to upstream the udev rules in systemd as general as
possible.  As you mentioned, the "xenstored.service" is maintained in Xen
but not in systemd, for this reason, I would like avoid to add
"xenstored.service" into udev rules in systemd.

> My understanding was that if devices do not exist when systemd builds
> its transaction model, dependencies on them will just get tossed out[1].
> So I would have expected that there should still be a race if
> the .device does not pull in the service.

Thanks for sharing.  To be honest, I don't know this part.  Doesn't
systemd parse the service script and let service to wait for specific
.device until systemd receives notification for the .device?

> Did you hit the race frequently enough to be sure that this fixes it in
> entirety?

I have two boards.  One on board (Telechips), it's consistently
reproduce this issue, and after applying the udev rules change and
this patch, I confirmed the issue is dismissed entirely.

> Is there a place somewhere in the Xen or kernel code where one
> could add an excessive sleep in order to trigger the race more reliably?

On my AVA board with running Xen, I tried to add a long delay (10
seconds) in the kernel driver 'drivers/xen/gntdev.c', but I can see
systemd will wait for the kernel modules loading, and then it launches
Xen services.  Thus I cannot reproduce this issue on my AVA board.

So in below flow:

- Step 1: drivers/xen/gntdev.c registers misc device;
- Step 2: udev creates device node '/dev/xen/gntdev';
- Step 3: systemd launches xenstored.service.

Seems to me, the race condition happens between step 2 and step 3.  If
there have any delay in udev for creating device node, then the step3
for xenstored.service will fail.

Thanks for review.

Leo

> [1] "citation-needed": But I vaguely remember dealing with a similar
>     issue and getting told this on #systemd IRC
> 
> - Erik

