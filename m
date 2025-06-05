Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95CDACEA77
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006303.1385500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4Sa-0005nG-9j; Thu, 05 Jun 2025 06:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006303.1385500; Thu, 05 Jun 2025 06:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4Sa-0005kJ-6u; Thu, 05 Jun 2025 06:52:20 +0000
Received: by outflank-mailman (input) for mailman id 1006303;
 Thu, 05 Jun 2025 06:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN4SY-0005k7-IS
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:52:18 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb0b5f2-41d9-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 08:52:17 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a3673e12c4so336004f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 23:52:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afff7e3bsm12542036b3a.175.2025.06.04.23.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 23:52:16 -0700 (PDT)
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
X-Inumbo-ID: 9eb0b5f2-41d9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749106337; x=1749711137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gPaSM6tyqkg4/i4DkBb0q2jQhcQsWsXzAM1RSQKJND8=;
        b=NYKKOmBdpOAA5qlIEkgdDg5RnTn7/vQCJTe5bakQ98OY4Zz0F1lgI4UqJdHRCyMPmD
         mq1imcvJB+/phRf+CrtmQZgNaQ48e/I1sx8xsq4sR9vSxJFGJzun0gm5i9pXQMHymfyK
         0RzuUDRdiNbjwd2bTyxj8G1qQV7y2kG5JB/7Cyc58+bWn0+srhHqXMmZpxulq6WyG18N
         we6VYirkL1XIQFhlhwTES+to6NJN8eQcFQWcnfRxdSURK/OudIoYIuSC/3Vqi8+W46KM
         BA7N9A1HLllGsI8WPwfZ+WbyDqcYYRLb/7SZ88WoiIRT4IPfY93A+VlM3SCArXJJ5ctA
         cHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749106337; x=1749711137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPaSM6tyqkg4/i4DkBb0q2jQhcQsWsXzAM1RSQKJND8=;
        b=CRazJa4v0v3RqRbgRODHDfPS5/yFg4K8qFeXCFQAL+9IGQHtfKduBes13OoThqjp7J
         Z6X9m6T3WeeWxEEKjNp2FQNHHoQMUh1REpwEqGUgDLXdGg4r7QZy5iqsBZW5tdFoNjBS
         4PgUkL+OY6ehAUqT5n1ZXDVAqo+L9HTuDPttgWLATf4zf4jnba4II5JCbVGEx104AaBK
         AVXbXrzTlBM3GzbB2czVC8GbrhLeoUQ1UxYqURDVKeWxHHgvaZNQrDOoShvka662hJGm
         SogAOAN3eUMJoOTy/FKCWrhpEHuDzRYMZxD9ooCNyAlgl+vrqzH4zNVTa91zw/sNGplo
         YBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+suGRnqgTK6tVr74mkjeqkBPfHH/QLoQI55SxNmxrbsfvYq9iDAvKk79mjb2E49vJqCxa+OMPLEc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjTB4xFBVGI7Ob6gPLt1H2f7njjc/gQ9Lv8MXzAeMJpTIoV0/z
	5xUXamQmF1CNXR0FrGKV2tmSUqF0xeYYgo9Z/hnOocOpLtowudq9Sfoe3uFuc201kA==
X-Gm-Gg: ASbGnctN7Ld+2ytuu6haPO4f+vVnh8nhZzhFrmmx5NrExFQdcLAtnLQT4d1T+sdQ1ir
	ijwsN2l0NBAt0UiWn6kGbjkMETQOqDNVozK+6RYGnk8D7SDd7DM80oBqEDm1vmfAfpL3RaguG4l
	km4U48AFJ066NveIeZ1aQeWB/nX2FCO5/jfBbKr4JAtEQsbp4Jh9awafzv/4xsnuq5eWmT5rg+a
	HLP+N6ZaN6DdqJx9G25snC5Cx1c7i+waQBTeh4YTTG0pqLPpW3c8p93F50tzk3LrfzzdVW8uQLF
	jKbLbDBPExENvRJ9+tJZiiaaAfMclycoaE+W0dH8gg9yV4m8+/E5426PsZ3OVIVHPzb3+hb2PS2
	Zq6SxMeTAEc+PpWddyO1Pf5WDsUm1RVrbHcST
X-Google-Smtp-Source: AGHT+IGN5A5YUUeiJjdZVFaaIdt1SS0nIhg8EonmQGtPkUca8kcDxFQ5BY7JWvLfrq9/4L6xgBTXHw==
X-Received: by 2002:a5d:64cd:0:b0:3a5:2dae:9718 with SMTP id ffacd0b85a97d-3a52dae9eadmr80749f8f.41.1749106336966;
        Wed, 04 Jun 2025 23:52:16 -0700 (PDT)
Message-ID: <7c487a6e-474b-417e-a120-2d097eb3d178@suse.com>
Date: Thu, 5 Jun 2025 08:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
 <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>
 <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>
 <84c9f65a-b278-4be4-b053-5bfa410f9a97@gmail.com>
 <9ab65452-497c-47b5-af18-92a7b2a86d9e@suse.com>
 <aa1e4b21-beae-4b60-8a24-b6227cb8027e@gmail.com>
 <85d6f812-784a-4959-a1e6-589ebac8887c@suse.com>
 <63d8882d-bd54-4cbd-8c48-24b296ce4a50@gmail.com>
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
In-Reply-To: <63d8882d-bd54-4cbd-8c48-24b296ce4a50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2025 17:41, Oleksii Kurochko wrote:
> 
> On 6/4/25 5:05 PM, Jan Beulich wrote:
>> On 04.06.2025 15:42, Oleksii Kurochko wrote:
>>> On 6/2/25 12:22 PM, Jan Beulich wrote:
>>>> On 27.05.2025 13:30, Oleksii Kurochko wrote:
>>>>> On 5/26/25 8:44 PM, Oleksii Kurochko wrote:
>>>>>>>> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
>>>>>>>> +                               &imsic_cfg.guest_index_bits) )
>>>>>>>> +        imsic_cfg.guest_index_bits = 0;
>>>>>>>> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
>>>>>>>> +    if ( tmp < imsic_cfg.guest_index_bits )
>>>>>>>> +    {
>>>>>>>> +        printk(XENLOG_ERR "%s: guest index bits too big\n",
>>>>>>>> +               dt_node_name(node));
>>>>>>>> +        rc = -ENOENT;
>>>>>>>> +        goto cleanup;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    /* Find number of HART index bits */
>>>>>>>> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>>>>>> +                               &imsic_cfg.hart_index_bits) )
>>>>>>>> +    {
>>>>>>>> +        /* Assume default value */
>>>>>>>> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
>>>>>>>> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>>>>> +            imsic_cfg.hart_index_bits++;
>>>>>>> Since fls() returns a 1-based bit number, isn't it rather that in the
>>>>>>> exact-power-of-2 case you'd need to subtract 1?
>>>>>> Agree, in this case, -1 should be taken into account.
>>>>> Hmm, it seems like in case of fls() returns a 1-based bit number there
>>>>> is not need for the check:
>>>>>     (2) if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
>>>>>
>>>>> We could do imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) (1) without
>>>>> checking *nr_parent_irqs is power-of-two or not, and then just leave the
>>>>> check (2).
>>>>> And with (1), the check (2) is only needed for the case *nr_parent_irqs=1, if
>>>>> I amn't mistaken something. And if I'm not mistaken, then probably it make
>>>>> sense to change (2) to if ( *nr_parent_irqs == 1 ) + some comment why this
>>>>> case is so special.
>>>>>
>>>>> Does it make sense?
>>>> Can't easily tell; I'd like to see the resulting code instead of the textual
>>>> description.
>>> Here is the code:
>>>       /* Find number of HART index bits */
>>>       if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
>>>                                  &imsic_cfg.hart_index_bits) )
>>>       {
>>>           /* Assume default value */
>>>           imsic_cfg.hart_index_bits = fls(*nr_parent_irqs - 1) +
>>>                                       (*nr_parent_irqs == 1);
>>>       }
>>>
>>> It seems like it covers all the cases.
>> *nr_parent_irqs		imsic_cfg.hart_index_bits
>> 	 1			1 (0 + 1)
>> 	 2			1
>> 	 3			2
>> 	 4			2
>> 	 5			3
>> 	 6			3
>>
>> IOW why the special casing of *nr_parent_irqs == 1?
> 
> If we don't have "... + (*nr_parent_irqs == 1)" then for the case when *nr_parent_irqs == 1,
> we will have imsic_cfg.hart_index_bits = fls(1-1) = fls(0) = 0 because:
>    #define arch_fls(x)     ((x) ? BITS_PER_INT - __builtin_clz(x) : 0)
> and imsic_cfg.hart_index_bits = 0 doesn't seem correct because I expect that if I have only
> 1 hart then at least 1 bit will be needed to point to it.

No, why? To pick 1 out of 1 you need no bits at all to represent.

Jan

