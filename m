Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA3740050
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 18:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556200.868529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEBEN-0006WJ-Tt; Tue, 27 Jun 2023 16:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556200.868529; Tue, 27 Jun 2023 16:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEBEN-0006U0-Ql; Tue, 27 Jun 2023 16:07:51 +0000
Received: by outflank-mailman (input) for mailman id 556200;
 Tue, 27 Jun 2023 16:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L7+2=CP=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1qEBEM-0006Qv-BK
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 16:07:50 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28d0313-1504-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 18:07:49 +0200 (CEST)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-dbn0Ts7vNT6chnTzKkXGiQ-1; Tue, 27 Jun 2023 12:07:46 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-765ad67e690so36464985a.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 09:07:46 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05620a13b500b0075ecdc937ffsm1342302qki.41.2023.06.27.09.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 09:07:45 -0700 (PDT)
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
X-Inumbo-ID: c28d0313-1504-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687882068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hJDOCrbidQ6SQFQe4MgEFJjZ7UTNPrXFah4ZUMjVF/Y=;
	b=Cc0KwX7LyXS8JYv5xGW2+kada08T3uFyGsb8yTCVnIZMX4XtJxbocE5Ojds0u20/K+87is
	myxitS0nc+jnkl3smPQ3i2/vDsQnyna8j92dy+nE2BauC8pcvPB3aet2VXVwCWMCIfP96f
	FZgTv+82jeH/NQ6orFj0L1Qu8UqSMoQ=
X-MC-Unique: dbn0Ts7vNT6chnTzKkXGiQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687882066; x=1690474066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJDOCrbidQ6SQFQe4MgEFJjZ7UTNPrXFah4ZUMjVF/Y=;
        b=bcHRa2cMQ/O+oVleqsd3tzUkJYPk8bhpgXGD4Wv9zGb5LQBuWwqtAlIWa97/FJyDV2
         Vkkw8oIPuuAycqJTW9u/oWqo1EKs4MBYLEKGYkIdQtyzFW52NO12byiQQNN9VjKVZ7vm
         +Z1TQ2SzvS2wWna+hXrS0gXt5NKdc9QdukDpPQkSkDwyxJXJs3QoyaPwMmXF5TAphTp5
         h9J2hAFnldHOUziE6+nyWsW6ih2goUFcmd6br9VpdTvrNmXkvAK+MV+Y8bh8SRN2EHzu
         7KLTn7juNDZ3YjuhaIJ6d4HGWt+fWkhW8wa3PGLtB/gj4J+LyBS1woXFPoSOBC2m4l1N
         Hb5Q==
X-Gm-Message-State: AC+VfDzGEWHlszVLNiEgizANnNdwiWOzNKvKktvEE8c7v0P12mpqgKZ7
	KqDWA31tgSVnWZQxtF/HnE+KPJj453Fg4C29IGZF+BsLu5h0Dr6Kkr7Mo0vSzsxbbF7x+aj8hTx
	I0BsjJq9wgrCM8Fp9/L1we1ITShM=
X-Received: by 2002:a05:620a:4007:b0:765:7b61:46fc with SMTP id h7-20020a05620a400700b007657b6146fcmr12614179qko.7.1687882066186;
        Tue, 27 Jun 2023 09:07:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7UY1eApNq4tXkhQSQVDzyCNrRRXMA0KLJ6oWun1WyljocOJD3jbWnq1iikbRngPAZ/IFjT9Q==
X-Received: by 2002:a05:620a:4007:b0:765:7b61:46fc with SMTP id h7-20020a05620a400700b007657b6146fcmr12614153qko.7.1687882065917;
        Tue, 27 Jun 2023 09:07:45 -0700 (PDT)
Date: Tue, 27 Jun 2023 12:07:43 -0400
From: Peter Xu <peterx@redhat.com>
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
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v6 03/33] pgtable: Create struct ptdesc
Message-ID: <ZJsJT9dLtxaKlxVb@x1n>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <20230627031431.29653-4-vishal.moola@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230627031431.29653-4-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 26, 2023 at 08:14:01PM -0700, Vishal Moola (Oracle) wrote:
> Currently, page table information is stored within struct page. As part
> of simplifying struct page, create struct ptdesc for page table
> information.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  include/linux/pgtable.h | 68 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 5063b482e34f..d46cb709ce08 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -987,6 +987,74 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>  #endif /* CONFIG_MMU */
>  
> +
> +/**
> + * struct ptdesc -    Memory descriptor for page tables.
> + * @__page_flags:     Same as page flags. Unused for page tables.
> + * @pt_rcu_head:      For freeing page table pages.
> + * @pt_list:          List of used page tables. Used for s390 and x86.
> + * @_pt_pad_1:        Padding that aliases with page's compound head.
> + * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
> + * @_pt_s390_gaddr:   Aliases with page's mapping. Used for s390 gmap only.

Should some arch-specific bits (and a few others) always under some
#ifdefs, so it shouldn't appear on other archs?

> + * @pt_mm:            Used for x86 pgds.
> + * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
> + * @ptl:              Lock for the page table.
> + * @__page_type:      Same as page->page_type. Unused for page tables.
> + * @_refcount:        Same as page refcount. Used for s390 page tables.
> + * @pt_memcg_data:    Memcg data. Tracked for page tables here.
> + *
> + * This struct overlays struct page for now. Do not modify without a good
> + * understanding of the issues.
> + */
> +struct ptdesc {
> +	unsigned long __page_flags;
> +
> +	union {
> +		struct rcu_head pt_rcu_head;
> +		struct list_head pt_list;
> +		struct {
> +			unsigned long _pt_pad_1;
> +			pgtable_t pmd_huge_pte;
> +		};
> +	};
> +	unsigned long _pt_s390_gaddr;
> +
> +	union {
> +		struct mm_struct *pt_mm;
> +		atomic_t pt_frag_refcount;
> +	};
> +
> +	union {
> +		unsigned long _pt_pad_2;
> +#if ALLOC_SPLIT_PTLOCKS
> +		spinlock_t *ptl;
> +#else
> +		spinlock_t ptl;
> +#endif
> +	};
> +	unsigned int __page_type;
> +	atomic_t _refcount;
> +#ifdef CONFIG_MEMCG
> +	unsigned long pt_memcg_data;
> +#endif
> +};

-- 
Peter Xu


