Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2ADBFB37B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147746.1479941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVG-0007hI-QB; Wed, 22 Oct 2025 09:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147746.1479941; Wed, 22 Oct 2025 09:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVVG-0007el-Lj; Wed, 22 Oct 2025 09:51:34 +0000
Received: by outflank-mailman (input) for mailman id 1147746;
 Wed, 22 Oct 2025 09:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLY2=47=bounce.vates.tech=bounce-md_30504962.68f8a919.v1-f0bf9ec886ff408dbd4f0076b9aef2da@srs-se1.protection.inumbo.net>)
 id 1vBVVE-0007BN-Py
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:51:32 +0000
Received: from mail180-10.suw31.mandrillapp.com
 (mail180-10.suw31.mandrillapp.com [198.2.180.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa4d1956-af2c-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 11:51:22 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-10.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4cs4Dn5Pydz5QlDfF
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 09:51:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f0bf9ec886ff408dbd4f0076b9aef2da; Wed, 22 Oct 2025 09:51:21 +0000
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
X-Inumbo-ID: aa4d1956-af2c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761126681; x=1761396681;
	bh=pnFV+fDDYcmdoekdKwaFpxr/OuJxPCuCxIvebF8I08Q=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CInwWjjIfzU+YNFapjTNtvc/9G+d8E1dr2qA9M4ydqM3jD3dZd6A4+pT6zPlqtVD4
	 Jt5n75IxSrl8vkFvzmJX0iHmQm5RriW6tFiZ1au0/JhGKqdWdy3IcGTNBAj9qLOdKO
	 TwbOXKRviLtIwv675vOohC1dNkw/cMo8GK/mV9ybLIUAiDpNWxke276+cx3V640zpb
	 ivEW9OYrZy5jMWtdQdLwVs+yoMk1RJvceC4AXSykFDyPc39mjWbzGnURnwK6VpHOhS
	 bfCuoPy7MFU0NrIw1HFdbH21y/tuSPklWOq02eqpwy4kmHetfue6vyNsRQGi58mqnR
	 PkVE9pOXC26DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761126681; x=1761387181; i=teddy.astie@vates.tech;
	bh=pnFV+fDDYcmdoekdKwaFpxr/OuJxPCuCxIvebF8I08Q=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=furiCssd/WYkv5hqSYcS8H86H7vKyIY88mZ6x3F19QbKn0EROQQDSPeRpDHIdDd1N
	 5kXN4U3NV+SI0oH1Ww+HLyQBeS8lBAuG04OaOxhjWr01uP/guoGteB7HGkHGmFswpn
	 SYaP9Ef4YpyryIwnxZ0+CdMmk7koEohTRbUpREwKxjjcLNHhL3gnIHgyKFFmNjLolx
	 Umk1gu4eauPUkWVUscL4uoLLix2+2ZJolR+rRylhMdnJ24j9ENKbfyMOI8RuQNBy45
	 Ppl8HI7bWVifYg7B9UhCTfwbpt9x/mDmoqS5WVWLxVvJ7Y+VaOIGaEw+ZtkBvfAJgQ
	 WtS2pt+KDP4NA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=203/4]=20vtd:=20Remove=20IO=5FxAPIC=5Froute=5Fentry=20macro?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761126680904
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <540db157df0f0f6e27c7b50edc6a7d82fe668608.1761124632.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761124632.git.teddy.astie@vates.tech>
References: <cover.1761124632.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f0bf9ec886ff408dbd4f0076b9aef2da?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251022:md
Date: Wed, 22 Oct 2025 09:51:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This macro was introduced to abstract between IO-APIC and IO-SAPIC (ia64),
now that ia64 isn't supported anymore, this macro now only refers to IO-APIC.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/vtd/intremap.c | 10 +++++-----
 xen/drivers/passthrough/vtd/vtd.h      |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 7726ee618a..e0314aa469 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -268,7 +268,7 @@ static unsigned int alloc_remap_entry(struct vtd_iommu *iommu, unsigned int nr)
 }
 
 static int remap_entry_to_ioapic_rte(
-    struct vtd_iommu *iommu, int index, struct IO_xAPIC_route_entry *old_rte)
+    struct vtd_iommu *iommu, int index, struct IO_APIC_route_entry *old_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
     unsigned long flags;
@@ -316,8 +316,8 @@ static int remap_entry_to_ioapic_rte(
 }
 
 static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
-    int apic, unsigned int ioapic_pin, struct IO_xAPIC_route_entry *old_rte,
-    struct IO_xAPIC_route_entry new_rte)
+    int apic, unsigned int ioapic_pin, struct IO_APIC_route_entry *old_rte,
+    struct IO_APIC_route_entry new_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
     struct iremap_entry new_ire;
@@ -398,7 +398,7 @@ unsigned int cf_check io_apic_read_remap_rte(
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
     int index;
-    struct IO_xAPIC_route_entry old_rte = { };
+    struct IO_APIC_route_entry old_rte = { };
     int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
 
@@ -420,7 +420,7 @@ unsigned int cf_check io_apic_read_remap_rte(
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


