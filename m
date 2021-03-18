Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5FB3402FD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 11:15:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98882.187872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMph1-0007nh-OA; Thu, 18 Mar 2021 10:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98882.187872; Thu, 18 Mar 2021 10:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMph1-0007nN-KZ; Thu, 18 Mar 2021 10:15:51 +0000
Received: by outflank-mailman (input) for mailman id 98882;
 Thu, 18 Mar 2021 10:15:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMph0-0007nE-F3
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 10:15:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92e2fb4a-7283-4df8-9bd1-08757255efec;
 Thu, 18 Mar 2021 10:15:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CAEBFACBF;
 Thu, 18 Mar 2021 10:15:48 +0000 (UTC)
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
X-Inumbo-ID: 92e2fb4a-7283-4df8-9bd1-08757255efec
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616062548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jAuOft1lat9ybZ5l7PuD+O//EBqhMIy794TtaMQe6M=;
	b=EBhdd20VtJHzJGZyjJcXbjnn4HdIBMkVaTz9b20KNztVaLjeU2LmItT/PULBBTkNKasknX
	tYe8NrC8CU3rtAzfN9WrQJZ8FuA/Lk6ITht8jVYpm3jwKXNZsVThLZ7/lWRXxsjtRT8DaS
	TcO8mLqwX2B+UaILh6GSj/dBcpuiPhw=
Subject: [PATCH 4/4][4.15?] VT-d: restore flush hooks when disabling qinval
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Message-ID: <1fa377f7-d709-2615-55fe-f4d5e0d4f317@suse.com>
Date: Thu, 18 Mar 2021 11:15:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Leaving the hooks untouched is at best a latent risk: There may well be
cases where some flush is needed, which then needs carrying out the
"register" way.

Switch from u<N> to uint<N>_t while needing to touch the function
headers anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -49,6 +49,16 @@ int iommu_flush_iec_global(struct vtd_io
 int iommu_flush_iec_index(struct vtd_iommu *iommu, u8 im, u16 iidx);
 void clear_fault_bits(struct vtd_iommu *iommu);
 
+int __must_check vtd_flush_context_reg(struct vtd_iommu *iommu, uint16_t did,
+                                       uint16_t source_id,
+                                       uint8_t function_mask, uint64_t type,
+                                       bool flush_non_present_entry);
+int __must_check vtd_flush_iotlb_reg(struct vtd_iommu *iommu, uint16_t did,
+                                     uint64_t addr, unsigned int size_order,
+                                     uint64_t type,
+                                     bool flush_non_present_entry,
+                                     bool flush_dev_iotlb);
+
 struct vtd_iommu *ioapic_to_iommu(unsigned int apic_id);
 struct vtd_iommu *hpet_to_iommu(unsigned int hpet_id);
 struct acpi_drhd_unit *ioapic_to_drhd(unsigned int apic_id);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -380,10 +380,9 @@ static void iommu_flush_write_buffer(str
 }
 
 /* return value determine if we need a write buffer flush */
-static int __must_check flush_context_reg(struct vtd_iommu *iommu, u16 did,
-                                          u16 source_id, u8 function_mask,
-                                          u64 type,
-                                          bool flush_non_present_entry)
+int vtd_flush_context_reg(struct vtd_iommu *iommu, uint16_t did,
+                          uint16_t source_id, uint8_t function_mask,
+                          uint64_t type, bool flush_non_present_entry)
 {
     u64 val = 0;
     unsigned long flags;
@@ -449,11 +448,9 @@ static int __must_check iommu_flush_cont
 }
 
 /* return value determine if we need a write buffer flush */
-static int __must_check flush_iotlb_reg(struct vtd_iommu *iommu, u16 did,
-                                        u64 addr,
-                                        unsigned int size_order, u64 type,
-                                        bool flush_non_present_entry,
-                                        bool flush_dev_iotlb)
+int vtd_flush_iotlb_reg(struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
+                        unsigned int size_order, uint64_t type,
+                        bool flush_non_present_entry, bool flush_dev_iotlb)
 {
     int tlb_offset = ecap_iotlb_offset(iommu->ecap);
     u64 val = 0;
@@ -2144,8 +2141,8 @@ static int __must_check init_vtd_hw(bool
          */
         if ( enable_qinval(iommu) != 0 )
         {
-            iommu->flush.context = flush_context_reg;
-            iommu->flush.iotlb   = flush_iotlb_reg;
+            iommu->flush.context = vtd_flush_context_reg;
+            iommu->flush.iotlb   = vtd_flush_iotlb_reg;
         }
     }
 
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -462,4 +462,7 @@ void disable_qinval(struct vtd_iommu *io
                   !(sts & DMA_GSTS_QIES), sts);
 out:
     spin_unlock_irqrestore(&iommu->register_lock, flags);
+
+    iommu->flush.context = vtd_flush_context_reg;
+    iommu->flush.iotlb   = vtd_flush_iotlb_reg;
 }


