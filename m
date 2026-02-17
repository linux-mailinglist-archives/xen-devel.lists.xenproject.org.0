Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EBoKOM7lGntAgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:58:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801314A9D5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 10:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234733.1537874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsHqm-0000WF-Mt; Tue, 17 Feb 2026 09:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234733.1537874; Tue, 17 Feb 2026 09:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsHqm-0000Tk-K9; Tue, 17 Feb 2026 09:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1234733;
 Tue, 17 Feb 2026 09:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsHql-0000Te-Bf
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 09:58:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37707fc3-0be7-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 10:58:33 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-65a380b554bso6356928a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 01:58:32 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc766554bsm338075466b.46.2026.02.17.01.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:58:30 -0800 (PST)
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
X-Inumbo-ID: 37707fc3-0be7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771322311; x=1771927111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cg5HGzN/ZEIu2zsdanBDI63kH4gFoT9afOEt/zeJUx0=;
        b=Xwne/a0JgqYCh6dCB5xu84J6HUrzeG+KfDPOAGV5tz52x/6nroFuR4TBGUm+Lb2wC7
         2F5K3JEKkBZf/0rT53PN2KKd5jN7N8ITBqLmB+ptAANPIoyhpukJcYdC/DB7P6a4M9Gd
         48o/RHjhVn2tmOdbpiHI6OLA7tyCM/Wrkai8KSK+mLJvj52CTnIMroFSdjQWOWulljsh
         TLNKXbMO8ZdVfyL7OM43h102NUUE7BioiWYcdb7VgNZ2V2dnLYS1/5hQ9Hh1lXOEHkVc
         IXif8rDMV6sBY7nW+qQgGAOu2uoBPbHqhkB2zOerhBNL/cdHM4stvhHAYYzOzlwelJqx
         d+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771322311; x=1771927111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg5HGzN/ZEIu2zsdanBDI63kH4gFoT9afOEt/zeJUx0=;
        b=fYIBrV6f5UYFTTmXQ8RACm56zhnJzXlJnFV9Ru+GN3VyJY4mA5Ermn7JbyLJ0Cqova
         CLRwxNFgko1/GY/Fzk1boUp80rRsyOIpdv+r53qZxDugOI9580DHFFOYghrHXwvx3+cG
         CEKCCQzqXpSrrM5YQFC5Zp2mB/Y+66fLU7b1sByD8cypJicMtaNi6qqzfBeGodNidmHm
         /8fe/XGJYK85ORKQYaMGLTMk9w6n1iPZonBLKDFqyG4RhZGFTlXhVX76rfcwC+1ShpDu
         agbCLiEXprcblFSGx2Gub4/ktfBYvqC9+SRgXboPn+RCH7F99MRJNBlG9YyLU76dg80u
         8Piw==
X-Forwarded-Encrypted: i=1; AJvYcCVHiP3H7fgC7UaQUJbsH1JFhfcXTDT6GaT7DrDJ0t/AW+bcb2vL0dGRLweZd2OQwXU0PJvtlzxgqmA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZim2WyC8rbdg+DyQOA9xHEseKxO8p22F5rswyGBa7Ov/iF7pj
	QBZZXjyzV1kCTtMt5XxMg8s5Wg1TXglIYC+ml65HhaQJj0auPyD26mMp
X-Gm-Gg: AZuq6aLFbRtpmbp3KWrEd4QCuNhn9yUiVKmrRtC45+aHa/335Tp/QmFCGX/kAatpSBr
	IY0mla/E3TKsdt3i0sGxVFTcdOyliM98J3cpdisAOMsk0UNGLtoe1Y8t2+KcmlJ7T1snijVrHX0
	gvBU3nqeqSUmvUm4KcwWddosLev02f763BvW5Xpanmc7/Dnj1TVBIc+NxCrVeoB7kcLUR3+6yVw
	pJueYwntolBSO0FwBrBtUZ1xdOyAYq6hPC9VP/pLf6qFjo/ZlWXQoIGNx786JgigCdva5bk/qqo
	hjDpidblUEhkI43Bf9RYZMHdcF0UNUN4OzctQUflGm/3Q3Oydf0gxeN3o4yXB+G4QIoxJOKnvTk
	Aq7Zrh3PVs0Ld29yjw53uqF1IqZ0Dilc8Cmm2opHG44yNsuOlEy+ERFeUD46w+kcoMANf1wuNF0
	0EuqHUP1DN+ZYCJR4b+fw34jfW/oe90M7eW9QUuYxvRlNmbbqnMgjUevMIcGb9EZ+vUt/ma1W2j
	1M=
X-Received: by 2002:a17:907:97d6:b0:b86:f194:9eec with SMTP id a640c23a62f3a-b8fb421466cmr698632666b.18.1771322311264;
        Tue, 17 Feb 2026 01:58:31 -0800 (PST)
Message-ID: <5146fc56-9fa7-49c9-8184-954ca84eb439@gmail.com>
Date: Tue, 17 Feb 2026 10:58:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/riscv: implement get_page_from_gfn()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <04eee3ae5e8aadf8c7f0b873ba24ce38220e8fa2.1770821989.git.oleksii.kurochko@gmail.com>
 <c053f6bd-eedc-4dbf-a404-802781dee722@suse.com>
 <d12d8cb7-bc1f-47a4-bc1f-004817394467@gmail.com>
 <349ad398-8a18-46cc-a34b-576edfb544c0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <349ad398-8a18-46cc-a34b-576edfb544c0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 1801314A9D5
X-Rspamd-Action: no action


On 2/17/26 10:10 AM, Jan Beulich wrote:
> On 17.02.2026 10:01, Oleksii Kurochko wrote:
>> On 2/16/26 1:38 PM, Jan Beulich wrote:
>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/p2m.c
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -1557,3 +1557,31 @@ void p2m_handle_vmenter(void)
>>>>            flush_tlb_guest_local();
>>>>        }
>>>>    }
>>>> +
>>>> +struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>>>> +                                    p2m_type_t *t, p2m_query_t q)
>>>> +{
>>>> +    struct page_info *page;
>>>> +
>>>> +    /*
>>>> +     * Special case for DOMID_XEN as it is the only domain so far that is
>>>> +     * not auto-translated.
>>>> +     */
>>> Once again something taken verbatim from Arm. Yes, dom_xen can in fact appear
>>> here, but it's not a real domain, has no memory truly assigned to it, has no
>>> GFN space, and hence calling it translated (or not) is simply wrong (at best:
>>> misleading). IOW ...
>>>
>>>> +    if ( likely(d != dom_xen) )
>>>> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t);
>>>> +
>>>> +    /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */
>>> ... this comment would also want re-wording.
>> As you mentioned in the another reply to this patch, I messed up x86 and Arm
>> implementation in a bad way, so here should be DOMID_XEN used instead of
>> "Non-translated".
>>
>> Based on your reply it seems like the first comment should be also rephrased
>> as you mentioned that DOMID_XEN can't be called also "not auto-translated".
>> I think it would be better to write the following:
>>    /*
>>     * Special case for DOMID_XEN as it is the only domain so far that has
>>     * no GFN space.
>>     */
> Simply say that dom_xen isn't a "normal" domain?
>
>>>> +    if ( t )
>>>> +        *t = p2m_invalid;
>>>> +
>>>> +    page = mfn_to_page(_mfn(gfn));
>>>> +
>>>> +    if ( !mfn_valid(_mfn(gfn)) || !get_page(page, d) )
>>>> +        return NULL;
>>>> +
>>>> +    if ( t )
>>>> +        *t = likely(d != dom_io) ? p2m_ram_rw : p2m_mmio_direct_io;
>>> If only dom_xen can make it here, why the check for dom_io?
>> Incorrectly copied from x86. It should be just:
>>    *t = p2m_ram_rw
>> here as in RISC-V for MMIO pages owner isn't set to dom_io (and the same is
>> true for Arm I think).
> May I suggest that right away you use the construct that I suggested Arm to
> switch to (you were Cc-ed on that patch, I think)? Despite the absence of
> p2m_ram_ro on RISC-V, that'll be usable, and it will allow keeping the code
> untouched when p2m_ram_ro is introduced (sooner or later you will need it,
> I expect).

Sure, but doesn't that patch is connected to another function (translate_get_page())
and just fixing the handling of what get_page_from_gfn() in *t?

For get_page_from_gfn() to not miss the case when new type is introduced it make
sense to do the following:
     if ( page->u.inuse.type_info & PGT_writable_page )
         *t = p2m_ram_rw;
     else
	BUG_ON("unimplemented");

~ Oleksii


