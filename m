Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBDA011AB
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864803.1276127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtSr-0008Ss-1Q; Sat, 04 Jan 2025 02:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864803.1276127; Sat, 04 Jan 2025 02:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtSq-0008Kq-US; Sat, 04 Jan 2025 02:00:32 +0000
Received: by outflank-mailman (input) for mailman id 864803;
 Sat, 04 Jan 2025 02:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQq-0005Ax-Rr
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ecc83d6-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF89D5C63FD;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10C16C4CEDF;
 Sat,  4 Jan 2025 01:58:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1DEE77198;
 Sat,  4 Jan 2025 01:58:16 +0000 (UTC)
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
X-Inumbo-ID: 5ecc83d6-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955896;
	bh=QazlpyV6psPVJxq90As+1tifoHdIpFVbG/2MHr8OLBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rrUY+R9cOymfLlpHjaW/5WWuCxfD+kpXYC19m42ZvsRMQZ2tbFy+4fYSjh5nSqOnF
	 MDzhLmOF4r2vJ7RDUNmGK6VtIPT/hg4KdPr88fIMBe856PpMni/SavUUC54S3nkJBs
	 97FS/wNUVRx2tgQ1vGcEYa94L/MBlToRq/UBPie/kp0o1+MbhbziOfNzyw/ZGh1nbt
	 JOYbyxh1Nd4J0vJdOyqnbN4DXALfEvFVeNk5zmBuE1GQ78H1amMI58APMUcbsvA9i3
	 L3BTJnHJ51Kt69qXsCFuWptoqB+r5EH9bPDjgq+9kesmPxxoW1k1JLeYnILzGBHpNH
	 msPk4KNQTq6Yw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:28 -0800
Subject: [PATCH v3 22/24] x86/hvm: enable NS16550-compatible UART emulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-22-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=5808;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=oTdotR5rgkOxF28AQvVxnepnVm1tE7cePzIJQgwAwTE=;
 b=++NBrOXcXTVJ8AvbN0dFDKCaPX+KTiZWc6kqg1YW8cHeVU5lsUi46ifTL7rphNL0TvW1CYQXH
 XrobXLlc2ALALwgiWl1M0BltoYkrxIKgEelLgp8WFdBQIdlCQDKzw1V
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce new emulation flag for virtual UART on x86 and plumb it through
domain creation code so NS16550 emulator is enabled properly.

Virtual UART facility is enabled for HVM domains only. Enabling it for PVH
domains requires some work, as vPIC is not enabled in PVH.

Also, since feature is currently for debugging only, vUART facility is
controlled build-time only and globally for all HVM domains.

The toolstack cannot configure virtual UART yet.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
In PVH case, vUART asserts on vpic_irq_positive_edge() call while firing a
virtual IRQ to the guest OS:
[[
...
Assertion 'has_vpic(d)' failed at arch/x86/hvm/vpic.c:525
(XEN) [   28.984923] ----[ Xen-4.20-unstable  x86_64  debug=y  Not tainted ]----
(XEN) [   28.984925] CPU:    3
(XEN) [   28.984926] RIP:    e008:[<ffff82d0402d201a>] vpic_irq_positive_edge+0x98/0xc0
...
]]
---
---
 tools/ocaml/libs/xc/xenctrl.ml    |  1 +
 tools/ocaml/libs/xc/xenctrl.mli   |  1 +
 xen/arch/x86/domain.c             | 10 ++++++++++
 xen/arch/x86/include/asm/domain.h |  5 +++--
 xen/include/public/virtdev.h      |  6 ++++--
 5 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a92316b812ad3d3ff0e1c36823070adb4a..647239b3e55e88b00eb8e9773a5267894cbbae54 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -47,6 +47,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_VUART
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae3f10c5abe45eaa3c06a8a67d9ba268..4f5f64c786e83e8a0c3dd3cdb0460f7095de4a62 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -41,6 +41,7 @@ type x86_arch_emulation_flags =
   | X86_EMU_PIT
   | X86_EMU_USE_PIRQ
   | X86_EMU_VPCI
+  | X86_EMU_VUART
 
 type x86_arch_misc_flags =
   | X86_MSR_RELAXED
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 9669886ac95cbee27c9eb72b16386705b470e7b1..c1b15ddf664269ba63d0bcd8a974491a4ab3524f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -752,6 +752,10 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
         if ( is_hardware_domain(d) &&
              emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
             return false;
+
+        /* FIXME: remove once virtual UART is configurable via xl */
+        emflags &= ~XEN_X86_EMU_VUART;
+
         if ( !is_hardware_domain(d) &&
              xen_emflags_allowable(emflags) != XEN_X86_EMU_BASELINE &&
              emflags != X86_EMU_LAPIC )
@@ -804,6 +808,12 @@ int arch_domain_create(struct domain *d,
 
     emflags = config->arch.emulation_flags;
 
+    /* FIXME: enable virtual UART for all HVMs; must be configurable via xl */
+    if ( IS_ENABLED(CONFIG_HAS_VUART) && is_hvm_domain(d) )
+        emflags |= XEN_X86_EMU_VUART;
+    else
+        emflags &= ~XEN_X86_EMU_VUART;
+
     if ( is_hardware_domain(d) && is_pv_domain(d) )
         emflags |= XEN_X86_EMU_PIT;
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 2532616bca015d0aad9abc35e14948937ab39b8f..53d14881d94f888e72f7443159c1c278d15d05cb 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -485,7 +485,8 @@ struct arch_domain
 #define X86_EMU_VPCI     0
 #endif
 
-#define X86_EMU_PIT     XEN_X86_EMU_PIT
+#define X86_EMU_PIT      XEN_X86_EMU_PIT
+#define X86_EMU_VUART    XEN_X86_EMU_VUART
 
 /* This must match XEN_X86_EMU_ALL in xen.h */
 #define X86_EMU_ALL             (X86_EMU_LAPIC | X86_EMU_HPET |         \
@@ -493,7 +494,7 @@ struct arch_domain
                                  X86_EMU_IOAPIC | X86_EMU_PIC |         \
                                  X86_EMU_VGA | X86_EMU_IOMMU |          \
                                  X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
-                                 X86_EMU_VPCI)
+                                 X86_EMU_VPCI | X86_EMU_VUART)
 
 #define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
 #define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
diff --git a/xen/include/public/virtdev.h b/xen/include/public/virtdev.h
index 36931e0d679cedadd4212f34142d7c3f00cd3389..bcc71b519310e58d6094fadded14a3e0ee6bfd7e 100644
--- a/xen/include/public/virtdev.h
+++ b/xen/include/public/virtdev.h
@@ -32,17 +32,19 @@ enum {
 #define XEN_X86_EMU_PIT             VIRTDEV_PIT
 #define XEN_X86_EMU_USE_PIRQ        VIRTDEV_PIRQ
 #define XEN_X86_EMU_VPCI            VIRTDEV_PCI
+#define XEN_X86_EMU_VUART           VIRTDEV_UART
 
 #define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
                                      XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
                                      XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
                                      XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
-                                     XEN_X86_EMU_VPCI)
+                                     XEN_X86_EMU_VPCI | XEN_X86_EMU_VUART)
 
 /* PIRQ (HVM) feature is user-selectable (libxl). */
 #define XEN_X86_EMU_OPTIONAL        (XEN_X86_EMU_VPCI | \
-                                     XEN_X86_EMU_USE_PIRQ)
+                                     XEN_X86_EMU_USE_PIRQ | \
+                                     XEN_X86_EMU_VUART)
 
 #define XEN_X86_EMU_BASELINE        xen_emflags_allowable(XEN_X86_EMU_ALL)
 

-- 
2.34.1



