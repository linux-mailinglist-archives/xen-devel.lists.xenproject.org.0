Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C973BEAD6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152392.281572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19a6-0001y0-Av; Wed, 07 Jul 2021 15:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152392.281572; Wed, 07 Jul 2021 15:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19a6-0001uh-78; Wed, 07 Jul 2021 15:35:22 +0000
Received: by outflank-mailman (input) for mailman id 152392;
 Wed, 07 Jul 2021 15:35:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxnL=L7=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m19a4-0000vf-Je
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:35:20 +0000
Received: from mail-pj1-x1033.google.com (unknown [2607:f8b0:4864:20::1033])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46fcb11a-10f8-4de5-8611-a39a46e83eb4;
 Wed, 07 Jul 2021 15:35:12 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id n11so1776508pjo.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jul 2021 08:35:12 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:6b7f:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id y11sm21096877pfo.160.2021.07.07.08.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:35:11 -0700 (PDT)
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
X-Inumbo-ID: 46fcb11a-10f8-4de5-8611-a39a46e83eb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+XJfA3AqCHkXuREWq5JYX1SJ1GS8dmwfVs7cs/uDyzo=;
        b=bui63f9RbeyQ+PjA944VL6eRYVLBMCTgOcLfL7xQd4MV+TGtlZkSCA8rNshpLHozV7
         EDzApfYSVdzgDBhHovaSMLT5NdnaVwtG4C1pbdo7Q08juYDuuI3z2tDDwrE3ko8nbycA
         bmcYDWSgYMR600u1g5+fy2uvqUffuDtVadjxcABOrsUHXRidIjPqqFGjuzQY8ChUFFp7
         IAXd5yOEalFiSg3IZmkvTq6kg0rbxMFNSKHHbwwuHqkbyN1eHbPo1jJaSMwX8vsUtnyr
         T2tqSkyBsX9X2+b02CuW2rweA2SgzcxtUt/E0fnHHNmW0W+cmQBpS8190Rui6bzRjt+3
         C71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+XJfA3AqCHkXuREWq5JYX1SJ1GS8dmwfVs7cs/uDyzo=;
        b=BLIm7qQNddkP73gkkTRr72kKgrzkJ/X6VpKIcaIU44aUloJSiiL18cXu1eyos9xaY4
         kLdgVe2OnK1Ph07ZsXlvOaqKSauVIbdIeAWkg66ml6CeViptcMua8MkauWsNt7ledGe7
         HdYFn+TDHjuyFxfMcgMCvuboaw8w0n9L5glgfe+z2eggD8sC7jy7zXvKYX4/+iLQg3qJ
         f5aTJttijFUtADY9hRDe0VmgYFgrLS874zO0D+9PXUXvmnf+W2XBHxHn8ptLIn+4pkSF
         cETGFfpUftXVpdn7vPxd8AlrDjeWRSh4A4IGrqn5J9Qnk+oKCL+FGEb9+imEF+3Okr2H
         4vpA==
X-Gm-Message-State: AOAM53111Q0RC1+ym6Pttja6cTHOQ4yUM4mEt0jT9u0fWPGQGj4iWI6M
	e1ELA7Y9SapnuC6uvsD27eo=
X-Google-Smtp-Source: ABdhPJzfU3YRfZk3nkyd7QDC0TVwR1zYpPvF6PjFltyPDJmrt5nAGFOniT/ucBwrM64vLDEXGYARhg==
X-Received: by 2002:a17:902:c78a:b029:129:7777:18c6 with SMTP id w10-20020a170902c78ab0290129777718c6mr17383657pla.36.1625672111967;
        Wed, 07 Jul 2021 08:35:11 -0700 (PDT)
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
	rppt@kernel.org,
	akpm@linux-foundation.org,
	kirill.shutemov@linux.intel.com,
	Tianyu.Lan@microsoft.com,
	thomas.lendacky@amd.com,
	ardb@kernel.org,
	nramas@linux.microsoft.com,
	robh@kernel.org,
	keescook@chromium.org,
	rientjes@google.com,
	pgonda@google.com,
	martin.b.radev@gmail.com,
	hannes@cmpxchg.org,
	saravanand@fb.com,
	krish.sadhukhan@oracle.com,
	xen-devel@lists.xenproject.org,
	tj@kernel.org,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	brijesh.singh@amd.com,
	anparri@microsoft.com
Subject: [RFC PATCH V4 03/12] HV: Mark vmbus ring buffer visible to host in Isolation VM
Date: Wed,  7 Jul 2021 11:34:44 -0400
Message-Id: <20210707153456.3976348-4-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707153456.3976348-1-ltykernel@gmail.com>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Mark vmbus ring buffer visible with set_memory_decrypted() when
establish gpadl handle.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/hv/channel.c   | 38 ++++++++++++++++++++++++++++++++++++--
 include/linux/hyperv.h | 10 ++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index f3761c73b074..01048bb07082 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -17,6 +17,7 @@
 #include <linux/hyperv.h>
 #include <linux/uio.h>
 #include <linux/interrupt.h>
+#include <linux/set_memory.h>
 #include <asm/page.h>
 #include <asm/mshyperv.h>
 
@@ -465,7 +466,7 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	struct list_head *curr;
 	u32 next_gpadl_handle;
 	unsigned long flags;
-	int ret = 0;
+	int ret = 0, index;
 
 	next_gpadl_handle =
 		(atomic_inc_return(&vmbus_connection.next_gpadl_handle) - 1);
@@ -474,6 +475,13 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
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
 
@@ -539,6 +547,15 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	/* At this point, we received the gpadl created msg */
 	*gpadl_handle = gpadlmsg->gpadl;
 
+	if (type == HV_GPADL_BUFFER)
+		index = 0;
+	else
+		index = channel->gpadl_range[1].gpadlhandle ? 2 : 1;
+
+	channel->gpadl_range[index].size = size;
+	channel->gpadl_range[index].buffer = kbuffer;
+	channel->gpadl_range[index].gpadlhandle = *gpadl_handle;
+
 cleanup:
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
 	list_del(&msginfo->msglistentry);
@@ -549,6 +566,11 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	}
 
 	kfree(msginfo);
+
+	if (ret)
+		set_memory_encrypted((unsigned long)kbuffer,
+				     HVPFN_UP(size));
+
 	return ret;
 }
 
@@ -811,7 +833,7 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 	struct vmbus_channel_gpadl_teardown *msg;
 	struct vmbus_channel_msginfo *info;
 	unsigned long flags;
-	int ret;
+	int ret, i;
 
 	info = kzalloc(sizeof(*info) +
 		       sizeof(struct vmbus_channel_gpadl_teardown), GFP_KERNEL);
@@ -859,6 +881,18 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 	spin_unlock_irqrestore(&vmbus_connection.channelmsg_lock, flags);
 
 	kfree(info);
+
+	/* Find gpadl buffer virtual address and size. */
+	for (i = 0; i < VMBUS_GPADL_RANGE_COUNT; i++)
+		if (channel->gpadl_range[i].gpadlhandle == gpadl_handle)
+			break;
+
+	if (set_memory_encrypted((unsigned long)channel->gpadl_range[i].buffer,
+			HVPFN_UP(channel->gpadl_range[i].size)))
+		pr_warn("Fail to set mem host visibility.\n");
+
+	channel->gpadl_range[i].gpadlhandle = 0;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vmbus_teardown_gpadl);
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 2e859d2f9609..06eccaba10c5 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -809,6 +809,14 @@ struct vmbus_device {
 
 #define VMBUS_DEFAULT_MAX_PKT_SIZE 4096
 
+struct vmbus_gpadl_range {
+	u32 gpadlhandle;
+	u32 size;
+	void *buffer;
+};
+
+#define VMBUS_GPADL_RANGE_COUNT		3
+
 struct vmbus_channel {
 	struct list_head listentry;
 
@@ -829,6 +837,8 @@ struct vmbus_channel {
 	struct completion rescind_event;
 
 	u32 ringbuffer_gpadlhandle;
+	/* GPADL_RING and Send/Receive GPADL_BUFFER. */
+	struct vmbus_gpadl_range gpadl_range[VMBUS_GPADL_RANGE_COUNT];
 
 	/* Allocated memory for ring buffer */
 	struct page *ringbuffer_page;
-- 
2.25.1


