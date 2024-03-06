Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFB87419F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 22:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689516.1074574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhyRH-0002Vl-Dd; Wed, 06 Mar 2024 21:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689516.1074574; Wed, 06 Mar 2024 21:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhyRH-0002Tb-As; Wed, 06 Mar 2024 21:04:35 +0000
Received: by outflank-mailman (input) for mailman id 689516;
 Wed, 06 Mar 2024 21:04:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7u2=KM=soleen.com=pasha.tatashin@srs-se1.protection.inumbo.net>)
 id 1rhyRF-0002TR-So
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 21:04:34 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ab3eca-dbfd-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 22:04:32 +0100 (CET)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5a136ac89b3so64604eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 13:04:32 -0800 (PST)
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
X-Inumbo-ID: 20ab3eca-dbfd-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1709759071; x=1710363871; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqttQc0z5BWF+Q6AXLXQysSwEBzzLxVsfG6yMYfqEBc=;
        b=swWqlCHMmtAo8390tZF3nGOou0Gc9NpwD2obmTvecqErH2U7k4PLPcE+GMC6BIH4au
         bWH1oCVOPEgLFApFWMfTfAvh9LaUJiipZWF9l6BaOeCBRjLWX7gtodlOPj857rxu3M8K
         ln5R8U/lL0X7jdvYb4m3wRcKWPtTAGUp/R3HfC4WlUFdg0B5Vi0rn0J9/pcg0GKw5Zht
         v5OafqnhzbbS6GVugMk2RWhGYb4+kQEmq3VwXGiCm5sFgvrzrwhPu4+quWUO1wT4H+M9
         4KieZhlOnwbLn3eauxCsbjLF+ZcQRbzX9TvKqtx/Iwovzik+THsL3nkKphQeKjv00jOb
         Zq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709759071; x=1710363871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqttQc0z5BWF+Q6AXLXQysSwEBzzLxVsfG6yMYfqEBc=;
        b=w+NWDWAaHlWRud4fgJgGSTGysH8kQxDYMhZo1w+gFQtM7ljp8vpuCOWmldZg6ManOl
         E+gBiUsK5oD5Uuc1GLvtsw0Xgmo9J4VBNcPL/FlP/J8s0bWrTXEelHwBe9kou2ip2x8Z
         JvaaobYa0cQMhiVQ9O63pW99il9bbeV2DjjbYxRChI7r6S1ekD6enYrIzktZjS8IANdQ
         LTF/oeLeDP2f+2dEMR0pp5XdYQ5wzYe9IyId71e/i0+JYtJ5kdAtWMCnVJXNz+tADFaA
         T/cPYjMEjBd/wpAWgEnIXLDlE+oQm32aK3X1cSEwHQpBRTM7fnZPwGY9la0R1I5/qyf3
         VYeg==
X-Forwarded-Encrypted: i=1; AJvYcCW8MYAHXT7DUy2gdqOBK2r4J9A82zBrstTs2AvV2VFMOoVUAcTyVGdwVGm6G4kZmZkM0BArJYLQvRPfkttXXQMOgQaDg7c68zx34R1QIaU=
X-Gm-Message-State: AOJu0Ywy89DIuiBfCg/yfwRfCF6Atn/LUDpYJJSn12JwSDlNavnA73I8
	zLXKpMorBaigABrgMLy2P5y3NJXav+gqKR8fu/Br1FfsQf16CPmmSARbPZrk3OatsWiMf61LBn2
	GaMMUd78f4FP28D2liiiEEg+SNL5KC0XqCxJXnA==
X-Google-Smtp-Source: AGHT+IH0C9ZIzGNFSz2j11GV3Dru4fT7GOz2PcdFewNaPrEAF+/MVK+QyAyKdBXc1oQAITbi8412yO35RUBzydE/0Wo=
X-Received: by 2002:a05:6358:10a5:b0:17b:bd6e:22c9 with SMTP id
 j37-20020a05635810a500b0017bbd6e22c9mr8106933rwi.8.1709759071077; Wed, 06 Mar
 2024 13:04:31 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com> <20240305030516.41519-3-alexei.starovoitov@gmail.com>
In-Reply-To: <20240305030516.41519-3-alexei.starovoitov@gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 6 Mar 2024 16:03:54 -0500
Message-ID: <CA+CK2bDCgpYR2-gHv-H3vDXDqcoA16vMNr55BZ6nouZNdwGufQ@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/2] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	torvalds@linux-foundation.org, brho@google.com, hannes@cmpxchg.org, 
	lstoakes@gmail.com, akpm@linux-foundation.org, urezki@gmail.com, 
	hch@infradead.org, rppt@kernel.org, boris.ostrovsky@oracle.com, 
	sstabellini@kernel.org, jgross@suse.com, linux-mm@kvack.org, 
	xen-devel@lists.xenproject.org, kernel-team@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 10:05=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> From: Alexei Starovoitov <ast@kernel.org>
>
> vmap/vmalloc APIs are used to map a set of pages into contiguous kernel
> virtual space.
>
> get_vm_area() with appropriate flag is used to request an area of kernel
> address range. It's used for vmalloc, vmap, ioremap, xen use cases.
> - vmalloc use case dominates the usage. Such vm areas have VM_ALLOC flag.
> - the areas created by vmap() function should be tagged with VM_MAP.
> - ioremap areas are tagged with VM_IOREMAP.
>
> BPF would like to extend the vmap API to implement a lazily-populated
> sparse, yet contiguous kernel virtual space. Introduce VM_SPARSE flag
> and vm_area_map_pages(area, start_addr, count, pages) API to map a set
> of pages within a given area.
> It has the same sanity checks as vmap() does.
> It also checks that get_vm_area() was created with VM_SPARSE flag
> which identifies such areas in /proc/vmallocinfo
> and returns zero pages on read through /proc/kcore.
>
> The next commits will introduce bpf_arena which is a sparsely populated
> shared memory region between bpf program and user space process. It will
> map privately-managed pages into a sparse vm area with the following step=
s:
>
>   // request virtual memory region during bpf prog verification
>   area =3D get_vm_area(area_size, VM_SPARSE);
>
>   // on demand
>   vm_area_map_pages(area, kaddr, kend, pages);
>   vm_area_unmap_pages(area, kaddr, kend);
>
>   // after bpf program is detached and unloaded
>   free_vm_area(area);
>
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> ---
>  include/linux/vmalloc.h |  5 ++++
>  mm/vmalloc.c            | 59 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index c720be70c8dd..0f72c85a377b 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -35,6 +35,7 @@ struct iov_iter;              /* in uio.h */
>  #else
>  #define VM_DEFER_KMEMLEAK      0
>  #endif
> +#define VM_SPARSE              0x00001000      /* sparse vm_area. not al=
l pages are present. */
>
>  /* bits [20..32] reserved for arch specific ioremap internals */
>
> @@ -232,6 +233,10 @@ static inline bool is_vm_area_hugepages(const void *=
addr)
>  }
>
>  #ifdef CONFIG_MMU
> +int vm_area_map_pages(struct vm_struct *area, unsigned long start,
> +                     unsigned long end, struct page **pages);
> +void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
> +                        unsigned long end);
>  void vunmap_range(unsigned long addr, unsigned long end);
>  static inline void set_vm_flush_reset_perms(void *addr)
>  {
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index f42f98a127d5..e5b8c70950bc 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -648,6 +648,58 @@ static int vmap_pages_range(unsigned long addr, unsi=
gned long end,
>         return err;
>  }
>
> +static int check_sparse_vm_area(struct vm_struct *area, unsigned long st=
art,
> +                               unsigned long end)
> +{
> +       might_sleep();

This interface and in general VM_SPARSE would be useful for
dynamically grown kernel stacks [1]. However, the might_sleep() here
would be a problem. We would need to be able to handle
vm_area_map_pages() from interrupt disabled context therefore no
sleeping. The caller would need to guarantee that the page tables are
pre-allocated before the mapping.

Pasha

[1] https://lore.kernel.org/all/CA+CK2bBYt9RAVqASB2eLyRQxYT5aiL0fGhUu3TumQC=
yJCNTWvw@mail.gmail.com

