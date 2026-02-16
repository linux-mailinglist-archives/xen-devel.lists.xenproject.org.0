Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDpOFIs+k2kg2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:58:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E6145D88
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234336.1537631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0yj-0006IY-N0; Mon, 16 Feb 2026 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234336.1537631; Mon, 16 Feb 2026 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0yj-0006H6-JK; Mon, 16 Feb 2026 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1234336;
 Mon, 16 Feb 2026 15:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NroF=AU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vs0yi-0006Fa-1v
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:57:40 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37cb7dc7-0b50-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 16:57:38 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43590777e22so2021885f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 07:57:38 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1b4sm26294174f8f.14.2026.02.16.07.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:57:37 -0800 (PST)
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
X-Inumbo-ID: 37cb7dc7-0b50-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771257458; x=1771862258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2QbYMgoGKU0CkKm8Tw/2r+d757fwnV/mMyLBtG5Du8=;
        b=NynLeF24LjzmcGr0A5oR6UFHsVQc4bvDnluX7tVv/kA+14nMdpxahxDPkUnNLtlNM2
         Gkh98jwYo4lq9bUvPyG+q8Zk63EqlRTuz4FfSfJ6fHRrWtiCzPefIoFCrlOOLFyn7lJc
         mLnS4Ds2KaoukrodG0y+l9Lk/aXFDK/1tLTuvq7Ze1Yi34nThRGPTdf79fvf7+lid3Nw
         4YrROb7ctgHi1c2eXJdExlD1b8jqlMTC6g0//ICLxXadwyoA56NoCn/tDKRXhRg4VxrD
         bPxfn75yRkZFUrQgBKPypsmaJnJakYx94Tz6QgrF96m95Z+Is9aa11pZZBJvo2YGjDj8
         qRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257458; x=1771862258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2QbYMgoGKU0CkKm8Tw/2r+d757fwnV/mMyLBtG5Du8=;
        b=BWXiAsHJwWIa9KAyx/GhlBH47A5ZEjJ3UugVAbj5CVUoVkctv/9sGRBOxww8jZ1Evc
         rVbcJ0IWr75RtXU0mbdlr66bLrsekz9G27GRXOZRxdcpbffVhEv8xiqB+N8/I1RFgPnH
         C+rmhj+DfuBO1KqFX6dBaEuG1NGITpIbVtcDMXYVhB2pTG0vvkCAD0U+xk8WBCwYg7SO
         a+4lgH/2LqTRCTq8eVsU29zKtZYFLJX/yknyl9Hg9XEZIpT8XnfhYhvI2QOtP+G8c6yN
         sArRnX1xib5iGogft0T+E+fQrwmWkCrYh/CpwyEyCZbjW7ppYM/aOe5iq4QHhs7Yzuv4
         ZZGw==
X-Forwarded-Encrypted: i=1; AJvYcCXrVQUJKwhhNdpSRQgWzk4PMSFDNbJj1BwTNRc34GMfW4ZvrLEPW7msN7XyrKS3nEEnp6hNIprL8U4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjdE5nqa/QZ3fUIhiuq1vtfGuD3KnDLfjO4yVovHDujUQfSYWF
	8PtzYNgoeVpYEa2sAHmge5BQoxWzmpguPns59DVEgRAQadrKkuyg7MLH
X-Gm-Gg: AZuq6aK6Ko+aJSk+FB3P2gv24qFjPU2OJZiRIrKcH+/GQ+obycmSs8gejbp998RlEsN
	c6b8sBmprvYk4VBs9aO7M1P3fd3onBD/MaI+jInuIzorvn2roDrmU5hsMcD63yL8uCe3P3MYO1r
	QuW0lrGY8IiC1cXhPTb0j5CQVIa6Jo5F0oQGa8MfYxdCbRIO6Mrf/V82qMCpv/ZjRFOGrnEQmvC
	r8F1SF0WnA0RyoHy0hKR1Ns7tDT62DJEsm0e38r/B05zyPgBXvQ9PDMTrl+XyRyjKPRkeFD8RiT
	0bTaOa6oEdzSuJ4VyYrOtOK3K6qFVjToE292obg2A6PoLn7HvJv2spHL7J7kVUwcTPAO1/+sm4J
	fMWXqA8uYHarWAJoMga3ZVlNP4jSYxkbeTxOgZwEp347KRSiPPih3gmeLm2LfL4Z6p0ylgrVpJN
	Pwy0nFpANV2JK6WzT3PEYZi5aX0bf4aEVvHt+e2bqaTkFyXEqTH6ius88ZKm7JnFrwt3JvYNicM
	9I=
X-Received: by 2002:a05:6000:230b:b0:437:71cc:a246 with SMTP id ffacd0b85a97d-4379db25d3emr14184983f8f.10.1771257457956;
        Mon, 16 Feb 2026 07:57:37 -0800 (PST)
Message-ID: <f43f99f6-a9cf-4217-953a-f1f449194e6a@gmail.com>
Date: Mon, 16 Feb 2026 16:57:36 +0100
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
 <f4400580-65b8-4dc2-a11a-443840bcb162@gmail.com>
 <cf7c146f-ab1c-4574-ab2b-e0d96ea80db4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cf7c146f-ab1c-4574-ab2b-e0d96ea80db4@suse.com>
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
X-Rspamd-Queue-Id: B41E6145D88
X-Rspamd-Action: no action


On 2/16/26 4:45 PM, Jan Beulich wrote:
> On 16.02.2026 16:34, Oleksii Kurochko wrote:
>> On 2/16/26 12:50 PM, Jan Beulich wrote:
>>> On 13.02.2026 17:29, Oleksii Kurochko wrote:
>>>> Introduce helpers to manage VS-stage and G-stage translation state during
>>>> vCPU context switches.
>>>>
>>>> As VSATP and HGATP cannot be updated atomically, clear VSATP on context
>>>> switch-out to prevent speculative VS-stage translations from being associated
>>>> with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
>>>> required order.
>>>>
>>>> Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
>>>> only when required (e.g. on VMID reuse or generation change).
>>>>
>>>> This provides the necessary infrastructure for correct p2m context switching
>>>> on RISC-V.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in v3:
>>>>    - Add comment above p2m_ctxt_switch_{to, from}().
>>> I find these and other speculation related comments problematic: You can't
>>> prevent every kind of speculation that way, yet all these comments are
>>> written as if that was the case. What I think you mean in all cases is
>>> speculation using the wrong set of page tables?
>> According to the RISC-V spec:
>>     No mechanism is provided to atomically change vsatp and hgatp together. Hence, to
>>     prevent speculative execution causing one guest’s VS-stage translations to be cached
>>     under another guest’s VMID, world-switch code should zero vsatp, then swap hgatp, then
>>     finally write the new vsatp value
>>
>> Based on that my understand is that the following code could provide an issue:
>> (1) csr_write(CSR_SEPC, guest_b->sepc);   ...   (2) csr_write(CSR_VSATP,
>> 0);   csr_write(CSR_HATP, guest_b->hgatp);   csr_write(CSR_VSATP,
>> guest_b->vsatp); As IIUC speculation could happen between (1) and (2)
>> and we could have some VS-stage translations connected to SEPC'c of
>> guest B but with address from guest A page tables. So just to be sure
>> that such isuse won't happen I wrote a comment that first VSATP, then
>> others CSRs then setting hgatp and vsatp for new guest.
> This reply doesn't address the point raised above, it also ...

Okay, then just answering on a question above directly - yes, it is about the using of
the wrong set of page tables. (what I tried to describe in the example above)


>
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>>    
>>>>        return get_page(page, p2m->domain) ? page : NULL;
>>>>    }
>>>> +
>>>> +/* Should be called before other CSRs are stored to avoid speculation */
>>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>> What interaction with the storing of other CSRs would be problematic?
>> Please, look at the reply above.
> ... doesn't apply here, but ...

Probably then I misunderstood your question.

Technically, it wouldn't problematic to write CSRs in any order (even we can ignore
setting of VSTAP to 0), but it will (at least, based on example above) lead to that
we will want to have TLBs flush.


~ Oleksii

>
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
>>>> +     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
>>>> +     * or/and in p2m_handle_vmenter().
>>>> +     */
>>>> +}
>>>> +
>>>> +/* Should be called after other CSRs are restored to avoid speculation */
>>>> +void p2m_ctxt_switch_to(struct vcpu *n)
>>> Same question here.
> ... it addresses this point.
>
> Jan

