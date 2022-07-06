Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFEE568CEB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 17:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362337.592395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971U-0001bt-Pe; Wed, 06 Jul 2022 15:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362337.592395; Wed, 06 Jul 2022 15:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o971U-0001YA-Jq; Wed, 06 Jul 2022 15:33:04 +0000
Received: by outflank-mailman (input) for mailman id 362337;
 Wed, 06 Jul 2022 15:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWdV=XL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o971S-000854-48
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 15:33:02 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb2c432a-fd40-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 17:33:01 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 866095C0136;
 Wed,  6 Jul 2022 11:33:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Jul 2022 11:33:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 11:32:59 -0400 (EDT)
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
X-Inumbo-ID: eb2c432a-fd40-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1657121580; x=1657207980; bh=A6IUb5PhcA
	I6HvRB0V+hA466Exyej9hEMYg/SSDCyCk=; b=giNnmr03OleSnwJ++SmNzG+uUj
	8dD7FzdmjgL6RasPbWwx2xu8FR+i2dUcygeQYdNTW07eJrKH93fykc0tQv6kV89J
	PH54TA0cHlkfO0VYAeOpqOkFP+85JgzUY5Dfb5c/6lyB/FB43dpt9phtc7NabxfZ
	EwXqksbscPpcjN743r+8Mlue2qWELTz5Mq6/ICORGAeKee9ycgp7toAYmfmTYAYv
	10xAZNKsTJqTsItteWEjL19hGTThWsjeNa75lFfCgUhg5RLMYyzJfywdUQKNTYeO
	i3Vu7SjFZe81SJ8xloGQ7ich8DwDMr1ulI2av4H9iGN4o3GcqwqpJlCvJQtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657121580; x=
	1657207980; bh=A6IUb5PhcAI6HvRB0V+hA466Exyej9hEMYg/SSDCyCk=; b=k
	dH3cTDdbnh8i9bmHzv3nUXSMx+X5/hrxJtrRxwWOMYqpUsDSDjv0PYag8iREk4lO
	MP/Mhw/4Xxmc5DmeIucyvQRyMHJEIUOJ9V2m7QvjZUgxN21B3LFREFTNN+KoIEo4
	JoT2ozwE6sTgNQ9/3uofMaMT9TGjRxVV10eEX0Un7CvZQ9K8+41yjPvEgzUMVsGo
	SA9sOjhr3OmJp2MCjYQA6iugzKmfNRlghA7AMkEvNCIqkK9syzwCQ5jRtw5f2Q5+
	SVsp3LZJqTm7xYKQQQS3wp9/If08pvWeWRUDVQWao7T8dhDrET9d+wd1HKKjFtsB
	linyVnuHSSePJaxqAsmng==
X-ME-Sender: <xms:LKvFYvS1x1GeEFSgl_S1SJ1GEeMpmnOw0NkMQyBzVdUQQhkImER6XA>
    <xme:LKvFYgzNZ9zOW7cPhPIi02W25PQB7CO519_raRqBhMB3PSkGVGHldE8XuJEY5pD_C
    MPQioLkY0ADmA>
X-ME-Received: <xmr:LKvFYk1u24BtmSTcbOkByqCUuvUY8jaQ7T2SMIRqNauhNsOEXnIFNrfGck-_L6Kn849W7ShUK4Zc46BUopG82M7Vplb5Xdbuw_uBiu0E-2k8LBMMz1E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:LKvFYvCQZrz0Y3PLuffSGm0gLxOuKsgIZhA_f8GIrXgnhhuWn6L5cw>
    <xmx:LKvFYogaZ1cwNlpqtDGg5jKq__1kqB58Urjmpe18KOxTbdJ8X6ga8g>
    <xmx:LKvFYjoYA7-8r3365CH8uJ7Cgkxv6TtKhdw4vXaS-Shk1fmkB6e8dQ>
    <xmx:LKvFYkbKRBuHgXfbifsclz-WCuHCcLWXrnAmL76hqacOFTjQlae44A>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 7/9] IOMMU/AMD: wire common device reserved memory API
Date: Wed,  6 Jul 2022 17:32:12 +0200
Message-Id: <457056cbc6dcc00958b1f4e0cad35121e0cd1557.1657121519.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register common device reserved memory similar to how ivmd= parameter is
handled.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index ac6835225bae..2a4896c05442 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1078,6 +1078,20 @@ static inline bool_t is_ivmd_block(u8 type)
             type == ACPI_IVRS_TYPE_MEMORY_IOMMU);
 }
 
+static int __init cf_check add_one_extra_ivmd(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
+{
+    struct acpi_ivrs_memory ivmd;
+
+    ivmd.start_address = start << PAGE_SHIFT;
+    ivmd.memory_length = nr << PAGE_SHIFT;
+    ivmd.header.flags = ACPI_IVMD_UNITY |
+                        ACPI_IVMD_READ | ACPI_IVMD_WRITE;
+    ivmd.header.length = sizeof(ivmd);
+    ivmd.header.device_id = id;
+    ivmd.header.type = ACPI_IVRS_TYPE_MEMORY_ONE;
+    return parse_ivmd_block(&ivmd);
+}
+
 static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
@@ -1121,6 +1135,8 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
         AMD_IOMMU_DEBUG("IVMD: %u command line provided entries\n", nr_ivmd);
     for ( i = 0; !error && i < nr_ivmd; ++i )
         error = parse_ivmd_block(user_ivmds + i);
+    if ( !error )
+        error = iommu_get_extra_reserved_device_memory(add_one_extra_ivmd, NULL);
 
     /* Each IO-APIC must have been mentioned in the table. */
     for ( apic = 0; !error && iommu_intremap && apic < nr_ioapics; ++apic )
-- 
git-series 0.9.1

