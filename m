Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cnP/Na5xMWrhjQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:54:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E296917E2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:54:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Kr68QMoo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339444.1600654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZW6p-0000OQ-E0; Tue, 16 Jun 2026 15:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339444.1600654; Tue, 16 Jun 2026 15:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZW6p-0000LY-Ay; Tue, 16 Jun 2026 15:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1339444;
 Tue, 16 Jun 2026 15:53:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZW6n-0000LS-P4
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:53:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZW6n-00AfZ8-58
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:53:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a317166-e002-0a2a0a5209dd-0a2a4508e51a-28
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:53:49 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a31718d-63b5-0a2a45080019-d155da34cc9c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:53:49 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-bec3f69d343so693854566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:53:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfe5116f409sm635215766b.23.2026.06.16.08.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:53:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781625228; x=1782230028; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qh1td2NvM8rwISEQwyWyxR4zz9mSe6DqWtgncALY9vA=;
        b=Kr68QMoouGVJewM0RF00akQJS2KnJleTvAX9zdgQchGyqFKP8j5zbzeXpxjylivvcN
         mXEizVHgnZ/lX7+XgGXRa2AjtpkJYgV78ghKliJrvXAuE56rpLJFWODfewzjaZL4JJE5
         E5U0LXZLVE7ljhql7RH9dU5D/84rYcstV6ey72tg3duBN89cgzihdliifm/BlnPDwl7t
         TN91oJfH0AZNETcupQSrDgs0LReXVT+CEwrMkgGxm2RY17+A7GdKs0uNhtFD1IN/O6Gm
         P7iMJoJNXebsPiNLQ4C6uaD2XhW/ZgS3IfVHc1F8zmQjxUc4c2czitiQu6jVHoz+PE/F
         K2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625228; x=1782230028;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh1td2NvM8rwISEQwyWyxR4zz9mSe6DqWtgncALY9vA=;
        b=VGPzbSpx7cbTZJXwrCNF44ECKGrSuoHZkvYmDo0FlgsKPeUw3/a63OwllD5F+ABVgc
         jfE9VwR00xyxiYm8nAb+snxBscSMBjj6z1/tpMaHpGEx3YoH0PgSTiAFecOMFpG4NxLS
         8QBxM9v3rCBfQBlV+UWPOFQCHwW7oi6/8zSW0SvycGHFFR89tSLZ7EzOPohL4/VXkuAO
         B9tIgVgJg3LYXpcM/1ixk7HZQZIU99LcIh6+tFWQk3xX0fp5GINTokE49jHVJqN78og0
         U2OwoSBKUTXjffyIlgP7PgERnHIGXL6OYJRbp1KGJ30Tc99HddkQghF+h4CHLm5H8VFl
         G63A==
X-Forwarded-Encrypted: i=1; AFNElJ+3CmEyjj7rt1M8vz0a64WRfHN+npW7ZtGWhTCT8la4ZoAUXZ+8sqOZ2or+ULY9iKrB6QwC7kZPTyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7Qz3Ompp54f4VSJeDxQnz77kJ6uSQ6Y/1hFjIdK99xdzGR9NG
	k/du2aXkatmvd+Mq1xYtYUdMnGHdhDcNorjXfVO6UA51HtP/dNXsULWT
X-Gm-Gg: Acq92OGqU3G9HBNVMZDE2XIRDSXhvGagcVeKe1MCVLO/JwWoUaqY9Gy2azKX6JPb+uJ
	UVCcKAwjV2RedK3iv8QDQLF2o5AaVQys8uNWPurPVraJzhLb6CvW2CDoOwO9Eff1JUai6X8UiHw
	fZu+aHUtOmyVTXE0+3KNTmkM6Ctfw/bqYjV1zIXIYjwPZ8hJpyvwu8rSfbjb+hQFcI8RwqVw6Fy
	bidfILCnSCt+o0dFx2m201JCmpLDIclIHnjQhJu2mJHEjkO5erVlH9tNNG32/WJAxTpHioPsFla
	by6raKEB0kCpJx5CBkRKoVDzoZaGZaEuGauDuqqZP7SDOOCYM18fRciayqjn2MxbdU93xilJ2Hx
	+M3+zd0XHudSUjXubt0lpzl7cf3401bZJbUUEW50YkuCgbk7POlp6II2XWzZy5qFgqxRdWaLhBF
	crxInpLfb/bSA2N4B/hZFIm0u+z98gr3aY7IAJZ9WwQVSREeFQzwKvOduPD7lwtKnVCB4eRbbpJ
	hOAdA==
X-Received: by 2002:a17:907:807:b0:bef:89d9:9f08 with SMTP id a640c23a62f3a-c05a5219bcbmr19796766b.19.1781625226561;
        Tue, 16 Jun 2026 08:53:46 -0700 (PDT)
Message-ID: <554937ff-726a-4eb9-bd8a-b8dd27850775@gmail.com>
Date: Tue, 16 Jun 2026 17:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/26] xen/riscv: manage IRQ_DISABLED flag in APLIC irq
 enable/disable callbacks
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <6121dce6347f03030a2de05f29c1780b6fc0cd01.1778250616.git.oleksii.kurochko@gmail.com>
 <4580492d-c5e7-454d-b4a9-4bc959268cfb@suse.com>
 <3da5b194-772c-4fb9-8b0a-194c1415dc87@gmail.com>
Content-Language: en-US
In-Reply-To: <3da5b194-772c-4fb9-8b0a-194c1415dc87@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1781625229-BCF62DB1-900F56F2/10/73395122804
X-purgate-type: spam
X-purgate-size: 5576
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07E296917E2



On 6/16/26 12:24 PM, Oleksii Kurochko wrote:
> On 6/15/26 5:53 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> desc->status is only set once during setup_irq(), but interrupts can be
>>> enabled/disabled at runtime, so update it in the corresponding 
>>> callbacks.
>>>
>>> wmb() in aplic_irq_enable() ensures do_IRQ(), which can fire immediately
>>> after the interrupt is enabled, sees the updated desc->status.
>>
>> This doesn't look entirely correct. Aiui ...
>>
>>> No rmb() is
>>> needed on the do_IRQ() side because desc->status is read under a 
>>> spinlock,
>>> which implies an acquire barrier.
>>>
>>> No barrier is needed in aplic_irq_disable() because the hardware 
>>> disables
>>> the interrupt before the status is updated, so do_IRQ() cannot fire, and
>>> spin_unlock() makes the updated value visible.
>>>
>>> Fixes: d4676a1398bc5 ("xen/riscv: implementation of aplic and imsic 
>>> operations")
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v2:
>>>   - New patch.
>>> ---
>>>   xen/arch/riscv/aplic.c | 5 +++++
>>>   xen/arch/riscv/irq.c   | 3 ---
>>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -161,6 +161,9 @@ static void cf_check aplic_irq_enable(struct 
>>> irq_desc *desc)
>>>       spin_lock(&aplic.lock);
>>> +    desc->status &= ~IRQ_DISABLED;
>>> +    wmb();
>>> +
>>>       /* Enable interrupt in IMSIC */
>>>       imsic_irq_enable(desc->irq);
>>
>> ... you want to order the ->status update ahead of the imsic_irq_enable()
>> operation. Yet that's a CSR write. Do fences really cover that?
> 
> Good point. The RISC-V ISA spec is clear that fence orders memory 
> predecessor and successor operations. CSR accesses are architecturally a 
> distinct category. fence w,w carries no formal guarantee that a 
> preceding memory store to desc->status becomes visible before a 
> subsequent CSR write.
> 
> Also, according to the spec:
> 
> Each RISC-V hart normally observes its own CSR accesses, including its 
> implicit CSR accesses, as performed in program order. In particular, 
> unless specified otherwise, a CSR access is performed after the 
> execution of any prior instructions in program order whose behavior 
> modifies or is modified by the CSR state and before the execution of any 
> subsequent instructions in program order whose behavior modifies or is 
> modified by the CSR state. Furthermore, an explicit CSR read returns the 
> CSR state before the execution of the instruction, while an explicit CSR 
> write suppresses and overrides any implicit writes or modifications to 
> the same CSR by the same instruction.

After inspecting of RISC-V spec again I found that:
To enforce ordering in all other cases, software should execute a FENCE 
instruction between the relevant accesses. For the purposes of the FENCE 
instruction, CSR read accesses are classified as device input (I), and 
CSR write accesses are classified as device output (O).

So wmb() should be enough in the current case as wmb is RISCV_FENCE(ow, 
ow). I will add the following comment:
     /*
      * wmb() (fence ow,ow) orders the ->status memory write (w) before the
      * CSR write inside imsic_irq_enable() (device output, o on RISC-V).
      * arch_lock_release_barrier() uses fence rw,rw which does not cover
      * device output (o), so wmb() is required to close that gap.
      */
     wmb();

> 
>>
>>> @@ -189,6 +192,8 @@ static void cf_check aplic_irq_disable(struct 
>>> irq_desc *desc)
>>>       /* Disable interrupt in IMSIC */
>>>       imsic_irq_disable(desc->irq);
>>> +    desc->status |= IRQ_DISABLED;
>>> +
>>>       spin_unlock(&aplic.lock);
>>>   }
>>
>> The ->status write becoming globally visible ahead of imsic_irq_disable()
>> doing its work is not an issue? In the paragraph in the description you
>> again appear to assume that the CSR write and the memory write of the
>> spin-unlock are ordered wrt one another.
> 
> The ordering is intentional: desc->status |= IRQ_DISABLED is placed 
> after imsic_irq_disable() so that do_IRQ() can never observe 
> IRQ_DISABLED while the interrupt is still enabled in hardware.
> 
> Regarding the fence/CSR ordering concern: imsic_irq_disable() writes to 
> the local hart's IMSIC interrupt file, so do_IRQ() for this irq can only 
> run on the same hart. Same-hart program order already guarantees that 
> both the CSR write and the desc->status update are visible in the 
> correct sequence before any subsequent interrupt handler runs.

And here I re-read your comment and IIUC that we want to guarantee that
desc->status |= IRQ_DISABLED; isn't globally visible until 
imsic_irq_disable() is executed. Then we need the following here:

+    /*
+     * wmb() (fence ow,ow) ensures the CSR write (device output, o) inside
+     * imsic_irq_disable() is globally visible before ->status is marked
+     * IRQ_DISABLED. imsic_irq_disable()'s spin_unlock uses fence rw,rw
+     * which does not order device output (o) writes before subsequent
+     * memory writes (w), so an explicit wmb() is needed here.
+     */
+    wmb();

Would you be okay with such barriers or you still think it is needed mb()?

Also I think considering that I'll added the comments above wmb() I 
could drop what I mentioned in commit message regarding barriers().

~ Oleksii

