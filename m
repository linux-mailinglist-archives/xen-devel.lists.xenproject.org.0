Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DpeFYUfcmmPdQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:00:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016D066F90
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210973.1522541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuIZ-0005x8-G3; Thu, 22 Jan 2026 13:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210973.1522541; Thu, 22 Jan 2026 13:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuIZ-0005w1-Ca; Thu, 22 Jan 2026 13:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1210973;
 Thu, 22 Jan 2026 13:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viuIY-0005vv-4Z
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 13:00:30 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 535620c0-f792-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 14:00:28 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so763011f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 05:00:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992c6f2sm42901805f8f.19.2026.01.22.05.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 05:00:27 -0800 (PST)
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
X-Inumbo-ID: 535620c0-f792-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769086828; x=1769691628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xW2ErgZF2t+Xs5pfDMWviwYjHbuakFt5IED0dS0RWEg=;
        b=bJJWLSyxoO0gQPQJRNCpRj/JnWsfI9oCR6d2ClXlqeVpZc1W22kJxfJ3UJxqJOC3pB
         +IsjSRFdq5SzwDtbGZjmnUATlIj/v1j8rfu4G7yGSY9FVRl30dAuFeTuPA3XjDaEpCki
         W5c+CBCG2oQoaUTdzxGQw76SU6nC1HxzuwsBuR+e8Ct411g7NlcSinFQEXXDV7jD6D2j
         Nxp0a9s0vz/L3wdBfhBIzQOvtgpGvQXv0WdEhFDkIIASKmrmqucm8LN8tGrZprLPK82P
         YXq3qRNkXFk64+wIg/b6gtklTyGMIVXPcnYT1QAl7A6R9XE1rdj/5nyzt2WvMR5iGPh3
         ii5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769086828; x=1769691628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xW2ErgZF2t+Xs5pfDMWviwYjHbuakFt5IED0dS0RWEg=;
        b=DJM4ioXYD+tmHkGXyZ9mFb7OakWOxi1jzk7BHqgI4Oh/i92nusxbrJkO4b/C0qyM4L
         SXA9TW60M6cqHHRoZrxFRJebmrcuM7YOkVXWlvfRGE1KDKxeLDylOwZnpKnpmDBflR5x
         i2GwQuPzMS1KcsikjOrQt+UTWFu9odkytaCWGss43PBAQrccGyS7esljkIwSE+f9gOun
         L3TaSTku/L9IFaPt6U8y2Iz4FDWW4Fe3inF7b94maQjlDq8iKjXBodVCrb2l6a6L87os
         4UGwDR3PTo/WHRbbuN7m9ZmV7Spe+QNjnqcOGu2DnkWx2/jB7OI1Iz0XVNi58Z+vEfNj
         8jYA==
X-Forwarded-Encrypted: i=1; AJvYcCULu2F0iOUbe7n95DfVNP84P/D0fWCQw+733bhur/mnaVOnpibDoN80gy5+wEgFi5rUQmj9WoFxjw8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4rLAEbzDKKHYIfNGDyHTyEyXq58sfw4cZrx4xIuoJFfrR8I/M
	MVtkczyL7XsWEizDuMiYWpFvupdCm0RPjD0l6+5bCbqJvEJoKMDPO6MI1ONwaPvQOQ==
X-Gm-Gg: AZuq6aKHUZ8k2GbqdS3KTjV/mxJTZ3aHmDLJV7TFlOt+QDfB4RYV1ByWFR5lvRcUJoe
	t07Z9isBM1J6gffu4G8Gcxeq6W15Fy07OBXHIZYaNVwWXW1r3JruDvWtKwgw+eQbxlVUor3dD/X
	SeNQ23xiiFj66Fut7adheXUsrkXdXbfbGMaAleohc/pI+etefwsAVER/+MLV772malfSfab9MFR
	6mpOQobL7Sl+/RO1uELqcHcw+yTTtmmoe0F3m0MF7AjolXddrrxz6e1ikCac3tGvizpMbXDbD7O
	thNSHvNuASabl4E3uaJZPdXKwqDVR0N245OiAstpyEORUtqQBJvfiwvDYKxuNRs+P0UmgH6d8nC
	D6f3f1B3nNOIiVLPlbLC4pr1sw7GdLw5gMPQdnY3XswPoCkhAEnhxwRc5cD7flRDbgQeIxkGHqz
	KBdec2AvFKPXobPO+gWibn+vp61JmoP1ZvswAS0jPhvMIro3FBINzS+17NDgRAnfaiKf16T/mWj
	C8=
X-Received: by 2002:a05:6000:2893:b0:435:a83e:88e with SMTP id ffacd0b85a97d-435a83e0961mr3491779f8f.2.1769086827585;
        Thu, 22 Jan 2026 05:00:27 -0800 (PST)
Message-ID: <26d15493-cb05-4253-afa6-6b1490ad0d20@suse.com>
Date: Thu, 22 Jan 2026 14:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-3-roger.pau@citrix.com>
 <7387457f-104a-436d-96ae-b70c77745200@suse.com> <aXIcovhwLfkV8Dmx@Mac.lan>
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
In-Reply-To: <aXIcovhwLfkV8Dmx@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 016D066F90
X-Rspamd-Action: no action

On 22.01.2026 13:48, Roger Pau Monné wrote:
> On Mon, Jan 19, 2026 at 02:00:49PM +0100, Jan Beulich wrote:
>> On 15.01.2026 12:18, Roger Pau Monne wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -722,6 +722,15 @@ static void _domain_destroy(struct domain *d)
>>>  
>>>      XVFREE(d->console);
>>>  
>>> +    if ( d->pending_scrub )
>>> +    {
>>> +        BUG_ON(d->creation_finished);
>>> +        free_domheap_pages(d->pending_scrub, d->pending_scrub_order);
>>> +        d->pending_scrub = NULL;
>>> +        d->pending_scrub_order = 0;
>>> +        d->pending_scrub_index = 0;
>>> +    }
>>
>> Because of the other zeroing wanted (it's not strictly needed, is it?),
>> it may be a little awkward to use FREE_DOMHEAP_PAGES() here. Yet I would
>> still have recommended to avoid its open-coding, if only we had such a
>> wrapper already.
> 
> I don't mind introducing a FREE_DOMHEAP_PAGES() wrapper in this same
> patch, if you are OK with it.

I'd be fine with that.

>> Would this better be done earlier, in domain_kill(), to avoid needlessly
>> holding back memory that isn't going to be used by this domain anymore?
>> Would require the spinlock be acquired to guard against a racing
>> stash_allocation(), I suppose. In fact freeing right in
>> domain_unpause_by_systemcontroller() might be yet better (albeit without
>> eliminating the need to do it here or in domain_kill()).
> 
> Even with a lock taken moving to domain_kill() would be racy.  A rogue
> toolstack could keep trying to issue populate_physmap hypercalls which
> would fail in the assign_pages() call, but it could still leave
> pending pages in d->pending_scrub, as the assign_pages() call happens
> strictly after the scrubbing is done.

As indicated, the freeing here may need to stay. But making an attempt far
earlier may help the system overall.

>>> +    /*
>>> +     * If there's a pending page to scrub check it satisfies the current
>>> +     * request.  If it doesn't keep it stashed and return NULL.
>>> +     */
>>> +    if ( !d->pending_scrub || d->pending_scrub_order != order ||
>>> +         (node != NUMA_NO_NODE && node != page_to_nid(d->pending_scrub)) )
>>
>> Ah, and MEMF_exact_node is handled in the caller.
>>
>>> +        goto done;
>>> +    else
>>> +    {
>>> +        page = d->pending_scrub;
>>> +        *scrub_index = d->pending_scrub_index;
>>> +    }
>>> +
>>> +    /*
>>> +     * The caller now owns the page, clear stashed information.  Prevent
>>> +     * concurrent usages of get_stashed_allocation() from returning the same
>>> +     * page to different contexts.
>>> +     */
>>> +    d->pending_scrub_index = 0;
>>> +    d->pending_scrub_order = 0;
>>> +    d->pending_scrub = NULL;
>>> +
>>> + done:
>>> +    rspin_unlock(&d->page_alloc_lock);
>>> +
>>> +    return page;
>>> +}
>>
>> Hmm, you free the earlier allocation only in stash_allocation(), i.e. that
>> memory isn't available to fulfill the present request. (I do understand
>> that the freeing there can't be dropped, to deal with possible races
>> caused by the toolstack.)
> 
> Since we expect populate_physmap(9 to be executed sequentially by the
> toolstack I would argue it's fine to hold onto that memory.

Here you say "sequentially", just to ...

>  Otherwise
> I could possibly free in get_stashed_allocation() when the request
> doesn't match what's stashed.  I opted for freeing later in
> stash_allocation() to maybe give time for the other parallel caller to
> finish the scrubbing.

... assume non-sequential behavior here. I guess I'm a little confused.
(Yes, freeing right in get_stashed_allocation() is what I'd expect.)

>> The use of "goto" here also looks a little odd, as it would be easy to get
>> away without. Or else I'd like to ask that the "else" be dropped.
> 
> Hm, OK, let me use an unlock + return and also drop the else then.  I
> think that's clearer.

I think if() with the condition inverted and a single unlock+return at
the end would be easiest to follow.

Jan

