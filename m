Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8F22B2E1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:48:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydS4-00062V-1H; Thu, 23 Jul 2020 15:48:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jydS2-00062Q-68
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:48:06 +0000
X-Inumbo-ID: e48cf1ce-ccfb-11ea-a2c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e48cf1ce-ccfb-11ea-a2c7-12813bfff9fa;
 Thu, 23 Jul 2020 15:48:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA62EAC82;
 Thu, 23 Jul 2020 15:48:10 +0000 (UTC)
Subject: [PATCH v3 1/8] x86: fix compat header generation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Message-ID: <c2cb193c-f162-485e-1997-fb74e40c0cc5@suse.com>
Date: Thu, 23 Jul 2020 17:48:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
struct xen_mem_acquire_resource"), we're not currently handling structs
correctly that have uint64_aligned_t fields. #pragma pack(4) suppresses
the necessary alignment even if the type did properly survive (which
it also didn't) in the process of generating the headers. Overall,
with the above mentioned change applied, there's only a latent issue
here afaict, i.e. no other of our interface structs is currently
affected.

As a result it is clear that using #pragma pack(4) is not an option.
Drop all uses from compat header generation. Make sure
{,u}int64_aligned_t actually survives, such that explicitly aligned
fields will remain aligned. Arrange for {,u}int64_t to be transformed
into a type that's 64 bits wide and 4-byte aligned, by utilizing that
in typedef-s the "aligned" attribute can be used to reduce alignment.
Additionally, for the cases where native structures get re-used,
enforce suitable alignment via typedef-s (which allow alignment to be
reduced).

This use of typedef-s makes necessary changes to CHECK_*() macro
generation: Previously get-fields.sh relied on finding struct/union
keywords when other compound types were used. We need to use the
typedef-s (guaranteeing suitable alignment) now, and hence the script
has to recognize those cases, too. (Unfortunately there are a few
special cases to be dealt with, but this is really not much different
from e.g. the pre-existing compat_domain_handle_t special case.)

This need to use typedef-s is certainly somewhat fragile going forward,
as in similar future cases it is imperative to also use typedef-s, or
else the CHECK_*() macros won't check what they're supposed to check. I
don't currently see any means to avoid this fragility, though.

There's one change to generated code according to my observations: In
arch_compat_vcpu_op() the runstate area "area" variable would previously
have been put in a just 4-byte aligned stack slot (despite being 8 bytes
in size), whereas now it gets put in an 8-byte aligned location.

There also results some curious inconsistency in struct xen_mc from
these changes - I intend to clean this up later on. Otherwise unrelated
code would also need adjustment right here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Fix build with older gcc (duplicate typedef-s for
    {,u}int64_compat_t).
v2: Different approach, addressing the latent alignment issues in v1.

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -34,15 +34,6 @@ headers-$(CONFIG_XSM_FLASK) += compat/xs
 cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
 cppflags-$(CONFIG_X86)    += -m32
 
-# 8-byte types are 4-byte aligned on x86_32 ...
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-prefix-$(CONFIG_X86)      := \#pragma pack(push, 4)
-suffix-$(CONFIG_X86)      := \#pragma pack(pop)
-else
-prefix-$(CONFIG_X86)      := \#pragma pack(4)
-suffix-$(CONFIG_X86)      := \#pragma pack()
-endif
-
 endif
 
 public-$(CONFIG_X86) := $(wildcard public/arch-x86/*.h public/arch-x86/*/*.h)
@@ -57,10 +48,8 @@ compat/%.h: compat/%.i Makefile $(BASEDI
 	echo "#define $$id" >>$@.new; \
 	echo "#include <xen/compat.h>" >>$@.new; \
 	$(if $(filter-out compat/arch-%.h,$@),echo "#include <$(patsubst compat/%,public/%,$@)>" >>$@.new;) \
-	$(if $(prefix-y),echo "$(prefix-y)" >>$@.new;) \
 	grep -v '^# [0-9]' $< | \
 	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py | uniq >>$@.new; \
-	$(if $(suffix-y),echo "$(suffix-y)" >>$@.new;) \
 	echo "#endif /* $$id */" >>$@.new
 	mv -f $@.new $@
 
--- a/xen/include/public/arch-x86/pmu.h
+++ b/xen/include/public/arch-x86/pmu.h
@@ -105,7 +105,7 @@ struct xen_pmu_arch {
          * Processor's registers at the time of interrupt.
          * WO for hypervisor, RO for guests.
          */
-        struct xen_pmu_regs regs;
+        xen_pmu_regs_t regs;
         /* Padding for adding new registers to xen_pmu_regs in the future */
 #define XENPMU_REGS_PAD_SZ  64
         uint8_t pad[XENPMU_REGS_PAD_SZ];
@@ -132,8 +132,8 @@ struct xen_pmu_arch {
      * hypervisor into hardware during XENPMU_flush
      */
     union {
-        struct xen_pmu_amd_ctxt amd;
-        struct xen_pmu_intel_ctxt intel;
+        xen_pmu_amd_ctxt_t amd;
+        xen_pmu_intel_ctxt_t intel;
 
         /*
          * Padding for contexts (fixed parts only, does not include MSR banks
--- a/xen/include/public/arch-x86/xen-mca.h
+++ b/xen/include/public/arch-x86/xen-mca.h
@@ -112,7 +112,7 @@ struct mcinfo_common {
     uint16_t type;      /* structure type */
     uint16_t size;      /* size of this struct in bytes */
 };
-
+typedef struct mcinfo_common xen_mcinfo_common_t;
 
 #define MC_FLAG_CORRECTABLE     (1 << 0)
 #define MC_FLAG_UNCORRECTABLE   (1 << 1)
@@ -123,7 +123,7 @@ struct mcinfo_common {
 #define MC_FLAG_MCE		(1 << 6)
 /* contains global x86 mc information */
 struct mcinfo_global {
-    struct mcinfo_common common;
+    xen_mcinfo_common_t common;
 
     /* running domain at the time in error (most likely the impacted one) */
     uint16_t mc_domid;
@@ -138,7 +138,7 @@ struct mcinfo_global {
 
 /* contains bank local x86 mc information */
 struct mcinfo_bank {
-    struct mcinfo_common common;
+    xen_mcinfo_common_t common;
 
     uint16_t mc_bank; /* bank nr */
     uint16_t mc_domid; /* Usecase 5: domain referenced by mc_addr on dom0
@@ -156,11 +156,12 @@ struct mcinfo_msr {
     uint64_t reg;   /* MSR */
     uint64_t value; /* MSR value */
 };
+typedef struct mcinfo_msr xen_mcinfo_msr_t;
 
 /* contains mc information from other
  * or additional mc MSRs */
 struct mcinfo_extended {
-    struct mcinfo_common common;
+    xen_mcinfo_common_t common;
 
     /* You can fill up to five registers.
      * If you need more, then use this structure
@@ -172,7 +173,7 @@ struct mcinfo_extended {
      * and E(R)FLAGS, E(R)IP, E(R)MISC, up to 11/19 of them might be
      * useful at present. So expand this array to 32 to leave room.
      */
-    struct mcinfo_msr mc_msr[32];
+    xen_mcinfo_msr_t mc_msr[32];
 };
 
 /* Recovery Action flags. Giving recovery result information to DOM0 */
@@ -208,6 +209,7 @@ struct page_offline_action
     uint64_t mfn;
     uint64_t status;
 };
+typedef struct page_offline_action xen_page_offline_action_t;
 
 struct cpu_offline_action
 {
@@ -216,17 +218,18 @@ struct cpu_offline_action
     uint16_t mc_coreid;
     uint16_t mc_core_threadid;
 };
+typedef struct cpu_offline_action xen_cpu_offline_action_t;
 
 #define MAX_UNION_SIZE 16
 struct mcinfo_recovery
 {
-    struct mcinfo_common common;
+    xen_mcinfo_common_t common;
     uint16_t mc_bank; /* bank nr */
     uint8_t action_flags;
     uint8_t action_types;
     union {
-        struct page_offline_action page_retire;
-        struct cpu_offline_action cpu_offline;
+        xen_page_offline_action_t page_retire;
+        xen_cpu_offline_action_t cpu_offline;
         uint8_t pad[MAX_UNION_SIZE];
     } action_info;
 };
@@ -279,7 +282,7 @@ struct mcinfo_logical_cpu {
     uint32_t mc_cache_size;
     uint32_t mc_cache_alignment;
     int32_t mc_nmsrvals;
-    struct mcinfo_msr mc_msrvalues[__MC_MSR_ARRAYSIZE];
+    xen_mcinfo_msr_t mc_msrvalues[__MC_MSR_ARRAYSIZE];
 };
 typedef struct mcinfo_logical_cpu xen_mc_logical_cpu_t;
 DEFINE_XEN_GUEST_HANDLE(xen_mc_logical_cpu_t);
@@ -399,8 +402,9 @@ struct xen_mc_msrinject {
     domid_t  mcinj_domid;           /* valid only if MC_MSRINJ_F_GPADDR is
                                        present in mcinj_flags */
     uint16_t _pad0;
-    struct mcinfo_msr mcinj_msr[MC_MSRINJ_MAXMSRS];
+    xen_mcinfo_msr_t mcinj_msr[MC_MSRINJ_MAXMSRS];
 };
+typedef struct xen_mc_msrinject xen_mc_msrinject_t;
 
 /* Flags for mcinj_flags above; bits 16-31 are reserved */
 #define MC_MSRINJ_F_INTERPOSE   0x1
@@ -410,6 +414,7 @@ struct xen_mc_msrinject {
 struct xen_mc_mceinject {
     unsigned int mceinj_cpunr;      /* target processor id */
 };
+typedef struct xen_mc_mceinject xen_mc_mceinject_t;
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 #define XEN_MC_inject_v2        6
@@ -422,7 +427,7 @@ struct xen_mc_mceinject {
 
 struct xen_mc_inject_v2 {
     uint32_t flags;
-    struct xenctl_bitmap cpumap;
+    xenctl_bitmap_t cpumap;
 };
 #endif
 
@@ -431,10 +436,10 @@ struct xen_mc {
     uint32_t interface_version; /* XEN_MCA_INTERFACE_VERSION */
     union {
         struct xen_mc_fetch        mc_fetch;
-        struct xen_mc_notifydomain mc_notifydomain;
+        xen_mc_notifydomain_t      mc_notifydomain;
         struct xen_mc_physcpuinfo  mc_physcpuinfo;
-        struct xen_mc_msrinject    mc_msrinject;
-        struct xen_mc_mceinject    mc_mceinject;
+        xen_mc_msrinject_t         mc_msrinject;
+        xen_mc_mceinject_t         mc_mceinject;
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
         struct xen_mc_inject_v2    mc_inject_v2;
 #endif
--- a/xen/include/public/argo.h
+++ b/xen/include/public/argo.h
@@ -67,8 +67,8 @@ typedef struct xen_argo_addr
 
 typedef struct xen_argo_send_addr
 {
-    struct xen_argo_addr src;
-    struct xen_argo_addr dst;
+    xen_argo_addr_t src;
+    xen_argo_addr_t dst;
 } xen_argo_send_addr_t;
 
 typedef struct xen_argo_ring
@@ -121,7 +121,7 @@ typedef struct xen_argo_unregister_ring
 
 typedef struct xen_argo_ring_data_ent
 {
-    struct xen_argo_addr ring;
+    xen_argo_addr_t ring;
     uint16_t flags;
     uint16_t pad;
     uint32_t space_required;
@@ -132,13 +132,13 @@ typedef struct xen_argo_ring_data
 {
     uint32_t nent;
     uint32_t pad;
-    struct xen_argo_ring_data_ent data[XEN_FLEX_ARRAY_DIM];
+    xen_argo_ring_data_ent_t data[XEN_FLEX_ARRAY_DIM];
 } xen_argo_ring_data_t;
 
 struct xen_argo_ring_message_header
 {
     uint32_t len;
-    struct xen_argo_addr source;
+    xen_argo_addr_t source;
     uint32_t message_type;
     uint8_t data[XEN_FLEX_ARRAY_DIM];
 };
--- a/xen/include/public/event_channel.h
+++ b/xen/include/public/event_channel.h
@@ -321,16 +321,16 @@ typedef struct evtchn_set_priority evtch
 struct evtchn_op {
     uint32_t cmd; /* enum event_channel_op */
     union {
-        struct evtchn_alloc_unbound    alloc_unbound;
-        struct evtchn_bind_interdomain bind_interdomain;
-        struct evtchn_bind_virq        bind_virq;
-        struct evtchn_bind_pirq        bind_pirq;
-        struct evtchn_bind_ipi         bind_ipi;
-        struct evtchn_close            close;
-        struct evtchn_send             send;
-        struct evtchn_status           status;
-        struct evtchn_bind_vcpu        bind_vcpu;
-        struct evtchn_unmask           unmask;
+        evtchn_alloc_unbound_t    alloc_unbound;
+        evtchn_bind_interdomain_t bind_interdomain;
+        evtchn_bind_virq_t        bind_virq;
+        evtchn_bind_pirq_t        bind_pirq;
+        evtchn_bind_ipi_t         bind_ipi;
+        evtchn_close_t            close;
+        evtchn_send_t             send;
+        evtchn_status_t           status;
+        evtchn_bind_vcpu_t        bind_vcpu;
+        evtchn_unmask_t           unmask;
     } u;
 };
 typedef struct evtchn_op evtchn_op_t;
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -74,6 +74,7 @@ struct xen_dm_op_create_ioreq_server {
     /* OUT - server id */
     ioservid_t id;
 };
+typedef struct xen_dm_op_create_ioreq_server xen_dm_op_create_ioreq_server_t;
 
 /*
  * XEN_DMOP_get_ioreq_server_info: Get all the information necessary to
@@ -113,6 +114,7 @@ struct xen_dm_op_get_ioreq_server_info {
     /* OUT - buffered ioreq gfn (see block comment above)*/
     uint64_aligned_t bufioreq_gfn;
 };
+typedef struct xen_dm_op_get_ioreq_server_info xen_dm_op_get_ioreq_server_info_t;
 
 /*
  * XEN_DMOP_map_io_range_to_ioreq_server: Register an I/O range for
@@ -148,6 +150,7 @@ struct xen_dm_op_ioreq_server_range {
     /* IN - inclusive start and end of range */
     uint64_aligned_t start, end;
 };
+typedef struct xen_dm_op_ioreq_server_range xen_dm_op_ioreq_server_range_t;
 
 #define XEN_DMOP_PCI_SBDF(s,b,d,f) \
 	((((s) & 0xffff) << 16) |  \
@@ -173,6 +176,7 @@ struct xen_dm_op_set_ioreq_server_state
     uint8_t enabled;
     uint8_t pad;
 };
+typedef struct xen_dm_op_set_ioreq_server_state xen_dm_op_set_ioreq_server_state_t;
 
 /*
  * XEN_DMOP_destroy_ioreq_server: Destroy the IOREQ Server <id>.
@@ -186,6 +190,7 @@ struct xen_dm_op_destroy_ioreq_server {
     ioservid_t id;
     uint16_t pad;
 };
+typedef struct xen_dm_op_destroy_ioreq_server xen_dm_op_destroy_ioreq_server_t;
 
 /*
  * XEN_DMOP_track_dirty_vram: Track modifications to the specified pfn
@@ -203,6 +208,7 @@ struct xen_dm_op_track_dirty_vram {
     /* IN - first pfn to track */
     uint64_aligned_t first_pfn;
 };
+typedef struct xen_dm_op_track_dirty_vram xen_dm_op_track_dirty_vram_t;
 
 /*
  * XEN_DMOP_set_pci_intx_level: Set the logical level of one of a domain's
@@ -217,6 +223,7 @@ struct xen_dm_op_set_pci_intx_level {
     /* IN - Level: 0 -> deasserted, 1 -> asserted */
     uint8_t  level;
 };
+typedef struct xen_dm_op_set_pci_intx_level xen_dm_op_set_pci_intx_level_t;
 
 /*
  * XEN_DMOP_set_isa_irq_level: Set the logical level of a one of a domain's
@@ -230,6 +237,7 @@ struct xen_dm_op_set_isa_irq_level {
     /* IN - Level: 0 -> deasserted, 1 -> asserted */
     uint8_t  level;
 };
+typedef struct xen_dm_op_set_isa_irq_level xen_dm_op_set_isa_irq_level_t;
 
 /*
  * XEN_DMOP_set_pci_link_route: Map a PCI INTx line to an IRQ line.
@@ -242,6 +250,7 @@ struct xen_dm_op_set_pci_link_route {
     /* ISA IRQ (1-15) or 0 -> disable link */
     uint8_t  isa_irq;
 };
+typedef struct xen_dm_op_set_pci_link_route xen_dm_op_set_pci_link_route_t;
 
 /*
  * XEN_DMOP_modified_memory: Notify that a set of pages were modified by
@@ -265,6 +274,7 @@ struct xen_dm_op_modified_memory {
     /* IN/OUT - Must be set to 0 */
     uint32_t opaque;
 };
+typedef struct xen_dm_op_modified_memory xen_dm_op_modified_memory_t;
 
 struct xen_dm_op_modified_memory_extent {
     /* IN - number of contiguous pages modified */
@@ -294,6 +304,7 @@ struct xen_dm_op_set_mem_type {
     /* IN - first pfn in region */
     uint64_aligned_t first_pfn;
 };
+typedef struct xen_dm_op_set_mem_type xen_dm_op_set_mem_type_t;
 
 /*
  * XEN_DMOP_inject_event: Inject an event into a VCPU, which will
@@ -327,6 +338,7 @@ struct xen_dm_op_inject_event {
     /* IN - type-specific extra data (%cr2 for #PF, pending_dbg for #DB) */
     uint64_aligned_t cr2;
 };
+typedef struct xen_dm_op_inject_event xen_dm_op_inject_event_t;
 
 /*
  * XEN_DMOP_inject_msi: Inject an MSI for an emulated device.
@@ -340,6 +352,7 @@ struct xen_dm_op_inject_msi {
     /* IN - MSI address (0xfeexxxxx) */
     uint64_aligned_t addr;
 };
+typedef struct xen_dm_op_inject_msi xen_dm_op_inject_msi_t;
 
 /*
  * XEN_DMOP_map_mem_type_to_ioreq_server : map or unmap the IOREQ Server <id>
@@ -366,6 +379,7 @@ struct xen_dm_op_map_mem_type_to_ioreq_s
     uint64_t opaque;    /* IN/OUT - only used for hypercall continuation,
                            has to be set to zero by the caller */
 };
+typedef struct xen_dm_op_map_mem_type_to_ioreq_server xen_dm_op_map_mem_type_to_ioreq_server_t;
 
 /*
  * XEN_DMOP_remote_shutdown : Declare a shutdown for another domain
@@ -377,6 +391,7 @@ struct xen_dm_op_remote_shutdown {
     uint32_t reason;       /* SHUTDOWN_* => enum sched_shutdown_reason */
                            /* (Other reason values are not blocked) */
 };
+typedef struct xen_dm_op_remote_shutdown xen_dm_op_remote_shutdown_t;
 
 /*
  * XEN_DMOP_relocate_memory : Relocate GFNs for the specified guest.
@@ -395,6 +410,7 @@ struct xen_dm_op_relocate_memory {
     /* Starting GFN where GFNs should be relocated. */
     uint64_aligned_t dst_gfn;
 };
+typedef struct xen_dm_op_relocate_memory xen_dm_op_relocate_memory_t;
 
 /*
  * XEN_DMOP_pin_memory_cacheattr : Pin caching type of RAM space.
@@ -416,30 +432,30 @@ struct xen_dm_op_pin_memory_cacheattr {
     uint32_t type;          /* XEN_DMOP_MEM_CACHEATTR_* */
     uint32_t pad;
 };
+typedef struct xen_dm_op_pin_memory_cacheattr xen_dm_op_pin_memory_cacheattr_t;
 
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
     union {
-        struct xen_dm_op_create_ioreq_server create_ioreq_server;
-        struct xen_dm_op_get_ioreq_server_info get_ioreq_server_info;
-        struct xen_dm_op_ioreq_server_range map_io_range_to_ioreq_server;
-        struct xen_dm_op_ioreq_server_range unmap_io_range_from_ioreq_server;
-        struct xen_dm_op_set_ioreq_server_state set_ioreq_server_state;
-        struct xen_dm_op_destroy_ioreq_server destroy_ioreq_server;
-        struct xen_dm_op_track_dirty_vram track_dirty_vram;
-        struct xen_dm_op_set_pci_intx_level set_pci_intx_level;
-        struct xen_dm_op_set_isa_irq_level set_isa_irq_level;
-        struct xen_dm_op_set_pci_link_route set_pci_link_route;
-        struct xen_dm_op_modified_memory modified_memory;
-        struct xen_dm_op_set_mem_type set_mem_type;
-        struct xen_dm_op_inject_event inject_event;
-        struct xen_dm_op_inject_msi inject_msi;
-        struct xen_dm_op_map_mem_type_to_ioreq_server
-                map_mem_type_to_ioreq_server;
-        struct xen_dm_op_remote_shutdown remote_shutdown;
-        struct xen_dm_op_relocate_memory relocate_memory;
-        struct xen_dm_op_pin_memory_cacheattr pin_memory_cacheattr;
+        xen_dm_op_create_ioreq_server_t create_ioreq_server;
+        xen_dm_op_get_ioreq_server_info_t get_ioreq_server_info;
+        xen_dm_op_ioreq_server_range_t map_io_range_to_ioreq_server;
+        xen_dm_op_ioreq_server_range_t unmap_io_range_from_ioreq_server;
+        xen_dm_op_set_ioreq_server_state_t set_ioreq_server_state;
+        xen_dm_op_destroy_ioreq_server_t destroy_ioreq_server;
+        xen_dm_op_track_dirty_vram_t track_dirty_vram;
+        xen_dm_op_set_pci_intx_level_t set_pci_intx_level;
+        xen_dm_op_set_isa_irq_level_t set_isa_irq_level;
+        xen_dm_op_set_pci_link_route_t set_pci_link_route;
+        xen_dm_op_modified_memory_t modified_memory;
+        xen_dm_op_set_mem_type_t set_mem_type;
+        xen_dm_op_inject_event_t inject_event;
+        xen_dm_op_inject_msi_t inject_msi;
+        xen_dm_op_map_mem_type_to_ioreq_server_t map_mem_type_to_ioreq_server;
+        xen_dm_op_remote_shutdown_t remote_shutdown;
+        xen_dm_op_relocate_memory_t relocate_memory;
+        xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
     } u;
 };
 
--- a/xen/include/public/hvm/hvm_vcpu.h
+++ b/xen/include/public/hvm/hvm_vcpu.h
@@ -69,6 +69,7 @@ struct vcpu_hvm_x86_32 {
 
     uint16_t pad2[3];
 };
+typedef struct vcpu_hvm_x86_32 xen_vcpu_hvm_x86_32_t;
 
 /*
  * The layout of the _ar fields of the segment registers is the
@@ -114,6 +115,7 @@ struct vcpu_hvm_x86_64 {
      * the 32-bit structure should be used instead.
      */
 };
+typedef struct vcpu_hvm_x86_64 xen_vcpu_hvm_x86_64_t;
 
 struct vcpu_hvm_context {
 #define VCPU_HVM_MODE_32B 0  /* 32bit fields of the structure will be used. */
@@ -124,8 +126,8 @@ struct vcpu_hvm_context {
 
     /* CPU registers. */
     union {
-        struct vcpu_hvm_x86_32 x86_32;
-        struct vcpu_hvm_x86_64 x86_64;
+        xen_vcpu_hvm_x86_32_t x86_32;
+        xen_vcpu_hvm_x86_64_t x86_64;
     } cpu_regs;
 };
 typedef struct vcpu_hvm_context vcpu_hvm_context_t;
--- a/xen/include/public/hypfs.h
+++ b/xen/include/public/hypfs.h
@@ -53,9 +53,10 @@ struct xen_hypfs_direntry {
     uint32_t content_len;      /* Current length of data. */
     uint32_t max_write_len;    /* Max. length for writes (0 if read-only). */
 };
+typedef struct xen_hypfs_direntry xen_hypfs_direntry_t;
 
 struct xen_hypfs_dirlistentry {
-    struct xen_hypfs_direntry e;
+    xen_hypfs_direntry_t e;
     /* Offset in bytes to next entry (0 == this is the last entry). */
     uint16_t off_next;
     /* Zero terminated entry name, possibly with some padding for alignment. */
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -604,7 +604,7 @@ struct xen_reserved_device_memory_map {
     XEN_GUEST_HANDLE(xen_reserved_device_memory_t) buffer;
     /* IN */
     union {
-        struct physdev_pci_device pci;
+        physdev_pci_device_t pci;
     } dev;
 };
 typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -229,11 +229,11 @@ DEFINE_XEN_GUEST_HANDLE(physdev_manage_p
 struct physdev_op {
     uint32_t cmd;
     union {
-        struct physdev_irq_status_query      irq_status_query;
-        struct physdev_set_iopl              set_iopl;
-        struct physdev_set_iobitmap          set_iobitmap;
-        struct physdev_apic                  apic_op;
-        struct physdev_irq                   irq_op;
+        physdev_irq_status_query_t irq_status_query;
+        physdev_set_iopl_t         set_iopl;
+        physdev_set_iobitmap_t     set_iobitmap;
+        physdev_apic_t             apic_op;
+        physdev_irq_t              irq_op;
     } u;
 };
 typedef struct physdev_op physdev_op_t;
@@ -334,7 +334,7 @@ struct physdev_dbgp_op {
     uint8_t op;
     uint8_t bus;
     union {
-        struct physdev_pci_device pci;
+        physdev_pci_device_t pci;
     } u;
 };
 typedef struct physdev_dbgp_op physdev_dbgp_op_t;
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -42,6 +42,7 @@ struct xenpf_settime32 {
     uint32_t nsecs;
     uint64_t system_time;
 };
+typedef struct xenpf_settime32 xenpf_settime32_t;
 #define XENPF_settime64           62
 struct xenpf_settime64 {
     /* IN variables. */
@@ -50,6 +51,7 @@ struct xenpf_settime64 {
     uint32_t mbz;
     uint64_t system_time;
 };
+typedef struct xenpf_settime64 xenpf_settime64_t;
 #if __XEN_INTERFACE_VERSION__ < 0x00040600
 #define XENPF_settime XENPF_settime32
 #define xenpf_settime xenpf_settime32
@@ -529,6 +531,7 @@ struct xenpf_cpu_hotadd
 	uint32_t acpi_id;
 	uint32_t pxm;
 };
+typedef struct xenpf_cpu_hotadd xenpf_cpu_hotadd_t;
 
 #define XENPF_mem_hotadd    59
 struct xenpf_mem_hotadd
@@ -538,6 +541,7 @@ struct xenpf_mem_hotadd
     uint32_t pxm;
     uint32_t flags;
 };
+typedef struct xenpf_mem_hotadd xenpf_mem_hotadd_t;
 
 #define XENPF_core_parking  60
 
@@ -622,29 +626,29 @@ struct xen_platform_op {
     uint32_t cmd;
     uint32_t interface_version; /* XENPF_INTERFACE_VERSION */
     union {
-        struct xenpf_settime           settime;
-        struct xenpf_settime32         settime32;
-        struct xenpf_settime64         settime64;
-        struct xenpf_add_memtype       add_memtype;
-        struct xenpf_del_memtype       del_memtype;
-        struct xenpf_read_memtype      read_memtype;
-        struct xenpf_microcode_update  microcode;
-        struct xenpf_platform_quirk    platform_quirk;
-        struct xenpf_efi_runtime_call  efi_runtime_call;
-        struct xenpf_firmware_info     firmware_info;
-        struct xenpf_enter_acpi_sleep  enter_acpi_sleep;
-        struct xenpf_change_freq       change_freq;
-        struct xenpf_getidletime       getidletime;
-        struct xenpf_set_processor_pminfo set_pminfo;
-        struct xenpf_pcpuinfo          pcpu_info;
-        struct xenpf_pcpu_version      pcpu_version;
-        struct xenpf_cpu_ol            cpu_ol;
-        struct xenpf_cpu_hotadd        cpu_add;
-        struct xenpf_mem_hotadd        mem_add;
-        struct xenpf_core_parking      core_parking;
-        struct xenpf_resource_op       resource_op;
-        struct xenpf_symdata           symdata;
-        uint8_t                        pad[128];
+        xenpf_settime_t               settime;
+        xenpf_settime32_t             settime32;
+        xenpf_settime64_t             settime64;
+        xenpf_add_memtype_t           add_memtype;
+        xenpf_del_memtype_t           del_memtype;
+        xenpf_read_memtype_t          read_memtype;
+        xenpf_microcode_update_t      microcode;
+        xenpf_platform_quirk_t        platform_quirk;
+        xenpf_efi_runtime_call_t      efi_runtime_call;
+        xenpf_firmware_info_t         firmware_info;
+        xenpf_enter_acpi_sleep_t      enter_acpi_sleep;
+        xenpf_change_freq_t           change_freq;
+        xenpf_getidletime_t           getidletime;
+        xenpf_set_processor_pminfo_t  set_pminfo;
+        xenpf_pcpuinfo_t              pcpu_info;
+        xenpf_pcpu_version_t          pcpu_version;
+        xenpf_cpu_ol_t                cpu_ol;
+        xenpf_cpu_hotadd_t            cpu_add;
+        xenpf_mem_hotadd_t            mem_add;
+        xenpf_core_parking_t          core_parking;
+        xenpf_resource_op_t           resource_op;
+        xenpf_symdata_t               symdata;
+        uint8_t                       pad[128];
     } u;
 };
 typedef struct xen_platform_op xen_platform_op_t;
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -127,7 +127,7 @@ struct xen_pmu_data {
     uint8_t pad[6];
 
     /* Architecture-specific information */
-    struct xen_pmu_arch pmu;
+    xen_pmu_arch_t pmu;
 };
 
 #endif /* __XEN_PUBLIC_PMU_H__ */
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -726,7 +726,7 @@ struct vcpu_info {
 #endif /* XEN_HAVE_PV_UPCALL_MASK */
     xen_ulong_t evtchn_pending_sel;
     struct arch_vcpu_info arch;
-    struct vcpu_time_info time;
+    vcpu_time_info_t time;
 }; /* 64 bytes (x86) */
 #ifndef __XEN__
 typedef struct vcpu_info vcpu_info_t;
@@ -1031,6 +1031,7 @@ struct xenctl_bitmap {
     XEN_GUEST_HANDLE_64(uint8) bitmap;
     uint32_t nr_bits;
 };
+typedef struct xenctl_bitmap xenctl_bitmap_t;
 #endif
 
 #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
--- a/xen/include/public/xsm/flask_op.h
+++ b/xen/include/public/xsm/flask_op.h
@@ -33,10 +33,12 @@ struct xen_flask_load {
     XEN_GUEST_HANDLE(char) buffer;
     uint32_t size;
 };
+typedef struct xen_flask_load xen_flask_load_t;
 
 struct xen_flask_setenforce {
     uint32_t enforcing;
 };
+typedef struct xen_flask_setenforce xen_flask_setenforce_t;
 
 struct xen_flask_sid_context {
     /* IN/OUT: sid to convert to/from string */
@@ -47,6 +49,7 @@ struct xen_flask_sid_context {
     uint32_t size;
     XEN_GUEST_HANDLE(char) context;
 };
+typedef struct xen_flask_sid_context xen_flask_sid_context_t;
 
 struct xen_flask_access {
     /* IN: access request */
@@ -60,6 +63,7 @@ struct xen_flask_access {
     uint32_t audit_deny;
     uint32_t seqno;
 };
+typedef struct xen_flask_access xen_flask_access_t;
 
 struct xen_flask_transition {
     /* IN: transition SIDs and class */
@@ -69,6 +73,7 @@ struct xen_flask_transition {
     /* OUT: new SID */
     uint32_t newsid;
 };
+typedef struct xen_flask_transition xen_flask_transition_t;
 
 #if __XEN_INTERFACE_VERSION__ < 0x00040800
 struct xen_flask_userlist {
@@ -106,11 +111,13 @@ struct xen_flask_boolean {
      */
     XEN_GUEST_HANDLE(char) name;
 };
+typedef struct xen_flask_boolean xen_flask_boolean_t;
 
 struct xen_flask_setavc_threshold {
     /* IN */
     uint32_t threshold;
 };
+typedef struct xen_flask_setavc_threshold xen_flask_setavc_threshold_t;
 
 struct xen_flask_hash_stats {
     /* OUT */
@@ -119,6 +126,7 @@ struct xen_flask_hash_stats {
     uint32_t buckets_total;
     uint32_t max_chain_len;
 };
+typedef struct xen_flask_hash_stats xen_flask_hash_stats_t;
 
 struct xen_flask_cache_stats {
     /* IN */
@@ -131,6 +139,7 @@ struct xen_flask_cache_stats {
     uint32_t reclaims;
     uint32_t frees;
 };
+typedef struct xen_flask_cache_stats xen_flask_cache_stats_t;
 
 struct xen_flask_ocontext {
     /* IN */
@@ -138,6 +147,7 @@ struct xen_flask_ocontext {
     uint32_t sid;
     uint64_t low, high;
 };
+typedef struct xen_flask_ocontext xen_flask_ocontext_t;
 
 struct xen_flask_peersid {
     /* IN */
@@ -145,12 +155,14 @@ struct xen_flask_peersid {
     /* OUT */
     uint32_t sid;
 };
+typedef struct xen_flask_peersid xen_flask_peersid_t;
 
 struct xen_flask_relabel {
     /* IN */
     uint32_t domid;
     uint32_t sid;
 };
+typedef struct xen_flask_relabel xen_flask_relabel_t;
 
 struct xen_flask_devicetree_label {
     /* IN */
@@ -158,6 +170,7 @@ struct xen_flask_devicetree_label {
     uint32_t length;
     XEN_GUEST_HANDLE(char) path;
 };
+typedef struct xen_flask_devicetree_label xen_flask_devicetree_label_t;
 
 struct xen_flask_op {
     uint32_t cmd;
@@ -188,26 +201,26 @@ struct xen_flask_op {
 #define FLASK_DEVICETREE_LABEL  25
     uint32_t interface_version; /* XEN_FLASK_INTERFACE_VERSION */
     union {
-        struct xen_flask_load load;
-        struct xen_flask_setenforce enforce;
+        xen_flask_load_t load;
+        xen_flask_setenforce_t enforce;
         /* FLASK_CONTEXT_TO_SID and FLASK_SID_TO_CONTEXT */
-        struct xen_flask_sid_context sid_context;
-        struct xen_flask_access access;
+        xen_flask_sid_context_t sid_context;
+        xen_flask_access_t access;
         /* FLASK_CREATE, FLASK_RELABEL, FLASK_MEMBER */
-        struct xen_flask_transition transition;
+        xen_flask_transition_t transition;
 #if __XEN_INTERFACE_VERSION__ < 0x00040800
         struct xen_flask_userlist userlist;
 #endif
         /* FLASK_GETBOOL, FLASK_SETBOOL */
-        struct xen_flask_boolean boolean;
-        struct xen_flask_setavc_threshold setavc_threshold;
-        struct xen_flask_hash_stats hash_stats;
-        struct xen_flask_cache_stats cache_stats;
+        xen_flask_boolean_t boolean;
+        xen_flask_setavc_threshold_t setavc_threshold;
+        xen_flask_hash_stats_t hash_stats;
+        xen_flask_cache_stats_t cache_stats;
         /* FLASK_ADD_OCONTEXT, FLASK_DEL_OCONTEXT */
-        struct xen_flask_ocontext ocontext;
-        struct xen_flask_peersid peersid;
-        struct xen_flask_relabel relabel;
-        struct xen_flask_devicetree_label devicetree_label;
+        xen_flask_ocontext_t ocontext;
+        xen_flask_peersid_t peersid;
+        xen_flask_relabel_t relabel;
+        xen_flask_devicetree_label_t devicetree_label;
     } u;
 };
 typedef struct xen_flask_op xen_flask_op_t;
--- a/xen/tools/compat-build-header.py
+++ b/xen/tools/compat-build-header.py
@@ -3,7 +3,7 @@
 import re,sys
 
 pats = [
- [ r"__InClUdE__(.*)", r"#include\1\n#pragma pack(4)" ],
+ [ r"__InClUdE__(.*)", r"#include\1" ],
  [ r"__IfDeF__ (XEN_HAVE.*)", r"#ifdef \1" ],
  [ r"__ElSe__", r"#else" ],
  [ r"__EnDif__", r"#endif" ],
@@ -11,9 +11,11 @@ pats = [
  [ r"__UnDeF__", r"#undef" ],
  [ r"\"xen-compat.h\"", r"<public/xen-compat.h>" ],
  [ r"(struct|union|enum)\s+(xen_?)?(\w)", r"\1 compat_\3" ],
- [ r"@KeeP@", r"" ],
+ [ r"typedef(.*)@KeeP@(xen_?)?([\w]+)([^\w])",
+   r"typedef\1\2\3 __attribute__((__aligned__(__alignof(\1compat_\3))))\4" ],
  [ r"_t([^\w]|$)", r"_compat_t\1" ],
- [ r"(8|16|32|64)_compat_t([^\w]|$)", r"\1_t\2" ],
+ [ r"int(8|16|32|64_aligned)_compat_t([^\w]|$)", r"int\1_t\2" ],
+ [ r"(\su?int64(_compat)?)_T([^\w]|$)", r"\1_t\3" ],
  [ r"(^|[^\w])xen_?(\w*)_compat_t([^\w]|$$)", r"\1compat_\2_t\3" ],
  [ r"(^|[^\w])XEN_?", r"\1COMPAT_" ],
  [ r"(^|[^\w])Xen_?", r"\1Compat_" ],
--- a/xen/tools/compat-build-source.py
+++ b/xen/tools/compat-build-source.py
@@ -9,6 +9,7 @@ pats = [
  [ r"^\s*#\s*endif /\* (XEN_HAVE.*) \*/\s+", r"__EnDif__" ],
  [ r"^\s*#\s*define\s+([A-Z_]*_GUEST_HANDLE)", r"#define HIDE_\1" ],
  [ r"^\s*#\s*define\s+([a-z_]*_guest_handle)", r"#define hide_\1" ],
+ [ r"^\s*#\s*define\s+(u?int64)_aligned_t\s.*aligned.*", r"typedef \1_T __attribute__((aligned(4))) \1_compat_T;" ],
  [ r"XEN_GUEST_HANDLE(_[0-9A-Fa-f]+)?", r"COMPAT_HANDLE" ],
 ];
 
--- a/xen/tools/get-fields.sh
+++ b/xen/tools/get-fields.sh
@@ -418,6 +418,21 @@ check_field ()
 			"}")
 				level=$(expr $level - 1) id=
 				;;
+			compat_*_t)
+				if [ $level = 2 ]
+				then
+					fields=" "
+					token="${token%_t}"
+					token="${token#compat_}"
+				fi
+				;;
+			evtchn_*_compat_t)
+				if [ $level = 2 -a $token != evtchn_port_compat_t ]
+				then
+					fields=" "
+					token="${token%_compat_t}"
+				fi
+				;;
 			[a-zA-Z]*)
 				id=$token
 				;;
@@ -464,6 +479,14 @@ build_check ()
 		"]")
 			arrlvl=$(expr $arrlvl - 1)
 			;;
+		compat_*_t)
+			if [ $level = 2 -a $token != compat_argo_port_t ]
+			then
+				fields=" "
+				token="${token%_t}"
+				token="${token#compat_}"
+			fi
+			;;
 		[a-zA-Z_]*)
 			test $level != 2 -o $arrlvl != 1 || id=$token
 			;;


