Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912CF471D21
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 22:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245684.423795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0Q-0004Dl-OS; Sun, 12 Dec 2021 21:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245684.423795; Sun, 12 Dec 2021 21:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0Q-0004Bf-Kp; Sun, 12 Dec 2021 21:03:38 +0000
Received: by outflank-mailman (input) for mailman id 245684;
 Sun, 12 Dec 2021 21:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lDYB=Q5=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mwW0O-0004BS-Ll
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 21:03:36 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f80bea00-5b8e-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 22:03:34 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id bi37so27479295lfb.5
 for <xen-devel@lists.xenproject.org>; Sun, 12 Dec 2021 13:03:34 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:33 -0800 (PST)
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
X-Inumbo-ID: f80bea00-5b8e-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hjwuoJXbPZqya2Ql77uhrL181Upp/BNSFK3UGdZout4=;
        b=ZTR2gUvyc9Jk5H+625D+27T8YU6HUrFsdK+BZyYfXpdNoXxUtwpTyTDUwQwSoWyAeA
         QFmZHgZvzJL+TIWFKVztnITYG7r69wY54DReamkmJrNyC5F8V31YP9UAb7aS604CvcWC
         PpYufCxFX9cI9tGhmFev8cFbV2bIWnqyJ3SdeFqNZY07YSxk3vIjdtuuA8o/q/24/aii
         aobWphT0H7EQjwcoYgFJLbNeNvNuu0lmYffu98yb9vV5FJtExOgOE1T9n9aV4v6f/Z6B
         +Yc6S5rcBcvJ1Z1VB0qAHH/b2xLT7iNMzwo+545QUrJKoxXAoBFxsoFyCoGb5v5oQmAB
         Ozhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hjwuoJXbPZqya2Ql77uhrL181Upp/BNSFK3UGdZout4=;
        b=Jx1yWUHD6llR8bRRdSp6n98gBCKOopvtoLRKlncEeYlShMCAb5DYw63+K2dEEEAAvI
         apEUGMuOXSucasUwx0t9mQ0QmU+aHUY6PR7lLi+6dplXXUkRudhqzYnRUNXJ4aCE2M59
         AfPWaz+U3vLA7b9YUf/DIGQSL2vPoHlhEmQAvWXk32ILTypPW3i6HzIHBYQrNC/yjmzD
         6K+nPzFHQJSvlgQfQM+1Y8uRcSgtTNrp000brq7SR9sifpey9mimH1jlrrXhz41AhOQl
         iAs1k3yJJlGJ+Q6uDHVO/sNJhnqGV52HN9rIpbKIlTFS7WSdUt5aE24jsXTNkVWURBZ5
         az7A==
X-Gm-Message-State: AOAM530kFLZT0hlegG878FeCKpozaBd4FND/GzWR712QIdCReI4r+6Fs
	J6GREttsi8bt6hptoPpqvW8=
X-Google-Smtp-Source: ABdhPJzOMSp2mVNpJZWWIsHm+nM6vM9pY+/hpJjTOTmBtHA3G5sqnYRTvIv9wdStJAAqzYHraxEm1w==
X-Received: by 2002:a05:6512:1094:: with SMTP id j20mr24065288lfg.237.1639343014350;
        Sun, 12 Dec 2021 13:03:34 -0800 (PST)
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
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	alankao@andestech.com,
	"K . C . Kuen-Chern Lin" <kclin@andestech.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org,
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
Subject: [PATCH v5 00/21] Introduce power-off+restart call chain API
Date: Mon, 13 Dec 2021 00:02:48 +0300
Message-Id: <20211212210309.9851-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

6. Make uniqueness of the handlers' priority a mandatory requirement.

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

v5: - Dropped patches which cleaned up notifier/reboot headers, as was
      requested by Rafael Wysocki.

    - Dropped WARN_ON() from the code, as was requested by Rafael Wysocki.
      Replaced it with pr_err() appropriately.

    - Dropped *_notifier_has_unique_priority() functions and added
      *_notifier_chain_register_unique_prio() instead, as was suggested
      by Michał Mirosław and Rafael Wysocki.

    - Dropped export of blocking_notifier_call_chain_is_empty() symbol,
      as was suggested by Rafael Wysocki.

    - Michał Mirosław suggested that will be better to split up patch
      that adds the new API to ease reviewing, but Rafael Wysocki asked
      not add more patches, so I kept it as a single patch.

    - Added temporary "weak" stub for pm_power_off() which fixes linkage
      failure once symbol is removed from arch/* code. Previously I missed
      this problem because was only compile-testing object files.

v4: - Made a very minor improvement to doc comments, clarifying couple
      default values.

    - Corrected list of emails recipient by adding Linus, Sebastian,
      Philipp and more NDS people. Removed bouncing emails.

    - Added acks that were given to v3.

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

Dmitry Osipenko (21):
  notifier: Add blocking_notifier_call_chain_is_empty()
  notifier: Add atomic/blocking_notifier_chain_register_unique_prio()
  reboot: Print error message if restart handler has duplicated priority
  kernel: Add combined power-off+restart handler call chain API
  ARM: Use do_kernel_power_off()
  csky: Use do_kernel_power_off()
  riscv: Use do_kernel_power_off()
  arm64: Use do_kernel_power_off()
  parisc: Use do_kernel_power_off()
  xen/x86: Use do_kernel_power_off()
  powerpc: Use do_kernel_power_off()
  m68k: Switch to new sys-off handler API
  sh: Use do_kernel_power_off()
  x86: Use do_kernel_power_off()
  ia64: Use do_kernel_power_off()
  mips: Use do_kernel_power_off()
  nds32: Use do_kernel_power_off()
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
 include/linux/notifier.h               |   7 +
 include/linux/pm.h                     |   1 -
 include/linux/reboot.h                 | 265 +++++++++++-
 kernel/notifier.c                      | 100 ++++-
 kernel/power/hibernate.c               |   2 +-
 kernel/reboot.c                        | 574 ++++++++++++++++++++++++-
 28 files changed, 968 insertions(+), 118 deletions(-)

-- 
2.33.1


