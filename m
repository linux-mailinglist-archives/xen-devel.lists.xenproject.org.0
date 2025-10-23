Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2DC00262
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148839.1480718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMx-0004o1-3e; Thu, 23 Oct 2025 09:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148839.1480718; Thu, 23 Oct 2025 09:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMw-0004kt-Vj; Thu, 23 Oct 2025 09:12:26 +0000
Received: by outflank-mailman (input) for mailman id 1148839;
 Thu, 23 Oct 2025 09:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xdiZ=5A=bounce.vates.tech=bounce-md_30504962.68f9f171.v1-62ce87008b414352a437bdf9322b8903@srs-se1.protection.inumbo.net>)
 id 1vBrMu-0004V7-Rw
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:12:24 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fb59c3d-aff0-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 11:12:18 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4csgKF3cy7zDRJJTy
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 09:12:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 62ce87008b414352a437bdf9322b8903; Thu, 23 Oct 2025 09:12:17 +0000
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
X-Inumbo-ID: 5fb59c3d-aff0-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761210737; x=1761480737;
	bh=ISwWHQVTQY5EpDzB9R3kRNbTEtx9jHYcJ14ZAaa+DSw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tt6hASuV80FoYEEbV9VtZmoCQRQXXnb7fmE7MPrLiiPZFZumiVWVrl/ge/F3ZKYca
	 xtJJlhyJmCGFQyRk8BEKCdX+4rFZDpsoqft5dg2wHArN+InU325jlXs8NAZT3eloZe
	 l2Q7oSCMYUNMpI8VVGFhLw0FS0ZAZOVDsO0p7oCLVq9o+ov6b7+Jn08ZH4Wjp/oHnP
	 AAsfLiu7CCzVZHnbn5Bk/tugOMAFbpqTi08w+2jmaW0dE82/9Yb3YgetG00CVzRV7c
	 BXQ4nTmOMxc+Cx8sRjw3MRGOkV3M/grhosyixhfQ3/RPL0kvQCRxDIBcpRqa1fmi+L
	 trpQfOQ/txufQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761210737; x=1761471237; i=teddy.astie@vates.tech;
	bh=ISwWHQVTQY5EpDzB9R3kRNbTEtx9jHYcJ14ZAaa+DSw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WGI8GujYpaiADEOS4lxBEkSihptbwAXig2dMYUv72WYtGSWboqS3vugpdk819f2XU
	 ECGFJhoRqEb5URsW4JKJx/9dTnVSbBpwApenC5HPpW/s+oB0UbjhfjGef2MbBbBULC
	 QNJIlf6gMHArE/UdBZdp8pZFLnzGMfbVWWhgx4KYKjiL59tEmT4F6ZrPFitTagaEzg
	 iC8j8apoRf+keFE/rn1NmsLzrFUH7ostC7rYnienzZsc3rynjWyjdqleIgxkN3CkAV
	 sPoNbRK8enwUnf9kkuBZ/aKRLQ0Ll+OYHObJSD3/BK4pZufXQphNcgWuFkiolXmiS3
	 MElP2BpxfGObA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=204/5]=20vtd:=20Remove=20IO=5FxAPIC=5Froute=5Fentry=20macro?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761210737079
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <5bd53445740ba85c8b49d9018b6600fd90eadb50.1761209564.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761209564.git.teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.62ce87008b414352a437bdf9322b8903?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 09:12:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This macro was introduced to abstract between IO-APIC and IO-SAPIC (ia64),
now that ia64 isn't supported anymore, this macro now only refers to IO-APIC.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - formatting changes

 xen/drivers/passthrough/vtd/intremap.c | 10 +++++-----
 xen/drivers/passthrough/vtd/vtd.h      |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 6c779d476d..612e08bcec 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -269,7 +269,7 @@ static unsigned int alloc_remap_entry(struct vtd_iommu *iommu, unsigned int nr)
 }
 
 static int remap_entry_to_ioapic_rte(
-    struct vtd_iommu *iommu, int index, struct IO_xAPIC_route_entry *old_rte)
+    struct vtd_iommu *iommu, int index, struct IO_APIC_route_entry *old_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
     unsigned long flags;
@@ -317,8 +317,8 @@ static int remap_entry_to_ioapic_rte(
 }
 
 static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
-    int apic, unsigned int ioapic_pin, struct IO_xAPIC_route_entry *old_rte,
-    struct IO_xAPIC_route_entry new_rte)
+    int apic, unsigned int ioapic_pin, struct IO_APIC_route_entry *old_rte,
+    struct IO_APIC_route_entry new_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
     struct iremap_entry new_ire;
@@ -399,7 +399,7 @@ unsigned int cf_check io_apic_read_remap_rte(
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
     int index;
-    struct IO_xAPIC_route_entry old_rte = { };
+    struct IO_APIC_route_entry old_rte = {};
     int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
 
@@ -421,7 +421,7 @@ unsigned int cf_check io_apic_read_remap_rte(
 void cf_check io_apic_write_remap_rte(
     unsigned int apic, unsigned int pin, uint64_t rte)
 {
-    struct IO_xAPIC_route_entry old_rte = {}, new_rte;
+    struct IO_APIC_route_entry old_rte = {}, new_rte;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
     int rc;
 
diff --git a/xen/drivers/passthrough/vtd/vtd.h b/xen/drivers/passthrough/vtd/vtd.h
index b95124517b..f0286b40c3 100644
--- a/xen/drivers/passthrough/vtd/vtd.h
+++ b/xen/drivers/passthrough/vtd/vtd.h
@@ -31,9 +31,6 @@
 #define MAP_ERROR_RECOVERY    (1u << 2)
 #define UNMAP_ME_PHANTOM_FUNC (1u << 3)
 
-/* Allow for both IOAPIC and IOSAPIC. */
-#define IO_xAPIC_route_entry IO_APIC_route_entry
-
 struct IO_APIC_route_remap_entry {
     union {
         u64 val;
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


