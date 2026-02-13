Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBwlN97zjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92608134A8E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230415.1535896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoI-0001qd-FZ; Fri, 13 Feb 2026 09:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230415.1535896; Fri, 13 Feb 2026 09:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoI-0001mw-Ai; Fri, 13 Feb 2026 09:50:02 +0000
Received: by outflank-mailman (input) for mailman id 1230415;
 Fri, 13 Feb 2026 09:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpoG-0001Na-Iv
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:50:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b9a622a-08c1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 10:49:59 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-aMc26E4sPAy9t4jQ84TMZQ-1; Fri,
 13 Feb 2026 04:49:56 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1714C185FCC3; Fri, 13 Feb 2026 09:49:49 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E4B161800465; Fri, 13 Feb 2026 09:49:47 +0000 (UTC)
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
X-Inumbo-ID: 5b9a622a-08c1-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kwUJ3BjGqSrzivArY1rYym7qexid2kYuXoU98jIvc3E=;
	b=b4RadeaXix8GGAc1IMDIzQmWa5NH+wfN0Cj3XiKaTiQeZH8bErT43QMLAkOflDAaQdPj2o
	PKx1bbni4A/1t4ftcEncbFS9FV0u5G7Rs1DwyGTK6CG8KfWunyPjsYe52L7/bAq+PTHUu7
	aApywLqHyGXVF7N3FV6NplOFzXb0ycI=
X-MC-Unique: aMc26E4sPAy9t4jQ84TMZQ-1
X-Mimecast-MFC-AGG-ID: aMc26E4sPAy9t4jQ84TMZQ_1770976194
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony@xenproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL v2 02/15] ui/spice: Require spice-server >= 0.15.0
Date: Fri, 13 Feb 2026 10:49:21 +0100
Message-ID: <20260213094938.4074478-3-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: Q7ektW2NuJtINGMSgzTHvWLZs-ZcH9gOAmEZ1r_z2HE_1770976194
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:vsementsov@yandex-team.ru,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,redhat.com,xen.org,xenproject.org,habkost.net,kernel.org,lists.xenproject.org,ens-lyon.org,yandex-team.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 92608134A8E
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

For major distributions we have now:

    Debian 13: 0.15.2
    Ubuntu 22.04: 0.15.0
    RHEL-9/CentOS Stream 9: SPICE is removed
    Fedora 42: 0.15.1
    OpenSUSE Leap 15.4: 0.15.0

Time to update the dependancy in QEMU and drop almost all
SPICE_SERVER_VERSION checks.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-2-vsementsov@yandex-team.ru>
---
 meson.build             |  2 +-
 include/ui/qemu-spice.h |  4 ----
 chardev/spice.c         |  6 ------
 hw/display/qxl.c        | 11 ++---------
 ui/spice-display.c      |  8 ++------
 5 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/meson.build b/meson.build
index e8fd77aac00..4af32c3e1f2 100644
--- a/meson.build
+++ b/meson.build
@@ -1326,7 +1326,7 @@ if get_option('spice') \
              .require(pixman.found(),
                       error_message: 'cannot enable SPICE if pixman is not available') \
              .allowed()
-  spice = dependency('spice-server', version: '>=0.14.0',
+  spice = dependency('spice-server', version: '>=0.15.0',
                      required: get_option('spice'),
                      method: 'pkg-config')
 endif
diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index b7d493742c4..8e5e6b2a744 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -34,11 +34,7 @@ int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con);
 int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
                             const char *subject);
 
-#if SPICE_SERVER_VERSION >= 0x000f00 /* release 0.15.0 */
 #define SPICE_HAS_ATTACHED_WORKER 1
-#else
-#define SPICE_HAS_ATTACHED_WORKER 0
-#endif
 
 #else  /* CONFIG_SPICE */
 
diff --git a/chardev/spice.c b/chardev/spice.c
index db53b49da26..39b79d60fb4 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -278,12 +278,6 @@ static void qemu_chr_open_spice_vmc(Chardev *chr,
     }
 
     *be_opened = false;
-#if SPICE_SERVER_VERSION < 0x000e02
-    /* Spice < 0.14.2 doesn't explicitly open smartcard chardev */
-    if (strcmp(type, "smartcard") == 0) {
-        *be_opened = true;
-    }
-#endif
     chr_open(chr, type);
 }
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index f29b736722c..fbba02113f7 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -261,11 +261,6 @@ static void qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
                     QXL_COOKIE_TYPE_POST_LOAD_MONITORS_CONFIG,
                     0));
     } else {
-#if SPICE_SERVER_VERSION < 0x000e02 /* release 0.14.2 */
-        if (qxl->max_outputs) {
-            spice_qxl_set_max_monitors(&qxl->ssd.qxl, qxl->max_outputs);
-        }
-#endif
         qxl->guest_monitors_config = qxl->ram->monitors_config;
         spice_qxl_monitors_config_async(&qxl->ssd.qxl,
                 qxl->ram->monitors_config,
@@ -2109,6 +2104,8 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
     uint8_t* config = qxl->pci.config;
     uint32_t pci_device_rev;
     uint32_t io_size;
+    Error *err = NULL;
+    char device_address[256] = "";
 
     qemu_spice_display_init_common(&qxl->ssd);
     qxl->mode = QXL_MODE_UNDEFINED;
@@ -2208,9 +2205,6 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
         return;
     }
 
-#if SPICE_SERVER_VERSION >= 0x000e02 /* release 0.14.2 */
-    Error *err = NULL;
-    char device_address[256] = "";
     if (qemu_console_fill_device_address(qxl->vga.con,
                                          device_address, sizeof(device_address),
                                          &err)) {
@@ -2221,7 +2215,6 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
     } else {
         error_report_err(err);
     }
-#endif
 
     qemu_add_vm_change_state_handler(qxl_vm_change_state_handler, qxl);
 
diff --git a/ui/spice-display.c b/ui/spice-display.c
index db71e866f89..f2304bb0ce2 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -689,13 +689,11 @@ static int interface_client_monitors_config(QXLInstance *sin,
     if (mc->num_of_monitors > head) {
         info.width  = mc->monitors[head].width;
         info.height = mc->monitors[head].height;
-#if SPICE_SERVER_VERSION >= 0x000e04 /* release 0.14.4 */
         if (mc->flags & VD_AGENT_CONFIG_MONITORS_FLAG_PHYSICAL_SIZE) {
             VDAgentMonitorMM *mm = (void *)&mc->monitors[mc->num_of_monitors];
             info.width_mm = mm[head].width;
             info.height_mm = mm[head].height;
         }
-#endif
     }
 
     trace_qemu_spice_ui_info(ssd->qxl.id, info.width, info.height);
@@ -1393,6 +1391,8 @@ static const DisplayGLCtxOps gl_ctx_ops = {
 static void qemu_spice_display_init_one(QemuConsole *con)
 {
     SimpleSpiceDisplay *ssd = g_new0(SimpleSpiceDisplay, 1);
+    Error *err = NULL;
+    char device_address[256] = "";
 
     qemu_spice_display_init_common(ssd);
 
@@ -1414,9 +1414,6 @@ static void qemu_spice_display_init_one(QemuConsole *con)
     ssd->qxl.base.sif = &dpy_interface.base;
     qemu_spice_add_display_interface(&ssd->qxl, con);
 
-#if SPICE_SERVER_VERSION >= 0x000e02 /* release 0.14.2 */
-    Error *err = NULL;
-    char device_address[256] = "";
     if (qemu_console_fill_device_address(con, device_address, 256, &err)) {
         spice_qxl_set_device_info(&ssd->qxl,
                                   device_address,
@@ -1425,7 +1422,6 @@ static void qemu_spice_display_init_one(QemuConsole *con)
     } else {
         error_report_err(err);
     }
-#endif
 
     qemu_spice_create_host_memslot(ssd);
 
-- 
2.52.0


