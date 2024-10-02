Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00E98D2D8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 14:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808747.1220747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svyD2-0002qu-Kv; Wed, 02 Oct 2024 12:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808747.1220747; Wed, 02 Oct 2024 12:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svyD2-0002o2-IJ; Wed, 02 Oct 2024 12:12:00 +0000
Received: by outflank-mailman (input) for mailman id 808747;
 Wed, 02 Oct 2024 12:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svyD0-0002nw-U6
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 12:11:58 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 859d7f64-80b7-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 14:11:58 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53995380bb3so3835148e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 05:11:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245e9efsm7539974a12.58.2024.10.02.05.11.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 05:11:57 -0700 (PDT)
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
X-Inumbo-ID: 859d7f64-80b7-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727871117; x=1728475917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DOKb6zVDn/0VH4+KbpW87lTh/3r6c/GObL88XQjIbzs=;
        b=P3Yfp/xrGR5cbYxU+Gzk7R549XJPidV8I0m2+p0mBAqrk/NSrghq85TXJsCC0kOCe3
         wgVpbGzVD3nE9H2961Xk9CTLDaHnzto+LINCAKkjOSEU1sY0BsfKdBL8bBk79GktG/dn
         7j6pOr8i5TGABXwyGVyVU3str+TvXhZF7JSZCnH7668z7x57O5EI5vyXfsASQhObd8yi
         3hJ+0wKREmjiqJ2e5p1NzRMOjATmJQoE+jKjaIoAa4QLPoVaAvf3/oihJC07n4Dt3O2T
         DHCVZ1g7aOJXw+fgQ5fPGijnQIcNzHEPPdh8norlVSmr33uOAH1JwOHGq+0vezRqnbXf
         hRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727871117; x=1728475917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOKb6zVDn/0VH4+KbpW87lTh/3r6c/GObL88XQjIbzs=;
        b=GTUNM8jzPjtHckOQZrBH/enMHmw1PiB8L/ZM88yZ5eNOxuWI6IyfP5AFjHMkAIVMFa
         FFNq6p6jBUPtlmkaFsjOdu7OS2St3M/vBECrTgssFFxr1JEaLeUJksGaKoN+a1k+Dk9q
         CACtnlPJAr3aJGvXLpL5wc50G0ULo7fZIWZ5HfOF/QEyGb3y/j1E8kvObJOpM/s8YKLS
         tQG79woTwvREIfsv/GLF2DhYY+8dpft1ycRo+1LGi8tPuAi3N10NYH5KeU8YZUmgfJr9
         9y8Gu+qBKeF/U7KP0R0+O1M9CkDD6XluoLd0AHF4IkUTC6jfoT6FLQ0NGT+SjBeibpvM
         b2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCTyJNVNPf2LvkLNLxmGKulqOI+cQVqjcEsL4HYZ69oiPq6OeNcE+hhwXjPWnogu2G/DPVrcTocK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZOpzMUiCF0WYWxTesWq5T2UeCSlSaZ6k+s3KkP7RaaDPkcpjJ
	a0K45yN/X8Yt2xD/klRmtf7Fw8qUOJLs5BSHBOQqXP3hgKj75/ppW7ti0ABMfw==
X-Google-Smtp-Source: AGHT+IHIgXoNl9eAE+xXw2Lbpvd2QKnez2zgZHCakzLxuK7hN1DxtPCZzvib/32St1X9VkwpSrTFsQ==
X-Received: by 2002:a05:6512:2387:b0:530:c239:6fad with SMTP id 2adb3069b0e04-539a05fffc0mr1789223e87.0.1727871117518;
        Wed, 02 Oct 2024 05:11:57 -0700 (PDT)
Message-ID: <1bd67367-0928-4f16-958c-f45612689346@suse.com>
Date: Wed, 2 Oct 2024 14:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: register Xen's load address as a boot
 module
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
 <2bd3589f322d30e93d81d091ca64439048c068fc.1727708665.git.oleksii.kurochko@gmail.com>
 <178b61bc-d3e5-4c9d-a8c0-88363911bc8f@suse.com>
 <418443ea4017c401d944971898cb298ef2f826d6.camel@gmail.com>
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
In-Reply-To: <418443ea4017c401d944971898cb298ef2f826d6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.10.2024 13:25, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-10-01 at 17:49 +0200, Jan Beulich wrote:
>> On 30.09.2024 17:08, Oleksii Kurochko wrote:
>>> @@ -26,6 +27,8 @@ unsigned char __initdata
>>> cpu0_boot_stack[STACK_SIZE]
>>>  void __init noreturn start_xen(unsigned long bootcpu_id,
>>>                                 paddr_t dtb_addr)
>>>  {
>>> +    struct bootmodule *xen_bootmodule;
>>
>> With just the uses below this can be pointer-to-const. Question of
>> course
>> is whether you already know of further uses.
> It could be dropped as it is used only for BUG_ON(!xen_bootmodule) as
> it looks to me a little bit better then:
>     BUG_ON(!add_boot_module(BOOTMOD_XEN, virt_to_maddr(_start),
>                             (_end - _start), false));

Yet that's undesirable for other reasons. Did you consider

    if ( !add_boot_module(BOOTMOD_XEN, virt_to_maddr(_start),
                          _end - _start, false) )
        BUG();

? Maybe panic() would be even better for cases like this one.

Jan

