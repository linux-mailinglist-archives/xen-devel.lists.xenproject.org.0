Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1403D911D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 16:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161588.296625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kw2-0003vm-N8; Wed, 28 Jul 2021 14:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161588.296625; Wed, 28 Jul 2021 14:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8kw2-0003sq-IT; Wed, 28 Jul 2021 14:53:26 +0000
Received: by outflank-mailman (input) for mailman id 161588;
 Wed, 28 Jul 2021 14:53:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=si+Y=MU=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m8kw1-0002W0-P8
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 14:53:25 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1221c58a-84a1-44a0-913d-d0033ac9bb2a;
 Wed, 28 Jul 2021 14:53:17 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id q2so2966678plr.11
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 07:53:17 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:16 -0700 (PDT)
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
X-Inumbo-ID: 1221c58a-84a1-44a0-913d-d0033ac9bb2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+XJfA3AqCHkXuREWq5JYX1SJ1GS8dmwfVs7cs/uDyzo=;
        b=JTfxH2MI6lr3vhghm+bYn1lDtWC6S40YgGpd2n5ZBE0WXJ57nPRp/vMeCnq6SmO90h
         UPiRb39uM4iMAgW0slMgb6ATsLC4Z0lW9pf+AZc7pl5WJGMDawbbzgXKBt1Z+GuOXtly
         9TYhzeKXWg55tjzDSrNqnVlbyUVgZ1VhgspLUJ3MDp7VmLIaFpFkVzlACYJoXgx4h9W9
         y5VivpznJ4FNs2S4rqNSmRUG+RlcTHOQjC6dLg1qrzPm0TcGvPf/VqvCVComHCJhCA2P
         7AXzP0K57z4DE458hjOtv6x4NMiUz3iK84iyApsE6NxjF0AupgOoBJTCCu7r53H4pSie
         WfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+XJfA3AqCHkXuREWq5JYX1SJ1GS8dmwfVs7cs/uDyzo=;
        b=GQiN3wbkiDDRL4G7/YmIIdyY4veaczrDS8I4DTDbCWdgsvJDeh3pr7um+KNUL8mm4G
         zju7WnWuLMDSDzGgtWzp1tFoUoVOAPe8+HoCXyOeqt/97C7xStJ+Wx7GQSnYZ1bjeyaB
         iiyY1jicYH8bizBlXLYukKYRRGVkGvCGTw/5e5TQBIw1Wd6hyAm5YSniZCORxMoi22Ql
         +a2PuIqlK4mlAD6TkuTxUfr+Mxj5SNgo6bsPIxFaSgHD1iRwAgbQJoRDMvxsUSIoK9N8
         To6h3C9xClwOVfueRgQmxCiXV8Gpd/znJkWfvIlZwPsnuVoFqTi+XyckV8w1AwJ+/3GJ
         N2TA==
X-Gm-Message-State: AOAM532PgkrEoK81roj8QYnhE5fjHAiXhOtQJSpQs+HSxdeqL0vXFmzg
	ySYtMS8kidbv2qmfwGrEfc8=
X-Google-Smtp-Source: ABdhPJz4j/vsLQnZny1GE3WB7JJRgcpBrn921B99u5//TBJ+oOZxL5FLeGsOUc3yuQEVykF8bbeFJQ==
X-Received: by 2002:a65:654c:: with SMTP id a12mr224730pgw.118.1627483996980;
        Wed, 28 Jul 2021 07:53:16 -0700 (PDT)
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
	rientjes@google.com,
	martin.b.radev@gmail.com,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	kirill.shutemov@linux.intel.com,
	aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com,
	saravanand@fb.com,
	xen-devel@lists.xenproject.org,
	pgonda@google.com,
	david@redhat.com,
	keescook@chromium.org,
	hannes@cmpxchg.org,
	sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org,
	vkuznets@redhat.com,
	anparri@microsoft.com
Subject: [PATCH 04/13] HV: Mark vmbus ring buffer visible to host in Isolation VM
Date: Wed, 28 Jul 2021 10:52:19 -0400
Message-Id: <20210728145232.285861-5-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728145232.285861-1-ltykernel@gmail.com>
References: <20210728145232.285861-1-ltykernel@gmail.com>
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


