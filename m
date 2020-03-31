Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DAB19938C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 12:35:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEBR-0001Cm-04; Tue, 31 Mar 2020 10:31:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I6p8=5Q=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJEBP-0001BY-4a
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 10:31:47 +0000
X-Inumbo-ID: d09690aa-733a-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d09690aa-733a-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585650703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sNgjHBk2Ub9IV5dX5PmvAFWim3DFw38IPkUQjM0l93c=;
 b=I4Kd1X0uJO2xpQaX7MMXMDLVOePWTujn1OzsbmaZLSyg05eau26Sc5XC
 +pheXhoF3DWhOI0JtoyyQMd+eYqWE+K4ocxHEv8Tv9mUThcm3aKVbryAW
 TynD7WHQH4iZmQBh9/en9k442RCUa0IY5dXV4c7+uBtd2PjPA1iAZS54J Y=;
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
IronPort-SDR: 692EqEhhPsuERZf0Poxx/kmYoGw34xlGaKjCd20ldW8qDo4arAil8LoweShxL8HG79HI5qlrLg
 xJhJnaPk+UkAYXA2x2jNiswXD80lLor1s55A372K9dsohDUOF42Y0FR2hCiWaDtCXHkCAcP/l3
 rO70+c1N9Krv4wXW8RbCdcp5SYuZD/zigYoirFsMeVjDy5/72k5Iaav+LLZ6l7I7TiLz9C25gK
 tB5eno24l5Yd9O+uW97SKGzDYyc7rK0bZ/zHVLU56RuUwAvK2mCfTiWCUym5CacKGLSW37oNmq
 NjI=
X-SBRS: 2.7
X-MesageID: 15575941
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15575941"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v4 02/18] xen/arm: Configure early printk via Kconfig
Date: Tue, 31 Mar 2020 11:30:46 +0100
Message-ID: <20200331103102.1105674-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331103102.1105674-1-anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan
 Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At the moment, early printk can only be configured on the make command
line. It is not very handy because a user has to remove the option
everytime it is using another command other than compiling the
hypervisor.

Furthermore, early printk is one of the few odds one that are not
using Kconfig.

So this is about time to move it to Kconfig.

The new kconfigs options allow a user to eather select a UART driver
to use at boot time, and set the parameters, or it is still possible
to select a platform which will set the parameters.

If CONFIG_EARLY_PRINTK is present in the environment or on the make
command line, make will return an error.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---

Notes:
    v4:
    - Add range to EARLY_UART_BASE_ADDRESS so that kconfig won't accept
      address higher than 4G on ARM_32
    - have EARLY_PRINTK_THUNDERX depends on ARM_64 because the default base
      address is above 4G
    - Add deprecation warning to the help of the choice of early printk
      driver/platform.
    - in early-printk.txt, add that early printk is available with EXPERT.
    
    Patch v3 and early where in "xen/arm: Configure early printk via
    Kconfig" series.
    
    v3:
    - rename EARLY_PRINK to CONFIG_EARLY_PRINTK in makefile here (which
      select which object to build).
    - rename EARLY_UART_BAUD_RATE to EARLY_UART_PL011_BAUD_RATE
    - typos
    - drop the list of aliases in early-printk.txt. Kconfig choice menu
      should be enough.
    - reword early-printk.txt.
    - rework how EARLY_PRINTK is set to Y
      and use that instead of a list of all EARLY_UART_*
    - Add a check to ask user to use Kconfig to set early printk.
    - rework the possible choice to have all uart driver and platform
      specific option together.
    - have added or reword prompt and help messages of the different
      options. The platform specific option don't have extended help, the
      prompt is probably enough.
      (The non-platform specific options have the help message that Julien
      have written in the first version.)
    - have made EARLY_UART_INIT dependent on the value of
      EARLY_UART_PL011_BAUD_RATE so that there is no need to expose _INIT to
      users.

 docs/misc/arm/early-printk.txt                |  71 ++---
 xen/Kconfig.debug                             |   2 +
 xen/arch/arm/Kconfig.debug                    | 289 ++++++++++++++++++
 xen/arch/arm/Makefile                         |   2 +-
 xen/arch/arm/Rules.mk                         |  74 +----
 xen/arch/arm/arm32/Makefile                   |   2 +-
 xen/arch/arm/arm64/Makefile                   |   2 +-
 .../minios.cfg => xen/arch/x86/Kconfig.debug  |   0
 8 files changed, 319 insertions(+), 123 deletions(-)
 create mode 100644 xen/arch/arm/Kconfig.debug
 copy stubdom/c/minios.cfg => xen/arch/x86/Kconfig.debug (100%)

diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-printk.txt
index 89e081e51eaf..aa22826075a4 100644
--- a/docs/misc/arm/early-printk.txt
+++ b/docs/misc/arm/early-printk.txt
@@ -1,64 +1,39 @@
 How to enable early printk
 
-Early printk can only be enabled if debug=y. You may want to enable it if
-you are debbuging code that executes before the console is initialized.
+Early printk can only be enabled if CONFIG_DEBUG=y or in EXPERT mode. You
+may want to enable it if you are debugging code that executes before the
+console is initialized.
 
 Note that selecting this option will limit Xen to a single UART definition.
 Attempting to boot Xen image on a different platform *will not work*, so this
 option should not be enable for Xens that are intended to be portable.
 
-CONFIG_EARLY_PRINTK=<INC>,<BASE_ADDRESS>,<OTHER_OPTIONS>
+Select one of the "Early printk via * UART" in the choice possible for
+"Early printk" in the "Debugging options" of Kconfig. You will then need to
+set other options, which depends on the driver selected.
 
-<INC> and <BASE_ADDRESS> are mandatory arguments:
+CONFIG_EARLY_UART_BASE_ADDRESS is a mandatory argument, it is the base
+physical address of the UART to use.
 
-  - <INC> is the name of the driver, see xen/arch/arm/arm{32,64}/debug-*.inc
-    (where <INC> corresponds to the wildcarded *).
-  - <BASE_ADDRESS> is the base physical address of the UART to use
+Other options depends on the driver selected:
+  - 8250
+    - CONFIG_EARLY_UART_8250_REG_SHIFT is, optionally, the left-shift to
+      apply to the register offsets within the uart.
+  - pl011
+    - CONFIG_EARLY_UART_PL011_BAUD_RATE is, optionally, a baud rate which
+      should be used to configure the UART at start of day.
 
-<OTHER_OPTIONS> varies depending on <INC>:
+      If CONFIG_EARLY_UART_PL011_BAUD_RATE  is set to 0 then the code will
+      not try to initialize the UART, so that bootloader or firmware
+      settings can be used for maximum compatibility.
+  - scif
+    - CONFIG_EARLY_UART_SCIF_VERSION_* is, optionally, the interface version
+      of the UART. Default to version NONE.
 
-  - 8250,<BASE_ADDRESS>,<REG_SHIFT>
-    - <REG_SHIFT> is, optionally, the left-shift to apply to the
-      register offsets within the uart.
-  - pl011,<BASE_ADDRESS>,<BAUD_RATE>
-    - <BAUD_RATE> is, optionally a baud rate which should be used to
-      configure the UART at start of day.
-
-      If <BAUD_RATE> is not given then the code will not try to
-      initialize the UART, so that bootloader or firmware settings can
-     be used for maximum compatibility.
-  - scif,<BASE_ADDRESS>,<VERSION>
-    - SCIF<VERSION> is, optionally, the interface version of the UART.
-
-      If <VERSION> is not given then the default interface version (SCIF)
-      will be used.
   - For all other uarts there are no additional options.
 
 As a convenience it is also possible to select from a list of
-predefined configurations using CONFIG_EARLY_PRINTK=mach where mach is
-the name of the machine:
-
-  - brcm: printk with 8250 on Broadcom 7445D0 boards with A15 processors.
-  - dra7: printk with 8250 on DRA7 platform
-  - exynos5250: printk with the second UART
-  - fastmodel: printk on ARM Fastmodel software emulators
-  - hikey960: printk with pl011 with Hikey 960
-  - juno: printk with pl011 on Juno platform
-  - lager: printk with SCIF0 on Renesas Lager board (R-Car H2 processor)
-  - midway: printk with the pl011 on Calxeda Midway processors
-  - mvebu: printk with the MVEBU for Marvell Armada 3700 SoCs
-  - omap5432: printk with UART3 on TI OMAP5432 processors
-  - rcar3: printk with SCIF2 on Renesas R-Car Gen3 processors
-  - seattle: printk with pl011 for AMD Seattle processor
-  - sun6i: printk with 8250 on Allwinner A31 processors
-  - sun7i: printk with 8250 on Allwinner A20 processors
-  - thunderx: printk with pl011 for Cavium ThunderX processor
-  - vexpress: printk with pl011 for versatile express
-  - xgene-mcdivitt: printk with 820 on Xgene mcdivitt platform
-  - xgene-storm: printk with 820 on Xgene storm platform
-  - zynqmp: printk with Cadence UART for Xilinx ZynqMP SoCs
-
-These settings are is hardcoded in xen/arch/arm/Rules.mk,
-see there when adding support for new machines.
+predefined configurations available in the list of choice for "Early
+printk" for specific platform.
 
 By default early printk is disabled.
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index b3511e81a275..ee6ee33b69be 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -128,6 +128,8 @@ config XMEM_POOL_POISON
 	  Poison free blocks with 0xAA bytes and verify them when a block is
 	  allocated in order to spot use-after-free issues.
 
+source "arch/$(SRCARCH)/Kconfig.debug"
+
 endif # DEBUG || EXPERT
 
 endmenu
diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
new file mode 100644
index 000000000000..35ccd132732b
--- /dev/null
+++ b/xen/arch/arm/Kconfig.debug
@@ -0,0 +1,289 @@
+choice
+	bool "Early printk"
+	optional
+	help
+		You may want to enable early printk if you are debugging code
+		that executes before the console is initialized.
+
+		Note that selecting this option will limit Xen to a single UART
+		definition. Attempting to boot Xen image on a different
+		platform *will not work*, so this option should not be enable
+		for Xens that are intended to be portable.
+
+		Choose one of the UART drivers for early printk, then you'll
+		have to specify the parameters, like the base address.
+
+		Deprecated: Alternatively, there are platform specific options
+		which will have default values for the various parameters. But
+		such option will soon be removed.
+
+	config EARLY_UART_CHOICE_8250
+		select EARLY_UART_8250
+		bool "Early printk via 8250 UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a 8250 UART. You can use this option to
+			provide the parameters for the 8250 UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_CADENCE
+		select EARLY_UART_CADENCE
+		depends on ARM_64
+		bool "Early printk via Cadence UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a Cadence UART. You can use this option to
+			provide the parameters for the Cadence UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_EXYNOS4210
+		select EARLY_UART_EXYNOS4210
+		depends on ARM_32
+		bool "Early printk via Exynos4210 UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a Exynos 4210 UART. You can use this option to
+			provide the parameters for the Exynos 4210 UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_MESON
+		select EARLY_UART_MESON
+		depends on ARM_64
+		bool "Early printk via MESON UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a MESON UART. You can use this option to
+			provide the parameters for the MESON UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_MVEBU
+		select EARLY_UART_MVEBU
+		depends on ARM_64
+		bool "Early printk via MVEBU UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a MVEBU UART. You can use this option to
+			provide the parameters for the MVEBU UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_PL011
+		select EARLY_UART_PL011
+		bool "Early printk via PL011 UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a PL011 UART. You can use this option to
+			provide the parameters for the PL011 UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+	config EARLY_UART_CHOICE_SCIF
+		select EARLY_UART_SCIF
+		bool "Early printk via SCIF UART"
+		help
+			Say Y here if you wish the early printk to direct their
+			output to a SCIF UART. You can use this option to
+			provide the parameters for the SCIF UART rather than
+			selecting one of the platform specific options below if
+			you know the parameters for the port.
+
+			This option is preferred over the platform specific
+			options; the platform specific options are deprecated
+			and will soon be removed.
+
+	config EARLY_PRINTK_BRCM
+		bool "Early printk with 8250 on Broadcom 7445D0 boards with A15 processors"
+		select EARLY_UART_8250
+	config EARLY_PRINTK_DRA7
+		bool "Early printk with 8250 on DRA7 platform"
+		select EARLY_UART_8250
+	config EARLY_PRINTK_EXYNOS5250
+		bool "Early printk with the second UART on Exynos5250"
+		select EARLY_UART_EXYNOS4210
+		depends on ARM_32
+	config EARLY_PRINTK_FASTMODEL
+		bool "Early printk with pl011 on ARM Fastmodel software emulators"
+		select EARLY_UART_PL011
+	config EARLY_PRINTK_HIKEY960
+		bool "Early printk with pl011 with Hikey 960"
+		select EARLY_UART_PL011
+	config EARLY_PRINTK_JUNO
+		bool "Early printk with pl011 on Juno platform"
+		select EARLY_UART_PL011
+	config EARLY_PRINTK_LAGER
+		bool "Early printk with SCIF0 on Renesas Lager board (R-Car H2 processor)"
+		select EARLY_UART_SCIF
+	config EARLY_PRINTK_MIDWAY
+		bool "Early printk with pl011 on Calxeda Midway processors"
+		select EARLY_UART_PL011
+	config EARLY_PRINTK_MVEBU
+		bool "Early printk with MVEBU for Marvell Armada 3700 SoCs"
+		select EARLY_UART_MVEBU
+		depends on ARM_64
+	config EARLY_PRINTK_OMAP5432
+		bool "Early printk with UART3 on TI OMAP5432 processors"
+		select EARLY_UART_8250
+	config EARLY_PRINTK_RCAR3
+		bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
+		select EARLY_UART_SCIF
+	config EARLY_PRINTK_SEATTLE
+		bool "Early printk with pl011 for AMD Seattle processor"
+		select EARLY_UART_PL011
+	config EARLY_PRINTK_SUN6I
+		bool "Early printk with 8250 on Allwinner A31 processors"
+		select EARLY_UART_8250
+	config EARLY_PRINTK_SUN7I
+		bool "Early printk with 8250 on Allwinner A20 processors"
+		select EARLY_UART_8250
+	config EARLY_PRINTK_THUNDERX
+		bool "Early printk with pl011 for Cavium ThunderX processor"
+		select EARLY_UART_PL011
+		depends on ARM_64
+	config EARLY_PRINTK_VEXPRESS
+		bool "Early printk with pl011 for versatile express"
+		select EARLY_UART_PL011
+	config EARLY_PRINTK_XGENE_MCDIVITT
+		bool "Early printk with 820 on Xgene mcdivitt platform"
+		select EARLY_UART_8250
+	config EARLY_PRINTK_XGENE_STORM
+		bool "Early printk with 820 on Xgene storm platform"
+		select EARLY_UART_8250
+	config EARLY_PRINTK_ZYNQMP
+		bool "Early printk with Cadence UART for Xilinx ZynqMP SoCs"
+		select EARLY_UART_CADENCE
+		depends on ARM_64
+endchoice
+
+
+config EARLY_UART_8250
+	select EARLY_PRINTK
+	bool
+config EARLY_UART_CADENCE
+	select EARLY_PRINTK
+	bool
+config EARLY_UART_EXYNOS4210
+	select EARLY_PRINTK
+	bool
+config EARLY_UART_MESON
+	select EARLY_PRINTK
+	bool
+config EARLY_UART_MVEBU
+	select EARLY_PRINTK
+	bool
+config EARLY_UART_PL011
+	select EARLY_PRINTK
+	bool
+config EARLY_UART_SCIF
+	select EARLY_PRINTK
+	bool
+
+config EARLY_PRINTK
+	bool
+
+config EARLY_UART_BASE_ADDRESS
+	depends on EARLY_PRINTK
+	hex "Early printk, physical base address of debug UART"
+	range 0x0 0xffffffff if ARM_32
+	default 0xF040AB00 if EARLY_PRINTK_BRCM
+	default 0x4806A000 if EARLY_PRINTK_DRA7
+	default 0x1c090000 if EARLY_PRINTK_FASTMODEL
+	default 0x12c20000 if EARLY_PRINTK_EXYNOS5250
+	default 0xfff32000 if EARLY_PRINTK_HIKEY960
+	default 0x7ff80000 if EARLY_PRINTK_JUNO
+	default 0xe6e60000 if EARLY_PRINTK_LAGER
+	default 0xfff36000 if EARLY_PRINTK_MIDWAY
+	default 0xd0012000 if EARLY_PRINTK_MVEBU
+	default 0x48020000 if EARLY_PRINTK_OMAP5432
+	default 0xe6e88000 if EARLY_PRINTK_RCAR3
+	default 0xe1010000 if EARLY_PRINTK_SEATTLE
+	default 0x01c28000 if EARLY_PRINTK_SUN6I
+	default 0x01c28000 if EARLY_PRINTK_SUN7I
+	default 0x87e024000000 if EARLY_PRINTK_THUNDERX
+	default 0x1c090000 if EARLY_PRINTK_VEXPRESS
+	default 0x1c021000 if EARLY_PRINTK_XGENE_MCDIVITT
+	default 0x1c020000 if EARLY_PRINTK_XGENE_STORM
+	default 0xff000000 if EARLY_PRINTK_ZYNQMP
+
+config EARLY_UART_PL011_BAUD_RATE
+	depends on EARLY_UART_PL011
+	int "Early printk UART baud rate for pl011"
+	help
+		Optionally sets the baud rate which should be used to configure
+		the UART at start of day.
+
+		If EARLY_UART_PL011_BAUD_RATE is set to 0 then the code will
+		not try to initialize the UART, so that bootloader or firmware
+		settings can be used for maximum compatibility.
+
+	default 115200 if EARLY_PRINTK_FASTMODEL
+	default 0
+
+config EARLY_UART_INIT
+	depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0
+	def_bool y
+
+config EARLY_UART_8250_REG_SHIFT
+	depends on EARLY_UART_8250
+	int "Early printk, left-shift to apply to the register offsets within the 8250 UART"
+	help
+		EARLY_UART_8250_REG_SHIFT is, optionally, the left-shift to
+		apply to the register offsets within the UART with early
+		printk.
+
+		Default to 0.
+
+	default 2 if EARLY_PRINTK_BRCM
+	default 2 if EARLY_PRINTK_DRA7
+	default 2 if EARLY_PRINTK_OMAP5432
+	default 2 if EARLY_PRINTK_SUN6I
+	default 2 if EARLY_PRINTK_SUN7I
+	default 2 if EARLY_PRINTK_XGENE_MCDIVITT
+	default 2 if EARLY_PRINTK_XGENE_STORM
+	default 0
+
+choice EARLY_UART_SCIF_VERSION
+	prompt "Early printk UART SCIF interface version"
+	depends on EARLY_UART_SCIF
+	default EARLY_UART_SCIF_VERSION_NONE
+	help
+		Select the interface version of the SCIF UART.
+
+		Select EARLY_UART_SCIF_VERSION_NONE to use the default
+		interface version (SCIF).
+	config EARLY_UART_SCIF_VERSION_NONE
+		bool "default SCIF UART interface"
+	config EARLY_UART_SCIF_VERSION_A
+		bool "SCIF UART interface version A"
+endchoice
+
+config EARLY_PRINTK_INC
+	string
+	default "debug-8250.inc" if EARLY_UART_8250
+	default "debug-cadence.inc" if EARLY_UART_CADENCE
+	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
+	default "debug-meson.inc" if EARLY_UART_MESON
+	default "debug-mvebu.inc" if EARLY_UART_MVEBU
+	default "debug-pl011.inc" if EARLY_UART_PL011
+	default "debug-scif.inc" if EARLY_UART_SCIF
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 1044c2298a05..12f92a4bd3f9 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -16,7 +16,7 @@ obj-y += device.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
-obj-$(EARLY_PRINTK) += early_printk.o
+obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += gic.o
 obj-y += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
index faa09ea111ec..3ad284aa71a4 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -18,76 +18,6 @@ CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-a15
 CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
 CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
 
-EARLY_PRINTK := n
-
-ifeq ($(CONFIG_DEBUG),y)
-
-# See docs/misc/arm/early-printk.txt for syntax
-
-EARLY_PRINTK_brcm           := 8250,0xF040AB00,2
-EARLY_PRINTK_dra7           := 8250,0x4806A000,2
-EARLY_PRINTK_fastmodel      := pl011,0x1c090000,115200
-EARLY_PRINTK_exynos5250     := exynos4210,0x12c20000
-EARLY_PRINTK_hikey960       := pl011,0xfff32000
-EARLY_PRINTK_juno           := pl011,0x7ff80000
-EARLY_PRINTK_lager          := scif,0xe6e60000
-EARLY_PRINTK_midway         := pl011,0xfff36000
-EARLY_PRINTK_mvebu          := mvebu,0xd0012000
-EARLY_PRINTK_omap5432       := 8250,0x48020000,2
-EARLY_PRINTK_rcar3          := scif,0xe6e88000
-EARLY_PRINTK_seattle        := pl011,0xe1010000
-EARLY_PRINTK_sun6i          := 8250,0x01c28000,2
-EARLY_PRINTK_sun7i          := 8250,0x01c28000,2
-EARLY_PRINTK_thunderx       := pl011,0x87e024000000
-EARLY_PRINTK_vexpress       := pl011,0x1c090000
-EARLY_PRINTK_xgene-mcdivitt := 8250,0x1c021000,2
-EARLY_PRINTK_xgene-storm    := 8250,0x1c020000,2
-EARLY_PRINTK_zynqmp         := cadence,0xff000000
-
-ifneq ($(EARLY_PRINTK_$(CONFIG_EARLY_PRINTK)),)
-EARLY_PRINTK_CFG := $(subst $(comma), ,$(EARLY_PRINTK_$(CONFIG_EARLY_PRINTK)))
-else
-EARLY_PRINTK_CFG := $(subst $(comma), ,$(CONFIG_EARLY_PRINTK))
-endif
-
-# Extract configuration from string
-EARLY_PRINTK_INC := $(word 1,$(EARLY_PRINTK_CFG))
-EARLY_UART_BASE_ADDRESS := $(word 2,$(EARLY_PRINTK_CFG))
-
-# UART specific options
-ifeq ($(EARLY_PRINTK_INC),8250)
-EARLY_UART_REG_SHIFT := $(word 3,$(EARLY_PRINTK_CFG))
-endif
-ifeq ($(EARLY_PRINTK_INC),pl011)
-ifneq ($(word 3,$(EARLY_PRINTK_CFG)),)
-EARLY_PRINTK_INIT_UART := y
-EARLY_PRINTK_BAUD := $(word 3,$(EARLY_PRINTK_CFG))
-endif
-endif
-ifeq ($(EARLY_PRINTK_INC),scif)
-ifneq ($(word 3,$(EARLY_PRINTK_CFG)),)
-CFLAGS-y += -DCONFIG_EARLY_UART_SCIF_VERSION_$(word 3,$(EARLY_PRINTK_CFG))
-else
-CFLAGS-y += -DCONFIG_EARLY_UART_SCIF_VERSION_NONE
-endif
-endif
-
-ifneq ($(EARLY_PRINTK_INC),)
-EARLY_PRINTK := y
-endif
-
-CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_PRINTK
-CFLAGS-$(EARLY_PRINTK_INIT_UART) += -DCONFIG_EARLY_UART_INIT
-CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_PRINTK_INC=\"debug-$(EARLY_PRINTK_INC).inc\"
-CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_UART_PL011_BAUD_RATE=$(EARLY_PRINTK_BAUD)
-CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_UART_BASE_ADDRESS=$(EARLY_UART_BASE_ADDRESS)
-CFLAGS-$(EARLY_PRINTK) += -DCONFIG_EARLY_UART_8250_REG_SHIFT=$(EARLY_UART_REG_SHIFT)
-
-else # !CONFIG_DEBUG
-
-ifneq ($(CONFIG_EARLY_PRINTK),)
-# Early printk is dependant on a debug build.
-$(error CONFIG_EARLY_PRINTK enabled for non-debug build)
-endif
-
+ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
+    $(error You must use 'make menuconfig' to enable/disable early printk now)
 endif
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 539bbef298a7..96105d238307 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -1,6 +1,6 @@
 obj-y += lib/
 
-obj-$(EARLY_PRINTK) += debug.o
+obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index db8565b71a33..40642ff57494 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -2,7 +2,7 @@ obj-y += lib/
 
 obj-y += cache.o
 obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
-obj-$(EARLY_PRINTK) += debug.o
+obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
diff --git a/stubdom/c/minios.cfg b/xen/arch/x86/Kconfig.debug
similarity index 100%
copy from stubdom/c/minios.cfg
copy to xen/arch/x86/Kconfig.debug
-- 
Anthony PERARD


