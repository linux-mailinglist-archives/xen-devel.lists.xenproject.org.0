Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99006B069EA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 01:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044751.1414818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubp7U-0005Iw-Mq; Tue, 15 Jul 2025 23:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044751.1414818; Tue, 15 Jul 2025 23:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubp7U-0005HU-Jk; Tue, 15 Jul 2025 23:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1044751;
 Tue, 15 Jul 2025 23:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4KY=Z4=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1ubp7T-0005HO-7N
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 23:31:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d7a129-61d3-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 01:31:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EF462A572D2;
 Tue, 15 Jul 2025 23:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA551C4CEE3;
 Tue, 15 Jul 2025 23:31:26 +0000 (UTC)
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
X-Inumbo-ID: d4d7a129-61d3-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752622287;
	bh=U39fUGdLgfuWmXMQrKansqzCV/he0S+4iRMuquTPLgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=njE2Om+U5qOoZlUOcNHAaw5KV8Txr5jep5D4NRYQTxK+LCyfS1ZyTansCOlWs/QTh
	 o483VQOOj5Pbf5Yuy10wFbVwdz9hwu0VyEpSj2VAi4NEcpviRCc64s0V8sqj06MGoR
	 Das6Gqqfd4hmfgzrT+6WuicQTiTx9Ld+Y7D/BROI=
Date: Tue, 15 Jul 2025 16:31:26 -0700
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
Message-Id: <20250715163126.7bcaca25364dd68835bd9c8b@linux-foundation.org>
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Jul 2025 15:23:41 +0200 David Hildenbrand <david@redhat.com> wrote:

> Based on mm/mm-new. I dropped the CoW PFNMAP changes for now, still
> working on a better way to sort all that out cleanly.
> 
> Cleanup and unify vm_normal_page_*() handling, also marking the
> huge zerofolio as special in the PMD. Add+use vm_normal_page_pud() and
> cleanup that XEN vm_ops->find_special_page thingy.
> 
> There are plans of using vm_normal_page_*() more widely soon.
> 
> Briefly tested on UML (making sure vm_normal_page() still works as expected
> without pte_special() support) and on x86-64 with a bunch of tests.

When I was but a wee little bairn, my mother would always tell me
"never merge briefly tested patches when you're at -rc6".  But three
weeks in -next should shake things out.

However the series rejects due to the is_huge_zero_pmd ->
is_huge_zero_pfn changes in Luiz's "mm: introduce snapshot_page() v3"
series, so could we please have a redo against present mm-new?


