Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A7D3F9D99
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 19:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173813.317169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfYF-0004I0-42; Fri, 27 Aug 2021 17:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173813.317169; Fri, 27 Aug 2021 17:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJfYE-0004FR-V1; Fri, 27 Aug 2021 17:21:58 +0000
Received: by outflank-mailman (input) for mailman id 173813;
 Fri, 27 Aug 2021 17:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brRM=NS=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mJfYD-00016Q-Ne
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 17:21:57 +0000
Received: from mail-pf1-x42b.google.com (unknown [2607:f8b0:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a97efa3d-a27b-4e67-adc2-57c68b97bb78;
 Fri, 27 Aug 2021 17:21:39 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 2so6225960pfo.8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 10:21:39 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:38 -0700 (PDT)
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
X-Inumbo-ID: a97efa3d-a27b-4e67-adc2-57c68b97bb78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IDv52uhOHnM52YSplOEizgvrMcaCG52xTZqX8PjRtjY=;
        b=W3A72vwZ3Ghwpp2o31CalwDckdSlHrw8StpK5AyjpmRfd7CoTWRdKx9qXGzOjb4pj3
         NCSk+7IZAD3LedbDJg025YQV6OI40vLBcSKr0wrsGn6eizyE2OTRY7/X40qbI132Q8la
         icbgRcIxFmG914HjGbujHrewWgk176VEDV+x/QdzOvheP0TwfLTweIzL9uBVd3yVDUn2
         vSmaSU6KUJ257VBVrC46n3gE5fJnAmuxOXfrkO29VPSz5UDjxNj5n6hNF3QnSI8ZIMvx
         LPiBV+UQ4WTAkCIT/6Qzy9PhNFbXgoU18387LZmAfrNkr5IiukCeXLXFomvnet7ilIBD
         6Tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IDv52uhOHnM52YSplOEizgvrMcaCG52xTZqX8PjRtjY=;
        b=abXwapaIMsFocZpucVCUcVJN4SObh7BKMVTFQk76yiBPA3WyzKDsaioTjzCbaQtqNt
         Yn+JwAn9KkQJGL8cTiyFEHT2IMP1x1hgumY9yD5qDCtIfjM99jf57PIB9CE+8MouUM/B
         fQWFw5M97/Gq5huBspiTdF3LvDH7JS9wg722nwzGZAHUg0QM0FU5oBMfzp2/5Wl4Zr12
         6+x3D9o/n2jsdYw0xQulOvBNnhSfSCl8FppEIlFc7qXysQv/NvGEVLTNVPSxDQX3WfrU
         9oz191eYd1/xCiZwgYrFADgdHFm0dJW2wNFOOMmxzquXiE7wEBx07RygxfdHg2x8eaUm
         ZbCA==
X-Gm-Message-State: AOAM531y6f67YuDbYoh1mJ+uDKEI/QEab7D+5j++sjoXFzj9/3dLr+fq
	PQ0FlWLTTpWdYjLO2gzmaBk=
X-Google-Smtp-Source: ABdhPJzz68J2ef2NxKZvaNs5SyHPyYKCGSvy1fUWoS56/s8IKaqxW9MfFpxUlMb01fo8vSumjFMHoQ==
X-Received: by 2002:aa7:864a:0:b0:3ee:a4f6:af02 with SMTP id a10-20020aa7864a000000b003eea4f6af02mr10062820pfo.23.1630084898734;
        Fri, 27 Aug 2021 10:21:38 -0700 (PDT)
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
Subject: [PATCH V4 07/13] hyperv/Vmbus: Add SNP support for VMbus channel initiate  message
Date: Fri, 27 Aug 2021 13:21:05 -0400
Message-Id: <20210827172114.414281-8-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

The monitor pages in the CHANNELMSG_INITIATE_CONTACT msg are shared
with host in Isolation VM and so it's necessary to use hvcall to set
them visible to host. In Isolation VM with AMD SEV SNP, the access
address should be in the extra space which is above shared gpa
boundary. So remap these pages into the extra address(pa +
shared_gpa_boundary).

Introduce monitor_pages_original[] in the struct vmbus_connection
to store monitor page virtual address returned by hv_alloc_hyperv_
zeroed_page() and free monitor page via monitor_pages_original in
the vmbus_disconnect(). The monitor_pages[] is to used to access
monitor page and it is initialized to be equal with monitor_pages_
original. The monitor_pages[] will be overridden in the isolation VM
with va of extra address.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* Rename monitor_pages_va with monitor_pages_original
	* free monitor page via monitor_pages_original and
	  monitor_pages is used to access monitor page.

Change since v1:
        * Not remap monitor pages in the non-SNP isolation VM.
---
 drivers/hv/connection.c   | 75 ++++++++++++++++++++++++++++++++++++---
 drivers/hv/hyperv_vmbus.h |  1 +
 2 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 6d315c1465e0..9a48d8115c87 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -19,6 +19,7 @@
 #include <linux/vmalloc.h>
 #include <linux/hyperv.h>
 #include <linux/export.h>
+#include <linux/io.h>
 #include <asm/mshyperv.h>
 
 #include "hyperv_vmbus.h"
@@ -104,6 +105,12 @@ int vmbus_negotiate_version(struct vmbus_channel_msginfo *msginfo, u32 version)
 
 	msg->monitor_page1 = virt_to_phys(vmbus_connection.monitor_pages[0]);
 	msg->monitor_page2 = virt_to_phys(vmbus_connection.monitor_pages[1]);
+
+	if (hv_isolation_type_snp()) {
+		msg->monitor_page1 += ms_hyperv.shared_gpa_boundary;
+		msg->monitor_page2 += ms_hyperv.shared_gpa_boundary;
+	}
+
 	msg->target_vcpu = hv_cpu_number_to_vp_number(VMBUS_CONNECT_CPU);
 
 	/*
@@ -148,6 +155,35 @@ int vmbus_negotiate_version(struct vmbus_channel_msginfo *msginfo, u32 version)
 		return -ECONNREFUSED;
 	}
 
+
+	if (hv_is_isolation_supported()) {
+		if (hv_isolation_type_snp()) {
+			vmbus_connection.monitor_pages[0]
+				= memremap(msg->monitor_page1, HV_HYP_PAGE_SIZE,
+					   MEMREMAP_WB);
+			if (!vmbus_connection.monitor_pages[0])
+				return -ENOMEM;
+
+			vmbus_connection.monitor_pages[1]
+				= memremap(msg->monitor_page2, HV_HYP_PAGE_SIZE,
+					   MEMREMAP_WB);
+			if (!vmbus_connection.monitor_pages[1]) {
+				memunmap(vmbus_connection.monitor_pages[0]);
+				return -ENOMEM;
+			}
+		}
+
+		/*
+		 * Set memory host visibility hvcall smears memory
+		 * and so zero monitor pages here.
+		 */
+		memset(vmbus_connection.monitor_pages[0], 0x00,
+		       HV_HYP_PAGE_SIZE);
+		memset(vmbus_connection.monitor_pages[1], 0x00,
+		       HV_HYP_PAGE_SIZE);
+
+	}
+
 	return ret;
 }
 
@@ -159,6 +195,7 @@ int vmbus_connect(void)
 	struct vmbus_channel_msginfo *msginfo = NULL;
 	int i, ret = 0;
 	__u32 version;
+	u64 pfn[2];
 
 	/* Initialize the vmbus connection */
 	vmbus_connection.conn_state = CONNECTING;
@@ -216,6 +253,21 @@ int vmbus_connect(void)
 		goto cleanup;
 	}
 
+	vmbus_connection.monitor_pages_original[0]
+		= vmbus_connection.monitor_pages[0];
+	vmbus_connection.monitor_pages_original[1]
+		= vmbus_connection.monitor_pages[1];
+
+	if (hv_is_isolation_supported()) {
+		pfn[0] = virt_to_hvpfn(vmbus_connection.monitor_pages[0]);
+		pfn[1] = virt_to_hvpfn(vmbus_connection.monitor_pages[1]);
+		if (hv_mark_gpa_visibility(2, pfn,
+				VMBUS_PAGE_VISIBLE_READ_WRITE)) {
+			ret = -EFAULT;
+			goto cleanup;
+		}
+	}
+
 	msginfo = kzalloc(sizeof(*msginfo) +
 			  sizeof(struct vmbus_channel_initiate_contact),
 			  GFP_KERNEL);
@@ -284,6 +336,8 @@ int vmbus_connect(void)
 
 void vmbus_disconnect(void)
 {
+	u64 pfn[2];
+
 	/*
 	 * First send the unload request to the host.
 	 */
@@ -303,10 +357,23 @@ void vmbus_disconnect(void)
 		vmbus_connection.int_page = NULL;
 	}
 
-	hv_free_hyperv_page((unsigned long)vmbus_connection.monitor_pages[0]);
-	hv_free_hyperv_page((unsigned long)vmbus_connection.monitor_pages[1]);
-	vmbus_connection.monitor_pages[0] = NULL;
-	vmbus_connection.monitor_pages[1] = NULL;
+	if (hv_is_isolation_supported()) {
+		memunmap(vmbus_connection.monitor_pages[0]);
+		memunmap(vmbus_connection.monitor_pages[1]);
+
+		pfn[0] = virt_to_hvpfn(vmbus_connection.monitor_pages[0]);
+		pfn[1] = virt_to_hvpfn(vmbus_connection.monitor_pages[1]);
+		hv_mark_gpa_visibility(2, pfn, VMBUS_PAGE_NOT_VISIBLE);
+	}
+
+	hv_free_hyperv_page((unsigned long)
+		vmbus_connection.monitor_pages_original[0]);
+	hv_free_hyperv_page((unsigned long)
+		vmbus_connection.monitor_pages_original[1]);
+	vmbus_connection.monitor_pages_original[0] =
+		vmbus_connection.monitor_pages[0] = NULL;
+	vmbus_connection.monitor_pages_original[1] =
+		vmbus_connection.monitor_pages[1] = NULL;
 }
 
 /*
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 42f3d9d123a1..7cb11ef694da 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -240,6 +240,7 @@ struct vmbus_connection {
 	 * is child->parent notification
 	 */
 	struct hv_monitor_page *monitor_pages[2];
+	void *monitor_pages_original[2];
 	struct list_head chn_msg_list;
 	spinlock_t channelmsg_lock;
 
-- 
2.25.1


