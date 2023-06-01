Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958B27191EC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 06:36:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542233.845844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4a3G-0004Jg-V2; Thu, 01 Jun 2023 04:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542233.845844; Thu, 01 Jun 2023 04:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4a3G-0004HY-Rm; Thu, 01 Jun 2023 04:36:42 +0000
Received: by outflank-mailman (input) for mailman id 542233;
 Thu, 01 Jun 2023 04:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPA7=BV=kernel.org=guoren@srs-se1.protection.inumbo.net>)
 id 1q4a3F-0004HQ-GE
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 04:36:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5d2dc4a-0035-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 06:36:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF5CB60010
 for <xen-devel@lists.xenproject.org>; Thu,  1 Jun 2023 04:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54232C4339C
 for <xen-devel@lists.xenproject.org>; Thu,  1 Jun 2023 04:36:37 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5147e441c33so1066359a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 21:36:37 -0700 (PDT)
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
X-Inumbo-ID: e5d2dc4a-0035-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685594197;
	bh=QZIVYOfQMQfDIruN7rSg689YIbiJbkkfE8AKRfy2n5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XjX+qO5TgZej3fh2HJQIqiOR5PxyL4koYuTQx2qeUwz0mw2WS7S8765bRMbrDCQVG
	 whIGCjOlXBTjeWiN2+LrCx+Or8mSlhjQdHY5MFaYnqKspwUjKhBsJekNkwwwC3A2tK
	 RRJ+PYWLTNVwk2Tc4E1sjjLY66LER3hFT6QIRdlz0YEtfE5QnejkEMpgjlFtCb1L5b
	 jav2+jHQW0E6lB/EBDYRssonNB4dhirDM2pvI3kpcWJ0B9czAKVTkvmbZ2ylsgGsMq
	 x3kGCiBqFY0IqxyFq7Pvs4DJbAWcMeNsAFCqYa1UhLYAOwr6LlCcKM6JbTbj+s1hsP
	 DnX5huppMSCjQ==
X-Gm-Message-State: AC+VfDztFkhoKLsZOuxPlGFryVx6rUtIFMF/8aSWgv4WuPF0AkzaufXZ
	LunV0pbKHpHBLeDE81cxhxXVpd1+ztu+82o8CrA=
X-Google-Smtp-Source: ACHHUZ7XdaYihX3P0occ4fimfrY7vXLE/b8sATTjW74eXROnZDFW1BQ/va3F8G7kmqLig8peXPPgGCGmqMpiLEgKGXM=
X-Received: by 2002:a05:6402:3511:b0:4fc:97d9:18ec with SMTP id
 b17-20020a056402351100b004fc97d918ecmr437472edd.21.1685594195535; Wed, 31 May
 2023 21:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-23-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-23-vishal.moola@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Jun 2023 12:36:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSEguewbRMD8w3u3tfSPt-Opy+i=jm_8W2+NtAP1OYSsA@mail.gmail.com>
Message-ID: <CAJF2gTSEguewbRMD8w3u3tfSPt-Opy+i=jm_8W2+NtAP1OYSsA@mail.gmail.com>
Subject: Re: [PATCH v3 22/34] csky: Convert __pte_free_tlb() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
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

Acked-by: Guo Ren <guoren@kernel.org>

On Thu, Jun 1, 2023 at 5:34=E2=80=AFAM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  arch/csky/include/asm/pgalloc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgal=
loc.h
> index 7d57e5da0914..9c84c9012e53 100644
> --- a/arch/csky/include/asm/pgalloc.h
> +++ b/arch/csky/include/asm/pgalloc.h
> @@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>
>  #define __pte_free_tlb(tlb, pte, address)              \
>  do {                                                   \
> -       pgtable_pte_page_dtor(pte);                     \
> -       tlb_remove_page(tlb, pte);                      \
> +       pagetable_pte_dtor(page_ptdesc(pte));           \
> +       tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
>  } while (0)
>
>  extern void pagetable_init(void);
> --
> 2.40.1
>


--=20
Best Regards
 Guo Ren

