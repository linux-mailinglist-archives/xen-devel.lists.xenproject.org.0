Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIuOBtvXgGnMBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:59:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF7CF458
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219011.1527879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmxGB-00054O-5m; Mon, 02 Feb 2026 16:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219011.1527879; Mon, 02 Feb 2026 16:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmxGB-00052p-2t; Mon, 02 Feb 2026 16:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1219011;
 Mon, 02 Feb 2026 16:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmxGA-00052j-1E
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:58:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e2c39b1-0058-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:58:44 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-482f2599980so18678145e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 08:58:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e2e3beadsm94298895e9.20.2026.02.02.08.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:58:42 -0800 (PST)
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
X-Inumbo-ID: 6e2c39b1-0058-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770051523; x=1770656323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NDsMiTsT9NbLmooRjArcnE6DMrktVNXwfD+3xuGQfsY=;
        b=R0hkqOkaJ6Tuj7xUMdM1HerffFcc9Xy7WEwqce+DeCK3RMwFdH60v2Vpr77bZhdMMA
         ZRu4AmCiwSfAYcssg/QALuD/D/CR4b+VofHWXqnua0AGFhaoZvNVbSffySuM2jbcPgGt
         drdtsIMw5zi011mqPP9jt0z8qwC1WU07ZndiELJF5pwSeOge7nUH9HcBp2nIwznCnMTO
         +9KaQbfa1FHCY6olFSZX2Fm+vk7HDt5zEpqxIdxkxew8usA1U32TYTn1DpsrFfyXqzk2
         FMX2BMtMzU70srQmf5aZjHRdrYAa744M9tWIccgRXlkS0AJfMY0I7bgzeCZkzTHvqnzm
         pIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770051523; x=1770656323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDsMiTsT9NbLmooRjArcnE6DMrktVNXwfD+3xuGQfsY=;
        b=CFtOIrZwm3TGspJF5hpboJGbnJOMSeGWM+SGg/H6fiZKAhkYn1imemevlvZQ1bi3pV
         g50DMF50j48uWOPSiytcEHFFYNuI71BG85xfhlfDLmcdTgxM3Pq8b7jA1+pue/mzl7l+
         rGz01qolHYZ7mDy50essgWpBto377jV8KcWo9wcwQMXifdy3dbp1hCn9KI6ZeDOSqLYU
         XIwMdFfkL91BWOexeCEVozzaznIB8637TpOj4En1AvgGL/tNqPEyI9CNxDyULG5B/mF1
         NS3Yw08sMkmsXYG4Piydexo/dJBab2wxVgacrPAUe5caTaqAA8LXt2ZWQgsFqYyO9awv
         I4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv++DMSc800VOf/ZSuMu3rnDrzBImrk+l77zvdSM3Xrzn6OsE52g7iPOmwGpuVO0UhNt5aaY16OT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+0RzDDWttDsvMN2go9pAuJw6oMwEX19tXo3XQImxriwxepgAi
	sTERli+YfMu0QrI0WrNyht6Vie/WdgjbMm6uIERLz6nGTHSEIzjM6SUZC5dnkRPrSg==
X-Gm-Gg: AZuq6aL/gjHDTbueTLkjV7bofehB7wjqj+dFoBnd9LSWcYYSk6rF8mZk4TE7z1hRBJS
	4vsLyO+zVNcGuU/H6sgKsTtoy+gOE/WqT2fVw0tudK8GC7ePDMGfptFf0uEJBr4nWQrMS1YiENs
	56vSZLoMoyhOAKKBvQmdcOl24RYHdMom96Kfk9+A/tP8X45mwzELt4KZfEmxLpOf/3FGTB3O0WV
	I84LnzRA0l0/e8xYlPt6D1R9KaanOmSrESfwdQPyyjq9O2jGQbut/jzr2i4A1NaEup4fkTLHSV3
	SPusGK2tsStEgIgNr4WVtInjwdpkN0SA9x4YLzh6fpBCvIPiPmUbQS8BsxYlMOh7Vc8qr7J4/op
	E8+M0hOVzucC6OkAAfSpYLxR+oEJI9VI7HCNCagxVrInpPLROYBRkfZbJ/3rNQ1OJmqfM71w1Vc
	bS61sMMn8vGOfIgTNJcR8LrUv59rspFXtI9v8mn/HUOesqXsgXk3OYDlumiObDH4FDKYyRJiTFe
	rI=
X-Received: by 2002:a05:600c:474f:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-482db4596d4mr154431065e9.7.1770051522566;
        Mon, 02 Feb 2026 08:58:42 -0800 (PST)
Message-ID: <c14143e5-cb7e-4c73-b95b-3321a0be943a@suse.com>
Date: Mon, 2 Feb 2026 17:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260130145726.85907-1-roger.pau@citrix.com>
 <20260130145726.85907-4-roger.pau@citrix.com>
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
In-Reply-To: <20260130145726.85907-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 54EF7CF458
X-Rspamd-Action: no action

On 30.01.2026 15:57, Roger Pau Monne wrote:
> Physmap population has the need to use pages as big as possible to reduce
> p2m shattering.  However that triggers issues when big enough pages are not
> yet scrubbed, and so scrubbing must be done at allocation time.  On some
> scenarios with added contention the watchdog can trigger:
> 
> Watchdog timer detects that CPU55 is stuck!
> ----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
> CPU:    55
> RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
> RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
> [...]
> Xen call trace:
>    [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
>    [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
>    [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
>    [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
>    [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
>    [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970
> 
> Introduce a mechanism to preempt page scrubbing in populate_physmap().  It
> relies on stashing the dirty page in the domain struct temporarily to
> preempt to guest context, so the scrubbing can resume when the domain
> re-enters the hypercall.  The added deferral mechanism will only be used for
> domain construction, and is designed to be used with a single threaded
> domain builder.  If the toolstack makes concurrent calls to
> XENMEM_populate_physmap for the same target domain it will trash stashed
> pages, resulting in slow domain physmap population.
> 
> Note a similar issue is present in increase reservation.  However that
> hypercall is likely to only be used once the domain is already running and
> the known implementations use 4K pages. It will be deal with in a separate
> patch using a different approach, that will also take care of the
> allocation in populate_physmap() once the domain is running.
> 
> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one minor remark:

> @@ -286,6 +365,30 @@ static void populate_physmap(struct memop_args *a)
>                      goto out;
>                  }
>  
> +                if ( memflags & MEMF_no_scrub )
> +                {
> +                    unsigned int dirty_cnt = 0;
> +
> +                    /* Check if there's anything to scrub. */
> +                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
> +                    {
> +                        if ( !test_and_clear_bit(_PGC_need_scrub,
> +                                                 &page[j].count_info) )
> +                            continue;
> +
> +                        scrub_one_page(&page[j], true);
> +
> +                        if ( (j + 1) != (1U << a->extent_order) &&
> +                             !(++dirty_cnt & 0xff) &&
> +                             hypercall_preempt_check() )
> +                        {
> +                            a->preempted = 1;
> +                            stash_allocation(d, page, a->extent_order, ++j);
> +                            goto out;

As j isn't used anymore afterwards, j + 1 may be more natural to use here,
if only to avoid raised eyebrows.

Jan

