Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E459BEAF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 13:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391360.629156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ5ll-00062l-F1; Mon, 22 Aug 2022 11:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391360.629156; Mon, 22 Aug 2022 11:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ5ll-0005zY-By; Mon, 22 Aug 2022 11:39:01 +0000
Received: by outflank-mailman (input) for mailman id 391360;
 Mon, 22 Aug 2022 11:38:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/zD=Y2=virtuozzo.com=alexander.atanasov@srs-se1.protection.inumbo.net>)
 id 1oQ5lj-0005z9-Mx
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 11:38:59 +0000
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe7d03a6-220e-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 13:38:51 +0200 (CEST)
Received: from dev011.ch-qa.sw.ru ([172.29.1.16])
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <alexander.atanasov@virtuozzo.com>)
 id 1oQ5jK-00Gyo9-72; Mon, 22 Aug 2022 13:37:53 +0200
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
X-Inumbo-ID: fe7d03a6-220e-11ed-9250-1f966e50362f
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
Subject: [PATCH v3 0/4] Make balloon drivers memory changes known to the rest of the kernel
Date: Mon, 22 Aug 2022 14:37:43 +0300
Message-Id: <20220822113747.3630776-1-alexander.atanasov@virtuozzo.com>
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

Patches for the other balloon drivers will be done next.

Alexander Atanasov (4):
  Make place for common balloon code
  Enable balloon drivers to report inflated memory
  Display inflated memory to users
  drivers: virtio: balloon - update inflated memory

 Documentation/filesystems/proc.rst            |  6 +++
 MAINTAINERS                                   |  4 +-
 arch/powerpc/platforms/pseries/cmm.c          |  2 +-
 drivers/misc/vmw_balloon.c                    |  2 +-
 drivers/virtio/virtio_balloon.c               |  7 +++-
 fs/proc/meminfo.c                             | 10 +++++
 .../linux/{balloon_compaction.h => balloon.h} | 30 ++++++++++----
 mm/Makefile                                   |  2 +-
 mm/{balloon_compaction.c => balloon.c}        | 40 +++++++++++++++++--
 mm/migrate.c                                  |  1 -
 mm/vmscan.c                                   |  1 -
 11 files changed, 87 insertions(+), 18 deletions(-)
 rename include/linux/{balloon_compaction.h => balloon.h} (86%)
 rename mm/{balloon_compaction.c => balloon.c} (88%)

v2:
 - reworked from simple /proc/meminfo addition
v3:
 - added missed EXPORT_SYMBOLS
Reported-by: kernel test robot <lkp@intel.com>
 - instead of balloon_common.h just use balloon.h (yes, naming is hard)
 - cleaned up balloon.h - remove from files that do not use it and
   remove externs from function declarations

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

base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
-- 
2.31.1


