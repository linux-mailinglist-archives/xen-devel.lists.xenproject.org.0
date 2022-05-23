Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894653116C
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335917.560132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P2-0004kx-4T; Mon, 23 May 2022 14:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335917.560132; Mon, 23 May 2022 14:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9P1-0004bG-Sw; Mon, 23 May 2022 14:51:23 +0000
Received: by outflank-mailman (input) for mailman id 335917;
 Mon, 23 May 2022 14:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt9P0-0004UL-29
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:51:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd6b1d2c-daa7-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 16:51:20 +0200 (CEST)
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
X-Inumbo-ID: cd6b1d2c-daa7-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653317480;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xDBs1qvtAAesTvfkL22O/NufwMBzfR3Q3oNmyxwcExk=;
  b=UVQpQwynsMAJv9ke8E5L4YEDGUuOSn1LqZH/VkgA/r7XH+BqRP1IDtSv
   HJaoFAZQhpCGkvoSKXQ7YI2CJZa+RittcA1wPxGbjfuAMaedPj0GIFXQU
   AP6nhtkgwIsiqdsI56Fn/fGoe9NnH4lO6tOGpZK/qFZi4Pk0St9KNDsno
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72354466
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AFcgL6uZnqFwQTjLo6xaRkJNDufnVMFeMUV32f8akzHdYApBsoF/q
 tZmKTqAOfnYYmr9fYtybom19klVsJGGmoA3TgA4+CxhE3lE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X4
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8ibvXgg8okDSNnCjglEbV22LvMLkKw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllkzDefCfc7aZvCX7/L9ZlT2zJYasVmQqyFO
 pZFN2QHgBLoUUxDNUwPFbQFouKW3H2ubRhyjwq2uv9ii4TU5FMoi+W8WDbPQfSRXtlclEuco
 mPA/kz6DwscOdjZziCKmlqvgenVlC+9R4MWF5W/7PdhhFDVzWsWYDUoUl+8rei8m1SJcdtVI
 EwJ+QIjtaE3skesS7HVQBmQsHOC+BkGVLJ4EfA+6QyL4rrZ5UCeHGdsZjRMcsA8vck6Azkjz
 EaUnsjBDCZq9raSTBq1+riYoDyoMAAJPGQCYmkCVgJD7N79yKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarT1VzfmDetupjhRxY4/BnKRXmi6h5lZYmjfMqj7l2zxfRKIZudT1KBl
 GMZgMXY5+cLZbmMiy6lUOgLBKuu5fuOLHvbm1EHInU6323zoTj5J9kWuWwgYhcyWioZRdP3S
 ESD4S9KyqYNBkSzdPRbe7KRD88l96e1QLwJScvogspyjolZLVHap3s1NR7LhQgBg2B3z/hhZ
 M7zndKESC9DVP85lGfeq/I1i+dD+8wo+Y/EqXkXJTyD2KHWWnOaQKxt3LCmPrFgt/PsTOk4H
 r9i2yq2J/Z3CrSWjtH/q9J7ELzzBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4JdE+xfgJyr6Sp
 ijtMqO99LYYrSSaQThml1g5MO+/NXqBhSxT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYtJ
 8Tpj/6oW6wVIhyeomx1RcCk/ORKKUXw7SrTbnXNXdTKV8M5L+A/0oS8LlWHGehnJnffiPbSV
 JX5iVqLEMJeGl04ZCsUAdr2p26MUbEmsLoadyP1zhN7IS0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:dXNYoap33mr80oql5D7tcYQaV5oleYIsimQD101hICG8cqSj9v
 xG+85rsyMc6QxhP03I9urwW5VoLUmyyXcX2/h0AV7BZniFhILAFugLhuGOrwEIcxeOj9K1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="72354466"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, George Dunlap <george.dunlap@citrix.com>,
	"Ian Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v5 0/6]  Implement byteswap and update references
Date: Mon, 23 May 2022 10:50:45 -0400
Message-ID: <cover.1653314499.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


Lin Liu (6):
  xen: implement byteswap
  crypto/vmac: Simplify code with byteswap
  arm64/find_next_bit: Remove ext2_swab()
  xen: Switch to byteswap
  tools: Use new byteswap helper
  byteorder: Remove byteorder

 .../libs/guest/xg_dom_decompress_unsafe_xz.c  |   5 +
 .../guest/xg_dom_decompress_unsafe_zstd.c     |   3 +-
 xen/arch/arm/arm64/lib/find_next_bit.c        |  36 +---
 xen/arch/arm/include/asm/byteorder.h          |   6 +-
 xen/arch/x86/include/asm/byteorder.h          |  34 +---
 xen/common/device_tree.c                      |  44 ++---
 xen/common/libelf/libelf-private.h            |   6 +-
 xen/common/xz/private.h                       |   2 +-
 xen/crypto/vmac.c                             |  76 +-------
 xen/include/xen/byteorder.h                   |  56 ++++++
 xen/include/xen/byteorder/big_endian.h        | 102 ----------
 xen/include/xen/byteorder/generic.h           |  68 -------
 xen/include/xen/byteorder/little_endian.h     | 102 ----------
 xen/include/xen/byteorder/swab.h              | 183 ------------------
 xen/include/xen/byteswap.h                    |  52 +++++
 xen/include/xen/compiler.h                    |  20 ++
 xen/include/xen/unaligned.h                   |  12 +-
 17 files changed, 184 insertions(+), 623 deletions(-)
 create mode 100644 xen/include/xen/byteorder.h
 delete mode 100644 xen/include/xen/byteorder/big_endian.h
 delete mode 100644 xen/include/xen/byteorder/generic.h
 delete mode 100644 xen/include/xen/byteorder/little_endian.h
 delete mode 100644 xen/include/xen/byteorder/swab.h
 create mode 100644 xen/include/xen/byteswap.h

-- 
2.27.0


