Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F45B27248E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 15:05:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLUy-0007v5-Hs; Mon, 21 Sep 2020 13:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIeE=C6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKLUw-0007v0-P8
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 13:04:50 +0000
X-Inumbo-ID: 242a9cae-0e4e-4801-91da-c9e27fbee8ff
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 242a9cae-0e4e-4801-91da-c9e27fbee8ff;
 Mon, 21 Sep 2020 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600693490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vSFMGs5TuuPLoqwLBeEOXLbo/pehHspz/Z8ArxMPTXU=;
 b=DPCEVABo8z+zh/OAk/rcL4zNGDh/z224UCOj2iUjfOqk13UyH/J7tmpD
 O2uJkqH1NqfttsDhirjjilrhwYMzcoXcoA8cNmooZOyBMggzMbkPSnL9n
 lvP+prDaF3d50Sh4r0jjDnNbecKS3M5JBBGDP1WSXTEHmRu4BOacuX0G1 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OCnyWsl6IA+ZBlRDJDGwkJYYVR7K0r9uZjeSbxLVuvpj6sMuJB5CZsSVGV+rdo6aH8aBrBwEy8
 twtkLrFhjVEhtVBTh82Es4DRTTCzcAf6s5a2zCUL5dXsAXNBihtsV+1aL6be7b+DhoPleSVykY
 Y1KxwzuNAVM3usbdtYrjdpRZf54mT8EDrTMZjgHNcf7YQQB0gusQDK3B5uMVVDPj8fSowY6hBJ
 vPjQ/pkpfUKR3i9ZUXdENTC2lrXZCRqgXGFmuqzWAetHgoEoZ2SHaRtcTHJLzGkM6CgyCg8V0G
 jLs=
X-SBRS: 2.7
X-MesageID: 27131129
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,286,1596513600"; d="scan'208";a="27131129"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
 <Ian.Jackson@citrix.com>
Subject: [PATCH] x86: Use LOCK ADD instead of MFENCE for smp_mb()
Date: Mon, 21 Sep 2020 14:04:23 +0100
Message-ID: <20200921130423.8035-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MFENCE is overly heavyweight for SMP semantics on WB memory, because it also
orders weaker cached writes, and flushes the WC buffers.

This technique was used as an optimisation in Java[1], and later adopted by
Linux[2] where it was measured to have a 60% performance improvement in VirtIO
benchmarks.

The stack is used because it is hot in the L1 cache, and a -4 offset is used
to avoid creating a false data dependency on live data.  (For 64bit userspace,
the offset needs to be under the red zone to avoid false dependences).

Fix up the 32 bit definitions in HVMLoader and libxc to avoid a false data
dependency.

[1] https://shipilev.net/blog/2014/on-the-fence-with-dependencies/
[2] https://git.kernel.org/torvalds/c/450cbdd0125cfa5d7bbf9e2a6b6961cc48d29730

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <Ian.Jackson@citrix.com>
---
 tools/firmware/hvmloader/util.h   | 2 +-
 tools/libs/ctrl/include/xenctrl.h | 4 ++--
 xen/include/asm-x86/system.h      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 31889de634..4f0baade0e 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -133,7 +133,7 @@ static inline void cpu_relax(void)
 #define barrier() asm volatile ( "" : : : "memory" )
 #define rmb()     barrier()
 #define wmb()     barrier()
-#define mb()      asm volatile ( "lock; addl $0,0(%%esp)" : : : "memory" )
+#define mb()      asm volatile ( "lock addl $0, -4(%%esp)" ::: "memory" )
 
 /*
  * Divide a 64-bit dividend by a 32-bit divisor.
diff --git a/tools/libs/ctrl/include/xenctrl.h b/tools/libs/ctrl/include/xenctrl.h
index 73e9535fc8..1d9f514302 100644
--- a/tools/libs/ctrl/include/xenctrl.h
+++ b/tools/libs/ctrl/include/xenctrl.h
@@ -68,11 +68,11 @@
 #define xen_barrier() asm volatile ( "" : : : "memory")
 
 #if defined(__i386__)
-#define xen_mb()  asm volatile ( "lock; addl $0,0(%%esp)" : : : "memory" )
+#define xen_mb()  asm volatile ( "lock addl $0, -4(%%esp)" ::: "memory" )
 #define xen_rmb() xen_barrier()
 #define xen_wmb() xen_barrier()
 #elif defined(__x86_64__)
-#define xen_mb()  asm volatile ( "mfence" : : : "memory")
+#define xen_mb()  asm volatile ( "lock addl $0, -128(%%rsp)" ::: "memory" )
 #define xen_rmb() xen_barrier()
 #define xen_wmb() xen_barrier()
 #elif defined(__arm__)
diff --git a/xen/include/asm-x86/system.h b/xen/include/asm-x86/system.h
index 7e5891f3df..6474dd1243 100644
--- a/xen/include/asm-x86/system.h
+++ b/xen/include/asm-x86/system.h
@@ -226,7 +226,7 @@ static always_inline unsigned long __xadd(
  *
  * Refer to the vendor system programming manuals for further details.
  */
-#define smp_mb()        mb()
+#define smp_mb()        asm volatile ( "lock addl $0, -4(%%rsp)" ::: "memory" )
 #define smp_rmb()       barrier()
 #define smp_wmb()       barrier()
 
-- 
2.11.0


