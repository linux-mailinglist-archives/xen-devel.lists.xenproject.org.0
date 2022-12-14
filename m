Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E664D31C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 00:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462716.720920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axn-0005W5-K9; Wed, 14 Dec 2022 23:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462716.720920; Wed, 14 Dec 2022 23:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5axn-0005Uf-EJ; Wed, 14 Dec 2022 23:14:59 +0000
Received: by outflank-mailman (input) for mailman id 462716;
 Wed, 14 Dec 2022 23:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IksU=4M=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5aw6-0000Gw-1y
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 23:13:14 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfec70eb-7c04-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 00:13:10 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 881ED3200927;
 Wed, 14 Dec 2022 18:13:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 14 Dec 2022 18:13:09 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:13:07 -0500 (EST)
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
X-Inumbo-ID: dfec70eb-7c04-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1671059588; x=1671145988; bh=uEembJaSpvhKFJgq6aTBN99RsIDXzs5dpLn
	+PB+Vf9A=; b=lBa6nLSu5F8owIZ+ll/DknqWNdHK9Qq5ZSHrmbtO3xRWH11IClI
	CK8PmjX/ZEKaSbm0PaBDcTJ2Ye/e4+H3Wrciud5T9MzXKpdtB8fOJ/Gu09BQhEl3
	M+lDxz0mItSSlOhwFVzjuVr/6TRwsuKZWXtoJ67rbctzp1Poy/243e1UWZPHlvrt
	Rj1u3GF0NvnrwrJ1/WOq9lQzQtQGHKeVbIvijSoPcQgiMTWovL5lwBhYKieCumuv
	w4Y2V3p9T8h94eC7TN3LQWQByzSV/uSXXY3w5WPLPIYJz4XT3OZkfwXLqmyqJ0AP
	Z0iiIfwDy9ykCdoh5isjM4fyfix26U5/4vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1671059588; x=1671145988; bh=uEembJaSpvhKF
	Jgq6aTBN99RsIDXzs5dpLn+PB+Vf9A=; b=pXpsQResMJjC/sny1185KVVJvyMcz
	Il6endTmLeYDNp8lc3753VtX+1SBSBfzXMJ4aKb8EQEOHpbggC/ZDIkhOf2+vmHp
	RBa3nnnOI5V3QpHzK+YhMp5QTv9CSe0d5SNt+TMS6SFZY/OFCgkPdQK4TvPxPkZG
	2HCFgXwLypgqmL8gXpcTIJZgmIyMuS+FRH2zzRYITkQyGbzR/3A9dZrukScq67n/
	lwD6L7br1gZlqT5ArALmTw7ut0CAYzsyHCn6p5vYSgfrtTy/NM1KkBiS90YPhwc7
	VISmymcmKmVnbDS9eFILg1vxgQ2zA2Cp/O7wVDWcvOW7KKhMN3nB6Y61g==
X-ME-Sender: <xms:g1iaY5bzpjgNa40LQLUaGdgfYoG6_2jEt_VulzFXfWvd95x2YcO6pQ>
    <xme:g1iaYwaXLAhTrDki04Sd1CHpMxJZHk5uSG5B11XzDa89_8NTKYJ6x0Rf7pK33obpD
    oxGbtxI5j-3Lg8>
X-ME-Received: <xmr:g1iaY78JlO9_fgYSZ83QlW1y2rlTvznZpqBUwVtVxeLOcvyDHW_gx5dpEQcDjJwyl1YvNnUG3P89>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:hFiaY3osweVMfbDfLVuUg3St2BTZTjh1oWctKvZbSkLHIyPiAGgFag>
    <xmx:hFiaY0pQ8WnIlJY336_Jw-DfHrMRciBAU3iC-lulVqJSyub8c6tvqA>
    <xmx:hFiaY9RHAJvQ8zBSLAv5bo4dO-iTW7DClIB-6GVIuUluRxE1q8nZzQ>
    <xmx:hFiaYwfg5D75izhedFeLUgqX9tTekkHywgYH8H4vfhIZhVkBJ6TxJg>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v3 11/12] x86/mm: Reject invalid cacheability in PV guests by default
Date: Wed, 14 Dec 2022 18:12:01 -0500
Message-Id: <bc146082e90b538be06eb89280617c7e9b966f0f.1671057808.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671057808.git.demi@invisiblethingslab.com>
References: <cover.1671057808.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting cacheability flags that are not ones specified by Xen is a bug
in the guest.  By default, inject #GP into any guest that does this.
allow_invalid_cacheability can be used on the Xen command line to
disable this check.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7fb1a0f91910952640378f316a68096a08895b37..a199bb05031e0fb1ea4c25ef1d641afe71690d74 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -145,6 +145,8 @@
 
 #ifdef CONFIG_PV
 #include "pv/mm.h"
+bool allow_invalid_cacheability;
+boolean_param("allow_invalid_cacheability", allow_invalid_cacheability);
 #endif
 
 /* Override macros from asm/page.h to make them work with mfn_t */
@@ -1346,7 +1348,28 @@ static int promote_l1_table(struct page_info *page)
         }
         else
         {
-            switch ( ret = get_page_from_l1e(pl1e[i], d, d) )
+            l1_pgentry_t l1e = pl1e[i];
+
+            BUILD_BUG_ON(PAGE_CACHE_ATTRS > 0xffff);
+            if ( !allow_invalid_cacheability )
+            {
+                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
+                {
+                case _PAGE_WB:
+                case _PAGE_UC:
+                case _PAGE_UCM:
+                case _PAGE_WC:
+                case _PAGE_WT:
+                case _PAGE_WP:
+                    break;
+                default:
+                    pv_inject_hw_exception(TRAP_gp_fault, 0);
+                    ret = -EINVAL;
+                    goto fail;
+                }
+            }
+
+            switch ( ret = get_page_from_l1e(l1e, d, d) )
             {
             default:
                 goto fail;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


