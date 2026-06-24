Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6f0EAih9O2qjYggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 08:46:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E491E6BBDDB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 08:45:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gVBNTq83;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344553.1603609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHLx-000682-5a; Wed, 24 Jun 2026 06:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344553.1603609; Wed, 24 Jun 2026 06:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcHLx-00065T-22; Wed, 24 Jun 2026 06:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1344553;
 Wed, 24 Jun 2026 06:44:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcHLv-00065L-Vq
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 06:44:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcHLs-009Wgj-GJ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 08:44:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b7cd6-5cb7-0a2a0a5109dd-0a2a450ae182-34
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:44:48 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3b7ce0-93a5-0a2a450a0019-d155dd32c11d-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:44:48 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4626fdc829aso496996f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 23:44:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260915286sm70579345e9.1.2026.06.23.23.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 23:44:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1782283487; x=1782888287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mxfCCIZ/THxTD8rvCfXotWcbwolqfXw8Vyl6IjXbpA0=;
        b=gVBNTq83jxBfqMSSyXbXttsOFB15isJ6A92zEl0yQ6vZVjnBwKA8XNKL6sBexXjwvH
         ZwsXZnKpe9XrNgHEZ5YLc/qZ+wlXuzuREEfHcRQqt+k5DC3FOE/+b3+AhZA9sdHJ8JFJ
         CXjgMgR9kQO13Sn8sT/T1NdAqsth+2t4weHItk4Xp4l9fXGpwZkj2v83HQ6I13ba52Ln
         IFU7kv3dX6or1Px/J6QTt1Rimoj9NevawTpHNICR+SBjzA9P9wTc7zL98ZaZMhDwjO5D
         jqBNzxJ+5l64EXx7ztKdEP4LCQdzyLjV+3Qv+4qhwudA5DLvh9lXamf3Vosb9bgTY8Jb
         iH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782283487; x=1782888287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxfCCIZ/THxTD8rvCfXotWcbwolqfXw8Vyl6IjXbpA0=;
        b=n8bvQVofNVrq8jHgNKel2N2PyR5uevPySv4mk9HHUIbi0w9Wc2TvBmWLOCNSXlhsJC
         /MynU2woBO/XXyuTDPlF1NvBFrA68jMREbJPtMVR4Q07kvyjuCCq/dSMM77sohGa8Vg5
         oI+M/96gJVSG7f01yCuJxwqKeqIO7QEaQbWYFrzJ5BdQiI+zK4pyW93a/keq61q0RsOf
         N75xaUnq+r8dWt7Llmcafe0GYKszIhvx8iu2dWZfXGIJMrO8CQhqLibYUucCqhgIYexd
         4c3+dki05Vl3ZY3syLTZ+TxCwxP0OQEPJY179RrDTAIXhYAh9JNX623x3o6c6G0fiHkl
         MUHA==
X-Forwarded-Encrypted: i=1; AFNElJ/1ABSzQLvnv6Rn4615ydJmo2ozoNRRGi+C1eWZ/wO0tFE5NKj8wPhCXrFr9dEqGzOpJL7vG9eRraw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq4tCexZN8qgbXHQ1Bb7+tfB86T1pL5cxfV4LDjNdXCZ8jGVsQ
	o6gb64F6RagR5nqdCiY+mWuER1YtrWu8ikq6NHU5sn59mAtRYp9Jfran1pWuICvDXw==
X-Gm-Gg: AfdE7clkJyhxabl54wj7EjVhc3emyuWlx+TGiaVWxWvU9QSlUEj1AZjOt83YWK4oC5z
	4KFMAH+iu2I2ylyWRiU4Y12KVKkb69tFvLMlIC059yP/6hTr5YzXwJ3uobvCE/n3Kr69haKLob2
	gOKxk2pJaINB4C/QpDaB6ZHeyt4aP/z2zQOkeSRK9EaV3wgGJslkkfUeN08EE/yE3eckl5PlBsK
	Ue+a49J/Bp8ctiEgjWQ9upoCjenQ/eSYHIUU5AbJMaPC1CRuIAIhbGdiB2T5YWtAmenkE8L5XJp
	JNfG1inQmJv1lByrA9F7ApNEuRt1cbnFzADskcv3+rY67WxUntTXs/IrWKZdqtJ9QXGEBxze3w0
	Q5ocC1Xsi8lfnkH9OtquxM+mXi6PLNOiFE9s9a2aSRvG5P9SWQJfzwp168bwe8PjJVa//xeu6KI
	b2KzRkw+HJTfYlhk3iLS7GlzVz0OF/ZDVQMAwJVH2k8DhavBdj+svSshTmsZvHYGiyioBte9dVd
	seF
X-Received: by 2002:a05:600c:1d0a:b0:492:409d:b7c3 with SMTP id 5b1f17b1804b1-4925b359fc2mr86477655e9.13.1782283487550;
        Tue, 23 Jun 2026 23:44:47 -0700 (PDT)
Message-ID: <07b3bbb6-ef62-419c-b708-1b9ae2774462@suse.com>
Date: Wed, 24 Jun 2026 08:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com>
 <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
 <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com>
 <2889dc4e-33ec-4d8f-b01d-026506a39cbf@suse.com>
 <CAHt6W4cghz1Rh=MXqmx6ZHA0iOz9xTBDNhFWaqtZ=npd4Hb=GQ@mail.gmail.com>
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
In-Reply-To: <CAHt6W4cghz1Rh=MXqmx6ZHA0iOz9xTBDNhFWaqtZ=npd4Hb=GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782283488-2D7F1DB8-4081C95A/0/0
X-purgate-type: clean
X-purgate-size: 10690
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E491E6BBDDB

On 23.06.2026 23:18, Frediano Ziglio wrote:
> On Tue, 23 Jun 2026 at 14:21, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.06.2026 12:55, Frediano Ziglio wrote:
>>> On Mon, 22 Jun 2026 at 11:34, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 19.06.2026 15:04, Frediano Ziglio wrote:
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -1545,6 +1545,139 @@ static int acquire_resource(
>>>>>      return rc;
>>>>>  }
>>>>>
>>>>> +/*
>>>>> + * The "noinline" qualifier avoids the compiler to create a large function
>>>>> + * consuming quite a lot of stack.
>>>>> + */
>>>>> +static int noinline mem_foreigncopy(
>>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
>>>>> +{
>>>>> +    struct domain *d, *const currd = current->domain;
>>>>> +    xen_foreigncopy_t copy;
>>>>> +    int rc, direction;
>>>>> +
>>>>> +    if ( copy_from_guest(&copy, arg, 1) )
>>>>> +        return -EFAULT;
>>>>> +
>>>>> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
>>>>> +
>>>>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
>>>>
>>>> Iirc I did ask before why this isn't ..._by_any_id().
>>>
>>> I probably was confused by the question about MMUEXT and the 2 domains.
>>> There are different similar hypercalls (like the mentioned MMUEXT but
>>> also hypercalls to map foreign domain memory) that have this check
>>> (not the same domain). Any domain has, obviously, access to its own
>>> memory, so it should not have to use hypercall to access its own
>>> memory. If it does it looks like a mistake causing performance issues
>>> or an attempt to circumvent security; in either case you would like to
>>> avoid it.
>>
>> No. Self-grants are possible as well, for example, and for a good reason.
>> Allowing normally-remote operations on oneself helps with testing, for
>> example. It may also help avoid needing to special-case "self" in code
>> which needs to cover both cases.
> 
> But this is not a grant, it's a copy.

Sure, but the underlying principle is what matters. Plus you don't prevent
self-copy by using ..._by_id(), you only preclude the use of DOMID_SELF.

>>>>> +    if ( rc )
>>>>> +        return rc;
>>>>> +
>>>>> +    if ( copy.nr_frames == 0 )
>>>>> +    {
>>>>> +        rcu_unlock_domain(d);
>>>>> +        return 0;
>>>>> +    }
>>>>
>>>> Any reason this cannot also be "goto out"? The more that now that you have
>>>> moved this past the domid validity check, imo it should further move to ...
>>>
>>> The only reason was style and to avoid a memory copy, but it's not a
>>> hot case so I'll change to "goto out" (no strong about it).
>>>
>>>>> +    /*
>>>>> +     * Check we are allowed to map and access these foreign pages.
>>>>> +     */
>>>>> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
>>>>> +    if ( rc )
>>>>> +        goto out;
>>>>
>>>> ... below here. Perhaps simply as
>>>>
>>>>     if ( rc || !copy.nr_frames )
>>>>         goto out;
>>>>
>>>
>>> I think this would be confusing with the above "Check we are allowed
>>> to map and access these foreign pages" comment.
>>> Are you okay with just the change above to "goto out" ?
>>
>> I do want the order adjusted as indicated. I won't insist on (but I would
>> prefer) folding both if()-s.
>>
> 
> What about
> 
>     /*
>      * Check we are allowed to map and access these foreign pages.
>      */
>     rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
>     if ( rc )
>         goto out;
> 
>     while ( copy.nr_frames )
>     {
>         /*
>          * Arbitrary size.  Not too much stack space, and a reasonable stride
>          * for continuation checks.
>          */

That's fine.

>>>>> +    do {
>>>>> +        /*
>>>>> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
>>>>> +         * for continuation checks.
>>>>> +         */
>>>>> +        xen_pfn_t gfn_list[32];
>>>>> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
>>>>> +
>>>>> +        rc = -EFAULT;
>>>>> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
>>>>> +            goto out;
>>>>> +
>>>>> +        for ( unsigned int i = 0; i < todo; i++ )
>>>>> +        {
>>>>> +            struct page_info *foreign_page;
>>>>> +            mfn_t foreign_mfn;
>>>>> +            void *foreign;
>>>>> +            p2m_type_t p2mt;
>>>>> +            const unsigned long valid_mask =
>>>>> +#ifdef CONFIG_X86
>>>>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
>>>>> +#else
>>>>> +                p2m_to_mask(p2m_ram_rw);
>>>>> +#endif
>>>>
>>>> The set of permitted types didn't change, yet a justification for the resulting
>>>> limitation also didn't appear.
>>>>
>>>
>>> Yes, that's missing, indeed.
>>> Should the set of types be different for reading and writing? For
>>> instance do not allow writing to read-only memory?
>>
>> Of course.
>>
>>> Given that it looks like different architectures have different
>>> meanings and definitions for these constants, should it not be better
>>> to define some new constants for this specific usage? For instance
>>> P2M_READ_TYPES and P2M_WRITE_TYPES?
>>
>> Perhaps, yes. The suggested names look overly generic to me, though.
> 
> I suppose P2M_READABLE_TYPES and P2M_WRITABLE_TYPES are more correct
> but still too generic.
> P2M_EXPORTABLE_TYPES and P2M_IMPORTABLE_TYPES ?

First: Do you foresee uses of those constants anywhere else? If not (I
don't), tie the names to this particular operation. That'll make them
entirely non-generic.

>>>>> @@ -2012,6 +2145,18 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>              start_extent);
>>>>>          break;
>>>>>
>>>>> +    case XENMEM_foreigncopy:
>>>>> +        /*
>>>>> +         * Instead of using "start_extent" we update the structure back,
>>>>> +         * we update it back in anyway to tell caller were the copy
>>>>> +         * stopped.
>>>>> +         */
>>>>> +        if ( unlikely(start_extent) )
>>>>> +            return -EINVAL;
>>>>
>>>> As before - please be precise with comments like this. We update it back also
>>>> when encoding a continuation. Perhaps instead "..., to indicate the point of
>>>> failure to the caller as well as to encode continuations without being
>>>> constrained by MEMOP_EXTENT_SHIFT".
>>>>
>>>
>>> What about (trying to include your suggestion, to be fixed for line length):
>>>
>>>         /*
>>>          * Instead of using "start_extent" for the continuation, we
>>> update the structure back,
>>>          * we update the xen_foreigncopy structure back, so we are not
>>> constrained
>>>          * by MEMOP_EXTENT_SHIFT.
>>>          * We copy it back also to tell the caller where the copy stopped.
>>>          */
>>
>> One of the things I take issue with (because it's hard to read that way,
>> at least for me) is the repeated use of "update ... back", effectively
>> saying the same things twice. The last sentence also wants disambiguating
>> towards the "stopped" possibly being a non-error situation as well.
>>
> 
> Changed to
> 
>         /*
>          * Instead of using "start_extent" for the continuation, we update
>          * the xen_foreigncopy structure back, so we are not constrained by
>          * MEMOP_EXTENT_SHIFT.
>          * We copy it back also to tell the caller where the copy stopped
>          * (either for error or because all frames were copied).
>          */

Thanks.

>>>>> +    XEN_GUEST_HANDLE(uint8) buffer;
>>>>> +};
>>>>
>>>> What was (again) left unaddressed is the question towards using GFNs on both
>>>> sides of the copy. This would eliminate the need for the flags field, taken
>>>> by a 2nd domid_t one then.
>>>>
>>>
>>> This was addressed in
>>> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00567.html
>>
>> Well, yes, but not in a satisfactory way. Back channels tell me that you
>> actually got the same feedback already on internal review. Which makes it
>> all the more puzzling that you insist on doing it differently. Multiple
>> maintainers asking for the same thing may be an indication of something.
> 
> Not needing to have backchannel feedback, I already wrote that a
> similar approach was tried and made the code more complicated.

Even if indeed so: Yet at the same time more flexible.

> Both maintainers didn't comment on my replies so I assume they were
> fine with it.
> And you are failing to provide positive feedback.
> I asked (that one internally) for examples of guest buffers provided
> as frame numbers but I got no answer (or better the answer was more
> "currently there are not").
> Also note that the location of xen_foreigncopy_t structure is also
> provided using a guest pointer.
> I remember there were some discussions about ABI changes (2/3 years
> ago) to address this and other issues but I cannot see much progress.

And it's that (very slowly progressing effort) which made me ask. The
fewer virtual addresses we bake into new sub-ops, the better for that
effort. And no, that doesn't go as far as completely eliminating
handles (presently representing virtual addresses) - that needs to be
part of the new ABI.

To preempt the argument towards "fewer virtual addresses" not really
being true when changing from handle-to-uint8 to handle-to-pfn: The
former won't be able to express a buffer mapped contiguously in VA
space, but discontiguous in PA space. The latter will, simply be
avoiding buffer VAs in the first place (the array of frame numbers
can e.g. be placed in a dedicated hypercall argument area known to be
physically contiguous).

> That's why I say this is out of scope.

There's nothing scope related here. We're discussing how to shape the
new sub-op interface.

>>> and in minor way by
>>> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00847.html.
>>> It was considered but more complicated and worse from a performance perspective.
>>
>> Okay, performance-wise worse would of course be relevant. But that would
>> need supporting by numbers (for both PV and PVH Dom0, as the latter
>> incurs extra overhead for virtual-address-based hypercall buffer operands).
> 
> I'm more concerned about the PV case than PVH to be honest.

For your (immediate) internal purposes that may be fine, but PVH Dom0
more likely being the future, for upstream both need considering
equally.

Jan

