Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99CB4657B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 23:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112435.1460697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uudvu-0006UE-DG; Fri, 05 Sep 2025 21:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112435.1460697; Fri, 05 Sep 2025 21:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uudvu-0006Rc-A3; Fri, 05 Sep 2025 21:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1112435;
 Fri, 05 Sep 2025 21:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfYY=3Q=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uudvs-0006RV-DV
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 21:25:20 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ac37b3-8a9e-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 23:25:19 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3d1bf79d758so2351838f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Sep 2025 14:25:19 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34494776sm32541561f8f.61.2025.09.05.14.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 14:25:18 -0700 (PDT)
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
X-Inumbo-ID: d2ac37b3-8a9e-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757107519; x=1757712319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7tDA6jdB85mRys2PmAwe8qXmmWoioadjWK0AoRRit0=;
        b=oNucCXJk+jpPXFJAJfppykWH8QHP2ev67CC1pK7q39NYHfTuwx9epfuGZKrtLZ0H3w
         fEE+MDwc0GxgZeUgqhdKDCFmBB+7DBKiComZQ07RouI7GhqxSmg/vOpaFx6/2qWgu258
         oLXyXGuV8+ooedafK5rn8DUGMeT+dmjI5NVAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757107519; x=1757712319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7tDA6jdB85mRys2PmAwe8qXmmWoioadjWK0AoRRit0=;
        b=MvBkyyV30BwpO8w1stpwkqNDLQxZ+DmEOeSgnt5U1rVn1EQZvn4g56bGWNXkffJWZb
         jaHbesnpyDjUjcyF1QUbnuZ761gP9HoQQkYXe9rYZrOzVAzXSVHDgzFCmivQCScx20gO
         0juoQagf7t1js8VomzuHUS+8P+i2vbEeJom3Npc1jUrRw3p21YH8BkQYSPVSqw5MQSC4
         ZhKfoUxb/f/tjAEQ2iT/aUzHzZlv5/VgM0IVYUilBfo8d/DF9w+eZgIQBOhsK6tzGLuz
         KCoHrtoBGQoDudxDw1/dFVNhHtkAKlvnqmWDvMTCRRLCRn5uvcV7UcD6hn5uNFGlInlf
         2P6w==
X-Forwarded-Encrypted: i=1; AJvYcCVkXtw0j5+WK7omvZC8CES4a+Dhs8z0WeNzGdyXKkfhZsPzHW/bFYICpd/vCSaaZXGvc2iw2E1kgtM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwwnC5alzqwOPlQW69c5ABk4ZSCPl00w9aD30Yezao3OiagvSk
	dN1sop8J9nw4l5TCZDc9fZARBmVhRI1etmROf3PXqRTeTK+aUBHvYP34D4RBxZHa5B2/WVB2WZn
	5pvPK
X-Gm-Gg: ASbGncvPneCIrpf/coteR3E+QB0dRucnKc1OiuCx1YH3LeP7b1yTZ/qqvSzklNKxVTH
	AABCVlXcXk/WMMqLrSFI8L2jAnuLRhaOByPpKOJpMQ8ocbd5f16kGlUBRg9NJKhirKGYsk9VXSW
	3O5Afs07kO2UP++tRhsusKjkHB4EOAhdWr1mZ2vDaiWu/YHNmFhGtaiGlmpcMHTbVg85Oxj93os
	mVwMO/fe9S9xfnL5dj+6h9SAZ6UI5pxtJVcUXAFP/BXTAdOMDwJ7JrbwiYpfjx9KCan+s7SiVCP
	g2LsCflJL3TlT71ct/OHObUGvBADmROEejEl2B12Vm/8MPJ79I6MNSJXtydsm103jrfYkeUyrmd
	ue1lehW5zzEDgxck01dyvER2iEOigO7G/RGxl1Lyl8fsHeJZexWsu+TmcqlDNRrz2Ekc0fhZ7xI
	646mw=
X-Google-Smtp-Source: AGHT+IETsDPwbjWyiR1GwCNEk2ci6jKKbex9Wfx/K7iZRWIFftkOuAx9tyqLHfGK/Lt8ubwxExd1vg==
X-Received: by 2002:a05:6000:26c6:b0:3c9:fc3c:3aa3 with SMTP id ffacd0b85a97d-3e64625776amr20662f8f.40.1757107518713;
        Fri, 05 Sep 2025 14:25:18 -0700 (PDT)
Message-ID: <f638c7c3-be68-4e17-812a-c0994f6b5be0@citrix.com>
Date: Fri, 5 Sep 2025 22:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/libs: Use superpages where possible on
 migrate/resume
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250902105625.28552-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250902105625.28552-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2025 11:56 am, Frediano Ziglio wrote:
> Try to allocate larger order pages.
> With some test memory program stressing TLB (many small random
> memory accesses) you can get 15% performance improves.
> On the first memory iteration the sender is currently sending
> memory in 4mb aligned chunks which allows the receiver to
> allocate most pages as 2mb superpages instead of single 4kb pages.
> This works even for HVM where the first 2mb contains some holes.
> This change does not handle 1gb superpages as this will require
> change in the protocol to preallocate space.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

This was given a release ack, which should have been retained.

> ---
> Changes since v1:
> - updated commit message and subject;
> - change the implementation detecting possible 2mb pages inside
>   the packet sent allowing more 2mb superpages.
> ---
>  tools/libs/guest/xg_sr_restore.c | 77 ++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>
> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
> index 06231ca826..f2018299a7 100644
> --- a/tools/libs/guest/xg_sr_restore.c
> +++ b/tools/libs/guest/xg_sr_restore.c
> @@ -129,6 +129,80 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
>      return 0;
>  }
>  
> +#if defined(__i386__) || defined(__x86_64__)
> +/* Order of the smallest superpage */
> +#define SMALL_SUPERPAGE_ORDER 9
> +#else
> +#error Define SMALL_SUPERPAGE_ORDER for this platform
> +#endif
> +
> +static unsigned int populate_order(struct xc_sr_context *ctx,
> +                                   unsigned int original_count,
> +                                   xen_pfn_t *pfns, xen_pfn_t *mfns,
> +                                   int order)
> +{
> +    size_t i = original_count, num_superpages;
> +    xen_pfn_t prev = 0, order_mask = ~((~(xen_pfn_t)0) << order);
> +    xen_pfn_t *const indexes_end = mfns + original_count;
> +    xen_pfn_t *indexes = indexes_end;
> +    unsigned int count = 0;
> +
> +    while ( i > 0 )
> +    {
> +        --i;
> +        ++count;
> +        if ( pfns[i] != prev - 1 )
> +            count = 1;
> +
> +        /*
> +         * Is this the start of a contiguous and aligned number
> +         * of pages ?
> +         */
> +        if ( (pfns[i] & order_mask) == 0 && count > order_mask )
> +            *--indexes = i;

Consider receiving a PAGE_DATA packet formed of {some 4k, 2M, more 4k},
which can occur from the 2nd pass onwards.

You do not know that the mfn at the end of the input list was part of a
superpage, and therefore safe to clobber.

I expect this works in practice because the first pass is always
aligned, and subsequent passes are astronomically unlikely to have a
full 2M be dirty.

> +
> +        prev = pfns[i];
> +    }
> +
> +    count = original_count;
> +
> +    /* No superpages found */
> +    if ( indexes == indexes_end )
> +        return count;
> +    num_superpages = indexes_end - indexes;
> +
> +    /* Build list of PFNs that will be updated with MFNs */
> +    mfns = indexes - num_superpages;
> +    for ( i = 0; i < num_superpages; ++i )
> +        mfns[i] = pfns[indexes[i]];
> +
> +    /* Try to allocate, fallback to single pages */
> +    if ( xc_domain_populate_physmap_exact(
> +         ctx->xch, ctx->domid, num_superpages, order, 0, mfns) )
> +        return count;
> +
> +    /* Scan all MFNs allocated */
> +    for ( i = 0; i < num_superpages; ++i )
> +    {
> +        const xen_pfn_t mfn = mfns[i];
> +        const xen_pfn_t pfn = pfns[indexes[i]];
> +
> +        /* Check valid */
> +        if ( mfn == INVALID_MFN )
> +            continue;
> +
> +        /* Update PFNs using callback */
> +        for ( size_t j = 0; j <= order_mask; ++j )
> +            ctx->restore.ops.set_gfn(ctx, pfn + j, mfn + j);
> +
> +        /* remove from 4kb pages list */
> +        count -= order_mask + 1;
> +        memmove(pfns + indexes[i], pfns + indexes[i] + order_mask + 1,
> +                sizeof(*pfns) * (count - indexes[i]));

This in particular is horrible to follow, and is double processing the
data that ...

> +    }
> +    return count;
> +}
> +
>  /*
>   * Given a set of pfns, obtain memory from Xen to fill the physmap for the
>   * unpopulated subset.  If types is NULL, no page type checking is performed
> @@ -163,6 +237,9 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,

... was set up just up here.

Have this loop scan forwards to pick out superpages, and deal with them
without putting them into the 4k list.  Don't even worry about trying to
collapse 2 hypercalls into 1; that's a marginal optimisation and the
flamegraphs showed that these hypercalls didn't even register compared
to the other overheads.

It will be a simpler patch, and easier to follow.

~Andrew

