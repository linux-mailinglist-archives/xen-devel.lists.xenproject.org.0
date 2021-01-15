Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DFA2F747D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67831.121296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KfD-0003ob-Vl; Fri, 15 Jan 2021 08:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67831.121296; Fri, 15 Jan 2021 08:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KfD-0003nx-Qz; Fri, 15 Jan 2021 08:40:59 +0000
Received: by outflank-mailman (input) for mailman id 67831;
 Fri, 15 Jan 2021 08:40:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KVj-0008HA-Ob
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:31:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67322286-f7e5-43a5-8db9-52a62fac55a6;
 Fri, 15 Jan 2021 08:30:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 426B2B96E;
 Fri, 15 Jan 2021 08:30:07 +0000 (UTC)
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
X-Inumbo-ID: 67322286-f7e5-43a5-8db9-52a62fac55a6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIt6mjfz4m4Lbw7qhygGZfW7PH1zNiUMYf4J84ykaIY=;
	b=B4qGmTquoINN3Rs5r+vl1B1aWKiK3RRbHp7UXwFXIpDBFkB4Y4B3qTCKY+TMzWyhulflKC
	nsOG4ujBSZql9pkySKjR4drSJpy4Xk9TsUSoi+DOK+hRzMl9aGff7c59NJwg2134+bwYrd
	N5CvgcyopksMIj8p4b0bCphlRNocWqg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 16/27] tools/xenstore: add include file for state structure definitions
Date: Fri, 15 Jan 2021 09:29:49 +0100
Message-Id: <20210115083000.14186-17-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an include file containing all structures and defines needed for
dumping and restoring the internal Xenstore state.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V4:
- drop mfn from connection record (rebase to V5 of state doc patch)
- add #ifdef __MINIOS__ (Julien Grall)
- correct comments (Julien Grall)
- add data_in_len

V5:
- add data_resp_len

V6:
- add flag byte to node permissions (Julien Grall)
- update migration document

V7:
- add evtchn_fd

V8:
- remove ro-socket and read-only connection flag
- split off documentation part

V9:
- add htobe32() macro if needed (Wei Liu)
---
 tools/xenstore/include/xenstore_state.h | 131 ++++++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 tools/xenstore/include/xenstore_state.h

diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h
new file mode 100644
index 0000000000..d2a9307400
--- /dev/null
+++ b/tools/xenstore/include/xenstore_state.h
@@ -0,0 +1,131 @@
+/*
+ * Xenstore internal state dump definitions.
+ * Copyright (C) Juergen Gross, SUSE Software Solutions Germany GmbH
+ *
+ * Used for live-update and migration, possibly across Xenstore implementations.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef XENSTORE_STATE_H
+#define XENSTORE_STATE_H
+
+#include <endian.h>
+#include <sys/types.h>
+
+#ifndef htobe32
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+#define htobe32(x) __builtin_bswap32(x)
+#else
+#define htobe32(x) (x)
+#endif
+#endif
+
+struct xs_state_preamble {
+    char ident[8];
+#define XS_STATE_IDENT    "xenstore"  /* To be used without the NUL byte. */
+    uint32_t version;                 /* Version in big endian format. */
+#define XS_STATE_VERSION  0x00000001
+    uint32_t flags;                   /* Endianess. */
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+#define XS_STATE_FLAGS    0x00000000  /* Little endian. */
+#else
+#define XS_STATE_FLAGS    0x00000001  /* Big endian. */
+#endif
+};
+
+/*
+ * Each record is starting with xs_state_record_header.
+ * All records have a length of a multiple of 8 bytes.
+ */
+
+/* Common record layout: */
+struct xs_state_record_header {
+    uint32_t type;
+#define XS_STATE_TYPE_END        0x00000000
+#define XS_STATE_TYPE_GLOBAL     0x00000001
+#define XS_STATE_TYPE_CONN       0x00000002
+#define XS_STATE_TYPE_WATCH      0x00000003
+#define XS_STATE_TYPE_TA         0x00000004
+#define XS_STATE_TYPE_NODE       0x00000005
+    uint32_t length;         /* Length of record in bytes. */
+};
+
+/* Global state of Xenstore: */
+struct xs_state_global {
+    int32_t socket_fd;      /* File descriptor for socket connections or -1. */
+    int32_t evtchn_fd;      /* File descriptor for event channel operations. */
+};
+
+/* Connection to Xenstore: */
+struct xs_state_connection {
+    uint32_t conn_id;       /* Used as reference in watch and TA records. */
+    uint16_t conn_type;
+#define XS_STATE_CONN_TYPE_RING   0
+#define XS_STATE_CONN_TYPE_SOCKET 1
+    uint16_t pad;
+    union {
+        struct {
+            uint16_t domid;  /* Domain-Id. */
+            uint16_t tdomid; /* Id of target domain or DOMID_INVALID. */
+            uint32_t evtchn; /* Event channel port. */
+        } ring;
+        int32_t socket_fd;   /* File descriptor for socket connections. */
+    } spec;
+    uint16_t data_in_len;    /* Number of unprocessed bytes read from conn. */
+    uint16_t data_resp_len;  /* Size of partial response pending for conn. */
+    uint32_t data_out_len;   /* Number of bytes not yet written to conn. */
+    uint8_t  data[];         /* Pending data (read, written) + 0-7 pad bytes. */
+};
+
+/* Watch: */
+struct xs_state_watch {
+    uint32_t conn_id;       /* Connection this watch is associated with. */
+    uint16_t path_length;   /* Number of bytes of path watched (incl. 0). */
+    uint16_t token_length;  /* Number of bytes of watch token (incl. 0). */
+    uint8_t data[];         /* Path bytes, token bytes, 0-7 pad bytes. */
+};
+
+/* Transaction: */
+struct xs_state_transaction {
+    uint32_t conn_id;       /* Connection this TA is associated with. */
+    uint32_t ta_id;         /* Transaction Id. */
+};
+
+/* Node (either XS_STATE_TYPE_NODE or XS_STATE_TYPE_TANODE[_MOD]): */
+struct xs_state_node_perm {
+    uint8_t access;         /* Access rights. */
+#define XS_STATE_NODE_PERM_NONE   'n'
+#define XS_STATE_NODE_PERM_READ   'r'
+#define XS_STATE_NODE_PERM_WRITE  'w'
+#define XS_STATE_NODE_PERM_BOTH   'b'
+    uint8_t flags;
+#define XS_STATE_NODE_PERM_IGNORE 0x01 /* Stale permission, ignore for check. */
+    uint16_t domid;         /* Domain-Id. */
+};
+struct xs_state_node {
+    uint32_t conn_id;       /* Connection in case of transaction or 0. */
+    uint32_t ta_id;         /* Transaction Id or 0. */
+    uint16_t path_len;      /* Length of path string including NUL byte. */
+    uint16_t data_len;      /* Length of node data. */
+    uint16_t ta_access;
+#define XS_STATE_NODE_TA_DELETED  0x0000
+#define XS_STATE_NODE_TA_READ     0x0001
+#define XS_STATE_NODE_TA_WRITTEN  0x0002
+    uint16_t perm_n;        /* Number of permissions (0 in TA: node deleted). */
+    /* Permissions (first is owner, has full access). */
+    struct xs_state_node_perm perms[];
+    /* Path and data follows, plus 0-7 pad bytes. */
+};
+#endif /* XENSTORE_STATE_H */
-- 
2.26.2


