Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731987422B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 22:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689533.1074615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhz66-0002hH-7b; Wed, 06 Mar 2024 21:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689533.1074615; Wed, 06 Mar 2024 21:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhz66-0002eg-4q; Wed, 06 Mar 2024 21:46:46 +0000
Received: by outflank-mailman (input) for mailman id 689533;
 Wed, 06 Mar 2024 21:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7u2=KM=soleen.com=pasha.tatashin@srs-se1.protection.inumbo.net>)
 id 1rhz64-0002ea-UB
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 21:46:44 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 059196f8-dc03-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 22:46:43 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-42ef17b4021so987131cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 13:46:43 -0800 (PST)
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
X-Inumbo-ID: 059196f8-dc03-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1709761602; x=1710366402; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sqaAoKPOgm/rSWCI7eBbS/kktgGPF2ytcO0T40EpJ3Q=;
        b=RLe6nrJxim8GUSu19ZByZa3AZlxl5HcnMO8sF6qoGdzPzS6gqMe87kRpPHzVkeoQss
         8f5PWZe8C1goYMsIDHiU1aWDOnpdNhDr+2U4raRzQsadDcH5bKZp7B+dzBeHo1FOxZMi
         gf9507B+8wvkWyDqPRrjFqz1LPzUl6z2X+gDVwmHIZ3aBJUQzLuPTlNGfiCpsIGkOlK/
         7zkz/FYYcnh58SFpaAVMcxJjbISH9E+myvrsUXdzSquLJG3MBCz5+e/xiaecnBohtOJR
         jmuzhCFy5xUMUVFyWlmLp91zKAJKdx5TMDJtHatFe13xHPoWQkepWFiVdB/B3rYWOGlQ
         Tkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709761602; x=1710366402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqaAoKPOgm/rSWCI7eBbS/kktgGPF2ytcO0T40EpJ3Q=;
        b=r1Qg4OibkFEgEl2EHH3wtQeXK9CxPJaFIil1IflGiHuirqb0Dh5wMyy1SJGfRJA/hz
         0MA7PwOIrlYENzmgSoE7FSuPghg8yJhHFceLQC0wkBKG/io5ZvSRDumQkc8B5KHSMaYf
         7D2WuWtPCZ9Z4rOnGHyi/NkWAhJYUy2bVkNTQBJpeqSqBVex3pj2WBcoDqHMAtMQkOa9
         Fex9sESDJ+kmME5ExFhlvJUKttFqElvZH1I3MniblxkKsqhLkljFdNKINviQ/ZfeGplc
         qtaMdmias8W4+rm+q+sxFQJP3ol3butUTD0iryZsdMv9I/tyAzvG0hYFTtbKFEpvq0AR
         k1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWFkxKFWVkNmKEZFoq3WHkCEtgikAM+c5caeRXh+P3BQl1D1oaLLR0MMg/lhJSJOziXIu5mYNEjVBzW/eqPEEbRTgzzT7twawM1WR7LO8w=
X-Gm-Message-State: AOJu0Yxx19lmdLzYg0h7wE5MyGkhXjmL4Bi8UswrTpWolGSbXOo1kAWQ
	xOFRQ1Mlyo3Zv997VNDpeB0etdcNKM8GGMcojtYZ3cqEECWJKQqqA467Hy7dBHWxgXdVAZJ7bPt
	FX7RfkRwWLwojeRXayG3BPdMdNaZcYJ89K099Jg==
X-Google-Smtp-Source: AGHT+IFM2e6KeyuiMDLqxycUojt02VdH+rm+iHu3K+tnBqw9pzAEUVRf5SsdUcF0xgYDCB5n+exrwO1T+sS2NaqjfMM=
X-Received: by 2002:ac8:7e86:0:b0:42e:f7cf:ff98 with SMTP id
 w6-20020ac87e86000000b0042ef7cfff98mr7140911qtj.16.1709761602628; Wed, 06 Mar
 2024 13:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <20240305030516.41519-3-alexei.starovoitov@gmail.com> <CA+CK2bDCgpYR2-gHv-H3vDXDqcoA16vMNr55BZ6nouZNdwGufQ@mail.gmail.com>
 <CAADnVQ+pxrRRvyLXG+opUuPuYZc+XTBLksK0rERrS1BY9ayQpQ@mail.gmail.com>
In-Reply-To: <CAADnVQ+pxrRRvyLXG+opUuPuYZc+XTBLksK0rERrS1BY9ayQpQ@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 6 Mar 2024 16:46:05 -0500
Message-ID: <CA+CK2bAhWgSSotKjiGA4oTbH0XaCAtiWe+5p5u9OAf0ykBekwg@mail.gmail.com>
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

> > This interface and in general VM_SPARSE would be useful for
> > dynamically grown kernel stacks [1]. However, the might_sleep() here
> > would be a problem. We would need to be able to handle
> > vm_area_map_pages() from interrupt disabled context therefore no
> > sleeping. The caller would need to guarantee that the page tables are
> > pre-allocated before the mapping.
>
> Sounds like we'd need to differentiate two kinds of sparse regions.
> One that is really sparse where page tables are not populated (bpf use case)
> and another where only the pte level might be empty.
> Only the latter one will be usable for such auto-grow stacks.
>
> Months back I played with this idea:
> https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?&id=ce63949a879f2f26c1c1834303e6dfbfb79d1fbd
> that
> "Make vmap_pages_range() allocate page tables down to the last (PTE) level."
> Essentially pass NULL instead of 'pages' into vmap_pages_range()
> and it will populate all levels except the last.

Yes, this is what is needed, however, it can be a little simpler with
kernel stacks:
given that the first page in the vm_area is mapped when stack is first
allocated, and that the VA range is aligned to 16K, we actually are
guaranteed to have all page table levels down to pte pre-allocated
during that initial mapping. Therefore, we do not need to worry about
allocating them later during PFs.

> Then the page fault handler can service a fault in auto-growing stack
> area if it has a page stashed in some per-cpu free list.
> I suspect this is something you might need for
> "16k stack that is populated on fault",
> plus a free list of 3 pages per-cpu,
> and set_pte_at() in pf handler.

Yes, what you described is exactly what I am working on: using 3-pages
per-cpu to handle kstack page faults. The only thing that is missing
is that I would like to have the ability to call a non-sleeping
version of vm_area_map_pages().

Pasha

