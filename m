Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030FC2F1981
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 16:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64952.114909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyzz-0003ld-MY; Mon, 11 Jan 2021 15:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64952.114909; Mon, 11 Jan 2021 15:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyyzz-0003lF-IG; Mon, 11 Jan 2021 15:20:51 +0000
Received: by outflank-mailman (input) for mailman id 64952;
 Mon, 11 Jan 2021 15:20:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3k0/=GO=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kyyzy-0003dl-VI
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 15:20:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 348bc86a-352a-419a-a0ff-7c7f0190b4b2;
 Mon, 11 Jan 2021 15:20:42 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-edzwXZJnMw-h8GrzZ1o1ZA-1; Mon, 11 Jan 2021 10:20:40 -0500
Received: by mail-ed1-f69.google.com with SMTP id cq17so8383629edb.17
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 07:20:40 -0800 (PST)
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id h16sm7097043eji.110.2021.01.11.07.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:20:37 -0800 (PST)
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
X-Inumbo-ID: 348bc86a-352a-419a-a0ff-7c7f0190b4b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610378442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2MgTFVQIGAogKeGjtgnMyQWeyj36PU1W60Mle8ZvTl4=;
	b=L+5LGoXeCY++gBa66HHF3WqtDp/SrAFDmTHluzrgX6gdt3St+CzYrMQtoTTk1lm0dAGRIz
	+nkxwVKOUgFnoIajgNnNn/bZ5/2MWHoo9fWXQEkxVHuZZ8Zl7NgpUsw0QKR/gm8gar6v4T
	/SmgBUv+9Lglizwgi75Fu633RYT6+gA=
X-MC-Unique: edzwXZJnMw-h8GrzZ1o1ZA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2MgTFVQIGAogKeGjtgnMyQWeyj36PU1W60Mle8ZvTl4=;
        b=NUS2IOQ4pesb116qz/rRq8AUf8JO+HmP2UCv5NqLnXJTINMRxPc9et+WrG6J+qao1p
         99ovqqN0XB2z95KQlBRECqvc1iN3wSNxPWM+U4jo16w/kBEchMdfUBiVUh2+4HMOXEi7
         7oYOg78vqh/LzlU/jyLYsxEQJzyUGfENFTmytYAUFZdEuvYfuCCdipO/4OJWOAARfdzM
         dIXcw60yIZvH/LK9M7t3R2jzDMcr1gDR6OlWwFU+waDyVw3E/GEnX1uHxRQBhvn0J9qR
         xqtKZiW+gAPyIZ7QFrr7QijuY06nW1H1JoiJt4PwIMMo0IdFwlC0U4UpB9WrfILpdYI+
         rF2g==
X-Gm-Message-State: AOAM532ksRr2nOF7lQA6yF45hqJ6GEvEa5Wtw1vjpg1XUyBonL4QQTU3
	bVjsOmSJ3OyuWfg9hLpMMAxSTZznJKtMHLU6XqYjcDT3w4ZaUcE//Vk3d99BJbwBEr6wxovHRfL
	MeSJoqVetUqsLH/Osr29QvwwGioA=
X-Received: by 2002:aa7:cccf:: with SMTP id y15mr14611649edt.112.1610378438970;
        Mon, 11 Jan 2021 07:20:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcMF+UJehYZiO17PyZzy9+j70Zu9ldss/OST7FfZYyo9mNlmtdppkrmgXvwyrPuWC1Fb5iiw==
X-Received: by 2002:aa7:cccf:: with SMTP id y15mr14611598edt.112.1610378438650;
        Mon, 11 Jan 2021 07:20:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kurz <groug@kaod.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org,
	Amit Shah <amit@kernel.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-block@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] sysemu: Let VMChangeStateHandler take boolean 'running' argument
Date: Mon, 11 Jan 2021 16:20:20 +0100
Message-Id: <20210111152020.1422021-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 'running' argument from VMChangeStateHandler does not require
other value than 0 / 1. Make it a plain boolean.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/runstate.h   | 10 ++++++++--
 target/arm/kvm_arm.h        |  2 +-
 target/ppc/cpu-qom.h        |  2 +-
 accel/xen/xen-all.c         |  2 +-
 audio/audio.c               |  2 +-
 block/block-backend.c       |  2 +-
 gdbstub.c                   |  2 +-
 hw/block/pflash_cfi01.c     |  2 +-
 hw/block/virtio-blk.c       |  2 +-
 hw/display/qxl.c            |  2 +-
 hw/i386/kvm/clock.c         |  2 +-
 hw/i386/kvm/i8254.c         |  2 +-
 hw/i386/kvmvapic.c          |  2 +-
 hw/i386/xen/xen-hvm.c       |  2 +-
 hw/ide/core.c               |  2 +-
 hw/intc/arm_gicv3_its_kvm.c |  2 +-
 hw/intc/arm_gicv3_kvm.c     |  2 +-
 hw/intc/spapr_xive_kvm.c    |  2 +-
 hw/misc/mac_via.c           |  2 +-
 hw/net/e1000e_core.c        |  2 +-
 hw/nvram/spapr_nvram.c      |  2 +-
 hw/ppc/ppc.c                |  2 +-
 hw/ppc/ppc_booke.c          |  2 +-
 hw/s390x/tod-kvm.c          |  2 +-
 hw/scsi/scsi-bus.c          |  2 +-
 hw/usb/hcd-ehci.c           |  2 +-
 hw/usb/host-libusb.c        |  2 +-
 hw/usb/redirect.c           |  2 +-
 hw/vfio/migration.c         |  2 +-
 hw/virtio/virtio-rng.c      |  2 +-
 hw/virtio/virtio.c          |  2 +-
 net/net.c                   |  2 +-
 softmmu/memory.c            |  2 +-
 softmmu/runstate.c          |  2 +-
 target/arm/kvm.c            |  2 +-
 target/i386/kvm/kvm.c       |  2 +-
 target/i386/sev.c           |  2 +-
 target/i386/whpx/whpx-all.c |  2 +-
 target/mips/kvm.c           |  4 ++--
 ui/gtk.c                    |  2 +-
 ui/spice-core.c             |  2 +-
 41 files changed, 49 insertions(+), 43 deletions(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index 3ab35a039a0..a5356915734 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -10,7 +10,7 @@ bool runstate_is_running(void);
 bool runstate_needs_reset(void);
 bool runstate_store(char *str, size_t size);
 
-typedef void VMChangeStateHandler(void *opaque, int running, RunState state);
+typedef void VMChangeStateHandler(void *opaque, bool running, RunState state);
 
 VMChangeStateEntry *qemu_add_vm_change_state_handler(VMChangeStateHandler *cb,
                                                      void *opaque);
@@ -20,7 +20,13 @@ VMChangeStateEntry *qdev_add_vm_change_state_handler(DeviceState *dev,
                                                      VMChangeStateHandler *cb,
                                                      void *opaque);
 void qemu_del_vm_change_state_handler(VMChangeStateEntry *e);
-void vm_state_notify(int running, RunState state);
+/**
+ * vm_state_notify: Notify the state of the VM
+ *
+ * @running: whether the VM is running or not.
+ * @state: the #RunState of the VM.
+ */
+void vm_state_notify(bool running, RunState state);
 
 static inline bool shutdown_caused_by_guest(ShutdownCause cause)
 {
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index eb81b7059eb..68ec970c4f4 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -352,7 +352,7 @@ void kvm_arm_get_virtual_time(CPUState *cs);
  */
 void kvm_arm_put_virtual_time(CPUState *cs);
 
-void kvm_arm_vm_state_change(void *opaque, int running, RunState state);
+void kvm_arm_vm_state_change(void *opaque, bool running, RunState state);
 
 int kvm_arm_vgic_probe(void);
 
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 63b9e8632ca..118baf8d41f 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -218,7 +218,7 @@ extern const VMStateDescription vmstate_ppc_timebase;
     .offset     = vmstate_offset_value(_state, _field, PPCTimebase),  \
 }
 
-void cpu_ppc_clock_vm_state_change(void *opaque, int running,
+void cpu_ppc_clock_vm_state_change(void *opaque, bool running,
                                    RunState state);
 #endif
 
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 878a4089d97..3756aca27be 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -122,7 +122,7 @@ static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
 }
 
 
-static void xen_change_state_handler(void *opaque, int running,
+static void xen_change_state_handler(void *opaque, bool running,
                                      RunState state)
 {
     if (running) {
diff --git a/audio/audio.c b/audio/audio.c
index b48471bb3f6..f2d56e7e57d 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1549,7 +1549,7 @@ static int audio_driver_init(AudioState *s, struct audio_driver *drv,
     }
 }
 
-static void audio_vm_change_state_handler (void *opaque, int running,
+static void audio_vm_change_state_handler (void *opaque, bool running,
                                            RunState state)
 {
     AudioState *s = opaque;
diff --git a/block/block-backend.c b/block/block-backend.c
index ce78d30794a..9175eb237a2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -163,7 +163,7 @@ static const char *blk_root_get_name(BdrvChild *child)
     return blk_name(child->opaque);
 }
 
-static void blk_vm_state_changed(void *opaque, int running, RunState state)
+static void blk_vm_state_changed(void *opaque, bool running, RunState state)
 {
     Error *local_err = NULL;
     BlockBackend *blk = opaque;
diff --git a/gdbstub.c b/gdbstub.c
index d99bc0bf2ea..9f2998f8d03 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2691,7 +2691,7 @@ void gdb_set_stop_cpu(CPUState *cpu)
 }
 
 #ifndef CONFIG_USER_ONLY
-static void gdb_vm_state_change(void *opaque, int running, RunState state)
+static void gdb_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cpu = gdbserver_state.c_cpu;
     g_autoptr(GString) buf = g_string_new(NULL);
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index ccf326793db..badcbccf012 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -1014,7 +1014,7 @@ void pflash_cfi01_legacy_drive(PFlashCFI01 *fl, DriveInfo *dinfo)
     loc_pop(&loc);
 }
 
-static void postload_update_cb(void *opaque, int running, RunState state)
+static void postload_update_cb(void *opaque, bool running, RunState state)
 {
     PFlashCFI01 *pfl = opaque;
 
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index bac2d6fa2b2..5207ef617f0 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -870,7 +870,7 @@ static void virtio_blk_dma_restart_bh(void *opaque)
     virtio_blk_process_queued_requests(s, true);
 }
 
-static void virtio_blk_dma_restart_cb(void *opaque, int running,
+static void virtio_blk_dma_restart_cb(void *opaque, bool running,
                                       RunState state)
 {
     VirtIOBlock *s = opaque;
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 431c1070967..d22e84ba13e 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1992,7 +1992,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
     }
 }
 
-static void qxl_vm_change_state_handler(void *opaque, int running,
+static void qxl_vm_change_state_handler(void *opaque, bool running,
                                         RunState state)
 {
     PCIQXLDevice *qxl = opaque;
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 2d8a3663693..51872dd84c0 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -162,7 +162,7 @@ static void do_kvmclock_ctrl(CPUState *cpu, run_on_cpu_data data)
     }
 }
 
-static void kvmclock_vm_state_change(void *opaque, int running,
+static void kvmclock_vm_state_change(void *opaque, bool running,
                                      RunState state)
 {
     KVMClockState *s = opaque;
diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index c73254e8866..c558893961b 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -239,7 +239,7 @@ static void kvm_pit_irq_control(void *opaque, int n, int enable)
     kvm_pit_put(pit);
 }
 
-static void kvm_pit_vm_state_change(void *opaque, int running,
+static void kvm_pit_vm_state_change(void *opaque, bool running,
                                     RunState state)
 {
     KVMPITState *s = opaque;
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 2c1898032e4..46315445d22 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -748,7 +748,7 @@ static void do_vapic_enable(CPUState *cs, run_on_cpu_data data)
     s->state = VAPIC_ACTIVE;
 }
 
-static void kvmvapic_vm_state_change(void *opaque, int running,
+static void kvmvapic_vm_state_change(void *opaque, bool running,
                                      RunState state)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 68821d90f52..7ce672e5a5c 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1235,7 +1235,7 @@ static void xen_main_loop_prepare(XenIOState *state)
 }
 
 
-static void xen_hvm_change_state_handler(void *opaque, int running,
+static void xen_hvm_change_state_handler(void *opaque, bool running,
                                          RunState rstate)
 {
     XenIOState *state = opaque;
diff --git a/hw/ide/core.c b/hw/ide/core.c
index b49e4cfbc6c..b5c6e967b2e 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2677,7 +2677,7 @@ static void ide_restart_bh(void *opaque)
     }
 }
 
-static void ide_restart_cb(void *opaque, int running, RunState state)
+static void ide_restart_cb(void *opaque, bool running, RunState state)
 {
     IDEBus *bus = opaque;
 
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 057cb53f13c..b554d2ede0a 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -71,7 +71,7 @@ static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
  *
  * The tables get flushed to guest RAM whenever the VM gets stopped.
  */
-static void vm_change_state_handler(void *opaque, int running,
+static void vm_change_state_handler(void *opaque, bool running,
                                     RunState state)
 {
     GICv3ITSState *s = (GICv3ITSState *)opaque;
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index d040a5d1e99..65a4c880a35 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -743,7 +743,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
  *
  * The tables get flushed to guest RAM whenever the VM gets stopped.
  */
-static void vm_change_state_handler(void *opaque, int running,
+static void vm_change_state_handler(void *opaque, bool running,
                                     RunState state)
 {
     GICv3State *s = (GICv3State *)opaque;
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index acc8c3650c4..c0083311607 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -504,7 +504,7 @@ static int kvmppc_xive_get_queues(SpaprXive *xive, Error **errp)
  * runs again. If an interrupt was queued while the VM was stopped,
  * simply generate a trigger.
  */
-static void kvmppc_xive_change_state_handler(void *opaque, int running,
+static void kvmppc_xive_change_state_handler(void *opaque, bool running,
                                              RunState state)
 {
     SpaprXive *xive = opaque;
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 488d086a17c..ca2f939dd58 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1098,7 +1098,7 @@ static void mac_via_init(Object *obj)
                         TYPE_ADB_BUS, DEVICE(obj), "adb.0");
 }
 
-static void postload_update_cb(void *opaque, int running, RunState state)
+static void postload_update_cb(void *opaque, bool running, RunState state)
 {
     MacVIAState *m = MAC_VIA(opaque);
 
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 4dcb92d966b..b75f2ab8fc1 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -3298,7 +3298,7 @@ e1000e_autoneg_resume(E1000ECore *core)
 }
 
 static void
-e1000e_vm_state_change(void *opaque, int running, RunState state)
+e1000e_vm_state_change(void *opaque, bool running, RunState state)
 {
     E1000ECore *core = opaque;
 
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 9e51bc82ae4..01f77520146 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -217,7 +217,7 @@ static int spapr_nvram_pre_load(void *opaque)
     return 0;
 }
 
-static void postload_update_cb(void *opaque, int running, RunState state)
+static void postload_update_cb(void *opaque, bool running, RunState state)
 {
     SpaprNvram *nvram = opaque;
 
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 5cbbff1f8d0..bf28d6bfc8d 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1059,7 +1059,7 @@ static void timebase_load(PPCTimebase *tb)
     }
 }
 
-void cpu_ppc_clock_vm_state_change(void *opaque, int running,
+void cpu_ppc_clock_vm_state_change(void *opaque, bool running,
                                    RunState state)
 {
     PPCTimebase *tb = opaque;
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index 652a21b8064..974c0c8a752 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -317,7 +317,7 @@ static void ppc_booke_timer_reset_handle(void *opaque)
  * action will be taken. To avoid this we always clear the watchdog state when
  * state changes to running.
  */
-static void cpu_state_change_handler(void *opaque, int running, RunState state)
+static void cpu_state_change_handler(void *opaque, bool running, RunState state)
 {
     PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
index 6e21d83181d..0b944774861 100644
--- a/hw/s390x/tod-kvm.c
+++ b/hw/s390x/tod-kvm.c
@@ -78,7 +78,7 @@ static void kvm_s390_tod_set(S390TODState *td, const S390TOD *tod, Error **errp)
     }
 }
 
-static void kvm_s390_tod_vm_state_change(void *opaque, int running,
+static void kvm_s390_tod_vm_state_change(void *opaque, bool running,
                                          RunState state)
 {
     S390TODState *td = opaque;
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index c349fb7f2d1..f990d5b3b03 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -181,7 +181,7 @@ void scsi_req_retry(SCSIRequest *req)
     req->retry = true;
 }
 
-static void scsi_dma_restart_cb(void *opaque, int running, RunState state)
+static void scsi_dma_restart_cb(void *opaque, bool running, RunState state)
 {
     SCSIDevice *s = opaque;
 
diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index aca018d8b5f..98d08c325ea 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2436,7 +2436,7 @@ static int usb_ehci_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static void usb_ehci_vm_state_change(void *opaque, int running, RunState state)
+static void usb_ehci_vm_state_change(void *opaque, bool running, RunState state)
 {
     EHCIState *ehci = opaque;
 
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index b950501d100..ecbf3f66f42 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1755,7 +1755,7 @@ type_init(usb_host_register_types)
 static QEMUTimer *usb_auto_timer;
 static VMChangeStateEntry *usb_vmstate;
 
-static void usb_host_vm_state(void *unused, int running, RunState state)
+static void usb_host_vm_state(void *unused, bool running, RunState state)
 {
     if (running) {
         usb_host_auto_check(unused);
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 7e9e3fecbfe..17f06f34179 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1395,7 +1395,7 @@ static void usbredir_chardev_event(void *opaque, QEMUChrEvent event)
  * init + destroy
  */
 
-static void usbredir_vm_state_change(void *priv, int running, RunState state)
+static void usbredir_vm_state_change(void *priv, bool running, RunState state)
 {
     USBRedirDevice *dev = priv;
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 00daa50ed81..134bdccc4f8 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -727,7 +727,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
 
 /* ---------------------------------------------------------------------- */
 
-static void vfio_vmstate_change(void *opaque, int running, RunState state)
+static void vfio_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index 76ce9376931..cc8e9f775d8 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -133,7 +133,7 @@ static uint64_t get_features(VirtIODevice *vdev, uint64_t f, Error **errp)
     return f;
 }
 
-static void virtio_rng_vm_state_change(void *opaque, int running,
+static void virtio_rng_vm_state_change(void *opaque, bool running,
                                        RunState state)
 {
     VirtIORNG *vrng = opaque;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b308026596f..38dc623c89e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3208,7 +3208,7 @@ void virtio_cleanup(VirtIODevice *vdev)
     qemu_del_vm_change_state_handler(vdev->vmstate);
 }
 
-static void virtio_vmstate_change(void *opaque, int running, RunState state)
+static void virtio_vmstate_change(void *opaque, bool running, RunState state)
 {
     VirtIODevice *vdev = opaque;
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
diff --git a/net/net.c b/net/net.c
index e1035f21d18..8a85d1e3f7b 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1341,7 +1341,7 @@ void qmp_set_link(const char *name, bool up, Error **errp)
     }
 }
 
-static void net_vm_change_state_handler(void *opaque, int running,
+static void net_vm_change_state_handler(void *opaque, bool running,
                                         RunState state)
 {
     NetClientState *nc;
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 333e1ed7b05..ab7f2e5aa07 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2675,7 +2675,7 @@ static void memory_global_dirty_log_do_stop(void)
     MEMORY_LISTENER_CALL_GLOBAL(log_global_stop, Reverse);
 }
 
-static void memory_vm_change_state_handler(void *opaque, int running,
+static void memory_vm_change_state_handler(void *opaque, bool running,
                                            RunState state)
 {
     if (running) {
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index c7a67147d17..cb07a65925c 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -316,7 +316,7 @@ void qemu_del_vm_change_state_handler(VMChangeStateEntry *e)
     g_free(e);
 }
 
-void vm_state_notify(int running, RunState state)
+void vm_state_notify(bool running, RunState state)
 {
     VMChangeStateEntry *e, *next;
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ffe186de8d1..53d6c4a17eb 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -844,7 +844,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
     return MEMTXATTRS_UNSPECIFIED;
 }
 
-void kvm_arm_vm_state_change(void *opaque, int running, RunState state)
+void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cs = opaque;
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6dc1ee052d5..170ad55c09c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -690,7 +690,7 @@ static int kvm_inject_mce_oldstyle(X86CPU *cpu)
     return 0;
 }
 
-static void cpu_update_state(void *opaque, int running, RunState state)
+static void cpu_update_state(void *opaque, bool running, RunState state)
 {
     CPUX86State *env = opaque;
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 15466068118..e7890f61906 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -670,7 +670,7 @@ sev_launch_finish(SevGuestState *sev)
 }
 
 static void
-sev_vm_state_change(void *opaque, int running, RunState state)
+sev_vm_state_change(void *opaque, bool running, RunState state)
 {
     SevGuestState *sev = opaque;
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 3b824fc9d7c..850dfe72e75 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1318,7 +1318,7 @@ void whpx_cpu_synchronize_pre_loadvm(CPUState *cpu)
 
 static Error *whpx_migration_blocker;
 
-static void whpx_cpu_update_state(void *opaque, int running, RunState state)
+static void whpx_cpu_update_state(void *opaque, bool running, RunState state)
 {
     CPUX86State *env = opaque;
 
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 477692566a4..09945ad2455 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -37,7 +37,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
 
-static void kvm_mips_update_state(void *opaque, int running, RunState state);
+static void kvm_mips_update_state(void *opaque, bool running, RunState state);
 
 unsigned long kvm_arch_vcpu_id(CPUState *cs)
 {
@@ -552,7 +552,7 @@ static int kvm_mips_restore_count(CPUState *cs)
 /*
  * Handle the VM clock being started or stopped
  */
-static void kvm_mips_update_state(void *opaque, int running, RunState state)
+static void kvm_mips_update_state(void *opaque, bool running, RunState state)
 {
     CPUState *cs = opaque;
     int ret;
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be0..a5bf8ed8429 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -672,7 +672,7 @@ static const DisplayChangeListenerOps dcl_egl_ops = {
 
 /** QEMU Events **/
 
-static void gd_change_runstate(void *opaque, int running, RunState state)
+static void gd_change_runstate(void *opaque, bool running, RunState state)
 {
     GtkDisplayState *s = opaque;
 
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 5746d0aae7c..22c77c04151 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -622,7 +622,7 @@ static int add_channel(void *opaque, const char *name, const char *value,
     return 0;
 }
 
-static void vm_change_state_handler(void *opaque, int running,
+static void vm_change_state_handler(void *opaque, bool running,
                                     RunState state)
 {
     if (running) {
-- 
2.26.2


