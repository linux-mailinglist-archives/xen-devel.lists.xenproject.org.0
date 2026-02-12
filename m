Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGB2BTPAjWkZ6gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:57:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AFB12D354
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228842.1534944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVJx-0000AS-Pm; Thu, 12 Feb 2026 11:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228842.1534944; Thu, 12 Feb 2026 11:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVJx-00008Z-N1; Thu, 12 Feb 2026 11:57:21 +0000
Received: by outflank-mailman (input) for mailman id 1228842;
 Thu, 12 Feb 2026 11:57:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqVJw-00008S-FV
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:57:20 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb57a497-0809-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 12:57:19 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-65a1974d3dfso4531352a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 03:57:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65a3cf50e38sm1625712a12.33.2026.02.12.03.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 03:57:17 -0800 (PST)
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
X-Inumbo-ID: fb57a497-0809-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770897438; x=1771502238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99v7fTC8rCn+pjBz3eOiv07Ui8LgZ1kj0Qxl4XK7dcw=;
        b=aUmzpxQqGRyB9mJB2irI7l0qHm4U0Xw39kwZ2U3XlKvxDru9nGzYQwkdluJirStJiW
         pErreBzc2XKC8kgOvXPKhPLNrJ+3CArqBvnG5B+tfM0/ldaXm1XKR+Jh17W4rkKhYi8n
         /x00uZzB1Xjt8LxM0qf9eHRMPxYqXJTggpVtvH6u6OQswJEIVY7GJEvVsc+Rpo4D1jyc
         Y/aT7CX1mPVR8aA5MNQnK0+itj+frTJjovIXqth9vBA6ng1/rXRJ6+Rm4Ck2DlL5d2QO
         vaUI1RPw4ZbrI2htri788nRP22UhRJjzfr0dIsFXOqmFFt9O8v9EXAJzuV0mb3+8uApG
         vUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897438; x=1771502238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99v7fTC8rCn+pjBz3eOiv07Ui8LgZ1kj0Qxl4XK7dcw=;
        b=tS4CQAAWLeyFYHweOekl3YhSJt9SkqXh438OR9lazttuL5GKulp3Md05FloTLKah+F
         HrTP3IIt0KK0OtPLzEBhei7PuvF1X6vK4KuqkrMx1JYaVkC104dODpl5vhAD3MZkg1mf
         rByzEI3/3GaICQhG07iWv+Af7NTjtAV+TAzXOgzGRvizVgHTmxqOIIJSLZZ9SgAxk49H
         b1vSZ7jJgop+czqWGa2WmlfiJLZfFB5fS86IwsZu1oY/Mf13Ot/erjO+crlUvRrNWg7s
         IWGmwJEzyzXJrwkylZ1BEA8DQA+O7k1BJQZhZ6A8WsptI+a0HdgvJKMKgYEfbnfBIthf
         uykA==
X-Forwarded-Encrypted: i=1; AJvYcCUrW16cK+Oi9c9zgFZwDu3R6UaoDJ6fRDmc/wFqy+RygUwTolcLLasR3hSlCAzIyGK+PK0CyS+O4cI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTjuV7TuUD8V4/pVDaN5a8+6snaS4XYqUrDBfXoYBAatfOtH0e
	S075eWbkLDDgaIsMtJVkoqZ1Fv/l2pjZUb/cp4ft0o/ukpR76HdTsetU
X-Gm-Gg: AZuq6aKrYs1Ng1vAEKayaH8UeJqhFRzp5uwtta3bLaFXuEKGxbDXTBhQcvODp78Pxri
	tdD94Dy5PcyFfl9TCow1oQIuIj5oh0AxbQZi3vNpv11rjYEf8wsi3WinhUcyICF2FUtdjJtuzoF
	o33sOWg18bJVU7vJhr+nMl1BYlBfLRWlO0PH3HF+/1Z7tqrXcwzTgIzBQafSJX/ml9pM3CmG/i1
	MFOSE4v98PYqRlFyTp7xVthzt7kVlsIYH4ggoKDIsx6EOr4CGCHso03pGuIlmmmQS1ZrAvWknMQ
	mtpA2G9oDiaJZij/6P/YsNUb1OPRMxKTlDAApqet+9hXkx1e7OAiuDo9dvNQ8UoReBuyYFN373P
	JsD8QpuB8dJ3iwMmZoJL6Ykvgw5E8yPqcU/UFV2nmBmgVxTpdVCyQIYCe7GzvxJhbP3YnZsrZsf
	57ciwGgL+borLf0Nq5lhHggBAUr7yRdVPy36dSmJzqVa5z1ZtHZQy/Ng73RWIXnw5vjzBR4xs0R
	JM=
X-Received: by 2002:a05:6402:5249:b0:659:4b76:74f4 with SMTP id 4fb4d7f45d1cf-65b96de8661mr1397346a12.16.1770897438092;
        Thu, 12 Feb 2026 03:57:18 -0800 (PST)
Message-ID: <099768df-ec44-454f-8a9e-4897d81309f9@gmail.com>
Date: Thu, 12 Feb 2026 12:57:16 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7cec918c-bd58-4013-9ec2-d43ff7afcd7c@suse.com>
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
X-Rspamd-Queue-Id: 75AFB12D354
X-Rspamd-Action: no action


On 2/12/26 11:16 AM, Jan Beulich wrote:
> On 10.02.2026 17:36, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1434,3 +1434,126 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>   
>>       return get_page(page, p2m->domain) ? page : NULL;
>>   }
>> +
>> +void p2m_ctxt_switch_from(struct vcpu *p)
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
>> +     * Nothing to do with HGATP as it is constructed each time when
>> +     * p2m_handle_vmenter() is called.
>> +     */
>> +}
>> +
>> +void p2m_ctxt_switch_to(struct vcpu *n)
>> +{
>> +    if ( is_idle_vcpu(n) )
>> +        return;
>> +
>> +    n->domain->arch.p2m.is_ctxt_switch_finished = false;
> How can the context switch of a vCPU affect domain-wide state?

It is wrong to have is_ctxt_switch_finished per domain, it should be
vCPU field.

>
>> +    /*
>> +     * Nothing to do with HGATP or VSATP, they will be set in
>> +     * p2_handle_vmenter()
>> +     */
> Why can this not be done here?

As VMID should be calculated on VM enter.

We can update HGATP and VSATP here with VMID stored before in p2m_ctxt_switch_from(),
but then it is possible when vmid_handle_vmenter() will be called before VM entry
VMID could be changed and it will be needed again to update HGATP and VSATP what
will lead to flushing of VS TLB twice (one in p2m_ctxt_switch_to() and another one
in p2m_handle_vmenter()).

This is also an answer to ...

>
>> +}
>> +
>> +void p2m_handle_vmenter(void)
>> +{
>> +    struct p2m_domain *p2m = &current->domain->arch.p2m;
> To save yourself (or others) future work, please never open-code p2m_get_hostp2m()
> (applies further up as well, as I notice only now).
>
>> +    struct vcpu_vmid *p_vmid = &current->arch.vmid;
>> +    uint16_t old_vmid, new_vmid;
>> +    bool need_flush;
>> +    register_t vsatp_old = 0;
>> +
>> +    BUG_ON(is_idle_vcpu(current));
> This is the 3rd use of current - latch into a local variable?
>
>> +    /*
>> +     * No mechanism is provided to atomically change vsatp and hgatp
>> +     * together. Hence, to prevent speculative execution causing one
>> +     * guest’s VS-stage translations to be cached under another guest’s
>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>> +     * finally write the new vsatp value
>> +     *
>> +     * CSR_VSATP is already set to 0 in p2m_ctxt_switch_from() in the
>> +     * case when n->arch.is_p2m_switch_finished = false. Also, there is
>> +     * BUG_ON() below to verify that.
>> +     */
>> +    if ( p2m->is_ctxt_switch_finished )
>> +        vsatp_old = csr_swap(CSR_VSATP, 0);
> This shouldn't be needed when ...
>
>> +    old_vmid = p_vmid->vmid;
>> +    need_flush = vmid_handle_vmenter(p_vmid);
>> +    new_vmid = p_vmid->vmid;
> ... the VMID doesn't change. Imo you want to drop is_ctxt_switch_finished
> again, handle things normally in p2m_ctxt_switch_to(), and deal with merely
> a changing VMID here.

... (check the answer above)

If it is okay to have potential double VS TLB flush and double update of
HGATP and VSATP when old_vmid != new_vmid then we can do in this way.

>
>> +#ifdef P2M_DEBUG
>> +    printk("%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
>> +           current, old_vmid, new_vmid, need_flush);
>> +#endif
>> +
>> +    csr_write(CSR_HGATP, construct_hgatp(p2m_get_hostp2m(current->domain),
>> +              new_vmid));
> Bad indentation - new_vmid isn't an argument to csr_write().

Oh, sure, I will update that.

Thanks.

~ Oleksii


