Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24AA810DB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942501.1341656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKK-00054T-Ss; Tue, 08 Apr 2025 15:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942501.1341656; Tue, 08 Apr 2025 15:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKK-00052G-N8; Tue, 08 Apr 2025 15:57:28 +0000
Received: by outflank-mailman (input) for mailman id 942501;
 Tue, 08 Apr 2025 15:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKK-0004Yr-2j
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:28 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5b3c4e-1492-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:57:27 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e61da95244so9512345a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:27 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:26 -0700 (PDT)
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
X-Inumbo-ID: 2b5b3c4e-1492-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127847; x=1744732647; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU7wsZPZG6Jt+l3y2KLJ3T9BEs2rZOcJCuT+jz/Pauw=;
        b=ZVDls60PEf4GVo5x4srEf145NjbuN9QKyztGQ+LY2HZ3Zt0SE70Yhwf7E6WuwL12QP
         UugRYQNwBaek2d2F+6l5fAB3iac7d2IxxeH6at8zt+wa8ia+9EuHo5zo0zG57TyVN70l
         4KywEZYJ0GwGvfUYqFaK9cKJb8Yb+FEX6TKeT1Y7fN9me1xC78H6961OvBmKUHGOA3SK
         m42yuw9iHV4frwLR0fRqhN3eLmiCRuWZ3thra3IgKoQW56c6RhwMX+AU/D6EYeI2UWli
         0XbXXCbvDQCfK/wIYBRVlxhQnC0Emf8EsD5bmODnR+B3aeHxjZ36JPL6R3u8vMgXdAuY
         bXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127847; x=1744732647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kU7wsZPZG6Jt+l3y2KLJ3T9BEs2rZOcJCuT+jz/Pauw=;
        b=bVgqyH894xaOI6V+pRONqx7wWJhG/r6Cv+3LQ/nWIpzqq0k57rFITz7MuQSQWnewbr
         bcziUHW2d9idAofv0GJPmoi7Zymesy6FsApUlYJfD+wW6/yWflAViIOEp2PhOnIwR06g
         wUrKqCt33n1g9SouQneVkTtlHgRYe7K4Eg5a+aA08k5UopK1BTtNT557vX/CLeZzp91q
         bavUOdkKaQBYr7Waau9z+f2ttYrH5zrebMPg4SH0RVz2Lf8kJCwrDT0ZcHmuxivMzQH1
         cFrFnBFkLoXRU8PleFhd+saJ24cxOl55vU+dSFqsqGCa72rOWGvLAsX2c1GUSArbMoZk
         sn+w==
X-Gm-Message-State: AOJu0YyMn+AsJXQwnEGfnC0Mr67A2GQzVotYyTYqA61sZJSrYRyyYCUk
	UN9TR9Ogvf2VwDy2cBvTZG7NCj+OEuSCWZsfz8WPolw6iDsTK2qR4oVd5w==
X-Gm-Gg: ASbGncs154T7lWE7CICHpx1otucimFSbyUFSthVd7hDeuTx+C5nJoAke/Sq2QKlX6RF
	zecDkHhl4i8iOwiDfAVp/0mupWyY3Lzawl1RBJP08vTTLSTI3N1dDLxHrEWypaocTz3J1lfqYxm
	hezNo/UDVMh5Sc+NgoMYZRhl6strIMx6SPbIUWOsrQ8KJgapLHMr67wtLGCqj/LQF5hzgp7irLM
	2o066xtP8OEnrpBjrhUpFgkahHjUleUqgjg7HRk1jrannJ0Fn/jM5uBkzwnO5qkLkMPLxah+MfP
	tYVls6A2Ta+xFbHKbUk6hBg86voKKzIXDPnoylv+mzXO5zdFioSh8QkAHF82JPwP5TRjpF5kfFT
	FxWxnqW5Eyw9R8w==
X-Google-Smtp-Source: AGHT+IE4/qpCIySBMg3ov9R9hgBZJWxsHPDuOZW48C5VOl0DA8+oya1HsNnoBAh7Uk/lve1nLXUgRw==
X-Received: by 2002:a17:906:c153:b0:ac3:ec70:18ae with SMTP id a640c23a62f3a-ac7d184ec8dmr1533408566b.3.1744127846506;
        Tue, 08 Apr 2025 08:57:26 -0700 (PDT)
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
Subject: [PATCH v1 03/14] xen/riscv: introduce ioremap()
Date: Tue,  8 Apr 2025 17:57:07 +0200
Message-ID: <6d91eeabe2735de93bfcf2a2420e2059a8f35e52.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on RISC-V unpriviliged spec ( Version 20240411 ):
```
For implementations that conform to the RISC-V Unix Platform Specification,
I/O devices and DMA operations are required to access memory coherently and
via strongly ordered I/O channels. Therefore, accesses to regular main memory
regions that are concurrently accessed by external devices can also use the
standard synchronization mechanisms. Implementations that do not conform
to the Unix Platform Specification and/or in which devices do not access
memory coherently will need to use mechanisms
(which are currently platform-specific or device-specific) to enforce
coherency.

I/O regions in the address space should be considered non-cacheable
regions in the PMAs for those regions. Such regions can be considered coherent
by the PMA if they are not cached by any agent.
```
and [1]:
```
The current riscv linux implementation requires SOC system to support
memory coherence between all I/O devices and CPUs. But some SOC systems
cannot maintain the coherence and they need support cache clean/invalid
operations to synchronize data.

Current implementation is no problem with SiFive FU540, because FU540
keeps all IO devices and DMA master devices coherence with CPU. But to a
traditional SOC vendor, it may already have a stable non-coherency SOC
system, the need is simply to replace the CPU with RV CPU and rebuild
the whole system with IO-coherency is very expensive.
```

and the fact that all known ( to me ) CPUs that support the H-extension
and that ones is going to be supported by Xen have memory coherency
between all I/O devices and CPUs, so it is currently safe to use the
PAGE_HYPERVISOR attribute.
However, in cases where a platform does not support memory coherency, it
should support CMO extensions and Svpbmt. In this scenario, updates to
ioremap will be necessary.
For now, a compilation error will be generated to ensure that the need to
update ioremap() is not overlooked.

[1] https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig | 12 ++++++++++++
 xen/arch/riscv/pt.c    | 19 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index d882e0a059..27086cca9c 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config HAS_SVPBMT
+	bool
+	help
+	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
+	  page-based memory types).
+
+	  The memory type for a page contains a combination of attributes
+	  that indicate the cacheability, idempotency, and ordering
+	  properties for access to that page.
+
+	  The Svpbmt extension is only available on 64-bit cpus.
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 857619d48d..e2f49e2f97 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -7,6 +7,7 @@
 #include <xen/pfn.h>
 #include <xen/pmap.h>
 #include <xen/spinlock.h>
+#include <xen/vmap.h>
 
 #include <asm/fixmap.h>
 #include <asm/flushtlb.h>
@@ -548,3 +549,21 @@ void clear_fixmap(unsigned int map)
                               FIXMAP_ADDR(map) + PAGE_SIZE) != 0 )
         BUG();
 }
+
+void *ioremap(paddr_t pa, size_t len)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(pa));
+    unsigned int offs = pa & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+
+#ifdef CONFIG_HAS_SVPBMT
+    #error "an introduction of PAGE_HYPERVISOR_IOREMAP is needed for __vmap()"
+#endif
+
+    void *ptr = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
+
+    if ( !ptr )
+        return NULL;
+
+    return ptr + offs;
+}
-- 
2.49.0


