Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOX/I3Xe1GnzyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:37:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069223ACFBB
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274883.1560861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3o6-0001QR-9x; Tue, 07 Apr 2026 10:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274883.1560861; Tue, 07 Apr 2026 10:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3o6-0001Nq-6n; Tue, 07 Apr 2026 10:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1274883;
 Tue, 07 Apr 2026 10:37:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA3o5-0001NY-2b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:37:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3o4-004vN7-AN
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:37:16 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4de52-e002-0a2a0a5209dd-0a2a450b9d98-46
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:37:16 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4de5c-bca8-0a2a450b0019-d155dd29e101-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:37:16 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43b87970468so3816833f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 03:37:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f843dsm47235019f8f.37.2026.04.07.03.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 03:37:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1775558236; x=1776163036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=altMUzZOzZeondy7I1by4nBdv1QiqNwfOueTEhRITkI=;
        b=gJsXj4GhJjUI/IE7lpWgo5/qyO2QeIVN3F87uZFp7Kd5EbW1zRBY5nlrUkkDKkiMXk
         pqw+owzbuiDYcYNKLojdBpD8ulZoOVYKXOgq0Bt0FMu9EMoqpFJXPJtC3lmREZVL+rVY
         RDDPbeEnPXmMw/U5zjRZrQpp+HX9vDSar4QViQI8F+mlw5fa2adYrd2Tj+DYckYhBt66
         83236sSgZp4H06J23oMjhCWl+ClJ/fTA7HXG6ZPoFDeLz6Hz3cOqBDLqsS4I8NgMhoT/
         8rVJtIdusKnLrSG0bYWMWWeCh9LqNV3gsfI6k7vi1MoXe0n6cOYO0ZQk9h5RmCpnaCwa
         4r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558236; x=1776163036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=altMUzZOzZeondy7I1by4nBdv1QiqNwfOueTEhRITkI=;
        b=LcWkWWvIxyPNtgpuo4MZB93QffbC4rAy/Qrp3o6U1tscORI8GDdQKeyzp+d5m99Eg8
         C05HEyB2ksLAX/rJa38KezmYW+wNThRaJ8vjL+dWnkMcF+qGRtmBMDv2lG60Q4VZAwDf
         CcLoFaa3ALJOzeI9sB1eqyCChKeu5xnB32hZLyLH0GRf5zN36UFVWBj94GsnlG1WU4J6
         i5uTD3oDq6AMdSlMQKM8V0nQ+uGbA5j0PZhAYFDBhzJuqOWdTxD6Xo9MQe++MZl3fRJe
         AKISYQJAOpuxLsbeCfvoBulJHFi0gAkzXmGLTOomutMawLRp9KcbdWARkPAgW83ita8N
         U6zg==
X-Forwarded-Encrypted: i=1; AJvYcCW7WoPF7yj8mvoi5wxfkFS3YlI7YEAWGnecxnuuewrxJuglL8O+YM608tPmhWYm2258BwDpgLTsayU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjWMPnKDmcdVY7iWNbeXqV+cFi+qaYygRQsYT71ulNYoZiQKE9
	xCWjybF7qUmKsTu9VDmEUxUx/rB3GdKyaS50JU7/r2cz8RdNhB6DlrOUz3E5NLst4Q==
X-Gm-Gg: AeBDieuhMeg69D9BLEigYCl1SlGFe5FNt/VrC7o2JTvBsrMkVB2v5APNe4enQNRqPw2
	m1dt0tniU+9ve+fbrp7uHG9LBPYJClMPJeNdOQ2rULHUZlawD+QGxhzhkpr8mXUBXNMkOsvhThM
	CviddZfn2n0DVvvB4Na3kxjVlUdN37w5AXNQnqhC3woAUD/RsZ6IFwXP1hfA+W/KV1gl8vvtiXZ
	mYyTPcw+J17NnaOsNenbC6lQFsrrbjJq0tQoylo0jOMZiePsnMsw1qPMfaS4L1K1g3Qo58BjAGB
	EkuMvShJKCfA3wvxW5bcfuH+hcg/cdDe2GATUJ0yRHtcM6JcbdSIeLjfdBzFtkobehTuiWupiuO
	YWp9BsvMWD6dY+SaRmBRhnGeTtMGfxpgAv2YCBCcUKymn8bCsxxc6WfdPEwtqJJpOOcaXPWOrxd
	03tKoaczKiarZFvRDLQpD+RzTzCQko5MsDcoKG/n5iJ4nS+OFQz9VWI6afQw8E1hMyuH+IoIWgs
	t+6dLOVqRx+CB0=
X-Received: by 2002:a05:6000:4201:b0:43c:fed2:bb72 with SMTP id ffacd0b85a97d-43d29294691mr22272353f8f.19.1775558235511;
        Tue, 07 Apr 2026 03:37:15 -0700 (PDT)
Message-ID: <44abc205-c7b4-4aff-992f-25ddcadd38ec@suse.com>
Date: Tue, 7 Apr 2026 12:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] llc-coloring: improve checking while parsing
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
 <884db6ba-19c3-4073-b1e4-631d286ec5d2@citrix.com>
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
In-Reply-To: <884db6ba-19c3-4073-b1e4-631d286ec5d2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775558236-17B402A1-49F9C31D/0/0
X-purgate-type: clean
X-purgate-size: 2053
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cert.pl:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,citrix.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 069223ACFBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 12:30, Andrew Cooper wrote:
> On 24/03/2026 4:37 pm, Jan Beulich wrote:
>> We can easily avoid the risk of wrapping UINT_MAX <-> 0 by applying a
>> check against the compile-time-constant maximum number of colors.
>>
>> Additionally the overflow checks suffered from an off-by-1, as the parsed
>> ranges are inclusive (e.g. end == start being possible, requiring 1 array
>> slot, while availability of 0 slots was checked in that case).
>>
>> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/llc-coloring.c
>> +++ b/xen/common/llc-coloring.c
>> @@ -76,8 +76,9 @@ static int __init parse_color_config(con
>>          else                /* Single value */
>>              end = start;
>>  
>> -        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
>> -             (*num_colors + (end - start)) >= max_num_colors )
>> +        if ( end >= NR_LLC_COLORS || start > end ||
>> +             (end - start) >= (UINT_MAX - *num_colors) ||
>> +             (*num_colors + (end - start + 1)) >= max_num_colors )
>>              return -EINVAL;
>>  
>>          /* Colors are range checked in check_colors() */
>>
> 
> I think this is correct, so Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks.

> However, the parsing logic is also ridiculous.  Most of the complexity
> comes because of parsing a bitmap but storing it longhand in an array of
> unsigned ints.
> 
> Instead, the global variables default_colors, dom0_colors and xen_colors
> should be bitmaps sized by NR_LLC_COLORS, and d->llc_colours should be a
> bitmap sized by xen_num_colors (which itself is bound by NR_LLC_COLORS).
> 
> With the default of 32 colours, this would involve no memory allocation
> at all, even on 32bit builds of Xen.

It's pretty space inefficient, yes, but the parsing wouldn't become simpler
when using bitmaps, would it?

Jan

