Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4309F11FE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856790.1269317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8T0-0000en-2h; Fri, 13 Dec 2024 16:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856790.1269317; Fri, 13 Dec 2024 16:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Sz-0000dC-Vt; Fri, 13 Dec 2024 16:24:37 +0000
Received: by outflank-mailman (input) for mailman id 856790;
 Fri, 13 Dec 2024 16:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tM8Sy-000061-Hl
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:24:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be031707-b96e-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 17:24:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A384B210F3;
 Fri, 13 Dec 2024 16:24:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72972137CF;
 Fri, 13 Dec 2024 16:24:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GKBsGsNfXGfXSgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 13 Dec 2024 16:24:35 +0000
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
X-Inumbo-ID: be031707-b96e-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734107075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6JXLGZ2C/uRkGXgqKjA/JAonnCDowTlDjW+0Nr5vSE=;
	b=sBBOnfSbOX/5fJ7YZQCDY/xzoSEa+03QAK60gQH6tayTzdSPzkOppBPNjBWMm3ZDl8GbrJ
	fxwjgKdN6p81kDRUPisDnwN8LEueB1wP11FeeuxUCx1nJn2RlFzIvWVUmGSyzZarqizWeh
	dXMoLW4jYtiuW3DBhzGJeifDlUCmWII=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734107075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6JXLGZ2C/uRkGXgqKjA/JAonnCDowTlDjW+0Nr5vSE=;
	b=sBBOnfSbOX/5fJ7YZQCDY/xzoSEa+03QAK60gQH6tayTzdSPzkOppBPNjBWMm3ZDl8GbrJ
	fxwjgKdN6p81kDRUPisDnwN8LEueB1wP11FeeuxUCx1nJn2RlFzIvWVUmGSyzZarqizWeh
	dXMoLW4jYtiuW3DBhzGJeifDlUCmWII=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 2/7] tools: add a dedicated header file for barrier definitions
Date: Fri, 13 Dec 2024 17:24:16 +0100
Message-ID: <20241213162421.16782-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162421.16782-1-jgross@suse.com>
References: <20241213162421.16782-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Instead of having to include xenctrl.h for getting definitions of cpu
barriers, add a dedicated header for that purpose.

Switch the xen-9pfsd daemon to use the new header instead of xenctrl.h.

This is in preparation of making Xenstore independent from libxenctrl.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V1:
- new patch
V2:
- use SPDX
- modify guard define (Anthony PERARD)
- moved earlier in the series
---
 tools/9pfsd/io.c            |  5 ++++-
 tools/include/xen-barrier.h | 39 +++++++++++++++++++++++++++++++++++++
 tools/include/xenctrl.h     | 28 +-------------------------
 tools/libs/ctrl/Makefile    |  2 +-
 4 files changed, 45 insertions(+), 29 deletions(-)
 create mode 100644 tools/include/xen-barrier.h

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index 468e0241f5..14cfcaf568 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -13,15 +13,18 @@
 
 #include <assert.h>
 #include <errno.h>
+#include <stdarg.h>
 #include <stdbool.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <syslog.h>
+#include <unistd.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <dirent.h>
 #include <fcntl.h>
-#include <xenctrl.h>           /* For cpu barriers. */
+#include <xen-barrier.h>
 #include <xen-tools/common-macros.h>
 
 #include "xen-9pfsd.h"
diff --git a/tools/include/xen-barrier.h b/tools/include/xen-barrier.h
new file mode 100644
index 0000000000..a716fb93cc
--- /dev/null
+++ b/tools/include/xen-barrier.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: LGPL-2.1 */
+/******************************************************************************
+ * xen-barrier.h
+ *
+ * Definition of CPU barriers, part of libxenctrl.
+ *
+ * Copyright (c) 2003-2004, K A Fraser.
+ */
+
+#ifndef XEN_BARRIER_H
+#define XEN_BARRIER_H
+
+/*
+ *  DEFINITIONS FOR CPU BARRIERS
+ */
+
+#define xen_barrier() asm volatile ( "" : : : "memory")
+
+#if defined(__i386__)
+#define xen_mb()  asm volatile ( "lock addl $0, -4(%%esp)" ::: "memory" )
+#define xen_rmb() xen_barrier()
+#define xen_wmb() xen_barrier()
+#elif defined(__x86_64__)
+#define xen_mb()  asm volatile ( "lock addl $0, -32(%%rsp)" ::: "memory" )
+#define xen_rmb() xen_barrier()
+#define xen_wmb() xen_barrier()
+#elif defined(__arm__)
+#define xen_mb()   asm volatile ("dmb" : : : "memory")
+#define xen_rmb()  asm volatile ("dmb" : : : "memory")
+#define xen_wmb()  asm volatile ("dmb" : : : "memory")
+#elif defined(__aarch64__)
+#define xen_mb()   asm volatile ("dmb sy" : : : "memory")
+#define xen_rmb()  asm volatile ("dmb sy" : : : "memory")
+#define xen_wmb()  asm volatile ("dmb sy" : : : "memory")
+#else
+#error "Define barriers"
+#endif
+
+#endif /* XEN_BARRIER_H */
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 29617585c5..ea57e9dbb9 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -48,6 +48,7 @@
 #include <xen/platform.h>
 
 #include "xentoollog.h"
+#include "xen-barrier.h"
 
 #if defined(__i386__) || defined(__x86_64__)
 #include <xen/foreign/x86_32.h>
@@ -61,33 +62,6 @@
 
 #define INVALID_MFN  (~0UL)
 
-/*
- *  DEFINITIONS FOR CPU BARRIERS
- */
-
-#define xen_barrier() asm volatile ( "" : : : "memory")
-
-#if defined(__i386__)
-#define xen_mb()  asm volatile ( "lock addl $0, -4(%%esp)" ::: "memory" )
-#define xen_rmb() xen_barrier()
-#define xen_wmb() xen_barrier()
-#elif defined(__x86_64__)
-#define xen_mb()  asm volatile ( "lock addl $0, -32(%%rsp)" ::: "memory" )
-#define xen_rmb() xen_barrier()
-#define xen_wmb() xen_barrier()
-#elif defined(__arm__)
-#define xen_mb()   asm volatile ("dmb" : : : "memory")
-#define xen_rmb()  asm volatile ("dmb" : : : "memory")
-#define xen_wmb()  asm volatile ("dmb" : : : "memory")
-#elif defined(__aarch64__)
-#define xen_mb()   asm volatile ("dmb sy" : : : "memory")
-#define xen_rmb()  asm volatile ("dmb sy" : : : "memory")
-#define xen_wmb()  asm volatile ("dmb sy" : : : "memory")
-#else
-#error "Define barriers"
-#endif
-
-
 #define XENCTRL_HAS_XC_INTERFACE 1
 /* In Xen 4.0 and earlier, xc_interface_open and xc_evtchn_open would
  * both return ints being the file descriptor.  In 4.1 and later, they
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 5fe0bfad0c..acce8639d3 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -3,7 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 include Makefile.common
 
-LIBHEADER := xenctrl.h xenctrl_compat.h
+LIBHEADER := xenctrl.h xenctrl_compat.h xen-barrier.h
 PKG_CONFIG_FILE := xencontrol.pc
 PKG_CONFIG_NAME := Xencontrol
 
-- 
2.43.0


