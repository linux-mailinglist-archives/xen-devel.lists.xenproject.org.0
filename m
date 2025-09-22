Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83805B93428
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 22:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128018.1468516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0nR1-0003QB-Aa; Mon, 22 Sep 2025 20:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128018.1468516; Mon, 22 Sep 2025 20:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0nR1-0003Ng-76; Mon, 22 Sep 2025 20:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1128018;
 Mon, 22 Sep 2025 20:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0nQz-0003Na-TF
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 20:46:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40ad501d-97f5-11f0-9d14-b5c5bf9af7f9;
 Mon, 22 Sep 2025 22:46:45 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3fc36b99e92so1007159f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 13:46:45 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77ecd17bddbsm9892556b3a.46.2025.09.22.13.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 13:46:44 -0700 (PDT)
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
X-Inumbo-ID: 40ad501d-97f5-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758574005; x=1759178805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMAuhS4M5Wh9tEZvNK3xTc2/DAJwSlJkAM9Ci9B42Xs=;
        b=T4cV+YrtObrCVQf/ScoD/ra0w5wZTA2X1X+/YT7NjuBnucnhO6tfcqEZlRETEE6Sp/
         8JutjN26jJ/1Q95UGB6gf0mVXwJhtPTSqDZRC5Kl8jGD5wJVwiXNt7O9QYSH4GrQe/gu
         5bswABxSJOrjZITonWUpIJRszNrlHmHFiztqdf2Jb6GDyYzL22T6+J7VNfhsdOL3JBBm
         hwjU8eCU+XKqKVsOoPljK5VAgX1fgz5zDBbyBT9M1x1wgCrFB+p9EEu3ms1QfcfleJnv
         eOil/YoIDVC5/iRR2Vc6G92I/O2hvatz72TVFDnDt3FvoENyr1I8RAKSuOaYrnOVRx2O
         Zagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758574005; x=1759178805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RMAuhS4M5Wh9tEZvNK3xTc2/DAJwSlJkAM9Ci9B42Xs=;
        b=Ddi+mXUpLrskIB7dZcVA7jLp9/PBnrQqgtTS6rv8XRGIXrjeOFr3K0pWCEKkvHwUcS
         vrRrY/vBbdoRqMnxpEqm/cyv3p6LR0ZVw+1wFt7lKJzNOc/7ECmz5mbIQqo8tKWseVxC
         kflpRwIOIIBEftAQ4+8XD2ZHih6OasAXOyVNKtFGfEFgCvBA4qndxYFN312hLgHHAmCw
         3UTBRKtgcC/AQ7D0JpHgHpaWmaIQEzeh5EzVeh1qrWtsJ1FBObtDbfK3iEOVvGu6b0nC
         d5cW15aP10Eu90wxD229x378NrKjW7T8PNibcBx3kBAvjj2TJx1qI/KxmgudS8udEklH
         TTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvmOj0vTuYdI/D25eKRKSeeQZf5ECcWLxuk1euJ5MN0hBGAtu0iK3GQ61OwMXLb+wfelZNfobR5AU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAeh+ETLeeUGFi5rFy32oKT8lIj4/UxJE+3Ye2hE65xDIQ54Ti
	V23sCKA9MvjAGaLaYfGP0D1FqHr2V4nkORIX1UTTp4to7b9iJ56QLrjfBVzS2/Xffw==
X-Gm-Gg: ASbGncvz7SriZYJ66LwwzthkQm6dG/aBYDN43KIfjusb0C2V1oXjEqLVdLE01Mhogso
	W3nriE1MTanF2euRq85lNtFRz/b/GML6+LyWU3v0eVyjfx1zHYjABlg+lWzbOAQQPrPP8TM4rd6
	nbutVHNaXn/j5eSh5FhtoXvdJCI002K46TE2sf2p+ZVqmWz5fknNraRYBK//CDbdh+ChG+YD1pO
	efTCVaKGUikNgGX7Gise2izteK0mJhRqZekxDBmZl0kOw/OEtzgnmNitsNKdGtcOer4FxJDm+Wl
	NqFXAd3ubDmvXjTZZ/BkHCM7df5j3dtdJp3nb5eZWv4O4y7DwCob59AN+r1u61ISm5tpuKpNQaJ
	VVBucDxcTZtektDudkKyDdH0Ncdqvy7TR
X-Google-Smtp-Source: AGHT+IGsviZaYA6TnQq91jrrbiJfIJTxLJhofAoWtN/Ukup8rsD0Okg2tml2CZ97Mc8282hlvHhgSQ==
X-Received: by 2002:a05:6000:18a5:b0:3ec:42f9:953e with SMTP id ffacd0b85a97d-405cb1fbf3fmr60343f8f.7.1758574005094;
        Mon, 22 Sep 2025 13:46:45 -0700 (PDT)
Message-ID: <854ff53f-5af0-43bf-83b0-8e1e1e0deefc@suse.com>
Date: Mon, 22 Sep 2025 22:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/18] xen/riscv: add support of page lookup by GFN
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <5065d9f1552fd940cc19087d8e00a0fa3519e66c.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5065d9f1552fd940cc19087d8e00a0fa3519e66c.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -978,3 +978,189 @@ int map_regions_p2mt(struct domain *d,
>  
>      return rc;
>  }
> +
> +

Nit: No double blank lines please.

> +/*
> + * p2m_get_entry() should always return the correct order value, even if an
> + * entry is not present (i.e. the GFN is outside the range):
> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]).    (1)
> + *
> + * This ensures that callers of p2m_get_entry() can determine what range of
> + * address space would be altered by a corresponding p2m_set_entry().
> + * Also, it would help to avoid cost page walks for GFNs outside range (1).
> + *
> + * Therefore, this function returns true for GFNs outside range (1), and in
> + * that case the corresponding level is returned via the level_out argument.
> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
> + * find the proper entry.
> + */
> +static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
> +                                   unsigned int *level_out)
> +{
> +    unsigned int level;
> +
> +    if ( (is_lower && gfn_x(gfn) < gfn_x(boundary)) ||
> +         (!is_lower && gfn_x(gfn) > gfn_x(boundary)) )

I understand people write things this way, but personally I find it confusing
to read. Why not simply use a conditional operator here (and again below):

    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
                  : gfn_x(gfn) > gfn_x(boundary) )

> +    {
> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
> +        {
> +            unsigned long mask = PFN_DOWN(P2M_LEVEL_MASK(level));

Don't you need to accumulate the mask to use across loop iterations here
(or calculate it accordingly)? Else ...

> +            if ( (is_lower && ((gfn_x(gfn) & mask) < gfn_x(boundary))) ||
> +                 (!is_lower && ((gfn_x(gfn) & mask) > gfn_x(boundary))) )

... here you'll compare some middle part of the original GFN against the
boundary.

> +            {
> +                *level_out = level;
> +                return true;
> +            }
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +/*
> + * Get the details of a given gfn.
> + *
> + * If the entry is present, the associated MFN will be returned and the
> + * p2m type of the mapping.
> + * The page_order will correspond to the order of the mapping in the page
> + * table (i.e it could be a superpage).
> + *
> + * If the entry is not present, INVALID_MFN will be returned and the
> + * page_order will be set according to the order of the invalid range.
> + *
> + * valid will contain the value of bit[0] (e.g valid bit) of the
> + * entry.
> + */
> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
> +                           p2m_type_t *t,
> +                           unsigned int *page_order,
> +                           bool *valid)
> +{
> +    unsigned int level = 0;
> +    pte_t entry, *table;
> +    int rc;
> +    mfn_t mfn = INVALID_MFN;
> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
> +
> +    ASSERT(p2m_is_locked(p2m));
> +
> +    if ( valid )
> +        *valid = false;

Wouldn't you better similarly set *t to some "default" value?

> +    if ( check_outside_boundary(gfn, p2m->lowest_mapped_gfn, true, &level) )
> +        goto out;
> +
> +    if ( check_outside_boundary(gfn, p2m->max_mapped_gfn, false, &level) )
> +        goto out;
> +
> +    table = p2m_get_root_pointer(p2m, gfn);
> +
> +    /*
> +     * The table should always be non-NULL because the gfn is below
> +     * p2m->max_mapped_gfn and the root table pages are always present.
> +     */
> +    if ( !table )
> +    {
> +        ASSERT_UNREACHABLE();
> +        level = P2M_ROOT_LEVEL;
> +        goto out;
> +    }
> +
> +    for ( level = P2M_ROOT_LEVEL; level; level-- )
> +    {
> +        rc = p2m_next_level(p2m, false, level, &table, offsets[level]);
> +        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
> +            goto out_unmap;

Getting back P2M_TABLE_MAP_NOMEM here is a bug, not really a loop exit
condition.

> +        if ( rc != P2M_TABLE_NORMAL )
> +            break;
> +    }
> +
> +    entry = table[offsets[level]];
> +
> +    if ( pte_is_valid(entry) )
> +    {
> +        if ( t )
> +            *t = p2m_get_type(entry);
> +
> +        mfn = pte_get_mfn(entry);
> +        /*
> +         * The entry may point to a superpage. Find the MFN associated
> +         * to the GFN.
> +         */
> +        mfn = mfn_add(mfn,
> +                      gfn_x(gfn) & (BIT(P2M_LEVEL_ORDER(level), UL) - 1));

May want to assert that the respective bits of "mfn" are actually clear
before this calculation.

> +        if ( valid )
> +            *valid = pte_is_valid(entry);
> +    }
> +
> + out_unmap:
> +    unmap_domain_page(table);
> +
> + out:
> +    if ( page_order )
> +        *page_order = P2M_LEVEL_ORDER(level);
> +
> +    return mfn;
> +}
> +
> +static mfn_t p2m_lookup(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t)
> +{
> +    mfn_t mfn;
> +
> +    p2m_read_lock(p2m);
> +    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);

Seeing the two NULLs here I wonder: What use is the "valid" parameter of that
function? And what use is the function here when it doesn't also return the
order? IOW I'm not sure having this helper is actually worthwhile. This is
even more so that ...

> +    p2m_read_unlock(p2m);
> +
> +    return mfn;
> +}
> +
> +struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
> +                                        p2m_type_t *t)
> +{
> +    struct page_info *page;
> +    p2m_type_t p2mt = p2m_invalid;
> +    mfn_t mfn;
> +
> +    p2m_read_lock(p2m);
> +    mfn = p2m_lookup(p2m, gfn, t);

... there's a locking problem here: You cannot acquire a read lock in a
nested fashion - that's a recipe for a deadlock when between the first
acquire and the 2nd acquire attempt another CPU tries to acquire the
lock for writing (which will result in no further readers being allowed
in). It wasn't all that long ago that in the security team we actually
audited the code base for the absence of such a pattern.

Jan

