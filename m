Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AHHBGOUhGk43gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 14:00:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE5F2E8E
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 14:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221921.1530037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyxt-0003Ho-OO; Thu, 05 Feb 2026 13:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221921.1530037; Thu, 05 Feb 2026 13:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyxt-0003GL-Lh; Thu, 05 Feb 2026 13:00:09 +0000
Received: by outflank-mailman (input) for mailman id 1221921;
 Thu, 05 Feb 2026 13:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQ2u=AJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnyxr-0003GD-Fi
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 13:00:07 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97cd3c88-0292-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 14:00:06 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso8253565e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 05:00:06 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d345c2sm73957875e9.6.2026.02.05.05.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 05:00:04 -0800 (PST)
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
X-Inumbo-ID: 97cd3c88-0292-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770296405; x=1770901205; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=997/WIIJ8MTQNgWzBlC3gUc9mZhnD3GD5ynDWf1YabM=;
        b=C9nCZFqarHIkd+bnhFTXxdSB/9FJmya3E9sTr3rB23FdSm5TsB0DmdbRSajMDklbwp
         MfWSEEChmuJDUnZepPtxXTY8OeukiCLmrAbZREPgndIkS5KIO08H+MhJZaFyfcUUaUvx
         D2JVkUljfzlF95EP87EA6D3CItmw8+IK8pA+JdbIo5QHRtiIqVYvyAsLhtTMqSO1BWFw
         lVaqp3a95mY4/wxUG+vtrae6svfAx8wUYUXu6FwYi18m8dn6S9zUULjwxooKHtF1JH0b
         xUdjwao8DKeGTMIoAMe44NVbE4ch/GKWUro9HLl890OYstquI6V6ShLJGjPYDfFoah5y
         CGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770296405; x=1770901205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=997/WIIJ8MTQNgWzBlC3gUc9mZhnD3GD5ynDWf1YabM=;
        b=RVPKkkjZn9GAH56yx2tlaER3Hyz1JVtcfmilZjEatqT5DV3u/oJHamsI07mbBWtF5M
         Dak8MfqXpJjahAkisyPsMp9kH2+4NT4qZPKSxy5y1VRcKMzrJzRd+9/r7zyWGtFcG+h1
         dvvRWO+TgEBVl9ugqRMMWZQKCZF3JbpGRsKbsriUk3AljU7hE4t9s+OGapSVt3ZB0Xe2
         pZcMhRFc0Y/hAmg4/nA+37io1acpkz9cYo+p2ZiaIuhj2CpZhC8sP64YQcPQtU0/W2YW
         7gIjVAbMWTDXY0x/cOtQF9iIBjAuK/dVWCM2aZh7May1iMnYeZmhn0BcpU+/Xo3vLzMQ
         QhyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7p9tGsSG6sxCdaCdsx/YwhBj8cTqegLKaKDfUHq1jp9scsWgWsNFODicGZR0CyiS7cusTJdteQoM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwP6sx8FvqVnS2yKE443XZjn1FC7X4MlwnFe3Tcv+3E+xtPUeo9
	nM2oJWshtDdamY5EpTQuNlhE0vFLeXvMJUryj26MXWe05ePVVeNioQ8Q
X-Gm-Gg: AZuq6aLNmMGoq3gNGVv86+ONeZKyJfpxjBagD4Ziv8ox8lfAlLw4uHNmTLeOGW2KCEI
	7X9viCzA/VfwNeH5YBHB/EapUi5dLeuMCCh0Ok+sFYhCARc5ZuhuJqMKq7SCQVNSxQqUTWja+od
	1HpWuQE0m3NReaPxXdosGArQiPy/iGgG6gIrubYq3wcVKw6ijQ7IH2qZiLEhR0xIkkgYEG1vSIP
	biMQwnBzUCZfgHqDQYnfuwE04KiwhfGQFOOn5yDgpENyf96ZXy3NXptSyU/VLej4zbAfPRhVEg4
	Ob/XmIp63FQ2b3GOmfVi7hsxpTrjphTBIK020DUk2hMyca7zZwTTKKsS62CJViQKgF+nxprhu9K
	zfXZ2CEIZHNloQxnwLebnRLy866dbBYnvvIR1f0qmGiHPG3ux+UdbT8BYlinLJSb0pSaDPt+mlj
	c47zu4IV31ysoxuKZ51RxVKR3ehcKdskrhjaQ8rub4DbfcRHoTenmxhQWHzehBhu8=
X-Received: by 2002:a05:600c:820a:b0:480:3338:292d with SMTP id 5b1f17b1804b1-4830e987bb9mr101279155e9.31.1770296405137;
        Thu, 05 Feb 2026 05:00:05 -0800 (PST)
Message-ID: <57269bd4-28fe-42de-b667-d180e6199de6@gmail.com>
Date: Thu, 5 Feb 2026 14:00:03 +0100
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
 <cdc5135b-11fa-45b0-8b62-79141ce3bcb7@gmail.com>
 <ed502ea0-62b6-4cbb-9116-4ba199727fcc@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ed502ea0-62b6-4cbb-9116-4ba199727fcc@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
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
X-Rspamd-Queue-Id: 7EFE5F2E8E
X-Rspamd-Action: no action


On 2/5/26 1:21 PM, Jan Beulich wrote:
> On 05.02.2026 11:32, Oleksii Kurochko wrote:
>> On 2/4/26 4:02 PM, Jan Beulich wrote:
>>> On 02.02.2026 13:57, Oleksii Kurochko wrote:
>>>> +void p2m_ctx_switch_to(struct vcpu *n)
>>>> +{
>>>> +    struct vcpu_vmid *p_vmid = &n->arch.vmid;
>>>> +    uint16_t old_vmid, new_vmid;
>>>> +    bool need_flush;
>>>> +
>>>> +    if ( is_idle_vcpu(n) )
>>>> +        return;
>>> Shouldn't the other function have such a check, too?
>> Yes, it should. I will add the check.
>>
>>>> +    old_vmid = p_vmid->vmid;
>>>> +    need_flush = vmid_handle_vmenter(p_vmid);
>>> As you're re-using x86'es model, I'm not quite sure why this would be needed.
>>> I don't think we have such in x86; aiui this should be handled while actually
>>> doing the VM entry.
>> I can move this to the end of do_trap().
>>
>> However, isn’t this effectively the same?
>> If a context switch to vCPU n happens, it means that once the trap is fully handled,
>> we will enter vCPU n.
>> The same will be if to put the changes at the end of do_trap() before control
>> will be given to VM.
> Thing is - you will need it at the end of do_trap() (or wherever VM entry is
> going to be dealt with) anyway, to cover situation other than context switch
> as well.

If there are such situation then it makes sense.

>
>>>> +    new_vmid = p_vmid->vmid;
>>>> +
>>>> +#ifdef P2M_DEBUG
>>>> +    printk(XENLOG_INFO, "%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
>>>> +           n, old_vmid, new_vmid, need_flush);
>>>> +#endif
>>>> +
>>>> +    csr_write(CSR_HGATP, construct_hgatp(p2m_get_hostp2m(current->domain),
>>>> +              new_vmid));
>>>> +
>>>> +    if ( unlikely(need_flush) )
>>>> +        local_hfence_gvma_all();
>>>> +
>>>> +    /*
>>>> +     * According to the RISC-V specification, speculation can happen
>>>> +     * during an update of hgatp and vsatp:
>>>> +     *   No mechanism is provided to atomically change vsatp and hgatp
>>>> +     *   together. Hence, to prevent speculative execution causing one
>>>> +     *   guest’s VS-stage translations to be cached under another guest’s
>>>> +     *   VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>> +     *   finally write the new vsatp value. Similarly, if henvcfg.PBMTE
>>>> +     *   need be world-switched, it should be switched after zeroing vsatp
>>>> +     *   but before writing the new vsatp value, obviating the need to
>>>> +     *   execute an HFENCE.VVMA instruction.
>>>> +     * So just flush TLBs for VS-Stage and G-stage after both of regs are
>>>> +     * touched.
>>>> +     */
>>>> +    flush_tlb_guest_local();
>>> Which "both regs" does the comment talk about? Doesn't the flush want to come
>>> ...
>>>
>>>> +    /*
>>>> +     * The vsatp register is a VSXLEN-bit read/write register that is
>>>> +     * VS-mode’s version of supervisor register satp, so the following is
>>>> +     * true for VSATP registers:
>>>> +     *  Changing satp.MODE from Bare to other modes and vice versa also takes
>>>> +     *  effect immediately, without the need to execute an SFENCE.VMA
>>>> +     *  instruction. Likewise, changes to satp.ASID take effect immediately.
>>>> +     * Considering the mentioned above and that VS-stage TLB flush has been
>>>> +     * already done there is no need to flush VS-stage TLB after an update
>>>> +     * of VSATP from Bare mode to what is written in `n->arch.vsatp`.
>>>> +     */
>>>> +    csr_write(CSR_VSATP, n->arch.vsatp);
>>> ... after this? Then some of the commentary also doesn't look to be necessary.
>> I think there is no need for a guest TLB flush here or above
>> (i.e. flush_tlb_guest_local()), because:
>> - If CSR_VSATP is set to 0, or changed from 0 to a non-zero value, no speculation
>>     can occur. Therefore, the guest TLB cannot be polluted with unwanted entries,
>>     and no flush is required.
>> - If need_flush is false, it means that no VMID wraparound has occurred.
>>     In that case, the VMID is still unique, so we are safe and no guest TLB flush is
>>     needed.
>>
>> Additionally, it seems that I do not need to introduce flush_tlb_guest_local() at
>> all, since local_hfence_gvma_all() already provides the same functionality.
>> Instead, it probably makes sense to introduce an HFENCE_VVMA() helper as a generic
>> wrapper around the hfence.vvma instruction, and then reuse it inside
>> local_hfence_gvma_all().
> Hmm, I fear I'm confused: hfence.gvma != hfence.vvma ?

I overlooked that it Gvma in local_hfence_gvma_all(). Then it make sense for having
both local_hfence_gvma_all() and flush_tlb_guest_local().
But it is still look like flush_tlb_guest_local() shouldn't be called in p2m context
switch, because of what I mentioned in the first paragraph above what allow not to
introduce flush_tlb_guest_local() now.

~ Oleksii


