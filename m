Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMZnKt2tlmlkjQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 07:29:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4815C638
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 07:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236071.1538863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsxXh-0007Hg-3O; Thu, 19 Feb 2026 06:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236071.1538863; Thu, 19 Feb 2026 06:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsxXh-0007Ej-0b; Thu, 19 Feb 2026 06:29:41 +0000
Received: by outflank-mailman (input) for mailman id 1236071;
 Thu, 19 Feb 2026 06:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsxXf-0007EX-Dq
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 06:29:39 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cdd272d-0d5c-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 07:29:37 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48374014a77so5709725e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 22:29:37 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a43:c9a6:464e:db69:c159?
 (p200300cab70c6a43c9a6464edb69c159.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a43:c9a6:464e:db69:c159])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483801ff9b3sm351597585e9.13.2026.02.18.22.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 22:29:36 -0800 (PST)
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
X-Inumbo-ID: 5cdd272d-0d5c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771482577; x=1772087377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3sKEaljeyo+hvAceiNgNRSLN9kJbwnsbovIFAa78zsk=;
        b=ORo3d6O9IAUQj45vt2jHyjLo4M4ZwVVp3erzp+dMbVDOb9CI7aFDGXje09Z3T6pc4g
         yQRyDKv4bSN8Tp8i72H3g6y7OynScbd9GqL3brRi9DF8RBeOmVgBVCLwbZME4wxhvCRq
         OlC9J8EerpJPD+6R8ULvLlWUFM8DoPkInglk05Jey9URVGA2qbPH2+vOgJmpjMn3vWdc
         aR+bV2Xq3dkCwbYFVsvx/aLdNOZn/8LWISQ8A2iyIismpIqK2cryAOZAxaYXxtdY7RdE
         g5kx1DQ0BtISLfCxR5QjujUwfKnCrUO2t16r/zUcSd8kPknLu4nA5BvWt4vHIuicmzL8
         BRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771482577; x=1772087377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sKEaljeyo+hvAceiNgNRSLN9kJbwnsbovIFAa78zsk=;
        b=vtHx/5NKaikZkFiJQnPO2A9p4Le0yrQw7sHMvOSO4xjvNBdBgiCHgaiHof3mk+8i6u
         0B9k+1DswmIbDKln6udgtVRVRIhObPadaB1Xnky57OOc9d6CzjqwR5ni08akL/0qWQ0/
         LPAVjGrST1ISZuIKbIkWT7WPq94Wg7wPBZ5M+wwC8StEqBDpxIdPjFsSbVyyRiM4UdSC
         GnGr0QE6Gd0aFI7HTiDIF0A54idIo99P1lNfZDUXmQ8+BmwOJxFsFNOzztlI3T+wV3I8
         tkHz2Bwz2k+M19GCYL9KNxkOsYb/3Aun80Q4JM6zkA72ebZHaIT15ezkEMajEE8rxb61
         QjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8K8m2A6O33zz+YEsh9bkxkHODYmjyD/JtgHrKWQsOn/bhPtB9muyEn0iBQ+5QFt1PpDI0tazzS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxe3UtFx0DYAw8yI7EziVIXbC4O1IsAPIn8H+cJmVHSvxfvkCB9
	xahqSnB4VMxcF0ln7b8pLCvyPxmgPU2mk4PWlVNXCWCS1DZCHBFK4aOFki0PBZa/7A==
X-Gm-Gg: AZuq6aJkk2kOHMT9u4Sc6EpZQK4+B58UNPezY+F4qfrcQgTGAReqrqGE7pxt1rekgao
	P5SaSSNuuNuUNEjY309yLK082sfosUtrW8NFGlKoqKXuAWy67C97gCe0iSxhUqMIIJpT+tgMyNK
	s78tCNBiEwJ6pm98sTN3dpRbxBkK9bQn4NKU//d54V8S+Bh2uaN0UgIgMCWqsxoekR2bVNcASr7
	5cqKpFbJo3gdILHnKQ4UiaYf7N44droWLljCQYmVJi0zmvvqHDK/BLoIPJiU1yutvxjt0Pl/vzH
	xaopoEvEFXw1krt2pS8w+HRL7YrjmS50KL7vOPYh2K/dT7wLBwl3MLgVcZ5bmvTEMZ+f8F5tIbT
	xbu2Ld88TfpCeUmW9gLKiTh1wl4OGE7brRnofA4fILbQRueJdCHiLrtM1zbb1JAmfAwCgDbjWvS
	8ktNnzEmdh6qyX2lDQgqnV4qSjzHPzkmwfVBm/Ocu5Pa34QtAC6njxr5lI/bWx08n7txEdK4GRn
	fkrIlsB1QnwC1wJieYmIwlTgl7f0Ruv9M0M/1avYjPFbUITKpYPHWXLJD4c
X-Received: by 2002:a05:600c:3552:b0:483:3380:ca0c with SMTP id 5b1f17b1804b1-48373a636d6mr356567435e9.35.1771482576600;
        Wed, 18 Feb 2026 22:29:36 -0800 (PST)
Message-ID: <3a6ad6f9-76d0-4f50-b741-4960a77d2f5c@suse.com>
Date: Thu, 19 Feb 2026 07:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: add p2m context switch handling for VSATP
 and HGATP
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
 <a71b3cc7-9ac1-4cec-8898-bda5e8ee644e@gmail.com>
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
In-Reply-To: <a71b3cc7-9ac1-4cec-8898-bda5e8ee644e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,lists.xenproject.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.994];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 20E4815C638
X-Rspamd-Action: no action

On 18.02.2026 17:58, Oleksii Kurochko wrote:
> 
> On 2/13/26 5:29 PM, Oleksii Kurochko wrote:
>> Introduce helpers to manage VS-stage and G-stage translation state during
>> vCPU context switches.
>>
>> As VSATP and HGATP cannot be updated atomically, clear VSATP on context
>> switch-out to prevent speculative VS-stage translations from being associated
>> with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
>> required order.
>>
>> Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
>> only when required (e.g. on VMID reuse or generation change).
>>
>> This provides the necessary infrastructure for correct p2m context switching
>> on RISC-V.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - Add comment above p2m_ctxt_switch_{to, from}().
>>   - Code style fixes.
>>   - Refactor p2m_ctxt_switch_to().
>>   - Update the comment at the end of p2m_ctxt_switch_from().
>>   - Refactor the code of p2m_handle_vmenter().
>> ---
>> Changes in v2:
>>   - Add vsatp field declaration to arch_vcpu.
>>   - s/p2m_ctx_switch_{from,to}/p2m_ctxt_switch_{from,to}.
>>   - Introduce p2m_handle_vmenter() for proper handling of VMID,
>>     hgatp and vsatp updates.
>>   - Introduce is_p2m_switch_finished and init it inisde
>>     p2m_ctx_switch_to() for furhter handling in p2m_handle_vmenter().
>>   - Code style fixes.
>>   - Add is_idle_vcpu() check in p2m_ctxt_switch_from().
>>   - use csr_swap() in p2m_ctxt_switch_from().
>>   - move flush_tlb_guest_local() to the end if p2m_handle_vmenter() and
>>     drop unnessary anymore comments.
>>   - Correct printk()'s arguments in p2m_handle_vmenter().
>> ---
>>   xen/arch/riscv/include/asm/domain.h |  1 +
>>   xen/arch/riscv/include/asm/p2m.h    |  4 ++
>>   xen/arch/riscv/p2m.c                | 79 +++++++++++++++++++++++++++++
>>   xen/arch/riscv/traps.c              |  2 +
>>   4 files changed, 86 insertions(+)
>>
>> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
>> index 3da2387cb197..42bb678fcbf9 100644
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -59,6 +59,7 @@ struct arch_vcpu {
>>       register_t hstateen0;
>>       register_t hvip;
>>   +    register_t vsatp;
>>       register_t vsie;
>>         /*
>> diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
>> index f63b5dec99b1..60f27f9b347e 100644
>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -255,6 +255,10 @@ static inline bool p2m_is_locked(const struct p2m_domain *p2m)
>>   struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>                                           p2m_type_t *t);
>>   +void p2m_ctxt_switch_from(struct vcpu *p);
>> +void p2m_ctxt_switch_to(struct vcpu *n);
>> +void p2m_handle_vmenter(void);
>> +
>>   #endif /* ASM__RISCV__P2M_H */
>>     /*
>> diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
>> index 0abeb374c110..7ae854707174 100644
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>         return get_page(page, p2m->domain) ? page : NULL;
>>   }
>> +
>> +/* Should be called before other CSRs are stored to avoid speculation */
>> +void p2m_ctxt_switch_from(struct vcpu *p)
>> +{
>> +    if ( is_idle_vcpu(p) )
>> +        return;
>> +
>> +    /*
>> +     * No mechanism is provided to atomically change vsatp and hgatp
>> +     * together. Hence, to prevent speculative execution causing one
>> +     * guest’s VS-stage translations to be cached under another guest’s
>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>> +     * finally write the new vsatp value what will be done in
>> +     * p2m_handle_vmenter().
>> +     */
>> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>> +
>> +    /*
>> +     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
>> +     * or/and in p2m_handle_vmenter().
>> +     */
>> +}
>> +
>> +/* Should be called after other CSRs are restored to avoid speculation */
>> +void p2m_ctxt_switch_to(struct vcpu *n)
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
>> +
>> +    if ( is_idle_vcpu(n) )
>> +        return;
>> +
>> +    csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));
>> +    /*
>> +     * As VMID is unique per vCPU and just re-used here thereby there is no
>> +     * need for G-stage TLB flush here.
>> +     */
>> +
>> +    csr_write(CSR_VSATP, n->arch.vsatp);
>> +    /*
>> +     * As at the start of context switch VSATP were set to 0, so no speculation
>> +     * could happen thereby there is no need for VS TLB flush here.
>> +     */
>> +}
> 
> I think we need to flush the VS-stage TLB unconditionally here. It is possible
> that `p->arch.vsatp.ASID == n->arch.vsatp.ASID`, in which case the new vCPU
> could reuse stale VS-stage TLB entries that do not belong to it.
> 
> I considered performing the flush conditionally, but that would require checking
> not only the ASID, but also whether the PPN differs. In addition, we would need
> to verify that the old and new vCPUs do not belong to different domains, since
> the same VSATP PPN value could appear in different domains.
> 
> This starts to look like overcomplication for a marginal optimization, so an
> unconditional VS-stage TLB flush seems simpler and safer.
> 
> Do you think this optimization is worth pursuing at this stage?

Let's start simple and optimize later.

Jan

