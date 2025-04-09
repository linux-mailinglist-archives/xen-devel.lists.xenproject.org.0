Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DFA820E1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 11:19:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943688.1342353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2RaE-0002uA-8a; Wed, 09 Apr 2025 09:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943688.1342353; Wed, 09 Apr 2025 09:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2RaE-0002r8-5W; Wed, 09 Apr 2025 09:18:58 +0000
Received: by outflank-mailman (input) for mailman id 943688;
 Wed, 09 Apr 2025 09:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2RaC-0002r2-3N
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 09:18:56 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7edeb73-1523-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 11:18:53 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso44126455e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 02:18:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ec97csm13935385e9.6.2025.04.09.02.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 02:18:53 -0700 (PDT)
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
X-Inumbo-ID: a7edeb73-1523-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744190333; x=1744795133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fapSrGbwzx46Jyw9vp4EVuD7vkduYiWQpWgQe9PdCuI=;
        b=NaGbCLsjEtn1g0o5z5iPzS+lGGhFFvb9uwP3xZZi2Yj5Cr7Z7IKG00IRjiWqyj9FEp
         qmOitRUI/9DYPJFeP3srhD/JQ5PY/43A5lVaF3OPBaJJemdbfP2imJxmW4ksccmsy7DP
         Ms5BtNW9iXJfHKiuJCPTlBDd5XEzWTNl+jbZnAjBYBqgENv9u3dt1dN1n8OAMcLIBPUq
         jVqLEUs1DIEYOvDwWQjXLvDLozQliP67k/qC09WQDGNWAxEN2gNtw4gsD+UruAmrI2jA
         pqcIlCxPTJDoMs+m2ERngDmuuv2EoUzlmvXKK2pfD+2ShNC1w4BeP1TfnU+at+46hckj
         xBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190333; x=1744795133;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fapSrGbwzx46Jyw9vp4EVuD7vkduYiWQpWgQe9PdCuI=;
        b=uUyEE3zTsjUNQ0c46YO/AS98vAcHqzIaSiEn8Y5MQMrvIX6+px5ySHminfOjeC7N5R
         WE0F+icMPU4jYdewntjap3+OJh22JsdPmLnAtMlZwi3xNg3U2R7zKw41FkMeGZpBIiT+
         ETiwj+QMMBAmb5181rw0qYLnWhEawjDUBN/CJO975TpcY+cMnilyw1O08KbbkgOAmE8+
         NtVb1CRugCD8kYMToI9FKVVd9RJTMULkgDoAT0gc2i0MopSo5/H3KTvHV//rKEGGrzGu
         9MLC4hBWRNBgl/M9mKqy5HtAopXtnGG60GgRycOk79Q51O4CqWtSw0iQbrklwJ82M96k
         hvtw==
X-Forwarded-Encrypted: i=1; AJvYcCWpidFZC+1QivADbd5LmVenANF6gmLRKOQDflvTRGMsTNnA7bHPpPNriQ2CRQwMQWeyt7LbAYw5bL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5TJFXloKDjuRLPgmCUv8yG+HZYVbmGKuwVDm33dBs+FimFVg5
	Iu/kkJqUOZyMeC0ia9Fc5R9hc9MpCKc22jxJsR0xmk3BVsoigVBUbswvv/1Snw==
X-Gm-Gg: ASbGncufDqFDh1lp/VE2cPMv6eR7IxgQ0Grf8jr/eVJ0B0+emVXjASkenmjlJ4DlnPR
	LTACxeUqw3bfrs/CJYl72+CcS0ElP/SJY5EZ43zpG2reEeZ8uU/Vemy7N8O40W7ghY5B77PvB3/
	HH5uCxcAjfM5b9szuXTvD+2f1FlL3kZY4zT1cZOIUDvXbeYtRWfLhq8AmR138Cw9bQMUhcHynwv
	HmSlCCW4hrlLyU5lGhLBUZw3zpkRoMl3RmIUrs1PZWiYGT/4tNEPqe0SWBT2l0KFDRrVfdP93/k
	ftjUzGNXjFaqa+XwKMPLcrvfR/1Pfowe0H2xeO7rhdIOD8wegA4Q3Is8ENCoLpVqWmmEy0eoQNc
	e9WC2esfsdy6V7W/UhELZ6Xt6xQ==
X-Google-Smtp-Source: AGHT+IGXCDMFv2kpYPg4hbU1ReEpB56IUATP9g5eIdxlA38EO+gOxAGZSviPn4Wo22FNqtNBkWEsmQ==
X-Received: by 2002:a05:600c:5113:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43f1ff461e1mr13043565e9.29.1744190333315;
        Wed, 09 Apr 2025 02:18:53 -0700 (PDT)
Message-ID: <e2bcd0f4-fcb9-4d6d-82b7-54540fe3ac79@suse.com>
Date: Wed, 9 Apr 2025 11:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1 1/2] x86/amd: Add guest support for AMD TCE
From: Jan Beulich <jbeulich@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <2bac0ded3456e04b49b48cf0808203e76fc6a622.1743771654.git.teddy.astie@vates.tech>
 <ff05d16d-c9f3-4655-abf0-25201f8bca85@suse.com>
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
In-Reply-To: <ff05d16d-c9f3-4655-abf0-25201f8bca85@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 10:53, Jan Beulich wrote:
> On 07.04.2025 11:10, Teddy Astie wrote:
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -170,6 +170,7 @@ XEN_CPUFEATURE(SKINIT,        3*32+12) /*   SKINIT/STGI instructions */
>>  XEN_CPUFEATURE(WDT,           3*32+13) /*   Watchdog timer */
>>  XEN_CPUFEATURE(LWP,           3*32+15) /*   Light Weight Profiling */
>>  XEN_CPUFEATURE(FMA4,          3*32+16) /*A  4 operands MAC instructions */
>> +XEN_CPUFEATURE(TCE,           3*32+17) /*H  Translation Cache Extension support */
> 
> I consider this too limiting; this is a performance hint only, after all,
> not affecting correctness when ignored if set. A shadow guest is fine to
> enable TCE if it sees fit. It'll benefit if later migrated to a HAP-
> capable host.

Further to this: From all I can find it doesn't become clear whether INVLPGA
acts like INVLPG as to upper-level entries. Implicitly it comes closer to
acting like INVLPG with TCE set. Which may be the reason why svm_invlpg()
doesn't use INVLPGA. Yet that could change then for guests having TCE set,
which means it would become relevant to expose the bit also to shadow guests.

Jan

