Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5943073F413
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 07:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555851.867981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE1YT-0006V8-9J; Tue, 27 Jun 2023 05:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555851.867981; Tue, 27 Jun 2023 05:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE1YT-0006T1-5L; Tue, 27 Jun 2023 05:47:57 +0000
Received: by outflank-mailman (input) for mailman id 555851;
 Tue, 27 Jun 2023 05:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZGQ=CP=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1qE1YR-0006Sv-Gt
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 05:47:55 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27919a11-14ae-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 07:47:52 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-54290603887so1779782a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 22:47:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 je5-20020a170903264500b001b8004ff609sm3033756plb.270.2023.06.26.22.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 22:47:50 -0700 (PDT)
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
X-Inumbo-ID: 27919a11-14ae-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687844871; x=1690436871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjTPMlxWt9nC/sXrGsrew1h8LID7KP4FRrxfXfknacs=;
        b=CKCXCuWl0gYpQ4q8YGqBYIHt4kiR1AhHpEiDPYQrq6u+C1EcCN199Rf+TEI2yZgN+R
         yHF4vksLQaZZNCW1AKLUCeBUhO/zz1T+Q9/6Dn0kQ15ZW6K5TqPmtUB9rSpHUKgxZgiA
         HSTUVKDZ4xM6L9+zGQEVzY8EH5rZJBCsvXHjcbbzvbKrE2StJxwwReSDEN5b3GfPvLfH
         eqtt0xPcEOboGwjNakJZJtyOpw0n8CltvqJLvaWUUnjMuBH5yNe38AlJDiG6mzZTOhDy
         hB/teSyin+eBzVwUgFatWumtP7LykGuBvZNNj+IJUNFfPVWNZBZUcFVQKEBMH4tHKOww
         HTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687844871; x=1690436871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjTPMlxWt9nC/sXrGsrew1h8LID7KP4FRrxfXfknacs=;
        b=LzUmAf01JDni4BM2DPKty5uuIs64B/I8Cem4tG6lIIlNBhuPGnmNP70XNAjfbhoVkY
         bGWqTY4wPkRHhd2l+Qg6yjZiCAW0BpD24UjDUP835fYHdOt7O4V2w2PNZFt+OE2B1EA/
         qbb2TcZdJcvNeqGQT8vAoOWOaaXveu/1QYljMYGVC/5E/jTL3TVDn5N0DdLz9+fATOov
         v0/prQqDPPt1vQVdLW6rx3jxGGipBJoD5QixCl8J1KYDx6HFldkBDYFhMYGEtVoHnghr
         jgEeNr2ZnQksydDxTznBoimXcwqbVY+Fr/8FOrCXkzby9Rr0apsbxti9IwfKJQxrsalk
         Og1w==
X-Gm-Message-State: AC+VfDwH3qOZLCeRiPB77HM23p8h8GooqSr/RI6P/4oUxfR1sLH2WovL
	rCgIHHZ//HuqEtKIvoHPsw4=
X-Google-Smtp-Source: ACHHUZ7JjW8b6fgOe+JthCsQbs9/NjABXgCew6ba8g3n2m02um8mxuD9LeyNll8XOwuywhMwRgh5kw==
X-Received: by 2002:a05:6a20:7491:b0:126:8ddd:d786 with SMTP id p17-20020a056a20749100b001268dddd786mr5575003pzd.46.1687844870738;
        Mon, 26 Jun 2023 22:47:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jun 2023 22:47:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>, Dinh Nguyen <dinguyen@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Message-ID: <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622205745.79707-27-vishal.moola@gmail.com>

On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

This patch causes all nios2 builds to fail.

Building nios2:allnoconfig ... failed
--------------
Error log:
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
In file included from mm/memory.c:85:
mm/memory.c: In function 'free_pte_range':
arch/nios2/include/asm/pgalloc.h:33:17: error: implicit declaration of function 'pagetable_pte_dtor'; did you mean 'pgtable_pte_page_dtor'? [-Werror=implicit-function-declaration]
   33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
      |                 ^~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
  666 |                 __pte_free_tlb(tlb, ptep, address);             \
      |                 ^~~~~~~~~~~~~~
mm/memory.c:193:9: note: in expansion of macro 'pte_free_tlb'
  193 |         pte_free_tlb(tlb, token, addr);
      |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:33:36: error: implicit declaration of function 'page_ptdesc' [-Werror=implicit-function-declaration]
   33 |                 pagetable_pte_dtor(page_ptdesc(pte));                   \
      |                                    ^~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
  666 |                 __pte_free_tlb(tlb, ptep, address);             \
      |                 ^~~~~~~~~~~~~~
mm/memory.c:193:9: note: in expansion of macro 'pte_free_tlb'
  193 |         pte_free_tlb(tlb, token, addr);
      |         ^~~~~~~~~~~~
arch/nios2/include/asm/pgalloc.h:34:17: error: implicit declaration of function 'tlb_remove_page_ptdesc'; did you mean 'tlb_remove_page_size'? [-Werror=implicit-function-declaration]
   34 |                 tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
      |                 ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/tlb.h:666:17: note: in expansion of macro '__pte_free_tlb'
  666 |                 __pte_free_tlb(tlb, ptep, address);             \
      |                 ^~~~~~~~~~~~~~
mm/memory.c:193:9: note: in expansion of macro 'pte_free_tlb'
  193 |         pte_free_tlb(tlb, token, addr);

> ---
>  arch/nios2/include/asm/pgalloc.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
> index ecd1657bb2ce..ce6bb8e74271 100644
> --- a/arch/nios2/include/asm/pgalloc.h
> +++ b/arch/nios2/include/asm/pgalloc.h
> @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
>  
>  extern pgd_t *pgd_alloc(struct mm_struct *mm);
>  
> -#define __pte_free_tlb(tlb, pte, addr)				\
> -	do {							\
> -		pgtable_pte_page_dtor(pte);			\
> -		tlb_remove_page((tlb), (pte));			\
> +#define __pte_free_tlb(tlb, pte, addr)					\
> +	do {								\
> +		pagetable_pte_dtor(page_ptdesc(pte));			\
> +		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>  	} while (0)
>  
>  #endif /* _ASM_NIOS2_PGALLOC_H */
> -- 
> 2.40.1
> 
> 

