Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M9bDn7qjWnG8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:58:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903DB12EAF1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229239.1535232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqY8h-0000qR-FX; Thu, 12 Feb 2026 14:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229239.1535232; Thu, 12 Feb 2026 14:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqY8h-0000n6-C0; Thu, 12 Feb 2026 14:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1229239;
 Thu, 12 Feb 2026 14:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqXyc-0003LH-IS
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:47:30 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c16f0aff-0821-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:47:29 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b885e8c6700so1295979866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 06:47:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f9561f722sm61485966b.10.2026.02.12.06.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 06:47:28 -0800 (PST)
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
X-Inumbo-ID: c16f0aff-0821-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770907649; x=1771512449; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhmKvOCFr03n94/Oog9YHNmUDMvOXW/QHi6iRkXV/To=;
        b=Dev1MkKFsa6LihJd4guLaQwNzPtYbqSGjJCZ5qGs6z0JV+JsCzD6b+X/QgfA0AgVlV
         D5NBdFSS04KMQMvH2LcH0YgEDsTrj5asEH2Fl6mChv9+hjV3bTwChhur3F+sjS47b0Lh
         sIFUyt8PPptAs9ErYgfJCtqTaDhZYqoDUToPaPa91JAdh9dGT3gKkBZSB4A48mz+g+Yx
         l+Suko/CW/7IKb+lYfrcWoqQbua3oCYrMr3QPwbQ8mOSfwt/ahs+PS5ePQO3PLS88j9l
         EQ3H1pumdxwmlvpwZlXZ57XM0CRf19PVeH05AukWYk5WMwBx65o3TKyx5w5jEjyaF2Iv
         APGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907649; x=1771512449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhmKvOCFr03n94/Oog9YHNmUDMvOXW/QHi6iRkXV/To=;
        b=OT0M0mrS3t6oZ8MtLzEN4WMs99yUbXxxUcYIwwMt83+LAdmoxQ2cbaJ94zInJYEos5
         TBbSnfKsc3N3ud8F/cLllOrdvDHGaa1EFKwWGYBs3NCRTgkv8yAb1Hf8UlLJCiTX6AtT
         rplh+V4PtopMWQv1hapnWk8f0Za2SEgJGcNhlhGZJkWNUqrsJwwRDkyMFDYgHErWlrj3
         cbqttBnCBMZhpbMeZqRa48TBYIU2ln1ffsmEAGy1fwXlKfK9eGqZ5/ycF/BUmThXwT02
         Y5rdSXE4PXkkM1krxFJTOZYjqRjIqm0Lc+uDPT/gg27H03ISp+JZw4MI14FfOzAIgmtf
         I0KA==
X-Forwarded-Encrypted: i=1; AJvYcCXHOebqoXjUwpm7Y48nKLnE+9xuYpOWBy0VywzquqYBp/o0+T/cZG+i9QsIy+tmsSN5dsuLwqZw94k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyI9tnkRJskQxLssWVKC0xtyjiVDAebn2mqRj0ykGDLvLQCjk2z
	LD2NS6RKkO3MOPwIvIzfyRadc2wixfaWNk0kmONA3R0gTNVxfd3r5nxc
X-Gm-Gg: AZuq6aJuyNd6AHrdEu2AQpoxrZBFAZ7rG3DV6GIJoI4Y3o3MvroX1Zd6QyG5TqD6K2/
	X+mKeq0MR7GHec4xnOq737MYZ4Q8I1YQeo8iWbD9iFDV1JeqQIAjxgW/rMa95wVA2XYJv5mh+Bb
	NHNbrDU2n9g+H4xfogfR8G2vL5NaMzrd9DCIpHJhw/aYJjas9/n85kvh+PjB5692hpthbA78/LP
	aCEun3WdFSyTl1Xt/YKqikfpHgKZadCfGsMZw9HweysRiKvKb695wPRxS2a5xlHVvCgl1FGYFf5
	sr0Jt2q21JgsI0Zvnh1Pjkd8arRCjCoXWpAfZilbdL77UoKwnOYt1247vTL3nt6WnaPXepJe3TS
	h0xZ5XBAeWmaMTQB7DpPyWpSDl2r2eAuKGaplqLXm2XZTbm33tUqbHf8A417w4LGxxaI+Q9MlN0
	1qTYxQ3r2Xsw53BqGNBT9B+rdF6lUxD1DfOG0PW0HMrhyeMBpgY0mRJ2jQ8d2aaRG+yGKoYxJAN
	NM=
X-Received: by 2002:a17:907:a07:b0:b87:173f:630 with SMTP id a640c23a62f3a-b8f8f60eb4dmr186348266b.40.1770907648995;
        Thu, 12 Feb 2026 06:47:28 -0800 (PST)
Message-ID: <4f9953ae-8722-4971-a214-6c40f7f5859a@gmail.com>
Date: Thu, 12 Feb 2026 15:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/riscv: add p2m context switch handling for
 VSATP and HGATP
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770739000.git.oleksii.kurochko@gmail.com>
 <0e6f450d64ce17f504d73c3429c8e8a9ced0cf06.1770739000.git.oleksii.kurochko@gmail.com>
 <7cec918c-bd58-4013-9ec2-d43ff7afcd7c@suse.com>
 <099768df-ec44-454f-8a9e-4897d81309f9@gmail.com>
 <ba48bef0-551e-4ea7-8d9a-fb54b9b85da6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ba48bef0-551e-4ea7-8d9a-fb54b9b85da6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 903DB12EAF1
X-Rspamd-Action: no action


On 2/12/26 1:56 PM, Jan Beulich wrote:
> On 12.02.2026 12:57, Oleksii Kurochko wrote:
>> On 2/12/26 11:16 AM, Jan Beulich wrote:
>>> On 10.02.2026 17:36, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -1434,3 +1434,126 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>>    
>>>>        return get_page(page, p2m->domain) ? page : NULL;
>>>>    }
>>>> +
>>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>>> +{
>>>> +    if ( is_idle_vcpu(p) )
>>>> +        return;
>>>> +
>>>> +    /*
>>>> +     * No mechanism is provided to atomically change vsatp and hgatp
>>>> +     * together. Hence, to prevent speculative execution causing one
>>>> +     * guest’s VS-stage translations to be cached under another guest’s
>>>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>> +     * finally write the new vsatp value what will be done in
>>>> +     * p2m_handle_vmenter().
>>>> +     */
>>>> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>>>> +
>>>> +    /*
>>>> +     * Nothing to do with HGATP as it is constructed each time when
>>>> +     * p2m_handle_vmenter() is called.
>>>> +     */
>>>> +}
>>>> +
>>>> +void p2m_ctxt_switch_to(struct vcpu *n)
>>>> +{
>>>> +    if ( is_idle_vcpu(n) )
>>>> +        return;
>>>> +
>>>> +    n->domain->arch.p2m.is_ctxt_switch_finished = false;
>>> How can the context switch of a vCPU affect domain-wide state?
>> It is wrong to have is_ctxt_switch_finished per domain, it should be
>> vCPU field.
>>
>>>> +    /*
>>>> +     * Nothing to do with HGATP or VSATP, they will be set in
>>>> +     * p2_handle_vmenter()
>>>> +     */
>>> Why can this not be done here?
>> As VMID should be calculated on VM enter.
> And I didn't suggest to calculate a new one here.
>
>> We can update HGATP and VSATP here with VMID stored before in p2m_ctxt_switch_from(),
>> but then it is possible when vmid_handle_vmenter() will be called before VM entry
>> VMID could be changed and it will be needed again to update HGATP and VSATP what
>> will lead to flushing of VS TLB twice (one in p2m_ctxt_switch_to() and another one
>> in p2m_handle_vmenter()).
> Is this a concern resulting from particular logic you expect to appear
> in the window between context switch and entering the guest, or is this
> merely an abstract concern?

If we will have VS TLB flush unconditionally in VM entry then it is merely an
abstract concern. Otherwise, considering that speculation could happen between
context switch and VM entry what could lead to that some entries were added to
VS TLB flush with old VMID in the case if then in VM entry vCPU might receive new
VMID.

>
>> This is also an answer to ...
>>
>>>> +}
>>>> +
>>>> +void p2m_handle_vmenter(void)
>>>> +{
>>>> +    struct p2m_domain *p2m = &current->domain->arch.p2m;
>>> To save yourself (or others) future work, please never open-code p2m_get_hostp2m()
>>> (applies further up as well, as I notice only now).
>>>
>>>> +    struct vcpu_vmid *p_vmid = &current->arch.vmid;
>>>> +    uint16_t old_vmid, new_vmid;
>>>> +    bool need_flush;
>>>> +    register_t vsatp_old = 0;
>>>> +
>>>> +    BUG_ON(is_idle_vcpu(current));
>>> This is the 3rd use of current - latch into a local variable?
>>>
>>>> +    /*
>>>> +     * No mechanism is provided to atomically change vsatp and hgatp
>>>> +     * together. Hence, to prevent speculative execution causing one
>>>> +     * guest’s VS-stage translations to be cached under another guest’s
>>>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>> +     * finally write the new vsatp value
>>>> +     *
>>>> +     * CSR_VSATP is already set to 0 in p2m_ctxt_switch_from() in the
>>>> +     * case when n->arch.is_p2m_switch_finished = false. Also, there is
>>>> +     * BUG_ON() below to verify that.
>>>> +     */
>>>> +    if ( p2m->is_ctxt_switch_finished )
>>>> +        vsatp_old = csr_swap(CSR_VSATP, 0);
>>> This shouldn't be needed when ...
>>>
>>>> +    old_vmid = p_vmid->vmid;
>>>> +    need_flush = vmid_handle_vmenter(p_vmid);
>>>> +    new_vmid = p_vmid->vmid;
>>> ... the VMID doesn't change. Imo you want to drop is_ctxt_switch_finished
>>> again, handle things normally in p2m_ctxt_switch_to(), and deal with merely
>>> a changing VMID here.
>> ... (check the answer above)
>>
>> If it is okay to have potential double VS TLB flush and double update of
>> HGATP and VSATP when old_vmid != new_vmid then we can do in this way.
> I think the simpler, straightforward approach should be used initially,
> with improvements made once a performance issue was actually determined, or
> once a less ugly (sorry) approach was found. For example, assuming CSR
> reads aren't overly expensive, it looks to me as if during VM entry
> - vsatp only needs writing when vsatp.MODE is zero,
> - hgatp only needs writing when vsatp.MODE is zero or when the VMID needs
>    updating.

Do you mean to do that only in p2m_handle_vmenter() and having
p2m_ctxt_switch_to() does nothing (or just dropped)?
If yes then it could be an option.

I thought about such approach but decided to go with an introduction
of is_ctxt_switch_finished as it looked to me that it is better for
potential TLB flushing optimization.
But I am okay to start with suggested way and re-work it once a
performance issue will be actually determined.

~ Oleksii


