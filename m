Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF11703D6C
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 21:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534825.832208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pydc1-0008FP-6n; Mon, 15 May 2023 19:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534825.832208; Mon, 15 May 2023 19:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pydc1-0008C3-3e; Mon, 15 May 2023 19:12:01 +0000
Received: by outflank-mailman (input) for mailman id 534825;
 Mon, 15 May 2023 19:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TE02=BE=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1pydbz-0008Bv-Mq
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 19:11:59 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cbb3f47-f354-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 21:11:58 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-b9daef8681fso11343711276.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 May 2023 12:11:58 -0700 (PDT)
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
X-Inumbo-ID: 5cbb3f47-f354-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684177917; x=1686769917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEdsDznoeQ0wGPMJWBs10mMvCj7VphDqPqR+uizklHY=;
        b=W/Z9qzmBUq3bCVhP8uewmPEIaZEVYfzpzeh9YTeAKrK3sWIwtOfql71JlvN0P+P5pK
         YKy9cml02fk4SnFQ2DdWQ6w4JijHunpNA4zsiud1GYDMnfuy8RTxF/bEehOFA+aPeByE
         DTSRG2bdMMqymbgvM1f+cbSlSYq+sQANl8uMoYLlmajJ3SyWJdGVyTNcYD0Ioakieviy
         BESs3L0iPHTKfiNNq75aO8FTJdn/BYay+E8sIKUXSqB49RgAR5VB2xxzW+nwEEKofO5F
         26ssX78nNr5JZdvfN8wyMBJyb6MRO06YlrKHWh/GpY8CaWKtewkcbGK5ZJkz6FL2Wiq9
         dAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684177917; x=1686769917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEdsDznoeQ0wGPMJWBs10mMvCj7VphDqPqR+uizklHY=;
        b=kbRMhbxm4l6DDlJ0mEujGj2JvXwWm5w0PBBar109nZbOf0f4yVZOeDApCLgTZTwcdS
         BYeHAvk8aKNhCoLABge9JyPDKbgRI0iHmX88hyWajbG0RYjHVlT2i2XmapYeqkoEsftN
         6aHLXdKocuIOi5yHqgxy2Ga2CFTIPC6UatUneLU1MO6LTdFlS64HcOk9AKisyGTAa1Hd
         g1LK6y5B1igeWdSkC5fB/PXCyhtBnxYgO4TzXcZ4bgYGozivp1+MD2kyNRS3qCUXw790
         D8kQPDFtUShpYF/HeccrdJRrjFZltbwbyK2bfmGzB3D1QyueiAkSxPUL2EJwbJhZfcQC
         w3vQ==
X-Gm-Message-State: AC+VfDwufhP0+/ET6C+YJD3jpBe5O1E1Z8ba88wtCTkSmv1yZ+CaQZFX
	ASmcqT2L6JBzg7e3ZEtl2ci6Bx2/Nxk+iDj0Iow=
X-Google-Smtp-Source: ACHHUZ5oDsw20tcH12/01C4i2nT6w5iAb2H6/okJg55EYYpqTgJ8h9iiRdXz2tD9egoOuSwMxk4Rmyquuvv7u/aep3U=
X-Received: by 2002:a25:2586:0:b0:ba7:809c:50de with SMTP id
 l128-20020a252586000000b00ba7809c50demr6158133ybl.38.1684177917068; Mon, 15
 May 2023 12:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-31-vishal.moola@gmail.com> <c0677d21a4b6caa2e5018af000294a974121d9e8.camel@physik.fu-berlin.de>
In-Reply-To: <c0677d21a4b6caa2e5018af000294a974121d9e8.camel@physik.fu-berlin.de>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 15 May 2023 12:11:46 -0700
Message-ID: <CAOzc2pz6y=gRcdfkQVgwRuzWeWf2Nx-UBtKnZBTs2qKJ+r7R0Q@mail.gmail.com>
Subject: Re: [PATCH v2 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 6, 2023 at 4:35=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Vishal!
>
> On Mon, 2023-05-01 at 12:28 -0700, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents. Also cleans up some spacing issues.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  arch/sh/include/asm/pgalloc.h | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgallo=
c.h
> > index a9e98233c4d4..ce2ba99dbd84 100644
> > --- a/arch/sh/include/asm/pgalloc.h
> > +++ b/arch/sh/include/asm/pgalloc.h
> > @@ -2,6 +2,7 @@
> >  #ifndef __ASM_SH_PGALLOC_H
> >  #define __ASM_SH_PGALLOC_H
> >
> > +#include <linux/mm.h>
> >  #include <asm/page.h>
> >
> >  #define __HAVE_ARCH_PMD_ALLOC_ONE
> > @@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *m=
m, pmd_t *pmd,
> >       set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
> >  }
> >
> > -#define __pte_free_tlb(tlb,pte,addr)                 \
> > -do {                                                 \
> > -     pgtable_pte_page_dtor(pte);                     \
> > -     tlb_remove_page((tlb), (pte));                  \
> > +#define __pte_free_tlb(tlb, pte, addr)                               \
> > +do {                                                         \
> > +     ptdesc_pte_dtor(page_ptdesc(pte));                      \
> > +     tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
> >  } while (0)
> >
> >  #endif /* __ASM_SH_PGALLOC_H */
>
> Looking at the patch which introduces tlb_remove_page_ptdesc() [1], it se=
ems that
> tlb_remove_page_ptdesc() already calls tlb_remove_page() with ptdesc_page=
(pt), so
> I'm not sure whether the above tlb_remove_page_ptdesc((tlb), (page_ptdesc=
(pte)))
> is correct.
>
> Shouldn't it just be tlb_remove_page_ptdesc((tlb), (pte))?

As of this patchset all implementations of __pte_free_tlb() take in a
struct page. Eventually we'll want it to be tlb_remove_page_ptdesc(tlb, pte=
),
but for now the cast is necessary here.

