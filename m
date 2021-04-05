Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C15A3543E0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105394.201737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbO-00028g-KV; Mon, 05 Apr 2021 15:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105394.201737; Mon, 05 Apr 2021 15:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbO-00028B-FK; Mon, 05 Apr 2021 15:57:22 +0000
Received: by outflank-mailman (input) for mailman id 105394;
 Mon, 05 Apr 2021 15:57:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbM-00027a-OL
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbL-0002nA-Ls; Mon, 05 Apr 2021 15:57:19 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbL-00053b-CT; Mon, 05 Apr 2021 15:57:19 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=wM0arhOfbdXKBnD+kuNFkMVWLt0+0LE5S6yLwtX1v4g=; b=yK+fPDTfexuES8exRK8gSibPD
	5zO9GPsi3gdF5Mf4ClqCwHiYojBQ0lPqt3biOe2NYHQS8U7TkQpf07ciBZ/Uupf5iWlihZ4qUJVet
	fFfEDFAbtETs+5V43M++oc3DKQHkyR0VSuHoR/nXgt89UcadmAND2MN1cuB/X065weMpE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 01/14] xen: Constify the second parameter of rangeset_new()
Date: Mon,  5 Apr 2021 16:57:00 +0100
Message-Id: <20210405155713.29754-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The string 'name' will never get modified by the function, so mark it
as const.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/rangeset.c      | 2 +-
 xen/include/xen/rangeset.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 4ebba30ba303..d997d7bce9e2 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -421,7 +421,7 @@ bool_t rangeset_is_empty(
 }
 
 struct rangeset *rangeset_new(
-    struct domain *d, char *name, unsigned int flags)
+    struct domain *d, const char *name, unsigned int flags)
 {
     struct rangeset *r;
 
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 5f62a9797170..135f33f6066f 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -36,7 +36,7 @@ void rangeset_domain_destroy(
  * rangeset_destroy(r).
  */
 struct rangeset *rangeset_new(
-    struct domain *d, char *name, unsigned int flags);
+    struct domain *d, const char *name, unsigned int flags);
 void rangeset_destroy(
     struct rangeset *r);
 
-- 
2.17.1


