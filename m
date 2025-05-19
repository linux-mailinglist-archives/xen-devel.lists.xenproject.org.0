Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37807ABC74D
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 20:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990124.1374064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5Pj-0000IO-IJ; Mon, 19 May 2025 18:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990124.1374064; Mon, 19 May 2025 18:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5Pj-0000FI-FT; Mon, 19 May 2025 18:40:39 +0000
Received: by outflank-mailman (input) for mailman id 990124;
 Mon, 19 May 2025 18:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH5Pi-0000FC-TE
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 18:40:38 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c13794dd-34e0-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 20:40:36 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad52d9be53cso552518866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 11:40:36 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4420ccsm613841166b.110.2025.05.19.11.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 11:40:36 -0700 (PDT)
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
X-Inumbo-ID: c13794dd-34e0-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747680036; x=1748284836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3xJLKoGisEzELgLALhj8HI3qbKme4jRSwTX+rgaoSko=;
        b=Mjg4T1ZO/WxHOyJBdaefXvNqLgeTYqOzNB2OSmGaWP5+Z61hnrMxpweqQjfNfI0s2i
         0+euP0kEwsvlNhhyr+qZWqIb7t2CjRT+LCKNEivRffeihrktgs2Bchw8yesIUaaFAn5X
         sQlyzGHKeJ0fmIelWN6RR8pw1qy9WIYwPRFVSQndCx7+K2by/ziNxLq618QJ50z90SHO
         axFQ/utlz7v+QpZRuY30UXx+r3VRwh61Ff9ibnulohL+ahHg8Ocgl45GgdMmOzA2NYOX
         g63qksuEUucR7uM2deyKgqn04bxcY7uPDVzYd+gd+/f+m16qUVCKwPzDArbdq+4NwJYy
         02wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680036; x=1748284836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xJLKoGisEzELgLALhj8HI3qbKme4jRSwTX+rgaoSko=;
        b=mbc4w2IqkiNdDE9mrohQqPtZAsTrBb+cTs9k1bN2i/gRygpqXklFHGKmOQdR2+DBrs
         KPiKSdBIGS/E5Bh88nWyvbK7E9nFOsw9JDHfl7opinQcr9klN7RJ5G476lfTBYzuIpSC
         Jd4kF6hDwLTHy7j8KE+YFmovbc5Ru0mwnXWshwFSKbJ3u26k5CLoW1JVdJ908WPxbLgY
         2HGSnEwCDleOSHKUwC9xOIwEtqsbM7zOVDANqexZyxQidT3WLTmr0FEZOBzndlreV5rs
         Q57hxaTVCwfUINzYb13dUmUX3cDf1L0jFItEBSnIXSmZ7uzo04IVrJ525G0Y6mWKyUxB
         rbGg==
X-Forwarded-Encrypted: i=1; AJvYcCXnMbTOk4vnRHcvWjDYHFBYoI49KKe7GGzbhFdQvqNTzt+Y+qnh6xBGIBYQofs9u+lJo23P9CCu624=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwT/+bXPGtxsM1mimXe05O/B0YUitBG8REDOMRyc/o926G/8y80
	ev9sbID6QLGxEPga+pj1dES8Oba83lw6jOJH4gVbL3o21aGgFPXcSN8fUKFnEgHQsw==
X-Gm-Gg: ASbGncu8/Uyzis/xSTjNHDZ/WZME+N0hUImRKF+TZopznBsMyjXD3/onig8DaWbKcAT
	ZoHqBN3udWWh93gYZ6Ev2WgQyv4PE1CoIipHwXBK1ysCRXrn7qWKNOVsE7QK02MvkUKgiGwRiyd
	3pxAOBlyCzdipkdWBSY6GcWduqpZy2A6Fo2YBQpXiI9HZp9y52R+4r3IywclfH3Ns7loMS9XI9h
	UXvk1pBoeN1xmDlW5DxuWhx+sJC8JF98YxVcxt/EN9mXflrMOtAZpDEh3kp8mWV+uObe/Pkx75g
	+9SZRk5Tgma0pYqQcrulZhFM1hYOAdYkqxiOCsC8GCZxZ0mxHS0g9iLi5Vh27A==
X-Google-Smtp-Source: AGHT+IGaO5fvSDcdAOiqOQbSnPbQ3zTZunvU9ndj4O35x2M3xY7XO7mO1SE9trOWDqbEO3532zdqtg==
X-Received: by 2002:a17:906:c28d:b0:ad5:3648:e2e4 with SMTP id a640c23a62f3a-ad53648eab0mr955935666b.45.1747680036286;
        Mon, 19 May 2025 11:40:36 -0700 (PDT)
Message-ID: <1b012912-c90e-45ad-8411-a4ddc4b2c3dc@suse.com>
Date: Mon, 19 May 2025 20:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <9129b10432dfc7ff8ba451842204342171da7dc1.1746530883.git.oleksii.kurochko@gmail.com>
 <057fc2ce-d4d6-4e14-987d-bef6f909eaff@suse.com>
 <e06a00d9-7cbd-416e-8e1e-f3aaaedccf77@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e06a00d9-7cbd-416e-8e1e-f3aaaedccf77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 18:09, Oleksii Kurochko wrote:
> On 5/15/25 11:06 AM, Jan Beulich wrote:
>>> +    /* Set interrupt type and default priority for all interrupts */
>>> +    for ( i = 1; i <= aplic_info.num_irqs; i++ )
>>> +    {
>>> +        writel(0, &aplic.regs->sourcecfg[i - 1]);
>> What guarantees the loop to not run past the array's size?
> 
> riscv,aplic binding:
>    https://github.com/torvalds/linux/blob/a5806cd506af5a7c19bcd596e4708b5c464bfd21/Documentation/devicetree/bindings/interrupt-controller/riscv%2Caplic.yaml#L57
> Should I add an ASSERT() or panic() at the moment where num_irqs are
> initialized to double check a binding?

I may be paranoid, but I don't really trust anything coming from DT. Hence
yes, just like you do in various other situations, perhaps best to panic()
if too large a value is read. Or, if that's feasible, simply cap at the
compiled-in count.

>>> +static int __init cf_check aplic_init(void)
>>> +{
>>> +    int rc;
>>> +    dt_phandle imsic_phandle;
>>> +    uint32_t irq_range[num_possible_cpus() * 2];
>> Are you going to have enough stack space when num_possible_cpus() is pretty
>> large?
> 
> When num_possible_cpus() will be pretty large then it will better to allocate irq_range[]
> dynamically.
> 
> Does it make sense to re-write now?

Well, this kind of runtime-sized stack allocation should go away anyway.
Plus you don't want to leave a trap like this in the code. Whether using
dynamic allocation is the choice to address those concerns you'll need
to judge.

>>> +    const struct dt_device_node *node = aplic_info.node;
>>> +
>>> +    /* Check for associated imsic node */
>>> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>>> +    if ( !rc )
>>> +        panic("%s: IDC mode not supported\n", node->full_name);
>>> +
>>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>>> +    if ( !imsic_node )
>>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>>> +
>>> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
>>> +                                    irq_range, ARRAY_SIZE(irq_range));
>>> +    if ( rc )
>>> +        panic("%s: unable to find interrupt-extended in %s node\n",
>>> +              __func__, imsic_node->full_name);
>>> +
>>> +    if ( irq_range[1] == IRQ_M_EXT )
>> How do you know the array has had 2 or ...
>>
>>> +        /* Machine mode imsic node, ignore this aplic node */
>>> +        return 0;
>>> +
>>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(irq_range); i += 2 )
>>> +    {
>>> +        if ( irq_range[i + 1] != irq_range[1] )
>>> +            panic("%s: mode[%d] != %d\n", __func__, i + 1, irq_range[1]);
>>> +    }
>> ... or even all of the slots populated? Anything not populated by the DT
>> function will still have the stack contents that had been left by earlier
>> call chains. (The loop also makes little sense to start from 0.)
> 
> Do you mean I asked allocated irq_range[8*2] but DT node has only irq_range[4*2]?
> Then it will be really an issue. And out-of-range access will occur in
> dt_property_read_variable_u32_array(). I need another way to check then...

I described the opposite situation (not the full array being populated),
but yes - both are a problem.

Jan

