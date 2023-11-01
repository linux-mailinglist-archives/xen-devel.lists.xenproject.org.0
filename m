Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7284B7DDEA9
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626286.976421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7nS-0006Lo-0l; Wed, 01 Nov 2023 09:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626286.976421; Wed, 01 Nov 2023 09:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7nR-0006K9-TS; Wed, 01 Nov 2023 09:45:57 +0000
Received: by outflank-mailman (input) for mailman id 626286;
 Wed, 01 Nov 2023 09:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7dC-0005sN-4K
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:35:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f94e2189-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:35:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 390291F750;
 Wed,  1 Nov 2023 09:35:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0911B13460;
 Wed,  1 Nov 2023 09:35:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0vbUANgbQmVpCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:35:20 +0000
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
X-Inumbo-ID: f94e2189-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wErX+mI9M5W1zZSMWgX1THrvuDdFvzbJX+7TeHAugY=;
	b=M8XlYDPCIN4yQI7dVhoSv4MdaPN+uTAMQJ/C7Ahk02piswSTH+LMe0Ym9QORIQuBQKk8ly
	DFfgeOODy7P9tSKFg/xAASLd8SSb7z8xpMRNrhi37+fHQFm5dqp/9GypFZUgMo/imV1ave
	G7T7FhzT3q0rIQn3ll6HNLk/12dI+mk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 20/29] tools: add 9pfs device to xenstore-stubdom
Date: Wed,  1 Nov 2023 10:33:16 +0100
Message-Id: <20231101093325.30302-21-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a 9pfs device to Xenstore stubdom in order to allow it to do e.g.
logging into a dom0 file.

Use the following parameters for the new device:

- tag = "xen"
- type = "xenlogd"
- path = "/var/lib/xen/xenstore"

For now don't limit allowed file space or number of files.

Add a new libxl function for adding it similar to the function for
adding the console device.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/helpers/init-xenstore-domain.c |  2 ++
 tools/include/libxl.h                | 17 ++++++++++++++++
 tools/libs/light/libxl_9pfs.c        | 29 ++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 140ed610ae..a65abae2ac 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -543,6 +543,8 @@ int main(int argc, char** argv)
     }
     libxl_console_add_xenstore(ctx, domid, 0, console_evtchn, console_gfn,
                                NULL);
+    libxl_p9_add_xenstore(ctx, domid, 0, LIBXL_P9_TYPE_XENLOGD, "xen",
+                          XEN_LIB_DIR"/xenstore", 0, 0, 0, 0, NULL);
     libxl_ctx_free(ctx);
 
     fd = creat(XEN_RUN_DIR "/xenstored.pid", 0666);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 907aa0a330..ab8a67f50a 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -583,6 +583,13 @@
  * libxl_console_add_xenstore() in libxl.
  */
 #define LIBXL_HAVE_CONSOLE_ADD_XENSTORE 1
+
+/*
+ * LIBXL_HAVE_P9_ADD_XENSTORE indicates presence of the function
+ * libxl_p9_add_xenstore() in libxl.
+ */
+#define LIBXL_HAVE_P9_ADD_XENSTORE 1
+
 /*
  * libxl ABI compatibility
  *
@@ -2060,6 +2067,16 @@ int libxl_console_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
                                const libxl_asyncop_how *ao_how)
                                LIBXL_EXTERNAL_CALLERS_ONLY;
 
+/* libxl_p9_add_xenstore writes the Xenstore entries for a domain's
+ * primary 9pfs device based on domid, backend type and device parameters.
+ */
+int libxl_p9_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
+                          libxl_p9_type type, char *tag, char *path,
+                          unsigned int max_space, unsigned int max_files,
+                          unsigned int max_open_files, bool auto_delete,
+                          const libxl_asyncop_how *ao_how)
+                          LIBXL_EXTERNAL_CALLERS_ONLY;
+
 /* May be called with info_r == NULL to check for domain's existence.
  * Returns ERROR_DOMAIN_NOTFOUND if domain does not exist (used to return
  * ERROR_INVAL for this scenario). */
diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index 0b9d84dce9..3297389493 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -174,6 +174,35 @@ static void libxl__device_p9_add(libxl__egc *egc, uint32_t domid,
         aodev->callback(egc, aodev);
 }
 
+int libxl_p9_add_xenstore(libxl_ctx *ctx, uint32_t domid, uint32_t backend,
+                          libxl_p9_type type, char *tag, char *path,
+                          unsigned int max_space, unsigned int max_files,
+                          unsigned int max_open_files, bool auto_delete,
+                          const libxl_asyncop_how *ao_how)
+{
+    AO_CREATE(ctx, domid, ao_how);
+    libxl__ao_device *aodev;
+    libxl_device_p9 p9 = { .backend_domid = backend,
+                           .tag = tag,
+                           .path = path,
+                           .security_model = "none",
+                           .type = type,
+                           .max_space = max_space,
+                           .max_files = max_files,
+                           .max_open_files = max_open_files,
+                           .auto_delete = auto_delete,
+                         };
+
+    GCNEW(aodev);
+    libxl__prepare_ao_device(ao, aodev);
+    aodev->action = LIBXL__DEVICE_ACTION_ADD;
+    aodev->callback = device_addrm_aocomplete;
+
+    libxl__device_p9_add(egc, domid, &p9, aodev);
+
+    return AO_INPROGRESS;
+}
+
 #define libxl_device_p9_list NULL
 #define libxl_device_p9_compare NULL
 
-- 
2.35.3


