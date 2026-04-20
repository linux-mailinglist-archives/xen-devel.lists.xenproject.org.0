Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GfSKa1E5ml/twEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:22:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702E42E179
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 17:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286202.1567306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqRi-0002Ir-Gh; Mon, 20 Apr 2026 15:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286202.1567306; Mon, 20 Apr 2026 15:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEqRi-0002HO-Cm; Mon, 20 Apr 2026 15:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1286202;
 Mon, 20 Apr 2026 15:21:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wEqRh-0002HI-1M
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:21:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEqRf-00BPgs-3q
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 17:21:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64490-bab6-0a2a0a5309dd-0a2a4502bd6c-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:21:55 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e64492-af86-0a2a45020019-d155802cad5a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 17:21:55 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso9270655e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 08:21:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb74eed9sm129276795e9.1.2026.04.20.08.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 08:21:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1776698514; x=1777303314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ3gGohfaef4cQN+FiRgbIUV8k8h5Qo7CKVXFQnA5+A=;
        b=R7Alj1/BmUasWCekXa143sQiCQhjTOQZZfWCa46SnAhmwDe1IA+jGfHoAy41KGDewH
         gqb4WpqroDlGoLcEWrQ6y3Iakt80yeFi2mP8eUiN72RZDeFDWNLenCk/KZGGgZZxkJZs
         pJW1XTPSBjykvmDbBFvR6DOi6OjUfwLCvHPPxmYkzS/M5075ovZ22rxl1LTyBLRuQ/E1
         I3XghmPumFigbgWBJRAWekpY1JdlQA9TMGsGaX9y+PsPwA0CuJ4CVrWX5vQinHPFgkBV
         91IyZPqEmy6raoc6FYfOXK0w8kf48reoXPsRXl8LfVtH0jRmlBBVLyGohhEsqXPcDc5H
         8yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776698514; x=1777303314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ3gGohfaef4cQN+FiRgbIUV8k8h5Qo7CKVXFQnA5+A=;
        b=kQybM3ZETX97H6m89xEggPHlAwE1uq5rxSOD4xi56YDGU6KLajbLxr7CFNR1gWs4EE
         1olmAoGZHReEpwXYcudRTqwRRhFfcvQ3s4inEltT9JYHdX2Id0wyoW8/4MmcbWK3g0lo
         3V8dS0Wd3Hf9aNy2Jyw+Cm+scMeBaY+f7u/gEhczCYyvDkeoGfNciVfG3etXre2Cz1DW
         AQglNXHNLRgcmBp86rjGjDg+7Jb8YXqScVXdsOezMx5LPF/GDY5ePOAlF5UnDSrUmb1A
         hqAHT9/fxziGSMQalxVlUYI2Pb+3W8ffgV9Uxje8iUC+l/b7JceUlCg9AFrWv1YfwIvS
         2Afw==
X-Forwarded-Encrypted: i=1; AFNElJ/IWLxvhinwdTXsj5FZbnMQwiRswW6iylHStJlpsPhOgEScV1pQOcmTROhdk3zUMDPaZXXEu1L01NY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywei6IFiO02Qv1tbP22ZBY6TK87k71tl02SAXNwVcsvCgsgA0Nr
	3Hyeuc6Oth8jk/6y+7+adFjqQP993rurPZroD2usUkuv8DEkMoBWZ5C6LvXpM8aQVA==
X-Gm-Gg: AeBDietEN4hPIWMfSyZTl5UpeXoTtta/17nYdJwYmr7hmzmbT4VDxoQjXtBlBP0+wBJ
	HStIVJjbemOeh6OtvNxEM3vNgxRZQCwDBra9hFKs8tjXNJoTk5nuitrDhF55gWStQDZmhcqNjn0
	apEyuNL0LAj17MMwDw4Cetze8sr4fxzRJNAXaGuHVnbABA/WusSUg84ZLrmzHBh2IyiAbMQCJV6
	c6ApTYmKXWAQvawZ6gr9lAIMauSTWbzNJvaWR4b3w5V/SiYPrHSA0DQfCmTGm189QAte6F9430q
	Lej3aESrLLWO0kSpn5PPmk2W9/ZrCjQggegJXM8pnm6iHk7afjkQlT+k4LypkGHjVbfZ3X4rGQW
	f/ycANOc+QvHZ2TJF3PsGFHcPbkQ0B1xmDZQ2z+h2h5c17y25+ckZPiFddxAd6ngGhj8lb13dO5
	tp5YgWfCIFz1di2oXasRGUOpF9xyWT/dxKVYZ9qnARKDVkLkG64Yzjt7AAL3ubWbihcm5XOFTq6
	U+keq/QB3MeNT3cjMEUXJH9yA==
X-Received: by 2002:a05:600c:c0db:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-488fb73b259mr147601145e9.3.1776698514310;
        Mon, 20 Apr 2026 08:21:54 -0700 (PDT)
Message-ID: <0ccf093f-cc2a-4729-bf8f-b39bf73fd202@suse.com>
Date: Mon, 20 Apr 2026 17:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/27] xen/riscv: implement IRQ mapping for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <10654a6c38fa929b5fdf6f214badfe4f60fe78d4.1773157782.git.oleksii.kurochko@gmail.com>
 <8a8a2afd-6f53-4f45-b8c8-fb34a6fbb970@suse.com>
 <f099b925-0ea9-43a7-b760-f70f343a4d7c@gmail.com>
 <a7a4e8c9-d053-4ca7-ac9c-f43ddccf9151@suse.com>
 <00fa439d-0327-4c0c-960d-a810820a6e83@gmail.com>
 <09a260ca-5a98-461d-9f57-d298a483d3d6@suse.com>
 <7c059a67-3f3f-4633-aebb-939aa9ac7955@gmail.com>
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
In-Reply-To: <7c059a67-3f3f-4633-aebb-939aa9ac7955@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1776698515-B3961161-1E8FF53C/0/0
X-purgate-type: clean
X-purgate-size: 6758
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
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
X-Rspamd-Queue-Id: 1702E42E179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 16:34, Oleksii Kurochko wrote:
> 
> 
> On 4/20/26 3:45 PM, Jan Beulich wrote:
>> On 20.04.2026 13:39, Oleksii Kurochko wrote:
>>> On 4/16/26 2:51 PM, Jan Beulich wrote:
>>>> On 14.04.2026 13:29, Oleksii Kurochko wrote:
>>>>> On 4/2/26 2:22 PM, Jan Beulich wrote:
>>>>>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>>>>>> +int vaplic_map_device_irqs_to_domain(struct domain *d,
>>>>>>> +                                     struct dt_device_node *dev,
>>>>>>> +                                     bool need_mapping,
>>>>>>> +                                     struct rangeset *irq_ranges)
>>>>>>> +{
>>>>>>> +    unsigned int i, nirq;
>>>>>>> +    int res, irq;
>>>>>>> +    struct dt_raw_irq rirq;
>>>>>>> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
>>>>>>> +    unsigned int reg_num;
>>>>>>> +
>>>>>>> +    nirq = dt_number_of_irq(dev);
>>>>>>> +
>>>>>>> +    /* Give permission and map IRQs */
>>>>>>> +    for ( i = 0; i < nirq; i++ )
>>>>>>> +    {
>>>>>>> +        res = dt_device_get_raw_irq(dev, i, &rirq);
>>>>>>> +        if ( res )
>>>>>>> +        {
>>>>>>> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
>>>>>>> +                   i, dt_node_full_name(dev));
>>>>>>> +            return res;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        /*
>>>>>>> +         * Don't map IRQ that have no physical meaning
>>>>>>> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
>>>>>>> +         */
>>>>>>> +        if ( rirq.controller != dt_interrupt_controller )
>>>>>>> +        {
>>>>>>> +            dt_dprintk("irq %u not connected to primary controller."
>>>>>>> +                       "Connected to %s\n", i,
>>>>>>> +                       dt_node_full_name(rirq.controller));
>>>>>>> +            continue;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        irq = platform_get_irq(dev, i);
>>>>>>> +        if ( irq < 0 )
>>>>>>> +        {
>>>>>>> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
>>>>>>> +            return irq;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        res = irq_permit_access(d, irq);
>>>>>>> +        if ( res )
>>>>>>> +        {
>>>>>>> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
>>>>>>> +                   irq);
>>>>>> This time the other way around: %d please with plain int. (Again at least
>>>>>> once further down.)
>>>>>>
>>>>>>> +            return res;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        reg_num = irq / APLIC_NUM_REGS;
>>>>>>> +
>>>>>>> +        if ( is_irq_shared_among_domains(d, irq) )
>>>>>>> +        {
>>>>>>> +            printk("%s: Shared IRQ isn't supported\n", __func__);
>>>>>>> +            return -EINVAL;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);
>>>>>> ... all of this leaves me with the impression that IRQ numbering isn't really
>>>>>> virtualized. IRQs are merely split into groups, one group per domain (and
>>>>>> maybe some unused). How are you going to fit in truly virtual IRQs?
>>>>> What do you mean by truly virtual IRQs?
>>>> Ones where no aspects are represented by any piece of hardware.
>>>>
>>>>> I can't totally agree that the current approach isn't use virtual IRQs,
>>>>> yes, they are 1:1 mapped but on the other side Xen is responsible to
>>>>> give an IRQ number for guest's device and Xen is responsible that guest
>>>>> isn't trying to reach IRQ which not belongs to it.
>>>> In a non-virtualized environment I expect IRQs are going to be "sparse"
>>>> (i.e. with perhaps large blocks of items used elsewhere). If you had
>>>> proper translation of IRQ numbers, the same could be true for your
>>>> guests.
>>> Partial FDT, which is used to tell which device be passthroughed to
>>> guest, is using physical IRQ number (which I am just considering for
>>> simplicity to be 1:1 mapped to virtual IRQ number). So if we have the
>>> following configuration:
>>>     Physical (bare-metal) IRQ layout is sparse:
>>>       IRQ 5  → UART -> domU0
>>>       IRQ 23 → Ethernet -> domU1
>>>       IRQ 47 → PCIe -> domU0
>>>       IRQ 100 → Storage -> domU1
>>> (gaps everywhere, driven by hardware wiring)
>>>
>>> For such configuration we will have for each domain auth_irq_bmp[] which
>>> contains:
>>>    IRQ 5 and IRQ47 for domU0
>>> and
>>>    IRQ 23 and IRQ 100 for domU1
>>>
>>> And here vIRQ5 = pIRQ5, vIRQ47 = pIRQ47 and so on. auth_irq_bmp just
>>> transform xIRQ number to bit position which it will have in real APLIC
>>> register. Just as an example, lets take vIRQ5 and vIRQ47.
>>>
>>> As reading or writing register setie[k] reads or potentially modifies
>>> the enable bits for interrupt sources k × 32 through k × 32 + 31. For an
>>> implemented interrupt source i within that range, the enable bit for
>>> source i corresponds with register bit (i mod 32).
>>> So for:
>>>    - vIRQ5 == pIRQ5 we have to set bit 5 in setie[0]
>>>    - vIRQ47 == pIRQ47 we have to set bit 15 in setie[1]
>>>
>>> Probably it was not the best idea to declare auth_irq_bmp as it will
>>> look in h/w and maybe just 'bool auth_irq_bmp[1024]' would be more clearer.
>>>
>>> So irqs number are still stay "sparsed" in guest.
>> Well, twice (or more) as sparse in the example you give, compared to the
>> host.
> 
> Just to be sure that I fully understand your concern here.
> 
> The difference between xIRQ5 and xIRQ47 is 42 bits (if for 1 irq we are 
> using 1 bit) which leads to that we have somewhere allocated 48 bit 
> bitmap where only two bits will be set, all others will be zero.

Why 48-bit bitmap? As you inherit the property from the host, it'll be e.g.
1024 bits. Compared to the host, each guest will have yet fewer bits set in
there.

> Instead it would be better to have to do mapping: pIRQ5 -> vIRQ1, pIRQ47 
> ->vIRQ2, right?

Which specific mapping I don't care very much. There may also be conventions
to adhere to (on x86 for example there are).

> If yes, won't we still store somewhere this mapping? it seems like 
> having 'unsigned int auth_irq_bmp[1024]' is a good option where index 
> will be vIRQ number and 'unsigned int' will be pIRQ number. But at the 
> moment I think that we could go with 1:1 IRQ number mapping and then 
> have 'bool auth_irq_bmp[1024]' will be more then enough and will safe 
> some memory.

Well, if using 1:1 mapping was clearly identified as "for the time being",
then that might be acceptable (for the time being).

As to you (again) suggesting "bool auth_irq_bmp[1024]" - why would you use
an array of bool-s when a bitmap can do the same in 1/8th of the space?

Jan

