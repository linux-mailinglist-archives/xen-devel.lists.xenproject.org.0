Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866982AC2B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:40:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666132.1036616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsTy-0002rh-6V; Thu, 11 Jan 2024 10:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666132.1036616; Thu, 11 Jan 2024 10:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsTy-0002pM-2i; Thu, 11 Jan 2024 10:40:18 +0000
Received: by outflank-mailman (input) for mailman id 666132;
 Thu, 11 Jan 2024 10:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNsTw-0002pE-7q
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:40:16 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd849f86-b06d-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 11:40:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e55c885d7so19276465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 02:40:14 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 dr18-20020a5d5f92000000b0033677a4e0d6sm894382wrb.13.2024.01.11.02.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:40:13 -0800 (PST)
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
X-Inumbo-ID: cd849f86-b06d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704969614; x=1705574414; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+1HqSBzPcwu1yBY/92f0JW3tx+vbgkTdNGugWbez+g=;
        b=TD5kIoFLbHbs/QxbpakzgE86hHeFxB4O+Top1LLnixqFKLqOQeHijwOPhUsIeZbclQ
         RQEo/vhFDdG2M5gu76XHRzmEKh5/sGIQOuz4If2iwPGhNwTYz1GuZh2mr4QVouCb92fr
         zF27FggbkyT5jUeDc44A5W4ufw2pdh1yNDgx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704969614; x=1705574414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+1HqSBzPcwu1yBY/92f0JW3tx+vbgkTdNGugWbez+g=;
        b=RfQOALonktogyylPpOiNnSRXNqA/EyWN6nmtzoCpxb8ooHYw3GYcqPEG9S90tACr7D
         uUY5zLgnVx84IUCMxGDeKs7kcU84sVc1KhKdbvJZjMyH6K4tqjunvc/kAK+Ua7YLZPb8
         ktIz4u4tUB4t53aBNSGajKG6QFCB7uEmG4jn9zFldNfpTSnsYdo6GVXcKUOgsWebqSrz
         I6N+XI4f7YvjPv6Y4o9wjCHOSg2r0H014Kar4vfzhWmzDgz8f9hveaqecKWSt4s3FnOL
         h+6CpPdUAFKV4Ma5tTSnlJeNRp/uIRreiD9o5Yv7YeyDUGarYgEx0OC7wQQ9CTiMcBQv
         ShNA==
X-Gm-Message-State: AOJu0YyNKUrfCrcm2Sa3CIj1MBFvlEcbSsDgGvbtf1fwozhWSWAQ5TV4
	Ul+z0SXfh8pSNJKhP9/AaGDsH8g3EfNKMjXbCz2Olb8xMUU=
X-Google-Smtp-Source: AGHT+IGpAXIkYmHTJMlDZpjVu9aJf16pDSVx8lMx65czWN3theWMDuEmhQsDB6SFo48YQ9l7RoX3Xg==
X-Received: by 2002:a05:600c:43c3:b0:40d:6582:4729 with SMTP id f3-20020a05600c43c300b0040d65824729mr299462wmn.130.1704969613749;
        Thu, 11 Jan 2024 02:40:13 -0800 (PST)
Date: Thu, 11 Jan 2024 11:40:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/intel: ensure Global Performance Counter Control
 is setup correctly
Message-ID: <ZZ_FjFa9mILtDZgv@macbook>
References: <20240111090821.67594-1-roger.pau@citrix.com>
 <3428928a-42d0-4e4b-9607-c184968c309d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3428928a-42d0-4e4b-9607-c184968c309d@suse.com>

On Thu, Jan 11, 2024 at 11:11:07AM +0100, Jan Beulich wrote:
> On 11.01.2024 10:08, Roger Pau Monne wrote:
> > When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
> > MSR contains per-counter enable bits that is ANDed with the enable bit in the
> > counter EVNTSEL MSR in order for a PMC counter to be enabled.
> > 
> > So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
> > bits being set by default, but at least on some Intel Sapphire and Emerald
> > Rapids this is no longer the case, and Xen reports:
> > 
> > Testing NMI watchdog on all CPUs: 0 40 stuck
> > 
> > The first CPU on each package is started with PERF_GLOBAL_CTRL zeroed, so PMC0
> > doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
> > relevant enable bit in PERF_GLOBAL_CTRL not being set.
> > 
> > Check and adjust PERF_GLOBAL_CTRL during CPU initialization so that all the
> > general-purpose PMCs are enabled.  Doing so brings the state of the package-BSP
> > PERF_GLOBAL_CTRL in line with the rest of the CPUs on the system.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Do the adjustment of PERF_GLOBAL_CTRL even if the watchdog is not used, and
> >    enable all counters.
> > ---
> > Unsure whether printing a warning if the value of PERF_GLOBAL_CTRL is not
> > correct is of any value, hence I haven't added it.
> > ---
> >  xen/arch/x86/cpu/intel.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> > index dfee64689ffe..40d3eb0e18a7 100644
> > --- a/xen/arch/x86/cpu/intel.c
> > +++ b/xen/arch/x86/cpu/intel.c
> > @@ -533,9 +533,25 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
> >  	init_intel_cacheinfo(c);
> >  	if (c->cpuid_level > 9) {
> >  		unsigned eax = cpuid_eax(10);
> > +		unsigned int cnt = (uint8_t)(eax >> 8);
> > +
> >  		/* Check for version and the number of counters */
> > -		if ((eax & 0xff) && (((eax>>8) & 0xff) > 1))
> > +		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
> 
> I may not have looked closely enough, but I didn't find the limit of
> 32 being stated anywhere.

Hm, my copy of the SDM vol4 states that bits 31:n are the enable bits,
where n is CPUID.0AH: EAX[15:8].  Bits 32, 33 and 34 control the Fixed
PMCs.

> > +			uint64_t global_ctrl;
> > +			unsigned int cnt_mask = (1UL << cnt) - 1;
> 
> Bits 2 + 4 * n have an additional qualification as per SDM vol 4.

Let me update my copy...

Looking at the version from December 2023, I see:

0 EN_PMC0 If CPUID.0AH: EAX[15:8] > 0
1 EN_PMC1 If CPUID.0AH: EAX[15:8] > 1
2 EN_PMC2 If CPUID.0AH: EAX[15:8] > 2
n EN_PMCn If CPUID.0AH: EAX[15:8] > n
31:n+1 Reserved.

And I'm afraid I'm not able to infer this additional qualification of
bits 2 + 4 * n.

Thanks, Roger.

