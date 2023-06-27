Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A17402AA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 19:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556233.868589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECrO-0003qU-GF; Tue, 27 Jun 2023 17:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556233.868589; Tue, 27 Jun 2023 17:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECrO-0003oG-Dg; Tue, 27 Jun 2023 17:52:14 +0000
Received: by outflank-mailman (input) for mailman id 556233;
 Tue, 27 Jun 2023 17:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qECrN-0003oA-9r
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 17:52:13 +0000
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57a73d5b-1513-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 19:52:12 +0200 (CEST)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b708b97418so4267344a34.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 10:52:12 -0700 (PDT)
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
X-Inumbo-ID: 57a73d5b-1513-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687888331; x=1690480331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya0gjT04wvrkPEwxsIo0SrjOZFrw43ACMJ5aI2sBKGs=;
        b=jU0XSQm/UgQNqhqQcjqaxOHJKL3Tu8GM/GwEobHZGDkP+x8DVdgSjRkU85h/Lj/+te
         oZwK4Q1yO37Pzbn1i7oZRsd+yfivOXZX9DLv/iX+OOzSZ/17s4ytR4cUrCKbaq8ScVjb
         y4NBy98BQyt8WGI73+o5s1aq7cUaSdPW95ULfQ6FlPkdUprfA5PQkMvKjJsZAGVBcKqi
         qlieckJVpQyRqbWlQMoi71Q4k95ldkAZz69rpAi1h8kLQ3wxt3idqYMSWF1Mqn3mJooy
         Rs2GGbK0m2G7LUgnIAcus/1X+0dgeX1Usy3dZ/2MF2ihQvsHs5fE8nG3/WrSESAbmo+3
         LPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687888331; x=1690480331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ya0gjT04wvrkPEwxsIo0SrjOZFrw43ACMJ5aI2sBKGs=;
        b=Z0HPCaUtZFOY8yhWQAMrBKa1g5IgHbsdEG46ez8hGdX8H+aAoIyg5/SPmEja6o8ZDJ
         0No9bS2R1Ym1trlceN1xmRTvhBNdSN2XUEpW8rTZXYSSBg6f/rX0g8iTcfyVuPQpoVmm
         2mHlr7csrOFlGxIl485/WONK9EJbNvFnfDyTRrWpsNl/d2gqIHm/jQWRDmo73E/h+U80
         VFi/u65ylGHaoTOdvUrW6zHuHEYS6xx4eUg5vb0eLHPlOstBJKVP/iermr358+6sf2SK
         Zbd2aVp0K1z0DzpbKwtZSXVyb0NzUc4ynqd9aYMHHpiUJqMEF356jq6eI5Bf2pKne6Ji
         jHHg==
X-Gm-Message-State: AC+VfDzMDCrryLEkNyOUVDgRG2oM1+p7PdRd13o6HxXs+iiM1nji9ZO+
	HnXUo5OY+v2THfKBv9YB7dZ0oo/yslDACKxqO24=
X-Google-Smtp-Source: ACHHUZ60PXVLGXFjCZbPL4+H89P+QaultgII2fPTXJpRhifF/y6voZRlslPkfFetToA56imkT1WhjHNqMU1RYiBUm6M=
X-Received: by 2002:a05:6359:d23:b0:133:a55:7e26 with SMTP id
 gp35-20020a0563590d2300b001330a557e26mr5444430rwb.7.1687888330839; Tue, 27
 Jun 2023 10:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <20230627031431.29653-4-vishal.moola@gmail.com> <ZJsJT9dLtxaKlxVb@x1n>
In-Reply-To: <ZJsJT9dLtxaKlxVb@x1n>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 27 Jun 2023 10:51:59 -0700
Message-ID: <CAOzc2pw2U2XvMcaEdy18UYe=5=PeCBn_qLR_3ns8_nWvgSSDQw@mail.gmail.com>
Subject: Re: [PATCH v6 03/33] pgtable: Create struct ptdesc
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 9:07=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Jun 26, 2023 at 08:14:01PM -0700, Vishal Moola (Oracle) wrote:
> > Currently, page table information is stored within struct page. As part
> > of simplifying struct page, create struct ptdesc for page table
> > information.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  include/linux/pgtable.h | 68 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 5063b482e34f..d46cb709ce08 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -987,6 +987,74 @@ static inline void ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> >  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> >  #endif /* CONFIG_MMU */
> >
> > +
> > +/**
> > + * struct ptdesc -    Memory descriptor for page tables.
> > + * @__page_flags:     Same as page flags. Unused for page tables.
> > + * @pt_rcu_head:      For freeing page table pages.
> > + * @pt_list:          List of used page tables. Used for s390 and x86.
> > + * @_pt_pad_1:        Padding that aliases with page's compound head.
> > + * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
> > + * @_pt_s390_gaddr:   Aliases with page's mapping. Used for s390 gmap =
only.
>
> Should some arch-specific bits (and a few others) always under some
> #ifdefs, so it shouldn't appear on other archs?

Right now this struct completely overlays struct page, so the padding as
well as any arch-specific fields have to stay. Whenever we get ptdescs
independent of struct page we can cleanup any unnecessary fields, as
well as omit unnecessary fields from unrelated architectures.

