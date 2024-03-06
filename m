Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FFE8738D5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 15:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689346.1074205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhs7L-0005a0-Ms; Wed, 06 Mar 2024 14:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689346.1074205; Wed, 06 Mar 2024 14:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhs7L-0005YU-K5; Wed, 06 Mar 2024 14:19:35 +0000
Received: by outflank-mailman (input) for mailman id 689346;
 Wed, 06 Mar 2024 14:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EL90=KM=bombadil.srs.infradead.org=BATV+4dba8c0e752ee08e0936+7500+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rhs7J-0005YK-9F
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 14:19:34 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4089e4-dbc4-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 15:19:32 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rhs7B-00000000Xnv-0zmt;
 Wed, 06 Mar 2024 14:19:25 +0000
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
X-Inumbo-ID: 8c4089e4-dbc4-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=73xuAghPC4Z/eUTJDoMRemAMxFESv8bJnB9ykB4M4q8=; b=adopzwfBlGv617jauRQSoInnIu
	77opbIWOak6y+04Xy2Y+F3QGbNIIWgltPv1B3jfbmx0HGPNz1pPSQdk34qAEikc9ZvCJvZjJoAI5B
	J4B9N0OiI1gO/gZkRS8eqoTXwkvK5flEYDWKMk8iOeR4ragVa+2o09nY0Fql5EcW8hJ9kKVa8Gpmz
	QP2y2KXeWWFZWt4gymcCvxvWLgBqb2YC3ayBuRfUiR3TZl9RojL1a66pRokOSd6hA3YJwNirtwtxh
	3h/D2g5+Bf0LqD+oCBVJ7oBzR43QY2QZvd61YK611orrUfX1y5/GWIe5czjMd83jpt2hhCVgnjz5K
	kRK3aR8g==;
Date: Wed, 6 Mar 2024 06:19:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	torvalds@linux-foundation.org, brho@google.com, hannes@cmpxchg.org,
	lstoakes@gmail.com, akpm@linux-foundation.org, urezki@gmail.com,
	hch@infradead.org, rppt@kernel.org, boris.ostrovsky@oracle.com,
	sstabellini@kernel.org, jgross@suse.com, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, kernel-team@fb.com
Subject: Re: [PATCH v4 bpf-next 2/2] mm: Introduce VM_SPARSE kind and
 vm_area_[un]map_pages().
Message-ID: <Zeh7bTYotfaKoCVD@infradead.org>
References: <20240305030516.41519-1-alexei.starovoitov@gmail.com>
 <20240305030516.41519-3-alexei.starovoitov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305030516.41519-3-alexei.starovoitov@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

I'd still prefer to hide the vm_area, but for now:

Reviewed-by: Christoph Hellwig <hch@lst.de>

