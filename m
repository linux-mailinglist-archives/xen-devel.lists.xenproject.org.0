Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE0D375845
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 18:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123645.233261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1legc3-0005Q8-Nb; Thu, 06 May 2021 16:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123645.233261; Thu, 06 May 2021 16:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1legc3-0005OH-Jh; Thu, 06 May 2021 16:12:31 +0000
Received: by outflank-mailman (input) for mailman id 123645;
 Thu, 06 May 2021 16:12:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1legc2-0005OB-0i
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 16:12:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1legc0-00047q-M1; Thu, 06 May 2021 16:12:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1legc0-0003uf-CI; Thu, 06 May 2021 16:12:28 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=taAzfylmniFMr/i/NXbHSTg9722Z1jzHz8t2M1whrOw=; b=oCuBi89tY6Ij+vI5tcKSZ8QzwJ
	1UnmlL6irFx2hokVbNHwE2Zk90srkcMDTeU+psg8ahVFfoPe9HhAAS8upaC7pycbdZy2SE+FFudPj
	vh1nvce0sNobV9xpb7SsTICO6UN0e2Yg+BFrTIygsZmQ8dB4mgNBGp4aaGHw28Jrj644=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstored: Prevent a buffer overflow in dump_state_node_perms()
Date: Thu,  6 May 2021 17:12:23 +0100
Message-Id: <20210506161223.15984-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

ASAN reported one issue when Live Updating Xenstored:

=================================================================
==873==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffc194f53e0 at pc 0x555c6b323292 bp 0x7ffc194f5340 sp 0x7ffc194f5338
WRITE of size 1 at 0x7ffc194f53e0 thread T0
    #0 0x555c6b323291 in dump_state_node_perms xen/tools/xenstore/xenstored_core.c:2468
    #1 0x555c6b32746e in dump_state_special_node xen/tools/xenstore/xenstored_domain.c:1257
    #2 0x555c6b32a702 in dump_state_special_nodes xen/tools/xenstore/xenstored_domain.c:1273
    #3 0x555c6b32ddb3 in lu_dump_state xen/tools/xenstore/xenstored_control.c:521
    #4 0x555c6b32e380 in do_lu_start xen/tools/xenstore/xenstored_control.c:660
    #5 0x555c6b31b461 in call_delayed xen/tools/xenstore/xenstored_core.c:278
    #6 0x555c6b32275e in main xen/tools/xenstore/xenstored_core.c:2357
    #7 0x7f95eecf3d09 in __libc_start_main ../csu/libc-start.c:308
    #8 0x555c6b3197e9 in _start (/usr/local/sbin/xenstored+0xc7e9)

Address 0x7ffc194f53e0 is located in stack of thread T0 at offset 80 in frame
    #0 0x555c6b32713e in dump_state_special_node xen/tools/xenstore/xenstored_domain.c:1232

  This frame has 2 object(s):
    [32, 40) 'head' (line 1233)
    [64, 80) 'sn' (line 1234) <== Memory access at offset 80 overflows this variable

This is happening because the callers are passing a pointer to a variable
allocated on the stack. However, the field perms is a dynamic array, so
Xenstored will end up to read outside of the variable.

Rework the code so the permissions are written one by one in the fd.

Fixes: ed6eebf17d2c ("tools/xenstore: dump the xenstore state for live update")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.c   | 26 ++++++++++++++------------
 tools/xenstore/xenstored_core.h   |  3 +--
 tools/xenstore/xenstored_domain.c |  2 +-
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index d54a6042a9f7..f68da12b5b23 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -2447,34 +2447,36 @@ const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
 	return NULL;
 }
 
-const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
-				  const struct xs_permissions *perms,
+const char *dump_state_node_perms(FILE *fp, const struct xs_permissions *perms,
 				  unsigned int n_perms)
 {
 	unsigned int p;
 
 	for (p = 0; p < n_perms; p++) {
+		struct xs_state_node_perm sp;
+
 		switch ((int)perms[p].perms & ~XS_PERM_IGNORE) {
 		case XS_PERM_READ:
-			sn->perms[p].access = XS_STATE_NODE_PERM_READ;
+			sp.access = XS_STATE_NODE_PERM_READ;
 			break;
 		case XS_PERM_WRITE:
-			sn->perms[p].access = XS_STATE_NODE_PERM_WRITE;
+			sp.access = XS_STATE_NODE_PERM_WRITE;
 			break;
 		case XS_PERM_READ | XS_PERM_WRITE:
-			sn->perms[p].access = XS_STATE_NODE_PERM_BOTH;
+			sp.access = XS_STATE_NODE_PERM_BOTH;
 			break;
 		default:
-			sn->perms[p].access = XS_STATE_NODE_PERM_NONE;
+			sp.access = XS_STATE_NODE_PERM_NONE;
 			break;
 		}
-		sn->perms[p].flags = (perms[p].perms & XS_PERM_IGNORE)
+		sp.flags = (perms[p].perms & XS_PERM_IGNORE)
 				     ? XS_STATE_NODE_PERM_IGNORE : 0;
-		sn->perms[p].domid = perms[p].id;
-	}
+		sp.domid = perms[p].id;
 
-	if (fwrite(sn->perms, sizeof(*sn->perms), n_perms, fp) != n_perms)
-		return "Dump node permissions error";
+		if (fwrite(&sp, sizeof(sp), 1, fp) != 1)
+			return "Dump node permission error";
+
+	}
 
 	return NULL;
 }
@@ -2519,7 +2521,7 @@ static const char *dump_state_node_tree(FILE *fp, char *path)
 	if (fwrite(&sn, sizeof(sn), 1, fp) != 1)
 		return "Dump node state error";
 
-	ret = dump_state_node_perms(fp, &sn, hdr->perms, hdr->num_perms);
+	ret = dump_state_node_perms(fp, hdr->perms, hdr->num_perms);
 	if (ret)
 		return ret;
 
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 1cdbc3dcb5f7..b50ea3f57d5a 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -271,8 +271,7 @@ const char *dump_state_buffered_data(FILE *fp, const struct connection *c,
 				     const struct connection *conn,
 				     struct xs_state_connection *sc);
 const char *dump_state_nodes(FILE *fp, const void *ctx);
-const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
-				  const struct xs_permissions *perms,
+const char *dump_state_node_perms(FILE *fp, const struct xs_permissions *perms,
 				  unsigned int n_perms);
 
 void read_state_global(const void *ctx, const void *state);
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index 3d4d0649a243..580ed454a3f5 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -1254,7 +1254,7 @@ static const char *dump_state_special_node(FILE *fp, const char *name,
 	if (fwrite(&sn, sizeof(sn), 1, fp) != 1)
 		return "Dump special node error";
 
-	ret = dump_state_node_perms(fp, &sn, perms->p, perms->num);
+	ret = dump_state_node_perms(fp, perms->p, perms->num);
 	if (ret)
 		return ret;
 
-- 
2.17.1


