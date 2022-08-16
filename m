Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55E5956FD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 11:48:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388151.624747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtAq-0000ng-Nj; Tue, 16 Aug 2022 09:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388151.624747; Tue, 16 Aug 2022 09:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNtAq-0000lK-KN; Tue, 16 Aug 2022 09:47:48 +0000
Received: by outflank-mailman (input) for mailman id 388151;
 Tue, 16 Aug 2022 09:43:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9yN+=YU=virtuozzo.com=alexander.atanasov@srs-se1.protection.inumbo.net>)
 id 1oNt6E-0000h4-99
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 09:43:02 +0000
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c2921e-1d47-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 11:43:00 +0200 (CEST)
Received: from dev011.ch-qa.sw.ru ([172.29.1.16])
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <alexander.atanasov@virtuozzo.com>)
 id 1oNt3h-00FxfB-Cg; Tue, 16 Aug 2022 11:41:36 +0200
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
X-Inumbo-ID: d0c2921e-1d47-11ed-bd2e-47488cf2e6aa
From: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
To: 
Cc: kernel@openvz.org,
	Alexander Atanasov <alexander.atanasov@virtuozzo.com>,
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
Subject: [PATCH v2 0/4] Make balloon drivers memory changes known to the rest of the kernel
Date: Tue, 16 Aug 2022 12:41:13 +0300
Message-Id: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
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
 ...{balloon_compaction.h => balloon_common.h} | 20 +++++++++-
 mm/Makefile                                   |  2 +-
 mm/{balloon_compaction.c => balloon_common.c} | 38 ++++++++++++++++++-
 mm/migrate.c                                  |  2 +-
 mm/vmscan.c                                   |  2 +-
 11 files changed, 84 insertions(+), 11 deletions(-)
 rename include/linux/{balloon_compaction.h => balloon_common.h} (90%)
 rename mm/{balloon_compaction.c => balloon_common.c} (89%)

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


-- 
2.31.1


