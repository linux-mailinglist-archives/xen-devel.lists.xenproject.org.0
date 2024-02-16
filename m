Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA59858294
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 17:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682283.1061424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb18A-0001Pt-Rh; Fri, 16 Feb 2024 16:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682283.1061424; Fri, 16 Feb 2024 16:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rb18A-0001Mu-Nl; Fri, 16 Feb 2024 16:32:06 +0000
Received: by outflank-mailman (input) for mailman id 682283;
 Fri, 16 Feb 2024 16:32:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LzRM=JZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rb18A-0000EA-2z
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 16:32:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb01f592-cce8-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 17:32:04 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 261C11FD3B;
 Fri, 16 Feb 2024 16:32:04 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E1A5B13343;
 Fri, 16 Feb 2024 16:32:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id I5WaNQOOz2VdVAAAn2gu4w
 (envelope-from <jgross@suse.com>); Fri, 16 Feb 2024 16:32:03 +0000
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
X-Inumbo-ID: eb01f592-cce8-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v8 4/8] tools: add 9pfs device to xenstore-stubdom
Date: Fri, 16 Feb 2024 17:31:35 +0100
Message-Id: <20240216163139.9093-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240216163139.9093-1-jgross@suse.com>
References: <20240216163139.9093-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 261C11FD3B
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

Add a 9pfs device to Xenstore stubdom in order to allow it to do e.g.
logging into a dom0 file.

Use the following parameters for the new device:

- tag = "Xen"
- type = "xen_9pfsd"
- path = "/var/lib/xen/xenstore"
- security-model = "none"

For now don't limit allowed file space or number of files.

Add a new libxl function for adding it similar to the function for
adding the console device.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
V2:
- add security_model parameter to new libxl function (Jason Andryuk)
V4:
- rename function to libxl_device_9pfs_add() (Anthony Perard)
- use a libxl_device_p9 pointer as parameter (Anthony Perard)
V8:
- remove "_XENSTORE" suffix from define (Anthony Perard)
---
 tools/helpers/init-xenstore-domain.c |  7 +++++++
 tools/include/libxl.h                | 15 +++++++++++++++
 tools/libs/light/libxl_9pfs.c        | 16 ++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 140ed610ae..1683438c5c 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -433,6 +433,12 @@ int main(int argc, char** argv)
     int rv, fd;
     char *maxmem_str = NULL;
     libxl_ctx *ctx;
+    libxl_device_p9 p9 = { .backend_domid = 0,
+                           .tag = "Xen",
+                           .path = XEN_LIB_DIR"/xenstore",
+                           .security_model = "none",
+                           .type = LIBXL_P9_TYPE_XEN_9PFSD,
+    };
 
     while ( (opt = getopt_long(argc, argv, "v", options, NULL)) != -1 )
     {
@@ -543,6 +549,7 @@ int main(int argc, char** argv)
     }
     libxl_console_add_xenstore(ctx, domid, 0, console_evtchn, console_gfn,
                                NULL);
+    libxl_device_9pfs_add(ctx, domid, &p9, NULL);
     libxl_ctx_free(ctx);
 
     fd = creat(XEN_RUN_DIR "/xenstored.pid", 0666);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 9a3e702557..804496a9f8 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -583,6 +583,13 @@
  * libxl_console_add_xenstore() in libxl.
  */
 #define LIBXL_HAVE_CONSOLE_ADD_XENSTORE 1
+
+/*
+ * LIBXL_HAVE_P9_ADD indicates presence of the function
+ * libxl_device_9pfs_add() in libxl.
+ */
+#define LIBXL_HAVE_P9_ADD 1
+
 /*
  * libxl ABI compatibility
  *
@@ -2074,6 +2081,14 @@ int libxl_console_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
                                const libxl_asyncop_how *ao_how)
                                LIBXL_EXTERNAL_CALLERS_ONLY;
 
+/* libxl_device_9pfs_add writes the Xenstore entries for a domain's
+ * primary 9pfs device based on domid, and device parameters.
+ * If needed it will start the backend daemon.
+ */
+int libxl_device_9pfs_add(libxl_ctx *ctx, uint32_t domid, libxl_device_p9 *p9,
+                          const libxl_asyncop_how *ao_how)
+                          LIBXL_EXTERNAL_CALLERS_ONLY;
+
 /* May be called with info_r == NULL to check for domain's existence.
  * Returns ERROR_DOMAIN_NOTFOUND if domain does not exist (used to return
  * ERROR_INVAL for this scenario). */
diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index ddeb4f20a7..48f894f070 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -206,6 +206,22 @@ static void libxl__device_p9_add(libxl__egc *egc, uint32_t domid,
         aodev->callback(egc, aodev);
 }
 
+int libxl_device_9pfs_add(libxl_ctx *ctx, uint32_t domid, libxl_device_p9 *p9,
+                          const libxl_asyncop_how *ao_how)
+{
+    AO_CREATE(ctx, domid, ao_how);
+    libxl__ao_device *aodev;
+
+    GCNEW(aodev);
+    libxl__prepare_ao_device(ao, aodev);
+    aodev->action = LIBXL__DEVICE_ACTION_ADD;
+    aodev->callback = device_addrm_aocomplete;
+
+    libxl__device_p9_add(egc, domid, p9, aodev);
+
+    return AO_INPROGRESS;
+}
+
 #define libxl_device_p9_list NULL
 #define libxl_device_p9_compare NULL
 
-- 
2.35.3


