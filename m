Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DEB371FC
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 20:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094880.1450107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqyA5-0004Q8-WC; Tue, 26 Aug 2025 18:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094880.1450107; Tue, 26 Aug 2025 18:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqyA5-0004Ne-Sw; Tue, 26 Aug 2025 18:12:49 +0000
Received: by outflank-mailman (input) for mailman id 1094880;
 Tue, 26 Aug 2025 16:37:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=beyi=3G=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1uqwg4-000075-EH
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 16:37:44 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc00d15d-829a-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 18:37:42 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b47174c8e45so5627449a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 09:37:42 -0700 (PDT)
Received: from dw-tp ([171.76.82.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248681adacdsm21450705ad.10.2025.08.26.09.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 09:37:39 -0700 (PDT)
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
X-Inumbo-ID: fc00d15d-829a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756226260; x=1756831060; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyPF/dL+2YqZRv98PVCshXGneATY8Fvhth5O4vhMkWc=;
        b=RWf3kQcX6YzKYTR9970XgbgkZ6zwh4cAo3riZ2fvDnR6N6YYb165G0fO75pYdUDzpL
         dCOXdL+o42DEOkx6x2xrHcdAzZKOSc25RliuXiHQcCmfem8IOpPD+JYfGpJSfAfwhhBd
         24bqMQCbui4YwkMijCJ4m/4Sla7N8AzhhzL67D0b0b5kEsOjISBfeWPwRuP/ITERpRuk
         nA8AMopdJV5LVn/aq9TGJCEED0uHDZ3RSPhTpIG/fPCz8QZRei6g7ilbGyzAPDY2kdl6
         hMdJ4Fl6nSOZhDHgQ4XxHmUI659jqYOacB3f6wlEYDlbsAWrdg7J8im+JggyFzfpQ45S
         8tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226260; x=1756831060;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jyPF/dL+2YqZRv98PVCshXGneATY8Fvhth5O4vhMkWc=;
        b=RG7S51gzQxa/y0pGWiZfdoe1SQG8QBSCvyQQdvnsgnIKRibAUahuWjnk843W3Gwk9d
         cTKFje6qDOOJO97E+QvM5sE1K9LdrVzFhclyaVb7h9enc9fmrKAEnL6mKdHt1ctOmOcH
         x6w+Cqot7x/n5wm7pud4zFE9SxifV7Q2puatUWt1WlZdF47T7rcQ28rbwg/0vOgtE/oJ
         zboibRtuZUSM5KwqfrM8tcEhwnj7SPmvLjVN5xm4j/WAcyd8ePy+a0czbPxuxY11eMiN
         D1mLD861ijBdXtc/eAHIAWPiGjjLnt9GMZTG4ZctUs4PuUpk8o+AVAaRnbKmwfy4Hwht
         pfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBdjmZtICOMM3c6kByFhniPwXUul5VCHZdAi4QWRqvB+Xj3SaqGI6tYhEQxnGw35rrNVqXtVRkbAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqOJQFF/WATj0MiNvfeGCiXVjNRZ87gNn3JHl3LHhZp/dNogxp
	gPUiu5PhlbvSHFtS/Q2/wZTOum7Bsx00taonYf2v9uHhr/RVx+cpDVIqeJTgz17N
X-Gm-Gg: ASbGncslhDDMD3L+FyAYpLfCriRoTfQwU0TiraE1QcehF2c7umgBKVNjg/qquAvAaMG
	qcwrqkeVQuyC/8EglVjo69vGQBrUYMRjZHkT6+TRwGrUSLCWdhu4Pn6x+fZeajquv8ffe2aRYig
	TNZSThKcPvh8ZMLLgBgn349pKke97RcHXiGNoWN1aWdespetBjjkonQUEGLFBqZH5F8fNGHlJbZ
	Nq8KAEyq0/YvenVHykjin2BbBNqgOSRX6O477TSt73b5j9Nv//QFF3Sb2DV1/V2x3db0AmDJySX
	r274ZVGaNfcsS8OofyAiH9FYXCdqc4K+NeRiem1pwac1a2rH+5Hvq6v8fU4+O7szDwUTHSzPaX7
	Pmib4GtW+9hONzQ==
X-Google-Smtp-Source: AGHT+IHkpBzdMdA7eE7qfwfc1lxqW0m87+LkJnM6/YhAHtUnIYSPMtiSiZLKGMu2nLQJcFkeNv4YGw==
X-Received: by 2002:a17:903:32c8:b0:248:79d4:939b with SMTP id d9443c01a7336-24879d4978cmr26372675ad.54.1756226260428;
        Tue, 26 Aug 2025 09:37:40 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, David Hildenbrand <david@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 06/11] powerpc/ptdump: rename "struct pgtable_level" to "struct ptdump_pglevel"
In-Reply-To: <20250811112631.759341-7-david@redhat.com>
Date: Tue, 26 Aug 2025 21:58:09 +0530
Message-ID: <87a53mqc86.fsf@gmail.com>
References: <20250811112631.759341-1-david@redhat.com> <20250811112631.759341-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain

David Hildenbrand <david@redhat.com> writes:

> We want to make use of "pgtable_level" for an enum in core-mm. Other
> architectures seem to call "struct pgtable_level" either:
> * "struct pg_level" when not exposed in a header (riscv, arm)
> * "struct ptdump_pg_level" when expose in a header (arm64)
>
> So let's follow what arm64 does.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/mm/ptdump/8xx.c      | 2 +-
>  arch/powerpc/mm/ptdump/book3s64.c | 2 +-
>  arch/powerpc/mm/ptdump/ptdump.h   | 4 ++--
>  arch/powerpc/mm/ptdump/shared.c   | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)


As mentioned in commit msg mostly a mechanical change to convert 
"struct pgtable_level" to "struct ptdump_pg_level" for aforementioned purpose.. 

The patch looks ok and compiles fine on my book3s64 and ppc32 platform. 

I think we should fix the subject line.. s/ptdump_pglevel/ptdump_pg_level

Otherwise the changes looks good to me. So please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>



>
> diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
> index b5c79b11ea3c2..4ca9cf7a90c9e 100644
> --- a/arch/powerpc/mm/ptdump/8xx.c
> +++ b/arch/powerpc/mm/ptdump/8xx.c
> @@ -69,7 +69,7 @@ static const struct flag_info flag_array[] = {
>  	}
>  };
>  
> -struct pgtable_level pg_level[5] = {
> +struct ptdump_pg_level pg_level[5] = {
>  	{ /* pgd */
>  		.flag	= flag_array,
>  		.num	= ARRAY_SIZE(flag_array),
> diff --git a/arch/powerpc/mm/ptdump/book3s64.c b/arch/powerpc/mm/ptdump/book3s64.c
> index 5ad92d9dc5d10..6b2da9241d4c4 100644
> --- a/arch/powerpc/mm/ptdump/book3s64.c
> +++ b/arch/powerpc/mm/ptdump/book3s64.c
> @@ -102,7 +102,7 @@ static const struct flag_info flag_array[] = {
>  	}
>  };
>  
> -struct pgtable_level pg_level[5] = {
> +struct ptdump_pg_level pg_level[5] = {
>  	{ /* pgd */
>  		.flag	= flag_array,
>  		.num	= ARRAY_SIZE(flag_array),
> diff --git a/arch/powerpc/mm/ptdump/ptdump.h b/arch/powerpc/mm/ptdump/ptdump.h
> index 154efae96ae09..4232aa4b57eae 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.h
> +++ b/arch/powerpc/mm/ptdump/ptdump.h
> @@ -11,12 +11,12 @@ struct flag_info {
>  	int		shift;
>  };
>  
> -struct pgtable_level {
> +struct ptdump_pg_level {
>  	const struct flag_info *flag;
>  	size_t num;
>  	u64 mask;
>  };
>  
> -extern struct pgtable_level pg_level[5];
> +extern struct ptdump_pg_level pg_level[5];
>  
>  void pt_dump_size(struct seq_file *m, unsigned long delta);
> diff --git a/arch/powerpc/mm/ptdump/shared.c b/arch/powerpc/mm/ptdump/shared.c
> index 39c30c62b7ea7..58998960eb9a4 100644
> --- a/arch/powerpc/mm/ptdump/shared.c
> +++ b/arch/powerpc/mm/ptdump/shared.c
> @@ -67,7 +67,7 @@ static const struct flag_info flag_array[] = {
>  	}
>  };
>  
> -struct pgtable_level pg_level[5] = {
> +struct ptdump_pg_level pg_level[5] = {
>  	{ /* pgd */
>  		.flag	= flag_array,
>  		.num	= ARRAY_SIZE(flag_array),
> -- 
> 2.50.1

