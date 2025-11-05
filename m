Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB430C33F27
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 05:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156015.1485338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGVRx-0000xM-61; Wed, 05 Nov 2025 04:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156015.1485338; Wed, 05 Nov 2025 04:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGVRx-0000v4-3C; Wed, 05 Nov 2025 04:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1156015;
 Wed, 05 Nov 2025 04:48:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfi=5N=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vGVRv-0000uy-Lj
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 04:48:47 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4f13dd7-ba02-11f0-980a-7dc792cee155;
 Wed, 05 Nov 2025 05:48:44 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b5a631b9c82so3882002a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Nov 2025 20:48:44 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7acd6824811sm4742988b3a.64.2025.11.04.20.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 20:48:42 -0800 (PST)
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
X-Inumbo-ID: b4f13dd7-ba02-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762318123; x=1762922923; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=;
        b=LBddrOx3NLTYJwmhdouozW3UwxYHbP84iJvIwqpiGe8SisHKzplTTx7QdI6WnX+vw1
         lbZtKAfRtSbUHVOMtJl6SCoO6kLG/Ei2Jyywo8hZggtCW/ThbxOuvTcK0lS1j9mEhsMP
         nyGJ3s57jBYDduj3olDJYQdxCFSI6nXmhMo3cERZ+AwBXGRbcN9MAe7lOwOc3joHvQpu
         FD+wNddKC9Q3smqLBGwUZEOzX917MDP1w6B2tkRB/9fZXB+/xmZa7AUkmCIUJKxqtWCF
         +3mw8ciCYmfgikDJXAOc0dS+1H02R0pcUsvl1Pu06ra8vN1yhmUrkHw5IPqi16I9IHIA
         ybUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762318123; x=1762922923;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=;
        b=PwDPgNaUYY1mkDa4OUKLikmSR+l/IoEnlP5AEJV7k4wHl174LIc2y4h6OPN1gxm7Pl
         iuomLMzAmw8LxCZh3P377zOisUtaHPGdH61NydQFS+WKUfa2e4IzrDwjQYXT2Y4DGbFB
         G/3jwD1XMwHNSjhkBMLhl6albD1YmsY49rzkwGtdTLdvaTOzV3nVQ1qElMmv6bsFfnj4
         LglSRqPurlO/zgyc09Xj8/nl1DG001TWh4neS2WJlNKdszsNqlHFWFMt++1aHAvCtIgN
         aBZFfIDVbNHinhjC/ow8z+UUZsip2GrRK6qVcK93iPGiYFI3qXTcI9IWRNIXnhe4fOJf
         /vuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgrs2xCGs+a4CGbUhW0ORZyI8XBwNqB0LU1cAXU4o/rUVxjXtIzN84OvlVnIddF+7LqrkHnDXWPf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXPTLk67N38XLpzEpQpCb7YNrRl0nTWcbXlBSABcyMo8o/afmg
	UmZwjIk2snFyVQSsAixKaAD3zvRjAjH8MT01qzrdx8fnXKiNJ8+mJjDJ
X-Gm-Gg: ASbGncv0zHtLyQhkLH2WfHsvx3UUGEQa1ZarE97YYuHTpifXSnYjyJ/+YxbyUn9hG0h
	8CAEbxpI3D6iLkAMwCCwGrqinxltRcv4A4L6b8rMyzNLJ9apvG8uAG1GA0fjSQPkysUv7lGMdXa
	/GbVeyi7N3p/GqGrNldNL/+BmzBHDHVhrwEnjUw+4Aa3rOhLI7KNZkV6dHNPMYl+/qrKUy8/K0F
	mXd+sFday7ZdEkUXOJmiygrT2Z3V8zGMc4B5q/2Z/CKZSA0bcDD/wI0fcQ8Z9w36ktyGebRY1AK
	3OBeBUqXk7pO83Kd+P0DF2gLrwJYcPjmaNnoZjtsG5kRTdnsjJb2eIR3lynBU1owydNlWewGraE
	uanZZjMVWo7nbWUR6VZwBj0+/ftD7dcmL17vmX5QcPuF1IGAJ0D9gNggWCafl4Z3KsqDiPA==
X-Google-Smtp-Source: AGHT+IEGT+eOgR9ydzqm23BJtuNpA3RB5HWaj5Ha9KjzqVJ/S6kqSTkQbIaWCHaOF+SdxbuTbYvUtA==
X-Received: by 2002:a05:6a20:7483:b0:34e:63bd:81c1 with SMTP id adf61e73a8af0-34f839f5a57mr2604485637.3.1762318122822;
        Tue, 04 Nov 2025 20:48:42 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
In-Reply-To: <20251029100909.3381140-6-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 10:10:33 +0530
Message-ID: <87o6ph3xdq.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-6-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Architectures currently opt in for implementing lazy_mmu helpers by
> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
>
> In preparation for introducing a generic lazy_mmu layer that will
> require storage in task_struct, let's switch to a cleaner approach:
> instead of defining a macro, select a CONFIG option.
>
> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
> arch select it when it implements lazy_mmu helpers.
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
> relies on the new CONFIG instead.
>
> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
> selected. This creates some complications in arch/x86/boot/, because
> a few files manually undefine PARAVIRT* options. As a result
> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
> breaks the build as <linux/pgtable.h> only defines them if
> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
> way out of this - let's just undefine that new CONFIG too.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/Kconfig                                 | 1 +
>  arch/arm64/include/asm/pgtable.h                   | 1 -
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>  arch/powerpc/platforms/Kconfig.cputype             | 1 +
>  arch/sparc/Kconfig                                 | 1 +
>  arch/sparc/include/asm/tlbflush_64.h               | 2 --
>  arch/x86/Kconfig                                   | 1 +
>  arch/x86/boot/compressed/misc.h                    | 1 +
>  arch/x86/boot/startup/sme.c                        | 1 +
>  arch/x86/include/asm/paravirt.h                    | 1 -
>  include/linux/pgtable.h                            | 2 +-
>  mm/Kconfig                                         | 3 +++
>  12 files changed, 10 insertions(+), 7 deletions(-)

Maybe we can add this to ... ?

Documentation/features/vm/lazy_mmu/arch-support.txt

#
# Feature name:          lazy_mmu mode
#         Kconfig:       ARCH_HAS_LAZY_MMU_MODE
#         description:   arch supports arch_{enter|flush|leave}_lazy_mmu_mode()
#
    -----------------------
    |         arch |status|
    -----------------------
    |       arm64: |  ok  |
    |     powerpc: |  ok  |
    |       sparc: |  ok  |
    |         x86: |  ok  |
    -----------------------


As for this patch, the changes are mostly straight forward around the
configs part. This looks good to me. Please feel free to add: 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

