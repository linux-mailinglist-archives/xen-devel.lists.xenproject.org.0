Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKkYDSyYy2mYJQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:47:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C523674F6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268820.1558014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Vgn-0000Cn-O5; Tue, 31 Mar 2026 09:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268820.1558014; Tue, 31 Mar 2026 09:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Vgn-0000BL-L1; Tue, 31 Mar 2026 09:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1268820;
 Tue, 31 Mar 2026 09:47:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7Vgm-0000BF-NI
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:47:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Vgl-0012I4-Ok
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:47:11 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb981c-5cb7-0a2a0a5109dd-0a2a4508d3da-26
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:47:11 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb981f-1950-0a2a45080019-d1558032c0a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:47:11 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so49522505e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:47:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c769841sm15080415e9.7.2026.03.31.02.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 02:47:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1774950431; x=1775555231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K0CFshowMOymJ1/0mq1dpX0/bASAZZ89bF72K6ZuD3E=;
        b=dPmvgyhv0YzCD23A+jztwnJItZzm2Tvw6A+PsJQcQWZy/4pkReh5g/b3wEQ8v/yh/r
         RDjmXCQtxIyIcAJJ0o+8MHdBY2GkPk38A+Z1Mo2GXU5FJJ+NsPQstbj25q1L/GS/qc9I
         Nuxo5kytdae6AJ+SnAMe1vOkJHdgaiI21dlGtXayeatjv3t4sQU9h4e0XzzhfjpaOwkn
         2KzAgSW8Lm70gsFGFWGjfuhQFIfsJcf7w86Ho+yG2VDYOhf2c8UqxlmCZCaal8jLZ6sV
         m4jVAdIlus0dKdND1dDq0eRid/x2JIETVybjl9Ix+uNcPlIXVq/gbqjQdlt2Akb8On21
         NFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950431; x=1775555231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0CFshowMOymJ1/0mq1dpX0/bASAZZ89bF72K6ZuD3E=;
        b=gI+YLCrssCRUVzxBM+3CeNl8ItuYic5AQB9boui+g1EsduMzLzV6dlzT1vEg2m7ddw
         njqeRU241LuKbWdGzQP1/AGuZ+CgkHHk0avzD+273dl9EH4BV4AFjFoiiL62WPIJ9HOA
         qO5H/t3gNBRAjvXWfE1NxKF6M/3y5L5I/CHKi0bILsW8dWVXUrUdZNR1ymBWd+NHZ8fg
         Vhklc4PYhWnUBPH3gG7b1rc/wN3f/46aBBfRe462PMolqCQ2ZpmQy1/48tL/MaDNWv86
         uKbT9654btc2Fvl1WTNFtoIbkCV4MUyC5xfnwK6+s86Os6fuCTxFtW+5R5wEcpx3KMtV
         +1Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWny8kRe5yCnwqVUjWa+HBjiOi3hwkiNIO+sJj1vOCxtvaJwzo4o/Af5+QXvY8u73j9nJm/MwxUcNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyP0oJyEnF3N/rMmKETgFQYbvUHKevIZDf2Jx3wfF4n3Hgbsgxt
	95bStJWbkE+GLClBBb1mTC0cuU6xuWtgVQCNNTdJYEwOvTHneK8vzmxaelCrFeLceQ==
X-Gm-Gg: ATEYQzwfPRDGYzq8DF3Vnlg8Y7D6GpARxFDjGW3mQIWWv5D8C5xKKoC0GbvhuTY1lbB
	2ONdlLapx2FaerK3ld6bjmN6DVXjG2oIzU0vbDe/iocD3HNEAt9CElU1/PQmVcGVQpLZXtVSG5k
	kBOXO2+7s1TvqKdCmLJl4sP2xLUhKQPhWLxStpca4mgPLG+SewIa7xx5IevBzWdug0eML7jhhxx
	Y6dCU9kflVGTp/1jxPzpoZca9LWORbBScT8F2B/CkvWU2E3STNrYRVbODhmRR1RdthnE4Lu3Kut
	n0hpyCZc7dYTZ/usEBiER6WE0yGiGPPcwpky5jRiiVSehvtaEvJwiUCZ8uHgLy7a3/XDaln2/AE
	gfTUnTiIbwJkDgpyDdFQRhA/k0PQgH5o6yKZU2sSOaxOXQp394Ycn13iFZM4Pb9pvkVOBFltf1X
	qWHvO9+iq6teUlwOsRFFdaHqdwNEcWG73edBtNQZRS+jaz3UOSEa9NcbZiOIN5s0BuZk3nGwad5
	ZmLuRLbi4UTmlk=
X-Received: by 2002:a05:600c:3b95:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48727d59448mr247106405e9.4.1774950430786;
        Tue, 31 Mar 2026 02:47:10 -0700 (PDT)
Message-ID: <10e688af-3134-45d1-a8f5-f1f1efb3094e@suse.com>
Date: Tue, 31 Mar 2026 11:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/mm: improve freeing of partially scrubbed pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260330150119.10546-1-roger.pau@citrix.com>
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
In-Reply-To: <20260330150119.10546-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1774950431-F1EE3726-D940C099/0/0
X-purgate-type: clean
X-purgate-size: 3323
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 81C523674F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 17:01, Roger Pau Monne wrote:
> When freeing possibly partially scrubbed pages in populate_physmap() and
> domain_pending_scrub_free() the whole page is marked as dirty, but that's
> not fully accurate.  Since the PGC_need_scrub bit is preserved for the
> populate_physmap() allocation we can use those when freeing to detect which
> pages need scrubbing instead of marking the whole page as dirty.
> 
> This requires exposing free_heap_pages() globally, and switching
> populate_physmap() and domain_pending_scrub_free() to use it instead of
> free_domheap_pages().
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

This is okay as is, i.e.:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, a few remarks below.

> ---
>  xen/common/domain.c     |  4 +++-
>  xen/common/memory.c     |  8 +++++---
>  xen/common/page_alloc.c | 16 +++++++++++++---
>  xen/common/page_alloc.h | 14 ++++++++++++++
>  4 files changed, 35 insertions(+), 7 deletions(-)
>  create mode 100644 xen/common/page_alloc.h

I'm on the edge of requesting page-alloc.h as the name here. I can see though
how the name you picked better fits page_alloc.c.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1529,13 +1529,13 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>  static void free_color_heap_page(struct page_info *pg, bool need_scrub);
>  
>  /* Free 2^@order set of pages. */
> -static void free_heap_pages(
> -    struct page_info *pg, unsigned int order, bool need_scrub)
> +void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub)
>  {
>      unsigned long mask;
>      mfn_t mfn = page_to_mfn(pg);
>      unsigned int i, node = mfn_to_nid(mfn);
>      unsigned int zone = page_to_zone(pg);
> +    unsigned int first_dirty = INVALID_DIRTY_IDX, dirty_cnt = 0;
>      bool pg_offlined = false;
>  
>      ASSERT(order <= MAX_ORDER);
> @@ -1552,6 +1552,13 @@ static void free_heap_pages(
>              pg[i].count_info |= PGC_need_scrub;
>              poison_one_page(&pg[i]);
>          }
> +        else if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
> +        {
> +            /* The caller might have returned pages pending scrub. */
> +            if ( first_dirty == INVALID_DIRTY_IDX )
> +                first_dirty = i;
> +            dirty_cnt++;
> +        }

Would we perhaps want another "else" here, invoking check_one_page()?

> --- /dev/null
> +++ b/xen/common/page_alloc.h
> @@ -0,0 +1,14 @@
> +#ifndef PAGE_ALLOC_H
> +#define PAGE_ALLOC_H
> +
> +void free_heap_pages(struct page_info *pg, unsigned int order, bool need_scrub);
> +
> +/* Free an allocation, and zero the pointer to it. */
> +#define FREE_HEAP_PAGES(p, o, s) do { \
> +    void *_ptr_ = (p);                \
> +    (p) = NULL;                       \
> +    free_heap_pages(_ptr_, o, s);     \
> +} while ( false )
> +#define FREE_HEAP_PAGE(p, s) FREE_HEAP_PAGES(p, 0, s)

I'm not quite sure whether in this case we need the order-0 shorthand. I'm
inclined to think that either we want to go further:

#define FREE_HEAP_PAGE(p) FREE_HEAP_PAGES(p, 0, true)

Or that we want to omit the shorthand, until a clear need appears.

Jan

