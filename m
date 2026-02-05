Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KKuHNBxhGnI2wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 11:32:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7361F1563
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 11:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221721.1529874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnweb-0004Xu-Gy; Thu, 05 Feb 2026 10:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221721.1529874; Thu, 05 Feb 2026 10:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnweb-0004Uz-EQ; Thu, 05 Feb 2026 10:32:05 +0000
Received: by outflank-mailman (input) for mailman id 1221721;
 Thu, 05 Feb 2026 10:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQ2u=AJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnweZ-0004UW-Ex
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 10:32:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8be03ab-027d-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 11:32:02 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so6676805e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 02:32:02 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830ffc3a85sm46392265e9.18.2026.02.05.02.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 02:32:01 -0800 (PST)
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
X-Inumbo-ID: e8be03ab-027d-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770287522; x=1770892322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViuJeM4gxsrBWAxJU0RnJcTPBLzlLPCppiJFe/8oRZ4=;
        b=BI1gQ4vj4BHNegWPV5eGyIBhjevjxN5KWyO46sl1wKExI/zfke1nTrl0NgMFwOOvfc
         YyCW/C6zKreNz/GnGUxPPQYmee4ShpMnurHXG1XrCcehOdVvoawGq+QormdkkZIFmL8p
         kFP8Adyg93qsMUJLm5rbCaZVJCoIn94u2qAAJqhKs3tVPG4fLQQHJqw2nYMmFdxD721E
         31a3mo9oPZYbWc/Ek69pgrJgNuAfvnNAj8FLgEK5DjfMS+uLtOPNZ3RI9U8xrfDzNf4H
         iXhUXA9aSax1g/HjF9qweGGARGPSg9/pwgMJPy3TAKTL87sjaviWubwchgG/jmjcJQn1
         Pjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287522; x=1770892322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViuJeM4gxsrBWAxJU0RnJcTPBLzlLPCppiJFe/8oRZ4=;
        b=PaExPAn64nL6awIqv4pG5DEOV7cxmtRPH3sCI59PTKbPHK/AvDHcSYVTEuUC27Fg+a
         o+Xl/eevyGY8Sc9W9IMrBIa4XKSpej4ef7/RCrL0m8aHXXnDQb7JIJXJAg/d1Nt/SRsf
         +QE//AWYPPgQ+sXF6IUdWEQvbkLamlaZdwq196WrJnnGWsaIpiEuDHoA0nY8GzmHwZug
         iA4TnbBL5ZInE1mjJmJ2sFOaItubNZT2GZxzjnFKSAvkE4bbDAjpynCEWnzrhrVXwqbz
         rK/tjp/rddqBzuz5v7w3Qg9vclCyWTQ0wHlfTuqIxtH3c57o/xnypbH6tKgxEJD57xBS
         yLuw==
X-Forwarded-Encrypted: i=1; AJvYcCVVz19m9+HJScJm/RrmeMGdut0ZlSAgde3RptxO0AuYKm9kkHjxpqgSwZoFHU6BpRPeEFcgoG1iq3I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1XNvvwEkuXXLl39lxJ/BqTMVwvrROx97cGqmmWCkPeF82V7jf
	IWDbbWRhRpAglWHXXAboxcjcnNyA90HP6mPyv92auFHGKvYy63J3SWky
X-Gm-Gg: AZuq6aJwQAtbflRX/rB3CSlPqEJNyuLvKV+rx17Fy4I+TQmCa34LLj6XMOjk3xOs+1M
	kWKy23YwaCZr1RyXn2T2oO9acJKz040GMT9SFmU3/9GnJBFaQ4W4yP27b8Tsf560puIHzs5Wb5M
	jTJng1Ajcb0Nqdhv9AFjnIBXiPwtYITu0dcVWYYlo+LHy83ATOX54qzGbZh2qAHjaS9nJEwa0Fm
	FL2IakoRJt/tShpBvktbLdLC6+qF4hF5zhx5Ify3fGmG4cB1AGXvHB2SbuqA3pnJp94gY+hSwLA
	C9BU+5B3hkWQmzQh7wxFxka/l1baGU6uWb5aJUNI2CaUq+5xZe/tCc6xH9jHdZtfOMS7b0CmdUo
	NQIY7+Dk1MRFT7S9+zZ94jbNzeb1dNJJagoqsk3+paF6MbVTSnk84/2vuHEa2KAmvz8rTGVCOyc
	387EouCVmcyZPnQ4T2nLZ95FjRdVp5IP68D8d4aFHVqJaTrYU2EGAYf/ujI+WiWck=
X-Received: by 2002:a05:600c:530f:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-4830e9552a2mr86177335e9.15.1770287521593;
        Thu, 05 Feb 2026 02:32:01 -0800 (PST)
Message-ID: <cdc5135b-11fa-45b0-8b62-79141ce3bcb7@gmail.com>
Date: Thu, 5 Feb 2026 11:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: implement
 p2m_ctx_switch_{to,from}_state()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
 <2e4cd29f19945e90733ac85e023d53cecbe1d14d.1770036584.git.oleksii.kurochko@gmail.com>
 <0f0a7479-5f12-4803-9348-2c295a1939a4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0f0a7479-5f12-4803-9348-2c295a1939a4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C7361F1563
X-Rspamd-Action: no action


On 2/4/26 4:02 PM, Jan Beulich wrote:
> On 02.02.2026 13:57, Oleksii Kurochko wrote:
>> Introduce functions required to perform a p2m context switch during
>> a vCPU context switch.
>>
>> As no mechanism is provided to atomically change vsatp and hgatp
>> together.
> This sentence doesn't parse; imo you simply want to drop "As".
>
>> Hence, to prevent speculative execution causing one
>> guest’s VS-stage translations to be cached under another guest’s
>> VMID, world-switch code should zero vsatp in p2m_ctx_swith_from(),
>> then construct new hgatp and  write the new vsatp value in
>> p2m_ctx_switch_to().
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/riscv/include/asm/p2m.h |  4 ++
>>   xen/arch/riscv/p2m.c             | 81 ++++++++++++++++++++++++++++++++
>>   2 files changed, 85 insertions(+)
>>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1434,3 +1434,84 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>   
>>       return get_page(page, p2m->domain) ? page : NULL;
>>   }
>> +
>> +void p2m_ctx_switch_from(struct vcpu *p)
>> +{
>> +    /*
>> +     * No mechanism is provided to atomically change vsatp and hgatp
>> +     * together. Hence, to prevent speculative execution causing one
>> +     * guest’s VS-stage translations to be cached under another guest’s
>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>> +     * finally write the new vsatp value.
>> +     */
>> +    p->arch.vsatp = csr_read(CSR_VSATP);
>> +    csr_write(CSR_VSATP, 0);
> Why two CSR accesses when one will do? RISC-V specifically has the CSRRW insn.

csr_swap() could really be used here instead, thanks.

>
>> +    /*
>> +     * No need for VS-stage TLB flush here:
>> +     *  Changing satp.MODE from Bare to other modes and vice versa also
>> +     *  takes effect immediately, without the need to execute an
>> +     *  SFENCE.VMA instruction.
>> +     * Note that VSATP is just VS-mode’s version of SATP, so the mentioned
>> +     * above should be true for VSATP.
>> +     */
>> +
>> +    /*
>> +     * Nothing to do with HGATP as it is constructed each time when
>> +     * p2m_ctx_switch_to() is called.
>> +     */
>> +}
>> +
>> +void p2m_ctx_switch_to(struct vcpu *n)
>> +{
>> +    struct vcpu_vmid *p_vmid = &n->arch.vmid;
>> +    uint16_t old_vmid, new_vmid;
>> +    bool need_flush;
>> +
>> +    if ( is_idle_vcpu(n) )
>> +        return;
> Shouldn't the other function have such a check, too?

Yes, it should. I will add the check.

>
>> +    old_vmid = p_vmid->vmid;
>> +    need_flush = vmid_handle_vmenter(p_vmid);
> As you're re-using x86'es model, I'm not quite sure why this would be needed.
> I don't think we have such in x86; aiui this should be handled while actually
> doing the VM entry.

I can move this to the end of do_trap().

However, isn’t this effectively the same?
If a context switch to vCPU n happens, it means that once the trap is fully handled,
we will enter vCPU n.
The same will be if to put the changes at the end of do_trap() before control
will be given to VM.

>
>> +    new_vmid = p_vmid->vmid;
>> +
>> +#ifdef P2M_DEBUG
>> +    printk(XENLOG_INFO, "%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
>> +           n, old_vmid, new_vmid, need_flush);
>> +#endif
>> +
>> +    csr_write(CSR_HGATP, construct_hgatp(p2m_get_hostp2m(current->domain),
>> +              new_vmid));
>> +
>> +    if ( unlikely(need_flush) )
>> +        local_hfence_gvma_all();
>> +
>> +    /*
>> +     * According to the RISC-V specification, speculation can happen
>> +     * during an update of hgatp and vsatp:
>> +     *   No mechanism is provided to atomically change vsatp and hgatp
>> +     *   together. Hence, to prevent speculative execution causing one
>> +     *   guest’s VS-stage translations to be cached under another guest’s
>> +     *   VMID, world-switch code should zero vsatp, then swap hgatp, then
>> +     *   finally write the new vsatp value. Similarly, if henvcfg.PBMTE
>> +     *   need be world-switched, it should be switched after zeroing vsatp
>> +     *   but before writing the new vsatp value, obviating the need to
>> +     *   execute an HFENCE.VVMA instruction.
>> +     * So just flush TLBs for VS-Stage and G-stage after both of regs are
>> +     * touched.
>> +     */
>> +    flush_tlb_guest_local();
> Which "both regs" does the comment talk about? Doesn't the flush want to come
> ...
>
>> +    /*
>> +     * The vsatp register is a VSXLEN-bit read/write register that is
>> +     * VS-mode’s version of supervisor register satp, so the following is
>> +     * true for VSATP registers:
>> +     *  Changing satp.MODE from Bare to other modes and vice versa also takes
>> +     *  effect immediately, without the need to execute an SFENCE.VMA
>> +     *  instruction. Likewise, changes to satp.ASID take effect immediately.
>> +     * Considering the mentioned above and that VS-stage TLB flush has been
>> +     * already done there is no need to flush VS-stage TLB after an update
>> +     * of VSATP from Bare mode to what is written in `n->arch.vsatp`.
>> +     */
>> +    csr_write(CSR_VSATP, n->arch.vsatp);
> ... after this? Then some of the commentary also doesn't look to be necessary.

I think there is no need for a guest TLB flush here or above
(i.e. flush_tlb_guest_local()), because:
- If CSR_VSATP is set to 0, or changed from 0 to a non-zero value, no speculation
   can occur. Therefore, the guest TLB cannot be polluted with unwanted entries,
   and no flush is required.
- If need_flush is false, it means that no VMID wraparound has occurred.
   In that case, the VMID is still unique, so we are safe and no guest TLB flush is
   needed.

Additionally, it seems that I do not need to introduce flush_tlb_guest_local() at
all, since local_hfence_gvma_all() already provides the same functionality.
Instead, it probably makes sense to introduce an HFENCE_VVMA() helper as a generic
wrapper around the hfence.vvma instruction, and then reuse it inside
local_hfence_gvma_all().

~ Oleksii


