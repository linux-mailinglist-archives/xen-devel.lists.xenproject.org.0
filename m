Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB0447707
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222874.385279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspF-0004QC-Lx; Mon, 08 Nov 2021 00:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222874.385279; Mon, 08 Nov 2021 00:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspF-0004NB-HU; Mon, 08 Nov 2021 00:47:53 +0000
Received: by outflank-mailman (input) for mailman id 222874;
 Mon, 08 Nov 2021 00:47:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspD-0004MH-AV
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:47:51 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e283a56-402d-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 01:47:47 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id e9so5702603ljl.5
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:47:47 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:46 -0800 (PST)
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
X-Inumbo-ID: 7e283a56-402d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AnGTim9m4rf1XLwn/ELN0sZCzuOcJdLe86U7paP+yQ=;
        b=ni13262nQh3GX0h+BPQyrs85JRUzaWz8PTTW1ehXiMuJGu1Ze+O6oA+cTLQeD5Hu4S
         aIUejstQov0r9q7FmiaLuF+gYTZL3eYolS1kQprSozhbudB00Wpmvyv/Ibx+kYr/f2ol
         fpa+emXtKS+ULegWlJMkpBsUqNU+LUnr8b2Ielf6GYvhamqJqJ4iU+26oqIvJYLhTmiz
         7/d5EU2cOI+EmtDwT6uDZVFvp+RGANCxJ+fUlUfDE+cPDc1mzk9RG3KztMGzfZYfJS0H
         L2NeIRkXoa3/MmqxU00dVJoI3pTMIH9pcEYdrlibnl51ATyPLSbW9nEf5TJH1P9UDiFh
         SjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AnGTim9m4rf1XLwn/ELN0sZCzuOcJdLe86U7paP+yQ=;
        b=API1FJmojQGr1mNcsKEMHzBqDYEwliljwIY4/7vMWyHSYPKcHWg55zh5OrS1RAMeDI
         WQNppj10ALTbdwF8cO9Ckbi3Yx9SITXHl37GDiod43tssGaVax9+1e+wvMv6jwKwRIgu
         KzOlH0jNJ2K/PCMQs6IMnrh9DeNWZjkFx2WmE1Ze8BiTK3rteCoABGNGyJhsURxt4mPw
         OpUZpxge/3BiZacHjsK7rqRVx7gszciJpnfHIEzs6nnZ29k/+dx90Z/xcgVNzbnKclox
         rjqTr+W9SIor1HlYMP28LbV6FIFP6YBVwycz8qQFxo7wm05m4BqUYz5FiijUd0su5sGx
         V04A==
X-Gm-Message-State: AOAM532RAelFBHbPJepxq2W+pXns083s0677n0Sw9Wthpsy+pTn8dfvu
	mJKPgdrnd4OgVB8PAxUPwxE=
X-Google-Smtp-Source: ABdhPJygsbd62AYwVWr/FbjY9E+4XNsUMriRPDZTTc6CoomG/9GH2yuj3/kx3X6KSzqjBHkqxGUtsg==
X-Received: by 2002:a2e:391b:: with SMTP id g27mr79531744lja.126.1636332467262;
        Sun, 07 Nov 2021 16:47:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
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
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 00/25] Introduce power-off+restart call chain API
Date: Mon,  8 Nov 2021 03:44:59 +0300
Message-Id: <20211108004524.29465-1-digetx@gmail.com>
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

It's fully implemented here:

[1] https://github.com/grate-driver/linux/commits/sys-off-handler

For now I'm sending only the first 25 base patches out of ~180. It's
preferable to squash 1-2, partially 3 and 4 points of the plan into a
single patchset to ease and speed up applying of the rest of the patches.
Majority of drivers and platform patches depend on the base, hence they
will come later (and per subsystem), once base will land.

All [1] patches are compile-tested. Tegra and x86 ACPI patches are tested
on hardware. The remaining should be covered by unit tests (unpublished).

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

v3: - Renamed power_handler to sys_off_handler as was suggested by
      Rafael Wysocki.

    - Improved doc-comments as was suggested by Rafael Wysocki. Added more
      doc-comments.

    - Implemented full set of 180 patches which convert whole kernel in
      accordance to the plan, see link [1] above. Slightly adjusted API to
      better suit for the remaining converted drivers.

      * Added unregister_sys_off_handler() that is handy for a couple old
        platform drivers.

      * Dropped devm_register_trivial_restart_handler(), 'simple' variant
        is enough to have.

    - Improved "Add atomic/blocking_notifier_has_unique_priority()" patch,
      as was suggested by Andy Shevchenko. Also replaced down_write() with
      down_read() and factored out common notifier_has_unique_priority().

    - Added stop_chain field to struct restart_data and reboot_prep_data
      after discovering couple drivers wanting that feature.

    - Added acks that were given to v2.

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

Dmitry Osipenko (25):
  notifier: Remove extern annotation from function prototypes
  notifier: Add blocking_notifier_call_chain_is_empty()
  notifier: Add atomic/blocking_notifier_has_unique_priority()
  reboot: Correct typo in a comment
  reboot: Warn if restart handler has duplicated priority
  reboot: Warn if unregister_restart_handler() fails
  reboot: Remove extern annotation from function prototypes
  kernel: Add combined power-off+restart handler call chain API
  ARM: Use do_kernel_power_off()
  csky: Use do_kernel_power_off()
  riscv: Use do_kernel_power_off()
  arm64: Use do_kernel_power_off()
  parisc: Use do_kernel_power_off()
  xen/x86: Use do_kernel_power_off()
  sh: Use do_kernel_power_off()
  x86: Use do_kernel_power_off()
  ia64: Use do_kernel_power_off()
  mips: Use do_kernel_power_off()
  nds32: Use do_kernel_power_off()
  powerpc: Use do_kernel_power_off()
  m68k: Switch to new sys-off handler API
  memory: emif: Use kernel_can_power_off()
  ACPI: power: Switch to sys-off handler API
  regulator: pfuze100: Use devm_register_sys_off_handler()
  reboot: Remove pm_power_off_prepare()

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
 drivers/regulator/pfuze100-regulator.c |  38 +-
 include/linux/notifier.h               |  37 +-
 include/linux/pm.h                     |   1 -
 include/linux/reboot.h                 | 305 ++++++++++++--
 kernel/notifier.c                      |  83 ++++
 kernel/power/hibernate.c               |   2 +-
 kernel/reboot.c                        | 556 ++++++++++++++++++++++++-
 28 files changed, 985 insertions(+), 136 deletions(-)

-- 
2.33.1


