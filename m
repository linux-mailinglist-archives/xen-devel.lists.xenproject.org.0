Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA513E4B64
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165112.301759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9Vk-0000Ej-3T; Mon, 09 Aug 2021 17:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165112.301759; Mon, 09 Aug 2021 17:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9Vj-0000Aw-Vr; Mon, 09 Aug 2021 17:56:27 +0000
Received: by outflank-mailman (input) for mailman id 165112;
 Mon, 09 Aug 2021 17:56:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD4O=NA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mD9Vj-0000Aq-6G
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:56:27 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35593939-93f3-4614-bdf0-37e468379ec3;
 Mon, 09 Aug 2021 17:56:25 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id a20so17372021plm.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:56:25 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:23 -0700 (PDT)
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
X-Inumbo-ID: 35593939-93f3-4614-bdf0-37e468379ec3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iMjG88RfqbH3GsgcXA5mv3GuI6oCcG41dDNUrFFXLAQ=;
        b=EViVv89zPeRqrGYf9LSDfx7ltGQyAh4Avv1iqGXrZVN8IJuT63NhOIxiCyk8Rx6sFQ
         MnHutJOGM4qObGTB3+2cDbzN4XBxMdUdYKKb4gdQgVYXZpLOwn/LJTBX3yu2AGv1TQf3
         gHD7PNproN/353NWNPLbKsHhp8I5TfXCuEG8GTgqdzoTROjdYr7R+QVuJWXGMX3O1nKM
         RVW2Isxs0xuZHcR/6YqF12JGhSFNL7twyZAqbDPV4zDkbkQQ1mDpob6v3yKEJ83Wgmje
         DnZ5wIak32lAhxG4fYr8PeZhzjGZR40FVtp2z4KdVrsEgpAFr/Ky4zrJzy/tHZhuJrQU
         8oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iMjG88RfqbH3GsgcXA5mv3GuI6oCcG41dDNUrFFXLAQ=;
        b=i0hCpsWDJCvq1lzn4p9DRe8q35ILYk1EASfNtOopfOk5UDIvZUmShylb6qXuR4J+Bm
         HD7QkBxuL5yhnCxouO32J3Ktp6Uk8Ov1jT8Pize6wuaC7+elpalcSgQfzXr3vZpeWNCQ
         2+ulS6R8cVDrBZ1xKBnj58iWipZpfmMTkIc50Rexu0BqV/CS7OOQ55agepU1t/DM+tcr
         S9gowsnCPVrNowGhrAjRRtgQSd40Wber3U10+uKcJjVYIeMP4cYPlTGhE4QkRCo4w5/9
         3JS85WSEN4TqgryqBAiTNLoykYnyEoC9XQjPPp2i8a0Leasi9FuQQYegYSWUFirzbYjv
         JvyA==
X-Gm-Message-State: AOAM53314YeT2lL4rML+c5o7L0RDYdCre8KHSpirKXkrs0QeoArZG9n9
	/rnluo+tfXFzL1ypMrmlhq8=
X-Google-Smtp-Source: ABdhPJxHfYqFvwoB8xKnP4oxRsbZ9Lzyar+mwb4Rea7hgUEL0NvwGLrtk99GSAXFKwmlrj/fCUWr6A==
X-Received: by 2002:a17:90a:e018:: with SMTP id u24mr4349253pjy.126.1628531783941;
        Mon, 09 Aug 2021 10:56:23 -0700 (PDT)
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
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	hannes@cmpxchg.org,
	tj@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V3 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
Date: Mon,  9 Aug 2021 13:56:04 -0400
Message-Id: <20210809175620.720923-1-ltykernel@gmail.com>
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


Change since V2:
       - Drop x86_set_memory_enc static call and use platform check
         in the __set_memory_enc_dec() to run platform callback of
	 set memory encrypted or decrypted.

Change since V1:
       - Introduce x86_set_memory_enc static call and so platforms can
         override __set_memory_enc_dec() with their implementation
       - Introduce sev_es_ghcb_hv_call_simple() and share code
         between SEV and Hyper-V code.
       - Not remap monitor pages in the non-SNP isolation VM
       - Make swiotlb_init_io_tlb_mem() return error code and return
         error when dma_map_decrypted() fails.

Change since RFC V4:
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
 arch/x86/hyperv/hv_init.c          |  75 ++++++--
 arch/x86/hyperv/ivm.c              | 295 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  20 ++
 arch/x86/include/asm/mshyperv.h    |  87 ++++++++-
 arch/x86/include/asm/sev.h         |   3 +
 arch/x86/kernel/cpu/mshyperv.c     |   5 +
 arch/x86/kernel/sev-shared.c       |  63 +++---
 arch/x86/mm/pat/set_memory.c       |  19 +-
 arch/x86/xen/pci-swiotlb-xen.c     |   3 +-
 drivers/hv/Kconfig                 |   1 +
 drivers/hv/channel.c               |  54 +++++-
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
 include/asm-generic/mshyperv.h     |  54 +++++-
 include/linux/dma-map-ops.h        |   9 +
 include/linux/hyperv.h             |  17 ++
 include/linux/swiotlb.h            |   4 +
 kernel/dma/mapping.c               |  22 +++
 kernel/dma/swiotlb.c               |  32 +++-
 29 files changed, 1212 insertions(+), 129 deletions(-)
 create mode 100644 arch/x86/hyperv/ivm.c

-- 
2.25.1


