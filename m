Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 718E8CD6ADF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192147.1511472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiuf-0008MC-Ds; Mon, 22 Dec 2025 16:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192147.1511472; Mon, 22 Dec 2025 16:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiuf-0008JO-AZ; Mon, 22 Dec 2025 16:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1192147;
 Mon, 22 Dec 2025 16:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXiud-00085X-Gz
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:37:35 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84b30338-df54-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 17:37:34 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64b791b5584so5837673a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:37:34 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9105655asm10977819a12.9.2025.12.22.08.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:37:33 -0800 (PST)
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
X-Inumbo-ID: 84b30338-df54-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421454; x=1767026254; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+KQ98UxX4HjuLLz9pcT62AJiNhIN8Axp4RTa3sOQNU=;
        b=jjqpWTGSbuks1+5DXaPOx4eCgj+aKZAHp4ib8LdA9/PzgHD2ndHrK9onZ1Q3ICvSfZ
         CAnVGq9/tqbxvGpvU44B/OF07UCYl06hK1Hz0j9xLvNHNe06/qUBhjAc9xrf0IQOoiLo
         QrPD8l/bP+Plp9AJkxxamvChcUwG/QG/5BRQMlPvJbk4bYbz/To9Q2NmAFi6vdsmatYz
         tWYaHc06TSGj3EeKiftedXpJvSySwlZt5wr2TiI5CsaB+zwid/RYfVjZIxWFEwz/Zos8
         7Nojrfd0OP53lo5rTU25v6NfItYot5uS2NLVXidP/cL98GzhEUsD6tuePa31pJJ42u21
         HnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421454; x=1767026254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+KQ98UxX4HjuLLz9pcT62AJiNhIN8Axp4RTa3sOQNU=;
        b=PBIcv4My4J1I9nL6uUPOFUL3BA77ieXelyZakajPBmSigN5LgY7vdRjtDJwNyGtiNq
         oVsTpVLrm3nZQxv/yyQxCkV/l3mDfPgFW5jHGwiDwgYE1XJGJaXrbibHdqiDNSx0KEf0
         HGeWsJms4fp7ZXGks38k8YXh48iD+qhwH7zANqeOa8YjNnEjge27g/whafwKC89gpISn
         gaIfM4NFiF7JEXbxMJLmLz/HxWh/HsY09Kb9betGTcP0440sX/NQuRvDVTXqVapBFPI3
         qFAPRldblkqMTXXTWCwaoLsLkGK1CJjtM2Hesuq6kjSnHF1zu3sJ9QnUBuP3SjocCfIt
         Qcdw==
X-Gm-Message-State: AOJu0YwSfuKOvVaF0FZeniNa8BxkcO2qEd1sWZYrLdppaTX6sacvt/8n
	yaFKInFFoJoLM2iawbT736Z34gDmYjLEf26/twASNgZvLJvVzm+wRmYK840kKg==
X-Gm-Gg: AY/fxX4q5+pYmp1V1n2PapvoZLJfYxBSYCuqPVXG+tlTjfR3G2MMSTp14xLCd9t/uou
	6Vo7qmNxPi9YnzXgtnOkG6AIrSCKZWnoxL0tYIsO4nd713wgDAP77qtF4TV5+BK4lEqltPqrMxg
	knc8gQOrrdfRWdxXGP4FEgkVesYGTXOzCQaxKz+NX/I0SOjigrDxWTiNJzpILHu8EDHv3Vxi3O/
	9ekOgfmxlFy5DRGDzk9KKQb7zWd1gS0wzRw/wZABdbhQTAATPKNXdb9NruxAys4kggjY3DWNi1R
	Kbb3laym/iaZGzGX5DKETAJjs2WpTanvRt+7F2dVcVjZXSXg5uczSc4ehA0ZmMS6VjkKLqJc5Wc
	5hQhhTweaMJwayi4GvaCDvVS4initnFk1yqaxEZiHL0RbKhiA63WhReaZcffAczYZbU9HN1GzId
	9LtxY++1A/gXYTvmYsc3omqhl8KCV/NqfDOcTIrBpuLcyhSg79kZ6Tlrc=
X-Google-Smtp-Source: AGHT+IE1IdRPCLK9ukrns+M8xijkSVgAwWDBhJDtiSUlrmHWIZXSZqQKqIq7Y7nzum13H4VjFRQPlA==
X-Received: by 2002:aa7:c590:0:b0:64b:58bf:a05 with SMTP id 4fb4d7f45d1cf-64b8ec6e31dmr8758412a12.18.1766421453832;
        Mon, 22 Dec 2025 08:37:33 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] xen/riscv: add RISC-V virtual SBI base extension support for guests
Date: Mon, 22 Dec 2025 17:37:21 +0100
Message-ID: <d7c8217605ad5d88a94baf32c2543654a415236d.1766399205.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766399205.git.oleksii.kurochko@gmail.com>
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/sbi.h     | 10 ++++
 xen/arch/riscv/vsbi/Makefile         |  1 +
 xen/arch/riscv/vsbi/base-extension.c | 78 ++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 xen/arch/riscv/vsbi/base-extension.c

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 751bae6d66..a88d3d5712 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -14,6 +14,13 @@
 
 #include <xen/cpumask.h>
 
+/* Xen-controlled SBI version reported to guests */
+#define XEN_SBI_VER_MAJOR 0
+#define XEN_SBI_VER_MINOR 2
+
+/* SBI-defined implementation ID */
+#define SBI_XEN_IMPID 7
+
 #define SBI_EXT_0_1_SET_TIMER               0x0
 #define SBI_EXT_0_1_CONSOLE_PUTCHAR         0x1
 #define SBI_EXT_0_1_CONSOLE_GETCHAR         0x2
@@ -32,6 +39,9 @@
 #define SBI_EXT_BASE_GET_IMP_ID         0x1
 #define SBI_EXT_BASE_GET_IMP_VERSION    0x2
 #define SBI_EXT_BASE_PROBE_EXT          0x3
+#define SBI_EXT_BASE_GET_MVENDORID      0x4
+#define SBI_EXT_BASE_GET_MARCHID        0x5
+#define SBI_EXT_BASE_GET_MIMPID         0x6
 
 /* SBI function IDs for RFENCE extension */
 #define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
index bc5755cb13..8ce470f787 100644
--- a/xen/arch/riscv/vsbi/Makefile
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -1,2 +1,3 @@
+obj-y += base-extension.o
 obj-y += core.o
 obj-y += legacy-extension.o
diff --git a/xen/arch/riscv/vsbi/base-extension.c b/xen/arch/riscv/vsbi/base-extension.c
new file mode 100644
index 0000000000..0245ff630e
--- /dev/null
+++ b/xen/arch/riscv/vsbi/base-extension.c
@@ -0,0 +1,78 @@
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
+                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
+                     __func__, fid, eid);
+        break;
+    }
+
+    return ret;
+}
+
+VSBI_EXT(base, SBI_EXT_BASE, SBI_EXT_BASE, vsbi_base_ecall_handler)
-- 
2.52.0


