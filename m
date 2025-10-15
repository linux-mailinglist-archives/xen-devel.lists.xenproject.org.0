Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBEBE1012
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 01:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143969.1477566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9AgX-0007PY-AC; Wed, 15 Oct 2025 23:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143969.1477566; Wed, 15 Oct 2025 23:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9AgX-0007N2-7E; Wed, 15 Oct 2025 23:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1143969;
 Wed, 15 Oct 2025 19:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X1QL=4Y=invisiblethingslab.com=val@srs-se1.protection.inumbo.net>)
 id 1v97ct-0000KO-DO
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 19:57:35 +0000
Received: from fhigh-b2-smtp.messagingengine.com
 (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fa207a7-aa01-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 21:57:33 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 42F8B7A0165;
 Wed, 15 Oct 2025 15:57:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 15:57:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Oct 2025 15:57:28 -0400 (EDT)
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
X-Inumbo-ID: 2fa207a7-aa01-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm2; t=
	1760558251; x=1760644651; bh=hai+s8KEB1nxGZr2wQLvsaSxQBC7QUNm2B7
	G6anXMaQ=; b=tAGM6dwmauRnHvQ6OHLVT7Vc6d2ayLZLLBTzF3lCgP4FKKuiIIY
	dPhTi8C+BYfWWUQUwEOsdPRbcGteHDErbJNKq8rE2G5dO1db8wRyoez6ecRONesX
	UCWaK4/axM5QT12tnwFA4I42tAajUAOLp5bPV9dMl35HqVKoxXywSzKWkL0ITe52
	ruvd73o24c4Kl6dKnl2UwMDz8Y+G12mtU8MrmceZcSn4h0e/B745+MmeGWOwkTaZ
	1wZlFljZj5HsI5AeXlLGHXkmLro+8M6lhHwP2mEUcAp+h0Ec8F0yVO/+Z7Eil40r
	CWQqIWWYdAPkB6+8Q9jYf77atyKpBAKqu6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760558251; x=1760644651; bh=hai+s8KEB1nxGZr2wQLvsaSxQBC7QUNm2B7
	G6anXMaQ=; b=cpohXbMM5DOBS8fEPI7e++tOAQwD2o02M0D99VbRKAeuHCxw45N
	1vJOUjTIavZtWqQ5/r4EoOA/L70oiFpe/Tg4cq1OUbrsro2d7RPzg6+CxURs5Ur7
	EKA4UxeVYi0nZqq+YerTch/D+P1VI2ISIOcFO7CpculXLHXuTj/6B8I4ABDT6D+O
	oFbJJeCttb1byYooHpsAuvCqjuHwLOX0zxYRm9mDlukMQdv0/a7FCML2/2ccCPE+
	t6wttAxsp7rF2DgyyP0yyW85weZSIg7l71mc+Qt9fqGkuk3Q1lytEpmGu4MHeDKw
	+8C+lMySKu3bwb6Ogf3tlwIgSfqrKoEVTFA==
X-ME-Sender: <xms:qvzvaMkv8gP61Jh9Xtavx7kE36SgGA_IYmE0dbYVl82FHkwAlVS-mw>
    <xme:qvzvaFJeRoSBgKh5zo8NFFkW2y5w6gsHXD7Ku4RVKC611-gpY1Et5vJgsuKtxXcEJ
    K60vMVIOk8nWHlh3WBd4YDH-D1882EhbI0ILYjUoCybgld1aok>
X-ME-Received: <xmr:qvzvaB6kwQAaJLYW59si6tij-dWK4ihyfH--80Id6oRurChKyJy0f3BoNTBLtJCexX0o3ID5f7ip2-4JVta-wvaRoM8KYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdegfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepgggrlhcurfgrtghk
    vghtthcuoehvrghlsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfeigfeihfevhefggeeuvefftdelveeufeejkeeltdehveelveeh
    tdejheetuedunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehvrghlsehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopehs
    shhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrg
    hnughrpghthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtohepvhgrlhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qvzvaJ3zvSrAUHTIZOcMe669P-CUiuXF3H0NNQCanfrYh-8qVLvP5g>
    <xmx:qvzvaHc-hKQgKbFGi8ezCXE2T9DqEC6R1d_ri3hlVjWzcZdglEaoCQ>
    <xmx:qvzvaPeG76LH_ewfN1rFGagWAPLkIDhIgG5At-1JYgtrSJaVp0ICDg>
    <xmx:qvzvaCw9NhweJANBxV9eXHEazSAbveEYc1Qayr6EiYmpSL6bq1RHqw>
    <xmx:q_zvaBJsejqp6C9NROTgWvbOEeYxneVcQ7EntZDOJizlm4H2y5zKAVQL>
Feedback-ID: i001e48d0:Fastmail
From: Val Packett <val@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Val Packett <val@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] xen: privcmd: fix ioeventfd/ioreq crashing PV domain
Date: Wed, 15 Oct 2025 16:57:03 -0300
Message-ID: <20251015195713.6500-1-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting a virtio backend in a PV domain would panic the kernel in
alloc_ioreq, trying to dereference vma->vm_private_data as a pages
pointer when in reality it stayed as PRIV_VMA_LOCKED.

Fix by allocating a pages array in mmap_resource in the PV case,
filling it with page info converted from the pfn array. This allows
ioreq to function successfully with a backend provided by a PV dom0.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
I've been porting the xen-vhost-frontend[1] to Qubes, which runs on amd64
and we (still) use PV for dom0. The x86 part didn't give me much trouble,
but the first thing I found was this crash due to using a PV domain to host
the backend. alloc_ioreq was dereferencing the '1' constant and panicking
the dom0 kernel.

I figured out that I can make a pages array in the expected format from the
pfn array where the actual memory mapping happens for the PV case, and with
the fix, the ioreq part works: the vhost frontend replies to the probing
sequence and the guest recognizes which virtio device is being provided.

I still have another thing to debug: the MMIO accesses from the inner driver
(e.g. virtio_rng) don't get through to the vhost provider (ioeventfd does
not get notified), and manually kicking the eventfd from the frontend
seems to crash... Xen itself?? (no Linux panic on console, just a freeze and
quick reboot - will try to set up a serial console now)

But I figured I'd post this as an RFC already, since the other bug may be
unrelated and the ioreq area itself does work now. I'd like to hear some
feedback on this from people who actually know Xen :)

[1]: https://github.com/vireshk/xen-vhost-frontend

Thanks,
~val
---
 drivers/xen/privcmd.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index f52a457b302d..c9b4dae7e520 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -834,8 +834,23 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 				if (rc < 0)
 					break;
 			}
-		} else
+		} else {
+			unsigned int i;
+			unsigned int numpgs = kdata.num / XEN_PFN_PER_PAGE;
+			struct page **pages;
 			rc = 0;
+
+			pages = kvcalloc(numpgs, sizeof(pages[0]), GFP_KERNEL);
+			if (pages == NULL) {
+				rc = -ENOMEM;
+				goto out;
+			}
+
+			for (i = 0; i < numpgs; i++) {
+				pages[i] = xen_pfn_to_page(pfns[i * XEN_PFN_PER_PAGE]);
+			}
+			vma->vm_private_data = pages;
+		}
 	}
 
 out:
@@ -1589,15 +1604,18 @@ static void privcmd_close(struct vm_area_struct *vma)
 	int numgfns = (vma->vm_end - vma->vm_start) >> XEN_PAGE_SHIFT;
 	int rc;
 
-	if (xen_pv_domain() || !numpgs || !pages)
+	if (!numpgs || !pages)
 		return;
 
-	rc = xen_unmap_domain_gfn_range(vma, numgfns, pages);
-	if (rc == 0)
-		xen_free_unpopulated_pages(numpgs, pages);
-	else
-		pr_crit("unable to unmap MFN range: leaking %d pages. rc=%d\n",
-			numpgs, rc);
+	if (!xen_pv_domain()) {
+		rc = xen_unmap_domain_gfn_range(vma, numgfns, pages);
+		if (rc == 0)
+			xen_free_unpopulated_pages(numpgs, pages);
+		else
+			pr_crit("unable to unmap MFN range: leaking %d pages. rc=%d\n",
+				numpgs, rc);
+	}
+
 	kvfree(pages);
 }
 
-- 
2.51.0


