Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF4759447
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 13:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565777.884259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5Sy-0007Sx-M8; Wed, 19 Jul 2023 11:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565777.884259; Wed, 19 Jul 2023 11:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5Sy-0007R6-JK; Wed, 19 Jul 2023 11:35:36 +0000
Received: by outflank-mailman (input) for mailman id 565777;
 Wed, 19 Jul 2023 11:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Hz6=DF=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qM5Sw-0007R0-Ts
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 11:35:34 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f41bcdb-2628-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 13:35:33 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51e99584a82so9297245a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 04:35:33 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l10-20020a170906414a00b0099304c10fd3sm2185034ejk.196.2023.07.19.04.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 04:35:32 -0700 (PDT)
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
X-Inumbo-ID: 5f41bcdb-2628-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689766533; x=1690371333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j71jneZtuQAsJTv8f5uyNleTabsoYSHT74bsFM2BaOY=;
        b=SyDCUm6b0HJuHL4RM123G0ZpJKsgb+Gs6v96vMpDQbsUG/7HsYRlZcYulIKHWNISEE
         91fRH4oBe0BL6ijdCladr8e39NBO8HjeGfV2m+MbwIOT5Vz/ZWJgmHA6Q4p+8HQF1k8c
         pcWmej5/Th1s6sQBn9Qo6YZz6Q1oalk492TJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766533; x=1690371333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j71jneZtuQAsJTv8f5uyNleTabsoYSHT74bsFM2BaOY=;
        b=KUFTWMqfSqJRD4uRZDCOvG/omCsZfxBB3ZAJ9P9/+wFwjqTL1J5SP6qoIGwmKGQuTP
         jgiAQilx8oc62gqtFrE8provSDlOXF9ZnEW4cs9L/dKaimYvOtD8hVfnqCAAvR8R5XXX
         u0ipXaolsaP+u0432COb6023WOp+Cb99t44Dg/AqceCfi468izS2UIPrjPe9gb0SV6HS
         HyxPvH618PZ7DEWsiqQyaNclNRTddpx9z7DIhEcqUV26S7DP53vyydjbyTq2Ewx8veIx
         HTtCStyWw7gWzQ9RGG/yTD4SziLlBK28letdXy30lrG9V1Ijpd+OCN5j3jG8eOVzS23b
         A9rw==
X-Gm-Message-State: ABy/qLbtTdD81kFp/9qQmjdAkOf9I4bkamTk2T0qpzNvXYsntkgbo+k2
	RpnrpcYSNyHHQUtHHObckVy1GQ==
X-Google-Smtp-Source: APBJJlEN4xkZQYOC/awY0QQJqFQIMmgzj05wp3rXTFzKxS+Cv6In94CeH0ndBVVmo0ONV9+Gb4r0uQ==
X-Received: by 2002:a17:906:f9c2:b0:989:34a0:45b0 with SMTP id lj2-20020a170906f9c200b0098934a045b0mr2044907ejb.49.1689766533046;
        Wed, 19 Jul 2023 04:35:33 -0700 (PDT)
Message-ID: <64b7ca84.170a0220.758d8.90e0@mx.google.com>
X-Google-Original-Message-ID: <ZLfKgvREje1EwBnF@EMEAENGAAD19049.>
Date: Wed, 19 Jul 2023 12:35:30 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/mem: Make mem_hotadd_check() more legible
References: <20230719100808.4046779-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719100808.4046779-1-andrew.cooper3@citrix.com>

On Wed, Jul 19, 2023 at 11:08:08AM +0100, Andrew Cooper wrote:
> Introduce a ROUND() macro to mirror ROUNDUP().  Use both to remove all the
> opencoded rounding in mem_hotadd_check().  Fix other minor style issues.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> The compiled binary is identical.
> ---
>  xen/arch/x86/x86_64/mm.c | 31 +++++++++++++------------------
>  xen/include/xen/macros.h |  1 +
>  2 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index 60db439af3ec..38f978cab269 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1159,10 +1159,10 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>  {
>      unsigned long s, e, length, sidx, eidx;
>  
> -    if ( (spfn >= epfn) )
> +    if ( spfn >= epfn )
>          return 0;
>  
> -    if (pfn_to_pdx(epfn) > FRAMETABLE_NR)
> +    if ( pfn_to_pdx(epfn) > FRAMETABLE_NR )
>          return 0;
>  
>      if ( (spfn | epfn) & ((1UL << PAGETABLE_ORDER) - 1) )
> @@ -1172,10 +1172,9 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>          return 0;
>  
>      /* Make sure the new range is not present now */
> -    sidx = ((pfn_to_pdx(spfn) + PDX_GROUP_COUNT - 1)  & ~(PDX_GROUP_COUNT - 1))
> -            / PDX_GROUP_COUNT;
> -    eidx = (pfn_to_pdx(epfn - 1) & ~(PDX_GROUP_COUNT - 1)) / PDX_GROUP_COUNT;
> -    if (sidx >= eidx)
> +    sidx = ROUNDUP(pfn_to_pdx(spfn),     PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
> +    eidx = ROUND  (pfn_to_pdx(epfn - 1), PDX_GROUP_COUNT) / PDX_GROUP_COUNT;
See [1] for both the sidx and eidx lines.
> +    if ( sidx >= eidx )
>          return 0;
>  
>      s = find_next_zero_bit(pdx_group_valid, eidx, sidx);
> @@ -1186,28 +1185,24 @@ static int mem_hotadd_check(unsigned long spfn, unsigned long epfn)
>          return 0;
>  
>      /* Caculate at most required m2p/compat m2p/frametable pages */
> -    s = (spfn & ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1));
> -    e = (epfn + (1UL << (L2_PAGETABLE_SHIFT - 3)) - 1) &
> -            ~((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1);
> +    s = ROUND  (spfn, 1UL << (L2_PAGETABLE_SHIFT - 3));
> +    e = ROUNDUP(epfn, 1UL << (L2_PAGETABLE_SHIFT - 3));
>  
>      length = (e - s) * sizeof(unsigned long);
>  
> -    s = (spfn & ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1));
> -    e = (epfn + (1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) &
> -            ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1);
> -
> -    e = min_t(unsigned long, e,
> +    s =     ROUND  (spfn, 1ULL << (L2_PAGETABLE_SHIFT - 2));
See [1] for s.
> +    e = min(ROUNDUP(epfn, 1ULL << (L2_PAGETABLE_SHIFT - 2)),
>              (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2);
>  
>      if ( e > s )
> -        length += (e -s) * sizeof(unsigned int);
> +        length += (e - s) * sizeof(unsigned int);
>  
> -    s = pfn_to_pdx(spfn) & ~(PDX_GROUP_COUNT - 1);
> -    e = ( pfn_to_pdx(epfn) + (PDX_GROUP_COUNT - 1) ) & ~(PDX_GROUP_COUNT - 1);
> +    s = ROUND  (pfn_to_pdx(spfn), PDX_GROUP_COUNT);
See [1] for s.
> +    e = ROUNDUP(pfn_to_pdx(epfn), PDX_GROUP_COUNT);
>  
>      length += (e - s) * sizeof(struct page_info);
>  
> -    if ((length >> PAGE_SHIFT) > (epfn - spfn))
> +    if ( (length >> PAGE_SHIFT) > (epfn - spfn) )
>          return 0;
>  
>      return 1;
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index 7b92d345044d..ceeffcaa95ff 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -1,6 +1,7 @@
>  #ifndef __MACROS_H__
>  #define __MACROS_H__
>  
> +#define ROUND(x, a)   ((x) & ~((a) - 1))
Why not ROUNDDOWN() or ROUND_DOWN()? ROUND() doesn't imply a specific
direction and can be confusing if ROUNDUP is not seen next to it.
>  #define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
>  
>  #define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
> 
> base-commit: b1c16800e52743d9afd9af62c810f03af16dd942
> -- 
> 2.30.2
> 
> 

[1] The hand-crafted alignment there is going to collide with the efforts
to integrate automatic style checkers. It's also not conveying critical
information, so I'd argue for its removal in the spirit of making future
diffs less intrusive.

Alejandro

