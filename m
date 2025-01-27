Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A5A1D55C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877778.1287927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNLT-0003sQ-IX; Mon, 27 Jan 2025 11:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877778.1287927; Mon, 27 Jan 2025 11:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcNLT-0003pI-FF; Mon, 27 Jan 2025 11:31:59 +0000
Received: by outflank-mailman (input) for mailman id 877778;
 Mon, 27 Jan 2025 11:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIzP=UT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcNLR-0003mZ-Ni
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:31:57 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ede5422-dca2-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 12:31:53 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3d0205bd5so6416122a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:31:53 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab0bcsm573733866b.95.2025.01.27.03.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 03:31:52 -0800 (PST)
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
X-Inumbo-ID: 4ede5422-dca2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737977513; x=1738582313; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5M7Y9nG+rUesM7WKXClVC36ZcYHA9HSWMG/2zhVtSaU=;
        b=rS8pwcJ/l0nNaLn5Pfw1q0SI/BsQHYpi83pg/qbVb6rPCCqHjN82Q3SBTrjRDaJJuY
         hZss1O51B1RLGn8cBgtUdBwYhyZpPU1CBVLn6ISDjwUcNuldxXbZdcfxyEnJI0kYRT43
         wlePfTO5udXbf7DXU6EVY5LkdXNWmzLtVqwkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737977513; x=1738582313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5M7Y9nG+rUesM7WKXClVC36ZcYHA9HSWMG/2zhVtSaU=;
        b=UvuLYalKXcYy6WMF76MmmdPYfWt8h2LwAs6h5ZF5TH0pcRouZBH+LhVweXpxnpPFqM
         uu+fqF7iotz9qVESN69BMZboB+D2n+FrgKEElvEDnxHPjUDo49qR3rdKqn6Ph+Nk4K19
         NO4PEIN6a5nKmbTHRehfmjTi+CEPQWL+Z9Rx+elaDBIZc1o9e0MHvbFN7YM6r31KUSFT
         btV2nTfUZOt5rH7YY+2SE6FQa5ToXXyhaRnP6gO/A8C5HhyWtEtbydU7RMRq0AnAnGwn
         d9zwH9BDQDbCdepUoQbqOn6I87SxghhuY63cIYtRMTmMJE38f3DHq3TUHkemKhUG2HX0
         1zeg==
X-Gm-Message-State: AOJu0YyENRiOXS2WKAFosPPSPWRraxcVSekp2ysDcPUddHRdQBuR86dQ
	GaLQEpzYQKVCvxyCDSS0VD35NK0oZRO+X/Zt8KeF8ACLMCtPeVWgrIuimN/RrZw=
X-Gm-Gg: ASbGnctfgt+sjqOJgBqaVICOiRN8ZgrET0bC8pmlEf+WWHLzk3Yhh7yU8ZJIbr4KgUW
	B7TGQMVjr724DSBzYiHxRNAaUxGIrxI+GDTmJYez8QjCw2uGJtPCoXqz18vVzkW/q2DQHcovsMw
	ibCUTrzeSOLqn2tu6HWjBk48pwxWaT/9F7yFhG11KWmyR62bWs96dYkzXENbzQNqKcjGENRdZsP
	9ai3+Hkffai9/jvVx25MFwOrnaPpyK1ZW5Sqv4Uq93GKKsKphH1w6xUQJHWLkZIbSPwfBPQlAOw
	ffZjcH33R2PWW0s=
X-Google-Smtp-Source: AGHT+IF9m5/hwKzsMyRXrvav+B/a1Aixrj5mydbV8I/2bNS6hZ5/5CIlhwjw6cl6RNiTeaaoTXilBg==
X-Received: by 2002:a17:907:6d1e:b0:ab6:6fc1:f602 with SMTP id a640c23a62f3a-ab66fc1f7a4mr1551395566b.15.1737977513190;
        Mon, 27 Jan 2025 03:31:53 -0800 (PST)
Date: Mon, 27 Jan 2025 12:31:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.20] x86/PV: further harden guest memory accesses
 against speculative abuse
Message-ID: <Z5dupzj0JnC--YQ7@macbook.local>
References: <a615a96e-95d2-442f-b57d-0bb51142c977@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a615a96e-95d2-442f-b57d-0bb51142c977@suse.com>

On Mon, Jan 27, 2025 at 11:15:22AM +0100, Jan Beulich wrote:
> The original implementation has two issues: For one it doesn't preserve
> non-canonical-ness of inputs in the range 0x8000000000000000 through
> 0x80007fffffffffff. Bogus guest pointers in that range would not cause a
> (#GP) fault upon access, when they should.
> 
> And then there is an AMD-specific aspect, where only the low 48 bits of
> an address are used for speculative execution; the architecturally
> mandated #GP for non-canonical addresses would be raised at a later
> execution stage. Therefore to prevent Xen controlled data to make it
> into any of the caches in a guest controllable manner, we need to
> additionally ensure that for non-canonical inputs bit 47 would be clear.
> 
> See the code comment for how addressing both is being achieved.
> 
> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: When scratch2 isn't %r8...%r15, the MOV, CMOVNB, and XOR will have
>      unnecessary REX prefixes emitted, as users of the macro pass in 64-
>      bit registers. Similar to what was done to be able to use SETcc (in
>      the earlier alternative code sequence), we could derive %e.. from
>      %r.. to shrink code size some; there are a few dozen instances of
>      this code, after all. (An alternative, requiring to touch the use
>      sites, would be to constrain the scratch registers to rAX...rDI and
>      pass in only the last two characters of the names [e.g. "di", i.e.
>      also without the leading %]. That would make it straightforward to
>      use both %r.. and %e.. at the same time.)
> ---
> v2: Drop the non-RCR alternative.
> 
> --- a/xen/arch/x86/include/asm/asm-defns.h
> +++ b/xen/arch/x86/include/asm/asm-defns.h
> @@ -1,3 +1,5 @@
> +#include <asm/page-bits.h>
> +
>  #ifndef HAVE_AS_CLAC_STAC
>  .macro clac
>      .byte 0x0f, 0x01, 0xca
> @@ -65,17 +67,36 @@
>  .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
>  #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
>      /*
> -     * Here we want
> -     *
> -     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
> -     *
> +     * Here we want to adjust \ptr such that
> +     * - if it's within Xen range, it becomes non-canonical,
> +     * - otherwise if it's (non-)canonical on input, it retains that property,
> +     * - if the result is non-canonical, bit 47 is clear (to avoid
> +     *   potentially populating the cache with Xen data),

It's my understanding from the commit message that this toggling of
bit 47 is only done due to AMD behavior, as speculative execution
there ignores any higher than 47, and hence non-canonical inputs are
no detected when speculatively executing?

It might be worth explicitly mentioning this in the comment.

>       * but guaranteed without any conditional branches (hence in assembly).
> +     *
> +     * To achieve this we determine which bit to forcibly clear: Either bit 47
> +     * (in case the address is below HYPERVISOR_VIRT_END) or bit 63.  Further
> +     * we determine whether for forcably set bit 63: In case we first cleared
> +     * it, we'll merely restore the original address.  In case we ended up
> +     * clearing bit 47 (i.e. the address was either non-canonical or within Xen
> +     * range), setting the bit will yield a guaranteed non-canonical address.
> +     * If we didn't clear a bit, we also won't set one: The address was in the
> +     * low half of address space in that case with bit 47 already clear.  The
> +     * address can thus be left unchanged, whether canonical or not.

Since for AMD we have to do the bit 47 clearing, won't it be enough to
do something like:

ptr &= (ptr < HYPERVISOR_VIRT_END) ? ~(1ULL <<  (VADDR_BITS - 1) : ~0ULL;

So only care to clear bit 47 when ptr is below HYPERVISOR_VIRT_END?
As that would already diverge accesses into the Xen address space
without having to toggle bit 63?

Thanks, Roger.

