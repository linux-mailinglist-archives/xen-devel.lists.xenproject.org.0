Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGCXCwfly2l7MQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:15:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3F36B86E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269091.1558233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ao4-0001OK-GW; Tue, 31 Mar 2026 15:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269091.1558233; Tue, 31 Mar 2026 15:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ao4-0001MA-CZ; Tue, 31 Mar 2026 15:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1269091;
 Tue, 31 Mar 2026 15:15:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7ao2-0001Lw-S9
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:15:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ao2-002KOX-7w
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:15:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cbe4f5-bab6-0a2a0a5309dd-0a2a4501bf2a-6
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:15:01 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cbe4f5-6fc9-0a2a45010019-d1558034bd3e-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:15:01 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-486ff201041so57717845e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:15:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a5e2sm45040965e9.1.2026.03.31.08.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 08:15:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774970101; x=1775574901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hp8XVEWkPpTzt0Gvt4iokSAkU0s73GWeOyHroLjtjEI=;
        b=Hx/j0uSmdcN85TJKzKyordFGMEOxnupUhf5qATrqpuz6yJipaAOIqne9EcxuZYW4ZL
         08BIe+izWhS/UlbALgjM1i8k+5V1tWovVBLHGejjV4efmFYUX2vrmIuhUi5NDBxUdtGH
         sb4n10jV6AhUoY08KJ8BBMpeQ2wGKrskWGqxsiCzIdOuVQ4hHr8L/aaq2VwbI7YXC8C3
         H9aFLvrzovVJBuIEAmSuwnG5k0PomhkLC2Xxvodcclzwh/65TFyvcx2NefDnOSp0fRtG
         CBmJjik3oFkpotUuQ7DZ0OHGU4opzo9VLJe9+J8HlX0lYIOMZX+19VgB+nVbBhshmu1W
         Bd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970101; x=1775574901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hp8XVEWkPpTzt0Gvt4iokSAkU0s73GWeOyHroLjtjEI=;
        b=nJoPCslHHKGu59X0RwsY95+yFo2aql93PAao6aMU0vtS7BtfNzRcaEhebDvD/RMZ+O
         TN/tde2ry9cDBrqD82/xXKjNn3s9w1Ou7141yFD8yEezHo9Ffoi1727J2qWgH/Mb6HHp
         iXHB5RUMMj2Ugk978LJp4AmAyT63SpySplE+jy4gfO1fnenFGOPtuP/3f/+Ohjs4AxoX
         ZnXArRT/rLEsBkzvb0hzulCTTDcyIXOAC4FYc90icGuEkr4rowSG7w3ypobGajMLrNLW
         AcHuGdhIF9alUhjL+L7Gq2DObvnjNFWT7ooIC74Mgb7eNULH3dxBb1bgN0WV9kt3/N3A
         hMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtn3yHuJLAsiBlS28kVGxLuxUTybW3FfVyNKC9XDjMRFBaU8HY2dxo/7rNK55QoqolK9CkHr/4xvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxXRQVWz9QWs95e3RIDXsvAB4iy/gjxOwU18ine/b0PMrG6hAH
	ZxbjRTmQv+wGPjZ/bm71NV/01A8ANbxS46ugBlbtmI5cUQen7dIlBNkFCOtKyqDOGA==
X-Gm-Gg: ATEYQzwXBs+73+lVD5QIhQXz53Ff0QwLWWi+UXlgu1mdSPeqlFqGfg+mq16GrM+xlo9
	SMt9rgVpEJCr4VOG2jTEJjbjdnzJw7K7BbvlJXuYeLW1Ow4vI6QDSW+HSfM3hWYOtwwpIDlCcEL
	16tdX88R8Nyj6awVuohY0XWIk7UmIk/fPgIc9V/hVg76vL/O51PkRMpFkGvinbamk2pBaY1nz1v
	XO911gs8vvP6YcThVRN7ZPvhi0P4I8sj63op0ENeVHnQ7c7aDh5AsYN8kHs+fT8JDn44w9Dp0Ki
	UFTKjWMbzl/alyERy25ERB5wSmUkRsx72pcK3M54LXbP7xqip+7b2Yx1sztQUkGrH1nYTfE6kJA
	RTVSEHV1/tIzmP33m0hIUSuLFvdYCj5EzwQ2EZSkmMi5xYy9HAf6N+pYgKFDE54M2+/fT/qPHq8
	HU5oDG9GuTBMMrP/b3ZgFD93sogM9q1+13Ubns84IsbdKItxa9g0MLMAQ61T0s6TLJ+uqCTM3JF
	LWzcykOpA2CLng=
X-Received: by 2002:a05:600c:3f0a:b0:485:4eaf:eb54 with SMTP id 5b1f17b1804b1-48727ec733dmr276022065e9.20.1774970101165;
        Tue, 31 Mar 2026 08:15:01 -0700 (PDT)
Message-ID: <57f01614-e742-4f2b-be9f-6687ea0b79e5@suse.com>
Date: Tue, 31 Mar 2026 17:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] xen/riscv: add kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <1688c6e0e616b2d1bc1a9050d66f007e0e65d3b2.1774281309.git.oleksii.kurochko@gmail.com>
 <0a28eda9-a1c5-4e12-907e-b85f8972881c@suse.com>
 <05b1bc67-bbed-412e-881e-a3fb2c2d873b@gmail.com>
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
In-Reply-To: <05b1bc67-bbed-412e-881e-a3fb2c2d873b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1774970101-178FC185-6303B5F4/0/0
X-purgate-type: clean
X-purgate-size: 3284
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7CC3F36B86E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 16:30, Oleksii Kurochko wrote:
> On 3/30/26 4:47 PM, Jan Beulich wrote:
>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/config.h
>>> +++ b/xen/arch/riscv/include/asm/config.h
>>> @@ -151,6 +151,19 @@
>>>   extern unsigned long phys_offset; /* = load_start - XEN_VIRT_START */
>>>   #endif
>>>   
>>> +/*
>>> + * KERNEL_LOAD_ADDR_ALIGNMENT is defined based on paragraph of
>>> + * "Kernel location" of boot.rst:
>>> + * https://docs.kernel.org/arch/riscv/boot.html#kernel-location
>>> + */
>>> +#if defined(CONFIG_RISCV_32)
>>> +#define KERNEL_LOAD_ADDR_ALIGNMENT MB(4)
>>> +#elif defined(CONFIG_RISCV_64)
>>> +#define KERNEL_LOAD_ADDR_ALIGNMENT MB(2)
>>> +#else
>>> +#error "Define KERNEL_LOAD_ADDR_ALIGNMENT"
>>> +#endif
>>
>> But that's Linux-specific. You want to be able to loader other OS kernels,
>> I suppose? The needed alignment should be a property of the kernel image,
>> suitably conveyed to the loader.
> 
> Then likely some updates will be needed...
> 
>>
>> Is Arm similarly capable of loading only Linux images? What about in
>> particular XTF?
> 
> ... they are pretend as they are Linux kernel zImage:
> 
> https://gitlab.com/xen-project/fusa/xtf/-/commit/dec72d83291d6782b3f41df66987c8a25eac422f#line_9f6eadcd7_A42
> 
> and in the case of XTF:
>      /* Magic number used to identify this is an ARM Linux zImage */
>      .word   ZIMAGE_MAGIC_NUMBER
>      /* The address the zImage starts at (0 = relocatable) */
>      .word   0
>      /* The address the zImage ends at */
>      .word   (_end - _start)
> 
> zImage.start is set to 0 so KERNEL_LOAD_ADDR_ALIGNMENT won't be applied 
> and load address from DTS's kernel node will be taken.
> 
> Other example in mind I have it is Zephyr OS, and the also use Image 
> protocol by enabling CONFIG_AARCH64_IMAGE_HEADER. So Xen can boot it too.

ISTR Andrew saying that he'd really like to be able to use plain ELF.
Anyway, if Linux Image is clearly stated as a only thing presently
supported, that's perhaps okay for the time being.

>>> +static void __init kernel_image_load(struct kernel_info *info)
>>> +{
>>> +    int rc;
>>> +    paddr_t load_addr = kernel_image_place(info);
>>> +    paddr_t paddr = info->image.kernel_addr;
>>> +    paddr_t len = info->image.len;
>>> +    void *kernel;
>>> +
>>> +    info->entry = load_addr;
>>
>> What if this is outside of memory bank 0 (as is possible when
>> info->image.start is non-zero).
> 
> It will be an issue and panic() will occur in place_modules().

Will it? I just looked again, and I can't help thinking that it won't.

>>> +    /* Currently there is no length in the header, so just use the size */
>>> +    start = 0;
>>> +    end = size;
>>
>> What's image_size then?
> 
> The comment is incorrect, the length is present in the header, but it is 
> effective length which isn't equal to the size of binary and is actually 
> bigger then binary size.
> 
> So here we want to use 'size' as it is a size of binary itself.

What is "effective length"? That sounds a little like e.g. .bss extending
past the (file) image, yet such would nee taking into account for allocation
(but not for reading in / copying over).

Jan

