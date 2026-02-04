Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKE0Eqxfg2lzmAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:03:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF2E7CE2
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220868.1529282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneP9-0006dq-Hy; Wed, 04 Feb 2026 15:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220868.1529282; Wed, 04 Feb 2026 15:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneP9-0006bZ-FC; Wed, 04 Feb 2026 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 1220868;
 Wed, 04 Feb 2026 15:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vneP7-0006S9-Uh
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:02:54 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9012c956-01da-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 16:02:45 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b86ed375d37so928472566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 07:02:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805fbc5sm6474179f8f.34.2026.02.04.07.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:02:44 -0800 (PST)
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
X-Inumbo-ID: 9012c956-01da-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770217365; x=1770822165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HshliNVb0B0rrWteOwztMLqOAs77x1xWGdnNlD+NsRE=;
        b=TlKqZicsPY66ri79RjkjTR963flbOZQ60vkDu9sUvYakGSfq2/CL3/mqYmUulk92Gc
         Qimy4OePZFJwzXzhzHP54Bmxp7irZ+1Id5kkWxLYD3Fe+yYVsLYIrfIG8+hpvp78/mzW
         xb9IxKtJm6LavX/fRETvd3+uA9XAUCcjgXOROCJ+kbL03krKou+MzWGwDEjn+0KQIH4i
         PqjwblCYx8aTBnfBmr/Px6oBYjt66wA+yr9RBFxevFkw58yIbXukLp3DihoEGOqVJnIH
         vM3WhhoqJwzANSz2WtgAVcE3pvoM3z+LqTkExfxEawCrexazGXQUT5erO++kurZt27V1
         LF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770217365; x=1770822165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HshliNVb0B0rrWteOwztMLqOAs77x1xWGdnNlD+NsRE=;
        b=D6qlLV33RGymZYv5NO4X/2c/uOheWM1jEXw2321hqu9LLFjeT0XxubqCkwNDgbEulE
         5ca/4QlCPC2ylRCVhr/6jK4Mue8eN38v1zbcJLQkS94ITx5b2kNJo2jVRT6kcWGiCWNz
         qfprquFwXrm0w8gg33kV+/bOnOKDshYU7eXDUchOL1WJbAY2Sj4/Mz21LnXk0AcSnTwh
         rrf3TSyiSZY0f75SmL+tqJcazUt5n9sB92s+WD9xMuh97PsagbwDY530v48OcBjysfsZ
         kUWlZs6caQktFLkvx67au58UWbE0m7HUxMjrFQjn8nZdnr0k0wR7XxZiuYio4wZouhmN
         9D3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi+daoTav9FlMCm4DDEtmOrIEVVXi0fJqXNpzrU+7fTEm9HzjkjETgEqn+DIHUlvemcrk12uh7ksI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPB+0nNi0SOmq8bRaMLIs0+ohkCtCi7UhLZ+i81nSoF8vpLK+f
	ujbBHnVunx2soLsAYvofn+7UHYjRHc/OsQCtTpxnvQm+LEXgkO8vMYWStgNNP+Jh2g==
X-Gm-Gg: AZuq6aJ62X43QrK6Nin5HG34smTE/iS9B3glyIyScsSm9Oibcn4mChbx2aC8OB1rQdy
	2pebQkZNFqFcoAfeJhVtPdmaUuhX4EOxQ2vgAzr2EdNXPdxA25WdXoL8KXko1z80CGbygm8oOkz
	7AvZ3cQ8fT82Jio+wohPM3bNpYTApga5yCppx/ug/x2aci9+Hyf9PWD3+u4Pe29jNe7b4RlHZEu
	GWFcukJOuJHDMATLtm9ffBTDlnAaQre7Am7+esJzBcDO46B0TFheVlxfgnHp+Q2uUjfQeD1nFzU
	mwRfEc1QSJf/kO32ezhsyTxcjhNWo4lsEHqhXs9HoUl63FGf9guts2KHRpCD0q1QA26HxrYy9iB
	h9J7CvPHDpjcnN1X3lVmIAD6u/66suhFhWEC4I+BSnBr5chK8VlepZuDoERfhPsF/2f3XYF1ELp
	m7GjxAbX/tj94MTu2RIFdoc481fY69jq4he6zcDeJsgi7DqycUWMDgrCeDdCzZOAYKHmPtwYnJS
	0A=
X-Received: by 2002:a17:906:fe06:b0:b84:2b70:98ec with SMTP id a640c23a62f3a-b8e9f1ab7fcmr220906366b.42.1770217364975;
        Wed, 04 Feb 2026 07:02:44 -0800 (PST)
Message-ID: <0f0a7479-5f12-4803-9348-2c295a1939a4@suse.com>
Date: Wed, 4 Feb 2026 16:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/riscv: implement
 p2m_ctx_switch_{to,from}_state()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <2e4cd29f19945e90733ac85e023d53cecbe1d14d.1770036584.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: ACAF2E7CE2
X-Rspamd-Action: no action

On 02.02.2026 13:57, Oleksii Kurochko wrote:
> Introduce functions required to perform a p2m context switch during
> a vCPU context switch.
> 
> As no mechanism is provided to atomically change vsatp and hgatp
> together.

This sentence doesn't parse; imo you simply want to drop "As".

> Hence, to prevent speculative execution causing one
> guest’s VS-stage translations to be cached under another guest’s
> VMID, world-switch code should zero vsatp in p2m_ctx_swith_from(),
> then construct new hgatp and  write the new vsatp value in
> p2m_ctx_switch_to().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/p2m.h |  4 ++
>  xen/arch/riscv/p2m.c             | 81 ++++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
> 
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -255,6 +255,10 @@ static inline bool p2m_is_locked(const struct p2m_domain *p2m)
>  struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>                                          p2m_type_t *t);
>  
> +

As before: No double blank lines please.

> +void p2m_ctx_switch_from(struct vcpu *p);
> +void p2m_ctx_switch_to(struct vcpu *n);

Like for the other functions, please consider s/ctx/ctxt/.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1434,3 +1434,84 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>  
>      return get_page(page, p2m->domain) ? page : NULL;
>  }
> +
> +void p2m_ctx_switch_from(struct vcpu *p)
> +{
> +    /*
> +     * No mechanism is provided to atomically change vsatp and hgatp
> +     * together. Hence, to prevent speculative execution causing one
> +     * guest’s VS-stage translations to be cached under another guest’s
> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
> +     * finally write the new vsatp value.
> +     */
> +    p->arch.vsatp = csr_read(CSR_VSATP);
> +    csr_write(CSR_VSATP, 0);

Why two CSR accesses when one will do? RISC-V specifically has the CSRRW insn.

> +    /*
> +     * No need for VS-stage TLB flush here:
> +     *  Changing satp.MODE from Bare to other modes and vice versa also
> +     *  takes effect immediately, without the need to execute an
> +     *  SFENCE.VMA instruction.
> +     * Note that VSATP is just VS-mode’s version of SATP, so the mentioned
> +     * above should be true for VSATP.
> +     */
> +
> +    /*
> +     * Nothing to do with HGATP as it is constructed each time when
> +     * p2m_ctx_switch_to() is called.
> +     */
> +}
> +
> +void p2m_ctx_switch_to(struct vcpu *n)
> +{
> +    struct vcpu_vmid *p_vmid = &n->arch.vmid;
> +    uint16_t old_vmid, new_vmid;
> +    bool need_flush;
> +
> +    if ( is_idle_vcpu(n) )
> +        return;

Shouldn't the other function have such a check, too?

> +    old_vmid = p_vmid->vmid;
> +    need_flush = vmid_handle_vmenter(p_vmid);

As you're re-using x86'es model, I'm not quite sure why this would be needed.
I don't think we have such in x86; aiui this should be handled while actually
doing the VM entry.

> +    new_vmid = p_vmid->vmid;
> +
> +#ifdef P2M_DEBUG
> +    printk(XENLOG_INFO, "%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
> +           n, old_vmid, new_vmid, need_flush);
> +#endif
> +
> +    csr_write(CSR_HGATP, construct_hgatp(p2m_get_hostp2m(current->domain),
> +              new_vmid));
> +
> +    if ( unlikely(need_flush) )
> +        local_hfence_gvma_all();
> +
> +    /*
> +     * According to the RISC-V specification, speculation can happen
> +     * during an update of hgatp and vsatp:
> +     *   No mechanism is provided to atomically change vsatp and hgatp
> +     *   together. Hence, to prevent speculative execution causing one
> +     *   guest’s VS-stage translations to be cached under another guest’s
> +     *   VMID, world-switch code should zero vsatp, then swap hgatp, then
> +     *   finally write the new vsatp value. Similarly, if henvcfg.PBMTE
> +     *   need be world-switched, it should be switched after zeroing vsatp
> +     *   but before writing the new vsatp value, obviating the need to
> +     *   execute an HFENCE.VVMA instruction.
> +     * So just flush TLBs for VS-Stage and G-stage after both of regs are
> +     * touched.
> +     */
> +    flush_tlb_guest_local();

Which "both regs" does the comment talk about? Doesn't the flush want to come
...

> +    /*
> +     * The vsatp register is a VSXLEN-bit read/write register that is
> +     * VS-mode’s version of supervisor register satp, so the following is
> +     * true for VSATP registers:
> +     *  Changing satp.MODE from Bare to other modes and vice versa also takes
> +     *  effect immediately, without the need to execute an SFENCE.VMA
> +     *  instruction. Likewise, changes to satp.ASID take effect immediately.
> +     * Considering the mentioned above and that VS-stage TLB flush has been
> +     * already done there is no need to flush VS-stage TLB after an update
> +     * of VSATP from Bare mode to what is written in `n->arch.vsatp`.
> +     */
> +    csr_write(CSR_VSATP, n->arch.vsatp);

... after this? Then some of the commentary also doesn't look to be necessary.

Jan

