Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E/wqF+7uOGoYkQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 10:14:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14906AD9A4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 10:14:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DFBowl14;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343517.1602811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbZmq-00039F-UI; Mon, 22 Jun 2026 08:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343517.1602811; Mon, 22 Jun 2026 08:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbZmq-000376-Rc; Mon, 22 Jun 2026 08:13:44 +0000
Received: by outflank-mailman (input) for mailman id 1343517;
 Mon, 22 Jun 2026 08:13:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbZmp-00036k-2z
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 08:13:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbZml-003iq0-Cz
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 10:13:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a38eeb1-bab6-0a2a0a5309dd-0a2a4505d8b6-8
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 10:13:39 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a38eeb2-ef3d-0a2a45050019-d1558029b1a1-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 10:13:39 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso32825655e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 01:13:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924944fb71sm181974925e9.14.2026.06.22.01.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 01:13:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1782116018; x=1782720818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rGi8z4dybdBr1jeN0JjenqNyqjpyII8CZ9iLAzxq5qM=;
        b=DFBowl149gGTfqukohxNBqkl/gC4w0yMdj1rhrGea5t+qqKMX6BnfH40N8Ky0wSB6U
         QQ6op0I7KdpAeRewjwe8BIZUvO4AQhW/9uqkUDvuwN4Wa183YG/ixpaNyPEmxshniwFE
         1ilhRcQvsXVVHx92g1xO3uaCyiv335jjObY7NNcaOXt/Bw6NXrmLAiZ6Dd3O1JO/+Mzl
         KeO1OrtJRHWnRbIhdLCqjXfGFJP7LM0hTTrjKPnkZTpsbnS3ZZvWcCKAE6x7HjbpWixB
         ObwKK2nMXzfzWGM646SZJhoASs7gF9HLrgVPCPFGSfNiyLfNIyjc+gIx34FERcoUYRg2
         i2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116018; x=1782720818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGi8z4dybdBr1jeN0JjenqNyqjpyII8CZ9iLAzxq5qM=;
        b=AFblbcUzS5YTpU4UJAZ1kPJJA7jupposuDL7FkRAMBjmdE3HRSCHec9YZNdQz8O4VZ
         DketfiRsQsOH6sA7j8smMAUKKoJRkfAld+UnSQRq79M79kSd+PHoHsaovbXlA1pNORvB
         5IqGx7Ut2VSa0h4OJszUUnsdZdn7heINshR6OeMjXd7FYlezVc3gsCo1QmztRghXNUJM
         hsYrLfgnB9qztly9skXzXZKV4cxxqc8kU2gypZfCZOPKOtoAhOBvAZJje+zlAUgH56ab
         H9mT7EGb9XkYMhLX6krn9B0lhLzYf5cZKqvc6y8fNFL+AvF/E61mFxGIU0X2Q4M13hAV
         5ePw==
X-Forwarded-Encrypted: i=1; AFNElJ+ida0K1RnAU8rBcRTaUU65vVQpwzHJLW/yiz1cREX6toCTWy6Htki09NeXAHPXf3Zj7vmPghBgA7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIphnZnlhZ9c/1IuVjs2tly0W+4avmKdQFMwHhChk6oTQAWWNp
	Cx7+NUCteazRNPBfUQqAvKRlG17BSWywOfIofXmR4mEajNMe8FYBf+k2UjEAgXdk/A==
X-Gm-Gg: AfdE7cmYvtJ3gS1b2anh+etoT52yS9VWN/3X4n8Tp6cFtrj4DOUK2QiDHyarhKYIO0g
	wWpHctyNANv/WqCTrXxlBaPfW3kTLtdMfJSD90Z4UZsr9EOcxjZVc4i+gv0S+UumstYy80vJ6sH
	bl23umWih/kckYeo5c6ZOh6xu+kI/OVSWBeoSqO2vtKeKB3/lYAJBwtxh/vqayuJK7BjUslu8QE
	stcNd63fJvIsoayRFaW3wrSWMZ5LSJX1uv+++oFgQYfc/rrZi2uDPURRC+SPzWpHIRKTrDprzof
	Qw7KPvhJsXwFnl670GMPf08oupwIEqfBpsyjayXn7ha4NJzb2LVgBgYNt0hLJeNNrx0aw9hXqGL
	WCxM0w4DZSn5Zy3CP6Rq28lM1wmfrtxl0mewX7rYr1qGdsmwv0D1I69q56j7tgfkOWnS9erYnwv
	nY1kXxQowlnNsNNOi6hnqCKpCK80aPQwuZuWh9glZF7tk8WAVdVmJCycxmcY1q/BL3dVHjzF8eY
	PE5
X-Received: by 2002:a05:600c:609a:b0:492:3fbc:556f with SMTP id 5b1f17b1804b1-49249083b99mr140214865e9.2.1782116018391;
        Mon, 22 Jun 2026 01:13:38 -0700 (PDT)
Message-ID: <42f16737-1aad-4e01-9966-671453cf1b52@suse.com>
Date: Mon, 22 Jun 2026 10:13:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] xen/device-tree: Read NUMA node distance from
 Device Tree 'distance-map'
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260619075011.377116-1-taka@valinux.co.jp>
 <20260619075011.377116-8-taka@valinux.co.jp>
 <926d2a7a-e278-4c3a-b168-aad003da6652@suse.com>
 <OS9P286MB7222340F4909B9873B89D45082E12@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB7222340F4909B9873B89D45082E12@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782116019-9CBCC127-D8F0E761/0/0
X-purgate-type: clean
X-purgate-size: 1720
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A14906AD9A4

On 21.06.2026 01:36, Hirokazu Takahashi wrote:
>>> +    entry_count = len / sizeof(__be32);
>>
>> Nit: Better sizeof(<expression>).
> 
> Is the following line better?
> entry_count = len / sizeof(*matrix);

Yes.

>>>  /*
>>>   * Get the distance between node 'from' and node 'to'.
>>>   */
>>>  uint8_t numa_node_distance(unsigned int from, unsigned int to)
>>>  {
>>> -    if ( from != to )
>>> -        return REMOTE_DISTANCE;
>>> -    return LOCAL_DISTANCE;
>>
>> Why did you introduce the function as a fallback when now you remove the
>> fallback logic entirely? Can't you introduce the function right here,
>> omitting the earlier patch?
> 
> I will remove the earlier patch.
> 
>>> +    const unsigned int nr_nodes = last_node(node_online_map) + 1U;
>>> +
>>> +    if ( from >= nr_nodes || to >= nr_nodes )
>>> +        return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;
>>
>> What if either node is NUMA_NO_NODE?
> 
> This behavior comes from the Linux kernel. It seems it exists as a defensive
> fallback to keep the system running even with invalid or unassigned nodes.
> 
> Do you think it is better to make it return 0xFF instead whenever any
> out-of-bounds node or NUMA_NO_NODE is passed?

Whether it's 0xff or REMOTE_DISTANCE I'm not quite sure. But it certainly
shouldn't be LOCAL_DISTANCE.

>>> +    for ( i = 0U; i < nr_nodes; i++ )
>>> +        for ( j = 0U; j < nr_nodes; j++ )
>>
>> Why the U suffixes?
> 
> I added the U suffixes because variables i and j are unsigned types. 
> If a plain 0 is preferred here, I will remove them.

They, even if only slightly, hamper readability. We tend to add them only
when there actually is a need.

Jan

