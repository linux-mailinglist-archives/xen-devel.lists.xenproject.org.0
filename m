Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B346526A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 17:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236084.409469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS4a-0002Ue-JK; Wed, 01 Dec 2021 16:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236084.409469; Wed, 01 Dec 2021 16:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msS4a-0002Sr-G1; Wed, 01 Dec 2021 16:03:08 +0000
Received: by outflank-mailman (input) for mailman id 236084;
 Wed, 01 Dec 2021 16:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kkHa=QS=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1msS4Y-0002Sl-OX
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 16:03:06 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ab4e199-52c0-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 17:03:05 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso2011407pjb.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Dec 2021 08:03:05 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:7fe9:3f1e:749e:5d26])
 by smtp.gmail.com with ESMTPSA id i193sm260316pfe.87.2021.12.01.08.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 08:03:03 -0800 (PST)
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
X-Inumbo-ID: 2ab4e199-52c0-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rlwCB8WctxDfzc6GjE9sqD8LeMvFTR6Cy4YHzp8XozM=;
        b=g65nlico0J7bcL2aCYAvGlzhTnCKVbRduh36LX8XvjEFFN6wHfS2L0u8BDmelEHEXY
         Wv2DKXAKifhTQ2TpjjT56A67ntJ/hLaAeFO4OjbN4Ti7m1iEE1qu9F65fiYof7/4PEPV
         ZCP/wMs4XoUk93Q/OO68b2EbvB6PER51u6kuhgNSK6ZzO9ZORgPO6UIUg5xjG8sFLdGd
         ls4FlMeHyYU9uABxxpZWR+w8CK7IGHVPGRX+JHnBOypkPhIhIwhSSMvJYvCaN/oA8IVr
         9XQqbYS4GRZB8sJJVE4lMBsN5HiN6zBTtQSYbnnf3R6OllAQ6RujK5AFIFhuwjrdXs5b
         YyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rlwCB8WctxDfzc6GjE9sqD8LeMvFTR6Cy4YHzp8XozM=;
        b=RU+hVMlK5Gu2Qi08LyUpmAc/HBjTYSp1ak2O+wI3ozHwI1anHNfvHmvKSEcI0lbA4l
         IG3uzZknLIeEz5qN7X6a7P3xU11wmRUCJxBn87VYQnVrvrdCu6gLVFPcA2OPGzidFHcW
         O+t+z2FU9ajkumA6k4/MWa8NWCIG67WcDaHzC7nJiYH0PwrCNTUHBJhQFMve6Lnsrd/c
         trgyk4Nxnf/ZzDffAn8xaLCy9umuwU/+Vklzs+13GTMl6nQarGzgLYq7sR+4WQjUWgkB
         sOsgoSxkEz81vzz6m+eLwGePvNu7zadA5UL1kWTLjABqBkfXFBZuoz4o5jCDeK/OeRzk
         zgEA==
X-Gm-Message-State: AOAM531ujNJfG2vwDpQRy+8yAeHqqmCUUegu8l/mP7C4VKUi+5mcjZvw
	vHWVsZPLtHqlkJIX7KOEQj4=
X-Google-Smtp-Source: ABdhPJzx8p2vypCygtN2v0ahrkMP7/JwVPIEscHdxdl4qbo3ST4qz0+r/UT4/nSDoAKM/Jt7Mpx/+Q==
X-Received: by 2002:a17:902:748c:b0:141:c45e:c612 with SMTP id h12-20020a170902748c00b00141c45ec612mr8329728pll.73.1638374584178;
        Wed, 01 Dec 2021 08:03:04 -0800 (PST)
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
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
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
Subject: [PATCH V3 0/5] x86/Hyper-V: Add Hyper-V Isolation VM support(Second part)
Date: Wed,  1 Dec 2021 11:02:51 -0500
Message-Id: <20211201160257.1003912-1-ltykernel@gmail.com>
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
 arch/x86/kernel/cc_platform.c     |  15 ++++
 arch/x86/xen/pci-swiotlb-xen.c    |   3 +-
 drivers/hv/hv_common.c            |  11 +++
 drivers/hv/vmbus_drv.c            |   4 +
 drivers/iommu/hyperv-iommu.c      |  56 ++++++++++++
 drivers/net/hyperv/hyperv_net.h   |   5 ++
 drivers/net/hyperv/netvsc.c       | 136 +++++++++++++++++++++++++++++-
 drivers/net/hyperv/netvsc_drv.c   |   1 +
 drivers/net/hyperv/rndis_filter.c |   2 +
 drivers/scsi/storvsc_drv.c        |  37 ++++----
 include/asm-generic/mshyperv.h    |   2 +
 include/linux/hyperv.h            |  14 +++
 include/linux/swiotlb.h           |   6 ++
 kernel/dma/swiotlb.c              |  47 +++++++++--
 15 files changed, 342 insertions(+), 25 deletions(-)

-- 
2.25.1


