Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECD9E6ED1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 14:03:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850284.1264753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJXz4-0005Rh-0j; Fri, 06 Dec 2024 13:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850284.1264753; Fri, 06 Dec 2024 13:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJXz3-0005P4-Td; Fri, 06 Dec 2024 13:03:01 +0000
Received: by outflank-mailman (input) for mailman id 850284;
 Fri, 06 Dec 2024 13:03:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tJXz1-0003LF-Uc
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 13:03:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a4365cd-b3d2-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 14:02:58 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A06BD1F45A;
 Fri,  6 Dec 2024 13:02:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 771AB13647;
 Fri,  6 Dec 2024 13:02:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id keyNGwH2Umf0TgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 06 Dec 2024 13:02:57 +0000
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
X-Inumbo-ID: 6a4365cd-b3d2-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733490177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njZByj3Fv1skLzdzIhzzAQM2aH7X5x2SGpdSn9+/xKI=;
	b=ULzM0uiuBBp8pklsF9UJEmbBykeUPwhJrR8nwwSmezkEnR4HZuJfFab7385gIByHv+7DNb
	KNiEahDxEs16IDOisiTajFs6njtJh4NBfqykH2GiVc0oplRQneSk0+PohfCenwJ8MsYI/V
	H4ElsS5IrRorATD+Y0cOc1XThKL0IzM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733490177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njZByj3Fv1skLzdzIhzzAQM2aH7X5x2SGpdSn9+/xKI=;
	b=ULzM0uiuBBp8pklsF9UJEmbBykeUPwhJrR8nwwSmezkEnR4HZuJfFab7385gIByHv+7DNb
	KNiEahDxEs16IDOisiTajFs6njtJh4NBfqykH2GiVc0oplRQneSk0+PohfCenwJ8MsYI/V
	H4ElsS5IrRorATD+Y0cOc1XThKL0IzM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 6/7] tools/libs: add a new libxenmanage library
Date: Fri,  6 Dec 2024 14:02:20 +0100
Message-ID: <20241206130221.17773-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206130221.17773-1-jgross@suse.com>
References: <20241206130221.17773-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

In order to have a stable interface in user land for using stable
domctl and possibly later sysctl interfaces, add a new library
libxenmanage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V1:
- new patch
V2:
- define __XEN_TOOLS__ via Makefile (Anthony PERARD)
- use SPDX in header file (Anthony PERARD)
- change function name to xenmanage_poll_changed_domain() (Anthony PERARD)
- add short library description (Anthony PERARD)
- narrow scope of xen_domctl_get_domain_state pointer (Anthony PERARD)
---
 tools/include/xenmanage.h          |  91 ++++++++++++++++
 tools/libs/Makefile                |   1 +
 tools/libs/manage/Makefile         |  10 ++
 tools/libs/manage/Makefile.common  |   3 +
 tools/libs/manage/core.c           | 166 +++++++++++++++++++++++++++++
 tools/libs/manage/libxenmanage.map |   8 ++
 tools/libs/uselibs.mk              |   2 +
 7 files changed, 281 insertions(+)
 create mode 100644 tools/include/xenmanage.h
 create mode 100644 tools/libs/manage/Makefile
 create mode 100644 tools/libs/manage/Makefile.common
 create mode 100644 tools/libs/manage/core.c
 create mode 100644 tools/libs/manage/libxenmanage.map

diff --git a/tools/include/xenmanage.h b/tools/include/xenmanage.h
new file mode 100644
index 0000000000..280b3840f9
--- /dev/null
+++ b/tools/include/xenmanage.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
+/*
+ * Copyright (c) 2024 SUSE Software Solutions Germany GmbH
+ *
+ * Interfaces of libxenmanage.
+ *
+ * libxenmanage provides management functions for the host using stable
+ * hypercall interfaces.
+ */
+#ifndef XENMANAGE_H
+#define XENMANAGE_H
+
+#include <stdint.h>
+
+/* Avoid the need to #include <xentoollog.h> */
+struct xentoollog_logger;
+
+typedef struct xenmanage_handle xenmanage_handle;
+
+/*
+ * Open libxenmanage.
+ *
+ * Get a handle of the xenmanage library. The handle is required for all
+ * further operations of the library.
+ * Parameters:
+ *   logger:     Logging function to use. If NULL logging is done to stderr.
+ *   open_flags: Only 0 supported.
+ * Return value: Handle or NULL if error.
+ */
+xenmanage_handle *xenmanage_open(struct xentoollog_logger *logger,
+                                 unsigned int open_flags);
+
+/*
+ * Close libxenmanage.
+ *
+ * Return a handle of the xenmanage library.
+ * Parameters:
+ *    hdl: Handle obtained by xenmanage_open().
+ * Return value: always 0.
+ */
+int xenmanage_close(xenmanage_handle *hdl);
+
+#define XENMANAGE_GETDOMSTATE_STATE_EXIST     0x0001  /* Domain is existing. */
+#define XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
+#define XENMANAGE_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
+
+/*
+ * Return state information of an existing domain.
+ *
+ * Returns the domain state and unique id of the given domain.
+ * Parameters:
+ *   hdl:       handle returned by xenmanage_open()
+ *   domid:     domain id of the domain to get the information for
+ *   state:     where to store the state (XENMANAGE_GETDOMSTATE_STATE_ flags,
+ *              nothing stored if NULL)
+ *   unique_id: where to store the unique id of the domain (nothing stored if
+ *              NULL)
+ * Return value: 0 if information was stored, -1 else (errno is set)
+ */
+int xenmanage_get_domain_info(xenmanage_handle *hdl, unsigned int domid,
+                              unsigned int *state, uint64_t *unique_id);
+
+/*
+ * Return information of a domain having changed state recently.
+ *
+ * Returns the domain id, state and unique id of a domain having changed
+ * state (any of the state bits was modified) since the last time information
+ * for that domain was returned by this function. Only usable by callers who
+ * have registered the VIRQ_DOM_EXC event (normally Xenstore).
+ * Parameters:
+ *   hdl:       handle returned by xenmanage_open()
+ *   domid:     where to store the domid of the domain (not NULL)
+ *   state:     where to store the state (XENMANAGE_GETDOMSTATE_STATE_ flags,
+ *              nothing stored if NULL)
+ *   unique_id: where to store the unique id of the domain (nothing stored if
+ *              NULL)
+ * Return value: 0 if information was stored, -1 else (errno is set)
+ */
+int xenmanage_poll_changed_domain(xenmanage_handle *hdl, unsigned int *domid,
+                                  unsigned int *state, uint64_t *unique_id);
+#endif /* XENMANAGE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 1afcd12e2b..d39516c1b3 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -12,6 +12,7 @@ SUBDIRS-y += devicemodel
 SUBDIRS-y += ctrl
 SUBDIRS-y += guest
 SUBDIRS-y += hypfs
+SUBDIRS-y += manage
 SUBDIRS-y += store
 SUBDIRS-y += stat
 SUBDIRS-$(CONFIG_Linux) += vchan
diff --git a/tools/libs/manage/Makefile b/tools/libs/manage/Makefile
new file mode 100644
index 0000000000..dbfe70d259
--- /dev/null
+++ b/tools/libs/manage/Makefile
@@ -0,0 +1,10 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+MAJOR    = 1
+MINOR    = 0
+version-script := libxenmanage.map
+
+include Makefile.common
+
+include $(XEN_ROOT)/tools/libs/libs.mk
diff --git a/tools/libs/manage/Makefile.common b/tools/libs/manage/Makefile.common
new file mode 100644
index 0000000000..533ba30fba
--- /dev/null
+++ b/tools/libs/manage/Makefile.common
@@ -0,0 +1,3 @@
+CFLAGS += -D__XEN_TOOLS__
+
+OBJS-y  += core.o
diff --git a/tools/libs/manage/core.c b/tools/libs/manage/core.c
new file mode 100644
index 0000000000..c0dc74815b
--- /dev/null
+++ b/tools/libs/manage/core.c
@@ -0,0 +1,166 @@
+/*
+ * Copyright (c) 2024 SUSE Software Solutions Germany GmbH
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
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
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <xentoollog.h>
+#include <xenmanage.h>
+#include <xencall.h>
+#include <xentoolcore_internal.h>
+
+#include <xen/xen.h>
+#include <xen/domctl.h>
+
+struct xenmanage_handle {
+    xentoollog_logger *logger, *logger_tofree;
+    unsigned int flags;
+    xencall_handle *xcall;
+};
+
+xenmanage_handle *xenmanage_open(xentoollog_logger *logger,
+                                 unsigned open_flags)
+{
+    xenmanage_handle *hdl = calloc(1, sizeof(*hdl));
+    int saved_errno;
+
+    if ( !hdl )
+        return NULL;
+
+    if ( open_flags )
+    {
+        errno = EINVAL;
+        goto err;
+    }
+
+    hdl->flags = open_flags;
+    hdl->logger = logger;
+    hdl->logger_tofree = NULL;
+
+    if ( !hdl->logger )
+    {
+        hdl->logger = hdl->logger_tofree =
+            (xentoollog_logger *)
+            xtl_createlogger_stdiostream(stderr, XTL_PROGRESS, 0);
+        if ( !hdl->logger )
+            goto err;
+    }
+
+    hdl->xcall = xencall_open(hdl->logger, 0);
+    if ( !hdl->xcall )
+        goto err;
+
+    return hdl;
+
+err:
+    saved_errno = errno;
+    xenmanage_close(hdl);
+    errno = saved_errno;
+
+    return NULL;
+}
+
+int xenmanage_close(xenmanage_handle *hdl)
+{
+    if ( !hdl )
+        return 0;
+
+    xencall_close(hdl->xcall);
+    xtl_logger_destroy(hdl->logger_tofree);
+    free(hdl);
+    return 0;
+}
+
+static int xenmanage_do_domctl_get_domain_state(xenmanage_handle *hdl,
+                                                unsigned int domid_in,
+                                                unsigned int *domid_out,
+                                                unsigned int *state,
+                                                uint64_t *unique_id)
+{
+    struct xen_domctl *buf;
+    int saved_errno;
+    int ret;
+
+    buf = xencall_alloc_buffer(hdl->xcall, sizeof(*buf));
+    if ( !buf )
+    {
+        errno = ENOMEM;
+        return -1;
+    }
+
+    memset(buf, 0, sizeof(*buf));
+
+    buf->cmd = XEN_DOMCTL_get_domain_state;
+    buf->domain = domid_in;
+
+    ret = xencall1(hdl->xcall, __HYPERVISOR_domctl, (unsigned long)buf);
+    saved_errno = errno;
+    if ( !ret )
+    {
+        struct xen_domctl_get_domain_state *st = &buf->u.get_domain_state;
+
+        if ( domid_out )
+            *domid_out = buf->domain;
+        if ( state )
+        {
+            *state = 0;
+            if ( st->state & XEN_DOMCTL_GETDOMSTATE_STATE_EXIST )
+                *state |= XENMANAGE_GETDOMSTATE_STATE_EXIST;
+            if ( st->state & XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN )
+                *state |= XENMANAGE_GETDOMSTATE_STATE_SHUTDOWN;
+            if ( st->state & XEN_DOMCTL_GETDOMSTATE_STATE_DYING )
+                *state |= XENMANAGE_GETDOMSTATE_STATE_DYING;
+        }
+        if ( unique_id )
+            *unique_id = st->unique_id;
+    }
+
+    xencall_free_buffer(hdl->xcall, buf);
+
+    errno = saved_errno;
+
+    return ret;
+}
+
+int xenmanage_get_domain_info(xenmanage_handle *hdl, unsigned int domid,
+                              unsigned int *state, uint64_t *unique_id)
+{
+    if ( !hdl || domid >= DOMID_FIRST_RESERVED )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    return xenmanage_do_domctl_get_domain_state(hdl, domid, NULL, state,
+                                                unique_id);
+}
+
+int xenmanage_poll_changed_domain(xenmanage_handle *hdl, unsigned int *domid,
+                                  unsigned int *state, uint64_t *unique_id)
+{
+    if ( !hdl || !domid )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    return xenmanage_do_domctl_get_domain_state(hdl, DOMID_INVALID, domid,
+                                                state, unique_id);
+}
diff --git a/tools/libs/manage/libxenmanage.map b/tools/libs/manage/libxenmanage.map
new file mode 100644
index 0000000000..64c793e603
--- /dev/null
+++ b/tools/libs/manage/libxenmanage.map
@@ -0,0 +1,8 @@
+VERS_1.0 {
+	global:
+		xenmanage_open;
+		xenmanage_close;
+		xenmanage_get_domain_info;
+		xenmanage_poll_changed_domain;
+	local: *; /* Do not expose anything by default */
+};
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index 7aa8d83e06..c0a234cfec 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -16,6 +16,8 @@ LIBS_LIBS += devicemodel
 USELIBS_devicemodel := toollog toolcore call
 LIBS_LIBS += hypfs
 USELIBS_hypfs := toollog toolcore call
+LIBS_LIBS += manage
+USELIBS_manage := toollog toolcore call
 LIBS_LIBS += ctrl
 USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
 LIBS_LIBS += guest
-- 
2.43.0


