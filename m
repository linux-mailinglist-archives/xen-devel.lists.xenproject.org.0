Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7D234245
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 11:19:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1RBp-0000Vs-RD; Fri, 31 Jul 2020 09:18:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XNXZ=BK=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k1RBn-0000Vm-BI
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 09:18:56 +0000
X-Inumbo-ID: dadd789c-d30e-11ea-8e1f-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dadd789c-d30e-11ea-8e1f-bc764e2007e4;
 Fri, 31 Jul 2020 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596187134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7KJjJxh3LrCrOmiVZX7zoQLv4kMydPtkCS0ZPjF2DUk=;
 b=YRAc7jZAndJHzfvcACv97DJeo2rFUQwS1c0JV3aHgHUCRN2D5quQzwXbCozUdHxOAaYAC3
 dYjRg3RCvTGoc6TRnYfFbu2eCD1Nei29sdWTuG535vgOHmL5fdT8Jq7AbrUgfDu8+c5RSd
 LX1BIHXcLj0pV2cTdjX9IuuWKcydwTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-SolxhgZkNXO5E6nSxUQ3oA-1; Fri, 31 Jul 2020 05:18:49 -0400
X-MC-Unique: SolxhgZkNXO5E6nSxUQ3oA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07FF759;
 Fri, 31 Jul 2020 09:18:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC0631A835;
 Fri, 31 Jul 2020 09:18:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFCv1 0/5] mm/memory_hotplug: selective merging of memory
 resources
Date: Fri, 31 Jul 2020 11:18:33 +0200
Message-Id: <20200731091838.7490-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Kees Cook <keescook@chromium.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richardw.yang@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Some add_memory*() users add memory in small, contiguous memory blocks.
Examples include virtio-mem, hyper-v balloon, and the XEN balloon.

This can quickly result in a lot of memory resources, whereby the actual
resource boundaries are not of interest (e.g., it might be relevant for
DIMMs, exposed via /proc/iomem to user space). We really want to merge
added resources in this scenario where possible.

Resources are effectively stored in a list-based tree. Having a lot of
resources not only wastes memory, it also makes traversing that tree more
expensive, and makes /proc/iomem explode in size (e.g., requiring
kexec-tools to manually merge resources when creating a kdump header. The
current kexec-tools resource count limit does not allow more than ~100GB
of memory with a memory block size of 128MB on x86-64).

Let's allow to selectively merge resources, speciyfing a parent node and
a resource idendifier string. The memory unplug path will properly split
up merged resources again.

Patch #3 contains a /proc/iomem example. Only tested with virtio-mem.

Note: This gets the job done and is comparably simple. More complicated
approaches would require introducing IORESOURCE_MERGEABLE and extending our
add_memory*() interfaces with a flag, specifying that merging after adding
succeeded is acceptable. I'd like to avoid that complexity and code churn
for now.

David Hildenbrand (5):
  kernel/resource: make release_mem_region_adjustable() never fail
  kernel/resource: merge_child_mem_resources() to merge memory resources
    after adding succeeded
  virtio-mem: try to merge "System RAM (virtio_mem)" resources
  xen/balloon: try to merge "System RAM" resources
  hv_balloon:: try to merge "System RAM" resources

 drivers/hv/hv_balloon.c     |   3 ++
 drivers/virtio/virtio_mem.c |  14 ++++-
 drivers/xen/balloon.c       |   4 ++
 include/linux/ioport.h      |   7 ++-
 kernel/resource.c           | 105 ++++++++++++++++++++++++++++--------
 mm/memory_hotplug.c         |  22 +-------
 6 files changed, 109 insertions(+), 46 deletions(-)

-- 
2.26.2


