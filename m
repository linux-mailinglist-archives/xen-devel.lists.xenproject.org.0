Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639B78840B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 11:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590772.923160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZTP4-0004YS-2I; Fri, 25 Aug 2023 09:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590772.923160; Fri, 25 Aug 2023 09:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZTP3-0004Vy-Vr; Fri, 25 Aug 2023 09:46:53 +0000
Received: by outflank-mailman (input) for mailman id 590772;
 Fri, 25 Aug 2023 09:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SuHx=EK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qZTP2-0004Vq-MA
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 09:46:52 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fdaa194-432c-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 11:46:50 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso589068b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Aug 2023 02:46:50 -0700 (PDT)
Received: from leoy-huanghe.lan ([8.45.48.113])
 by smtp.gmail.com with ESMTPSA id
 ff19-20020a056a002f5300b0068783a2dfdasm1136966pfb.104.2023.08.25.02.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 02:46:48 -0700 (PDT)
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
X-Inumbo-ID: 4fdaa194-432c-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692956808; x=1693561608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6em+zCQA1tQVh35TqfLcBgR50bAGxMCeWkwvhn01eok=;
        b=jru5K3hf63CcVkjcCl7TPMLwq/oiZTKk/l1UPHPK8wznI+rB+BKGXV1Y2xcwAxNfon
         v41BYBA9My9uvmZ4rNoo5nDRkc3EJ518+n/sTndx2/xGxqOBbnElhjMRWouQsZMYKvO2
         K4DDvF1B11lkE7cQgVDZJIx//SJuIEdOyF4nogcYC0C15A/uikmAzIVqaKbuZ2c1w/cG
         VZjPNnVip2/WPSMLhRe4YmZwrVjgT6IkIz9YSjRfc7aosgjf22XVDZI1ziUTwhBKIl0+
         wDjYDIayzRbxuoivXUTw62yeNustJ2yWho3KyDL0Cu5z3NoP+69ufkECxHC/2S712/as
         ly6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692956808; x=1693561608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6em+zCQA1tQVh35TqfLcBgR50bAGxMCeWkwvhn01eok=;
        b=XJ2Nuw4tBGg/EYabGuNiYRjN0Iym3w4OHJq4oh/hzEUtp5M+vN8mkS1EecNmbaDp7J
         0yFHolvbcmE+R7j1mv86P790WbxR76HG7UrwXuF+0xcpSBQIGcsFJQ3pWV6uneQHOK+h
         MmmjrfIeyWlEKC0EiwbHVb3dM5yueoLiuDWTEXJHJ90ZCmhOCqczX6ff4Q2GlZ1Z43a/
         JHzNC86wzAr/bH98DZCmhWVTp/+CuhbY2EVQWIw9kGZjNrmtwNFwQuZfQallLjI6iNRo
         crPs6Wkk5/rILzEsAREXZd2pxWcY2gYzzOGF/z3LKk7rAxTyn/L5XKUcL0sPtfsNHkuq
         tNsQ==
X-Gm-Message-State: AOJu0YzSC7mE3aXA33Sys+PTKjHv+PhQsMYchiUNf590o/AIOipeeF4o
	pYFJVxCz/P1+3norG51gF/g91Q==
X-Google-Smtp-Source: AGHT+IHzHteb/bO4LGQMKLhUTgpEfqZNo7bclK+dXvyky5jYPhdph9nxTZAI3JtbIkvhYH5T97b+gQ==
X-Received: by 2002:a05:6a20:9718:b0:14b:f86f:d9ea with SMTP id hr24-20020a056a20971800b0014bf86fd9eamr3588120pzc.3.1692956808484;
        Fri, 25 Aug 2023 02:46:48 -0700 (PDT)
Date: Fri, 25 Aug 2023 17:46:43 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: Re: [PATCH v1] tools/hotplug: systemd: Make dependency on Xen device
 nodes
Message-ID: <20230825094643.GB17083@leoy-huanghe.lan>
References: <20230825033616.3402812-1-leo.yan@linaro.org>
 <CV1D227LZPCW.2ELMBHY8LE53X@fedora>
 <20230825063640.GA228998@leoy-huanghe.lan>
 <CV1GD1WJK30G.354V5FQOQJ1K7@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CV1GD1WJK30G.354V5FQOQJ1K7@fedora>

On Fri, Aug 25, 2023 at 09:37:58AM +0200, Erik Schilling wrote:

[...]

> > > > diff --git a/tools/hotplug/Linux/systemd/xenstored.service.in b/tools/hotplug/Linux/systemd/xenstored.service.in
> > > > index 261077dc92..6e48cdb0e7 100644
> > > > --- a/tools/hotplug/Linux/systemd/xenstored.service.in
> > > > +++ b/tools/hotplug/Linux/systemd/xenstored.service.in
> > > > @@ -1,7 +1,7 @@
> > > >  [Unit]
> > > >  Description=The Xen xenstore
> > > > -Requires=proc-xen.mount
> > > > -After=proc-xen.mount
> > > > +Requires=proc-xen.mount dev-xen-gntdev.device
> > > > +After=proc-xen.mount dev-xen-gntdev.device
> > > 
> > > I must admit that I am a bit confused why this is enough... During our
> > > discussion on Slack, when you quoted from your rule it included
> > > `ENV{SYSTEMD_WANTS}="xenstored.service"`. Did you drop that during later
> > > development? Was there additional reasearch involved in dropping it?
> >
> > Yes, I dropped ENV{SYSTEMD_WANTS}="xenstored.service" and it works well
> > at my side.
> 
> Hm. Interesting. Could you plot the activations after boot?
> 
>     systemd-analyze plot > /tmp/plot.svg
> 
> Seeing failure vs success but also the success cases on AVA vs Telechips
> may be interesting.
> 
> I just did some tests on my workstation where I added dependencies on
> a random USB device. If that one was not plugged at all, the service
> still happily started. Yet, it obviously seems to do something in your
> case... So I fear we may not fully understand the real problem yet.
> 
> I must admit that I find this case a bit under-documented. While "Wants"
> explicitly says that failling transactions are ignored, there is no
> clear statement about what happens in that case with "Requires".
> 
> While skimming the docs I also realized that maybe BindsTo= would maybe
> be more suitable compared to Requires= here. But that is unrelated to
> the confusion that I have about the original problem.

Please ignore this patch and sorry for noise.

Erik and me confirmed the systemd has established the dependencies
properly.  The dependency is (the above one depends on the blow one):

  xenstored.service
    `> sysinit.target
         `> systemd-modules-load.service (Load xen modules)


My issue is caused by a local customzied systemd-modules-load.service
which breaks the dependency between sysinit.target and
systemd-modules-load.service.

Very appreciate Erik's help for root cause the issue.

Thanks,
Leo

