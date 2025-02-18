Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2EA3A307
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892110.1301118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQdZ-0007Bj-Qj; Tue, 18 Feb 2025 16:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892110.1301118; Tue, 18 Feb 2025 16:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQdZ-00079v-Np; Tue, 18 Feb 2025 16:39:57 +0000
Received: by outflank-mailman (input) for mailman id 892110;
 Tue, 18 Feb 2025 16:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkQdY-00078T-GX
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:39:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb51313f-ee16-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:39:54 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e04861e7a6so5098486a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:39:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c4687sm9000426a12.22.2025.02.18.08.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:39:53 -0800 (PST)
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
X-Inumbo-ID: fb51313f-ee16-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739896794; x=1740501594; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDGQsOGzCijSlROF8vxP3JT12aV7By70OTry/xhm4WA=;
        b=J60/rs0+B5AZpYlSpqVz9KX4XDL9FIzCEpmhFWRHQcjXkQBIGcoMOU97lFudxQg9ws
         lo7/F/sfma8bl7bZW+xqs1KCszjs/JGVrUSZygCmH5OTsaDuHO0T9i645I6gsEvL9lIe
         hxCTpRWaShmPFIAC/cUWpFMA+xC54GflVTUb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739896794; x=1740501594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDGQsOGzCijSlROF8vxP3JT12aV7By70OTry/xhm4WA=;
        b=MtcuJSr5Krr9DBsV74+pySJP1CS5jBhPO50vjSG63UovSApYtWZrqvRT8q1RyJZKXo
         gAz2uDvyt3v3EsXS6Jk1sHZlFiqdl9pHEuh1FErj6vx3akGd5AC3FOG5GWU7E+vfFa3z
         d5Kj2xACPt3o/XHR3s6CHTDaXwIDxr7D2BrHdOlIYGC8Lo4NxENVzgnmnOyfk0gjxk8Y
         FdICBCTZJpr3VlQv08PSKidxEb9E0ovk2YlpkZpcMP6zyPSq2OeEa+pchgx0UmN6W4+Q
         hB3dTrPQBu2HfLjmeGmdwUqMoGsJ07If2FSSSCr91efVP6DyTNqhTyRYoB6/Ms0C+dPT
         PjWA==
X-Gm-Message-State: AOJu0YzRakcnI6H8a9qFBPlpwZFVoaCWQ8z+dmHNPxmz0pUjhBbge6ir
	xozXxNdZ8qdQaKKhz9GWVsyVlaHerLm0Ae5T2zweIklBo0qliD5elL/NAze0NX4=
X-Gm-Gg: ASbGncueiZOojENN4dyzYjW/cK+nddnHB91nBCFELrBzpSnI/VJRq5W5bcCdMQHNb+L
	aRI6/d8IFwbZ6M0W25I8qNAP+ppl3A+vX3sODUZ5jsSmy83aQCV49yuBBzXnUvMiC1UrNX1vnJq
	j157PzLY1tDdxi1s6IQQS2dKH/Cq9hEd3WT5rmdnSg9m1+XckoHtQrzTvVgYfUw8+B4SeD5IJTO
	sM8ScfrTK8DhT9PgeGHvjDkSjNisZMIyxzNWGpnZAypWDTDxD6FPbuGm2btvzDncI4Hh82lIy5r
	GTWqQDU/9ZwADbXPkn7o
X-Google-Smtp-Source: AGHT+IE2qFSysIUVV0dud3epn1UgQ/MHYDqtJr5Xy5o/fmo6iOaNjSoHOiVgSWSDhbGnLhX9L4XGYw==
X-Received: by 2002:a05:6402:278f:b0:5dc:7fbe:7310 with SMTP id 4fb4d7f45d1cf-5e036044095mr16470042a12.6.1739896794019;
        Tue, 18 Feb 2025 08:39:54 -0800 (PST)
Date: Tue, 18 Feb 2025 17:39:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] x86/dom0: attempt to fixup p2m page-faults for
 PVH dom0
Message-ID: <Z7S32Opuv9l-kLgA@macbook.local>
References: <20250218143504.77638-1-roger.pau@citrix.com>
 <20250218143504.77638-3-roger.pau@citrix.com>
 <Z7Sq4wXr3nqQpdMk@macbook.local>
 <eb003947-612e-475f-911c-f42e45d552da@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb003947-612e-475f-911c-f42e45d552da@suse.com>

On Tue, Feb 18, 2025 at 04:58:20PM +0100, Jan Beulich wrote:
> On 18.02.2025 16:44, Roger Pau Monné wrote:
> > On Tue, Feb 18, 2025 at 03:35:04PM +0100, Roger Pau Monne wrote:
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -822,7 +822,8 @@ Specify the bit width of the DMA heap.
> >>  
> >>  ### dom0
> >>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> >> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
> >> +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
> >> +                pf-fixup=<bool> ] (x86)
> >>  
> >>      = List of [ sve=<integer> ] (Arm64)
> >>  
> >> @@ -883,6 +884,19 @@ Controls for how dom0 is constructed on x86 systems.
> >>  
> >>      If using this option is necessary to fix an issue, please report a bug.
> >>  
> >> +*   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
> >> +    defaults to false.
> > 
> > I'm considering whether the default should instead be true, so that
> > PVH is closer to what which regions a classic PV dom0 gets access to.
> 
> I was wondering about this too, but then thought that we may want to do
> this in a separate step, once we've had some more coverage.

Ack, let's put it in first and consider changing the default later.

Thanks, Roger.

