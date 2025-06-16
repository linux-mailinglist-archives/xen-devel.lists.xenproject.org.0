Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C35ADAB0D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016883.1393868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UG-00087i-AW; Mon, 16 Jun 2025 08:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016883.1393868; Mon, 16 Jun 2025 08:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UG-00084L-6u; Mon, 16 Jun 2025 08:46:40 +0000
Received: by outflank-mailman (input) for mailman id 1016883;
 Mon, 16 Jun 2025 08:46:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5UD-0007hV-Vy
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:46:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 695bf66e-4a8e-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 10:46:36 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F11E21181;
 Mon, 16 Jun 2025 08:46:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3F4A139E2;
 Mon, 16 Jun 2025 08:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id b8obOuLZT2jgPwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:46:26 +0000
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
X-Inumbo-ID: 695bf66e-4a8e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIbkCenoZvqJqr3MP5CvMO1uqc+kjXWDfidavHJfSOg=;
	b=E4B/oENMbf4MVYNW+Xi+9rgx/R78CrdQ/RHbovg0TUQ9U/kZqBKiOQftJ/bJnKg/BGnGdG
	ZJn/UqW3DfyzvC4yEJLjrBTJKcJRjBUbp9qc0F6nJGRRhli9N20MoDbbEEU75ow3HJ34px
	BTKmSsmkCr++8XAiw79XqPCM3ydFqjk=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIbkCenoZvqJqr3MP5CvMO1uqc+kjXWDfidavHJfSOg=;
	b=E4B/oENMbf4MVYNW+Xi+9rgx/R78CrdQ/RHbovg0TUQ9U/kZqBKiOQftJ/bJnKg/BGnGdG
	ZJn/UqW3DfyzvC4yEJLjrBTJKcJRjBUbp9qc0F6nJGRRhli9N20MoDbbEEU75ow3HJ34px
	BTKmSsmkCr++8XAiw79XqPCM3ydFqjk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 01/12] add kexec framework
Date: Mon, 16 Jun 2025 10:46:08 +0200
Message-ID: <20250616084619.11112-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid,amd.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Add a new config option CONFIG_KEXEC for support of kexec-ing into a
new mini-os kernel. Add a related kexec.c source and a kexec.h header.

For now allow CONFIG_KEXEC to be set only for PVH variant of mini-os.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- reword some comments (Jason Andryuk)
---
 Config.mk                  |  1 +
 Makefile                   |  1 +
 arch/x86/testbuild/all-no  |  1 +
 arch/x86/testbuild/all-yes |  2 ++
 arch/x86/testbuild/kexec   |  4 +++
 include/kexec.h            |  7 +++++
 kexec.c                    | 60 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 76 insertions(+)
 create mode 100644 arch/x86/testbuild/kexec
 create mode 100644 include/kexec.h
 create mode 100644 kexec.c

diff --git a/Config.mk b/Config.mk
index e493533a..e2afb1b4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -204,6 +204,7 @@ CONFIG-n += CONFIG_LIBXENGUEST
 CONFIG-n += CONFIG_LIBXENTOOLCORE
 CONFIG-n += CONFIG_LIBXENTOOLLOG
 CONFIG-n += CONFIG_LIBXENMANAGE
+CONFIG-n += CONFIG_KEXEC
 # Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
 # console apart of standard dom0 handled console.
 CONFIG-n += CONFIG_USE_XEN_CONSOLE
diff --git a/Makefile b/Makefile
index d094858a..a64913ad 100644
--- a/Makefile
+++ b/Makefile
@@ -51,6 +51,7 @@ src-y += gntmap.c
 src-y += gnttab.c
 src-y += hypervisor.c
 src-y += kernel.c
+src-$(CONFIG_KEXEC) += kexec.c
 src-y += lock.c
 src-y += main.c
 src-y += mm.c
diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
index 5b3e99ed..b2ee5ce8 100644
--- a/arch/x86/testbuild/all-no
+++ b/arch/x86/testbuild/all-no
@@ -18,3 +18,4 @@ CONFIG_LIBXS = n
 CONFIG_LWIP = n
 CONFIG_BALLOON = n
 CONFIG_USE_XEN_CONSOLE = n
+CONFIG_KEXEC = n
diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
index 8ae489a4..c9a990f9 100644
--- a/arch/x86/testbuild/all-yes
+++ b/arch/x86/testbuild/all-yes
@@ -19,3 +19,5 @@ CONFIG_BALLOON = y
 CONFIG_USE_XEN_CONSOLE = y
 # The following are special: they need support from outside
 CONFIG_LWIP = n
+# KEXEC not implemented for PARAVIRT
+CONFIG_KEXEC = n
diff --git a/arch/x86/testbuild/kexec b/arch/x86/testbuild/kexec
new file mode 100644
index 00000000..ea17b4d9
--- /dev/null
+++ b/arch/x86/testbuild/kexec
@@ -0,0 +1,4 @@
+CONFIG_PARAVIRT = n
+CONFIG_BALLOON = y
+CONFIG_USE_XEN_CONSOLE = y
+CONFIG_KEXEC = y
diff --git a/include/kexec.h b/include/kexec.h
new file mode 100644
index 00000000..6fd96774
--- /dev/null
+++ b/include/kexec.h
@@ -0,0 +1,7 @@
+#ifndef _KEXEC_H
+#define _KEXEC_H
+
+int kexec(void *kernel, unsigned long kernel_size,
+          const char *cmdline);
+
+#endif /* _KEXEC_H */
diff --git a/kexec.c b/kexec.c
new file mode 100644
index 00000000..7fcc5c6b
--- /dev/null
+++ b/kexec.c
@@ -0,0 +1,60 @@
+/******************************************************************************
+ * kexec.c
+ *
+ * Support of kexec (reboot locally into new mini-os kernel).
+ *
+ * Copyright (c) 2024, Juergen Gross, SUSE Linux GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifdef CONFIG_PARAVIRT
+#error "kexec support not implemented in PV variant"
+#endif
+
+#include <errno.h>
+#include <mini-os/os.h>
+#include <mini-os/lib.h>
+#include <mini-os/kexec.h>
+
+/*
+ * General approach for kexec support (PVH only) is as follows:
+ *
+ * - New kernel needs to be in memory in form of a ELF binary in a virtual
+ *   memory region.
+ * - A new start_info structure is constructed in memory with the final
+ *   memory locations included.
+ * - Page tables and memory pages of the new kernel binary conflicting with the
+ *   final memory layout are moved to non-conflicting locations.
+ * - All memory areas needed for kexec execution are being finalized.
+ * - The final kexec execution stage is copied to a memory area below 4G which
+ *   doesn't conflict with the target areas of kernel etc.
+ * - From here on a graceful failure is no longer possible.
+ * - Grants and event channels are torn down.
+ * - Execution continues in the final execution stage.
+ * - All data is copied to its final addresses.
+ * - CPU is switched to 32-bit mode with paging disabled.
+ * - The new kernel is activated.
+ */
+
+int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
+{
+    return ENOSYS;
+}
+EXPORT_SYMBOL(kexec);
-- 
2.43.0


