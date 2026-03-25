Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMENGjblw2mwugQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:37:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2779325EBF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 14:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262366.1554900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5OQU-0004cb-Ig; Wed, 25 Mar 2026 13:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262366.1554900; Wed, 25 Mar 2026 13:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5OQU-0004aY-Fq; Wed, 25 Mar 2026 13:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1262366;
 Wed, 25 Mar 2026 13:37:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5OQS-0004Y4-EH
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 13:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5OQR-00EVK6-Q6
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:37:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e517-bab6-0a2a0a5309dd-0a2a450bd214-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:37:35 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c3e51f-ef63-0a2a450b0019-d155802db976-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 14:37:35 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48374014a77so67411515e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 06:37:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487166064fasm22895295e9.7.2026.03.25.06.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 06:37:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1774445855; x=1775050655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5/LntUo37M9RpNs2XDXUdbrdjJqYjk31+yPfucwUJGg=;
        b=Rq2y5SPfgcyI0Ra4vmVdWHerxUkZP0ET7HEANxcLnGq1jDkOBWBmk+P7v8hiyYp1GG
         khbjpa6q4vfWDUWEzG1rV4Pk4QEFfASGys5izR0URl9naI1aw23cUgoTyWfzB7JI8W7B
         h8BU51ncpgXDLNv46ZsO2X6Yr/LXAlQKsQwJaHmG9Uxv9aQSUmw27xwBZi8sFE5T8uxC
         JwtQ7fTgjBbXEI23HqLj8LAzxoq0EAqF7A/bqRyOHOjOYdzHTsLMoIn4BhVz0zf9VQ9k
         3hpW+N1BYXFX7L5i+qkWhlbilZD7MMJhT2uhw/2Y/eBnDw4DcE4kQPPFb1TK5YWQ8hbE
         JaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445855; x=1775050655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/LntUo37M9RpNs2XDXUdbrdjJqYjk31+yPfucwUJGg=;
        b=DYyHjdhT12wtLDSey2chXfJSzyXVtiYiGFWNUCY/zoQxLqKEW+Dg7kpyt+bDawA61y
         C8mQEOfM1/3NGdo/oLW0qhJ2EDN7cMzqmTNnQmNF8IP4GfEwa9qdXjOSFlz+bKUj9UJX
         jK2g7UGv0gocBR71tpB7LDYWcETE101xbfLVOvzbLn8NgaR3gsMwoG8W/0O7DsB+rKB9
         RV8nZf6TwzG82iT8xjTWyw1+hIDAQJhz9WvqkklbFjKyKMaDEpR9xraS4evwuYXm7ies
         ghXm1oK3BG0AZ06tJb58Dn/y6rlDd91ls1tMx41GtoBFhmJa6Sejs2688kGaqPEV9/3G
         v9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUXVbL4q8zFzfCwyaokfU/iog7jWIYC05d6qmcOElOIFffZnnE/wn8yc53S+Op0O6jPPQkQ+glCS0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbtxPPHNupPxZ0OJKhXy8WoiE16CSOcxB6K2YoMMTNiUTvwYfE
	0aUB7D9vOeIoILIS1TsFEWDvhv6bnNmxHfd88kUZUIMpBX9N29gkkuJJVShpXhrS6w==
X-Gm-Gg: ATEYQzwKZNcqJrERouClstsledR4TrRUAemfB7CqCE/+eP5F1bskikT5paTUOgQUSMz
	5Bj/356b44v4axRhTQ+2wBTO298KYJ+D0pTPQ69XKiu/7Y1rXZz+ketF3qykw+ifvj6qLBO5WU5
	DOjlASzi7E4ZtRlFVFqvxMv4acR30il89dZC+mN2oUbdfp746ewHVSfNAyrDZK1363xxexbG+Rh
	x6pFhQihcZc9MurDblYhRzD5yrYXXdyiYNsaJhJO3LDyk3rHsgGWYnDuZA2V7oIGnbzM0m/60Q7
	+etHkXxUGq802ClkojjQUgDbVG9VC6sVdIUt7jAuRj2O+qHlnAGQmWe5hbJ0RyvtwDFTIZHlnBw
	7zqWQ8tWERW4SELCAg6jQLQES5058yjAXr+X/9Q+kl7EygxpVlfOkf5fI1iFty47YiHhJ9I6zI0
	KOGozekf2TTCbVFDugV/PU00rXhibI82GBIBGLoZ24mIvvCr7dNZGHIUGUAEijp4QW/mDPSy9TH
	dGVGrcIktQMer0=
X-Received: by 2002:a05:600c:350f:b0:485:40c6:f528 with SMTP id 5b1f17b1804b1-487160a213bmr50531645e9.30.1774445854880;
        Wed, 25 Mar 2026 06:37:34 -0700 (PDT)
Message-ID: <ab36ce57-2067-4f1a-8384-403e015732dd@suse.com>
Date: Wed, 25 Mar 2026 14:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/mm: don't unconditionally clear PGC_need_scrub in
 alloc_heap_pages()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayden Bottos <aydenbottos12@gmail.com>, xen-devel@lists.xenproject.org
References: <20260325100803.6640-1-roger.pau@citrix.com>
 <20260325100803.6640-2-roger.pau@citrix.com>
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
In-Reply-To: <20260325100803.6640-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774445855-9A4AF112-924A363C/0/0
X-purgate-type: clean
X-purgate-size: 2579
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,xen.org,kernel.org,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:aydenbottos12@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D2779325EBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 11:08, Roger Pau Monne wrote:
> alloc_heap_pages() will unconditionally clear PGC_need_scrub, even when
> MEMF_no_scrub is requested.  This is kind of expected as otherwise some
> callers will assert on seeing non-expected flags set on the count_info
> field.
> 
> Introduce a new MEMF bit to signal to alloc_heap_pages() that non-scrubbed
> pages should keep the PGC_need_scrub bit set. This fixes returning dirty
> pages from alloc_domheap_pages() without the PGC_need_scrub bit set for
> populate_physmap() to consume.
> 
> With the above change alloc_domheap_pages() needs an adjustment to cope
> with allocated pages possibly having the PGC_need_scrub set.
> 
> Fixes: 83a784a15b47 ("xen/mm: allow deferred scrub of physmap populate allocated pages")
> Reported-by: Ayden Bottos <aydenbottos12@gmail.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (minor request) at the bottom.

> ---
> This issue was initially reported to the Xen Security Team, and it did turn
> out to not require an XSA only because the code hasn't been part of any
> release, otherwise an XSA would have been issued.
> 
> The Security Team would like to thanks Ayden for the prompt report.
> 
> In the scrubbing loop in alloc_heap_pages() i should better be unsigned
> long.

This issue is wider than just that function. As long as MAX_ORDER <= BITS_PER_INT,
I think we could have all such loops consistently use unsigned int induction
variables. But of course switching to unsigned long would be okay as well, just
perhaps a little less efficient on (at least) x86. My main wish would be for all
of those variables to be consistent in type (and hence all involved literal
number suffixes also being consistently U or UL).

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -208,6 +208,8 @@ struct npfec {
>  #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
>  #define _MEMF_populate_on_demand 1
>  #define  MEMF_populate_on_demand (1U<<_MEMF_populate_on_demand)
> +#define _MEMF_keep_scrub  2
> +#define  MEMF_keep_scrub  (1U<<_MEMF_keep_scrub)
>  #define _MEMF_no_dma      3
>  #define  MEMF_no_dma      (1U<<_MEMF_no_dma)
>  #define _MEMF_exact_node  4

Irrespective of all the similar issues in surrounding code, may I ask that << be
surrounded by blanks in the new addition, to conform to ./CODING_STYLE?

As an aside, I wonder whether we really need the separate _MEMF_keep_scrub, but
the same likely applies to most other _MEMF_*.

Jan

