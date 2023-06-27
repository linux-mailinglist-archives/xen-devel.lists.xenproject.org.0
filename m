Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461673F39F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 06:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555846.867971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE0Z1-0008Db-Mc; Tue, 27 Jun 2023 04:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555846.867971; Tue, 27 Jun 2023 04:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE0Z1-0008Ax-Jp; Tue, 27 Jun 2023 04:44:27 +0000
Received: by outflank-mailman (input) for mailman id 555846;
 Tue, 27 Jun 2023 04:44:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIlG=CP=google.com=hughd@srs-se1.protection.inumbo.net>)
 id 1qE0Z0-0008Ar-Ac
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 04:44:26 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4812b8ce-14a5-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 06:44:23 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5703d12ab9aso42541967b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 21:44:21 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a252308000000b00bf44703efd3sm1487805ybj.6.2023.06.26.21.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 21:44:19 -0700 (PDT)
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
X-Inumbo-ID: 4812b8ce-14a5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687841060; x=1690433060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVtrcXbE5qXWKdJhq2ArhetT4KPRpQBwbjTOuMnTdxE=;
        b=501HLYHctmk8sIJeTmzxhRx3/mgKpv1jRi1zyxe6IKd5PzvxEUvUlafEKoDqL6yZVr
         8LPzltfzYfOsnNGE3T6BklB22lAMitCgdhFuhtcXDNR8cn90bt0hxS6/rFyMCnKABSjm
         /oRswCkgkHFa78/d8yQxqLAP7w+UcywLgaNVEk0kQUj/E5gzTgG4U1Ib/QTJ68K6B1lq
         DHiArvPKR0yaKTV4AcdaFGyA0a3QVzlRHTqcAyQmjJhyBDsZIisDj9Axezm4VTj3plhb
         Dus4mDTAcMi1b8nttzH3dDwb6//iZcVcKmqu+MryYnw/GG09jfr1xcEP4Qfwx6utRJkj
         zVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687841060; x=1690433060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVtrcXbE5qXWKdJhq2ArhetT4KPRpQBwbjTOuMnTdxE=;
        b=ZtYjGbWWIOYDo69VpTlDwi6C98F3TP1VC/k84MFAkOAKfL2etDl4pmYTIT2tLspaO+
         i/adSTUrV7BVwGTSzId10etUgAjjNQrngy4sS6bC59wmoPBWtvsqFn/YyJQYhpClDdGJ
         judhji+G6Lhy6D/26foUMm3T0SGpmzM7+2CSLcpUU4qUFV0PEmKYRmafSOkupzETbhpm
         GVhLn0Yzhr6xerOomak3CVrDOHMgaCDY1NGhSPzuyPNjqgGgoqTQlJW+HohI1ON3M3bl
         HfStm0VDDspBR5anwq858qHSsIsApxhnv6tUPS05eI1PoewKhNg9+zoIOqCNSQFcrKNb
         TLyw==
X-Gm-Message-State: AC+VfDxvEohMl2Idq4AL7Ibno8JxMz8bjS6GuxWQW9C6XIczGkbDoMc3
	H2E74Jc+GEHj3gqXLAgpgoZckg==
X-Google-Smtp-Source: ACHHUZ4LBcIHJ/ynOcwzWzKYI9Mk2cjEWGfgZGpKdMoBZ7/XKupPMOzNiMbSCmgeKveyN334gs70/g==
X-Received: by 2002:a81:7bc2:0:b0:56d:43cb:da98 with SMTP id w185-20020a817bc2000000b0056d43cbda98mr29864359ywc.29.1687841059932;
        Mon, 26 Jun 2023 21:44:19 -0700 (PDT)
Date: Mon, 26 Jun 2023 21:44:08 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
    linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
    xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
    Hugh Dickins <hughd@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
    Huacai Chen <chenhuacai@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
    David Hildenbrand <david@redhat.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Richard Weinberger <richard@nod.at>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, 
    Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
Message-ID: <e8992eee-4140-427e-bacb-9449f346318@google.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:

> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
...
>  39 files changed, 686 insertions(+), 455 deletions(-)

I don't see the point of this patchset: to me it is just obfuscation of
the present-day tight relationship between page table and struct page.

Matthew already explained:

> The intent is to get ptdescs to be dynamically allocated at some point
> in the ~2-3 years out future when we have finished the folio project ...

So in a kindly mood, I'd say that this patchset is ahead of its time.
But I can certainly adapt to it, if everyone else sees some point to it.

Hugh

