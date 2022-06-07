Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57990540170
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:31:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343353.568750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEx-0008MV-Hq; Tue, 07 Jun 2022 14:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343353.568750; Tue, 07 Jun 2022 14:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyaEx-0008DY-AM; Tue, 07 Jun 2022 14:31:27 +0000
Received: by outflank-mailman (input) for mailman id 343353;
 Tue, 07 Jun 2022 14:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbs7=WO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyaEu-00061K-MG
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:31:24 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81604b6c-e66e-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 16:31:23 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 26C525C00E3;
 Tue,  7 Jun 2022 10:31:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 07 Jun 2022 10:31:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 10:31:22 -0400 (EDT)
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
X-Inumbo-ID: 81604b6c-e66e-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654612283; x=1654698683; bh=A6IUb5PhcA
	I6HvRB0V+hA466Exyej9hEMYg/SSDCyCk=; b=kvLeIvF/rub3mbujq80JZ6rqh8
	xFM+jPqRlvU2zoq6eFhJP10jWYcqRebmHXjkUeb5cV0cLtZjr0SxKhyCoceU/c+/
	gCS+YBjMc/39D+Ab0Swy87DAeQcSVuVg+Vd5fknFmvFT+87x6ocyDF9pGsaHGr9N
	Fo3c8EOilP8kSCULmALBid6fS57MDKnC3GwHUSRyDgR/1EsjItYCaDZeqbEM3asD
	gTsP6dJjgIYMceDf+wiSTmnf7w/HulDgWtNFFRw/7UNyHlkR1f6D/vojpt6pQOxX
	ux7iG+5dVwcYPlFuI6c8b42fIxh6vo65jGdARhpG9gf3XyYtQhdSU4apSJIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654612283; x=
	1654698683; bh=A6IUb5PhcAI6HvRB0V+hA466Exyej9hEMYg/SSDCyCk=; b=P
	EZAkeVuZqW40QfZ+2Iw50ElZFKjh0SaSOZSTxddgnhHWS0WID4RthSk687b1APWq
	WAl+zFBx/wgbljGAl4SHS6lE+EoXogSbVtJjSoLRnZjEz6DMrwEUDquSFgSk3ZCK
	XjR5dcbvcMAmaxk52yKgSr3LQjlGB0kNRR9hWqvzqzfMvRqUQuV8QwN0Ee4q1qJs
	YbC5jjPzbMOsYv9gwedWnaVlbmLRK9c9GuNTciOGdZ6yIp0K7707tkeZekkKTrYL
	lUcXDLyLzlRI2LjIMlJpHQLLA70eDpWT1GbWK/C4cjTiu8rMA9dmh5DDQ692tVWr
	hAQuUZ6RHAdAnvpsyckjQ==
X-ME-Sender: <xms:OmGfYqATAHN10ezeXJqXFbpq6D8CRhs_ap7G5UjvSCEmBbHxJZWQrw>
    <xme:OmGfYkg3IChUTgLDtbXxykOkPV_zWlfd9iCreh2EUgEghwpxOEQ6nm9jqpTwtbtLA
    9gx7kaJw5tHLA>
X-ME-Received: <xmr:OmGfYtmRImV0apA2s9uIHszoIQh12JvZmUl1NP-l9obyby5ZTuHiIx5A6Qw2x7kO_xlKJYS1mPI1Wre6v8Z7_8B7hu6R3dphCE9AfknKiXm6ODeXAHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:OmGfYox7sAX0EiOO31JlFU0oRWhUCZO0-lP4uGW9Scl5iV1VLFUZTA>
    <xmx:OmGfYvQmeISZB39E8_TVpxNxkdBHntJ8G1fHWbVWXb6Zd7tS25awRw>
    <xmx:OmGfYjZq_lvgGCdYvfG1SfEas8VOnHx0blW-HGp9s0V-SnI3-yGBiQ>
    <xmx:O2GfYmLsDkNRAvbkuyiREyx5_A87lHCipugx7yx9yLeQ646XL1EHkw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v1 08/10] IOMMU/AMD: wire common device reserved memory API
Date: Tue,  7 Jun 2022 16:30:14 +0200
Message-Id: <cd54972e6ffd7a6d98740cc9eb1c48ac94f422e8.1654612169.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
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

