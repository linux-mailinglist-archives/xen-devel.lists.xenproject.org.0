Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5153AC938A
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 18:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001394.1381557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL2Zp-0006hU-JJ; Fri, 30 May 2025 16:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001394.1381557; Fri, 30 May 2025 16:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL2Zp-0006en-Fu; Fri, 30 May 2025 16:27:25 +0000
Received: by outflank-mailman (input) for mailman id 1001394;
 Fri, 30 May 2025 16:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f/JM=YO=google.com=jannh@srs-se1.protection.inumbo.net>)
 id 1uL2Zn-0006eg-WB
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 16:27:24 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f629518e-3d72-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 18:27:23 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-601a67c6e61so14a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 09:27:21 -0700 (PDT)
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
X-Inumbo-ID: f629518e-3d72-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748622441; x=1749227241; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=;
        b=LZeZCMMuYMlUod9vGbTfMi9+hQ8syFhA9I2Y1YZj/qe/J4kH39K4P6YiKTLHKEpgJX
         hz6dh1CSKhKmT0XxHTMGKaXCJ5LthCaSPbrUXjhuOnG9jkUX0/g9mJVZn87TkriCmFU8
         YInQVBHKb3F05g53+4nQbHX/EgNVMWIO95IACPJMTyNfLKznB4atEJ85F7EngADXczSr
         JBOlMBV/rOh0Od/gz1fbDTDKCYkm8L2Hmu0OjxMoD2aKB5eJwMJRblD2JUc+zD8srkMC
         coOBRiVE0QmFJFxjUWKZDhkaIWfS4aan8q8wy+FfAhmBE6EWeg0l1ANNQym0rsD95RHA
         mydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622441; x=1749227241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=;
        b=wtnQBb7ciH8EACUiBnOip3Fy1YCeadxuoeoVFWKJiTi3u2KBx2Lx/syT6bOW9TFCuO
         9vlLy4k5EpAlR4biqNHQFBOOumyllG2UODJV9NaYborx2IM6VEI+eSTKheKzqi8zruiT
         dPoA0jLU+al7VMhuKCr59fOd0B4+G2Xu+Yhti2oLSS4wP3OIOCboAlibvWqV10ODcTFF
         D2e+MbTmEEqXbze0iRKUmJltyHK3aYmE1GGyTAYrz1RtgyfHZQwACXoO66LE5njd7zWQ
         a0VyvqEGkrxH043pRhq+VgJ9oNxUSqEKI7zoxCwT7aljLiMNXa29RF9Jz5It9E0mdVcd
         nkkg==
X-Forwarded-Encrypted: i=1; AJvYcCWRp+ymqzA1yYk7SZKjlj4uWgHwuy1mO2ycgvtGATnK5nzB5W5qpmKdJVi1KoXw+jhtqVYS896OO5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwU8oxc/4C6d+ecNq7zlMIQy10beDpsHWIdoJLailR/voVchL5h
	IJt6GDFQkU9cDYQVwvN76ALl8d56PP116C4zbOHtA0UsaKxEE7Vo1FEJcrjvMWA4/09BhM5ldvF
	flqC/ZRm/1iMgRhcb+0ifU0RE+I7iw9x3RzNvzLAU
X-Gm-Gg: ASbGncsF8JL84kaYS/Y6GFKtU10gXAdDAiOhfrrFfk1aCf9WmKK4+1SWyKVNxfHZEeM
	yG6v4vFGyh2vb8xNTvrFo2XPZ5kxaIwGZONOpbQ50L+2CBygfPF+2wMSJTUXdZtnB2kU9qyjirP
	DTy96e6ssdyAjjxY5h1Rmi5QKC3vSAWV6f2zM96LFunE/d+V2MSkHTffFbFcxXp2uKrKdHtwE=
X-Google-Smtp-Source: AGHT+IFvo4UeYXqvvR6hGpmlYjccx/P9qAgBVyNpakUtwWnk/plyYyjpSLFfr/exrsOHq2DB2NbEp4NJnsA/fPm9vYQ=
X-Received: by 2002:a50:f608:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60577a55f40mr88916a12.7.1748622440589; Fri, 30 May 2025
 09:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250530140446.2387131-1-ryan.roberts@arm.com> <20250530140446.2387131-2-ryan.roberts@arm.com>
In-Reply-To: <20250530140446.2387131-2-ryan.roberts@arm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 18:26:44 +0200
X-Gm-Features: AX0GCFt5gaAeg9wlqckCjWiqvoyfvAtwj8XYq0jNIyzkBuWgoy0LcwI3HloBVMo
Message-ID: <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb
 maintenance ordering in pagemap_scan_pmd_entry()
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mm@kvack.org, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:04=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
> pagemap_scan_pmd_entry() was previously modifying ptes while in lazy mmu
> mode, then performing tlb maintenance for the modified ptes, then
> leaving lazy mmu mode. But any pte modifications during lazy mmu mode
> may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
> ordering between pte modificaiton and tlb maintenance.
>
> Let's fix that by leaving mmu mode, forcing all the pte updates to be
> actioned, before doing the tlb maintenance.
>
> This is a theorectical bug discovered during code review.
>
> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and option=
ally clear info about PTEs")

Hmm... isn't lazy mmu mode supposed to also delay TLB flushes, and
preserve the ordering of PTE modifications and TLB flushes?

Looking at the existing implementations of lazy MMU:

 - In Xen PV implementation of lazy MMU, I see that TLB flush
hypercalls are delayed as well (xen_flush_tlb(),
xen_flush_tlb_one_user() and xen_flush_tlb_multi() all use
xen_mc_issue(XEN_LAZY_MMU) which delays issuing if lazymmu is active).
 - The sparc version also seems to delay TLB flushes, and sparc's
arch_leave_lazy_mmu_mode() seems to do TLB flushes via
flush_tlb_pending() if necessary.
 - powerpc's arch_leave_lazy_mmu_mode() also seems to do TLB flushes.

Am I missing something?

If arm64 requires different semantics compared to all existing
implementations and doesn't delay TLB flushes for lazy mmu mode, I
think the "Fixes" tag should point to your addition of lazy mmu
support for arm64.

> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  fs/proc/task_mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 994cde10e3f4..361f3ffd9a0c 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -2557,10 +2557,9 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsi=
gned long start,
>         }
>
>  flush_and_return:
> +       arch_leave_lazy_mmu_mode();
>         if (flush_end)
>                 flush_tlb_range(vma, start, addr);
> -
> -       arch_leave_lazy_mmu_mode();

I think this ordering was probably intentional, because doing it this
way around allows Xen PV to avoid one more hypercall, because the TLB
flush can be batched together with the page table changes?


>         pte_unmap_unlock(start_pte, ptl);
>
>         cond_resched();
> --
> 2.43.0
>

