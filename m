Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE76B555C9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 20:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122422.1466121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux85L-0003zm-Cf; Fri, 12 Sep 2025 18:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122422.1466121; Fri, 12 Sep 2025 18:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux85L-0003wb-9T; Fri, 12 Sep 2025 18:01:23 +0000
Received: by outflank-mailman (input) for mailman id 1122422;
 Fri, 12 Sep 2025 18:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux85J-0003wV-RX
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 18:01:21 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a5250d1-9002-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 20:01:16 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45cb659e858so16415775e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 11:01:16 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037d62besm68377385e9.21.2025.09.12.11.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 11:01:15 -0700 (PDT)
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
X-Inumbo-ID: 7a5250d1-9002-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757700076; x=1758304876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O30KPNJ2mr6ATeP8HncSxVK987KLpW1yFdoXCnqU3kk=;
        b=uowRl17r+/RkeRJMqMxpa87PmD2pYGN+ioD1zLXA0/B/bU6ukwGdSfZvdPS2TAvWVe
         LIZj0Vm3nDUtyuQjT5DEfDuxlLWi5LAvDRQbvxtcqT4dHTgS66DyaDI1Z2RMzamrUlEl
         g141am3WfHXynrMLUyq4yY8K2YGqf0J0WwT3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757700076; x=1758304876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O30KPNJ2mr6ATeP8HncSxVK987KLpW1yFdoXCnqU3kk=;
        b=o33lgUS8jhPVvHGPFIarMsBo/uRB+cQTKGhoMA5ypY6ZIZ3oQZwTS4kE0gWG2N2+N5
         g0QZcBCsSFR63t25gFbNsVHizGKJcuNb92Nbtehz9h829FhDv7Vj/cZDYTFI1FKlNOft
         TfNxbYeLLconvb2N/xti7l96+uWBvzNGb2HLW8yoRGaxAyL4W13nXMm2uLY0OumePJ1l
         Ti17cN9anPw2AyrocfMPeFIUwX0ji8ChkO7nMIBTG5an1JAhX1e5Q5k6juHnApRefWJX
         8PDzLYm4C2Qhm7uRlWv7b1jYOB0Y282q2g6cWwXT/uxltv9h2zyX93RffGzRrpUqE90K
         uJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCUDRs0VxkBcwXAAWN/8wKTTKx0Cf2L+cFzd8zds75Q40cFifB+MACHMQyupCnDmU78moDYpwh76zFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIpZWOSqAoxevEFdGrypNi2HxWCYdMs93KVkn4F5IypBCjOsdU
	gTY6bnJECVjCwMn6JTbYpFAG14WPb4Gi2vOXrehJowO8EwcVVcXnpQGoFfg5/h3hBxU=
X-Gm-Gg: ASbGncsN1ZAh1LUvYiI5Y92TEQH7ZStS2Cz6l1BZFwRWPFgHX7eD2Ghgo0YzMTzTkOa
	YUioeAlCzNPC1OHlIfIHoNliyQ3RKfjNaFzzjIZgl9x40PoqRu3GE6m+ZmcNrR7+cqTRTizMKdp
	oEjOYubyGVsto44B3OQ6XtwWmpjWdGsOtd+DgzCD0Vnxr4ic+QqR+ndt7AmcqmLs4CKAl4nf5iY
	/seLVrJMQHHSzaa01mduuVMoKmNxMzcSVvJbCyBaMyWwprLBLjW7eO1O7CPd8fSbL3YX6G9q62h
	DzzTkC2r9k2RYzb7VFJEWeZfMsw5egXVsgCrcyUAV4nJiQO4uJbU5NbiKyvhTEEMC5KY4VdEx2S
	KaKlj4dceWJwK9dBTATivqqsvr6gqA8M9gRdaUYLMHBMWeg4zzaT0A/oR7l10AJ5mNHJ6QQl0P8
	Qxssg=
X-Google-Smtp-Source: AGHT+IEnSbFCJ2v5ZT+SYjgUfVstjDvCBOF+c+TyeaZ8fJma7kYZhLXqQ9sd2uJMVfqsAohcHgi5/w==
X-Received: by 2002:a05:600c:8a17:20b0:45b:8504:3002 with SMTP id 5b1f17b1804b1-45f211d50a9mr38530835e9.10.1757700075995;
        Fri, 12 Sep 2025 11:01:15 -0700 (PDT)
Message-ID: <152377b3-075f-46f1-a17d-eb2aa82c1e82@citrix.com>
Date: Fri, 12 Sep 2025 19:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tools/libs: Use superpages where possible on
 migrate/resume
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250912095744.99181-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250912095744.99181-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2025 10:57 am, Frediano Ziglio wrote:
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
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, this is far easier to follow.  A couple of minor things.

> ---
> Changes since v1:
> - updated commit message and subject;
> - change the implementation detecting possible 2mb pages inside
>   the packet sent allowing more 2mb superpages.
>
> Changes since v2:
> - change implementation simplifying detecting and allocations
>   of 2mb pages.
> ---
>  tools/libs/guest/xg_sr_restore.c | 45 +++++++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
> index 06231ca826..ea5a137612 100644
> --- a/tools/libs/guest/xg_sr_restore.c
> +++ b/tools/libs/guest/xg_sr_restore.c
> @@ -129,6 +129,30 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
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
> +static bool populate_small_superpage(struct xc_sr_context *ctx, xen_pfn_t pfn)

I know the terminology is terrible (this work was what prompted some of
my clean-up attempts in Xen).

I think we want to s/pfn/gfn/ all across this function.

> +{
> +    xen_pfn_t mfn = pfn;
> +
> +    if ( xc_domain_populate_physmap_exact(
> +         ctx->xch, ctx->domid, 1, SMALL_SUPERPAGE_ORDER, 0, &mfn) )

This needs a comment.

/* XENMEM_populate_physmap has no coherent error semantics.  Assume a
failure here is ENOMEM, and fall back to allocating small pages. */

(Yes, the physmap hypercalls are insane.  The only error feedback is "I
completed this many before something went wrong", and libxenctrl chooses
EBUSY for want of anything better.)

> +        return false;
> +
> +    if ( mfn == INVALID_MFN )
> +        return false;
> +
> +    for ( size_t i = 0; i < (1 << SMALL_SUPERPAGE_ORDER); ++i )
> +        ctx->restore.ops.set_gfn(ctx, pfn + i, mfn + i);
> +
> +    return true;
> +}
> +
>  /*
>   * Given a set of pfns, obtain memory from Xen to fill the physmap for the
>   * unpopulated subset.  If types is NULL, no page type checking is performed
> @@ -142,6 +166,9 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>          *pfns = malloc(count * sizeof(*pfns));
>      unsigned int i, nr_pfns = 0;
>      int rc = -1;
> +    xen_pfn_t prev = 0;
> +    unsigned num_contiguous = 0;
> +    xen_pfn_t mask = ~((~(xen_pfn_t)0) << SMALL_SUPERPAGE_ORDER);

(1ULL << SMALL_SUPERPAGE_ORDER) - 1; is the more normal way of writing this.

>  
>      if ( !mfns || !pfns )
>      {
> @@ -152,14 +179,26 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>  
>      for ( i = 0; i < count; ++i )
>      {
> +        xen_pfn_t pfn = original_pfns[i];
> +
>          if ( (!types || page_type_to_populate(types[i])) &&
> -             !pfn_is_populated(ctx, original_pfns[i]) )
> +             !pfn_is_populated(ctx, pfn) )
>          {
> -            rc = pfn_set_populated(ctx, original_pfns[i]);
> +            rc = pfn_set_populated(ctx, pfn);
>              if ( rc )
>                  goto err;
> -            pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
> +            pfns[nr_pfns] = mfns[nr_pfns] = pfn;
>              ++nr_pfns;

/* For x86 HVM guests in the first pass, PAGE_DATA records contain
metadata about 4M aligned chunks of GFN space.  Reconstruct 2M
superpages where possible. */

I'm happy to fix these all on commit, if you're happy?

~Andrew

> +            if ( pfn != prev + 1 )
> +                num_contiguous = 0;
> +            num_contiguous++;
> +            prev = pfn;
> +            if ( num_contiguous > mask && (pfn & mask) == mask &&
> +                 populate_small_superpage(ctx, pfn - mask) )
> +            {
> +                nr_pfns -= mask + 1;
> +                num_contiguous = 0;
> +            }
>          }
>      }
>  


