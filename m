Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87E43D3F2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217213.377118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJ3-0000uH-6Z; Wed, 27 Oct 2021 21:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217213.377118; Wed, 27 Oct 2021 21:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJ3-0000sP-2x; Wed, 27 Oct 2021 21:17:57 +0000
Received: by outflank-mailman (input) for mailman id 217213;
 Wed, 27 Oct 2021 21:17:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJ1-0000sJ-HP
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:17:55 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d25f7dee-b839-40a1-9397-c24b450b7115;
 Wed, 27 Oct 2021 21:17:53 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bi35so8955450lfb.9
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:17:53 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:52 -0700 (PDT)
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
X-Inumbo-ID: d25f7dee-b839-40a1-9397-c24b450b7115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HanWLUgUF9ofZz0QDrpGI0FWc48M0ufWpqHp0nt1b2E=;
        b=a1C0lJ0gvckIcvrduJKizBVznyKnv2//TCPoPAKkXD5DGkkQrqb/ViKHcln36NfZVY
         ISxWYKFK39QVsDuVPSlu1LT5SZ/nBBGFDz/uufiZqdO/sZQ/qKfQbI2KUPqf8Q5RxkHA
         MqrWECpWx+g/FtcgYyau3zztbhU+vtw2w2aCc+udZXZ6rXXp+WIwUtGzuFURsYXqbmre
         UplyFnSR1G34j0+8EfYoJdUe8oXvIadmEQEw4Cs4f6QOILfUENf3Exk7blXkIQnIkrzz
         fkcmzAmhEcuM9KSNxc0P3MxX2C8tZcNnFx2+J321vEf5QsS8Rq276nN8ZpOlB8JNgrdd
         UeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HanWLUgUF9ofZz0QDrpGI0FWc48M0ufWpqHp0nt1b2E=;
        b=pQw9ofOQhtO2Lr2Q4hsGVfjMgUndfqeJe2bLQu1wehsAkO0CR5XC3+5lBM2d+zNdsO
         uMdtWzqObbGHR1Zhd5x+sPuQzRJWDiq2nIewIiiMWPtOb3KxQU7AYRkOJYPUENy3FrWQ
         XE6SP9X7xNjTTxKEyWCnNqKo/ssxyZSmw9Ms+BpCkPuC+XWh4i6F326bISCJp07M7Gv8
         Lk1C27aBo84Pe1tiUWS0VXcswphyhisdN1buTMn8lTJjwoAM9iF0IjKR5A+cQiKn762j
         rmhXc04b7CceUOVEqXCmjqN6rI30j2hujqcBMc7Fjh/5Tkx01SJs7icHmJtEJbbS0IPc
         vuCA==
X-Gm-Message-State: AOAM5321NPEjWPN1TgihxzL3e6susLs62RqM94/emCTftR00iDi6yP+Q
	LcW572VAt4X2fTv/mVOH2cE=
X-Google-Smtp-Source: ABdhPJwziuHQfMqUpY6gmZyMY580K8cBL+Vix4M/+v/UKEXvEr1gkREZREaCQS2oC15RMdaQR1Q4+A==
X-Received: by 2002:a05:6512:31a:: with SMTP id t26mr121977lfp.280.1635369472536;
        Wed, 27 Oct 2021 14:17:52 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lee Jones <lee.jones@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Joshua Thompson <funaho@jurai.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Hu <nickhu@andestech.com>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Pavel Machek <pavel@ucw.cz>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 00/45] Introduce power-off+restart call chain API
Date: Thu, 28 Oct 2021 00:16:30 +0300
Message-Id: <20211027211715.12671-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Problem
-------

SoC devices require power-off call chaining functionality from kernel.
We have a widely used restart chaining provided by restart notifier API,
but nothing for power-off.

Solution
--------

Introduce new API that provides both restart and power-off call chains.

Why combine restart with power-off? Because drivers often do both.
More practical to have API that provides both under the same roof.

The new API is designed with simplicity and extensibility in mind.
It's built upon the existing restart and reboot APIs. The simplicity
is in new helper functions that are convenient for drivers. The
extensibility is in the design that doesn't hardcode callback
arguments, making easy to add new parameters and remove old.

This is a third attempt to introduce the new API. First was made by
Guenter Roeck back in 2014, second was made by Thierry Reding in 2017.
In fact the work didn't stop and recently arm_pm_restart() was removed
from v5.14 kernel, which was a part of preparatory work started by
Guenter Roeck. I took into account experience and ideas from the
previous attempts, extended and polished them.

Adoption plan
-------------

This patchset introduces the new API. It also converts multiple drivers
and arch code to the new API to demonstrate how it all looks in practice.

The plan is:

1. Merge new API (patches 1-8). This API will co-exist with the old APIs.

2. Convert arch code to do_kernel_power_off() (patches 9-21).

3. Convert drivers and platform code to the new API.

4. Remove obsolete pm_power_off and pm_power_off_prepare variables.

5. Make restart-notifier API private to kernel/reboot.c once no users left.

Results
-------

1. Devices can be powered off properly.

2. Global variables are removed from drivers.

3. Global pm_power_off and pm_power_off_prepare callback variables are
removed once all users are converted to the new API. The latter callback
is removed by patch #25 of this series.

4. Ambiguous call chain ordering is prohibited. See patch #5 which adds
verification of restart handlers priorities, ensuring that they are unique.

Changelog:

v2: - Replaced standalone power-off call chain demo-API with the combined
      power-off+restart API because this is what drivers want. It's a more
      comprehensive solution.

    - Converted multiple drivers and arch code to the new API. Suggested by
      Andy Shevchenko. I skimmed through the rest of drivers, verifying that
      new API suits them. The rest of the drivers will be converted once we
      will settle on the new API, otherwise will be too many patches here.

    - v2 API doesn't expose notifier to users and require handlers to
      have unique priority. Suggested by Guenter Roeck.

    - v2 API has power-off chaining disabled by default and require
      drivers to explicitly opt-in to the chaining. This preserves old
      behaviour for existing drivers once they are converted to the new
      API.

Dmitry Osipenko (45):
  notifier: Remove extern annotation from function prototypes
  notifier: Add blocking_notifier_call_chain_empty()
  notifier: Add atomic/blocking_notifier_has_unique_priority()
  reboot: Correct typo in a comment
  reboot: Warn if restart handler has duplicated priority
  reboot: Warn if unregister_restart_handler() fails
  reboot: Remove extern annotation from function prototypes
  kernel: Add combined power-off+restart handler call chain API
  xen/x86: Use do_kernel_power_off()
  ARM: Use do_kernel_power_off()
  arm64: Use do_kernel_power_off()
  csky: Use do_kernel_power_off()
  ia64: Use do_kernel_power_off()
  mips: Use do_kernel_power_off()
  nds32: Use do_kernel_power_off()
  parisc: Use do_kernel_power_off()
  powerpc: Use do_kernel_power_off()
  riscv: Use do_kernel_power_off()
  sh: Use do_kernel_power_off()
  x86: Use do_kernel_power_off()
  m68k: Switch to new power-handler API
  memory: emif: Use kernel_can_power_off()
  ACPI: power: Switch to power-handler API
  regulator: pfuze100: Use devm_register_power_handler()
  reboot: Remove pm_power_off_prepare()
  soc/tegra: pmc: Utilize power-handler API to power off Nexus 7
    properly
  mfd: ntxec: Use devm_register_power_handler()
  mfd: rn5t618: Use devm_register_power_handler()
  mfd: acer-a500: Use devm_register_power_handler()
  mfd: ene-kb3930: Use devm_register_power_handler()
  mfd: axp20x: Use register_simple_power_off_handler()
  mfd: retu: Use devm_register_simple_power_off_handler()
  mfd: rk808: Use devm_register_simple_power_off_handler()
  mfd: palmas: Use devm_register_simple_power_off_handler()
  mfd: max8907: Use devm_register_simple_power_off_handler()
  mfd: tps6586x: Use devm_register_simple_power_off_handler()
  mfd: tps65910: Use devm_register_simple_power_off_handler()
  mfd: max77620: Use devm_register_simple_power_off_handler()
  mfd: dm355evm_msp: Use devm_register_trivial_power_off_handler()
  mfd: twl4030: Use devm_register_trivial_power_off_handler()
  mfd: ab8500: Use devm_register_trivial_power_off_handler()
  reset: ath79: Use devm_register_simple_restart_handler()
  reset: intel-gw: Use devm_register_simple_restart_handler()
  reset: lpc18xx: Use devm_register_prioritized_restart_handler()
  reset: npcm: Use devm_register_prioritized_restart_handler()

 arch/arm/kernel/reboot.c               |   4 +-
 arch/arm64/kernel/process.c            |   3 +-
 arch/csky/kernel/power.c               |   6 +-
 arch/ia64/kernel/process.c             |   4 +-
 arch/m68k/emu/natfeat.c                |   3 +-
 arch/m68k/include/asm/machdep.h        |   1 -
 arch/m68k/kernel/process.c             |   5 +-
 arch/m68k/kernel/setup_mm.c            |   1 -
 arch/m68k/kernel/setup_no.c            |   1 -
 arch/m68k/mac/config.c                 |   4 +-
 arch/mips/kernel/reset.c               |   3 +-
 arch/nds32/kernel/process.c            |   3 +-
 arch/parisc/kernel/process.c           |   4 +-
 arch/powerpc/kernel/setup-common.c     |   4 +-
 arch/powerpc/xmon/xmon.c               |   3 +-
 arch/riscv/kernel/reset.c              |  12 +-
 arch/sh/kernel/reboot.c                |   3 +-
 arch/x86/kernel/reboot.c               |   4 +-
 arch/x86/xen/enlighten_pv.c            |   4 +-
 drivers/acpi/sleep.c                   |  25 +-
 drivers/memory/emif.c                  |   2 +-
 drivers/mfd/ab8500-sysctrl.c           |  17 +-
 drivers/mfd/acer-ec-a500.c             |  52 +--
 drivers/mfd/axp20x.c                   |  22 +-
 drivers/mfd/dm355evm_msp.c             |  20 +-
 drivers/mfd/ene-kb3930.c               |  45 +-
 drivers/mfd/max77620.c                 |  21 +-
 drivers/mfd/max8907.c                  |  22 +-
 drivers/mfd/ntxec.c                    |  50 +-
 drivers/mfd/palmas.c                   |  24 +-
 drivers/mfd/retu-mfd.c                 |  31 +-
 drivers/mfd/rk808.c                    |  23 +-
 drivers/mfd/rn5t618.c                  |  56 +--
 drivers/mfd/tps6586x.c                 |  21 +-
 drivers/mfd/tps65910.c                 |  17 +-
 drivers/mfd/twl4030-power.c            |  10 +-
 drivers/regulator/pfuze100-regulator.c |  39 +-
 drivers/reset/reset-ath79.c            |  15 +-
 drivers/reset/reset-intel-gw.c         |  13 +-
 drivers/reset/reset-lpc18xx.c          |  14 +-
 drivers/reset/reset-npcm.c             |  14 +-
 drivers/soc/tegra/pmc.c                |  54 ++-
 include/linux/mfd/axp20x.h             |   1 +
 include/linux/notifier.h               |  37 +-
 include/linux/pm.h                     |   1 -
 include/linux/reboot.h                 | 216 ++++++++-
 kernel/notifier.c                      |  88 ++++
 kernel/power/hibernate.c               |   2 +-
 kernel/reboot.c                        | 615 ++++++++++++++++++++++++-
 49 files changed, 1209 insertions(+), 430 deletions(-)

-- 
2.33.1


