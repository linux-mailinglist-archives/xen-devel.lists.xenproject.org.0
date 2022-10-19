Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C675F604075
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 11:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425702.673697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol5pm-0003jS-Jz; Wed, 19 Oct 2022 09:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425702.673697; Wed, 19 Oct 2022 09:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol5pm-0003he-Gd; Wed, 19 Oct 2022 09:57:58 +0000
Received: by outflank-mailman (input) for mailman id 425702;
 Wed, 19 Oct 2022 09:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Se4D=2U=virtuozzo.com=alexander.atanasov@srs-se1.protection.inumbo.net>)
 id 1ol5pl-0003hY-1w
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 09:57:57 +0000
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ca944c-4f94-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 11:57:55 +0200 (CEST)
Received: from dev011.ch-qa.sw.ru ([172.29.1.16])
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <alexander.atanasov@virtuozzo.com>)
 id 1ol5lV-00B8K8-SR; Wed, 19 Oct 2022 11:56:24 +0200
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
X-Inumbo-ID: 80ca944c-4f94-11ed-8fd0-01056ac49cbb
From: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
To: 
Cc: kernel@openvz.org,
	Alexander Atanasov <alexander.atanasov@virtuozzo.com>,
	kernel test robot <lkp@intel.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Wei Liu <wei.liu@kernel.org>,
	Nadav Amit <namit@vmware.com>,
	pv-drivers@vmware.com,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v5 0/8] Make balloon drivers' memory changes known to the rest of the kernel
Date: Wed, 19 Oct 2022 12:56:12 +0300
Message-Id: <20221019095620.124909-1-alexander.atanasov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently balloon drivers (Virtio,XEN, HyperV, VMWare, ...)
inflate and deflate the guest memory size but there is no
way to know how much the memory size is changed by them.

Make it possible for the drivers to report the values to mm core.

Display reported InflatedTotal and InflatedFree in /proc/meminfo
and print these values on OOM and sysrq from show_mem().

The two values are the result of the two modes the drivers work
with using adjust_managed_page_count or without.

In earlier versions, there was a notifier for these changes
but after discussion - it is better to implement it in separate
patch series. Since it came out as larger work than initially expected.

Amount of inflated memory can be used:
 - totalram_pages() users working with drivers not using
    adjust_managed_page_count
 - si_meminfo(..) users can improve calculations
 - by userspace software that monitors memory pressure

Alexander Atanasov (8):
  mm: Make a place for a common balloon code
  mm: Enable balloon drivers to report inflated memory
  mm: Display inflated memory to users
  mm: Display inflated memory in logs
  drivers: virtio: balloon - report inflated memory
  drivers: vmware: balloon - report inflated memory
  drivers: hyperv: balloon - report inflated memory
  documentation: create a document about how balloon drivers operate

 Documentation/filesystems/proc.rst            |   6 +
 Documentation/mm/balloon.rst                  | 138 ++++++++++++++++++
 MAINTAINERS                                   |   4 +-
 arch/powerpc/platforms/pseries/cmm.c          |   2 +-
 drivers/hv/hv_balloon.c                       |  12 ++
 drivers/misc/vmw_balloon.c                    |   3 +-
 drivers/virtio/virtio_balloon.c               |   7 +-
 fs/proc/meminfo.c                             |  10 ++
 .../linux/{balloon_compaction.h => balloon.h} |  18 ++-
 lib/show_mem.c                                |   8 +
 mm/Makefile                                   |   2 +-
 mm/{balloon_compaction.c => balloon.c}        |  19 ++-
 mm/migrate.c                                  |   1 -
 mm/vmscan.c                                   |   1 -
 14 files changed, 213 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/mm/balloon.rst
 rename include/linux/{balloon_compaction.h => balloon.h} (91%)
 rename mm/{balloon_compaction.c => balloon.c} (94%)

v4->v5:
 - removed notifier
 - added documentation
 - vmware update after op is done , outside of the mutex
v3->v4:
 - add support in hyperV and vmware balloon drivers
 - display balloon memory in show_mem so it is logged on OOM and on sysrq
v2->v3:
 - added missed EXPORT_SYMBOLS
Reported-by: kernel test robot <lkp@intel.com>
 - instead of balloon_common.h just use balloon.h (yes, naming is hard)
 - cleaned up balloon.h - remove from files that do not use it and
   remove externs from function declarations
v1->v2:
 - reworked from simple /proc/meminfo addition

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Nadav Amit <namit@vmware.com>
Cc: pv-drivers@vmware.com
Cc: Jason Wang <jasowang@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: linux-hyperv@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.31.1


