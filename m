Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB094AB1A9
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266316.460019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDQ-0002OT-53; Sun, 06 Feb 2022 19:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266316.460019; Sun, 06 Feb 2022 19:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDQ-0002Lf-1l; Sun, 06 Feb 2022 19:28:52 +0000
Received: by outflank-mailman (input) for mailman id 266316;
 Sun, 06 Feb 2022 19:28:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nGnDO-0002J7-OM
 for xen-devel@lists.xenproject.org; Sun, 06 Feb 2022 19:28:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDM-0005t8-Ch; Sun, 06 Feb 2022 19:28:48 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDM-0007Ok-4h; Sun, 06 Feb 2022 19:28:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=dwa+CM0UGV4Uyu3tQxS0S6kaMZiyK2FzF7bR+EHTABc=; b=ppyd+fukvMObK1Y2M4+VtmDg6w
	3E8oAypWDgoe7HSHp252yR2ftQtXhjHOYNlRTy4MoqwvT51uHuVZLl9dB/ukzZCJH1NS+SvloMmQd
	Ptj9JPP1BFMPwyEdx/+W+vz5LmL8AvDtspb/bndh37q80j1sTFckn+2CWLZiMNoCFwdU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: ehem+xen@m5p.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 3/3] xen: Introduce a platform sub-op to retrieve the VGA information
Date: Sun,  6 Feb 2022 19:28:39 +0000
Message-Id: <20220206192839.75711-4-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206192839.75711-1-julien@xen.org>
References: <20220206192839.75711-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

When using EFI, the VGA information is fetched using the EFI
boot services. However, Xen will have exited the boot services.
Therefore, we need to find a different way to pass the information
to dom0.

For PV dom0, they are part of the start_info. But this is not
something that exists on Arm. So the best way would to be to
use a hypercall.

For now the structure layout is based on dom0_vga_console_info
for convenience. I am open on another proposal.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

TODO:
    - Check the structure size has not changed (I would like to
      avoid bumping the platform interface).
---
 xen/arch/arm/platform_hypercall.c | 15 +++++++++++++++
 xen/include/public/platform.h     |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index 8efac7ee602a..78ad328e2ab8 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -10,6 +10,7 @@
 #include <xen/sched.h>
 #include <xen/guest_access.h>
 #include <xen/spinlock.h>
+#include <xen/vga.h>
 #include <public/platform.h>
 #include <xsm/xsm.h>
 #include <asm/current.h>
@@ -58,6 +59,20 @@ long do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
             ret = -EINVAL;
         break;
 
+    case XENPF_firmware_info:
+        switch ( op->u.firmware_info.type )
+        {
+        case XEN_FW_VGA_INFO:
+            BUILD_BUG_ON(sizeof(op->u.firmware_info.u.vga) !=
+                         sizeof(vga_console_info));
+            memcpy(&op->u.firmware_info.u.vga, &vga_console_info,
+                   sizeof(vga_console_info));
+            if ( __copy_to_guest(u_xenpf_op, op, 1) )
+                ret = -EFAULT;
+            break;
+        }
+        break;
+
     default:
         ret = -ENOSYS;
         break;
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index a4c0eb62249a..4de42ce6cbc5 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -244,6 +244,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_efi_runtime_call_t);
 #define  XEN_FW_EFI_PCI_ROM        5
 #define  XEN_FW_EFI_APPLE_PROPERTIES 6
 #define XEN_FW_KBD_SHIFT_FLAGS    5
+#define XEN_FW_VGA_INFO           6
 struct xenpf_firmware_info {
     /* IN variables. */
     uint32_t type;
@@ -311,6 +312,7 @@ struct xenpf_firmware_info {
 
         /* Int16, Fn02: Get keyboard shift flags. */
         uint8_t kbd_shift_flags; /* XEN_FW_KBD_SHIFT_FLAGS */
+        struct dom0_vga_console_info vga;
     } u;
 };
 typedef struct xenpf_firmware_info xenpf_firmware_info_t;
-- 
2.32.0


