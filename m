Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kyHXAxyMRmpRYQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:04:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D976F9E08
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 18:04:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Px+9NHfd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1352143.1609053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJto-00046n-2A; Thu, 02 Jul 2026 16:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352143.1609053; Thu, 02 Jul 2026 16:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfJtn-000443-Vg; Thu, 02 Jul 2026 16:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1352143;
 Thu, 02 Jul 2026 16:04:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfJtm-00043x-KN
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:04:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfJtm-00FHEq-1D
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 18:04:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a468bfe-2eae-0a2a0a5409dd-0a2a4507d9de-22
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:04:21 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a468c05-9c8e-0a2a45070019-d155dd31d51c-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 18:04:21 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4745492ed3aso1319110f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:04:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c6354771sm63382545e9.3.2026.07.02.09.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 09:04:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783008261; x=1783613061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hg7xCQml2wVUlKW51sJppmbaydhq4zZPmDS+V54apPw=;
        b=Px+9NHfdN3pCgb4XTGzb+uGgfSHfemFdFwft23qscLvnbPpQ2W+gi6OyVLk+oHoLBa
         prlaf/DVC9t57NIxPLLNdG+Cg8zVIPG49j24Iz2qjgs2WpdKU2dLHSIXf+XG2RgnrOWr
         r3FLE5AUmGFG2/aYmcmhD3g0/yB2gBmYHiFsBlXddY8wznZbXV/5XC2M9cgjbRXWaeS0
         wAoVpmvCKqLK8Hf8HZy49f3IKifwaXSrJXJBrNihrkBI3ds+IQdpYqcJ2p1nZpo1occU
         qRdpnnbYRAOsmbmEsEosVYaPlLIVSP+vRQDu3cD4KOfWo3XpCpC0UiDy+Gvnr51UwXwt
         eBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783008261; x=1783613061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hg7xCQml2wVUlKW51sJppmbaydhq4zZPmDS+V54apPw=;
        b=JX/8yu9IdQRpes3sdWtNwJQPYe02CC41VL+rNJKcAiEQQ5sdKPiWJTjTXsvWae8TFO
         kju044x2t4wI8U32R7iil12vfx0qwEoAOSe6pCNsqJpcVuI3Ioetn9TNi5uQUAnvPykj
         U2yqTZI/R+5ewAjZyb64ucqj7UAXXrXgf8SyqH1Y01CIlrIcZpdS+m5MFsWUJgBqffkV
         wmA5rq9FvuKp8C1nu9H9HEV9/WMko1nfo3wAg98YFfm87aKhJJZ2sQ6hlU0ecgSo08bn
         NY8vRVdSVvLKvApPZyt0GLMSTRGfwcWLlcpWEF5PWPQiTHHK3TS+wul8sW4Lxkpjo2ja
         B3xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ly3qLhoSfNYwcv+kSCKuQywRl6yknqOR+4Tjg+A75uGxA9cIYg+8h5Iq+ggI2wiDek8ibB2F0Vgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2cbI1jz9jzUchr5bi4UkPXOirs5+Cz0FZtnFaxHT3a2jiCXqU
	pKogQOak61ivjATnWLGXQ1TzGd0P0ArgK80fKOSe29ERvSDTkvgllTFp
X-Gm-Gg: AfdE7ck7BoK4PcYqeHzFDMPSd6oIQ7pKvmkPdWy55cNcFa0h/tPo9NfhfH3t3NeUQ+R
	Fz8IXZJAuCjzsl4yA/4IQE0uTzGEzW+Ehdqo3Ks1mTVldUpBEKrcTyKGS+gusZuBjOQ8pPYGauK
	oX9beKEjbDZwU5lLkyesAAxbY8x48q7Ru0ofR2fKQBOWDjp139EKii2eD1p12Hp/sT+Hk/2D4J1
	vJxKj5i/LVw8Oq2iCTfXyXXxF3V/Px7EkpF7FQe59jIOvH5WYUBFybEe0MQH5LBooWHm9Ci9Wgn
	86QIb2SHOy/15PLFRQCV1qd0xFR8AOzmP1tCqFU4A6tj032RNTLbGryItaAx5zs+/AWm7lLsJas
	+zp7uazOI7w+qKDnrSRmBtFSVype0S5f6tBEdkcXdRWh9lAakuYxvmTx7mnRrffox9s5ZAS4nIY
	sGETdNn7hIUXtExBit3smeQtco50qZ0SUgfE6f3KtqMIkm+Cb9H6aK4gbP+XVUPpm0gnI=
X-Received: by 2002:a05:600c:34d4:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-493c2b3a709mr98864035e9.2.1783008261100;
        Thu, 02 Jul 2026 09:04:21 -0700 (PDT)
Message-ID: <d25c4b45-c3db-4a48-bc18-da9037a858d0@gmail.com>
Date: Thu, 2 Jul 2026 18:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/25] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
 <ac1a3a08-dc39-4794-ba96-dab4b88c27a3@suse.com>
 <6aafbeb5-2f33-49f4-9d14-937b0bc4d15d@gmail.com>
 <40bcf6b7-306a-419a-bf12-1855f9e589fe@suse.com>
 <91ffc1b2-7648-4185-a2f1-12b30181c8a9@gmail.com>
 <e7d430c1-fe57-4b28-a5a2-1c8bfcd54ac4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e7d430c1-fe57-4b28-a5a2-1c8bfcd54ac4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1783008261-7DD2425E-221535F7/10/73395122804
X-purgate-type: spam
X-purgate-size: 2926
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58D976F9E08



On 7/2/26 4:32 PM, Jan Beulich wrote:
> On 02.07.2026 11:33, Oleksii Kurochko wrote:
>>
>>
>> On 7/2/26 8:38 AM, Jan Beulich wrote:
>>
>>>>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>>>>> +
>>>>>> +    release_irq(desc->irq, info);
>>>>>> +    xvfree(info);
>>>>>
>>>>> If, in release_irq(), action isn't freed, it's ->dev_id field will now have
>>>>> a dangling pointer. (I think I did point this out before.)
>>>>
>>>> It should freed in release_irq() as route_irq_to_guest() always set
>>>> action->free_on_release = true;
>>>
>>> Well, "free_on_release" must exits for a purpose. I.e. there must be, now
>>> or soon, cases where it's set to false. Else simply drop the field.
>>
>> I can't simply remove this field because it is part of the common
>> `struct irqaction` and is used by other arc-s. (I assume that it is not
>> what you fully meant...)
>>
>> IIUC, this field is used to determine whether an irqaction is
>> heap-allocated (and therefore should be freed) or statically allocated
>> (and therefore should not be freed).
> 
> Yes. However, all uses of the field are in arch-specific code. So in
> principle it could be #ifdef-ed out for RISC-V. There may be a better
> option, though:
> 
>> At the moment, all IRQ actions are heap-allocated (on RISC-V), so
>> free_on_release should always be set to true. In particular, the code
>> snippet you asked about releases a guest interrupt, and guest interrupt
>> actions are always heap-allocated. As a result, when release_guest_irq()
>> calls release_irq(), the associated irqaction will be freed.
>>
>> So, from what I can see, the current behavior is correct and I think it
>> should be left as it is. Do you have any concerns about this?
> 
> If you only ever have the field set to true, use ASSERT() in place of
> if().
> 

It looks like that if we want an `ASSERT()`, it should be in 
`release_guest_irq()`. However, that would require duplicating part of 
`release_irq()` to locate the corresponding `irqaction` and verify 
`free_on_release`. Since guest IRQs are created through 
`route_irq_to_guest()`, which always sets `action->free_on_release = 
true`, we are already safe.

I don't see much benefit in replacing the `if` statement with an 
`ASSERT()` in `release_irq()`. The current implementation is generic and 
would also work for Xen-owned, statically allocated interrupts (even 
though there are none today). If we replace the `if` with an `ASSERT()` 
now, anyone introducing a Xen-owned, statically allocated interrupt in 
the future would simply have to revert the change and restore the `if` 
statement, bringing us back to the current implementation.

Since the existing code doesn't break any logic and already handles both 
the current use case and potential future extensions (statically 
allocated irqs), it seems reasonable to keep it as it is.

~ Oleksii


