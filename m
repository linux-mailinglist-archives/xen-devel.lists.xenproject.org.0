Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9113F67DD46
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 06:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485299.752416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLHgx-0002nK-Eg; Fri, 27 Jan 2023 05:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485299.752416; Fri, 27 Jan 2023 05:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLHgx-0002ld-BJ; Fri, 27 Jan 2023 05:54:27 +0000
Received: by outflank-mailman (input) for mailman id 485299;
 Fri, 27 Jan 2023 05:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pLHgv-0002lV-Km
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 05:54:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cc1a9d8-9e07-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 06:54:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E4AE21C04;
 Fri, 27 Jan 2023 05:54:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9BEB134F5;
 Fri, 27 Jan 2023 05:54:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wWPFMw5n02PENAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 Jan 2023 05:54:22 +0000
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
X-Inumbo-ID: 0cc1a9d8-9e07-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674798863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CNsH2eyRIqDjpt3u1MPsyOiSxETn2lLKo6InDVQ1ypo=;
	b=OlKlScu4SW4kHazrJhOsyQkfJD5Ac88Y+bKFjU5G/6rUMaKwzABVjNoMrbl5P7+1WSbIrh
	oVR225T1xbpLQYSlXIzVV7xdJ9eLVar2X7CPsPdPUH4egHvkSO5AjVINDHRBzoApzfPci0
	/6J8Z1NUU/h+EwLgWbYs/gV5ZhDAPZo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2] tools/helpers: don't log errors when trying to load PVH xenstore-stubdom
Date: Fri, 27 Jan 2023 06:54:21 +0100
Message-Id: <20230127055421.22945-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When loading a Xenstore stubdom the loader doesn't know whether the
lo be loaded kernel is a PVH or a PV one. So it tries to load it as
a PVH one first, and if this fails it is loading it as a PV kernel.

This results in errors being logged in case the stubdom is a PV kernel.

Suppress those errors by setting the minimum logging level to
"critical" while trying to load the kernel as PVH.

Fixes: f89955449c5a ("tools/init-xenstore-domain: support xenstore pvh stubdom")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- retry PVH loading with logging if PV fails, too (Jan Beulich)
---
 tools/helpers/init-xenstore-domain.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 04e351ca29..4e2f8d4da5 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -31,6 +31,8 @@ static int memory;
 static int maxmem;
 static xen_pfn_t console_gfn;
 static xc_evtchn_port_or_error_t console_evtchn;
+static xentoollog_level minmsglevel = XTL_PROGRESS;
+static void *logger;
 
 static struct option options[] = {
     { "kernel", 1, NULL, 'k' },
@@ -141,19 +143,29 @@ static int build(xc_interface *xch)
         goto err;
     }
 
+    /* Try PVH first, suppress errors by setting min level high. */
     dom->container_type = XC_DOM_HVM_CONTAINER;
+    xtl_stdiostream_set_minlevel(logger, XTL_CRITICAL);
     rv = xc_dom_parse_image(dom);
+    xtl_stdiostream_set_minlevel(logger, minmsglevel);
     if ( rv )
     {
         dom->container_type = XC_DOM_PV_CONTAINER;
         rv = xc_dom_parse_image(dom);
         if ( rv )
         {
-            fprintf(stderr, "xc_dom_parse_image failed\n");
-            goto err;
+            /* Retry PVH, now with normal logging level. */
+            dom->container_type = XC_DOM_HVM_CONTAINER;
+            rv = xc_dom_parse_image(dom);
+            if ( rv )
+            {
+                fprintf(stderr, "xc_dom_parse_image failed\n");
+                goto err;
+            }
         }
     }
-    else
+
+    if ( dom->container_type == XC_DOM_HVM_CONTAINER )
     {
         config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
         config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
@@ -412,8 +424,6 @@ int main(int argc, char** argv)
     char buf[16], be_path[64], fe_path[64];
     int rv, fd;
     char *maxmem_str = NULL;
-    xentoollog_level minmsglevel = XTL_PROGRESS;
-    xentoollog_logger *logger = NULL;
 
     while ( (opt = getopt_long(argc, argv, "v", options, NULL)) != -1 )
     {
@@ -456,9 +466,7 @@ int main(int argc, char** argv)
         return 2;
     }
 
-    logger = (xentoollog_logger *)xtl_createlogger_stdiostream(stderr,
-                                                               minmsglevel, 0);
-
+    logger = xtl_createlogger_stdiostream(stderr, minmsglevel, 0);
     xch = xc_interface_open(logger, logger, 0);
     if ( !xch )
     {
-- 
2.35.3


