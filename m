Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC306EDD5D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 09:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525750.817141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDXy-000551-Ud; Tue, 25 Apr 2023 07:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525750.817141; Tue, 25 Apr 2023 07:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDXy-00053K-Rx; Tue, 25 Apr 2023 07:57:10 +0000
Received: by outflank-mailman (input) for mailman id 525750;
 Tue, 25 Apr 2023 07:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xGP=AQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prDXx-00053E-LZ
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 07:57:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c6179361-e33e-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 09:57:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C6BB4B3;
 Tue, 25 Apr 2023 00:57:50 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CCFFC3F587;
 Tue, 25 Apr 2023 00:57:02 -0700 (PDT)
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
X-Inumbo-ID: c6179361-e33e-11ed-b223-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 00/17] Device tree based NUMA support for Arm - Part#3
Date: Tue, 25 Apr 2023 15:56:38 +0800
Message-Id: <20230425075655.4037980-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Henry: Following the offline discussion with Wei, I will be
the one to follow-up the upstream comments for this series.)

The preparation work to support NUMA on Arm has been merged
and can be found at [1] and [2]. The initial discussions of
the Arm NUMA support can be found at [3].

- Background of this series:

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts.

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on FVP in
Arm64 mode with NUMA configs in device tree and one HPE x86
NUMA machine.

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2022-11/msg01043.html
[3] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

v3 -> v4:
1. s/definition/declaration/ in commit message.
2. Add Acked-by tag from Jan for non-Arm parts.
3. Drop unnecessary initializer for node_distance_map. Pre-set the
   distance map to NUMA_NO_DISTANCE.
4. Drop NUMA_DISTANCE_UDF_MIN and its usage.
5. Drop EXPORT_SYMBOL(__node_distance).
6. Rework __node_distance()'s return value logic.
7. The distance map default value is now NUMA_NO_DISTANCE, update
   the logic accordingly and add in-code comment as a note.
8. Add Acked-by tag from Jan for related patches.

Henry Wang (1):
  xen/arm: Set correct per-cpu cpu_core_mask

Wei Chen (16):
  xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
  xen/arm: implement helpers to get and update NUMA status
  xen/arm: implement node distance helpers for Arm
  xen/arm: use arch_get_ram_range to get memory ranges from bootinfo
  xen/arm: build NUMA cpu_to_node map in dt_smp_init_cpus
  xen/arm: Add boot and secondary CPU to NUMA system
  xen/arm: introduce a helper to parse device tree processor node
  xen/arm: introduce a helper to parse device tree memory node
  xen/arm: introduce a helper to parse device tree NUMA distance map
  xen/arm: unified entry to parse all NUMA data from device tree
  xen/arm: keep guest still be NUMA unware
  xen/arm: enable device tree based NUMA in system init
  xen/arm: implement numa_node_to_arch_nid for device tree NUMA
  xen/arm: use CONFIG_NUMA to gate node_online_map in smpboot
  xen/arm: Provide Kconfig options for Arm to enable NUMA
  docs: update numa command line to support Arm

 SUPPORT.md                        |   1 +
 docs/misc/xen-command-line.pandoc |   2 +-
 xen/arch/arm/Kconfig              |  11 ++
 xen/arch/arm/Makefile             |   2 +
 xen/arch/arm/domain_build.c       |   6 +
 xen/arch/arm/include/asm/numa.h   |  91 +++++++++-
 xen/arch/arm/numa.c               | 188 +++++++++++++++++++
 xen/arch/arm/numa_device_tree.c   | 291 ++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c              |  17 ++
 xen/arch/arm/smpboot.c            |  38 ++++
 xen/arch/x86/include/asm/numa.h   |   1 -
 xen/arch/x86/srat.c               |   2 +-
 xen/include/xen/numa.h            |  10 +
 13 files changed, 656 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/numa.c
 create mode 100644 xen/arch/arm/numa_device_tree.c

-- 
2.25.1


