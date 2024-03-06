Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A438741FA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 22:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689520.1074584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhyoi-00069X-AK; Wed, 06 Mar 2024 21:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689520.1074584; Wed, 06 Mar 2024 21:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhyoi-00066x-7p; Wed, 06 Mar 2024 21:28:48 +0000
Received: by outflank-mailman (input) for mailman id 689520;
 Wed, 06 Mar 2024 21:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xNx=KM=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rhyog-00066r-MU
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 21:28:46 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 825ed545-dc00-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 22:28:44 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33e122c8598so48292f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 13:28:44 -0800 (PST)
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
X-Inumbo-ID: 825ed545-dc00-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709760523; x=1710365323; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1WsOY8bv9E8W81TGc4aAT5ds7Sn1+QowuadTWjYWtk=;
        b=F2Z/b4WBDpHDuz5p0hMLYn5SO5FxF/jcnKHN5LIhCb+sZndnxsoteTLihGXtcIjz0B
         z0FVHmOesP8GzCzJteFYj8uWJMMoo1nihRI8XF3FPSVwTbELXWVgqgia0vq63hdKiKWs
         Huv8OfPnKV9PtHF+9Z8J1bKKjx7qHXW9+P85dX7dLesiixSyq0Gsn6xSrJsDLLEhJLn3
         q0cu4jLp4jSmWStZ9lOyEgX1p8yQNIkJgByeF1m8W0jP4Gn5Wf2Y3ktkzA5ozZJ0OsD+
         0ODl79+4+EZa7ec7H+CpGTyaF/S0FGU84vixMNSXp24rGM4PznaKrO6lV9rMJspRNKVe
         OXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709760523; x=1710365323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1WsOY8bv9E8W81TGc4aAT5ds7Sn1+QowuadTWjYWtk=;
        b=q1GbjH6uAfP4WanDUimOShEdS5htLitzjYn2jH8JnIksBZa7tSJmdXtcI0+HcMTX7y
         9PbYa4mOZ3Zn37Ai7yyV21YcXkac01mvd6HhVz9QuNxNXukABVMYT9KTiC/9EoXOQbtE
         HvFN8OmR/zAReV65ra/gh0ypXPXNaGVzjkO6ltj74CqxaxYwQloSH8O2Mb+X/AABFZBB
         MbL2HstsSe7KrPfh74P8hEvV/quS/zJFokz3m3SD+8qIOAcTZ0Ou8xC9tnTkH9D7Y7Ow
         jbjntTFibngbb5B+L6PY2fn7t5JzDbGvW/M/ZxmRSIqbrMRq/066XlpwS0BO9XXYsOEX
         l05g==
X-Forwarded-Encrypted: i=1; AJvYcCWvezk6ZZBtbX9rV0wKc+fJ5XZDsv0YeYIAL2wctW5B6r/JLCg9gWRtUNZ3TmIaFV70dTq2UcK/i4IUrkwdaToNTpzlOWgEF9FlAwRJlGE=
X-Gm-Message-State: AOJu0Ywh8HQj9OSFu7z7UYkYyU+DhvSEpnnWvy2YBhXnyVkTMLg6rAja
	M8k9lvx7MZbSWGNRXZmygRyBgvwiEF9yPJBEi4HfOfPGWhKLDTGwHyTwqZR/M0Ds8GkhXGHjLsq
	ptpKcDLTfW+gPGUIAze9hSIHPRPg=
X-Google-Smtp-Source: AGHT+IE8LqByzqRA7G6sW+7haX1F0BJfAJWcPpQ+nTruzkV9H0WItHjtg14wkPEK8qPwytWAsZTgM/brnIzbFge2cI0=
X-Received: by 2002:a5d:5750:0:b0:33d:1145:8787 with SMTP id
 q16-20020a5d5750000000b0033d11458787mr11006914wrw.25.1709760523501; Wed, 06
 Mar 2024 13:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <20240305030516.41519-3-alexei.starovoitov@gmail.com> <CA+CK2bDCgpYR2-gHv-H3vDXDqcoA16vMNr55BZ6nouZNdwGufQ@mail.gmail.com>
In-Reply-To: <CA+CK2bDCgpYR2-gHv-H3vDXDqcoA16vMNr55BZ6nouZNdwGufQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 6 Mar 2024 13:28:31 -0800
Message-ID: <CAADnVQ+pxrRRvyLXG+opUuPuYZc+XTBLksK0rERrS1BY9ayQpQ@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/2] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Barret Rhoden <brho@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org, 
	Juergen Gross <jgross@suse.com>, linux-mm <linux-mm@kvack.org>, xen-devel@lists.xenproject.org, 
	Kernel Team <kernel-team@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 1:04=E2=80=AFPM Pasha Tatashin <pasha.tatashin@solee=
n.com> wrote:
>
> On Mon, Mar 4, 2024 at 10:05=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > From: Alexei Starovoitov <ast@kernel.org>
> >
> > vmap/vmalloc APIs are used to map a set of pages into contiguous kernel
> > virtual space.
> >
> > get_vm_area() with appropriate flag is used to request an area of kerne=
l
> > address range. It's used for vmalloc, vmap, ioremap, xen use cases.
> > - vmalloc use case dominates the usage. Such vm areas have VM_ALLOC fla=
g.
> > - the areas created by vmap() function should be tagged with VM_MAP.
> > - ioremap areas are tagged with VM_IOREMAP.
> >
> > BPF would like to extend the vmap API to implement a lazily-populated
> > sparse, yet contiguous kernel virtual space. Introduce VM_SPARSE flag
> > and vm_area_map_pages(area, start_addr, count, pages) API to map a set
> > of pages within a given area.
> > It has the same sanity checks as vmap() does.
> > It also checks that get_vm_area() was created with VM_SPARSE flag
> > which identifies such areas in /proc/vmallocinfo
> > and returns zero pages on read through /proc/kcore.
> >
> > The next commits will introduce bpf_arena which is a sparsely populated
> > shared memory region between bpf program and user space process. It wil=
l
> > map privately-managed pages into a sparse vm area with the following st=
eps:
> >
> >   // request virtual memory region during bpf prog verification
> >   area =3D get_vm_area(area_size, VM_SPARSE);
> >
> >   // on demand
> >   vm_area_map_pages(area, kaddr, kend, pages);
> >   vm_area_unmap_pages(area, kaddr, kend);
> >
> >   // after bpf program is detached and unloaded
> >   free_vm_area(area);
> >
> > Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> > ---
> >  include/linux/vmalloc.h |  5 ++++
> >  mm/vmalloc.c            | 59 +++++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 62 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> > index c720be70c8dd..0f72c85a377b 100644
> > --- a/include/linux/vmalloc.h
> > +++ b/include/linux/vmalloc.h
> > @@ -35,6 +35,7 @@ struct iov_iter;              /* in uio.h */
> >  #else
> >  #define VM_DEFER_KMEMLEAK      0
> >  #endif
> > +#define VM_SPARSE              0x00001000      /* sparse vm_area. not =
all pages are present. */
> >
> >  /* bits [20..32] reserved for arch specific ioremap internals */
> >
> > @@ -232,6 +233,10 @@ static inline bool is_vm_area_hugepages(const void=
 *addr)
> >  }
> >
> >  #ifdef CONFIG_MMU
> > +int vm_area_map_pages(struct vm_struct *area, unsigned long start,
> > +                     unsigned long end, struct page **pages);
> > +void vm_area_unmap_pages(struct vm_struct *area, unsigned long start,
> > +                        unsigned long end);
> >  void vunmap_range(unsigned long addr, unsigned long end);
> >  static inline void set_vm_flush_reset_perms(void *addr)
> >  {
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index f42f98a127d5..e5b8c70950bc 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -648,6 +648,58 @@ static int vmap_pages_range(unsigned long addr, un=
signed long end,
> >         return err;
> >  }
> >
> > +static int check_sparse_vm_area(struct vm_struct *area, unsigned long =
start,
> > +                               unsigned long end)
> > +{
> > +       might_sleep();
>
> This interface and in general VM_SPARSE would be useful for
> dynamically grown kernel stacks [1]. However, the might_sleep() here
> would be a problem. We would need to be able to handle
> vm_area_map_pages() from interrupt disabled context therefore no
> sleeping. The caller would need to guarantee that the page tables are
> pre-allocated before the mapping.

Sounds like we'd need to differentiate two kinds of sparse regions.
One that is really sparse where page tables are not populated (bpf use case=
)
and another where only the pte level might be empty.
Only the latter one will be usable for such auto-grow stacks.

Months back I played with this idea:
https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?&id=3Dc=
e63949a879f2f26c1c1834303e6dfbfb79d1fbd
that
"Make vmap_pages_range() allocate page tables down to the last (PTE) level.=
"
Essentially pass NULL instead of 'pages' into vmap_pages_range()
and it will populate all levels except the last.
Then the page fault handler can service a fault in auto-growing stack
area if it has a page stashed in some per-cpu free list.
I suspect this is something you might need for
"16k stack that is populated on fault",
plus a free list of 3 pages per-cpu,
and set_pte_at() in pf handler.

