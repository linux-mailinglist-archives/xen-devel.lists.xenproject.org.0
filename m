Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F057F1BF57A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:30:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU6Rv-0006D3-HQ; Thu, 30 Apr 2020 10:29:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EK+X=6O=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1jU6Ru-0006Cy-2J
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:29:46 +0000
X-Inumbo-ID: 82c08520-8acd-11ea-9a1d-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 82c08520-8acd-11ea-9a1d-12813bfff9fa;
 Thu, 30 Apr 2020 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588242585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=F00GW0IDxO2YtXf8I1Htd7Li0LSvuJyIHlJhh9ba9cc=;
 b=ET/HEcMaPnnU8Ikjs61jZltkM1jseyY3c45PGlU7miJREHCpkXXQLaY03Qe9vKzx/vNlZE
 eKvP6zLAHOsdyXX/QZKFc24fU77NAjotl1JoCYIApC469dlGO4tppelP/N8c24f7OyH2V1
 H3WFLVSoOOPwCGabrnnBfqff3BfwSUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-F5xrMv_8M0upE38nqrJ6fA-1; Thu, 30 Apr 2020 06:29:37 -0400
X-MC-Unique: F5xrMv_8M0upE38nqrJ6fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD301899521;
 Thu, 30 Apr 2020 10:29:32 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963F15D780;
 Thu, 30 Apr 2020 10:29:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] mm/memory_hotplug: Allow to not create firmware memmap
 entries
Date: Thu, 30 Apr 2020 12:29:05 +0200
Message-Id: <20200430102908.10107-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Pingfan Liu <kernelfans@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, virtio-dev@lists.oasis-open.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org, Michael Ellerman <mpe@ellerman.id.au>,
 David Hildenbrand <david@redhat.com>, linux-acpi@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, xen-devel@lists.xenproject.org,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Leonardo Bras <leobras.c@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Michal Hocko <mhocko@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Thomas Gleixner <tglx@linutronix.de>,
 Eric Biederman <ebiederm@xmission.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is the follow up of [1]:
	[PATCH v1 0/3] mm/memory_hotplug: Make virtio-mem play nicely with
	kexec-tools

I realized that this is not only helpful for virtio-mem, but also for
dax/kmem - it's a fix for that use case (see patch #3) of persistent
memory.

Also, while testing, I discovered that kexec-tools will *not* add dax/kme=
m
memory (anything not directly under the root when parsing /proc/iomem) to
the elfcorehdr, so this memory will never get included in a dump. This
probably has to be fixed in kexec-tools - virtio-mem will require this as
well.

v1 -> v2:
- Don't change the resource name
- Rename the flag to MHP_NO_FIRMWARE_MEMMAP to reflect what it is doing
- Rephrase subjects/descriptions
- Use the flag for dax/kmem

I'll have to rebase virtio-mem on these changes, there will be a resend.

[1] https://lkml.kernel.org/r/20200429160803.109056-1-david@redhat.com

David Hildenbrand (3):
  mm/memory_hotplug: Prepare passing flags to add_memory() and friends
  mm/memory_hotplug: Introduce MHP_NO_FIRMWARE_MEMMAP
  device-dax: Add system ram (add_memory()) with MHP_NO_FIRMWARE_MEMMAP

 arch/powerpc/platforms/powernv/memtrace.c       |  2 +-
 arch/powerpc/platforms/pseries/hotplug-memory.c |  2 +-
 drivers/acpi/acpi_memhotplug.c                  |  2 +-
 drivers/base/memory.c                           |  2 +-
 drivers/dax/kmem.c                              |  3 ++-
 drivers/hv/hv_balloon.c                         |  2 +-
 drivers/s390/char/sclp_cmd.c                    |  2 +-
 drivers/xen/balloon.c                           |  2 +-
 include/linux/memory_hotplug.h                  | 15 ++++++++++++---
 mm/memory_hotplug.c                             | 14 ++++++++------
 10 files changed, 29 insertions(+), 17 deletions(-)

--=20
2.25.3


