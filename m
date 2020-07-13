Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2DB21D756
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 15:37:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juyd6-0008M2-JL; Mon, 13 Jul 2020 13:36:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ndB=AY=gmail.com=refactormyself@srs-us1.protection.inumbo.net>)
 id 1juyPm-0007TO-6S
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 13:22:38 +0000
X-Inumbo-ID: eaf90130-c50b-11ea-bb8b-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaf90130-c50b-11ea-bb8b-bc764e2007e4;
 Mon, 13 Jul 2020 13:22:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a1so8212201edt.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2020 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TEh/JkkBeDq0BmwWDLkY2ALcEwIhER9cNUR1loI6e78=;
 b=hlFk02nnRr+rQKvpcmIRPBcv9Vppks3wU3BsbHQlS35RNRr0Lm2YUw7/utWjHu70OH
 fu21BCriHQitKJ9VJJ9HkQBoc0oNiPianJ9DfryJ5s4iB77Gi9+P+wSDFA8dw7sDMdjN
 CRk+C/cn77UZdk8p4eMVCYK2N1kZ9NOWbvXAMsA8NoetiFgB4PjRem+NJr8k6FdLryN7
 KSXqy55pf7Mo7GW41Rrh43kHUodvpJcq7yyqbdwHNICmnMteEU7rrwF/z8u+pZc3nMOJ
 t5bRIsTEDAnzpyq0Z/t5ptBct6erL48Bl/rPmxQHyXzHf8lqWgUjMDOqwGt/I2ULZZSO
 jYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TEh/JkkBeDq0BmwWDLkY2ALcEwIhER9cNUR1loI6e78=;
 b=bxo3hiry3KYOa7F4NUxNXwA0JQQVlnIYXslHfHtM8NInh92Cr9LyyqkPl1q/zT5TpI
 tq8Z2IhYlpDinT3FRwf/h66zImxj5VluAitku94cONY46ZnpceebGV0gXTtIn/yDnk6b
 BU3qe+kktTHTI6gycZKy2qVPMuVjlAr4tGP7oHIIZAgRNx67nOSM5Y48tICNxskATHFN
 HckbqqkEw3q4CzZiXbtkvVzftGthg7jJbl0spexZe/nmlfSBXTTrpQDni6NGFFrwPUdM
 ffX+L1rnCGGKgbZkPZpWVVP0Z2UwbJExP1oEeCQcrp20MhttHHDe60JV7Cxy5klVaeRh
 vDTw==
X-Gm-Message-State: AOAM531fmjqB0Bt6/nwiasJYLtQmbATWyLw+XepO/DjbOl+7ey81rh9a
 0BW5DT6/TWGaIwvKyKFvIGw=
X-Google-Smtp-Source: ABdhPJw69dKLZM419xxp02IeffDX2nQ+F52A+jh3cXUOZ7YUfQhM+G+xXauU5Oq4EhNqFD1PfU4cXQ==
X-Received: by 2002:a50:fb93:: with SMTP id e19mr83849853edq.106.1594646556147; 
 Mon, 13 Jul 2020 06:22:36 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:35 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Subject: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Date: Mon, 13 Jul 2020 14:22:12 +0200
Message-Id: <20200713122247.10985-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Mon, 13 Jul 2020 13:36:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>, Keith Busch <kbusch@kernel.org>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 sparclinux@vger.kernel.org, rfi@lists.rocketboards.org,
 Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-scsi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-atm-general@lists.sourceforge.net,
 Russell King <linux@armlinux.org.uk>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Christoph Hellwig <hch@lst.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Chas Williams <3chas3@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>,
 linux-mips@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Kevin Hilman <khilman@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Yue Wang <yue.wang@Amlogic.com>, Jens Axboe <axboe@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Buesch <m@bues.ch>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Brian King <brking@us.ibm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-alpha@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



This goal of these series is to move the definition of *all* PCIBIOS* from
include/linux/pci.h to arch/x86 and limit their use within there.
All other tree specific definition will be left for intact. Maybe they can
be renamed.

PCIBIOS* is an x86 concept as defined by the PCI spec. The returned error
codes of PCIBIOS* are positive values and this introduces some complexities
which other archs need not incur.

PLAN:

1.   [PATCH v0 1-36] Replace all PCIBIOS_SUCCESSFUL with 0

2a.  Audit all functions returning PCIBIOS_* error values directly or
     indirectly and prevent possible bug coming in (2b)

2b.  Make all functions returning PCIBIOS_* error values call 
     pcibios_err_to_errno(). *This will change their behaviour, for good.*

3.   Clone a pcibios_err_to_errno() into arch/x86/pci/pcbios.c as _v2.
     This handles the positive error codes directly and will not use any
     PCIBIOS* definitions. So calls to it have no outside dependence.

4.   Make all x86 codes that needs to convert to -E* values call the 
     cloned version - pcibios_err_to_errno_v2()

5.   Assign PCIBIOS_* errors values directly to generic -E* errors

6.   Refactor pcibios_err_to_errno() and mark it deprecated

7.   Replace all calls to pcibios_err_to_errno() with the proper -E* value
     or 0.

8.   Remove all PCIBIOS* definitions in include/linux/pci.h and 
     pcibios_err_to_errno() too.

9.   Redefine all PCIBIOS* definitions with original values inside 
     arch/x86/pci/pcbios.c

10.  Redefine pcibios_err_to_errno() inside arch/x86/pci/pcbios.c

11.  Replace pcibios_err_to_errno_v2() calls with pcibios_err_to_errno()

12.  Remove pcibios_err_to_errno_v2()

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Suggested-by: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>


Bolarinwa Olayemi Saheed (35):
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Fix Style ERROR: assignment in if condition
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks
  Change PCIBIOS_SUCCESSFUL to 0
  Tidy Success/Failure checks

 arch/alpha/kernel/core_apecs.c                |  4 +--
 arch/alpha/kernel/core_cia.c                  |  4 +--
 arch/alpha/kernel/core_irongate.c             |  4 +--
 arch/alpha/kernel/core_lca.c                  |  4 +--
 arch/alpha/kernel/core_marvel.c               |  4 +--
 arch/alpha/kernel/core_mcpcia.c               |  4 +--
 arch/alpha/kernel/core_polaris.c              |  4 +--
 arch/alpha/kernel/core_t2.c                   |  4 +--
 arch/alpha/kernel/core_titan.c                |  4 +--
 arch/alpha/kernel/core_tsunami.c              |  4 +--
 arch/alpha/kernel/core_wildfire.c             |  4 +--
 arch/alpha/kernel/sys_miata.c                 |  2 +-
 arch/arm/common/it8152.c                      |  4 +--
 arch/arm/mach-cns3xxx/pcie.c                  |  2 +-
 arch/arm/mach-footbridge/dc21285.c            |  4 +--
 arch/arm/mach-iop32x/pci.c                    |  6 ++--
 arch/arm/mach-ixp4xx/common-pci.c             |  8 ++---
 arch/arm/mach-orion5x/pci.c                   |  4 +--
 arch/arm/plat-orion/pcie.c                    |  8 ++---
 arch/m68k/coldfire/pci.c                      |  8 ++---
 arch/microblaze/pci/indirect_pci.c            |  4 +--
 arch/mips/pci/fixup-ath79.c                   |  2 +-
 arch/mips/pci/ops-bcm63xx.c                   | 14 ++++----
 arch/mips/pci/ops-bonito64.c                  |  4 +--
 arch/mips/pci/ops-gt64xxx_pci0.c              |  4 +--
 arch/mips/pci/ops-lantiq.c                    |  4 +--
 arch/mips/pci/ops-loongson2.c                 |  4 +--
 arch/mips/pci/ops-mace.c                      |  4 +--
 arch/mips/pci/ops-msc.c                       |  4 +--
 arch/mips/pci/ops-rc32434.c                   |  6 ++--
 arch/mips/pci/ops-sni.c                       |  4 +--
 arch/mips/pci/ops-tx3927.c                    |  2 +-
 arch/mips/pci/ops-tx4927.c                    |  2 +-
 arch/mips/pci/ops-vr41xx.c                    |  4 +--
 arch/mips/pci/pci-alchemy.c                   |  6 ++--
 arch/mips/pci/pci-ar2315.c                    |  5 ++-
 arch/mips/pci/pci-ar71xx.c                    |  4 +--
 arch/mips/pci/pci-ar724x.c                    |  6 ++--
 arch/mips/pci/pci-bcm1480.c                   |  4 +--
 arch/mips/pci/pci-bcm1480ht.c                 |  4 +--
 arch/mips/pci/pci-mt7620.c                    |  4 +--
 arch/mips/pci/pci-octeon.c                    | 12 +++----
 arch/mips/pci/pci-rt2880.c                    |  4 +--
 arch/mips/pci/pci-rt3883.c                    |  4 +--
 arch/mips/pci/pci-sb1250.c                    |  4 +--
 arch/mips/pci/pci-virtio-guest.c              |  4 +--
 arch/mips/pci/pci-xlp.c                       |  4 +--
 arch/mips/pci/pci-xlr.c                       |  4 +--
 arch/mips/pci/pci-xtalk-bridge.c              | 14 ++++----
 arch/mips/pci/pcie-octeon.c                   |  4 +--
 arch/mips/txx9/generic/pci.c                  |  5 ++-
 arch/powerpc/kernel/rtas_pci.c                |  4 +--
 arch/powerpc/platforms/4xx/pci.c              |  4 +--
 arch/powerpc/platforms/52xx/efika.c           |  4 +--
 arch/powerpc/platforms/52xx/mpc52xx_pci.c     |  4 +--
 arch/powerpc/platforms/82xx/pq2.c             |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c     |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx_ds.c      |  2 +-
 arch/powerpc/platforms/86xx/mpc86xx_hpcn.c    |  2 +-
 arch/powerpc/platforms/chrp/pci.c             |  8 ++---
 arch/powerpc/platforms/embedded6xx/holly.c    |  2 +-
 .../platforms/embedded6xx/mpc7448_hpc2.c      |  2 +-
 arch/powerpc/platforms/fsl_uli1575.c          |  2 +-
 arch/powerpc/platforms/maple/pci.c            | 18 +++++-----
 arch/powerpc/platforms/pasemi/pci.c           |  6 ++--
 arch/powerpc/platforms/powermac/pci.c         |  8 ++---
 arch/powerpc/platforms/powernv/eeh-powernv.c  |  4 +--
 arch/powerpc/platforms/powernv/pci.c          |  4 +--
 arch/powerpc/platforms/pseries/eeh_pseries.c  |  4 +--
 arch/powerpc/sysdev/fsl_pci.c                 |  2 +-
 arch/powerpc/sysdev/indirect_pci.c            |  4 +--
 arch/powerpc/sysdev/tsi108_pci.c              |  4 +--
 arch/sh/drivers/pci/common.c                  |  3 +-
 arch/sh/drivers/pci/ops-dreamcast.c           |  4 +--
 arch/sh/drivers/pci/ops-sh4.c                 |  4 +--
 arch/sh/drivers/pci/ops-sh7786.c              |  8 ++---
 arch/sh/drivers/pci/pci.c                     |  2 +-
 arch/sparc/kernel/pci_common.c                | 28 +++++++--------
 arch/unicore32/kernel/pci.c                   |  4 +--
 drivers/atm/iphase.c                          | 20 ++++++-----
 drivers/atm/lanai.c                           |  8 ++---
 drivers/bcma/driver_pci_host.c                |  4 +--
 drivers/hwmon/sis5595.c                       | 13 +++----
 drivers/hwmon/via686a.c                       | 13 +++----
 drivers/hwmon/vt8231.c                        | 13 +++----
 drivers/i2c/busses/i2c-ali15x3.c              |  5 ++-
 drivers/i2c/busses/i2c-nforce2.c              |  3 +-
 drivers/i2c/busses/i2c-sis5595.c              | 15 +++-----
 drivers/misc/cxl/vphb.c                       |  4 +--
 drivers/net/ethernet/realtek/r8169_main.c     |  2 +-
 drivers/nvme/host/pci.c                       |  2 +-
 drivers/pci/access.c                          | 14 ++++----
 drivers/pci/controller/dwc/pci-meson.c        |  4 +--
 .../pci/controller/dwc/pcie-designware-host.c |  2 +-
 drivers/pci/controller/dwc/pcie-designware.c  |  4 +--
 drivers/pci/controller/dwc/pcie-hisi.c        |  4 +--
 drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +--
 .../pci/controller/mobiveil/pcie-mobiveil.c   |  4 +--
 drivers/pci/controller/pci-aardvark.c         |  4 +--
 drivers/pci/controller/pci-ftpci100.c         |  4 +--
 drivers/pci/controller/pci-hyperv.c           |  8 ++---
 drivers/pci/controller/pci-mvebu.c            |  4 +--
 drivers/pci/controller/pci-thunder-ecam.c     | 36 +++++++++----------
 drivers/pci/controller/pci-thunder-pem.c      |  4 +--
 drivers/pci/controller/pci-xgene.c            |  5 ++-
 drivers/pci/controller/pcie-altera.c          | 16 ++++-----
 drivers/pci/controller/pcie-iproc.c           | 10 +++---
 drivers/pci/controller/pcie-mediatek.c        |  4 +--
 drivers/pci/controller/pcie-rcar-host.c       |  8 ++---
 drivers/pci/controller/pcie-rockchip-host.c   | 10 +++---
 drivers/pci/pci-bridge-emul.c                 | 14 ++++----
 drivers/pci/pci.c                             |  8 ++---
 drivers/pci/pcie/bw_notification.c            |  4 +--
 drivers/pci/probe.c                           |  4 +--
 drivers/pci/quirks.c                          |  4 +--
 drivers/pci/syscall.c                         |  8 ++---
 drivers/pci/xen-pcifront.c                    |  2 +-
 drivers/scsi/ipr.c                            | 16 ++++-----
 drivers/scsi/pmcraid.c                        |  6 ++--
 drivers/ssb/driver_gige.c                     |  4 +--
 drivers/ssb/driver_pcicore.c                  |  4 +--
 drivers/xen/xen-pciback/conf_space.c          |  2 +-
 122 files changed, 347 insertions(+), 369 deletions(-)

-- 
2.18.2


