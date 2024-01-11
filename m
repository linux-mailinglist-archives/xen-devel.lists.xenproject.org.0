Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3021F82AEA1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 13:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666254.1036756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu51-00045X-US; Thu, 11 Jan 2024 12:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666254.1036756; Thu, 11 Jan 2024 12:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNu51-00043L-RG; Thu, 11 Jan 2024 12:22:39 +0000
Received: by outflank-mailman (input) for mailman id 666254;
 Thu, 11 Jan 2024 12:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNu4z-00043F-W3
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 12:22:37 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aeca809-b07c-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 13:22:37 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so3509493f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 04:22:37 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 m6-20020adffa06000000b00336c6b77584sm1100188wrr.91.2024.01.11.04.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 04:22:36 -0800 (PST)
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
X-Inumbo-ID: 1aeca809-b07c-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704975756; x=1705580556; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aYxWEd3xxlinRpZ6/L9cwah03KoU4/HDeJKi/M5dBtU=;
        b=tVN63suOjtKJGTYavnf+BGfO1TWHy9jJf2qNU9dG3G4VUyEOfeD6mTvWekeh+3KDTW
         hELeaL04/Lm6zbanbKy+14n8IuejnShR7SpzpDN93qWrG9yqzbckijtuifdhlF/5LkS/
         23N1SSESXBdd49aYt2rULR2kJ0P6TA/B4SgP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704975756; x=1705580556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYxWEd3xxlinRpZ6/L9cwah03KoU4/HDeJKi/M5dBtU=;
        b=BoF0xUXNzqc9QzTvo4zaavOZksONHsU4N8HbHX0kJMuSNeB3ZXS644FvMwuA9ksMrZ
         pCAjYvJcNt2HrsqL9S4LrLOEIFW9WZnSN7w/AdiPnWxgH4ReNCTbtIjfPGsgyXweT8De
         Jfk8Q1G73EEppzlzfw3Nh+Hz6UoSyfRasQhWDl8res/hGnQXj9yDdqEwzBXz+L742b1t
         kazS/VKGYr4LCxZGvrjf4eL2v5NmNhK5vgpt7Opc/NzTGz3JMeZOzjY0wlQ25wh4cv56
         94XitH/d+8VsU8ML0cbugtnHigQxoWeoduUDYiu4vH8rZBdPUiNJO9sqnMbhiTqZlVjx
         q2rg==
X-Gm-Message-State: AOJu0YwU5c2Rw41+xoSt6hg5W8CK+5cl+SPw2nH+bAviR3ICD6YHQnOF
	g45cV/gBVyt0trAiyggPK0gkL1375naLjQ==
X-Google-Smtp-Source: AGHT+IEn1E4H51RkLo/wr6vbNPVEO2JVqwkVJww4+XvDdM4juGUgc8ooJAfBKCJxm9OsWbziMfPaZw==
X-Received: by 2002:a05:600c:3d89:b0:40e:6222:7f25 with SMTP id bi9-20020a05600c3d8900b0040e62227f25mr212632wmb.99.1704975756576;
        Thu, 11 Jan 2024 04:22:36 -0800 (PST)
Date: Thu, 11 Jan 2024 13:22:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Message-ID: <ZZ_di8pZB8bWtBuX@macbook>
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com>
 <ZZ_FjFa9mILtDZgv@macbook>
 <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <645e0c95-5a12-4202-8da6-3cc789a9e5c7@suse.com>

On Thu, Jan 11, 2024 at 12:34:45PM +0100, Jan Beulich wrote:
> On 11.01.2024 11:40, Roger Pau Monné wrote:
> > On Thu, Jan 11, 2024 at 11:11:07AM +0100, Jan Beulich wrote:
> >> On 11.01.2024 10:08, Roger Pau Monne wrote:
> >>> When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
> >>> MSR contains per-counter enable bits that is ANDed with the enable bit in the
> >>> counter EVNTSEL MSR in order for a PMC counter to be enabled.
> >>>
> >>> So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
> >>> bits being set by default, but at least on some Intel Sapphire and Emerald
> >>> Rapids this is no longer the case, and Xen reports:
> >>>
> >>> Testing NMI watchdog on all CPUs: 0 40 stuck
> >>>
> >>> The first CPU on each package is started with PERF_GLOBAL_CTRL zeroed, so PMC0
> >>> doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
> >>> relevant enable bit in PERF_GLOBAL_CTRL not being set.
> >>>
> >>> Check and adjust PERF_GLOBAL_CTRL during CPU initialization so that all the
> >>> general-purpose PMCs are enabled.  Doing so brings the state of the package-BSP
> >>> PERF_GLOBAL_CTRL in line with the rest of the CPUs on the system.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> Changes since v1:
> >>>  - Do the adjustment of PERF_GLOBAL_CTRL even if the watchdog is not used, and
> >>>    enable all counters.
> >>> ---
> >>> Unsure whether printing a warning if the value of PERF_GLOBAL_CTRL is not
> >>> correct is of any value, hence I haven't added it.
> >>> ---
> >>>  xen/arch/x86/cpu/intel.c | 18 +++++++++++++++++-
> >>>  1 file changed, 17 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> >>> index dfee64689ffe..40d3eb0e18a7 100644
> >>> --- a/xen/arch/x86/cpu/intel.c
> >>> +++ b/xen/arch/x86/cpu/intel.c
> >>> @@ -533,9 +533,25 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
> >>>  	init_intel_cacheinfo(c);
> >>>  	if (c->cpuid_level > 9) {
> >>>  		unsigned eax = cpuid_eax(10);
> >>> +		unsigned int cnt = (uint8_t)(eax >> 8);
> >>> +
> >>>  		/* Check for version and the number of counters */
> >>> -		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
> >>> +		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
> >>
> >> I may not have looked closely enough, but I didn't find the limit of
> >> 32 being stated anywhere.
> > 
> > Hm, my copy of the SDM vol4 states that bits 31:n are the enable bits,
> > where n is CPUID.0AH: EAX[15:8].  Bits 32, 33 and 34 control the Fixed
> > PMCs.
> > 
> >>> +			uint64_t global_ctrl;
> >>> +			unsigned int cnt_mask = (1UL << cnt) - 1;
> >>
> >> Bits 2 + 4 * n have an additional qualification as per SDM vol 4.
> > 
> > Let me update my copy...
> > 
> > Looking at the version from December 2023, I see:
> > 
> > 0 EN_PMC0 If CPUID.0AH: EAX[15:8] > 0
> > 1 EN_PMC1 If CPUID.0AH: EAX[15:8] > 1
> > 2 EN_PMC2 If CPUID.0AH: EAX[15:8] > 2
> > n EN_PMCn If CPUID.0AH: EAX[15:8] > n
> > 31:n+1 Reserved.
> > 
> > And I'm afraid I'm not able to infer this additional qualification of
> > bits 2 + 4 * n.
> 
> I'm sorry, both earlier questions were my fault, due to looking at the
> table entry for the first match of PERF_GLOBAL_CTRL (i.e.
> IA32_FIXED_CTR_CTRL). Still need to get used to the new table layout,
> it seems.
> 
> Looking at the correct entry raises a question on cnt > 1 though, as
> EN_PMC0 is defined for cnt > 0.

Oh, indeed, can adjust on this same patch if that's OK (seeing as the
issue was already there previous to my change).

Thanks, Roger.

