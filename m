Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GfB9Gnc7IGraywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:34:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AC638A3B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:34:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RikzQp5k;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326711.1592066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmfn-0002Nr-H6; Wed, 03 Jun 2026 14:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326711.1592066; Wed, 03 Jun 2026 14:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmfn-0002Lh-E1; Wed, 03 Jun 2026 14:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1326711;
 Wed, 03 Jun 2026 14:34:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUmfm-0002LT-4P
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmfl-007WSV-HO
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:34:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a203b5c-e002-0a2a0a5209dd-0a2a4508ab80-36
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:34:21 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a203b31-63b5-0a2a45080019-d1558029c81e-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:33:21 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so29768475e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:33:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e20a76sm137761225e9.4.2026.06.03.07.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 07:33:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1780497200; x=1781102000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Emg804SF/gp3/DzB2tkNPg8yYliOXOTCUq4HoXo/ByY=;
        b=RikzQp5kaLLJUDsQtLNyoW8ycKIS7SBLeSOgHh8T5jrWeUF0PAj3JAjQD1OlrdM+JX
         Ta3u4QTqz6f8/BMeHn9xswdSZRTntzTGwonRPql8BV8zXj0DVKTD/3dSwoF525btuHxo
         sRHOCtg5aE/iRVCyp4zW6ogOWBovthpqjjDZkI8ehydANocGhiS8JTZYHPYj4hjfnrfI
         msSLIGMLRvJO5dMCDf4S/GVxePUV4/KTMpOVTd1q8GNyNF6e/JF9fdQ/Ut8vu7cNsDJG
         Nu8Cv8SCtuMRhXFZreV1Y6n5h1ZpvNvFO/e80kbqi9PSuTG2U4Ctkk16J79IoXUuAQ0d
         YdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497200; x=1781102000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emg804SF/gp3/DzB2tkNPg8yYliOXOTCUq4HoXo/ByY=;
        b=A8PHnRqxMh+m53FLyqPL098yalLN3xfsbV2oZ1mSXGVvtIok0HTpgijr5d5sn2Za5b
         WTO+4+YpSGQaotsroBkZRqW0BcYu8uvE0ZqgwsPNko8NRyHJ/iSazgKl664o7cWLsVKC
         xR09OV2ELEWj7aDyS6ohWvSnxxBF7TQQtjak5xGMW42CXJuOeXEeNtmxbhpe2+6hdMsf
         2zl15RbkNbOa3L7LbU/z/0D04sEipaW+julpXf4iiRFK2wHHqc3emKKXhgz43p/XweSU
         nF1yTFx2gSKUCSHftM8TFrvnTpxXGD+5ANXa2/jY5b82qglcMKY6b5wmx3+udGHr5oaA
         H8mA==
X-Forwarded-Encrypted: i=1; AFNElJ/6V8HWW3gwQfGQO5xPOiAMTAKIZhHTQvIQ/nCC6FlX0mXSv6GvVAs6lorVRQhb7sXkPV1tGJBv6GY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5r8stvWMTWHRTm0NC6YK3i4pVJ0fUg7TAe8lE9rgCRSYm+Nm6
	8u1UzGNNg5Ds2uaP9gg0V/b1Enh8nG0RX3ci5eIk56rrlVfvJdiNEd8RqPbZns7qCg==
X-Gm-Gg: Acq92OHXlPn4BfrrBQFNJnAZxV96qk6LbQM84z4JGamGOkN0dK/d7+zQ52WE3n1SB49
	R9MBP7YbukjW2FZXmMQScMm4kiifyGDWLJc6/tQ8FkENM8VGObj97Z6RL2PuPJIWhYpGVKInVvs
	NT4Ql76MzcCqwPMHzTH9IdaYZ4i5IFTm7p0ijaepBGijRS+6LpytZ+Si3ShQNfD3XiVviKFd/0r
	Z9dk5aX0G546vrjoZ7FrzK2GrFe0PnQOfcDKSzI/qF0VUotdld+K9OU6PiBG1dsLp+aSUOIM5H5
	Y/oCqFnULAHGq5szQFcnvZBtpT0aMaDO7C257gV8hxmPFsdRE4r6dVBHRWes7mFyTbz3yNJsMHU
	qsg/F+B+jmFCtnbWoUUGHmS8Tl/g1ouXtg5a/MphVe1JW8MXcYf7iKbJGnuxh2j2M6OZqjOPRE5
	5N0Bn+TJFOf5jeJbWuxtVkA4ap1SLNXGY6U8ZoD2zbLKC+BZ1vqZv+Yn8EzXhzz9PcUtBmshiFC
	gEWhURQnoIMMbLOyYSCPzeN4Q==
X-Received: by 2002:a05:600c:a44:b0:490:688b:ece5 with SMTP id 5b1f17b1804b1-490b60edf0cmr65930285e9.30.1780497200628;
        Wed, 03 Jun 2026 07:33:20 -0700 (PDT)
Message-ID: <3f81a6e6-0c14-42de-9386-7820e68b16c8@suse.com>
Date: Wed, 3 Jun 2026 16:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mm: Fix off-by-one preventing tail merge in
 reserve_offlined_page()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1780496798.git.bernhard.kaindl@citrix.com>
 <f2ed440fa3d2ca62c77868a60061168630d9fb6d.1780496798.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <f2ed440fa3d2ca62c77868a60061168630d9fb6d.1780496798.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780497201-BC766DB1-008F3A2D/13/0
X-purgate-type: clean
X-purgate-size: 3355
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: BA3AC638A3B

On 03.06.2026 16:27, Bernhard Kaindl wrote:
> reserve_offlined_page() reserves pages marked for offlining and
> returns free buddies from the remaining healthy tail pages back
> to the free list.
> 
> Consider an order-2 buddy (4 pages) with the following layout:
> +---------------+---------------+---------------+---------------+
> | head page       tail page 1,    tail page 2     tail page 3   |
> | PFN_ORDER(pg)   marked as to                                  |
> | == 2            be offlined                                   |
> +---------------+---------------+---------------+---------------+
> 
> The expected result after removing tail page 1 and returning the
> remaining healthy pages to the free list would be:
> 
> +---------------+               +---------------+---------------+
> | single page   | offlined page | head page       tail page     |
> | PFN_ORDER(pg) | not returned  | PFN_ORDER(pg)                 |
> | == 0          | to the heap   | == 1                          |
> +---------------+               +---------------+---------------+
> 
> A trivial off-by-one error in the growth loop stops the growth loop
> early before the tail end of the original buddy and we end up with:
> 
> +---------------+               +---------------+---------------+
> | single page   | offlined page | single page   | single page   |
> | PFN_ORDER(pg) | not returned  | PFN_ORDER(pg) | PFN_ORDER(pg) |
> | == 0          | to the heap   | == 0          | == 0          |
> +---------------+               +---------------+---------------+
> 
> If the offlined page was in a much larger buddy, this would lead
> to much more memory not available for higher order allocations
> requiring the full tail end of the original buddy for allocation.
> 
> Fix the growth loop to correctly grow the buddy to the tail end
> to make the full allocation unit available for future allocation.
> 
> Fixes: e4865c2315 ('Page offline support in Xen side')
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oleksii, same question again here.

Jan

> ---
> v2:
> - Bugfix isolated from the test case for backporting.
> - Removed stray blank from the line that I touch.
> - Title: Replaced stopping with preventing.
> - Title: Added parentheses after reserve_offlined_page().
> ---
>  xen/common/page_alloc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 2767376a710b..e01ac3e99c72 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1195,11 +1195,13 @@ static int reserve_offlined_page(struct page_info *head)
>  
>          next_order = cur_order = 0;
>  
> +        /* Attempt to grow the order (size) of the buddy as much as possible. */
>          while ( cur_order < head_order )
>          {
>              next_order = cur_order + 1;
>  
> -            if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
> +            /* Do not grow to next_order if it would go beyond the buddy. */
> +            if ( (cur_head + (1 << next_order)) > (head + (1 << head_order)) )
>                  goto merge;
>  
>              /* Do not grow to next_order if cur_head is not aligned to it. */


