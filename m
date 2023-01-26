Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5467CADF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485019.751940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1IY-0004DU-Oa; Thu, 26 Jan 2023 12:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485019.751940; Thu, 26 Jan 2023 12:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL1IY-0004BF-LB; Thu, 26 Jan 2023 12:24:10 +0000
Received: by outflank-mailman (input) for mailman id 485019;
 Thu, 26 Jan 2023 12:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WJ2g=5X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pL1IX-0004B4-9V
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 12:24:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d0c634-9d74-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 13:24:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17F6E1FF3F;
 Thu, 26 Jan 2023 12:24:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E268713A09;
 Thu, 26 Jan 2023 12:24:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OcDLNedw0mNkPgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 26 Jan 2023 12:24:07 +0000
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
X-Inumbo-ID: 54d0c634-9d74-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674735848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7jcdb0fhmVXMQ4Aeze9M9Ly9YtBIBMGWZvJo0VuLWZE=;
	b=gmqoY3ucf8w1MoqseMCGVu7Hg/Acz5FTf3ykuEdG73Gwn+cgTw+M9GSp1WdUlEsB5PzuG4
	LpVIUwgUwEbrd50+hO6ctx7TXYr03DPWbOkzcA9TW990I28/uWanrEsiQHa/x1ueSSj1ec
	LaEGzOH8yoIORxXwcqrKy5RFxsln4VU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/helpers: don't log errors when trying to load PVH xenstore-stubdom
Date: Thu, 26 Jan 2023 13:24:06 +0100
Message-Id: <20230126122406.14627-1-jgross@suse.com>
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
 tools/helpers/init-xenstore-domain.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 04e351ca29..c323cf7456 100644
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
@@ -141,8 +143,11 @@ static int build(xc_interface *xch)
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
@@ -412,8 +417,6 @@ int main(int argc, char** argv)
     char buf[16], be_path[64], fe_path[64];
     int rv, fd;
     char *maxmem_str = NULL;
-    xentoollog_level minmsglevel = XTL_PROGRESS;
-    xentoollog_logger *logger = NULL;
 
     while ( (opt = getopt_long(argc, argv, "v", options, NULL)) != -1 )
     {
@@ -456,9 +459,7 @@ int main(int argc, char** argv)
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


