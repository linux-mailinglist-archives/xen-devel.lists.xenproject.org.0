Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6319409D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 14:59:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHT0E-0005zj-Ul; Thu, 26 Mar 2020 13:56:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKeT=5L=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jHT0D-0005za-77
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 13:56:57 +0000
X-Inumbo-ID: a78d3f80-6f69-11ea-87ed-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a78d3f80-6f69-11ea-87ed-12813bfff9fa;
 Thu, 26 Mar 2020 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585231016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+d/kMZGaT+rnc6Btm1R311vezXfsyqvDgmhJ6f4woN0=;
 b=Tt3jzhi+OlFgjbeh+R9nM4uCWVS4q2753Z6TyA1LkPuNVgdtOrsx8vvW
 7etd6aywCnDPfh7jejjC7qQSGveUTkfu/4skEYmC8ergyFySz2VeoDHfL
 IKfKCVlnUvXzWSKmzCBu5Xu/PDF3StepqYLwnmqxC/871fJlVkrCyrk4V w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zVYcbjpDyi7TJTfNwM3l/6DPXt8ZjhWR90luU7wi3EIDTHSitNWYUKbsIQ2Fjjpp+5c+Ss88dl
 GGQrN6lqKXZ2f1CR8BxDuChdXbHioO9jtGr7G0FRHPiNXXWk2fnfUuHFpmB1zsOaVQBffY3e4o
 j9tPtxZgNCh8SsEJOEVjk24PbduuroDlnK77543MyhqBUwZbfYtvMU+lmIWiS/EvT08E0/xZFi
 iVbKynpaxVRtOV1rKuI8LWM4GelYzR8ONzSBf7pKRLRhcLy+y4nsYqMzRKsYAqQd0di3CkI7Uw
 Gsg=
X-SBRS: 2.7
X-MesageID: 15338337
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15338337"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Mar 2020 13:56:21 +0000
Message-ID: <20200326135621.687685-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [Xen-devel] [XEN PATCH] build: detect compiler upgrade to rerun
 kconfig
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This simple comment allows to detect when $(CC) changes version.
Kconfig will be rerun in this case. (Rerun is forced by
include/config.auto.cmd which detects changes of CC_VERSION_TEXT
value).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Kconfig  | 2 ++
 xen/Makefile | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index 073042f46730..4ffa2f90a267 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -4,6 +4,8 @@
 #
 mainmenu "Xen/$(SRCARCH) $(XEN_FULLVERSION) Configuration"
 
+comment "Compiler: $(CC_VERSION_TEXT)"
+
 source "scripts/Kconfig.include"
 
 config BROKEN
diff --git a/xen/Makefile b/xen/Makefile
index e5f7b1ae13bc..6dadb3afc119 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -277,6 +277,10 @@ $(foreach base,arch/x86/mm/guest_walk_% \
                arch/x86/mm/shadow/guest_%, \
     $(foreach ext,o i s,$(call build-intermediate,$(base).$(ext))))
 
+# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
+# and from include/config/auto.conf.cmd to detect the compiler upgrade.
+export CC_VERSION_TEXT := $(shell $(CC) --version 2>/dev/null | head -n 1)
+
 kconfig := oldconfig config menuconfig defconfig allyesconfig allnoconfig \
 	nconfig xconfig gconfig savedefconfig listnewconfig olddefconfig \
 	randconfig $(notdir $(wildcard arch/$(SRCARCH)/configs/*_defconfig))
-- 
Anthony PERARD


