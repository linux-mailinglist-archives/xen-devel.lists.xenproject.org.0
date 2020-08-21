Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042EE24D282
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 12:35:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k94Nr-0000Xs-EZ; Fri, 21 Aug 2020 10:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=82Ct=B7=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1k94Nq-0000Xn-68
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 10:34:54 +0000
X-Inumbo-ID: b22fe96b-4dbe-4699-b0fb-8eecdad194f0
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b22fe96b-4dbe-4699-b0fb-8eecdad194f0;
 Fri, 21 Aug 2020 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598006091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Lz1Dlp3n64jbr0nqc1nHMGKoG4tO/ALxoWb8NdfDDro=;
 b=domLTO7T0SoEgJNLvoTf5fxtxm7/j/b/PjYBNPAWSQvtncee6HUCUlFZiq/u5kkhamEbac
 hXYfmaM2s+D3E9gWdjUSca2fFOSRcOMJKpfp0lA7CiujOzAwGk35sEdcrc1IS6A0zGc5CJ
 QUTv78gqQ2+geCdDAvOO2pM/vpFIog0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-tNVl4_PKOqOy6s0hWbWRxQ-1; Fri, 21 Aug 2020 06:34:47 -0400
X-MC-Unique: tNVl4_PKOqOy6s0hWbWRxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C4AA100CF73;
 Fri, 21 Aug 2020 10:34:44 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2F07756D7;
 Fri, 21 Aug 2020 10:34:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Kees Cook <keescook@chromium.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v1 0/5] mm/memory_hotplug: selective merging of system ram
 resources
Date: Fri, 21 Aug 2020 12:34:26 +0200
Message-Id: <20200821103431.13481-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is the follow-up of "[PATCH RFCv1 0/5] mm/memory_hotplug: selective
merging of memory resources" [1]

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
current kexec-tools resource count limit does not allow for more than
~100GB of memory with a memory block size of 128MB on x86-64).

Let's allow to selectively merge system ram resources directly below a
specific parent resource. Patch #3 contains a /proc/iomem example. Only
tested with virtio-mem.

Note: This gets the job done and is comparably simple. More complicated
approaches would require introducing IORESOURCE_MERGEABLE and extending our
add_memory*() interfaces with a flag, specifying that merging after adding
succeeded is acceptable. I'd like to avoid that complexity and code churn
for now.

[1] https://lkml.kernel.org/r/20200731091838.7490-1-david@redhat.com

RFC -> v1:
- Switch from rather generic "merge_child_mem_resources()" where a resource
  name has to be specified to "merge_system_ram_resources().
- Smaller comment/documentation/patch description changes/fixes

David Hildenbrand (5):
  kernel/resource: make release_mem_region_adjustable() never fail
  kernel/resource: merge_system_ram_resources() to merge resources after
    hotplug
  virtio-mem: try to merge system ram resources
  xen/balloon: try to merge system ram resources
  hv_balloon: try to merge system ram resources

 drivers/hv/hv_balloon.c     |   3 ++
 drivers/virtio/virtio_mem.c |  14 ++++-
 drivers/xen/balloon.c       |   4 ++
 include/linux/ioport.h      |   7 ++-
 kernel/resource.c           | 101 ++++++++++++++++++++++++++++--------
 mm/memory_hotplug.c         |  22 +-------
 6 files changed, 105 insertions(+), 46 deletions(-)

-- 
2.26.2


