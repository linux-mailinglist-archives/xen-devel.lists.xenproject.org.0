Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B34375B1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214950.373846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5u-0006fG-Ca; Fri, 22 Oct 2021 10:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214950.373846; Fri, 22 Oct 2021 10:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5u-0006cp-8j; Fri, 22 Oct 2021 10:48:14 +0000
Received: by outflank-mailman (input) for mailman id 214950;
 Fri, 22 Oct 2021 10:48:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds5r-00063m-SC
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dd4d950-1f2d-4743-9f3c-a27dcd40da0c;
 Fri, 22 Oct 2021 10:48:05 +0000 (UTC)
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
X-Inumbo-ID: 3dd4d950-1f2d-4743-9f3c-a27dcd40da0c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vWYcScFFcIQEVZP3kMCIm4XAsFx3uk4EAC/JiEqA390=;
  b=QGkYz30joJGyvg1l0BRFy0aI79YAFLix6L+giFTfhjG3RHjt2er4r8lc
   kMkgOQ/mjO5PxQFvzvXzT9djVIHme611uBuF1XlmWosPJHkXVE/AWaC0E
   +Ml8ku+hGiI4RdNP4b+XkwhXmKXnAzbK8a6WLBXX7blO6AuLvAGu7Sxe5
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MPfO+Wji9x93Dsji5f9qlta4Pv88cGaAAS+EM5FZXGK2iKhRqVvC1tjrQlIDzCZdwt7rEWuha8
 VLZjVNlhz8R9lxhIlP6hHMcQJWAfBqjVG2H9qc2JXm6WuYzCPXoZ0jBkItPp6PdnRysJNaRXIO
 uY8+KsuQEhQXBzQZESCDFsSqNqoIy/1pRSXZL/wYAba0H/zII1tu7UlSxr8p4sG6I0MOg1dGEK
 DLweIuVPdpwxyXssPDPNpBtpQ/44BpyDpVSMysQjUwytKkZ79TYHXEatLB+dulc5XFifIfMm4M
 6dfINCFFVd7YQzDPDREwpuse
X-SBRS: 5.1
X-MesageID: 57733154
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kdxOaavWtra2khdHMvlh0CH/wufnVNFZMUV32f8akzHdYApBsoF/q
 tZmKTqDO63fMGb2co91aoS//UNXvJDVmNBnSQs4pCBmEn8S+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqayOEAhyMob2ydssdABXUGZXZaJ09+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DOIIZ/HVh0BnSDOo8QICFSKLPjTNd9Gpv2ZsVRKuCD
 yYfQStpchjbYDJGAH1NIqMEpfjyiEi4bwQN/Tp5ooJoujOOnWSdyoPFDt3RfdCbQNRPqWyRr
 GnG4mfRDwkTMZqUzj/t2nGrgPXGkWXkWYYRPLqi//VujRuYwWl7IB8LUVq2p9Gph0j4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTTM0c1IKuNXImtAMvzXWQZUkOfa6vNKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6IBjz9v2uVcKbgPtbysQGKsp6sOa7AFgHZ1
 EXojfRy+wzn4XulryeKXPkWVI+g4/KIIVUwanY+QsF/qVxBF5OlFL28AQ2Sxm81ba7omhezO
 Sc/XD+9ArcJYBNGiocsO+qM5zwCl/SIKDgcfqm8giBySpZwbhSb2ypleFSd2Wvg+GB1z/pja
 cvCLpb0VitLYUiC8NZQb71BuVPM7ntmrV4/uLihl0j3uVZgTC79pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WlChQ7BbU7dAhQRVBiXMieg5UOKoarf1o3cEl8WqS56e5wJORYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQOq+BMgl9StmZXBE0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 u3yzB7fTLoCWx9mUJTcZsWwwg7jpnMagu9zARfFe4EBZEX2/YF2ACXtlftrcdoUIBDOy2LCh
 QabCBsVv8fXpIox/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egMlqPyKvwKmlpOorFQKbczwPJs/cbrqp9b0h9gQCfBYWO0B+4yOXKBx8RO6PFAn+cLpQusV
 0uT0dBGIrHVatj9GVscKQd5POSO0fYYxmvb4fgveRio4SZ2+PyMUFlIPgnKgytYdeMnPIQgy
 OYnmcgX9w3g1UZ6bofY1nhZpzaWM3gNc6Q7rZVLUobkhz0ixkxGfZGBWDT954uCaokUP0QnS
 tNOaHEuW1iIKpL+TkcO
IronPort-HdrOrdr: A9a23:bcAep6sMtuPLYcOQ20HBTbLS7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="57733154"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 4/7] arm: Switch to byteswap.h
Date: Fri, 22 Oct 2021 10:47:25 +0000
Message-ID: <306bc005bc3786fcbccc0a0aca3c7b22e50d8c67.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to use byteswap.h to swap bytes.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/arm/alternative.c          | 2 +-
 xen/arch/arm/arm64/livepatch.c      | 2 +-
 xen/arch/arm/kernel.c               | 2 +-
 xen/arch/arm/vgic/vgic-mmio.c       | 2 +-
 xen/include/asm-arm/arm32/io.h      | 2 +-
 xen/include/asm-arm/arm64/io.h      | 2 +-
 xen/include/xen/libfdt/libfdt_env.h | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 237c4e5642..0f84260ac9 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -17,6 +17,7 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/byteswap.h>
 #include <xen/init.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
@@ -27,7 +28,6 @@
 #include <xen/virtual_region.h>
 #include <asm/alternative.h>
 #include <asm/atomic.h>
-#include <asm/byteorder.h>
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 #include <asm/page.h>
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index 6ec8dc60f0..26b5729edf 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -3,6 +3,7 @@
  */
 
 #include <xen/bitops.h>
+#include <xen/byteswap.h>
 #include <xen/errno.h>
 #include <xen/lib.h>
 #include <xen/livepatch_elf.h>
@@ -11,7 +12,6 @@
 #include <xen/vmap.h>
 
 #include <asm/bitops.h>
-#include <asm/byteorder.h>
 #include <asm/insn.h>
 #include <asm/livepatch.h>
 
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 8f43caa186..e89bb9cef8 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -3,6 +3,7 @@
  *
  * Copyright (C) 2011 Citrix Systems, Inc.
  */
+#include <xen/byteswap.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
@@ -14,7 +15,6 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
-#include <asm/byteorder.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
 
diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
index 5d935a7301..d9c5066246 100644
--- a/xen/arch/arm/vgic/vgic-mmio.c
+++ b/xen/arch/arm/vgic/vgic-mmio.c
@@ -13,10 +13,10 @@
  */
 
 #include <xen/bitops.h>
+#include <xen/byteswap.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <asm/new_vgic.h>
-#include <asm/byteorder.h>
 
 #include "vgic.h"
 #include "vgic-mmio.h"
diff --git a/xen/include/asm-arm/arm32/io.h b/xen/include/asm-arm/arm32/io.h
index 73a879e9fb..df8547403c 100644
--- a/xen/include/asm-arm/arm32/io.h
+++ b/xen/include/asm-arm/arm32/io.h
@@ -21,8 +21,8 @@
 #ifndef _ARM_ARM32_IO_H
 #define _ARM_ARM32_IO_H
 
+#include <xen/byteswap.h>
 #include <asm/system.h>
-#include <asm/byteorder.h>
 
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
diff --git a/xen/include/asm-arm/arm64/io.h b/xen/include/asm-arm/arm64/io.h
index 30bfc78d9e..db328d9e3c 100644
--- a/xen/include/asm-arm/arm64/io.h
+++ b/xen/include/asm-arm/arm64/io.h
@@ -20,8 +20,8 @@
 #ifndef _ARM_ARM64_IO_H
 #define _ARM_ARM64_IO_H
 
+#include <xen/byteswap.h>
 #include <asm/system.h>
-#include <asm/byteorder.h>
 #include <asm/alternative.h>
 
 /*
diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
index 035bf754d2..f8ea1ea07a 100644
--- a/xen/include/xen/libfdt/libfdt_env.h
+++ b/xen/include/xen/libfdt/libfdt_env.h
@@ -1,9 +1,9 @@
 #ifndef _LIBFDT_ENV_H
 #define _LIBFDT_ENV_H
 
+#include <xen/byteswap.h>
 #include <xen/types.h>
 #include <xen/string.h>
-#include <asm/byteorder.h>
 
 typedef uint16_t fdt16_t;
 typedef uint32_t fdt32_t;
-- 
2.27.0


