Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C03F9D90
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173800.317093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXh-00018c-DW; Fri, 27 Aug 2021 17:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173800.317093; Fri, 27 Aug 2021 17:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfXh-00016W-9A; Fri, 27 Aug 2021 17:21:25 +0000
Received: by outflank-mailman (input) for mailman id 173800;
 Fri, 27 Aug 2021 17:21:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfXe-00016Q-Vq
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:21:23 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5289df22-67d9-4548-b5b5-14bc14b4613b;
 Fri, 27 Aug 2021 17:21:21 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y11so6213907pfl.13
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:21:21 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:19 -0700 (PDT)
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
X-Inumbo-ID: 5289df22-67d9-4548-b5b5-14bc14b4613b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JYTZo1EPFzxHx7wJIoJCzUP9GEH1Yym5lq7cwfCdAwc=;
        b=sOsMz6fnS+QgIpFYVjcXYRvxDOeMD9h2bMw2GBTmeCUkkk23vrYd780herBfwXgbvA
         hGA78c9LQ5mFrIxGoV5bh92RPIkBNV3zC7aQWqPvZwzqR7eUipC3F6tCE1lS99UNu4qv
         /jGXM6dXDIj5E3xUFJJk/TohEampnyBbRIYD1hLJy5pBxUTK37a84VmpHtj16lZu5LT0
         G4r2Bzmm/nfXZDV23kipSRDeoxZKgWHSNBDvgeDYycwMlF9Ol+JBrPSsMJATGXvDUGHL
         2knvJbm+YsN9tX0nrsuUr2ArVRQaH8IUpNj0nizy6pNhKxUJ87d02iccTWQAYTy6Q9Rt
         HxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JYTZo1EPFzxHx7wJIoJCzUP9GEH1Yym5lq7cwfCdAwc=;
        b=dnrkjE9ZRlzPjjvuPtZAZ+i6ERw5FhV4OWqqU2v3Q97Lg0IrTVPfrK7CjpozDK81y5
         TYXnxhzLfSAKVXl6ZvdZWTuJJu1lOZ6C9KZ996ci6srVdoejEOHKGi5HxkpLvwofNL09
         dzkG3UDWCXHXKXU8fAkdcUSTPZZA9n0UiyPc+qLBHywTfhn/+zcITjlcGeuiIJFC9N0q
         Oh/UE+oi/cOJZwDj0qiewhHAtCX92BDtM7a6mTAcEW1xN/a5KIqrYda3c7xjNSjWoz3p
         r2AxjEyKehGYllOmYyCRgxG9LKzU/lpv0N76jIb4+JlgxH1AqnoSuyUYT9eYNnCQvwhV
         wgiA==
X-Gm-Message-State: AOAM533368tcmfPc7pDwGpGhs+BNlkPJNGyrRJd6zqNhlJz4dcdjxiIN
	HQi48X7+lkP38GYXZMp8xc4=
X-Google-Smtp-Source: ABdhPJy8nJHUvt2VMPE+PZOZMLCaAJdSlRB5iqGhbKn5tvohwh3WTNMW4inTU/nRNNiQJDSPg3loUQ==
X-Received: by 2002:a63:5a64:: with SMTP id k36mr8614505pgm.378.1630084880519;
        Fri, 27 Aug 2021 10:21:20 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
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
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	hannes@cmpxchg.org,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	rientjes@google.com,
	ardb@kernel.org,
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
Subject: [PATCH V4 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
Date: Fri, 27 Aug 2021 13:20:58 -0400
Message-Id: <20210827172114.414281-1-ltykernel@gmail.com>
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

This patchset is based on the Hyper-V next branch.

Change since V3:
	- Initalize GHCB page in the cpu init callbac.
	- Change vmbus_teardown_gpadl() parameter in order to
	  mask the memory back to non-visible to host.
	- Merge hv_ringbuffer_post_init() into hv_ringbuffer_init().
	- Keep Hyper-V bounce buffer size as same as AMD SEV VM
	- Use dma_map_sg() instead of dm_map_page() in the storvsc driver.

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
  x86/hyperv: Initialize GHCB page in Isolation VM
  x86/hyperv: Initialize shared memory boundary in the Isolation VM.
  x86/hyperv: Add new hvcall guest address host visibility support
  hyperv: Mark vmbus ring buffer visible to host in Isolation VM
  hyperv: Add Write/Read MSR registers via ghcb page
  hyperv: Add ghcb hvcall support for SNP VM
  hyperv/Vmbus: Add SNP support for VMbus channel initiate  message
  hyperv/vmbus: Initialize VMbus ring buffer for Isolation VM
  DMA: Add dma_map_decrypted/dma_unmap_encrypted() function
  x86/Swiotlb: Add Swiotlb bounce buffer remap function for HV IVM
  hyperv/IOMMU: Enable swiotlb bounce buffer for Isolation VM
  hv_netvsc: Add Isolation VM support for netvsc driver
  hv_storvsc: Add Isolation VM support for storvsc driver

 arch/arm64/include/asm/mshyperv.h  |  23 ++
 arch/x86/hyperv/Makefile           |   2 +-
 arch/x86/hyperv/hv_init.c          |  78 +++++--
 arch/x86/hyperv/ivm.c              | 325 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  17 ++
 arch/x86/include/asm/mshyperv.h    |  88 +++++++-
 arch/x86/include/asm/sev.h         |   3 +
 arch/x86/kernel/cpu/mshyperv.c     |   5 +
 arch/x86/kernel/sev-shared.c       |  63 +++---
 arch/x86/mm/mem_encrypt.c          |   3 +-
 arch/x86/mm/pat/set_memory.c       |  19 +-
 arch/x86/xen/pci-swiotlb-xen.c     |   3 +-
 drivers/hv/Kconfig                 |   1 +
 drivers/hv/channel.c               |  55 +++--
 drivers/hv/connection.c            |  81 ++++++-
 drivers/hv/hv.c                    | 120 +++++++----
 drivers/hv/hv_common.c             |  12 ++
 drivers/hv/hyperv_vmbus.h          |   1 +
 drivers/hv/ring_buffer.c           |  56 +++--
 drivers/hv/vmbus_drv.c             |   4 +
 drivers/iommu/hyperv-iommu.c       |  61 ++++++
 drivers/net/hyperv/hyperv_net.h    |   6 +
 drivers/net/hyperv/netvsc.c        | 151 +++++++++++++-
 drivers/net/hyperv/rndis_filter.c  |   2 +
 drivers/scsi/storvsc_drv.c         |  41 ++--
 drivers/uio/uio_hv_generic.c       |  14 +-
 include/asm-generic/hyperv-tlfs.h  |   1 +
 include/asm-generic/mshyperv.h     |  19 +-
 include/linux/dma-map-ops.h        |   9 +
 include/linux/hyperv.h             |  15 +-
 include/linux/swiotlb.h            |   4 +
 kernel/dma/mapping.c               |  22 ++
 kernel/dma/swiotlb.c               |  32 ++-
 33 files changed, 1166 insertions(+), 170 deletions(-)
 create mode 100644 arch/x86/hyperv/ivm.c

-- 
2.25.1


