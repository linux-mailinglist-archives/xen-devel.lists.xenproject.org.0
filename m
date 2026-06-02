Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBCYBu+vHmr7JAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:26:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E262C865
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324736.1590240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUMKL-0000Hh-VO; Tue, 02 Jun 2026 10:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324736.1590240; Tue, 02 Jun 2026 10:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUMKL-0000FG-SD; Tue, 02 Jun 2026 10:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1324736;
 Tue, 02 Jun 2026 10:26:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUMKK-0000FA-DA
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:26:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUMKJ-00Gkk8-FT
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:26:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eafb9-e002-0a2a0a5209dd-0a2a4509bcce-40
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:26:27 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eafd3-2497-0a2a45090019-d1558031c59a-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:26:27 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso13083915e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 03:26:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cd87sm30739048f8f.24.2026.06.02.03.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 03:26:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1780395987; x=1781000787; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=okKjY4zisNVWpiqDTFpmcLBUL0F28HNDFgS1MXYHlmM=;
        b=d+wXjhQdKoOfpz0QBmcqohWX0C3EbPeGkIsME5keuQjiJJ7B3rvUrn/9yBF/5Egmhl
         wQXCYuhR5b2oteYvkYWOHqRjQOMssDwt//Otzs1PmbtHvHQVF92/AbV4Vk71A78aXh1G
         DVtbpMizeIJU9DA5zqUfFk6Kxv4zF6XCVzXTfxA0JB0hh1OOfNj2MX7AbVSwKJib24sp
         F2PDqvqyrI8EzNk76ADiBWklD1x9iwuqKlpTYMS6YtZ1/VQaXEuESvyC+PBjvDF5X4hH
         eyp4Wgx00fhLlrOPrxNbwfovACoGuv0v4hbqj7e2KI9ZOrtV1ejEFd42Yct+akUv6rgA
         VNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395987; x=1781000787;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okKjY4zisNVWpiqDTFpmcLBUL0F28HNDFgS1MXYHlmM=;
        b=Ezix6xoVTylfTT3j/6Zow6KaLDzUKlcN7KVn/2ALPibPquqbUAVaEeTAJ6VSYb0s12
         QAH21B/+eQpAl1wNhzcwnI8gFQZSmcYwMYL7clf9XiOtq7cnnooCI3jSDdk/lk+Jph8/
         u95hE15aRqIdRBZwNPaFe1UIy1kLF2tijZcwNJFIm+0qt4XgmdNWpwqkKrcBluda6PFG
         fUCXyWZwhV19KeaNWUY5Jh5ZPu8QaJbIbZC3OSMC1fso4xca87GOOEywPGWgb/c59dkN
         uRbDxajiNEKJiJPLNbW9JN6tEP02zOK1nlz2RaPkmkuQIygwH3aLQal/ft+c3nJQBtHm
         ylwA==
X-Gm-Message-State: AOJu0Yz6XW6lyyj04xq9DB8+wjuDWPghelhrkPjTPqyNbn4cDW4m6/GY
	6PF8j2f8WNvp0PP7YDVHXMiQQqTdKo4TKp1tNTVfcd0LsOcODvFymcw0CstvxblPjg==
X-Gm-Gg: Acq92OHbZrtYa7urjWcus5SaSqoZsOJo7HU3KCSS8TnI0LBbQebuwsBFEfDJnZhh6d5
	pW3ID+1+ua2qzvmr0jZGbepfFx5gFeJr/f17DhH8gR7bbd86HVB0vrdP9b0J/GhDP7LRjekVKIb
	Pon/S56o6vUMVtJBRBV/cXOeBm/HYnWIrcK33UklnlgTfsLFi5wxfZlBqSrwuYA8aBBMIau2N5t
	NvIfvIqmAXwiOoAT3yDxAgMeBeQcvm+pbeMRgv4/ERK+kHCN0qZdhABhONBNCilqnVSabZKwxP4
	ne32BnvGAr9+jhURkpiOyRL0hPJsIaxhoxewg2mhVCCPEV3f/G8N2UMiVfMGYAnHmJSH2Nhbc9R
	yKfko9PZHh40YT1c8ifp+Oyf5rDXq4Yhy15QAIXSwwxDM6GqdfGldLXqLt1ZKIExVXoLEI4Yb+L
	dIjSn2QGiZc25NlIbLM3wLkV0GHF+XGdKASb//S4Kmdwxh8LjHvbqLNH1x6mpxBydjLq/dd06c5
	AwRsYKNweHmSsuctBIvU0/u4Q==
X-Received: by 2002:a05:600c:4e92:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-490a2901aefmr283595435e9.3.1780395986871;
        Tue, 02 Jun 2026 03:26:26 -0700 (PDT)
Message-ID: <bd4a6d0b-7c2e-4cda-b5c8-f8dfc0ee2f18@suse.com>
Date: Tue, 2 Jun 2026 12:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 5/5] xen/numa: fix setup of non-aligned memory
 affinity ranges
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-6-roger.pau@citrix.com>
 <e08a1e30-cac2-40a6-9dbc-31aa4074ae88@citrix.com>
 <ah2_Wyzw486gLflv@macbook.local>
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
In-Reply-To: <ah2_Wyzw486gLflv@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780395987-8B790A53-77C742B7/0/0
X-purgate-type: clean
X-purgate-size: 1529
X-Rspamd-Queue-Id: 7C0E262C865
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,vates.tech,amd.com,xen.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 01.06.2026 19:20, Roger Pau Monné wrote:
> On Mon, Jun 01, 2026 at 06:08:49PM +0100, Andrew Cooper wrote:
>> On 01/06/2026 4:43 pm, Roger Pau Monne wrote:
>>> --- a/xen/common/numa.c
>>> +++ b/xen/common/numa.c
>>> @@ -396,7 +396,13 @@ static int __init populate_memnodemap(const struct node *nodes,
>>>  
>>>      for ( i = 0; i < numnodes; i++ )
>>>      {
>>> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
>>> +        /*
>>> +         * Round down start address: if start is not aligned to the memnodemap
>>> +         * chunk size the tail remainder might not be added.  Overlaps created
>>> +         * by rounding will fall into the same NUMA region.
>>> +         */
>>> +        unsigned long spdx = ROUNDDOWN(paddr_to_pdx(nodes[i].start),
>>> +                                       1UL << shift);
>>>          unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
>>>  
>>>          if ( spdx > epdx )
>>
>> I like that this comes with a unit test, but this hunk needs to be
>> standalone at the start of the series, because it needs backporting.
> 
> I was supposed to add a post-commit note about this, but finding the
> offending commit took me a lot more time than I was expecting and
> forgot to add the note.
> 
> Yes, this needs to be backported.  I was wondering whether it would be
> fine to just backport the fix, leaving the test changes alone.

I'd be perfectly fine doing so.

Jan

>  But I can also split this to a pre-commit.
> 
> Thanks, Roger.


