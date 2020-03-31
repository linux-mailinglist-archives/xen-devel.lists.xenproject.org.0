Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B8199378
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEBQ-0001CO-MZ; Tue, 31 Mar 2020 10:31:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEBO-0001BM-VE
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:31:46 +0000
X-Inumbo-ID: d18d3626-733a-11ea-ba0c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d18d3626-733a-11ea-ba0c-12813bfff9fa;
 Tue, 31 Mar 2020 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585650705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PzfxNzVwmOzaR6a+TdZN4qpNam2YDFaN7HV2YGm8sZ4=;
 b=PayT/2mRZ2PRu4CR1xz/kIZt4ZEoLIEbnYV3lNpx0AYqlz5WWlfKHJUl
 Dv/vgz3/og3F+7H1kpga8HQdVnerQYwZvuB1IKl4vx4OLpXuovPfg36N0
 3uvACj7K1MIdfIezTafQL2qdMqluMZ1pHOQGXyHULHpQTTBqTay8ChZMq g=;
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
IronPort-SDR: 7Z8fIeGk5Ycg1vax49E8R/GD2X7gjtWf9d/UWn67HdwWvMHu13NFDbrWR1vENEkTBmqVwYPFE2
 Q6YHL1KqDLqek20X7+mM795OEnVduZSiJIt4lqT1BE9RX0990gNybcoEbXKxp8s0hnc44n5+fo
 6ocrhQ6ww2KBQeUja0vWdhI+M3HAXEperSnjJw0F1KVY/VBzGujkZ7CZUlFv4ZVSvqlw/qM7Fi
 yZe29CLdBz+hoZA3t49+aeSnKpwt6auzb3xglEhgEs+Q4xKoNtePaIne+/CKx8CYTfpfQLwWK3
 Ul8=
X-SBRS: 2.7
X-MesageID: 15575929
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15575929"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 00/18] xen: Build system improvements
Date: Tue, 31 Mar 2020 11:30:44 +0100
Message-ID: <20200331103102.1105674-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v4

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

v2.1:
- some fixes

v2:
Rather than taking Kbuild and making it work with Xen, the v2 takes the opposite
approach of slowly transforming our current build system into Kbuild. That have
the advantage of keeping all the feature we have and making the patches much
easier to review. Kconfig update is done in an other patch series.

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

Anthony PERARD (18):
  xen/arm: Rename all early printk macro
  xen/arm: Configure early printk via Kconfig
  build,arm: Fix deps check of head.o
  xen/build: include include/config/auto.conf in main Makefile
  xen/build: use new $(c_flags) and $(a_flags) instead of $(CFLAGS)
  xen/build: have the root Makefile generates the CFLAGS
  build: Introduce documentation for xen Makefiles
  xen/build: introduce if_changed and if_changed_rule
  xen/build: Start using if_changed
  xen/build: use if_changed on built_in.o
  xen/build: Use if_changed_rules with %.o:%.c targets
  xen/build: factorise generation of the linker scripts
  xen/build: Use if_changed for prelink*.o
  xen,symbols: rework file symbols selection
  xen/build: use if_changed to build guest_%.o
  build,xsm: Fix multiple call
  build,include: rework compat-build-source.py
  build,include: rework compat-build-header.py

 .gitignore                                    |   1 +
 docs/misc/arm/early-printk.txt                |  71 ++---
 docs/misc/xen-makefiles/makefiles.rst         | 186 +++++++++++
 xen/Kconfig.debug                             |   2 +
 xen/Makefile                                  | 209 +++++++++++--
 xen/Rules.mk                                  | 235 ++++++++------
 xen/arch/arm/Kconfig.debug                    | 289 ++++++++++++++++++
 xen/arch/arm/Makefile                         |  27 +-
 xen/arch/arm/Rules.mk                         |  93 ------
 xen/arch/arm/{Rules.mk => arch.mk}            |  79 +----
 xen/arch/arm/arm32/Makefile                   |   2 +-
 xen/arch/arm/arm32/debug-8250.inc             |   2 +-
 xen/arch/arm/arm32/debug-pl011.inc            |   4 +-
 xen/arch/arm/arm32/debug-scif.inc             |   4 +-
 xen/arch/arm/arm32/debug.S                    |   4 +-
 xen/arch/arm/arm32/head.S                     |  10 +-
 xen/arch/arm/arm64/Makefile                   |   2 +-
 xen/arch/arm/arm64/debug-8250.inc             |   4 +-
 xen/arch/arm/arm64/debug-pl011.inc            |   4 +-
 xen/arch/arm/arm64/debug.S                    |   4 +-
 xen/arch/arm/arm64/head.S                     |  10 +-
 xen/arch/arm/efi/Makefile                     |   2 +-
 .../minios.cfg => xen/arch/x86/Kconfig.debug  |   0
 xen/arch/x86/Makefile                         |  41 +--
 xen/arch/x86/Rules.mk                         |  91 +-----
 xen/arch/x86/{Rules.mk => arch.mk}            |  17 +-
 xen/arch/x86/efi/Makefile                     |   9 +-
 xen/arch/x86/mm/Makefile                      |  14 +-
 xen/arch/x86/mm/hap/Makefile                  |  15 +-
 xen/arch/x86/mm/shadow/Makefile               |  14 +-
 xen/common/libelf/Makefile                    |  14 +-
 xen/common/libfdt/Makefile                    |  13 +-
 xen/include/Makefile                          |  24 +-
 xen/include/asm-arm/early_printk.h            |   2 +-
 xen/scripts/Kbuild.include                    | 112 +++++++
 xen/tools/compat-build-header.py              |  36 ++-
 xen/tools/compat-build-source.py              |   8 +-
 xen/tools/symbols.c                           |  20 +-
 xen/xsm/flask/Makefile                        |  19 +-
 xen/xsm/flask/ss/Makefile                     |   2 +-
 40 files changed, 1145 insertions(+), 550 deletions(-)
 create mode 100644 docs/misc/xen-makefiles/makefiles.rst
 create mode 100644 xen/arch/arm/Kconfig.debug
 copy xen/arch/arm/{Rules.mk => arch.mk} (15%)
 copy stubdom/c/minios.cfg => xen/arch/x86/Kconfig.debug (100%)
 copy xen/arch/x86/{Rules.mk => arch.mk} (87%)

-- 
Anthony PERARD


