Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A9B47BD2
	for <lists+xen-devel@lfdr.de>; Sun,  7 Sep 2025 16:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114065.1461266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvGKh-0003DQ-Ga; Sun, 07 Sep 2025 14:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114065.1461266; Sun, 07 Sep 2025 14:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvGKh-0003AK-BE; Sun, 07 Sep 2025 14:25:31 +0000
Received: by outflank-mailman (input) for mailman id 1114065;
 Sun, 07 Sep 2025 14:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5be=3S=sakamocchi.jp=o-takashi@srs-se1.protection.inumbo.net>)
 id 1uvGKf-0003AE-PQ
 for xen-devel@lists.xenproject.org; Sun, 07 Sep 2025 14:25:30 +0000
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cf0e277-8bf6-11f0-9809-7dc792cee155;
 Sun, 07 Sep 2025 16:25:23 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C2941140003F;
 Sun,  7 Sep 2025 10:25:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sun, 07 Sep 2025 10:25:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Sep 2025 10:25:11 -0400 (EDT)
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
X-Inumbo-ID: 7cf0e277-8bf6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1757255121; x=1757341521; bh=G/
	EPaorfj+fFyTEHaVMF0Aq5nU/5YHn8ZldlmV9nSRU=; b=LxAEL1hA32JcJEnG98
	oeJWFJW96Ab1ZdHJgGFlspwkJEj8Aiavk+dntTuQR94KmnDxtmALl7CB+fX7pbmo
	zvwHV9izosIpgEyayMmq4HTHRSL2iK4fMKWHMvvD41vWIEJCTnEIIqxOvjqUMPdN
	FaaZNPb2cDEYVHxVXwipUcCnSOWtlHTWUV9b7UKVDN46YphS5bUyXSD3O2FSIvg3
	JUD1TcNnZpGiXsQ7MCTj1TVHQ3ohhj+xY79FbL/+BRd7wIICp8XkFAHyKTyD/8lm
	yl+rKrALxeGxgT5Cn2F0n3Vujw7PsQdn7K1EKLloRiZFtuJG1JI5PkcjOkt6ZukQ
	tPFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757255121; x=1757341521; bh=G/EPaorfj+fFyTEHaVMF0Aq5nU/5YHn8Zld
	lmV9nSRU=; b=gkkyoHxlYwH2iEfC+POnjbirfwG9a7+WNBFdUULpIUfCF6QwBKD
	CXcsXkweDWwsQzN7Gd/GbXOk1SV+QIJUgWkOe1GLc0VVeUYBy346pR/YD304mG7z
	1ztsB7KcR9c74q1QJaQIjsplL9rOCD+fGXEZYd3b1CaBQnjtDDPbNZDWICkLf5pp
	E+qxogYXjT9un6LXfyJoljBVnMPFxj2E3BW22x2ShtmyGXx44gZthxk9ic+CJ+5v
	xe6lmL0VZ16DWgsUqgTs96f66G7saKooHJEnRz+Yld+xGqzw4yGMu+xPzsXFPe8w
	GNdDDSQNNRcQqEmj5hrowrarHbImiv5H7QA==
X-ME-Sender: <xms:zpW9aHBBt0nmuBo9smDJ2pyc66XAz51H2zLxPIL-bKuIIirEqr75FQ>
    <xme:zpW9aP5GM0Oa9oXSpXiYSqnaKLnHMrts9xFSY3EInc6RNC_Ob2dxgDJB8d83jBdim
    fy3XXGQESbNHiHsUNQ>
X-ME-Received: <xmr:zpW9aNLIKTgt7t1RechOqALMeiJc4jvDTVIeA0j8Y6R9TLQOMTuGJFNVHgmJLi83Qw1w6W0IAc1sMtpcdOdKwHPv5EDXH_yn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcu
    ufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqne
    cuggftrfgrthhtvghrnhepveehudehueekveelteevkeevkeeiudfgtdeivdehjeetffdt
    vdeukeekheeitdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghp
    thhtohepfeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjghhgsehnvhhiug
    hirgdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdr
    tghomhdprhgtphhtthhopegrsgguihgvlhdrjhgrnhhulhhguhgvsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepghhlihguvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghkphhmsehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehhtghhsehlshhtrdgu
    vgdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhomh
    hmuheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:zpW9aESQOTluGcoqM_cunEP_CQ11Qvxrpy5aGTfr1MzqwvK2MTzWog>
    <xmx:zpW9aFHJqGCH6u0UWGJG3VtNOeC2T8wJ8cwxckTphVMd0qLeV964DA>
    <xmx:zpW9aNpr-peDJ1nPk1kSevLyeyufAy3XpVeJTpuplknDlKhO7wcF7A>
    <xmx:zpW9aLNxtTkNoAukVHmomnYFXm7ah-6QwcR2-dfdjXXF-bo6zSTB0A>
    <xmx:0ZW9aEVsvUTTHZprT5gFlKyXEiCBT6fpdOnxgCny8ixcqLiQ3QkTgVqI>
Feedback-ID: ie8e14432:Fastmail
Date: Sun, 7 Sep 2025 23:25:09 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,	virtualization@lists.linux.dev,
 Will Deacon <will@kernel.org>,	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250907142509.GA507575@workstation.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,	virtualization@lists.linux.dev,
 Will Deacon <will@kernel.org>,	xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905174324.GI616306@nvidia.com>

Hi,

I'm a present maintainer of Linux FireWire subsystem, and recent years
have been working to modernize the subsystem.

On Fri, Sep 05, 2025 at 14:43:24PM -0300, Jason Gunthorpe wrote:
> There is only one user I found of alloc_pages:
>
> drivers/firewire/ohci.c:                ctx->pages[i] = dma_alloc_pages(dev, PAGE_SIZE, &dma_addr,
>
> And it deliberately uses page->private:
>
>		set_page_private(ctx->pages[i], dma_addr);
>
> So it is correct to use the struct page API.

I've already realized it, and it is in my TODO list to use modern
alternative APIs to replace it (but not yet). If you know some
candidates for this purpose, it is really helpful to accomplish it.


Regards

Takashi Sakamoto

