Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6CAB83B1
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 12:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985180.1371134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVjc-0003Ob-1v; Thu, 15 May 2025 10:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985180.1371134; Thu, 15 May 2025 10:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFVjb-0003MO-UW; Thu, 15 May 2025 10:22:39 +0000
Received: by outflank-mailman (input) for mailman id 985180;
 Thu, 15 May 2025 10:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFVjZ-0003M3-Si
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 10:22:37 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 852e0ebf-3176-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 12:22:36 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso7112895e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 03:22:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442f33691bbsm66930295e9.7.2025.05.15.03.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:22:34 -0700 (PDT)
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
X-Inumbo-ID: 852e0ebf-3176-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747304555; x=1747909355; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rN3JTxQbLMU1yugwZ1vPhpcRsorTmqyL+jws3GLwN28=;
        b=BWA9+IWZVxr2wRM1xobowUD7OhQCSSlPQaOPJjAJiqGT0B3tSTOBPM7arim8O665da
         6Pc0dwxgpWQs5564/hsphAVfDYSZYzsIYo0Ik2NCYCRhxyYDB8DnVReaoDAD5IUwJKnN
         hCXOPM6us4/iS6UbsHiKSBOrVnLu0kUSbmUow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304555; x=1747909355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rN3JTxQbLMU1yugwZ1vPhpcRsorTmqyL+jws3GLwN28=;
        b=iM13mMstq/5oA7uV3M01JmtdJxRHMofE9hJXZA0xmOvQgMID1jMsrGPO0XXLRm+cLT
         VuRTuPy+YKS4jmdVsRb2qW2AWAyUvN0XUOwvJKRW0BF6AHHoNitdLX1SF24SS47noVhV
         wxUjx2VWDWm7NRq2qWWic1dHxVCEp1sirOrGmmEecon8wOD3F5qQQLwDAqlE5MEQHTuA
         nLgr5S3HhfCqqXOXpGvMVVwVxLNnI/8uETLMzCX9p94gwjCuyVuO69ZaVAcSEb5ZWIye
         hc4VlDTnw48qsf1oNVn7zYAlOkBtRpd7Lo7KhGijOvs8HzfuheD25Qh8uNHCEJMPI9G2
         8zpg==
X-Forwarded-Encrypted: i=1; AJvYcCUXYlMGkwaeEd7D6nCLhzGHGdah/MoTH79aSglhlRXMVeTyiNe/+Q2d0WVQKCohJrea9Ye6QeE2eAg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp9aSBAPbhq+4dmSjectCB0ejRr7BE3jZRQzMgUOi30E0w1dOr
	9tzmFKuDWM9bP4/9E/35PxTUgdINAp1rZgLjO1nm+akgaPG9YJz59/Zfut2DhVA=
X-Gm-Gg: ASbGncuT57FBcHQWgItp2NJA+VUmFz3ZtBVhKxIKNGBb0eB1bBEpxoqEXBBdL26o5lM
	3VazanVTrdgFhh/NU5NJ3102qknepRD2ItG0pAlhqH+wHy27ixrHj3QqtKSD7ENPQRQ9u9dL2bJ
	t5WI21sH97rhW5lrLt7g1Q1P8mbp89JmpYa85BfThdTFKR/ErrnJPrY7xwBmWFw4Io6bcu4evnS
	lJn6+CQG68QbA7JXoHx71e7HHY29bekw/GXUS3mWS5AIA4rPKxymbJoSicnVHTrpkwBcA8CMbNB
	FSUAPzocdAp+zRCXtdBkBCBG9HxOW2QLrd4xGIQHiQ/GFuUDdjTE6aaM
X-Google-Smtp-Source: AGHT+IFlHbuwqPKYHxsH7eTVdzzM/XOLPIV1kXLHns5NQwTRDKgN8/u1J0GfPRQ9CVnckOrfInEeRg==
X-Received: by 2002:a05:600c:1da9:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-442f971a7c1mr16734015e9.33.1747304555453;
        Thu, 15 May 2025 03:22:35 -0700 (PDT)
Date: Thu, 15 May 2025 12:22:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
Message-ID: <aCXAanKycwXOiLJ0@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
 <853ffc16-f14b-44fa-9e71-4fae8377fa95@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <853ffc16-f14b-44fa-9e71-4fae8377fa95@suse.com>

On Mon, May 12, 2025 at 05:04:56PM +0200, Jan Beulich wrote:
> On 06.05.2025 10:31, Roger Pau Monne wrote:
> > The current logic partially open-codes memory_type_changed(), but doesn't
> > check whether the type change or the cache flush is actually needed.
> > Instead switch to using memory_type_changed(), at possibly a higher expense
> > cost of not exclusively issuing cache flushes when limiting cacheability.
> > 
> > However using memory_type_changed() has the benefit of limiting
> > recalculations and cache flushes to strictly only when it's meaningful due
> > to the guest configuration, like having devices or IO regions assigned.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Hmm, I'm not convinced this is a win. This operation isn't normally used on
> a running guest, aiui.
> 
> What's more, this heavily conflicts with a patch posted (again) over 2 years
> ago [1]. Unless there's something severely wrong with that (and unless your
> patch would make that old one unnecessary), I'm again of the opinion that
> that one should go in first. It is becoming increasingly noticeable that it's
> unhelpful if posted patches aren't being looked at.

I'm happy for your change to go in first, but I think that
memory_type_changed() should be adjusted to contain the extra checks
that you add in your patch, and then hvm_set_mem_pinned_cacheattr()
should be switched to use memory_type_changed() rather than
open-coding it.  For once it would miss the adjustment done to
memory_type_changed() to only flush the cache when there's a
meaningful change to the p2m (iow: p2m_memory_type_changed() is not a
no-op).

Thanks, Roger.

