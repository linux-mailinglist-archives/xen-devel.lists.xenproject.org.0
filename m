Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E9B08084
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 00:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045926.1416168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucAar-0001rj-4t; Wed, 16 Jul 2025 22:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045926.1416168; Wed, 16 Jul 2025 22:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucAar-0001qu-21; Wed, 16 Jul 2025 22:27:17 +0000
Received: by outflank-mailman (input) for mailman id 1045926;
 Wed, 16 Jul 2025 22:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/YA=Z5=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1ucAaq-0001qo-3E
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 22:27:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05301e8e-6294-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 00:27:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D050601CF;
 Wed, 16 Jul 2025 22:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087D3C4CEE7;
 Wed, 16 Jul 2025 22:27:11 +0000 (UTC)
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
X-Inumbo-ID: 05301e8e-6294-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752704832;
	bh=Tu5JRrTaLxjAsLV5SCPpe1Ex1V91jjvN1Tb/KDM9lNw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FQ20TfVJv7WHG4iy+EX6C5O/ThLRdHt1x2CyduQoJ7kBpnfwVRY4iaXRGrPLDkcGE
	 DBema/GEK6i5vtv2C20l0NWl0W9bQMb+oyV+Fhec+AWeSTRdsHVXB/JrmwlAloVh2r
	 aiQsmw0UH40iuqW+2aualml7hoCW1ijLrIVxgQ0o=
Date: Wed, 16 Jul 2025 15:27:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato
 <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, Oscar Salvador
 <osalvador@suse.de>, Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v1 0/9] mm: vm_normal_page*() improvements
Message-Id: <20250716152710.59e09fe5056010322de2a1a3@linux-foundation.org>
In-Reply-To: <17a539fa-977c-4f3f-bedf-badd1fc1287a@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
	<20250715163126.7bcaca25364dd68835bd9c8b@linux-foundation.org>
	<17a539fa-977c-4f3f-bedf-badd1fc1287a@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Jul 2025 10:47:29 +0200 David Hildenbrand <david@redhat.com> wrote:

> > 
> > However the series rejects due to the is_huge_zero_pmd ->
> > is_huge_zero_pfn changes in Luiz's "mm: introduce snapshot_page() v3"
> > series, so could we please have a redo against present mm-new?
> 
> I'm confused: mm-new *still* contains the patch from Luiz series that
> was originally part of the RFC here.
> 
> commit 791cb64cd7f8c2314c65d1dd5cb9e05e51c4cd70
> Author: David Hildenbrand <david@redhat.com>
> Date:   Mon Jul 14 09:16:51 2025 -0400
> 
>      mm/memory: introduce is_huge_zero_pfn() and use it in vm_normal_page_pmd()
> 
> If you want to put this series here before Luiz', you'll have to move that
> single patch as well.
> 
> But probably this series should be done on top of Luiz work, because Luiz
> fixes something.

I'm confused at your confused.  mm-new presently contains Luiz's latest
v3 series "mm: introduce snapshot_page()" which includes a copy of your
"mm/memory: introduce is_huge_zero_pfn() and use it in
vm_normal_page_pmd()".

> [that patch was part of the RFC series, but Luiz picked it up for his work, so I dropped it
> from this series and based it on top of current mm-new]

