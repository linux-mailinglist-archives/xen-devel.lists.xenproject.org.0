Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGv9IPq2qWlEDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 18:01:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36B215CF7
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 18:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246953.1545924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyC3m-0005a4-AI; Thu, 05 Mar 2026 17:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246953.1545924; Thu, 05 Mar 2026 17:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyC3m-0005Xe-7A; Thu, 05 Mar 2026 17:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1246953;
 Thu, 05 Mar 2026 17:00:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vyC3l-0005XY-0g
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 17:00:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc32c4f5-18b4-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 18:00:22 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48371119eacso98317175e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 09:00:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851ad09c92sm37214925e9.23.2026.03.05.09.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:00:21 -0800 (PST)
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
X-Inumbo-ID: cc32c4f5-18b4-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772730022; x=1773334822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ESjQyTkxKE/5heZSTnPhxduSDIvNR2PSNgyuNvp6b3w=;
        b=XSPzmspQ4UFB9nzWSKYoj0sLNGioeN3kDzggHj6Waadt4ja3X25IcD/fs4ONmuKy2u
         4eZEB3ldK7dXmo+q7vR5kEtwiRP2DedZBYhr3MORgO3DwuIW00c8Ytm6shrpKzSG/Jx2
         HsKSbk7IwGzsKXuYeYXu6rBfWaXfnv/xTHQ/Xk6h8t2r4g2jT/FPJJzoBY38hj4UKK+K
         tJ1rZAYzW1kdt8+32hdtPk5DfgIomzxt5HYOPFvbG4v9GAPqQK/j4R/4zfpUtO51aqG8
         U9tr1s93WOCtQ6yUPgpYIAEMc6XC6pWRVuouGNBawdqcVnAyDii5i+iGImoIc81rtLT5
         KdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730022; x=1773334822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESjQyTkxKE/5heZSTnPhxduSDIvNR2PSNgyuNvp6b3w=;
        b=wFqwDaMhTrBwtTWlDmCpEy+ie36KS0x4hc6MB5BKQ0QTLcPjGjWNgumY4gnYB51Z9u
         pvdTgG/2jvcQVit7JRgj7hdBUyOpSjomHWSK6VbSRVVNQvmyT766tAnKeRjgejW8ka8r
         uwg9QT1/SdfQ26Fzq01TehtTF+N3NaQkSBYEbabfv7Evo8ZLiquTwdB4Rvw0+BB+BtSZ
         fr6kF6zAwnem5+Ceow/CxaLOTZ6I+Hj4igGd4XxwP/wTm45dU/K5BXGHNMQCioc9GN4U
         a/Jpo7VqLtLoYA9lTe83i2pQKq6KI24BYHqgxNa38KVFuMd5TMsR3MLrzz6cmkR7m5So
         wOFA==
X-Forwarded-Encrypted: i=1; AJvYcCXbieC3hPa/BMLvRA+Jo8neWvXeVZm2a6ggPzDnRcWelvKMQTiBMUKr+UE1z/L7okYnoF6IjP0pEIY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzh7Hx2KAqEWVWeNZKv5A0B3/r7Z2pwUe3VG/9JcsMmqtfOGC6j
	GtZRJ2D2JUSsEONlKaqFI3MkAt+poyxUJvg9J2c+FT3BWfkQTBexaF6j58hRQojTkg==
X-Gm-Gg: ATEYQzwJZEIeF0EsDUaY4WvmLc/sIk5Syct7CxarYLh5+kDgUJ4iTJkQy1Jk1xUmPAP
	O27HGlByHX6YSdFgquQcKli1oSmB4HkxFnnvEehgsLeeOwq8q6eE4gwHcCQkOW0N84wctdyWZrs
	oR7Ez2d8eaEC71QlGqVs/JCo2LyWcncrXU5m5ZHDlfDxJNNoyQC/SIAcPVpoZYg83Wc9ZooyMWL
	9tcoXhzU/nxPvuWqcp3yAr5twfkJE6EJ1zBM0ghzCLJZWBcnMYKakvtrjQirZeayrd1nEP+YUyk
	S+yO4n92Kj7D53q+E4nI3Ly5qUiul0mkhaWMpxN/NaTmPsy0Pj5nCBRLACX8H2G1pwVofBoT0Q9
	nkGEbRQLWMXF4RdYTkl3IMG4Z+yIJNrog7wcluY4Gb32poND2kqKAO5mpC6S1uiTMrKP8gHpoXs
	Nuact3unCsqacb00GHM0Ka2K5XH/utBt2NxKfWsVgxumvJoMaTSXGmwjqPaAv0IeiKMp41Vj3YH
	rgZ+e2UAIFUJpU=
X-Received: by 2002:a05:600c:828d:b0:483:c35d:367f with SMTP id 5b1f17b1804b1-485235f13dbmr2364115e9.21.1772730021839;
        Thu, 05 Mar 2026 09:00:21 -0800 (PST)
Message-ID: <e3bf2c4a-0a67-499a-9b19-b70357d44925@suse.com>
Date: Thu, 5 Mar 2026 18:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] xen/page_alloc: Implement NUMA-node-specific
 claims
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcus Granado <Marcus.Granado@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alejandro Vallejo <Alejandro.GarciaVallejo@amd.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
 <6927e45bf7c2ce56b8849c16a2024edb86034358.1772098423.git.bernhard.kaindl@citrix.com>
 <1497b37d-f47a-41c6-8037-a00a555d13a0@suse.com>
 <LV3PR03MB7707BD13DBB8516C60B06927877DA@LV3PR03MB7707.namprd03.prod.outlook.com>
 <cea8125a-e111-4dd7-a314-4d04c7270b70@suse.com>
 <LV3PR03MB7707B0093DEBA939361156FD877DA@LV3PR03MB7707.namprd03.prod.outlook.com>
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
In-Reply-To: <LV3PR03MB7707B0093DEBA939361156FD877DA@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6E36B215CF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Marcus.Granado@citrix.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out,xenproject.org:query timed out];
	RCVD_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,xenproject.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

On 05.03.2026 15:54, Bernhard Kaindl wrote:
> Jan Beulich wrote:
>> On 05.03.2026 14:12, Bernhard Kaindl wrote:
>>>
>>> Roger requested the domctl API to allow claiming from multiple nodes in one go
>>> and he specified that we should focus on getting the implementation for one
>>> node-specific claim done first before we dive into multi-node claims code.
>>>
>>> - Instead of adding/linking an array of claims to struct domain, we can keep
>>>   using d->outstanding_pages for the single-node claim.
>>>
>>> - There are numerous comments and questions for this minimal implementation.
>>>   If we'd add multi-node claims to it, this review may become even more complex.
>>>
>>> - The single-node claims backend contains the infrastructure and multi-node
>>>   claims would be an extension on top of that infrastructure.
>>
>> What is at the very least needed is an outline of how multi-node claims are
>> intended to work. This is because what you do here needs to fit that scheme.
>> Which in turn I think is going to be difficult when for a domain more memory
>> is needed than any single node can supply. Hence why I think that you may
>> not be able to get away with just single-node claims, no matter that this
>> of course complicates things.
>>
>> It's also not quite clear to me how multiple successive claims against
>> distinct nodes would work (which isn't all that different from a multi-node
>> claim).
>>
>> Thinking of it, interaction with the existing mem-op also wants clarifying.
>> Imo only one of the two ought to be usable on a single domain.
> 
> Yes, correct. As implemented by Xen in domain_set_outstanding_claims(),
> Xen claims work very different from something like an allocation:
> 
> For example, when you allocate, you get memory, and when you repeat,
> you have a bigger allocation.
> 
> But Xen claims in domain_set_outstanding_claims() don't work like that:
> 
> - When a domain has a claim, domain_set_outstanding_claims() only allows
>   to reset the claim to 0, nothing else. A second, or changed claim is not
>   possible. I think this was intentional:
> 
>   - domain_set_outstanding_claims() rejects increasing/reducing a claim:
> 
>     A claim is designed to be made by domain build when the size of the
>     domain is known. There is no tweaking it afterwards: The needed pages
>     shall be claimed by the domain builder before the domain is built.
>     
>     Note: The claims are not only consumed when populating guest memory:
>     Claims are also (at least attempted to be) consumed when Xen needs to
>     allocate memory for other resources of the domain. For this reason,
>     the domain builder needs to add some headroom for allocations done by
>     Xen for creating the domain.
> 
>     When the domain builder has finished building the domain, it is expected
>     to reset the claim to release any not consumed headroom it added.
> 
>   - If a domain already has memory when the domain builder stakes a claim
>     for completing the build of the domain, the outstanding_claims are set
>     to the target value of the claim call, minus domain_tot_pages(d), so
>     already allocated memory does not contribute to a bigger total booking.
> 
> For NUMA claims and global host-level claims, it is similar:
> 
> A NUMA node-specific claim is implicitly also added to the global
> host-level outstanding_claims of the host, as a Node-specific memory
> is also part of the host's memory, so the host-level claims protection
> does not have to also check for node-specific claims:
> 
> The effect of host-level claim is also given when you make a node-level claim.
> 
> When a domain one kind of claim, it does not make a lot of sense to then
> later add a differently sized claim for another target. Like described in
> how domain_set_outstanding_claims() is implemented, a domain builder stakes
> a claim once, then builds the domain, then resets it, and that's all to it.
> 
> For example, Xapi toolstack and libxenguest have calls to claim memory,
> but in any given configuration, only the first actor to claim memory for
> a domain is the one who defines the claim: No mixing, changing, updating.
> It makes things clear that the initial creator did make the claim.
> 
> Similar for multi-node claims:
> 
> Roger described how he wants this API do work here:
> https://lists.xenproject.org/archives/html/xen-devel/2025-06/msg00484.html

Fits my understanding, but doesn't fit you limiting the new sub-op to a
single node. As said, if you introduce the new sub-op this way, I'd still
expect for a single domain to have claims across multiple nodes, and
that (preferably) whatever the caller does to achieve that will continue
to work once the restriction is lifted.

Yet I can't see you describe such claims-on-multiple-nodes use case in
of your reply above. And indeed to achieve that you'd need data layout
changes, in particular there then couldn't be any single d->claim_node.

>> Ideally, we would need to introduce a new hypercall that allows making
>> claims from multiple nodes in a single locked region, as to ensure
>> success or failure in an atomic way.
> 
> In the locked region (inside heap_lock), we can check the claims requests
> against existing claims and memory of the affected nodes and determine if
> the claim call is a go or a no-go. If it is a go, we update all counters
> which are all protected by the heap_lock and are done.

Yet as per above, afaics you don't even have the needed data layout to
record two (or more) claims against distinct nodes.

Jan

