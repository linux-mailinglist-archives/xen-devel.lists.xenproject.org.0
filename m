Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087833E4B71
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165116.301802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9W4-0001od-FE; Mon, 09 Aug 2021 17:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165116.301802; Mon, 09 Aug 2021 17:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD9W4-0001mO-B6; Mon, 09 Aug 2021 17:56:48 +0000
Received: by outflank-mailman (input) for mailman id 165116;
 Mon, 09 Aug 2021 17:56:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD4O=NA=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mD9W3-0000Aq-1Z
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:56:47 +0000
Received: from mail-pl1-x633.google.com (unknown [2607:f8b0:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0d68e06-ee91-4a1e-b2bc-ae23731dd6bd;
 Mon, 09 Aug 2021 17:56:35 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id k2so17264619plk.13
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:56:35 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:34 -0700 (PDT)
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
X-Inumbo-ID: f0d68e06-ee91-4a1e-b2bc-ae23731dd6bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Men1AZwUmuVs+mP8DF3xiO7Kxjvnd8nVq1v+nRjKpCQ=;
        b=khPH2C+O3EAicxhd7Ol8cKTH5M6jlmzfQ8AO/O1nDTvaVoKxSYt9ZFCTLGRbikb5lh
         PDJ33DWVYKUJkew4s5UHIfYAMLSYuNH+uf/XtXD0IORwvY1DIt7A3cBWxmGFheDk576S
         V3f7/9klpb/XtUJHfTr/xvgxlJQr/zFFSZScoCFNkrbrD15HrsX7R1uv6/aQEWxckoRN
         9QsVgqkiNeWlCadxH+8e5eldRu1GEL06smeSmjiPy+yGlokaFMzt3CKLV48oxtK81odS
         6JMrI0ItN47jYQqCSSni4G8Qh04K6SLFdJInx7pD26u4zhhajSI26iXbbtm/G5rwvFIk
         Sluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Men1AZwUmuVs+mP8DF3xiO7Kxjvnd8nVq1v+nRjKpCQ=;
        b=P1PUWBnQiU8cEQ4wAVroGl48RRpFq+NV91ePhy49G2W+UmKoCej2fVmW4qZ4tHtX7X
         AiRZyQ2YADIGu3UG1d9gJ4Z8v7HTP+owZxMynGz3Md65oGuVHGhYce9ae9nnucN5o0+g
         DFrOp25ebDazpnuxyR6zZIE8D8hQ6wTQaTm416bC2HjsO7QlrId1LZn8fpiIaK1ZwERE
         9mEN7XGDa45gXk9HqZ/C1vWy7ftPObuH4tFYrKLK9lGLGobrvjonUuuYTRuazmBjVc7S
         EYu5FjSezzhvA+NieHSSEMGdD3dnbZSTBtqSFaqil1AyooLgdoUrAVhEPhNuuSEAQrEu
         NMZQ==
X-Gm-Message-State: AOAM530db8+LriKqALkKStTUDF33TG9/BjkynPW23Vty2Q9jwWD8Oh5t
	OLhNQUDwHlM36B77zwZb+lc=
X-Google-Smtp-Source: ABdhPJzwKjD0clYdhmrGRt/ZwcFYRptbvrLB1rs9cJlW5QDBm6ePK+6Ij95/tTvvfr9i4l9z3WVYCQ==
X-Received: by 2002:a17:90b:21c9:: with SMTP id ll9mr314744pjb.161.1628531794508;
        Mon, 09 Aug 2021 10:56:34 -0700 (PDT)
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
Subject: [PATCH V3 04/13] HV: Mark vmbus ring buffer visible to host in Isolation VM
Date: Mon,  9 Aug 2021 13:56:08 -0400
Message-Id: <20210809175620.720923-5-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809175620.720923-1-ltykernel@gmail.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
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
index ddc8713ce57b..90b542597143 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -803,6 +803,14 @@ struct vmbus_device {
 
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
 
@@ -823,6 +831,9 @@ struct vmbus_channel {
 	struct completion rescind_event;
 
 	u32 ringbuffer_gpadlhandle;
+	/* GPADL_RING and Send/Receive GPADL_BUFFER. */
+	struct vmbus_gpadl gpadl_array[VMBUS_GPADL_RANGE_COUNT];
+	atomic_t gpadl_index;
 
 	/* Allocated memory for ring buffer */
 	struct page *ringbuffer_page;
-- 
2.25.1


