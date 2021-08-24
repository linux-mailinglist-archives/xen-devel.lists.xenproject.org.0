Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D03F5C66
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170914.311985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1g-0004vi-2Z; Tue, 24 Aug 2021 10:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170914.311985; Tue, 24 Aug 2021 10:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1f-0004pB-SF; Tue, 24 Aug 2021 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 170914;
 Tue, 24 Aug 2021 10:51:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1d-0003Ux-94
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:25 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 361a20b0-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:19 +0000 (UTC)
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
X-Inumbo-ID: 361a20b0-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0CY45XrUU2T0e2Vp/z8jyA8usgILrp2Rsr6xmzfEv6A=;
  b=ISha4QLBoO6lqYEdFy/7A1FwCzbsZNizvFbITpTSYi7kgNcTsZMMkrqP
   vfWn6e8PSuVG4LAzfK0UC0hxaq5Oly6XwoQW7GBczWIfAB5z4zFMfJtLQ
   bKp8w0Ue/QvH4f8LDmbCM3YrKi3SCpk7ClG/IaSbJqEO0gD9Te391eQws
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pFsjp1tOBwai6Z9SHPUnMOK5s8wm+7L0DeAix7HOrAEf3eT6O2aP/owMMthgNeJck/78FqlKFe
 gRGdIYMUwWkltEOzKojqr6pnkJ289wF2pBMA6e4riD9CX7uWk805bHRXgfQ5mPnnjIUqRKeCC/
 2vNmkm77MYWqtC/+qGreKYF30T9FzNxfiC8Uq/Bgsd0ERzLY0FEZS5asbV3OrXhnyKthCVS2yo
 fiqEUUMyuLuaiVocNa6aQH1rGxtbx4rV4yG5sB5KKBjPnFGsaYFZAQRXiGh9VL+kmqxr0u04VC
 8IW0SzcFw739QEqgoBC5TS6A
X-SBRS: 5.1
X-MesageID: 51130735
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EVYY16nwshRySrV/UBoem+BoE8vpDfOeimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WBjB8bZYOCGghrlEGgG1+ffKlLbakrDH4JmtJ
 uINpIOcOEYbmIKwvoSgjPIderIqePvmM/HuQ6d9QYVcegAUdAD0+4NMHf+LqQAfngiOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYqYLSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzRPBky/JlaQkEuDzYIbiJaIfy+AzdZ9vfr2rCpe
 O84SvI+f4DrU85MFvF+CcFkDOQrQrGo0WStWNwx0GT7/ARDQhKdPZplMZXdADU5FEnu8w52K
 VX33iBv54SFh/Ymj/hjuK4Hy2COXDE0kbKvNRj+UC3a7FuIYO5bLZvjn99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8PC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8e166MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBkPkoLVeLmzNbhwg13wqUmGLEXQI/Bllu1EU+fHNcTW2AW4OSATr/c=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51130735"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [XEN PATCH v7 15/51] build,riscv: tell the build system about riscv64/head.S
Date: Tue, 24 Aug 2021 11:50:02 +0100
Message-ID: <20210824105038.1257926-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This allows to `make arch/riscv/riscv64/head.o`.

Example of rune on a fresh copy of the repository:
    make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- KBUILD_DEFCONFIG=tiny64_defconfig arch/riscv/riscv64/head.o

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Bob Eshleman <bobbyeshleman@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Connor Davis <connojdavis@gmail.com>
---
 xen/arch/riscv/riscv64/Makefile | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 xen/arch/riscv/riscv64/Makefile

diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
new file mode 100644
index 000000000000..15a4a65f6615
--- /dev/null
+++ b/xen/arch/riscv/riscv64/Makefile
@@ -0,0 +1 @@
+extra-y += head.o
-- 
Anthony PERARD


