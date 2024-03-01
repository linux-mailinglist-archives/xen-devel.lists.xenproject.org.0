Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5386E3E0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 16:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687717.1071467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4OO-0007cz-AR; Fri, 01 Mar 2024 15:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687717.1071467; Fri, 01 Mar 2024 15:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4OO-0007bj-7b; Fri, 01 Mar 2024 15:01:44 +0000
Received: by outflank-mailman (input) for mailman id 687717;
 Fri, 01 Mar 2024 15:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=do9M=KH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rg4ON-0007bd-Jl
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 15:01:43 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c073811-d7dc-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 16:01:41 +0100 (CET)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-787bc61cb69so119779385a.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 07:01:41 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g27-20020a05620a109b00b00787f7d5a727sm1706952qkk.44.2024.03.01.07.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 07:01:38 -0800 (PST)
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
X-Inumbo-ID: 9c073811-d7dc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709305300; x=1709910100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6O/BnUHEkmpftStm/JOiF+Sc8ZH4TCkcvsv6gP4CTZo=;
        b=SIDqA+BiVCSxhH51h7ZwTRPrCEkqMMKS4LI3q+ILqv07I/HSC4sWd4oeDveQyx4otV
         ZPBy6S6UDEsdoCUJsSIHmLvMaBinTa0CDZhzCsyfAeeg/dW37YPt02N808pdxZdIeEgb
         mdaMINqci2o+rxRJ+iwYjOcF3VzOOQvFRqOv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709305300; x=1709910100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6O/BnUHEkmpftStm/JOiF+Sc8ZH4TCkcvsv6gP4CTZo=;
        b=ol/jaJpP+lOSC6Owevdg60Iguh/QpSY9vochrTtQM6yXAoAeE4vf5I8Kb8nVeEh53W
         cXX86SsJ+MHkAF8Ixm6GSzgLNJjhUidGzrgYK3/xbsT1rodrVrfHaa7S4HIp1sQQKN1j
         C9UgMBp7BL+CNI75HoXUUKxpdmaj+4PpuLeKbTyTv6vi6vGw3amL3Fy7EFuQY49hMkDD
         SPCtaeeTMBycbDCUiCcKrUwMhoXwNklQm7JvdTlPpS0QzVUbOf+im8c5cazICDKk+vwy
         oQEeEHZFheomN6Kb565OzBPQJ2GoteZhp6mIs4RkRFGPDoLZG81z3m+xtzqnW52sWffk
         HypQ==
X-Gm-Message-State: AOJu0YwawNkidBd1WKztiUgwINkbNlYKX7Yv42TVBRUJg0N7UetPtXjc
	RhAxt6jONJlSziVkomzXu77GO2Zc0j5GuJB0Rjq1CWdz7wntoHT5Mbl/04pt48nOz/DY14OUz+c
	C
X-Google-Smtp-Source: AGHT+IHpn0UHD1FGk/Id8iGoHuGGciOjNXcYCDNpsEyFaK4ohapvxCcjKsJuhGE/989jydZ03G+MGw==
X-Received: by 2002:a05:620a:4ad9:b0:787:80bb:c2e7 with SMTP id sq25-20020a05620a4ad900b0078780bbc2e7mr1534441qkn.51.1709305299692;
        Fri, 01 Mar 2024 07:01:39 -0800 (PST)
Message-ID: <4fedcd61-94e1-4869-b620-27c48e8dafef@citrix.com>
Date: Fri, 1 Mar 2024 15:01:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Allow for levelling of VERW side effects
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240229181354.2560819-1-andrew.cooper3@citrix.com>
 <ZeHYCzDGAsbVmSLY@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZeHYCzDGAsbVmSLY@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/03/2024 1:28 pm, Roger Pau Monné wrote:
> On Thu, Feb 29, 2024 at 06:13:54PM +0000, Andrew Cooper wrote:
>> MD_CLEAR and FB_CLEAR need OR-ing across a migrate pool.  Allow this, by
>> having them unconditinally set in max, with the host values reflected in
>> default.  Annotate the bits as having special properies.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/cpu-policy.c                   | 24 +++++++++++++++++++++
>>  xen/include/public/arch-x86/cpufeatureset.h |  4 ++--
>>  2 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
>> index f3ed2d3a3227..41123e6cf778 100644
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -442,6 +442,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>>          __set_bit(X86_FEATURE_RSBA, fs);
>>          __set_bit(X86_FEATURE_RRSBA, fs);
>>  
>> +        /*
>> +         * These bits indicate that the VERW instruction may have gained
>> +         * scrubbing side effects.  With pooling, they mean "you might migrate
>> +         * somewhere where scrubbing is necessary", and may need exposing on
>> +         * unaffected hardware.  This is fine, because the VERW instruction
>> +         * has been around since the 286.
>> +         */
>> +        __set_bit(X86_FEATURE_MD_CLEAR, fs);
>> +        __set_bit(X86_FEATURE_FB_CLEAR, fs);
>> +
>>          /*
>>           * The Gather Data Sampling microcode mitigation (August 2023) has an
>>           * adverse performance impact on the CLWB instruction on SKX/CLX/CPX.
>> @@ -476,6 +486,20 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>>               cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
>>              __clear_bit(X86_FEATURE_RDRAND, fs);
>>  
>> +        /*
>> +         * These bits indicate that the VERW instruction may have gained
>> +         * scrubbing side effects.  The max policy has them set for migration
>> +         * reasons, so reset the default policy back to the host values in
>> +         * case we're unaffected.
>> +         */
>> +        fs[FEATURESET_7d0]   &= ~cpufeat_mask(X86_FEATURE_MD_CLEAR);
>> +        fs[FEATURESET_m10Al] &= ~cpufeat_mask(X86_FEATURE_FB_CLEAR);
>> +
>> +        fs[FEATURESET_7d0]   |= (boot_cpu_data.x86_capability[FEATURESET_7d0] &
>> +                                 cpufeat_mask(X86_FEATURE_MD_CLEAR));
>> +        fs[FEATURESET_m10Al] |= (boot_cpu_data.x86_capability[FEATURESET_m10Al] &
>> +                                 cpufeat_mask(X86_FEATURE_FB_CLEAR));
> This seems quite convoluted, why not use:
>
> __clear_bit(X86_FEATURE_MD_CLEAR, fs);
> if ( boot_cpu_has(X86_FEATURE_MD_CLEAR) )
>     __set_bit(X86_FEATURE_MD_CLEAR, fs);
>
> And the same for FB_CLEAR. I think that's quite easier to read.

This better?

+        /*
+         * These bits indicate that the VERW instruction may have gained
+         * scrubbing side effects.  The max policy has them set for
migration
+         * reasons, so reset the default policy back to the host values in
+         * case we're unaffected.
+         */
+        __clear_bit(X86_FEATURE_MD_CLEAR);
+        if ( cpu_has_md_clear )
+            __set_bit(X86_FEATURE_MD_CLEAR);
+
+        __clear_bit(X86_FEATURE_FB_CLEAR);
+        if ( cpu_has_fb_clear )
+            __set_bit(X86_FEATURE_FB_CLEAR);

~Andrew

