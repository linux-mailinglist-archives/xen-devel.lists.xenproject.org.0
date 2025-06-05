Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2798ACED02
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 11:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006467.1385640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN772-0001JC-5q; Thu, 05 Jun 2025 09:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006467.1385640; Thu, 05 Jun 2025 09:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN772-0001HM-31; Thu, 05 Jun 2025 09:42:16 +0000
Received: by outflank-mailman (input) for mailman id 1006467;
 Thu, 05 Jun 2025 09:42:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN771-0001HG-85
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 09:42:15 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c208084-41f1-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 11:42:13 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so8440815e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 02:42:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-235eaa077f6sm17109175ad.5.2025.06.05.02.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 02:42:12 -0700 (PDT)
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
X-Inumbo-ID: 5c208084-41f1-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749116533; x=1749721333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ntSLMx1nUW8tpL1OqL7zyGH1j/TNe629bJ4/b5U60So=;
        b=F72rdsA2kl6zh3x5MaN7Nk7g0Ad0k0OLcIO1k0GIgO8JpEjp3EDek2rJBdRmu0pw0e
         x1cNK1XfgkrSeyV0mDv67Nt9PqCI8En1+e5YJhPOjLbSU4UaJORmrNdJnGXRYNI3GD7V
         EU1wTyYg3t7dqoyxKZ+2XhgI6pX8bo5CjyeEENuIU5VksqILjReQFlkYcoH7QBkY10yU
         T0lJE6gpexH+DkGip8THVBRaY1cwPP+jABdZEPtSE5v9zDLAR3VjVnxXYw+ZRDQIrDU1
         Qp3SJ33SS1c1xrwD5LJm5DDUKh1W6IFJ7URKjF1U54FsunJiIe8DVCf4h04lIzAlwt+v
         fLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116533; x=1749721333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntSLMx1nUW8tpL1OqL7zyGH1j/TNe629bJ4/b5U60So=;
        b=nfascjF14ttvm795Sl+laG0itW4oQ5MU+RkT7J4I/2oTQoVbVbU8irqFc9YD0JOVRu
         7u2J0kquY6nVqYfU4H9gJgODno7hEcYaG8e7QxEW+yWQfwmEJoP6UPARsv0GHd9r4rFf
         fplB60YMxryc6EeOFV4RsUZRVTW+D6ikN3xE3RSjqfcahaY1i3vLfJfxzE5u27JiAd21
         tlrAOQR6ANP882Lm8MsWt0YHT4HVMGo+Zn4foQ/ZhmZoY2kORG7aDUk2Oah9aSUZys4a
         1RYiMsqRAY0Ihd+xvfK93ijEKIjkB2KOYv9rXhBAQAMSMjCnx2ZF1+TIk8kI0jbw+cKy
         3ANg==
X-Forwarded-Encrypted: i=1; AJvYcCWIkkn0ZjjSwvN5oA5rE0R1DzyfxN28jSqjWWzdZrzQuRYWtO6nMgEhEU2XdBFBgbpqX3yeIIMN/0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsKNP5ye04/cqu3AVbM51xGznEW985SGrSsTJHi44zNnwzFKzE
	LBItrvXz+VstPR1k1XHlLMmWIcPHp+/lTrGJvGVkLKij+qLbft5nBKJlkbgTIHcGvw==
X-Gm-Gg: ASbGnctdP4jhkB9AwFk8IhnNAbO/jileaZbLlhjYWLQBBaIjABE2Ho1RJzm4QerLUM9
	N+9sneerkA6JdE2utVUC8x5idxECJm91Ks4Up9g08E80Fi99P4hxg74BfJ+/oQ+VzBpRFz8HfHY
	aJNC3Os3zBcB+GalL/eKOLfrpO7AtVYGpecjrZqZD8aN20EzNnIaJnCDRCyynulta9THwmUngGK
	zj53MGbYJz/0n6Z7mgFr41RVpC+OEKs6ii1ND/fi/mQQF7YTdXLDcBFWYcYAbB4+P7bVir51GUt
	RtlgD91bVtCleKgNU4nJOe/xu7bcAKLsqjTu7VZ8oxgG0Nkbk/QuFHQfdraulcaNp8Bm6EmS0ow
	XnOGAyTqOa6djnRAdvfT9NV18eWD4W31ARM6t
X-Google-Smtp-Source: AGHT+IHht2zlEwR0EvyXqPNpZXtPJCLw1XL5ERnbZ2v2wxMXB3Pqo/kFWcG0GtFQJII5ofUVb+HpuQ==
X-Received: by 2002:a05:6000:2888:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a51d90470emr5526554f8f.15.1749116533143;
        Thu, 05 Jun 2025 02:42:13 -0700 (PDT)
Message-ID: <2de0a33e-75ff-449c-a0db-6a2279b9e484@suse.com>
Date: Thu, 5 Jun 2025 11:42:01 +0200
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
 <8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com>
 <d3dd9f90-4bef-4f75-b36c-0a5834a5a0ae@gmail.com>
 <f0166994-be40-4210-b110-554d46535c85@suse.com>
 <e5434c6d-599c-4b7b-b67a-43ae7830eb0c@gmail.com>
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
In-Reply-To: <e5434c6d-599c-4b7b-b67a-43ae7830eb0c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 11:13, Oleksii Kurochko wrote:
> 
> On 6/5/25 8:50 AM, Jan Beulich wrote:
>> On 04.06.2025 17:36, Oleksii Kurochko wrote:
>>> On 6/2/25 12:21 PM, Jan Beulich wrote:
>>>> On 26.05.2025 20:44, Oleksii Kurochko wrote:
>>>>> On 5/22/25 4:46 PM, Jan Beulich wrote:
>>>>>> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>>>>>>> +    /* Check MMIO register sets */
>>>>>>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>>>>>>> +    {
>>>>>>> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
>>>>>>> +        {
>>>>>>> +            rc = -ENOMEM;
>>>>>>> +            goto imsic_init_err;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
>>>>>>> +                                   &imsic_cfg.mmios[i].size);
>>>>>>> +        if ( rc )
>>>>>>> +        {
>>>>>>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>>>>>>> +                   node->name, i);
>>>>>>> +            goto imsic_init_err;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        base_addr = imsic_cfg.mmios[i].base_addr;
>>>>>>> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>>>>>>> +                           imsic_cfg.hart_index_bits +
>>>>>>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>>>>>>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>>>>>>> +                       imsic_cfg.group_index_shift);
>>>>>>> +        if ( base_addr != imsic_cfg.base_addr )
>>>>>>> +        {
>>>>>>> +            rc = -EINVAL;
>>>>>>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>>>>>>> +                   node->name, i);
>>>>>>> +            goto imsic_init_err;
>>>>>>> +        }
>>>>>> Maybe just for my own understanding: There's no similar check for the
>>>>>> sizes to match / be consistent wanted / needed?
>>>>> If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
>>>>> provide, IMO.
>>>>> So I don't what is possible range for imsic_cfg.mmios[i].size.
>>>> Well, all I can say is that's it feels odd that you sanity check base_addr
>>>> but permit effectively any size.
>>> Okay, I think I have two ideas how to check the size:
>>> 1. Based on guest bits from IMSIC's DT node. QEMU calculates a size as:
>>>       for (socket = 0; socket < socket_count; socket++) {
>>>           imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>>>           imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
>>>                        s->soc[socket].num_harts;
>>>       ...
>>>      where:
>>>        #define IMSIC_MMIO_PAGE_SHIFT          12
>>>        #define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
>>>        
>>>        #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
>>>                (1U << (__guest_bits))
>>>        #define IMSIC_HART_SIZE(__guest_bits)                 \
>>>                (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
>>>
>>> 2. Just take a theoretical maximum for S-mode IMSIC's node:
>>>       16,384 * 64 1(S-mode interrupt file) + 63(max guest interrupt files)) * 4 KiB
>>>      Where,
>>>        16,384 - maximum possible amount of harts according to AIA spec
>>>        64 - a maximum amount of possible interrupt file for S-mode IMSIC node:
>>>             1 - S interupt file + 63 guest interrupt files.
>>>        4 Kib - a maximum size of one interrupt file.
>>>
>>> Which option is preferred?
>> I would have said 2, if your outline used "actual" rather than "maximum" values.
> 
> In option 2 maximum possible values are used. If we want to use "actual" values then
> the option 1 should be used.

Actually I was wrong with request "actual" uniformly. It's only the hart count where
I meant to ask for that. For interrupts we should allow the maximum possible unless
we already know their count.

Jan

