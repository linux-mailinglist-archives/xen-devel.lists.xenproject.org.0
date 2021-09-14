Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278940AF7C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 15:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186687.335455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8m5-0007D2-Og; Tue, 14 Sep 2021 13:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186687.335455; Tue, 14 Sep 2021 13:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ8m5-0007Ae-LY; Tue, 14 Sep 2021 13:47:01 +0000
Received: by outflank-mailman (input) for mailman id 186687;
 Tue, 14 Sep 2021 13:46:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lzK=OE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mQ8fl-0001wz-So
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 13:40:29 +0000
Received: from mail-pg1-x532.google.com (unknown [2607:f8b0:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41ee5e18-fc5d-4791-9e59-19ee5069d3d7;
 Tue, 14 Sep 2021 13:39:42 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id r2so12725885pgl.10
 for <xen-devel@lists.xenproject.org>; Tue, 14 Sep 2021 06:39:42 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:6ea2:a529:4af3:5057])
 by smtp.gmail.com with ESMTPSA id v13sm10461234pfm.16.2021.09.14.06.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:39:41 -0700 (PDT)
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
X-Inumbo-ID: 41ee5e18-fc5d-4791-9e59-19ee5069d3d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04R/nF7ZQn0L4lmwG9K7NZhI1RIoqJtAembHuZpzcoE=;
        b=cXWjfh70bA6/tTG3cRi7I0j1g+p2Lm3CJSGXyCEtns1z4ew1JMJSouaTXxuUkcmAAF
         pD2ztmNCM/EaSPUeDDaq6UxsWFBxK9H35yFnlW25xXgoMBjP2i0pScCK83QZEclf8ecy
         N9PLUvbIXVRHq4/y1x9TK184cTltER/wXcMXRfCw3qyn5rb59Xp4R9JHz9uej2V7BUzJ
         4nbgXuO4P+lxZbUEZEs/1u05P/Zm7T9ezY8W5GtsXzTaY96NJ/PhksjnQl9x9HnadNWx
         cTQCObr34jF7frx/WSelSqFMtM9MhrWIvfcA85EYhYphGuBONqJDe9RZDWb/6vKzX5CK
         TR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04R/nF7ZQn0L4lmwG9K7NZhI1RIoqJtAembHuZpzcoE=;
        b=xbK8sNR9lALL8t5RW+5eQocFepqs38aoTNCOArRHMJ0iAZ6P6kGf7R2dWMjz24/xyA
         ufV0fLfKhh++ooFMDNc0/RyzwTeu7BirQrIWPYeO6JGIwKNtEafubd1o0vM9xSeRUjCK
         FRszI4p9bdu4yyDJoMQylsWRhYo/mlSJxDWM+yGehO3QBvASTgEPB2tPoRLWpEIPky3F
         ZOldbAUqX7AduFcxJ+Wl8XlHHzDpIX9NFEyIjQ9Hh9wnW+mw0G93TDtRzxRcHMIT3orF
         cSFW7Rcpwa0MllldUiTf+hPA6AStY+TLzyevOZhJWNkBWyyprRF3Nu+VRyjJiKyAYl4d
         33wQ==
X-Gm-Message-State: AOAM532eQmKRMwQiAyCqkWL3VlA5a6Q14o3mhW4G8aLk3Eb5aQkBC6Ub
	KWmXkOinW+LjJwuZDhg6vv0=
X-Google-Smtp-Source: ABdhPJyVP18hjlg38ErK5oPFLiCLyC2tXuvAHanGQz+Hb5O3TLtyTYhzBvzQ3suhx9t9fxq63nkGDQ==
X-Received: by 2002:a63:7112:: with SMTP id m18mr15630957pgc.93.1631626782143;
        Tue, 14 Sep 2021 06:39:42 -0700 (PDT)
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
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	brijesh.singh@amd.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	pgonda@google.com,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	rppt@kernel.org,
	sfr@canb.auug.org.au,
	aneesh.kumar@linux.ibm.com,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	rientjes@google.com,
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
Subject: [PATCH V5 07/12] Drivers: hv: vmbus: Add SNP support for VMbus channel initiate  message
Date: Tue, 14 Sep 2021 09:39:08 -0400
Message-Id: <20210914133916.1440931-8-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914133916.1440931-1-ltykernel@gmail.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
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
with va of extra address. Introduce monitor_pages_pa[] to store
monitor pages' physical address and use it to populate pa in the
initiate msg.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v4:
	* Introduce monitor_pages_pa[] to store monitor pages' physical
	  address and use it to populate pa in the initiate msg.
	* Move code of mapping moniter pages in extra address into
	  vmbus_connect().

Change since v3:
	* Rename monitor_pages_va with monitor_pages_original
	* free monitor page via monitor_pages_original and
	  monitor_pages is used to access monitor page.

Change since v1:
        * Not remap monitor pages in the non-SNP isolation VM.
---
 drivers/hv/connection.c   | 90 ++++++++++++++++++++++++++++++++++++---
 drivers/hv/hyperv_vmbus.h |  2 +
 2 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/drivers/hv/connection.c b/drivers/hv/connection.c
index 8820ae68f20f..edd8f7dd169f 100644
--- a/drivers/hv/connection.c
+++ b/drivers/hv/connection.c
@@ -19,6 +19,8 @@
 #include <linux/vmalloc.h>
 #include <linux/hyperv.h>
 #include <linux/export.h>
+#include <linux/io.h>
+#include <linux/set_memory.h>
 #include <asm/mshyperv.h>
 
 #include "hyperv_vmbus.h"
@@ -102,8 +104,9 @@ int vmbus_negotiate_version(struct vmbus_channel_msginfo *msginfo, u32 version)
 		vmbus_connection.msg_conn_id = VMBUS_MESSAGE_CONNECTION_ID;
 	}
 
-	msg->monitor_page1 = virt_to_phys(vmbus_connection.monitor_pages[0]);
-	msg->monitor_page2 = virt_to_phys(vmbus_connection.monitor_pages[1]);
+	msg->monitor_page1 = vmbus_connection.monitor_pages_pa[0];
+	msg->monitor_page2 = vmbus_connection.monitor_pages_pa[1];
+
 	msg->target_vcpu = hv_cpu_number_to_vp_number(VMBUS_CONNECT_CPU);
 
 	/*
@@ -216,6 +219,65 @@ int vmbus_connect(void)
 		goto cleanup;
 	}
 
+	vmbus_connection.monitor_pages_original[0]
+		= vmbus_connection.monitor_pages[0];
+	vmbus_connection.monitor_pages_original[1]
+		= vmbus_connection.monitor_pages[1];
+	vmbus_connection.monitor_pages_pa[0]
+		= virt_to_phys(vmbus_connection.monitor_pages[0]);
+	vmbus_connection.monitor_pages_pa[1]
+		= virt_to_phys(vmbus_connection.monitor_pages[1]);
+
+	if (hv_is_isolation_supported()) {
+		vmbus_connection.monitor_pages_pa[0] +=
+			ms_hyperv.shared_gpa_boundary;
+		vmbus_connection.monitor_pages_pa[1] +=
+			ms_hyperv.shared_gpa_boundary;
+
+		ret = set_memory_decrypted((unsigned long)
+					   vmbus_connection.monitor_pages[0],
+					   1);
+		ret |= set_memory_decrypted((unsigned long)
+					    vmbus_connection.monitor_pages[1],
+					    1);
+		if (ret)
+			goto cleanup;
+
+		/*
+		 * Isolation VM with AMD SNP needs to access monitor page via
+		 * address space above shared gpa boundary.
+		 */
+		if (hv_isolation_type_snp()) {
+			vmbus_connection.monitor_pages[0]
+				= memremap(vmbus_connection.monitor_pages_pa[0],
+					   HV_HYP_PAGE_SIZE,
+					   MEMREMAP_WB);
+			if (!vmbus_connection.monitor_pages[0]) {
+				ret = -ENOMEM;
+				goto cleanup;
+			}
+
+			vmbus_connection.monitor_pages[1]
+				= memremap(vmbus_connection.monitor_pages_pa[1],
+					   HV_HYP_PAGE_SIZE,
+					   MEMREMAP_WB);
+			if (!vmbus_connection.monitor_pages[1]) {
+				ret = -ENOMEM;
+				goto cleanup;
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
 	msginfo = kzalloc(sizeof(*msginfo) +
 			  sizeof(struct vmbus_channel_initiate_contact),
 			  GFP_KERNEL);
@@ -303,10 +365,26 @@ void vmbus_disconnect(void)
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
+		set_memory_encrypted((unsigned long)
+			vmbus_connection.monitor_pages_original[0],
+			1);
+		set_memory_encrypted((unsigned long)
+			vmbus_connection.monitor_pages_original[1],
+			1);
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
index 42f3d9d123a1..560cba916d1d 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -240,6 +240,8 @@ struct vmbus_connection {
 	 * is child->parent notification
 	 */
 	struct hv_monitor_page *monitor_pages[2];
+	void *monitor_pages_original[2];
+	unsigned long monitor_pages_pa[2];
 	struct list_head chn_msg_list;
 	spinlock_t channelmsg_lock;
 
-- 
2.25.1


