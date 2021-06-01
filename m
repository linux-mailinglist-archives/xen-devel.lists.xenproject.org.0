Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78326397175
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 12:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134780.250704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo1dM-0000ZG-1r; Tue, 01 Jun 2021 10:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134780.250704; Tue, 01 Jun 2021 10:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo1dL-0000Wb-Ur; Tue, 01 Jun 2021 10:28:27 +0000
Received: by outflank-mailman (input) for mailman id 134780;
 Tue, 01 Jun 2021 10:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqUo=K3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lo1dK-0000WU-Tz
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 10:28:27 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c22c3517-5919-43d2-8038-3e57be83f8f4;
 Tue, 01 Jun 2021 10:28:25 +0000 (UTC)
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
X-Inumbo-ID: c22c3517-5919-43d2-8038-3e57be83f8f4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622543305;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qxOxkpgf3vvxIUnsnqn7ZffiZYbW75rYqnqUF1GTIo4=;
  b=Qv954ht0UIMpq1gsQNbcxrECl8Xn2DdaHSaG0y6+xsfpihulyJBCXR49
   oZ3fv1YAqhl216LERkXmA+/DqJB1btt+0BjYagt8HglsFqaRiFMmujJjE
   5m53NS1ufJpf2uYZvn8EPNdGKA93SJ1Gwa5oQBcIs+57lT1x6X8NFEgGI
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ms+u5OLTjbZmZ2Kr81fTzr2L6em8ROUEGvvBQM2O2ZiyQnOEBPJaTIiIpKXLJ/ZJsQKpoane7p
 0MRSmdBo8LTlybd90QLi6CJjohqewZnWwfguKZ6tNdSVC3caXneNcM9kh4f7Mz7n96sjA/R9h5
 Vkl9P+TofE3x5lnwtatIJEJfAQEag+nXGzejCzXMr9kx99QWVojKZHW8pTJ+ek3Z2kXStiqPxg
 LQhlyFKgHzmNJ9Vs2umBQ9ez+psUEV+sFvC2k6d0uhyiwWJiPcczYmStVCGjUU2T7zLb1Afl4/
 PwU=
X-SBRS: 5.1
X-MesageID: 44770327
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7iypqaD5sj00z7TlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8/
 xG/c5rsyMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnOzfKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.83,239,1616472000"; 
   d="scan'208";a="44770327"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file is exist
Date: Tue, 1 Jun 2021 11:28:03 +0100
Message-ID: <20210601102804.698364-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A platform introduced in EDK II named OvmfXen is now the one to use for
Xen instead of OvmfX64. It comes with PVH support.

Also, the Xen support in OvmfX64 is deprecated,
    "deprecation notice: *dynamic* multi-VMM (QEMU vs. Xen) support in OvmfPkg"
    https://edk2.groups.io/g/devel/message/75498

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

PVH support isn't working at the moment, but that's just a detail :-)
---
 tools/firmware/ovmf-makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/ovmf-makefile b/tools/firmware/ovmf-makefile
index 55f999214545..637ee509c366 100644
--- a/tools/firmware/ovmf-makefile
+++ b/tools/firmware/ovmf-makefile
@@ -17,8 +17,14 @@ all: build
 .PHONY: build
 build:
 	if test -e .git ; then $(GIT) submodule update --init --recursive ; fi
-	OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4
-	cp Build/OvmfX64/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin
+	set -ex; \
+	if test -e OvmfPkg/OvmfXen.dsc; then \
+	  OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4 -p OvmfPkg/OvmfXen.dsc; \
+	  cp Build/OvmfXen/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
+	else \
+	  OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4; \
+	  cp Build/OvmfX64/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
+	fi
 
 .PHONY: clean
 clean:
-- 
Anthony PERARD


