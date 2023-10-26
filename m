Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2A7D89E2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 22:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623985.972349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7OT-0008K8-CP; Thu, 26 Oct 2023 20:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623985.972349; Thu, 26 Oct 2023 20:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw7OT-0008Hw-8i; Thu, 26 Oct 2023 20:55:53 +0000
Received: by outflank-mailman (input) for mailman id 623985;
 Thu, 26 Oct 2023 20:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgGv=GI=citrix.com=prvs=656ff9716=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qw7OR-000838-CH
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 20:55:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b4487a7-7442-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 22:55:50 +0200 (CEST)
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
X-Inumbo-ID: 0b4487a7-7442-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698353750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ljkTUkq4cwuvgCLerUGuk67qFr0QhZx8czzjrJvbt94=;
  b=ApEWC3Y8TZKWAxUU79AsncA6cFntnZL6Eh2ab6TjZKJBSkL7DuKcTuhx
   lfcNVqxNt48ToZQSLSQoNtw9963FrQDGWrUuV/Vkn4Lvin0BCKGmZvjq1
   8No+UD/s0oYy+X5thUAP31XU5hMhM/LXbOYaGn3gKfiBLWB/4VOukS2+D
   g=;
X-CSE-ConnectionGUID: T+oetjRMTnK/J9d/XjGbxA==
X-CSE-MsgGUID: Lhlj6YxoRPO2+p8yCWQ78Q==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 129566477
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:nwJj5q0+a5YDdLiYIfbD5e1xkn2cJEfYwER7XKvMYLTBsI5bpzQHm
 mFKWmvTa/jfZWXxKdgja4iw8RlUuJfcmoJnTAFlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRkO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPSJJ+
 OAaEhUxaDPEpbO6h4K5ZeN8r5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5QIwBjE+
 T2uE2LRJhEeNoKu2T2/ylX2xfefjAjEYd1CLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQxy
 lKHltXuQydzubeYTXac8La8pDa+fyMSKAcqdSICTAJD+dDsoYg/hxHIU/5qFaLzhdrwcQwc2
 BjT8nJ43e9Ky5dWhuPkpTgrng5AuLD1DQk4+gfte16jzURbNYLiV46H40jyuKMowJmicrWRg
 JQVs5HAvbBUXMjRznzlrPYlRu/zu6jfWNHIqRs/R8N/qm7FF2uLJ9g43d1oGKt+3i/okxfCZ
 1XavUtq/IVSOnSxBUOcS9nqU5tzpUQM+M6Maxw1UjatSsIoHON/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlMgeR3m3pumDiLHfgXKihLNpLHOxaopUotagPSPojVEovYyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXPjLRzhsXrfbeGJOQTh5Y9eImO9JRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg6M+61Bcsm/SpiVcHuVH7xs0UejU+UxP93X/MKkXMPrYSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:Xwc3Sq9EJonF2v+kAIZuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:p7tpF2PQfsY37e5DZGpg+VIWIOUZdF6a7ibcZH+6Jmx5YejA
X-Talos-MUID: 9a23:RV6FJgUIdjltBFPq/BvsgDM8Bddv2ZyJUgMVwYQthPDbZRUlbg==
X-IronPort-AV: E=Sophos;i="6.03,254,1694750400"; 
   d="scan'208";a="129566477"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and conditionalise ucode
Date: Thu, 26 Oct 2023 21:55:39 +0100
Message-ID: <20231026205539.3261811-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We eventually want to be able to build a stripped down Xen for a single
platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
available to randconfig), and adjust the microcode logic.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

I've intentionally ignored the other vendors for now.  They can be put into
Kconfig by whomever figures out the actual dependencies between their init
routines.

v2:
 * Tweak text
---
 xen/arch/x86/Kconfig                 |  2 ++
 xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
 xen/arch/x86/cpu/microcode/private.h |  9 +++++++++
 4 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/Kconfig.cpu

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index eac77573bd75..d9eacdd7e0fa 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -49,6 +49,8 @@ config HAS_CC_CET_IBT
 
 menu "Architecture Features"
 
+source "arch/x86/Kconfig.cpu"
+
 source "arch/Kconfig"
 
 config PV
diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
new file mode 100644
index 000000000000..3c5d88fdfd16
--- /dev/null
+++ b/xen/arch/x86/Kconfig.cpu
@@ -0,0 +1,22 @@
+menu "Supported CPU vendors"
+	visible if EXPERT
+
+config AMD
+	bool "AMD"
+        default y
+        help
+          Detection, tunings and quirks for AMD platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on AMD platforms.
+
+config INTEL
+	bool "Intel"
+        default y
+        help
+          Detection, tunings and quirks for Intel platforms.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Intel platforms.
+
+endmenu
diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
index aae235245b06..30d600544f45 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -1,3 +1,3 @@
-obj-y += amd.o
+obj-$(CONFIG_AMD) += amd.o
 obj-y += core.o
-obj-y += intel.o
+obj-$(CONFIG_INTEL) += intel.o
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index b58611e908aa..da556fe5060a 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -70,7 +70,16 @@ struct microcode_ops {
  * support available) and (not) ops->apply_microcode (i.e. read only).
  * Otherwise, all hooks must be filled in.
  */
+#ifdef CONFIG_AMD
 void ucode_probe_amd(struct microcode_ops *ops);
+#else
+static inline void ucode_probe_amd(struct microcode_ops *ops) {}
+#endif
+
+#ifdef CONFIG_INTEL
 void ucode_probe_intel(struct microcode_ops *ops);
+#else
+static inline void ucode_probe_intel(struct microcode_ops *ops) {}
+#endif
 
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
-- 
2.30.2


