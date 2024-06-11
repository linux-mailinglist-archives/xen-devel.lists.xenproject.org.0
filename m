Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0390445E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 21:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738668.1145488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH725-0007QT-Rr; Tue, 11 Jun 2024 19:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738668.1145488; Tue, 11 Jun 2024 19:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH725-0007OH-PD; Tue, 11 Jun 2024 19:19:49 +0000
Received: by outflank-mailman (input) for mailman id 738668;
 Tue, 11 Jun 2024 19:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+2X=NN=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1sH724-0007Nm-7O
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 19:19:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fc70894-2827-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 21:19:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BE7E6115A;
 Tue, 11 Jun 2024 19:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA6EC2BD10;
 Tue, 11 Jun 2024 19:19:43 +0000 (UTC)
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
X-Inumbo-ID: 8fc70894-2827-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718133584;
	bh=AUJ44aafNBmr/yleRRZzaXjkALQuPOf50mYZh00Z5XE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eEh1BqswoHduG9oop33Az9TKXljfW3F9d2mhubpTL00w+7sI2Bxwr+YQyOGwZl7sK
	 MhJWEusJFvap0UM4BgBZ5H75YgdngB52ZuTWLHaFqC+jP2aZPOLpyM8OKdLaQDRdBi
	 79cuL9urUZBnnBw995W3elJj3j5pLY0GIPM3fFx0=
Date: Tue, 11 Jun 2024 12:19:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, kasan-dev@googlegroups.com, Mike Rapoport
 <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v1 1/3] mm: pass meminit_context to __free_pages_core()
Message-Id: <20240611121942.050a2215143af0ecb576122f@linux-foundation.org>
In-Reply-To: <2ed64218-7f3b-4302-a5dc-27f060654fe2@redhat.com>
References: <20240607090939.89524-1-david@redhat.com>
	<20240607090939.89524-2-david@redhat.com>
	<2ed64218-7f3b-4302-a5dc-27f060654fe2@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Jun 2024 12:06:56 +0200 David Hildenbrand <david@redhat.com> wrote:

> On 07.06.24 11:09, David Hildenbrand wrote:
> > In preparation for further changes, let's teach __free_pages_core()
> > about the differences of memory hotplug handling.
> > 
> > Move the memory hotplug specific handling from generic_online_page() to
> > __free_pages_core(), use adjust_managed_page_count() on the memory
> > hotplug path, and spell out why memory freed via memblock
> > cannot currently use adjust_managed_page_count().
> > 
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> 
> @Andrew, can you squash the following?

Sure.

I queued it against "mm: pass meminit_context to __free_pages_core()",
not against

> Subject: [PATCH] fixup: mm/highmem: make nr_free_highpages() return "unsigned
>   long"


