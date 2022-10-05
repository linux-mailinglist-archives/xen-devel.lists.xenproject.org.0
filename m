Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D25F5150
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 11:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415969.660604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og0KJ-0008B5-Ue; Wed, 05 Oct 2022 09:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415969.660604; Wed, 05 Oct 2022 09:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og0KJ-00087f-Rx; Wed, 05 Oct 2022 09:04:27 +0000
Received: by outflank-mailman (input) for mailman id 415969;
 Wed, 05 Oct 2022 09:04:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DGwH=2G=virtuozzo.com=alexander.atanasov@srs-se1.protection.inumbo.net>)
 id 1og0KH-00087Z-Ui
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 09:04:26 +0000
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b429a095-448c-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 11:04:23 +0200 (CEST)
Received: from dev011.ch-qa.sw.ru ([172.29.1.16])
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <alexander.atanasov@virtuozzo.com>)
 id 1og0GH-007ckN-N9; Wed, 05 Oct 2022 11:02:42 +0200
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
X-Inumbo-ID: b429a095-448c-11ed-9377-c1cf23e5d27e
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
Subject: [PATCH v4 0/7] Make balloon drivers memory changes known to the rest of the kernel
Date: Wed,  5 Oct 2022 12:01:50 +0300
Message-Id: <20221005090158.2801592-1-alexander.atanasov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently balloon drivers (Virtio,XEN, HyperV, VMWare, ...)
inflate and deflate the guest memory size but there is no
way to know how much the memory size is changed by them.

A common use of the ballooning is to emulate [1]
hot plug and hot unplug - due to the complexity of the later.
Hotplug has a notifier and one can also check the updated
memory size.

To improve this add InflatedTotal and InflatedFree
to /proc/meminfo and implement a balloon notifier.

Amount of inflated memory can be used:
 - si_meminfo(..) users can improve calculations
 - adjust cache/buffer sizes
 - adjust object/connection limits
 - as a hint for the oom a killer
 - by user space software that monitors memory pressure

Alexander Atanasov (7):
  Make place for common balloon code
  Enable balloon drivers to report inflated memory
  Display inflated memory to users
  drivers: virtio: balloon - update inflated memory
  Display inflated memory in logs
  drivers: vmware: balloon - report inflated memory
  drivers: hyperv: balloon - report inflated memory

 Documentation/filesystems/proc.rst            |  6 +++
 MAINTAINERS                                   |  4 +-
 arch/powerpc/platforms/pseries/cmm.c          |  2 +-
 drivers/hv/hv_balloon.c                       | 11 +++++
 drivers/misc/vmw_balloon.c                    |  6 ++-
 drivers/virtio/virtio_balloon.c               |  7 +++-
 fs/proc/meminfo.c                             | 10 +++++
 .../linux/{balloon_compaction.h => balloon.h} | 30 ++++++++++----
 lib/show_mem.c                                |  8 ++++
 mm/Makefile                                   |  2 +-
 mm/{balloon_compaction.c => balloon.c}        | 40 +++++++++++++++++--
 mm/migrate.c                                  |  1 -
 mm/vmscan.c                                   |  1 -
 13 files changed, 110 insertions(+), 18 deletions(-)
 rename include/linux/{balloon_compaction.h => balloon.h} (86%)
 rename mm/{balloon_compaction.c => balloon.c} (88%)

v4:
 - add support in hyperV and vmware balloon drivers
 - display balloon memory in show_mem so it is logged on OOM and on sysrq
v3:
 - added missed EXPORT_SYMBOLS
Reported-by: kernel test robot <lkp@intel.com>
 - instead of balloon_common.h just use balloon.h (yes, naming is hard)
 - cleaned up balloon.h - remove from files that do not use it and
   remove externs from function declarations
v2:
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

1. https://lore.kernel.org/lkml/f0f12c84-a62e-5f8b-46ab-a651fe8f8589@redhat.com/

base-commit: 2bca25eaeba6190efbfcb38ed169bd7ee43b5aaf
-- 
2.31.1


