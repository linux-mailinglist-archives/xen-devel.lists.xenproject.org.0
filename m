Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249628C5870
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 17:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721639.1125215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tg5-0008HV-Kf; Tue, 14 May 2024 15:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721639.1125215; Tue, 14 May 2024 15:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tg5-0008EM-Ho; Tue, 14 May 2024 15:02:53 +0000
Received: by outflank-mailman (input) for mailman id 721639;
 Tue, 14 May 2024 15:02:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6tg4-0008EG-DX
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 15:02:52 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 067e3c4d-1203-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 17:02:47 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34da04e44a2so4524988f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 08:02:47 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbd60sm13961896f8f.90.2024.05.14.08.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 08:02:46 -0700 (PDT)
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
X-Inumbo-ID: 067e3c4d-1203-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715698967; x=1716303767; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YMk/aXSIx/Qh4B8ngzoA9luXMIY+lh/iAPWI0bgU8c=;
        b=XfSbuxIcT631UyTaeJRS4w6bAl2zbOkg+dhagVQR3jsdPEHDjtePrqBIXp16Er0YpJ
         Zh6ccfeQhHLWSjVSjF5EeprMd92CGjhU8vy+hCnJPN6iBE2I9qmA9F1O0W5MbF8hq5in
         oCV+OBOTWUUGSgFdLxtqmJV2bhMSavxUOC21Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715698967; x=1716303767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YMk/aXSIx/Qh4B8ngzoA9luXMIY+lh/iAPWI0bgU8c=;
        b=F5uho0qXp/49xvG8Q8kSic59byNZxU4Nt0S22JsFhrUjObbgdI6gKL1y+pdMkyg13f
         hD2lRthdwbY9R9eGLg7rP0QlBR1ARb3szzYHF3QuZcJG9qlYheW5u1yV/S7WLQ2vy/fP
         4Y/LIG8w5DgY/laYpvqHge/QbJlA/zDS0Q7R/wWQMxfPleNXi62hjgn2kMAzSCPvuNOf
         Wclj5oBQQgP7Rfl5ril9LAGtf75qN4uvL7ec31K36x8m7RTmmi8+96fGFbMwdlcTjGST
         uQJDGH8C5rW8zUIuUHzLbnb090eou0Xm4+LjWxm1cSqAhnQ91xRgjSGUBGiAjt1iqzAI
         +sAg==
X-Gm-Message-State: AOJu0YxK+yzmYLIhdOtaDPywB8ZA0IkedXlA3mfI1o86iKv9mg6l4Ns3
	IY7uIY5PnzdHFel4K4aEPfNZwgAaP0yX1OhyjIee5RVfaS1seRZ0SC+E/GeZwE4=
X-Google-Smtp-Source: AGHT+IG2hIjYFNYYy2IZhutaQgmwju+nA2Xisu8qoeok/AqBJYQPZgxQVcnoSLZt/CBXkau/8BTvmA==
X-Received: by 2002:a5d:45d1:0:b0:34c:120a:fbed with SMTP id ffacd0b85a97d-3504a635932mr9546509f8f.15.1715698966963;
        Tue, 14 May 2024 08:02:46 -0700 (PDT)
Date: Tue, 14 May 2024 17:02:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 12/19] x86/setup: vmap heap nodes when they
 are outside the direct map
Message-ID: <ZkN9FWP3VMZS-s-y@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-13-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-13-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:39PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When we do not have a direct map, archs_mfn_in_direct_map() will always
> return false, thus init_node_heap() will allocate xenheap pages from an
> existing node for the metadata of a new node. This means that the
> metadata of a new node is in a different node, slowing down heap
> allocation.
> 
> Since we now have early vmap, vmap the metadata locally in the new node.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>     Changes in v2:
>         * vmap_contig_pages() was renamed to vmap_contig()
>         * Fix indentation and coding style
> 
>     Changes from Hongyan's version:
>         * arch_mfn_in_direct_map() was renamed to
>           arch_mfns_in_direct_map()
>         * Use vmap_contig_pages() rather than __vmap(...).
>         * Add missing include (xen/vmap.h) so it compiles on Arm
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index dfb2c05322..3c0909f333 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -136,6 +136,7 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  #include <xen/spinlock.h>
> +#include <xen/vmap.h>
>  
>  #include <asm/flushtlb.h>
>  #include <asm/page.h>
> @@ -605,22 +606,44 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>          needed = 0;
>      }
>      else if ( *use_tail && nr >= needed &&
> -              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
>                (!xenheap_bits ||
> -               !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> +              !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )

Unrelated change?  The indentation was correct for this line and you
are breaking it.

>      {
> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
> +        {
> +            _heap[node] = mfn_to_virt(mfn + nr - needed);
> +            avail[node] = mfn_to_virt(mfn + nr - 1) +
> +                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        }
> +        else
> +        {
> +            mfn_t needed_start = _mfn(mfn + nr - needed);
> +
> +            _heap[node] = vmap_contig(needed_start, needed);
> +            BUG_ON(!_heap[node]);
> +            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                          sizeof(**avail) * NR_ZONES;
> +        }

You could shorten the blocks I think:

if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
    _heap[node] = mfn_to_virt(mfn + nr - needed);
else
    _heap[node] = vmap_contig(_mfn(mfn + nr - needed), needed);

BUG_ON(!_heap[node]);
avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
                  sizeof(**avail) * NR_ZONES;

So that more part of the logic is shared between both.

>      }
>      else if ( nr >= needed &&
> -              arch_mfns_in_directmap(mfn, needed) &&
>                (!xenheap_bits ||
> -               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> +              !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
>      {
> -        _heap[node] = mfn_to_virt(mfn);
> -        avail[node] = mfn_to_virt(mfn + needed - 1) +
> -                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        if ( arch_mfns_in_directmap(mfn, needed) )
> +        {
> +            _heap[node] = mfn_to_virt(mfn);
> +            avail[node] = mfn_to_virt(mfn + needed - 1) +
> +                          PAGE_SIZE - sizeof(**avail) * NR_ZONES;
> +        }
> +        else
> +        {
> +            mfn_t needed_start = _mfn(mfn);
> +
> +            _heap[node] = vmap_contig(needed_start, needed);
> +            BUG_ON(!_heap[node]);
> +            avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
> +                          sizeof(**avail) * NR_ZONES;
> +        }

Same here.

Thanks, Roger.

