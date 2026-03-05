Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGZCFPuGqWkh+gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:36:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42C8212A42
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246640.1545751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8sE-00057F-VP; Thu, 05 Mar 2026 13:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246640.1545751; Thu, 05 Mar 2026 13:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8sE-00055T-SJ; Thu, 05 Mar 2026 13:36:18 +0000
Received: by outflank-mailman (input) for mailman id 1246640;
 Thu, 05 Mar 2026 13:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy8sD-00055N-7Y
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:36:17 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 475ac266-1898-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 14:36:13 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48374014a77so97281095e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 05:36:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae5dbdsm41110415e9.8.2026.03.05.05.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 05:36:12 -0800 (PST)
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
X-Inumbo-ID: 475ac266-1898-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772717773; x=1773322573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TeN15VvfRLf2TeAbtoLUEDpP2YthgE2+O/U8siRzkGs=;
        b=H3m7VAItWJzBeTRQthVOiVkZ2Vxq8uRJDYtcEmGDwR0eJekc++kzpzlLRkBPPQ1KcT
         mrV366aYhWmU3ttLQ2rrAd9SAnkfMqVDGuD1qwhP/vOqa1ur5+L8D6fwwCmDH2uY92kk
         Xov/yJ6aCKNUDyBgUkgthnA+lnkWQKIFD2PeRXjmIiqLVpaMrKArs2Kd5lfeXCnD8nJg
         EnLK5Svv+b6/93xhaqfPB8y0OK1BDMLBdkxewJCaxdS2B7t/leH/IzkAx+2TWiFeOMzO
         Qp1NyVUfquwgvSV8AeVNRu45LJhKseMAAFpdMAN01BEbnmo3zIJ3beeLSQvz1w5w3I7J
         GFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717773; x=1773322573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeN15VvfRLf2TeAbtoLUEDpP2YthgE2+O/U8siRzkGs=;
        b=vxEjIuD/eNyw+bYUIIznloyv10hLsfFvPjyrk5PBSqQyfZQ1HJtqCSfaCa8sFBotl8
         q8Mq5Vl4sy3rdOLzRSeUiDMqlp8DhWMsGgRkhgNEffTeSpyNx6/Og+78ugzXE3kLQtSv
         fMCxD9mKDA25U/9h1lJl5ymmy7zh++9WpEvCIqjBb3h6OjaoobLf7ouETj7ksnje58w4
         1DVsJYoOq1xwkuvVAZy2H5lkmK2QxJqMK5uZgOo06fnF9gqKIWXIaKyfsXQ/baq6r8Il
         ghTFaDyZbmQtzjAQ/TKQwFwKrsNSLGooShvk8GsjUmPbZscgs2cemnd1Z9gqvin5Tt/W
         kceg==
X-Forwarded-Encrypted: i=1; AJvYcCVN+g/AQXjeZ32leUNBGsdbGJ2k8hP1lVwkj75XI2hec3vSI3jSZ8I/aWsSiHOK2oJ9hToH3cUqLUY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUf2JWpI3OF7mwzbZ2E0og5KCWAtjKO2HZvFtBdYRP+sFub1pA
	p8eV30v8UiqtrFsZwXLCrOKMWVWajuhUyYgI1ijWwe/juL9bkCcDXXgmmNjrOwhstw==
X-Gm-Gg: ATEYQzxWktgOvytHlS7OLSmlUMnk1OBzMwjMm1AwAIXSCpIntK93QDoYYV6EXi8eNQR
	V+jIRqWORb7VtJYSabDPlnx1Ul9sP80WsVQaM8J/v3xSZDvPqov2pJ+vSxLAGoIxByZ0sfanidd
	Zs1xMoilKYM6eS6xR9140uWRO/9OAiPjo2YsaKBD6+4P5rXNol0XQGHWcOGRk9EbWqFTDD5swzi
	UPtyHAjdkP+Kl6VuMFx3kl1fmkq96Q4ZHoMXepiqZxF2PYedNmwEW41YsWUGs6LsPl+PQb+m+Ru
	XbKSgfqsQhvo9I3X0XRPOEFvQZpO+C2GmLfyKfmUIjzdKrtFhwlDmN028Wtkq0nnXGj2e61w9xN
	4lWr8QtzTchbxfqhpc201oFnd2zpLqrB1WeGLc/0NtHXYUoEVL10jkaXHN3TFVSk9PUi1coNmvp
	RxKrXMVBr1A48LNd+X2eYwZm9pgIqMGFieq/FcwDZVjdy5NlZVIUlAlOH0yPTtYeBnMu/mg3ZAp
	M2QBgaVThPvvfd2Y5YeOgA5+w==
X-Received: by 2002:a05:600c:8b01:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-485198554c3mr102428345e9.15.1772717773045;
        Thu, 05 Mar 2026 05:36:13 -0800 (PST)
Message-ID: <cea8125a-e111-4dd7-a314-4d04c7270b70@suse.com>
Date: Thu, 5 Mar 2026 14:36:10 +0100
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
In-Reply-To: <LV3PR03MB7707BD13DBB8516C60B06927877DA@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B42C8212A42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Marcus.Granado@citrix.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05.03.2026 14:12, Bernhard Kaindl wrote:
> Jan Beulich wrote:
>>> +    d->claim_node = NUMA_NO_NODE;
>>
>> If, as the cover letter says, the new domctl is going to allow claiming from
>> multiple nodes in one go, why would this new field still be necessary?
> 
> Roger requested the domctl API to allow claiming from multiple nodes in one go
> and he specified that we should focus on getting the implementation for one
> node-specific claim done first before we dive into multi-node claims code.
> 
> - Instead of adding/linking an array of claims to struct domain, we can keep
>   using d->outstanding_pages for the single-node claim.
> 
> - There are numerous comments and questions for this minimal implementation.
>   If we'd add multi-node claims to it, this review may become even more complex.
> 
> - The single-node claims backend contains the infrastructure and multi-node
>   claims would be an extension on top of that infrastructure.

What is at the very least needed is an outline of how multi-node claims are
intended to work. This is because what you do here needs to fit that scheme.
Which in turn I think is going to be difficult when for a domain more memory
is needed than any single node can supply. Hence why I think that you may
not be able to get away with just single-node claims, no matter that this
of course complicates things.

It's also not quite clear to me how multiple successive claims against
distinct nodes would work (which isn't all that different from a multi-node
claim).

Thinking of it, interaction with the existing mem-op also wants clarifying.
Imo only one of the two ought to be usable on a single domain.

>>> +static unsigned long node_outstanding_claims[MAX_NUMNODES];
>>
>> How come this is being added, rather than it replacing outstanding_claims?
> 
> The global outstanding_claims variable counts the host-level claimed pages.
> 
> It has the sum of all host-level claims that are not specific to a NUMA node
> and also the sum of all node-specific claims (see more on that in an answer
> to another question further below).
> 
> If we were to replace it, we'd not have the outstanding_claims counter,
> which would result in not supporting global claims anymore in Xen.
> 
> If a toolstack would want to claim more memory than a single NUMA node
> has, someone would have to go loop over all NUMA nodes with enough memory
> and split the claim across a number or per-NUMA-node claims.
> 
> - This would be less flexible than what we have with it: With it, we can
>   still support host-level claims without those claims be placed on
>   specific NUMA nodes.
> 
> - This allows for many domains to be built in parallel where some
>   domains are built with claims specific to specific NUMA nodes, while
>   allowing the other domains are built dynamically at allocation time
>   from any remaining memory wherever that memory remains to be available.
>   
> - There are use cases where the memory of some domains shall be spread
>   across NUMA nodes to have the memory bandwidth of those NUMA nodes
>   available to the individual processes in the guest domain but still
>   want the assurance of host-level claims for claimed memory when
>   constructing of many domains in parallel on a host.

All fine, but why is this written down only in a reply to review comments,
rather than right in the patch description?

>>> +/* Return available pages after subtracting claimed pages */
>>> +static inline unsigned long available_after_claims(unsigned long
>> avail_pages,
>>> +                                                   unsigned long claims)
>>> +{
>>> +    BUG_ON(claims > avail_pages);
>>> +    return avail_pages - claims; /* Due to the BUG_ON, it cannot be negative
>> */
>>> +}
>>
>> A helper for a simple subtraction?
> 
> It is about not having to repeat the BUG_ON(claims > avail_pages) everywhere.

Which in turn I should have said I question. Imo this is supposed to be an
ASSERT(), not a BUG_ON().

> Also, the name of the helper makes clear what the result of the expression is,
> So when using it, the flow of the code is more natural to understand.
> 
> Having to repeat the BUG_ON() everywhere would make the code less readable.
> The BUG_ON() is good when refactoring as a guardrail when you broke the code.

I'm not quite sure there.

>>> +/* Answer if host-level memory and claims permit this request to proceed */
>>> +static inline bool host_allocatable_request(const struct domain *d,
>>> +                                            unsigned int memflags,
>>> +                                            unsigned long request)
>>> +{
>>> +    unsigned long allocatable_pages;
>>> +
>>> +    ASSERT(spin_is_locked(&heap_lock));
>>> +
>>> +    allocatable_pages = available_after_claims(total_avail_pages,
>>> +                                               outstanding_claims);
>>> +    if ( allocatable_pages >= request )
>>> +        return true; /* The not claimed pages are enough to proceed */
>>> +
>>> +    if ( !d || (memflags & MEMF_no_refcount) )
>>> +        return false; /* Claims are not available for this allocation */
>>> +
>>> +    /* The domain's claims are available, return true if sufficient */
>>> +    return request <= allocatable_pages + d->outstanding_pages;
>>> +}
>>
>> This only uses variables which existed before, i.e. there's nothing NUMA-ish
>> in here. What's the deal?
> 
> The deal is that for taking unclaimed memory beyond the remaining claims
> Into account for deciding that the host has usable memory for a domain with
> a claim, the needed if-expression would be quite complicated to understand.
> When factoring this logic into an if expression without extracting it into
> a function, it would bloat flow alloc_heap_pages(), especially if one would
> want to have the comments. I'm not sure if this is a good idea.

I guess I don't really follow: Right here all you do is transform a complex
if() into one that calls this function, with no functional difference. This
function isn't changed by subsequent patches. Hence what's the concern?

That said, I don't mind breaking it out, but as said - as a separate change,
and then with its NUMA counterpart preferably folded in.

Jan

