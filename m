Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B8E4FC051
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 17:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303103.517110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndvqu-0005OG-Ce; Mon, 11 Apr 2022 15:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303103.517110; Mon, 11 Apr 2022 15:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndvqu-0005MM-8N; Mon, 11 Apr 2022 15:21:16 +0000
Received: by outflank-mailman (input) for mailman id 303103;
 Mon, 11 Apr 2022 15:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfOQ=UV=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ndvqs-0005M5-8P
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 15:21:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 04876fb6-b9ab-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 17:21:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 555DF1570;
 Mon, 11 Apr 2022 08:21:10 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AACE23F73B;
 Mon, 11 Apr 2022 08:21:08 -0700 (PDT)
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
X-Inumbo-ID: 04876fb6-b9ab-11ec-8fbc-03012f2f19d4
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 0/7] Boot time cpupools
Date: Mon, 11 Apr 2022 16:20:54 +0100
Message-Id: <20220411152101.17539-1-luca.fancellu@arm.com>
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
      cpupool-cpus = <&a72_0 &a72_1>;
      cpupool-sched = "credit2";
    };

    cp1: cpupool1 {
      compatible = "xen,cpupool";
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

The example DT is instructing Xen to have two cpu pools, one having two phisical
cpus and the one having 4 phisical cpus, the last mentioned cpu pool uses the
null scheduler and from the /chosen node we can see that a dom0less guest will
be started on that cpu pool.

In this particular case Xen must boot with different type of cpus, so the
boot argument hmp_unsafe must be enabled.

Luca Fancellu (7):
  tools/cpupools: Give a name to unnamed cpupools
  xen/sched: create public function for cpupools creation
  xen/sched: retrieve scheduler id by name
  xen/cpupool: Create different cpupools at boot time
  xen/cpupool: Don't allow removing cpu0 from cpupool0
  arm/dom0less: assign dom0less guests to cpupools
  xen/cpupool: Allow cpupool0 to use different scheduler

 MAINTAINERS                            |   2 +-
 docs/misc/arm/device-tree/booting.txt  |   5 +
 docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++
 tools/helpers/xen-init-dom0.c          |  37 +++-
 tools/libs/light/libxl_utils.c         |   3 +-
 xen/arch/arm/domain_build.c            |  19 +-
 xen/arch/arm/include/asm/smp.h         |   3 +
 xen/common/Kconfig                     |   7 +
 xen/common/domain.c                    |   2 +-
 xen/common/sched/Makefile              |   1 +
 xen/common/sched/boot-cpupool.c        | 234 +++++++++++++++++++++++++
 xen/common/sched/core.c                |  40 +++--
 xen/common/sched/cpupool.c             |  43 ++++-
 xen/include/public/domctl.h            |   5 +-
 xen/include/xen/sched.h                |  53 ++++++
 15 files changed, 563 insertions(+), 31 deletions(-)
 create mode 100644 docs/misc/arm/device-tree/cpupools.txt
 create mode 100644 xen/common/sched/boot-cpupool.c

-- 
2.17.1


