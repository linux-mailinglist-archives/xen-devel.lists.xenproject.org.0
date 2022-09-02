Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2BD5AB141
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397605.638259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YU-0000n6-1q; Fri, 02 Sep 2022 13:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397605.638259; Fri, 02 Sep 2022 13:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YT-0000hc-S2; Fri, 02 Sep 2022 13:17:53 +0000
Received: by outflank-mailman (input) for mailman id 397605;
 Fri, 02 Sep 2022 13:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YS-0008Qk-It
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:52 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a57bf8e8-2ac1-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 15:17:51 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EB1385C00DE;
 Fri,  2 Sep 2022 09:17:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 02 Sep 2022 09:17:50 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:49 -0400 (EDT)
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
X-Inumbo-ID: a57bf8e8-2ac1-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124670; x=1662211070; bh=/pD4K+B9L0
	ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=tdaO6MNIL/4CTLnA2vlzLHSMZA
	wuiWWmcQ6wr8xBzp7snOTOvM4AP5LhWlD0PMqNK7MonOCdpCo3v4UqLspO1ysKCl
	JTnq5T34BdX/BAUATKtDGuNmLrd1T54o9+FUP+sBqKTxNOz4GpCwCegWNqsh3OpP
	7/rYQUpAZk4T5jVgFUXwI8EG1NaEM3b5D2ktUYB4iMi9jJM3nDbRSlvla1sw2OV+
	ULSoViZ/W+z59Ff2QTSFyl+F9yYR1JGm7zMHTX9tYb2QJ6Nkfzto1URcr4hZl5eF
	G531IPYi96d0vaD27+painYyqKZxIGWXoyCxdwERmGepErUX2GP7WHmEIhxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124670; x=
	1662211070; bh=/pD4K+B9L0ba8VyhoGCQP8h4YWebGtRYWp1NDk3Q7sk=; b=C
	2N30BQcvHdBuxA7Xou9GiHADYoZlniMDZtZjv/uaXGBhAEZuRBYVbQS1gYrn1YN3
	jHV4PocAJJbIvxlNjIkbGPZ4ZO0+OU4NZ5AosuA0gPkbLHM+iyE6Ilrl2XY+46vw
	CqTWhONARdXpjr3UHC3HfdqneqmnvFFoHYJxovGkF+bN0CgREo8W0hLfKvTh1OjS
	xNlDe7+0zHbj0871qjib9H73sZ4GGBTjIqqJlr2vJfQz5Uvr8bPUWlpIrMkc00I7
	d4GGBDwRS73Kr8ae89zfnfAYIMw2wpuru76cydhTEGvF/Ck2wteso4+jiHGwOz3b
	F39FJXRLNYD78uzD+Tlng==
X-ME-Sender: <xms:fgISY2_OMBbYHC4BllLYxtNmblXX3kBB7CAhx0WAFOSxLzAtxMxVGQ>
    <xme:fgISY2u7iSSoU4LSjhEjWbznyA67O_jFSvkdH7Zk3QX5Vv2f59-kGSBkIHavvtRFl
    heEyDMvQ7A-fg>
X-ME-Received: <xmr:fgISY8BGC9W0Hw0PlnvGc8B-k5xh85H96sk4yctBHApgVtBMlPHxiUGi9ggl64FrmEmJlExji5axih3Bs3Iwu3L82mIQDzWQ5q6HasNHG0YltkZw9ZyaaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:fgISY-cLQdUi53C7L3t3O0kHDd4JkKNjwdk7UDtqWLoWgOBUBzs2VA>
    <xmx:fgISY7Nfm8Rq8xfqFAOc8DQwgtJqLIjXLSknETGQ4iYTC5Md0tVCTA>
    <xmx:fgISY4ktDUKBVImgd1PumHzvMezpTBGT6vltDEfY4FU8GWi7XlT1EQ>
    <xmx:fgISYx0NgTCcD1yn5n0EsKpRqdpISNfvbw2ckJy3PdgD_EE1547SEQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v6 05/10] IOMMU/AMD: wire common device reserved memory API
Date: Fri,  2 Sep 2022 15:17:26 +0200
Message-Id: <badb07050cb51cf5a69754eb48c81f02b3658eaf.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
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

