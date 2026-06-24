Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0t1Gd2cO2qEaQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:01:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E186BCC48
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:01:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h6mqxNhd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344670.1603714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJTY-0003ls-8n; Wed, 24 Jun 2026 09:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344670.1603714; Wed, 24 Jun 2026 09:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcJTY-0003ja-69; Wed, 24 Jun 2026 09:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1344670;
 Wed, 24 Jun 2026 09:00:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcJTX-0003jU-3a
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:00:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcJTT-00DFLR-Vg
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:00:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3b9cbd-e002-0a2a0a5209dd-0a2a4503d19e-10
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:00:47 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3b9cbe-a3da-0a2a45030019-d155dd2ed08a-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:00:46 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so646804f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 02:00:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d93d8sm9275185f8f.23.2026.06.24.02.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 02:00:45 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782291646; x=1782896446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7wF+j4x8T/qmVYOo3cyuBlUQIw/U8JDvV1kS+pKUsI=;
        b=h6mqxNhdOTyPpcH/I6AILE8UuOD0K+NUKjhKyAPedg6FtrK2Cg1n5bXK4FQ33KjtXW
         GwBp1GIOQN+JpVqEDGmKndQGDnuQAu0EzTO4kuqhK+KZTYajyu1zCM0IOy/4/NxGdw6U
         4l2YS3pvZSGNgCee57gnK9eHv/oLzfTAYBwuMy7YFHwjKDht0AWbWP7lCfzAVZEd3u2i
         fhnaCs0eqofrOCZ31l6ODZFq4y/FLPhZBSVF9pl9oaciWXMGtktQeGNBhH9WgPJdQkVm
         kEJ8FKDRr00KQtmJxSL6TdzvYrdMEf6mK+deJQBb8VIfdihxFG+e7HWYSVP4Z8itkbY2
         Vrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291646; x=1782896446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7wF+j4x8T/qmVYOo3cyuBlUQIw/U8JDvV1kS+pKUsI=;
        b=jmePSahXvrrGFEuOx8xaQ6gzGdVg8fdpFT8+b8bDvgWrJ0zyCYbp0ausytNmEi1VPx
         M969qMVqDL/P0FCcO0XC2Dg3eLUlSeU4RtUjlWCg1Im2hnvlz0rEK8y2leWLjVA/0LPn
         WZk0+PPGWrWQAu9SoYUml3wBSuHUZ335zQAXQ1GfxbYko8AXa9c4gk2bupj/5utRxKT/
         h7NRT8ljewraA4tLtUTXVf2lx0+tjjfaRnuDMnraiDXNjL9OObMdAbbBMJ14RQSnbqw5
         4Z0ze3ivX4N8XSQvXC1K3C4wBp4j4Gw4eG5Hc6peEGLdcRXf6wgI5McDjrBOLjobvBiE
         72DA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8+EWNKAyDdUtcVT1MBpMmem06kLugmRxpMEAh8H72oJK/JeysrL+WeNx5CGclyo5a+tZ4IZunQWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzag3TWk52tYyQZV/FNIWkPX1Db2kPEWexTVuv9qEbVV3iEIJ9x
	VEUiWNRqDmLBaRfh7b1klXYv3M7BOWTnCn45vD6sCAVoPykx2rQRG/5X
X-Gm-Gg: AfdE7cnGtwbJEFxv1k1puB2OOb/aviibJCebSA0UgKKruYwBXwcxD9ZBvbQubIXy2sa
	MOhUfVvIwqH4aaETs3oZS//25g+JfTeOeVppq4BdlLJe45BLMQg9+xB3sWCBn9Q//OVJaPwxD0m
	Apb/3QE7loUwETeOwKpAf+CVFjB3a1kvNL44YreGdZzM+STshZfTHNkBdWvrmFkiMFDMMU5tRzx
	9M7CvzTgI+3+atliVGaVAfAJyaT9jwZihGqSAR+vkK1Y+/Q0i+41Xfkfg2KfwuhWl0vK6n6ykAL
	pXBKcrRV8QO6aFqdUyYQr1ywnyAvI6RpSC+sBPTw260tnHAKsZzlZyqueNIewamszcfIhJDsl1q
	0jrcEgB2jvFGJiEUQUTiZC0Q54G+CjoqDNfx1jnoGPfVOdjddbfdICeHlDfxsWgN614HV1knjPw
	cuwlrOCFCljrukAh9+/e8Fca7VS8/xJU/vdGQSUxUSnF1EVtXjaUwb
X-Received: by 2002:a05:6000:4696:b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-46c087ac3aemr2859750f8f.2.1782291646047;
        Wed, 24 Jun 2026 02:00:46 -0700 (PDT)
Message-ID: <38082acd-ae6e-456b-b9dc-038ed4de891e@gmail.com>
Date: Wed, 24 Jun 2026 11:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] xen: arm: move declaration of
 map_device_irqs_to_domain() to common header
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <7bbb4d94f6711014f46becfabeb916ceed294833.1781693963.git.oleksii.kurochko@gmail.com>
 <b91ad9b2-b91d-4649-872e-0ba24692f19d@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b91ad9b2-b91d-4649-872e-0ba24692f19d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782291646-67DD7D84-63EC0AAB/10/73395122804
X-purgate-type: spam
X-purgate-size: 3376
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[oleksiikurochko.gmail.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74E186BCC48



On 6/24/26 9:02 AM, Orzel, Michal wrote:
> 
> 
> On 17-Jun-26 13:17, Oleksii Kurochko wrote:
>> As map_device_irqs_to_domain() is used unconditionally by common part of
>> dom0less code it is moved to common header.
> `it` here reads as if you were moving the function, not the prototype. Also, use
> imperative mood i.e. `... code, move the prototype to a common header`.

I will apply your suggestion.

> 
>>
>> fdt-domain-build.h is chosen as map_device_irqs_to_domain() could be
>> also called indirectly in Arm's DOM0-related code.
> By `indirectly` do you mean `handle_device`? It can also be used in the same way
> by DT overlay feature.

Yes, I meant `handle_device`. I will update the commit message then to:
  "... Arm's DOM0-related code and DT overlay feature"

> 
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - Add tag arm and move this patch earlier before RISC-V-related patches.
>> ---
>> Changes in v2:
>>   - New patch.
>> ---
>>   xen/arch/arm/include/asm/setup.h   |  3 ---
>>   xen/include/xen/fdt-domain-build.h | 13 +++++++++++++
>>   2 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index 0d29b46ea52b..0adfa4993a8f 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -53,9 +53,6 @@ void init_traps(void);
>>   int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>                     struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>>   
>> -int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>> -                              bool need_mapping, struct rangeset *irq_ranges);
>> -
>>   int map_irq_to_domain(struct domain *d, unsigned int irq,
>>                         bool need_mapping, const char *devname);
>>   
>> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
>> index 671486c1c837..8612e98dfda5 100644
>> --- a/xen/include/xen/fdt-domain-build.h
>> +++ b/xen/include/xen/fdt-domain-build.h
> I don't see fdt-domain-build.h being included in Arm's device.c, where the
> definition (that needs to see the prototype) resides.

Agree, it should be added to Arm's device.c. I'll do that in the next 
version.


> 
>> @@ -12,6 +12,7 @@
>>   
>>   struct domain;
>>   struct page_info;
>> +struct rangeset;
>>   struct membanks;
>>   
>>   typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
>> @@ -79,6 +80,18 @@ static inline void set_domain_type(struct domain *d, const struct kernel_info *k
>>   #endif
>>   }
>>   
>> +/*
>> + * Retrieves the interrupts configuration from a device tree node and maps
>> + * those interrupts to the target domain.
>> + *
>> + * Returns:
>> + *   < 0 error
>> + *   0   success
>> + */
> By adding the description to a prototype, there's no need for it to also exist
> at the definition.

I will drop it than.

>> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>> +                              bool need_mapping,
>> +                              struct rangeset *irq_ranges);
>> +
>>   #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
>>   
>>   /*

Thanks.

~ Oleksii

