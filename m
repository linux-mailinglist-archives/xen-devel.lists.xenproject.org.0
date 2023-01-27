Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4701867EAA5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 17:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485791.753194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLRQ9-0007V6-Qn; Fri, 27 Jan 2023 16:17:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485791.753194; Fri, 27 Jan 2023 16:17:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLRQ9-0007SO-Na; Fri, 27 Jan 2023 16:17:45 +0000
Received: by outflank-mailman (input) for mailman id 485791;
 Fri, 27 Jan 2023 16:17:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D8Jc=5Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pLRQ7-0007SE-Nc
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 16:17:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f93b420-9e5e-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 17:17:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 112DB220D7;
 Fri, 27 Jan 2023 16:17:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE32E138E3;
 Fri, 27 Jan 2023 16:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tGTFNCT502O5AgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 27 Jan 2023 16:17:40 +0000
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
X-Inumbo-ID: 1f93b420-9e5e-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674836261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fTn5+Q+SWqEwE2uyxIo/eODqZLSuycg85wgwNabMcXk=;
	b=HqKwHTjkanDLKW6KGWWyfh7x6eRJuWNf2BcSByRK6ZmBIkNQYoNbfZiw23hXCk6px++bKg
	zjYEUW3nBRencLpV2if1pW7NyChxKc3ExYCV8Yr8Mvg9iANf6NNwFzM/1YN/fjis1ETzrP
	r+XPpUYwCMpBe8OTwXwYRc59vPzOwIY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3] tools/helpers: don't log errors when trying to load PVH xenstore-stubdom
Date: Fri, 27 Jan 2023 17:17:39 +0100
Message-Id: <20230127161739.5596-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When loading a Xenstore stubdom the loader doesn't know whether the
lo be loaded kernel is a PVH or a PV one. So it tries to load it as
a PVH one first, and if this fails it is loading it as a PV kernel.

This results in errors being logged in case the stubdom is a PV kernel.

Suppress those errors by setting the minimum logging level to
"critical" while trying to load the kernel as PVH.

In case PVH mode and PV mode loading fails, retry PVH mode loading
without changing the log level in order to get the error messages
logged.

Fixes: f89955449c5a ("tools/init-xenstore-domain: support xenstore pvh stubdom")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- retry PVH loading with logging if PV fails, too (Jan Beulich)
V3:
- expand commit message (Jan Beulich)
- expand comment (Andrew Cooper)
---
 tools/helpers/init-xenstore-domain.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 04e351ca29..85cc9e8381 100644
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
@@ -141,19 +143,33 @@ static int build(xc_interface *xch)
         goto err;
     }
 
+    /*
+     * This is a bodge.  We can't currently inspect the kernel's ELF notes
+     * ahead of attempting to construct a domain, so try PVH first, suppressing
+     * errors by setting min level to high, and fall back to PV.
+     */
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
@@ -412,8 +428,6 @@ int main(int argc, char** argv)
     char buf[16], be_path[64], fe_path[64];
     int rv, fd;
     char *maxmem_str = NULL;
-    xentoollog_level minmsglevel = XTL_PROGRESS;
-    xentoollog_logger *logger = NULL;
 
     while ( (opt = getopt_long(argc, argv, "v", options, NULL)) != -1 )
     {
@@ -456,9 +470,7 @@ int main(int argc, char** argv)
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


