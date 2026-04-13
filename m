Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJQUFB2t3GnfVAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 10:45:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AAD3E943A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 10:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1280933.1564017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCCtf-0006n1-Pb; Mon, 13 Apr 2026 08:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1280933.1564017; Mon, 13 Apr 2026 08:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCCtf-0006k0-M0; Mon, 13 Apr 2026 08:43:55 +0000
Received: by outflank-mailman (input) for mailman id 1280933;
 Mon, 13 Apr 2026 08:43:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCCte-0006ju-Jn
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 08:43:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCCtd-00Bb9a-SS
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 10:43:53 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dcacc7-bab6-0a2a0a5309dd-0a2a450495c4-10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 10:43:53 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69dcacc9-bb33-0a2a45040019-d155dd31c52f-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 10:43:53 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43d572f7437so2632765f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 01:43:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d7a6054dfsm4984799f8f.17.2026.04.13.01.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 01:43:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776069833; x=1776674633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcPTLLRyjpLLJeDzkteXckkWflgWGJ+66+DAF24dZnE=;
        b=CoM5NDvd4BZL43ibZUG5lWLiBgTPSJll1d0O+KakuHjzriWJfPgsuNAemDyLMuuyv+
         9bWjTGMaDFPMAj6k8tFYZyQTUVViwH84Um3KapwLoLHdblao1x9sI9fIC+MQIyEs5O5w
         aQ28w6qDGGSdKM546pbPvn4+atDRGm2ybU5p80cO+W+kILrRXo6t1UESxguo7r11Z7NO
         xwy8Q994kKwEVoj8LQV5ambgLL/fLGVQUYNudcN9wFLO7xLwomUG+Ms8ravaCXR14q1w
         zwtWlms0wQXhWJx6etff2wyayG72d4H3r0+ys4xEyE5q3l1TgneBH7E0TgpB5jcO0z2G
         rb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069833; x=1776674633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcPTLLRyjpLLJeDzkteXckkWflgWGJ+66+DAF24dZnE=;
        b=DY9uiciCkIhxjR74/32sXoZ86xsqQvs632dfIiaXcDHR4UTDyR8Ix2nvNl7LOgaW2J
         ijyxQElnFSgpRIcydxUzRucIijP4NddXwJoo7Y04vHGSdvgj62vLj3gIVQlbM0wQjKkO
         W6TnMwzYTj7asHNdJZaV+PDWVwH+uqh+AuPtm8GeJo2w5XIMj2MbTWRgdTL0DWrBt4Y6
         TNimBzMQDhFfCCcfSN7ZgZxQQDnkkjnybY7lW36LaqJTSZkXbneSKKek8EFoCSr5S2dg
         hlp+1uekXgAa/nEeZE7c2nR0fHKdPP0a1y1K1EEh1Q4JpSn0PSHwEYeRtsYOMIIIi1sF
         dBrw==
X-Forwarded-Encrypted: i=1; AFNElJ8U+5Ass6y+Yy6qePOxWBLIje/xfCorkbCOqGUYkgZLDq6jRj1+jm2QApEkBDmvd44/CP7acQLO7xI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx12NdLNGpEkUi4VfHKMuKRfW5MBTGQRhWm7ISSqIffUb6w6NFP
	SFSrOACUP3H2KZzsYqMrSSVtNam3jsaW3K8qOyRl2cN72IQxEnpVsrt3
X-Gm-Gg: AeBDiesbGymfXdwCo1v0Sfw1Pqqw8cXxOjGU6Oac2zOC7XMFVXjd9r715O+YtG4rHes
	3RirMi6QngKvRD4ex9CJ17gbdUhoabbja0D6jkuHtE00DYFDrXiO3YWkvYNYr3QLxMQ/LzallrY
	BfEanhAJdK9NZW60s3LMMuPaw19w5b/IHE4ZWvpz+QIwwvwdYUf+ffwop96AgLQiKfn/71XYO6g
	NP5vNKjJqC532gTpJo85mteE9/OKedF5aSz/CyCG3jqI1Ip7NKU8j8Uh359RDSJ1+BQxOdS8MQw
	enbe89hwyHb3r/FyV9AoDurSGwCjG23ovVihxuQCR3CigsT4vXpxkt8BO1Y0bApX7xEYj5niyir
	zGQP4KYHJpQ+L3AKb6DcGdvvYvwcBLUfuaUjTwysCq4grcFoOtSlRWmqxb+GNcQ1G5rFI5Egl8G
	1fnuBB66LHn47gM/XqIxqKVuLwLJf2bGkLnU2hthfOBtUmpD50o8D1/39RAU3/af+8H34jbsFAJ
	OA=
X-Received: by 2002:a05:6000:2886:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-43d642c77cemr18408832f8f.25.1776069832830;
        Mon, 13 Apr 2026 01:43:52 -0700 (PDT)
Message-ID: <9fd04b0f-3b04-4f1e-ac63-de0fca57d466@gmail.com>
Date: Mon, 13 Apr 2026 10:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/27] xen/riscv: create APLIC DT node for guest
 domains
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
 <362d1e3a-409c-40ab-8d2c-36dc30a04b88@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <362d1e3a-409c-40ab-8d2c-36dc30a04b88@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776069833-B0F2E51B-88ED3C28/10/73395122804
X-purgate-type: spam
X-purgate-size: 3698
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A9AAD3E943A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 5:16 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> @@ -295,6 +297,85 @@ static void cf_check aplic_set_irq_type(struct irq_desc *desc,
>>       spin_unlock(&aplic.lock);
>>   }
>>   
>> +static int __init cf_check aplic_make_dom_dt_node(
>> +                                    const struct kernel_info *kinfo,
>> +                                    const struct dt_device_node *aplic_node)
> 
> Nit: Entirely bogus indentation.
> 
>> +{
>> +    uint32_t len;
>> +    const __be32 *regs;
>> +    const void *data = NULL;
> 
> Again, why the initializer?

No real need, I will drop.

> 
>> +    int res = 0;
>> +    void *fdt = kinfo->fdt;
>> +
>> +    res = imsic_make_dt_node(kinfo);
>> +    if ( res )
>> +        return res;
>> +
>> +    res = fdt_begin_node(fdt, aplic_node->full_name);
>> +    if (res)
> 
> Nit: Style.
> 
>> +        return res;
>> +
>> +    data = dt_get_property(aplic_node, "#interrupt-cells", &len);
>> +    if ( !data )
>> +    {
>> +        printk("%s: Can't find '#interrupt-cells' property\n",
>> +               aplic_node->full_name);
>> +        return -FDT_ERR_XEN(ENOENT);
>> +    }
> 
> Again, pull this up to be first in the function?

Agree, it makes sense to move it up.

> 
>> +    res = fdt_property(fdt, "#interrupt-cells", data, len);
>> +    if ( res )
>> +        return res;
> 
> So host properties are again directly handed through to the guest?

I am not sure that it can be different from what host has.

> Shouldn't the number of interrupts (aiui that's the "number of cells"
> here) a guest gets be independent from the host it runs one?

The #interrupt-cells property specifies how many 32-bit values (cells) 
are used to encode a single interrupt specifier when referencing this 
interrupt controller from another device node.
In this APLIC schema, it's fixed at const: 2, meaning every interrupt 
reference requires exactly two cells — typically:

Cell 1 — the interrupt source number (which of the riscv,num-sources 
wired inputs)
Cell 2 — the interrupt type/trigger flags (e.g. edge vs. level, active 
high/low)

So when a device node writes something like interrupts = <42 1>, the 
interrupt controller knows to interpret that as "source 42, trigger type 
1" because #interrupt-cells = <2> told it to consume two cells per 
specifier.


> 
>> +    regs = dt_get_property(aplic_node, "reg", &len);
>> +    if ( !regs )
>> +    {
>> +        printk("%s: Can't find 'reg' property\n", aplic_node->full_name);
>> +        return -FDT_ERR_XEN(ENOENT);
>> +    }
>> +
>> +    res = fdt_property(fdt, "reg", regs, len);
>> +    if ( res )
>> +        return res;
>> +
>> +    data = dt_get_property(aplic_node, "riscv,num-sources", &len);
>> +    if ( !data )
>> +    {
>> +        printk("%s: Can't find 'riscv,num-sources' property\n",
>> +                aplic_node->full_name);
>> +        return -FDT_ERR_XEN(ENOENT);
>> +    }
>> +
>> +    res = fdt_property(fdt, "riscv,num-sources", data, len);
>> +    if ( res )
>> +        return res;
> 
> Or maybe this is the number of interrupts?

This is the total count of hardware interrupt lines wired into this 
APLIC domain.

It could be independent from the host it runs one but looking at the 
possible range [1,1023] for this property if we will put for a guest 
lets say 22 but new host support only 20 when we will be in a trouble 
anyway.

It seems like it is another one thing where it will be needed to check 
that new host has enough number of interrupts and then just deny 
migration to such host.

Thanks.

~ Oleksii

