Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B157894A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 20:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370001.601645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBI-000217-33; Mon, 18 Jul 2022 18:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370001.601645; Mon, 18 Jul 2022 18:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBI-0001yr-05; Mon, 18 Jul 2022 18:09:20 +0000
Received: by outflank-mailman (input) for mailman id 370001;
 Mon, 18 Jul 2022 18:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yO7Q=XX=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oDVBG-0001bm-E0
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 18:09:18 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bce05183-06c4-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 20:09:17 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DBD525C00BB;
 Mon, 18 Jul 2022 14:09:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 18 Jul 2022 14:09:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 14:09:16 -0400 (EDT)
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
X-Inumbo-ID: bce05183-06c4-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1658167756; x=1658254156; bh=Du7er5SQVhxuW3kUx1splIMx/vSJydk7q3s
	MOCxCorg=; b=4dJ5goc6lMYpkem4v7o0ERbl6Z6YhuumCMBlSRxOvFg0jvk7YwI
	sVMEMUjXtRtJAHJnnsgpocnodLF8ieMPtT/cpJQkpBs58UUG08qDLAU60JRP4aKm
	8+u7+j35linn7XIUsqxE9e8CiDJVoVfvnkU7MCZgAO1tbAw4bObe/NRCpKtrJT/y
	uceV39RxjJ7zowQecrHKgZHrhOKKv/lASOluv7HC30djWqpJEJ/cyg/yC7FHPZKC
	Nq+BpuJMjBVW0FD+5uyAXbh9cYEFaD+tlwIgXkp1Hty7a/CftjbkcltkXt0edJQU
	SsaRLtNaE3TZ6tLLGIKQRA2KQm39r/3QH2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658167756; x=1658254156; bh=Du7er5SQVhxuW
	3kUx1splIMx/vSJydk7q3sMOCxCorg=; b=XbBcUBFLu919Z6KwAfeQGFr4KczHL
	SwfOLg05B1OciMLBoBl2NHIEBcq0e609ejTlYa/gN2Ue5yUQLLTmk5rOqE7y2hO/
	eS9KMQBK9E39Y6ldIZFd1E6LJ0AfOZTjUlP4OWQYe3D9gbDWYHnBCspGIpsYk9+d
	cgmn76Zql7XYJwYJZk05ADfpWSVi78SVhIlCzdR32o2bb9nMlgz2G1kUVP97eMvw
	sHasNyN3Drr+MGZfmTtiZxKWq7tlij1e3fTSmwZlrqYr/oiamgZz/mhSjIKSlWNK
	H4RKC3PiwWfse/bi5YjgLa0da78A9D+6Ijci8Tw/koHccbrv9egEKlKjA==
X-ME-Sender: <xms:zKHVYqhLAs1vpS7xZlCHZB8jIxNmTCHRAJBx_OMmh5Fj-8WfmgFm4A>
    <xme:zKHVYrBCyRCK9nxFfrA2T32uhvEPf-1Eb66vsUF1791iCuBtZ0HMbfvkutBYrofD_
    R1_U3TnUKBJaZg>
X-ME-Received: <xmr:zKHVYiHdOwnxQg9_2uB5KIuz18vrb--_MqopiBaNT9gLzj67kuXVSXTs0ExST8faPfmrqjsz-9vJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:zKHVYjQ5eHTM9J0B2_sdBEkULiScYXy3YFWR9L5D-6Haf9SIEVpjlg>
    <xmx:zKHVYnzXyKqS5KmHtNIjw_ZUbpA8823OJdbaVRiidz69Q2d4mz5Q7g>
    <xmx:zKHVYh7EU9iEx87dzbbtFois8qbxbJI520NGQbRAqSfDWh3YJpFXaw>
    <xmx:zKHVYpuSWtfxhWv2PvI5HxpLPRusL5kgqB62GTjZwKuHkFYsv-NYaQ>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH 2/5] Ignore failure to unmap -1
Date: Mon, 18 Jul 2022 14:08:19 -0400
Message-Id: <20220718180820.2555-3-demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220718180820.2555-1-demi@invisiblethingslab.com>
References: <20220718180820.2555-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit 166d3863231667c4f64dee72b77d1102cdfad11f ]

The error paths of gntdev_mmap() can call unmap_grant_pages() even
though not all of the pages have been successfully mapped.  This will
trigger the WARN_ON()s in __unmap_grant_pages_done().  The number of
warnings can be very large; I have observed thousands of lines of
warnings in the systemd journal.

Avoid this problem by only warning on unmapping failure if the handle
being unmapped is not -1.  The handle field of any page that was not
successfully mapped will be -1, so this catches all cases where
unmapping can legitimately fail.

Suggested-by: Juergen Gross <jgross@suse.com>
Cc: stable@vger.kernel.org
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Fixes: 2fe26a9a7048 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 2827015604fbaa45f0ca60c342bbf71ce4132dec..799173755b785e2f3e2483855f75af1eba8e9373 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -393,7 +393,8 @@ static void __unmap_grant_pages_done(int result,
 	unsigned int offset = data->unmap_ops - map->unmap_ops;
 
 	for (i = 0; i < data->count; i++) {
-		WARN_ON(map->unmap_ops[offset+i].status);
+		WARN_ON(map->unmap_ops[offset+i].status &&
+			map->unmap_ops[offset+i].handle != -1);
 		pr_debug("unmap handle=%d st=%d\n",
 			map->unmap_ops[offset+i].handle,
 			map->unmap_ops[offset+i].status);
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

