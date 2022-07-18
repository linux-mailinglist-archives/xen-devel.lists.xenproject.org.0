Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FD57894F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 20:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370009.601679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBO-0002yU-25; Mon, 18 Jul 2022 18:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370009.601679; Mon, 18 Jul 2022 18:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDVBN-0002tM-U3; Mon, 18 Jul 2022 18:09:25 +0000
Received: by outflank-mailman (input) for mailman id 370009;
 Mon, 18 Jul 2022 18:09:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yO7Q=XX=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oDVBM-0001J5-Ai
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 18:09:24 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfbee6e1-06c4-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 20:09:22 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AF2185C00C5;
 Mon, 18 Jul 2022 14:09:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jul 2022 14:09:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 14:09:21 -0400 (EDT)
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
X-Inumbo-ID: bfbee6e1-06c4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1658167761; x=1658254161; bh=flbY27l8SG12tvSsNQqmUwpFJSmusaEnV0T
	4ZJqcCMU=; b=71MPLL0NWx9kTocP1rKjbOI78zXLHdgL3p6pHwlND3ZNdqwrV95
	95VlL1cRX9c+y4rO2EefucIHkGNdJEwzGdKW4wOACzAsHTH8BYQGhXi99BJInVJp
	ZZBqXo4JJZDnkqPDA0dumkKWUi3chW6cL37v3wJgjsZpa2ASIUM4XcJqPLWsxotD
	VYb4liCDOqpLPisWVO/7buk5oZfWO390LIVdAJNVtsZvVkL711oKBjH6Art06DXx
	9vvTQEBVfCuxfgfDxQlthGRogmgEqlJ+iYoUaVTNAY8BB/1Tt8bg82O+lrIGj+r8
	1pVfu09UxNT5qs9/GaD08V4T/twa8rWXe1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1658167761; x=1658254161; bh=flbY27l8SG12t
	vSsNQqmUwpFJSmusaEnV0T4ZJqcCMU=; b=SLmdhozsqJqHWicLofNrlPBBwk1gl
	d5lDJvHq/db4rjY4QQoQMvS7x2WQOVmPvPWy7cPeqd/JBH/r5NWKqjqHeoPjoTSu
	OApdh20yhL6RmK+qGR1fdLy9kWCWOqeGawqqNQnSNuiZ9sdLFSHow5A0P4d6bZj6
	Jso/wGqNEYC6ZpTHGHir3YVLpBNIdsOX5Rtl+0wn88IVSuk8porrxs7LsJBkKpE3
	MGrO+42kx3kcnNtXuzbhoiG3M9TH5/tFq84xaDDjoPFee4MxgThZfXnheXBEgr8r
	xzsMuho9Ebb4UBMbosjw2BCW/dKxNxBv9m1jUads4vxcRjm4S+Htph4lw==
X-ME-Sender: <xms:0aHVYte65YJiN302VJuqI2V5z5-sJHdIovKUkXRh1lrrsOBfff2C5g>
    <xme:0aHVYrPT1xnLyI9ekQOQLfhEyATgSLAm3Gslq2Yu3IsKjZycSz2CanUtTrRN3FlZl
    gSLAY9gYndFIqo>
X-ME-Received: <xmr:0aHVYmhNfEOYKYzwAYoveQDrEDw42UB3y5S4cqlU2ky4c0boluEqdKPU938iQapoQfg3UtFryLww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
    hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:0aHVYm_ROzpeqSqol2etNhCONYRZn86wWOKwk1RzR9kdc_NFmluvKw>
    <xmx:0aHVYpuqORoW_UnXL-JmD-CJL0MnGAcYR_CePvA2bmql6YLhtJ45Xg>
    <xmx:0aHVYlGCnyt-uTh-flT_H0SlGWw7edig-7FFPISdtShwzwtJsyUCpg>
    <xmx:0aHVYjLAcXCjf9cajKFqAtcNUz56ai5eFpoz1ZYPr9c9Vg3koKce3A>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH 5/5] Ignore failure to unmap -1
Date: Mon, 18 Jul 2022 14:08:22 -0400
Message-Id: <20220718180820.2555-6-demi@invisiblethingslab.com>
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
Fixes: 79963021fd71 ("xen/gntdev: Avoid blocking in unmap_grant_pages()")
---
 drivers/xen/gntdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index f415c056ff8ab8d808ee2bacfaa3cad57af28204..54fee4087bf1078803c230ad2081aafa8415cf53 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -401,7 +401,8 @@ static void __unmap_grant_pages_done(int result,
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

