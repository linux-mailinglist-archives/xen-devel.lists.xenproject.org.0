Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E07740468
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 22:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556274.868669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEF4d-0005BA-6A; Tue, 27 Jun 2023 20:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556274.868669; Tue, 27 Jun 2023 20:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEF4d-00059F-3b; Tue, 27 Jun 2023 20:14:03 +0000
Received: by outflank-mailman (input) for mailman id 556274;
 Tue, 27 Jun 2023 20:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIlG=CP=google.com=hughd@srs-se1.protection.inumbo.net>)
 id 1qEF4b-0004wv-R8
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 20:14:01 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27761493-1527-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 22:14:01 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a1a47b33d8so4401374b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 13:14:01 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 q131-20020a817589000000b00565eb8af1fesm1991442ywc.132.2023.06.27.13.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 13:13:59 -0700 (PDT)
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
X-Inumbo-ID: 27761493-1527-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687896840; x=1690488840;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Omz0x3K5VJ2j7KfDH2649X9QbCItdU3t+DCvtH+dE30=;
        b=qLT/FXnF9fYy8bz41ZGqzPs/xLiMCCfewgfWuzZzcLVjcItB7JcMRZfi6IZL1dCSx3
         OsWOmERj0hyOKFLw3jnnNfW5CTsqZqse181Md9/KF69O7aJpxHwXe5KyY7KekYXV4G1r
         zVWUAFUddyly86sbQfglXGlLJ+Dw6fbYNcanLL/4qX6MAv9NG432kDe3kyebDDkyTfob
         goI5J8lS8Nlzpf0h6eGjsC3OSSCP5RIprmv8BuvIbtDrufzgn/Q2le4t+ExH2qGopi70
         i11eeGh9ltkwfbMdr3qGqDnVah9352dUuKEVj6Z46bgWdO+OozUTmUPxCUjV8K1vxlvi
         swng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687896840; x=1690488840;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Omz0x3K5VJ2j7KfDH2649X9QbCItdU3t+DCvtH+dE30=;
        b=kJLG8Kqy6u763XTO8meeTQN5iYbJuqK+ef1vikGSfY8o3c2ycnMiWOZFkXadmHHM1G
         TDAxsItjeKRbBSEFv2QQ0pJ1DSbh8/2+WjZIht+uKpjWITYfOYvYffW2UQpZE8F1Eb3h
         qPpI8foePDZlL/Q7k+qlu0oqDbXEeaMYLESodDqBVevjUVC3tuiEWWmiekTzCfm2xtri
         OR67wsrpbLQJtA0D6la+x7SIQ++nnnmINP/n+b0IvGMRsxEGb4A7u/WdLbpTLazKC4g1
         YAK6dXPHlnPmjOHRvPbwRR11G8Js/kxyzWhRdEWECGwXEpWX+7xA+tmm5pRSSN/TbNfL
         nOOA==
X-Gm-Message-State: AC+VfDzMNiEvmMCo+S7Z4RrfNQrngs/7IMbN6hsDearIsF951HIru5mJ
	kncRs40zcRisEVC+gYfhEfK88w==
X-Google-Smtp-Source: ACHHUZ7e3joAt7KSpSbDLhKkkEe6hRd92o1ATH/0oO6vi+mlTpkmMRcA4IUypqa5SFzU0uL+mRFuMQ==
X-Received: by 2002:a05:6359:2af:b0:133:9da:8d9f with SMTP id ek47-20020a05635902af00b0013309da8d9fmr5361549rwb.14.1687896839740;
        Tue, 27 Jun 2023 13:13:59 -0700 (PDT)
Date: Tue, 27 Jun 2023 13:13:49 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: David Hildenbrand <david@redhat.com>
cc: Hugh Dickins <hughd@google.com>, 
    "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
    linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
    xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Huacai Chen <chenhuacai@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Richard Weinberger <richard@nod.at>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, 
    Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
In-Reply-To: <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
Message-ID: <90e643ca-de72-2f4c-f4fe-35e06e1a9277@google.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com> <e8992eee-4140-427e-bacb-9449f346318@google.com> <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Jun 2023, David Hildenbrand wrote:
> On 27.06.23 06:44, Hugh Dickins wrote:
> > On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:
> > 
> >> The MM subsystem is trying to shrink struct page. This patchset
> >> introduces a memory descriptor for page table tracking - struct ptdesc.
> > ...
> >>   39 files changed, 686 insertions(+), 455 deletions(-)
> > 
> > I don't see the point of this patchset: to me it is just obfuscation of
> > the present-day tight relationship between page table and struct page.
> > 
> > Matthew already explained:
> > 
> >> The intent is to get ptdescs to be dynamically allocated at some point
> >> in the ~2-3 years out future when we have finished the folio project ...
> > 
> > So in a kindly mood, I'd say that this patchset is ahead of its time.
> > But I can certainly adapt to it, if everyone else sees some point to it.
> 
> I share your thoughts, that code churn which will help eventually in the far,
> far future (not wanting to sound too pessimistic, but it's not going to be
> there tomorrow ;) ).
> 
> However, if it's just the same as the other conversions we already did (e.g.,
> struct slab), then I guess there is no reason to stop now -- the obfuscation
> already happened.
> 
> ... or is there a difference regarding this conversion and the previous ones?

I was aware of the struct slab thing, didn't see much point there myself
either; but it was welcomed by Vlastimil, and barely affected outside of
slab allocators, so I had no reason to object.

You think that if a little unnecessary churn (a *lot* of churn if you
include folios, which did save some repeated calls to compound_head())
has already occurred, that's a good precedent for allowing more and more?
My opinion happens to differ on that.

Hugh

