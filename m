Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880CA3E30B6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 23:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164784.301156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC785-0003Aa-9w; Fri, 06 Aug 2021 21:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164784.301156; Fri, 06 Aug 2021 21:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC785-00038c-6I; Fri, 06 Aug 2021 21:11:45 +0000
Received: by outflank-mailman (input) for mailman id 164784;
 Fri, 06 Aug 2021 21:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ct2c=M5=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1mC783-00038W-DS
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 21:11:43 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e4fa32ac-f6fa-11eb-9d51-12813bfff9fa;
 Fri, 06 Aug 2021 21:11:41 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-aaKp7NU5MC-VTkOZlJSXOA-1; Fri, 06 Aug 2021 17:11:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E22760C0;
 Fri,  6 Aug 2021 21:11:36 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFD3519D9D;
 Fri,  6 Aug 2021 21:11:28 +0000 (UTC)
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
X-Inumbo-ID: e4fa32ac-f6fa-11eb-9d51-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628284300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NrWXzwcHtAk2o6nzYXUeBvyqkxvDAmoKSRR1o3DRnJ4=;
	b=JsSAzdCoUQ7B9+QH1FXkEHOs2JpObbbc4Q8BQLf62pIY8JEuK/UFCNA8SLqG3kDUJiS8NE
	cdhuLptUhf5bNKiwhG4MFI0cP6ACqD2dnRza+ICOgnwX3LJ5LEgqCI0lbkyB4g8USG/N2P
	CHWyT47QkgrD2yM/Thmm18O8yqSXwh0=
X-MC-Unique: aaKp7NU5MC-VTkOZlJSXOA-1
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Colin Xu <colin.xu@intel.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	haxm-team@intel.com
Subject: [PATCH for-6.2 01/12] accel: Rename TYPE_ACCEL to TYPE_ACCEL_BASE
Date: Fri,  6 Aug 2021 17:11:16 -0400
Message-Id: <20210806211127.646908-2-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

The ACCEL name conflicts with a Windows API typedef name, and it
is difficult to work around this because windows.h needs to be
included by osdep.h.  This prevents us from replacing the
existing ACCEL macro with an inline function generated by
OBJECT_DEFINE_TYPE.

Work around the conflict by renaming TYPE_ACCEL to TYPE_ACCEL_BASE.

Note that the actual QOM type name is still "accel", because QOM
type names are user-visible and I don't want to make any
user-visible change here.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Notes about name alternatives:

I have considered using the name "CPU_ACCEL" as Daniel suggested,
but this would lead to a parent class named CPU_ACCEL, while
the subclasses would be still named KVM_ACCEL, HVF_ACCEL,
TCG_ACCEL, etc.  I that this would be confusing, because it
would look like CPU_ACCEL is just another type of accel, not the
parent type of all other *_ACCEL types.

Renaming KVM_ACCEL/HVF_ACCEL/TCG_ACCEL to
KVM_CPU_ACCEL/HVF_CPU_ACCEL/TCG_CPU_ACCEL would be clearer, but I
believe it would be too intrusive and the resulting type names
would be too long.

Renaming the base classe ACCEL_BASE sounds like a reasonable
alternative, as there are other examples in QEMU where abstract
base classes are called *_BASE: TYPE_VIRTIO_GPU_PCI_BASE,
TYPE_VIRTIO_GPU_BASE, TYPE_E1000_BASE, TYPE_RISCV_CPU_BASE,
TYPE_MEGASAS_BASE, TYPE_SCSI_DISK_BASE, etc.
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Cameron Esfahani <dirty@apple.com>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Warner Losh <imp@bsdimp.com>
Cc: Kyle Evans <kevans@freebsd.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Wenchao Wang <wenchao.wang@intel.com>
Cc: Colin Xu <colin.xu@intel.com>
Cc: Kamil Rytarowski <kamil@netbsd.org>
Cc: Reinoud Zandijk <reinoud@netbsd.org>
Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Cc: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: haxm-team@intel.com
---
 hw/core/machine.c           |  2 +-
 include/qemu/accel.h        | 16 ++++++++--------
 accel/accel-common.c        |  4 ++--
 accel/accel-softmmu.c       |  4 ++--
 accel/accel-user.c          |  2 +-
 accel/hvf/hvf-accel-ops.c   |  4 ++--
 accel/kvm/kvm-all.c         |  4 ++--
 accel/qtest/qtest.c         |  4 ++--
 accel/tcg/tcg-all.c         |  4 ++--
 accel/xen/xen-all.c         |  4 ++--
 bsd-user/main.c             |  2 +-
 linux-user/main.c           |  2 +-
 softmmu/memory.c            |  2 +-
 softmmu/vl.c                |  6 +++---
 target/i386/hax/hax-all.c   |  4 ++--
 target/i386/nvmm/nvmm-all.c |  4 ++--
 target/i386/whpx/whpx-all.c |  4 ++--
 17 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 943974d411c..fdb1f886ce8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1268,7 +1268,7 @@ void machine_run_board_init(MachineState *machine)
                                    "on", false);
     }
 
-    accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
+    accel_init_interfaces(ACCEL_BASE_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
     phase_advance(PHASE_MACHINE_INITIALIZED);
 }
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6fc..cc915720494 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -54,17 +54,17 @@ typedef struct AccelClass {
     GPtrArray *compat_props;
 } AccelClass;
 
-#define TYPE_ACCEL "accel"
+#define TYPE_ACCEL_BASE "accel"
 
-#define ACCEL_CLASS_SUFFIX  "-" TYPE_ACCEL
+#define ACCEL_CLASS_SUFFIX  "-" TYPE_ACCEL_BASE
 #define ACCEL_CLASS_NAME(a) (a ACCEL_CLASS_SUFFIX)
 
-#define ACCEL_CLASS(klass) \
-    OBJECT_CLASS_CHECK(AccelClass, (klass), TYPE_ACCEL)
-#define ACCEL(obj) \
-    OBJECT_CHECK(AccelState, (obj), TYPE_ACCEL)
-#define ACCEL_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL)
+#define ACCEL_BASE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(AccelClass, (klass), TYPE_ACCEL_BASE)
+#define ACCEL_BASE(obj) \
+    OBJECT_CHECK(AccelState, (obj), TYPE_ACCEL_BASE)
+#define ACCEL_BASE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(AccelClass, (obj), TYPE_ACCEL_BASE)
 
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 7b8ec7e0f72..c4e268c8a74 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -34,7 +34,7 @@
 #endif /* !CONFIG_USER_ONLY */
 
 static const TypeInfo accel_type = {
-    .name = TYPE_ACCEL,
+    .name = TYPE_ACCEL_BASE,
     .parent = TYPE_OBJECT,
     .class_size = sizeof(AccelClass),
     .instance_size = sizeof(AccelState),
@@ -44,7 +44,7 @@ static const TypeInfo accel_type = {
 AccelClass *accel_find(const char *opt_name)
 {
     char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
-    AccelClass *ac = ACCEL_CLASS(module_object_class_by_name(class_name));
+    AccelClass *ac = ACCEL_BASE_CLASS(module_object_class_by_name(class_name));
     g_free(class_name);
     return ac;
 }
diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 67276e4f522..792bdc44940 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -32,7 +32,7 @@
 
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
-    AccelClass *acc = ACCEL_GET_CLASS(accel);
+    AccelClass *acc = ACCEL_BASE_GET_CLASS(accel);
     int ret;
     ms->accelerator = accel;
     *(acc->allowed) = true;
@@ -55,7 +55,7 @@ AccelState *current_accel(void)
 void accel_setup_post(MachineState *ms)
 {
     AccelState *accel = ms->accelerator;
-    AccelClass *acc = ACCEL_GET_CLASS(accel);
+    AccelClass *acc = ACCEL_BASE_GET_CLASS(accel);
     if (acc->setup_post) {
         acc->setup_post(ms, accel);
     }
diff --git a/accel/accel-user.c b/accel/accel-user.c
index 22b6a1a1a89..492480847e5 100644
--- a/accel/accel-user.c
+++ b/accel/accel-user.c
@@ -18,7 +18,7 @@ AccelState *current_accel(void)
         AccelClass *ac = accel_find("tcg");
 
         g_assert(ac != NULL);
-        accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
+        accel = ACCEL_BASE(object_new_with_class(OBJECT_CLASS(ac)));
     }
     return accel;
 }
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d1691be9896..af09bfd1acb 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -329,7 +329,7 @@ static int hvf_accel_init(MachineState *ms)
 
 static void hvf_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     ac->name = "HVF";
     ac->init_machine = hvf_accel_init;
     ac->allowed = &hvf_allowed;
@@ -337,7 +337,7 @@ static void hvf_accel_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo hvf_accel_type = {
     .name = TYPE_HVF_ACCEL,
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .class_init = hvf_accel_class_init,
 };
 
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb8..381ba59a970 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3618,7 +3618,7 @@ static void kvm_accel_instance_init(Object *obj)
 
 static void kvm_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     ac->name = "KVM";
     ac->init_machine = kvm_init;
     ac->has_memory = kvm_accel_has_memory;
@@ -3645,7 +3645,7 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo kvm_accel_type = {
     .name = TYPE_KVM_ACCEL,
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .instance_init = kvm_accel_instance_init,
     .class_init = kvm_accel_class_init,
     .instance_size = sizeof(KVMState),
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 7e6b8110d52..10b9b56b0e5 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -32,7 +32,7 @@ static int qtest_init_accel(MachineState *ms)
 
 static void qtest_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     ac->name = "QTest";
     ac->init_machine = qtest_init_accel;
     ac->allowed = &qtest_allowed;
@@ -42,7 +42,7 @@ static void qtest_accel_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo qtest_accel_type = {
     .name = TYPE_QTEST_ACCEL,
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .class_init = qtest_accel_class_init,
 };
 module_obj(TYPE_QTEST_ACCEL);
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index d6336a9c966..c0812e5dfd6 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -210,7 +210,7 @@ static void tcg_set_splitwx(Object *obj, bool value, Error **errp)
 
 static void tcg_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     ac->name = "tcg";
     ac->init_machine = tcg_init_machine;
     ac->allowed = &tcg_allowed;
@@ -233,7 +233,7 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo tcg_accel_type = {
     .name = TYPE_TCG_ACCEL,
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .instance_init = tcg_accel_instance_init,
     .class_init = tcg_accel_class_init,
     .instance_size = sizeof(TCGState),
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b2..42b83f35d8c 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -186,7 +186,7 @@ static int xen_init(MachineState *ms)
 
 static void xen_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     static GlobalProperty compat[] = {
         { "migration", "store-global-state", "off" },
         { "migration", "send-configuration", "off" },
@@ -211,7 +211,7 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo xen_accel_type = {
     .name = TYPE_XEN_ACCEL,
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .class_init = xen_accel_class_init,
 };
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index fe66204b6b7..f26eefd3b39 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -793,7 +793,7 @@ int main(int argc, char **argv)
     cpu_type = parse_cpu_option(cpu_model);
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+        AccelClass *ac = ACCEL_BASE_GET_CLASS(current_accel());
 
         accel_init_interfaces(ac);
         ac->init_machine(NULL);
diff --git a/linux-user/main.c b/linux-user/main.c
index 37ed50d98e2..d9dd14e07bc 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -723,7 +723,7 @@ int main(int argc, char **argv, char **envp)
 
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+        AccelClass *ac = ACCEL_BASE_GET_CLASS(current_accel());
 
         accel_init_interfaces(ac);
         ac->init_machine(NULL);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..a24fa8c0475 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3261,7 +3261,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
         };
         GArray *fv_address_spaces;
         GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+        AccelClass *ac = ACCEL_BASE_GET_CLASS(current_accel());
 
         if (ac->has_memory) {
             fvi.ac = ac;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5ca11e74694..b7a20da366b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2305,7 +2305,7 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
         }
         return 0;
     }
-    accel = ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
+    accel = ACCEL_BASE(object_new_with_class(OBJECT_CLASS(ac)));
     object_apply_compat_props(OBJECT(accel));
     qemu_opt_foreach(opts, accelerator_set_property,
                      accel,
@@ -2386,7 +2386,7 @@ static void configure_accelerators(const char *progname)
     }
 
     if (init_failed && !qtest_chrdev) {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+        AccelClass *ac = ACCEL_BASE_GET_CLASS(current_accel());
         error_report("falling back to %s", ac->name);
     }
 
@@ -3315,7 +3315,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 optarg = qemu_opt_get(accel_opts, "accel");
                 if (!optarg || is_help_option(optarg)) {
                     printf("Accelerators supported in QEMU binary:\n");
-                    GSList *el, *accel_list = object_class_get_list(TYPE_ACCEL,
+                    GSList *el, *accel_list = object_class_get_list(TYPE_ACCEL_BASE,
                                                                     false);
                     for (el = accel_list; el; el = el->next) {
                         gchar *typename = g_strdup(object_class_get_name(
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index bf65ed6fa92..37d18d7ea98 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -1120,7 +1120,7 @@ void hax_reset_vcpu_state(void *opaque)
 
 static void hax_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     ac->name = "HAX";
     ac->init_machine = hax_accel_init;
     ac->allowed = &hax_allowed;
@@ -1128,7 +1128,7 @@ static void hax_accel_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo hax_accel_type = {
     .name = ACCEL_CLASS_NAME("hax"),
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .class_init = hax_accel_class_init,
 };
 
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index dfa690d65da..be66baa9d2f 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -1205,7 +1205,7 @@ nvmm_enabled(void)
 static void
 nvmm_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     ac->name = "NVMM";
     ac->init_machine = nvmm_accel_init;
     ac->allowed = &nvmm_allowed;
@@ -1213,7 +1213,7 @@ nvmm_accel_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo nvmm_accel_type = {
     .name = ACCEL_CLASS_NAME("nvmm"),
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .class_init = nvmm_accel_class_init,
 };
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f832f286ac3..5cf77f916c1 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1873,7 +1873,7 @@ bool whpx_apic_in_platform(void) {
 
 static void whpx_accel_class_init(ObjectClass *oc, void *data)
 {
-    AccelClass *ac = ACCEL_CLASS(oc);
+    AccelClass *ac = ACCEL_BASE_CLASS(oc);
     ac->name = "WHPX";
     ac->init_machine = whpx_accel_init;
     ac->allowed = &whpx_allowed;
@@ -1896,7 +1896,7 @@ static void whpx_accel_instance_init(Object *obj)
 
 static const TypeInfo whpx_accel_type = {
     .name = ACCEL_CLASS_NAME("whpx"),
-    .parent = TYPE_ACCEL,
+    .parent = TYPE_ACCEL_BASE,
     .instance_init = whpx_accel_instance_init,
     .class_init = whpx_accel_class_init,
 };
-- 
2.31.1


