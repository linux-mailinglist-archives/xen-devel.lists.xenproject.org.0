Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A471F415
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 22:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542729.846925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4p90-0005Or-Ql; Thu, 01 Jun 2023 20:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542729.846925; Thu, 01 Jun 2023 20:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4p90-0005Mp-O1; Thu, 01 Jun 2023 20:43:38 +0000
Received: by outflank-mailman (input) for mailman id 542729;
 Thu, 01 Jun 2023 20:43:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8Gk=BV=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4p8y-0005Mj-P9
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 20:43:36 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f87521dc-00bc-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 22:43:32 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-565ba53f434so13144557b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Jun 2023 13:43:32 -0700 (PDT)
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
X-Inumbo-ID: f87521dc-00bc-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685652211; x=1688244211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1D8lVOaAVBWbT9t2RmOD+26281abLHxtrNSt32Ap24=;
        b=qLgbJbj5g8WGk9vr+h5GU3VAGYoZuUQfYy+Jk03a6BWdaBQStekzq99EEhSRb/apVE
         r1wG5klq4xTuvlp4fzfvGwGvXsPOH5Z+EGzZ3xDm5VuokYBfnX2Z7EeXpvrNqoMOmFfA
         JBLO6CGLz8pEI44d71tWawLxUIyiVrcZLnzOInnX4NDx0adjPFt4WqdjoFpvwTeJeP42
         YdR8VtfFc5+TjUwWFHzsShyWmg/NGqDFZTc1nDT9EKaeGOrhYp9pTMhkn6c++xEXcw0Z
         7/JenW6z+3FLVb69Ur5a6g5NHDXYEBFsl6KltuWvHl5pgiI7Ar5zj9KICtB4zwOfTiPP
         PMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685652211; x=1688244211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1D8lVOaAVBWbT9t2RmOD+26281abLHxtrNSt32Ap24=;
        b=WOCfScc07ohUUNF8CAwVrYjyuNZs4t/au85IQuZZ9VGvuSbkMA8lYIkxpm+EOLYyai
         1tbjV9l6ApXrygZEgesfZtwW1WUyDl/1pL9RZKu8r4og2fm1HqB02XA9KLLqnVnR7p9U
         efBhGOug1akUnfW/eClBUTc3EWCJTJ/rzrMgLCrDNv5aAh5KE1leIHvkV/SWGGHZz1rF
         ++sZI78TbKTF/N4qCzvjihJVLLTdK6Jsm/UOS8xfPW6PGkC7LnsWv4Sv9Oauaon1nlN2
         PU7Q6/MAGLB5q30v67ce/H9CGHkuGKBI9hzUHAtmibYKeyaGq5Itekb4JIUDlfAYmEMs
         4XoA==
X-Gm-Message-State: AC+VfDx5qqLIdCUfEau5jNF6PDbCRIDpohEyrZjHld87DmAn8xkcAP6p
	0r0pXv0QjMDFb3z4TSfSedkUmS5LbDKTIj3Seck=
X-Google-Smtp-Source: ACHHUZ5DfuhGus+PqmBDfDw3I8CUwiopOPmtEZnOXp6mFa4otjE0OnORW5aklQp2qVjtyKAx2ImFFxSDC1ok71Q6xew=
X-Received: by 2002:a0d:e84b:0:b0:565:f045:18c3 with SMTP id
 r72-20020a0de84b000000b00565f04518c3mr10614817ywe.20.1685652211220; Thu, 01
 Jun 2023 13:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-4-vishal.moola@gmail.com> <20230601151900.6f184e8c@thinkpad-T15>
In-Reply-To: <20230601151900.6f184e8c@thinkpad-T15>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 13:43:20 -0700
Message-ID: <CAOzc2pyjLh_GV1PL7CPkkPGcASHULhir_rJgB+UhwzPgQZD8Bw@mail.gmail.com>
Subject: Re: [PATCH v3 03/34] s390: Use pt_frag_refcount for pagetables
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hugh Dickins <hughd@google.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 6:19=E2=80=AFAM Gerald Schaefer
<gerald.schaefer@linux.ibm.com> wrote:
>
>  On Wed, 31 May 2023 14:30:01 -0700
> "Vishal Moola (Oracle)" <vishal.moola@gmail.com> wrote:
>
> > s390 currently uses _refcount to identify fragmented page tables.
> > The page table struct already has a member pt_frag_refcount used by
> > powerpc, so have s390 use that instead of the _refcount field as well.
> > This improves the safety for _refcount and the page table tracking.
> >
> > This also allows us to simplify the tracking since we can once again us=
e
> > the lower byte of pt_frag_refcount instead of the upper byte of _refcou=
nt.
>
> This would conflict with s390 impact of pte_free_defer() work from Hugh D=
ickins
> https://lore.kernel.org/lkml/35e983f5-7ed3-b310-d949-9ae8b130cdab@google.=
com/
> https://lore.kernel.org/lkml/6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.c=
om/
>
> There he uses pt_frag_refcount, or rather pt_mm in the same union, to sav=
e
> the mm_struct for deferred pte_free().
>
> I still need to look closer into both of your patch series, but so far it
> seems that you have no hard functional requirement to switch from _refcou=
nt
> to pt_frag_refcount here, for s390.
>
> If this is correct, and you do not e.g. need this to make some other use
> of _refcount, I would suggest to drop this patch.

The goal of this preparation patch is to consolidate s390's usage of
struct page fields so that struct ptdesc can be smaller. Its not particular=
ly
mandatory; leaving _refcount in ptdesc only increases the struct by
8 bytes and can always be changed later.

However it is a little annoying since s390 is the only architecture
that egregiously uses space throughout struct page for their page
tables, rather than just the page table struct. For example, s390
gmap uses page->index which also aliases with pt_mm and
pt_frag_refcount. I'm not sure if/how gmap page tables interact
with s390 process page tables at all, but if it does that could
potentially cause problems with Hugh's patch as well :(

I can add _refcount to ptdesc if we would like, but I still
prefer if s390 could be simplified instead.

