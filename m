Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F60874309
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 23:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689552.1074664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0D1-0001fR-AU; Wed, 06 Mar 2024 22:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689552.1074664; Wed, 06 Mar 2024 22:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri0D1-0001co-74; Wed, 06 Mar 2024 22:57:59 +0000
Received: by outflank-mailman (input) for mailman id 689552;
 Wed, 06 Mar 2024 22:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7u2=KM=soleen.com=pasha.tatashin@srs-se1.protection.inumbo.net>)
 id 1ri0Cz-0001cc-KG
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 22:57:57 +0000
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [2607:f8b0:4864:20::1131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f752c0f9-dc0c-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 23:57:54 +0100 (CET)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6099703e530so2757627b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 14:57:54 -0800 (PST)
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
X-Inumbo-ID: f752c0f9-dc0c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1709765874; x=1710370674; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T30BbYOoDoqevyGB85war3bXduSTpLM1AIfsEUvxyFs=;
        b=rpxR7IdxFinN/6nx1I4KBSLHs1xlq1uUQ+isP/ErU4++teSiqdoF3GriDxKkMYpEHL
         FYEwcQTWNmsAsMknVl2Xxwob9oZ8P4jSDoI/GEQT4TKWfMjfXTmA4EiWwCw9yQ7e6uoS
         iXeC57euSjqCD4zXkuYV79hDJpQqSPpImL/YQRkl0EN3lPTlkYu7Z+B1/++OHUVmgK08
         p4Ls87NTCYJWhFcdJdzua3ApxT0QtZpUHK+91O643G+CRBCPr7ZkEwbGQN0BX0UOn0go
         cbyWkYHQqqmwyP12XyfZssXmUoU3DK/HYY4sdEKJsN3ErZjx1SWWJDRis9foC+iaYXWs
         8t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709765874; x=1710370674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T30BbYOoDoqevyGB85war3bXduSTpLM1AIfsEUvxyFs=;
        b=M/Xw4K5iNTU/Nv8hsgjuqI4c36e9voVmTcwBLyZ7pcFpvMwrOq1EpOwW2ZbuH+x/yQ
         OdpFQdCEFy2qO56HvDKNOKGh/83tLJ2SjueilSZjT5LRW72dOp7LV8kTM8tDzP827UOb
         y9DwsEbCOwaDCWW+oNWI4jnK4jr8O1dlD9rrr6H5WRAZa72mk2kfvsO67wqfAOkN5MiQ
         1qqlLyvBRVXR0R2COSDmzPp6Bao8ftqbGhrp51W+vyNlK9Zwi5k1USGGH7DggLq1y6Rr
         asGPuDBDzmE1OrpXWyeFuLQarwgdZtrMyhwuDCdOROIinyTwoXcat8+u21HMgBQkw6x8
         IG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsSR9UGj707VZq6LRlqXabPnn7dpyLzh3Glm5vfsdEPkn7hnvxhI6RWuXeyahBtUASpR+/1Nfs6dkXkFPCTSroFXOLiKdX3tAUz9AX4WM=
X-Gm-Message-State: AOJu0YxyhbBpLIiecOI0cy0L64+dqC7ubDz9l7UOkrNdkU6tBmph4eGq
	crREXAGVOP+2vFS3mqGDFtbb+fbG0lbqOv8RuNuIe/lqUILG36ae/gEGKssvmfU22KJqitzuV4Y
	MF1/6u/m2IDsfwjSnDvnaTVPZAEVgtY7LtQNVIg==
X-Google-Smtp-Source: AGHT+IH63s+eoFax9fdsbS9trqEfT/NfZeSwMdLE8iVC9tCXSyx9a+v6pqCiDdrSLUuvOaDIefTbxnfswQ7+lbT1/Qw=
X-Received: by 2002:a0d:ddc7:0:b0:608:e844:4117 with SMTP id
 g190-20020a0dddc7000000b00608e8444117mr13169519ywe.33.1709765873400; Wed, 06
 Mar 2024 14:57:53 -0800 (PST)
MIME-Version: 1.0
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com> <20240305030516.41519-3-alexei.starovoitov@gmail.com>
In-Reply-To: <20240305030516.41519-3-alexei.starovoitov@gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 6 Mar 2024 17:57:16 -0500
Message-ID: <CA+CK2bAVTRiDoLo8_Vzksg_utg9QHL3cRbQ=uyf_i4Qp-_xg+w@mail.gmail.com>
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

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

