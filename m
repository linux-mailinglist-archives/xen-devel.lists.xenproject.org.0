Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FE7DCE19
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625782.975408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxp3f-0000RD-4T; Tue, 31 Oct 2023 13:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625782.975408; Tue, 31 Oct 2023 13:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxp3f-0000OF-1b; Tue, 31 Oct 2023 13:45:27 +0000
Received: by outflank-mailman (input) for mailman id 625782;
 Tue, 31 Oct 2023 13:45:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+CR=GN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxp3d-0000O7-Gn
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:45:25 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdf91629-77f3-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 14:45:24 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99357737980so882392166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 06:45:24 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f7-20020a170906084700b009aa292a2df2sm986988ejd.217.2023.10.31.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:45:23 -0700 (PDT)
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
X-Inumbo-ID: bdf91629-77f3-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698759924; x=1699364724; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1swOPVP/VJIIHN4ql2UP4WJc3LaAUALL0uNJPv0QBIQ=;
        b=nf/1v+NPtLYTkHm32zF4g3IG9SyWK8OUBxh+Iyf9dXMYgCiXaOjIRzcy0EXD4XSsQ7
         N3TTmuJeC3VfXBRXm2FKBtfdOM5QMcdme+kPY7iwAONAAwt9IvHV9WB8esVWMJ9iqyg8
         nO7u80IFHZCZ5gPQ7cyETPcC/Z45ESs8d8hYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698759924; x=1699364724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1swOPVP/VJIIHN4ql2UP4WJc3LaAUALL0uNJPv0QBIQ=;
        b=h5oyOphzrUCqxStUXF6TfAqWHzHGtX5cyAN5Dqpom0TEjg+4KpmWIQHrOpRfIsIZTk
         ZsMOLfabzbBC2MJI2TuzGZJXAsWRy0/RMvPlYW97a8lZ/EblTFmGprM6h4LhzX5Ipb8R
         0c28Bf4D7THTdAtr+J4NLXaX6U31OJ2LvfgvBf3zlmGlhUlVuc9r97Mzud/+34l9FX4m
         mddmRNFhYcX4vSL/jo7SekQVs8xRDIyc6lyMmdBVgNd/a9+EG5ki6LAFDULNijpXdlmb
         NhX7PsVKseHBCVi0EBW4t0nZspg6oB4ZK2yOl+rI4xF3jvaxKXeAZ2je1yhmaDGgYhET
         9aDQ==
X-Gm-Message-State: AOJu0YwfngpD7xL9f13eZhgtgo7XtK03yIzQWkzEsSMq1Cnf5+euGwmF
	zVl3VACeqAEEcYEdG3J5151XZw==
X-Google-Smtp-Source: AGHT+IFDrNzsrXQlUez7RVjnBaYHbe4KCd3LiDLMx0jhq7/sYpwHALAqRZUkgTP+a6U0FL8gQRqIrw==
X-Received: by 2002:a17:906:ef09:b0:9ae:5270:46d5 with SMTP id f9-20020a170906ef0900b009ae527046d5mr1479946ejs.73.1698759923856;
        Tue, 31 Oct 2023 06:45:23 -0700 (PDT)
Date: Tue, 31 Oct 2023 14:45:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18] docs: Fix IOMMU command line docs some more
Message-ID: <ZUEE8o9x9e_Vh7q2@macbook>
References: <20231031120215.3307356-1-andrew.cooper3@citrix.com>
 <ZUDx67jQrGQcy68-@macbook>
 <6f2544e0-3976-4d05-982f-9406acbb207a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f2544e0-3976-4d05-982f-9406acbb207a@citrix.com>

On Tue, Oct 31, 2023 at 01:29:04PM +0000, Andrew Cooper wrote:
> On 31/10/2023 12:24 pm, Roger Pau Monné wrote:
> > On Tue, Oct 31, 2023 at 12:02:15PM +0000, Andrew Cooper wrote:
> >> Make the command line docs match the actual implementation, and state that the
> >> default behaviour is selected at compile time.
> >>
> >> Fixes: 980d6acf1517 ("IOMMU: make DMA containment of quarantined devices optional")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >> CC: Henry Wang <Henry.Wang@arm.com>
> >> ---
> >>  docs/misc/xen-command-line.pandoc | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> >> index 6b07d0f3a17f..9a19a04157cb 100644
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -1480,7 +1480,8 @@ detection of systems known to misbehave upon accesses to that port.
> >>  > Default: `new` unless directed-EOI is supported
> >>  
> >>  ### iommu
> >> -    = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
> >> +    = List of [ <bool>, verbose, debug, force, required,
> >> +                quarantine=<bool>|scratch-page,
> > I think this should be quarantine=[<bool>|scratch-page], as just using
> > iommu=quarantine is a valid syntax and will enable basic quarantine.
> > IOW: the bool or scratch-page parameters are optional.
> 
> =<bool> already has that meaning, and this is the form we use elsewhere.

I guess I got confused by some other options using `[ ]` to denote
optional parameters, but I see it's not used by all of them.

Thanks, Roger.

