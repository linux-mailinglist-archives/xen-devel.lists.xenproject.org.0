Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A+AIoIx+GlBrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:41:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECA4B896A
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:41:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299475.1574011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm3N-0001T7-Jo; Mon, 04 May 2026 05:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299475.1574011; Mon, 04 May 2026 05:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm3N-0001RV-Fv; Mon, 04 May 2026 05:41:13 +0000
Received: by outflank-mailman (input) for mailman id 1299475;
 Mon, 04 May 2026 05:41:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJm3L-0001RN-S9
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:41:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJm3L-000fVS-87
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:41:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f83177-2eae-0a2a0a5409dd-0a2a450cebae-0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:41:11 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f83177-62f1-0a2a450c0019-d155dd29ed0b-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:41:11 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-44b330c5cc6so1267469f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:41:11 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a981ded99sm23569370f8f.18.2026.05.03.22.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:41:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1777873271; x=1778478071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7uLqXK0QO5OwSLDJ+OQUKZ1P2pF7WJHM3X6jU4+oSWY=;
        b=Ch7AyjlHfgFjJQqjDltCvHnKI+1Og+E992AyAlOseyLip4jtoDnA+0j+vdNftIOr7q
         XDnZg/ZEsQbi+2vFrkXfQxgZvt2hTYfqF6LIsidKM8wy+q1M+BSnBC/VspXd2WsYeYid
         xT/JjZ/I74Oj1xTvHzACiIBm9BPXK5GCioOfmGW/uadGSi9IG+kHXO2+kWD95XA4+LZw
         Xw+DuWGj6vl5I1V4pegA1BOGYUvdTfpwvj/z4O3k39KDBYkpIzju/EQTrYuVtnwCXz23
         Hh8o0JwAN9aGl2a5eIWHKxPHoRBgY+pjhEk5Z6J34wA4nXCm0JBxQwu8BeWn0IWO6gp0
         cBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873271; x=1778478071;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uLqXK0QO5OwSLDJ+OQUKZ1P2pF7WJHM3X6jU4+oSWY=;
        b=K5ygg3BHcMCfp7DNAMO4FPg0+sKXUPU7exM/yH47m1WovkqVKGQsMY8GfbvpMzuN3O
         8pd9awzhY12OQ7VvNoyweyfys/8udHY7Ku9/xo41+aj3wfFGyZ/FXaWUFYxO/3cV2UO/
         ILcMoDmxWlBzwS2WG1kzrZfGCSeSpcwwe38MzD/EDxfdT4lgUmq24NCq47gk5BbCWBy3
         I0gYmNREF0Q4MAHXOnZugMRF999LhNjhxCkTWr+BDvnqmhvyrR5yzpIm35yLV4hjdqAm
         1OBoHfOMrVq+YvLn+SKglAQ2MAhh5MIVYbzaUFdFTxxo2bgSo4Jokc2QnK+JrN2uXJOo
         GDEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8US+H56KAkYWV3+BPGXnQ5poqky1gAfcksNwPnXiyIfC66+LUJyPQ/nRZGQEOjvTxIcj9qX6EIWS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxb01IUwHEC2k1h+qRpl/NNOOXTXUmAndPKY6QI+txeckOwJ8sn
	bYiJn+l/c/KmY/ktZ2ZIwhi+RCQb2QmpYxA7QQI6+PgydLHR9fDllKXARwzmz8j5VA==
X-Gm-Gg: AeBDiesWHucgxgQFeBLsRkZzXtsMEQHZPEmGYyT4nVeaPnMZz3Pq15jCne7BWei7Lkf
	ySeJgSiYK9KYj5HLcUah98xfgTE2dK5UU09TItxPXyx3rpTPNJR3SfsxBaWsb1A/atMkii6R8tD
	x5GEYW63xqQUic/YZd6ttLCu1W1i7Hee5GQL2R8nL4vaB0F/9ENovTRtdYVd/oG09HAQrTn5qry
	F7E/ajR3OSe8kahCWHrjePtzlRHXgBKsfG7PyGT7PuM4EWxLRlQcFYbumvll0xlroeecGzteLN5
	lLgqbwsAoS8Pd2LMXNk/HD6OJG6m43DIxsenjHQ+rfemzyse0Tb9566JvrxDfiZTlvWcpsklGm4
	SwVK2U7BK9hLDwQy4O5aD46qAX+aOVuDrcPPgcwCIP96jOq9DXMPC5QwGTjbmhETbea7oXFoj6H
	5/OO3ya/IXlHnyWbPZlqXmHxiuroDzMIFHeCl5WNtDD852lu817uI61qhPfTeLf4+o1XRjpdYb0
	mCHxHlshxj3PsJjcr8eTtUo+KcacAKRDlERilZ3pWZOgX7m8cP3e/0a44SOFXR39nlbV58=
X-Received: by 2002:a05:6000:2382:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-44bb36d1837mr13360954f8f.5.1777873270655;
        Sun, 03 May 2026 22:41:10 -0700 (PDT)
Message-ID: <3867aa2d-ed58-44dd-bc06-94643ee5918c@suse.com>
Date: Mon, 4 May 2026 07:41:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
 <5302d33e7e896347acc7a8212df4f28ea098e28e.1776172526.git.bernhard.kaindl@citrix.com>
 <3df7352b-7502-4c2a-bc3f-0cb4fa7014cf@suse.com>
 <LV3PR03MB7707C0637B5F73CA26E3F4D4872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
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
In-Reply-To: <LV3PR03MB7707C0637B5F73CA26E3F4D4872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1777873271-6D96DCF5-CAB26606/0/0
X-purgate-type: clean
X-purgate-size: 2692
X-Rspamd-Queue-Id: DEECA4B896A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]

On 22.04.2026 16:35, Bernhard Kaindl wrote:
> 
> Jan Beulich wrote:
> 
>> As to the rename to deduct_global_claims(): With that, wouldn't its 2nd
>> parameter then better also change to "deduction"? Furthermore, "global" in
>> the name is ambiguous: It may mean "not per-node", but it may also mean
>> "not per-domain". The v4 name didn't have such an issue.
> 
> I see the point about 'global'. While the struct domain argument provides
> context, the term is indeed too generic.
> 
> In this logic, 'global' was intended to refer to the opposite of
> node-specific claims. While the legacy codebase uses 'no-node' or
> NUMA_NO_NODE as a sentinel, I find those terms ambiguous for this new
> logic; they often imply a "missing" assignment rather than an explicit
> "any-node" policy.
> 
> 'Node-agnostic' better describes the architectural intent: that these
> claims are valid regardless of node locality. To resolve the ambiguity,
> I will replace 'global' with 'node-agnostic' across the board (design
> documentation, code, and tests).
> 
> Specifically, I will:
> 
>     Rename the function to deduct_node_agnostic_claims().

Or deduct_host_claims() (short for deduct_host_wide_claims())?

Jan

>     Update the second parameter to 'deduction' for consistency.
> 
>     Update the function comment to explicitly define the scope.
> 
> /* Deduct from the domain's node-agnostic (non-per-node) claims pool */
> static unsigned long deduct_node_agnostic_claims(struct domain *d,
>                                                  unsigned long deduction)
> 
> While 'global' was shorter, 'node-agnostic' is much more descriptive of
> the actual logic and the node-locality (or lack thereof) being addressed,
> avoiding the potential confusion associated with 'no-node'.
> 
> For consistency, the corresponding renames across the series will be:
> 
> +--------------------------------+---------------------------------------+
> | Original Term                  | New Term                              |
> +--------------------------------+---------------------------------------+
> | "global claims"                | "node-agnostic claims"                |
> | d->global_claims               | d->node_agnostic_claims               |
> | XEN_DOMCTL_CLAIM_MEMORY_GLOBAL | XEN_DOMCTL_CLAIM_MEMORY_NODE_AGNOSTIC |
> | deduct_global_claims()         | deduct_node_agnostic_claims()         |
> +--------------------------------+---------------------------------------+
> 
> I believe these changes result in less ambiguous language universally.
> Jan, could you Ack these renames for the next version of the series?
> 
> Bernhard
> 


