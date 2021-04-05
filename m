Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C13544FE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 18:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105452.201859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsA-0005VS-LL; Mon, 05 Apr 2021 16:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105452.201859; Mon, 05 Apr 2021 16:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsA-0005Uu-DM; Mon, 05 Apr 2021 16:14:42 +0000
Received: by outflank-mailman (input) for mailman id 105452;
 Mon, 05 Apr 2021 16:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRs7-0005U6-PK
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 16:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRs6-0003eu-H5; Mon, 05 Apr 2021 16:14:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbW-00053b-W8; Mon, 05 Apr 2021 15:57:31 +0000
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
	 bh=fOozlpcQqX3U35FdV5utWkSVhrMD0HRaxwSjYqjDLQU=; b=s3UuLNW5J0CRb7QQWuy3WCObx
	9Gdg6FRWFWbkIYxzFKoZOv2val092fE4cOQzcRm4YVQZ31kwcWJ3NT60CRP2B9jujZTo3yvvEONJz
	7FInxspUOxEYrqmX/FCyAO/5RTJMMjSXJx9QixNpURGdf4BHNYESij6Ke2nVKGjrv2FC4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 11/14] tools/misc: Use const whenever we point to literal strings
Date: Mon,  5 Apr 2021 16:57:10 +0100
Message-Id: <20210405155713.29754-12-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

literal strings are not meant to be modified. So we should use const
char * rather than char * when we we to store a pointer to them.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/misc/xen-detect.c | 2 +-
 tools/misc/xenhypfs.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xen-detect.c b/tools/misc/xen-detect.c
index eac9e46a35bb..18b28dabf311 100644
--- a/tools/misc/xen-detect.c
+++ b/tools/misc/xen-detect.c
@@ -44,7 +44,7 @@ enum guest_type {
     XEN_NONE = 3
 };
 
-static char *type;
+static const char *type;
 static char *ver;
 
 static void cpuid(uint32_t idx, uint32_t *regs, int pv_context)
diff --git a/tools/misc/xenhypfs.c b/tools/misc/xenhypfs.c
index 5da24aed905c..df398b07bdc0 100644
--- a/tools/misc/xenhypfs.c
+++ b/tools/misc/xenhypfs.c
@@ -81,9 +81,9 @@ static int xenhypfs_wr(char *path, char *val)
     return ret;
 }
 
-static char *xenhypfs_type(struct xenhypfs_dirent *ent)
+static const char *xenhypfs_type(struct xenhypfs_dirent *ent)
 {
-    char *res;
+    const char *res;
 
     switch (ent->type) {
     case xenhypfs_type_dir:
@@ -134,7 +134,7 @@ static int xenhypfs_ls(char *path)
     return ret;
 }
 
-static int xenhypfs_tree_sub(char *path, unsigned int depth)
+static int xenhypfs_tree_sub(const char *path, unsigned int depth)
 {
     struct xenhypfs_dirent *ent;
     unsigned int n, i;
-- 
2.17.1


