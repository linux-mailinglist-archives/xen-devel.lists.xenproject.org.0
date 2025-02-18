Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322EA3A19C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891943.1300949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPm9-0007q9-0G; Tue, 18 Feb 2025 15:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891943.1300949; Tue, 18 Feb 2025 15:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPm8-0007of-SV; Tue, 18 Feb 2025 15:44:44 +0000
Received: by outflank-mailman (input) for mailman id 891943;
 Tue, 18 Feb 2025 15:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v6LV=VJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tkPm7-0007oZ-WB
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:44:44 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c171fc-ee0f-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 16:44:42 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-221050f3f00so61400155ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:44:42 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d545c9casm90980555ad.130.2025.02.18.07.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 07:44:40 -0800 (PST)
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
X-Inumbo-ID: 44c171fc-ee0f-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739893481; x=1740498281; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NPA3ePE532hVOLilqymdfjqvOnzgHaJvwceJtHL8cfw=;
        b=KTWEg7mitCHvaPK1l24KE6mCyCyVYZodp3qrhOu2PlqwnWBNlF4nm26ssoCIVGOcqc
         Icl4tj7+QqGTpHgc2cIL6sD+cQSsks+o1waTfuAcDoH72g3z32L1JgISOO6b2ScyArG+
         p4b4SLgSMHrJITVTtrNc4qx3oTTdIl5k55MbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893481; x=1740498281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPA3ePE532hVOLilqymdfjqvOnzgHaJvwceJtHL8cfw=;
        b=C/9HnYl+ZR0fmFz71mspBuN/NvXK72TPtWxMMXS1fxpzFgBWZWpBYmZLJ2po4Wu1CW
         iW0kw/rK2VLuBd/rE57K5LT7Wk0pJUPzPWrgevFeKU3a0CNL/OYXnSlrpCWwRD9e8bVk
         7ov0yofF8GjsizOezH9Uu/5GWRuvgO9F2GXQTW594PLfdbsG9y6Jd0t4puGYzi9rMZ+w
         WsjbEMH35LkogqfaPHPauQ2h5b33CuACA+MQwXqK+AI7R9G65diULZiX71VK4ek7ZpQs
         Fun0sFaGn58Z/p9aNyhuK1B2GB8qOKwAgUpgiop+2BYMcLv2yHYZD48yuO8YSIiRkal2
         lc/A==
X-Gm-Message-State: AOJu0Yw+r5a1hZRxBlVEmSkzJx/M/XArvMhKr9g+T4pUMHMweCGHtHWY
	/NJW0GKA8pIr1BUcc5Jn7673YM2orXVn2sBw5MD4hwEmKeuAfHp0McxIodGloeW5AKhkXvSCCKi
	m
X-Gm-Gg: ASbGncvA1LMr90DKiQNIRCQxBScFyYDAdEXJztJ+pmwkxh2E5LYqW/19vZjYXUVTxRw
	WCZLWfrxxlYt47QmkRJ8A/GhA8y5OS8GhYeqZSrwaDNOobvBDOCYmQsoYvnVHQ3Y5Cpl3LunPsL
	AIuQV/DZ+Ws1+NX261wNAX7Inh6TGhQumMTqOp+/8P05QqfVYTHtGsinqB8Yw+95ZFpLlAn71sx
	biN3y9nPUULqrvURzrN0aHIlBMOXMiEA4NRjfjFKUvQ5iHw8ho+YWfEEN8GbMbp0AJSAam5ZVWz
	aUptQsa88ikVicZ0lC1V
X-Google-Smtp-Source: AGHT+IEZP/Iu5SNb1uwlSrfWn5r2fA70fv1mUEbiR1y3sP5kSnrJh3ftA1zKAGf2qwdky2Y22jND5A==
X-Received: by 2002:a17:903:3d0c:b0:216:53fa:634f with SMTP id d9443c01a7336-221040d8414mr245104355ad.48.1739893480682;
        Tue, 18 Feb 2025 07:44:40 -0800 (PST)
Date: Tue, 18 Feb 2025 16:44:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] x86/dom0: attempt to fixup p2m page-faults for
 PVH dom0
Message-ID: <Z7Sq4wXr3nqQpdMk@macbook.local>
References: <20250218143504.77638-1-roger.pau@citrix.com>
 <20250218143504.77638-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218143504.77638-3-roger.pau@citrix.com>

On Tue, Feb 18, 2025 at 03:35:04PM +0100, Roger Pau Monne wrote:
> When building a PVH dom0 Xen attempts to map all (relevant) MMIO regions
> into the p2m for dom0 access.  However the information Xen has about the
> host memory map is limited.  Xen doesn't have access to any resources
> described in ACPI dynamic tables, and hence the p2m mappings provided might
> not be complete.
> 
> PV doesn't suffer from this issue because a PV dom0 is capable of mapping
> into it's page-tables any address not explicitly banned in d->iomem_caps.
> 
> Introduce a new command line options that allows Xen to attempt to fixup
> the p2m page-faults, by creating p2m identity maps in response to p2m
> page-faults.
> 
> This is aimed as a workaround to small ACPI regions Xen doesn't know about.
> Note that missing large MMIO regions mapped in this way will lead to
> slowness due to the VM exit processing, plus the mappings will always use
> small pages.
> 
> The ultimate aim is to attempt to bring better parity with a classic PV
> dom0.
> 
> Note such fixup rely on the CPU doing the access to the unpopulated
> address.  If the access is attempted from a device instead there's no
> possible way to fixup, as IOMMU page-fault are asynchronous.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Only slightly tested on my local PVH dom0 deployment.
> ---
> Changes since v1:
>  - Make the fixup function static.
>  - Print message in case mapping already exists.
> ---
>  CHANGELOG.md                           | 10 ++++
>  docs/misc/xen-command-line.pandoc      | 16 +++++-
>  xen/arch/x86/dom0_build.c              |  5 ++
>  xen/arch/x86/hvm/emulate.c             | 74 +++++++++++++++++++++++++-
>  xen/arch/x86/include/asm/hvm/emulate.h |  3 ++
>  5 files changed, 105 insertions(+), 3 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1de1d1eca17f..e5e6ab3a8902 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,6 +4,16 @@ Notable changes to Xen will be documented in this file.
>  
>  The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
> +## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +
> +### Changed
> +
> +### Added
> + - On x86:
> +   - Option to attempt to fixup p2m page-faults on PVH dom0.
> +
> +### Removed
> +
>  ## [4.20.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>  
>  ### Changed
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 9bbd00baef91..83bb69cfb852 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -822,7 +822,8 @@ Specify the bit width of the DMA heap.
>  
>  ### dom0
>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
> +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
> +                pf-fixup=<bool> ] (x86)
>  
>      = List of [ sve=<integer> ] (Arm64)
>  
> @@ -883,6 +884,19 @@ Controls for how dom0 is constructed on x86 systems.
>  
>      If using this option is necessary to fix an issue, please report a bug.
>  
> +*   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
> +    defaults to false.

I'm considering whether the default should instead be true, so that
PVH is closer to what which regions a classic PV dom0 gets access to.

Thanks, Roger.

