Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139645BB5AD
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408202.650952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvq-0003Z1-PK; Sat, 17 Sep 2022 02:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408202.650952; Sat, 17 Sep 2022 02:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvq-0003UU-Jt; Sat, 17 Sep 2022 02:51:50 +0000
Received: by outflank-mailman (input) for mailman id 408202;
 Sat, 17 Sep 2022 02:51:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvp-0002wS-71
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:49 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb65e3e-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:47 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DC6A45C00A9;
 Fri, 16 Sep 2022 22:51:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 16 Sep 2022 22:51:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:45 -0400 (EDT)
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
X-Inumbo-ID: abb65e3e-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383106; x=1663469506; bh=/pD4K+B9L0
	ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=itEbC7X1dp21xKuLNKJyo8Ai0w
	CJ9n5XfOAD85GITEj4vmv8VMnIBniOsGpsAL4KO64mvbNEpzEdD6WsSp3R4mLIVK
	D5VaNsG2eqjfLgDgXhaOWu5sU7upEDdaZANeecRs1ALGHbQprAdeKTOsQCqnvCqu
	wL4kO9FmGM9jhmUZ9KhZUIWGck+shy7RNc2+t6tfzHOmwfKudVnVY5bAPsa9LraX
	WUIIL9+AuFfOxPiarxjdLdxBXn0qYwltuq7g3Nf5ch/U/dQk40VD4oVDnOlRTr+l
	k0bsN58zDYLosOOFS7QoGIGlK8KPXh8mYsb47yvH+3Z9B4z4CXUAUGao7Wxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383106; x=
	1663469506; bh=/pD4K+B9L0ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=c
	9hkK3BV+CD1f2jOiqRsY+BY0mKGT1abbztFWy5uhlS0PYPsjkf2GvsWsN+AS7L5A
	ZdMdbJ5uayyTnNeJW5zWWdzFuUQe0/f2ay03nEBp7xsf2ok+XYJ7oKECulj4krgZ
	9/N7t3yEGSsP8JziQpVLaA/mhdD21PkUTDZeby3CwJLfPteoRvDSyjM6FiPZ+bkl
	m0jWMjOgcTEQFlYGv4khM74k6TAjCtj84sNFPSMI5ju4n0U/kY6jPYkBclTJRYyz
	/iXzkFj9JgFfCyFiSe2sS5VNIyWidxhLxqaOU5jMdGmCXH7dORmUp9uk5TCaKvUZ
	57gbJBgS2Q2fU7LnObAZA==
X-ME-Sender: <xms:QjYlY8uEDdkIKHxhoFnu7LPo8XCVikZvG9VEPoZin1XQZob21MyubA>
    <xme:QjYlY5cIKk023rI-S6TxA7KFLy36fIaQTru_ulgkkSIw9PHFUkGuLRlQwCT4IcMGg
    _xm8w3ccITXng>
X-ME-Received: <xmr:QjYlY3yqMXPBwrg5rnVKOus71BJFWMYscDqAjXQbceq4IHtjn5_Y5ayHuaM3Kr8dLwSwFhtiVQ80dmHbpq5Na_6iXEmY4NvDPVxIkfi9SE-I5kLN4J_V3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QjYlY_NqhKJrLavCnhRcN27PebJ0qFdPz3JSpZ9s1YMOQUVdRTh43g>
    <xmx:QjYlY8-fv7jZ6YxDw6o-1f4XHcwbMMmEz4O8GHhAIEh0hcDxz6_VVg>
    <xmx:QjYlY3Wh5SjDSJvKe-LZPTqbXmNNMMuakbJdLoUqqd23ZDGjsmyMkg>
    <xmx:QjYlY6nB9K4v2zw2sPKMHJeUubuFzt1_F6PCCfftGs7SWvYoAlXvlg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v7 03/11] IOMMU/AMD: wire common device reserved memory API
Date: Sat, 17 Sep 2022 04:51:22 +0200
Message-Id: <49615badb40907157c900996f185e169b7f3d611.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register common device reserved memory similar to how ivmd= parameter is
handled.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - use variable initializer
 - use pfn_to_paddr()
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index ac6835225bae..3b577c9b390c 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1078,6 +1078,25 @@ static inline bool_t is_ivmd_block(u8 type)
             type == ACPI_IVRS_TYPE_MEMORY_IOMMU);
 }
 
+static int __init cf_check add_one_extra_ivmd(unsigned long start,
+                                              unsigned long nr,
+                                              uint32_t id, void *ctxt)
+{
+    struct acpi_ivrs_memory ivmd = {
+        .header = {
+            .length = sizeof(ivmd),
+            .flags = ACPI_IVMD_UNITY | ACPI_IVMD_READ | ACPI_IVMD_WRITE,
+            .device_id = id,
+            .type = ACPI_IVRS_TYPE_MEMORY_ONE,
+        },
+    };
+
+    ivmd.start_address = pfn_to_paddr(start);
+    ivmd.memory_length = pfn_to_paddr(nr);
+
+    return parse_ivmd_block(&ivmd);
+}
+
 static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
@@ -1121,6 +1140,8 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
         AMD_IOMMU_DEBUG("IVMD: %u command line provided entries\n", nr_ivmd);
     for ( i = 0; !error && i < nr_ivmd; ++i )
         error = parse_ivmd_block(user_ivmds + i);
+    if ( !error )
+        error = iommu_get_extra_reserved_device_memory(add_one_extra_ivmd, NULL);
 
     /* Each IO-APIC must have been mentioned in the table. */
     for ( apic = 0; !error && iommu_intremap && apic < nr_ioapics; ++apic )
-- 
git-series 0.9.1

