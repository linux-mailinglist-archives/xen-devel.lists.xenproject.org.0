Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGTxIVI5k2ns2gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:35:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E8145AA9
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234289.1537591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0cr-0001cU-7H; Mon, 16 Feb 2026 15:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234289.1537591; Mon, 16 Feb 2026 15:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0cr-0001a4-4S; Mon, 16 Feb 2026 15:35:05 +0000
Received: by outflank-mailman (input) for mailman id 1234289;
 Mon, 16 Feb 2026 15:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NroF=AU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vs0cp-0001Zy-7x
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:35:03 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ec7dc4b-0b4d-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 16:35:01 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4834826e555so34132445e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 07:35:01 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abcda5sm31383738f8f.19.2026.02.16.07.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:35:00 -0800 (PST)
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
X-Inumbo-ID: 0ec7dc4b-0b4d-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771256101; x=1771860901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBxKfcg8pVasy8HYtpey60MAh5yReImnQ1GbzKc4/OU=;
        b=W82yuIqA2Lp4M2/tPr389Lkuc4nue8Ec9efHC8kLdrQ/bTiAbxPFlyDQHWaYc1UTml
         2Bsp81ldEH0X13B0pYU5r2Z697A8ecH5YOPDlKgWOKqPYGQdcmWqbb8Iti60jGw3YzCI
         p6SmJafD48/FKBnfTicaX9koEgpcDeu0N+Hm7LHZdhIwg1YNaIZl6f7u+w7m7FcC5hja
         ikoSV+MgQUELgXaEpG9V7DfAPJnLiKtqOM2IHXgJBUxsBVaFTxIpKlm5TFAMKPPRzGax
         iMh1X+1FPl0T7yziSF9ANHyS8O1HYmUAJDiKfFDk54DSyROL2lqnORY03eT/c+9XZxD1
         ZnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771256101; x=1771860901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBxKfcg8pVasy8HYtpey60MAh5yReImnQ1GbzKc4/OU=;
        b=SvaBa1CxXHyIBRn6EaL36KwZeIWs6+Bbbu6PvbWZiB3hzg9jUXVmZDmsQ0vaLRZQ6p
         vNkN1pmblyoeoiW5kjgwbMnhD+ETaOfT82+NYAbtXyJ+Wq1p7qMshxpwDaJKsOhJl2Hs
         g5GNOA3TMapKxQ41c4TLDPWIFhDt+NW1C9EncAex8PeTxPdHdmAp/+/KFUK13qYsOJBv
         gMHd1Sk4B0ZrfZBBDZlocNUBdl8OFI1kaUXl5wmX54wC+uNwPnH7xorShC9ukMhsQzUZ
         mkMhboUc7bbZL+cduiRXBPeJbyx1rL9SnAZCg4WGZSkbJ9InAOgTP+KMVXBfOMbUDxYe
         Dd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0C7kKj/VQL594Q8g9fJ2atOUa99xCfS+DyNxIOzpygBF7uycuPMuqz21WdeMNoISYeaveJ1FEbKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi6JBCn8DSx2qoBzTfxlkZlLH2JkFm68qMCjhqwPTRkfzwM0qA
	Sm9BEKre+uPXWq8Q55mYjR2FJzTHqxEFaeJGjPc3BcLgxEJIs17QMNvi
X-Gm-Gg: AZuq6aIhOE38ZydYXTixuLHqU2+MjXWqnM2nmZwto78cOSyBJQtVtqvSzH5vIXebM2s
	8P9PwzmUTqpTQWqneKiVSeD5Cb14geKAq32zhJ7Lj8ha9hH+HnJontolhqrb2pC17iXngRSlWdS
	XWYMvdqj+undaWc4aTbY/wYc6riCqquDJyWxqnrZzFOC7C3sJj1k/AioZ4llWLOQK4UFC9XYw76
	ZZ5i0tgIveD6PvwjVCyNMzwy8FWfTYV6009N05oTGttU61AnR2PYvT7/tAN7ZeS7l6RkoVjlb72
	T9q45JTiqwJKQ4oDQpt3lyGb5D18eqpAJ017xXw0EJZDAqwAcMx+Xv9bFov6wmZh7eeg9pb8AXI
	7RzXRJc9Q2Ik5MLZnQKTDggVt9YlA7bDK795j0iqN3dAo0v0qsiZqLCrq8qXm+jXi7yEniay2M1
	hnY6njJTMTsEQtVjnwNm4KBhRzBllYQwM9KWv9QLFV4YDH3lHXofK7/dX5c5IM3eJXDGgHTrp81
	k8=
X-Received: by 2002:a05:600c:3483:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-48379c0fa40mr144398725e9.35.1771256100576;
        Mon, 16 Feb 2026 07:35:00 -0800 (PST)
Message-ID: <f4400580-65b8-4dc2-a11a-443840bcb162@gmail.com>
Date: Mon, 16 Feb 2026 16:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: add p2m context switch handling for VSATP
 and HGATP
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
 <0f7e5a73-a574-4aa2-80c7-b45d08b9d6b0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0f7e5a73-a574-4aa2-80c7-b45d08b9d6b0@suse.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E06E8145AA9
X-Rspamd-Action: no action


On 2/16/26 12:50 PM, Jan Beulich wrote:
> On 13.02.2026 17:29, Oleksii Kurochko wrote:
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
>>   - Add comment above p2m_ctxt_switch_{to, from}().
> I find these and other speculation related comments problematic: You can't
> prevent every kind of speculation that way, yet all these comments are
> written as if that was the case. What I think you mean in all cases is
> speculation using the wrong set of page tables?

According to the RISC-V spec:
   No mechanism is provided to atomically change vsatp and hgatp together. Hence, to
   prevent speculative execution causing one guest’s VS-stage translations to be cached
   under another guest’s VMID, world-switch code should zero vsatp, then swap hgatp, then
   finally write the new vsatp value

Based on that my understand is that the following code could provide an issue:
(1) csr_write(CSR_SEPC, guest_b->sepc);   ...   (2) csr_write(CSR_VSATP, 
0);   csr_write(CSR_HATP, guest_b->hgatp);   csr_write(CSR_VSATP, 
guest_b->vsatp); As IIUC speculation could happen between (1) and (2) 
and we could have some VS-stage translations connected to SEPC'c of 
guest B but with address from guest A page tables. So just to be sure 
that such isuse won't happen I wrote a comment that first VSATP, then 
others CSRs then setting hgatp and vsatp for new guest.


>
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>   
>>       return get_page(page, p2m->domain) ? page : NULL;
>>   }
>> +
>> +/* Should be called before other CSRs are stored to avoid speculation */
>> +void p2m_ctxt_switch_from(struct vcpu *p)
> What interaction with the storing of other CSRs would be problematic?

Please, look at the reply above.

>
>> +{
>> +    if ( is_idle_vcpu(p) )
>> +        return;
>> +
>> +    /*
>> +     * No mechanism is provided to atomically change vsatp and hgatp
>> +     * together. Hence, to prevent speculative execution causing one
>> +     * guest’s VS-stage translations to be cached under another guest’s
>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>> +     * finally write the new vsatp value what will be done in
>> +     * p2m_handle_vmenter().
>> +     */
>> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>> +
>> +    /*
>> +     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
>> +     * or/and in p2m_handle_vmenter().
>> +     */
>> +}
>> +
>> +/* Should be called after other CSRs are restored to avoid speculation */
>> +void p2m_ctxt_switch_to(struct vcpu *n)
> Same question here.
>
>> +{
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
>> +
>> +    if ( is_idle_vcpu(n) )
>> +        return;
>> +
>> +    csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));
>> +    /*
>> +     * As VMID is unique per vCPU and just re-used here thereby there is no
>> +     * need for G-stage TLB flush here.
>> +     */
>> +
>> +    csr_write(CSR_VSATP, n->arch.vsatp);
>> +    /*
>> +     * As at the start of context switch VSATP were set to 0, so no speculation
>> +     * could happen thereby there is no need for VS TLB flush here.
>> +     */
>> +}
>> +
>> +void p2m_handle_vmenter(void)
>> +{
>> +    struct vcpu *c = current;
> Can you please stick to conventional names, i.e. "curr" here?

Sure, I will do that. Also, then I have update in some other patches the name of similar
variable.

>
>> +    struct p2m_domain *p2m = p2m_get_hostp2m(c->domain);
>> +    struct vcpu_vmid *p_vmid = &c->arch.vmid;
>> +    uint16_t old_vmid, new_vmid;
> Nit: No real need for a fixed-width type here?

It could be just 'unsigned int' or 'unsigned short'.

>
>> +    bool need_flush;
>> +
>> +    BUG_ON(is_idle_vcpu(current));
>> +
>> +    old_vmid = p_vmid->vmid;
>> +    need_flush = vmid_handle_vmenter(p_vmid);
>> +    new_vmid = p_vmid->vmid;
>> +
>> +#ifdef P2M_DEBUG
>> +    printk("%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
>> +           c, old_vmid, new_vmid, need_flush);
>> +#endif
>> +
>> +    if ( old_vmid != new_vmid )
>> +        csr_write(CSR_HGATP, construct_hgatp(p2m, p_vmid->vmid));
>> +
>> +    if ( unlikely(need_flush) )
>> +    {
>> +        local_hfence_gvma_all();
>> +        flush_tlb_guest_local();
>> +    }
> Why would the latter be needed here at all? And if it was needed, why
> would it depend on whether a VMID roll-over occurred?

I misread a spec for the case when implementation uses two TLBs: one that
maps guest virtual addresses to guest physical addresses, and another that
maps guest physical addresses to supervisor physical addresses, that it should
be HFENCE.VVMA, but it is written that HFENCE.GVMA.

So flush_tlb_guest_local() should be dropped here.

~ Oleksii


