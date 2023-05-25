Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F85711849
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 22:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539870.841168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Hjp-0004zc-4X; Thu, 25 May 2023 20:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539870.841168; Thu, 25 May 2023 20:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Hjp-0004xF-1m; Thu, 25 May 2023 20:39:09 +0000
Received: by outflank-mailman (input) for mailman id 539870;
 Thu, 25 May 2023 20:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN8z=BO=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q2Hjn-0004x5-CF
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 20:39:07 +0000
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30f15455-fb3c-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 22:39:06 +0200 (CEST)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-babb985f9c8so207612276.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 13:39:06 -0700 (PDT)
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
X-Inumbo-ID: 30f15455-fb3c-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=hsCL+sMjCSPEeQwY9ipI1+Ugi88AzJEwmAmsO1IR16vD0JLbTTRj1EWY5Xyhze+GRV
         OIRanM33HOk1xRjR7/GHHUD5lVS6HFpcFxeDfzeE8/I0OcBZz8czUxvwLPGCPl3ZI/jZ
         DVqHoFaNkDaMUMuSYvpfhlO6EV7GylFCaeIZ84F6j+93L973raF6hD3O66C/pZ4eWLz+
         QLbFT/lbaOp/9U1+H051UFvXelrd7lzOtz3vj1HsEWe84ksN1HTRbSJYJedE8uZu9k6u
         F1jI+oM85Ujez7vT22bFzFiXTlvVTKRouPJkd38Xldm/McWaSi1VxP376ACeyocGF45q
         tGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=l9Ql/6qVhx2pf5S+5sAahuBZp2ILHAXjziLFR5RdlHQd0Exte2pu4ljDSfv1xMzXvL
         1wke6KnkmCy0BltJwXKnOwpx0WJUgtZ6Z97/d2TATrRlAxAFBSaB3DbCCacNN8e57DSC
         owfh5dyJrKLSXaYAWWW1OonLV3H6J+sM+2mJUW8fPGo5VqzNDrvagXW3E1XaNW2LrCgO
         TEKQCyPYSCBgGJoQwS1mZl5CUlenkEJHeeYQyHGPtaNMuczPibk+nWHwizvHeApkZLJu
         UI3JTx+tSe2O6bIP4yWkCdkvht3bzyfez+uSF6qqClZaQoEg1X7oTI/YFbJGsQrRF4Xm
         hTUw==
X-Gm-Message-State: AC+VfDw5ZSlOHyOohCW6YxOub0iJMJcJFLnzs9Hf2LXbn+4qbINIgJXv
	Ggc4nEerrjXktmU5/i+8KUPsnl2uzQwh50Rau2M=
X-Google-Smtp-Source: ACHHUZ4OcPsUwJDpZZlKfNKbpYbRuRkX6Q4UETTfFRyNyytwfdAtGP02e8IuqJSt1+a/7sd0aU+yePVkYawV73NLE1o=
X-Received: by 2002:a25:d111:0:b0:ba8:4b48:1de0 with SMTP id
 i17-20020a25d111000000b00ba84b481de0mr4810389ybg.47.1685047145065; Thu, 25
 May 2023 13:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com> <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com> <20230525202011.GZ4967@kernel.org>
In-Reply-To: <20230525202011.GZ4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 13:38:54 -0700
Message-ID: <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
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

On Thu, May 25, 2023 at 1:20=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 25, 2023 at 10:00:23AM -0700, Vishal Moola wrote:
> > On Thu, May 25, 2023 at 1:56=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > Hi,
> > >
> > > On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote=
:
> > > > No folio equivalents for page type operations have been defined, so
> > > > define them for later folio conversions.
> > >
> > > Can you please elaborate why would we need folios for page table desc=
riptors?
> >
> > Thanks for the review!
> >
> > These macros are for callers that care about the page type, i.e. Table =
and
> > Buddy. Aside from accounting for those cases, the page tables don't use=
 folios.
> > These are more for the cleanliness of those callers.
>
> But why using folio APIs for PageType will be cleaner than using page API=
s?
> Do you have an example?

Ah, for example in mm/memory-failure.c there are a couple uses of PageTable=
.
Like the line :
if (folio_test_slab(folio) || PageTable(&folio->page) ||
folio_test_reserved(folio))
where that PageTable(&folio->page) can now be written as folio_test_table(f=
olio)
instead.

Also there are numerous uses of PageBuddy in mm/compaction.c that will
likely need to be converted to folios as well.

