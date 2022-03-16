Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733E34DADE1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 10:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291124.493946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUQL4-00060B-G1; Wed, 16 Mar 2022 09:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291124.493946; Wed, 16 Mar 2022 09:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUQL4-0005xO-Cq; Wed, 16 Mar 2022 09:53:06 +0000
Received: by outflank-mailman (input) for mailman id 291124;
 Wed, 16 Mar 2022 09:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VrKn=T3=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1nUQL2-0005xF-SX
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 09:53:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd0dfee1-a50e-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 10:53:01 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-eMiwzf7yMr-kZSvuTsrX5Q-1; Wed, 16 Mar 2022 05:52:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2586F801585;
 Wed, 16 Mar 2022 09:52:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDAAC40B42BB;
 Wed, 16 Mar 2022 09:52:51 +0000 (UTC)
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
X-Inumbo-ID: dd0dfee1-a50e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647424379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I73njCNnCVu6pztcu4EGw/yGZZMgbThgSSGf9KeeX7M=;
	b=KKaPElc6Y3AltkZZfv46LNewBioB9+XQIGE0JmbSGZ5JPhkNVYkW7zuB20pN00Sx6609/Z
	onqZ6JBRhCDtifmBym3A1TBcmJuuSCesG4T+NiZmzvP+Zs1CZFRZQGHTYj5oSxCSKohTzI
	94cTmugZA6CbcPUKWsvX8cw+aNTt8H8=
X-MC-Unique: eMiwzf7yMr-kZSvuTsrX5Q-1
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>,
	Greg Kurz <groug@kaod.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-block@nongnu.org (open list:blkverify),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 07/27] Replace GCC_FMT_ATTR with G_GNUC_PRINTF
Date: Wed, 16 Mar 2022 13:52:48 +0400
Message-Id: <20220316095248.2613601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marc-André Lureau <marcandre.lureau@redhat.com>

One less qemu-specific macro. It also helps to make some headers/units
only depend on glib, and thus moved in standalone projects eventually.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 audio/audio.h                           |  4 +--
 block/qcow2.h                           |  2 +-
 bsd-user/qemu.h                         |  2 +-
 hw/display/qxl.h                        |  2 +-
 hw/net/rocker/rocker.h                  |  2 +-
 hw/xen/xen_pt.h                         |  2 +-
 include/chardev/char-fe.h               |  2 +-
 include/disas/dis-asm.h                 |  2 +-
 include/hw/acpi/aml-build.h             | 12 +++----
 include/hw/core/cpu.h                   |  2 +-
 include/hw/hw.h                         |  2 +-
 include/hw/virtio/virtio.h              |  2 +-
 include/hw/xen/xen-bus-helper.h         |  4 +--
 include/hw/xen/xen-bus.h                |  4 +--
 include/hw/xen/xen_common.h             |  2 +-
 include/hw/xen/xen_pvdev.h              |  2 +-
 include/monitor/monitor.h               |  4 +--
 include/qapi/error.h                    | 20 ++++++------
 include/qapi/qmp/qjson.h                |  8 ++---
 include/qemu/buffer.h                   |  2 +-
 include/qemu/compiler.h                 | 11 ++-----
 include/qemu/error-report.h             | 24 +++++++-------
 include/qemu/log-for-trace.h            |  2 +-
 include/qemu/log.h                      |  2 +-
 include/qemu/qemu-print.h               |  8 ++---
 include/qemu/readline.h                 |  2 +-
 qga/guest-agent-core.h                  |  2 +-
 qga/vss-win32/requester.h               |  2 +-
 scripts/cocci-macro-file.h              |  2 +-
 tests/qtest/libqos/libqtest.h           | 42 ++++++++++++-------------
 tests/qtest/libqtest-single.h           |  2 +-
 tests/qtest/migration-helpers.h         |  6 ++--
 audio/alsaaudio.c                       |  4 +--
 audio/dsoundaudio.c                     |  4 +--
 audio/ossaudio.c                        |  4 +--
 audio/paaudio.c                         |  2 +-
 audio/sdlaudio.c                        |  2 +-
 block/blkverify.c                       |  2 +-
 block/ssh.c                             |  4 +--
 fsdev/9p-marshal.c                      |  2 +-
 fsdev/virtfs-proxy-helper.c             |  2 +-
 hw/9pfs/9p.c                            |  2 +-
 hw/acpi/aml-build.c                     |  4 +--
 hw/mips/fuloong2e.c                     |  2 +-
 hw/mips/malta.c                         |  2 +-
 hw/net/rtl8139.c                        |  2 +-
 hw/virtio/virtio.c                      |  2 +-
 io/channel-websock.c                    |  2 +-
 monitor/hmp.c                           |  4 +--
 nbd/server.c                            | 10 +++---
 qemu-img.c                              |  4 +--
 qemu-io.c                               |  2 +-
 qobject/json-parser.c                   |  2 +-
 softmmu/qtest.c                         |  4 +--
 tests/qtest/libqtest.c                  |  2 +-
 tests/unit/test-qobject-input-visitor.c |  4 +--
 audio/coreaudio.m                       |  4 +--
 scripts/checkpatch.pl                   |  2 +-
 58 files changed, 130 insertions(+), 137 deletions(-)

diff --git a/audio/audio.h b/audio/audio.h
index c8bde536b5cd..cbb10f4816e5 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -91,8 +91,8 @@ typedef struct QEMUAudioTimeStamp {
     uint64_t old_ts;
 } QEMUAudioTimeStamp;
 
-void AUD_vlog (const char *cap, const char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
-void AUD_log (const char *cap, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
+void AUD_vlog (const char *cap, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
+void AUD_log (const char *cap, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
 void AUD_register_card (const char *name, QEMUSoundCard *card);
 void AUD_remove_card (QEMUSoundCard *card);
diff --git a/block/qcow2.h b/block/qcow2.h
index fd48a89d452c..ba436a8d0d68 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -838,7 +838,7 @@ int qcow2_update_header(BlockDriverState *bs);
 
 void qcow2_signal_corruption(BlockDriverState *bs, bool fatal, int64_t offset,
                              int64_t size, const char *message_format, ...)
-                             GCC_FMT_ATTR(5, 6);
+                             G_GNUC_PRINTF(5, 6);
 
 int qcow2_validate_table(BlockDriverState *bs, uint64_t offset,
                          uint64_t entries, size_t entry_len,
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index af272c2a802a..21c06f2e7003 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -175,7 +175,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6);
-void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+void gemu_log(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 extern __thread CPUState *thread_cpu;
 void cpu_loop(CPUArchState *env);
 char *target_strerror(int err);
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 30d21f4d0bdc..e74de9579df3 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -149,7 +149,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
 /* qxl.c */
 void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
 void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 void qxl_spice_update_area(PCIQXLDevice *qxl, uint32_t surface_id,
                            struct QXLRect *area, struct QXLRect *dirty_rects,
diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
index 412fa44d0171..f85354d9d136 100644
--- a/hw/net/rocker/rocker.h
+++ b/hw/net/rocker/rocker.h
@@ -30,7 +30,7 @@
         fprintf(stderr, "%s ROCKER: " fmt, nowstr, ## __VA_ARGS__);\
     } while (0)
 #else
-static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
+static inline G_GNUC_PRINTF(1, 2) int DPRINTF(const char *fmt, ...)
 {
     return 0;
 }
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index c74c4678f20d..6b8e13cdeed5 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -9,7 +9,7 @@
 bool xen_igd_gfx_pt_enabled(void);
 void xen_igd_gfx_pt_set(bool value, Error **errp);
 
-void xen_pt_log(const PCIDevice *d, const char *f, ...) GCC_FMT_ATTR(2, 3);
+void xen_pt_log(const PCIDevice *d, const char *f, ...) G_GNUC_PRINTF(2, 3);
 
 #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, __func__, ##_a)
 
diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 867ef1b3b28a..8c420fa36e3c 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -172,7 +172,7 @@ void qemu_chr_fe_set_open(CharBackend *be, int fe_open);
  * Chardev.
  */
 void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 
 typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition condition, void *data);
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 102a1e7f504e..fadf6a65ef15 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -269,7 +269,7 @@ typedef struct symbol_cache_entry
 } asymbol;
 
 typedef int (*fprintf_function)(FILE *f, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 enum dis_insn_type {
   dis_noninsn,			/* Not a valid instruction */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 8346003a224b..d1fb08514bfa 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -289,7 +289,7 @@ void free_aml_allocator(void);
 void aml_append(Aml *parent_ctx, Aml *child);
 
 /* non block AML object primitives */
-Aml *aml_name(const char *name_format, ...) GCC_FMT_ATTR(1, 2);
+Aml *aml_name(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
 Aml *aml_name_decl(const char *name, Aml *val);
 Aml *aml_debug(void);
 Aml *aml_return(Aml *val);
@@ -344,13 +344,13 @@ Aml *aml_irq_no_flags(uint8_t irq);
 Aml *aml_named_field(const char *name, unsigned length);
 Aml *aml_reserved_field(unsigned length);
 Aml *aml_local(int num);
-Aml *aml_string(const char *name_format, ...) GCC_FMT_ATTR(1, 2);
+Aml *aml_string(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
 Aml *aml_lnot(Aml *arg);
 Aml *aml_equal(Aml *arg1, Aml *arg2);
 Aml *aml_lgreater(Aml *arg1, Aml *arg2);
 Aml *aml_lgreater_equal(Aml *arg1, Aml *arg2);
 Aml *aml_processor(uint8_t proc_id, uint32_t pblk_addr, uint8_t pblk_len,
-                   const char *name_format, ...) GCC_FMT_ATTR(4, 5);
+                   const char *name_format, ...) G_GNUC_PRINTF(4, 5);
 Aml *aml_eisaid(const char *str);
 Aml *aml_word_bus_number(AmlMinFixed min_fixed, AmlMaxFixed max_fixed,
                          AmlDecode dec, uint16_t addr_gran,
@@ -384,8 +384,8 @@ Aml *aml_sleep(uint64_t msec);
 Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source);
 
 /* Block AML object primitives */
-Aml *aml_scope(const char *name_format, ...) GCC_FMT_ATTR(1, 2);
-Aml *aml_device(const char *name_format, ...) GCC_FMT_ATTR(1, 2);
+Aml *aml_scope(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
+Aml *aml_device(const char *name_format, ...) G_GNUC_PRINTF(1, 2);
 Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag);
 Aml *aml_if(Aml *predicate);
 Aml *aml_else(void);
@@ -460,7 +460,7 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
 
 int
 build_append_named_dword(GArray *array, const char *name_format, ...)
-GCC_FMT_ATTR(2, 3);
+G_GNUC_PRINTF(2, 3);
 
 void build_append_gas(GArray *table, AmlAddressSpace as,
                       uint8_t bit_width, uint8_t bit_offset,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 0efc6153ed03..136973655c1a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1016,7 +1016,7 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 
 void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /* $(top_srcdir)/cpu.c */
 void cpu_class_init_props(DeviceClass *dc);
diff --git a/include/hw/hw.h b/include/hw/hw.h
index fc5301f29372..34377f5309d3 100644
--- a/include/hw/hw.h
+++ b/include/hw/hw.h
@@ -5,6 +5,6 @@
 #error Cannot include hw/hw.h from user emulation
 #endif
 
-void QEMU_NORETURN hw_error(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+void QEMU_NORETURN hw_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 #endif
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f095637058dc..b31c4507f5dd 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -169,7 +169,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
                          uint16_t device_id, size_t config_size);
 void virtio_cleanup(VirtIODevice *vdev);
 
-void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
+void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
 /* Set the child bus name. */
 void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index 4c0f747445c2..629a904d1a86 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -22,11 +22,11 @@ void xs_node_destroy(struct xs_handle *xsh,  xs_transaction_t tid,
 void xs_node_vprintf(struct xs_handle *xsh,  xs_transaction_t tid,
                      const char *node, const char *key, Error **errp,
                      const char *fmt, va_list ap)
-    GCC_FMT_ATTR(6, 0);
+    G_GNUC_PRINTF(6, 0);
 void xs_node_printf(struct xs_handle *xsh,  xs_transaction_t tid,
                     const char *node, const char *key, Error **errp,
                     const char *fmt, ...)
-    GCC_FMT_ATTR(6, 7);
+    G_GNUC_PRINTF(6, 7);
 
 /* Read from node/key unless node is empty, in which case read from key */
 int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 6bdbf3ff8220..713e763348f4 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -88,10 +88,10 @@ enum xenbus_state xen_device_backend_get_state(XenDevice *xendev);
 
 void xen_device_backend_printf(XenDevice *xendev, const char *key,
                                const char *fmt, ...)
-    GCC_FMT_ATTR(3, 4);
+    G_GNUC_PRINTF(3, 4);
 void xen_device_frontend_printf(XenDevice *xendev, const char *key,
                                 const char *fmt, ...)
-    GCC_FMT_ATTR(3, 4);
+    G_GNUC_PRINTF(3, 4);
 
 int xen_device_frontend_scanf(XenDevice *xendev, const char *key,
                               const char *fmt, ...);
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index a8118b41acfb..179741ff791c 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -358,7 +358,7 @@ static inline int xen_restrict(domid_t domid)
 void destroy_hvm_domain(bool reboot);
 
 /* shutdown/destroy current domain because of an error */
-void xen_shutdown_fatal_error(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+void xen_shutdown_fatal_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 #ifdef HVM_PARAM_VMPORT_REGS_PFN
 static inline int xen_get_vmport_regs_pfn(xc_interface *xc, domid_t dom,
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index 83e5174d9029..7cd4bc2b8284 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -76,6 +76,6 @@ void xen_pv_unbind_evtchn(struct XenLegacyDevice *xendev);
 int xen_pv_send_notify(struct XenLegacyDevice *xendev);
 
 void xen_pv_printf(struct XenLegacyDevice *xendev, int msg_level,
-                   const char *fmt, ...)  GCC_FMT_ATTR(3, 4);
+                   const char *fmt, ...)  G_GNUC_PRINTF(3, 4);
 
 #endif /* QEMU_HW_XEN_PVDEV_H */
diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index 12d395d62d6b..cc4cc6c6adcf 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -32,8 +32,8 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp);
 int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp);
 
 int monitor_vprintf(Monitor *mon, const char *fmt, va_list ap)
-    GCC_FMT_ATTR(2, 0);
-int monitor_printf(Monitor *mon, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 0);
+int monitor_printf(Monitor *mon, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 void monitor_flush(Monitor *mon);
 int monitor_set_cpu(Monitor *mon, int cpu_index);
 int monitor_get_cpu_index(Monitor *mon);
diff --git a/include/qapi/error.h b/include/qapi/error.h
index 4a9260b0cc00..d798faeec3e9 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -320,7 +320,7 @@ ErrorClass error_get_class(const Error *err);
 void error_setg_internal(Error **errp,
                          const char *src, int line, const char *func,
                          const char *fmt, ...)
-    GCC_FMT_ATTR(5, 6);
+    G_GNUC_PRINTF(5, 6);
 
 /*
  * Just like error_setg(), with @os_error info added to the message.
@@ -336,7 +336,7 @@ void error_setg_internal(Error **errp,
 void error_setg_errno_internal(Error **errp,
                                const char *fname, int line, const char *func,
                                int os_error, const char *fmt, ...)
-    GCC_FMT_ATTR(6, 7);
+    G_GNUC_PRINTF(6, 7);
 
 #ifdef _WIN32
 /*
@@ -350,7 +350,7 @@ void error_setg_errno_internal(Error **errp,
 void error_setg_win32_internal(Error **errp,
                                const char *src, int line, const char *func,
                                int win32_err, const char *fmt, ...)
-    GCC_FMT_ATTR(6, 7);
+    G_GNUC_PRINTF(6, 7);
 #endif
 
 /*
@@ -383,21 +383,21 @@ void error_propagate(Error **dst_errp, Error *local_err);
  */
 void error_propagate_prepend(Error **dst_errp, Error *local_err,
                              const char *fmt, ...)
-    GCC_FMT_ATTR(3, 4);
+    G_GNUC_PRINTF(3, 4);
 
 /*
  * Prepend some text to @errp's human-readable error message.
  * The text is made by formatting @fmt, @ap like vprintf().
  */
 void error_vprepend(Error *const *errp, const char *fmt, va_list ap)
-    GCC_FMT_ATTR(2, 0);
+    G_GNUC_PRINTF(2, 0);
 
 /*
  * Prepend some text to @errp's human-readable error message.
  * The text is made by formatting @fmt, ... like printf().
  */
 void error_prepend(Error *const *errp, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /*
  * Append a printf-style human-readable explanation to an existing error.
@@ -414,7 +414,7 @@ void error_prepend(Error *const *errp, const char *fmt, ...)
  * newline.
  */
 void error_append_hint(Error *const *errp, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /*
  * Convenience function to report open() failure.
@@ -458,13 +458,13 @@ void error_report_err(Error *err);
  * Convenience function to error_prepend(), warn_report() and free @err.
  */
 void warn_reportf_err(Error *err, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /*
  * Convenience function to error_prepend(), error_report() and free @err.
  */
 void error_reportf_err(Error *err, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /*
  * Just like error_setg(), except you get to specify the error class.
@@ -477,7 +477,7 @@ void error_reportf_err(Error *err, const char *fmt, ...)
 void error_set_internal(Error **errp,
                         const char *src, int line, const char *func,
                         ErrorClass err_class, const char *fmt, ...)
-    GCC_FMT_ATTR(6, 7);
+    G_GNUC_PRINTF(6, 7);
 
 /*
  * Make @errp parameter easier to use regardless of argument value
diff --git a/include/qapi/qmp/qjson.h b/include/qapi/qmp/qjson.h
index 593b40b4e0a4..7bd8d2de1b33 100644
--- a/include/qapi/qmp/qjson.h
+++ b/include/qapi/qmp/qjson.h
@@ -17,13 +17,13 @@
 QObject *qobject_from_json(const char *string, Error **errp);
 
 QObject *qobject_from_vjsonf_nofail(const char *string, va_list ap)
-    GCC_FMT_ATTR(1, 0);
+    G_GNUC_PRINTF(1, 0);
 QObject *qobject_from_jsonf_nofail(const char *string, ...)
-    GCC_FMT_ATTR(1, 2);
+    G_GNUC_PRINTF(1, 2);
 QDict *qdict_from_vjsonf_nofail(const char *string, va_list ap)
-    GCC_FMT_ATTR(1, 0);
+    G_GNUC_PRINTF(1, 0);
 QDict *qdict_from_jsonf_nofail(const char *string, ...)
-    GCC_FMT_ATTR(1, 2);
+    G_GNUC_PRINTF(1, 2);
 
 GString *qobject_to_json(const QObject *obj);
 GString *qobject_to_json_pretty(const QObject *obj, bool pretty);
diff --git a/include/qemu/buffer.h b/include/qemu/buffer.h
index d34d2c857ccc..e95dfd696ca8 100644
--- a/include/qemu/buffer.h
+++ b/include/qemu/buffer.h
@@ -49,7 +49,7 @@ struct Buffer {
  * to identify in debug traces.
  */
 void buffer_init(Buffer *buffer, const char *name, ...)
-        GCC_FMT_ATTR(2, 3);
+        G_GNUC_PRINTF(2, 3);
 
 /**
  * buffer_shrink:
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 3baa5e3790f7..f2bd050e3b9a 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -79,19 +79,12 @@
 #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
                                    sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
 
-#if defined(__clang__)
-/* clang doesn't support gnu_printf, so use printf. */
-# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
-#else
-/* Use gnu_printf (qemu uses standard format strings). */
-# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
-# if defined(_WIN32)
+#if !defined(__clang__) && defined(_WIN32)
 /*
  * Map __printf__ to __gnu_printf__ because we want standard format strings even
  * when MinGW or GLib include files use __printf__.
  */
-#  define __printf__ __gnu_printf__
-# endif
+# define __printf__ __gnu_printf__
 #endif
 
 #ifndef __has_warning
diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
index 9d197daca387..33e662db44c6 100644
--- a/include/qemu/error-report.h
+++ b/include/qemu/error-report.h
@@ -30,23 +30,23 @@ void loc_set_none(void);
 void loc_set_cmdline(char **argv, int idx, int cnt);
 void loc_set_file(const char *fname, int lno);
 
-int error_vprintf(const char *fmt, va_list ap) GCC_FMT_ATTR(1, 0);
-int error_printf(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
-int error_vprintf_unless_qmp(const char *fmt, va_list ap) GCC_FMT_ATTR(1, 0);
-int error_printf_unless_qmp(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+int error_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
+int error_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
+int error_vprintf_unless_qmp(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
+int error_printf_unless_qmp(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
-void error_vreport(const char *fmt, va_list ap) GCC_FMT_ATTR(1, 0);
-void warn_vreport(const char *fmt, va_list ap) GCC_FMT_ATTR(1, 0);
-void info_vreport(const char *fmt, va_list ap) GCC_FMT_ATTR(1, 0);
+void error_vreport(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
+void warn_vreport(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
+void info_vreport(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 
-void error_report(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
-void warn_report(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
-void info_report(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+void error_report(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
+void warn_report(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
+void info_report(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 bool error_report_once_cond(bool *printed, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 bool warn_report_once_cond(bool *printed, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 void error_init(const char *argv0);
 
diff --git a/include/qemu/log-for-trace.h b/include/qemu/log-for-trace.h
index 2f0a5b080eab..5e415172278a 100644
--- a/include/qemu/log-for-trace.h
+++ b/include/qemu/log-for-trace.h
@@ -30,6 +30,6 @@ static inline bool qemu_loglevel_mask(int mask)
 }
 
 /* main logging function */
-int GCC_FMT_ATTR(1, 2) qemu_log(const char *fmt, ...);
+int G_GNUC_PRINTF(1, 2) qemu_log(const char *fmt, ...);
 
 #endif
diff --git a/include/qemu/log.h b/include/qemu/log.h
index 9b8066020729..5739c7e6d819 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -96,7 +96,7 @@ static inline void qemu_log_unlock(FILE *fd)
 
 /* vfprintf-like logging function
  */
-static inline void GCC_FMT_ATTR(1, 0)
+static inline void G_GNUC_PRINTF(1, 0)
 qemu_log_vprintf(const char *fmt, va_list va)
 {
     QemuLogFile *logfile;
diff --git a/include/qemu/qemu-print.h b/include/qemu/qemu-print.h
index 40b596262fae..1b70920648b8 100644
--- a/include/qemu/qemu-print.h
+++ b/include/qemu/qemu-print.h
@@ -13,11 +13,11 @@
 #ifndef QEMU_PRINT_H
 #define QEMU_PRINT_H
 
-int qemu_vprintf(const char *fmt, va_list ap) GCC_FMT_ATTR(1, 0);
-int qemu_printf(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+int qemu_vprintf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
+int qemu_printf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 int qemu_vfprintf(FILE *stream, const char *fmt, va_list ap)
-    GCC_FMT_ATTR(2, 0);
-int qemu_fprintf(FILE *stream, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 0);
+int qemu_fprintf(FILE *stream, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
 #endif
diff --git a/include/qemu/readline.h b/include/qemu/readline.h
index e81258322be6..622aa4564f67 100644
--- a/include/qemu/readline.h
+++ b/include/qemu/readline.h
@@ -5,7 +5,7 @@
 #define READLINE_MAX_CMDS 64
 #define READLINE_MAX_COMPLETIONS 256
 
-typedef void GCC_FMT_ATTR(2, 3) ReadLinePrintfFunc(void *opaque,
+typedef void G_GNUC_PRINTF(2, 3) ReadLinePrintfFunc(void *opaque,
                                                    const char *fmt, ...);
 typedef void ReadLineFlushFunc(void *opaque);
 typedef void ReadLineFunc(void *opaque, const char *str,
diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h
index 9d01ea9c82ab..29cd50402fdb 100644
--- a/qga/guest-agent-core.h
+++ b/qga/guest-agent-core.h
@@ -36,7 +36,7 @@ void ga_command_state_free(GACommandState *cs);
 bool ga_logging_enabled(GAState *s);
 void ga_disable_logging(GAState *s);
 void ga_enable_logging(GAState *s);
-void GCC_FMT_ATTR(1, 2) slog(const gchar *fmt, ...);
+void G_GNUC_PRINTF(1, 2) slog(const gchar *fmt, ...);
 void ga_set_response_delimited(GAState *s);
 bool ga_is_frozen(GAState *s);
 void ga_set_frozen(GAState *s);
diff --git a/qga/vss-win32/requester.h b/qga/vss-win32/requester.h
index 5a8e8faf0cea..ecc5f2acb4fd 100644
--- a/qga/vss-win32/requester.h
+++ b/qga/vss-win32/requester.h
@@ -25,7 +25,7 @@ struct Error;
 typedef void (*ErrorSetFunc)(struct Error **errp,
                              const char *src, int line, const char *func,
                              int win32_err, const char *fmt, ...)
-    GCC_FMT_ATTR(6, 7);
+    G_GNUC_PRINTF(6, 7);
 typedef struct ErrorSet {
     ErrorSetFunc error_setg_win32_wrapper;
     struct Error **errp;        /* restriction: must not be null */
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index 20eea6b708f5..c2fcea8e77a2 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -34,7 +34,7 @@
 #define QEMU_BUILD_BUG_ON(x) \
     typedef char cat2(qemu_build_bug_on__,__LINE__)[(x)?-1:1] __attribute__((unused));
 
-#define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
+#define G_GNUC_PRINTF(n, m) __attribute__((format(gnu_printf, n, m)))
 
 #define xglue(x, y) x ## y
 #define glue(x, y) xglue(x, y)
diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index cf38d273f5c0..552667f17e37 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -31,7 +31,7 @@ typedef struct QTestState QTestState;
  *
  * Returns: #QTestState instance.
  */
-QTestState *qtest_initf(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
+QTestState *qtest_initf(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
 
 /**
  * qtest_vinitf:
@@ -43,7 +43,7 @@ QTestState *qtest_initf(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
  *
  * Returns: #QTestState instance.
  */
-QTestState *qtest_vinitf(const char *fmt, va_list ap) GCC_FMT_ATTR(1, 0);
+QTestState *qtest_vinitf(const char *fmt, va_list ap) G_GNUC_PRINTF(1, 0);
 
 /**
  * qtest_init:
@@ -106,7 +106,7 @@ void qtest_quit(QTestState *s);
  */
 QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
                      const char *fmt, ...)
-    GCC_FMT_ATTR(4, 5);
+    G_GNUC_PRINTF(4, 5);
 
 /**
  * qtest_qmp:
@@ -118,7 +118,7 @@ QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
  * Sends a QMP message to QEMU and returns the response.
  */
 QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /**
  * qtest_qmp_send:
@@ -130,7 +130,7 @@ QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
  * Sends a QMP message to QEMU and leaves the response in the stream.
  */
 void qtest_qmp_send(QTestState *s, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /**
  * qtest_qmp_send_raw:
@@ -141,7 +141,7 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
  * this is useful for negative tests.
  */
 void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 /**
  * qtest_socket_server:
@@ -165,7 +165,7 @@ int qtest_socket_server(const char *socket_path);
  */
 QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
                       const char *fmt, va_list ap)
-    GCC_FMT_ATTR(4, 0);
+    G_GNUC_PRINTF(4, 0);
 
 /**
  * qtest_vqmp:
@@ -178,7 +178,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
  * Sends a QMP message to QEMU and returns the response.
  */
 QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
-    GCC_FMT_ATTR(2, 0);
+    G_GNUC_PRINTF(2, 0);
 
 /**
  * qtest_qmp_vsend_fds:
@@ -194,7 +194,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
  */
 void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
                          const char *fmt, va_list ap)
-    GCC_FMT_ATTR(4, 0);
+    G_GNUC_PRINTF(4, 0);
 
 /**
  * qtest_qmp_vsend:
@@ -207,7 +207,7 @@ void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
  * Sends a QMP message to QEMU and leaves the response in the stream.
  */
 void qtest_qmp_vsend(QTestState *s, const char *fmt, va_list ap)
-    GCC_FMT_ATTR(2, 0);
+    G_GNUC_PRINTF(2, 0);
 
 /**
  * qtest_qmp_receive_dict:
@@ -269,7 +269,7 @@ QDict *qtest_qmp_event_ref(QTestState *s, const char *event);
  *
  * Returns: the command's output.  The caller should g_free() it.
  */
-char *qtest_hmp(QTestState *s, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
+char *qtest_hmp(QTestState *s, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
 /**
  * qtest_hmpv:
@@ -283,7 +283,7 @@ char *qtest_hmp(QTestState *s, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
  * Returns: the command's output.  The caller should g_free() it.
  */
 char *qtest_vhmp(QTestState *s, const char *fmt, va_list ap)
-    GCC_FMT_ATTR(2, 0);
+    G_GNUC_PRINTF(2, 0);
 
 void qtest_module_load(QTestState *s, const char *prefix, const char *libname);
 
@@ -688,17 +688,17 @@ void qtest_remove_abrt_handler(void *data);
  * the response.
  */
 void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
-    GCC_FMT_ATTR(2, 3);
+    G_GNUC_PRINTF(2, 3);
 
 QDict *qmp_fd_receive(int fd);
 void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
-                      const char *fmt, va_list ap) GCC_FMT_ATTR(4, 0);
-void qmp_fd_vsend(int fd, const char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
-void qmp_fd_send(int fd, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
-void qmp_fd_send_raw(int fd, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
-void qmp_fd_vsend_raw(int fd, const char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
-QDict *qmp_fdv(int fd, const char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
-QDict *qmp_fd(int fd, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
+                      const char *fmt, va_list ap) G_GNUC_PRINTF(4, 0);
+void qmp_fd_vsend(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
+void qmp_fd_send(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+void qmp_fd_send_raw(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
+void qmp_fd_vsend_raw(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
+QDict *qmp_fdv(int fd, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
+QDict *qmp_fd(int fd, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
 /**
  * qtest_cb_for_every_machine:
@@ -750,7 +750,7 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
  * Generic hot-plugging test via the device_add QMP command.
  */
 void qtest_qmp_device_add(QTestState *qts, const char *driver, const char *id,
-                          const char *fmt, ...) GCC_FMT_ATTR(4, 5);
+                          const char *fmt, ...) G_GNUC_PRINTF(4, 5);
 
 /**
  * qtest_qmp_add_client:
diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 0d7f568678e5..b0838b9e0e71 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -52,7 +52,7 @@ static inline void qtest_end(void)
  *
  * Sends a QMP message to QEMU and returns the response.
  */
-GCC_FMT_ATTR(1, 2)
+G_GNUC_PRINTF(1, 2)
 static inline QDict *qmp(const char *fmt, ...)
 {
     va_list ap;
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index d63bba9630f9..555adafce129 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -16,13 +16,13 @@
 
 extern bool got_stop;
 
-GCC_FMT_ATTR(3, 4)
+G_GNUC_PRINTF(3, 4)
 QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
 
-GCC_FMT_ATTR(2, 3)
+G_GNUC_PRINTF(2, 3)
 QDict *wait_command(QTestState *who, const char *command, ...);
 
-GCC_FMT_ATTR(3, 4)
+G_GNUC_PRINTF(3, 4)
 void migrate_qmp(QTestState *who, const char *uri, const char *fmt, ...);
 
 QDict *migrate_query(QTestState *who);
diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index b04716a6cc21..4a61378cd757 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -72,7 +72,7 @@ struct alsa_params_obt {
     snd_pcm_uframes_t samples;
 };
 
-static void GCC_FMT_ATTR (2, 3) alsa_logerr (int err, const char *fmt, ...)
+static void G_GNUC_PRINTF (2, 3) alsa_logerr (int err, const char *fmt, ...)
 {
     va_list ap;
 
@@ -83,7 +83,7 @@ static void GCC_FMT_ATTR (2, 3) alsa_logerr (int err, const char *fmt, ...)
     AUD_log (AUDIO_CAP, "Reason: %s\n", snd_strerror (err));
 }
 
-static void GCC_FMT_ATTR (3, 4) alsa_logerr2 (
+static void G_GNUC_PRINTF (3, 4) alsa_logerr2 (
     int err,
     const char *typ,
     const char *fmt,
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 231f3e65b3c8..d5bb0d9f51c6 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -222,7 +222,7 @@ static void dsound_log_hresult (HRESULT hr)
     AUD_log (AUDIO_CAP, "Reason: %s\n", str);
 }
 
-static void GCC_FMT_ATTR (2, 3) dsound_logerr (
+static void G_GNUC_PRINTF (2, 3) dsound_logerr (
     HRESULT hr,
     const char *fmt,
     ...
@@ -237,7 +237,7 @@ static void GCC_FMT_ATTR (2, 3) dsound_logerr (
     dsound_log_hresult (hr);
 }
 
-static void GCC_FMT_ATTR (3, 4) dsound_logerr2 (
+static void G_GNUC_PRINTF (3, 4) dsound_logerr2 (
     HRESULT hr,
     const char *typ,
     const char *fmt,
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index da9c232222e3..8e075edb70d6 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -63,7 +63,7 @@ struct oss_params {
     int fragsize;
 };
 
-static void GCC_FMT_ATTR (2, 3) oss_logerr (int err, const char *fmt, ...)
+static void G_GNUC_PRINTF (2, 3) oss_logerr (int err, const char *fmt, ...)
 {
     va_list ap;
 
@@ -74,7 +74,7 @@ static void GCC_FMT_ATTR (2, 3) oss_logerr (int err, const char *fmt, ...)
     AUD_log (AUDIO_CAP, "Reason: %s\n", strerror (err));
 }
 
-static void GCC_FMT_ATTR (3, 4) oss_logerr2 (
+static void G_GNUC_PRINTF (3, 4) oss_logerr2 (
     int err,
     const char *typ,
     const char *fmt,
diff --git a/audio/paaudio.c b/audio/paaudio.c
index a53ed85e0b82..b7c6a1266b96 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -43,7 +43,7 @@ typedef struct {
 
 static void qpa_conn_fini(PAConnection *c);
 
-static void GCC_FMT_ATTR (2, 3) qpa_logerr (int err, const char *fmt, ...)
+static void G_GNUC_PRINTF (2, 3) qpa_logerr (int err, const char *fmt, ...)
 {
     va_list ap;
 
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index 797b47bbddb1..68a237b76b45 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -55,7 +55,7 @@ typedef struct SDLVoiceIn {
     SDL_AudioDeviceID devid;
 } SDLVoiceIn;
 
-static void GCC_FMT_ATTR (1, 2) sdl_logerr (const char *fmt, ...)
+static void G_GNUC_PRINTF (1, 2) sdl_logerr (const char *fmt, ...)
 {
     va_list ap;
 
diff --git a/block/blkverify.c b/block/blkverify.c
index 53ba1c919572..e4a37af3b2ef 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -44,7 +44,7 @@ typedef struct BlkverifyRequest {
     QEMUIOVector *raw_qiov;     /* cloned I/O vector for raw file */
 } BlkverifyRequest;
 
-static void GCC_FMT_ATTR(2, 3) blkverify_err(BlkverifyRequest *r,
+static void G_GNUC_PRINTF(2, 3) blkverify_err(BlkverifyRequest *r,
                                              const char *fmt, ...)
 {
     va_list ap;
diff --git a/block/ssh.c b/block/ssh.c
index a64db146dbdc..a2dc64653699 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -108,7 +108,7 @@ static void ssh_state_free(BDRVSSHState *s)
     }
 }
 
-static void GCC_FMT_ATTR(3, 4)
+static void G_GNUC_PRINTF(3, 4)
 session_error_setg(Error **errp, BDRVSSHState *s, const char *fs, ...)
 {
     va_list args;
@@ -133,7 +133,7 @@ session_error_setg(Error **errp, BDRVSSHState *s, const char *fs, ...)
     g_free(msg);
 }
 
-static void GCC_FMT_ATTR(3, 4)
+static void G_GNUC_PRINTF(3, 4)
 sftp_error_setg(Error **errp, BDRVSSHState *s, const char *fs, ...)
 {
     va_list args;
diff --git a/fsdev/9p-marshal.c b/fsdev/9p-marshal.c
index 51881fe22010..f9b0336cd59d 100644
--- a/fsdev/9p-marshal.c
+++ b/fsdev/9p-marshal.c
@@ -27,7 +27,7 @@ void v9fs_string_free(V9fsString *str)
     str->size = 0;
 }
 
-void GCC_FMT_ATTR(2, 3)
+void G_GNUC_PRINTF(2, 3)
 v9fs_string_sprintf(V9fsString *str, const char *fmt, ...)
 {
     va_list ap;
diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 15c0e79b067b..d06a0f7b8326 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -57,7 +57,7 @@ static bool is_daemon;
 static bool get_version; /* IOC getversion IOCTL supported */
 static char *prog_name;
 
-static void GCC_FMT_ATTR(2, 3) do_log(int loglevel, const char *format, ...)
+static void G_GNUC_PRINTF(2, 3) do_log(int loglevel, const char *format, ...)
 {
     va_list ap;
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a6d6b3f83567..a91d24c0acae 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -203,7 +203,7 @@ void v9fs_path_free(V9fsPath *path)
 }
 
 
-void GCC_FMT_ATTR(2, 3)
+void G_GNUC_PRINTF(2, 3)
 v9fs_path_sprintf(V9fsPath *path, const char *fmt, ...)
 {
     va_list ap;
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1773cf55f1ee..4086879ebff9 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -207,7 +207,7 @@ build_append_nameseg(GArray *array, const char *seg)
     g_array_append_vals(array, "____", ACPI_NAMESEG_LEN - len);
 }
 
-static void GCC_FMT_ATTR(2, 0)
+static void G_GNUC_PRINTF(2, 0)
 build_append_namestringv(GArray *array, const char *format, va_list ap)
 {
     char *s;
@@ -270,7 +270,7 @@ build_append_namestringv(GArray *array, const char *format, va_list ap)
     g_strfreev(segs);
 }
 
-GCC_FMT_ATTR(2, 3)
+G_GNUC_PRINTF(2, 3)
 static void build_append_namestring(GArray *array, const char *format, ...)
 {
     va_list ap;
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c1b8066a13b0..c9f14e70a077 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -72,7 +72,7 @@ static struct _loaderparams {
     const char *initrd_filename;
 } loaderparams;
 
-static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
+static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
                                         const char *string, ...)
 {
     va_list ap;
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 55037eb90f0e..6288511723e1 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -995,7 +995,7 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 
 }
 
-static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
+static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
                                         const char *string, ...)
 {
     va_list ap;
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 90b4fc63ce64..6b65823b4bf8 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -86,7 +86,7 @@
 #  define DPRINTF(fmt, ...) \
     do { fprintf(stderr, "RTL8139: " fmt, ## __VA_ARGS__); } while (0)
 #else
-static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
+static inline G_GNUC_PRINTF(1, 2) int DPRINTF(const char *fmt, ...)
 {
     return 0;
 }
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9e8f51dfb03b..89c261da0208 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3580,7 +3580,7 @@ void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name)
     vdev->bus_name = g_strdup(bus_name);
 }
 
-void GCC_FMT_ATTR(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
+void G_GNUC_PRINTF(2, 3) virtio_error(VirtIODevice *vdev, const char *fmt, ...)
 {
     va_list ap;
 
diff --git a/io/channel-websock.c b/io/channel-websock.c
index 70889bb54da5..55145a6a8c5d 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -157,7 +157,7 @@ enum {
     QIO_CHANNEL_WEBSOCK_OPCODE_PONG = 0xA
 };
 
-static void GCC_FMT_ATTR(2, 3)
+static void G_GNUC_PRINTF(2, 3)
 qio_channel_websock_handshake_send_res(QIOChannelWebsock *ioc,
                                        const char *resmsg,
                                        ...)
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 569066036dc1..24fd2e5f34bf 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -308,7 +308,7 @@ void help_cmd(Monitor *mon, const char *name)
 static const char *pch;
 static sigjmp_buf expr_env;
 
-static void GCC_FMT_ATTR(2, 3) QEMU_NORETURN
+static void G_GNUC_PRINTF(2, 3) QEMU_NORETURN
 expr_error(Monitor *mon, const char *fmt, ...)
 {
     va_list ap;
@@ -1462,7 +1462,7 @@ static void monitor_event(void *opaque, QEMUChrEvent event)
  * These functions just adapt the readline interface in a typesafe way.  We
  * could cast function pointers but that discards compiler checks.
  */
-static void GCC_FMT_ATTR(2, 3) monitor_readline_printf(void *opaque,
+static void G_GNUC_PRINTF(2, 3) monitor_readline_printf(void *opaque,
                                                        const char *fmt, ...)
 {
     MonitorHMP *mon = opaque;
diff --git a/nbd/server.c b/nbd/server.c
index 5da884c2fc35..735381aacfcb 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -213,7 +213,7 @@ static int nbd_negotiate_send_rep(NBDClient *client, uint32_t type,
 
 /* Send an error reply.
  * Return -errno on error, 0 on success. */
-static int GCC_FMT_ATTR(4, 0)
+static int G_GNUC_PRINTF(4, 0)
 nbd_negotiate_send_rep_verr(NBDClient *client, uint32_t type,
                             Error **errp, const char *fmt, va_list va)
 {
@@ -253,7 +253,7 @@ nbd_sanitize_name(const char *name)
 
 /* Send an error reply.
  * Return -errno on error, 0 on success. */
-static int GCC_FMT_ATTR(4, 5)
+static int G_GNUC_PRINTF(4, 5)
 nbd_negotiate_send_rep_err(NBDClient *client, uint32_t type,
                            Error **errp, const char *fmt, ...)
 {
@@ -269,7 +269,7 @@ nbd_negotiate_send_rep_err(NBDClient *client, uint32_t type,
 /* Drop remainder of the current option, and send a reply with the
  * given error type and message. Return -errno on read or write
  * failure; or 0 if connection is still live. */
-static int GCC_FMT_ATTR(4, 0)
+static int G_GNUC_PRINTF(4, 0)
 nbd_opt_vdrop(NBDClient *client, uint32_t type, Error **errp,
               const char *fmt, va_list va)
 {
@@ -282,7 +282,7 @@ nbd_opt_vdrop(NBDClient *client, uint32_t type, Error **errp,
     return ret;
 }
 
-static int GCC_FMT_ATTR(4, 5)
+static int G_GNUC_PRINTF(4, 5)
 nbd_opt_drop(NBDClient *client, uint32_t type, Error **errp,
              const char *fmt, ...)
 {
@@ -296,7 +296,7 @@ nbd_opt_drop(NBDClient *client, uint32_t type, Error **errp,
     return ret;
 }
 
-static int GCC_FMT_ATTR(3, 4)
+static int G_GNUC_PRINTF(3, 4)
 nbd_opt_invalid(NBDClient *client, Error **errp, const char *fmt, ...)
 {
     int ret;
diff --git a/qemu-img.c b/qemu-img.c
index 5dffb3e61601..1caddfb23a71 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -99,7 +99,7 @@ static void format_print(void *opaque, const char *name)
     printf(" %s", name);
 }
 
-static void QEMU_NORETURN GCC_FMT_ATTR(1, 2) error_exit(const char *fmt, ...)
+static void QEMU_NORETURN G_GNUC_PRINTF(1, 2) error_exit(const char *fmt, ...)
 {
     va_list ap;
 
@@ -284,7 +284,7 @@ static QemuOptsList qemu_source_opts = {
     },
 };
 
-static int GCC_FMT_ATTR(2, 3) qprintf(bool quiet, const char *fmt, ...)
+static int G_GNUC_PRINTF(2, 3) qprintf(bool quiet, const char *fmt, ...)
 {
     int ret = 0;
     if (!quiet) {
diff --git a/qemu-io.c b/qemu-io.c
index 3924639b92bd..e45a15c41aac 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -329,7 +329,7 @@ static char *get_prompt(void)
     return prompt;
 }
 
-static void GCC_FMT_ATTR(2, 3) readline_printf_func(void *opaque,
+static void G_GNUC_PRINTF(2, 3) readline_printf_func(void *opaque,
                                                     const char *fmt, ...)
 {
     va_list ap;
diff --git a/qobject/json-parser.c b/qobject/json-parser.c
index 008b326fb81a..d498db6e7027 100644
--- a/qobject/json-parser.c
+++ b/qobject/json-parser.c
@@ -54,7 +54,7 @@ static QObject *parse_value(JSONParserContext *ctxt);
 /**
  * Error handler
  */
-static void GCC_FMT_ATTR(3, 4) parse_error(JSONParserContext *ctxt,
+static void G_GNUC_PRINTF(3, 4) parse_error(JSONParserContext *ctxt,
                                            JSONToken *token, const char *msg, ...)
 {
     va_list ap;
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 8b7cb6aa8e46..cc586233a974 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -288,7 +288,7 @@ static void qtest_send_prefix(CharBackend *chr)
             (long) tv.tv_sec, (long) tv.tv_usec);
 }
 
-static void GCC_FMT_ATTR(1, 2) qtest_log_send(const char *fmt, ...)
+static void G_GNUC_PRINTF(1, 2) qtest_log_send(const char *fmt, ...)
 {
     va_list ap;
 
@@ -318,7 +318,7 @@ static void qtest_send(CharBackend *chr, const char *str)
     qtest_server_send(qtest_server_send_opaque, str);
 }
 
-static void GCC_FMT_ATTR(2, 3) qtest_sendf(CharBackend *chr,
+static void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr,
                                            const char *fmt, ...)
 {
     va_list ap;
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 9dac018fcba0..dc5566ccfd60 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -437,7 +437,7 @@ static void qtest_client_socket_send(QTestState *s, const char *buf)
     socket_send(s->fd, buf, strlen(buf));
 }
 
-static void GCC_FMT_ATTR(2, 3) qtest_sendf(QTestState *s, const char *fmt, ...)
+static void G_GNUC_PRINTF(2, 3) qtest_sendf(QTestState *s, const char *fmt, ...)
 {
     va_list ap;
 
diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 6f59a7f43249..22538f814099 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -64,7 +64,7 @@ static Visitor *test_init_internal(TestInputVisitorData *data, bool keyval,
     return data->qiv;
 }
 
-static GCC_FMT_ATTR(3, 4)
+static G_GNUC_PRINTF(3, 4)
 Visitor *visitor_input_test_init_full(TestInputVisitorData *data,
                                       bool keyval,
                                       const char *json_string, ...)
@@ -79,7 +79,7 @@ Visitor *visitor_input_test_init_full(TestInputVisitorData *data,
     return v;
 }
 
-static GCC_FMT_ATTR(2, 3)
+static G_GNUC_PRINTF(2, 3)
 Visitor *visitor_input_test_init(TestInputVisitorData *data,
                                  const char *json_string, ...)
 {
diff --git a/audio/coreaudio.m b/audio/coreaudio.m
index 3186b68474d0..4695291621a3 100644
--- a/audio/coreaudio.m
+++ b/audio/coreaudio.m
@@ -211,7 +211,7 @@ static void coreaudio_logstatus (OSStatus status)
     AUD_log (AUDIO_CAP, "Reason: %s\n", str);
 }
 
-static void GCC_FMT_ATTR (2, 3) coreaudio_logerr (
+static void G_GNUC_PRINTF (2, 3) coreaudio_logerr (
     OSStatus status,
     const char *fmt,
     ...
@@ -226,7 +226,7 @@ static void GCC_FMT_ATTR (2, 3) coreaudio_logerr (
     coreaudio_logstatus (status);
 }
 
-static void GCC_FMT_ATTR (3, 4) coreaudio_logerr2 (
+static void G_GNUC_PRINTF (3, 4) coreaudio_logerr2 (
     OSStatus status,
     const char *typ,
     const char *fmt,
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ddd8148d87e5..a07f0effb540 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -227,7 +227,7 @@ our $Attribute	= qr{
 			QEMU_WARN_UNUSED_RESULT|
 			QEMU_SENTINEL|
 			QEMU_PACKED|
-			GCC_FMT_ATTR
+			G_GNUC_PRINTF
 		  }x;
 our $Modifier;
 our $Inline	= qr{inline};
-- 
2.35.1.273.ge6ebfd0e8cbb


