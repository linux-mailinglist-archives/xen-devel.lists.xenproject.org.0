Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B5B266D5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 15:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081710.1441731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXrz-0003HB-0k; Thu, 14 Aug 2025 13:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081710.1441731; Thu, 14 Aug 2025 13:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXry-0003EK-UB; Thu, 14 Aug 2025 13:19:50 +0000
Received: by outflank-mailman (input) for mailman id 1081710;
 Thu, 14 Aug 2025 13:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umXrx-000392-Ai
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 13:19:49 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59af11c8-7911-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 15:19:47 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb61f6044so172405066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 06:19:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3b77sm2590006266b.51.2025.08.14.06.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 06:19:46 -0700 (PDT)
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
X-Inumbo-ID: 59af11c8-7911-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755177587; x=1755782387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NYTc8LzFTEB0J0qNURaJmgk7i8ISbBU5eznAJji3BsI=;
        b=gbA/P606x1WqjhLfXN7cqp4a47R99qqpQiifEXOO5n+r5RjNkagfiATWNRXwoBTMix
         hpIW+OH3o6KTvDiIAa5YplGPKDwu08DJVdUCJYMbTYuhnx/kn7EuJmcBLiisWWrp3/Bq
         a6kzyVOl4+eMJxHCydPKaHUdpgx7b17oco3fL/8MRdeBO+JODxCyMG4yBbsizTP0xHvZ
         BjFSoVWR/IqakhtKAgv8N53UFrHZH5+upGGcfH8Xvk0AMjUY372YIVtWQd1MpfJzWK73
         98RQE2Mr2bl7bcYqNwzYxO/IZlKn7WbSM+In021pPSfrGNgNDUXVKTPD4hHe/opoUqpU
         FBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177587; x=1755782387;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYTc8LzFTEB0J0qNURaJmgk7i8ISbBU5eznAJji3BsI=;
        b=Vw1MXs2qom9Mic+7L7oJf5oeMecCGXVpw9QLCZ2HQ4vcThb6IuwqqUuBPCBpdFtchN
         vkVfdjADBZ/0eBXDzK5BH1F+BA1ulD5sfL7UOR8SNFpJpv4u83JCaRAUC3Z1esOL6a1d
         Gh0nnqDBrj1CO/Rs5UbuCdOjhH8sZfIgD54koQlaK5eNnI5zozzb3W05v/TLdXirp0OC
         OVcplVkhfwu0lcw2zmEGXtRnOB165d/MFqrTHfmUOecswTrxztnqYQx3vpnb3NSUXLKo
         rjYI0vWvAMESbetVfr8e1ksBn5M9ZKdYpcLgo3w+sRMRRo5iOt+uH+aPchSiWBF0rnUO
         fzhg==
X-Forwarded-Encrypted: i=1; AJvYcCWqVzFPDHeXZguXj2LJdyq8dk9/Lco4D9ZLK8SmQYDh3DXtQrgt2JiJt6SToYAF1LDSrGdSfzmifYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypVLIKAOIZFAMDi/hNZbFMgqTWUK/JsEUqDdlznkKl0JO1yieg
	/0DRCJvHnWhW5uRMMEi0ktxdF6Ql3I+dQPVoxEKO7kNHcSBZ04jBVOb5ETmaxgNscg==
X-Gm-Gg: ASbGncseuz0d68wybbl0Tq1cO/GHOn79qBuLVE4ut10j7xpkt4EVZXorj7jyFlFmBgo
	Hq3G2KaHxmO30vtqIn8HPzVvoHIN+UtDLQrZSwaYCxqTacVW7hVv7/Gi0Wdzr+0uWDNKvM8wnzo
	iuMoGc4lwtLIv76HVZBPfjGUtJMK2zuxaRGrUISek8TL28tHBcSslsZzFsAwDp8inFT9zzzujfL
	lE2klMeSlH3krzoc8JbW42R4we/HUq2sm+kEzNncpw1VmNZQ2t9LLZr5BKVafYFUTHdDhqEvbc9
	t9Z449BwXhe2xW+hF4BMNDeua3GLzC0KftyX15qJqFCH0CI7qXGn10CSMYSVjV39CsjZOkDTwDE
	oDWqglzfDGDApU7FwFBH7UxSw8Z1S43Q7S0I40QOIf0Niv3xxAT32ZO1C2CCMY/nbXayRucahlt
	Z2tUcPISCITVRL/+BG5g==
X-Google-Smtp-Source: AGHT+IGuu7qLcsHiPQGkEj//tjnJ1MO4weqNjSjiCxOqH8ysyADuy0hFtDgYfDwcaVDVjULUmCaO1w==
X-Received: by 2002:a17:907:3e8f:b0:af7:fd29:c5e4 with SMTP id a640c23a62f3a-afcbd5cbe63mr265674466b.2.1755177586878;
        Thu, 14 Aug 2025 06:19:46 -0700 (PDT)
Message-ID: <737eab59-f016-426a-ba6e-e6c7a58a9e61@suse.com>
Date: Thu, 14 Aug 2025 15:19:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 13:20, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -310,7 +310,10 @@ XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+8) /*   Architectural Perfmon */
>>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
>> +XEN_CPUFEATURE(FRED,         10*32+17) /*   Fast Return and Event Delivery */
>> +XEN_CPUFEATURE(LKGS,         10*32+18) /*   Load Kernel GS instruction */
>>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
>> +XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-Source Reporting */
>>  XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
>>  XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>>  XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
> 
> I'd like to note that we could long have had this if my long-pending emulator
> patch had gone in at some point.

Actually what I further have there, and what in the context of patch 15 I
notice you should have here is

--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -278,7 +278,8 @@ def crunch_numbers(state):
         # superpages, PCID and PKU are only available in 4 level paging.
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
-        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD],
+        LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
+             LKGS],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.
@@ -347,6 +348,9 @@ def crunch_numbers(state):
         # computational instructions.  All further AMX features are built on top
         # of AMX-TILE.
         AMX_TILE: [AMX_BF16, AMX_INT8, AMX_FP16, AMX_COMPLEX],
+
+        # FRED builds on the LKGS instruction.
+        LKGS: [FRED],
     }
 
     deep_features = tuple(sorted(deps.keys()))

Jan

