Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7198AD066
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 17:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710027.1109106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvN9-0001Qq-5n; Mon, 22 Apr 2024 15:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710027.1109106; Mon, 22 Apr 2024 15:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvN9-0001Ne-2q; Mon, 22 Apr 2024 15:14:23 +0000
Received: by outflank-mailman (input) for mailman id 710027;
 Mon, 22 Apr 2024 15:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryvN7-0001NY-TS
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 15:14:21 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd8152f-00ba-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 17:14:19 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3455ff1339dso3461330f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 08:14:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm12272336wrj.98.2024.04.22.08.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 08:14:18 -0700 (PDT)
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
X-Inumbo-ID: fdd8152f-00ba-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713798859; x=1714403659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IlBBOEsaIMnXJQrwD/CUuhu2Que7M41u4i/cTzcXwwI=;
        b=f0maJ5Nv4P5HPrAlmem8H03g5bIsbJ01o1KdzI1ZpbuqlLPNXtVw5rgbdJfHmieyjM
         1nJ8ZW68acpOu2F9dTv9564K+4k2LnAOp3skNWXYa97gv6aoQohSOgLVg666hiwbHp2e
         wZhQLMkJQlAXw3Cugf+jyxk+ztKJgxAjiz0XZz+nero7liYoAe0FIb55tGn++Fxp25j2
         uR1VDe+9OpRapdJJfC+wVpxARLjIUQjc2nX8qh86ZKkJPvnPCB0orkQ3JInuDvqVc1w+
         RM0tlNPeO5BMcJC2sClcVFmEVKl8GLTYP41IaxZf1SDNXf2/I3udGh+3uN9Fj2GEfDkC
         joew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713798859; x=1714403659;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlBBOEsaIMnXJQrwD/CUuhu2Que7M41u4i/cTzcXwwI=;
        b=X5FLJCimRimTyqPV2XUeJrsI0FhdfeSBy9wjOZ+y5GwkUcbLdnYd/WocE7xt8GusXp
         MYvzdwI80F1NPF0qF7LpPbu1ahbDTs5Aqb00oHs8coSqnfY+jX5uWzFnHIUF7XW8DOon
         p5wFYSbh33Yy+Y1Yes5Vyo0G1s5eNl4DJ9IhYN46PAvOd+mnHVt/GtT9EDwE7TjFb8/P
         vsnTGxETMmIYnBuJnMmZarP0OYtNIcQxTVF2ORpKtiRnnqV2rhfTEQOg7kNLLlCIZmBk
         vfkwIwBn+S09j9ltsWqu48EIUwI5N8h49KNm+8mh5W0F6McOiVLkbYJzxudRB7660436
         uR/A==
X-Forwarded-Encrypted: i=1; AJvYcCWjMAwO+WwfYsRQYt6H+bVAZ5QNASOmFgEWbNuDqhxdFuHSqt5lxj1kZlzlap3ywjzSz6uzH8q8m/FIXSqi7O7gBBPSwydDXZf+g3MQ8qU=
X-Gm-Message-State: AOJu0Yw+ic8E/iHssonpLHCsy2275Pty2vEI7W9gZD2KwzUfvZKY+qj6
	WV5ax6Z2N+V2jeQUb36HstB7Lbu7+FOARjZym84cn56JnrLcyBrKbp/IYG0/4Q==
X-Google-Smtp-Source: AGHT+IGcCNv6JngfmjWrvlFryBcs9hMiXrOR12f9+lfB2KYFG+n+mf+HR98o2zKolgXQ2SQwuOAt5Q==
X-Received: by 2002:a5d:5985:0:b0:34a:eef8:b162 with SMTP id n5-20020a5d5985000000b0034aeef8b162mr5138523wri.5.1713798858986;
        Mon, 22 Apr 2024 08:14:18 -0700 (PDT)
Message-ID: <42ea5f58-0864-4e17-a710-a775cdd8e1bb@suse.com>
Date: Mon, 22 Apr 2024 17:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuid-policy: Add AMD SVM CPUID leaf to featureset
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@cloud.com>, xen-devel@lists.xenproject.org
References: <20240417132237.2946862-1-george.dunlap@cloud.com>
 <f5518331-3e4b-4f82-b91c-330ed397ae16@suse.com>
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
In-Reply-To: <f5518331-3e4b-4f82-b91c-330ed397ae16@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 17:09, Jan Beulich wrote:
> On 17.04.2024 15:22, George Dunlap wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -477,6 +477,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
>>  		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007);
>>  	if (c->extended_cpuid_level >= 0x80000008)
>>  		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
>> +	if (c->extended_cpuid_level >= 0x8000000a)
>> +		c->x86_capability[FEATURESET_ead] = cpuid_edx(0x8000000a);
>>  	if (c->extended_cpuid_level >= 0x80000021)
>>  		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
> 
> Aiui this is needed right in this change because of calculate_host_policy()
> deriving from boot_cpu_data.x86_capability. What I'd have expected in
> addition (going forward: instead) is an adjustment to
> x86_cpu_policy_fill_native().

I'm sorry, but no, there should be no need to adjust that function.

Jan

