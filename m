Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3428988B8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 15:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700876.1094623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsN3F-0003Ec-5l; Thu, 04 Apr 2024 13:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700876.1094623; Thu, 04 Apr 2024 13:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsN3F-0003CB-2r; Thu, 04 Apr 2024 13:22:45 +0000
Received: by outflank-mailman (input) for mailman id 700876;
 Thu, 04 Apr 2024 13:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxIL=LJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rsN3D-0003C5-Ql
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 13:22:43 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ac194f1-f286-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 15:22:42 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3438f079ff5so602739f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 06:22:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 bk20-20020a0560001d9400b0033fc06f2d84sm20142724wrb.109.2024.04.04.06.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 06:22:41 -0700 (PDT)
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
X-Inumbo-ID: 6ac194f1-f286-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712236962; x=1712841762; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U8/ibXGU/XZIQiDkBvZAiMIR4Aq5Wt7IfSsP2hiyJgU=;
        b=AdHu8PWBtzN9eD3oaNrp0NAUmyo3K3RbYZrZnAnEqsgSRHtVilU2o6eGJ3ktsM2jR/
         o2OUZGlbodiOJnVdtex6IT1SP3OSPZYD0WRG8hYJkVEBMj0Efq8u0kQVqYi4JbewhzKm
         nEcx+CsZNfUabFxcFcm6bPF5JWSxITrim2IBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712236962; x=1712841762;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8/ibXGU/XZIQiDkBvZAiMIR4Aq5Wt7IfSsP2hiyJgU=;
        b=HyQOnJOaA1hv5PlSj1XLRSUg4nnG87pKIsRrBkcxWAJS/9feyseM9+2ux1t+pq1jpf
         6lZHM45rmU8JYOMOmzlis4oWWqvDddWUjOd3Cx5lHUoYalvA8k3kXWXcMhzHKOy0Cnro
         b7XTy/Qpsw9aroBnirkY8CwMvDS2msSaUSVoWvt+6uoALrNHhOgjjtN69VppKaRMhT9U
         EZYlFb0iRDBERvhKelAGb06HObtJk/Bvu34I3ZJLIc9Q45gYv/2CvQFEGP6l9RnaMgcn
         C7jPEYsX3kb74TD2EkmCt1Qe/2Q1+YEaB758EW9CkUGR4t5aezttahkblhjs1ybcIHpu
         QrAA==
X-Forwarded-Encrypted: i=1; AJvYcCUp7w+CWiLG9jeu5rexQ/DG+XBVeqmgiLLMMUTeKEenXHSHWIzpL6J6dg7eqKN1EqzB5QHcLP6fhcErn5wBB5JxaqGQeCQYXiK8LnUgWEw=
X-Gm-Message-State: AOJu0YzL5f53Au8XfpxsARc9+m215x9oomL6cv7quEXRisOSKpvLP85x
	OdWMSKLd8lpyQmvA7gyrXXtKBjooXtPz10C+GAIeyjKzXTTyanSKDSBZTnlR0jM=
X-Google-Smtp-Source: AGHT+IHcpy7e/NqWGhEe8dTNaMVwuS2MBuvCjhl7TMrEaVqCPaGDxJTJadyEEOdrN6YRxFFPso1hYg==
X-Received: by 2002:a5d:4905:0:b0:343:7562:1eef with SMTP id x5-20020a5d4905000000b0034375621eefmr1845323wrq.35.1712236962054;
        Thu, 04 Apr 2024 06:22:42 -0700 (PDT)
Message-ID: <7ebf879b-01d1-4a13-9464-199d08960213@citrix.com>
Date: Thu, 4 Apr 2024 14:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <Zg1stUacaDBkyDOn@mail-itl>
 <20240404104122.2870129-1-andrew.cooper3@citrix.com>
 <6e99f73f-bf83-4c40-b97c-5cead300a781@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6e99f73f-bf83-4c40-b97c-5cead300a781@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2024 1:45 pm, Jan Beulich wrote:
> On 04.04.2024 12:41, Andrew Cooper wrote:
>> @@ -9,6 +10,7 @@
>>   *  -1 => Default, altered to 0/1 (if unspecified) by:
>>   *                 - TAA heuristics/settings for speculative safety
>>   *                 - "TSX vs PCR3" select for TSX memory ordering safety
>> + *  -2 => Implicit tsx=0 (from RTM_ALWAYS_ABORT vs RTM mismatch)
>>   *  -3 => Implicit tsx=1 (feed-through from spec-ctrl=0)
>>   *
>>   * This is arranged such that the bottom bit encodes whether TSX is actually
>> @@ -114,11 +116,50 @@ void tsx_init(void)
>>  
>>          if ( cpu_has_tsx_force_abort )
>>          {
>> +            uint64_t val;
>> +
>>              /*
>> -             * On an early TSX-enable Skylake part subject to the memory
>> +             * On an early TSX-enabled Skylake part subject to the memory
>>               * ordering erratum, with at least the March 2019 microcode.
>>               */
>>  
>> +            rdmsrl(MSR_TSX_FORCE_ABORT, val);
>> +
>> +            /*
>> +             * At the time of writing (April 2024), it was discovered that
>> +             * some parts (e.g. CoffeeLake 8th Gen, 06-9e-0a, ucode 0xf6)
>> +             * advertise RTM_ALWAYS_ABORT, but XBEGIN instructions #UD.  Other
>> +             * similar parts (e.g. KabyLake Xeon-E3, 06-9e-09, ucode 0xf8)
>> +             * operate as expected.
>> +             *
>> +             * In this case:
>> +             *  - RTM_ALWAYS_ABORT and MSR_TSX_FORCE_ABORT are enumerated.
>> +             *  - XBEGIN instructions genuinely #UD.
>> +             *  - MSR_TSX_FORCE_ABORT is write-discard and fails to hold its
>> +             *    value.
>> +             *  - HLE and RTM are not enumerated, despite
>> +             *    MSR_TSX_FORCE_ABORT.TSX_CPUID_CLEAR being clear.
> Of these 4 items you use the first and last here. It took me some time to
> figure that the middle two are (aiui) only informational, and that you
> assume that first and last together are sufficient to uniquely identify
> the problematic parts. Separating the two groups a little might be helpful.

All 4 points are relevant to the if() expression.

>
> For the write-discard property, how was that determined? Does it affect all
> writable bits?

Marek kindly ran a debugging patch for me last night to try and figure
out what was going on.

Currently, Xen tries to set 0x2 (TSX_CPUID_CLEAR) and debugging showed
it being read back as 0.

I didn't check anything else, but I have a strong suspicion that I know
exactly what's going wrong here.

The property the if() condition is mainly looking for is !RTM &&
!(MSR_TFA.CPUID_CLEAR) because that's an illegal state in a

>
>> +             * Spot this case, and treat it as if no TSX is available at all.
>> +             * This will prevent Xen from thinking it's safe to offer HLE/RTM
>> +             * to VMs.
>> +             */
>> +            if ( val == 0 && cpu_has_rtm_always_abort && !cpu_has_rtm )
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",
> This isn't really firmware, is it? At least I wouldn't call microcode
> (assuming that's where the bad behavior is rooted) firmware.

Microcode is absolutely part of the system firmware.

>
>> +                       boot_cpu_data.x86, boot_cpu_data.x86_model,
>> +                       boot_cpu_data.x86_mask, this_cpu(cpu_sig).rev);
>> +
>> +                setup_clear_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
> Instead of the "goto" below, wouldn't it be better to also force
> has_rtm_always_abort to false along with this, thus skipping the
> setup_force_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT) further down?

I considered that and dismissed it.  It is more fragile, in a case were
really do want to treat this case as if TSX genuinely doesn't exist.

>  That would
> leave things a little less awkward flow-wise, imo. The one thing not
> becoming clear from the commentary above is whether cpu_has_tsx_ctrl might
> be true, and hence RTM/HLE still becoming (wrongly) set, if done that way.

MSR_TSX_CTRL and MSR_TSX_FORCE_ABORT exist on disjoint sets of CPUs. 
(The split being MDS_NO).

This is discussed explicitly lower down in the function, beyond the if (
once ) block.

~Andrew

