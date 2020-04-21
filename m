Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF71B2BFC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVa-0005Ph-E0; Tue, 21 Apr 2020 16:12:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVY-0005Pc-L5
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:24 +0000
X-Inumbo-ID: e1ed0329-83ea-11ea-9160-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1ed0329-83ea-11ea-9160-12813bfff9fa;
 Tue, 21 Apr 2020 16:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jPOuSn9Ufevxvq1zCWh1f+c0TEZ2OwuaVLSgw7emdXc=;
 b=NmbqwTumiISP1mx4ONvdp0V40EsB7EK1sAMSGBjefaaAa5qybVp7Gyhc
 kK2fVauUHiRBr5u736Q/c59dph/3rHQcWcYXOVNWknAITjFTqTqoTqIo4
 jM1tf4W7//ILHfk5e5PvMoTT+dRok18iWyEfXtyQ3uyrMob94K7sEjUKa A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TrZj9YlMdTDuYDUspGI9xkAsdT55vuX430lEeRu5OxUvg0wzUvukPFY3A76MknI5DdwIne9per
 4/XeZztL9zxLftqN5g4Ae8ur43SctjqaEtLzBi7WtfP2LXWnk/reu+c0GzKLVtbOnhITe51+kt
 6DDKBObc6FPt4MiePseMV4yL2phlqdG8UGNo6YiXp1exj911CYMBgrqU92rht7NFJU7WiookdE
 ozFKHXv/EgtJUSGVoSLy0a8w6SZjn187T3KxnmLneHhZ2HtwTIULvdELiPtEy9Ot0WO3E3IOxf
 8AA=
X-SBRS: 2.7
X-MesageID: 16028573
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16028573"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 00/16] xen: Build system improvements
Date: Tue, 21 Apr 2020 17:11:52 +0100
Message-ID: <20200421161208.2429539-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Wei
 Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim
 Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v5

v5:
- few changes detailed in patch notes.
- 1 new patch

v4:
- some patch already applied.
- Have added patches from "xen/arm: Configure early printk via Kconfig" series.
- Some new patch to add documentation or fix issues, and patch to improve
  compat header generation.
Other changes are detailed in patches.

v3:
- new patches that do some cleanup or fix issues
- have rework most patches, to have better commit message or change the coding
  style, or fix issues that I've seen. There were some cases where CFLAGS were
  missing.
  See patch notes for details
- introduce if_changed*. That plenty of new patches on top of what we had in v2.
  (those changes ignore CONFIG_LTO=y, I'll see about fixing that later)

(There is more to come in order to use fixdep from Linux, but that's not ready)

Hi,

I have work toward building Xen (the hypervisor) with Linux's build system,
Kbuild.

The main reason for that is to be able to have out-of-tree build. It's annoying
when a build fail because of the pvshim. Other benefit is a much faster
rebuild, and `make clean` doesn't take ages, and better dependencies to figure
out what needs to be rebuild.

So, we are not there yet, but the series already contain quite a few
improvement and cleanup. More patches are going to be added to the series.

Cheers,

Anthony PERARD (16):
  build,xsm: Fix multiple call
  xen/build: include include/config/auto.conf in main Makefile
  xen/build: use new $(c_flags) and $(a_flags) instead of $(CFLAGS)
  xen/build: have the root Makefile generates the CFLAGS
  build: Introduce documentation for xen Makefiles
  xen/build: introduce if_changed and if_changed_rule
  xen/build: Start using if_changed
  build: Introduce $(cpp_flags)
  xen/build: use if_changed on built_in.o
  xen/build: Use if_changed_rules with %.o:%.c targets
  xen/build: factorise generation of the linker scripts
  xen/build: Use if_changed for prelink*.o
  xen,symbols: rework file symbols selection
  build: use if_changed to build mm/*/guest_%.o
  build,include: rework compat-build-source.py
  build,include: rework compat-build-header.py

 .gitignore                            |   1 +
 docs/misc/xen-makefiles/makefiles.rst | 185 ++++++++++++++++++++
 xen/Makefile                          | 212 ++++++++++++++++++++---
 xen/Rules.mk                          | 235 ++++++++++++++++----------
 xen/arch/arm/Makefile                 |  22 +--
 xen/arch/arm/Rules.mk                 |  23 ---
 xen/arch/arm/{Rules.mk => arch.mk}    |   5 -
 xen/arch/arm/efi/Makefile             |   2 +-
 xen/arch/x86/Makefile                 |  41 ++---
 xen/arch/x86/Rules.mk                 |  91 +---------
 xen/arch/x86/{Rules.mk => arch.mk}    |  17 +-
 xen/arch/x86/efi/Makefile             |   9 +-
 xen/arch/x86/mm/Makefile              |  14 +-
 xen/arch/x86/mm/hap/Makefile          |  15 +-
 xen/arch/x86/mm/shadow/Makefile       |  14 +-
 xen/common/libelf/Makefile            |  14 +-
 xen/common/libfdt/Makefile            |  13 +-
 xen/include/Makefile                  |  16 +-
 xen/scripts/Kbuild.include            | 107 ++++++++++++
 xen/tools/compat-build-header.py      |  52 +++++-
 xen/tools/compat-build-source.py      |   8 +-
 xen/tools/symbols.c                   |  20 ++-
 xen/xsm/flask/Makefile                |  19 ++-
 xen/xsm/flask/ss/Makefile             |   2 +-
 24 files changed, 809 insertions(+), 328 deletions(-)
 create mode 100644 docs/misc/xen-makefiles/makefiles.rst
 copy xen/arch/arm/{Rules.mk => arch.mk} (85%)
 copy xen/arch/x86/{Rules.mk => arch.mk} (87%)

-- 
Anthony PERARD


