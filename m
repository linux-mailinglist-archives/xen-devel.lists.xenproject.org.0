Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F7EA2EB98
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 12:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884796.1294547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSD8-0007w5-S7; Mon, 10 Feb 2025 11:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884796.1294547; Mon, 10 Feb 2025 11:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thSD8-0007t1-Od; Mon, 10 Feb 2025 11:44:22 +0000
Received: by outflank-mailman (input) for mailman id 884796;
 Mon, 10 Feb 2025 11:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thSD7-0007sv-2c
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 11:44:21 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ccc4cb9-e7a4-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 12:44:19 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab795ebaa02so459691366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 03:44:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab79378ee30sm620072566b.160.2025.02.10.03.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 03:44:18 -0800 (PST)
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
X-Inumbo-ID: 5ccc4cb9-e7a4-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739187858; x=1739792658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rbCVpM/V+2E6aumgI+TsRI514gKJWhu0eo9mz50ZaRI=;
        b=SzyiPJ7DXp4qZDcbQsZbEEyePh6ker8Z/FR31T6mCs/tVW/SfMyKHDOZkckgH7S0pa
         W85D5+LwsyIEriPOCttej8CZHRyg9ZvtEbyuNK7/mqtPqOoULezWq6SXynHMWMAlHHB1
         Ws6Vu1VWjs/+BiQgqC0xDxM3ryjC8zhR2fZpfmahMbaGBh2L72BPKuxcYz3DeuHf0GTl
         wHebH59f+TIQE5RkCif8Ahn2lEYYUVyaaw7Bl/ZRul6Jgpi1n57m5LA8CApLe2aadSf9
         JtgyOEWEAgXY+0lPxrucr8tYXZ/pvRQNZUwrlPB+qy9GlPtbSlkX5H+JWBnPPClFTPWG
         s4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187858; x=1739792658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbCVpM/V+2E6aumgI+TsRI514gKJWhu0eo9mz50ZaRI=;
        b=FZvb+xRgbOCPSJBkk4u1ApXuV2qqp2wFv77wyUTxDLngIfZWsLtg5DkwMOh+BJLn06
         aafvTG4f/edid4jqFy9va9R4wgMT++eNb5AgzRtJUyjBYTTzYCwJXdmIp7aNhZjXfHzB
         C+69/Jgwb2UmZSsHwxFBT/CAwmUhEQA8d6JJhjKviAat7HMpPKhUs2hOa0dX/cCwnrAM
         oj4kITBUSUvjhKnliZG6SeU9q4Hk3TheMWoBJk9AS9O82dYJxJRSQhjuCfyfF8zv/6AM
         0QSEUd3c/8QTcWv9HjqFGvW1jVyJ2lVDeisYsjVfwO/SW6T0t8/8DNLdRdzXJ4iK7E+g
         7Oug==
X-Forwarded-Encrypted: i=1; AJvYcCW2Wge07iWB6+ivXeldg7f0mfcApiHw1m78rPs8D6/35a1jRk6F4LIX1ldJI1MLNJkAXKAz/8W/oRw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxv8vDN4zE0Q/Mv68LfCp3XZdLH/B2cAOAyl0brmId16vdmAM7h
	ENSUvJx0F7dLBMAgiTZDWT91bL92Kg7pCmImK5CMZAWoDq92hKqH64hNElP5FA==
X-Gm-Gg: ASbGncszhqmBawNLiRTTMVR0mXpJBYDM+NBB+LT3+hOv3pSGC3YLOOT1L4s2SKFZjbq
	JYvUZdFsFtmMS2BNY6BFzKWisB/3RLvOW2/HuJAmDen5Gq9E2oOVYUA0KgKJZPCdLKriO+7OnSy
	/CcnIgKwMVbjqipyBRnMv6un9nS232nLUznjV2gJ7YFErkWEbzyjfRNEy72r5n6xzyn0FWF1ywD
	7wqwhiT+dPvp5pFyyM4Nkd4ByZS6U6bjz1eD+8Ci9Pl6H//c7Upmd8Pc3z9SqhW1jmfn15wp8ub
	RAYdRuviyW6d/yhq7f90vg43358/Onjm7IjH6EWtnWGYLree6vqhRIctqykv9VNvplhSzOtOCtA
	A
X-Google-Smtp-Source: AGHT+IGHJsQPrhPgSfrLDDU+XCKxk5EYeNX8MQ/6dtYhHB3Vx54Ed1IC7bgYPJIJawtzC7iaYLb1Wg==
X-Received: by 2002:a17:906:4fcf:b0:ab6:c4e0:2d18 with SMTP id a640c23a62f3a-ab789adb0camr1374335166b.16.1739187858453;
        Mon, 10 Feb 2025 03:44:18 -0800 (PST)
Message-ID: <93854890-d77f-401d-8470-ca7aa08f7921@suse.com>
Date: Mon, 10 Feb 2025 12:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <9950eff2f8344c5d658def7d2c6d7fc010607498.1739182214.git.mykyta_poturai@epam.com>
 <57a595e3-9b90-41e6-8116-94b77ccba615@suse.com>
 <5aa33643-2afd-46db-8855-1023482a4f60@epam.com>
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
In-Reply-To: <5aa33643-2afd-46db-8855-1023482a4f60@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2025 12:28, Mykyta Poturai wrote:
> On 10.02.25 12:56, Jan Beulich wrote:
>> On 10.02.2025 11:30, Mykyta Poturai wrote:
>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>
>>> Enable the use of IOMMU + PCI in dom0 without having to specify
>>> "pci-passthrough=yes".
>>
>> Why? It _is_ passing through, even if Dom0 is special.
> 
> Do you think it would be better to drop this completely and require
> pci-passthrough=yes for PCI to work in Dom0?

From an abstract perspective: Yes. I don't know any of the Arm background,
though.

>>> @@ -83,9 +84,9 @@ static int __init pci_init(void)
>>>   {
>>>       /*
>>>        * Enable PCI passthrough when has been enabled explicitly
>>> -     * (pci-passthrough=on).
>>> +     * (pci-passthrough=on) or IOMMU is present and enabled.
>>>        */
>>> -    if ( !pci_passthrough_enabled )
>>> +    if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>>>           return 0;
>>
>> I can't reasonably judge on this adjustment, but ...
>>
>>> --- a/xen/drivers/pci/physdev.c
>>> +++ b/xen/drivers/pci/physdev.c
>>> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>           struct pci_dev_info pdev_info;
>>>           nodeid_t node = NUMA_NO_NODE;
>>>   
>>> -        if ( !is_pci_passthrough_enabled() )
>>> +        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>>>               return -EOPNOTSUPP;
>>>   
>>>           ret = -EFAULT;
>>> @@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>       case PHYSDEVOP_pci_device_remove: {
>>>           struct physdev_pci_device dev;
>>>   
>>> -        if ( !is_pci_passthrough_enabled() )
>>> +        if ( !is_pci_passthrough_enabled() && !iommu_enabled )
>>>               return -EOPNOTSUPP;
>>>   
>>>           ret = -EFAULT;
>>
>> ... these two certainly look wrong to be made. If an Arm-specific adjustment
>> is needed (and can be justified), a per-arch hook may need introducing.
> 
> This should not affect x86 in any way if I'm not missing something, as
> !is_pci_passthrough_enabled() will always be false. Or are you concerned 
> about something else?

Indeed I am - the wrong look of it. Readers like me will have the immediate
impression of there being something fishy here.

Jan

