Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O1cDVAhemmv2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:46:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD0A3103
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 15:46:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215753.1525878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6oA-0001rS-ID; Wed, 28 Jan 2026 14:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215753.1525878; Wed, 28 Jan 2026 14:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl6oA-0001p7-F3; Wed, 28 Jan 2026 14:46:14 +0000
Received: by outflank-mailman (input) for mailman id 1215753;
 Wed, 28 Jan 2026 14:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl6o9-0001p1-IY
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 14:46:13 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 142de2bf-fc58-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 15:46:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso7883245e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 06:46:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806d98c8desm54904405e9.3.2026.01.28.06.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 06:46:06 -0800 (PST)
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
X-Inumbo-ID: 142de2bf-fc58-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769611567; x=1770216367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=02O0egTgYP70cAGC5owFrGcbqetPBwc4uQPJC4dN1K8=;
        b=c1Lmyr2hIS5hg7+6GoSFYm3eQsq1zkOpQukmAP/0CwvCZpElEoUakE+sovyqDg/uHm
         6W/0/JBFrkDV/CgzOLq84Az+sfCAtaLUxTFKg+vmm0aBbTFDX8CMRcnZ7hbfEGS6jiLV
         PDS/RdD6JntwdSR4RPzXNtrh9RqGYTpQT8UqKNlmt/TyP/YQFA1eEB37HWpiiiERTq4T
         /FTjRpUxghbwCTvJxhmZQe7tXpcEWI9lvhd1qRHNAn2fY0CNZ9/N4ikxXxPUvQw9mGtR
         PeaKu9vW/QuDDZtrAkDRc2DvMvLIBkSPGUxh77V52Scq567fwMfhuScpUcQ7nsV+j+7r
         ++3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611567; x=1770216367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02O0egTgYP70cAGC5owFrGcbqetPBwc4uQPJC4dN1K8=;
        b=HNvjFY/XP05CZ0cJbsw7zC1IO6p/WCYPENkwz2fsDmTyPaGxt5Nk5Tbyv5CaAGBUuj
         ScPfWEvPPmeouPtQDuARBPZ4Z9oYhbw08RYHQ1zKHo/djbUnF3Oo9jt69U1i0cIBt+aN
         ssUZpCcZk4nXxs9C0DB8KyCrQ2csgFwYaH1yyBHZOJrxYYPm3xtDLs7x15RP2VkNhoDD
         pnA0/b4uTGAtyErwA5K2f9xledkSRVrtmdgitcDmuixOMM5FYoCkSiJCyE7r8+mjPOiP
         LEJlh+MDq4z2QP29dGNZkdUh43uvhn5l4y9NPHw2+kKUHEuJzu7nn6r3gd8jx4vgz4n5
         MFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxFl39p9JVA7ZKJfP42na8dPIEwQ3huPqNzIBuHhqdAbuYzKBvqayqh9VwchBWpHfk28sIqdMda5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMBrSfbb8jUH6DBOSGvQNk1q7wQoPs7HfWSi2nPC+DUB4WO1Zc
	MENnnRSn23mLCIG+dAsvAXmPit9oVF2vfzWVnvoxc10NGXyEYEoEOSSEwuwZUpjC4Q==
X-Gm-Gg: AZuq6aLaYWBUZ3HfAkcyB1iFNusswMRvIbkNabSvxq7bpEvAPMQfXCbfJCakgWz30wr
	Uts88/efFEOBzAEAsivp708GD7vCiP7wkk+zas2gLkL7vB5Xvtq15XMECQKoUhlku7Samomc4zE
	/wTpoZiZ8GfBPyRBxb5uaEr7eot+dRMgvtjfqH5W4+LzA+cf7IRDO87NiiFJ0IYOL/vSrcRW/2O
	5sjcpqyl9+VqGz8v7CS9xcaPU/jVeFnFTfPfGn59PU5z81nzp7RxFoqBvw8u4dxb8RlzjJwS7fj
	5EhCvkmkAhEkAtkKMvY5UZeAn0hQNwzmPscUexfBxOKrwl0vf6wYw7tahnjFOSn64OW3OkCJgDX
	ftnEUSbz4Mdl1Z/AhdAy+ZT3WUlWV6um9VP+inQbfrP+MQwNrTShuBGkqk37U+opzuUYgypD6jo
	sVRl0FH2l0aTb4Sf1KWPnrtj/s8aoUWN8i/Ezz63XEcRjbQia1XeyBqGvM7aUM0pNXy1DOfwOLz
	7A=
X-Received: by 2002:a05:600c:450b:b0:480:1e9e:f9d with SMTP id 5b1f17b1804b1-48069c0e151mr61674515e9.8.1769611566980;
        Wed, 28 Jan 2026 06:46:06 -0800 (PST)
Message-ID: <6d7b74b6-1bab-427d-aa14-321f4761d9a0@suse.com>
Date: Wed, 28 Jan 2026 15:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
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
In-Reply-To: <20260128120339.47373-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 76CD0A3103
X-Rspamd-Action: no action

On 28.01.2026 13:03, Roger Pau Monne wrote:
> @@ -275,7 +339,18 @@ static void populate_physmap(struct memop_args *a)
>              }
>              else
>              {
> -                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
> +                unsigned int scrub_start = 0;
> +                nodeid_t node =
> +                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
> +                                                    : NUMA_NO_NODE;
> +
> +                page = get_stashed_allocation(d, a->extent_order, node,
> +                                              &scrub_start);
> +
> +                if ( !page )
> +                    page = alloc_domheap_pages(d, a->extent_order,
> +                        a->memflags | (d->creation_finished ? 0
> +                                                            : MEMF_no_scrub));

I fear there's a more basic issue here that so far we didn't pay attention to:
alloc_domheap_pages() is what invokes assign_page(), which in turn resets
->count_info for each of the pages. This reset includes setting PGC_allocated,
which ...

> @@ -286,6 +361,30 @@ static void populate_physmap(struct memop_args *a)
>                      goto out;
>                  }
>  
> +                if ( !d->creation_finished )
> +                {
> +                    unsigned int dirty_cnt = 0;
> +
> +                    /* Check if there's anything to scrub. */
> +                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
> +                    {
> +                        if ( !test_and_clear_bit(_PGC_need_scrub,
> +                                                 &page[j].count_info) )
> +                            continue;

... means we will now scrub every page in the block, not just those which weren't
scrubbed yet, and we end up clearing PGC_allocated. All because of PGC_need_scrub
aliasing PGC_allocated. I wonder how this didn't end up screwing any testing you
surely will have done. Or maybe I'm completely off here?

Jan

