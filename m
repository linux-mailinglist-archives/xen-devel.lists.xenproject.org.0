Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8974686CDCB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687263.1070448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfilz-0007uT-Lv; Thu, 29 Feb 2024 15:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687263.1070448; Thu, 29 Feb 2024 15:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfilz-0007s4-JJ; Thu, 29 Feb 2024 15:56:39 +0000
Received: by outflank-mailman (input) for mailman id 687263;
 Thu, 29 Feb 2024 15:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cziD=KG=bombadil.srs.infradead.org=BATV+ba4d12e182ac9dd248a8+7494+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rfily-0007qy-8Y
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:56:38 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d90169d-d71b-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 16:56:36 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rfilp-0000000E9xh-2JaC;
 Thu, 29 Feb 2024 15:56:29 +0000
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
X-Inumbo-ID: 1d90169d-d71b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZZeeQhzP/DHpKF5QdT9LDfZVh1KeLzxu5kAiu8X0IuI=; b=MyDA82W9Ybj19i6XFkxtLJHcIj
	DIdV0B551cX9Of1vbLiE7wQyZ+QZ5s8/rx8PcMT7ZPqE5MxTVE1PqdqAGpoLtaEP7Z4GODcSqBYpf
	+5PUuQblRp6R9otKcB2rgpT/TckK30wW/x9kWHfBUBOEYLAv9ENYNYjr74JbVv+4HkHvDmFDcyos1
	L5Gi5pVl5ETAKTSF6e0VODoCUz2lHFEdWX18oSiBxUvU0VJHDtUoU+XqIK7UWxX26b+RFFj8q7AE8
	7UYQl/Ts9ehrXAidDb+ChLkR4jo9tWvXsBvM8DXn+wWbhjnOn95vr0rgW5lmvfOKAFxXuYbK3wwqj
	Ze2WUX/Q==;
Date: Thu, 29 Feb 2024 07:56:29 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, bpf <bpf@vger.kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Barret Rhoden <brho@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	sstabellini@kernel.org, Juergen Gross <jgross@suse.com>,
	linux-mm <linux-mm@kvack.org>, xen-devel@lists.xenproject.org,
	Kernel Team <kernel-team@fb.com>
Subject: Re: [PATCH v2 bpf-next 3/3] mm: Introduce VM_SPARSE kind and
 vm_area_[un]map_pages().
Message-ID: <ZeCpLW25Fn6Di3Gu@infradead.org>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
 <20240223235728.13981-4-alexei.starovoitov@gmail.com>
 <Zd4jGhvb-Utdo2jU@infradead.org>
 <CAADnVQ+f06b1hDrAyLM-OrzDfEEa=jtamJOKfEnEo4ewKPV0cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQ+f06b1hDrAyLM-OrzDfEEa=jtamJOKfEnEo4ewKPV0cA@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Feb 27, 2024 at 05:31:28PM -0800, Alexei Starovoitov wrote:
> What would it look like with a cookie?
> A static inline wrapper around get_vm_area() that returns area->addr ?
> And the start address of vmap range will be such a cookie?

Hmm, just making the kernel virtual address the cookie actually
sounds pretty neat indeed even if I did not have that in mind.

> I guess I don't understand the motivation to hide 'struct vm_struct *'.

The prime reason is that then people will try to start random APIs that
work on it.  But let's give it a try without the wrappers and see how
things go.


