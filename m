Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFAD9640DC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 12:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785627.1195105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjbzY-0007ox-Bc; Thu, 29 Aug 2024 10:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785627.1195105; Thu, 29 Aug 2024 10:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjbzY-0007n6-7z; Thu, 29 Aug 2024 10:03:00 +0000
Received: by outflank-mailman (input) for mailman id 785627;
 Thu, 29 Aug 2024 10:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjbzX-0007n0-3I
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 10:02:59 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9c1fda-65ed-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 12:02:57 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f50f1d864fso5300181fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 03:02:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccf406sm511765a12.59.2024.08.29.03.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 03:02:56 -0700 (PDT)
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
X-Inumbo-ID: dd9c1fda-65ed-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724925777; x=1725530577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3GbnsKP5EuJs7t7uTD23QwEsjDzzgZbyxrhSYc+pZUU=;
        b=Lqb2Mul+oazWkM4QnoPZ0YTWtreIl/X/hKUptXMidzDWCYJb9+WPMHxJ0msBwODPon
         CSf81rwvlNIcZ+fZarTtIj3abPZ5VzF0N2pdD8/+/ocPE0tFGwBdnBQj/3FLrkebVQMT
         23WWW7B6/ZJX3qjDyepKzy1Z7j0TGHIrsEKdt9QGME9EOd7s9M3iv1nYHalE0JRYVA+e
         VuzQamyUBKEMXwxt7BS2rIFCwH28a8YXFmPdho1LsnAI2JUVwbTyNK6WWNtjs58IWYS1
         UwYKbeYagMY11jh6L4+sRnj5sIVKzisg8uFiB0+RC9Se/4cECCyGVKKdm0p1r3cPZIMq
         jW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925777; x=1725530577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GbnsKP5EuJs7t7uTD23QwEsjDzzgZbyxrhSYc+pZUU=;
        b=eS2jXHVcdNhPLlMmbMe5wReZYZOf6bQWNY65xX4bQqRtk2cYgNscnN5APfsxY/C6jJ
         xRzQO6aVGbtXSrS4wJlZLammCF3R9o0nqUGKOR+d203HW2uoIi4EDdjzOzpM+wDqjAeL
         vRIerQpdO93rBtfcIPN2kDwNT6oKjJB9JjaQ7VBLsowZpmDZig7ELobBBp0Bq3ekdCPv
         m5nh7ELqqhs7ubNY3UW/YSuap4OrMvkkjcIFRCBXlYjJL+mmauIpkaM681G2udbOrKSV
         ARy/MUvddlnVt4qEJZ2cBOZX/o54DNlsPyrIc6KjHKh5FZKIqWoQ05+QR8UJpJs+LtZq
         uJRA==
X-Forwarded-Encrypted: i=1; AJvYcCVTYZh6KZou3eErnyvf6KjSZclGIDTeDvpkJyeQPBMkUFB5GKQBRYVnWqAyGE4pjQ6ejsz/GX+G8yo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQtA3c7gAPEx8H+X/2KM3bfy6h6f2UINb4r2yjp3dt/Y4XOKTc
	G1cP58JkNOHVdtORCfIU0MPM+XmpVUliSWRLn+EnkQURUZ+aVrIi+nsA9Qr6iA==
X-Google-Smtp-Source: AGHT+IEBdbGaIaLlt45wDdRKwZk6CB6zAy2LdBTWMTY4hKFVIOH/zpMBn7SpfhWdWkfYsYW0YFF0MQ==
X-Received: by 2002:a2e:d09:0:b0:2f3:f054:684b with SMTP id 38308e7fff4ca-2f6103f66ddmr14824501fa.29.1724925776332;
        Thu, 29 Aug 2024 03:02:56 -0700 (PDT)
Message-ID: <697bbad5-e545-4847-9228-56dc6e07bd21@suse.com>
Date: Thu, 29 Aug 2024 12:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] x86/amd: optional build of amd.c
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <3c641433fa7cfe1f7fdc918ab32086835a2e13eb.1723806405.git.Sergiy_Kibrik@epam.com>
 <5675ea5a-0c14-42e2-b817-d9576a1f64b7@suse.com>
 <7e798639-98f4-4b7b-bab3-14f4f6da51d0@epam.com>
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
In-Reply-To: <7e798639-98f4-4b7b-bab3-14f4f6da51d0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 11:48, Sergiy Kibrik wrote:
> 19.08.24 15:36, Jan Beulich:
>> On 16.08.2024 13:19, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -919,7 +919,8 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>>>        * Possibly clear previous guest selection of SSBD if set.  Note that
>>>        * SPEC_CTRL.SSBD is already handled by svm_vmexit_spec_ctrl.
>>>        */
>>> -    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>> +    if ( IS_ENABLED(CONFIG_AMD) &&
>>> +         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>>       {
>>>           ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>>           amd_set_legacy_ssbd(false);
>>> @@ -953,7 +954,8 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>>>           wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>>>   
>>>       /* Load SSBD if set by the guest. */
>>> -    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>> +    if ( IS_ENABLED(CONFIG_AMD) &&
>>> +         v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>>       {
>>>           ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>>           amd_set_legacy_ssbd(true);
>> Instead of these changes, shouldn't AMD_SVM become dependent upon AMD in
>> Kconfig?
> 
> It could be done earlier, yet I haven't done so since we briefly touched 
> this before and decided not to link {AMD,INTEL} with {AMD_SVM,INTEL_VMX} 
> then:
> 
> https://lore.kernel.org/xen-devel/9a973f18-e0af-456c-8b07-6869f044519e@citrix.com/

Yet that only suggests that e.g HYGON also ought to select AMD_SVM. Which
will happen transitively with HYGON selecting AMD (in the earlier patch).

Jan

