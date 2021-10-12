Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0642A7AA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207329.363118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJ8w-0006oW-NN; Tue, 12 Oct 2021 14:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207329.363118; Tue, 12 Oct 2021 14:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJ8w-0006mZ-KS; Tue, 12 Oct 2021 14:52:38 +0000
Received: by outflank-mailman (input) for mailman id 207329;
 Tue, 12 Oct 2021 14:52:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1maJ8u-0006mT-RH
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:52:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1maJ8u-0003A3-Mz
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:52:36 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1maJ8u-0001Ed-Kr
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:52:36 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1maJ8s-0004av-01; Tue, 12 Oct 2021 15:52:34 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=tsz77/5xeZhmnHGluoTZbMqWy0a4RfWmz+SZOgkwhG4=; b=zYYU+D0FUUhZmnVepmpzbKoQfg
	ewMm48HKPGHWBAL/GUpeJgJ1e/bsO1qVJjBa5C1Ts+OzIwYvwX2IXayKm5obnMV5o8xCeZ4ASNR+t
	cNhk6tUN+3yxBJrQK25xzaWBWcPCGnrPKIUUCSbEGoZxr4FzY/Y7azl5cLiBixoTcsyc=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: CODING_STYLE: Explicitly deprecate #ifdef
Date: Tue, 12 Oct 2021 15:52:26 +0100
Message-Id: <20211012145226.6065-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't use ifdefs in the main code.  Actually document this.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/CODING_STYLE | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/libs/light/CODING_STYLE b/tools/libs/light/CODING_STYLE
index 3d572f6925..c2342c9d3b 100644
--- a/tools/libs/light/CODING_STYLE
+++ b/tools/libs/light/CODING_STYLE
@@ -121,6 +121,16 @@ permitted exceptions to the usual libxl code formatting rules.
 
 
 
+ARCHITECTURE-SPECIFIC CODE, CONDITIONAL COMPILATION
+---------------------------------------------------
+
+Architecture-specific code should be isolated in libxl_<arch>.c,
+with a function call interface, whereever possible.
+
+#ifdefs should be avoided, and in any case not interspersed through
+the primary functional code.
+
+
 IDEMPOTENT DATA STRUCTURE CONSTRUCTION/DESTRUCTION
 --------------------------------------------------
 
-- 
2.20.1


