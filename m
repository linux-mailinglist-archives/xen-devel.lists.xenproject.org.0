Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5DEIG2ZHIGr+zwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:25:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EA8639260
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gk6MD6qH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326894.1592174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnT2-0004mg-Gm; Wed, 03 Jun 2026 15:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326894.1592174; Wed, 03 Jun 2026 15:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnT2-0004k2-Dp; Wed, 03 Jun 2026 15:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1326894;
 Wed, 03 Jun 2026 15:25:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUnT0-0004jw-S1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:25:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnT0-003nrO-8f
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:25:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a20474f-bab6-0a2a0a5309dd-0a2a450ca9a4-30
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:25:14 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204759-62f1-0a2a450c0019-d155dd2ae0e3-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:25:14 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-46015dc517aso2652537f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:25:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b63d8205sm54417155e9.11.2026.06.03.08.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 08:25:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1780500313; x=1781105113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tzhWlKGsmVyS07p71rfdMQtoS7qSPKhuJEEt1TuL1Oo=;
        b=gk6MD6qHQ7iq1NpbiQN9EIlo+3I1iTBYbu3C8Hc1pTJ8XzHnbEpkKma/I1STVOshUn
         ksIpWk+qJWNH3bKcVska/V9WqFUHTRylVLlLuxomqmjNRfC58qlT18XXvULgdDLps6Se
         iKOf7RYaH55BSsyjmOpDbJzziE29CotgN0RwSgcI8/hUX3ndQN6jtOeuJ5HH9DcWAYWr
         nk2qO5m5m631JhUvriy0jrLxhHPdbuSWmpvH5JXkmL9FIZVmKnjPhehUGHNbzopXv2G3
         pgT1rA+2K3POTjepDi723YgHTn3p1y4F4agElVGQL2HAvH/Cd1nhFtCO+366jq01NtaP
         386g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500313; x=1781105113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzhWlKGsmVyS07p71rfdMQtoS7qSPKhuJEEt1TuL1Oo=;
        b=r83HeMCiuiovA3BZ94s5on5el4rLQ1dx1AC6Bu5CD6/oE6If+J3o3hdPsGdE/bHG1X
         V8Gy0ngQvLT2eBHdmA1n2DqowlPdaznvYETIAuxjezgkww3WogPpRwe8fTfjzsCHfYCP
         A0Fn0g0cnGra3u/LyrZO4yKD1ZQ+Al0rvHQ+NQuLuwQ8YSP9V1uSAi5mbRZrirqrDX2a
         R63LOnttBNdKUXVHM5weHdZzHREg1c9BzqyclWGAVYu0L9FyveNl58nQqn3s3C/3T7PV
         9YGvs1RUJHnRoYEBSi9o+5g8F3e8CU41AmDMULqLASkoEA2yZ5uvKWpXpGkZDzrS/EVs
         ejjw==
X-Forwarded-Encrypted: i=1; AFNElJ/xZfU+gP02NotWJe3CC+sKIhI2NeJGvOFnh2CWP40ab88LCRyl9KKVK74MDpkTE78qy3Clr8/qfMI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDquJbNO7jaWmO7YTaK8zafmybMXS6NRcxpOj4ZTF7YXhRtemJ
	gT/9JJtppsXp5SQh0y0zqyn2ZzS8/HEMad678KlsI209wrS3uDmIal0oZPaunTOuFg==
X-Gm-Gg: Acq92OGV7QThfssmFYo6BI1P3ITCZJPHIQ0wSG7Uofj6bQ5w+OqSt4I6AAeu1qIB5t/
	KrwsE3F8V8iNKOh+sb7R30/FbGwXBtOZmCYzV30tlLtH6bdxryfBIZxYH1YkBvgEm5JZlfO/Syc
	lorgeQYzvVr3lEryqV5eW5YOYQKFNY1Qh0W/x0w6PSWseeOXjq3chkG8sJcQ9+qLStYreNfAa5I
	sFsQk4MJtMQpkBhACISKwEOpCiZpKFN1Ugqw5mbxtZPu3Nl6viRzkevVtVVQhyNe4in3X47qsyH
	o/rmECi3Fvx8QuVE1FzKJHGKwcvyKwpf26aK3CRTR0LGmHb/ZTod9tLsKnVyH7jJUthnBRz3oJc
	U1njhyiCp9tD9GCio6DFg45OcLf34ghQoy3gzYxsMO4dHSrNAEJDMwTDE2moJL70f9B44Pluehd
	7LNtHQalXgS7NJqX7m717HaGLfq6qT64TcLKW6ypyvKWaeI1eSJRKppu8bAgKlxkF6UvwMOjwIt
	5xATIdRFdAs2KIaTe1FGc4ACQ==
X-Received: by 2002:a05:600c:3103:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-490b5e645ddmr65646995e9.1.1780500313470;
        Wed, 03 Jun 2026 08:25:13 -0700 (PDT)
Message-ID: <5472f497-8071-4e30-9919-72106122d4ca@suse.com>
Date: Wed, 3 Jun 2026 17:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mm: reset PFN_ORDER for offlined buddy heads
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1780499500.git.bernhard.kaindl@citrix.com>
 <3d899d52c26e4ff6a45ff33864b355651ce5d081.1780499500.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <3d899d52c26e4ff6a45ff33864b355651ce5d081.1780499500.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780500314-F4C79CF5-56B47B88/0/0
X-purgate-type: clean
X-purgate-size: 1314
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8EA8639260

On 03.06.2026 17:11, Bernhard Kaindl wrote:
> Ensure offlined buddy head pages are annotated as order-0 pages.
> 
> When a buddy containing pages marked for offlining is processed,
> reserve_offlined_page() rebuilds any surviving healthy buddies
> and moves the offlined subpages onto the offlined lists.
> 
> If the buddy head itself is offlined it was previously left
> annotated with the original buddy order even though it has
> been split into a single page.
> 
> This has no functional impact as the order of an offlined
> page is not used for any decision making and onlining, but
> it is misleading when inspecting the page's metadata.

As per this, ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1251,6 +1251,12 @@ static int reserve_offlined_page(struct page_info *head)
>          ASSERT(total_avail_pages > 0);
>          total_avail_pages--;
>  
> +        /*
> +         * All offlined pages are standalone pages: If this offlined page was
> +         * the head of a higher-order buddy, we need to reset its order to 0:

... is it really "need to"? I'd suggest simply dropping "we need to". Also
unless there's really a good reason, comments better wouldn't end in colons.
Can make adjustments while committing, as long as you agree.

Jan

