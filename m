Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CBC52CF0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 15:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159989.1488233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCCM-0007CA-PX; Wed, 12 Nov 2025 14:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159989.1488233; Wed, 12 Nov 2025 14:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCCM-00079f-Ly; Wed, 12 Nov 2025 14:51:50 +0000
Received: by outflank-mailman (input) for mailman id 1159989;
 Wed, 12 Nov 2025 14:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wyU1=5U=bounce.vates.tech=bounce-md_30504962.69149f01.v1-52d6befa532c45509e8e4ebbc4f991d1@srs-se1.protection.inumbo.net>)
 id 1vJCCK-000787-Qo
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 14:51:48 +0000
Received: from mail179-26.suw41.mandrillapp.com
 (mail179-26.suw41.mandrillapp.com [198.2.179.26])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4f7140-bfd7-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 15:51:47 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-26.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4d65vj35BWzKsbYwq
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 14:51:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 52d6befa532c45509e8e4ebbc4f991d1; Wed, 12 Nov 2025 14:51:45 +0000
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
X-Inumbo-ID: 1c4f7140-bfd7-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762959105; x=1763229105;
	bh=IuOrOxBNA8cMhpMdlUPw8GDI0O10TQFvQKvWOyS1SPc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=DFOEYkAh9ebmUVJ9eN0DjxpnxfsRRVOlT/FCgmV+NqIm8e5iwGgSGgOgIEeYAyfMg
	 Q29kepInuYfrduAA1CHjexzUTNA2tNHses6Wfp/j193VbDm3LgRXLpF+iTzCcbl7Kk
	 Ae0Zo9gHO1NWWZCtv6x1iUM021qkBi9gnoLMvwpf1HY0BcbwR7bQCXzLrk6RLXDS1K
	 IPPMiqpI82dhI997Hr4BjYt92h4BbYUVuTm2hnVtba6bHH6muzxDIl434KEeDyE/80
	 EloVSX2X1E6830WrcjPKxM+DKBNLHcYxOkAOGn5BaBmyeoXV1IWMFYJ6Xw8eEYZJYI
	 /URQsOeBse6ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762959105; x=1763219605; i=teddy.astie@vates.tech;
	bh=IuOrOxBNA8cMhpMdlUPw8GDI0O10TQFvQKvWOyS1SPc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=OEQ1vAPj5iNee8+/+Br36Vwy6Kg/8lck2j+aHURrG2pkgCA1w3c1kB5W9lsNgRROW
	 ArI7R0t5jyKF8WERYiy7rT6Qipcxfp1ugIwbEkpwmj+zoEzmlR/Dax7ldY5R20bGGp
	 CZUrMrRTdAJM5VjgwzviSV1Iu5zRWHOFe21Rfl1xCT+dMwPKoDxuLq4/bhHTDnG5Ih
	 umLB+eyaxEaaoLQ/CDBEpjCRSJ6cvehJuLmA9xY+GRFx47qgxgZsxl9r61VJwMJe06
	 Vz/eunXzEfHMW7yx8OeiPP+NoA6AU+KpEykoxgYYquHggtCdXMAP8f6eeJA5KGZOwW
	 3rgI/KBl3dx/Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2]=20x86/hvm:=20Allow=20pre-enabling=20x2apic=20mode=20on=20BSP?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762959104208
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>
Message-Id: <0cb4d1f91212a65baf924ed0ef825d8adb4b5423.1762958551.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.52d6befa532c45509e8e4ebbc4f991d1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 14:51:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce a new option to start the BSP vCPU in x2APIC mode instead
of xAPIC mode. Expose this in xl through a new "x2apic_mode" option.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Grygorii Strashko <grygorii_strashko@epam.com>

Later on, we could consider with this option to use x2APIC ACPI
tables instead of xAPIC ones.

There is also some room into introducing a new Kconfig option to
only support x2apic mode, which would change how the "Xen default"
would behave.

changed in v2:
 - only pre-enable instead of forcing
 - use domain builder to pre-enable instead of introducing a new domain creation flag

v1:
- https://lore.kernel.org/xen-devel/d498a50f6187b362ac5da3c6a7a7c348f35dc4b3.1761761288.git.teddy.astie@vates.tech/
---
 docs/man/xl.cfg.5.pod.in         | 16 ++++++++++++
 tools/include/libxl.h            |  8 ++++++
 tools/include/xenguest.h         |  4 +++
 tools/libs/guest/xg_dom_x86.c    | 42 ++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_types.idl |  1 +
 tools/libs/light/libxl_x86.c     |  4 +++
 tools/xl/xl_parse.c              | 11 +++++++++
 7 files changed, 86 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ad1553c5e9..0f7a89fe92 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3198,6 +3198,22 @@ option.
 
 If using this option is necessary to fix an issue, please report a bug.
 
+=item B<x2apic_mode="MODE">
+
+Sets the x2apic mode of the domain. The valid values are as follows:
+
+=over 4
+
+=item B<"default">
+
+Use default Xen LAPIC behavior.
+
+=item B<"pre_enable">
+
+Initially enable x2apic for the BSP of the domain.
+
+=back
+
 =back
 
 =head1 SEE ALSO
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bc35e412da..9850e8aa41 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1537,6 +1537,14 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  */
 #define LIBXL_HAVE_XEN_PLATFORM_PCI_BAR_UC
 
+/*
+ * LIBXL_HAVE_X2APIC_PREENABLE
+ *
+ * libxl_domain_build_info contains a boolean 'arch_x86.x2apic_preenable' field
+ * to initially set the BSP LAPIC in x2APIC mode.
+ */
+#define LIBXL_HAVE_X2APIC_PREENABLE
+
 typedef char **libxl_string_list;
 void libxl_string_list_dispose(libxl_string_list *sl);
 int libxl_string_list_length(const libxl_string_list *sl);
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index c88958faa9..408a0c77e8 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -223,6 +223,10 @@ struct xc_dom_image {
     /* If unset disables the setup of the IOREQ pages. */
     bool device_model;
 
+#if defined(__i386__) || defined(__x86_64__)
+    bool preenable_x2apic; /* 1 makes x2APIC enabled initially, 0 keeps default Xen behavior */
+#endif
+
     /* BIOS/Firmware passed to HVMLOADER */
     struct xc_hvm_firmware_module system_firmware_module;
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index a82b481a12..43ada5a6ac 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -58,6 +58,9 @@
 #define MTRR_TYPE_WRBACK     6
 #define MTRR_DEF_TYPE_ENABLE (1u << 11)
 
+#define APIC_BASE_EXTD   (1UL << 10)
+#define APIC_BASE_ENABLE (1UL << 11)
+
 #define SPECIALPAGE_PAGING   0
 #define SPECIALPAGE_ACCESS   1
 #define SPECIALPAGE_SHARING  2
@@ -1131,6 +1134,45 @@ static int vcpu_hvm(struct xc_dom_image *dom)
         }
     }
 
+    if ( dom->preenable_x2apic )
+    {
+        struct {
+            struct hvm_save_descriptor header_d;
+            HVM_SAVE_TYPE(HEADER) header;
+            struct hvm_save_descriptor lapic_d;
+            HVM_SAVE_TYPE(LAPIC) lapic;
+            struct hvm_save_descriptor end_d;
+            HVM_SAVE_TYPE(END) end;
+        } lapic = {
+            .header_d = bsp_ctx.header_d,
+            .header = bsp_ctx.header,
+            .lapic_d.typecode = HVM_SAVE_CODE(LAPIC),
+            .lapic_d.length = HVM_SAVE_LENGTH(LAPIC),
+            .end_d = bsp_ctx.end_d,
+            .end = bsp_ctx.end,
+        };
+        const HVM_SAVE_TYPE(LAPIC) *lapic_record =
+            hvm_get_save_record(full_ctx, HVM_SAVE_CODE(LAPIC), 0);
+
+        if ( !lapic_record )
+        {
+            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                         "%s: unable to get LAPIC save record", __func__);
+            goto out;
+        }
+
+        memcpy(&lapic.lapic, lapic_record, sizeof(lapic.lapic));
+
+        lapic.lapic.apic_base_msr |= APIC_BASE_ENABLE | APIC_BASE_EXTD;
+
+        rc = xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
+                                      (uint8_t *)&lapic, sizeof(lapic));
+
+        if ( rc != 0 )
+            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                         "%s: SETHVMCONTEXT failed (rc=%d)", __func__, rc);
+    }
+
     /*
      * Loading the BSP context should be done in the last call to setcontext,
      * since each setcontext call will put all vCPUs down.
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d64a573ff3..9fdf89d88b 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -738,6 +738,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("arm_sci", libxl_arm_sci),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
+                               ("x2apic_preenable", libxl_defbool)
                               ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 60d4e8661c..f9725f069a 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -555,6 +555,9 @@ int libxl__arch_domain_init_hw_description(libxl__gc *gc,
                                            libxl__domain_build_state *state,
                                            struct xc_dom_image *dom)
 {
+    if (libxl_defbool_val(d_config->b_info.arch_x86.x2apic_preenable))
+        dom->preenable_x2apic = true;
+
     return 0;
 }
 
@@ -818,6 +821,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
+    libxl_defbool_setdefault(&b_info->arch_x86.x2apic_preenable, false);
     libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index af86d3186d..92bf9d2ad5 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3040,6 +3040,17 @@ skip_usbdev:
                     "WARNING: msr_relaxed will be removed in future versions.\n"
                     "If it fixes an issue you are having please report to "
                     "xen-devel@lists.xenproject.org.\n");
+    
+    if (!xlu_cfg_get_string(config, "x2apic_mode", &buf, 1)) {
+        if (!strcmp(buf, "pre_enable"))
+            libxl_defbool_set(&b_info->arch_x86.x2apic_preenable, true);
+        else if (!strcmp(buf, "default"))
+            libxl_defbool_set(&b_info->arch_x86.x2apic_preenable, false);
+        else {
+            fprintf(stderr, "Unknown x2apic mode \"%s\" specified\n", buf);
+            exit(EXIT_FAILURE);
+        }
+    }
 
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
 
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


