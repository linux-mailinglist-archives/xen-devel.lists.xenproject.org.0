Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E50B26620
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 15:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081672.1441691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXam-0006Te-TJ; Thu, 14 Aug 2025 13:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081672.1441691; Thu, 14 Aug 2025 13:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXam-0006Sp-PU; Thu, 14 Aug 2025 13:02:04 +0000
Received: by outflank-mailman (input) for mailman id 1081672;
 Thu, 14 Aug 2025 13:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Upc=22=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1umXal-0006Lz-8Q
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 13:02:03 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc5fb869-790e-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 15:01:58 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0990b2so6040865e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 06:01:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45a1cda0021sm18834025e9.13.2025.08.14.06.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:01:56 -0700 (PDT)
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
X-Inumbo-ID: dc5fb869-790e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755176518; x=1755781318; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S4CO4Pew9PdsaPgLIkf571HyC7kEQqHFIFBjIJKQkkc=;
        b=YLUFo+2rR0Bb/56hlaNBs1L3ocrgbEh5SR0gvU98xd3kl2Njd9mX1GhI8qCxnJvwwY
         NJbzACbihpwfmCN7C8jlokw6//+slFkTwSmHQBOb3NdtNGvtSYBkm7CO8or3atuM4xY3
         Nv5/cOTLgl08GeGHamBCatqj6ou64vRIkS8yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755176518; x=1755781318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4CO4Pew9PdsaPgLIkf571HyC7kEQqHFIFBjIJKQkkc=;
        b=Bc2RfIt3oPKz7D2f+70nfxv30jJNPnpv8kdtFuvnrA7InAG9bxhztqyLVPxU2XRBPm
         nxlQDYcxeHjZ1DrAQAeABq/oRNaYEqBfOstPhGn03mLQfSphjpRlAka9SnoY655NqiYG
         e/qj7izoCXGewkksPABBpvaK6LE7aId6JuMg554BJ9q0tQ3FYY3rmc/ZeNNqczuQZBDC
         bjnyHBTaWjGqg18GyeeIOLfVhhpFl11n2tV/9KIthmti8L8zcuf7FixrGfbsDQajXmJi
         bLKQboPVimiSVxZ/VuFTr/oCdDTQOa6guaKxWeZQY0CfbydLcct7BoKc6pbmNfPj7yay
         e49g==
X-Forwarded-Encrypted: i=1; AJvYcCW7G7Rjg0Bz0L7TavtoUkV0VBnDXUPmK+sWCGAsY19deaqLbxgyKeO+QsQUjTqBnRbmzcOqzX+mswY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvkOm/73uG/sePemJb+Rv3uy7d9BBrDSUNBtgtX94ipavOARfE
	dI5BBp7gQSKYbw7cDYR45Tbq9JTvKRqc939qVfJHqB0NQwbPyt31fWTsY75JFN1ljDI=
X-Gm-Gg: ASbGncu66I0FOwK2/n/P+xw/5vUVAsU8Iq0CqKCeZqvah8rNsmLEDpu2XoR7MohH/+s
	cnsA9TF9GL6164714yJYKAi2RhtXllnVMxDXfYCrjV6fkSPaF7WMpZ+6X+8F7JUvbsQmlx9Nr0K
	7icxlCDj4RgAS+KoTR90LtuL1Fnm0Qou5fvqpecyprqA43T9qzzwVVqShpTCYNvGfDl5tBKrUw5
	kZumxZgX9RCkUSqavYD3B0t2giUCAT57faeRVY3+F/5Xfb0agcGyeQk/+UVrWpkbaFsEXum0KSf
	M1njY3QLByyBI1ZZK2onylegFd3afBFZ67zflP5ERE77hLfNDHy9oo3XOseXmnPqPsDuK6ZFm+Z
	KYyGqrjkF69pqv+kZNnjLsqaSoUWQm3KOskrdLcLmBvY7BzVEowZDBgWsxL+ICBDxQg==
X-Google-Smtp-Source: AGHT+IF1YAxRwBpsmkYSwfMmKOkdlRmBNudwsxBpjbUBitckaJLS1J2ZF8akXCJpf/bJ5tcqoVl9Lg==
X-Received: by 2002:a05:600c:1da5:b0:458:c059:7d9c with SMTP id 5b1f17b1804b1-45a1b946558mr23207715e9.6.1755176517306;
        Thu, 14 Aug 2025 06:01:57 -0700 (PDT)
Date: Thu, 14 Aug 2025 15:01:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
Message-ID: <aJ3eRFc7CCwVi5WE@macbook.local>
References: <20250813125538.78174-1-roger.pau@citrix.com>
 <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
 <aJ26UmemwxyyTioE@macbook.local>
 <3fbdd1fc-e739-42cf-892b-a561910a5693@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fbdd1fc-e739-42cf-892b-a561910a5693@suse.com>

On Thu, Aug 14, 2025 at 12:45:40PM +0200, Jan Beulich wrote:
> On 14.08.2025 12:28, Roger Pau Monné wrote:
> > On Thu, Aug 14, 2025 at 09:18:45AM +0200, Jan Beulich wrote:
> >> On 13.08.2025 14:55, Roger Pau Monne wrote:
> >>> --- a/xen/common/pdx.c
> >>> +++ b/xen/common/pdx.c
> >>> @@ -288,7 +288,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
> >>>  
> >>>      pfn_pdx_hole_shift  = hole_shift;
> >>>      pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
> >>> -    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
> >>> +    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;
> >>
> >> Given
> >>
> >> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> >>
> >> this shouldn't be needed, except maybe for Arm32. There, however, ...
> >>
> >>>      pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
> >>
> >> ... this and the shift immediately ahead would also be a problem afaict,
> >> which makes me conclude this isn't what Coverity has looked at. I expect
> >> the problem is with the toolstack side definition of PAGE_SIZE, which imo
> >> would rather be addressed there. (And yes, I'm pretty averse to arbitrary
> >> casts like this being introduced.)
> > 
> > As I've realized while looking at this, wouldn't ma_va_bottom_mask
> > also better be of type paddr_t, since it's not operating on pfns, but
> > physical addresses.  I didn't adjust the type of ma_va_bottom_mask,
> > but I would be happy to do it if you agree.
> 
> No, as its name says it's also used on virtual addresses (really: offsets
> into the direct map). It hence would better not have any bits set outside
> of the range that VAs can cover.

It's confusing that it's sometimes used against a paddr_t or an
unsigned long type.  The logic itself already limits the shift so it's
below the width of unsigned long AFAICT.

> With that, imo the cast (if any) also
> should have been to unsigned long, not paddr_t. Yet as said, im the cast
> would better not be there in the first place. Just that meanwhile I've
> learned that this was committed already.

Sorry, I should have waited for your opinion.

I think you would prefer the patch below.  I can send this formally,
not sure whether you would prefer a formal revert of the previous
patch, plus the new fix applied, or doing the revert in the new patc
(like below) is fine.

Thanks, Roger.
---
diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
index 5bef7df650d2..a0fe33b4f1e0 100644
--- a/tools/tests/pdx/harness.h
+++ b/tools/tests/pdx/harness.h
@@ -33,7 +33,7 @@
 #define PAGE_SHIFT    12
 /* Some libcs define PAGE_SIZE in limits.h. */
 #undef  PAGE_SIZE
-#define PAGE_SIZE     (1 << PAGE_SHIFT)
+#define PAGE_SIZE     (1UL << PAGE_SHIFT)
 #define MAX_ORDER     18 /* 2 * PAGETABLE_ORDER (9) */
 
 #define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index 06536cc639f3..9e6b36086fbd 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -274,7 +274,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
 
     pfn_pdx_hole_shift  = hole_shift;
     pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
-    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;
+    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
     pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
     pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;


