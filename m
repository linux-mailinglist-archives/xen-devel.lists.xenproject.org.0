Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0D3B9317
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148785.275082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZZ-0002zZ-2k; Thu, 01 Jul 2021 14:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148785.275082; Thu, 01 Jul 2021 14:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZY-0002rG-HJ; Thu, 01 Jul 2021 14:21:44 +0000
Received: by outflank-mailman (input) for mailman id 148785;
 Thu, 01 Jul 2021 14:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxRb-0005tj-5G
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:13:31 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d4dca46-106a-46ea-9165-196c4265a912;
 Thu, 01 Jul 2021 14:11:54 +0000 (UTC)
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
X-Inumbo-ID: 5d4dca46-106a-46ea-9165-196c4265a912
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6rzhumebECyq+XiEsQEAKIp6M61wPTFJkWWEM129pgo=;
  b=AFGokSHhDEgAP8thXEvGJHRfizIv4LXicz2NLK2MyX95HscgnWKvB1d+
   8xjc4XMjk/c4a+yDhQdaLANMCR8dgs4lQvsVo1ROk+FxV45EtfNyPR7WO
   8jwJdsChaSv9HAH0A2vDe7MHgqfr5Q0C1xbskLI/ldec7eN6lUROWSYjI
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: beZsAYtNPf2SM4Ps0NfM6EpbWKc4iQA7fVx7nNYGwHqBAdQC659W00WQSrlxFzDDBJoY9XD9Ro
 M8ZCP8a3zIeKsPnDGdPX3Wp6aTYC1+DqClpsg0mJdvUIbi/SfZcPcOIeg+UmpyBKKQY0VNK/NL
 +iHo3AVMih1F+amcAVNC5ChIVGBYZYZ6fbD7z/2BI3r5s+fSore5mYyyCAm0Sn4jTD/g7C3inT
 fwZBjnKWlAhcdbp3hs+1h/8JNcAlkbnY6VooLi9CQ31CwnY61U9FppeH1BH/4p+4q96ZAB7Fxc
 mMQ=
X-SBRS: 5.1
X-MesageID: 47376243
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dtuHaKFnMr5sYYKKpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47376243"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [XEN PATCH v6 31/31] build,riscv: tell the build system about riscv64/head.S
Date: Thu, 1 Jul 2021 15:10:11 +0100
Message-ID: <20210701141011.785641-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This allows to `make arch/riscv/riscv64/head.o`.

Example of rune on a fresh copy of the repository:
    make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- KBUILD_DEFCONFIG=tiny64_defconfig arch/riscv/riscv64/head.o

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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


