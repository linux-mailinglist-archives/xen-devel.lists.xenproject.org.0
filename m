Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B849FAA8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262001.454021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKE-0004wO-KF; Fri, 28 Jan 2022 13:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262001.454021; Fri, 28 Jan 2022 13:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKE-0004nH-8a; Fri, 28 Jan 2022 13:30:02 +0000
Received: by outflank-mailman (input) for mailman id 262001;
 Fri, 28 Jan 2022 13:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRKC-0003aP-Ie
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:30:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6283387f-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:29:59 +0100 (CET)
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
X-Inumbo-ID: 6283387f-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V5QZW2Bs84NfBUe+2j/Budm0/aQ7grq2jkQ+o08Coys=;
  b=J3QdAb26kqT0SMn/G+8k7DuPS+hotXUiBm8HvJIXjyusUG+n91+lM3sY
   qMaBrl4ODLsgqbkLcIuFS1Zkkr4yeiJR5w4Dr2rfeV5cpm2JEd9MYu5pZ
   pXozMuPelGx3V36qXhUnUqVSS1JLGmftG6MMep5ubpSl7Snr0GrwokjL+
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HgZBql8NadecAkZRh9kU3dOiFqljkeok9L6c0uF+PbwOJ902ssS3Moyl2CwDT8rgTQbVgE57ex
 twrqFha3FQ0kWvbYb0l2OICDxk0vr9p+ESA09HX6CHh/lCcMa0GljxSR/kBo/PZMtRwwbx1ykc
 /NvcloUOugS15XvwrB2eSESa9j4b7UrdxV5M3Zab+00HM3Ow5MO4ICwwxroMlvI2m4vLc7aYEv
 kKHiq+c09csIC2uf07UTcyDXQ4l9+95a1u8tm4OSZlrqu+XZLZ+7uB9joaJJii03qG5WpB3Juz
 VbARZSYpu18XTrL7Bwn86aZl
X-SBRS: 5.2
X-MesageID: 65159875
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oBcQtquucxObIzWasP7sRiDEz+fnVIJZMUV32f8akzHdYApBsoF/q
 tZmKTqBaKqCNzShKdl/ao23/RgEvZPXyIUwSANoqnwyQX4b+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24jhX2thh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplicbsWVsrbpb2teEUY0l1Fy1nB45D0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 pNEOGowMXwsZTVEIHMJM8olmd7wmyn9dS9X9HCzvLEOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9FgtBHRyPrv2SucD1hUYzpNceYFseZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZX2AAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1aZxfIWS3P
 ReO6Gu9AaO/2lPwM8ebhKrqU6wXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2lk3yPjOTPDFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbaNmPT0FDr2nCsQWmKZORW03wY8TXMCv9JcPJ7fde2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:Rni1867f/WSA/Pdi0gPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="65159875"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/9] x86/spec-ctrl: Record the last write to MSR_SPEC_CTRL
Date: Fri, 28 Jan 2022 13:29:23 +0000
Message-ID: <20220128132927.14997-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In some cases, writes to MSR_SPEC_CTRL do not have interesting side effects,
and we should implement lazy context switching like we do with other MSRs.

In the short term, this will be used by the SVM infrastructure, but I expect
to extend it to other contexts in due course.

Introduce cpu_info.last_spec_ctrl for the purpose, and cache writes made from
the boot/resume paths.  The value can't live in regular per-cpu data when it
is eventually used for PV guests when XPTI might be active.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/acpi/power.c                |  3 +++
 xen/arch/x86/include/asm/current.h       |  2 +-
 xen/arch/x86/include/asm/spec_ctrl_asm.h |  4 ++++
 xen/arch/x86/setup.c                     |  5 ++++-
 xen/arch/x86/smpboot.c                   |  5 +++++
 xen/arch/x86/spec_ctrl.c                 | 10 +++++++---
 6 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index ea2bd8bbfe93..5f2ec74f744a 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -296,7 +296,10 @@ static int enter_state(u32 state)
     ci->spec_ctrl_flags |= (default_spec_ctrl_flags & SCF_ist_wrmsr);
 
     if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+    {
         wrmsrl(MSR_SPEC_CTRL, default_xen_mcu_opt_ctrl);
+        ci->last_spec_ctrl = default_xen_mcu_opt_ctrl;
+    }
 
     if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
         wrmsrl(MSR_MCU_OPT_CTRL, default_xen_mcu_opt_ctrl);
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index cfbedc31983f..dc0edd9ed07d 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -56,6 +56,7 @@ struct cpu_info {
     /* See asm/spec_ctrl_asm.h for usage. */
     unsigned int shadow_spec_ctrl;
     uint8_t      xen_spec_ctrl;
+    uint8_t      last_spec_ctrl;
     uint8_t      spec_ctrl_flags;
 
     /*
@@ -73,7 +74,6 @@ struct cpu_info {
      */
     bool         use_pv_cr3;
 
-    unsigned long __pad;
     /* get_stack_bottom() must be 16-byte aligned */
 };
 
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index bf82528a12ae..9c0c7622c41f 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -67,6 +67,10 @@
  * steps 2 and 6 will restore the shadow value rather than leaving Xen's value
  * loaded and corrupting the value used in guest context.
  *
+ * Additionally, in some cases it is safe to skip writes to MSR_SPEC_CTRL when
+ * we don't require any of the side effects of an identical write.  Maintain a
+ * per-cpu last_spec_ctrl value for this purpose.
+ *
  * The following ASM fragments implement this algorithm.  See their local
  * comments for further details.
  *  - SPEC_CTRL_ENTRY_FROM_PV
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e716005145d3..115f8f651734 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1930,9 +1930,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     if ( bsp_delay_spec_ctrl )
     {
-        get_cpu_info()->spec_ctrl_flags &= ~SCF_use_shadow;
+        struct cpu_info *info = get_cpu_info();
+
+        info->spec_ctrl_flags &= ~SCF_use_shadow;
         barrier();
         wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
+        info->last_spec_ctrl = default_xen_spec_ctrl;
     }
 
     /* Jump to the 1:1 virtual mappings of cpu0_stack. */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 08c0f2d9df04..1cfdf96207d4 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -323,6 +323,8 @@ static void set_cpu_sibling_map(unsigned int cpu)
 
 void start_secondary(void *unused)
 {
+    struct cpu_info *info = get_cpu_info();
+
     /*
      * Dont put anything before smp_callin(), SMP booting is so fragile that we
      * want to limit the things done here to the most necessary things.
@@ -379,7 +381,10 @@ void start_secondary(void *unused)
      * microcode.
      */
     if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+    {
         wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
+        info->last_spec_ctrl = default_xen_spec_ctrl;
+    }
     if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
         wrmsrl(MSR_MCU_OPT_CTRL, default_xen_mcu_opt_ctrl);
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 2072daf66245..b2fd86ebe587 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1270,6 +1270,9 @@ void __init init_speculation_mitigations(void)
      */
     if ( has_spec_ctrl )
     {
+        struct cpu_info *info = get_cpu_info();
+        unsigned int val;
+
         bsp_delay_spec_ctrl = !cpu_has_hypervisor && default_xen_spec_ctrl;
 
         /*
@@ -1278,15 +1281,16 @@ void __init init_speculation_mitigations(void)
          */
         if ( bsp_delay_spec_ctrl )
         {
-            struct cpu_info *info = get_cpu_info();
-
             info->shadow_spec_ctrl = 0;
             barrier();
             info->spec_ctrl_flags |= SCF_use_shadow;
             barrier();
         }
 
-        wrmsrl(MSR_SPEC_CTRL, bsp_delay_spec_ctrl ? 0 : default_xen_spec_ctrl);
+        val = bsp_delay_spec_ctrl ? 0 : default_xen_spec_ctrl;
+
+        wrmsrl(MSR_SPEC_CTRL, val);
+        info->last_spec_ctrl = val;
     }
 
     if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
-- 
2.11.0


