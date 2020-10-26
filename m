Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE60299394
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12480.32525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX68v-0003HT-Up; Mon, 26 Oct 2020 17:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12480.32525; Mon, 26 Oct 2020 17:18:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX68v-0003Gr-RJ; Mon, 26 Oct 2020 17:18:49 +0000
Received: by outflank-mailman (input) for mailman id 12480;
 Mon, 26 Oct 2020 17:18:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kX68u-00032c-MT
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:48 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bc3f38fb-0759-475f-96b7-c29d22c77b32;
 Mon, 26 Oct 2020 17:18:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA6213A1;
 Mon, 26 Oct 2020 10:18:40 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0DA3F719;
 Mon, 26 Oct 2020 10:18:39 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kX68u-00032c-MT
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:48 +0000
X-Inumbo-ID: bc3f38fb-0759-475f-96b7-c29d22c77b32
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id bc3f38fb-0759-475f-96b7-c29d22c77b32;
	Mon, 26 Oct 2020 17:18:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA6213A1;
	Mon, 26 Oct 2020 10:18:40 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0DA3F719;
	Mon, 26 Oct 2020 10:18:39 -0700 (PDT)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v1 4/4] xen/pci: solve compilation error when memory paging is not enabled.
Date: Mon, 26 Oct 2020 17:17:54 +0000
Message-Id: <dc85bb73ca4b6ab8b4a2370f2db7700445fbc5f8.1603731279.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603731279.git.rahul.singh@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
In-Reply-To: <cover.1603731279.git.rahul.singh@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>

d->vm_event_paging struct is defined under CONFIG_HAS_MEM_PAGING in
sched.h but referenced in passthrough/pci.c directly.

If CONFIG_HAS_MEM_PAGING is not enabled for architecture, compiler will
throws an error.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index c6fbb7172c..3125c23e87 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1419,13 +1419,15 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    /* Prevent device assign if mem paging or mem sharing have been 
+#if defined(CONFIG_HAS_MEM_PAGING) || defined(CONFIG_MEM_SHARING)
+    /* Prevent device assign if mem paging or mem sharing have been
      * enabled for this domain */
     if ( d != dom_io &&
          unlikely(mem_sharing_enabled(d) ||
                   vm_event_check_ring(d->vm_event_paging) ||
                   p2m_get_hostp2m(d)->global_logdirty) )
         return -EXDEV;
+#endif
 
     /* device_assigned() should already have cleared the device for assignment */
     ASSERT(pcidevs_locked());
-- 
2.17.1


