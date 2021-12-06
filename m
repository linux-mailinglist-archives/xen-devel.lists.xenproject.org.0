Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F14690C4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 08:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238647.413658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Ll-00014A-O8; Mon, 06 Dec 2021 07:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238647.413658; Mon, 06 Dec 2021 07:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Ll-0000zi-4o; Mon, 06 Dec 2021 07:23:49 +0000
Received: by outflank-mailman (input) for mailman id 238647;
 Mon, 06 Dec 2021 07:23:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mu8Lj-0008Mw-Ff
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 07:23:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7022dedf-5665-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 08:23:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0823F1FE04;
 Mon,  6 Dec 2021 07:23:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D21C21330B;
 Mon,  6 Dec 2021 07:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YC8CMny6rWHVdAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 07:23:40 +0000
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
X-Inumbo-ID: 7022dedf-5665-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638775421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJ0RmLtKB8UkcvX+Y3JuijTbu6nHqV/hpfXxOIuN+R4=;
	b=dNA4rT4w7GOiBlM5Kmz8jsutTtW4O/BdSr4y396zKhGKNlRRf6sRGYOoPEhT9pubzIaxgV
	vUNVo9O8b28ePqjllYVqkYx5QLJLa+NLpclGZLvUJHx6m1m/s2KjJbR4625rUfKAMVbAHh
	hh/ji8MQP/L/ZsLI+F2z3eDzE5ZiHW0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 07/10] mini-os: move x86 specific gnttab coding into arch/x86/gnttab.c
Date: Mon,  6 Dec 2021 08:23:34 +0100
Message-Id: <20211206072337.9517-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211206072337.9517-1-jgross@suse.com>
References: <20211206072337.9517-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having grant table code in arch/x86/mm.c seems wrong. Move it to the
new file arch/x86/gnttab.c, especially as the amount of code is
expected to grow further.

No functional change.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/gnttab.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++
 arch/x86/mm.c     | 47 ----------------------------
 2 files changed, 78 insertions(+), 47 deletions(-)
 create mode 100644 arch/x86/gnttab.c

diff --git a/arch/x86/gnttab.c b/arch/x86/gnttab.c
new file mode 100644
index 0000000..56e59d7
--- /dev/null
+++ b/arch/x86/gnttab.c
@@ -0,0 +1,78 @@
+/* -*-  Mode:C; c-basic-offset:4; tab-width:4 -*-
+ *
+ * (C) 2021 - Juergen Gross, SUSE Software Solutions Germany GmbH
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
+#include <mini-os/os.h>
+#include <mini-os/hypervisor.h>
+#include <mini-os/gnttab.h>
+#include <mini-os/mm.h>
+#include <mini-os/types.h>
+
+grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
+{
+    struct gnttab_setup_table setup;
+    unsigned long frames[nr_grant_frames];
+
+    setup.dom = DOMID_SELF;
+    setup.nr_frames = nr_grant_frames;
+    set_xen_guest_handle(setup.frame_list, frames);
+
+    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
+    return map_frames(frames, nr_grant_frames);
+}
+
+void arch_suspend_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
+{
+#ifdef CONFIG_PARAVIRT
+    int i;
+
+    for ( i = 0; i < nr_grant_frames; i++ )
+    {
+        HYPERVISOR_update_va_mapping((unsigned long)gnttab_table + PAGE_SIZE * i,
+                __pte(0x0 << PAGE_SHIFT), UVMF_INVLPG);
+    }
+#endif
+    return;
+}
+
+void arch_resume_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
+{
+    struct gnttab_setup_table setup;
+    unsigned long frames[nr_grant_frames];
+#ifdef CONFIG_PARAVIRT
+    int i;
+#endif
+
+    setup.dom = DOMID_SELF;
+    setup.nr_frames = nr_grant_frames;
+    set_xen_guest_handle(setup.frame_list, frames);
+
+    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
+
+#ifdef CONFIG_PARAVIRT
+    for ( i = 0; i < nr_grant_frames; i++ )
+    {
+        HYPERVISOR_update_va_mapping((unsigned long)gnttab_table + PAGE_SIZE * i,
+                __pte((frames[i] << PAGE_SHIFT) | L1_PROT), UVMF_INVLPG);
+    }
+#endif
+}
diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index c30d8bc..220c0b4 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -837,53 +837,6 @@ void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p)
 #endif
 }
 
-grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
-{
-    struct gnttab_setup_table setup;
-    unsigned long frames[nr_grant_frames];
-
-    setup.dom = DOMID_SELF;
-    setup.nr_frames = nr_grant_frames;
-    set_xen_guest_handle(setup.frame_list, frames);
-
-    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
-    return map_frames(frames, nr_grant_frames);
-}
-
-void arch_suspend_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
-{
-#ifdef CONFIG_PARAVIRT
-    int i;
-
-    for (i = 0; i < nr_grant_frames; i++) {
-        HYPERVISOR_update_va_mapping((unsigned long)(((char *)gnttab_table) + PAGE_SIZE * i),
-                (pte_t){0x0<<PAGE_SHIFT}, UVMF_INVLPG);
-    }
-#endif
-    return;
-}
-
-void arch_resume_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
-{
-    struct gnttab_setup_table setup;
-    unsigned long frames[nr_grant_frames];
-#ifdef CONFIG_PARAVIRT
-    int i;
-#endif
-    setup.dom = DOMID_SELF;
-    setup.nr_frames = nr_grant_frames;
-    set_xen_guest_handle(setup.frame_list, frames);
-
-    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
-
-#ifdef CONFIG_PARAVIRT
-    for (i = 0; i < nr_grant_frames; i++) {
-        HYPERVISOR_update_va_mapping((unsigned long)(((char *)gnttab_table) + PAGE_SIZE * i),
-                (pte_t){(frames[i] << PAGE_SHIFT) | L1_PROT}, UVMF_INVLPG);
-    }
-#endif
-}
-
 unsigned long alloc_virt_kernel(unsigned n_pages)
 {
     unsigned long addr;
-- 
2.26.2


