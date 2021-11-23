Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9C845A943
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229786.397315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0U-0004ib-Nn; Tue, 23 Nov 2021 16:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229786.397315; Tue, 23 Nov 2021 16:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZ0U-0004bU-CV; Tue, 23 Nov 2021 16:50:58 +0000
Received: by outflank-mailman (input) for mailman id 229786;
 Tue, 23 Nov 2021 16:50:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0004O8-Od
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0007z3-Ns
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mpZ0S-0000Sq-N1
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:50:56 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mpZ0Q-00073B-Gv; Tue, 23 Nov 2021 16:50:54 +0000
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=rlvLukjkFVL40SLFbuzBKIkeb1Z7lDPlWJjNT4Csb3o=; b=QWkTYdTxniXidq+KBb1ut2MXiv
	edbNL6gXgQWwxBxZd+qc2LQZPL7O4mJUN5V/eaf29HvzM6DJxm2tYizBJzt6YsyiOED1SzE7yrBJh
	p/bimNG4YKs2KS5tNU9XCm6RNl+wIKPAcHEulxQmGoPmN6mbw4UMWlX4sDwlObB8w5Kw=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.16 3/3] Turn off debug by default
Date: Tue, 23 Nov 2021 16:50:44 +0000
Message-Id: <20211123165044.29546-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211123165044.29546-1-iwj@xenproject.org>
References: <20211123165044.29546-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 tools/Rules.mk    | 2 +-
 xen/Kconfig.debug | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index b022da3336..051a5d3555 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -25,7 +25,7 @@ CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 XENSTORE_XENSTORED ?= y
 
 # A debug build of tools?
-debug ?= y
+debug ?= n
 debug_symbols ?= $(debug)
 
 XEN_GOCODE_URL    = golang.xenproject.org
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index fad3050d4f..4419030235 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -3,7 +3,7 @@ menu "Debugging Options"
 
 config DEBUG
 	bool "Developer Checks"
-	default y
+	default n
 	---help---
 	  If you say Y here this will enable developer checks such as asserts
 	  and extra printks. This option is intended for development purposes
-- 
2.20.1


