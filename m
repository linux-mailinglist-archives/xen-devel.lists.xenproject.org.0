Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C9CA3A03
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 13:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177628.1501865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR8aK-0007Dc-MC; Thu, 04 Dec 2025 12:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177628.1501865; Thu, 04 Dec 2025 12:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR8aK-000796-HS; Thu, 04 Dec 2025 12:37:24 +0000
Received: by outflank-mailman (input) for mailman id 1177628;
 Thu, 04 Dec 2025 12:37:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vR8aJ-00077w-3X
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 12:37:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vR8aI-006XHh-1b;
 Thu, 04 Dec 2025 12:37:22 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vR8aH-003f3a-2M;
 Thu, 04 Dec 2025 12:37:22 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=ylriBSJTPr4LVY5YvsyHXSHnemIkW1zWJXnMiOjYfUQ=; b=U/+nOv9PsNsfnOwVXKTSHmWMNG
	sz90gpT14WBrobV+UoXbyPj/FavxqfkOdVr8n/peFmmrY1HvldA2614+hD3JIWqY28PM9ba6bETYm
	h9sdOhvEWJqmieKyqljQ2zxOJR9hMwU6wYi/55Iy99KfPncX352+wh08MQdHufFL2cbg=;
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
Subject: [PATCH v1 1/2] tests: fixup domid test harness dependencies
Date: Thu,  4 Dec 2025 04:37:11 -0800
Message-ID: <20251204123712.721443-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204123712.721443-1-dmukhin@ford.com>
References: <20251204123712.721443-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

There can be multiple test harnesses per one test target. Fix that by
iterating over all prerequisites in emit-harness-nested-rule().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tools/tests/domid/Makefile | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 753129029ed9..1a2129d20655 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -14,16 +14,18 @@ $(shell sed -n \
     's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
 endef
 
-# NB: $1 cannot be a list
+# $1 target
+# $2 list of test harnesses
 define emit-harness-nested-rule
-$(1): $(CURDIR)/harness.h
-	mkdir -p $$(@D);
-	ln -sf $$< $$@;
+$(1): $(2)
+	mkdir -p $$(@D); \
+	for i in $$<; do ln -sf $$$$i $$@; done
 
 endef
 
 define emit-harness-rules
-$(foreach x,$(2),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(x)))
+$(foreach x,$(2),$(call \
+    emit-harness-nested-rule,$(CURDIR)/generated/$(x),$(CURDIR)/harness.h))
 $(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(2))
 endef
 
-- 
2.52.0


