Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09501694D86
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 17:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494765.764931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRc7v-0000Be-HJ; Mon, 13 Feb 2023 16:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494765.764931; Mon, 13 Feb 2023 16:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRc7v-00008p-Dd; Mon, 13 Feb 2023 16:56:27 +0000
Received: by outflank-mailman (input) for mailman id 494765;
 Mon, 13 Feb 2023 16:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rhjs=6J=citrix.com=prvs=401394e30=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pRc7u-00008A-K3
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 16:56:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57ef0b10-abbf-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 17:56:24 +0100 (CET)
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
X-Inumbo-ID: 57ef0b10-abbf-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676307385;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cefmvFjE/gB5Sf8lLJBVMjAL+tUgN04ZmfQbRRZBImA=;
  b=IjZxKB4Szo2v3lIreDCjNSI37M8CmLyT8mFr8wJZckfjrZ8L7Onxj2Kf
   8NdYCfq9zSfIt7iUfOxBMLt7kyYyhHbeat238dGsSGt/kb/00x20CKNgm
   YrWn2a7EqNwBwPgMq5GesMVpkYMCQk75V2wBi4kJV2DwDI4n36QyWCr8G
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95691000
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:d+14/avRwO/DMT9SuSqvZjkvHOfnVGleMUV32f8akzHdYApBsoF/q
 tZmKTiObq7bNjOgfIsnbdnn9U5Vvp7Vz95hT1E9+3o0EHwQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWHzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJS02cDDevvuPz7udc8hHvNwcPeXSI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7Wydfs0nToaM47nLMxQh1+LPsLMDUapqBQsA9ckOw9
 z+Yrj2hWkly2Nq32H3e4iOrxfDzrybWW4cDT7iG9OxXnwjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5e/LWd14OvX2uqm
 nbT8XZ43u9I5SIW60ml1V3auCyM+6HQdwE8wDz2dVi90RJVXZHwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5TRe/0vp5pJBWZ2AcyRMd5q1xB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiONLKigbArLmdrGR2CgmbOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGs6hlUr4juDOPiL9pVI53LymNL1R0U95iF+Nr
 4Y32zWilX2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClMOJY3VMNeImelJU9U8z8xoehLgo
 inVtrlwlACu2hUq6GyiNhheVV8Ydcwu8yNqY3R8YwjANrpKSd/H0ZrzvqAfJdEPnNGPB9YvJ
 xXZU61s2shydwk=
IronPort-HdrOrdr: A9a23:own0Bq981zAuqfRirZluk+DeI+orL9Y04lQ7vn2ZLiYlFPBw9v
 re+8jzsCWetN9/Yh8dcLy7WZVoI0mslqKdkLNhWItKNTOO0AeVxa5ZgrcKqAeQeREWmNQ86U
 8pG5IVNDW7ZWIWsS5xijPId+od/A==
X-IronPort-AV: E=Sophos;i="5.97,294,1669093200"; 
   d="scan'208";a="95691000"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [PATCH v2] build: Make FILE symbol paths consistent
Date: Mon, 13 Feb 2023 16:55:39 +0000
Message-ID: <20230213165539.3257260-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The FILE symbols in out-of-tree builds may be either a relative path to
the object dir or an absolute path depending on how the build is
invoked. Fix the paths for C files so that they are consistent with
in-tree builds - the path is relative to the "xen" directory (e.g.
common/irq.c).

This fixes livepatch builds when the original Xen build was out-of-tree
since livepatch-build always does in-tree builds. Note that this doesn't
fix the behaviour for Clang < 6 which always embeds full paths.

Fixes: 7115fa562fe7 ("build: adding out-of-tree support to the xen build")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:
* Adjust commit description.
* Rename rel_path.

 xen/Rules.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 70b7489ea8..d6b7cec0a8 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -228,8 +228,9 @@ quiet_cmd_cc_o_c = CC      $@
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
     cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
     ifneq ($(CONFIG_CC_IS_CLANG)$(call clang-ifversion,-lt,600,y),yy)
+        rel-path = $(patsubst $(abs_srctree)/%,%,$(call realpath,$(1)))
         cmd_objcopy_fix_sym = \
-	    $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@ && rm -f $(dot-target).tmp
+           $(OBJCOPY) --redefine-sym $(<F)=$(call rel-path,$<) $(dot-target).tmp $@ && rm -f $(dot-target).tmp
     else
         cmd_objcopy_fix_sym = mv -f $(dot-target).tmp $@
     endif
-- 
2.31.1


