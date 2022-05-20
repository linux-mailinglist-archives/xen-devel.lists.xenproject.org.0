Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B752EBBC
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333993.558012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wu-0005Uk-Ra; Fri, 20 May 2022 12:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333993.558012; Fri, 20 May 2022 12:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Wu-0005R5-N5; Fri, 20 May 2022 12:14:52 +0000
Received: by outflank-mailman (input) for mailman id 333993;
 Fri, 20 May 2022 12:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dhdo=V4=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1ns1Ws-0005Cp-Lk
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:14:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 71b37d81-d836-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 14:14:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB8551477;
 Fri, 20 May 2022 05:14:48 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABFDC3F718;
 Fri, 20 May 2022 05:14:47 -0700 (PDT)
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
X-Inumbo-ID: 71b37d81-d836-11ec-bd2c-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] build: Fix make warning if there is no cppcheck
Date: Fri, 20 May 2022 13:14:38 +0100
Message-Id: <20277da971c1050d0464410e24ecff9d5d659990.1653048581.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If cppcheck is not present, the following warning appears during build:
which: no cppcheck in ([...])
/bin/sh: cppcheck: command not found

Fix the problem by using shell code inside the cppcheck-version rule to
also prevent unneeded call of which when something else than cppcheck is
built.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/Makefile | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 15388703bc..e8d8ed71bc 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -694,12 +694,14 @@ $(objtree)/%.c.cppcheck: $(srctree)/%.c $(objtree)/include/generated/autoconf.h
 	$(call if_changed,cppcheck_xml)
 
 cppcheck-version:
-ifeq ($(shell which $(CPPCHECK)),)
-	$(error Cannot find cppcheck executable: $(CPPCHECK))
-endif
-ifeq ($(shell $(CPPCHECK) --version | awk '{print ($$2 < 2.7)}'),1)
-	$(error Please upgrade your cppcheck to version 2.7 or greater)
-endif
+	@if ! which $(CPPCHECK) > /dev/null 2>&1; then \
+		echo "Cannot find cppcheck executable: $(CPPCHECK)"; \
+		exit 1; \
+	fi
+	@if [ "$$($(CPPCHECK) --version | awk '{print ($$2 < 2.7)}')" -eq 1 ]; then \
+		echo "Please upgrade your cppcheck to version 2.7 or greater"; \
+		exit 1; \
+	fi
 
 # Put this in generated headers this way it is cleaned by include/Makefile
 $(objtree)/include/generated/compiler-def.h:
-- 
2.25.1


