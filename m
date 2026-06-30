Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0OrzCXrRQ2o5jQoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:23:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3F6E563B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:23:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Z6edfC3C;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349045.1606833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZNE-0003SZ-UN; Tue, 30 Jun 2026 14:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349045.1606833; Tue, 30 Jun 2026 14:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZNE-0003QJ-RT; Tue, 30 Jun 2026 14:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1349045;
 Tue, 30 Jun 2026 14:23:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weZND-0003Q8-Iq
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:23:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZNC-004mTS-Ia
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:23:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43d160-e002-0a2a0a5209dd-0a2a450ada30-34
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:23:38 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43d16a-e40e-0a2a450a0019-d155802ad05c-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:23:38 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso55344385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 07:23:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636cf26sm7391932f8f.19.2026.06.30.07.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:23:37 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782829418; x=1783434218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cUUwpKiDxqwcW2+y0IUYVV2sClGCZZs7VpQyN4eGhnk=;
        b=Z6edfC3CR0OrgH6XH1vFg82pTKddBTYzQS6g5JcxHjVhZUGR+KeuYqqx2XpMsEQpX+
         DbAh1zCY/Tw84RzV2ODnjsa4GPvjAcWULYeid3hOwFZ9VMO7RbL84e+XQWvYXqzzU0y4
         h4X7p6RGEXH+FKnowHM0HSWwCxVTjx1ZR9hr40gcdC5NlPTCrs36FlOmGp2sMCKivWVi
         a6ZowF+4tTm25Rsl9B00S8UkltfVhOY40FA4gRW9K0vDBQHx0Q82JO8cJj4hWi+WTCbN
         zd4O45hvDY5ppl6ehANxFgK8gtwoZUXcL41XH55xueu63ygXTpRfD09cyjNoWY1NEPxo
         P2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829418; x=1783434218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUUwpKiDxqwcW2+y0IUYVV2sClGCZZs7VpQyN4eGhnk=;
        b=cbtblVIaSxZaUNO0Hywk3zbJCzyuPkaNFGH7aXRUXRl+8/xnwe2imMja4hqzxv0Es7
         APINeDGf3gI8E0U6AVp2RjNuz8QuobcyomcJIR9/9fzJRMO18B2gIRvitgWSm+klN0PQ
         RHk7+Ge9n9xJoBVL4SkOzdKd6SmrBqgmcdpWmQsoJpYQngRS5is4EjgV1JiDtSuJAbTz
         pTIrFODuOrDslm6qEAk5Fx4AoqEIqCTHhYN+1ny23/Kgzc2x18BvYwEdYrVGoUEioLLl
         ml0SkpNw+RNKC8Lby/GsyzcqV5ZNMEH3+kF1529DykKjVsC/2X7zJoBoEuCOn6L8DRNH
         NZig==
X-Forwarded-Encrypted: i=1; AFNElJ+SGl/8YXVweHEoXjLyNdcYOA6ZFl64SxdeJmcPtYutX/9LkJYopDST8bTLni6Q1AAmlIE0uXt5GS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3vcLXE8PmgoYFToe7KRLdb/AzNEnuOeBczdyIPJDrcTyXSabc
	TjJTw6pYbBWIIolTchynzNPTluEs0BZ4Qw4663fERMvtAo7+vCMfxiQ7AaEfudZWoA==
X-Gm-Gg: AfdE7cljYceJib2+cWJ9w5tVQq9I1XTUDXWgvKw097p/DnzUWUUOhJYegAscud87yZt
	F5B/H4xx3d5MxsbBoOIbi5CljIpwoLFhf7p0RCsk6GuOrGc/JfjehSGEHVMt58EnysS6u2qngAc
	DAmCFefd4hGaciyBakaNE0FXFY2oAMSxaKU840XNpM8nnz5osTarK7BC0qUOCjVIxXpiCkP/HvK
	YcWepb2gYsBmOX8D91nFElJzaK0b3WOsMn/WnqkCYZfjpf63qgLkpJC6MJ8npyAa8+CPnWgeeAU
	xGhUaUHfVsBFfmxVYyminIp/NgEa10ma3avreeAv6olXSHzN7c57CCXbxrLdFAA5jQWPngP4Gat
	1GeSuZXKcih7lcdP5fBykZvrMMgMPWKO8q9qA1l1DuNcR3SbRKYyad4QqPiOD0VnTgTBTbwd+6J
	6QxLr/ZRcsjK5SCweL4ECuORD8lfKkA3+mZw7RUDVLngIJ802NHP0Fo0uLJZaPo/HGzwMyhf8Ci
	nW8
X-Received: by 2002:a05:600c:4e53:b0:492:4335:4d4c with SMTP id 5b1f17b1804b1-493bdab0092mr11997085e9.30.1782829417774;
        Tue, 30 Jun 2026 07:23:37 -0700 (PDT)
Message-ID: <c5a6a5c1-be8f-4f30-9c61-5a3f0c70e6b3@suse.com>
Date: Tue, 30 Jun 2026 16:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/22] x86/boot: choose AP stack based on APIC ID
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, trenchboot-devel@googlegroups.com
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
 <1483a375-9662-48b8-8bf2-8cc83386b068@suse.com> <akLvI_OJ8RjU_90S@MjU3Nj>
 <4e0585c5-1838-4193-ac92-37e2b9ebcd81@suse.com> <akOND2rkKHLxvQmL@MjU3Nj>
 <ea766dbf-2cb4-48ae-8006-1dd5b9652089@suse.com> <akPQLo-GJsAnMj04@MjU3Nj>
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
In-Reply-To: <akPQLo-GJsAnMj04@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782829418-D4D2BDDE-ECB1BB1D/0/0
X-purgate-type: clean
X-purgate-size: 1877
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sergii.dmytruk@3mdeb.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:trenchboot-devel@googlegroups.com,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[192.237.175.120:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[37.24.206.209:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84B3F6E563B

On 30.06.2026 16:18, Sergii Dmytruk wrote:
> On Tue, Jun 30, 2026 at 11:37:59AM +0200, Jan Beulich wrote:
>> On 30.06.2026 11:31, Sergii Dmytruk wrote:
>>> On Tue, Jun 30, 2026 at 09:17:59AM +0200, Jan Beulich wrote:
>>>> On 30.06.2026 00:18, Sergii Dmytruk wrote:
>>>>> On Thu, Jan 22, 2026 at 04:52:36PM +0100, Jan Beulich wrote:
>>>>>>> --- a/xen/arch/x86/boot/x86_64.S
>>>>>>> +++ b/xen/arch/x86/boot/x86_64.S
>>>>>>> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>>>>>>>          mov     $XEN_MINIMAL_CR4,%rcx
>>>>>>>          mov     %rcx,%cr4
>>>>>>>
>>>>>>> -        mov     stack_start(%rip),%rsp
>>>>>>> +        test    %ebx,%ebx
>>>>>>> +        cmovz   stack_start(%rip), %rsp
>>>>>>> +        jz      .L_stack_set
>>>>>>> +
>>>>>>> +        /* APs only: get stack base from APIC ID saved in %esp. */
>>>>>>> +        mov     $-1, %rax
>>>>>>
>>>>>> Here and below 32-bit insn would do fine. However, ...
>>>>>
>>>>> Are all addresses guaraneed to be below 4 GiB?
>>>>
>>>> You use %rax as the loop induction variable, so there isn't any address
>>>> in it? Plus you already use ...
>>>>
>>>>>>> +        lea     x86_cpu_to_apicid(%rip), %rcx
>>>>>>> +1:
>>>>>>> +        add     $1, %rax
>>>>>>> +        cmp     $NR_CPUS, %eax
>>>>
>>>> ... as 32-bit insn here anyway.
>>>
>>> But %rcx contains an address and it is added to %rax for `cmp` (quoted
>>> below).
>>
>> Well, to use SCAS you will need to change how you use registers. (IOW
>> first you need to determine whether SCAS actually can be used here,
>> and then - if it can - you will need to arrange register use to fit it.)
> 
> It can be used, but I don't see any compelling reason to do it.  The
> code doesn't get any shorter and has to recover index from a count.

Okay - if the code doesn't get shorter / easier to follow, then that's a
fair argument.

Jan

