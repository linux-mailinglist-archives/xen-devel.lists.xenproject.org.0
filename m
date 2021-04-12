Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B635C850
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109179.208372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxEH-0004qn-Bh; Mon, 12 Apr 2021 14:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109179.208372; Mon, 12 Apr 2021 14:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxEH-0004qO-8I; Mon, 12 Apr 2021 14:07:53 +0000
Received: by outflank-mailman (input) for mailman id 109179;
 Mon, 12 Apr 2021 14:07:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxEG-0004qG-3W
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:07:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4545c696-18c8-4dca-85ae-b40de634959f;
 Mon, 12 Apr 2021 14:07:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC32CAF95;
 Mon, 12 Apr 2021 14:07:50 +0000 (UTC)
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
X-Inumbo-ID: 4545c696-18c8-4dca-85ae-b40de634959f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wdroPuGfKuZZGJHeiqndko2WBYxJIqNkRfSw3fJY0U=;
	b=uGiwk5AfKObcwe/w+SEj7r8Dy134Nk/Mg6Pe6QjbzK6xyF8Nm2ECE9yJcwJKiCkAWkWdel
	dLZKkpfqnFIQz+PVk0ZCylxM93jXm559EyYni4xj1AKHuj7VNbDXbZhpdBk3fESMVDHfl8
	JzmARMwxoEkzyvro6EDt9idcrp71qe0=
Subject: [PATCH v2 04/12] AMD/IOMMU: guest IOMMU support is for HVM only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <187fa031-c237-2298-6b39-2c4a63b06c0f@suse.com>
Date: Mon, 12 Apr 2021 16:07:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Generally all of this is dead code anyway, but there's a caller of
guest_iommu_add_ppr_log(), and the code itself calls
p2m_change_type_one(), which is about to become HVM-only. Hence this
code, short of deleting it altogether, needs to become properly HVM-
only as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/amd/Makefile
+++ b/xen/drivers/passthrough/amd/Makefile
@@ -5,4 +5,4 @@ obj-y += pci_amd_iommu.o
 obj-bin-y += iommu_acpi.init.o
 obj-y += iommu_intr.o
 obj-y += iommu_cmd.o
-obj-y += iommu_guest.o
+obj-$(CONFIG_HVM) += iommu_guest.o
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -307,12 +307,16 @@ int __must_check amd_iommu_suspend(void)
 void amd_iommu_crash_shutdown(void);
 
 /* guest iommu support */
+#ifdef CONFIG_HVM
 void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[]);
 void guest_iommu_add_ppr_log(struct domain *d, u32 entry[]);
 void guest_iommu_add_event_log(struct domain *d, u32 entry[]);
 int guest_iommu_init(struct domain* d);
 void guest_iommu_destroy(struct domain *d);
 int guest_iommu_set_base(struct domain *d, uint64_t base);
+#else
+static inline void guest_iommu_add_ppr_log(struct domain *d, uint32_t entry[]) {}
+#endif
 
 static inline u32 get_field_from_reg_u32(u32 reg_value, u32 mask, u32 shift)
 {


