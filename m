Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955A98B79B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807848.1219549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYcc-0000qK-G7; Tue, 01 Oct 2024 08:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807848.1219549; Tue, 01 Oct 2024 08:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYcc-0000nn-DG; Tue, 01 Oct 2024 08:52:42 +0000
Received: by outflank-mailman (input) for mailman id 807848;
 Tue, 01 Oct 2024 08:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svYcb-0000nh-D5
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:52:41 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8353bf82-7fd2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 10:52:39 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53959a88668so4565332e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:52:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ae440857sm176181a12.13.2024.10.01.01.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:52:38 -0700 (PDT)
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
X-Inumbo-ID: 8353bf82-7fd2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727772759; x=1728377559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YXW502KHO7TrBBjtU7liWw5he436NlY4BeR9yb3ZT8U=;
        b=XsK6musthvzg/xqDwrBhFn1vsOf8DkeFmnOB2wyL+jKFq6Wyb6uWMJzCQHjZzoiVoy
         a92wER9ZbRBSIgjHrY3Y17YbAxQpdrOUtFiMIY6BGx3gc+9Vvfgy6A4iEwcS1UotFjQl
         t6NBfJ8i9oOS47O+ood6hOlPJSPM8sKGmqfIe/T9UQj9R5LrZBP7E4KTC2b5EHt+Kzlr
         TKAWtQgZcloDwsLo5O3h5yBYiDPINMwecElHF8swnhzyWBl7E6r40sRAOSxYZwp32x2u
         xiWyRjxTs3dC96ns7GKfLKkymNSjyYgJguPNf4VdpN9I+iVu6UAEGX+ESXSGwRPs0ve/
         5BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772759; x=1728377559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXW502KHO7TrBBjtU7liWw5he436NlY4BeR9yb3ZT8U=;
        b=a29PL+Hyjj8uaR4PFRXPzc0jowD+BW5i0jZ6vBNTMdmSDJIXsuYKLlNEf0j1MTbYym
         bl8dZ53SPuI7SbmhtDOVyIrNNmbt3HJSTDmzixMdkUZzUN2Mq+Qf4oFwkubZcrXrYL79
         MZsnZizWBg7sPk1HFMWfa57OuuXGF4MyIvC3lB87RzMdgUa78ildgH4QrJlZg1keQ6rq
         UqpKyGjPHl+flstOdqv1eJGJzDn+JU/rlSeHmyxYdbRoMzRIqEfV3wNnwQdTFvkRnBHj
         xZNjxH8/fbzF3/R+l7WuV5d+UMVXQnNOZf/YusvLLRhpuTeTpnsAQp872seLEW+czjuG
         3I0A==
X-Forwarded-Encrypted: i=1; AJvYcCXSdZQo0LQcFNTSQrv1Yc9khEjwkh/15kj/k57snojkpUwSZ/mjULY1G/a/fRKZNxAHro7oioQUMuE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6oBBJlSZVm+btVTlVNkEOmonnfmp10QDbXxVq0Mya8phADQPC
	9wxiJj47xW1jyav5VxAQHUrGRB49+3Ki2xtaFimb6KGrIfCM08RsSNsRYmVoFw==
X-Google-Smtp-Source: AGHT+IGDSTo5nyioBULbzM/R/TnlvCqxO8e0BBI4gpdie0yfhyG2hEmigQCFpK5rgIC4wI3icJbkCg==
X-Received: by 2002:a05:6512:33d3:b0:539:944c:1543 with SMTP id 2adb3069b0e04-539944c1822mr3809625e87.33.1727772758900;
        Tue, 01 Oct 2024 01:52:38 -0700 (PDT)
Message-ID: <b2a8b468-5745-4f58-bb86-721ea055c1b1@suse.com>
Date: Tue, 1 Oct 2024 10:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-3-frediano.ziglio@cloud.com>
 <e17b2afc-3647-4472-9d37-1510b40ff23d@suse.com>
 <CACHz=ZhtYik3p4z2mc1PYG9M68Mwap68_DdoE7MWksW0VW+BTw@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhtYik3p4z2mc1PYG9M68Mwap68_DdoE7MWksW0VW+BTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.10.2024 10:35, Frediano Ziglio wrote:
> On Mon, Sep 30, 2024 at 4:51 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.09.2024 11:21, Frediano Ziglio wrote:
>>> @@ -243,7 +234,7 @@ __efi64_mb2_start:
>>>          /*
>>>           * Initialize BSS (no nasty surprises!).
>>>           * It must be done earlier than in BIOS case
>>> -         * because efi_multiboot2() touches it.
>>> +         * because efi_multiboot2_prelude() touches it.
>>>           */
>>>          mov     %eax, %edx
>>
>> I think this MOV wants to gain a comment, now that ...
>>
>>>          lea     __bss_start(%rip), %edi
>>> @@ -252,36 +243,30 @@ __efi64_mb2_start:
>>>          shr     $3, %ecx
>>>          xor     %eax, %eax
>>>          rep stosq
>>> -        mov     %edx, %eax
>>
>> ... this one's going away.
>>
> 
> What about
> 
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 89b5e2af88..6fa6ea93e5 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -231,12 +231,14 @@ __efi64_mb2_start:
>          */
>         and     $~15, %rsp
> 
> +       /* Move away magic number, we need it later but we need to use %eax */
> +        mov     %eax, %edx
> +
>         /*
>          * Initialize BSS (no nasty surprises!).
>          * It must be done earlier than in BIOS case
>          * because efi_multiboot2_prelude() touches it.
>          */
> -        mov     %eax, %edx
>         lea     __bss_start(%rip), %edi
>         lea     __bss_end(%rip), %ecx
>         sub     %edi, %ecx
> 
> ??

Fine with me. Maybe s/Move away/Save"?

Jan

