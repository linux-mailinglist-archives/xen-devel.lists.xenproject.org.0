Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215EA7C8EB8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 23:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616899.959219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrPJd-0004DJ-DF; Fri, 13 Oct 2023 21:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616899.959219; Fri, 13 Oct 2023 21:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrPJd-0004AJ-AB; Fri, 13 Oct 2023 21:03:25 +0000
Received: by outflank-mailman (input) for mailman id 616899;
 Fri, 13 Oct 2023 21:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qaMF=F3=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qrPJb-00049x-CA
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 21:03:23 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f08201aa-6a0b-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 23:03:22 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d9ac31cb051so2412166276.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 14:03:21 -0700 (PDT)
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
X-Inumbo-ID: f08201aa-6a0b-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697231000; x=1697835800; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=YXOr8ZRyYKF+yny5oQrtwKUq0azrzm9xi50bHXIFj9D+KV16/N3LIEsjPcaho3cBhm
         DvpmFqh/Xl5ckNqlNpvr3Xc6JJmr0l9JpB4WE6SCEsX4MRMT+A/HPHXw/152m0nLrsXn
         e2q4xd5vnA/twJwMlVTRVpE1w34klDeb/wwiqKpHxTIdW0NwZIU7fTGwXa3Ocn6EVvtc
         CVkQk0SOg3D5uOGHwabJX2wTgLviPW5yB9THY1Md39IObCXQ8fevGge9FHp3jhNc37t5
         8D5gfVm1aDVbIn2Xq39Rqk+dsBj9CUuxi5g/rLEBauPQ4RHU+NXkDoSqo+Mqh4Lz49s4
         kDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231000; x=1697835800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=CwBUexGbI0yxOMu/LNIE+4IWG3xnZKcYIpQ7VI88w7eXExi7wAU7hA6mlqPZYScW+3
         MhJvqEoXLgq3rAXEAtI7hUJVCe4ATQSa+rtRhn/+iMq5xuMFT9RCF9DxAmhyBMDCjHws
         QCrsHi4vDj6q0ZF9xKywGXsA9ngG4HJu/OIbDWQab2lbgakChZSqwgO2jWEAzgyStPaD
         ZGCh9onqFbwMC5NK03J9TdXPdCZJSMTcsCT2lWbbyy9stDacb/paJaTbiz5/Z+NvFbIk
         dTuvrosgYxr3+tiGreyMpZBb/XT523NQaR8TKCG1sbQodX3lWg3hz+n3CL7PIGHEDSTV
         BGVg==
X-Gm-Message-State: AOJu0Yxw7/E1xO/wxiEuSz7Xmk6f33aQ7vN5aaEFP3z71ixvxIg2FR9f
	7gbnlN0V3GLJcfAvf0rjIGarPB9IDyeTF9InTUo=
X-Google-Smtp-Source: AGHT+IHWHj9ILTPWExZ8ekeA0/ryyRW0ZV6k5VhEVnOo+k5EpZsvEbKt/nom23K7vTTS2zHZvjjk2tEmm58T8MLLm1U=
X-Received: by 2002:a5b:64d:0:b0:d9b:3b3e:5a07 with SMTP id
 o13-20020a5b064d000000b00d9b3b3e5a07mr2004058ybq.5.1697230999223; Fri, 13 Oct
 2023 14:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230807230513.102486-1-vishal.moola@gmail.com>
 <20230807230513.102486-15-vishal.moola@gmail.com> <20231012072505.6160-A-hca@linux.ibm.com>
In-Reply-To: <20231012072505.6160-A-hca@linux.ibm.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Fri, 13 Oct 2023 14:03:08 -0700
Message-ID: <CAOzc2px-SFSnmjcPriiB3cm1fNj3+YC8S0VSp4t1QvDR0f4E2A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v9 14/31] s390: Convert various pgalloc
 functions to use ptdescs
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 12:25=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com>=
 wrote:
>
> On Mon, Aug 07, 2023 at 04:04:56PM -0700, Vishal Moola (Oracle) wrote:
> > As part of the conversions to replace pgtable constructor/destructors w=
ith
> > ptdesc equivalents, convert various page table functions to use ptdescs=
.
> >
> > Some of the functions use the *get*page*() helper functions. Convert
> > these to use pagetable_alloc() and ptdesc_address() instead to help
> > standardize page tables further.
> >
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  arch/s390/include/asm/pgalloc.h |   4 +-
> >  arch/s390/include/asm/tlb.h     |   4 +-
> >  arch/s390/mm/pgalloc.c          | 128 ++++++++++++++++----------------
> >  3 files changed, 69 insertions(+), 67 deletions(-)
> ...
> > diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> > index d7374add7820..07fc660a24aa 100644
> > --- a/arch/s390/mm/pgalloc.c
> > +++ b/arch/s390/mm/pgalloc.c
> ...
> > @@ -488,16 +486,20 @@ static void base_pgt_free(unsigned long *table)
> >  static unsigned long *base_crst_alloc(unsigned long val)
> >  {
> >       unsigned long *table;
> > +     struct ptdesc *ptdesc;
> >
> > -     table =3D (unsigned long *)__get_free_pages(GFP_KERNEL, CRST_ALLO=
C_ORDER);
> > -     if (table)
> > -             crst_table_init(table, val);
> > +     ptdesc =3D pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, CRST_ALLO=
C_ORDER);
>
> I guess I must miss something, but what is the reason to mask out
> __GFP_HIGHMEM here? It is not part of GFP_KERNEL, nor does s390 support
> HIGHMEM.

You're not missing anything.

This was replacing __get_free_pages() which also doesn't support HIGHMEM,
so I had that in to ensure a non-HIGHMEM allocation in case a
passed-in gfp_flags
had it set. In hindsight since we're just passing in the GFP flags
directly here, we don't
actually need to mask out GFP_HIGHMEM.

