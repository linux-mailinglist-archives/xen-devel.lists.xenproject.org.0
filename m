Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0873973F984
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 12:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555955.868164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5Ue-00018U-0y; Tue, 27 Jun 2023 10:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555955.868164; Tue, 27 Jun 2023 10:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5Ud-00016p-TT; Tue, 27 Jun 2023 10:00:15 +0000
Received: by outflank-mailman (input) for mailman id 555955;
 Tue, 27 Jun 2023 09:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8So=CP=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qE5Q7-0008Sr-Rj
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 09:55:35 +0000
Received: from frasgout11.his.huawei.com (unknown [14.137.139.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c02b6ce2-14d0-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 11:55:31 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4Qr0DQ65dFz9v7Gq
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 17:44:38 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.45.153.185])
 by APP1 (Coremail) with SMTP id LxC2BwBnwdzesZpknnvHAw--.39096S2;
 Tue, 27 Jun 2023 10:54:59 +0100 (CET)
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
X-Inumbo-ID: c02b6ce2-14d0-11ee-8611-37d641c3527e
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kees Cook <keescook@chromium.org>,
	Saravana Kannan <saravanak@google.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	petr@tesarici.cz
Subject: [PATCH v3 0/7] Allow dynamic allocation of software IO TLB bounce buffers
Date: Tue, 27 Jun 2023 11:54:22 +0200
Message-Id: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwBnwdzesZpknnvHAw--.39096S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr1DZF1kWr45Zr1DCr18uFg_yoWfWrWkpF
	WrK34xtF4qqryfAwn7Ca1UGryrK3WkCry5G3yFvryrur13Cw1j93Z7tayrXFyUGrW0vF1j
	qFyjvw17uw1DX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9S14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3
	Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
	1UYxBIdaVFxhVjvjDU0xZFpf9x0JU7CzZUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

Note: This patch series depends on fixes from this thread:

https://lore.kernel.org/linux-iommu/cover.1687784289.git.petr.tesarik.ext@huawei.com/T/

Motivation
==========

The software IO TLB was designed with these assumptions:

1) It would not be used much. Small systems (little RAM) don't need it, and
   big systems (lots of RAM) would have modern DMA controllers and an IOMMU
   chip to handle legacy devices.
2) A small fixed memory area (64 MiB by default) is sufficient to
   handle the few cases which require a bounce buffer.
3) 64 MiB is little enough that it has no impact on the rest of the
   system.
4) Bounce buffers require large contiguous chunks of low memory. Such
   memory is precious and can be allocated only early at boot.

It turns out they are not always true:

1) Embedded systems may have more than 4GiB RAM but no IOMMU and legacy
   32-bit peripheral busses and/or DMA controllers.
2) CoCo VMs use bounce buffers for all I/O but may need substantially more
   than 64 MiB.
3) Embedded developers put as many features as possible into the available
   memory. A few dozen "missing" megabytes may limit what features can be
   implemented.
4) If CMA is available, it can allocate large continuous chunks even after
   the system has run for some time.

Goals
=====

The goal of this work is to start with a small software IO TLB at boot and
expand it later when/if needed.

Design
======

This version of the patch series retains the current slot allocation
algorithm with multiple areas to reduce lock contention, but additional
slots can be added when necessary.

These alternatives have been considered:

- Allocate and free buffers as needed using direct DMA API. This works
  quite well, except in CoCo VMs where each allocation/free requires
  decrypting/encrypting memory, which is a very expensive operation.

- Allocate a very large software IO TLB at boot, but allow to migrate pages
  to/from it (like CMA does). For systems with CMA, this would mean two big
  allocations at boot. Finding the balance between CMA, SWIOTLB and rest of
  available RAM can be challenging. More importantly, there is no clear
  benefit compared to allocating SWIOTLB memory pools from the CMA.

Implementation Constraints
==========================

These constraints have been taken into account:

1) Minimize impact on devices which do not benefit from the change.
2) Minimize the number of memory decryption/encryption operations.
3) Avoid contention on a lock or atomic variable to preserve parallel
   scalability.

Additionally, the software IO TLB code is also used to implement restricted
DMA pools. These pools are restricted to a pre-defined physical memory
region and must not use any other memory. In other words, dynamic
allocation of memory pools must be disabled for restricted DMA pools.

Data Structures
===============

The existing struct io_tlb_mem is the central type for a SWIOTLB allocator,
but it now contains multiple memory pools::

  io_tlb_mem
  +---------+   io_tlb_pool
  | SWIOTLB | 	+-------+   +-------+   +-------+
  |allocator|-->|default|-->|dynamic|-->|dynamic|-->...
  |    	    |  	|memory |   |memory |   |memory |
  +---------+ 	| pool  |   | pool  |   | pool  |
	      	+-------+   +-------+   +-------+

The allocator structure contains global state (such as flags and counters)
and structures needed to schedule new allocations. Each memory pool
contains the actual buffer slots and metadata. The first memory pool in the
list is the default memory pool allocated statically at early boot.

New memory pools are allocated from a kernel worker thread. That's because
bounce buffers are allocated when mapping a DMA buffer, which may happen in
interrupt context where large atomic allocations would probably fail.
Allocation from process context is much more likely to succeed, especially
if it can use CMA.

Nonetheless, the onset of a load spike may fill up the SWIOTLB before the
worker has a chance to run. In that case, try to allocate a small transient
memory pool to accommodate the request. If memory is encrypted and the
device cannot do DMA to encrypted memory, this buffer is allocated from the
coherent atomic DMA memory pool. Reducing the size of SWIOTLB may therefore
require increasing the size of the coherent pool with the "coherent_pool"
command-line parameter.

Performance
===========

All testing compared a vanilla v6.4-rc6 kernel with a fully patched
kernel. The kernel was booted with "swiotlb=force" to allow stress-testing
the software IO TLB on a high-performance device that would otherwise not
need it. CONFIG_DEBUG_FS was set to 'y' to match the configuration of
popular distribution kernels; it is understood that parallel workloads
suffer from contention on the recently added debugfs atomic counters.

These benchmarks were run:

- small: single-threaded I/O of 4 KiB blocks,
- big: single-threaded I/O of 64 KiB blocks,
- 4way: 4-way parallel I/O of 4 KiB blocks.

In all tested cases, the default 64 MiB SWIOTLB would be sufficient (but
wasteful). The "default" pair of columns shows performance impact when
booted with 64 MiB SWIOTLB (i.e. current state). The "growing" pair of
columns shows the impact when booted with a 1 MiB initial SWIOTLB, which
grew to 5 MiB at run time. The "var" column in the tables below is the
coefficient of variance over 5 runs of the test, the "diff" column is the
difference in read-write I/O bandwidth (MiB/s). The very first column is
the coefficient of variance in the results of the base unpatched kernel.

First, on an x86 VM against a QEMU virtio SATA driver backed by a RAM-based
block device on the host:

	base	   default	   growing
	var	var	diff	var	diff
small	1.96%	0.47%	-1.5%	0.52%	-2.2%
big	2.03%	1.35%	+0.9%	2.22%	+2.9%
4way	0.80%	0.45%	-0.7%	1.22%	<0.1%

Second, on a Raspberry Pi4 with 8G RAM and a class 10 A1 microSD card:

	base	   default	   growing
	var	var	diff	var	diff
small	1.09%	1.69%	+0.5%	2.14%	-0.2%
big	0.03%	0.28%	-0.5%	0.03%	-0.1%
4way	5.15%	2.39%	+0.2%	0.66%	<0.1%

Third, on a CoCo VM. This was a bigger system, so I also added a 24-thread
parallel I/O test:

	base	   default	   growing
	var	var	diff	var	diff
small	2.41%	6.02%	+1.1%	10.33%	+6.7%
big	9.20%	2.81%	-0.6%	16.84%	-0.2%
4way	0.86%	2.66%	-0.1%	 2.22%	-4.9%
24way	3.19%	6.19%	+4.4%	 4.08%	-5.9%

Note the increased variance of the CoCo VM, although the host was not
otherwise loaded. These are caused by the first run, which includes the
overhead of allocating additional bounce buffers and sharing them with the
hypervisor. The system was not rebooted between successive runs.

Parallel tests suffer from a reduced number of areas in the dynamically
allocated memory pools. This can be improved by allocating a larger pool
from CMA (not implemented in this series yet).

I have no good explanation for the increase in performance of the
24-thread I/O test with the default (non-growing) memory pool. Although the
difference is within variance, it seems to be real. The average bandwidth
is consistently above that of the unpatched kernel.

To sum it up:

- All workloads benefit from reduced memory footprint.
- No performance regressions have been observed with the default size of
  the software IO TLB.
- Most workloads retain their former performance even if the software IO
  TLB grows at run time.

Changelog
=========

Changes from v2:
- Complete rewrite using dynamically allocated memory pools rather
  than a list of individual buffers
- Depend on other SWIOTLB fixes (already sent)
- Fix Xen and MIPS Octeon builds

Changes from RFC:
- Track dynamic buffers per device instead of per swiotlb
- Use a linked list instead of a maple tree
- Move initialization of swiotlb fields of struct device to a
  helper function
- Rename __lookup_dyn_slot() to lookup_dyn_slot_locked()
- Introduce per-device flag if dynamic buffers are in use
- Add one more user of DMA_ATTR_MAY_SLEEP
- Add kernel-doc comments for new (and some old) code
- Properly escape '*' in dma-attributes.rst

Petr Tesarik (7):
  swiotlb: make io_tlb_default_mem local to swiotlb.c
  swiotlb: add documentation and rename swiotlb_do_find_slots()
  swiotlb: separate memory pool data from other allocator data
  swiotlb: if swiotlb is full, fall back to a transient memory pool
  swiotlb: determine potential physical address limit
  swiotlb: allocate a new memory pool when existing pools are full
  swiotlb: search the software IO TLB only if a device makes use of it

 arch/arm/xen/mm.c           |   2 +-
 arch/mips/pci/pci-octeon.c  |   2 +-
 arch/x86/kernel/pci-dma.c   |   2 +-
 drivers/base/core.c         |   4 +-
 drivers/xen/swiotlb-xen.c   |   2 +-
 include/linux/device.h      |   8 +-
 include/linux/dma-mapping.h |   2 +
 include/linux/swiotlb.h     | 103 +++++--
 kernel/dma/direct.c         |   2 +-
 kernel/dma/swiotlb.c        | 591 ++++++++++++++++++++++++++++++++----
 10 files changed, 618 insertions(+), 100 deletions(-)

-- 
2.25.1


