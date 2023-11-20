Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070E7F0EE7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 10:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636504.992058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50TG-0000t7-IG; Mon, 20 Nov 2023 09:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636504.992058; Mon, 20 Nov 2023 09:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50TG-0000qj-FO; Mon, 20 Nov 2023 09:21:34 +0000
Received: by outflank-mailman (input) for mailman id 636504;
 Mon, 20 Nov 2023 09:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GG8d=HB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r50TE-0000qY-Jh
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 09:21:32 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30318105-8786-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 10:21:30 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4083f613275so15163595e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 01:21:30 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b0040535648639sm13013788wmq.36.2023.11.20.01.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 01:21:29 -0800 (PST)
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
X-Inumbo-ID: 30318105-8786-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700472089; x=1701076889; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Y7z44IMmtxg3JLnszHwZ9hbE6G7yoE0v9EloD2EQCg=;
        b=rhV1yz2M9/40g2jNUWKCxlp0LzUPySWS2Jei/Vqat/ZnCs1DPS1/Qjn25o9mRANTdZ
         j8smIuFGLH/72oR6xd6nrL4r6FgKpCedcfPNGLWPikRnbyttxLDvUdb8ZcH3TNBg0Udj
         I2Cla4acy/dpkLaGI81kvi67xt8vld05lAuIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700472089; x=1701076889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y7z44IMmtxg3JLnszHwZ9hbE6G7yoE0v9EloD2EQCg=;
        b=wKn5Nflxm5xvSojeVE0nD61TEU2vG7n9/Pzf6m/P/E2Ogx7TkMENALNNE4ywHDUFXb
         oWVmCe/drSFKYkJFXHCLh9R5fFi0etM9yZls7s4dJWPZyqPschXNJYrVrUN3WHCAiRtu
         79L1lzAfHowRHCkHfjcSBltXJY1USPNClJn8JlIy3L6JPpHfSw4YETSXrnTGcZGjj1Bk
         XbuwR51JlwHVDgm4ULcmxSK8SsRvqeXXpbptZUWbNGzB/NlCcwUw0iHDis5q5XKnqeo2
         EtzV0Ce21ugQ4TOIeFYvNNScggk8c8QSFtUM5wQ2yKNp16AY03f/nc/Kxeg2L0VO/KlH
         1zNw==
X-Gm-Message-State: AOJu0YzYZYSnQsp7LwaodZEjmxs2ld8b2LNHOu/c0HJ58h0hKxlavtnj
	t0ZxaMbsBDmZ7Gt5dnDFgCVL0Q==
X-Google-Smtp-Source: AGHT+IGVj2s7D54HC3ta6IG5kGHl5LDyjyNQtrSlZqcM85zKDzIeCoUKNpSk8KOmY6T3+6CbMYDObw==
X-Received: by 2002:a05:600c:350a:b0:409:19a0:d247 with SMTP id h10-20020a05600c350a00b0040919a0d247mr5616773wmq.18.1700472089486;
        Mon, 20 Nov 2023 01:21:29 -0800 (PST)
Date: Mon, 20 Nov 2023 10:21:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Message-ID: <ZVslGC8VGP0kZ-dK@macbook.local>
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
 <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
 <ZVcv7259slJF4wBh@dingwall.me.uk>
 <ZVc9yq9b6fezMWcY@macbook.local>
 <ZVsceVGKOMP2zhU9@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVsceVGKOMP2zhU9@dingwall.me.uk>

On Mon, Nov 20, 2023 at 08:44:41AM +0000, James Dingwall wrote:
> On Fri, Nov 17, 2023 at 11:17:46AM +0100, Roger Pau Monné wrote:
> > On Fri, Nov 17, 2023 at 09:18:39AM +0000, James Dingwall wrote:
> > > On Thu, Nov 16, 2023 at 04:32:47PM +0000, Andrew Cooper wrote:
> > > > On 16/11/2023 4:15 pm, James Dingwall wrote:
> > > > > Hi,
> > > > >
> > > > > Per the msr_relaxed documentation:
> > > > >
> > > > >    "If using this option is necessary to fix an issue, please report a bug."
> > > > >
> > > > > After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
> > > > > started experiencing a BSOD at boot with one of our Windows guests.  We found
> > > > > that enabling `msr_relaxed = 1` in the guest configuration has resolved the
> > > > > problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
> > > > > the following messages were caught as the BSOD happened:
> > > > >
> > > > > (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
> > > > > (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
> > > > > (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
> > > > >
> > > > > I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
> > > > > series from last month:
> > > > >
> > > > > https://patchwork.kernel.org/project/xen-devel/list/?series=796550
> > > > >
> > > > > Picking out just a small part of that fixes the problem for us. Although the
> > > > > the patch is against 4.15.5 I think it would be relevant to more recent
> > > > > releases too.
> > > > 
> > > > Which version of Windows, and what hardware?
> > > > 
> > > > The Viridian Crash isn't about the RDMSR itself - it's presumably
> > > > collateral damage shortly thereafter.
> > > > 
> > > > Does filling in 0 for that MSR also resolve the issue?  It's model
> > > > specific and we absolutely cannot pass it through from real hardware
> > > > like that.
> > > > 
> > > 
> > > Hi Andrew,
> > > 
> > > Thanks for your response.  The guest is running Windows 10 and the crash
> > > happens in a proprietary hardware driver.
> > 
> > When you say proprietary you mean a custom driver made for your
> > use-case, or is this some vendor driver widely available?
> > 
> 
> Hi Roger,
> 
> We have emulated some point of sale hardware with a custom qemu device.  It
> is reasonably common but limited to its particular sector.  As the physical
> hardware is all built to the same specification I assume the driver has made
> assumptions about the availability of MSR_TEMPERATURE_TARGET and doesn't
> handle the case it is absent which leads to the BSOD in the Windows guest.

Hello James,

We have in the past exposed MSRs in order to workaround OSes
assumptions about such MSRs being unconditionally present, so it's not
completely unacceptable that we might end up exposing this if strictly
required.

My question would be, is it possible for such driver to get fixed in
order to avoid unconditionally poking at MSR_TEMPERATURE_TARGET, or
that's impossible?

From the Intel manual it seems like MSR_TEMPERATURE_TARGET is
unconditionally present on certain models, and hence we might have no
other option but to end up adding a dummy handler for reads.  I do
wonder whether returning all 0 is correct, as then the "thermal
throttling" would be enable when the CPU temp > 0C, which is
unrealistic.  I assume that wouldn't matter much as long as drivers
don't choke on such weird value.

Thanks, Roger.

