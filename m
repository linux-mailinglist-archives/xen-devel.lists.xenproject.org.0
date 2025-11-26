Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8DC88422
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 07:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172258.1497348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO8wg-0003l3-7Y; Wed, 26 Nov 2025 06:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172258.1497348; Wed, 26 Nov 2025 06:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO8wg-0003jF-4l; Wed, 26 Nov 2025 06:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1172258;
 Wed, 26 Nov 2025 06:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F7tX=6C=invisiblethingslab.com=val@srs-se1.protection.inumbo.net>)
 id 1vO8wf-0003j9-0x
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 06:24:05 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f0b1bc3-ca90-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 07:24:01 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id E11801400266;
 Wed, 26 Nov 2025 01:23:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Wed, 26 Nov 2025 01:23:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Nov 2025 01:23:58 -0500 (EST)
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
X-Inumbo-ID: 7f0b1bc3-ca90-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm3; t=
	1764138239; x=1764224639; bh=HzENRNpZeVZyP1ozp+W25qbg8+VXU0nDKXi
	9w3bcSzY=; b=dvP9Rd++NONj1z5Qq1Xsj2zM7Sjef4qj4M88PXSlTgG/ZUi110C
	n0p+gjFhoMtnxlyAucRSSG/fg/0YvWqbc+cOQPwkSJPde2jmVTxfXC08h+Kkcyas
	UPBhD4p7HVt/PwFxN9lRDuUUKGgaqLRIF+LukGUpbopKIoW4qqwujPHue0R2yLQo
	ZVL0yDf1fneWtKrFwvo9YZWY/DZvbDEU2oSxduqJ5jp82cudKabB5pyG7Q53o4zS
	LJiPeqARK6de/iKNr93c1cV2MIjtOHPuRjySEvsG/bFfv3La4krjhogx99wP1cj0
	BlTNMgNbkdXO73CG4BCzkZsSbgtx9qsijNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1764138239; x=1764224639; bh=HzENRNpZeVZyP1ozp+W25qbg8+VXU0nDKXi
	9w3bcSzY=; b=LnRbYT805AgH5LORe4wEh9m84Q6KUUCm5GdytFuwbQF+dHNqLeD
	X8jvPf2QNAKi0xCB0fMQ/pgbqAd5TZINy0ZbfRKX0pQ0dHYhYw8ui6ngQ5J5Zqt0
	/IhC5ECTtCINwjUnTh1lth/hKTJIEM0IZbZAa76CItTFOS7ettdO93hCZG+qPBW6
	hM8X5rIb2HtfYJFFq8XSfItde2YXi46IQRtgvuTbDo9EeZdf2tjNXkPxEXi04L04
	PPnELqdgVBTBktshcS5hDErc5YqSOiKTGtBKrhA4caJ2HcINN/zbjyYXQ7bqnnXH
	Rt5QfTp83LFCrcdhOVxMVFLimOlNqvYeRtw==
X-ME-Sender: <xms:_5wmaTIaFad4Gx-qCf-sAkEXh29RDgkebZi4YV1pQBAmHi0zAUgRDg>
    <xme:_5wmaQeDin-InGSH8q6nb_0Y3GtTcngubh3xT-rXgQbdTsLkSTgXCUFjRZyewkWy8
    IqwIuTVCSzJf9ASsTtz9Z1CW-6wmhDTjwyhrQ44FfnCWBNZ3Q>
X-ME-Received: <xmr:_5wmaS_jmwL5Ej36JvaCTxWWtBC_JyBUrmabV_oud2IKCijbPUwn6uk9RmsnmubDwMmotyLfopzrB1DaIVKmBm72TSZSnKx5-vc2rFZLqWNXBQh14L9JwQEWRBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeefiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepgggrlhcurfgrtghk
    vghtthcuoehvrghlsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecugg
    ftrfgrthhtvghrnheptdelgfefhedtvddtvdekheejveehkefhheevvedvjeevjeffhfej
    geevhffghffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehvrghlsehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehs
    shhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrg
    hnughrpghthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtohepvhgrlhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:_5wmadoTAOvf3b4tNPV26u2iVrzYY5GXIh5Vl2U992r7ORk6AJ0WjA>
    <xmx:_5wmaXDG3odTXJsDq4V_f-O2k0xNbiufC7GPyeFkwIFSHIpkJfMNOQ>
    <xmx:_5wmafwhMQ4N-BoafpOEPk6HjmGcEPGPEtWbwIV7mZRFuqIvMYAZDA>
    <xmx:_5wmaU28B_c3XsKUG_kLRnaaePvWNSzJ-3uBNG9J3EbPpL27BXYquQ>
    <xmx:_5wmaaMAyy_pmpvOMfNC8Gu0sawsb5UYoHiF1y7Od0sEldfvP1wAYX3C>
Feedback-ID: i001e48d0:Fastmail
From: Val Packett <val@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Val Packett <val@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] xen: privcmd: fix ioeventfd crash under PV domain
Date: Wed, 26 Nov 2025 02:54:57 -0300
Message-ID: <20251126062124.117425-1-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting a virtio backend in a PV domain would panic the kernel in
alloc_ioreq, trying to dereference vma->vm_private_data as a pages
pointer when in reality it stayed as PRIV_VMA_LOCKED.

Avoid crashing by handling the PRIV_VMA_LOCKED case in alloc_ioreq.
PV support requires mapping the virtio ioreq page explicitly into
the kernel's page tables, so do it on-demand when PRIV_VMA_LOCKED
is seen.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
Changes from RFC v1[1]:
* An actually working patch now, not just a request for help :)
  All I needed to know was that PV actually doesn't emulate a common
  physical address space *at all*, the pfn mapped by xen_remap_domain_mfn_array
  was *only* available in the userspace process and the *only* way to have
  kernel access to the same memory was to perfore the same call but for the
  kernel's mm.
* Everything happens lazily / on-demand, inside of the ioeventfd code,
  addressing concerns about extra work performed for non-ioeventfd usage
  from the review. (kmalloc specifically is gone entirely..)

I'm leaving this as RFC mostly because of the "fake" vm_area_struct that's used
as a workaround for xen_remap_domain_mfn_array (or rather, its underlying
xen_remap_pfn) accepting a vm_area_struct only to take its vm_mm (and also check
flags with a BUG assertion). It was written for userspace processes since that
was the only use case anyone could ever imagine.. until ioeventfd came along.

So it would probably be better to change xen_remap_pfn to take the mm? Maybe?
I wanted to ask for advice first before trying to refactor other code.

Thanks,
~val

[1]: https://lore.kernel.org/all/20251015195713.6500-1-val@invisiblethingslab.com/
---
 drivers/xen/privcmd.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index f52a457b302d..a3ad10f149ec 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -818,6 +818,8 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 			DOMID_SELF : kdata.dom;
 		int num, *errs = (int *)pfns;
 
+		vma->vm_pgoff = pfns[0]; /* store the acquired pfn for ioeventfd access */
+
 		BUILD_BUG_ON(sizeof(*errs) > sizeof(*pfns));
 		num = xen_remap_domain_mfn_array(vma,
 						 kdata.addr & PAGE_MASK,
@@ -1248,10 +1250,38 @@ struct privcmd_kernel_ioreq *alloc_ioreq(struct privcmd_ioeventfd *ioeventfd)
 		goto error_kfree;
 	}
 
-	pages = vma->vm_private_data;
-	kioreq->ioreq = (struct ioreq *)(page_to_virt(pages[0]));
 	mmap_write_unlock(mm);
 
+	/* In a PV domain, we must manually map the pages into the kernel */
+	if (vma->vm_private_data == PRIV_VMA_LOCKED) {
+		/* This should never ever happen outside of PV */
+		if (WARN_ON_ONCE(!xen_pv_domain())) {
+			ret = -EINVAL;
+			goto error_kfree;
+		}
+
+		/* xen_remap_domain_mfn_array only really needs the mm */
+		struct vm_area_struct kern_vma = {
+			.vm_flags = VM_PFNMAP | VM_IO,
+			.vm_mm = &init_mm,
+		};
+		xen_pfn_t pfn = vma->vm_pgoff;
+		int num, err;
+
+		/* Don't provide NULL as the errors array as that results in pfn increment */
+		num = xen_remap_domain_mfn_array(&kern_vma, (unsigned long)pfn_to_kaddr(pfn),
+						&pfn, 1, &err, PAGE_KERNEL, ioeventfd->dom);
+		if (num < 0) {
+			ret = num;
+			goto error_kfree;
+		}
+
+		kioreq->ioreq = (struct ioreq *)(pfn_to_kaddr(pfn));
+	} else {
+		pages = vma->vm_private_data;
+		kioreq->ioreq = (struct ioreq *)(page_to_virt(pages[0]));
+	}
+
 	ports = memdup_array_user(u64_to_user_ptr(ioeventfd->ports),
 				  kioreq->vcpus, sizeof(*ports));
 	if (IS_ERR(ports)) {
-- 
2.51.0


