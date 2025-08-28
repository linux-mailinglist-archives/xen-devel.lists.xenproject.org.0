Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02FB39F44
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098895.1452854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcvB-000102-RM; Thu, 28 Aug 2025 13:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098895.1452854; Thu, 28 Aug 2025 13:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcvB-0000xL-N8; Thu, 28 Aug 2025 13:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1098895;
 Thu, 28 Aug 2025 13:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m9nx=3I=bounce.vates.tech=bounce-md_30504962.68b05d26.v1-9758e5427ca4410c85cf6709beb84b08@srs-se1.protection.inumbo.net>)
 id 1urcvA-0008Ok-Dg
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:44:08 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 116293e4-8415-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 15:44:07 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cCN0k53frz2K248f
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 13:44:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9758e5427ca4410c85cf6709beb84b08; Thu, 28 Aug 2025 13:44:06 +0000
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
X-Inumbo-ID: 116293e4-8415-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756388646; x=1756658646;
	bh=t+8UDjui/0POj7TE6by/B9mlUFOByI158R8Z7T4sNR0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=r0CkLooVb+a643pZXlxqRoK9GJYwlZnwCJKZfaT+nGi3utL4q1IUgEtR1wohYrFy6
	 U9wor5bfKHofx28ofdaArU7XpX/a5NmotIkpLAxP8Gsxdtb0Ft2/L5t5DkyF/ud8Oi
	 I7anBt9+KJQqZGkJqJEFkZJppiG4lyo93uoBtxG4iAIqX44ivAk/Y5RUZmlWnBhuhX
	 Oh2CqV89EdYh92qrwvJeQWsv1echEC+tyFgLU/l+7aJtt7CLbSEEi07sqNySJXPlkR
	 CXP2frJA7e2JO+m84K02oTMSeW7C7cGd+hju2XtvZZ/eIFHnKq8iR77e+fkbT+Bnp4
	 TPKad4SJrCj2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756388646; x=1756649146; i=teddy.astie@vates.tech;
	bh=t+8UDjui/0POj7TE6by/B9mlUFOByI158R8Z7T4sNR0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FpUM6JvHJBOckJx10koqXzfHza1Mms+mwY7pumQxJHYgZ+29qxz4Rr1Imx33CgPwq
	 ek1m82OmIxNOQ5aQrMOJW5/X6uJ41pjQMp/bONPiGV7Sy8XHkTRkOtTo0M6RAPMq9O
	 /5CUk6XdDQEHC9UV1zYMRBmUtuWOhNHoZTQEHWKVZIdQtKOamHzB7e4IPnlIkqgetq
	 61oRKDoWTkgU3ucAykECSQcDTK8O4lLN4FVLDqC4QDXRna+zvTIswUXqVIBhpPBMYe
	 ZPLHtUOWB6rsH50yT/B6lh8oKxLwT6UBmFyXTwxwODdxZWfkEznY5m5QcXXmHSprBM
	 FJeERYEJT3qsw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=202/3]=20hvmloader:=20Update=20to=20SMBIOS=202.6?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756388645698
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <94d8932680f60a8f34a420b4d57ea42f7a97c550.1756386155.git.teddy.astie@vates.tech>
In-Reply-To: <8c36ee844f69c59cf2c504b411e6cf9c5617511b.1756386155.git.teddy.astie@vates.tech>
References: <8c36ee844f69c59cf2c504b411e6cf9c5617511b.1756386155.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9758e5427ca4410c85cf6709beb84b08?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250828:md
Date: Thu, 28 Aug 2025 13:44:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).

In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
(undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
you have a endian mismatch causing the UUIDs to mismatch in the guest.

$ cat /sys/hypervisor/uuid
e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
$ cat /sys/devices/virtual/dmi/id/product_uuid
3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
$ cat /sys/devices/virtual/dmi/id/product_serial
e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7

This patch updates the SMBIOS version from 2.4 to 2.6 and does the appropriate
modifications of the table. This effectively fix this endianness mismatch with
OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.

Fixes: c683914ef913 ("Add code to generate SMBIOS tables to hvmloader.")
(SMBIOS versions before 2.6 has a ill-defined UUID definition)
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - rebase onto staging
 - introduce missing SMBIOS 2.5-2.6 fields
 - check for new SMBIOS 2.6 table lengths
 - update UUID conversion comment
 - add Fixes: note
---
 tools/firmware/hvmloader/smbios.c       | 50 ++++++++++++++++++++-----
 tools/firmware/hvmloader/smbios_types.h |  9 +++++
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 76c7090d16..e445475d78 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -396,7 +396,7 @@ smbios_entry_point_init(void *start,
     memcpy(ep->anchor_string, "_SM_", 4);
     ep->length = 0x1f;
     ep->smbios_major_version = 2;
-    ep->smbios_minor_version = 4;
+    ep->smbios_minor_version = 6;
     ep->max_structure_size = max_structure_size;
     ep->entry_point_revision = 0;
     memcpy(ep->intermediate_anchor_string, "_DMI_", 5);
@@ -505,7 +505,22 @@ smbios_type_1_init(void *start, const char *xen_version,
     p->version_str = 3;
     p->serial_number_str = 4;
 
-    memcpy(p->uuid, uuid, 16);
+    /*
+     * Xen toolstack uses big endian UUIDs, however GUIDs (which requirement
+     * is clarified by SMBIOS >= 2.6) has the first 3 components appearing as
+     * being little endian and the rest as still being big endian.
+     */
+    /* First component */
+    for ( unsigned int i = 0; i < 4; i++ )
+        p->uuid[i] = uuid[4 - i - 1];
+    /* Second component */
+    p->uuid[4] = uuid[5];
+    p->uuid[5] = uuid[4];
+    /* Third component */
+    p->uuid[6] = uuid[7];
+    p->uuid[7] = uuid[6];
+    /* Rest */
+    memcpy(p->uuid + 8, uuid + 8, 8);
 
     p->wake_up_type = 0x06; /* power switch */
     p->sku_str = 0;
@@ -705,8 +720,8 @@ smbios_type_4_init(
     struct smbios_type_4 *p = start;
     uint32_t eax, ebx, ecx, edx;
 
-    /* Specification says Type 4 table has length of 23h for v2.3+. */
-    BUILD_BUG_ON(sizeof(*p) != 35);
+    /* Specification says Type 4 table has length of 2Ah for v2.6. */
+    BUILD_BUG_ON(sizeof(*p) != 42);
 
     memset(p, 0, sizeof(*p));
 
@@ -716,7 +731,7 @@ smbios_type_4_init(
 
     p->socket_designation_str = 1;
     p->processor_type = 0x03; /* CPU */
-    p->processor_family = 0x01; /* other */
+    p->processor_family = p->processor_family_2 = 0x01; /* other */
     p->manufacturer_str = 2;
 
     cpuid(1, &eax, &ebx, &ecx, &edx);
@@ -736,6 +751,22 @@ smbios_type_4_init(
     p->l2_cache_handle = 0xffff; /* No cache information structure provided. */
     p->l3_cache_handle = 0xffff; /* No cache information structure provided. */
 
+    /*
+     * We have a smbios type 4 table per vCPU (which is per socket),
+     * which means here that we have 1 socket per vCPU.
+     */
+    p->core_count = p->core_enabled = p->thread_count = 1;
+
+    /*
+     * We set 64-bits, execute protection and enhanced virtualization.
+     * We don't set Multi-Core (bit 3) because this individual processor
+     * (as being a single vCPU) is only having one core.
+     *
+     * SMBIOS specification says that these bits don't state anything
+     * regarding the actual availability of such features.
+     */
+    p->processor_characteristics = 0x64;
+
     start += sizeof(*p);
 
     strncpy(buf, "CPU ", sizeof(buf));
@@ -780,8 +811,8 @@ smbios_type_8_init(void *start)
 static void *
 smbios_type_9_init(void *start)
 {
-    /* Specification says Type 9 table has length of 0Dh for v2.1-2.5. */
-    BUILD_BUG_ON(sizeof(struct smbios_type_9) != 13);
+    /* Specification says Type 9 table has length of 11h for v2.6+. */
+    BUILD_BUG_ON(sizeof(struct smbios_type_9) != 17);
 
     /* Only present when passed in. */
     return smbios_pt_copy(start, 9, SMBIOS_HANDLE_TYPE9,
@@ -870,8 +901,8 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
     char buf[16];
     struct smbios_type_17 *p = start;
 
-    /* Specification says Type 17 table has length of 1Bh for v2.3-2.6. */
-    BUILD_BUG_ON(sizeof(*p) != 27);
+    /* Specification says Type 17 table has length of 1Ch for v2.6. */
+    BUILD_BUG_ON(sizeof(*p) != 28);
 
     memset(p, 0, sizeof(*p));
 
@@ -890,6 +921,7 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
     p->bank_locator_str = 0;
     p->memory_type = 0x07; /* RAM */
     p->type_detail = 0;
+    p->attributes = 0;
 
     start += sizeof(*p);
     strcpy(start, "DIMM ");
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index c04b435d31..860617d86a 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -147,6 +147,11 @@ struct smbios_type_4 {
     uint8_t serial_number_str;
     uint8_t asset_tag_str;
     uint8_t part_number_str;
+    uint8_t core_count;
+    uint8_t core_enabled;
+    uint8_t thread_count;
+    uint16_t processor_characteristics;
+    uint16_t processor_family_2;
 } __attribute__ ((packed));
 
 /* SMBIOS type 7 - Cache Information */
@@ -185,6 +190,9 @@ struct smbios_type_9 {
     uint16_t slot_id;
     uint8_t slot_characteristics_1;
     uint8_t slot_characteristics_2;
+    uint16_t sgn_base;
+    uint8_t bus_number_base;
+    uint8_t devfn_base;
 } __attribute__ ((packed));
 
 /* SMBIOS type 11 - OEM Strings */
@@ -227,6 +235,7 @@ struct smbios_type_17 {
     uint8_t serial_number_str;
     uint8_t asset_tag_str;
     uint8_t part_number_str;
+    uint8_t attributes;
 } __attribute__ ((packed));
 
 /* SMBIOS type 19 - Memory Array Mapped Address */
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


