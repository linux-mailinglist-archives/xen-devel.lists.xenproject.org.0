Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAcyBsoEjmlf+gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:50:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8DA12FA23
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229596.1535525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZt4-0006cl-12; Thu, 12 Feb 2026 16:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229596.1535525; Thu, 12 Feb 2026 16:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZt3-0006ag-UA; Thu, 12 Feb 2026 16:49:53 +0000
Received: by outflank-mailman (input) for mailman id 1229596;
 Thu, 12 Feb 2026 16:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZt2-0006aa-7n
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:49:52 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d82e42ab-0832-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 17:49:49 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43621bf67ceso48102f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:49:49 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfc54csm12599378f8f.25.2026.02.12.08.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 08:49:48 -0800 (PST)
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
X-Inumbo-ID: d82e42ab-0832-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770914989; x=1771519789; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byoUb3vfnpNgaaIhdP9vNrdOMnRvfJw//ARcxtXrocI=;
        b=e7h6tDq2Va6ShU3j+bYeVMHfHY8CsxCV8HVkspquMjJOMnJqqdRNQ4OeHNcwpuVKVf
         0GGwFiDoFTfJqZSREOtWH/nAr0M92dmPh5Bp3P0CawlYREBCR99JPsMrvOKxJQpsxKk3
         M84LJN1ySvZWGp1SANvEh17oPtsxa2oB4HNGCGnlVeZkaPAioDxNZir502UsKg9Y684z
         1TFkpxryS6kIB5550Ib8aP3vVvm2p1gUdv6rGiPQjSFRVeYJnpfmZEpWdLHh01+h0DBa
         rO27VSuP/4ftcmuIkp8tIJzeUpCiaAO1DRiYs8abyhbNcGybdEUfTMHQzi5UmOUBRh5n
         qXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914989; x=1771519789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byoUb3vfnpNgaaIhdP9vNrdOMnRvfJw//ARcxtXrocI=;
        b=WKcgD7X8eUkIqAzTU1dCtPFRavKHicwvX62sQGOtrAZtIgfmopqU2cKIpCxW8V1rSK
         3uE8VxssS5ptPfu4mzs32p8fzxwYBI5gYVtAWEbf8wjLIZWF3b+50oFw53LQWZoA4EIJ
         I9oDgOBYJRvlCRW90NG/lnTm171qHJivl+ZWRDyGX8OATCGNPO0h90IxOBgXyNYRHAE2
         tZjBoiDyIATjqMqqq0wOPnCcXbbQK+WMjWofhRMP+5/akInOSVlnII76rfFFLo1++lpU
         0xcSkVCot2gTfjqvHlA3wdI5E9KOqFcH3VPw2JtzB/lh3kSlv4cQ3q3R2c/iuvMSVVBU
         AZ2g==
X-Forwarded-Encrypted: i=1; AJvYcCU3yRsuLuulTI6W7F5/iQ5oritG30TpA93jWSi2/VjSqhzwIm2tiPUG6jIU7JobYt2b42VngR/rHJs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz436H1aQ4BMJd0D6wT+C2tGUlMJTXaFQQg5ulZSj5C6DDhsV4g
	p3mU3l5cKTFSu14wqgWL4FLmobc4BQaRWc6o+lvN/IBumsuVGMG+w81P
X-Gm-Gg: AZuq6aLlmmKV5UkKGRigvf/UdLqOUCwb5RsMK8wm3IIpfsaMItP6ShmAuj6eeooTOpW
	07IBfwmCSIMtLVe3OsApNK7FTn+03kfJZMOaMN3tII7E45bRlXmdDl2x8PCx+hYYM77D82v7Ldr
	sMI/yaoqvRcse/Kj6R8GMpw+w1gJTn93NghYmKzSnlTLpkipiIRjQrhBbkM1vTc2P0F88xthji6
	15oVUP2RzLG9/N6lyeackQEvuQ+Hk5vexpio+SX0yHAcpsSznDAxMI77DrCDgNKTbx0suFMFdyP
	dXeA0yTGFpUtuzT8KhsyMEUzqM18YtlQmRqEZXZaliLIbuvRews/1ZgR9ofUaF7K10s0x3KfO2V
	ICk1mhHkw0wlbFBq3IoSkZWto1IbF2lcYbV92jMDMeZH1cmSUypNcqAIcjazsHESjysRGGXsnRQ
	3Obxb28ppwqg5WTaN1qHFMAwsFnRYFdSKO6gbCtOi+euQW5erJ6972QaaPojmk70+vY+wWvsB58
	Po=
X-Received: by 2002:a05:6000:18a4:b0:435:e448:2ce5 with SMTP id ffacd0b85a97d-4378ac9c6efmr6699890f8f.48.1770914988774;
        Thu, 12 Feb 2026 08:49:48 -0800 (PST)
Message-ID: <4ff03584-d0ce-4740-b10f-5b009aaaebca@gmail.com>
Date: Thu, 12 Feb 2026 17:49:47 +0100
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
 <4f9953ae-8722-4971-a214-6c40f7f5859a@gmail.com>
 <45e8aa5a-842b-49d0-8744-71295cf0a0b6@suse.com>
 <909969c1-1d75-4f45-a96b-54c1c28839df@gmail.com>
 <67e6cdb3-33d1-44aa-94ea-8e26def9f8e8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <67e6cdb3-33d1-44aa-94ea-8e26def9f8e8@suse.com>
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
X-Rspamd-Queue-Id: 7A8DA12FA23
X-Rspamd-Action: no action


On 2/12/26 5:20 PM, Jan Beulich wrote:
> On 12.02.2026 17:16, Oleksii Kurochko wrote:
>> On 2/12/26 4:42 PM, Jan Beulich wrote:
>>> On 12.02.2026 15:47, Oleksii Kurochko wrote:
>>>> On 2/12/26 1:56 PM, Jan Beulich wrote:
>>>>> On 12.02.2026 12:57, Oleksii Kurochko wrote:
>>>>>> On 2/12/26 11:16 AM, Jan Beulich wrote:
>>>>>>> On 10.02.2026 17:36, Oleksii Kurochko wrote:
>>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>>> @@ -1434,3 +1434,126 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>>>>>>      
>>>>>>>>          return get_page(page, p2m->domain) ? page : NULL;
>>>>>>>>      }
>>>>>>>> +
>>>>>>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>>>>>>> +{
>>>>>>>> +    if ( is_idle_vcpu(p) )
>>>>>>>> +        return;
>>>>>>>> +
>>>>>>>> +    /*
>>>>>>>> +     * No mechanism is provided to atomically change vsatp and hgatp
>>>>>>>> +     * together. Hence, to prevent speculative execution causing one
>>>>>>>> +     * guest’s VS-stage translations to be cached under another guest’s
>>>>>>>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>>>>>> +     * finally write the new vsatp value what will be done in
>>>>>>>> +     * p2m_handle_vmenter().
>>>>>>>> +     */
>>>>>>>> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>>>>>>>> +
>>>>>>>> +    /*
>>>>>>>> +     * Nothing to do with HGATP as it is constructed each time when
>>>>>>>> +     * p2m_handle_vmenter() is called.
>>>>>>>> +     */
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +void p2m_ctxt_switch_to(struct vcpu *n)
>>>>>>>> +{
>>>>>>>> +    if ( is_idle_vcpu(n) )
>>>>>>>> +        return;
>>>>>>>> +
>>>>>>>> +    n->domain->arch.p2m.is_ctxt_switch_finished = false;
>>>>>>> How can the context switch of a vCPU affect domain-wide state?
>>>>>> It is wrong to have is_ctxt_switch_finished per domain, it should be
>>>>>> vCPU field.
>>>>>>
>>>>>>>> +    /*
>>>>>>>> +     * Nothing to do with HGATP or VSATP, they will be set in
>>>>>>>> +     * p2_handle_vmenter()
>>>>>>>> +     */
>>>>>>> Why can this not be done here?
>>>>>> As VMID should be calculated on VM enter.
>>>>> And I didn't suggest to calculate a new one here.
>>>>>
>>>>>> We can update HGATP and VSATP here with VMID stored before in p2m_ctxt_switch_from(),
>>>>>> but then it is possible when vmid_handle_vmenter() will be called before VM entry
>>>>>> VMID could be changed and it will be needed again to update HGATP and VSATP what
>>>>>> will lead to flushing of VS TLB twice (one in p2m_ctxt_switch_to() and another one
>>>>>> in p2m_handle_vmenter()).
>>>>> Is this a concern resulting from particular logic you expect to appear
>>>>> in the window between context switch and entering the guest, or is this
>>>>> merely an abstract concern?
>>>> If we will have VS TLB flush unconditionally in VM entry then it is merely an
>>>> abstract concern.
>>> Why would we want to flush unconditionally?
>> To guarantee that a guest sees a clean switch with no possibilities of
>> using a stale entry. For example, if VMID changed between context switch
>> and VM entry we want to have flush, but considering your reply here ...
>>
>>>> Otherwise, considering that speculation could happen between
>>>> context switch and VM entry what could lead to that some entries were added to
>>>> VS TLB flush with old VMID in the case if then in VM entry vCPU might receive new
>>>> VMID.
>>> I don't understand: Context switch leaves vsatp.MODE at zero. Nothing can end
>>> up in the VS TLB in that case, aiui
>> ... we just have different implementation in mind for p2m_ctxt_switch_to().
>>
>> I thought that your suggestion is to set both HGATP and VSATP in p2m_ctx_switch_to()
>> while calculate VMID in p2m_handle_vmenter() (with potential update of HGATP and VSATP
>> if needed) and with such approach VSATP won't be zero after p2m_ctx_switch_to() and
>> speculation could happen between context switch and VM entry.
>>
>> So just to clarify your expectations are:
> So just to clarify from my side that I don't have any expectations; I
> merely want to suggest to start with as simple a model as possible,
> for its correctness to be easy to prove.

Got you. Then it seems like the easiest approach is to follow what is in this
patch until ...

>> 1. p2m_ctxt_switch_from(p):
>>         p.vsatp = VSATP
>>         VSATP = 0
>>
>> 2. p2m_ctxt_swith_to(n):
>>         HGATP = construct_hgatp(...)
>>
>> 3. p2m_handle_vmenter(n):
>>         update VMID if necessary
>>         
>>         recalculate HGATP if necessary
>>         
>>         (c) update VSATP with n.VSATP if we here from context switch
>>             or with hardware VSATP if it wasn't context switch.
>>          
>>         do necessary flushes
>>
>> And at step (c) we can't base on that if VSATP is zero or not to understand that
>> it is from context switch as it could that guest at the moment of trap (lets say
>> some SBI call was requested by guest and Xen just handles it and return back
>> to guest) also had VSTAP = 0.
>> So it is needed to distinguish if context switch happened or not to properly deal
>> with VSATP (and it was one of the reson to have introduced in this patch
>> is_ctxt_switch_finished).

... we could find a better way to detect if context switch happened before entering
VM entry path or not without introduction of its ugly bool variable
is_ctxt_switch_finished as I mentioned above it seems to me it is not enough just to
check if VSATP is zero or not as guest could had VSATP equal to 0 before trap.

That is why the approach suggested earlier:
   For example, assuming CSR
   reads aren't overly expensive, it looks to me as if during VM entry
   - vsatp only needs writing when vsatp.MODE is zero,
   - hgatp only needs writing when vsatp.MODE is zero or when the VMID needs
     updating.

as it isn't clear with what should be updated vsatp (vsatp only needs writing when vsatp.MODE is zero)
with what it was written before we were in a guest or with what ve saved in vcpu->arch.vsatp during
context switch.

Am I missing something obvious?

Thanks.

~ Oleksii


