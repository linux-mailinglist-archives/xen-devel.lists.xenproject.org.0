Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC9D468A0C
	for <lists+xen-devel@lfdr.de>; Sun,  5 Dec 2021 09:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238263.412989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtmj2-0006Wf-41; Sun, 05 Dec 2021 08:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238263.412989; Sun, 05 Dec 2021 08:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtmj1-0006TP-TP; Sun, 05 Dec 2021 08:18:23 +0000
Received: by outflank-mailman (input) for mailman id 238263;
 Sun, 05 Dec 2021 08:18:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5+j=QW=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mtmj0-0006T9-5g
 for xen-devel@lists.xenproject.org; Sun, 05 Dec 2021 08:18:22 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e70cf450-55a3-11ec-a5e1-b9374ead2679;
 Sun, 05 Dec 2021 09:18:20 +0100 (CET)
Received: by mail-pg1-x534.google.com with SMTP id k4so7393452pgb.8
 for <xen-devel@lists.xenproject.org>; Sun, 05 Dec 2021 00:18:20 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:87aa:e334:f070:ebca])
 by smtp.gmail.com with ESMTPSA id s8sm6439905pgl.77.2021.12.05.00.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 00:18:17 -0800 (PST)
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
X-Inumbo-ID: e70cf450-55a3-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dfM94A9YIlyVB8rT/Fyc0cGVK5U5XvE0VXTSezF6RKs=;
        b=XjtWZ4TQugWlqSvIgCkbqi7HQ5b8zuwuwua6IwpffcpwfAyDaobtNwXYuWcvpbBFE4
         9WcjLsStsKid77+RD2YC7kd02/pHapke3O37ldqGjOQxX3qpaITr2seyiQsoxB3w7Wc0
         p/CMzw4L9gQcgza+P0xpVKrvTkJmfwAcQbe9cdQN/96UJkevU198ptb2fql3Nl42vmjo
         z6E4jbyPJsG1mpx5G3qbcemu+YT6WaxTXXHQPNWZTvdAzgx2cPqLhcMeWwsECq7ROn0S
         jdr1XwQiTJQJh0m1FBJbpNlLwobl8Bf+uppKRO+fqeRzV4k1EfksDNQY4LqGbBl9E3qY
         gIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dfM94A9YIlyVB8rT/Fyc0cGVK5U5XvE0VXTSezF6RKs=;
        b=1Al6GdsiO9ekUOGTW4AKvpyz7MAAL4atULa8npRu/SAVj6kfS+oLEkg9h/Rbbt2CuH
         FiGTY4syMt408QYxn/gRFOlpfiRlHU9q35zdds8w9dCZSnxmUO2RL7TRwm8I0qRV1SzZ
         zFbH7EjJX3oXKi3FqDe+MxpxaCi5HRI+n9qZXARdXIvtJ2ahHdozCsT5jkKjzxUl5SdQ
         AMp+eYiK6aOfTKfgamughHXAvKVi87aGJuHN3QiL5EIz9oIrYLQr0JjqVqlAqyx0ENJY
         mG+RPtHTBwI9M8ZtT687lLmrOheLW5hJdJ5WPXwQrHSfSfYuws971Qd+EiGcNck1bHPQ
         69FQ==
X-Gm-Message-State: AOAM532hRICs0C5M54mmPt62dxEsjNwIqL0ghha5+7fcXaX+D349LLD+
	D6hd+uQCBHXGlDm0i9DrxO0=
X-Google-Smtp-Source: ABdhPJx1nL+30YTsDOKE6LJfYcCpMeKCOeoz9AVpsf63uFFgijhWvJ6bOiQ0k+V3CXM4JXAEUKtCKw==
X-Received: by 2002:aa7:8755:0:b0:494:67a6:1c84 with SMTP id g21-20020aa78755000000b0049467a61c84mr28292360pfo.26.1638692297989;
        Sun, 05 Dec 2021 00:18:17 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	arnd@arndb.de,
	hch@infradead.org,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	thomas.lendacky@amd.com,
	Tianyu.Lan@microsoft.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	hch@lst.de,
	parri.andrea@gmail.com,
	dave.hansen@intel.com
Subject: [PATCH V4 0/5] x86/Hyper-V: Add Hyper-V Isolation VM support(Second part)
Date: Sun,  5 Dec 2021 03:18:08 -0500
Message-Id: <20211205081815.129276-1-ltykernel@gmail.com>
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

For SNP isolation VM, guest needs to access the shared memory via
extra address space which is specified by Hyper-V CPUID HYPERV_CPUID_
ISOLATION_CONFIG. The access physical address of the shared memory
should be bounce buffer memory GPA plus with shared_gpa_boundary
reported by CPUID.

This patchset is to enable swiotlb bounce buffer for netvsc/storvsc
in Isolation VM.

This version follows Michael Kelley suggestion in the following link.
https://lkml.org/lkml/2021/11/24/2044

Change since v3:
	* Fix boot up failure on the host with mem_encrypt=on.
	  Move calloing of set_memory_decrypted() back from
	  swiotlb_init_io_tlb_mem to swiotlb_late_init_with_tbl()
	  and rmem_swiotlb_device_init().
	* Change code style of checking GUEST_MEM attribute in the
	  hyperv_cc_platform_has().
	* Add comment in pci-swiotlb-xen.c to explain why add
	  dependency between hyperv_swiotlb_detect() and pci_
	  xen_swiotlb_detect().
	* Return directly when fails to allocate Hyper-V swiotlb
	  buffer in the hyperv_iommu_swiotlb_init().

Change since v2:
	* Remove Hyper-V dma ops and dma_alloc/free_noncontiguous. Add
	  hv_map/unmap_memory() to map/umap netvsc rx/tx ring into extra
	  address space.
	* Leave mem->vaddr in swiotlb code with phys_to_virt(mem->start)
	  when fail to remap swiotlb memory.

Change since v1:
	* Add Hyper-V Isolation support check in the cc_platform_has()
	  and return true for guest memory encrypt attr.
	* Remove hv isolation check in the sev_setup_arch()

Tianyu Lan (5):
  Swiotlb: Add Swiotlb bounce buffer remap function for HV IVM
  x86/hyper-v: Add hyperv Isolation VM check in the cc_platform_has()
  hyperv/IOMMU: Enable swiotlb bounce buffer for Isolation VM
  scsi: storvsc: Add Isolation VM support for storvsc driver
  hv_netvsc: Add Isolation VM support for netvsc driver

 arch/x86/hyperv/ivm.c             |  28 ++++++
 arch/x86/kernel/cc_platform.c     |  12 +++
 arch/x86/xen/pci-swiotlb-xen.c    |  12 ++-
 drivers/hv/hv_common.c            |  11 +++
 drivers/hv/vmbus_drv.c            |   4 +
 drivers/iommu/hyperv-iommu.c      |  58 +++++++++++++
 drivers/net/hyperv/hyperv_net.h   |   5 ++
 drivers/net/hyperv/netvsc.c       | 136 +++++++++++++++++++++++++++++-
 drivers/net/hyperv/netvsc_drv.c   |   1 +
 drivers/net/hyperv/rndis_filter.c |   2 +
 drivers/scsi/storvsc_drv.c        |  37 ++++----
 include/asm-generic/mshyperv.h    |   2 +
 include/linux/hyperv.h            |  14 +++
 include/linux/swiotlb.h           |   6 ++
 kernel/dma/swiotlb.c              |  43 +++++++++-
 15 files changed, 349 insertions(+), 22 deletions(-)

-- 
2.25.1


