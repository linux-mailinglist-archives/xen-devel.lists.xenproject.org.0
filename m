Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D93E07E0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 20:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163840.299983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtM-0005QA-0W; Wed, 04 Aug 2021 18:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163840.299983; Wed, 04 Aug 2021 18:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLtL-0005Nt-Td; Wed, 04 Aug 2021 18:45:23 +0000
Received: by outflank-mailman (input) for mailman id 163840;
 Wed, 04 Aug 2021 18:45:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0vd=M3=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mBLtK-0005Nn-6t
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 18:45:22 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5293151-4050-4385-a87f-ee73e79ab532;
 Wed, 04 Aug 2021 18:45:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so4874263pjb.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 11:45:21 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:1947:6842:b8a8:6f83])
 by smtp.gmail.com with ESMTPSA id f5sm3325647pjo.23.2021.08.04.11.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:45:19 -0700 (PDT)
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
X-Inumbo-ID: b5293151-4050-4385-a87f-ee73e79ab532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tCOWlCVzJ/vNFZC4gC6K6prPZvwl0XzQwKDBWhCLMn0=;
        b=GXASiyKYtq8/Bgud0lyPhD9m2ZDbNZQsl56/ePhMGS1TUFwoLCBtYcq5+x2lER0t5P
         zcAgBay5Ynx3pJcDNg6HgAPwVWnPb1WjynAgeOlq6o+HPrYeul551WPl0dXGfyM0ajX8
         jH0apncFN0/At3TGXp4jU/C4OwrIJv+8wNN3sWUAqeC7MHXsyyjXFfnz2UECVXha/sNg
         I4rXqNSGRrTjXeX4B4SqLwmVkt5MXsIki9IyXAqcp40eSo3Xmlo+5hvBkcN4/dglOMtl
         Uzx+H5I5QJtxLDwE7y830ynuCOHiHuBna3Uv61+yodcsxnzGd1B/HyOEOE7mW/IjsgMc
         wBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tCOWlCVzJ/vNFZC4gC6K6prPZvwl0XzQwKDBWhCLMn0=;
        b=Bs0vjwr3/QefuhQQKiCRJaarybXu4rTpAgUpeFZ5oI+GOM9pdgj1ZC/sdxV+abN4DW
         cuSm1v3EVU4lmsPN0xS3smW9ltuTdC73yhrB4OMnW3UJr6TdNO6JT6qE/OcO5KVH154O
         E8F3qoot3XApIJW5mtrFGybnlApwe9owRegAw5UH6hVuXGurEvPnvkdr624I6PhZMTK+
         xiVyvxqdGS6nqAtkME4NPe1X3kIQV6UrifhqdJBnZ4KUrWKVZDPU5r22fTl6BlCC+160
         G2/Y1Vr5rRxzwZ8awbcZShRa1c1j5geOiaRjlWrwGUmxzOrvMY4Q7vDP78ilPapftl/x
         i56Q==
X-Gm-Message-State: AOAM533dB9FOtq7HDF3KztfyXD7jR/dJnFcnXbf/irHZvgNPs7qbjvPq
	ITsoFYzqCCS99U6hJQvGD/U=
X-Google-Smtp-Source: ABdhPJwrmdKQ47neq1EMdpZ0UbHKJYCgTGPCSMaTpgTirMsAABPF9yn55RB8QxFUVni1AjDdexBDuw==
X-Received: by 2002:aa7:9537:0:b029:3b6:d6f0:6328 with SMTP id c23-20020aa795370000b02903b6d6f06328mr1090266pfp.38.1628102720172;
        Wed, 04 Aug 2021 11:45:20 -0700 (PDT)
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
	Tianyu.Lan@microsoft.com,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	david@redhat.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	aneesh.kumar@linux.ibm.com,
	xen-devel@lists.xenproject.org,
	martin.b.radev@gmail.com,
	ardb@kernel.org,
	rientjes@google.com,
	tj@kernel.org,
	keescook@chromium.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	parri.andrea@gmail.com
Subject: [PATCH V2 00/14] x86/Hyper-V: Add Hyper-V Isolation VM support
Date: Wed,  4 Aug 2021 14:44:56 -0400
Message-Id: <20210804184513.512888-1-ltykernel@gmail.com>
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


Tianyu Lan (14):
  x86/HV: Initialize GHCB page in Isolation VM
  x86/HV: Initialize shared memory boundary in the Isolation VM.
  x86/set_memory: Add x86_set_memory_enc static call support
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
 arch/x86/hyperv/hv_init.c          |  81 ++++++--
 arch/x86/hyperv/ivm.c              | 295 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  20 ++
 arch/x86/include/asm/mshyperv.h    |  87 ++++++++-
 arch/x86/include/asm/set_memory.h  |   4 +
 arch/x86/include/asm/sev.h         |   3 +
 arch/x86/kernel/cpu/mshyperv.c     |   5 +
 arch/x86/kernel/sev-shared.c       |  63 +++---
 arch/x86/mm/pat/set_memory.c       |   9 +
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
 include/asm-generic/mshyperv.h     |  53 +++++-
 include/linux/dma-map-ops.h        |   9 +
 include/linux/hyperv.h             |  17 ++
 include/linux/swiotlb.h            |   4 +
 kernel/dma/mapping.c               |  22 +++
 kernel/dma/swiotlb.c               |  32 +++-
 30 files changed, 1216 insertions(+), 124 deletions(-)
 create mode 100644 arch/x86/hyperv/ivm.c

-- 
2.25.1


