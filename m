Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09087430A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 23:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689550.1074655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0CM-0001C1-1c; Wed, 06 Mar 2024 22:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689550.1074655; Wed, 06 Mar 2024 22:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0CL-0001A6-V3; Wed, 06 Mar 2024 22:57:17 +0000
Received: by outflank-mailman (input) for mailman id 689550;
 Wed, 06 Mar 2024 22:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7u2=KM=soleen.com=pasha.tatashin@srs-se1.protection.inumbo.net>)
 id 1ri0CK-0001A0-SV
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 22:57:16 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df88148e-dc0c-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 23:57:15 +0100 (CET)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-60974cb1cd7so2862787b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 14:57:14 -0800 (PST)
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
X-Inumbo-ID: df88148e-dc0c-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1709765834; x=1710370634; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4Nw3ruzCEh/6x6lraL5DkvfsiMjEFZksiQV2YYXotE=;
        b=F02zoOHROBzv5yu73P3nt+hRge0s/6tVRpIZtCrTyQX42dbPrO8syrXp+s0sWrZ8tI
         5GyKaZNypPhGQCQ11tqkn+HG7nuOZXlxm0M6ZxdvYP+E3sKD/8NLs7DU159cYYUHiEmg
         I1ZU+y7Nm2WvqPGJFb7Gjkga5VaoQQWiJb6vPLW3ofTUHIZ6Bd5xSsf3xEgLIL+xzVzd
         7DnuNYfOXDobzgXL3NAzeiV6HT+IeuEP0Z4nF/DPWqe3NMN2W52Xod17yNGbM9TzhUhf
         5hjBNLlcgcScjD7E+m/v9U58umLKe/IWJzTLfqFOeoKRu7UYBh+s5bJnzrzWZGKZUMI4
         P2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709765834; x=1710370634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4Nw3ruzCEh/6x6lraL5DkvfsiMjEFZksiQV2YYXotE=;
        b=uLXxN33BvycF/CrqhBhLE6rV2FmufgMuzzPQKiWIjlboLa51Mv0lqmvvrX8K7EEzWn
         WOHk/E7FCSNmAhGQZPJRmKDHJWjYgQ1jrNJWAkafWBaDH5Y++Jny+yHrhIIudNRFfw2i
         TFC0MPz36CKa7hgvmOMCxWtyxF5UsxucDDKg2G1qK582wQj8IdOv0G9L62etVJORiGU6
         d1WMAPzj2xPdDJ8ayyR/IlewkZqpAZGw1FikQjvI+ck5ttq7hyZ4LU8E9sK3JrXYf4qi
         QS6fecApZK/DoVd0V4qOX42hWpI37ZcwoUhhYeZDvKSavYtwoc2gH6sInfRGO4+c1KU5
         5I4w==
X-Forwarded-Encrypted: i=1; AJvYcCVkW3JSwlaPY0UppRs4BarF+8T5qu+gyfR1Q9aYn4W6g2D11TuFSKPM68wxT1gjgQOJvJ+tCy33nRvd4UykeUznF7gjxkRYwbQxLropyqc=
X-Gm-Message-State: AOJu0YzUYkMo2rUX39S0Por0JlK/fYrMIU3upsVb/i2Vq8PUODUK/7w4
	SZ8bKEwvziKvuh/bA1+bxhGAR1lwZlKjFUBCOKJs61BZMhjrASv+pBG1zI4AsfXPB7ogp7cZMux
	btsaxk00Vi/7ENTodT8qFUA21j/UkZ9ouyYsyTg==
X-Google-Smtp-Source: AGHT+IHwPxKVjGasXZN3AkdEcSPiwiOeknvDH42CBz2GEXFk4GNpppovu9J9FQrbuAW73ifV1XqA6uY12hiEUCXFYQw=
X-Received: by 2002:a25:5186:0:b0:dcc:99b6:830b with SMTP id
 f128-20020a255186000000b00dcc99b6830bmr13006393ybb.19.1709765833765; Wed, 06
 Mar 2024 14:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <20240305030516.41519-3-alexei.starovoitov@gmail.com> <CA+CK2bDCgpYR2-gHv-H3vDXDqcoA16vMNr55BZ6nouZNdwGufQ@mail.gmail.com>
 <CAADnVQ+pxrRRvyLXG+opUuPuYZc+XTBLksK0rERrS1BY9ayQpQ@mail.gmail.com>
 <CA+CK2bAhWgSSotKjiGA4oTbH0XaCAtiWe+5p5u9OAf0ykBekwg@mail.gmail.com> <CAADnVQL9h7R0zYyr=P4jm9AFvK27Vx+rrUuPjTuw4QpubNngpw@mail.gmail.com>
In-Reply-To: <CAADnVQL9h7R0zYyr=P4jm9AFvK27Vx+rrUuPjTuw4QpubNngpw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 6 Mar 2024 17:56:37 -0500
Message-ID: <CA+CK2bDUA0zes3Qk5JPPurKc_8fTCbuz8VFYVc9wa7gjUbHHvA@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/2] mm: Introduce VM_SPARSE kind and vm_area_[un]map_pages().
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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

On Wed, Mar 6, 2024 at 5:13=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Mar 6, 2024 at 1:46=E2=80=AFPM Pasha Tatashin <pasha.tatashin@sol=
een.com> wrote:
> >
> > > > This interface and in general VM_SPARSE would be useful for
> > > > dynamically grown kernel stacks [1]. However, the might_sleep() her=
e
> > > > would be a problem. We would need to be able to handle
> > > > vm_area_map_pages() from interrupt disabled context therefore no
> > > > sleeping. The caller would need to guarantee that the page tables a=
re
> > > > pre-allocated before the mapping.
> > >
> > > Sounds like we'd need to differentiate two kinds of sparse regions.
> > > One that is really sparse where page tables are not populated (bpf us=
e case)
> > > and another where only the pte level might be empty.
> > > Only the latter one will be usable for such auto-grow stacks.
> > >
> > > Months back I played with this idea:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?&=
id=3Dce63949a879f2f26c1c1834303e6dfbfb79d1fbd
> > > that
> > > "Make vmap_pages_range() allocate page tables down to the last (PTE) =
level."
> > > Essentially pass NULL instead of 'pages' into vmap_pages_range()
> > > and it will populate all levels except the last.
> >
> > Yes, this is what is needed, however, it can be a little simpler with
> > kernel stacks:
> > given that the first page in the vm_area is mapped when stack is first
> > allocated, and that the VA range is aligned to 16K, we actually are
> > guaranteed to have all page table levels down to pte pre-allocated
> > during that initial mapping. Therefore, we do not need to worry about
> > allocating them later during PFs.
>
> Ahh. Found:
> stack =3D __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN, ...
>
> > > Then the page fault handler can service a fault in auto-growing stack
> > > area if it has a page stashed in some per-cpu free list.
> > > I suspect this is something you might need for
> > > "16k stack that is populated on fault",
> > > plus a free list of 3 pages per-cpu,
> > > and set_pte_at() in pf handler.
> >
> > Yes, what you described is exactly what I am working on: using 3-pages
> > per-cpu to handle kstack page faults. The only thing that is missing
> > is that I would like to have the ability to call a non-sleeping
> > version of vm_area_map_pages().
>
> vm_area_map_pages() cannot be non-sleepable, since the [start, end)
> range will dictate whether mid level allocs and locks are needed.
>
> Instead in alloc_thread_stack_node() you'd need a flavor
> of get_vm_area() that can align the range to THREAD_ALIGN.
> Then immediately call _sleepable_ vm_area_map_pages() to populate
> the first page and later set_pte_at() the other pages on demand
> from the fault handler.

We still need to get to PTE level to use set_pte_at(). So, either
store it in task_struct for faster PF handling, or add another
non-sleeping vmap function that will do something like this:

vm_area_set_page_at(addr, page)
{
   pgd =3D pgd_offset_k(addr)
   p4d =3D vunmap_p4d_range(pgd, addr)
   pud =3D pud_offset(p4d, addr)
   pmd =3D pmd_offset(pud, addr)
   pte =3D pte_offset_kernel(pmd, addr)

  set_pte_at(init_mm, addr, pte, mk_pte(page...));
}

Pasha

