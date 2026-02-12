Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBxmF0i4jWl96AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:23:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DED12CF6A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:23:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228780.1534889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUn2-0002bC-CP; Thu, 12 Feb 2026 11:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228780.1534889; Thu, 12 Feb 2026 11:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUn2-0002YJ-8e; Thu, 12 Feb 2026 11:23:20 +0000
Received: by outflank-mailman (input) for mailman id 1228780;
 Thu, 12 Feb 2026 11:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqUn0-0002Y8-Ex
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:23:18 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39f1cf1c-0805-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 12:23:16 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-65a3c6f587cso2407539a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 03:23:16 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65a3cf38c6asm1645441a12.20.2026.02.12.03.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 03:23:15 -0800 (PST)
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
X-Inumbo-ID: 39f1cf1c-0805-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770895396; x=1771500196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUUH0+kVvIv35l5bX6rXtsDFhd85ZqWzs2pLGznf1RI=;
        b=PzY6psfjGrOMv1fz7qTYQkf+nzoQO0YqCGnb6PFkqaxy2zB8l3G+m21AJfWGrk2wWo
         2u6Xnwk+Wd1TuqY/qxiWaRzzVgeuwIXiEnTz088v2C6cZTog/2yBQuNGSZaIG3MqLOGs
         DVZnchNLj+AMgb5yoiu39ZCoIrlaBUQ7ztLxFVhE0WAxSvfPluaxFR6uPDMNGLsWur/H
         Wt+FjbyKMnScS3cNdb4jk4ROIK0brNorn7JWYjdJYf6lBayOY1U5qbHBIDu+nng+KF7y
         ivbsawKUpwJrb2/YgZDRv9GYKUO2evcAeccV2vnkx1aVwy4jPngMFeWdLr9K8+PfOnHB
         2H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895396; x=1771500196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUUH0+kVvIv35l5bX6rXtsDFhd85ZqWzs2pLGznf1RI=;
        b=IcvPv1njpP1qkwHPAulG2mnoGi4q5l+rz41dPc5WtYWH+nji/Ik38OEb8Z6kcyA47v
         tbJPxXEhugxLmwMaOWN7ElB03qzsZRSjwme3dZ9iFOrKd0a8imsyhp8IJ9rggcKuBBY1
         JPommRuFy5OBxgtf0Wtm6fUplbLIjGzdE6M9utwq4gheoxp8Jg5FKqaxSMuBmL/B/dUc
         hh94LcP6rXWxTzCuwTi/Q4udfT2kRdAMcGsXQOnnbu4JNY/yGGc6KhQD5bmS+Y5J3uo9
         gDE+ZqUQjzuTrcqyws2ByoWHgc9HrJ6RpRBuKwZNOerBPiDEFL7jwN/TWzy78z3yj8vr
         y0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb1/nCYi4rCL/GthqoPTwEBn0+TS6qXd5eqVuEkLoNr8jaECFqlTDu6GVpBzX7qjjtZ8cCSpwjI9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzixMIvTlIYoDxOiwYhHGm+wZPoOHsWCgLlEu1DCMsq+8wzL4ua
	mr09EKUXr8jSOwGSUjCsKGZvCNUMYpK71mJhnHB0IqAMPEOsnLQtSVTM
X-Gm-Gg: AZuq6aLYvT6rZ8jityeeyvgCywReTyvC0gJMVMGi18gnyiIf66CYXLBiZnEC6proNUk
	8yJJfWijf17sknngCXeT8QIlh+SZx4ywjxrFR1J9Ewg7G/R+FHBpWM+BtUMACr9uML9TmLsYcFd
	nYQTz/Bp0acIweExqNIvBJKhHxXAagP/T4VChUtD8WOJi/+wte5cNOAtjXvqYjUplEjAjtDnCYq
	JR2fsB67q12O6T1uIzcpsm35dCurRJJ+uKM1padiqWs/+NjUObwCgU8TrWXxR4QHzFDhWolvfei
	Y4mJJtKGTrhzSvzCqI3NCSaZtieJtLNIUnhOhvFSP+5tpBX/NV8oYv/LDfLT+0cbXBAFSWcFEbq
	C4weklDtAZfa+/2oGDo2uhX+XUufWeaMUvcdLZsM4z38kfUxdzl5Ql1la2wkfPzm1Zk5pKE1l2o
	m3SuDLZ7ssHsCXhIrn364m9qxsPA1ZuOTCQGGYhwdU2TgtqodO5Aw0SAV4sKZiZ2urMRadma+Nm
	2w=
X-Received: by 2002:a17:907:5ca:b0:b87:d722:f824 with SMTP id a640c23a62f3a-b8f92df2499mr109779366b.63.1770895395648;
        Thu, 12 Feb 2026 03:23:15 -0800 (PST)
Message-ID: <e46a6473-8fce-4979-90af-eee7fd7bbbe5@gmail.com>
Date: Thu, 12 Feb 2026 12:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <ced640968434a67c150eff90437f83d3b460a36c.1770650552.git.oleksii.kurochko@gmail.com>
 <d73424e2-84f4-497b-a1f4-f3eea5cdeeb3@suse.com>
 <f012a5f5-7526-4d41-b8eb-6f1208991b71@gmail.com>
 <276d4b09-bf67-423e-b824-467405c5866d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <276d4b09-bf67-423e-b824-467405c5866d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A8DED12CF6A
X-Rspamd-Action: no action


On 2/12/26 11:24 AM, Jan Beulich wrote:
> On 12.02.2026 10:37, Oleksii Kurochko wrote:
>> On 2/11/26 3:16 PM, Jan Beulich wrote:
>>> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>>>> Based on Linux kernel v6.16.0.
>>>> Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
>>>> we want to guarantee that if a bit in irqs_pending_mask is obversable
>>>> that the correspondent bit in irqs_pending is observable too.
>>> And the counterpart of this barrier is the one encoded implicitly in
>>> xchg()? Could do with making more explicit, e.g. by way of adding a
>>> code comment there.
>> I thought it would be clear from the paragraph below where xchng_acquire()
>> is mentioned. I'll update the comment to make it more explicit.
> I'm confused. The (bogus) mentioning of xchg_acquire() is in the patch
> description, whereas I suggested a code comment.

Oh, I see. I'll add the a code comment.


>
>>>> @@ -124,3 +125,72 @@ void arch_vcpu_destroy(struct vcpu *v)
>>>>    {
>>>>        vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);
>>>>    }
>>>> +
>>>> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
>>>> +{
>>>> +    /*
>>>> +     * We only allow VS-mode software, timer, and external
>>>> +     * interrupts when irq is one of the local interrupts
>>>> +     * defined by RISC-V privilege specification.
>>>> +     */
>>> What is "when irq is one ..." intended to be telling me? There's no ...
>>>
>>>> +    if ( irq != IRQ_VS_SOFT &&
>>>> +         irq != IRQ_VS_TIMER &&
>>>> +         irq != IRQ_VS_EXT )
>>>> +        return -EINVAL;
>>> ... corresponding code (anymore), afaict.
>> That part should be removed, there is no any sense for it anymore.
>>
>>> Further, who are the prospected callers of this function and its sibling
>>> below? If they're all internal (i.e. not reachable via hypercalls or
>>> emulation on behalf of the guest), this may want to be assertions.
>> Considering your further reply:
>>     Having seen a use in patch 08, I should clarify the "reachable" part here:
>>     It's not the "reachable" alone, but whether the guest has control over the
>>     "irq" value passed. For the example in patch 08 this isn't the case.
>>
>> I think I did not fully understand the part about “the guest has control over
>> the ‘irq’ value passed”, but at the moment I do not have any plans for the guest
>> to pass the irq value directly. (Do you have any examples where it should be
>> needed?).
> No, I don't. This is all for you to sort out.
>
>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>> @@ -54,6 +54,25 @@ struct arch_vcpu {
>>>>        register_t henvcfg;
>>>>        register_t hideleg;
>>>>        register_t hstateen0;
>>>> +    register_t hvip;
>>>> +
>>>> +    register_t vsie;
>>>> +
>>>> +    /*
>>>> +     * VCPU interrupts
>>>> +     *
>>>> +     * We have a lockless approach for tracking pending VCPU interrupts
>>>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>>>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>>>> +     * in irqs_pending. Our approach is modeled around multiple producer
>>>> +     * and single consumer problem where the consumer is the VCPU itself.
>>>> +     *
>>>> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
>>>> +     * on RV32 host.
>>>> +     */
>>>> +#define RISCV_VCPU_NR_IRQS 64
>>> What is this 64 deriving from? IOW - can it be some kind of expression,
>>> helping the reader?
>> Originally it derives from the width of mideleg, mie, mvien, mvip, and mip (and
>> their counterpars for other modes) what means that RV32 will have no more then
>> 32 local interrutps, but considering that RISC-V AIA spec tells ...:
>>
>>     Table 2.1 lists both the CSRs added for machine level and existing machine-level
>>     CSRs whose size is changed by the Advanced Interrupt Architecture. Existing CSRs
>>     mie, mip, and mideleg are widended to 64 bits to support a total of 64 interrupt
>>     causes.
>>     For RV32, the high-half CSRs listed in the table allow access to the upper 32
>>     bits of registers mideleg, mie, mvien, mvip, and mip. The Advanced Interrupt
>>     Architecture requires that these high-half CSRs exist for RV32, but the bits they
>>     access may all be merely read-only zeros.
>>
>> ... that for RV32 it was widened to 64, so 64 appears here. I haven't used some AIA
>> specific name for constant 64 as in case if AIA isn't used it is more then enough
>> to cover PLIC case, for example.
> Thing is that with RV128 in mind I wonder whether 64 is correct, or whether it
> e.g. wants to be max(BITS_PER_LONG, 64).

If to look at registers which are used now in hypervisor [1][Table 3] and are connected
to the bitmask (or their counterparts mentioned in the quote [2][Table 1]) are
hard-coded to 64 and it doesn't dependent on architecture bit-ness. And this is true
for AIA.

But on the other hand in RISC-V privilege spec the length of hvip is defined as
HSXLEN which could be 128 in the case of RV128 and to not depend only on AIA spec
likely it would be better to use suggested by you way to define RISCV_VCPU_NR_IRQS.

[1] https://github.com/riscv/riscv-aia/blob/main/src/CSRs.adoc#hypervisor-and-vs-csrs
[2] https://github.com/riscv/riscv-aia/blob/main/src/CSRs.adoc#machine-level-csrs

Thanks.

~ Oleksii


>
> Jan

