Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE2874286
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 23:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689546.1074645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhzVd-0001NK-PS; Wed, 06 Mar 2024 22:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689546.1074645; Wed, 06 Mar 2024 22:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhzVd-0001Lg-MK; Wed, 06 Mar 2024 22:13:09 +0000
Received: by outflank-mailman (input) for mailman id 689546;
 Wed, 06 Mar 2024 22:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xNx=KM=gmail.com=alexei.starovoitov@srs-se1.protection.inumbo.net>)
 id 1rhzVb-0001LY-Js
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 22:13:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b543d8f8-dc06-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 23:13:06 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-412ed3f1e3fso2395465e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 14:13:06 -0800 (PST)
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
X-Inumbo-ID: b543d8f8-dc06-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709763186; x=1710367986; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0co437MWlwiDr7sdvNxT0czQBG4oFsy/9/ksjHplhkY=;
        b=FGVcd0x81Fnv9hAhvFVskuJDt1v3kyKbhSO7/2DiOVxKqI9QMzw46m71fRD4U5SzQj
         3O4kMIJ7trI/lqRQVRfh3x95A2YvHdwHBcCvATdp2T+X52Ruv1IrIp/EwPUD6AY27WUZ
         fbhUobMkEC0V8/EWqz+eb59rw1ib0liOzukQMQTRbAkclYpCogKJZFv5/9z9Ot5qtTCE
         diTtXXamLqD6NIK1ZMKREDNY9/M8axfTlChaZFL5v/vRw3+aT1zk8weS4I8U+uLl5oua
         WIBmEmK+07NfIQ3VW5bgQe4bgXzBPXYc9veHcbkK14aelCMWeQJ8TOFf5nWjzTI6u1iK
         Q8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709763186; x=1710367986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0co437MWlwiDr7sdvNxT0czQBG4oFsy/9/ksjHplhkY=;
        b=UgpJO7ZMF0NN4gJ9MxvRg4pPxd0XMqgNyLVec0IbBpWuPJ5+wEnB7OyfLhfk4dNamx
         tCvRSdvXNmZRdtJJMid7IPnNdpz8fOYaa4raIm162dQpK9rxlrat9mqT7w5pHBMMz+1p
         vTS6gOaAtsg8h8GLHc8/lcxThFrw5DIwLl6eUVwVcyalgKcwdw8jweSe9pDY7FT9Y7VF
         Ccyko7BeI2fF6c4JZr49r8Ab6jZN2pGOAJjvv2rKNKL5eZ1qhQtXRf1CSQ74Izj6ANbd
         gasmwB9S+Jw75a9o7JTZRXfDDnTF812jsW/HFQ/jXmIoSpygmgUyru36iEGfXrPIXmFS
         8Izw==
X-Forwarded-Encrypted: i=1; AJvYcCV2jEDSj0VqSxYmXtI722AmceYFCZ7D3TNkJHbgY7icM2GGXmpk4PwBFAKEBofD/4tB+1vPejzNfSprQ1KX66axJNzlOUhSv+r2qf9sh2w=
X-Gm-Message-State: AOJu0YyVeY6D0zfUH6SuKGw7WOwXyB1V41iiwK64a6Z65u4duZRg9DZV
	rkVeDyTVuVLnehXbZ5lf7abGy2MKoC1dxh4GsOFUTB5FIKt6IEALG5/NtVK8hohZ56iHVegePVE
	UPJan78SHiVwfkkWh9B/dc5aavI0=
X-Google-Smtp-Source: AGHT+IHM5WAdyGr/B7hLl36s77xYo/gy7yzLMW3COR6pSamXxzxHTbpB4M1O/zLuG0Dc6UyW1yEJEoYoydHCAh4AHuk=
X-Received: by 2002:a05:6000:1cd2:b0:33d:82c1:f9d3 with SMTP id
 bf18-20020a0560001cd200b0033d82c1f9d3mr11649861wrb.4.1709763185840; Wed, 06
 Mar 2024 14:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <20240305030516.41519-3-alexei.starovoitov@gmail.com> <CA+CK2bDCgpYR2-gHv-H3vDXDqcoA16vMNr55BZ6nouZNdwGufQ@mail.gmail.com>
 <CAADnVQ+pxrRRvyLXG+opUuPuYZc+XTBLksK0rERrS1BY9ayQpQ@mail.gmail.com> <CA+CK2bAhWgSSotKjiGA4oTbH0XaCAtiWe+5p5u9OAf0ykBekwg@mail.gmail.com>
In-Reply-To: <CA+CK2bAhWgSSotKjiGA4oTbH0XaCAtiWe+5p5u9OAf0ykBekwg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 6 Mar 2024 14:12:54 -0800
Message-ID: <CAADnVQL9h7R0zYyr=P4jm9AFvK27Vx+rrUuPjTuw4QpubNngpw@mail.gmail.com>
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

On Wed, Mar 6, 2024 at 1:46=E2=80=AFPM Pasha Tatashin <pasha.tatashin@solee=
n.com> wrote:
>
> > > This interface and in general VM_SPARSE would be useful for
> > > dynamically grown kernel stacks [1]. However, the might_sleep() here
> > > would be a problem. We would need to be able to handle
> > > vm_area_map_pages() from interrupt disabled context therefore no
> > > sleeping. The caller would need to guarantee that the page tables are
> > > pre-allocated before the mapping.
> >
> > Sounds like we'd need to differentiate two kinds of sparse regions.
> > One that is really sparse where page tables are not populated (bpf use =
case)
> > and another where only the pte level might be empty.
> > Only the latter one will be usable for such auto-grow stacks.
> >
> > Months back I played with this idea:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?&id=
=3Dce63949a879f2f26c1c1834303e6dfbfb79d1fbd
> > that
> > "Make vmap_pages_range() allocate page tables down to the last (PTE) le=
vel."
> > Essentially pass NULL instead of 'pages' into vmap_pages_range()
> > and it will populate all levels except the last.
>
> Yes, this is what is needed, however, it can be a little simpler with
> kernel stacks:
> given that the first page in the vm_area is mapped when stack is first
> allocated, and that the VA range is aligned to 16K, we actually are
> guaranteed to have all page table levels down to pte pre-allocated
> during that initial mapping. Therefore, we do not need to worry about
> allocating them later during PFs.

Ahh. Found:
stack =3D __vmalloc_node_range(THREAD_SIZE, THREAD_ALIGN, ...

> > Then the page fault handler can service a fault in auto-growing stack
> > area if it has a page stashed in some per-cpu free list.
> > I suspect this is something you might need for
> > "16k stack that is populated on fault",
> > plus a free list of 3 pages per-cpu,
> > and set_pte_at() in pf handler.
>
> Yes, what you described is exactly what I am working on: using 3-pages
> per-cpu to handle kstack page faults. The only thing that is missing
> is that I would like to have the ability to call a non-sleeping
> version of vm_area_map_pages().

vm_area_map_pages() cannot be non-sleepable, since the [start, end)
range will dictate whether mid level allocs and locks are needed.

Instead in alloc_thread_stack_node() you'd need a flavor
of get_vm_area() that can align the range to THREAD_ALIGN.
Then immediately call _sleepable_ vm_area_map_pages() to populate
the first page and later set_pte_at() the other pages on demand
from the fault handler.

