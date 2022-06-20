Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232725511A1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352540.579418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzk-00051R-Lz; Mon, 20 Jun 2022 07:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352540.579418; Mon, 20 Jun 2022 07:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzk-0004n7-B1; Mon, 20 Jun 2022 07:38:48 +0000
Received: by outflank-mailman (input) for mailman id 352540;
 Mon, 20 Jun 2022 07:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Bzg-0002ZD-CV
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcb15982-f06b-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:38:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2193721BCE;
 Mon, 20 Jun 2022 07:38:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E52F6134CA;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OEubNvkjsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:33 +0000
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
X-Inumbo-ID: fcb15982-f06b-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2usykdrZz/ETCDtrSzcODBAgM6yVFNOOYprC5PICS8=;
	b=sSC6tQ1TwuIm9F1IbZobt/BlZYlWRWpysSxHKvHzavFfCHHIa5nFk1ZdZElY8a3WwNwMRA
	y9ZrzB/r5gPVTVtZ8kKydPNmy8Ic/jBpOArgr7WXEI28MTsM1sqy5oup9ByadnXzGCtIh0
	ynmiF7xExpf2uig1Lusce6y7AOxIUqA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/8] mini-os: eliminate console directory
Date: Mon, 20 Jun 2022 09:38:18 +0200
Message-Id: <20220620073820.9336-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the two remaining source files in the console directory into
a single one and move it to the main directory.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 Makefile                            |   4 +-
 console/xencons_ring.c => console.c | 171 ++++++++++++++++++++++++++-
 console/console.c                   | 177 ----------------------------
 3 files changed, 170 insertions(+), 182 deletions(-)
 rename console/xencons_ring.c => console.c (51%)
 delete mode 100644 console/console.c

diff --git a/Makefile b/Makefile
index 509d927b..f3acdd2f 100644
--- a/Makefile
+++ b/Makefile
@@ -41,6 +41,7 @@ src-$(CONFIG_CONSFRONT) += consfront.c
 src-$(CONFIG_TPMFRONT) += tpmfront.c
 src-$(CONFIG_TPM_TIS) += tpm_tis.c
 src-$(CONFIG_TPMBACK) += tpmback.c
+src-y += console.c
 src-y += daytime.c
 src-y += e820.c
 src-y += events.c
@@ -69,9 +70,6 @@ src-y += lib/sys.c
 src-y += lib/xmalloc.c
 src-$(CONFIG_LIBXS) += lib/xs.c
 
-src-y += console/console.c
-src-y += console/xencons_ring.c
-
 # The common mini-os objects to build.
 APP_OBJS :=
 OBJS := $(patsubst %.c,$(OBJ_DIR)/%.o,$(src-y))
diff --git a/console/xencons_ring.c b/console.c
similarity index 51%
rename from console/xencons_ring.c
rename to console.c
index 495f0a19..29277eac 100644
--- a/console/xencons_ring.c
+++ b/console.c
@@ -1,3 +1,39 @@
+/* 
+ ****************************************************************************
+ * (C) 2006 - Grzegorz Milos - Cambridge University
+ ****************************************************************************
+ *
+ *        File: console.c
+ *      Author: Grzegorz Milos
+ *     Changes: 
+ *              
+ *        Date: Mar 2006
+ * 
+ * Environment: Xen Minimal OS
+ * Description: Console interface.
+ *
+ * Handles console I/O. Defines printk.
+ *
+ ****************************************************************************
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
 #include <mini-os/types.h>
 #include <mini-os/wait.h>
 #include <mini-os/mm.h>
@@ -7,12 +43,143 @@
 #include <mini-os/lib.h>
 #include <mini-os/console.h>
 #include <mini-os/xenbus.h>
+#include <mini-os/xmalloc.h>
+#include <mini-os/gnttab.h>
 #include <xen/io/console.h>
 #include <xen/io/protocols.h>
 #include <xen/io/ring.h>
 #include <xen/hvm/params.h>
-#include <mini-os/xmalloc.h>
-#include <mini-os/gnttab.h>
+
+/* If console not initialised the printk will be sent to xen serial line 
+   NOTE: you need to enable verbose in xen/Rules.mk for it to work. */
+static struct consfront_dev* xen_console = NULL;
+static int console_initialised = 0;
+
+__attribute__((weak)) void console_input(char * buf, unsigned len)
+{
+    if(len > 0)
+    {
+        /* Just repeat what's written */
+        buf[len] = '\0';
+        printk("%s", buf);
+        
+        if(buf[len-1] == '\r')
+            printk("\nNo console input handler.\n");
+    }
+}
+
+#ifndef HAVE_LIBC
+void xencons_rx(char *buf, unsigned len, struct pt_regs *regs)
+{
+    console_input(buf, len);
+}
+
+void xencons_tx(void)
+{
+    /* Do nothing, handled by _rx */
+}
+#endif
+
+
+void console_print(struct consfront_dev *dev, const char *data, int length)
+{
+    char *curr_char, saved_char;
+    char copied_str[length+1];
+    char *copied_ptr;
+    int part_len;
+    int (*ring_send_fn)(struct consfront_dev *dev, const char *data, unsigned length);
+
+    if(!console_initialised)
+        ring_send_fn = xencons_ring_send_no_notify;
+    else
+        ring_send_fn = xencons_ring_send;
+
+    if (dev && dev->is_raw) {
+        ring_send_fn(dev, data, length);
+        return;
+    }
+
+    copied_ptr = copied_str;
+    memcpy(copied_ptr, data, length);
+    for(curr_char = copied_ptr; curr_char < copied_ptr+length-1; curr_char++)
+    {
+        if(*curr_char == '\n')
+        {
+            *curr_char = '\r';
+            saved_char = *(curr_char+1);
+            *(curr_char+1) = '\n';
+            part_len = curr_char - copied_ptr + 2;
+            ring_send_fn(dev, copied_ptr, part_len);
+            *(curr_char+1) = saved_char;
+            copied_ptr = curr_char+1;
+            length -= part_len - 1;
+        }
+    }
+
+    if (copied_ptr[length-1] == '\n') {
+        copied_ptr[length-1] = '\r';
+        copied_ptr[length] = '\n';
+        length++;
+    }
+    
+    ring_send_fn(dev, copied_ptr, length);
+}
+
+void print(int direct, const char *fmt, va_list args)
+{
+    static char __print_buf[1024];
+    
+    (void)vsnprintf(__print_buf, sizeof(__print_buf), fmt, args);
+
+    if(direct)
+    {
+        (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf), __print_buf);
+        return;
+    } else {
+#ifndef CONFIG_USE_XEN_CONSOLE
+    if(!console_initialised)
+#endif    
+            (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf), __print_buf);
+        
+        console_print(NULL, __print_buf, strlen(__print_buf));
+    }
+}
+
+void printk(const char *fmt, ...)
+{
+    va_list       args;
+    va_start(args, fmt);
+    print(0, fmt, args);
+    va_end(args);        
+}
+
+void xprintk(const char *fmt, ...)
+{
+    va_list       args;
+    va_start(args, fmt);
+    print(1, fmt, args);
+    va_end(args);        
+}
+void init_console(void)
+{   
+    printk("Initialising console ... ");
+    xen_console = xencons_ring_init();
+    console_initialised = 1;
+    /* This is also required to notify the daemon */
+    printk("done.\n");
+}
+
+void suspend_console(void)
+{
+    console_initialised = 0;
+    xencons_ring_fini(xen_console);
+}
+
+void resume_console(void)
+{
+    xencons_ring_resume(xen_console);
+    console_initialised = 1;
+}
 
 DECLARE_WAIT_QUEUE_HEAD(console_queue);
 
diff --git a/console/console.c b/console/console.c
deleted file mode 100644
index 68c8435e..00000000
--- a/console/console.c
+++ /dev/null
@@ -1,177 +0,0 @@
-/* 
- ****************************************************************************
- * (C) 2006 - Grzegorz Milos - Cambridge University
- ****************************************************************************
- *
- *        File: console.h
- *      Author: Grzegorz Milos
- *     Changes: 
- *              
- *        Date: Mar 2006
- * 
- * Environment: Xen Minimal OS
- * Description: Console interface.
- *
- * Handles console I/O. Defines printk.
- *
- ****************************************************************************
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to
- * deal in the Software without restriction, including without limitation the
- * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
- * sell copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- * 
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- * 
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
- * DEALINGS IN THE SOFTWARE.
- */
- 
-#include <mini-os/types.h>
-#include <mini-os/wait.h>
-#include <mini-os/mm.h>
-#include <mini-os/hypervisor.h>
-#include <mini-os/events.h>
-#include <mini-os/os.h>
-#include <mini-os/lib.h>
-#include <mini-os/xenbus.h>
-#include <xen/io/console.h>
-
-
-/* If console not initialised the printk will be sent to xen serial line 
-   NOTE: you need to enable verbose in xen/Rules.mk for it to work. */
-static struct consfront_dev* xen_console = NULL;
-static int console_initialised = 0;
-
-__attribute__((weak)) void console_input(char * buf, unsigned len)
-{
-    if(len > 0)
-    {
-        /* Just repeat what's written */
-        buf[len] = '\0';
-        printk("%s", buf);
-        
-        if(buf[len-1] == '\r')
-            printk("\nNo console input handler.\n");
-    }
-}
-
-#ifndef HAVE_LIBC
-void xencons_rx(char *buf, unsigned len, struct pt_regs *regs)
-{
-    console_input(buf, len);
-}
-
-void xencons_tx(void)
-{
-    /* Do nothing, handled by _rx */
-}
-#endif
-
-
-void console_print(struct consfront_dev *dev, const char *data, int length)
-{
-    char *curr_char, saved_char;
-    char copied_str[length+1];
-    char *copied_ptr;
-    int part_len;
-    int (*ring_send_fn)(struct consfront_dev *dev, const char *data, unsigned length);
-
-    if(!console_initialised)
-        ring_send_fn = xencons_ring_send_no_notify;
-    else
-        ring_send_fn = xencons_ring_send;
-
-    if (dev && dev->is_raw) {
-        ring_send_fn(dev, data, length);
-        return;
-    }
-
-    copied_ptr = copied_str;
-    memcpy(copied_ptr, data, length);
-    for(curr_char = copied_ptr; curr_char < copied_ptr+length-1; curr_char++)
-    {
-        if(*curr_char == '\n')
-        {
-            *curr_char = '\r';
-            saved_char = *(curr_char+1);
-            *(curr_char+1) = '\n';
-            part_len = curr_char - copied_ptr + 2;
-            ring_send_fn(dev, copied_ptr, part_len);
-            *(curr_char+1) = saved_char;
-            copied_ptr = curr_char+1;
-            length -= part_len - 1;
-        }
-    }
-
-    if (copied_ptr[length-1] == '\n') {
-        copied_ptr[length-1] = '\r';
-        copied_ptr[length] = '\n';
-        length++;
-    }
-    
-    ring_send_fn(dev, copied_ptr, length);
-}
-
-void print(int direct, const char *fmt, va_list args)
-{
-    static char __print_buf[1024];
-    
-    (void)vsnprintf(__print_buf, sizeof(__print_buf), fmt, args);
-
-    if(direct)
-    {
-        (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf), __print_buf);
-        return;
-    } else {
-#ifndef CONFIG_USE_XEN_CONSOLE
-    if(!console_initialised)
-#endif    
-            (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf), __print_buf);
-        
-        console_print(NULL, __print_buf, strlen(__print_buf));
-    }
-}
-
-void printk(const char *fmt, ...)
-{
-    va_list       args;
-    va_start(args, fmt);
-    print(0, fmt, args);
-    va_end(args);        
-}
-
-void xprintk(const char *fmt, ...)
-{
-    va_list       args;
-    va_start(args, fmt);
-    print(1, fmt, args);
-    va_end(args);        
-}
-void init_console(void)
-{   
-    printk("Initialising console ... ");
-    xen_console = xencons_ring_init();
-    console_initialised = 1;
-    /* This is also required to notify the daemon */
-    printk("done.\n");
-}
-
-void suspend_console(void)
-{
-    console_initialised = 0;
-    xencons_ring_fini(xen_console);
-}
-
-void resume_console(void)
-{
-    xencons_ring_resume(xen_console);
-    console_initialised = 1;
-}
-- 
2.35.3


