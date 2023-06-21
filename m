Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2894738ADD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552932.863192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0Z9-0000wm-FK; Wed, 21 Jun 2023 16:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552932.863192; Wed, 21 Jun 2023 16:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0Z9-0000tT-CG; Wed, 21 Jun 2023 16:20:19 +0000
Received: by outflank-mailman (input) for mailman id 552932;
 Wed, 21 Jun 2023 16:20:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30K1=CJ=citrix.com=prvs=529504c83=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qC0Z7-0000tN-SZ
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:20:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fd7d6ea-104f-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:20:14 +0200 (CEST)
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
X-Inumbo-ID: 7fd7d6ea-104f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687364414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gb48MUKG+E+eor+Y9T0107+AbYui+pKfJlvFsRozBlw=;
  b=a/iu2aBYUubJjdWB5iU4lv8o/t7VpnUQC4J14Z0A65BazeccWf3LMjfY
   hY+i04+Dtg8SJvPGtyestnCHif+0thUCMfA8dT7vTbTkbQrMju66kiVYz
   PCN32KCHIBqrWkP+5rqp9qPIuuN3VlqZ04SZe8BiEKQ6Nc4VVeF4eN1sk
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112386257
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:YRusZqAFMWTFIRVW/xbjw5YqxClBgxIJ4kV8jS/XYbTApD5x1WZVx
 2YeWD+DM/eNZzfyc9lwYYW+8EgFupWGm9RiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1C5wRiDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2bt4Hm5i/
 NUkMiEcNw+ip8S276K2Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XQHpULxBvHz
 o7A12vdDhMcEo2f8BqA8W+i27TJzBngV51HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtxgQQctNEMU17QiMzuzf5APxLmoOQyNFadcmnNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LD6qdntDzXzbqz
 Fi3QDMW3utJy5RRjuPioA6B2mj3znTUcuIrziaKUX2qwgpQWJS0dtW3yHj97dlQIZnMGzFto
 0M4d9iiAPEmVM/dy3bdH7xdRtlF9N7ebmSC3AcH840Jsm30piX9Jd04DCRWfh8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjntZLlXvENlGPxL44owUuBFEfVsDE
 Zmaa92wKn0RFL5qyjG7L89Ej+90nHBgnT6DH8Chp/hC7VZ5TCTPIYrpzXPUNrxphE96iFi9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9rivw/G7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3aNiw8MO+zBs0XQLBSFXVEAGtEEkMLOe6HhJrzvbNtFVX73ISPFcJJc
 sQ=
IronPort-HdrOrdr: A9a23:CyWqda9ic9VO3+SwEJVuk+AKI+orL9Y04lQ7vn2ZKCYlCPBw8v
 rEoB1173HJYVoqNU3I2urhBED4ewK7yXct2/hpAV7AZmjbUQmTXfpfBOLZqlWLJ8SUzIFgPM
 lbH5SWR+eAbmRSvILW7Ay5DNo60LC8gcWVbYC39QYUcejGUdAF0+48MHf9LmRmAA1LH4AwGp
 a/6tovnUvDRUgq
X-Talos-CUID: 9a23:cpD+C2z7MWoQGQvJ9PGWBgU3R886fVHU5UvKMl7hFkdJbr26WVKPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AJo9F+w5c5aw3PGKfxApnzv65xoxnx6isDmZckaw?=
 =?us-ascii?q?mvsqZO3ErPWanlzuoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="112386257"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 1/3] build: define ARCH and SRCARCH later
Date: Wed, 21 Jun 2023 17:19:57 +0100
Message-ID: <20230621161959.1061178-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621161959.1061178-1-anthony.perard@citrix.com>
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Defining ARCH and SRCARCH later in xen/Makefile allows to switch to
immediate evaluation variable type.

ARCH and SRCARCH depends on value defined in Config.mk and aren't used
TARGET_SUBARCH or TARGET_ARCH, and not before it's needed in a
sub-make or a rule.

This will help reduce the number of times the shell rune is been
run.

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

Also, `make -d` shows a lot of these:
    Makefile:39: not recursively expanding SRCARCH to export to shell function
    Makefile:38: not recursively expanding ARCH to export to shell function

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e89fc461fc4b..9631e45cfb9b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -35,12 +35,6 @@ MAKEFLAGS += -rR
 
 EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 
-ARCH=$(XEN_TARGET_ARCH)
-SRCARCH=$(shell echo $(ARCH) | \
-          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-              -e s'/riscv.*/riscv/g')
-export ARCH SRCARCH
-
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
@@ -241,6 +235,13 @@ include scripts/Kbuild.include
 include $(XEN_ROOT)/Config.mk
 
 # Set ARCH/SUBARCH appropriately.
+
+ARCH := $(XEN_TARGET_ARCH)
+SRCARCH := $(shell echo $(ARCH) | \
+          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+              -e s'/riscv.*/riscv/g')
+export ARCH SRCARCH
+
 export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
 export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
                             sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-- 
Anthony PERARD


