Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAE264115
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 11:14:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGIei-0007CS-Dw; Thu, 10 Sep 2020 09:14:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWZe=CT=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kGIeh-0007CK-30
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 09:14:11 +0000
X-Inumbo-ID: 979ae280-0474-45a1-bb4c-dc08b185a586
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 979ae280-0474-45a1-bb4c-dc08b185a586;
 Thu, 10 Sep 2020 09:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599729249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q+xRLYk6ElaQMFati+s8ZI/gmN1ETJt7O5tUW1WhghI=;
 b=UUbpsuWspWBy64qJNqR0KQ6hXzfJ2U4HhrstGWZgatVuF/t/43EiKXD7Xt9Mx4x7gB2v95
 iw6/6FftSqjpVYyN7RdluG9gNiCASQp7HsW5RO1htuBE+BbLimnoRe/L3eHaY3IbVi8hBu
 Yfgv5V3T6J+CiY0lsqmu8y+db4MqiR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-3iuqD9l8MNi4UpNNbX7W8g-1; Thu, 10 Sep 2020 05:14:07 -0400
X-MC-Unique: 3iuqD9l8MNi4UpNNbX7W8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4996418B9F00;
 Thu, 10 Sep 2020 09:14:01 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A880282CA;
 Thu, 10 Sep 2020 09:13:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-s390@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpmt@linux-foundation.org>,
 Anton Blanchard <anton@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Baoquan He <bhe@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Heiko Carstens <hca@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jason Wang <jasowang@redhat.com>,
 Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Kees Cook <keescook@chromium.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Len Brown <lenb@kernel.org>, Leonardo Bras <leobras.c@gmail.com>,
 Libor Pechacek <lpechacek@suse.cz>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 "Oliver O'Halloran" <oohall@gmail.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Pingfan Liu <kernelfans@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>
Subject: [PATCH v3 0/7] mm/memory_hotplug: selective merging of system ram
 resources
Date: Thu, 10 Sep 2020 11:13:33 +0200
Message-Id: <20200910091340.8654-1-david@redhat.com>
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
current kexec-tools resource count limit does not allow for more than
~100GB of memory with a memory block size of 128MB on x86-64).

Let's allow to selectively merge system ram resources by specifying a
new flag for add_memory*(). Patch #5 contains a /proc/iomem example. Only
tested with virtio-mem.

v2 -> v3:
- "mm/memory_hotplug: prepare passing flags to add_memory() and friends"
-- Use proper __bitwise type for flags
-- Use "MHP_NONE" for empty flags
- Rebased to latest -next, added rb's

v1 -> v2:
- I had another look at v1 after vacation and didn't like it - it felt like
  a hack. So I want forward and added a proper flag to add_memory*(), and
  introduce a clean (non-racy) way to mark System RAM resources mergeable.
- "kernel/resource: move and rename IORESOURCE_MEM_DRIVER_MANAGED"
-- Clean that flag up, felt wrong in the PnP section
- "mm/memory_hotplug: prepare passing flags to add_memory() and friends"
-- Previously sent in other context - decided to keep Wei's ack
- "mm/memory_hotplug: MEMHP_MERGE_RESOURCE to specify merging of System
   RAM resources"
-- Cleaner approach to get the job done by using proper flags and only
   merging the single, specified resource
- "virtio-mem: try to merge system ram resources"
  "xen/balloon: try to merge system ram resources"
  "hv_balloon: try to merge system ram resources"
-- Use the new flag MEMHP_MERGE_RESOURCE, much cleaner

RFC -> v1:
- Switch from rather generic "merge_child_mem_resources()" where a resource
  name has to be specified to "merge_system_ram_resources().
- Smaller comment/documentation/patch description changes/fixes

David Hildenbrand (7):
  kernel/resource: make release_mem_region_adjustable() never fail
  kernel/resource: move and rename IORESOURCE_MEM_DRIVER_MANAGED
  mm/memory_hotplug: prepare passing flags to add_memory() and friends
  mm/memory_hotplug: MEMHP_MERGE_RESOURCE to specify merging of System
    RAM resources
  virtio-mem: try to merge system ram resources
  xen/balloon: try to merge system ram resources
  hv_balloon: try to merge system ram resources

 arch/powerpc/platforms/powernv/memtrace.c     |   2 +-
 .../platforms/pseries/hotplug-memory.c        |   2 +-
 drivers/acpi/acpi_memhotplug.c                |   3 +-
 drivers/base/memory.c                         |   3 +-
 drivers/dax/kmem.c                            |   2 +-
 drivers/hv/hv_balloon.c                       |   2 +-
 drivers/s390/char/sclp_cmd.c                  |   2 +-
 drivers/virtio/virtio_mem.c                   |   3 +-
 drivers/xen/balloon.c                         |   2 +-
 include/linux/ioport.h                        |  12 +-
 include/linux/memory_hotplug.h                |  23 +++-
 kernel/kexec_file.c                           |   2 +-
 kernel/resource.c                             | 109 ++++++++++++++----
 mm/memory_hotplug.c                           |  47 +++-----
 14 files changed, 146 insertions(+), 68 deletions(-)

-- 
2.26.2


