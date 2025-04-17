Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE8A921A0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958123.1351074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RCR-00048F-VJ; Thu, 17 Apr 2025 15:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958123.1351074; Thu, 17 Apr 2025 15:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RCR-00045N-SF; Thu, 17 Apr 2025 15:30:47 +0000
Received: by outflank-mailman (input) for mailman id 958123;
 Thu, 17 Apr 2025 15:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5RCQ-00043Z-Cd
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:30:46 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed76e83b-1ba0-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:30:44 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so794298f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:30:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2af1717sm363866d6.15.2025.04.17.08.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:30:43 -0700 (PDT)
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
X-Inumbo-ID: ed76e83b-1ba0-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744903844; x=1745508644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AcJwV7f16+YtGv1E2WpBt02GJdjfNE+GJk7w/le79ik=;
        b=RG/D+SgdHUptihN8dQDmc0Dxs8PkgzcTRxo91+nx+WMO77mgCYYUgBmYvIlL4gruCP
         A6DFcTmGIBHNFnvdWbv1mdnrvYresyNv4mqUn/CyZpKYwfsyurLu5flhGD6xqfI+iTjk
         7cQs+QBjsTMuzjP4ebZpHnwDnbCYvl6RdihHB6LGa9UK91E3pB+2JJDY2umR7mab+uOq
         iI5lPpskuzhN9hnp4ruXAmXXH0zxmOrRiN+n1mOH5Xa5mb/RHrHGxYTFrMqm8yMw4Oow
         BkkekC/oWtnEuHbdK7FSOJ1qEo4/Jpv8iog1GgISJb8PSB+19B18GRagk9v02mXcHR7H
         Fr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903844; x=1745508644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcJwV7f16+YtGv1E2WpBt02GJdjfNE+GJk7w/le79ik=;
        b=Y4gH/Bu8YnufhU36FOl2OlkLCH5rp88tvJYf1f6fojqoe7n6RxhlbmJbmmJaadBmfh
         l+PTFI46azsQgoEg+4u9/jiy5dacNxBRPcNh+Er9ht1spd5yx1jVtsf0NXDEGKoSJ1HR
         9rSgj9XfpngBkVrjeHU1Dy3jImKuwQIZXKqFcCvpA9f2qwzjK+6QR7VDY90rBS2Ki+0a
         00vRWvSheKvXZ/24D79lvCffr0/GzLnqrenR9L7aIoHFiX8RtNKXORxvvNUUznSfSJeF
         /kmw9I9fRFym38ocz7nXqr8mSb46uVS5Cf1PMzDoOre4Zm9NcZoIDzibEpjfZkU/3ogn
         jPxw==
X-Forwarded-Encrypted: i=1; AJvYcCWwHl8UvljluKzPoOqMgOVAbFwucw72iHY/zswY0FiTaAUtHAyIy/eldu6FJQArlGQi9+iStPKxGCI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6/hUfKuuArJyZNfJ7INUl5zzyus326fkpERb7FTTdIrkxfeTQ
	b0hR+fRyHOcd6PRPZzFwc05XDFSnTYIqbQizmZVSDw/+5K0VNQPyJqqtozUSmQ==
X-Gm-Gg: ASbGncu9j6FjrAXj2l8GHW4BN1DTALn5XslRomz3E1/gaiwpncqt5q7kWdH05FH4N33
	O2FSbPBNn64ZLIKweyqsRIaUFN/oSfssjlsEEdIdjhHSDYqpchf2ud12zC0yQqH8Nyb2PGPBN3/
	MiAzzwZqKGFOQ0Ktm4jYaKFSH9VAFWggam8ACI6/rq731c4NdYN4qzjhn+aBi6ubQRNyZlf2yVF
	1QSE95/qWwrbjF4s70muBg2V6SeXp5mUElNlFYILT+/BjfNaerCrU96b7gARd8NfmF6NO6uOhTM
	whDrMF04tETtD2SAgQxnydmISd8tAkjIe0fcuSxp+7hlyMuqs3UT0uWaBJObbL1Blh/vMwfcjFw
	dSEu1Bt0DSG7WqKhOGRvTDGXo4vJzVu7fA2zf
X-Google-Smtp-Source: AGHT+IGl7cvR57f0Sk1CNJkIckrjpnwA3PCZvbbYPQRpX7K9U++zKZjjsEQyuyQqXsgh7DWV9S/GmQ==
X-Received: by 2002:a05:6000:1a88:b0:39e:dd1e:f325 with SMTP id ffacd0b85a97d-39ee5b3623cmr5067857f8f.31.1744903843715;
        Thu, 17 Apr 2025 08:30:43 -0700 (PDT)
Message-ID: <2795e63a-fc37-4ab9-8348-ab2f609f1734@suse.com>
Date: Thu, 17 Apr 2025 17:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/14] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <1d023045be49ae93d41d552f9c9a79972fa4e84b.1744126720.git.oleksii.kurochko@gmail.com>
 <a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com>
 <a54ef262-92fc-453d-898e-70636c2918fd@gmail.com>
 <f2da2ec5-e457-4d2c-b2fe-49c7356760e1@suse.com>
 <fd24bee3-bbbd-4701-a34c-08b64ea0af5a@gmail.com>
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
In-Reply-To: <fd24bee3-bbbd-4701-a34c-08b64ea0af5a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2025 17:21, Oleksii Kurochko wrote:
> 
> On 4/16/25 12:30 PM, Jan Beulich wrote:
>> On 16.04.2025 12:15, Oleksii Kurochko wrote:
>>> On 4/14/25 12:04 PM, Jan Beulich wrote:
>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>>>>> +    if ( !rc )
>>>>> +        panic("%s: IDC mode not supported\n", node->full_name);
>>>>> +
>>>>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>>>>> +    if ( !imsic_node )
>>>>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>>>>> +
>>>>> +    /* check imsic mode */
>>>>> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
>>>>> +                                    irq_range, ARRAY_SIZE(irq_range));
>>>>> +    if ( rc && (rc != -EOVERFLOW) )
>>>>> +        panic("%s: unable to find interrupt-extended in %s node\n",
>>>>> +               node->full_name, imsic_node->full_name);
>>>> Why exactly is EOVERFLOW tolerable here?
>>> QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
>>> For the hypervisor, we don’t really care about the M-mode IMSIC node — we're only
>>> interested in the S-mode IMSIC node.
>>>
>>> The IMSIC node includes this information in the|"interrupts-extended"| property,
>>> which has the following format:
>>>     interrupt-extended = {<interrupt-controller-phandle>, <machine_mode>},...
>>> The number of such|<phandle, mode>| pairs depends on the number of CPUs the platform has.
>>>
>>> For our purposes, to determine whether the IMSIC node corresponds to M-mode or not, it’s sufficient to read only the first pair and check the mode like this:
>>>
>>>     if ( irq_range[1] == IRQ_M_EXT )
>>>
>>> Thereby dt_property_read_u32_array() will return -EOVERFLOW in the case when a platfrom
>>> has more then one CPU as we passed irq_range[2] as an argument but the amount of values
>>> in "interrupts-extended" property will be (2 * CPUS_NUM).
>>>
>>> I can update the comment above dt_property_read_u32_array() for more clearness.
>> Yet my question remains: Why would it be okay to ignore the remaining entries,
>> and hence accept -EOVERFLOW as kind-of-success?
> 
> Because for other entries the IMSIC mode will be the same and the difference will be only in
> interrupt controller's phandle

And we can blindly take this for granted? Would you mind extending the
comment that's there to include this aspect?

Jan

> which we don't care about in this function and cares only about
> in imisic_init(), look at usage of imsic_get_parent_hartid().


