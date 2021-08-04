Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114ED3E07F9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 20:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163854.300043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLto-0007eh-SU; Wed, 04 Aug 2021 18:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163854.300043; Wed, 04 Aug 2021 18:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBLto-0007bH-MQ; Wed, 04 Aug 2021 18:45:52 +0000
Received: by outflank-mailman (input) for mailman id 163854;
 Wed, 04 Aug 2021 18:45:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q0vd=M3=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mBLto-0005Nn-0B
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 18:45:52 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 196a4178-844b-43cf-b86a-403d1aceafb3;
 Wed, 04 Aug 2021 18:45:37 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id j3so4015050plx.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 11:45:36 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:f:1947:6842:b8a8:6f83])
 by smtp.gmail.com with ESMTPSA id f5sm3325647pjo.23.2021.08.04.11.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:45:35 -0700 (PDT)
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
X-Inumbo-ID: 196a4178-844b-43cf-b86a-403d1aceafb3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0DnJGo47D2hE/jBx4k8fbhfnBttvu9PCKXs1r5xuKJw=;
        b=rUPpwgafMNFTcWN5/eVGxXnm6HeF61KJak+0VmFU7CZ3aLlvaE95yX1QX3j/BByO5F
         9uqBgzEkCW6SKDRbCI9ORKKdtGMVADlEkM5s3DCY9P1bHNGatcr8ZqL0Bpz+iV54jrcC
         SZcLp9xs6KwFzgh0pFtRILyy2Woq1aKOFLNW/l2dc0+5sASAfN6nw7VaAZKMlHz8emB4
         RL93fYVxPU1d/6ACqXozjuLffb+Z4piSdk5qD9tg9nb4xpPUdB2IkDqTdwpjipTCai0+
         XFaDr4inRbPSowodouz4lZ8JxUE9L/4w+HC7E4aamgEFTsz2n0GHeyVgqS0d1jmbM0+3
         PFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0DnJGo47D2hE/jBx4k8fbhfnBttvu9PCKXs1r5xuKJw=;
        b=D3hoKMPYwh6kh5HMoysYj1WsAp9Trbxg8Av5zaPZ3CP1T+E8KrvIQQcY5Yc4AtpkFv
         cPBhNODFlwjc33lZcXqc2pZ8jZLoMah/P5aLkQis2In02MaeASXiCUufIwqVXdHWRYdP
         o78hcXPop1VhA1pDqBFx+Wjh6n3X7f3/1PesYu16KAH9BeKpI9gpmZi1NAzmIMMiPfzb
         B35KaK8pDCx6QaBdunUMtDm3psua+RWTs/BxJN+TaPXVTUEYz571JocoIEsgOd2rvT45
         SGtfRNWLnvZuUx4wnO91At0a8HIN+cTftL3aTooEHvI25iM9V5OdQH4c1nk9uynzohex
         rxVQ==
X-Gm-Message-State: AOAM533otr01EF6zwbrlecG8xtrR/EvunZ3YisVIfEmbb5Jo2QDoGI2m
	xJDwJxlZJ75u0VSCqOD5QeM=
X-Google-Smtp-Source: ABdhPJyOBfClz27iEk1eFb7cKeWfXY17+1zaEdr/CnnawMkrDU4BNEumrPxpS1xckj63XffwR0hQMw==
X-Received: by 2002:a17:90b:1e4b:: with SMTP id pi11mr512358pjb.41.1628102736304;
        Wed, 04 Aug 2021 11:45:36 -0700 (PDT)
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
Subject: [PATCH V2 05/14] HV: Mark vmbus ring buffer visible to host in Isolation VM
Date: Wed,  4 Aug 2021 14:45:01 -0400
Message-Id: <20210804184513.512888-6-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804184513.512888-1-ltykernel@gmail.com>
References: <20210804184513.512888-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Mark vmbus ring buffer visible with set_memory_decrypted() when
establish gpadl handle.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/hv/channel.c   | 44 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/hyperv.h | 11 +++++++++++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index f3761c73b074..4c4717c26240 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -17,6 +17,7 @@
 #include <linux/hyperv.h>
 #include <linux/uio.h>
 #include <linux/interrupt.h>
+#include <linux/set_memory.h>
 #include <asm/page.h>
 #include <asm/mshyperv.h>
 
@@ -465,7 +466,14 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	struct list_head *curr;
 	u32 next_gpadl_handle;
 	unsigned long flags;
-	int ret = 0;
+	int ret = 0, index;
+
+	index = atomic_inc_return(&channel->gpadl_index) - 1;
+
+	if (index > VMBUS_GPADL_RANGE_COUNT - 1) {
+		pr_err("Gpadl handle position(%d) has been occupied.\n", index);
+		return -ENOSPC;
+	}
 
 	next_gpadl_handle =
 		(atomic_inc_return(&vmbus_connection.next_gpadl_handle) - 1);
@@ -474,6 +482,13 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	if (ret)
 		return ret;
 
+	ret = set_memory_decrypted((unsigned long)kbuffer,
+				   HVPFN_UP(size));
+	if (ret) {
+		pr_warn("Failed to set host visibility.\n");
+		return ret;
+	}
+
 	init_completion(&msginfo->waitevent);
 	msginfo->waiting_channel = channel;
 
@@ -539,6 +554,10 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	/* At this point, we received the gpadl created msg */
 	*gpadl_handle = gpadlmsg->gpadl;
 
+	channel->gpadl_array[index].size = size;
+	channel->gpadl_array[index].buffer = kbuffer;
+	channel->gpadl_array[index].gpadlhandle = *gpadl_handle;
+
 cleanup:
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
 	list_del(&msginfo->msglistentry);
@@ -549,6 +568,13 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	}
 
 	kfree(msginfo);
+
+	if (ret) {
+		set_memory_encrypted((unsigned long)kbuffer,
+				     HVPFN_UP(size));
+		atomic_dec(&channel->gpadl_index);
+	}
+
 	return ret;
 }
 
@@ -676,6 +702,7 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 
 	/* Establish the gpadl for the ring buffer */
 	newchannel->ringbuffer_gpadlhandle = 0;
+	atomic_set(&newchannel->gpadl_index, 0);
 
 	err = __vmbus_establish_gpadl(newchannel, HV_GPADL_RING,
 				      page_address(newchannel->ringbuffer_page),
@@ -811,7 +838,7 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 	struct vmbus_channel_gpadl_teardown *msg;
 	struct vmbus_channel_msginfo *info;
 	unsigned long flags;
-	int ret;
+	int ret, i;
 
 	info = kzalloc(sizeof(*info) +
 		       sizeof(struct vmbus_channel_gpadl_teardown), GFP_KERNEL);
@@ -859,6 +886,19 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 	spin_unlock_irqrestore(&vmbus_connection.channelmsg_lock, flags);
 
 	kfree(info);
+
+	/* Find gpadl buffer virtual address and size. */
+	for (i = 0; i < VMBUS_GPADL_RANGE_COUNT; i++)
+		if (channel->gpadl_array[i].gpadlhandle == gpadl_handle)
+			break;
+
+	if (set_memory_encrypted((unsigned long)channel->gpadl_array[i].buffer,
+			HVPFN_UP(channel->gpadl_array[i].size)))
+		pr_warn("Fail to set mem host visibility.\n");
+
+	channel->gpadl_array[i].gpadlhandle = 0;
+	atomic_dec(&channel->gpadl_index);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vmbus_teardown_gpadl);
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 2e859d2f9609..cbe376b82de3 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -809,6 +809,14 @@ struct vmbus_device {
 
 #define VMBUS_DEFAULT_MAX_PKT_SIZE 4096
 
+struct vmbus_gpadl {
+	u32 gpadlhandle;
+	u32 size;
+	void *buffer;
+};
+
+#define VMBUS_GPADL_RANGE_COUNT		3
+
 struct vmbus_channel {
 	struct list_head listentry;
 
@@ -829,6 +837,9 @@ struct vmbus_channel {
 	struct completion rescind_event;
 
 	u32 ringbuffer_gpadlhandle;
+	/* GPADL_RING and Send/Receive GPADL_BUFFER. */
+	struct vmbus_gpadl gpadl_array[VMBUS_GPADL_RANGE_COUNT];
+	atomic_t gpadl_index;
 
 	/* Allocated memory for ring buffer */
 	struct page *ringbuffer_page;
-- 
2.25.1


