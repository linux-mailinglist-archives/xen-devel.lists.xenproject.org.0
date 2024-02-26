Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4D867205
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:52:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685448.1066186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYaS-0007fy-9R; Mon, 26 Feb 2024 10:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685448.1066186; Mon, 26 Feb 2024 10:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYaS-0007dd-6U; Mon, 26 Feb 2024 10:51:56 +0000
Received: by outflank-mailman (input) for mailman id 685448;
 Mon, 26 Feb 2024 10:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLHk=KD=bombadil.srs.infradead.org=BATV+3075c4dbfe213c24d6b2+7491+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1reYaQ-00073t-Dk
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:51:54 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d255dad-d495-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:51:54 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1reYaK-00000000CXP-1Ea2;
 Mon, 26 Feb 2024 10:51:48 +0000
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
X-Inumbo-ID: 0d255dad-d495-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8roVx31ufi19zVwomTMUR9WxKwNhqkCKOnoNzyb/69w=; b=P3+Hq4bmD5YRk1RKTqJit0XKn5
	edh2klMjQWEF1w5iz23iQZUvSSJmxb4CSHjtVtmQA8lMnrA3OE9mwCwkZqekhvR7l9wmK2QQirKzK
	zyedNXBLj78QUDEQE9qUuYheD0aSjuqCyv45SGF6zziygXDEi2xq7I8Gip/qKZ+8mPIPxQdbdXsD3
	OuUIwsR4wUfb2Vx9tqZKSvGcY6YfF1MJe3FpPeBK3caVnfapnLfBb9bY94uASzk1+gOmY9YTszZaN
	hBGBfzgqIv2mDJZKE8KiLS9XKG8zQ08KJ/PCXrl36Cbea6Y85IKYOiDZmvjqMGCo3eoCf+CsVRsNo
	Umn4nkiw==;
Date: Mon, 26 Feb 2024 02:51:48 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	torvalds@linux-foundation.org, brho@google.com, hannes@cmpxchg.org,
	lstoakes@gmail.com, akpm@linux-foundation.org, urezki@gmail.com,
	hch@infradead.org, boris.ostrovsky@oracle.com,
	sstabellini@kernel.org, jgross@suse.com, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, kernel-team@fb.com
Subject: Re: [PATCH v2 bpf-next 2/3] mm, xen: Separate xen use cases from
 ioremap.
Message-ID: <ZdxtRLw-PxYNkH1u@infradead.org>
References: <20240223235728.13981-1-alexei.starovoitov@gmail.com>
 <20240223235728.13981-3-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223235728.13981-3-alexei.starovoitov@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Fri, Feb 23, 2024 at 03:57:27PM -0800, Alexei Starovoitov wrote:
> From: Alexei Starovoitov <ast@kernel.org>
> 
> xen grant table and xenbus ring are not ioremap the way arch specific code is using it,
> so let's add VM_XEN flag to separate them from VM_IOREMAP users.
> xen will not and should not be calling ioremap_page_range() on that range.
> /proc/vmallocinfo will print such region as "xen" instead of "ioremap" as well.

Splitting this out is a good idea, but XEN seems a bit of a too
generit time.  Probably GRANT_TABLE or XEN_GRANT_TABLE if that isn't
too long would be better.  Maybe the Xen maintainers have an idea.

Also more overlong commit message lines here, I'm not going to complain
on the third patch if they show up again :)


