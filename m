Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7131FA61E4C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 22:38:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915459.1320982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCjY-0007q7-2r; Fri, 14 Mar 2025 21:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915459.1320982; Fri, 14 Mar 2025 21:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttCjY-0007nh-06; Fri, 14 Mar 2025 21:38:24 +0000
Received: by outflank-mailman (input) for mailman id 915459;
 Fri, 14 Mar 2025 21:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLrw=WB=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ttCjW-0007nb-Ns
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 21:38:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5147c69-011c-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 22:38:19 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-Z7N13xufNW6XUwaNZpccyg-1; Fri,
 14 Mar 2025 17:38:15 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 898481800258; Fri, 14 Mar 2025 21:38:11 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.80.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 20D901944E42; Fri, 14 Mar 2025 21:38:03 +0000 (UTC)
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
X-Inumbo-ID: a5147c69-011c-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741988298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x8R8SnT0xlNk6NOCsego5+xxOFgcolEZepoyw3FUxJU=;
	b=O0ymh87ixnRcTnnAJ2TTi4/4cPMQznJ9zk2zxwhdTUHEKciMmYir4IiC85tA6YJhUvXucP
	niGVhaLgpESBtDXBWjGSQtQHazoVQkw5SpZLJX294uHhsmsBUjBdRv07c/6WhCp9QEW1aa
	Phut0DfzksvKTowNCFOuxs8VTrOxxpU=
X-MC-Unique: Z7N13xufNW6XUwaNZpccyg-1
X-Mimecast-MFC-AGG-ID: Z7N13xufNW6XUwaNZpccyg_1741988292
From: Nico Pache <npache@redhat.com>
To: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	virtualization@lists.linux.dev
Cc: alexander.atanasov@virtuozzo.com,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev,
	mhocko@kernel.org,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org,
	mst@redhat.com,
	david@redhat.com,
	yosry.ahmed@linux.dev,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	kanchana.p.sridhar@intel.com,
	llong@redhat.com,
	shakeel.butt@linux.dev
Subject: [PATCH v2 0/4] track memory used by balloon drivers
Date: Fri, 14 Mar 2025 15:37:53 -0600
Message-ID: <20250314213757.244258-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This series introduces a way to track memory used by balloon drivers.

Add a NR_BALLOON_PAGES counter to track how many pages are reclaimed by the
balloon drivers. First add the accounting, then updates the balloon drivers
(virtio, Hyper-V, VMware, Pseries-cmm, and Xen) to maintain this counter. The
virtio, Vmware, and pseries-cmm balloon drivers utilize the balloon_compaction
interface to allocate and free balloon pages. Other balloon drivers will have to
maintain this counter manually.

This makes the information visible in memory reporting interfaces like
/proc/meminfo, show_mem, and OOM reporting.

This provides admins visibility into their VM balloon sizes without
requiring different virtualization tooling. Furthermore, this information
is helpful when debugging an OOM inside a VM.

V2 changes:
- Add counter to the balloon_compaction interface
- Dropped patches for virtio and VMware as they use balloon_compaction interface

Tested: virtio_balloon, run stress-ng, inflate balloon, oom prints
Signed-off-by: Nico Pache <npache@redhat.com>

Nico Pache (4):
  meminfo: add a per node counter for balloon drivers
  balloon_compaction: update the NR_BALLOON_PAGES state
  hv_balloon: update the NR_BALLOON_PAGES state
  xen: balloon: update the NR_BALLOON_PAGES state

 drivers/hv/hv_balloon.c | 2 ++
 drivers/xen/balloon.c   | 4 ++++
 fs/proc/meminfo.c       | 2 ++
 include/linux/mmzone.h  | 1 +
 mm/balloon_compaction.c | 2 ++
 mm/show_mem.c           | 4 +++-
 mm/vmstat.c             | 1 +
 7 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.48.1


