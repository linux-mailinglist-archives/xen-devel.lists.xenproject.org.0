Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7C4B6901
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272921.467927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusR-0003BA-DK; Tue, 15 Feb 2022 10:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272921.467927; Tue, 15 Feb 2022 10:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusR-00038H-AF; Tue, 15 Feb 2022 10:16:07 +0000
Received: by outflank-mailman (input) for mailman id 272921;
 Tue, 15 Feb 2022 10:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nJusP-0002aj-JW
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:16:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 47180bb0-8e48-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 11:16:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10141063;
 Tue, 15 Feb 2022 02:16:01 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FF323F66F;
 Tue, 15 Feb 2022 02:16:00 -0800 (PST)
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
X-Inumbo-ID: 47180bb0-8e48-11ec-b215-9bbe72dcb22c
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/5] Boot time cpupools
Date: Tue, 15 Feb 2022 10:15:46 +0000
Message-Id: <20220215101551.23101-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduces a feature for Xen to create cpu pools at boot time, the
feature is enabled using a configurable that is disabled by default.
The boot time cpupool feature relies on the device tree to describe the cpu
pools.
Another feature is introduced by the serie, the possibility to assign a
dom0less guest to a cpupool at boot time.

Here follows an example, Xen is built with CONFIG_BOOT_TIME_CPUPOOLS=y.

From the DT:

  [...]

  a72_0: cpu@0 {
    compatible = "arm,cortex-a72";
    reg = <0x0 0x0>;
    device_type = "cpu";
    [...]
  };

  a72_1: cpu@1 {
    compatible = "arm,cortex-a72";
    reg = <0x0 0x1>;
    device_type = "cpu";
    [...]
  };

  a53_0: cpu@100 {
    compatible = "arm,cortex-a53";
    reg = <0x0 0x100>;
    device_type = "cpu";
    [...]
  };

  a53_1: cpu@101 {
    compatible = "arm,cortex-a53";
    reg = <0x0 0x101>;
    device_type = "cpu";
    [...]
  };

  a53_2: cpu@102 {
    compatible = "arm,cortex-a53";
    reg = <0x0 0x102>;
    device_type = "cpu";
    [...]
  };

  a53_3: cpu@103 {
    compatible = "arm,cortex-a53";
    reg = <0x0 0x103>;
    device_type = "cpu";
    [...]
  };

  chosen {
    #size-cells = <0x1>;
    #address-cells = <0x1>;
    xen,dom0-bootargs = "...";
    xen,xen-bootargs = "...";

    cpupool0 {
      compatible = "xen,cpupool";
      cpupool-id = <0>;
      cpupool-cpus = <&a72_0 &a72_1>;
    };

    cp1: cpupool1 {
      compatible = "xen,cpupool";
      cpupool-id = <1>;
      cpupool-cpus = <&a53_0 &a53_1 &a53_2 &a53_3>;
      cpupool-sched = "null";
    };

    module@0 {
      reg = <0x80080000 0x1300000>;
      compatible = "multiboot,module";
    };

    domU1 {
      #size-cells = <0x1>;
      #address-cells = <0x1>;
      compatible = "xen,domain";
      cpus = <1>;
      memory = <0 0xC0000>;
      vpl011;
      domain-cpupool = <&cp1>;

      module@92000000 {
        compatible = "multiboot,kernel", "multiboot,module";
        reg = <0x92000000 0x1ffffff>;
        bootargs = "...";
      };
    };
  };

  [...]

The example DT is instructing Xen to have two cpu pools, the one with id 0
having two phisical cpus and the one with id 1 having 4 phisical cpu, the
second cpu pool uses the null scheduler and from the /chosen node we can see
that a dom0less guest will be started on that cpu pool.

In this particular case Xen must boot with different type of cpus, so the
boot argument hmp_unsafe must be enabled.

Luca Fancellu (5):
  tools/cpupools: Give a name to unnamed cpupools
  xen/sched: create public function for cpupools creation
  xen/sched: retrieve scheduler id by name
  xen/cpupool: Create different cpupools at boot time
  arm/dom0less: assign dom0less guests to cpupools

 docs/misc/arm/device-tree/booting.txt  |   5 ++
 docs/misc/arm/device-tree/cpupools.txt | 118 +++++++++++++++++++++++++
 tools/helpers/xen-init-dom0.c          |  26 +++++-
 tools/libs/light/libxl_utils.c         |   3 +-
 xen/arch/arm/Kconfig                   |   9 ++
 xen/arch/arm/Makefile                  |   1 +
 xen/arch/arm/cpupool.c                 | 118 +++++++++++++++++++++++++
 xen/arch/arm/domain.c                  |   6 ++
 xen/arch/arm/domain_build.c            |   9 +-
 xen/arch/x86/domain.c                  |   6 ++
 xen/common/domain.c                    |   5 +-
 xen/common/sched/core.c                |  11 +++
 xen/common/sched/cpupool.c             |  30 ++++++-
 xen/include/public/arch-arm.h          |   2 +
 xen/include/public/domctl.h            |   2 +-
 xen/include/xen/domain.h               |   3 +
 xen/include/xen/sched.h                |  39 ++++++++
 17 files changed, 386 insertions(+), 7 deletions(-)
 create mode 100644 docs/misc/arm/device-tree/cpupools.txt
 create mode 100644 xen/arch/arm/cpupool.c

-- 
2.17.1


