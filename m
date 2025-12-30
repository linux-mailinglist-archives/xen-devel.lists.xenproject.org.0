Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA6CEA1B2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 16:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194337.1512746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabzR-0001u9-Ju; Tue, 30 Dec 2025 15:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194337.1512746; Tue, 30 Dec 2025 15:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabzR-0001sh-GU; Tue, 30 Dec 2025 15:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1194337;
 Tue, 30 Dec 2025 15:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKsM=7E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vabzP-0001sb-Ve
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 15:50:27 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413ec65a-e597-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 16:50:24 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so1543505366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 07:50:24 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037de0de1sm3695413366b.40.2025.12.30.07.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 07:50:23 -0800 (PST)
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
X-Inumbo-ID: 413ec65a-e597-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109824; x=1767714624; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7gKOOgmmYdSIY6PAwcf6NmkP9o7a38tNEad4djOSS4=;
        b=GuPoCqmdaXAqg6SP70pxDTdlBBFZuBjWHhrMSNu+65vi6xQ8T7xpLCCQcTTX55FLxN
         8GVifEpUQlTwGOWl2DegyPr4kaRtOQySmG6szUUbhMYx2KvGE1GuNETdNZ602vdWy19s
         h2s03d3q8HZDmc7hNllRsLZ0GB5vM7Y0pc13h/qnAsvVhFnVGqMedArr6ce+SSIrw8gC
         paKOVtpgss1EELN++Odg3fHSi3yAsleezp2v4LSj0elZ8MZidQQRCiWHRTVOuCm84dbr
         qJDPht4z8WnlGs29RP0mMqVmGZ8lgxj4FcPEHVM4K/pxvGOcE9dYNrmfiLKU11qPy2Oc
         gYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109824; x=1767714624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n7gKOOgmmYdSIY6PAwcf6NmkP9o7a38tNEad4djOSS4=;
        b=KcJyahAMXT2ZNqdMWU8cebqJeyLQEbxNLuN3CTLx+uv3RZXnCOWRHf/JxGROoeBNtu
         NG2JkEQVYMgbFKLkh0pgSzEe+0zxG1R57IJE268KTXwsNA9kTR4Fb++ynQ1m0aR8lzuu
         aHM3OxECZmq792LbkEQyauuFW6gDTnSAUx1nNnwjL9kH6PoMRUysdpHin41ggSrKi6W3
         S5u7YS0JYQUYqsCXf0wtPKmA7i7D3Cf0ffkmJ8WW3yTe++2n9bo86g7dN2bMoq6tSBMx
         R0aJutZPXL7bDZW+4eh9E9LNZhVAD2k5mBr22f5DuBuYKu39OkcNUT4jJxcVWVSAxIhW
         1DaQ==
X-Gm-Message-State: AOJu0YxLf8jlHVlGVKzBQ3th5aTeAUo3nlYpWmwrjgnxM4OQXuWq3x06
	Q8LfZgzSxSg1uYE32VAO7hm6ziIyl3WgghCCk7HwsFerGToNBqW48V+/6Y9ljQ==
X-Gm-Gg: AY/fxX7M48MgqJA2CMx2liS2QbWA4L5+JH+l2C9WRDVWIxUppLGuvA/4oQON3Vc789Q
	B/V8Dds6njqqJoo424WWe/AkEd9lvETJQ1Pn94B0+J35mVt4vUbYJwKm56+fDsAIEz3aU+6iU9p
	Fj6DPrOfWUk/zO1RPJuq/NPg52X5Vf8mo+z6mc+M7p9/MdFWMFFH/fJBFFGJaTRz00D714PQF3G
	Jub++hPAZyRItK05ELCNpRKaGFGztvhxnPRz4/+c4bSTYe+hyfeoz7W+wLBm3IIYMJUbyhDz2lo
	MM1pZL6OhX7+/Odh+ZiY+8iZJYTKsP1kaMgs2Lh0D0bMYqUdMEDkh0/EVkVF2V+HncmjbZUVmVe
	0gR1WDy/uwK1kbyzHZ1ms2lJOUw83d6RpsJ7bRY8hDCLNNi0OS5AhQtYTUeh+GMI48aPkx+oqnW
	CYI2hTxLIoIFEeRord5ozHyVKkvnhZYzL7RwAamnAZ226SorlDD7MGVQ==
X-Google-Smtp-Source: AGHT+IHmPTleLF1vmAUMJ+0zoGqS1Qu6n/ZbaQyy5oVKptd2FFupdkOFy0+GoFZJ837xlHaFP7jySA==
X-Received: by 2002:a17:906:4fd0:b0:b70:b700:df98 with SMTP id a640c23a62f3a-b8036ebbe4amr3376642066b.5.1767109823599;
        Tue, 30 Dec 2025 07:50:23 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/1] xen/riscv: add RISC-V virtual SBI base extension support for guests
Date: Tue, 30 Dec 2025 16:50:11 +0100
Message-ID: <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1767108625.git.oleksii.kurochko@gmail.com>
References: <cover.1767108625.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support of virtual SBI base extension calls for RISC-V guests, delegating
hardware-specific queries to the underlying SBI and handling version and
firmware ID queries directly.

The changes include:
1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
   SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
   SBI_EXT_BASE_GET_SPEC_VERSION.
4. Introduce SBI_XEN_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
5. Implement handling of SBI base extension functions, including version,
   firmware ID, and machine-specific queries.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Move definition of XEN_SBI_VER_{MAJOR, MINOR} to base-extension.c.
 - Correct string format for FID: s/#%#lx/#%lu.
 - Print first EID then FID (as vsbi/core.c code does).
---
Changes in v3:
 - s/XEN_SBI_IMPID/SBI_XEN_IMPID
 - Add ASSERT(eid == SBI_EXT_BASE) in vsbi_base_ecall_handler().
 - Fix code style for switch/case.
 - Use current instead of `vcpu` argument as it was dropped from
   vsbi_base_ecall_handler() prototype.
 - Add comments for define-s XEN_SBI_VER_{MAJOR, MINOR} and SBI_XEN_IMPID.
---
Changes in v2:
 - s/vsbi-base-extension.*/base-extension.*
 - Introduce VCPU_SBI_IMPID, XEN_SBI_VER_MINOR and XEN_SBI_VER_MAJOR.
 - Return VCPU_SBI_IMPID in the case of SBI_EXT_BASE_GET_IMP_ID.
 - Return Xen version in the case of SBI_EXT_BASE_GET_IMP_VERSION.
 - Use domain_crash() instead of panic() for default case.
 - For SBI_EXT_BASE_GET_{MVENDORID,MARCHID,MIMPID} abd SBI_EXT_BASE_PROBE_EXT
   add handling of a domain is h/w or not.
---
 xen/arch/riscv/include/asm/sbi.h     |  6 ++
 xen/arch/riscv/vsbi/Makefile         |  1 +
 xen/arch/riscv/vsbi/base-extension.c | 82 ++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 xen/arch/riscv/vsbi/base-extension.c

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 751bae6d6654..79f7ff5c5501 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -14,6 +14,9 @@
 
 #include <xen/cpumask.h>
 
+/* SBI-defined implementation ID */
+#define SBI_XEN_IMPID 7
+
 #define SBI_EXT_0_1_SET_TIMER               0x0
 #define SBI_EXT_0_1_CONSOLE_PUTCHAR         0x1
 #define SBI_EXT_0_1_CONSOLE_GETCHAR         0x2
@@ -32,6 +35,9 @@
 #define SBI_EXT_BASE_GET_IMP_ID         0x1
 #define SBI_EXT_BASE_GET_IMP_VERSION    0x2
 #define SBI_EXT_BASE_PROBE_EXT          0x3
+#define SBI_EXT_BASE_GET_MVENDORID      0x4
+#define SBI_EXT_BASE_GET_MARCHID        0x5
+#define SBI_EXT_BASE_GET_MIMPID         0x6
 
 /* SBI function IDs for RFENCE extension */
 #define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
index bc5755cb13d6..8ce470f787c5 100644
--- a/xen/arch/riscv/vsbi/Makefile
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -1,2 +1,3 @@
+obj-y += base-extension.o
 obj-y += core.o
 obj-y += legacy-extension.o
diff --git a/xen/arch/riscv/vsbi/base-extension.c b/xen/arch/riscv/vsbi/base-extension.c
new file mode 100644
index 000000000000..41a95ae188dd
--- /dev/null
+++ b/xen/arch/riscv/vsbi/base-extension.c
@@ -0,0 +1,82 @@
+
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/version.h>
+
+#include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/vsbi.h>
+
+/* Xen-controlled SBI version reported to guests */
+#define XEN_SBI_VER_MAJOR 0
+#define XEN_SBI_VER_MINOR 2
+
+static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
+                                   struct cpu_user_regs *regs)
+{
+    int ret = 0;
+    struct sbiret sbi_ret;
+
+    ASSERT(eid == SBI_EXT_BASE);
+
+    switch ( fid )
+    {
+    case SBI_EXT_BASE_GET_SPEC_VERSION:
+        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
+                   XEN_SBI_VER_MINOR;
+        break;
+
+    case SBI_EXT_BASE_GET_IMP_ID:
+        regs->a1 = SBI_XEN_IMPID;
+        break;
+
+    case SBI_EXT_BASE_GET_IMP_VERSION:
+        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
+        break;
+
+    case SBI_EXT_BASE_GET_MVENDORID:
+    case SBI_EXT_BASE_GET_MARCHID:
+    case SBI_EXT_BASE_GET_MIMPID:
+        if ( is_hardware_domain(current->domain) )
+        {
+            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+            ret = sbi_ret.error;
+            regs->a1 = sbi_ret.value;
+        }
+        else
+            /*
+             * vSBI should present a consistent, virtualized view to guests.
+             * In particular, DomU-visible data must remain stable across
+             * migration and must not expose hardware-specific details.
+             *
+             * These register(s) must be readable in any implementation,
+             * but a value of 0 can be returned to indicate the field
+             * is not implemented.
+             */
+            regs->a1 = 0;
+
+        break;
+
+    case SBI_EXT_BASE_PROBE_EXT:
+        regs->a1 = vsbi_find_extension(regs->a0) ? 1 : 0;
+        break;
+
+    default:
+        /*
+         * TODO: domain_crash() is acceptable here while things are still under
+         * development.
+         * It shouldn't stay like this in the end though: guests should not
+         * be punished like this for something Xen hasn't implemented.
+         */
+        domain_crash(current->domain,
+                     "%s: Unsupported ecall: EID: #%#lx FID: #%lu\n",
+                     __func__, eid, fid);
+        break;
+    }
+
+    return ret;
+}
+
+VSBI_EXT(base, SBI_EXT_BASE, SBI_EXT_BASE, vsbi_base_ecall_handler)
-- 
2.52.0


