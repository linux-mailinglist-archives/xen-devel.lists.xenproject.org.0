Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMVeBV+LhGl43QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:21:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782F1F25C4
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221870.1529983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyMX-000574-48; Thu, 05 Feb 2026 12:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221870.1529983; Thu, 05 Feb 2026 12:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyMX-00054p-1R; Thu, 05 Feb 2026 12:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1221870;
 Thu, 05 Feb 2026 12:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnyMU-00054j-RX
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 12:21:30 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32e4e628-028d-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 13:21:29 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so8524015e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 04:21:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d33f5fsm55167435e9.5.2026.02.05.04.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 04:21:28 -0800 (PST)
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
X-Inumbo-ID: 32e4e628-028d-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770294089; x=1770898889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jytMBN62Phwofq6gia6ATWrhwZXM1An62OfpNpgdsXk=;
        b=LClUN1IArZVKRbQUsvNTOB2NwvrhxEy/doVsO7UoIoHYDTba+XN4/fEycefnI/Xa1u
         q0yvkSm88P4kOQBOvyBua+fznckagXfzlNlwlZFiJGgiV2Ui8Csn9kYEduj402HOG0PI
         56ygj3jvxLPjY0iZ4bZAZYTRTeZjl1PjoNcsZGC0RwKFxw7FlZY2oujDjnGr/6oCCZWA
         vKQMtTDE1mdhkbhOoeTZnmDxSXysToWLHrrMYY5oM00PeCGSAo9Itc5fnlxwzb+D/c3b
         8nV2ZxgQtd+X/W4m6eFswwTn57p7wTD9VRAHs81YGy/MPQ+PVnnfJG+x6r+JQoxaL3il
         oFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770294089; x=1770898889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jytMBN62Phwofq6gia6ATWrhwZXM1An62OfpNpgdsXk=;
        b=QtOhzvVIMTERiiOhMlKkn08UFdM/EgVUC1a36Q5xcr9OQ+Loj4gew+FcjYg6KUVcvI
         2Kv3dTwBKIccgw0OMLNvuw4MAFx+//k3YisMEFxEx8jJ9FLIBEj5gKKeN/K0eAdLCp9/
         bcwMDWqfnvP6dqPOSrMtP0JJ2OKHhdCSnG5tTwUEOSu7nU66qZbXf2+gIKB9nClm4KRl
         Tn+ha3THCSNAL52ucGX9AP1/CEjlhnPnHRJ59koxsJqfpsleIqDSYeSXdy15RtuB5Rzc
         ff3rTD8N+rMH70Mk7jnyktievPeaaSjpGt/TzmzPvE39coioPFrMaD0eu2IpuTqwdua5
         JeUg==
X-Forwarded-Encrypted: i=1; AJvYcCUl8kWOSqH5P2nC/BoH+6g11pFEZ/oHssZ65FzoXBAVHPETYEBnFpp26haFk5bvXT7bfOH4IfMP6Ho=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8iV3QhbaMKaF9ZoLdRKX0j8XUVeyF2G3aA+K0io0nB+85HcAn
	eKABd3sEaIupgKpxI7KZVh4b83QDR1cisBA+zlkE3HP66SynIkVN8EwIghrSsGq4Og==
X-Gm-Gg: AZuq6aIEhNrUlF++vU7MVnT4UNej3E52zL5dgtgTUq7DVfYMeE9vjMgGcWbvub1o8C2
	dWcqaIJaJOMwQjdoSOJkAWe7XjpfO4F95YlERzuQXjoxUSCeW6ah4VPOl2zUbEXCTd3+6uqIMQh
	mNuaxlYx2KkeeVc/fuLbCFl9+2HdGiY7Frkgdw/S2e3oiGZglirS00VgMFk0jLOh+jLCpNCL2Jw
	TmDZ1MoCVq8S6b5UugkrgetaH5mAGSz7KiAs0OqoiSxKQMouRUmur3ufZMhqZVMS2ik2m2G/qWv
	vgUuSJGMyKQ8OtgMbABEVRR5Guhuzz8u2zXKgRjJmeOIIA1yUSJqDsPK/WgR97oY1/7kMraljJc
	GXuZJrk3aXb13/60mZcahe2og9ij3PiZXUuxun6347O1vN9M/NIXB0FVgoHG7b3Cr7d4d3e1Rro
	wo03lIcDWOOlemrznT1GQ4XRTI6mpNPRh2gHieGulSBIWgqtRiDJJIiCy0cNsznsb3T2bhiKdKB
	qObVfiisZ53ww==
X-Received: by 2002:a05:600c:c4ab:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-4830e9795d3mr79211715e9.28.1770294088698;
        Thu, 05 Feb 2026 04:21:28 -0800 (PST)
Message-ID: <ed502ea0-62b6-4cbb-9116-4ba199727fcc@suse.com>
Date: Thu, 5 Feb 2026 13:21:25 +0100
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
 <0f0a7479-5f12-4803-9348-2c295a1939a4@suse.com>
 <cdc5135b-11fa-45b0-8b62-79141ce3bcb7@gmail.com>
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
In-Reply-To: <cdc5135b-11fa-45b0-8b62-79141ce3bcb7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 782F1F25C4
X-Rspamd-Action: no action

On 05.02.2026 11:32, Oleksii Kurochko wrote:
> On 2/4/26 4:02 PM, Jan Beulich wrote:
>> On 02.02.2026 13:57, Oleksii Kurochko wrote:
>>> +void p2m_ctx_switch_to(struct vcpu *n)
>>> +{
>>> +    struct vcpu_vmid *p_vmid = &n->arch.vmid;
>>> +    uint16_t old_vmid, new_vmid;
>>> +    bool need_flush;
>>> +
>>> +    if ( is_idle_vcpu(n) )
>>> +        return;
>> Shouldn't the other function have such a check, too?
> 
> Yes, it should. I will add the check.
> 
>>> +    old_vmid = p_vmid->vmid;
>>> +    need_flush = vmid_handle_vmenter(p_vmid);
>> As you're re-using x86'es model, I'm not quite sure why this would be needed.
>> I don't think we have such in x86; aiui this should be handled while actually
>> doing the VM entry.
> 
> I can move this to the end of do_trap().
> 
> However, isn’t this effectively the same?
> If a context switch to vCPU n happens, it means that once the trap is fully handled,
> we will enter vCPU n.
> The same will be if to put the changes at the end of do_trap() before control
> will be given to VM.

Thing is - you will need it at the end of do_trap() (or wherever VM entry is
going to be dealt with) anyway, to cover situation other than context switch
as well.

>>> +    new_vmid = p_vmid->vmid;
>>> +
>>> +#ifdef P2M_DEBUG
>>> +    printk(XENLOG_INFO, "%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
>>> +           n, old_vmid, new_vmid, need_flush);
>>> +#endif
>>> +
>>> +    csr_write(CSR_HGATP, construct_hgatp(p2m_get_hostp2m(current->domain),
>>> +              new_vmid));
>>> +
>>> +    if ( unlikely(need_flush) )
>>> +        local_hfence_gvma_all();
>>> +
>>> +    /*
>>> +     * According to the RISC-V specification, speculation can happen
>>> +     * during an update of hgatp and vsatp:
>>> +     *   No mechanism is provided to atomically change vsatp and hgatp
>>> +     *   together. Hence, to prevent speculative execution causing one
>>> +     *   guest’s VS-stage translations to be cached under another guest’s
>>> +     *   VMID, world-switch code should zero vsatp, then swap hgatp, then
>>> +     *   finally write the new vsatp value. Similarly, if henvcfg.PBMTE
>>> +     *   need be world-switched, it should be switched after zeroing vsatp
>>> +     *   but before writing the new vsatp value, obviating the need to
>>> +     *   execute an HFENCE.VVMA instruction.
>>> +     * So just flush TLBs for VS-Stage and G-stage after both of regs are
>>> +     * touched.
>>> +     */
>>> +    flush_tlb_guest_local();
>> Which "both regs" does the comment talk about? Doesn't the flush want to come
>> ...
>>
>>> +    /*
>>> +     * The vsatp register is a VSXLEN-bit read/write register that is
>>> +     * VS-mode’s version of supervisor register satp, so the following is
>>> +     * true for VSATP registers:
>>> +     *  Changing satp.MODE from Bare to other modes and vice versa also takes
>>> +     *  effect immediately, without the need to execute an SFENCE.VMA
>>> +     *  instruction. Likewise, changes to satp.ASID take effect immediately.
>>> +     * Considering the mentioned above and that VS-stage TLB flush has been
>>> +     * already done there is no need to flush VS-stage TLB after an update
>>> +     * of VSATP from Bare mode to what is written in `n->arch.vsatp`.
>>> +     */
>>> +    csr_write(CSR_VSATP, n->arch.vsatp);
>> ... after this? Then some of the commentary also doesn't look to be necessary.
> 
> I think there is no need for a guest TLB flush here or above
> (i.e. flush_tlb_guest_local()), because:
> - If CSR_VSATP is set to 0, or changed from 0 to a non-zero value, no speculation
>    can occur. Therefore, the guest TLB cannot be polluted with unwanted entries,
>    and no flush is required.
> - If need_flush is false, it means that no VMID wraparound has occurred.
>    In that case, the VMID is still unique, so we are safe and no guest TLB flush is
>    needed.
> 
> Additionally, it seems that I do not need to introduce flush_tlb_guest_local() at
> all, since local_hfence_gvma_all() already provides the same functionality.
> Instead, it probably makes sense to introduce an HFENCE_VVMA() helper as a generic
> wrapper around the hfence.vvma instruction, and then reuse it inside
> local_hfence_gvma_all().

Hmm, I fear I'm confused: hfence.gvma != hfence.vvma ?

Jan

