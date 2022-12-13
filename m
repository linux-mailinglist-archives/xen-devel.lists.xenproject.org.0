Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40964BF6D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461335.719481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Drd-00039u-Bx; Tue, 13 Dec 2022 22:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461335.719481; Tue, 13 Dec 2022 22:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Drd-00037L-7k; Tue, 13 Dec 2022 22:35:05 +0000
Received: by outflank-mailman (input) for mailman id 461335;
 Tue, 13 Dec 2022 22:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5DlS-0006J3-Iw
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:42 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ea652c5-7b35-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 23:28:41 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7799932004ED;
 Tue, 13 Dec 2022 17:28:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 13 Dec 2022 17:28:40 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:38 -0500 (EST)
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
X-Inumbo-ID: 7ea652c5-7b35-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970519; x=1671056919; bh=uEembJaSpvhKFJgq6aTBN99RsIDXzs5dpLn
	+PB+Vf9A=; b=T0yB9rdh+oj38XfHbSshYV0Xuk4qpUte4IeZnTlZ44CXPt5WYIJ
	wnyPIklPvN0/fpm+GSlLKT6xIcZIU3aTDAUzmK4onNRoQ6F1rjf808EfT4wZOMNV
	9RdY+/8xz3FHwTg+qLJGhVYVpFX7NcYlbFV9DooQKlL+aJhOvickAadkC2Jvfexr
	HqRoEWxO579efanUj2cEG5VEmQyxiSJi8/qgQqlwfSNxdIlab+ArZSB+vEW8YsqH
	jccH2obpY8A92awuF8njhH3DgKvTVsgX/iYbhAFFR+h3qn6k8dRskT6+M6qFGKmb
	87/WLyB3yfiKdxy/BsWaCdLfP5AYwzl+g/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970519; x=1671056919; bh=uEembJaSpvhKF
	Jgq6aTBN99RsIDXzs5dpLn+PB+Vf9A=; b=ctbCsqrBVPwIO6qNOVXZD+3goF47S
	YFngIgpWexAn8fTaX1C04gC2b3sOjyZGdMIm9/F5B5mWB5ftkJ3fwd5GRyDYPf2F
	hLbwRZBOjjv5bELZe2AQ5XB6PO3m92TaFaoheNjzudM78hCTclsv3TXb7NF+lWNJ
	IF/jlPDPCvE3r99ZfPF5Q/R7tdR08poMGqy+kT3tmiktz++dzK3IjI4Uw6N0zIKh
	otqKpKWuDpWHr586bIgJtdIggpUaGn2ytYTAwhZDJGJ+ISa+JM557BybqGorXoYe
	qwhZ5sTo2Gawgmrtz4zaPbJY4PSvFAS0TUicJQ8oQcxJNcA8IVbQEJPwQ==
X-ME-Sender: <xms:lvyYY2sw08RdaOpn2qPbxOcQuR9_ARziaf36VsAOKxnwJyd_7H4mPg>
    <xme:lvyYY7fbBUC48QqmtxVUQNtJUYEd4DAPJYUo37emqQQU_so9TbPFGxwWI_WggdA3n
    hFF-ehjTzD1jB8>
X-ME-Received: <xmr:lvyYYxxP-btMTqOziIXDQyQM1vH9NgH36Na-uNHsLjE4AC_AOZvtGUQlwvuoymceikajA3-x3KsJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:lvyYYxND7YAHEt58FcybTb2Ai5OZz5xBpiQlIZRryueUMtnz43twzg>
    <xmx:lvyYY29lEJu1vVqUWw61GbJRZRPffx4MG6tc1if9VVIcmKBBBooKTg>
    <xmx:lvyYY5WGVwZWUlRhuRDoApQYgA7xrFHO3nzTfnwz42DWQ-tDt-t3eg>
    <xmx:l_yYY6Q2Sj1OByAMMl_tXXuVYmxH2HRoBv9RwRCoOnI4zT_F4FJ50g>
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
Subject: [PATCH v2 13/14] x86/mm: Reject invalid cacheability in PV guests by default
Date: Tue, 13 Dec 2022 17:26:54 -0500
Message-Id: <c4e78a3f07b20c0c0a1c1c2ef222448a5f938fa5.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
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

