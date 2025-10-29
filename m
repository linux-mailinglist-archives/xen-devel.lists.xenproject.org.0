Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC72C1CC64
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 19:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153034.1483518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEAsF-0007Qy-Jv; Wed, 29 Oct 2025 18:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153034.1483518; Wed, 29 Oct 2025 18:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEAsF-0007PX-H1; Wed, 29 Oct 2025 18:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1153034;
 Wed, 29 Oct 2025 18:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywoN=5G=bounce.vates.tech=bounce-md_30504962.69025c46.v1-510f584304124b7393eac5cdb0128675@srs-se1.protection.inumbo.net>)
 id 1vEAsE-0007PR-7Y
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 18:26:18 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c14970b6-b4f4-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 19:26:16 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cxbKf73GCzBsTqQy
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 18:26:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 510f584304124b7393eac5cdb0128675; Wed, 29 Oct 2025 18:26:14 +0000
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
X-Inumbo-ID: c14970b6-b4f4-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761762375; x=1762032375;
	bh=WpDqBthvvl3YOGRu3RUXgXEvZ5xr6zveGAb+G8h+7bo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=iLNRNhsYxK/Ohg1KJhnCxHf9s5mGYpugtaCRE/DlSevqFmLwFnO39FBf9NcRPRc7W
	 qA+lngi6vTx0B/pK6v0oSb0Y7ZBCd9jsQB1AcJ4DE5AsAL7+VX8+uOAPEl0fs+3VhP
	 f1BtXHw4kZXxP2iIVgknrdxQtck9yFYvOC11Lg86qsn7wzKLuR+yfZ+5WXAm+1c+2g
	 cgwgjuRom0ZHvYK/ZWRuZf7u5K4emXiLpU1QAHxk5uGaOvnlqA2W5aeV3nqKQEXVs7
	 1Sdt5ZnYWjVzxdbxhWHkRtZxTygzN7hwi6JgR0o1b5u3d6WLX1zJo2lIyqgy23WD28
	 Fri0QgXnTq8vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761762375; x=1762022875; i=teddy.astie@vates.tech;
	bh=WpDqBthvvl3YOGRu3RUXgXEvZ5xr6zveGAb+G8h+7bo=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZZ1+9oOHMvfhQV6bHKo5bLMcx60U42Yt+9bpaGYFrHNomvf6PM+pgXrL/5FXpTf55
	 8ZVKXm0OLaTxwt1faMxZjibO4qgrXWcDnvTbQNP58/meLnry2k/qk/G0nBqnKxTHMY
	 US47DtsxztHHzzYE6UO/+5PRg6f1vZ6cIm/MP6gjAw93AQIPvCI+swqBnuGdnEcbRo
	 orpqXzvFiI91tOpaQiUJbeiMbR5oE4BKmDCJq9TapVba0CCcGU1Eadhj6wnwSgYlEn
	 u3mGd1GdTyfRSEL5gJZAgQy6QN4njYIqM/VgD94G1ztijVQoYXX2TGbjbgjVkhE3UM
	 ssdpE95EklhWw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22]=20x86/hvm:=20Introduce=20force=5Fx2apic=20flag?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761762373646
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.510f584304124b7393eac5cdb0128675?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251029:md
Date: Wed, 29 Oct 2025 18:26:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce a new flag to force the x2APIC enabled and preventing a
guest from switching back LAPIC to xAPIC mode.

The semantics of this mode are based IA32_XAPIC_DISABLE_STATUS
architectural MSR of Intel specification.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This feature can be useful for various reasons, starting with SEV as
it is complicated (especially with SEV-ES) to handle MMIO, and legacy
xAPIC is one thing that needs MMIO intercepts (and Linux uses it during
boot unless x2APIC is initially enabled, even if it switches to
x2apic afterward). It could also be interesting to reduce the attack
surface of the hypervisor (by only exposing x2apic to the guest).

As it can allow to have MMIO-less guest (using PVH), perhaps it can
be enough for avoiding the problematic cases of virtualized INVLPGB
(when we have it).

In my testing, Linux, FreeBSD and PV-shim works fine with it; OVMF
freezes for some reason, NetBSD doesn't support it (no x2apic support
as Xen guest). HVM BIOS gets stuck at SeaBIOS as it expects booting
with xAPIC.

On Intel platforms, it would be better to expose the
IA32_XAPIC_DISABLE_STATUS architectural MSR to advertise this to
guest, but it's non-trivial as it needs to be properly exposed
through IA32_ARCH_CAPABILITIES which is currently passed-through.

 docs/man/xl.cfg.5.pod.in              |  7 +++++++
 tools/libs/light/libxl_types.idl      |  1 +
 tools/libs/light/libxl_x86.c          |  4 ++++
 tools/xl/xl_parse.c                   |  1 +
 xen/arch/x86/domain.c                 |  2 +-
 xen/arch/x86/hvm/hvm.c                |  2 ++
 xen/arch/x86/hvm/vlapic.c             | 23 ++++++++++++++++++++++-
 xen/arch/x86/include/asm/domain.h     |  2 ++
 xen/arch/x86/include/asm/hvm/domain.h |  3 +++
 xen/include/public/arch-x86/xen.h     | 12 +++++++++++-
 10 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ad1553c5e9..01b41d93c0 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3198,6 +3198,13 @@ option.
 
 If using this option is necessary to fix an issue, please report a bug.
 
+=item B<force_x2apic=BOOLEAN>
+
+Force the LAPIC in x2APIC mode and prevent the guest from disabling
+it or switching to xAPIC mode.
+
+This option is disabled by default.
+
 =back
 
 =head1 SEE ALSO
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d64a573ff3..b95278007e 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -738,6 +738,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("arm_sci", libxl_arm_sci),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("force_x2apic", libxl_defbool)
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 60d4e8661c..2e0205d2a2 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -26,6 +26,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
 
+    if (libxl_defbool_val(d_config->b_info.arch_x86.force_x2apic))
+        config->arch.misc_flags |= XEN_X86_FORCE_X2APIC;
+
     if (libxl_defbool_val(d_config->b_info.trap_unmapped_accesses)) {
             LOG(ERROR, "trap_unmapped_accesses is not supported on x86\n");
             return ERROR_FAIL;
@@ -818,6 +821,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
+    libxl_defbool_setdefault(&b_info->arch_x86.force_x2apic, false);
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index af86d3186d..d84ab7c823 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3041,6 +3041,7 @@ skip_usbdev:
                     "If it fixes an issue you are having please report to "
                     "xen-devel@lists.xenproject.org.\n");
 
+    xlu_cfg_get_defbool(config, "force_x2apic", &b_info->arch_x86.force_x2apic, 0);
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
 
     xlu_cfg_destroy(config);
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88..02f650a614 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -704,7 +704,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED | XEN_X86_FORCE_X2APIC) )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0c60faa39d..73cbac0f22 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -616,6 +616,8 @@ int hvm_domain_initialise(struct domain *d,
     INIT_LIST_HEAD(&d->arch.hvm.mmcfg_regions);
     INIT_LIST_HEAD(&d->arch.hvm.msix_tables);
 
+    d->arch.hvm.force_x2apic = config->arch.misc_flags & XEN_X86_FORCE_X2APIC;
+
     rc = create_perdomain_mapping(d, PERDOMAIN_VIRT_START, 0, NULL, NULL);
     if ( rc )
         goto fail;
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 993e972cd7..ae8df70d2e 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1116,6 +1116,20 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
     if ( !has_vlapic(v->domain) )
         return X86EMUL_EXCEPTION;
 
+    if ( has_force_x2apic(v->domain) )
+    {
+        /*
+        * We implement the same semantics as MSR_IA32_XAPIC_DISABLE_STATUS:
+        * LEGACY_XAPIC_DISABLED which rejects any attempt at clearing
+        * IA32_APIC_BASE.EXTD, thus forcing the LAPIC in x2APIC mode.
+        */
+        if ( !(val & APIC_BASE_EXTD) )
+        {
+            gprintk(XENLOG_WARNING, "tried to disable x2APIC while forced on\n");
+            return X86EMUL_EXCEPTION;
+        }
+    }
+
     /* Attempting to set reserved bits? */
     if ( val & ~(APIC_BASE_ADDR_MASK | APIC_BASE_ENABLE | APIC_BASE_BSP |
                  (cp->basic.x2apic ? APIC_BASE_EXTD : 0)) )
@@ -1474,7 +1488,14 @@ void vlapic_reset(struct vlapic *vlapic)
     if ( v->vcpu_id == 0 )
         vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
 
-    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+    if ( has_force_x2apic(v->domain) )
+    {
+        vlapic->hw.apic_base_msr |= APIC_BASE_EXTD;
+        set_x2apic_id(vlapic);
+    }
+    else
+        vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
+
     vlapic_do_init(vlapic);
 }
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5df8c78253..771992d156 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -509,6 +509,8 @@ struct arch_domain
 #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
 #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
 
+#define has_force_x2apic(d) ((d)->arch.hvm.force_x2apic)
+
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
 #define pv_gdt_ptes(v) \
diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
index 333501d5f2..b56fa08b73 100644
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -108,6 +108,9 @@ struct hvm_domain {
     /* Compatibility setting for a bug in x2APIC LDR */
     bool bug_x2apic_ldr_vcpu_id;
 
+    /* LAPIC is forced in x2APIC mode */
+    bool force_x2apic;
+
     /* hypervisor intercepted msix table */
     struct list_head       msixtbl_list;
 
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index b99a691706..75aa31d9ed 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -309,11 +309,21 @@ struct xen_arch_domainconfig {
  * doesn't allow the guest to read or write to the underlying MSR.
  */
 #define XEN_X86_MSR_RELAXED (1u << 0)
+
+/*
+ * This option forces the LAPIC to be in X2APIC mode (IA32_APIC_BASE.EXTD = 1)
+ * using the same semantics as IA32_XAPIC_DISABLE_STATUS:LEGACY_XAPIC_DISABLED
+ *
+ * Attempts by the guest to clear IA32_APIC_BASE.EXTD (e.g disable X2APIC) will
+ * inject #GP in the guest.
+ */
+#define XEN_X86_FORCE_X2APIC (1U << 1)
+
     uint32_t misc_flags;
 };
 
 /* Max  XEN_X86_* constant. Used for ABI checking. */
-#define XEN_X86_MISC_FLAGS_MAX XEN_X86_MSR_RELAXED
+#define XEN_X86_MISC_FLAGS_MAX XEN_X86_FORCE_X2APIC
 
 #endif
 
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


