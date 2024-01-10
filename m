Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EF0829DFC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 16:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665655.1035878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNasv-0002T7-I2; Wed, 10 Jan 2024 15:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665655.1035878; Wed, 10 Jan 2024 15:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNasv-0002Qr-EW; Wed, 10 Jan 2024 15:52:53 +0000
Received: by outflank-mailman (input) for mailman id 665655;
 Wed, 10 Jan 2024 15:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ginX=IU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rNast-0002Ql-Ry
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 15:52:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ed54e62-afd0-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 16:52:50 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d5336986cso55773185e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 07:52:50 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b0040e4a7a7ca3sm2496655wmb.43.2024.01.10.07.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 07:52:50 -0800 (PST)
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
X-Inumbo-ID: 4ed54e62-afd0-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704901970; x=1705506770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPums0vJZUSqI/ihjoYuzcXuedKEcACR92Kn6yT3KLo=;
        b=nmwCzcMrl5RmXwQNJveabhrIhZhMZs8Bk8mnZ0IzuYdmv9pqs0sZtW24/u+SALmFt4
         RhRDoHN/2kD534vRulh217nH/bbexymVcC7RT60iAvJx3HviEHIQ6CB80/kdwEu03BFl
         zEklRwM0fCMtKtHVc7bCK4Cd916xaucyUHOtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704901970; x=1705506770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPums0vJZUSqI/ihjoYuzcXuedKEcACR92Kn6yT3KLo=;
        b=R+zqIwMShj80h+EvzUrKZSjioCPPX3T4Ro/X42do1z4/PUXn8ssWKooWXGOlQwJ333
         /ZIWeFKqbeMdtgq1zLCinRboPymkkXlRmFZQ/cMuGgzR6DbiUneNNy24n9ihx7eLyqVj
         V+MI5P3THCn9sQfrulk4TcO3re106gMkzAHI4qWGkVqN/IBlmf5HOHS3gRR4NZLYyvBF
         pQamSGJNsi41/NCW4vWPLNdSG2YBgnHpLEHFh3vmb1zAcpQXg0KafGM9/Ljq+haIDMbG
         XxDeq+lq0ZvRWkvSKPDUCEpCUZ4chVaGqHkUB8jPSBKS1shbAL+Qbjj6ksfudonnnncl
         acDg==
X-Gm-Message-State: AOJu0YyHJGFZuW41qrfgtNaoF0hCMQo4IqLQcsgrpSVtmd4CTR/8qgzA
	qH33sa639kVriVltoPFpvtvU8JYGgTqPNA==
X-Google-Smtp-Source: AGHT+IECa1Bi+z2o3eLvuTtKk0EjsysksofZ4DpXIojvtPOKyebyfe5uPmZG8SUjE2dOsT69SVQNaw==
X-Received: by 2002:a05:600c:6cf:b0:40e:517a:2971 with SMTP id b15-20020a05600c06cf00b0040e517a2971mr636826wmn.247.1704901970211;
        Wed, 10 Jan 2024 07:52:50 -0800 (PST)
Message-ID: <4bd7324f-69fc-42e5-9155-02a7e1a8a6e8@citrix.com>
Date: Wed, 10 Jan 2024 15:52:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nmi: ensure Global Performance Counter Control is
 setup correctly
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240110153400.64017-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240110153400.64017-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/01/2024 3:34 pm, Roger Pau Monne wrote:
> When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
> MSR contains per-counter enable bits that is ANDed with the enable bit in the
> counter EVNTSEL MSR in order for a PMC counter to be enabled.
>
> So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
> bits being set by default, but at least on some Intel Sapphire and Emerald
> Rapids this is no longer the case, and Xen reports:
>
> Testing NMI watchdog on all CPUs: 0 40 stuck
>
> The first CPU on each socket is started with PERF_GLOBAL_CTRL zeroed, so PMC0
> doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
> relevant enable bit in PERF_GLOBAL_CTRL not being set.
>
> Fix by detecting when Architectural Performance Monitoring is available and
> making sure the enable bit for PMC0 is set in PERF_GLOBAL_CTRL.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The fact that it's only the first CPU on each socket that's started with
> PERF_GLOBAL_CTRL clear looks like a firmware bug to me, but in any case making
> sure PERF_GLOBAL_CTRL is properly setup should be done regardless.

It's each package-BSP, and yes, this is clearly a firmware bug.  It's
probably worth saying that we're raising it with Intel, but this bug is
out in production firmware for SPR and EMR.

> ---
>  xen/arch/x86/nmi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> index dc79c25e3ffd..7a6601c4fd31 100644
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -335,6 +335,19 @@ static void setup_p6_watchdog(unsigned counter)
>           nmi_p6_event_width > BITS_PER_LONG )
>          return;
>  
> +    if ( cpu_has_arch_perfmon )
> +    {
> +        uint64_t global_ctrl;
> +
> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
> +        /*
> +         * Make sure PMC0 is enabled in global control, as the enable bit in
> +         * PERF_GLOBAL_CTRL is AND'ed with the enable bit in EVNTSEL0.
> +         */
> +        if ( !(global_ctrl & 1) )
> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl | 1);

My gut feeling is that we ought to reinstate all bits, not just bit 1. 
If nothing else because that will make debugging using other counters
more reliable too.

vPMU (although mutually exclusive with watchdog) does context switch
this register as a whole.

See how global_ctrl_mask gets set up, although I'm not sure how much of
that infrastructure we really want to reuse here.

~Andrew

