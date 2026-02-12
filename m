Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLa4Nj/OjWn87AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 13:57:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431AE12DAC8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 13:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228921.1534991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqWFT-0000mS-K4; Thu, 12 Feb 2026 12:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228921.1534991; Thu, 12 Feb 2026 12:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqWFT-0000kb-H2; Thu, 12 Feb 2026 12:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1228921;
 Thu, 12 Feb 2026 12:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqWFR-0000kO-L9
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 12:56:45 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480986e1-0812-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 13:56:43 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so48666395e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 04:56:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836cd7af87sm24982885e9.1.2026.02.12.04.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 04:56:42 -0800 (PST)
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
X-Inumbo-ID: 480986e1-0812-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770901003; x=1771505803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gutz9gHyQftychG/V5j1emZkoWQn85qndlHYdrxJUEc=;
        b=g4+4NE/gLKs/3kfZHMvNTJjOBBbNZOBtYCIrso/EG+z5KiXkUw5QhdW18flvY8OQTA
         gowtmFxdJwTOgTsL3A8T2hKpMH85ncFMPIe91yCquq8hBMfFJNNp8vdDV1x4tzooXHNq
         69TUeo2NSsb67iUNXnicQ8z1lLNg+mExFMqcvEYZufh9N7ysF+HvCWMfKer/+TBa/E/x
         5FhqB3N0rtdY8TWQaqtFcudWOdKb6w3mFQoSqEurjh1Phz9HmkoyqNbT4n1i8xImmn4U
         G46qaBoETAzUR6UJ6qPQWUbpXxN/JUUWfkDYKty7KtqAQNOgAjgmafVQ7Ot7/uShmceG
         LHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770901003; x=1771505803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gutz9gHyQftychG/V5j1emZkoWQn85qndlHYdrxJUEc=;
        b=sRcEQ5Gn1N+Q/VYnVjfYUz2E0BIVg+hE2PSpy+Hq9tXbcbm5Xd100X+IqksaGn9Bn3
         lGueWMCuPteHZZKGGAn4XsIgz0CmdJ7YQjl35dCAbHww8C/scpXD2uBLYvs/nzzUr+vO
         gicWNOYDNVinJLtU1AvYymBy04BsxfsdS441sQ3q8MemNlnPXK9hjVV4StPitQ3UE+vN
         8URPVxvThgNEC+wK6VXaFvfGAuCxRzUoln7drMq3w2mwo0dUo/5JTphyP1TEa7EuT2pY
         fuqRKIFErJV4iYJemgyx/ZAmJhoOwCGIRTxsH5KEx4qmWo1eyvHzBHvZCNUQpIUc0Or+
         QtAA==
X-Forwarded-Encrypted: i=1; AJvYcCUVBsvR+kaIpzlNFDPAzEbk/SKI3bmmzPE8Yvm4gWvtUtLJVAnZFiYh9gM/8N8FEJuXstL+Z+1LF30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygBI60cHYxr9xI5nCDAizTT9Wk+aTURB/HbA+9v2g4mzBK2EnN
	T2bjP1XZ9tKsJp1/bvsqaIASdCslPXFVpfbvDc9/4yfVhZwQtdsFmv6Mal0qSXGWNQ==
X-Gm-Gg: AZuq6aK224n3/c4O+HY2S/kqLIE/lnq4qWMmM63QC60roODq38GSQs7KXF5QrVC+q7W
	4vuVkeD9Z9NFuzO208mm3BVQ5ZxKYM515QLri6CW8OcQtQJxh9e+QBeY5X7NWNgkf3JAzw/XNxo
	LkchUJxmPvgP2l4nR/wrQfUh3iSOs4uB3fz2xsPcNZwnD0J4QbB+qHHWKJ7+KknZ3hiopg6qPgy
	Ej2/hRIibRCbfizDTu77iUm3NKEtd5wUIrtB4e49TKiRFAiaM0wyo975kLSj5BCdlT+x0owb1MD
	FwKNiShGKZf6vp9QvNAZovIn8qd+Op7MvikvyRtUFshmIx9btUTp4VohpAOeZ1NQd3Sn3Uq+n8U
	ODnl+hFc+UcqWYmQj5FE2Vt+de7a7k9sSJbocSLXBRUPDGdkFCPuELgUYaFCgZeRUGXD+9yMKfH
	XwbM9JrWWe6xS9zSWTdxbpfKT2oyTx4/ZNtTQhlyomMJf+7Rx0cBtAYoDioWYgtOAy4n15nwp+G
	gRjajAKdE/MhE8=
X-Received: by 2002:a05:600c:3e0d:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-483656ae349mr37071205e9.2.1770901003130;
        Thu, 12 Feb 2026 04:56:43 -0800 (PST)
Message-ID: <ba48bef0-551e-4ea7-8d9a-fb54b9b85da6@suse.com>
Date: Thu, 12 Feb 2026 13:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/riscv: add p2m context switch handling for
 VSATP and HGATP
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <099768df-ec44-454f-8a9e-4897d81309f9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 431AE12DAC8
X-Rspamd-Action: no action

On 12.02.2026 12:57, Oleksii Kurochko wrote:
> On 2/12/26 11:16 AM, Jan Beulich wrote:
>> On 10.02.2026 17:36, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -1434,3 +1434,126 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>   
>>>       return get_page(page, p2m->domain) ? page : NULL;
>>>   }
>>> +
>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>> +{
>>> +    if ( is_idle_vcpu(p) )
>>> +        return;
>>> +
>>> +    /*
>>> +     * No mechanism is provided to atomically change vsatp and hgatp
>>> +     * together. Hence, to prevent speculative execution causing one
>>> +     * guest’s VS-stage translations to be cached under another guest’s
>>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>> +     * finally write the new vsatp value what will be done in
>>> +     * p2m_handle_vmenter().
>>> +     */
>>> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>>> +
>>> +    /*
>>> +     * Nothing to do with HGATP as it is constructed each time when
>>> +     * p2m_handle_vmenter() is called.
>>> +     */
>>> +}
>>> +
>>> +void p2m_ctxt_switch_to(struct vcpu *n)
>>> +{
>>> +    if ( is_idle_vcpu(n) )
>>> +        return;
>>> +
>>> +    n->domain->arch.p2m.is_ctxt_switch_finished = false;
>> How can the context switch of a vCPU affect domain-wide state?
> 
> It is wrong to have is_ctxt_switch_finished per domain, it should be
> vCPU field.
> 
>>
>>> +    /*
>>> +     * Nothing to do with HGATP or VSATP, they will be set in
>>> +     * p2_handle_vmenter()
>>> +     */
>> Why can this not be done here?
> 
> As VMID should be calculated on VM enter.

And I didn't suggest to calculate a new one here.

> We can update HGATP and VSATP here with VMID stored before in p2m_ctxt_switch_from(),
> but then it is possible when vmid_handle_vmenter() will be called before VM entry
> VMID could be changed and it will be needed again to update HGATP and VSATP what
> will lead to flushing of VS TLB twice (one in p2m_ctxt_switch_to() and another one
> in p2m_handle_vmenter()).

Is this a concern resulting from particular logic you expect to appear
in the window between context switch and entering the guest, or is this
merely an abstract concern?

> This is also an answer to ...
> 
>>
>>> +}
>>> +
>>> +void p2m_handle_vmenter(void)
>>> +{
>>> +    struct p2m_domain *p2m = &current->domain->arch.p2m;
>> To save yourself (or others) future work, please never open-code p2m_get_hostp2m()
>> (applies further up as well, as I notice only now).
>>
>>> +    struct vcpu_vmid *p_vmid = &current->arch.vmid;
>>> +    uint16_t old_vmid, new_vmid;
>>> +    bool need_flush;
>>> +    register_t vsatp_old = 0;
>>> +
>>> +    BUG_ON(is_idle_vcpu(current));
>> This is the 3rd use of current - latch into a local variable?
>>
>>> +    /*
>>> +     * No mechanism is provided to atomically change vsatp and hgatp
>>> +     * together. Hence, to prevent speculative execution causing one
>>> +     * guest’s VS-stage translations to be cached under another guest’s
>>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>> +     * finally write the new vsatp value
>>> +     *
>>> +     * CSR_VSATP is already set to 0 in p2m_ctxt_switch_from() in the
>>> +     * case when n->arch.is_p2m_switch_finished = false. Also, there is
>>> +     * BUG_ON() below to verify that.
>>> +     */
>>> +    if ( p2m->is_ctxt_switch_finished )
>>> +        vsatp_old = csr_swap(CSR_VSATP, 0);
>> This shouldn't be needed when ...
>>
>>> +    old_vmid = p_vmid->vmid;
>>> +    need_flush = vmid_handle_vmenter(p_vmid);
>>> +    new_vmid = p_vmid->vmid;
>> ... the VMID doesn't change. Imo you want to drop is_ctxt_switch_finished
>> again, handle things normally in p2m_ctxt_switch_to(), and deal with merely
>> a changing VMID here.
> 
> ... (check the answer above)
> 
> If it is okay to have potential double VS TLB flush and double update of
> HGATP and VSATP when old_vmid != new_vmid then we can do in this way.

I think the simpler, straightforward approach should be used initially,
with improvements made once a performance issue was actually determined, or
once a less ugly (sorry) approach was found. For example, assuming CSR
reads aren't overly expensive, it looks to me as if during VM entry
- vsatp only needs writing when vsatp.MODE is zero,
- hgatp only needs writing when vsatp.MODE is zero or when the VMID needs
  updating.

Jan

