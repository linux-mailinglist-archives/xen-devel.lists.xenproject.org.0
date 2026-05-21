Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLoFMSalDmpxAwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 08:24:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763459F612
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 08:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314802.1584773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPwpP-0005CU-6i; Thu, 21 May 2026 06:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314802.1584773; Thu, 21 May 2026 06:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPwpP-0005B3-3C; Thu, 21 May 2026 06:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1314802;
 Thu, 21 May 2026 06:24:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPwpM-0005Ax-UA
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 06:24:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPwpM-0092ij-6N
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 08:24:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ea505-bab6-0a2a0a5309dd-0a2a450ce274-16
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:24:16 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ea50f-62f1-0a2a450c0019-d155dd33a4a9-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:24:15 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so3749855f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:24:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa93633esm132650f8f.29.2026.05.20.23.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 23:24:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779344655; x=1779949455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu9p2QcIhGzylnu9qw5fFo3HIoHdBDprs5E2aDZaigs=;
        b=PrMfVyXc2asVQqon9jb3FaBeh6FrkNPd//zzbeeQcmdqL/ZIKqxu6zEhNFE/e5tZ1r
         LbfhYXsOTw09YdSHLZqnm5w5J2BWBgD2lLeib2hAN4rapxuPstE9YfERm2P7WQmubkWd
         Gu7Esyaoy2DpmrwL0T6i6/o/B/VQeXIFQm52D9EWBl7rIgsAcDKMLd4eOKv7IZ9EtA4z
         gfOpBbhtv8JHdgOb88JSeTYCLIZiNO0tPhWXvkDuJXstaSV4j1BvNb/mUxwwMxLut/yx
         mfWmik25u8xeigxyFreQHfnz/K3cf1X5UNCLqTr4hqqBdJoeV+W/28vjnbJnD5JuiqwP
         wxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779344655; x=1779949455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu9p2QcIhGzylnu9qw5fFo3HIoHdBDprs5E2aDZaigs=;
        b=kCnQnoLDuVKcMjnJrBRsTHbfovYHHkC6uFmhHJ6C95PnuJ0306RiNnJwjRzYWf+H21
         rDIOuoMIyEaS50QcI8vbl2MWgA9VinZnosSbDoQkAxShotcCfqExIlTgnVTL//SwkEnZ
         NjZEwgPMSGGm/dpOYpWPc3Plfg3eBPkvq5JCnAfaQfg6Xc4EwJenrA7LWkwnlQk4Fqcj
         d58Dd2E3NxrSfijpAILhyZMYobr+SWBxbPtjIHxSpI/hVW/qbLzoib9X5984tJRAdjyT
         gAEmkPMFL0ZgbXjd3TXekWDI9t6UvBem824notQx6ci5YrDzpq8JdOoanYoGQUxvM2Zd
         WBqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ScMGXJnSToPnprsoL0PyarU1c9Pzul4rVxN9itDNMCzrL9I7zs6PYQQmiv01BoQDa2dhDWibL2vM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy1j7gC1oTvucBSjiZ3IU/wGSop50S1JXUOFDUyYBXyFfFCaA/
	5Sc+q7Xsc4Ggn3HRDfeT/ZJpZyK7uoX+rDiSCbGS95vzpd5NdJlyMoh4aejXL60bXg==
X-Gm-Gg: Acq92OFdxnL7aDg2tSWwPcnEuSCJf/j1kU1Mi0qYE+jPM9PaflNxAf2o/Licgj55DdA
	WIFgNTfPsVB8xaY2/nEgqXEng60qp3VQaDH9arDJoQsTdQJY2mwIB9qimzOjZ+eODYGD0hHc+zX
	4tWgLW9x02AoVBjsqB5x89/ygwS5CO07M3A8mTI85DQrmSon0ObjBVdu+dbeB5e7ZkbOLFq9Z75
	V/OhewMUV2UmJopiySxMS2EeHixOAJ9K9ND+oQEv/p3+idAJTWJNMdTszBRnpBCDoKCC8FSzwgh
	Z0o1JiuQxTqHa8BXU75ZTSq4VO/XFKSYPAtCWuToltOjhRELWS56hQpBsgMkx2ZRbokBAPybrgG
	4nucpNCCTa2lxu0YyWPvwQWzefcJEx4WRLaVM2Aowsr7NK2qtEQxksO5nk+vb8ysYxknThlXUU7
	FqSsJfryFgsfoVC8iXA77iKoFmiDkLMJItEhFHNdUNBTjzGaOPY1HyF3mM7lu5vlB2pVxDYq4aG
	MIIWNQFV+B/aVc=
X-Received: by 2002:a05:6000:178b:b0:44b:5a37:36c4 with SMTP id ffacd0b85a97d-45ea31ce906mr2073897f8f.26.1779344655329;
        Wed, 20 May 2026 23:24:15 -0700 (PDT)
Message-ID: <57a83a27-b472-4f5b-9a0e-b230be0c7151@suse.com>
Date: Thu, 21 May 2026 08:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
 <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
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
In-Reply-To: <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1779344655-DBD7BCF5-DBD7904B/0/0
X-purgate-type: clean
X-purgate-size: 2818
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3763459F612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 18:48, Teddy Astie wrote:
> Le 20/05/2026 à 18:34, Andrew Cooper a écrit :
>> On 20/05/2026 4:51 pm, Teddy Astie wrote:
>>> __{put,get}_guest returns -EFAULT on access faults which causes
>>> the injected cr2 to be off by 14 bytes (as EFAULT is 14) which is
>>> incorrect.
>>>
>>> Fix the computation by relying on copy_{from,to}_guest_pv which
>>> reports the number of remaining bytes instead of a negative errno,
>>> such that we can compute the offset properly.
>>>
>>> Fixes: 70ad570b2799 ("x86/64: paravirt 32-on-64 call gate support")
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>>   xen/arch/x86/pv/emul-gate-op.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
>>> index c2c699fbff..cacc171115 100644
>>> --- a/xen/arch/x86/pv/emul-gate-op.c
>>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>>> @@ -289,9 +289,10 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>>>           int rc;
>>>   #define push(item) do \
>>>           { \
>>> +            unsigned int __value = item; \
>>>               --stkp; \
>>>               esp -= 4; \
>>> -            rc = __put_guest(item, stkp); \
>>> +            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
>>
>> Oh, this probably violates MISRA, but you don't need to use a separate
>> variable because sizeof() has no side effects.
>>
>> Given that the expression is now &item, I think it needs to be &(item).
>>
> 
> I tried something like that, but it looked a bit weird and clang wasn't 
> happy (at least in language server) because of the &(x + y).
> 
> We also need to ensure that we're actually copying 32-bits scalars (and 
> not 16-bits or 64-bits ones) like the previous behavior.
> 
> That diff seems to work though
> 
> diff --git a/xen/arch/x86/pv/emul-gate-op.c b/xen/arch/x86/pv/emul-gate-op.c
> index cacc171115..b72a3058dd 100644
> --- a/xen/arch/x86/pv/emul-gate-op.c
> +++ b/xen/arch/x86/pv/emul-gate-op.c
> @@ -289,10 +289,9 @@ void pv_emulate_gate_op(struct cpu_user_regs *regs)
>           int rc;
>   #define push(item) do \
>           { \
> -            unsigned int __value = item; \
>               --stkp; \
>               esp -= 4; \
> -            rc = copy_to_guest_pv(stkp, &__value, sizeof(__value)); \
> +            rc = copy_to_guest_pv(stkp, &(uint32_t)(item), 
> sizeof(uint32_t)); \

But a cast expression isn't an lvalue, so & cannot be applied to it (much
like it can't be applied to (x + y) as you mentioned above).

Jan

>               if ( rc ) \
>               { \
>                   pv_inject_page_fault(PFEC_write_access, \
> 
> 
>> Can also be fixed on commit.
>>
>> ~Andrew
> 
> Teddy


