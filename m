Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGX7J252jGk6ogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E228124335
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227447.1533854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9MV-0002KD-2V; Wed, 11 Feb 2026 12:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227447.1533854; Wed, 11 Feb 2026 12:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9MU-0002IL-VH; Wed, 11 Feb 2026 12:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1227447;
 Wed, 11 Feb 2026 12:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9MT-0001nh-Kb
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:30:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 721b9526-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:30:28 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-KX-bclq4MP2GmkzEZbJ6MA-1; Wed,
 11 Feb 2026 07:30:25 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C3A5D180025C; Wed, 11 Feb 2026 12:30:23 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4D1A3180066F; Wed, 11 Feb 2026 12:30:21 +0000 (UTC)
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
X-Inumbo-ID: 721b9526-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGBq4qMkI/q12TmIhq+tbmp2Snz+Rz/20mUay39k8ag=;
	b=FHRdi0ClHZ5J9lxznEJoELYW/3/R3fJlQzdKwCiQyQm253TS1bCuWG6gRA1vkxspbg9lce
	IIcGyIc8jIQSuhvpuVLNzVe0UcCZBEAiJU01S63h9JFL7a3/jexGU2LFGqBv3TUFMs0nID
	RYJJOwuWZCZqYB2cGFgBOp2I0p/mwMQ=
X-MC-Unique: KX-bclq4MP2GmkzEZbJ6MA-1
X-Mimecast-MFC-AGG-ID: KX-bclq4MP2GmkzEZbJ6MA_1770813024
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 02/14] ui/spice: Require spice-server >= 0.15.0
Date: Wed, 11 Feb 2026 16:29:49 +0400
Message-ID: <20260211123007.3569932-3-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: VoCalRhe8zsb_DYcXXzNBMoSURMpIyTnQ_Lqv3Pf_68_1770813024
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,yandex-team.ru:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:eduardo@habkost.net,m:xen-devel@lists.xenproject.org,m:berrange@redhat.com,m:edgar.iglesias@gmail.com,m:armbru@redhat.com,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:anthony@xenproject.org,m:eblake@redhat.com,m:samuel.thibault@ens-lyon.org,m:alex.bennee@linaro.org,m:philmd@linaro.org,m:sstabellini@kernel.org,m:paul@xen.org,m:vsementsov@yandex-team.ru,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[habkost.net,lists.xenproject.org,redhat.com,gmail.com,xenproject.org,ens-lyon.org,linaro.org,kernel.org,xen.org,yandex-team.ru];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3E228124335
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
index 2d114e90184..9c12e0db601 100644
--- a/meson.build
+++ b/meson.build
@@ -1320,7 +1320,7 @@ if get_option('spice') \
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


