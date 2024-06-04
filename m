Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C78FAA56
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 07:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735116.1141260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEN8c-0003G6-E2; Tue, 04 Jun 2024 05:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735116.1141260; Tue, 04 Jun 2024 05:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEN8c-0003EY-AL; Tue, 04 Jun 2024 05:55:14 +0000
Received: by outflank-mailman (input) for mailman id 735116;
 Tue, 04 Jun 2024 05:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sEN8b-0003E9-NX
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 05:55:13 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdbb2591-2236-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 07:55:05 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35dcd34a69bso3716745f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 22:55:05 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064b030sm10522642f8f.105.2024.06.03.22.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 22:55:04 -0700 (PDT)
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
X-Inumbo-ID: fdbb2591-2236-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717480505; x=1718085305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uvm5TxqdIcmAMsaNZAzSbRAr65S7lP15jAckEQQhEyI=;
        b=eVxkEKfl1xM+OZxVO9Z7Z//CUUXNhKckYas+C+3k6dcx1C3SjwsvdX2ahLs5PE8DIq
         jLDKdn9IAsYV6Q+A1k8qaEgGoyAmjtCNdkWRd39vG4mORNRf6iFJ3eugKWpiVRVvQpmQ
         PlXc3mwaJNZHG4XJ5moRnV8Y6YAPdxA0Kz2nxAO/MVtkHLBH/gZnxwaybDOyswiN8zVh
         TjBu6VBP4SX8drCuDX2t6MyQ5PmVJhtMiCb/f8eFQ3uut0nKqvEDibWGzr4LDI7gDu2s
         tfJFFRGhUDlZEd6gjZ+QRsyTSNSnyuOgxkfrT3rv83hee2EdevRzgMfOWKYUoLyxxsF6
         sbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717480505; x=1718085305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uvm5TxqdIcmAMsaNZAzSbRAr65S7lP15jAckEQQhEyI=;
        b=qwXhM7oGjwKaL1kvYeUPaL8MDNchEuLWmU/zewuzdVUToEEWqe/TCpL+YMYKtv99SK
         jupNNG9Z5jFVG74kvgLsKmWLvcKexxwBI7pKqYb84wpySzcNo3XrDt1zoaANt8NdhHC3
         jtUDVthM2ONu5x09SAbcWbMpZKgxits0DBSsBuiJhg0Vjuxk/WElgvTqCxDrBtb10lNT
         2+ypVIFnc8pykQ9i9aMgczMeB55MeJ+bSNkxlXeY1GlJnnotS/Vol+/jKcwmYOHLtnZg
         ofJwXS+85LLUNJw4ZEj0/heBDGPNRI34cHxK89buvSigADhc+8/9n2iv5M2d4h1kPILq
         fQCw==
X-Forwarded-Encrypted: i=1; AJvYcCUNO63qq6Zq/TDW4f26wdL1iUfAtHXvP5LDYDCTggnLFD6/7qLNyKY5Zfohfv4qlReBkb8401ndwn9YLxO25E7/3p3SaycMBnFm7NwQ2oo=
X-Gm-Message-State: AOJu0Yz1b8oPzV3Xb1tKnLCANFUiPtMGLdc4hwl7WBEKRdQPP1pmdYHd
	e54nzU+fWM7SxQJYOJJyFZem1biZdKC2Roz4OzVUjJbtty99ACwNsJennxHLuQ==
X-Google-Smtp-Source: AGHT+IFO62aKzblkgG28uyE0TQEQ/FSluqZHTcKqt3JQ3ijno53Hp0Z077girYCU+wbKfPuU3cgmHg==
X-Received: by 2002:a5d:4005:0:b0:354:f1de:33eb with SMTP id ffacd0b85a97d-35e0f2836b3mr7291068f8f.26.1717480504692;
        Mon, 03 Jun 2024 22:55:04 -0700 (PDT)
Message-ID: <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
Date: Tue, 4 Jun 2024 07:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 05:04, Chen, Jiqian wrote:
> On 2024/5/30 23:51, Jan Beulich wrote:
>> On 30.05.2024 13:19, Chen, Jiqian wrote:
>>> On 2024/5/29 20:22, Jan Beulich wrote:
>>>> On 29.05.2024 13:13, Chen, Jiqian wrote:
>>>>> On 2024/5/29 15:10, Jan Beulich wrote:
>>>>>> On 29.05.2024 08:56, Chen, Jiqian wrote:
>>>>>>> On 2024/5/29 14:31, Jan Beulich wrote:
>>>>>>>> On 29.05.2024 04:41, Chen, Jiqian wrote:
>>>>>>>>> But I found in function init_irq_data:
>>>>>>>>>     for ( irq = 0; irq < nr_irqs_gsi; irq++ )
>>>>>>>>>     {
>>>>>>>>>         int rc;
>>>>>>>>>
>>>>>>>>>         desc = irq_to_desc(irq);
>>>>>>>>>         desc->irq = irq;
>>>>>>>>>
>>>>>>>>>         rc = init_one_irq_desc(desc);
>>>>>>>>>         if ( rc )
>>>>>>>>>             return rc;
>>>>>>>>>     }
>>>>>>>>> Does it mean that when irq < nr_irqs_gsi, the gsi and irq is a 1:1 mapping?
>>>>>>>>
>>>>>>>> No, as explained before. I also don't see how you would derive that from the code above.
>>>>>>> Because here set desc->irq = irq, and it seems there is no other place to change this desc->irq, so, gsi 1 is considered to irq 1.
>>>>>>
>>>>>> What are you taking this from? The loop bound isn't nr_gsis, and the iteration
>>>>>> variable isn't in GSI space either; it's in IRQ numbering space. In this loop
>>>>>> we're merely leveraging that every GSI has a corresponding IRQ;
>>>>>> there are no assumptions made about the mapping between the two. Afaics at least.
>>>>>>
>>>>>>>> "nr_irqs_gsi" describes what its name says: The number of
>>>>>>>> IRQs mapping to a (_some_) GSI. That's to tell them from the non-GSI (i.e.
>>>>>>>> mainly MSI) ones. There's no implication whatsoever on the IRQ <-> GSI
>>>>>>>> mapping.
>>>>>>>>
>>>>>>>>> What's more, when using PHYSDEVOP_setup_gsi, it calls mp_register_gsi,
>>>>>>>>> and in mp_register_gsi, it uses " desc = irq_to_desc(gsi); " to get irq_desc directly.
>>>>>>>>
>>>>>>>> Which may be wrong, while that wrong-ness may not have hit anyone in
>>>>>>>> practice (for reasons that would need working out).
>>>>>>>>
>>>>>>>>> Combining above, can we consider "gsi == irq" when irq < nr_irqs_gsi ?
>>>>>>>>
>>>>>>>> Again - no.
>>>>>>> Since you are certain that they are not equal, could you tell me where show they are not equal or where build their mappings,
>>>>>>> so that I can know how to do a conversion gsi from irq.
>>>>>>
>>>>>> I did point you at the ACPI Interrupt Source Override structure before.
>>>>>> We're parsing those in acpi_parse_int_src_ovr(), to give you a place to
>>>>>> start going from.
>>>>> Oh! I think I know.
>>>>> If I want to transform gsi to irq, I need to do below:
>>>>> 	int irq, entry, ioapic, pin;
>>>>>
>>>>> 	ioapic = mp_find_ioapic(gsi);
>>>>> 	pin = gsi - mp_ioapic_routing[ioapic].gsi_base;
>>>>> 	entry = find_irq_entry(ioapic, pin, mp_INT);
>>>>> 	irq = pin_2_irq(entry, ioapic, pin);
>>>>>
>>>>> Am I right?
>>>>
>>>> This looks plausible, yes.
>>> I dump all mpc_config_intsrc of array mp_irqs, it shows:
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 0 dstapic 33 dstirq 2
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 15 srcbus 0 srcbusirq 9 dstapic 33 dstirq 9
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 1 dstapic 33 dstirq 1
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 3 dstapic 33 dstirq 3
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 4 dstapic 33 dstirq 4
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 5 dstapic 33 dstirq 5
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 6 dstapic 33 dstirq 6
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 7 dstapic 33 dstirq 7
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 8 dstapic 33 dstirq 8
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 10 dstapic 33 dstirq 10
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 11 dstapic 33 dstirq 11
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 12 dstapic 33 dstirq 12
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 13 dstapic 33 dstirq 13
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 14 dstapic 33 dstirq 14
>>> (XEN) find_irq_entry type 3 irqtype 0 irqflag 0 srcbus 0 srcbusirq 15 dstapic 33 dstirq 15
>>>
>>> It seems only Legacy irq and gsi[0:15] has a mapping in mp_irqs.
>>> Other gsi can be considered 1:1 mapping with irq? Or are there other places reflect the mapping between irq and gsi?
>>
>> It may be uncommon to have overrides for higher GSIs, but I don't think ACPI
>> disallows that.
> Do you suggest me to add overrides for higher GSIs into array mp_irqs?

Why "add"? That's what mp_override_legacy_irq() already does, isn't it?
Assuming of course any are surfaced at all by ACPI.

Jan

