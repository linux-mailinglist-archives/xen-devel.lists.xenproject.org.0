Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90503395253
	for <lists+xen-devel@lfdr.de>; Sun, 30 May 2021 19:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134290.249934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE4-0005Rp-BL; Sun, 30 May 2021 17:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134290.249934; Sun, 30 May 2021 17:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnPE4-0005PS-7u; Sun, 30 May 2021 17:27:48 +0000
Received: by outflank-mailman (input) for mailman id 134290;
 Sun, 30 May 2021 15:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvOc=KZ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lnN1T-0000PC-5X
 for xen-devel@lists.xenproject.org; Sun, 30 May 2021 15:06:39 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd541d85-59a6-4776-a575-8ed425acaf7a;
 Sun, 30 May 2021 15:06:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x10so3026416plg.3
 for <xen-devel@lists.xenproject.org>; Sun, 30 May 2021 08:06:37 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:9:dc2d:80ab:c3f3:1524])
 by smtp.gmail.com with ESMTPSA id b15sm8679688pfi.100.2021.05.30.08.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 08:06:36 -0700 (PDT)
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
X-Inumbo-ID: bd541d85-59a6-4776-a575-8ed425acaf7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FswRSQfjjaKx7u9LgIeEdiIRei+KQQ1o84JB2HXUqUs=;
        b=LVIdMBZyqnI96Q0Z0mysjEWnSTb1JW5nO8mVMTciG0aK/WD06/PLYNCl5nc+yK0XlS
         2WtJh9tLLiNzy5J3OgcTqz2Jd8R+Qo2XZ8PhM1LGbgk34btlpzEZSypPA3XtbSEfna7F
         0Xy/ByKjJYToboKNSYv39OSVL+1wl/6lNTlTcOxXyL9Czp3My1t9DZhs63AP25Sxxf87
         UAeJF9Q9PWAi/L9NXDXqX7YL7RDddpROE5Dwkr0XfidvpyFaGBUOGxVoC/o97y6s3Bgv
         uNtBz9O1DqUp24qMiBjYRplPEPbpwBaGprGuV8wqmdUN8j9x5KqKXakb0r59LpirJ6/C
         y0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FswRSQfjjaKx7u9LgIeEdiIRei+KQQ1o84JB2HXUqUs=;
        b=bit/9Dmvjh/S5TiGIxgTCqJI0XyW+TMIROWEEuKxpefFU80lcLVi4r7RgJ6Dcfwtn9
         8hixz/bZHbE2OCuHDmVEEOWJw/j5BNRnoPKmGLo5Xd5TubBUNGmL4WHs51+Bc+exloDH
         BEOS1nJf6zADs6+v0HaFN0rlceStk57cHsR+15mR6PQ8BiP6FZCYRBW55C7i9pbHDaqY
         U1VUyFNkuHKrH2ASxDCbkU85FEwvglzIC+NS65sg9qTomLkJSottxxvvftGJFzwaTrjG
         ef0KzXQ05xkYPcy69zEPV9RPiiw12C3Qj5HooHja8mGelVYvPHSugdK5vvcOZL22lfOs
         VxHA==
X-Gm-Message-State: AOAM533XQ2ASwg9oV1FRYakI4P3cejc2llnHO0Z+LY2XcjjGrdJc1vRl
	OqGwf6gniKE9L8uVU73d5OA=
X-Google-Smtp-Source: ABdhPJzWgX0reZL8RY1aCiYCdkLb1bxDmfsOiZs5Da5qdPNbLz2+PAq3adwYvehGmjtmOXLHMuRRYw==
X-Received: by 2002:a17:90a:fe84:: with SMTP id co4mr14479308pjb.0.1622387197133;
        Sun, 30 May 2021 08:06:37 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	cai@lca.pw,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	Tianyu.Lan@microsoft.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	xen-devel@lists.xenproject.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	sunilmut@microsoft.com
Subject: [RFC PATCH V3 00/11] x86/Hyper-V: Add Hyper-V Isolation VM support
Date: Sun, 30 May 2021 11:06:17 -0400
Message-Id: <20210530150628.2063957-1-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V provides two kinds of Isolation VMs. VBS(Virtualization-based
security) and AMD SEV-SNP unenlightened Isolation VMs. This patchset
is to add support for these Isolation VM support in Linux.

The memory of these vms are encrypted and host can't access guest
memory directly. Hyper-V provides new host visibility hvcall and
the guest needs to call new hvcall to mark memory visible to host
before sharing memory with host. For security, all network/storage
stack memory should not be shared with host and so there is bounce
buffer requests.

Vmbus channel ring buffer already plays bounce buffer role because
all data from/to host needs to copy from/to between the ring buffer
and IO stack memory. So mark vmbus channel ring buffer visible.

There are two exceptions - packets sent by vmbus_sendpacket_
pagebuffer() and vmbus_sendpacket_mpb_desc(). These packets
contains IO stack memory address and host will access these memory.
So add allocation bounce buffer support in vmbus for these packets.

For SNP isolation VM, guest needs to access the shared memory via
extra address space which is specified by Hyper-V CPUID HYPERV_CPUID_
ISOLATION_CONFIG. The access physical address of the shared memory
should be bounce buffer memory GPA plus with shared_gpa_boundary
reported by CPUID.

Change since v2:
       - Remove not UIO driver in Isolation VM patch
       - Use vmap_pfn() to replace ioremap_page_range function in
       order to avoid exposing symbol ioremap_page_range() and
       ioremap_page_range()
       - Call hv set mem host visibility hvcall in set_memory_encrypted/decrypted()
       - Enable swiotlb force mode instead of adding Hyper-V dma map/unmap hook
       - Fix code style

Tianyu Lan (11):
  x86/HV: Initialize GHCB page in Isolation VM
  x86/HV: Initialize shared memory boundary in the Isolation VM.
  x86/Hyper-V: Add new hvcall guest address host visibility support
  HV: Add Write/Read MSR registers via ghcb
  HV: Add ghcb hvcall support for SNP VM
  HV/Vmbus: Add SNP support for VMbus channel initiate message
  HV/Vmbus: Initialize VMbus ring buffer for Isolation VM
  swiotlb: Add bounce buffer remap address setting function
  HV/IOMMU: Enable swiotlb bounce buffer for Isolation VM
  HV/Netvsc: Add Isolation VM support for netvsc driver
  HV/Storvsc: Add Isolation VM support for storvsc driver

 arch/x86/hyperv/Makefile           |   2 +-
 arch/x86/hyperv/hv_init.c          |  70 +++++--
 arch/x86/hyperv/ivm.c              | 300 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  24 +++
 arch/x86/include/asm/mshyperv.h    |  85 +++++++-
 arch/x86/kernel/cpu/mshyperv.c     |   5 +
 arch/x86/mm/pat/set_memory.c       |  10 +-
 arch/x86/xen/pci-swiotlb-xen.c     |   3 +-
 drivers/hv/Kconfig                 |   1 +
 drivers/hv/channel.c               |  48 ++++-
 drivers/hv/connection.c            |  68 ++++++-
 drivers/hv/hv.c                    | 122 ++++++++----
 drivers/hv/hyperv_vmbus.h          |   3 +
 drivers/hv/ring_buffer.c           |  84 ++++++--
 drivers/hv/vmbus_drv.c             |   3 +
 drivers/iommu/hyperv-iommu.c       |  81 ++++++++
 drivers/net/hyperv/hyperv_net.h    |   6 +
 drivers/net/hyperv/netvsc.c        | 125 +++++++++++-
 drivers/net/hyperv/rndis_filter.c  |   3 +
 drivers/scsi/storvsc_drv.c         |  63 +++++-
 include/asm-generic/hyperv-tlfs.h  |   1 +
 include/asm-generic/mshyperv.h     |  18 +-
 include/linux/hyperv.h             |  16 ++
 include/linux/swiotlb.h            |   5 +
 kernel/dma/swiotlb.c               |  14 +-
 25 files changed, 1062 insertions(+), 98 deletions(-)
 create mode 100644 arch/x86/hyperv/ivm.c

-- 
2.25.1


