Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642AE53E02F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342172.567312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bu-0008Om-64; Mon, 06 Jun 2022 03:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342172.567312; Mon, 06 Jun 2022 03:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bt-00089i-I6; Mon, 06 Jun 2022 03:40:57 +0000
Received: by outflank-mailman (input) for mailman id 342172;
 Mon, 06 Jun 2022 03:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3br-0006AI-EP
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:55 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77b6ac07-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:54 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DC8F55C0092;
 Sun,  5 Jun 2022 23:40:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 05 Jun 2022 23:40:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:52 -0400 (EDT)
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
X-Inumbo-ID: 77b6ac07-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654486853; x=1654573253; bh=A6IUb5PhcA
	I6HvRB0V+hA466Exyej9hEMYg/SSDCyCk=; b=JMETKEtYs3QGO3ansj1uSe4kBc
	HWOucFNHxq5QDlAgtlc95WNZ9eSQjz4xzlbOzRKO9ZsQtIsYwQRzGQLUcmKFGQZ8
	sALDkfuN1/MDvBKuMaAqU19kgN+W6FpOnOtHAIheLY2Rsh+SkKW/aCcTYyVW5nr2
	rDs0UzvfDow7TxbSjNK1k/k59rxTa6SNryHwKoEQVPZljEM2omduu5eBPvIb1NrT
	3twJ8H5Qmy+ZcbgAGyLW43MWUep8lJjQHLJxWnaC7T25JBxEyv4axqDoxbz90Inc
	6lIsv+acUCl/jyBACLdkome3zJtqrpVPFG3c3KFAeO3GWv5LYcV92k48GCfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654486853; x=
	1654573253; bh=A6IUb5PhcAI6HvRB0V+hA466Exyej9hEMYg/SSDCyCk=; b=H
	as4gHtuzhsetWd9GSU457Un5devnnoow7tHZSR5crfCyWz6bzWK6/+suTYMoYAN4
	XJk8ddBrvtL97myk1FV3M7v5K7DRL1TEyQyq4bafwFZ3f3qGn/IS4Awwq75BupoA
	va5SMTi9PuBZCUNwPKLcCE/xWVTbdiDEv8BXjKpnV0iPv8sLBLi9G5W1pJP+nxCa
	wZuMwse9RbUDRTTZTiIobete1YH98h3x2pfXezHQU2LqlplbpwaugfATP04fCb+A
	FyVxOcd4U3ULZrNFM0sQjNTIKVsZixafcpTWT1MVkTYfr2WKb9eWOCJLn331AnM4
	siGtkD5fT5B23ksyg9DhQ==
X-ME-Sender: <xms:RXedYrQxbcRn4mn1S6EZf-iu4PC0os9mk5WRZKn9gAlks7YKm8MHjA>
    <xme:RXedYsz9C-8hLgw9XA-Hrc8dkbcdbgRpn0_dPTtLJim2gB9XDWbIdlpl2P0xq7wVV
    vgzMY6F9yTWKQ>
X-ME-Received: <xmr:RXedYg2wkGWB7LkhDLjK-Ae_ZNkw7trrnPekilpV41fhhpNSWhEZztY4XHF7Wc0jxQ6spTl7uWTOSSr566k5dinTJ6Du8f6fTM48xt3xE4N5EfDD39A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:RXedYrAPphMLiGCgXlMzSA9JOvSmQftKaO07O4Y-rn7ZdhAELhf7Kg>
    <xmx:RXedYkiSUOIpSI3iD6m2CDSPSAbCnn2THkmzg1GmC9tnyKaGe-eZOw>
    <xmx:RXedYvqUAYv4SlIDrQ_ObL82CWob2Io1PvH9870rTZj02NiphM4Xeg>
    <xmx:RXedYgZh7VsqugW-I5R8nNc1frbi_V_odn-QK6Z2g-sX46geX-K1EQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [RFC PATCH 09/12] IOMMU/AMD: wire common device reserved memory API
Date: Mon,  6 Jun 2022 05:40:21 +0200
Message-Id: <caea51060b225a8ff208962c76deb59cc409ff9f.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
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

