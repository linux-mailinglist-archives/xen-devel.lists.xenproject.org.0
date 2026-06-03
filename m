Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PPFEAy83IGq+ygAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:16:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A2C638762
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Iib179AC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326468.1591913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmNk-0006mT-RZ; Wed, 03 Jun 2026 14:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326468.1591913; Wed, 03 Jun 2026 14:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmNk-0006kQ-Nc; Wed, 03 Jun 2026 14:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1326468;
 Wed, 03 Jun 2026 14:15:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUmNi-0006jz-Ep
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:15:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmNh-00FvgK-Jq
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:15:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a203704-5cb7-0a2a0a5109dd-0a2a450b8822-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:15:41 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a20370d-212f-0a2a450b0019-d155dd2dc444-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:15:41 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so4248731f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:15:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b79d90bdsm18373235e9.0.2026.06.03.07.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 07:15:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1780496141; x=1781100941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GITjJpTW0bS6/UrRVON9ZOEKuvjV3lSktdyGvtG0uS0=;
        b=Iib179ACWLxMLFwV6CgR8iHvPIYEk/GCMtD8wC3ZP7XyZmtS2wF2GYpeyDMG25buye
         c0baQ1SvBFxi7drxs+4T0VEUZMjvwehwDvOgDF3HpshhQUPDep7HVa8TqI34reGiVCth
         UCgtE4PJIeAuFkUkp9C/MREWX+883/xwWMWfGAV9mV1YxCKu12qjjayY+Zrqb3+ycgBx
         1CxfbeX0kmUxb+wExFEa/jIy6PP3vSir2L2CMvzHLqR4SXTCW4/zpY7cd7KU++UPoEqj
         MRkbDBiD1u+tODMJEM5vlcP0Sl0SCkw2A92s2zrRgXeCmbsD1+hrfmEHi67bo2bT3xiU
         Pl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496141; x=1781100941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GITjJpTW0bS6/UrRVON9ZOEKuvjV3lSktdyGvtG0uS0=;
        b=svnsWymVWeMMd4keYzWTirldhqRBITwmJCf1LDUEzunAHG1mlfzAaTqzPn2chuZEWJ
         dWKdfxGfo/PDJtmkr4W0qEkJXQL/r/B9Grk65uHTByrP3T84BGERANFxiX0mL7Ysd+Jl
         d0+QDAg66kNP/+PjijHpcwIKfS22nBNcYSg3THD1By1cyyQ3KnZVNC19zqgYsFrjCGtz
         wtwPu3VqLcZ3yOXO/ohoaNsmvgCymVXC/73HvhWWZXuk21Aa7GfRa898fzj9521gA7iK
         XHyVow7uDik8SXm2azoFZiGLL8WlkahEapw3pGIDxlqvK71PA8N2L3Xwr+tFzzGQiELv
         yjgw==
X-Gm-Message-State: AOJu0YxFfRuPRTec6EWuZjzvOmUjCHwqN2ldRQPnHyLu75LUn8lTvd/Y
	uukK7D03lrU+raPiL0oZBDJ7XD1GSubMhohf+IBOCRQSamkwlXKxW9lw4yVpgB/G6IoH2Oa0sVT
	auXY=
X-Gm-Gg: Acq92OHgAH/YICw0sncBMYZbrPIjoGa5d68OSBvk+PktY1krgu4q68ac156fPxLoKvr
	H0lf+sLgk5DqZk1o2WH1HDBWwJpVIGWlzmp0S//wefwW774l2YzvET9rA/vJidBIP/dAE02yXIT
	+Er+csL96+x9glXgoxwVsgpBRIc23b6FNTVFxTKBMDGPHdtkghZU+zqveS9nFrudKRgcfrbiXTq
	8SMHxVXOge0xee/Q4vxH+a6WVClGUna6bJMTO5d48zg05/dwpC1N5WvG5+fMSakXT+kxPmbKhSI
	k7bbFHOlmqH0lhXmy7/ZIivmuEX7KBKQCQlps6iZNXSpEQqPCNdStY3K2nqHmi9G2LjYHxQ7xfQ
	J4CLtnfvMpKsb0HAs1dJYdaq4CS61s06dnYN9VmeqPb/XdQiUse34nOOjelcdoyROxjxZjwsX55
	wRGt4N9Jb8oZs5LVijrX1qAOBEicZ+n+LlpQl8sArzextYU8XhThYK6Z84qFb9nwh4WgqzSXB2z
	ltWWactNLYmj7rjaKRRbfYaBStW70xaW1qC
X-Received: by 2002:a05:600c:8b6f:b0:490:bb37:9d49 with SMTP id 5b1f17b1804b1-490bb379d58mr16353185e9.11.1780496140903;
        Wed, 03 Jun 2026 07:15:40 -0700 (PDT)
Message-ID: <2d0a4c03-319f-4d29-b305-09998a516606@suse.com>
Date: Wed, 3 Jun 2026 16:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RTDS: Call for [Co]-Maintainers [was: Re: RTDS scheduler patches]
To: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Juergen Gross <jgross@suse.com>
References: <41d236ba-a93d-446a-b29a-449a1c5f8972@suse.com>
 <0b44963bae28d08fcfc14374cfa5e9bcb7c5eaa3.camel@suse.com>
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
In-Reply-To: <0b44963bae28d08fcfc14374cfa5e9bcb7c5eaa3.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780496141-19F6EF3B-3BBAF44A/0/0
X-purgate-type: clean
X-purgate-size: 1850
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dfaggioli@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,m:Oleksii_Moisieiev@epam.com,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0A2C638762

On 03.06.2026 16:08, Dario Faggioli wrote:
> On Mon, 2026-05-18 at 17:08 +0200, Jan Beulich wrote:
>> In case of continued lack of response, I guess I'm going to commit
>> the
>> patches as-is towards the end of this week.
>>
> So, RTDS' maintainers are me and Meng, but I've not heard from him
> since long time, and that makes me assume he's no longer active.
> 
> About me, well, I'll use this email as the chance to recognize that,
> given my time allocation constraints, I'm not able to serve as the only
> maintainer of this scheduler any more, especially considering that RTDS
> seems to eventually be getting some interest and attention. :-)
> 
> Personally, I'd love to see this scheduler eventually out of the
> experimental stage but, at the same time, I must admit that I won't be
> able to lead it there myself... At least, not alone.
> 
> So, this is basically a call for anyone in the community that is
> interested in RTDS: help is needed and will be much appreciated.
> 
> I'm happy to continue to try to help but, as this thread clearly
> demonstrates, I can't be the single point of contact for RTDS patches
> any longer.

As to concrete action: From the above I conclude that simply removing
the "RTDS SCHEDULER" section from ./MAINTAINERS might be a fair first
step. That would still make you one of its maintainers, along with
Jürgen. Which may not be intended either, judging from what you say.
Might be best if you sent a patch updating ./MAINTAINERS to what you
think you're going to be capable of doing, in a sustainable way. Which
may be as small a change as converting the two M: to R:. Thoughts?
(Imo it's always better for people to make such adjustments for
themselves, then for somebody else to do them, possibly giving the
impression that the person is being "kicked out".)

Jan

