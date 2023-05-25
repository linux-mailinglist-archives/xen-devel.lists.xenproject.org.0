Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D98711885
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 22:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539874.841178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Hxr-0007N1-CK; Thu, 25 May 2023 20:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539874.841178; Thu, 25 May 2023 20:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Hxr-0007KY-9U; Thu, 25 May 2023 20:53:39 +0000
Received: by outflank-mailman (input) for mailman id 539874;
 Thu, 25 May 2023 20:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN8z=BO=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q2Hxq-0007KS-6b
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 20:53:38 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 377f41ed-fb3e-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 22:53:36 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-56187339d6eso2628037b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 13:53:36 -0700 (PDT)
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
X-Inumbo-ID: 377f41ed-fb3e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685048015; x=1687640015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e72vGCwhPoa8gN25X6qmdDXVUsdWWJFQx8MjqDcoGDA=;
        b=PRDb4uH8g3Vv6gZWsZ1gkHY+ANMWnqtSqEQNi+t68NKJyRAPGtGIjXS+o6ABKHZ7yv
         q51K7Vr8Q1brsvSZQkdt4WeLJo6vXr04Grr6RxGrB/PY5E3pp1cBQWvGni0wb9TWYIbM
         5FWOkPlw4M42rE2TxcMBGldDhB3WLqb55j0CqgwQEW0TmVHxxCeHx2Zs7VLCqGumlN8c
         PmQWTAjBOIMu7fHadjtAjQF7IDQQLa3x/OUyFY2aJiBpGADt0K07OCNxrHer3KqiVV69
         GxawL7cJdKwcX3ZUAGYa8EVBTKoLWza/yXtntrwGkP8KyxHL6U40gF5XovIoxt2V2Fr9
         5Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685048015; x=1687640015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e72vGCwhPoa8gN25X6qmdDXVUsdWWJFQx8MjqDcoGDA=;
        b=lbsddx1kGoiV/T9/oP/K3/N7mnMYgZ+Gipsd+t2ZC115qZMGn2HksFk6O6YQisL7d9
         7a4E1/csr8PvrJVkbLn5NXorBDjUlho+tV4ZSHdU87VdCEjm92pjwI4sf/T6x92l3tgI
         toM6RwygW38Z6sdqOidabnbMLH8X3tUzygADoTzjCJAh4lmk5edqh2FJE6N83TG+ORks
         cDJFlg6qgwYvryMU8WUIT/0mhpPlkYp+7SCyWcn+STNvx730BrcE3dcdCHaJVqHqj/Zm
         oDfyTEbEKanTmNeZf7gThsdymSFEN7L5gZf5RdkRGe1rQoPahzBAKC19uUV6cIJY1gpU
         H/+w==
X-Gm-Message-State: AC+VfDwfCKr8X1B8axfvZy0vBPQBvee0AH5BOqonHgfGHM0yU24xulKv
	o3qXm7VX4aSnYDudGwYdApGH6IiCL6M815htMBs=
X-Google-Smtp-Source: ACHHUZ6an6zID91jt8f3LQ4QGAvFJ9u++x53xf0fSCLXe0WivFCmGXJlgIcqvJgo7KICituWVYFJf3qgdSw5/O75Zdg=
X-Received: by 2002:a81:4810:0:b0:55a:84c9:e952 with SMTP id
 v16-20020a814810000000b0055a84c9e952mr1013445ywa.17.1685048014974; Thu, 25
 May 2023 13:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com> <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com> <20230525202537.GA4967@kernel.org>
In-Reply-To: <20230525202537.GA4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 13:53:24 -0700
Message-ID: <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 1:26=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 25, 2023 at 11:04:28AM -0700, Vishal Moola wrote:
> > On Thu, May 25, 2023 at 2:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > > > +
> > > > +static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int =
order)
> > > > +{
> > > > +     struct page *page =3D alloc_pages(gfp | __GFP_COMP, order);
> > > > +
> > > > +     return page_ptdesc(page);
> > > > +}
> > > > +
> > > > +static inline void ptdesc_free(struct ptdesc *pt)
> > > > +{
> > > > +     struct page *page =3D ptdesc_page(pt);
> > > > +
> > > > +     __free_pages(page, compound_order(page));
> > > > +}
> > >
> > > The ptdesc_{alloc,free} API does not sound right to me. The name
> > > ptdesc_alloc() implies the allocation of the ptdesc itself, rather th=
an
> > > allocation of page table page. The same goes for free.
> >
> > I'm not sure I see the difference. Could you elaborate?
>
> I read ptdesc_alloc() as "allocate a ptdesc" rather than as "allocate a
> page for page table and return ptdesc pointing to that page". Seems very
> confusing to me already and it will be even more confusion when we'll sta=
rt
> allocating actual ptdescs.

Hmm, I see what you're saying. I'm envisioning this function evolving into
one that allocates a ptdesc later. I don't see why we would need to have bo=
th a
page table page AND ptdesc at any point, but that may be a lack of knowledg=
e
from my part.

I was thinking later, if necessary, we could make another function
(only to be used internally) to allocate page table pages.

