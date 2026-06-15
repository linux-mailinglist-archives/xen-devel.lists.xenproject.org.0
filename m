Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 99/GBVAGMGrmLwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:04:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A803686E9E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:03:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CPNIN79S;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338242.1599247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ7uS-0006Ua-9P; Mon, 15 Jun 2026 14:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338242.1599247; Mon, 15 Jun 2026 14:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ7uS-0006Rp-6e; Mon, 15 Jun 2026 14:03:28 +0000
Received: by outflank-mailman (input) for mailman id 1338242;
 Mon, 15 Jun 2026 14:03:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ7uQ-0006Ri-M5
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ7uP-00ClXj-QK
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:03:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300618-2eae-0a2a0a5409dd-0a2a4503d15c-38
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:03:25 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30062d-672d-0a2a45030019-d155dd34b096-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:03:25 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45ef4223be7so1913569f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:03:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d4fsm37706457f8f.24.2026.06.15.07.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:03:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1781532205; x=1782137005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6IMLcRi/azmbeEvIQdLqN3ZTZdkkIPe9y7ZjuwDsbM=;
        b=CPNIN79Sru0RuaoRSWkJgR0akDtaMEA9JwSfLMEkkyN7lhfMcm63wmnbZmRJtzj9Cf
         A6I9LEcn5U01+SNWoWDO9OKQevtl6MuqmaPr2C9hHKG5izaMmFVAzkFiND6loAEuwb2u
         +dlxGI009PM7Gk8ouPAK2c27cnio2CLPf9Al1hmmscnwED5npr/8UB1kDdySdoxCu4+d
         mg9gKssMaoq47qKB8qxegWw1BZfqjQANXkwIooJBorF/aS0S1KwrrqHwWkiUn9THPcQQ
         1AYtxCcFvd1IbZXk16OVvarkIfxnE2bd8Gc6psMUl036LNK3iwk61K2/WCFQt7XwH/Nj
         OZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532205; x=1782137005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6IMLcRi/azmbeEvIQdLqN3ZTZdkkIPe9y7ZjuwDsbM=;
        b=lbhguQA18/OIPSpADRdPx+jxs/LkbkIoXyVJSFpuB5Q9mCl/zS/WAqh4VbW8myCCNI
         LBG0gbEUtQGKFlXCnv7SQVeMFBVXSaQJNmD68bp94E32iC6TZE2XSeAbQni5673i34Us
         LzohGG8t0jncTitM9uMYgcr4NuUtGb5Tyv/jbZvv2O76xWV62CYH8Meol188aUBQOUFU
         7Hew56V6qsfsaSqyVPW/3AUtptOKc3jD6jU3ki7NMwDXISHnp+8GOZQ/bcJyu9UjeIjA
         gINxATr+sJSG4SB9fXvNN4R1lHPIpMcZKnDUQYQNiOfEBGKDVUkhZj0GX4s1kKTiCRwu
         0LMw==
X-Forwarded-Encrypted: i=1; AFNElJ9XPa1g6Ep4dg1PdJsz6DizUs7bklRgsytfSYgafZWCYkjOYKYh53J6F0cQXGbCWS/mKG/wYNdgZGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8bwrFsBaEsGYWs0VgrEHZXCnvxZ6Q5/RH1xVaq7d7/us1YrsP
	LlRDRuj+zFr6aincSujz7XiFLqijEUlauc89p3RboQpm0zdxDVGNxrhFzgX9ZEuj9g==
X-Gm-Gg: Acq92OGldNpH8LCbBOI1J+CCldeLxG5y85In0FFhWZrTpegGdqF4EYRNdKHFrY4l1yd
	Z7ngS/7MP5usXAVwnrj3TLDqveniAQo5/YE/wpeR/XCSfNKU9YsDy07DqRle08znrA856aJuXWn
	CXzoV55iMnmuxwnjq46U21qSSQZggfNYsrlwcb3Fdw/RXAJvuYP72tGc8W97UQYYyedQpFIyZTv
	JlBHAZi06FSXGpIIXsq7SforUIZFhK55VmcK12Y3uv5DuSdIDQl3bwy3WNUnk2m3hCmVghekAcF
	4Pw7hLD9OUK4qxn/KPSZLoTBrGsbmRqEO0vShis4C0efVkyYyFIjBsjBO3vpVh8LjYHzo41TjCp
	UO5SZWoSk/YpTc9rgoxTj6TRIv0iix5zpgOAf1jdHM7rqk2S7L8/s7wGoEENaYbQSRuMLITqgfn
	TKNOPBlNzPFA+J3WMa+NPm5fvlNQQ3Wh28LQuD8bwKHLS5nE7mhIeCz0XII4AakoOu3geEMo+rZ
	qI83YvO7sbteZA=
X-Received: by 2002:a05:6000:26c5:b0:460:e00:121d with SMTP id ffacd0b85a97d-4606da6237bmr21542244f8f.14.1781532204700;
        Mon, 15 Jun 2026 07:03:24 -0700 (PDT)
Message-ID: <1c1829d2-4cb4-4e29-9012-fdcbca8d79a9@suse.com>
Date: Mon, 15 Jun 2026 16:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Daniel Smith <dpsmith@apertussolutions.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
 <20260613214749.20620-13-frediano.ziglio@cloud.com>
 <8289ea1d-ceca-40b6-a992-a778be053cd0@suse.com>
 <CAHt6W4en1yMLrUXv+RbcoPr-=S_=pi2Rrcm2BC2PzMZT+0ksFw@mail.gmail.com>
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
In-Reply-To: <CAHt6W4en1yMLrUXv+RbcoPr-=S_=pi2Rrcm2BC2PzMZT+0ksFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1781532205-4086B938-9A93CFDA/0/0
X-purgate-type: clean
X-purgate-size: 8457
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 4A803686E9E

On 15.06.2026 14:11, Frediano Ziglio wrote:
> On Mon, 15 Jun 2026 at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
>> On 13.06.2026 23:47, Frediano Ziglio wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1545,6 +1545,133 @@ static int acquire_resource(
>>>      return rc;
>>>  }
>>>
>>> +/*
>>> + * The "noinline" qualifier avoids the compiler to create a large function
>>> + * consuming quite a lot of stack.
>>> + */
>>> +static int noinline mem_foreigncopy(
>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
>>> +{
>>> +    struct domain *d, *const currd = current->domain;
>>> +    xen_foreigncopy_t copy;
>>> +    int rc, direction;
>>> +
>>> +    if ( copy_from_guest(&copy, arg, 1) )
>>> +        return -EFAULT;
>>> +
>>> +    if ( copy.flags & ~1U )
>>> +        return -EINVAL;
>>> +
>>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
>>> +
>>> +    if ( copy.nr_frames == 0 )
>>> +        return 0;
>>> +
>>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
>>> +    if ( rc )
>>> +        return rc;
>>
>> Extending my v4 remark: How about a "fully foreign" copy? I.e. one between two
>> pages in two foreign domains? Getting me back also to the un-answered v4
>> question of mine as to MMUEXT_COPY_PAGE.
> 
> I really thought I replied to this but I cannot find it.
> MMUEXT_COPY_PAGE was the first attempt to do this but mmuext is
> designed for PV and extending was made the code confusing.

We discussed this on the x86 call, and yes - the major op being PV-only is
getting in the way here.

>> Further, as to the order of checks: I'm not going to insist on re-ordering, yet
>> I'd like to point out that copying 0 pages to/from a bad domid might better
>> yield an error.
> 
> Not strong about this, changed to return -EINVAL. Reordering after
> this change won't make much sense, -EINVAL is returned both for wrong
> flags or no frames.

Please don't - copying 0 frames with all other arguments correct is not an
error.

>>> +    do {
>>> +        /*
>>> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
>>> +         * for continuation checks.
>>> +         */
>>> +        xen_pfn_t gfn_list[32];
>>> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
>>> +
>>> +        rc = -EFAULT;
>>> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
>>> +            goto out;
>>> +
>>> +        for ( unsigned i = 0; i < todo; i++ )
>>
>> Nit: "unsigned int" please (like you have it above).
> 
> Changed. Note that "long" is also not a type but a modifier. Would it
> be good to change both the above to "unsigned" instead for consistency
> with "long" ?

No, the way we spell types has historical reasons and isn't tied to the
exact lexical meaning of the keywords.

>>> +        {
>>> +            struct page_info *foreign_page;
>>> +            void *foreign;
>>> +            p2m_type_t p2mt;
>>> +            const unsigned long valid_mask =
>>> +#ifdef CONFIG_X86
>>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
>>> +#else
>>> +                p2m_to_mask(p2m_ram_rw);
>>> +#endif
>>
>> What about, for example, p2m_ram_ro? Or p2m_ram_shared? Or p2m_grant_map_*?
>> Etc. Any artificial constraining wants justifying in the description and/or
>> mentioning in the public header.
> 
> The base of this was taken from migration code where there is such a check.
> I suppose that adding p2m_ram_ro (where available) won't hurt.

Just to mention, to avoid another round trip just because of this: p2m_ram_ro
has different meaning on x86 vs Arm/RISC-V.

> p2m_ram_shared I'm not sure but seems fine too.
> For p2m_grant_map_* it feels a bit a security issue to me. It would
> allow a guest to give access to pages of other domains. It's true that
> the current domain would have to have write access to this domain
> anyway but extend these permissions sounds something it should not be
> able to do.

It could copy the contents of the grant mapped page by other means. Why not
allow it in this new sub-op as well then?

Talking of security: When the page you copy to is owned by a PV guest, I
think you further need to obtain a PGT_writable type ref. (Of course it then
likely is easier to always do this, not just for PV.)

>>> @@ -2012,6 +2139,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>              start_extent);
>>>          break;
>>>
>>> +    case XENMEM_foreigncopy:
>>> +        if ( unlikely(start_extent) )
>>> +            return -EINVAL;
>>
>> Please address review comments (verbally or by code changes) before submitting
>> a new version. Here I had asked "Why make this different from other continuable
>> sub-ops?"
>>
> 
> There's already a comment in the same file for similar reason
> 
>     /*
>      * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
>      * it ever becomes a practical problem, we can switch to mutating
>      * xmar.{frame,nr_frames,frame_list} in guest memory.
>      */
> 
> so to avoid the doubt and possible future change I mutate the structure.
> Also I use the mutation to give more information to the caller, using
> "start_entent" won't allow this.

You'll want to mention this in the description and/or a code comment. It
wants to become clear that the inconsistency in behavior (with other sub-
ops) is deliberate rather than accidental.

>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
>>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>>>
>>> -/* Next available subop number is 29 */
>>> +/*
>>> + * Copy memory from/to a given domain.
>>> + */
>>> +#define XENMEM_foreigncopy 29
>>> +struct xen_foreigncopy {
>>> +    /* IN - The domain whose resource is to be copied. */
>>
>> There's still "resource" here, when this really is about RAM (memory) only,
>> not any other kind of resource.
>>
>>> +    domid_t domid;
>>> +
>>> +    /* IN - Flags. */
>>> +#define XENMEM_foreigncopy_from 0
>>> +#define XENMEM_foreigncopy_to 1
>>> +#define XENMEM_foreigncopy_direction 1
>>> +    uint16_t flags;
>>> +
>>> +    /*
>>> +     * IN
>>> +     *
>>> +     * As an IN parameter number of frames of the domain to be copied.
>>> +     */
>>> +    uint32_t nr_frames;
>>
>> This isn't just an input, as you update the field (and the handles below).
>> This property of fields wants reflecting here, so callers know that they (a)
>> can't re-use the struct on a subsequent call without re-initializing the
>> fields which may have changed, and (b) can't put the struct in r/o memory.
>>
> 
> Update comments:
> 
> /*
>  * Copy memory from/to a given domain.
>  */
> #define XENMEM_foreigncopy 29
> struct xen_foreigncopy {
>     /* IN - The domain whose memory is to be copied. */
>     domid_t domid;
> 
>     /* IN - Flags. */
> #define XENMEM_foreigncopy_from 0
> #define XENMEM_foreigncopy_to 1
> #define XENMEM_foreigncopy_direction 1
>     uint16_t flags;
> 
>     /*
>      * IN/OUT
>      *
>      * As an IN parameter number of frames of the domain to be copied.
>      * On output on error updated number of frames left.
>      */
>     uint32_t nr_frames;

This is updated not only on error, but also when encoding continuations.

>>> +    /*
>>> +     * IN
>>> +     *
>>> +     * Frames to be copied.
>>> +     */
>>> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
>>> +
>>> +    /*
>>> +     * IN/OUT
>>> +     *
>>> +     * Userspace buffer to read/write from.
>>> +     */
>>> +    XEN_GUEST_HANDLE(uint8) buffer;
>>
>> With these two handles, there continues to be a need to (explicitly) deal
>> with the compat case as well.
> 
> I don't agree with this. Domains having access to other domains are
> limited (like stub domains for Qemu) and won't be 32 bits today so why
> allow 32 bits guests if not ever used?

How do you know? Why shouldn't e.g. XTF be permitted to test this in all
possible modes? And even if all arguments end up in favor of "no compat
support", this then wants spelling out to make clear this wasn't an
oversight, but rather a conscious decision.

Jan

