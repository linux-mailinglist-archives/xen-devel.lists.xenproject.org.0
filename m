Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FD785640D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 14:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681736.1060709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabUz-0002uO-Ex; Thu, 15 Feb 2024 13:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681736.1060709; Thu, 15 Feb 2024 13:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabUy-0002pz-W1; Thu, 15 Feb 2024 13:09:56 +0000
Received: by outflank-mailman (input) for mailman id 681736;
 Thu, 15 Feb 2024 13:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rabRv-0002yD-Vq
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 13:06:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 130f66a3-cc03-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 14:06:47 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDA8C2218B;
 Thu, 15 Feb 2024 13:06:46 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BD91D139D0;
 Thu, 15 Feb 2024 13:06:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id YX3WLGYMzmXdFQAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 13:06:46 +0000
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
X-Inumbo-ID: 130f66a3-cc03-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708002407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9xMwpWGoJR7DxJ7ry2LqpTZcYdrlw/DDzPveaCxkX4=;
	b=NWTV1O7+qMrKduemySPAi9pxEk50M8lXxylbztxDGFmIAC2mPVX9cfX8X4FcV0WQZV7yNT
	PptQ0VhwJusKelloetHOj+ZTb+loVj9DrhhfGjVmqsHXvZxslmKw5yo2QctiQNYxAIp2BB
	hSAJPpt6iyCPUmervLJZhEfGCtr0vq8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708002406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9xMwpWGoJR7DxJ7ry2LqpTZcYdrlw/DDzPveaCxkX4=;
	b=mGVNtHN0KEiBdxt0vQFpibpCKnOCj+9fkMUNaoUMoljhy4NNRLLV9f5dhxtCRinqpzcq2n
	S8EH6Wmy1gG0pH2yjv2lEAv1sL49QzJv04v5V2K4HDcL8TYPlvZ9BSwvG/m8gRxSU2sWjd
	7jfmgz/QDs4Ez7QJH0DDc8usqZx3wdA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v7 17/21] tools: add 9pfs device to xenstore-stubdom
Date: Thu, 15 Feb 2024 14:05:05 +0100
Message-Id: <20240215130509.24008-18-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240215130509.24008-1-jgross@suse.com>
References: <20240215130509.24008-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=mGVNtHN0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 3.49
X-Rspamd-Queue-Id: EDA8C2218B
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
---
V2:
- add security_model parameter to new libxl function (Jason Andryuk)
V4:
- rename function to libxl_device_9pfs_add() (Anthony Perard)
- use a libxl_device_p9 pointer as parameter (Anthony Perard)
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
index 9a3e702557..44a2205d2b 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -583,6 +583,13 @@
  * libxl_console_add_xenstore() in libxl.
  */
 #define LIBXL_HAVE_CONSOLE_ADD_XENSTORE 1
+
+/*
+ * LIBXL_HAVE_P9_ADD_XENSTORE indicates presence of the function
+ * libxl_device_9pfs_add() in libxl.
+ */
+#define LIBXL_HAVE_P9_ADD_XENSTORE 1
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


