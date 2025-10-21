Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D1BF6706
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 14:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147119.1479390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBBRF-0002Ay-TK; Tue, 21 Oct 2025 12:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147119.1479390; Tue, 21 Oct 2025 12:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBBRF-00028F-PH; Tue, 21 Oct 2025 12:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1147119;
 Tue, 21 Oct 2025 12:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qZV1=46=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vBBRD-00027u-EW
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 12:26:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 173a6322-ae79-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 14:25:56 +0200 (CEST)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-QJMlkcGONb-U-PWRl8c44g-1; Tue,
 21 Oct 2025 08:25:51 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BCA8B1800345; Tue, 21 Oct 2025 12:25:44 +0000 (UTC)
Received: from localhost (unknown [10.44.22.9])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A8351180044F; Tue, 21 Oct 2025 12:25:36 +0000 (UTC)
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
X-Inumbo-ID: 173a6322-ae79-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761049555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vbBkFIIDHQS08D0JuzSR3QUT6yTHsOMMFwKh54OcSe8=;
	b=XgIy5PcmbW8vt4+vjuX4QMythU5ANid3XK0lNq4xzWF8SPRuwPU38UDHr4FJiXHUI65y9l
	ohuf16FWvzmrvsyoCRuXIfLDL7AAHf6xh2zEJB7c/mN8kyJph8d5BCU3hPFlB4R0JvfF1d
	9XORVnS+YNaMymdNUTGwyj37F7qOAqc=
X-MC-Unique: QJMlkcGONb-U-PWRl8c44g-1
X-Mimecast-MFC-AGG-ID: QJMlkcGONb-U-PWRl8c44g_1761049546
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Zhenwei Pi <pizhenwei@bytedance.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Amit Shah <amit@kernel.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
	Frederic Konrad <konrad.frederic@yahoo.fr>,
	Alberto Garcia <berto@igalia.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Collin L. Walling" <walling@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Corey Minyard <minyard@acm.org>,
	Paul Burton <paulburton@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Vijai Kumar K <vijai@behindbytes.com>,
	Samuel Tardieu <sam@rfc1149.net>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Raphael Norwitz <raphael@enfabrica.net>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	mzamazal@redhat.com (reviewer:vhost-user-scmi),
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Fabiano Rosas <farosas@suse.de>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Zhang Chen <zhangckid@gmail.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Jason Wang <jasowang@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Lukas Straub <lukasstraub2@web.de>,
	qemu-arm@nongnu.org (open list:Sharp SL-5500 Co...),
	qemu-s390x@nongnu.org (open list:S390 SCLP-backed...),
	qemu-ppc@nongnu.org (open list:sPAPR (pseries)),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
	virtio-fs@lists.linux.dev (open list:virtiofs),
	qemu-rust@nongnu.org (open list:Rust-related patc...)
Subject: [PATCH] char: rename CharBackend->CharFrontend
Date: Tue, 21 Oct 2025 16:25:31 +0400
Message-ID: <20251021122533.721467-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The actual backend is "Chardev", CharBackend is the frontend side of it,
let's rename it for readability.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/chardev-internal.h           |  12 +-
 include/chardev/char-fe.h            |  67 +++++----
 include/chardev/char.h               |   4 +-
 include/hw/char/avr_usart.h          |   2 +-
 include/hw/char/bcm2835_aux.h        |   2 +-
 include/hw/char/cadence_uart.h       |   2 +-
 include/hw/char/cmsdk-apb-uart.h     |   2 +-
 include/hw/char/digic-uart.h         |   2 +-
 include/hw/char/escc.h               |   2 +-
 include/hw/char/goldfish_tty.h       |   2 +-
 include/hw/char/ibex_uart.h          |   2 +-
 include/hw/char/imx_serial.h         |   2 +-
 include/hw/char/max78000_uart.h      |   2 +-
 include/hw/char/nrf51_uart.h         |   2 +-
 include/hw/char/parallel.h           |   2 +-
 include/hw/char/pl011.h              |   2 +-
 include/hw/char/renesas_sci.h        |   2 +-
 include/hw/char/riscv_htif.h         |   2 +-
 include/hw/char/serial.h             |   2 +-
 include/hw/char/shakti_uart.h        |   2 +-
 include/hw/char/sifive_uart.h        |   2 +-
 include/hw/char/stm32f2xx_usart.h    |   2 +-
 include/hw/char/stm32l4x5_usart.h    |   2 +-
 include/hw/misc/ivshmem-flat.h       |   2 +-
 include/hw/qdev-properties-system.h  |   2 +-
 include/hw/virtio/vhost-user-base.h  |   2 +-
 include/hw/virtio/vhost-user-blk.h   |   2 +-
 include/hw/virtio/vhost-user-fs.h    |   2 +-
 include/hw/virtio/vhost-user-scmi.h  |   2 +-
 include/hw/virtio/vhost-user-vsock.h |   2 +-
 include/hw/virtio/vhost-user.h       |   8 +-
 include/hw/virtio/virtio-gpu.h       |   2 +-
 include/hw/virtio/virtio-scsi.h      |   2 +-
 include/system/qtest.h               |   4 +-
 include/system/vhost-user-backend.h  |   2 +-
 monitor/monitor-internal.h           |   2 +-
 backends/cryptodev-vhost-user.c      |   2 +-
 backends/rng-egd.c                   |   2 +-
 backends/tpm/tpm_emulator.c          |   4 +-
 chardev/char-fe.c                    | 142 +++++++++----------
 chardev/char-hub.c                   |  18 +--
 chardev/char-mux.c                   |  40 +++---
 chardev/char.c                       |   8 +-
 gdbstub/system.c                     |   2 +-
 hw/arm/strongarm.c                   |   2 +-
 hw/char/debugcon.c                   |   2 +-
 hw/char/exynos4210_uart.c            |   2 +-
 hw/char/grlib_apbuart.c              |   2 +-
 hw/char/ipoctal232.c                 |   2 +-
 hw/char/mcf_uart.c                   |   2 +-
 hw/char/sclpconsole-lm.c             |   2 +-
 hw/char/sclpconsole.c                |   2 +-
 hw/char/sh_serial.c                  |   2 +-
 hw/char/spapr_vty.c                  |   2 +-
 hw/char/terminal3270.c               |   2 +-
 hw/char/virtio-console.c             |   2 +-
 hw/char/xen_console.c                |   2 +-
 hw/char/xilinx_uartlite.c            |   2 +-
 hw/core/qdev-properties-system.c     |  16 +--
 hw/ipmi/ipmi_bmc_extern.c            |   2 +-
 hw/mips/boston.c                     |   2 +-
 hw/mips/malta.c                      |   2 +-
 hw/misc/ivshmem-pci.c                |   2 +-
 hw/ppc/spapr_rtas.c                  |   2 +-
 hw/riscv/riscv_hart.c                |   2 +-
 hw/usb/ccid-card-passthru.c          |   2 +-
 hw/usb/dev-serial.c                  |   2 +-
 hw/usb/redirect.c                    |   2 +-
 hw/virtio/vhost-stub.c               |   2 +-
 hw/virtio/vhost-user.c               |  20 +--
 net/colo-compare.c                   |  10 +-
 net/filter-mirror.c                  |   4 +-
 net/passt.c                          |   2 +-
 net/slirp.c                          |   2 +-
 net/vhost-user.c                     |   2 +-
 semihosting/console.c                |   6 +-
 system/qtest.c                       |  20 +--
 target/hppa/sys_helper.c             |   2 +-
 target/xtensa/xtensa-semi.c          |   2 +-
 tests/qtest/vhost-user-test.c        |  16 +--
 tests/unit/test-char.c               | 198 +++++++++++++--------------
 tests/unit/test-yank.c               |  12 +-
 rust/bindings/src/lib.rs             |   4 +-
 rust/chardev/src/bindings.rs         |   6 +-
 rust/chardev/src/chardev.rs          |  26 ++--
 rust/hw/char/pl011/src/device.rs     |  12 +-
 rust/hw/core/src/qdev.rs             |   2 +-
 87 files changed, 392 insertions(+), 393 deletions(-)

diff --git a/chardev/chardev-internal.h b/chardev/chardev-internal.h
index 9752dd75f7..8ea10414ab 100644
--- a/chardev/chardev-internal.h
+++ b/chardev/chardev-internal.h
@@ -37,9 +37,9 @@
 struct MuxChardev {
     Chardev parent;
     /* Linked frontends */
-    CharBackend *backends[MAX_MUX];
-    /* Linked backend */
-    CharBackend chr;
+    CharFrontend *frontends[MAX_MUX];
+    /* frontend of the underlying muxed chardev */
+    CharFrontend chr;
     unsigned long mux_bitset;
     int focus;
     bool term_got_escape;
@@ -64,8 +64,8 @@ typedef struct HubCharBackend HubCharBackend;
  * `hub->backends` array
  */
 struct HubCharBackend {
-    HubChardev   *hub;
-    CharBackend  be;
+    HubChardev *hub;
+    CharFrontend fe;
     unsigned int be_ind;
 };
 
@@ -108,7 +108,7 @@ DECLARE_INSTANCE_CHECKER(HubChardev, HUB_CHARDEV,
 #define CHARDEV_IS_HUB(chr)                                \
     object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_HUB)
 
-bool mux_chr_attach_frontend(MuxChardev *d, CharBackend *b,
+bool mux_chr_attach_frontend(MuxChardev *d, CharFrontend *c,
                              unsigned int *tag, Error **errp);
 bool mux_chr_detach_frontend(MuxChardev *d, unsigned int tag);
 void mux_set_focus(Chardev *chr, unsigned int focus);
diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 8ef05b3dd0..cb28692f38 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -8,12 +8,12 @@ typedef void IOEventHandler(void *opaque, QEMUChrEvent event);
 typedef int BackendChangeHandler(void *opaque);
 
 /**
- * struct CharBackend - back end as seen by front end
+ * struct CharFrontend - back end as seen by front end
  * @fe_is_open: the front end is ready for IO
  *
  * The actual backend is Chardev
  */
-struct CharBackend {
+struct CharFrontend {
     Chardev *chr;
     IOEventHandler *chr_event;
     IOCanReadHandler *chr_can_read;
@@ -27,53 +27,52 @@ struct CharBackend {
 /**
  * qemu_chr_fe_init:
  *
- * Initializes a front end for the given CharBackend and
- * Chardev. Call qemu_chr_fe_deinit() to remove the association and
- * release the driver.
+ * Initializes the frontend @c for the given Chardev backend @s. Call
+ * qemu_chr_fe_deinit() to remove the association and release the backend.
  *
  * Returns: false on error.
  */
-bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp);
+bool qemu_chr_fe_init(CharFrontend *c, Chardev *s, Error **errp);
 
 /**
  * qemu_chr_fe_deinit:
- * @b: a CharBackend
+ * @c: a CharFrontend
  * @del: if true, delete the chardev backend
 *
- * Dissociate the CharBackend from the Chardev.
+ * Dissociate the CharFrontend from the Chardev.
  *
  * Safe to call without associated Chardev.
  */
-void qemu_chr_fe_deinit(CharBackend *b, bool del);
+void qemu_chr_fe_deinit(CharFrontend *c, bool del);
 
 /**
  * qemu_chr_fe_get_driver:
  *
- * Returns: the driver associated with a CharBackend or NULL if no
+ * Returns: the driver associated with a CharFrontend or NULL if no
  * associated Chardev.
  * Note: avoid this function as the driver should never be accessed directly,
  *       especially by the frontends that support chardevice hotswap.
  *       Consider qemu_chr_fe_backend_connected() to check for driver existence
  */
-Chardev *qemu_chr_fe_get_driver(CharBackend *be);
+Chardev *qemu_chr_fe_get_driver(CharFrontend *c);
 
 /**
  * qemu_chr_fe_backend_connected:
  *
- * Returns: true if there is a chardevice associated with @be.
+ * Returns: true if there is a chardevice associated with @c.
  */
-bool qemu_chr_fe_backend_connected(CharBackend *be);
+bool qemu_chr_fe_backend_connected(CharFrontend *c);
 
 /**
  * qemu_chr_fe_backend_open:
  *
- * Returns: true if chardevice associated with @be is open.
+ * Returns: true if chardevice associated with @c is open.
  */
-bool qemu_chr_fe_backend_open(CharBackend *be);
+bool qemu_chr_fe_backend_open(CharFrontend *c);
 
 /**
  * qemu_chr_fe_set_handlers_full:
- * @b: a CharBackend
+ * @c: a CharFrontend
  * @fd_can_read: callback to get the amount of data the frontend may
  *               receive
  * @fd_read: callback to receive data from char
@@ -91,7 +90,7 @@ bool qemu_chr_fe_backend_open(CharBackend *be);
  *
  * Without associated Chardev, nothing is changed.
  */
-void qemu_chr_fe_set_handlers_full(CharBackend *b,
+void qemu_chr_fe_set_handlers_full(CharFrontend *c,
                                    IOCanReadHandler *fd_can_read,
                                    IOReadHandler *fd_read,
                                    IOEventHandler *fd_event,
@@ -106,7 +105,7 @@ void qemu_chr_fe_set_handlers_full(CharBackend *b,
  *
  * Version of qemu_chr_fe_set_handlers_full() with sync_state = true.
  */
-void qemu_chr_fe_set_handlers(CharBackend *b,
+void qemu_chr_fe_set_handlers(CharFrontend *c,
                               IOCanReadHandler *fd_can_read,
                               IOReadHandler *fd_read,
                               IOEventHandler *fd_event,
@@ -122,14 +121,14 @@ void qemu_chr_fe_set_handlers(CharBackend *b,
  *
  * Without associated Chardev, nothing is changed.
  */
-void qemu_chr_fe_take_focus(CharBackend *b);
+void qemu_chr_fe_take_focus(CharFrontend *c);
 
 /**
  * qemu_chr_fe_accept_input:
  *
  * Notify that the frontend is ready to receive data
  */
-void qemu_chr_fe_accept_input(CharBackend *be);
+void qemu_chr_fe_accept_input(CharFrontend *c);
 
 /**
  * qemu_chr_fe_disconnect:
@@ -137,7 +136,7 @@ void qemu_chr_fe_accept_input(CharBackend *be);
  * Close a fd accepted by character backend.
  * Without associated Chardev, do nothing.
  */
-void qemu_chr_fe_disconnect(CharBackend *be);
+void qemu_chr_fe_disconnect(CharFrontend *c);
 
 /**
  * qemu_chr_fe_wait_connected:
@@ -145,7 +144,7 @@ void qemu_chr_fe_disconnect(CharBackend *be);
  * Wait for character backend to be connected, return < 0 on error or
  * if no associated Chardev.
  */
-int qemu_chr_fe_wait_connected(CharBackend *be, Error **errp);
+int qemu_chr_fe_wait_connected(CharFrontend *c, Error **errp);
 
 /**
  * qemu_chr_fe_set_echo:
@@ -156,17 +155,17 @@ int qemu_chr_fe_wait_connected(CharBackend *be, Error **errp);
  * can see what you type if you try to type QMP commands.
  * Without associated Chardev, do nothing.
  */
-void qemu_chr_fe_set_echo(CharBackend *be, bool echo);
+void qemu_chr_fe_set_echo(CharFrontend *c, bool echo);
 
 /**
  * qemu_chr_fe_set_open:
- * @be: a CharBackend
+ * @c: a CharFrontend
  * @is_open: the front end open status
  *
  * This is an indication that the front end is ready (or not) to begin
  * doing I/O. Without associated Chardev, do nothing.
  */
-void qemu_chr_fe_set_open(CharBackend *be, bool is_open);
+void qemu_chr_fe_set_open(CharFrontend *c, bool is_open);
 
 /**
  * qemu_chr_fe_printf:
@@ -176,7 +175,7 @@ void qemu_chr_fe_set_open(CharBackend *be, bool is_open);
  * function is thread-safe. It does nothing without associated
  * Chardev.
  */
-void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
+void qemu_chr_fe_printf(CharFrontend *c, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
 
@@ -215,7 +214,7 @@ typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condition, void *
  *
  * Returns: the source tag
  */
-guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
+guint qemu_chr_fe_add_watch(CharFrontend *c, GIOCondition cond,
                             FEWatchFunc func, void *user_data);
 
 /**
@@ -230,7 +229,7 @@ guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
  * Returns: the number of bytes consumed (0 if no associated Chardev)
  *          or -1 on error.
  */
-int qemu_chr_fe_write(CharBackend *be, const uint8_t *buf, int len);
+int qemu_chr_fe_write(CharFrontend *c, const uint8_t *buf, int len);
 
 /**
  * qemu_chr_fe_write_all:
@@ -245,7 +244,7 @@ int qemu_chr_fe_write(CharBackend *be, const uint8_t *buf, int len);
  * Returns: the number of bytes consumed (0 if no associated Chardev)
  *          or -1 on error.
  */
-int qemu_chr_fe_write_all(CharBackend *be, const uint8_t *buf, int len);
+int qemu_chr_fe_write_all(CharFrontend *c, const uint8_t *buf, int len);
 
 /**
  * qemu_chr_fe_read_all:
@@ -257,7 +256,7 @@ int qemu_chr_fe_write_all(CharBackend *be, const uint8_t *buf, int len);
  * Returns: the number of bytes read (0 if no associated Chardev)
  *          or -1 on error.
  */
-int qemu_chr_fe_read_all(CharBackend *be, uint8_t *buf, int len);
+int qemu_chr_fe_read_all(CharFrontend *c, uint8_t *buf, int len);
 
 /**
  * qemu_chr_fe_ioctl:
@@ -270,7 +269,7 @@ int qemu_chr_fe_read_all(CharBackend *be, uint8_t *buf, int len);
  *          associated Chardev, -ENOTSUP, otherwise the return
  *          value depends on the semantics of @cmd
  */
-int qemu_chr_fe_ioctl(CharBackend *be, int cmd, void *arg);
+int qemu_chr_fe_ioctl(CharFrontend *c, int cmd, void *arg);
 
 /**
  * qemu_chr_fe_get_msgfd:
@@ -283,7 +282,7 @@ int qemu_chr_fe_ioctl(CharBackend *be, int cmd, void *arg);
  *          this function will return -1 until a client sends a new file
  *          descriptor.
  */
-int qemu_chr_fe_get_msgfd(CharBackend *be);
+int qemu_chr_fe_get_msgfd(CharFrontend *c);
 
 /**
  * qemu_chr_fe_get_msgfds:
@@ -296,7 +295,7 @@ int qemu_chr_fe_get_msgfd(CharBackend *be);
  *          this function will return -1 until a client sends a new set of file
  *          descriptors.
  */
-int qemu_chr_fe_get_msgfds(CharBackend *be, int *fds, int num);
+int qemu_chr_fe_get_msgfds(CharFrontend *c, int *fds, int num);
 
 /**
  * qemu_chr_fe_set_msgfds:
@@ -309,6 +308,6 @@ int qemu_chr_fe_get_msgfds(CharBackend *be, int *fds, int num);
  *
  * Returns: -1 if fd passing isn't supported or no associated Chardev.
  */
-int qemu_chr_fe_set_msgfds(CharBackend *be, int *fds, int num);
+int qemu_chr_fe_set_msgfds(CharFrontend *c, int *fds, int num);
 
 #endif /* QEMU_CHAR_FE_H */
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 429852f8d9..d7da966548 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -15,7 +15,7 @@
 #define IAC 255
 
 /* character device */
-typedef struct CharBackend CharBackend;
+typedef struct CharFrontend CharFrontend;
 
 typedef enum {
     CHR_EVENT_BREAK, /* serial break char */
@@ -60,7 +60,7 @@ struct Chardev {
     Object parent_obj;
 
     QemuMutex chr_write_lock;
-    CharBackend *be;
+    CharFrontend *be;
     char *label;
     char *filename;
     int logfd;
diff --git a/include/hw/char/avr_usart.h b/include/hw/char/avr_usart.h
index 0cc599e9b1..bd2d488f9a 100644
--- a/include/hw/char/avr_usart.h
+++ b/include/hw/char/avr_usart.h
@@ -66,7 +66,7 @@ struct AVRUsartState {
     /* <public> */
     MemoryRegion mmio;
 
-    CharBackend chr;
+    CharFrontend chr;
 
     bool enabled;
 
diff --git a/include/hw/char/bcm2835_aux.h b/include/hw/char/bcm2835_aux.h
index 9e081793a0..a11134f216 100644
--- a/include/hw/char/bcm2835_aux.h
+++ b/include/hw/char/bcm2835_aux.h
@@ -24,7 +24,7 @@ struct BCM2835AuxState {
     /*< public >*/
 
     MemoryRegion iomem;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
 
     uint8_t read_fifo[BCM2835_AUX_RX_FIFO_LEN];
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
index e7f7cd8468..c87c327357 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -47,7 +47,7 @@ struct CadenceUARTState {
     uint32_t rx_count;
     uint32_t tx_count;
     uint64_t char_tx_time;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
     QEMUTimer *fifo_trigger_handle;
     Clock *refclk;
diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
index 7de8f8d1b9..3d0af26ceb 100644
--- a/include/hw/char/cmsdk-apb-uart.h
+++ b/include/hw/char/cmsdk-apb-uart.h
@@ -25,7 +25,7 @@ struct CMSDKAPBUART {
 
     /*< public >*/
     MemoryRegion iomem;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq txint;
     qemu_irq rxint;
     qemu_irq txovrint;
diff --git a/include/hw/char/digic-uart.h b/include/hw/char/digic-uart.h
index f710a1a099..3eebdab8a0 100644
--- a/include/hw/char/digic-uart.h
+++ b/include/hw/char/digic-uart.h
@@ -38,7 +38,7 @@ struct DigicUartState {
     /*< public >*/
 
     MemoryRegion regs_region;
-    CharBackend chr;
+    CharFrontend chr;
 
     uint32_t reg_rx;
     uint32_t reg_st;
diff --git a/include/hw/char/escc.h b/include/hw/char/escc.h
index 8c4c6a7730..857f64699e 100644
--- a/include/hw/char/escc.h
+++ b/include/hw/char/escc.h
@@ -36,7 +36,7 @@ typedef struct ESCCChannelState {
     uint32_t reg;
     uint8_t wregs[ESCC_SERIAL_REGS], rregs[ESCC_SERIAL_REGS];
     ESCCSERIOQueue queue;
-    CharBackend chr;
+    CharFrontend chr;
     int e0_mode, led_mode, caps_lock_mode, num_lock_mode;
     int disabled;
     int clock;
diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
index d59733e5ae..70fdedd1d0 100644
--- a/include/hw/char/goldfish_tty.h
+++ b/include/hw/char/goldfish_tty.h
@@ -24,7 +24,7 @@ struct GoldfishTTYState {
 
     MemoryRegion iomem;
     qemu_irq irq;
-    CharBackend chr;
+    CharFrontend chr;
 
     uint32_t data_len;
     uint64_t data_ptr;
diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index 9deadf223b..1ccbb602e6 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -64,7 +64,7 @@ struct IbexUartState {
 
     Clock *f_clk;
 
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq tx_watermark;
     qemu_irq rx_watermark;
     qemu_irq tx_empty;
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index 90ba3ff18c..2dcd2e6bcd 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -122,7 +122,7 @@ struct IMXSerialState {
     uint32_t ucr4;
 
     qemu_irq irq;
-    CharBackend chr;
+    CharFrontend chr;
 };
 
 #endif
diff --git a/include/hw/char/max78000_uart.h b/include/hw/char/max78000_uart.h
index cf90d51dbf..ac93f83389 100644
--- a/include/hw/char/max78000_uart.h
+++ b/include/hw/char/max78000_uart.h
@@ -72,7 +72,7 @@ struct Max78000UartState {
 
     Fifo8 rx_fifo;
 
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
 };
 #endif /* HW_STM32F2XX_USART_H */
diff --git a/include/hw/char/nrf51_uart.h b/include/hw/char/nrf51_uart.h
index 561b6383c4..03d8c2a20d 100644
--- a/include/hw/char/nrf51_uart.h
+++ b/include/hw/char/nrf51_uart.h
@@ -59,7 +59,7 @@ struct NRF51UARTState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
     guint watch_tag;
 
diff --git a/include/hw/char/parallel.h b/include/hw/char/parallel.h
index 7b04478226..3f8d9b59a7 100644
--- a/include/hw/char/parallel.h
+++ b/include/hw/char/parallel.h
@@ -15,7 +15,7 @@ typedef struct ParallelState {
     uint8_t control;
     qemu_irq irq;
     int irq_pending;
-    CharBackend chr;
+    CharFrontend chr;
     int hw_driver;
     int epp_timeout;
     uint32_t last_read_offset; /* For debugging */
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 299ca9b18b..2d4ff01c81 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -47,7 +47,7 @@ struct PL011State {
     int read_pos;
     int read_count;
     int read_trigger;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq[6];
     Clock *clk;
     bool migrate_clk;
diff --git a/include/hw/char/renesas_sci.h b/include/hw/char/renesas_sci.h
index a4764e3eee..90e784f36a 100644
--- a/include/hw/char/renesas_sci.h
+++ b/include/hw/char/renesas_sci.h
@@ -33,7 +33,7 @@ struct RSCIState {
 
     MemoryRegion memory;
     QEMUTimer timer;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq[SCI_NR_IRQ];
 
     uint8_t smr;
diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index ee0ca29902..9d61e60d0a 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -36,7 +36,7 @@ typedef struct HTIFState {
     hwaddr fromhost_offset;
     MemoryRegion mmio;
 
-    CharBackend chr;
+    CharFrontend chr;
     uint64_t pending_read;
 } HTIFState;
 
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 4bf90a46f3..486c0e0f35 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -54,7 +54,7 @@ struct SerialState {
        it can be reset while reading iir */
     int thr_ipending;
     qemu_irq irq;
-    CharBackend chr;
+    CharFrontend chr;
     int last_break_enable;
     uint32_t baudbase;
     uint32_t tsr_retry;
diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
index 526c408233..e5e775d7c9 100644
--- a/include/hw/char/shakti_uart.h
+++ b/include/hw/char/shakti_uart.h
@@ -68,7 +68,7 @@ typedef struct {
     uint32_t uart_iq_cycles;
     uint32_t uart_rx_threshold;
 
-    CharBackend chr;
+    CharFrontend chr;
 } ShaktiUartState;
 
 #endif /* HW_SHAKTI_UART_H */
diff --git a/include/hw/char/sifive_uart.h b/include/hw/char/sifive_uart.h
index 0846cf6218..6486c3f4a5 100644
--- a/include/hw/char/sifive_uart.h
+++ b/include/hw/char/sifive_uart.h
@@ -67,7 +67,7 @@ struct SiFiveUARTState {
     /*< public >*/
     qemu_irq irq;
     MemoryRegion mmio;
-    CharBackend chr;
+    CharFrontend chr;
 
     uint32_t txfifo;
     uint32_t ie;
diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f2xx_usart.h
index fdfa7424a7..f9018b8b8f 100644
--- a/include/hw/char/stm32f2xx_usart.h
+++ b/include/hw/char/stm32f2xx_usart.h
@@ -73,7 +73,7 @@ struct STM32F2XXUsartState {
     uint32_t usart_cr3;
     uint32_t usart_gtpr;
 
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
 };
 #endif /* HW_STM32F2XX_USART_H */
diff --git a/include/hw/char/stm32l4x5_usart.h b/include/hw/char/stm32l4x5_usart.h
index dd3866682a..cdf7419f53 100644
--- a/include/hw/char/stm32l4x5_usart.h
+++ b/include/hw/char/stm32l4x5_usart.h
@@ -53,7 +53,7 @@ struct Stm32l4x5UsartBaseState {
     uint32_t tdr;
 
     Clock *clk;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
     guint watch_tag;
 };
diff --git a/include/hw/misc/ivshmem-flat.h b/include/hw/misc/ivshmem-flat.h
index 3eca99004e..d656e57808 100644
--- a/include/hw/misc/ivshmem-flat.h
+++ b/include/hw/misc/ivshmem-flat.h
@@ -65,7 +65,7 @@ struct IvshmemFTState {
     QTAILQ_HEAD(, IvshmemPeer) peer;
     IvshmemPeer own;
 
-    CharBackend server_chr;
+    CharFrontend server_chr;
 
     /* IRQ */
     qemu_irq irq;
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 9601a11a09..5c6cc5eae8 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -38,7 +38,7 @@ extern const PropertyInfo qdev_prop_virtio_gpu_output_list;
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
 
 #define DEFINE_PROP_CHR(_n, _s, _f)             \
-    DEFINE_PROP(_n, _s, _f, qdev_prop_chr, CharBackend)
+    DEFINE_PROP(_n, _s, _f, qdev_prop_chr, CharFrontend)
 #define DEFINE_PROP_NETDEV(_n, _s, _f)             \
     DEFINE_PROP(_n, _s, _f, qdev_prop_netdev, NICPeers)
 #define DEFINE_PROP_DRIVE(_n, _s, _f) \
diff --git a/include/hw/virtio/vhost-user-base.h b/include/hw/virtio/vhost-user-base.h
index 387e434b80..d5d2f081ae 100644
--- a/include/hw/virtio/vhost-user-base.h
+++ b/include/hw/virtio/vhost-user-base.h
@@ -20,7 +20,7 @@ struct VHostUserBase {
     VirtIODevice parent_obj;
 
     /* Properties */
-    CharBackend chardev;
+    CharFrontend chardev;
     uint16_t virtio_id;
     uint32_t num_vqs;
     uint32_t vq_size; /* can't exceed VIRTIO_QUEUE_MAX */
diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost-user-blk.h
index a10f785672..8158d4673d 100644
--- a/include/hw/virtio/vhost-user-blk.h
+++ b/include/hw/virtio/vhost-user-blk.h
@@ -29,7 +29,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostUserBlk, VHOST_USER_BLK)
 
 struct VHostUserBlk {
     VirtIODevice parent_obj;
-    CharBackend chardev;
+    CharFrontend chardev;
     int32_t bootindex;
     struct virtio_blk_config blkcfg;
     uint16_t num_queues;
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 94c3aaa84e..5699ea03a1 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -24,7 +24,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFS, VHOST_USER_FS)
 
 typedef struct {
-    CharBackend chardev;
+    CharFrontend chardev;
     char *tag;
     uint16_t num_request_queues;
     uint16_t queue_size;
diff --git a/include/hw/virtio/vhost-user-scmi.h b/include/hw/virtio/vhost-user-scmi.h
index c90db77dd5..30ab0d7ab7 100644
--- a/include/hw/virtio/vhost-user-scmi.h
+++ b/include/hw/virtio/vhost-user-scmi.h
@@ -18,7 +18,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostUserSCMI, VHOST_USER_SCMI);
 
 struct VHostUserSCMI {
     VirtIODevice parent;
-    CharBackend chardev;
+    CharFrontend chardev;
     struct vhost_virtqueue *vhost_vqs;
     struct vhost_dev vhost_dev;
     VhostUserState vhost_user;
diff --git a/include/hw/virtio/vhost-user-vsock.h b/include/hw/virtio/vhost-user-vsock.h
index 67aa46c952..5db6938b8b 100644
--- a/include/hw/virtio/vhost-user-vsock.h
+++ b/include/hw/virtio/vhost-user-vsock.h
@@ -20,7 +20,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(VHostUserVSock, VHOST_USER_VSOCK)
 
 typedef struct {
-    CharBackend chardev;
+    CharFrontend chardev;
 } VHostUserVSockConf;
 
 struct VHostUserVSock {
diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index 9a3f238b43..55d5725ef8 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -64,7 +64,7 @@ typedef struct VhostUserHostNotifier {
  * @memory_slots:
  */
 typedef struct VhostUserState {
-    CharBackend *chr;
+    CharFrontend *chr;
     GPtrArray *notifiers;
     int memory_slots;
     bool supports_config;
@@ -82,7 +82,7 @@ typedef struct VhostUserState {
  *
  * Return: true on success, false on error while setting errp.
  */
-bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
+bool vhost_user_init(VhostUserState *user, CharFrontend *chr, Error **errp);
 
 /**
  * vhost_user_cleanup() - cleanup state
@@ -96,7 +96,7 @@ void vhost_user_cleanup(VhostUserState *user);
 /**
  * vhost_user_async_close() - cleanup vhost-user post connection drop
  * @d: DeviceState for the associated device (passed to callback)
- * @chardev: the CharBackend associated with the connection
+ * @chardev: the CharFrontend associated with the connection
  * @vhost: the common vhost device
  * @cb: the user callback function to complete the clean-up
  *
@@ -108,7 +108,7 @@ void vhost_user_cleanup(VhostUserState *user);
 typedef void (*vu_async_close_fn)(DeviceState *cb);
 
 void vhost_user_async_close(DeviceState *d,
-                            CharBackend *chardev, struct vhost_dev *vhost,
+                            CharFrontend *chardev, struct vhost_dev *vhost,
                             vu_async_close_fn cb);
 
 #endif
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 9f16f89a36..58e0f91fda 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -257,7 +257,7 @@ struct VhostUserGPU {
 
     VhostUserBackend *vhost;
     int vhost_gpu_fd; /* closed by the chardev */
-    CharBackend vhost_chr;
+    CharFrontend vhost_chr;
     QemuDmaBuf *dmabuf[VIRTIO_GPU_MAX_SCANOUTS];
     bool backend_blocked;
 };
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 31e852ed6c..b6028bb5cd 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -58,7 +58,7 @@ struct VirtIOSCSIConf {
     uint32_t cmd_per_lun;
     char *vhostfd;
     char *wwpn;
-    CharBackend chardev;
+    CharFrontend chardev;
     uint32_t boot_tpgt;
     IOThread *iothread;
     IOThreadVirtQueueMappingList *iothread_vq_mapping_list;
diff --git a/include/system/qtest.h b/include/system/qtest.h
index 84b1f8c6ee..7f6dc01d14 100644
--- a/include/system/qtest.h
+++ b/include/system/qtest.h
@@ -23,8 +23,8 @@ static inline bool qtest_enabled(void)
     return qtest_allowed;
 }
 
-void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr, const char *fmt, ...);
-void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words));
+void G_GNUC_PRINTF(2, 3) qtest_sendf(CharFrontend *chr, const char *fmt, ...);
+void qtest_set_command_cb(bool (*pc_cb)(CharFrontend *chr, gchar **words));
 bool qtest_driver(void);
 
 void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **errp);
diff --git a/include/system/vhost-user-backend.h b/include/system/vhost-user-backend.h
index 5634ebdb2e..3184c8e799 100644
--- a/include/system/vhost-user-backend.h
+++ b/include/system/vhost-user-backend.h
@@ -32,7 +32,7 @@ struct VhostUserBackend {
     Object parent;
 
     char *chr_name;
-    CharBackend chr;
+    CharFrontend chr;
     VhostUserState vhost_user;
     struct vhost_dev dev;
     VirtIODevice *vdev;
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 5676eb334e..7735c73108 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -93,7 +93,7 @@ typedef struct HMPCommand {
 } HMPCommand;
 
 struct Monitor {
-    CharBackend chr;
+    CharFrontend chr;
     int suspend_cnt;            /* Needs to be accessed atomically */
     bool is_qmp;
     bool skip_flush;
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index cb04e68b02..cc478d9902 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -46,7 +46,7 @@ struct CryptoDevBackendVhostUser {
     CryptoDevBackend parent_obj;
 
     VhostUserState vhost_user;
-    CharBackend chr;
+    CharFrontend chr;
     char *chr_name;
     bool opened;
     CryptoDevBackendVhost *vhost_crypto[MAX_CRYPTO_QUEUE_NUM];
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index 9fd3393ede..1d92bd71cf 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -24,7 +24,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(RngEgd, RNG_EGD)
 struct RngEgd {
     RngBackend parent;
 
-    CharBackend chr;
+    CharFrontend chr;
     char *chr_name;
 };
 
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index dacfca5ab7..f32b67dac7 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -69,7 +69,7 @@ struct TPMEmulator {
     TPMBackend parent;
 
     TPMEmulatorOptions *options;
-    CharBackend ctrl_chr;
+    CharFrontend ctrl_chr;
     QIOChannel *data_ioc;
     TPMVersion tpm_version;
     uint32_t caps; /* capabilities of the TPM */
@@ -126,7 +126,7 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
                                 size_t msg_len_in, size_t msg_len_out_err,
                                 size_t msg_len_out_total)
 {
-    CharBackend *dev = &tpm->ctrl_chr;
+    CharFrontend *dev = &tpm->ctrl_chr;
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
     ptm_res res;
diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index 158a5f4f55..fc72319dab 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -30,9 +30,9 @@
 #include "chardev/char-io.h"
 #include "chardev-internal.h"
 
-int qemu_chr_fe_write(CharBackend *be, const uint8_t *buf, int len)
+int qemu_chr_fe_write(CharFrontend *c, const uint8_t *buf, int len)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
 
     if (!s) {
         return 0;
@@ -41,9 +41,9 @@ int qemu_chr_fe_write(CharBackend *be, const uint8_t *buf, int len)
     return qemu_chr_write(s, buf, len, false);
 }
 
-int qemu_chr_fe_write_all(CharBackend *be, const uint8_t *buf, int len)
+int qemu_chr_fe_write_all(CharFrontend *c, const uint8_t *buf, int len)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
 
     if (!s) {
         return 0;
@@ -52,9 +52,9 @@ int qemu_chr_fe_write_all(CharBackend *be, const uint8_t *buf, int len)
     return qemu_chr_write(s, buf, len, true);
 }
 
-int qemu_chr_fe_read_all(CharBackend *be, uint8_t *buf, int len)
+int qemu_chr_fe_read_all(CharFrontend *c, uint8_t *buf, int len)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
     int offset = 0;
     int res;
 
@@ -95,9 +95,9 @@ int qemu_chr_fe_read_all(CharBackend *be, uint8_t *buf, int len)
     return offset;
 }
 
-int qemu_chr_fe_ioctl(CharBackend *be, int cmd, void *arg)
+int qemu_chr_fe_ioctl(CharFrontend *c, int cmd, void *arg)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
     int res;
 
     if (!s || !CHARDEV_GET_CLASS(s)->chr_ioctl || qemu_chr_replay(s)) {
@@ -109,11 +109,11 @@ int qemu_chr_fe_ioctl(CharBackend *be, int cmd, void *arg)
     return res;
 }
 
-int qemu_chr_fe_get_msgfd(CharBackend *be)
+int qemu_chr_fe_get_msgfd(CharFrontend *c)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
     int fd;
-    int res = (qemu_chr_fe_get_msgfds(be, &fd, 1) == 1) ? fd : -1;
+    int res = (qemu_chr_fe_get_msgfds(c, &fd, 1) == 1) ? fd : -1;
     if (s && qemu_chr_replay(s)) {
         error_report("Replay: get msgfd is not supported "
                      "for serial devices yet");
@@ -122,9 +122,9 @@ int qemu_chr_fe_get_msgfd(CharBackend *be)
     return res;
 }
 
-int qemu_chr_fe_get_msgfds(CharBackend *be, int *fds, int len)
+int qemu_chr_fe_get_msgfds(CharFrontend *c, int *fds, int len)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
 
     if (!s) {
         return -1;
@@ -134,9 +134,9 @@ int qemu_chr_fe_get_msgfds(CharBackend *be, int *fds, int len)
         CHARDEV_GET_CLASS(s)->get_msgfds(s, fds, len) : -1;
 }
 
-int qemu_chr_fe_set_msgfds(CharBackend *be, int *fds, int num)
+int qemu_chr_fe_set_msgfds(CharFrontend *c, int *fds, int num)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
 
     if (!s) {
         return -1;
@@ -146,9 +146,9 @@ int qemu_chr_fe_set_msgfds(CharBackend *be, int *fds, int num)
         CHARDEV_GET_CLASS(s)->set_msgfds(s, fds, num) : -1;
 }
 
-void qemu_chr_fe_accept_input(CharBackend *be)
+void qemu_chr_fe_accept_input(CharFrontend *c)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
 
     if (!s) {
         return;
@@ -160,7 +160,7 @@ void qemu_chr_fe_accept_input(CharBackend *be)
     qemu_notify_event();
 }
 
-void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
+void qemu_chr_fe_printf(CharFrontend *c, const char *fmt, ...)
 {
     char buf[CHR_READ_BUF_LEN];
     va_list ap;
@@ -168,28 +168,28 @@ void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
     vsnprintf(buf, sizeof(buf), fmt, ap);
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(be, (uint8_t *)buf, strlen(buf));
+    qemu_chr_fe_write_all(c, (uint8_t *)buf, strlen(buf));
     va_end(ap);
 }
 
-Chardev *qemu_chr_fe_get_driver(CharBackend *be)
+Chardev *qemu_chr_fe_get_driver(CharFrontend *c)
 {
     /* this is unsafe for the users that support chardev hotswap */
-    assert(be->chr_be_change == NULL);
-    return be->chr;
+    assert(c->chr_be_change == NULL);
+    return c->chr;
 }
 
-bool qemu_chr_fe_backend_connected(CharBackend *be)
+bool qemu_chr_fe_backend_connected(CharFrontend *c)
 {
-    return !!be->chr;
+    return !!c->chr;
 }
 
-bool qemu_chr_fe_backend_open(CharBackend *be)
+bool qemu_chr_fe_backend_open(CharFrontend *c)
 {
-    return be->chr && be->chr->be_open;
+    return c->chr && c->chr->be_open;
 }
 
-bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp)
+bool qemu_chr_fe_init(CharFrontend *c, Chardev *s, Error **errp)
 {
     unsigned int tag = 0;
 
@@ -197,49 +197,49 @@ bool qemu_chr_fe_init(CharBackend *b, Chardev *s, Error **errp)
         if (CHARDEV_IS_MUX(s)) {
             MuxChardev *d = MUX_CHARDEV(s);
 
-            if (!mux_chr_attach_frontend(d, b, &tag, errp)) {
+            if (!mux_chr_attach_frontend(d, c, &tag, errp)) {
                 return false;
             }
         } else if (s->be) {
             error_setg(errp, "chardev '%s' is already in use", s->label);
             return false;
         } else {
-            s->be = b;
+            s->be = c;
         }
     }
 
-    b->fe_is_open = false;
-    b->tag = tag;
-    b->chr = s;
+    c->fe_is_open = false;
+    c->tag = tag;
+    c->chr = s;
     return true;
 }
 
-void qemu_chr_fe_deinit(CharBackend *b, bool del)
+void qemu_chr_fe_deinit(CharFrontend *c, bool del)
 {
-    assert(b);
+    assert(c);
 
-    if (b->chr) {
-        qemu_chr_fe_set_handlers(b, NULL, NULL, NULL, NULL, NULL, NULL, true);
-        if (b->chr->be == b) {
-            b->chr->be = NULL;
+    if (c->chr) {
+        qemu_chr_fe_set_handlers(c, NULL, NULL, NULL, NULL, NULL, NULL, true);
+        if (c->chr->be == c) {
+            c->chr->be = NULL;
         }
-        if (CHARDEV_IS_MUX(b->chr)) {
-            MuxChardev *d = MUX_CHARDEV(b->chr);
-            mux_chr_detach_frontend(d, b->tag);
+        if (CHARDEV_IS_MUX(c->chr)) {
+            MuxChardev *d = MUX_CHARDEV(c->chr);
+            mux_chr_detach_frontend(d, c->tag);
         }
         if (del) {
-            Object *obj = OBJECT(b->chr);
+            Object *obj = OBJECT(c->chr);
             if (obj->parent) {
                 object_unparent(obj);
             } else {
                 object_unref(obj);
             }
         }
-        b->chr = NULL;
+        c->chr = NULL;
     }
 }
 
-void qemu_chr_fe_set_handlers_full(CharBackend *b,
+void qemu_chr_fe_set_handlers_full(CharFrontend *c,
                                    IOCanReadHandler *fd_can_read,
                                    IOReadHandler *fd_read,
                                    IOEventHandler *fd_event,
@@ -252,7 +252,7 @@ void qemu_chr_fe_set_handlers_full(CharBackend *b,
     Chardev *s;
     bool fe_open;
 
-    s = b->chr;
+    s = c->chr;
     if (!s) {
         return;
     }
@@ -263,20 +263,20 @@ void qemu_chr_fe_set_handlers_full(CharBackend *b,
     } else {
         fe_open = true;
     }
-    b->chr_can_read = fd_can_read;
-    b->chr_read = fd_read;
-    b->chr_event = fd_event;
-    b->chr_be_change = be_change;
-    b->opaque = opaque;
+    c->chr_can_read = fd_can_read;
+    c->chr_read = fd_read;
+    c->chr_event = fd_event;
+    c->chr_be_change = be_change;
+    c->opaque = opaque;
 
     qemu_chr_be_update_read_handlers(s, context);
 
     if (set_open) {
-        qemu_chr_fe_set_open(b, fe_open);
+        qemu_chr_fe_set_open(c, fe_open);
     }
 
     if (fe_open) {
-        qemu_chr_fe_take_focus(b);
+        qemu_chr_fe_take_focus(c);
         /* We're connecting to an already opened device, so let's make sure we
            also get the open event */
         if (sync_state && s->be_open) {
@@ -285,7 +285,7 @@ void qemu_chr_fe_set_handlers_full(CharBackend *b,
     }
 }
 
-void qemu_chr_fe_set_handlers(CharBackend *b,
+void qemu_chr_fe_set_handlers(CharFrontend *c,
                               IOCanReadHandler *fd_can_read,
                               IOReadHandler *fd_read,
                               IOEventHandler *fd_event,
@@ -294,62 +294,62 @@ void qemu_chr_fe_set_handlers(CharBackend *b,
                               GMainContext *context,
                               bool set_open)
 {
-    qemu_chr_fe_set_handlers_full(b, fd_can_read, fd_read, fd_event, be_change,
+    qemu_chr_fe_set_handlers_full(c, fd_can_read, fd_read, fd_event, be_change,
                                   opaque, context, set_open,
                                   true);
 }
 
-void qemu_chr_fe_take_focus(CharBackend *b)
+void qemu_chr_fe_take_focus(CharFrontend *c)
 {
-    if (!b->chr) {
+    if (!c->chr) {
         return;
     }
 
-    if (CHARDEV_IS_MUX(b->chr)) {
-        mux_set_focus(b->chr, b->tag);
+    if (CHARDEV_IS_MUX(c->chr)) {
+        mux_set_focus(c->chr, c->tag);
     }
 }
 
-int qemu_chr_fe_wait_connected(CharBackend *be, Error **errp)
+int qemu_chr_fe_wait_connected(CharFrontend *c, Error **errp)
 {
-    if (!be->chr) {
+    if (!c->chr) {
         error_setg(errp, "missing associated backend");
         return -1;
     }
 
-    return qemu_chr_wait_connected(be->chr, errp);
+    return qemu_chr_wait_connected(c->chr, errp);
 }
 
-void qemu_chr_fe_set_echo(CharBackend *be, bool echo)
+void qemu_chr_fe_set_echo(CharFrontend *c, bool echo)
 {
-    Chardev *chr = be->chr;
+    Chardev *chr = c->chr;
 
     if (chr && CHARDEV_GET_CLASS(chr)->chr_set_echo) {
         CHARDEV_GET_CLASS(chr)->chr_set_echo(chr, echo);
     }
 }
 
-void qemu_chr_fe_set_open(CharBackend *be, bool is_open)
+void qemu_chr_fe_set_open(CharFrontend *c, bool is_open)
 {
-    Chardev *chr = be->chr;
+    Chardev *chr = c->chr;
 
     if (!chr) {
         return;
     }
 
-    if (be->fe_is_open == is_open) {
+    if (c->fe_is_open == is_open) {
         return;
     }
-    be->fe_is_open = is_open;
+    c->fe_is_open = is_open;
     if (CHARDEV_GET_CLASS(chr)->chr_set_fe_open) {
         CHARDEV_GET_CLASS(chr)->chr_set_fe_open(chr, is_open);
     }
 }
 
-guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
+guint qemu_chr_fe_add_watch(CharFrontend *c, GIOCondition cond,
                             FEWatchFunc func, void *user_data)
 {
-    Chardev *s = be->chr;
+    Chardev *s = c->chr;
     GSource *src;
     guint tag;
 
@@ -369,9 +369,9 @@ guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
     return tag;
 }
 
-void qemu_chr_fe_disconnect(CharBackend *be)
+void qemu_chr_fe_disconnect(CharFrontend *c)
 {
-    Chardev *chr = be->chr;
+    Chardev *chr = c->chr;
 
     if (chr && CHARDEV_GET_CLASS(chr)->chr_disconnect) {
         CHARDEV_GET_CLASS(chr)->chr_disconnect(chr);
diff --git a/chardev/char-hub.c b/chardev/char-hub.c
index 16ffee2017..646c65a41a 100644
--- a/chardev/char-hub.c
+++ b/chardev/char-hub.c
@@ -54,7 +54,7 @@ static int hub_chr_write(Chardev *chr, const uint8_t *buf, int len)
     d->be_eagain_ind = -1;
 
     for (i = 0; i < d->be_cnt; i++) {
-        if (!d->backends[i].be.chr->be_open) {
+        if (!d->backends[i].fe.chr->be_open) {
             /* Skip closed backend */
             continue;
         }
@@ -64,7 +64,7 @@ static int hub_chr_write(Chardev *chr, const uint8_t *buf, int len)
             ret = MIN(written, ret);
             continue;
         }
-        r = qemu_chr_fe_write(&d->backends[i].be, buf, len);
+        r = qemu_chr_fe_write(&d->backends[i].fe, buf, len);
         if (r < 0) {
             if (errno == EAGAIN) {
                 /* Set index and expect to be called soon on watch wake up */
@@ -84,7 +84,7 @@ static int hub_chr_write(Chardev *chr, const uint8_t *buf, int len)
 static int hub_chr_can_read(void *opaque)
 {
     HubCharBackend *backend = opaque;
-    CharBackend *fe = backend->hub->parent.be;
+    CharFrontend *fe = backend->hub->parent.be;
 
     if (fe && fe->chr_can_read) {
         return fe->chr_can_read(fe->opaque);
@@ -96,7 +96,7 @@ static int hub_chr_can_read(void *opaque)
 static void hub_chr_read(void *opaque, const uint8_t *buf, int size)
 {
     HubCharBackend *backend = opaque;
-    CharBackend *fe = backend->hub->parent.be;
+    CharFrontend *fe = backend->hub->parent.be;
 
     if (fe && fe->chr_read) {
         fe->chr_read(fe->opaque, buf, size);
@@ -107,7 +107,7 @@ static void hub_chr_event(void *opaque, QEMUChrEvent event)
 {
     HubCharBackend *backend = opaque;
     HubChardev *d = backend->hub;
-    CharBackend *fe = d->parent.be;
+    CharFrontend *fe = d->parent.be;
 
     if (event == CHR_EVENT_OPENED) {
         /*
@@ -147,7 +147,7 @@ static GSource *hub_chr_add_watch(Chardev *s, GIOCondition cond)
     }
 
     assert(d->be_eagain_ind < d->be_cnt);
-    chr = qemu_chr_fe_get_driver(&d->backends[d->be_eagain_ind].be);
+    chr = qemu_chr_fe_get_driver(&d->backends[d->be_eagain_ind].fe);
     cc = CHARDEV_GET_CLASS(chr);
     if (!cc->chr_add_watch) {
         return NULL;
@@ -167,7 +167,7 @@ static bool hub_chr_attach_chardev(HubChardev *d, Chardev *chr,
                    d->parent.label);
         return false;
     }
-    ret = qemu_chr_fe_init(&d->backends[d->be_cnt].be, chr, errp);
+    ret = qemu_chr_fe_init(&d->backends[d->be_cnt].fe, chr, errp);
     if (ret) {
         d->backends[d->be_cnt].hub = d;
         d->backends[d->be_cnt].be_ind = d->be_cnt;
@@ -183,7 +183,7 @@ static void char_hub_finalize(Object *obj)
     int i;
 
     for (i = 0; i < d->be_cnt; i++) {
-        qemu_chr_fe_deinit(&d->backends[i].be, false);
+        qemu_chr_fe_deinit(&d->backends[i].fe, false);
     }
 }
 
@@ -193,7 +193,7 @@ static void hub_chr_update_read_handlers(Chardev *chr)
     int i;
 
     for (i = 0; i < d->be_cnt; i++) {
-        qemu_chr_fe_set_handlers_full(&d->backends[i].be,
+        qemu_chr_fe_set_handlers_full(&d->backends[i].fe,
                                       hub_chr_can_read,
                                       hub_chr_read,
                                       hub_chr_event,
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 6b36290e2c..eeb7571b26 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -128,10 +128,10 @@ static void mux_print_help(Chardev *chr)
 static void mux_chr_send_event(MuxChardev *d, unsigned int mux_nr,
                                QEMUChrEvent event)
 {
-    CharBackend *be = d->backends[mux_nr];
+    CharFrontend *fe = d->frontends[mux_nr];
 
-    if (be && be->chr_event) {
-        be->chr_event(be->opaque, event);
+    if (fe && fe->chr_event) {
+        fe->chr_event(fe->opaque, event);
     }
 }
 
@@ -200,11 +200,11 @@ static void mux_chr_accept_input(Chardev *chr)
 {
     MuxChardev *d = MUX_CHARDEV(chr);
     int m = d->focus;
-    CharBackend *be = d->backends[m];
+    CharFrontend *fe = d->frontends[m];
 
-    while (be && d->prod[m] != d->cons[m] &&
-           be->chr_can_read && be->chr_can_read(be->opaque)) {
-        be->chr_read(be->opaque,
+    while (fe && d->prod[m] != d->cons[m] &&
+           fe->chr_can_read && fe->chr_can_read(fe->opaque)) {
+        fe->chr_read(fe->opaque,
                      &d->buffer[m][d->cons[m]++ & MUX_BUFFER_MASK], 1);
     }
 }
@@ -213,14 +213,14 @@ static int mux_chr_can_read(void *opaque)
 {
     MuxChardev *d = MUX_CHARDEV(opaque);
     int m = d->focus;
-    CharBackend *be = d->backends[m];
+    CharFrontend *fe = d->frontends[m];
 
     if ((d->prod[m] - d->cons[m]) < MUX_BUFFER_SIZE) {
         return 1;
     }
 
-    if (be && be->chr_can_read) {
-        return be->chr_can_read(be->opaque);
+    if (fe && fe->chr_can_read) {
+        return fe->chr_can_read(fe->opaque);
     }
 
     return 0;
@@ -231,7 +231,7 @@ static void mux_chr_read(void *opaque, const uint8_t *buf, int size)
     Chardev *chr = CHARDEV(opaque);
     MuxChardev *d = MUX_CHARDEV(opaque);
     int m = d->focus;
-    CharBackend *be = d->backends[m];
+    CharFrontend *fe = d->frontends[m];
     int i;
 
     mux_chr_accept_input(opaque);
@@ -239,9 +239,9 @@ static void mux_chr_read(void *opaque, const uint8_t *buf, int size)
     for (i = 0; i < size; i++)
         if (mux_proc_byte(chr, d, buf[i])) {
             if (d->prod[m] == d->cons[m] &&
-                be && be->chr_can_read &&
-                be->chr_can_read(be->opaque)) {
-                be->chr_read(be->opaque, &buf[i], 1);
+                fe && fe->chr_can_read &&
+                fe->chr_can_read(fe->opaque)) {
+                fe->chr_read(fe->opaque, &buf[i], 1);
             } else {
                 d->buffer[m][d->prod[m]++ & MUX_BUFFER_MASK] = buf[i];
             }
@@ -289,9 +289,9 @@ static void char_mux_finalize(Object *obj)
 
     bit = -1;
     while ((bit = find_next_bit(&d->mux_bitset, MAX_MUX, bit + 1)) < MAX_MUX) {
-        CharBackend *be = d->backends[bit];
+        CharFrontend *be = d->frontends[bit];
         be->chr = NULL;
-        d->backends[bit] = NULL;
+        d->frontends[bit] = NULL;
     }
     d->mux_bitset = 0;
     qemu_chr_fe_deinit(&d->chr, false);
@@ -311,7 +311,7 @@ static void mux_chr_update_read_handlers(Chardev *chr)
                                   chr->gcontext, true, false);
 }
 
-bool mux_chr_attach_frontend(MuxChardev *d, CharBackend *b,
+bool mux_chr_attach_frontend(MuxChardev *d, CharFrontend *c,
                              unsigned int *tag, Error **errp)
 {
     unsigned int bit;
@@ -328,7 +328,7 @@ bool mux_chr_attach_frontend(MuxChardev *d, CharBackend *b,
     }
 
     d->mux_bitset |= (1ul << bit);
-    d->backends[bit] = b;
+    d->frontends[bit] = c;
     *tag = bit;
 
     return true;
@@ -341,7 +341,7 @@ bool mux_chr_detach_frontend(MuxChardev *d, unsigned int tag)
     }
 
     d->mux_bitset &= ~(1ul << tag);
-    d->backends[tag] = NULL;
+    d->frontends[tag] = NULL;
 
     return true;
 }
@@ -357,7 +357,7 @@ void mux_set_focus(Chardev *chr, unsigned int focus)
     }
 
     d->focus = focus;
-    chr->be = d->backends[focus];
+    chr->be = d->frontends[focus];
     mux_chr_send_event(d, d->focus, CHR_EVENT_MUX_IN);
 }
 
diff --git a/chardev/char.c b/chardev/char.c
index bbebd246c3..cc631f0385 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -53,7 +53,7 @@ Object *get_chardevs_root(void)
 
 static void chr_be_event(Chardev *s, QEMUChrEvent event)
 {
-    CharBackend *be = s->be;
+    CharFrontend *be = s->be;
 
     if (!be || !be->chr_event) {
         return;
@@ -197,7 +197,7 @@ int qemu_chr_write(Chardev *s, const uint8_t *buf, int len, bool write_all)
 
 int qemu_chr_be_can_write(Chardev *s)
 {
-    CharBackend *be = s->be;
+    CharFrontend *be = s->be;
 
     if (!be || !be->chr_can_read) {
         return 0;
@@ -208,7 +208,7 @@ int qemu_chr_be_can_write(Chardev *s)
 
 void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len)
 {
-    CharBackend *be = s->be;
+    CharFrontend *be = s->be;
 
     if (be && be->chr_read) {
         be->chr_read(be->opaque, buf, len);
@@ -1112,7 +1112,7 @@ err:
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
-    CharBackend *be;
+    CharFrontend *be;
     const ChardevClass *cc, *cc_new;
     Chardev *chr, *chr_new;
     bool closed_sent = false;
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 5221c579d9..e2220c1ae4 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -34,7 +34,7 @@
 
 /* System emulation specific state */
 typedef struct {
-    CharBackend chr;
+    CharFrontend chr;
     Chardev *mon_chr;
 } GDBSystemState;
 
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 229c98ddd9..059b07907d 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -927,7 +927,7 @@ struct StrongARMUARTState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
 
     uint8_t utcr0;
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index bf44aaf9e4..bb323adda5 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -40,7 +40,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(ISADebugconState, ISA_DEBUGCON_DEVICE)
 
 typedef struct DebugconState {
     MemoryRegion io;
-    CharBackend chr;
+    CharFrontend chr;
     uint32_t readback;
 } DebugconState;
 
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 6521b4cedd..9e45d81990 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -154,7 +154,7 @@ struct Exynos4210UartState {
     QEMUTimer *fifo_timeout_timer;
     uint64_t wordtime;        /* word time in ns */
 
-    CharBackend       chr;
+    CharFrontend       chr;
     qemu_irq          irq;
     qemu_irq          dmairq;
 
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index 81c26e3389..b2d5a40bb4 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -84,7 +84,7 @@ struct UART {
     MemoryRegion iomem;
     qemu_irq irq;
 
-    CharBackend chr;
+    CharFrontend chr;
 
     /* registers */
     uint32_t status;
diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index 752c6c818a..d0108d0b9a 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -99,7 +99,7 @@ typedef struct SCC2698Block SCC2698Block;
 
 struct SCC2698Channel {
     IPOctalState *ipoctal;
-    CharBackend dev;
+    CharFrontend dev;
     bool rx_enabled;
     uint8_t mr[2];
     uint8_t mr_idx;
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 87bfcbebdc..f14de59530 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -36,7 +36,7 @@ struct mcf_uart_state {
     int tx_enabled;
     int rx_enabled;
     qemu_irq irq;
-    CharBackend chr;
+    CharFrontend chr;
 };
 
 #define TYPE_MCF_UART "mcf-uart"
diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index 3e40d5e434..c51308f9c5 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -41,7 +41,7 @@ typedef struct OprtnsCommand {
 
 struct SCLPConsoleLM {
     SCLPEvent event;
-    CharBackend chr;
+    CharFrontend chr;
     bool echo;                  /* immediate echo of input if true        */
     uint32_t write_errors;      /* errors writing to char layer           */
     uint32_t length;            /* length of byte stream in buffer        */
diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
index 95e3045178..2abf861dbc 100644
--- a/hw/char/sclpconsole.c
+++ b/hw/char/sclpconsole.c
@@ -35,7 +35,7 @@ typedef struct ASCIIConsoleData {
 
 struct SCLPConsole {
     SCLPEvent event;
-    CharBackend chr;
+    CharFrontend chr;
     uint8_t iov[SIZE_BUFFER_VT220];
     uint32_t iov_sclp;      /* offset in buf for SCLP read operation       */
     uint32_t iov_bs;        /* offset in buf for char layer read operation */
diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 30447fa018..83227a84a6 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -67,7 +67,7 @@ struct SHSerialState {
     int flags;
     int rtrg;
 
-    CharBackend chr;
+    CharFrontend chr;
     QEMUTimer fifo_timeout_timer;
     uint64_t etu; /* Elementary Time Unit (ns) */
 
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index fc8ea604f8..766b2bfcac 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -14,7 +14,7 @@
 
 struct SpaprVioVty {
     SpaprVioDevice sdev;
-    CharBackend chardev;
+    CharFrontend chardev;
     uint32_t in, out;
     uint8_t buf[VTERM_BUFSIZE];
 };
diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
index d950c17292..c993f67b42 100644
--- a/hw/char/terminal3270.c
+++ b/hw/char/terminal3270.c
@@ -30,7 +30,7 @@
 
 struct Terminal3270 {
     EmulatedCcw3270Device cdev;
-    CharBackend chr;
+    CharFrontend chr;
     uint8_t inv[INPUT_BUFFER_SIZE];
     uint8_t outv[OUTPUT_BUFFER_SIZE];
     int in_len;
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index 0932a3572b..1b669c9be8 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -30,7 +30,7 @@ DECLARE_INSTANCE_CHECKER(VirtConsole, VIRTIO_CONSOLE,
 struct VirtConsole {
     VirtIOSerialPort parent_obj;
 
-    CharBackend chr;
+    CharFrontend chr;
     guint watch;
 };
 
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 9c34a554bf..462476553f 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -53,7 +53,7 @@ struct XenConsole {
     char              *fe_path;
     unsigned int      ring_ref;
     void              *sring;
-    CharBackend       chr;
+    CharFrontend       chr;
     int               backlog;
 };
 typedef struct XenConsole XenConsole;
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 8008171eea..8feb58a898 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -60,7 +60,7 @@ struct XilinxUARTLite {
 
     EndianMode model_endianness;
     MemoryRegion mmio;
-    CharBackend chr;
+    CharFrontend chr;
     qemu_irq irq;
 
     uint8_t rx_fifo[8];
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 1f810b7ddf..c15371f8cd 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -258,10 +258,10 @@ const PropertyInfo qdev_prop_drive_iothread = {
 static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    CharBackend *be = object_field_prop_ptr(obj, opaque);
+    CharFrontend *fe = object_field_prop_ptr(obj, opaque);
     char *p;
 
-    p = g_strdup(be->chr && be->chr->label ? be->chr->label : "");
+    p = g_strdup(fe->chr && fe->chr->label ? fe->chr->label : "");
     visit_type_str(v, name, &p, errp);
     g_free(p);
 }
@@ -271,7 +271,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     ERRP_GUARD();
     const Property *prop = opaque;
-    CharBackend *be = object_field_prop_ptr(obj, prop);
+    CharFrontend *fe = object_field_prop_ptr(obj, prop);
     Chardev *s;
     char *str;
 
@@ -283,13 +283,13 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
      * TODO Should this really be an error?  If no, the old value
      * needs to be released before we store the new one.
      */
-    if (!check_prop_still_unset(obj, name, be->chr, str, false, errp)) {
+    if (!check_prop_still_unset(obj, name, fe->chr, str, false, errp)) {
         return;
     }
 
     if (!*str) {
         g_free(str);
-        be->chr = NULL;
+        fe->chr = NULL;
         return;
     }
 
@@ -297,7 +297,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
     if (s == NULL) {
         error_setg(errp, "Property '%s.%s' can't find value '%s'",
                    object_get_typename(obj), name, str);
-    } else if (!qemu_chr_fe_init(be, s, errp)) {
+    } else if (!qemu_chr_fe_init(fe, s, errp)) {
         error_prepend(errp, "Property '%s.%s' can't take value '%s': ",
                       object_get_typename(obj), name, str);
     }
@@ -307,9 +307,9 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 static void release_chr(Object *obj, const char *name, void *opaque)
 {
     const Property *prop = opaque;
-    CharBackend *be = object_field_prop_ptr(obj, prop);
+    CharFrontend *fe = object_field_prop_ptr(obj, prop);
 
-    qemu_chr_fe_deinit(be, false);
+    qemu_chr_fe_deinit(fe, false);
 }
 
 const PropertyInfo qdev_prop_chr = {
diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index 9f1ba7b2f8..2c6c515579 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -67,7 +67,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcExtern, IPMI_BMC_EXTERN)
 struct IPMIBmcExtern {
     IPMIBmc parent;
 
-    CharBackend chr;
+    CharFrontend chr;
 
     bool connected;
 
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 149a263bd5..8ecac41d47 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -68,7 +68,7 @@ struct BostonState {
     SerialMM *uart;
     Clock *cpuclk;
 
-    CharBackend lcd_display;
+    CharFrontend lcd_display;
     char lcd_content[8];
     bool lcd_inited;
 
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 02da629b5a..a3b7632ad9 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -89,7 +89,7 @@ typedef struct {
     uint32_t i2coe;
     uint32_t i2cout;
     uint32_t i2csel;
-    CharBackend display;
+    CharFrontend display;
     char display_text[9];
     SerialMM *uart;
     bool display_inited;
diff --git a/hw/misc/ivshmem-pci.c b/hw/misc/ivshmem-pci.c
index 2748db9286..636d0b83de 100644
--- a/hw/misc/ivshmem-pci.c
+++ b/hw/misc/ivshmem-pci.c
@@ -94,7 +94,7 @@ struct IVShmemState {
 
     /* exactly one of these two may be set */
     HostMemoryBackend *hostmem; /* with interrupts */
-    CharBackend server_chr; /* without interrupts */
+    CharFrontend server_chr; /* without interrupts */
 
     /* registers */
     uint32_t intrmask;
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 143bc8c379..0bb4afe139 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -551,7 +551,7 @@ static uint64_t qtest_rtas_call(char *cmd, uint32_t nargs, uint64_t args,
     return H_PARAMETER;
 }
 
-static bool spapr_qtest_callback(CharBackend *chr, gchar **words)
+static bool spapr_qtest_callback(CharFrontend *chr, gchar **words)
 {
     if (strcmp(words[0], "rtas") == 0) {
         uint64_t res, args, ret;
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 7f2676008c..4d51a93dd5 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -78,7 +78,7 @@ static void csr_call(char *cmd, uint64_t cpu_num, int csrno, uint64_t *val)
     g_assert(ret == RISCV_EXCP_NONE);
 }
 
-static bool csr_qtest_callback(CharBackend *chr, gchar **words)
+static bool csr_qtest_callback(CharFrontend *chr, gchar **words)
 {
     if (strcmp(words[0], "csr") == 0) {
 
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index 1eea21a733..c8aada0988 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -56,7 +56,7 @@ typedef struct PassthruState PassthruState;
 
 struct PassthruState {
     CCIDCardState base;
-    CharBackend cs;
+    CharFrontend cs;
     uint8_t  vscard_in_data[VSCARD_IN_SIZE];
     uint32_t vscard_in_pos;
     uint32_t vscard_in_hdr;
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 1c116d8b0f..2eb52b2e01 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -105,7 +105,7 @@ struct USBSerialState {
     uint8_t xoff;
     QEMUSerialSetParams params;
     int latency;        /* ms */
-    CharBackend cs;
+    CharFrontend cs;
 };
 
 #define TYPE_USB_SERIAL "usb-serial-dev"
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index f516ff42a1..d603a4a6f9 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -113,7 +113,7 @@ struct PacketIdQueue {
 struct USBRedirDevice {
     USBDevice dev;
     /* Properties */
-    CharBackend cs;
+    CharFrontend cs;
     bool enable_streams;
     bool suppress_remote_wake;
     bool in_write;
diff --git a/hw/virtio/vhost-stub.c b/hw/virtio/vhost-stub.c
index 52d42adab2..7321dc9210 100644
--- a/hw/virtio/vhost-stub.c
+++ b/hw/virtio/vhost-stub.c
@@ -12,7 +12,7 @@ unsigned int vhost_get_free_memslots(void)
     return UINT_MAX;
 }
 
-bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
+bool vhost_user_init(VhostUserState *user, CharFrontend *chr, Error **errp)
 {
     return false;
 }
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 36c9c2e04d..aac98f898a 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -275,7 +275,7 @@ struct scrub_regions {
 static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
 {
     struct vhost_user *u = dev->opaque;
-    CharBackend *chr = u->user->chr;
+    CharFrontend *chr = u->user->chr;
     uint8_t *p = (uint8_t *) msg;
     int r, size = VHOST_USER_HDR_SIZE;
 
@@ -303,7 +303,7 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
 static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 {
     struct vhost_user *u = dev->opaque;
-    CharBackend *chr = u->user->chr;
+    CharFrontend *chr = u->user->chr;
     uint8_t *p = (uint8_t *) msg;
     int r, size;
 
@@ -383,7 +383,7 @@ static int vhost_user_write(struct vhost_dev *dev, VhostUserMsg *msg,
                             int *fds, int fd_num)
 {
     struct vhost_user *u = dev->opaque;
-    CharBackend *chr = u->user->chr;
+    CharFrontend *chr = u->user->chr;
     int ret, size = VHOST_USER_HDR_SIZE + msg->hdr.size;
 
     /*
@@ -1680,7 +1680,7 @@ int vhost_user_get_shared_object(struct vhost_dev *dev, unsigned char *uuid,
                                  int *dmabuf_fd)
 {
     struct vhost_user *u = dev->opaque;
-    CharBackend *chr = u->user->chr;
+    CharFrontend *chr = u->user->chr;
     int ret;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_GET_SHARED_OBJECT,
@@ -1721,7 +1721,7 @@ vhost_user_backend_handle_shared_object_lookup(struct vhost_user *u,
                                                VhostUserPayload *payload)
 {
     QemuUUID uuid;
-    CharBackend *chr = u->user->chr;
+    CharFrontend *chr = u->user->chr;
     Error *local_err = NULL;
     int dmabuf_fd = -1;
     int fd_num = 0;
@@ -2004,7 +2004,7 @@ static int vhost_user_postcopy_advise(struct vhost_dev *dev, Error **errp)
 {
 #ifdef CONFIG_LINUX
     struct vhost_user *u = dev->opaque;
-    CharBackend *chr = u->user->chr;
+    CharFrontend *chr = u->user->chr;
     int ufd;
     int ret;
     VhostUserMsg msg = {
@@ -2670,7 +2670,7 @@ static int vhost_user_get_inflight_fd(struct vhost_dev *dev,
     int fd;
     int ret;
     struct vhost_user *u = dev->opaque;
-    CharBackend *chr = u->user->chr;
+    CharFrontend *chr = u->user->chr;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_GET_INFLIGHT_FD,
         .hdr.flags = VHOST_USER_VERSION,
@@ -2761,7 +2761,7 @@ static void vhost_user_state_destroy(gpointer data)
     vhost_user_host_notifier_remove(n, NULL, true);
 }
 
-bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
+bool vhost_user_init(VhostUserState *user, CharFrontend *chr, Error **errp)
 {
     if (user->chr) {
         error_setg(errp, "Cannot initialize vhost-user state");
@@ -2787,7 +2787,7 @@ void vhost_user_cleanup(VhostUserState *user)
 typedef struct {
     vu_async_close_fn cb;
     DeviceState *dev;
-    CharBackend *cd;
+    CharFrontend *cd;
     struct vhost_dev *vhost;
 } VhostAsyncCallback;
 
@@ -2806,7 +2806,7 @@ static void vhost_user_async_close_bh(void *opaque)
  * purposes.
  */
 void vhost_user_async_close(DeviceState *d,
-                            CharBackend *chardev, struct vhost_dev *vhost,
+                            CharFrontend *chardev, struct vhost_dev *vhost,
                             vu_async_close_fn cb)
 {
     if (!runstate_check(RUN_STATE_SHUTDOWN)) {
diff --git a/net/colo-compare.c b/net/colo-compare.c
index 0e1844ee4c..95018b4704 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -88,7 +88,7 @@ static uint32_t max_queue_size;
 typedef struct SendCo {
     Coroutine *co;
     struct CompareState *s;
-    CharBackend *chr;
+    CharFrontend *chr;
     GQueue send_list;
     bool notify_remote_frame;
     bool done;
@@ -108,10 +108,10 @@ struct CompareState {
     char *sec_indev;
     char *outdev;
     char *notify_dev;
-    CharBackend chr_pri_in;
-    CharBackend chr_sec_in;
-    CharBackend chr_out;
-    CharBackend chr_notify_dev;
+    CharFrontend chr_pri_in;
+    CharFrontend chr_sec_in;
+    CharFrontend chr_out;
+    CharFrontend chr_notify_dev;
     SocketReadState pri_rs;
     SocketReadState sec_rs;
     SocketReadState notify_rs;
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index 27734c91a7..8e01e98f40 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -37,8 +37,8 @@ struct MirrorState {
     NetFilterState parent_obj;
     char *indev;
     char *outdev;
-    CharBackend chr_in;
-    CharBackend chr_out;
+    CharFrontend chr_in;
+    CharFrontend chr_out;
     SocketReadState rs;
     bool vnet_hdr;
 };
diff --git a/net/passt.c b/net/passt.c
index 32ecffb763..9ed811a514 100644
--- a/net/passt.c
+++ b/net/passt.c
@@ -71,7 +71,7 @@ typedef struct NetPasstState {
     /* vhost user */
     VhostUserState *vhost_user;
     VHostNetState *vhost_net;
-    CharBackend vhost_chr;
+    CharFrontend vhost_chr;
     guint vhost_watch;
     uint64_t acked_features;
     bool started;
diff --git a/net/slirp.c b/net/slirp.c
index c627a9dd24..120eef6122 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -80,7 +80,7 @@ struct slirp_config_str {
 };
 
 struct GuestFwd {
-    CharBackend hd;
+    CharFrontend hd;
     struct in_addr server;
     int port;
     Slirp *slirp;
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 8b96157145..a4bb49bbcf 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -65,7 +65,7 @@ static const int user_feature_bits[] = {
 
 typedef struct NetVhostUserState {
     NetClientState nc;
-    CharBackend chr; /* only queue index 0 */
+    CharFrontend chr; /* only queue index 0 */
     VhostUserState *vhost_user;
     VHostNetState *vhost_net;
     guint watch;
diff --git a/semihosting/console.c b/semihosting/console.c
index c3683a1566..9da05e9f16 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -30,7 +30,7 @@
 
 /* Access to this structure is protected by the BQL */
 typedef struct SemihostingConsole {
-    CharBackend         backend;
+    CharFrontend         frontend;
     Chardev             *chr;
     GSList              *sleeping_cpus;
     bool                got;
@@ -122,8 +122,8 @@ void qemu_semihosting_console_init(Chardev *chr)
     console.chr = chr;
     if  (chr) {
         fifo8_create(&console.fifo, FIFO_SIZE);
-        qemu_chr_fe_init(&console.backend, chr, &error_abort);
-        qemu_chr_fe_set_handlers(&console.backend,
+        qemu_chr_fe_init(&console.frontend, chr, &error_abort);
+        qemu_chr_fe_set_handlers(&console.frontend,
                                  console_can_read,
                                  console_read,
                                  NULL, NULL, &console,
diff --git a/system/qtest.c b/system/qtest.c
index fa42c9f921..e4d1cd75da 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -44,7 +44,7 @@ struct QTest {
     bool has_machine_link;
     char *chr_name;
     Chardev *chr;
-    CharBackend qtest_chr;
+    CharFrontend qtest_chr;
     char *log;
 };
 
@@ -293,20 +293,20 @@ static void G_GNUC_PRINTF(1, 2) qtest_log_send(const char *fmt, ...)
 static void qtest_server_char_be_send(void *opaque, const char *str)
 {
     size_t len = strlen(str);
-    CharBackend* chr = (CharBackend *)opaque;
+    CharFrontend* chr = (CharFrontend *)opaque;
     qemu_chr_fe_write_all(chr, (uint8_t *)str, len);
     if (qtest_log_fp && qtest_opened) {
         fprintf(qtest_log_fp, "%s", str);
     }
 }
 
-static void qtest_send(CharBackend *chr, const char *str)
+static void qtest_send(CharFrontend *chr, const char *str)
 {
     qtest_log_timestamp();
     qtest_server_send(qtest_server_send_opaque, str);
 }
 
-void qtest_sendf(CharBackend *chr, const char *fmt, ...)
+void qtest_sendf(CharFrontend *chr, const char *fmt, ...)
 {
     va_list ap;
     gchar *buffer;
@@ -324,16 +324,16 @@ static void qtest_irq_handler(void *opaque, int n, int level)
     qemu_set_irq(old_irq, level);
 
     if (irq_levels[n] != level) {
-        CharBackend *chr = &qtest->qtest_chr;
+        CharFrontend *chr = &qtest->qtest_chr;
         irq_levels[n] = level;
         qtest_sendf(chr, "IRQ %s %d\n",
                     level ? "raise" : "lower", n);
     }
 }
 
-static bool (*process_command_cb)(CharBackend *chr, gchar **words);
+static bool (*process_command_cb)(CharFrontend *chr, gchar **words);
 
-void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words))
+void qtest_set_command_cb(bool (*pc_cb)(CharFrontend *chr, gchar **words))
 {
     assert(!process_command_cb);  /* Switch to a list if we need more than one */
 
@@ -349,7 +349,7 @@ static void qtest_install_gpio_out_intercept(DeviceState *dev, const char *name,
     *disconnected = qdev_intercept_gpio_out(dev, icpt, name, n);
 }
 
-static void qtest_process_command(CharBackend *chr, gchar **words)
+static void qtest_process_command(CharFrontend *chr, gchar **words)
 {
     const gchar *command;
 
@@ -757,7 +757,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
  * Process as much of @inbuf as we can in newline terminated chunks.
  * Remove the processed commands from @inbuf as we go.
  */
-static void qtest_process_inbuf(CharBackend *chr, GString *inbuf)
+static void qtest_process_inbuf(CharFrontend *chr, GString *inbuf)
 {
     char *end;
 
@@ -773,7 +773,7 @@ static void qtest_process_inbuf(CharBackend *chr, GString *inbuf)
 
 static void qtest_read(void *opaque, const uint8_t *buf, int size)
 {
-    CharBackend *chr = opaque;
+    CharFrontend *chr = opaque;
 
     g_string_append_len(inbuf, (const gchar *)buf, size);
     qtest_process_inbuf(chr, inbuf);
diff --git a/target/hppa/sys_helper.c b/target/hppa/sys_helper.c
index 6e65fadcc7..9a996c131e 100644
--- a/target/hppa/sys_helper.c
+++ b/target/hppa/sys_helper.c
@@ -135,7 +135,7 @@ void HELPER(rfi_r)(CPUHPPAState *env)
  */
 void HELPER(diag_console_output)(CPUHPPAState *env)
 {
-    CharBackend *serial_backend;
+    CharFrontend *serial_backend;
     Chardev *serial_port;
     unsigned char c;
 
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 431c263dc5..98b003faf2 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -148,7 +148,7 @@ static uint32_t errno_h2g(int host_errno)
 }
 
 typedef struct XtensaSimConsole {
-    CharBackend be;
+    CharFrontend be;
     struct {
         char buffer[16];
         size_t offset;
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 609ff24059..d2bb21d5b9 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -155,7 +155,7 @@ typedef struct TestServer {
     gchar *mig_path;
     gchar *chr_name;
     gchar *tmpfs;
-    CharBackend chr;
+    CharFrontend chr;
     int fds_num;
     int fds[VHOST_MEMORY_MAX_NREGIONS];
     VhostUserMemory memory;
@@ -180,10 +180,10 @@ struct vhost_user_ops {
 
     /* VHOST-USER commands. */
     uint64_t (*get_features)(TestServer *s);
-    void (*set_features)(TestServer *s, CharBackend *chr,
+    void (*set_features)(TestServer *s, CharFrontend *chr,
                          VhostUserMsg *msg);
     void (*get_protocol_features)(TestServer *s,
-                                  CharBackend *chr, VhostUserMsg *msg);
+                                  CharFrontend *chr, VhostUserMsg *msg);
 };
 
 static const char *init_hugepagefs(void);
@@ -331,7 +331,7 @@ static int chr_can_read(void *opaque)
 static void chr_read(void *opaque, const uint8_t *buf, int size)
 {
     TestServer *s = opaque;
-    CharBackend *chr = &s->chr;
+    CharFrontend *chr = &s->chr;
     VhostUserMsg msg;
     uint8_t *p = (uint8_t *) &msg;
     int fd = -1;
@@ -1051,7 +1051,7 @@ static uint64_t vu_net_get_features(TestServer *s)
     return features;
 }
 
-static void vu_net_set_features(TestServer *s, CharBackend *chr,
+static void vu_net_set_features(TestServer *s, CharFrontend *chr,
                                 VhostUserMsg *msg)
 {
     g_assert(msg->payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES));
@@ -1061,7 +1061,7 @@ static void vu_net_set_features(TestServer *s, CharBackend *chr,
     }
 }
 
-static void vu_net_get_protocol_features(TestServer *s, CharBackend *chr,
+static void vu_net_get_protocol_features(TestServer *s, CharFrontend *chr,
         VhostUserMsg *msg)
 {
     /* send back features to qemu */
@@ -1148,7 +1148,7 @@ static uint64_t vu_gpio_get_features(TestServer *s)
  * that we support VHOST_USER_PROTOCOL_F_CONFIG as gpio would use it
  * talking to a read vhost-user daemon.
  */
-static void vu_gpio_get_protocol_features(TestServer *s, CharBackend *chr,
+static void vu_gpio_get_protocol_features(TestServer *s, CharFrontend *chr,
                                           VhostUserMsg *msg)
 {
     /* send back features to qemu */
@@ -1191,7 +1191,7 @@ static uint64_t vu_scmi_get_features(TestServer *s)
         0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
 }
 
-static void vu_scmi_get_protocol_features(TestServer *s, CharBackend *chr,
+static void vu_scmi_get_protocol_features(TestServer *s, CharFrontend *chr,
                                           VhostUserMsg *msg)
 {
     msg->flags |= VHOST_USER_REPLY_MASK;
diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index f30a39f61f..8924c2c1ff 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -107,18 +107,18 @@ static void char_console_test(void)
 static void char_stdio_test_subprocess(void)
 {
     Chardev *chr;
-    CharBackend be;
+    CharFrontend c;
     int ret;
 
     chr = qemu_chr_new("label", "stdio", NULL);
     g_assert_nonnull(chr);
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
-    qemu_chr_fe_set_open(&be, true);
-    ret = qemu_chr_fe_write(&be, (void *)"buf", 4);
+    qemu_chr_fe_init(&c, chr, &error_abort);
+    qemu_chr_fe_set_open(&c, true);
+    ret = qemu_chr_fe_write(&c, (void *)"buf", 4);
     g_assert_cmpint(ret, ==, 4);
 
-    qemu_chr_fe_deinit(&be, true);
+    qemu_chr_fe_deinit(&c, true);
 }
 
 static void char_stdio_test(void)
@@ -132,7 +132,7 @@ static void char_ringbuf_test(void)
 {
     QemuOpts *opts;
     Chardev *chr;
-    CharBackend be;
+    CharFrontend c;
     char *data;
     int ret;
 
@@ -153,8 +153,8 @@ static void char_ringbuf_test(void)
     g_assert_nonnull(chr);
     qemu_opts_del(opts);
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
-    ret = qemu_chr_fe_write(&be, (void *)"buff", 4);
+    qemu_chr_fe_init(&c, chr, &error_abort);
+    ret = qemu_chr_fe_write(&c, (void *)"buff", 4);
     g_assert_cmpint(ret, ==, 4);
 
     data = qmp_ringbuf_read("ringbuf-label", 4, false, 0, &error_abort);
@@ -165,7 +165,7 @@ static void char_ringbuf_test(void)
     g_assert_cmpstr(data, ==, "");
     g_free(data);
 
-    qemu_chr_fe_deinit(&be, true);
+    qemu_chr_fe_deinit(&c, true);
 
     /* check alias */
     opts = qemu_opts_create(qemu_find_opts("chardev"), "memory-label",
@@ -184,7 +184,7 @@ static void char_mux_test(void)
     Chardev *chr, *base;
     char *data;
     FeHandler h1 = { 0, false, 0, false, }, h2 = { 0, false, 0, false, };
-    CharBackend chr_be1, chr_be2;
+    CharFrontend chr_fe1, chr_fe2;
     Error *error = NULL;
 
     /* Create mux and chardev to be immediately removed */
@@ -210,8 +210,8 @@ static void char_mux_test(void)
     g_assert_nonnull(chr);
     qemu_opts_del(opts);
 
-    qemu_chr_fe_init(&chr_be1, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&chr_be1,
+    qemu_chr_fe_init(&chr_fe1, chr, &error_abort);
+    qemu_chr_fe_set_handlers(&chr_fe1,
                              fe_can_read,
                              fe_read,
                              fe_event,
@@ -219,15 +219,15 @@ static void char_mux_test(void)
                              &h1,
                              NULL, true);
 
-    qemu_chr_fe_init(&chr_be2, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&chr_be2,
+    qemu_chr_fe_init(&chr_fe2, chr, &error_abort);
+    qemu_chr_fe_set_handlers(&chr_fe2,
                              fe_can_read,
                              fe_read,
                              fe_event,
                              NULL,
                              &h2,
                              NULL, true);
-    qemu_chr_fe_take_focus(&chr_be2);
+    qemu_chr_fe_take_focus(&chr_fe2);
 
     base = qemu_chr_find("mux-label-base");
     g_assert_cmpint(qemu_chr_be_can_write(base), !=, 0);
@@ -271,8 +271,8 @@ static void char_mux_test(void)
     g_assert_cmpint(h2.last_event, ==, CHR_EVENT_MUX_OUT);
 
     /* open/close state and corresponding events */
-    g_assert_true(qemu_chr_fe_backend_open(&chr_be1));
-    g_assert_true(qemu_chr_fe_backend_open(&chr_be2));
+    g_assert_true(qemu_chr_fe_backend_open(&chr_fe1));
+    g_assert_true(qemu_chr_fe_backend_open(&chr_fe2));
     g_assert_true(h1.is_open);
     g_assert_false(h1.openclose_mismatch);
     g_assert_true(h2.is_open);
@@ -280,22 +280,22 @@ static void char_mux_test(void)
 
     h1.openclose_count = h2.openclose_count = 0;
 
-    qemu_chr_fe_set_handlers(&chr_be1, NULL, NULL, NULL, NULL,
+    qemu_chr_fe_set_handlers(&chr_fe1, NULL, NULL, NULL, NULL,
                              NULL, NULL, false);
-    qemu_chr_fe_set_handlers(&chr_be2, NULL, NULL, NULL, NULL,
+    qemu_chr_fe_set_handlers(&chr_fe2, NULL, NULL, NULL, NULL,
                              NULL, NULL, false);
     g_assert_cmpint(h1.openclose_count, ==, 0);
     g_assert_cmpint(h2.openclose_count, ==, 0);
 
     h1.is_open = h2.is_open = false;
-    qemu_chr_fe_set_handlers(&chr_be1,
+    qemu_chr_fe_set_handlers(&chr_fe1,
                              NULL,
                              NULL,
                              fe_event,
                              NULL,
                              &h1,
                              NULL, false);
-    qemu_chr_fe_set_handlers(&chr_be2,
+    qemu_chr_fe_set_handlers(&chr_fe2,
                              NULL,
                              NULL,
                              fe_event,
@@ -314,14 +314,14 @@ static void char_mux_test(void)
     g_assert_cmpint(h2.openclose_count, ==, 3);
     g_assert_false(h2.openclose_mismatch);
 
-    qemu_chr_fe_set_handlers(&chr_be2,
+    qemu_chr_fe_set_handlers(&chr_fe2,
                              fe_can_read,
                              fe_read,
                              fe_event,
                              NULL,
                              &h2,
                              NULL, false);
-    qemu_chr_fe_set_handlers(&chr_be1,
+    qemu_chr_fe_set_handlers(&chr_fe1,
                              fe_can_read,
                              fe_read,
                              fe_event,
@@ -330,7 +330,7 @@ static void char_mux_test(void)
                              NULL, false);
 
     /* remove first handler */
-    qemu_chr_fe_set_handlers(&chr_be1, NULL, NULL, NULL, NULL,
+    qemu_chr_fe_set_handlers(&chr_fe1, NULL, NULL, NULL, NULL,
                              NULL, NULL, true);
     qemu_chr_be_write(base, (void *)"hello", 6);
     g_assert_cmpint(h1.read_count, ==, 0);
@@ -349,13 +349,13 @@ static void char_mux_test(void)
     g_assert_cmpint(strlen(data), !=, 0);
     g_free(data);
 
-    qemu_chr_fe_deinit(&chr_be1, false);
+    qemu_chr_fe_deinit(&chr_fe1, false);
 
     qmp_chardev_remove("mux-label", &error);
     g_assert_cmpstr(error_get_pretty(error), ==, "Chardev 'mux-label' is busy");
     error_free(error);
 
-    qemu_chr_fe_deinit(&chr_be2, false);
+    qemu_chr_fe_deinit(&chr_fe2, false);
     qmp_chardev_remove("mux-label", &error_abort);
 }
 
@@ -366,7 +366,7 @@ static void char_hub_test(void)
     char *data;
     FeHandler h = { 0, false, 0, false, };
     Error *error = NULL;
-    CharBackend chr_be;
+    CharFrontend chr_fe;
     int ret, i;
 
 #define RB_SIZE 128
@@ -497,8 +497,8 @@ static void char_hub_test(void)
     qemu_opts_del(opts);
 
     /* Attach hub to a frontend */
-    qemu_chr_fe_init(&chr_be, hub, &error_abort);
-    qemu_chr_fe_set_handlers(&chr_be,
+    qemu_chr_fe_init(&chr_fe, hub, &error_abort);
+    qemu_chr_fe_set_handlers(&chr_fe,
                              fe_can_read,
                              fe_read,
                              fe_event,
@@ -507,7 +507,7 @@ static void char_hub_test(void)
                              NULL, true);
 
     /* Fails second time */
-    qemu_chr_fe_init(&chr_be, hub, &error);
+    qemu_chr_fe_init(&chr_fe, hub, &error);
     g_assert_cmpstr(error_get_pretty(error), ==, "chardev 'hub0' is already in use");
     error_free(error);
     error = NULL;
@@ -531,7 +531,7 @@ static void char_hub_test(void)
     h.read_count = 0;
 
     /* Write to frontend, chr_be */
-    ret = qemu_chr_fe_write(&chr_be, (void *)"heyhey", 6);
+    ret = qemu_chr_fe_write(&chr_fe, (void *)"heyhey", 6);
     g_assert_cmpint(ret, ==, 6);
 
     data = qmp_ringbuf_read("chr1", RB_SIZE, false, 0, &error_abort);
@@ -557,7 +557,7 @@ static void char_hub_test(void)
     error = NULL;
 
     /* Finalize frontend */
-    qemu_chr_fe_deinit(&chr_be, false);
+    qemu_chr_fe_deinit(&chr_fe, false);
 
     /* Finalize hub0 */
     qmp_chardev_remove("hub0", &error_abort);
@@ -632,8 +632,8 @@ static void char_hub_test(void)
         qemu_opts_del(opts);
 
         /* Attach hub to a frontend */
-        qemu_chr_fe_init(&chr_be, hub, &error_abort);
-        qemu_chr_fe_set_handlers(&chr_be,
+        qemu_chr_fe_init(&chr_fe, hub, &error_abort);
+        qemu_chr_fe_set_handlers(&chr_fe,
                                  fe_can_read,
                                  fe_read,
                                  fe_event,
@@ -642,7 +642,7 @@ static void char_hub_test(void)
                                  NULL, true);
 
         /* Write to frontend, chr_be */
-        ret = qemu_chr_fe_write(&chr_be, (void *)"thisis", 6);
+        ret = qemu_chr_fe_write(&chr_fe, (void *)"thisis", 6);
         g_assert_cmpint(ret, ==, 6);
 
         data = qmp_ringbuf_read("chr1", RB_SIZE, false, 0, &error_abort);
@@ -663,7 +663,7 @@ static void char_hub_test(void)
         close(fd);
 
         /* Add watch. 0 indicates no watches if nothing to wait for */
-        ret = qemu_chr_fe_add_watch(&chr_be, G_IO_OUT | G_IO_HUP,
+        ret = qemu_chr_fe_add_watch(&chr_fe, G_IO_OUT | G_IO_HUP,
                                     NULL, NULL);
         g_assert_cmpint(ret, ==, 0);
 
@@ -672,14 +672,14 @@ static void char_hub_test(void)
          * power of two to fit nicely the whole pipe buffer.
          */
         len = 0;
-        while ((ret = qemu_chr_fe_write(&chr_be, (void *)"thisisit", 8))
+        while ((ret = qemu_chr_fe_write(&chr_fe, (void *)"thisisit", 8))
                != -1) {
             len += ret;
         }
         g_assert_cmpint(errno, ==, EAGAIN);
 
         /* Further all writes should cause EAGAIN */
-        ret = qemu_chr_fe_write(&chr_be, (void *)"b", 1);
+        ret = qemu_chr_fe_write(&chr_fe, (void *)"b", 1);
         g_assert_cmpint(ret, ==, -1);
         g_assert_cmpint(errno, ==, EAGAIN);
 
@@ -687,7 +687,7 @@ static void char_hub_test(void)
          * Add watch. Non 0 indicates we have a blocked chardev, which
          * can wakes us up when write is possible.
          */
-        ret = qemu_chr_fe_add_watch(&chr_be, G_IO_OUT | G_IO_HUP,
+        ret = qemu_chr_fe_add_watch(&chr_fe, G_IO_OUT | G_IO_HUP,
                                     NULL, NULL);
         g_assert_cmpint(ret, !=, 0);
         g_source_remove(ret);
@@ -712,10 +712,10 @@ static void char_hub_test(void)
          * was already consumed and drained by the ring buffers, but
          * pipe have not recieved that yet.
          */
-        ret = qemu_chr_fe_write(&chr_be, (void *)"thisisit", 8);
+        ret = qemu_chr_fe_write(&chr_fe, (void *)"thisisit", 8);
         g_assert_cmpint(ret, ==, 8);
 
-        ret = qemu_chr_fe_write(&chr_be, (void *)"streamisrestored", 16);
+        ret = qemu_chr_fe_write(&chr_fe, (void *)"streamisrestored", 16);
         g_assert_cmpint(ret, ==, 16);
 
         data = qmp_ringbuf_read("chr1", RB_SIZE, false, 0, &error_abort);
@@ -744,7 +744,7 @@ static void char_hub_test(void)
         g_free(pipe);
 
         /* Finalize frontend */
-        qemu_chr_fe_deinit(&chr_be, false);
+        qemu_chr_fe_deinit(&chr_fe, false);
 
         /* Finalize hub0 */
         qmp_chardev_remove("hub0", &error_abort);
@@ -828,8 +828,8 @@ static void char_websock_test(void)
     const char *port;
     char *tmp;
     char *handshake_port;
-    CharBackend be;
-    CharBackend client_be;
+    CharFrontend fe;
+    CharFrontend client_fe;
     Chardev *chr_client;
     Chardev *chr = qemu_chr_new("server",
                                 "websocket:127.0.0.1:0,server=on,wait=off", NULL);
@@ -852,13 +852,13 @@ static void char_websock_test(void)
     handshake_port = g_strdup_printf(handshake, port, port);
     qobject_unref(qdict);
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&be, websock_server_can_read, websock_server_read,
+    qemu_chr_fe_init(&fe, chr, &error_abort);
+    qemu_chr_fe_set_handlers(&fe, websock_server_can_read, websock_server_read,
                              NULL, NULL, chr, NULL, true);
 
     chr_client = qemu_chr_new("client", tmp, NULL);
-    qemu_chr_fe_init(&client_be, chr_client, &error_abort);
-    qemu_chr_fe_set_handlers(&client_be, websock_client_can_read,
+    qemu_chr_fe_init(&client_fe, chr_client, &error_abort);
+    qemu_chr_fe_set_handlers(&client_fe, websock_client_can_read,
                              websock_client_read,
                              NULL, NULL, chr_client, NULL, true);
     g_free(tmp);
@@ -887,7 +887,7 @@ static void char_pipe_test(void)
     gchar *tmp_path = g_dir_make_tmp("qemu-test-char.XXXXXX", NULL);
     gchar *tmp, *in, *out, *pipe = g_build_filename(tmp_path, "pipe", NULL);
     Chardev *chr;
-    CharBackend be;
+    CharFrontend c;
     int ret, fd;
     char buf[10];
     FeHandler fe = { 0, };
@@ -906,9 +906,9 @@ static void char_pipe_test(void)
     g_assert_nonnull(chr);
     g_free(tmp);
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
+    qemu_chr_fe_init(&c, chr, &error_abort);
 
-    ret = qemu_chr_fe_write(&be, (void *)"pipe-out", 9);
+    ret = qemu_chr_fe_write(&c, (void *)"pipe-out", 9);
     g_assert_cmpint(ret, ==, 9);
 
     fd = open(out, O_RDWR);
@@ -922,7 +922,7 @@ static void char_pipe_test(void)
     g_assert_cmpint(ret, ==, 8);
     close(fd);
 
-    qemu_chr_fe_set_handlers(&be,
+    qemu_chr_fe_set_handlers(&c,
                              fe_can_read,
                              fe_read,
                              fe_event,
@@ -935,7 +935,7 @@ static void char_pipe_test(void)
     g_assert_cmpint(fe.read_count, ==, 8);
     g_assert_cmpstr(fe.read_buf, ==, "pipe-in");
 
-    qemu_chr_fe_deinit(&be, true);
+    qemu_chr_fe_deinit(&c, true);
 
     g_assert(g_unlink(in) == 0);
     g_assert(g_unlink(out) == 0);
@@ -951,8 +951,8 @@ typedef struct SocketIdleData {
     GMainLoop *loop;
     Chardev *chr;
     bool conn_expected;
-    CharBackend *be;
-    CharBackend *client_be;
+    CharFrontend *fe;
+    CharFrontend *client_fe;
 } SocketIdleData;
 
 
@@ -993,7 +993,7 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
     struct sockaddr_in other;
     SocketIdleData d = { 0, };
     Chardev *chr;
-    CharBackend stack_be, *be = &stack_be;
+    CharFrontend stack_fe, *fe = &stack_fe;
     socklen_t alen = sizeof(other);
     int ret;
     char buf[10];
@@ -1001,7 +1001,7 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
 
     if (reuse_chr) {
         chr = reuse_chr;
-        be = chr->be;
+        fe = chr->be;
     } else {
         int port;
         sock = make_udp_socket(&port);
@@ -1009,11 +1009,11 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
         chr = qemu_chr_new("client", tmp, NULL);
         g_assert_nonnull(chr);
 
-        qemu_chr_fe_init(be, chr, &error_abort);
+        qemu_chr_fe_init(fe, chr, &error_abort);
     }
 
     d.chr = chr;
-    qemu_chr_fe_set_handlers(be, socket_can_read_hello, socket_read_hello,
+    qemu_chr_fe_set_handlers(fe, socket_can_read_hello, socket_read_hello,
                              NULL, NULL, &d, NULL, true);
     ret = qemu_chr_write_all(chr, (uint8_t *)"hello", 5);
     g_assert_cmpint(ret, ==, 5);
@@ -1028,7 +1028,7 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
 
     if (!reuse_chr) {
         close(sock);
-        qemu_chr_fe_deinit(be, true);
+        qemu_chr_fe_deinit(fe, true);
     }
     g_free(tmp);
 }
@@ -1042,7 +1042,7 @@ static void char_udp_test(void)
 typedef struct {
     int event;
     bool got_pong;
-    CharBackend *be;
+    CharFrontend *fe;
 } CharSocketTestData;
 
 
@@ -1063,13 +1063,13 @@ char_socket_event_with_error(void *opaque, QEMUChrEvent event)
 {
     static bool first_error;
     CharSocketTestData *data = opaque;
-    CharBackend *be = data->be;
+    CharFrontend *fe = data->fe;
     data->event = event;
     switch (event) {
     case CHR_EVENT_OPENED:
         if (!first_error) {
             first_error = true;
-            qemu_chr_fe_disconnect(be);
+            qemu_chr_fe_disconnect(fe);
         }
         return;
     case CHR_EVENT_CLOSED:
@@ -1185,7 +1185,7 @@ static void char_socket_server_test(gconstpointer opaque)
 {
     const CharSocketServerTestConfig *config = opaque;
     Chardev *chr;
-    CharBackend be = {0};
+    CharFrontend c = {0};
     CharSocketTestData data = {0};
     QObject *qaddr;
     SocketAddress *addr;
@@ -1224,12 +1224,12 @@ static void char_socket_server_test(gconstpointer opaque)
     visit_free(v);
     qobject_unref(qaddr);
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
+    qemu_chr_fe_init(&c, chr, &error_abort);
 
  reconnect:
     data.event = -1;
-    data.be = &be;
-    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+    data.fe = &c;
+    qemu_chr_fe_set_handlers(&c, NULL, NULL,
                              char_socket_event, NULL,
                              &data, NULL, true);
     g_assert(data.event == -1);
@@ -1260,13 +1260,13 @@ static void char_socket_server_test(gconstpointer opaque)
     data.event = -1;
 
     /* Send a greeting to the client */
-    ret = qemu_chr_fe_write_all(&be, (const uint8_t *)SOCKET_PING,
+    ret = qemu_chr_fe_write_all(&c, (const uint8_t *)SOCKET_PING,
                                 sizeof(SOCKET_PING));
     g_assert_cmpint(ret, ==, sizeof(SOCKET_PING));
     g_assert(data.event == -1);
 
     /* Setup a callback to receive the reply to our greeting */
-    qemu_chr_fe_set_handlers(&be, char_socket_can_read,
+    qemu_chr_fe_set_handlers(&c, char_socket_can_read,
                              char_socket_read,
                              char_socket_event, NULL,
                              &data, NULL, true);
@@ -1375,7 +1375,7 @@ static void char_socket_client_test(gconstpointer opaque)
     QIOChannelSocket *ioc;
     char *optstr;
     Chardev *chr;
-    CharBackend be = {0};
+    CharFrontend c = {0};
     CharSocketTestData data = {0};
     SocketAddress *addr;
     QemuThread thread;
@@ -1431,12 +1431,12 @@ static void char_socket_client_test(gconstpointer opaque)
                                           &error_abort));
     }
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
+    qemu_chr_fe_init(&c, chr, &error_abort);
 
  reconnect:
     data.event = -1;
-    data.be = &be;
-    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+    data.fe = &c;
+    qemu_chr_fe_set_handlers(&c, NULL, NULL,
                              event_cb, NULL,
                              &data, NULL, true);
     if (config->reconnect) {
@@ -1467,13 +1467,13 @@ static void char_socket_client_test(gconstpointer opaque)
     g_assert(object_property_get_bool(OBJECT(chr), "connected", &error_abort));
 
     /* Send a greeting to the server */
-    ret = qemu_chr_fe_write_all(&be, (const uint8_t *)SOCKET_PING,
+    ret = qemu_chr_fe_write_all(&c, (const uint8_t *)SOCKET_PING,
                                 sizeof(SOCKET_PING));
     g_assert_cmpint(ret, ==, sizeof(SOCKET_PING));
     g_assert(data.event == -1);
 
     /* Setup a callback to receive the reply to our greeting */
-    qemu_chr_fe_set_handlers(&be, char_socket_can_read,
+    qemu_chr_fe_set_handlers(&c, char_socket_can_read,
                              char_socket_read,
                              event_cb, NULL,
                              &data, NULL, true);
@@ -1521,7 +1521,7 @@ static void char_socket_server_two_clients_test(gconstpointer opaque)
 {
     SocketAddress *incoming_addr = (gpointer) opaque;
     Chardev *chr;
-    CharBackend be = {0};
+    CharFrontend c = {0};
     QObject *qaddr;
     SocketAddress *addr;
     Visitor *v;
@@ -1558,9 +1558,9 @@ static void char_socket_server_two_clients_test(gconstpointer opaque)
     visit_free(v);
     qobject_unref(qaddr);
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
+    qemu_chr_fe_init(&c, chr, &error_abort);
 
-    qemu_chr_fe_set_handlers(&be, char_socket_can_read, char_socket_discard_read,
+    qemu_chr_fe_set_handlers(&c, char_socket_can_read, char_socket_discard_read,
                              count_closed_event, NULL,
                              &closed, NULL, true);
 
@@ -1570,7 +1570,7 @@ static void char_socket_server_two_clients_test(gconstpointer opaque)
 
     /* switch the chardev to another context */
     GMainContext *ctx = g_main_context_new();
-    qemu_chr_fe_set_handlers(&be, char_socket_can_read, char_socket_discard_read,
+    qemu_chr_fe_set_handlers(&c, char_socket_can_read, char_socket_discard_read,
                              count_closed_event, NULL,
                              &closed, ctx, true);
 
@@ -1649,7 +1649,7 @@ static void char_parallel_test(void)
 static void char_file_fifo_test(void)
 {
     Chardev *chr;
-    CharBackend be;
+    CharFrontend c;
     char *tmp_path = g_dir_make_tmp("qemu-test-char.XXXXXX", NULL);
     char *fifo = g_build_filename(tmp_path, "fifo", NULL);
     char *out = g_build_filename(tmp_path, "out", NULL);
@@ -1671,8 +1671,8 @@ static void char_file_fifo_test(void)
     chr = qemu_chardev_new("label-file", TYPE_CHARDEV_FILE, &backend,
                            NULL, &error_abort);
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&be,
+    qemu_chr_fe_init(&c, chr, &error_abort);
+    qemu_chr_fe_set_handlers(&c,
                              fe_can_read,
                              fe_read,
                              fe_event,
@@ -1692,7 +1692,7 @@ static void char_file_fifo_test(void)
     g_assert_cmpint(fe.read_count, ==, 8);
     g_assert_cmpstr(fe.read_buf, ==, "fifo-in");
 
-    qemu_chr_fe_deinit(&be, true);
+    qemu_chr_fe_deinit(&c, true);
 
     g_unlink(fifo);
     g_free(fifo);
@@ -1752,7 +1752,7 @@ static void char_null_test(void)
 {
     Error *err = NULL;
     Chardev *chr;
-    CharBackend be;
+    CharFrontend c;
     int ret;
 
     chr = qemu_chr_find("label-null");
@@ -1768,27 +1768,27 @@ static void char_null_test(void)
                  QEMU_CHAR_FEATURE_RECONNECTABLE) == false);
 
     /* check max avail */
-    qemu_chr_fe_init(&be, chr, &error_abort);
-    qemu_chr_fe_init(&be, chr, &err);
+    qemu_chr_fe_init(&c, chr, &error_abort);
+    qemu_chr_fe_init(&c, chr, &err);
     error_free_or_abort(&err);
 
     /* deinit & reinit */
-    qemu_chr_fe_deinit(&be, false);
-    qemu_chr_fe_init(&be, chr, &error_abort);
+    qemu_chr_fe_deinit(&c, false);
+    qemu_chr_fe_init(&c, chr, &error_abort);
 
-    qemu_chr_fe_set_open(&be, true);
+    qemu_chr_fe_set_open(&c, true);
 
-    qemu_chr_fe_set_handlers(&be,
+    qemu_chr_fe_set_handlers(&c,
                              fe_can_read,
                              fe_read,
                              fe_event,
                              NULL,
                              NULL, NULL, true);
 
-    ret = qemu_chr_fe_write(&be, (void *)"buf", 4);
+    ret = qemu_chr_fe_write(&c, (void *)"buf", 4);
     g_assert_cmpint(ret, ==, 4);
 
-    qemu_chr_fe_deinit(&be, true);
+    qemu_chr_fe_deinit(&c, true);
 }
 
 static void char_invalid_test(void)
@@ -1814,7 +1814,7 @@ static void char_hotswap_test(void)
 {
     char *chr_args;
     Chardev *chr;
-    CharBackend be;
+    CharFrontend c;
 
     gchar *tmp_path = g_dir_make_tmp("qemu-test-char.XXXXXX", NULL);
     char *filename = g_build_filename(tmp_path, "file", NULL);
@@ -1830,32 +1830,32 @@ static void char_hotswap_test(void)
     chr_args = g_strdup_printf("udp:127.0.0.1:%d", port);
 
     chr = qemu_chr_new("chardev", chr_args, NULL);
-    qemu_chr_fe_init(&be, chr, &error_abort);
+    qemu_chr_fe_init(&c, chr, &error_abort);
 
     /* check that chardev operates correctly */
     char_udp_test_internal(chr, sock);
 
     /* set the handler that denies the hotswap */
-    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+    qemu_chr_fe_set_handlers(&c, NULL, NULL,
                              NULL, chardev_change_denied, NULL, NULL, true);
 
     /* now, change is denied and has to keep the old backend operating */
     ret = qmp_chardev_change("chardev", &backend, NULL);
     g_assert(!ret);
-    g_assert(be.chr == chr);
+    g_assert(c.chr == chr);
 
     char_udp_test_internal(chr, sock);
 
     /* now allow the change */
-    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+    qemu_chr_fe_set_handlers(&c, NULL, NULL,
                              NULL, chardev_change, NULL, NULL, true);
 
     /* has to succeed now */
     ret = qmp_chardev_change("chardev", &backend, &error_abort);
-    g_assert(be.chr != chr);
+    g_assert(c.chr != chr);
 
     close(sock);
-    chr = be.chr;
+    chr = c.chr;
 
     /* run the file chardev test */
     char_file_test_internal(chr, filename);
diff --git a/tests/unit/test-yank.c b/tests/unit/test-yank.c
index 4acfb2f3f6..9fc86a2128 100644
--- a/tests/unit/test-yank.c
+++ b/tests/unit/test-yank.c
@@ -65,7 +65,7 @@ static void char_change_test(gconstpointer opaque)
     CharChangeTestConfig *conf = (gpointer) opaque;
     SocketAddress *addr;
     Chardev *chr;
-    CharBackend be;
+    CharFrontend fe;
     ChardevReturn *ret;
     QIOChannelSocket *ioc;
     QemuThread thread;
@@ -144,9 +144,9 @@ static void char_change_test(gconstpointer opaque)
         qemu_thread_join(&thread);
     }
 
-    qemu_chr_fe_init(&be, chr, &error_abort);
+    qemu_chr_fe_init(&fe, chr, &error_abort);
     /* allow chardev-change */
-    qemu_chr_fe_set_handlers(&be, NULL, NULL,
+    qemu_chr_fe_set_handlers(&fe, NULL, NULL,
                              NULL, chardev_change, NULL, NULL, true);
 
     if (conf->fail) {
@@ -154,7 +154,7 @@ static void char_change_test(gconstpointer opaque)
         ret = qmp_chardev_change("chardev", &fail_backend[conf->new_yank],
                                  NULL);
         g_assert_null(ret);
-        g_assert(be.chr == chr);
+        g_assert(fe.chr == chr);
         g_assert(is_yank_instance_registered() == conf->old_yank);
         g_unsetenv("QTEST_SILENT_ERRORS");
     } else {
@@ -168,11 +168,11 @@ static void char_change_test(gconstpointer opaque)
             qemu_thread_join(&thread);
         }
         g_assert_nonnull(ret);
-        g_assert(be.chr != chr);
+        g_assert(fe.chr != chr);
         g_assert(is_yank_instance_registered() == conf->new_yank);
     }
 
-    object_unparent(OBJECT(be.chr));
+    object_unparent(OBJECT(fe.chr));
     object_unref(OBJECT(ioc));
     qapi_free_ChardevReturn(ret);
     qapi_free_SocketAddress(addr);
diff --git a/rust/bindings/src/lib.rs b/rust/bindings/src/lib.rs
index 5bf03b1370..4c9bb794f7 100644
--- a/rust/bindings/src/lib.rs
+++ b/rust/bindings/src/lib.rs
@@ -28,8 +28,8 @@
 // BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
 // When bindings for character devices are introduced, this can be
 // moved to the Opaque<> wrapper in src/chardev.rs.
-unsafe impl Send for CharBackend {}
-unsafe impl Sync for CharBackend {}
+unsafe impl Send for CharFrontend {}
+unsafe impl Sync for CharFrontend {}
 
 // SAFETY: this is a pure data struct
 unsafe impl Send for CoalescedMemoryRange {}
diff --git a/rust/chardev/src/bindings.rs b/rust/chardev/src/bindings.rs
index c95dc89c56..85a416f3d1 100644
--- a/rust/chardev/src/bindings.rs
+++ b/rust/chardev/src/bindings.rs
@@ -34,7 +34,7 @@
 // BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
 // When bindings for character devices are introduced, this can be
 // moved to the Opaque<> wrapper in src/chardev.rs.
-unsafe impl Send for CharBackend {}
-unsafe impl Sync for CharBackend {}
+unsafe impl Send for CharFrontend {}
+unsafe impl Sync for CharFrontend {}
 
-unsafe impl Zeroable for CharBackend {}
+unsafe impl Zeroable for CharFrontend {}
diff --git a/rust/chardev/src/chardev.rs b/rust/chardev/src/chardev.rs
index 2014479674..f0b7975dbf 100644
--- a/rust/chardev/src/chardev.rs
+++ b/rust/chardev/src/chardev.rs
@@ -6,7 +6,7 @@
 //!
 //! Character devices in QEMU can run under the big QEMU lock or in a separate
 //! `GMainContext`. Here we only support the former, because the bindings
-//! enforce that the BQL is taken whenever the functions in [`CharBackend`] are
+//! enforce that the BQL is taken whenever the functions in [`CharFrontend`] are
 //! called.
 
 use std::{
@@ -32,25 +32,25 @@
 pub type ChardevClass = bindings::ChardevClass;
 pub type Event = bindings::QEMUChrEvent;
 
-/// A safe wrapper around [`bindings::CharBackend`], denoting the character
+/// A safe wrapper around [`bindings::CharFrontend`], denoting the character
 /// back-end that is used for example by a device.  Compared to the
 /// underlying C struct it adds BQL protection, and is marked as pinned
 /// because the QOM object ([`bindings::Chardev`]) contains a pointer to
-/// the `CharBackend`.
-pub struct CharBackend {
-    inner: BqlRefCell<bindings::CharBackend>,
+/// the `CharFrontend`.
+pub struct CharFrontend {
+    inner: BqlRefCell<bindings::CharFrontend>,
     _pin: PhantomPinned,
 }
 
-pub struct CharBackendMut<'a>(BqlRefMut<'a, bindings::CharBackend>);
+pub struct CharFrontendMut<'a>(BqlRefMut<'a, bindings::CharFrontend>);
 
-impl Write for CharBackendMut<'_> {
+impl Write for CharFrontendMut<'_> {
     fn flush(&mut self) -> io::Result<()> {
         Ok(())
     }
 
     fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
-        let chr: &mut bindings::CharBackend = &mut self.0;
+        let chr: &mut bindings::CharFrontend = &mut self.0;
 
         let len = buf.len().try_into().unwrap();
         let r = unsafe { bindings::qemu_chr_fe_write(addr_of_mut!(*chr), buf.as_ptr(), len) };
@@ -58,7 +58,7 @@ fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
     }
 
     fn write_all(&mut self, buf: &[u8]) -> io::Result<()> {
-        let chr: &mut bindings::CharBackend = &mut self.0;
+        let chr: &mut bindings::CharFrontend = &mut self.0;
 
         let len = buf.len().try_into().unwrap();
         let r = unsafe { bindings::qemu_chr_fe_write_all(addr_of_mut!(*chr), buf.as_ptr(), len) };
@@ -72,7 +72,7 @@ fn write_all(&mut self, buf: &[u8]) -> io::Result<()> {
     }
 }
 
-impl Debug for CharBackend {
+impl Debug for CharFrontend {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         // SAFETY: accessed just to print the values
         let chr = self.inner.as_ptr();
@@ -81,13 +81,13 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 // FIXME: use something like PinnedDrop from the pinned_init crate
-impl Drop for CharBackend {
+impl Drop for CharFrontend {
     fn drop(&mut self) {
         self.disable_handlers();
     }
 }
 
-impl CharBackend {
+impl CharFrontend {
     /// Enable the front-end's character device handlers, if there is an
     /// associated `Chardev`.
     pub fn enable_handlers<
@@ -198,7 +198,7 @@ pub fn accept_input(&self) {
     /// the big QEMU lock while the character device is borrowed, as
     /// that might cause C code to write to the character device.
     pub fn borrow_mut(&self) -> impl Write + '_ {
-        CharBackendMut(self.inner.borrow_mut())
+        CharFrontendMut(self.inner.borrow_mut())
     }
 
     /// Send a continuous stream of zero bits on the line if `enabled` is
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 8889d6e54f..5e9b13fdf9 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -5,7 +5,7 @@
 use std::{ffi::CStr, mem::size_of};
 
 use bql::BqlRefCell;
-use chardev::{CharBackend, Chardev, Event};
+use chardev::{CharFrontend, Chardev, Event};
 use common::{static_assert, uninit_field_mut};
 use hwcore::{
     Clock, ClockEvent, DeviceImpl, DeviceMethods, DeviceState, IRQState, InterruptSource,
@@ -106,7 +106,7 @@ pub struct PL011State {
     pub iomem: MemoryRegion,
     #[doc(alias = "chr")]
     #[property(rename = "chardev")]
-    pub char_backend: CharBackend,
+    pub char_frontend: CharFrontend,
     pub regs: BqlRefCell<PL011Registers>,
     /// QEMU interrupts
     ///
@@ -240,7 +240,7 @@ pub(self) fn write(&mut self, offset: RegisterOffset, value: u32, device: &PL011
                 }
                 let update = (self.line_control.send_break() != new_val.send_break()) && {
                     let break_enable = new_val.send_break();
-                    let _ = device.char_backend.send_break(break_enable);
+                    let _ = device.char_frontend.send_break(break_enable);
                     self.loopback_break(break_enable)
                 };
                 self.line_control = new_val;
@@ -561,7 +561,7 @@ fn read(&self, offset: hwaddr, _size: u32) -> u64 {
                 trace::trace_pl011_read(offset, result, c"");
                 if update_irq {
                     self.update();
-                    self.char_backend.accept_input();
+                    self.char_frontend.accept_input();
                 }
                 result.into()
             }
@@ -579,7 +579,7 @@ fn write(&self, offset: hwaddr, value: u64, _size: u32) {
                 let ch: [u8; 1] = [value as u8];
                 // XXX this blocks entire thread. Rewrite to use
                 // qemu_chr_fe_write and background I/O callbacks
-                let _ = self.char_backend.write_all(&ch);
+                let _ = self.char_frontend.write_all(&ch);
             }
 
             update_irq = self.regs.borrow_mut().write(field, value as u32, self);
@@ -645,7 +645,7 @@ fn event(&self, event: Event) {
     }
 
     fn realize(&self) -> util::Result<()> {
-        self.char_backend
+        self.char_frontend
             .enable_handlers(self, Self::can_receive, Self::receive, Self::event);
         Ok(())
     }
diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
index c3097a284d..4e983da28b 100644
--- a/rust/hw/core/src/qdev.rs
+++ b/rust/hw/core/src/qdev.rs
@@ -156,7 +156,7 @@ unsafe impl $crate::qdev::QDevProp for $type {
 impl_qdev_prop!(usize, qdev_prop_usize);
 impl_qdev_prop!(i32, qdev_prop_int32);
 impl_qdev_prop!(i64, qdev_prop_int64);
-impl_qdev_prop!(chardev::CharBackend, qdev_prop_chr);
+impl_qdev_prop!(chardev::CharFrontend, qdev_prop_chr);
 
 /// Trait to define device properties.
 ///
-- 
2.51.0


