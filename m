Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09248B136FB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 10:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061109.1426599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugJYX-0003yy-I9; Mon, 28 Jul 2025 08:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061109.1426599; Mon, 28 Jul 2025 08:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugJYX-0003th-FQ; Mon, 28 Jul 2025 08:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1061109;
 Mon, 28 Jul 2025 08:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMih=2J=gmail.com=richard.weiyang@srs-se1.protection.inumbo.net>)
 id 1ugJYV-0003qm-5w
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 08:49:59 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6859b47-6b8f-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 10:49:57 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61521cd7be2so1535860a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 01:49:57 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af63589ff78sm394541266b.47.2025.07.28.01.49.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jul 2025 01:49:55 -0700 (PDT)
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
X-Inumbo-ID: d6859b47-6b8f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753692597; x=1754297397; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsN7y/1kzG5yx277Iqzf5ufFB3MHq4CNNEmgUnJER1I=;
        b=ORcbKEnz+LJQCQXMxFWZr2RZqPCVILuyW83FabgZxlsUE+OIwQgDuJS4NnRSxIjf+q
         ZpBFLxgYtGU16irv3prWBDnC1H8TveOVwDcfJAo8RwYBW0W77g8XHFI2nOiMeEv/E1qP
         MBc8BooH4fk8cmIGPmr/uUVBmPnWIJJUFU3fY5gEilAWq+FLRRuDiEj8TZzW/ofDsw5f
         a2A6tJYUI4hYhZ/uSJYGSPIO21CJpYYW2uD3Y1bNCA2IWlvPLKzUwPaM6363FC4lmvNh
         h7BoUlWfPAl8ARwv9Eiu99U3aXFTYTfVVKqk8jYleaofAE5qJPxHW43EWtDRDryUw62+
         i2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753692597; x=1754297397;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nsN7y/1kzG5yx277Iqzf5ufFB3MHq4CNNEmgUnJER1I=;
        b=UAHg6vOeyqZ4Y+c0Ple6eMGEC7pad9fQ7XT9RqqMydlSOk8Sb/DafWWaWzy2pPjWmf
         CG5mtI0CIRC9sK0GSERIMUab8HZYP68NOgs67Q1xsx6ot7ArUa/XXx1aSYKYPk6byFCr
         6s7qIgzwhHhACfh1/AgWooMqRIP2/gMsF5rP2oKHe3TMZaiMQCjwz16qgUgz60161YO3
         DObzW/JpcPx92pkMniFj+YanqilFRP3rGgdAmrKSgB3153uoQ4bs+2VqxIeQ8yxTeLIC
         QKoDhSnormRNHKy52WxFWKm5n5ZCvx9r3tUxJCtzsHc7BhWBmNAE5pLVAkM7+bcDRrws
         tOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHkSG72Ds3MTAlazOOIZEOcAQ7N2s6zhUJ8SQcPsBMb93pxcXzsB9dgcBdHqgHGG6XNRtLhjn9zgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDHBkmpWB/fmKNQMJWNpk+HAr5BiMeR6VBopyp6CdSZwCo373X
	yI8HkVOspjATawGOgS7H5MLedNYeraSd/UQ7taAO9hZOYnJxfaxVakcd
X-Gm-Gg: ASbGnctziu0lzIn9FQekW+WmieaTppMAkxUitwRkmZtEqEN2eH6QCYfExi3ymI/NZD6
	oCttv4C4lEMD6fFNhD49SBUQKDO4Ro/g+997rb35K6nyVMs+QZuV6XiRar72piudXm1KCWgy9Hq
	+Tu//PX1RRkS0sjN8oYuJ1znQ3kXKLgFAYhK7a29nvMsRwNfeNMO7QhTWZQRWdvCgQtutpVLSEm
	zUa6loejoNPJXwGR408ITAJ17x9lb9omOeMqcU5EwKkF1Ra/EmN2YVpfuvAC06JVOhokTfRgzDq
	6HMRowjdJdAh/nnGiUdXHYrn66wK3pSag/yMYg3HpD7dA6jeX5D412PtITqF30Pb6YvKRv2PJxs
	W7Q+wW5sO+WrCo5rpGHT9Zg==
X-Google-Smtp-Source: AGHT+IFaZJsTQLzzOiXfl1Nq1UVtUOTF8P3susmSPp5Bc8zyCjo/DGmP/Cxh+cs7YnmCiD5doe68aA==
X-Received: by 2002:a17:907:3e10:b0:ae0:d798:2ebd with SMTP id a640c23a62f3a-af61940ce29mr1071644666b.35.1753692596383;
        Mon, 28 Jul 2025 01:49:56 -0700 (PDT)
Date: Mon, 28 Jul 2025 08:49:55 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 5/9] mm/huge_memory: mark PMD mappings of the huge
 zero folio special
Message-ID: <20250728084955.uzobxwoqalcuhk72@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717115212.1825089-6-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jul 17, 2025 at 01:52:08PM +0200, David Hildenbrand wrote:
>The huge zero folio is refcounted (+mapcounted -- is that a word?)
>differently than "normal" folios, similarly (but different) to the ordinary
>shared zeropage.
>
>For this reason, we special-case these pages in
>vm_normal_page*/vm_normal_folio*, and only allow selected callers to
>still use them (e.g., GUP can still take a reference on them).
>
>vm_normal_page_pmd() already filters out the huge zero folio. However,
>so far we are not marking it as special like we do with the ordinary
>shared zeropage. Let's mark it as special, so we can further refactor
>vm_normal_page_pmd() and vm_normal_page().
>
>While at it, update the doc regarding the shared zero folios.
>
>Reviewed-by: Oscar Salvador <osalvador@suse.de>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

