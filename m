Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B562A3D911F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 16:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161582.296576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kvk-0002Z1-B5; Wed, 28 Jul 2021 14:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161582.296576; Wed, 28 Jul 2021 14:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kvk-0002W6-7y; Wed, 28 Jul 2021 14:53:08 +0000
Received: by outflank-mailman (input) for mailman id 161582;
 Wed, 28 Jul 2021 14:53:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=si+Y=MU=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m8kvh-0002W0-Un
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 14:53:06 +0000
Received: from mail-pj1-x102b.google.com (unknown [2607:f8b0:4864:20::102b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f995a1b-686a-4ead-afdc-1b88bd9879ba;
 Wed, 28 Jul 2021 14:53:04 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id m1so5540766pjv.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 07:53:04 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:03 -0700 (PDT)
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
X-Inumbo-ID: 0f995a1b-686a-4ead-afdc-1b88bd9879ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dw5WYuI9KVHFCJFCuZejwMnhkTgwwA05j2VLkdgyjhM=;
        b=p8qM8rC90F/SM+apT/EKASeB6fk585n2JEbifixZyOxlq6Ktg1+eiu4rOMbpMYscY4
         JDfzCVUj9P+r/SbSk8+43y67Xs+hltMLq0r8e1vxWdiJYA32QLDKYaF7utDPLO8dLfdF
         l4v8OvMGbDTrSVvXSTCaVk15GCPLEQmwD09MewR60DSKGnLNjv+/+EnweU32/41Fs86F
         0L1ZWMlpQppSV+tmLg7d76sQrzEVzXrxEo4o6XYH2JXSmSe4szqvA/msBGK3U2Gnbyyg
         uh7t8h18JFBAPOUiE8jKhEBQHww4hFERe9e7SJLCaJq3eu3vAeflxbBbkXxSHBhPLqqJ
         zymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dw5WYuI9KVHFCJFCuZejwMnhkTgwwA05j2VLkdgyjhM=;
        b=JflEA4dUuIIm/7VQrbNJzzUsHWH5grLnl9sho9cLJpqtmbR7zyy/lDtUJmb/W4ecUd
         0EKINDerIgvnADX3Buw827SJpWco1+zL/z138IKe7OZitJohHtFeLxtk/UJx66dUrCde
         AoguXa/pq7ocUWQ98tJSQJKmHnuLrlbcYNldnAw6Cwk7+7CDe3h/RkDmBj4kflc6esOo
         y/AWmR2pPDSFAgOtZfqD34iUt2yu7XrxNDBdWINYYve1TMoBT+Rck7UPWKzzlJI88E0N
         BXyjUM9E+/2JZM/D1oroROoUsRpyX0WWAjz0KiRmYcy6nXVpFXS79fw1RwHJnHuTfS4l
         htLA==
X-Gm-Message-State: AOAM5322XVrJf90S8bgWpkTwDYq9watNn6V0lFLa0qeWt04SO8AtdALO
	/hKCfMxNxYWMWmBuZdN6J8o=
X-Google-Smtp-Source: ABdhPJyvKNqJV0d7lhBz81EV8gx+LUMnHngVQwyGZ1LUs86TzJ1AZOB/8lE8YF+OwPlhBwTvVwzTSQ==
X-Received: by 2002:a62:798e:0:b029:327:6d4a:c4db with SMTP id u136-20020a62798e0000b02903276d4ac4dbmr203576pfc.50.1627483984118;
        Wed, 28 Jul 2021 07:53:04 -0700 (PDT)
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
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	konrad.wilk@oracle.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	brijesh.singh@amd.com,
	ardb@kernel.org,
	Tianyu.Lan@microsoft.com,
	rientjes@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	xen-devel@lists.xenproject.org,
	pgonda@google.com,
	david@redhat.com,
	keescook@chromium.org,
	hannes@cmpxchg.org,
	sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	anparri@microsoft.com
Subject: [PATCH 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
Date: Wed, 28 Jul 2021 10:52:15 -0400
Message-Id: <20210728145232.285861-1-ltykernel@gmail.com>
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

Change sicne RFC V4:
       - Introduce dma map decrypted function to remap bounce buffer
       	 and provide dma map decrypted ops for platform to hook callback.	 
       - Split swiotlb and dma map decrypted change into two patches
       - Replace vstart with vaddr in swiotlb changes.

Change since RFC v3:
       - Add interface set_memory_decrypted_map() to decrypt memory and
         map bounce buffer in extra address space 
       - Remove swiotlb remap function and store the remap address
         returned by set_memory_decrypted_map() in swiotlb mem data structure.
       - Introduce hv_set_mem_enc() to make code more readable in the __set_memory_enc_dec().

Change since RFC v2:
       - Remove not UIO driver in Isolation VM patch
       - Use vmap_pfn() to replace ioremap_page_range function in
       order to avoid exposing symbol ioremap_page_range() and
       ioremap_page_range()
       - Call hv set mem host visibility hvcall in set_memory_encrypted/decrypted()
       - Enable swiotlb force mode instead of adding Hyper-V dma map/unmap hook
       - Fix code style


Tianyu Lan (13):
  x86/HV: Initialize GHCB page in Isolation VM
  x86/HV: Initialize shared memory boundary in the Isolation VM.
  x86/HV: Add new hvcall guest address host visibility support
  HV: Mark vmbus ring buffer visible to host in Isolation VM
  HV: Add Write/Read MSR registers via ghcb page
  HV: Add ghcb hvcall support for SNP VM
  HV/Vmbus: Add SNP support for VMbus channel initiate message
  HV/Vmbus: Initialize VMbus ring buffer for Isolation VM
  DMA: Add dma_map_decrypted/dma_unmap_encrypted() function
  x86/Swiotlb: Add Swiotlb bounce buffer remap function for HV IVM
  HV/IOMMU: Enable swiotlb bounce buffer for Isolation VM
  HV/Netvsc: Add Isolation VM support for netvsc driver
  HV/Storvsc: Add Isolation VM support for storvsc driver

 arch/x86/hyperv/Makefile           |   2 +-
 arch/x86/hyperv/hv_init.c          |  87 +++++++--
 arch/x86/hyperv/ivm.c              | 296 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  18 ++
 arch/x86/include/asm/mshyperv.h    |  86 ++++++++-
 arch/x86/include/asm/sev.h         |   4 +
 arch/x86/kernel/cpu/mshyperv.c     |   5 +
 arch/x86/kernel/sev-shared.c       |  21 +-
 arch/x86/mm/pat/set_memory.c       |   6 +-
 arch/x86/xen/pci-swiotlb-xen.c     |   3 +-
 drivers/hv/Kconfig                 |   1 +
 drivers/hv/channel.c               |  48 ++++-
 drivers/hv/connection.c            |  71 ++++++-
 drivers/hv/hv.c                    | 129 +++++++++----
 drivers/hv/hyperv_vmbus.h          |   3 +
 drivers/hv/ring_buffer.c           |  84 ++++++--
 drivers/hv/vmbus_drv.c             |   3 +
 drivers/iommu/hyperv-iommu.c       |  65 +++++++
 drivers/net/hyperv/hyperv_net.h    |   6 +
 drivers/net/hyperv/netvsc.c        | 144 +++++++++++++-
 drivers/net/hyperv/rndis_filter.c  |   2 +
 drivers/scsi/storvsc_drv.c         |  68 ++++++-
 include/asm-generic/hyperv-tlfs.h  |   1 +
 include/asm-generic/mshyperv.h     |  53 +++++-
 include/linux/dma-map-ops.h        |   9 +
 include/linux/hyperv.h             |  16 ++
 include/linux/swiotlb.h            |   4 +
 kernel/dma/mapping.c               |  22 +++
 kernel/dma/swiotlb.c               |  11 +-
 29 files changed, 1166 insertions(+), 102 deletions(-)
 create mode 100644 arch/x86/hyperv/ivm.c

-- 
2.25.1


