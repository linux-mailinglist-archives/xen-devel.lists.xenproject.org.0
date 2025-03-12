Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87914A5D396
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 01:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909557.1316494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fr-0002XO-Hp; Wed, 12 Mar 2025 00:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909557.1316494; Wed, 12 Mar 2025 00:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts9fr-0002VW-DI; Wed, 12 Mar 2025 00:10:15 +0000
Received: by outflank-mailman (input) for mailman id 909557;
 Wed, 12 Mar 2025 00:07:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEQM=V7=redhat.com=npache@srs-se1.protection.inumbo.net>)
 id 1ts9dP-00013H-UA
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 00:07:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 026ff924-fed6-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 01:07:40 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-tVpdxDOENfqjZCOHY5FruQ-1; Tue,
 11 Mar 2025 20:07:34 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F07CE195608A; Wed, 12 Mar 2025 00:07:29 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.56])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 20D971956094; Wed, 12 Mar 2025 00:07:20 +0000 (UTC)
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
X-Inumbo-ID: 026ff924-fed6-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741738058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Jp3d8TwivY0inesFFsBMmfW4NNIDtSVjUkd3EkZcf4=;
	b=P0MMNodwRq45o6GNN2wMM+3AKeo/kjuYf1mriHw+5ugumQFV8+sAIkuJxB7+zcB4/AiwZ8
	On2/wNygN46zVLRg4OCxJwn50dDyJhKrzYdXA0C8KGE+FdbDhV8UJAMHUTye+d/8ARjTEC
	+8GhaLThh5lrFSC2aR9ZHMsLl7RSesI=
X-MC-Unique: tVpdxDOENfqjZCOHY5FruQ-1
X-Mimecast-MFC-AGG-ID: tVpdxDOENfqjZCOHY5FruQ_1741738051
From: Nico Pache <npache@redhat.com>
To: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	jerrin.shaji-george@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	mst@redhat.com,
	david@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	nphamcs@gmail.com,
	yosry.ahmed@linux.dev,
	kanchana.p.sridhar@intel.com,
	alexander.atanasov@virtuozzo.com
Subject: [RFC 0/5] track memory used by balloon drivers
Date: Tue, 11 Mar 2025 18:06:55 -0600
Message-ID: <20250312000700.184573-1-npache@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

This series introduces a way to track memory used by balloon drivers.

Add a NR_BALLOON_PAGES counter to track how many pages are reclaimed by the
balloon drivers. First add the accounting, then updates the balloon drivers
(virtio, Hyper-V, VMware, and Xen) to maintain this counter.

This makes the information visible in memory reporting interfaces like
/proc/meminfo, show_mem, and OOM reporting.

This provides admins visibility into their VM balloon sizes without
requiring different virtualization tooling. Furthermore, this information
is helpful when debugging an OOM inside a VM.

Tested: virtio_balloon, run stress-ng, inflate balloon, oom prints
Signed-off-by: Nico Pache <npache@redhat.com>

Nico Pache (5):
  meminfo: add a per node counter for balloon drivers
  virtio_balloon: update the NR_BALLOON_PAGES state
  hv_balloon: update the NR_BALLOON_PAGES state
  vmx_balloon: update the NR_BALLOON_PAGES state
  xen: balloon: update the NR_BALLOON_PAGES state

 drivers/hv/hv_balloon.c         | 2 ++
 drivers/misc/vmw_balloon.c      | 5 ++++-
 drivers/virtio/virtio_balloon.c | 4 ++++
 drivers/xen/balloon.c           | 4 ++++
 fs/proc/meminfo.c               | 2 ++
 include/linux/mmzone.h          | 1 +
 mm/memcontrol.c                 | 1 +
 mm/show_mem.c                   | 4 +++-
 mm/vmstat.c                     | 1 +
 9 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.48.1


