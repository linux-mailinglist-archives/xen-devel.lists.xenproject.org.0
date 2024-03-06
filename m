Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2A874390
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 00:12:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689562.1074685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0Qo-0006ei-Rq; Wed, 06 Mar 2024 23:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689562.1074685; Wed, 06 Mar 2024 23:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0Qo-0006aw-OZ; Wed, 06 Mar 2024 23:12:14 +0000
Received: by outflank-mailman (input) for mailman id 689562;
 Wed, 06 Mar 2024 23:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xNx=KM=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1ri0Qn-0006aa-0d
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 23:12:13 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5cc2adb-dc0e-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 00:12:11 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33dcad9e3a2so85722f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 15:12:11 -0800 (PST)
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
X-Inumbo-ID: f5cc2adb-dc0e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709766730; x=1710371530; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx5iRvChP8NO+/mhuLuLKmdBFsw3uQNbAw3BGNdYR3g=;
        b=eruK46yYo93Tga2s0NaogOzakhIgpjbZgtBBlinbLdJpSGiz6jOa6JkC3eF/QQLb6w
         C1eO3kAGEPiwtkUbGgaY3JEpLBD6oYz0LVelNgW/GUvdXxhm1z/xkQI0tsOXdenCqYQ2
         Syg7lXZhaH/xvwAEsZeKoi7NIy+V4R/CE3tO28HzXdxCyEY/Pmy0WNoEokk3Ug1bxLAN
         Wlfqm1g3TgtHPhDY/Qvcq6RRh8m3w06wwHYMUc5GPCeiGNn5MVZTFqMV7yBVqhbXSlsB
         Zo5j3QwiM9zl1/93ZBhRUN52r5XdmCaAFOJ6FaYQbcOdzBzGBbGCIw9OD1tVbopHNZmM
         b82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709766730; x=1710371530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jx5iRvChP8NO+/mhuLuLKmdBFsw3uQNbAw3BGNdYR3g=;
        b=Qvs7ofcodROuzd7R+yN/YmPUlUhy+iQL8zFWrhMJYai2faH8jXNM6Zn3Icv5CQTRR9
         CfydTdxwZD7CCoa9P+WkKwh09rXq8uHcEv07mfGaPa3m1fdkVX9W9X5Npa1S301ZDPnU
         d+pL8vhe6Wts+qcwzznUcIiEJh0VaEcunAIT9LsS+tU4A0z5Kdj1HIezhQRrW9rpWfj9
         9z5X3zewuWut69ST0j6Ti4z+lSatvc+K/k0OwhNl5fPH20N4FEm+H9gdmvWmAS8eaZnS
         XPQ9/LvfudwiUbVVf5PW/kDAERYHnvkYC/1NSjqVrCmxINGQBv3hco9SHVTDlk/JAA9X
         r2qw==
X-Forwarded-Encrypted: i=1; AJvYcCUSIbwwAeqGbcqLkLVdqEI8VZyDlXwrg8PxGYgWuU9c4WEwkDA9yHRQ1+igxUd5HR6EKT/HxBPYEty7H2ChrmT47eG+6oA9+Nnqck9+8+w=
X-Gm-Message-State: AOJu0YynkNQ947z7hb0lBm0luK4zkEJkK/4jQ13jMCkcn6YQ6L1G+4V8
	sNyLGcRjLXNiC7hnd48MPHMgUE9YU8sQ7JsoF8K055vjyEEwJTJP/1IfF2JW0Q7YfA4NQ8oO6Hy
	WFdAOubZ7Sy+vZ9W+DmnC9RnwpKE=
X-Google-Smtp-Source: AGHT+IGLGZhZkUQNkXFQULSBWx3zFTB/DY3Hwy4o8Qn6U6VB9fAcd5bv3pWUFD1OuIX/9JAsZj7/H8SpTHn4VXTZWJQ=
X-Received: by 2002:a5d:5918:0:b0:33e:1bec:c48f with SMTP id
 v24-20020a5d5918000000b0033e1becc48fmr11116715wrd.24.1709766729962; Wed, 06
 Mar 2024 15:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <20240305030516.41519-3-alexei.starovoitov@gmail.com> <CA+CK2bDCgpYR2-gHv-H3vDXDqcoA16vMNr55BZ6nouZNdwGufQ@mail.gmail.com>
 <CAADnVQ+pxrRRvyLXG+opUuPuYZc+XTBLksK0rERrS1BY9ayQpQ@mail.gmail.com>
 <CA+CK2bAhWgSSotKjiGA4oTbH0XaCAtiWe+5p5u9OAf0ykBekwg@mail.gmail.com>
 <CAADnVQL9h7R0zYyr=P4jm9AFvK27Vx+rrUuPjTuw4QpubNngpw@mail.gmail.com> <CA+CK2bDUA0zes3Qk5JPPurKc_8fTCbuz8VFYVc9wa7gjUbHHvA@mail.gmail.com>
In-Reply-To: <CA+CK2bDUA0zes3Qk5JPPurKc_8fTCbuz8VFYVc9wa7gjUbHHvA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 6 Mar 2024 15:11:58 -0800
Message-ID: <CAADnVQ+AJmddbKWzanasiE38rZcq533w-MoXKqfZNtstzKg12Q@mail.gmail.com>
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

On Wed, Mar 6, 2024 at 2:57=E2=80=AFPM Pasha Tatashin <pasha.tatashin@solee=
n.com> wrote:
>
> On Wed, Mar 6, 2024 at 5:13=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Wed, Mar 6, 2024 at 1:46=E2=80=AFPM Pasha Tatashin <pasha.tatashin@s=
oleen.com> wrote:
> > >
> > > > > This interface and in general VM_SPARSE would be useful for
> > > > > dynamically grown kernel stacks [1]. However, the might_sleep() h=
ere
> > > > > would be a problem. We would need to be able to handle
> > > > > vm_area_map_pages() from interrupt disabled context therefore no
> > > > > sleeping. The caller would need to guarantee that the page tables=
 are
> > > > > pre-allocated before the mapping.
> > > >
> > > > Sounds like we'd need to differentiate two kinds of sparse regions.
> > > > One that is really sparse where page tables are not populated (bpf =
use case)
> > > > and another where only the pte level might be empty.
> > > > Only the latter one will be usable for such auto-grow stacks.
> > > >
> > > > Months back I played with this idea:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/=
?&id=3Dce63949a879f2f26c1c1834303e6dfbfb79d1fbd
> > > > that
> > > > "Make vmap_pages_range() allocate page tables down to the last (PTE=
) level."
> > > > Essentially pass NULL instead of 'pages' into vmap_pages_range()
> > > > and it will populate all levels except the last.
> > >
> > > Yes, this is what is needed, however, it can be a little simpler with
> > > kernel stacks:
> > > given that the first page in the vm_area is mapped when stack is firs=
t
> > > allocated, and that the VA range is aligned to 16K, we actually are
> > > guaranteed to have all page table levels down to pte pre-allocated
> > > during that initial mapping. Therefore, we do not need to worry about
> > > allocating them later during PFs.
> >
> > Ahh. Found:
> > stack =3D __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN, ...
> >
> > > > Then the page fault handler can service a fault in auto-growing sta=
ck
> > > > area if it has a page stashed in some per-cpu free list.
> > > > I suspect this is something you might need for
> > > > "16k stack that is populated on fault",
> > > > plus a free list of 3 pages per-cpu,
> > > > and set_pte_at() in pf handler.
> > >
> > > Yes, what you described is exactly what I am working on: using 3-page=
s
> > > per-cpu to handle kstack page faults. The only thing that is missing
> > > is that I would like to have the ability to call a non-sleeping
> > > version of vm_area_map_pages().
> >
> > vm_area_map_pages() cannot be non-sleepable, since the [start, end)
> > range will dictate whether mid level allocs and locks are needed.
> >
> > Instead in alloc_thread_stack_node() you'd need a flavor
> > of get_vm_area() that can align the range to THREAD_ALIGN.
> > Then immediately call _sleepable_ vm_area_map_pages() to populate
> > the first page and later set_pte_at() the other pages on demand
> > from the fault handler.
>
> We still need to get to PTE level to use set_pte_at(). So, either
> store it in task_struct for faster PF handling, or add another
> non-sleeping vmap function that will do something like this:
>
> vm_area_set_page_at(addr, page)
> {
>    pgd =3D pgd_offset_k(addr)
>    p4d =3D vunmap_p4d_range(pgd, addr)
>    pud =3D pud_offset(p4d, addr)
>    pmd =3D pmd_offset(pud, addr)
>    pte =3D pte_offset_kernel(pmd, addr)
>
>   set_pte_at(init_mm, addr, pte, mk_pte(page...));
> }

Right. There are several flavors of this logic across the tree.
What you're proposing is pretty much vmalloc_to_page() that
returns pte even if !pte_present, instead of a page.
x86 is doing mostly the same in lookup_address() fwiw.
Good opportunity to clean all this up and share the code.

