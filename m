Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFCE8671EF
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685440.1066166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYZ2-0006FU-Om; Mon, 26 Feb 2024 10:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685440.1066166; Mon, 26 Feb 2024 10:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYZ2-0006DR-Lv; Mon, 26 Feb 2024 10:50:28 +0000
Received: by outflank-mailman (input) for mailman id 685440;
 Mon, 26 Feb 2024 10:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLHk=KD=bombadil.srs.infradead.org=BATV+3075c4dbfe213c24d6b2+7491+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1reYYy-0006Bw-Fl
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:50:27 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d9575c-d494-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:50:23 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1reYYq-00000000C2e-1All;
 Mon, 26 Feb 2024 10:50:16 +0000
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
X-Inumbo-ID: d6d9575c-d494-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8zXJnYkWvb7GCIP0mRpV6jKEXdPSRHoRUoq4Q4XvFso=; b=1FVpbdFGoDA69PZZUcL4HiCtMz
	S6WFk/vpfQAB/kguloupNrgoRgK4vjbvfGKDw6TZHXyCBf52luksnZyy+2wbqip9cqyCkauoU5RxA
	9Jgay49gicYkCypB2ID8yeiUIOoCgg9Ww6kzWEF+BI2PRQBUjmWf31Fba4biwbLFNimlj804lPzhB
	OatWMdfGH7woOtg6A0Wa5soW7v2mb8shmzzPAv/pPb1n3wNayVkic9AQ5Tn9aRJOFvCMEVDGlMx5e
	MxaIBCxza0I8HOVlkQli3oksCZa2jSLmj0y25Lqa3m4xble00cszPiVEb4gvbECDXlYq6xaz1b5MR
	wjjQo3tg==;
Date: Mon, 26 Feb 2024 02:50:16 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	torvalds@linux-foundation.org, brho@google.com, hannes@cmpxchg.org,
	lstoakes@gmail.com, akpm@linux-foundation.org, urezki@gmail.com,
	hch@infradead.org, boris.ostrovsky@oracle.com,
	sstabellini@kernel.org, jgross@suse.com, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, kernel-team@fb.com
Subject: Re: [PATCH v2 bpf-next 1/3] mm: Enforce VM_IOREMAP flag and range in
 ioremap_page_range.
Message-ID: <Zdxs6DDSVtjaqK-d@infradead.org>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
 <20240223235728.13981-2-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223235728.13981-2-alexei.starovoitov@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Feb 23, 2024 at 03:57:26PM -0800, Alexei Starovoitov wrote:
> From: Alexei Starovoitov <ast@kernel.org>
> 
> There are various users of get_vm_area() + ioremap_page_range() APIs.
> Enforce that get_vm_area() was requested as VM_IOREMAP type and range passed to
> ioremap_page_range() matches created vm_area to avoid accidentally ioremap-ing
> into wrong address range.

Nit: overly long lines in the commit message here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

