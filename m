Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE740D2A8D5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 04:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206069.1519829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgaD4-00032o-58; Fri, 16 Jan 2026 03:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206069.1519829; Fri, 16 Jan 2026 03:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgaD4-00031O-0k; Fri, 16 Jan 2026 03:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1206069;
 Fri, 16 Jan 2026 03:09:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vgaD2-00031I-A8
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 03:09:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgaD0-006BCR-16;
 Fri, 16 Jan 2026 03:09:10 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vgaCz-005Mm8-2F;
 Fri, 16 Jan 2026 03:09:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=SbEWkPeAnSslQvi8YgwfbD8xqGWKRn1zKia3IHWmxB0=; b=WbvKjR
	Cl7ShQp+RVf+wi4jj0fQzYtTPRZMeMWLUwd1+xDrbaB9D0I7Ua6kjFqQpKTBEF1FPBSsCiKHBA5Cw
	D60HNcFVZfMympJqxg/XCoI+TYBjTB8PkpY2/ySGTQVferByqK1XZDl1uSeZitQPuaoHqpwphUCYF
	gjnzKf3TtnU=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v2] INSTALL: remove unsupported XEN_CONFIG_EXPERT from documentation
Date: Thu, 15 Jan 2026 19:08:43 -0800
Message-ID: <20260116030842.415583-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- rephrased a note about EXPERT features
- Link to v1: https://lore.kernel.org/xen-devel/20260108141641.506534-2-dmukhin@ford.com/
---
 INSTALL | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/INSTALL b/INSTALL
index c2e756bf4b2b..919e1c04891b 100644
--- a/INSTALL
+++ b/INSTALL
@@ -33,11 +33,11 @@ small subset of the options.  Attempts to change other options will be
 silently overridden.  The only way to find which configuration options
 are available is to run `make menuconfig' or the like.
 
-You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
-in your environment.  However, doing this is not supported and the
-resulting configurations do not receive security support.  If you set
-this variable there is nothing stopping you setting dangerously
-experimental combinations of features - not even any warnings.
+This behavior can be overridden by enabling "Configure EXPERT features"
+in Kconfig (CONFIG_EXPERT). However, resulting configurations do not
+receive security support. In addition, CONFIG_EXPERT permits the
+selection of experimental and potentially unsafe feature combinations
+without generating configuration warnings.
 
 Options recognized by configure
 ===============================
-- 
2.52.0


