Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D8EC56104
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 08:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160668.1488733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJRnj-0007Q1-3C; Thu, 13 Nov 2025 07:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160668.1488733; Thu, 13 Nov 2025 07:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJRni-0007N6-V1; Thu, 13 Nov 2025 07:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1160668;
 Thu, 13 Nov 2025 07:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJRnh-0007Ly-OW
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 07:31:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1941920-c062-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 08:31:23 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so706919a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 23:31:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a498102sm819709a12.24.2025.11.12.23.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 23:31:22 -0800 (PST)
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
X-Inumbo-ID: c1941920-c062-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763019083; x=1763623883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zaodl8B6QbQFdBfXqLETJkEz+q3oMSYf+0RLjRBTEmQ=;
        b=O5/+Hss9cCkPec5VvDqHA0NERtHe79BxSTSGtywxaVHkW2AvrdGAdWl5F9RpV4bzLG
         /2yLWHkIe/TGsjYfjY5nCzC8xu97VCx2eGoF+rP2sgBIDoMdYNzP8ZUFEAXInPh5teLz
         SW2JV56ZLgvv38LCs/VxdDnYCnozuHIw2iG1G01z0tkI9chGBvcu60UocoZpgbeGmHKh
         4RLrGh/3+XFQMNHvXFuAt692FiLeYeGZ6vJtZZP4WMUypswORUV1Cu4MXQnS2RC5C0z4
         wp+c0t2PMcLN/JYWZ58AQYXUdLCVSmfB8COyVkGfTAXT+VdGQGRWR9xrIFFQoMds5g1D
         u1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763019083; x=1763623883;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaodl8B6QbQFdBfXqLETJkEz+q3oMSYf+0RLjRBTEmQ=;
        b=kWYKS/uEMAI4lYmKXqVvnk6CYQvEJGKWNyxKaasNHBCnwcsjYJv05b6aEGnqlCqMiR
         aDDFtndk6kJZfgl2rw9wVusLbR1XWJKObICiTejlOwep0AlMSpnjGKKbOqPsWXKzFENn
         jk7rWom9RmM9mnvVUX6NvJMn2zuLSwGGfyKTefFWBiW50j6CbZooDjFOjXgjSy7D3Iks
         NT7Mz25NS0HAy+yptfmkfSI6gkFoJZtlnjDQRmJ1gZG+KMMN9RkUD4pU1AcQxDSXzAa9
         Fr2lcO6tVNvHmyWPElDN8VmEzLXBg8g6Aa9WJXqBXDGEA5R/ueDfnZiPsTcXK2fmXeW0
         Hl+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUq9XWhSlB7SCeTQUjjapaHn7Xed39T2UKixKall+vOo5lD/s29CPE/5GbACi3KDB3BwV/d/lSb65w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztI3jNpMW3s78ZTcoaz+MZLZopuOJTuEKa3Sb3CKqBrW6o5q3l
	GnQU3vwZ0bqag0YlnN+cAayUHQ36KOYP/HnQ9HrhxQ/KU4oPSgXpP4PKWm3343JALA==
X-Gm-Gg: ASbGncv16K3OQunecg1HU/igwheJj7PSftNBHsLppXxzs5fsW68qKWhBbiKi5vjMM/x
	IPN08jgpNEclRBGcD8HIKDF+cQ1Jv9OxsrRJBBWGBkFGwuLrab9xn9Mp5CgxgtFdu15k4NQpqe1
	WX27JfpglujViTWLbQIuoj0DFS4nLyHAV+zGgnfzQXlMWwqezNthvVwgQ1HO9WhfIHyqE+z+vRF
	habIk9RebnXuZjqKZU7pHpDXDo5eZtvmrI7k8dvOHVtwxZ5RQ59faWLUfhryxDjHjL8nprRaI+N
	Tlu7DhUtXgtscvY3vZnZLB2iWBM6+1ix3DvipwYbTXT7KL2TK1A41hEtEun88JYWZi5i2IHcIZg
	pqTlCPdf8WE8stCSnRGCLAmxBH3gRMltTjhU9a5Vnk+DoiTKSkXJhowLuU/vihLqY1XNMj4tZ9k
	sMuL4g5VvHgRSIUtZmko/e0pTzERugNsDEOFo9dCCmzB7sCj00toAlOlxnTg0SjltYSkfB0ma6R
	dU=
X-Google-Smtp-Source: AGHT+IEuhK/HrDOZkIoH0wiJVlBRL75MxfNFFoRTfj96aHpRpJu2WPSf1yEbeHQVN4cxIhYm3a1S5Q==
X-Received: by 2002:a05:6402:3586:b0:640:c454:da with SMTP id 4fb4d7f45d1cf-6431a3948d1mr5022789a12.5.1763019083342;
        Wed, 12 Nov 2025 23:31:23 -0800 (PST)
Message-ID: <cc64ffb5-4419-458b-9526-fa765eda7bd6@suse.com>
Date: Thu, 13 Nov 2025 08:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: revise "cpu_has_vmx" usage for
 !CONFIG_INTEL_VMX case
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250924101417.229108-1-grygorii_strashko@epam.com>
 <7b2fe09a-02f4-4575-9e42-1328f3a40f1d@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <7b2fe09a-02f4-4575-9e42-1328f3a40f1d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 21:25, Grygorii Strashko wrote:
> Could it be merged if no other comments, please?

It's on my list of things to put in. However, since you ask: You do realize that
all your recent postings were while the tree was frozen? That's okay-ish, but
when preparing a release people would preferably focus on the release, not on
what is to come afterwards. This change of yours, like quite a few from others,
will need to wait until the tree is fully open again. It having been progressed
to the point where it can in principle go in was already a courtesy, considering
the timing.

Jan

> On 24.09.25 13:14, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
>> HVM Intel VT-x support can be disabled, but it still keeps VMX
>> code partially built-in. Particularly in HVM code there are two places:
>>
>> 1) hvm/dom0_build.c
>>   dom0_construct_pvh()->pvh_populate_p2m()
>>      ...
>>      if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>>      {
>>          ...
>>          [unreachable for !cpu_has_vmx case]
>>          rc = pvh_setup_vmx_realmode_helpers(d);
>>
>> pvh_setup_vmx_realmode_helpers() allocates memory and configures
>>   HVM_PARAM_VM86_TSS_SIZED
>>   HVM_PARAM_IDENT_PT
>>
>> 2) hvm/hvm.c
>>   hvm_set_param()
>>      ...
>>      case HVM_PARAM_IDENT_PT:
>>
>>          if ( !paging_mode_hap(d) || !cpu_has_vmx )
>>          {
>>              d->arch.hvm.params[index] = value;
>>              break;
>>          }
>>          [unreachable for !cpu_has_vmx case]
>>          ...
>>
>> Hence HVM_PARAM_IDENT_PT/HVM_PARAM_VM86_TSS_SIZED are used only by VMX code
>> above code become unreachable in !cpu_has_vmx case and can be optimazed
>> when !CONFIG_INTEL_VMX.
>>
>> Replace "cpu_has_vmx" with using_vmx() to account !CONFIG_INTEL_VMX and allow
>> compiler DCE to optimize code.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-604 (-604)
>> Function                                     old     new   delta
>> hvm_set_param                               1602    1473    -129
>> dom0_construct_pvh                          4438    3963    -475
>> Total: Before=3567191, After=3566587, chg -0.02%
>>
>>   xen/arch/x86/hvm/dom0_build.c | 2 +-
>>   xen/arch/x86/hvm/hvm.c        | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index 5551f9044836..5ac2cf8394d8 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -473,7 +473,7 @@ static int __init pvh_populate_p2m(struct domain *d)
>>           }
>>       }
>>   
>> -    if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>> +    if ( using_vmx() && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>>       {
>>           /*
>>            * Since Dom0 cannot be migrated, we will only setup the
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 95a80369b9b8..70331aeec9a0 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -4302,7 +4302,7 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>            * Only actually required for VT-x lacking unrestricted_guest
>>            * capabilities.  Short circuit the pause if possible.
>>            */
>> -        if ( !paging_mode_hap(d) || !cpu_has_vmx )
>> +        if ( !paging_mode_hap(d) || !using_vmx() )
>>           {
>>               d->arch.hvm.params[index] = value;
>>               break;
> 


