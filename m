Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A53CD616
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 15:49:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158450.291692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Tdh-0007fS-GW; Mon, 19 Jul 2021 13:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158450.291692; Mon, 19 Jul 2021 13:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Tdh-0007cK-Dd; Mon, 19 Jul 2021 13:48:57 +0000
Received: by outflank-mailman (input) for mailman id 158450;
 Mon, 19 Jul 2021 13:48:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5c2=ML=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m5Tdf-0007cE-Oa
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 13:48:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6396e1b-3040-4cd6-89cb-d0f3fd5f4ded;
 Mon, 19 Jul 2021 13:48:54 +0000 (UTC)
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
X-Inumbo-ID: f6396e1b-3040-4cd6-89cb-d0f3fd5f4ded
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626702534;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2ILi7f2cMhEw88TFDhsdBbDM/yhwLtdvxJpavSdVB34=;
  b=Ocer3iSIIQjhwmzmUK7QYqvSYVCYMUNtCOMM2XgfdVAW/+MpPjsKOGQW
   CEamXS30HA9WRHSe6maX2x+7aYG4OKR8CQ+eNEWDLgk6inrPbo435ku4C
   agxNeF9nkg2xDo55RV6e9OYzsRz6eK/bkCnRjlRKoJJeLuj5y7ofHEeCN
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5YxjKIIjwEH4Fl14jFegKNIk1DCXPUBiYzXznmFUPfyEFUhvZ4PvnvvBK8Hk9S4fH5sCylRLUf
 3exRDCZECKDQnVn4j7lefjgA1YnLMmWVPgRXQE8AZIHw0AsLvZH9TpuyEBW0SSb0MBeK4Pm3kx
 INNsLQFBPdreZohM0eKlWGkqD8wbMNoC9x/ot7s8E5c1DxEHGsg+i2v8uc1DGZSrpWNEHPIq9R
 /fHdyJ/9RdV3LwbJsNgpw9jeoe2rm2vN6bFnJf5tMKrSrW7CBvI6BURLFOmfeIfzhNk01mz0l4
 7ZnWRb7IqdXBeFsgwNphckkM
X-SBRS: 5.1
X-MesageID: 50225147
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:CSNKu6MtJ/39D8BcTs2jsMiBIKoaSvp037Eqv3oedfUzSL39qy
 nOpoV86faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSircKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.84,252,1620705600"; 
   d="scan'208";a="50225147"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file if exist and update OVMF
Date: Mon, 19 Jul 2021 14:48:45 +0100
Message-ID: <20210719134845.681725-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A platform introduced in EDK II named OvmfXen is now the one to use for
Xen instead of OvmfX64. It comes with PVH support.

Also, the Xen support in OvmfX64 is deprecated,
    "deprecation notice: *dynamic* multi-VMM (QEMU vs. Xen) support in OvmfPkg"
    https://edk2.groups.io/g/devel/message/75498
and has been removed upstream.

We need to also update to a newer version of OVMF as OvmfXen in the
release "edk2-stable202105" doesn't work well with Xen, so we need the
fix b37cfdd28071 ("OvmfPkg/XenPlatformPei: Relocate shared_info page
mapping").

Also, don't set anymore the number of thread for parallel build when
building the newer platform, OvmfPkg/build.sh is now doing parallel
build by default.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
https://xenbits.xen.org/git-http/ovmf.git master branch as been
update.

I've runned a flight on osstest with this change:
    http://logs.test-lab.xenproject.org/osstest/logs/163715/
---
 Config.mk                    |  2 +-
 tools/firmware/ovmf-makefile | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/Config.mk b/Config.mk
index f9dce4549b7c..4d723eec1d0d 100644
--- a/Config.mk
+++ b/Config.mk
@@ -244,7 +244,7 @@ QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
 SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
-OVMF_UPSTREAM_REVISION ?= e1999b264f1f9d7230edf2448f757c73da567832
+OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
 
diff --git a/tools/firmware/ovmf-makefile b/tools/firmware/ovmf-makefile
index 55f999214545..1f619a518993 100644
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
+	  OvmfPkg/build.sh -a X64 -b $(TARGET) -p OvmfPkg/OvmfXen.dsc; \
+	  cp Build/OvmfXen/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
+	else \
+	  OvmfPkg/build.sh -a X64 -b $(TARGET) -n 4; \
+	  cp Build/OvmfX64/$(TARGET)_GCC*/FV/OVMF.fd ovmf.bin; \
+	fi
 
 .PHONY: clean
 clean:
-- 
Anthony PERARD


