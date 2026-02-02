Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AByhFbN5gGne8gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:17:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7161CABB7
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218504.1527253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqzD-0006fg-Bk; Mon, 02 Feb 2026 10:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218504.1527253; Mon, 02 Feb 2026 10:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqzD-0006cx-8l; Mon, 02 Feb 2026 10:16:51 +0000
Received: by outflank-mailman (input) for mailman id 1218504;
 Mon, 02 Feb 2026 10:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lssc=AG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vmqzB-0006cb-Ug
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 10:16:49 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48a805b4-0020-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 11:16:48 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so47028295e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 02:16:48 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce70sm44501951f8f.27.2026.02.02.02.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 02:16:47 -0800 (PST)
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
X-Inumbo-ID: 48a805b4-0020-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770027408; x=1770632208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+RJt+XfnsFHr5kOyDQqA5I1eEtHsFULlWrg8mNPeRUg=;
        b=bX/t+lK/5JzZDnWXqS/eX9ikGUEjtZRgRz5Or+gCc+bQsE+wGMUFphYM6RHJdaBf5B
         sCERnOjQ/MP0JCdJb45iXXH4A0xb7T2vX0Equ74kPMX2S2uPFRrbFtV2IZHdMOydMfmG
         al82OOTSzC09MHYTHM241pxISuilM2L1p06229keKcjsCnm4vIKgfnbIyq1TBOSSIuI5
         KWL0XtoLHQlpI5aQ/ez4YtA34XK8xvoTFIDEdKSpoTEb4mPDKPNwR5YFM4+XfZgtfIlS
         dMCVBz5SzVvmi0whKotdtNJtsbrx7VktHIffNwqKE8VgAMT3MGupdhO5jA/TU7Tms9ux
         0b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027408; x=1770632208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RJt+XfnsFHr5kOyDQqA5I1eEtHsFULlWrg8mNPeRUg=;
        b=tSMkwjwsKlmRAYpIaV5xIjCQeKxbTpQUdgjH4vfO9L4nnQ1ngbFmncA9/2mM5I0aak
         va+ssXIg2+NBcd+Mu9PAdYL0xctBFKvfQOl+D2FQ2hSnrAlr3rHRP3RBHra+wx8OSvQm
         51W5+SPvtbG0kp4/FmXkB116swI6DSDmQU2fCiNbp+oadS/HrwnU+bxl/J34qUE9/zo3
         N3Ymj5j+dnczfoVIKneUvBesr1Nvkuoaffms9I0a0mWvzegTHjsU2yWLoIMklkPeHjci
         mXvlJB07Tj75JoOEbqko+rxYt5lkwH0mokZVzv2PD6M2sT2ojC4f8DSQjGX1DNMKVPSM
         NT8w==
X-Forwarded-Encrypted: i=1; AJvYcCX8nT6mevb3JCgwohyJ2/cYte9/+pObETApjEwOiKHju3NGee/yvRHPO0g2ed43dbgXggq1q+6zqPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM0GTnR+VlyoIAeX+TuXDXM5gvuhU4qJ3QrKuMJ3AN9F/YjtVX
	VQnJgy9l8I4TqWSvnjMyokQgxxlgY487mW04V13UNajAIKmws4JVdzzB
X-Gm-Gg: AZuq6aKJWTeJ9in3jU7sAxw0iDl8jUPmFDfqNZ5Lkp4CaFDDvp08/b0obVj1+t/3Bjd
	ZaEFaOdEK1vVGAunuDovxsh8w7wkIfSB0bsQEV5c56bddPoNgTPfspy/OJHeZ9RP8JDDwk6v/O7
	7q7unM7j/AtDdNBEWEy7D6nv2scdnot5koU32dflskkA1lCSlPOn52tLLWDvshYLRO0vnf06MHy
	TCJUnTseQxoPDap1NUQBirho91jKBD+Ihks9q8IEcvAJ3GHc4Hcxp+6XruiMNC0zz7gV4K7g4zL
	xRwK+a7oGB9TdWU/UwU3ayzjbaaoaXJ768pcZXbUx0alzZNf6o+TG6MGKr43cOI7TI2jWc5wpig
	4FmyLZwAwq3/FhZQlKMi5qOflRvuh5x7ZrP2asj72SioH3WDiQkpjdiYJPDeWMRE8w2/2YI2RN7
	cJa0FiIpDdPVuuqbbcCFw1o7oZtBjNVmlV9+ATT0WsVBryLA+wgRbX5rVgVPdkLrs=
X-Received: by 2002:a05:6000:4205:b0:433:1d30:44c with SMTP id ffacd0b85a97d-435f3aac3cdmr13582472f8f.43.1770027407681;
        Mon, 02 Feb 2026 02:16:47 -0800 (PST)
Message-ID: <f2523125-2adb-410d-ae84-c9468ad9a151@gmail.com>
Date: Mon, 2 Feb 2026 11:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <7b5b7cceb8a131b198d33a83f49ed112ff310389.1769099885.git.oleksii.kurochko@gmail.com>
 <b0f9073f-1c27-4162-a0b4-3007ff365bf2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b0f9073f-1c27-4162-a0b4-3007ff365bf2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7161CABB7
X-Rspamd-Action: no action


On 1/29/26 5:44 PM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> Based on Linux kernel v6.16.0.
>>
>> Add lockless tracking of pending vCPU interrupts using atomic bitops.
>> Two bitmaps are introduced:
>>   - irqs_pending — interrupts currently pending for the vCPU
>>   - irqs_pending_mask — bits that have changed in irqs_pending
>>
>> The design follows a multi-producer, single-consumer model, where the
>> consumer is the vCPU itself. Producers may set bits in
>> irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
>> performed only by the consumer via xchg_acquire(). The consumer must not
>> write to irqs_pending and must not act on bits that are not set in the
>> mask. Otherwise, extra synchronization should be provided.
>>
>> On RISC-V interrupts are not injected via guest registers, so pending
>> interrupts must be recorded in irqs_pending (using the new
>> vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
>> HVIP before returning control to the guest. The consumer side is
>> implemented in a follow-up patch.
>>
>> A barrier between updating irqs_pending and setting the corresponding
>> mask bit in vcpu_set_interrupt() / vcpu_unset_interrupt() guarantees
>> that if the consumer observes a mask bit set, the corresponding pending
>> bit is also visible. This prevents missed interrupts during the flush.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> The use of barriers here matches the (Linux) specification, so
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> However, ...
>
>> @@ -130,3 +131,43 @@ void arch_vcpu_destroy(struct vcpu *v)
>>   {
>>       vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info));
>>   }
>> +
>> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
>> +{
>> +    /*
>> +     * We only allow VS-mode software, timer, and external
>> +     * interrupts when irq is one of the local interrupts
>> +     * defined by RISC-V privilege specification.
>> +     */
>> +    if ( irq != IRQ_VS_SOFT &&
>> +         irq != IRQ_VS_TIMER &&
>> +         irq != IRQ_VS_EXT )
>> +        return -EINVAL;
>> +
>> +    set_bit(irq, v->arch.irqs_pending);
>> +    smp_mb__before_atomic();
>> +    set_bit(irq, v->arch.irqs_pending_mask);
> ... isn't it too heavy a barrier here? You only need ordering of writes,
> without any regard to reads, don't you?

It is true, we could have FENCE W, W here. I'll update in the next patch
version.

~ Oleksii


