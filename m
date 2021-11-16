Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B173453604
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226387.391205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0YX-0007fY-Ha; Tue, 16 Nov 2021 15:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226387.391205; Tue, 16 Nov 2021 15:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0YX-0007dm-Ea; Tue, 16 Nov 2021 15:39:33 +0000
Received: by outflank-mailman (input) for mailman id 226387;
 Tue, 16 Nov 2021 15:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6+K+=QD=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mn0YV-0007dc-TC
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:39:31 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 635d73c5-46f3-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 16:39:31 +0100 (CET)
Received: by mail-pg1-x536.google.com with SMTP id g28so17942514pgg.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Nov 2021 07:39:30 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:3:57e4:b776:c854:76dd])
 by smtp.gmail.com with ESMTPSA id x64sm1981948pfd.151.2021.11.16.07.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:39:25 -0800 (PST)
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
X-Inumbo-ID: 635d73c5-46f3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ytk8p6TdYJp6Y0bV41yrFTfo+pk8rHAune+7pZw0P98=;
        b=BXz0KFtLleSQa3skiYw7QDE1dXPqvkgmZsVeu4fLM5Yo+p5BS9ZqK8GmlqMk8KB2Jd
         MbFA1Sdyl8HeuFhTjRLnnl3I6jVDF41fuFlW3H6A+W4gc2Uds+KPsc9KT7JcuhVGbq/t
         XAcYRH7ZrHrS/7eajwuW1ku+LBiQ4Qc+oXHnk0LQfeobjP2mtKBjazQ5Ojyz1ZP9PGUs
         KqRxaCIQx43OP4enShtmT5F7s37Tk9u+0bvcviYRxBqU7AdqBL5xPuBzLRr/J69QC52x
         9+z78bSAAsg3A9UtUTA6eQyj+jhqQGR/7QgyARigUS1/lv1vKxm9S0dnSLpOzn5YgjJU
         DsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ytk8p6TdYJp6Y0bV41yrFTfo+pk8rHAune+7pZw0P98=;
        b=vXaRjpbsCUPI21Lt95vZ2+xNjflzj/r3KtMOhii5/pdvKSWpRKRJuLFVm78yiCQbcn
         ZkG+taXf/ArQAnUJRXPKNG0dbxtqU6Brmx5SPR+rRU1llt0gYu5oVHXoq5/wbk7oTjE+
         28+P5oPl4KtXyHLzAyzOIlMwhy9stO6DfJsVDNlg5qkrMmeO+PGE9RbLdq06yJA3GnYx
         mEolwUwIdZ5FVPW5U0V+G3vEPFNqdvDcSseK26vgAlbXAFyFqbA0okRju2CM7+SdAM0Z
         KTMtyJro2Kz1tBOTsuR6ZFbhwu2fKCAcRfsvEjE0AdNjLnDCQas3uwKcaDy4jnu0Taox
         kp4w==
X-Gm-Message-State: AOAM532ga2zwxFx9cevcoQbIuQ/TzZxUqVu1Wpt/lf6ji/DF39n6767A
	kC/cZaeFMhNIF3bYmuMmNTM=
X-Google-Smtp-Source: ABdhPJwz59YenP80sWYPo5tTasO7qod/XFwabISMwdQ71s0CE7pvGan1FvjN3qeawYe/WCw9pDZXgA==
X-Received: by 2002:a62:5215:0:b0:49f:a996:b724 with SMTP id g21-20020a625215000000b0049fa996b724mr40917927pfb.3.1637077166648;
        Tue, 16 Nov 2021 07:39:26 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	sthemmin@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	joro@8bytes.org,
	will@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	xen-devel@lists.xenproject.org,
	michael.h.kelley@microsoft.com
Cc: Tianyu Lan <Tianyu.Lan@microsoft.com>,
	iommu@lists.linux-foundation.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	konrad.wilk@oracle.com,
	parri.andrea@gmail.com,
	thomas.lendacky@amd.com,
	dave.hansen@intel.com
Subject: [PATCH 0/5] x86/Hyper-V: Add Hyper-V Isolation VM support(Second part)
Date: Tue, 16 Nov 2021 10:39:18 -0500
Message-Id: <20211116153923.196763-1-ltykernel@gmail.com>
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
in Isolation VM. Add Hyper-V dma ops and provide dma_alloc/free_
noncontiguous and vmap/vunmap_noncontiguous callback. Allocate
rx/tx ring via dma_alloc_noncontiguous() and map them into extra
address space via dma_vmap_noncontiguous().

Tianyu Lan (5):
  x86/Swiotlb: Add Swiotlb bounce buffer remap function for HV IVM
  dma-mapping: Add vmap/vunmap_noncontiguous() callback in dma ops
  hyperv/IOMMU: Enable swiotlb bounce buffer for Isolation VM
  net: netvsc: Add Isolation VM support for netvsc driver
  scsi: storvsc: Add Isolation VM support for storvsc driver

 arch/x86/mm/mem_encrypt.c         |   4 +-
 arch/x86/xen/pci-swiotlb-xen.c    |   3 +-
 drivers/hv/Kconfig                |   1 +
 drivers/hv/vmbus_drv.c            |   6 +
 drivers/iommu/hyperv-iommu.c      | 164 +++++++++++++++++++++++++
 drivers/net/hyperv/hyperv_net.h   |   5 +
 drivers/net/hyperv/netvsc.c       | 192 +++++++++++++++++++++++++++---
 drivers/net/hyperv/rndis_filter.c |   2 +
 drivers/scsi/storvsc_drv.c        |  37 +++---
 include/linux/dma-map-ops.h       |   3 +
 include/linux/hyperv.h            |  17 +++
 include/linux/swiotlb.h           |   6 +
 kernel/dma/mapping.c              |  18 ++-
 kernel/dma/swiotlb.c              |  75 ++++++++++--
 14 files changed, 488 insertions(+), 45 deletions(-)

-- 
2.25.1


