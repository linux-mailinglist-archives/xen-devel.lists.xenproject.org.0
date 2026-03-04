Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGX1Nt5KqGmvsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:08:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC920240C
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245577.1544938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnpW-00007e-HH; Wed, 04 Mar 2026 15:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245577.1544938; Wed, 04 Mar 2026 15:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnpW-00005P-Dp; Wed, 04 Mar 2026 15:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1245577;
 Wed, 04 Mar 2026 15:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDHP=BE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vxnpU-0007oB-N2
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:08:04 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0975a6e-17db-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 16:08:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so43019485e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 07:08:02 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b0549600sm29368404f8f.35.2026.03.04.07.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 07:08:01 -0800 (PST)
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
X-Inumbo-ID: f0975a6e-17db-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772636882; x=1773241682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n72m+QEc/gPGrAZ2170RYO1NvK3dfHMFAijzDzbtdbY=;
        b=iFXu8W6vTKrE4/Kv5A02HcHRfNzr5UafP6i/zP16o+m7Uy5DxUkQ8UXEfPnz3rkyFt
         9QHxrEokUzcHHfSBO/r0kyCHQIN1z/PCLLI+MwYtx0tbyTYhUjdknIxxFgkNeJKZM/8O
         UaoZOQOSVcqYtREZiFFWJb1xNMuuyXnoniUHGsTr0BvWgGSTAyjMDpudpw/ygvjs0tOm
         4W6IWK74S5vg8Aa027j4W3CX8kYEdK6zqgO0Z9KyDjEbxBMr8ZlNzBiDGzk/P8oGormd
         9glSoz30qNg6IOF8YFgcJHplQQgV6NmrX8rvhVeTDxMQKAdmJa0UdrD5SfRmcm9duaC9
         F0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636882; x=1773241682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n72m+QEc/gPGrAZ2170RYO1NvK3dfHMFAijzDzbtdbY=;
        b=bWxHaas0bjsX60TyQpeFVfc0WsXcfD2QLriHcJlHEhQxb2eTm54T/fkyYYZyXZkxMk
         1bqJCswfUnu9ZR/E+TubteQMSZx96hWxDwsOXc+d2/AddAGWfUEFAWGHt4G76yohhvCS
         XHtVZueevHkNRDdGxeg6pGW7+q63tGkWNAsKMKt7JJKwQ9fm5dTSnv+0DYEeA/IysNi7
         XoqxoJvNpd4FW+cxCQP9GWBto6p69hN514RSLoyRWv0WSW03WHqDco+YmntkbQI92c6a
         zP5IiXuf6+NdGVQIzvC3H4fYhQBKId8pzeS3UsaFugB5jhv62OSFioaEy82PXMWEoipl
         tKDw==
X-Forwarded-Encrypted: i=1; AJvYcCXe4yOnbwQfEjyjtQCkt4vB1hmfDJ9PB8hknUMv8THtpxW+rx53jE7pFDsdFI1jDNwfgujWnrBZkhw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyh8Wi1jp+PBltbgZSTaBOs59lXb4aladp2oBujuRWNvBvBwLGg
	bhv/9M83AyhW2+tAwXIv1MsfMDFqZ9cpoBVGVxNXtVUlFSFZvAacLdrY
X-Gm-Gg: ATEYQzyZC2ICB035B3ljaK2X2XaWDu6QfL2UwCjYAHGx1TPb7DRI9e/DWZ9dAkyqbye
	gJRWJXol99hH5xKJf+LqpIPJPb67huictciJrSmSFD7D9N/zS74NR+J7sSCvDiAcF5jNOdtxiIf
	vMM9MLtbnyqpXEQyk2i/vLXmVI318v2CZ30JScQq7YaGymD4hWyZdPCx7o9lHMed8Li5jwv4CK0
	+7+z2rSHnEcmr2t4K/7jOngMIFMJL+3cdN6mjdjsGZeG84r/IVB2K9RkJDqborIAdCkk259CUbp
	eUpnCGQPRQTF6VE+Wh9G15hsaDCGApU6MJkFIZud3qjiZDObZlOx0+EbrSTaAz0S2fQE20EYmBI
	/VsY/0gJHNng/4eUWPAdCjMdEhQjj6PUOkD4xuyxFU3IIraG6BqlHYozUc475Uot0qEWN+al/iL
	gYrEKCnBwn3kbElON+EObikFu82hnnlRQ74rzP9DtuGYOSC/GdyKM/Pl98wgD4SJHh1wEbeCPyh
	NM=
X-Received: by 2002:a05:600c:4e8b:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-485198480d8mr41405255e9.9.1772636881929;
        Wed, 04 Mar 2026 07:08:01 -0800 (PST)
Message-ID: <32bd2cc9-86ee-4470-af7c-f52838e0c4e1@gmail.com>
Date: Wed, 4 Mar 2026 16:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a1954e9a30abace453f4604a47b43ecbcebe350a.1772016457.git.oleksii.kurochko@gmail.com>
 <6357ad3f-85c8-4fe4-a2c8-8b0a0a97f1b3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6357ad3f-85c8-4fe4-a2c8-8b0a0a97f1b3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4CCC920240C
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action


On 3/3/26 2:35 PM, Jan Beulich wrote:
> On 26.02.2026 12:51, Oleksii Kurochko wrote:
>> Based on Linux kernel v6.16.0.
>> Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
>> we want to guarantee that if a bit in irqs_pending_mask is obversable
>> that the correspondent bit in irqs_pending is observable too.
>>
>> Add lockless tracking of pending vCPU interrupts using atomic bitops.
>> Two bitmaps are introduced:
>>   - irqs_pending — interrupts currently pending for the vCPU
>>   - irqs_pending_mask — bits that have changed in irqs_pending
>>
>> The design follows a multi-producer, single-consumer model, where the
>> consumer is the vCPU itself. Producers may set bits in
>> irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
>> performed only by the consumer via xchg(). The consumer must not write
>> to irqs_pending and must not act on bits that are not set in the mask.
>> Otherwise, extra synchronization should be provided.
>>
>> On RISC-V interrupts are not injected via guest registers, so pending
>> interrupts must be recorded in irqs_pending (using the new
>> vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
>> HVIP before returning control to the guest. The consumer side is
>> implemented in a follow-up patch.
>>
>> A barrier between updating irqs_pending and setting the corresponding
>> mask bit in vcpu_set_interrupt()/vcpu_unset_interrupt() guarantees
>> that if the consumer observes a mask bit set, the corresponding pending
>> bit is also visible. This prevents missed interrupts during the flush.
>>
>> It is possible that a guest could have pending bit in the hardware
>> register without being marked pending in irq_pending bitmap as:
>>    According to the RISC-V ISA specification:
>>      Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
>>      interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
>>      is an alias (writable) of the same bit in hvip.
>>    Additionally:
>>      When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
>>      zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
>>      hie.VSSIE.
>> This means the guest may modify vsip.SSIP, which implicitly updates
>> hip.VSSIP and the bit being written with 1 would also trigger an interrupt
>> as according to the RISC-V spec:
>>    These conditions for an interrupt trap to occur must be evaluated in a
>>    bounded   amount of time from when an interrupt becomes, or ceases to be,
>>    pending in sip,  and must also be evaluated immediately following the
>>    execution of an SRET  instruction or an explicit write to a CSR on which
>>    these interrupt trap conditions expressly depend (including sip, sie and
>>    sstatus).
>> What means that IRQ_VS_SOFT must be synchronized separately, what is done
>> in vcpu_sync_interrupts(). Note, also, that IRQ_PMU_OVF would want to be
>> synced for the similar reason as IRQ_VS_SOFT, but isn't sync-ed now as
>> PMU isn't supported now.
>>
>> For the remaining VS-level interrupt types (IRQ_VS_TIMER and
>> IRQ_VS_EXT), the specification states they cannot be modified by the guest
>> and are read-only because of:
>>    Bits hip.VSEIP and hie.VSEIE are the interrupt-pending and interrupt-enable
>>    bits for VS-level external interrupts. VSEIP is read-only in hip, and is
>>    the logical-OR of these interrupt sources:
>>      • bit VSEIP of hvip;
>>      • the bit of hgeip selected by hstatus.VGEIN; and
>>      • any other platform-specific external interrupt signal directed to
>>        VS-level.
>>    Bits hip.VSTIP and hie.VSTIE are the interrupt-pending and interrupt-enable
>>    bits for VS-level timer interrupts. VSTIP is read-only in hip, and is the
>>    logical-OR of hvip.VSTIP and any other platform-specific timer interrupt
>>    signal directed to VS-level.
>> and
>>    When bit 10 of hideleg is zero, vsip.SEIP and vsie.SEIE are read-only zeros.
>>    Else, vsip.SEIP and vsie.SEIE are aliases of hip.VSEIP and hie.VSEIE.
>>
>>    When bit 6 of hideleg is zero, vsip.STIP and vsie.STIE are read-only zeros.
>>    Else, vsip.STIP and vsie.STIE are aliases of hip.VSTIP and hie.VSTIE.
>> and also,
>>    Bits sip.SEIP and sie.SEIE are the interrupt-pending and interrupt-enable
>>    bits for supervisor-level external interrupts. If implemented, SEIP is
>>    read-only in sip, and is set and cleared by the execution environment,
>>    typically through a platform-specific interrupt controller.
>>
>>    Bits sip.STIP and sie.STIE are the interrupt-pending and interrupt-enable
>>    bits for supervisor-level timer interrupts. If implemented, STIP is
>>    read-only in sip, and is set and cleared by the execution environment
>> Thus, for these interrupt types, it is sufficient to use vcpu_set_interrupt()
>> and vcpu_unset_interrupt(), and flush them during the call of
>> vcpu_flush_interrupts() (which is introduced in follow up patch).
>>
>> vcpu_sync_interrupts(), which is called just before entering the VM,
>> slightly bends the rule that the irqs_pending bit must be written
>> first, followed by updating the corresponding bit in irqs_pending_mask.
>> However, it still respects the core guarantee that the producer never
>> clears the mask and only writes to irqs_pending if it is the one that
>> flipped the corresponding mask bit from 0 to 1.
>> Moreover, since the consumer won't run concurrently because
>> vcpu_sync_interrupts() and the consumer path are going to be invoked
>> sequentially immediately before VM entry, it is safe to slightly relax
>> this ordering rule in vcpu_sync_interrupts().
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v6:
>>   - Drop for the moment:
>>         /* Read current HVIP and VSIE CSRs */
>>         v->arch.vsie = csr_read(CSR_VSIE);
>>     from vcpu_sync_interrupts() as it isn't used at the moment and will
>>     be introduced when a usage will be more clear.
> With this, shouldn't the RV32 related #ifdef in vcpu_sync_interrupts() also
> go away?

It could be done in this way. It's just a hint for a person who will add RV32
not to miss to update vcpu_sync_interrupts() properly. Lets drop that for now
too and deal with that during review if a person will miss to make correspondent
update of vcpu_sync_interrupts() for RV32.

>
>> +void vcpu_sync_interrupts(struct vcpu *v)
> The sole caller passes "current". Are other uses of this function planned?
> If not either "current" wants directly using here, or minimally the parameter
> wants renaming to "curr". In fact ...
>
>> +{
>> +    unsigned long hvip = csr_read(CSR_HVIP);
> ... this suggests it's unlikely for the function to be valid to call with
> other than "current".

Agree, I will drop v argument and use current inside vcpu_sync_interrupts().

Thanks.

~ Oleksii


