Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JE3uA7XqHmo5ZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 16:37:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B74762F587
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 16:37:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EvZLKi7f;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325093.1590629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQEq-0000Cb-I9; Tue, 02 Jun 2026 14:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325093.1590629; Tue, 02 Jun 2026 14:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQEq-00009u-F8; Tue, 02 Jun 2026 14:37:04 +0000
Received: by outflank-mailman (input) for mailman id 1325093;
 Tue, 02 Jun 2026 14:37:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUQEp-00009o-Hk
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:37:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQEn-008Xvj-HT
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:37:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eea8a-5cb7-0a2a0a5109dd-0a2a4506c140-10
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:37:01 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eea8d-7371-0a2a45060019-d155802ab975-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:37:01 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4906238c62eso94253015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:37:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490aeab0955sm76839785e9.4.2026.06.02.07.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 07:36:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1780411021; x=1781015821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rPkseIp6XhRw0nvU6s0JQbVNOrkebrIAwRMZFGphGi8=;
        b=EvZLKi7fjiz7H9dmnKkJtaYpBIeYzAqb+Whj5n0WbjicL6hGU1CihvRgBRcdb1Uj3d
         vLWXh2P+3KufeALmS2IS46XtKobNsFGKGaT2v49A02Rn2KCpL4zsX/QQq2FAHrYNYI32
         7otTuHK0B4+p3y3WPek6fdZaUn6IFAJ1KzDCg+0caCenqBZOAvS2LQHGW05YFEKBkFGj
         8HBRiQy5LyXHQLF7wWxTx3m3BTA5gxs0UxGqFfG7Meng+5lP6JDWQLiXeYrvREnw3z8p
         pikOgOmipp4/ui4QLpnOdaa1JtIxtW/NP3Mi4WtA/XSJn0AAQS6BpQ2OpdWWTW8Y+y8C
         3hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780411021; x=1781015821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPkseIp6XhRw0nvU6s0JQbVNOrkebrIAwRMZFGphGi8=;
        b=lK0DXCVrFmcP9DXaVsMaqQIWInhI7gVImfkXTG1+j3tMoFuPSJZb/Yxkm823jbCAJ9
         2RqFb+cGnmxIK/86OhXDGPLLdXl4HfepzT9Lw3NxgOGY5iLk+hNXCnMYfV4RzQx/nh39
         Nq/x0esdMqnPgrb7GQHcjhhYGpL2sN6R8EU0Ss5W40R3a4F/1KAoTtqZzQ2WTSyNjk3t
         sAKYpGdrQR5oi1BfjklEoTTPuZopK4OKm/EeJI2PJrEcsh4kjguQcLRja0FRGiKM0NJz
         CTEorck2oVwIHjFkv1375k7qjzyghEgvpnOSLyMACwRAn57fA6sjtfNZLXtKs/2vAcx4
         3gSw==
X-Forwarded-Encrypted: i=1; AFNElJ9oKMkI3G/WNj/yFVWkkwhhzke+nkxr7kGUXtPvcCc6WAncwQkFrGn/Id7E1NT1N6C/khvXMnyDReg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKK4s5SkepZOdK0zDYjS2ljh9bqk5af8PNBV6Itg1RQCpAHYre
	53n6ueNh9pCh2cyF2cSxxx8Xtor3lulmww8cQxi0eZj6XXi7v6UmMgZTj8WZEB2LuQ==
X-Gm-Gg: Acq92OGd47MEWOyvLVDPV9GrCVM5+3gDEhHJ6UR1mTmgrMWhkdKh9fbFnODaTeGpuEv
	MII22mGnQYcaUMhDdXd7YGmcQtDTYsy7rqAuT41UVmQLX34IU2ji8rR4ZgmozrI49nr3R0Z3DsV
	YfJfrFUVxUKKsPJUtYt4g7VSxpLteocp0uRk7mjCDjHoogMVVzuh3EjccdV9q0/OGDzSpRQx4bS
	G7ICcygvDYNjdKaJHWvukMkf9VNiIo2lukfmkQ9WxGQRcfVwjm4FhN6UId2roGAq/Teo2MMdA0o
	9etLFcu8Qou2eBgMy27+kN2eugLX4zLi+m/Aq66XajgcUVCk/VSAFeG8A3cfCt2LnjNzV82z8rg
	D0VofvFCHkx1kqPtbmy5v0Z/9ZFW0/HYPfhMffnGebiXW+YellZ/STo5r9ry1vIHSIHQISY8xDz
	Ri03jzrYHOF5ObdyoP3DoZ7ikB+cSZ1ut+ytanITR4AwGgANv4vjcsJu8+RklV40KXSGqskavrd
	cl8e6i+wQEc4bxoywBAaZGOrJa4pKb93tzY
X-Received: by 2002:a05:600c:630e:b0:490:a2fd:e1e5 with SMTP id 5b1f17b1804b1-490a2fde21dmr291740185e9.17.1780411020426;
        Tue, 02 Jun 2026 07:37:00 -0700 (PDT)
Message-ID: <017fd1f2-d00b-45a8-b36f-945a0f42a85b@suse.com>
Date: Tue, 2 Jun 2026 16:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: Fix offlining pages only make aligned
 buddies, fixes Xen crash
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779979589.git.bernhard.kaindl@citrix.com>
 <cdaec995676e17f0943cb921eb5ad9f87b96526c.1779979589.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <cdaec995676e17f0943cb921eb5ad9f87b96526c.1779979589.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780411021-8D785D75-61AFF722/0/0
X-purgate-type: clean
X-purgate-size: 8548
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
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 3B74762F587

On 28.05.2026 16:47, Bernhard Kaindl wrote:
> reserve_offline_pages() is missing an alignment check and thus
> has a relatively high probability of growing unaligned buddies.
> 
> Fix this by checking alignment before growing spans to the next order.
> Update the test case to verify the fix and prevent future regressions.
> 
> Fixes: e4865c2315 ('Page offline support in Xen side')
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>  tools/tests/native/offline-unaligned.c | 92 --------------------------
>  xen/common/page_alloc.c                |  5 ++
>  2 files changed, 5 insertions(+), 92 deletions(-)

As we will want to backport the bugfix (without the test), and as it makes
little sense ...

> --- a/tools/tests/native/offline-unaligned.c
> +++ b/tools/tests/native/offline-unaligned.c
> @@ -17,38 +17,6 @@
>   *
>   * Copyright (C) 2026 Cloud Software Group
>   */
> -#include "harness/common.h"
> -
> -/* test_bss_start must be first in the BSS segment */
> -void __aligned(PAGE_SIZE) *test_bss_start;
> -
> -/* Include xen/mm.h so we can wrap page_list_del() to assert the corruption. */
> -#define TEST_WRAP_XEN_INCLUDE_XEN_MM_H
> -#include "harness/mm-wrapper.h"
> -
> -static bool expect_free_list_corruption;
> -
> -/*
> - * Wrap page_list_del() to not fail the test by virtue of the prepared
> - * free list state but continue the test like a running Xen instance
> - * would in many cases. Assert and expect the corruption, and continue.
> - */
> -static inline void wrap_page_list_del(struct page_info *page,
> -                                      struct page_list_head *head)
> -{
> -    printf("page_list_del: page MFN %lu, order %u\n",
> -           mfn_x(page_to_mfn(page)), PFN_ORDER(page));
> -
> -    if ( expect_free_list_corruption )
> -        EXPECT_FAIL_BEGIN();
> -    CHECK(page->list.next && page->list.prev, "The free list is corrupt now!");
> -    if ( expect_free_list_corruption )
> -        EXPECT_FAIL_END(1);
> -
> -    if ( page->list.next && page->list.prev )
> -        page_list_del(page, head);
> -}
> -#define page_list_del(page, head) wrap_page_list_del(page, head)
>  
>  /*
>   * Include the main test library that sets up scenarios, asserts
> @@ -84,78 +52,18 @@ static void test_unaligned_buddy_merge(int start_mfn)
>       * | offlined page | single page     |    head page with a tail page    |
>       * +---------------+-----------------+-----------------+----------------+
>       */
> -    EXPECT_FAIL_BEGIN();
> -    /*
> -     * Due to a bug in reserve_offlined_page(), we get an unaligned buddy:
> -     * +---------------+-----------------+-----------------+----------------+
> -     * | offlined page |     head page with a tail page    | single page    |
> -     * +---------------+-----------------+-----------------+----------------+
> -     */
>      CHECK(page_aligned(pg + 1), "The buddy #%lu is not aligned to order-%d",
>            mfn_x(page_to_mfn(pg + 1)), PFN_ORDER(pg + 1));
> -    EXPECT_FAIL_END(1);
>  
>      /* Allocate and free a page to trigger buddy merging on free. */
> -
> -    /*
> -     * After allocating and freeing MFN 7, we get a double-freed MFN 6 due
> -     * to aligned predecessor merging in free_heap_pages():
> -     *
> -     *         MFN 4             MFN 5             MFN 6            MFN 7
> -     *   +---------------+-----------------+-----------------+
> -     *   | offlined page |    head page         tail page    |
> -     *   |               |       Unaligned buddies are       |
> -     *   |               |      an invariant violation!      |
> -     *   +---------------+-----------------+-----------------+----------------+
> -     *                                     |    head page        tail page    |
> -     *                                     +-----------------+----------------+
> -     */
> -    expect_free_list_corruption = true;
>      free_domheap_pages(alloc_domheap_pages(dom1, order0, 0), order0);
> -
> -    /*
> -     * At this point, the free list is already corrupt. In free_heap_pages(),
> -     * the tail of the unaligned buddy was added to the free list a 2nd time
> -     * as the page of an overlapping aligned buddy. This is per design of the
> -     * algorithm: These pages are free and thus the merging occurs as expected.
> -     *
> -     * The next allocation allocates the tail of the unaligned buddy, which
> -     * is now, due to the merge, also the head of the new aligned buddy.
> -     */
>      CHECK((pg = alloc_domheap_pages(dom1, order1, 0)), "Alloc the order-1 pg");
>  
>      /* Inspect the predecessor (pg is the tail of the unaligned buddy) */
> -    EXPECT_FAIL_BEGIN();
> -    /*
> -     * After allocating two more pages, MFN 6 is free AND in-use:
> -     *
> -     *         MFN 4             MFN 5             MFN 6            MFN 7
> -     *   +---------------+-----------------+-----------------+
> -     *   | offlined page |    head page         tail page    |
> -     *   +---------------+-----------------+-----------------+----------------+
> -     *                                     |    in-use page      in-use page  |
> -     *                                     +-----------------+----------------+
> -     */
>      CHECK(page_aligned(pg - 1), "The buddy #%lu is not aligned to order-%d!",
>            mfn_x(page_to_mfn(pg - 1)), PFN_ORDER(pg - 1));
> -    EXPECT_FAIL_END(1);
>  
>      /* Allocate the remaining page; a clean heap should not hit BUG(). */
> -    testcase_assert_expect_to_hit_bug = true;
> -    /*
> -     * As described above, if pg is the tail of an unaligned order-1 buddy,
> -     * the unaligned buddy is still on the free list and this allocation will
> -     * remove it from the free list and check alloc_heap_pages() checks the
> -     * buddies to have a reference count of zero, and the already allocated
> -     * page is returned as the tail of the unaligned buddy, causing the BUG().
> -     *
> -     *         MFN 4             MFN 5             MFN 6            MFN 7
> -     *   +---------------+-----------------+-----------------+
> -     *   | offlined page |    head page         tail page    | <- panic's Xen
> -     *   +---------------+-----------------+-----------------+----------------+
> -     *                                     |    in-use page      in-use page  |
> -     *                                     +-----------------+----------------+
> -     */
>      alloc_domheap_pages(dom1, order0, 0); /* Triggers BUG() */
>  }

... to first add a test covering the bad behavior (reporting it as good, by way
of the test succeeding), I think the actual bugfix (below wants to come first,
with the new test then being added to check for correct behavior right away.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1434,6 +1434,11 @@ static int reserve_offlined_page(struct page_info *head)
>              if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
>                  goto merge;
>  
> +            /* Do not grow to next_order if cur_head is not aligned to it. */
> +            if ( (mfn_x(page_to_mfn(cur_head)) & ((1UL << next_order) - 1)) )
> +                goto merge;

With this isolated, with the title changed to something which can be parsed
and doesn't duplicate "fix" as a word, and with the excess parentheses removed
from the if()'s expression:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, I'd like to suggest a possible simplification: Inductively we know
that cur_head is aligned to cur_order. Since next_order == cur_order + 1

            if ( mfn_x(page_to_mfn(cur_head)) & (1UL << cur_order) )
                goto merge;

ought to suffice? Of course if desired this could be written more explicitly
as

            if ( mfn_x(page_to_mfn(cur_head)) & (1UL << (next_order - 1)) )
                goto merge;

Yet overall I'd be tempted to drop the next_order variable altogether anyway
(not in this patch of course).

> +            /* Check if any page in the next_order range is offlined. */

This isn't quite accurate, as ...

>              for ( i = (1 << cur_order), pg = cur_head + (1 << cur_order );

... we start at 1 << cur_order. I.e. it's only the upper half of the range
covered by next_order which is being checked.

>                    i < (1 << next_order);
>                    i++, pg++ )

Jan

