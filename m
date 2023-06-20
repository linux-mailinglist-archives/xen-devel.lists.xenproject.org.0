Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C673758E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 22:02:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552259.862229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBhY1-00053t-3e; Tue, 20 Jun 2023 20:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552259.862229; Tue, 20 Jun 2023 20:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBhY1-00051Q-0m; Tue, 20 Jun 2023 20:01:53 +0000
Received: by outflank-mailman (input) for mailman id 552259;
 Tue, 20 Jun 2023 20:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9op=CI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qBhXz-00051J-Lu
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 20:01:51 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b0f2bf9-0fa5-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 22:01:50 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b44b5adfd3so3803696a34.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 13:01:50 -0700 (PDT)
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
X-Inumbo-ID: 4b0f2bf9-0fa5-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687291309; x=1689883309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4F3qXm8x1AVi+0TrKGx40m/sFxYrt6Lj9IeE/BrpeU=;
        b=g8Wha6YZBIQ4F35wQ8P6Y0c98+3LfOEjAen8YviDIN/VpMlvLwu/TwEQtEhwi2wLbk
         4/b97qENpIhbKycIE1G3aUVCeb+vz/rCN/gI0l10ch7iG8C6c3ywB5bQ5tQe6ryGYXul
         5XkEWnvnLWIaJ1vsJQRh6tPgKWpuL7AyPHBFZQZGhCATWoDKR1D2YRUNFvvEx6dCnM6X
         zMyQcs2OOhmWkXYBbd2Z3eHBKxjZIMZIeFLBGw0YYdvfY15fMS5Ra2rC/awJj+k/fir6
         OMXeho7/p64d1/Gcc6dtEtZlx65PVhnR78rxvmM8tH1fn8015FZgY0Ml6WWkfDm6BXzA
         dR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687291309; x=1689883309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4F3qXm8x1AVi+0TrKGx40m/sFxYrt6Lj9IeE/BrpeU=;
        b=UwvH+Uh1pUao8tCQRao1Xs7NkBJp7yqk0kQsyDWRzl5MqXdKxkuRygAJiCjogwwlzs
         yvgovL80p2ycGzphLtxDkcGFUsP1nrhHjKGzbHqz4Z+VlPxnytz9ySAtMO94m5fbkMXh
         fpBHsQFSzAC30+JLfDZ0PL6FX3Vo5dgrmVTUDmiXMKmeJVVQgRMh3PjQrmqaYH5zMEpq
         ThKkg/Agy8Rsy4dSTA5sLKcwIPn0gdq5DP69JZkR+rg7MWgwDHSxBKSlJ8YgnC7pkKeW
         w46do1zmlCGIuebTWmIl1oUozZa+Kz+MnQcTpwwStqWbKFg5C/aUCgHvmE6zTGyQwKIP
         OWaQ==
X-Gm-Message-State: AC+VfDxaukHYjwsHGiDndK8Dagm5Bj1mdvO4G0dE9WD4c5+Jfq3j4KXk
	svIE2acDk8O453XXn1z6uc++macY+pxTCt1p5Y8=
X-Google-Smtp-Source: ACHHUZ4Hj3uSYs4sk8lvmBdlBVPXrs6qDttIob0+AqgPuiIWdgPfm9A1hihEUgTK87y6a2gHhIBkt791vtKGzbzprm8=
X-Received: by 2002:a05:6358:f0e:b0:12b:ed05:18bb with SMTP id
 b14-20020a0563580f0e00b0012bed0518bbmr8612256rwj.27.1687291309110; Tue, 20
 Jun 2023 13:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com> <ZIxXw9ERkYv+ipdd@nvidia.com>
In-Reply-To: <ZIxXw9ERkYv+ipdd@nvidia.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 20 Jun 2023 13:01:39 -0700
Message-ID: <CAOzc2pwMW64O0m4Zu4zVFTY+qCJRK7V+7niN_t1m7pLaJrtb2A@mail.gmail.com>
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 5:38=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Mon, Jun 12, 2023 at 02:03:53PM -0700, Vishal Moola (Oracle) wrote:
> > Currently, page table information is stored within struct page. As part
> > of simplifying struct page, create struct ptdesc for page table
> > information.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  include/linux/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index c5a51481bbb9..330de96ebfd6 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -975,6 +975,57 @@ static inline void ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> >  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> >  #endif /* CONFIG_MMU */
> >
> > +
> > +/**
> > + * struct ptdesc - Memory descriptor for page tables.
> > + * @__page_flags: Same as page flags. Unused for page tables.
> > + * @pt_list: List of used page tables. Used for s390 and x86.
> > + * @_pt_pad_1: Padding that aliases with page's compound head.
> > + * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
> > + * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap on=
ly.
> > + * @pt_mm: Used for x86 pgds.
> > + * @pt_frag_refcount: For fragmented page table tracking. Powerpc and =
s390 only.
> > + * @ptl: Lock for the page table.
> > + *
> > + * This struct overlays struct page for now. Do not modify without a g=
ood
> > + * understanding of the issues.
> > + */
> > +struct ptdesc {
> > +     unsigned long __page_flags;
> > +
> > +     union {
> > +             struct list_head pt_list;
> > +             struct {
> > +                     unsigned long _pt_pad_1;
> > +                     pgtable_t pmd_huge_pte;
> > +             };
> > +     };
> > +     unsigned long _pt_s390_gaddr;
> > +
> > +     union {
> > +             struct mm_struct *pt_mm;
> > +             atomic_t pt_frag_refcount;
> > +     };
> > +
> > +#if ALLOC_SPLIT_PTLOCKS
> > +     spinlock_t *ptl;
> > +#else
> > +     spinlock_t ptl;
> > +#endif
> > +};
>
> I think you should include the memcg here too? It needs to be valid
> for a ptdesc, even if we don't currently deref it through the ptdesc
> type.

Yes, thanks for catching that! I'll add it to v5.

> Also, do you see a way to someday put a 'struct rcu_head' into here?

Eventually, when they're being dynamically allocated independent of
struct page. Although at that point I'm not sure if we'll need one.

> Thanks,
> Jason

