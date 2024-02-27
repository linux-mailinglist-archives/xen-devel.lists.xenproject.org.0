Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17C869E7C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 19:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686296.1068145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf1kV-0003H8-BF; Tue, 27 Feb 2024 18:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686296.1068145; Tue, 27 Feb 2024 18:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf1kV-0003EY-8c; Tue, 27 Feb 2024 18:00:15 +0000
Received: by outflank-mailman (input) for mailman id 686296;
 Tue, 27 Feb 2024 18:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8US=KE=bombadil.srs.infradead.org=BATV+5d0d8640c4fce96ce78f+7492+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rf1kU-0003ES-0h
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 18:00:14 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c9d5293-d59a-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 19:00:11 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rf1kA-00000006L78-3JBT;
 Tue, 27 Feb 2024 17:59:54 +0000
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
X-Inumbo-ID: 0c9d5293-d59a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GukGcLj9PQJkkJdIQj2GR9q/JvN/F9bhdGOfMYM4O/U=; b=XwrNH63ffZ7GWr5zMD/MMNx9XI
	v9aKaslPO74VTtTivC5ZzlDmyM/6RnQ6cWIobn9vQYSp0ptp30DwyT/kCVaXr+GrAXmk1GUUxWnS8
	DyBGtLgUkEI4F5RnePXoVclfk6mgvIZ2f97YaRsMb0qfH+scl3eoThCPCW7OHCHjk3Ips9pyendm4
	7Qy6XJfkHoF79fYInWSFYVun7XXy+OYAuvZQT8ctwRRbJGmiwvXPaP6PpCZdc832OybgiyC8SAnJv
	rjm5Ybep2LF4gvmEhBTgaZR8l9m7fJGKIne09MLk5dj2tDRxjYnE3qEHrtHixqQ2CRTi0UmWmpsah
	oSGmJfgw==;
Date: Tue, 27 Feb 2024 09:59:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	torvalds@linux-foundation.org, brho@google.com, hannes@cmpxchg.org,
	lstoakes@gmail.com, akpm@linux-foundation.org, urezki@gmail.com,
	hch@infradead.org, boris.ostrovsky@oracle.com,
	sstabellini@kernel.org, jgross@suse.com, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, kernel-team@fb.com
Subject: Re: [PATCH v2 bpf-next 3/3] mm: Introduce VM_SPARSE kind and
 vm_area_[un]map_pages().
Message-ID: <Zd4jGhvb-Utdo2jU@infradead.org>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
 <20240223235728.13981-4-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223235728.13981-4-alexei.starovoitov@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

> privately-managed pages into a sparse vm area with the following steps:
> 
>   area = get_vm_area(area_size, VM_SPARSE);  // at bpf prog verification time
>   vm_area_map_pages(area, kaddr, 1, page);   // on demand
>                     // it will return an error if kaddr is out of range
>   vm_area_unmap_pages(area, kaddr, 1);
>   free_vm_area(area);                        // after bpf prog is unloaded

I'm still wondering if this should just use an opaque cookie instead
of exposing the vm_area.  But otherwise this mostly looks fine to me.

> +	if (addr < (unsigned long)area->addr || (void *)end > area->addr + area->size)
> +		return -ERANGE;

This check is duplicated so many times that it really begs for a helper.

> +int vm_area_unmap_pages(struct vm_struct *area, unsigned long addr, unsigned int count)
> +{
> +	unsigned long size = ((unsigned long)count) * PAGE_SIZE;
> +	unsigned long end = addr + size;
> +
> +	if (WARN_ON_ONCE(!(area->flags & VM_SPARSE)))
> +		return -EINVAL;
> +	if (addr < (unsigned long)area->addr || (void *)end > area->addr + area->size)
> +		return -ERANGE;
> +
> +	vunmap_range(addr, end);
> +	return 0;

Does it make much sense to have an error return here vs just debug
checks?  It's not like the caller can do much if it violates these
basic invariants.

