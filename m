Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB66B879A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 02:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509409.785110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtWu-000080-7h; Tue, 14 Mar 2023 01:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509409.785110; Tue, 14 Mar 2023 01:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtWu-00006Z-3Q; Tue, 14 Mar 2023 01:32:44 +0000
Received: by outflank-mailman (input) for mailman id 509409;
 Tue, 14 Mar 2023 01:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bd48=7G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pbtWs-00006T-Hg
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 01:32:42 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17475a11-c208-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 02:32:36 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3BDFA320051E;
 Mon, 13 Mar 2023 21:32:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Mar 2023 21:32:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Mar 2023 21:32:32 -0400 (EDT)
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
X-Inumbo-ID: 17475a11-c208-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1678757553; x=1678843953; bh=V5F5tGjHJMm2rrUxvW+/d8NYL
	yB+FoR8qrVkarst4Fk=; b=lAtf86nzXnCilxINcvSCThmX38GqWJ9VeDjM4DHF+
	BGX4uYpKvMZErr2QYfdCK9hd7lFe5Hnl9DWWGchK+RjimNq1vonTE3BLw5PymntU
	wvspj7OsYTo8yy+mBF/woU6AflveyOxwkQgQSoSNK4lbgX+YILZDCwE0e7eVb5Q5
	UQ9iiD0DwFTDgREkDzwxfjxnTUrbH8yDJb3jcNleANZjZXwIMjrr6X550uEU8vyM
	n4LnG9C0HjFTlbueTK2Os9+H8xLsM6oq6BOwFbdwUVhhn+GajidDIG857RGciLoR
	OalmgMqWPualv2Sxw1v6mDN85Ch2RVf6sReexARKZoRCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1678757553; x=1678843953; bh=V
	5F5tGjHJMm2rrUxvW+/d8NYLyB+FoR8qrVkarst4Fk=; b=gR+ANuH4l/6O1VR6F
	QGeD/eG1pHD5gXkSr6EiLHCAUdtPfbrCoaqYNnojr9xVQ4Vny7PdSopTN+pA5u5m
	X2c2NMhJFsE7beEwp7ZpIYdYa9BPl6hzPGzTtPV2Or4fID+gjaVp4srhTTplbZ7M
	x8adFpQYyOAAtifkpx7DKKTl+mCmr/K23xSj6QACvAUZaGrsfPhQH4UdfEkCxNOC
	OqH12CQb5a846JVdGb9lpR5winIvbowEh5IJBHjSPlwz90BCNMqskZ9TMTjA5yoI
	QMRL0uuvCpz40i5HROOi75hdGoNSq5UEexI9mAtRouiL3/AQ2ZDVJty+Ncrr4M/J
	ziYRA==
X-ME-Sender: <xms:sc4PZPpAZujeTPcqzZXasAtVWON-Y1PdmzirVHUqAbodW8gObqj65A>
    <xme:sc4PZJpiWMwbTM1USUel76Wk-tTigf1TLStUO8HGF2rDFmkaaAAR9R-7ME-QOpmkJ
    c40n_ehmIdFfg>
X-ME-Received: <xmr:sc4PZMOvkNOko-3eGrijrHkZ_5dPbBytSE9x5Y2CbpGNB8snvpDzqK6PfBZXRLt3LQH2OekaBM0QRmnzpA-D3b9qV1Ab4rMguIgSoAaTwITwuSdenjXP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvhedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sc4PZC50K3llmm1nZLAXJ0sLGtuN_cAiPDWc488MeOKf71gDRUvXKg>
    <xmx:sc4PZO6Pjdw7da7mnu5Co2EDAeU06EHLaVZZ7RycALcgmvVu1oaaQw>
    <xmx:sc4PZKi45KtSi96bie-XNheUKRd-sugadE6pGvol7qUpgAs-C4GmPQ>
    <xmx:sc4PZDjiTM9vZmx6qNcU9vYxqiBCEa7U0JJrQsmWMBhCMv2iav2Xxw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2] IOMMU/VT-d: Fix iommu=no-igfx if the IOMMU scope contains phantom device
Date: Tue, 14 Mar 2023 02:32:21 +0100
Message-Id: <20230314013221.124930-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the scope for IGD's IOMMU contains additional device that doesn't
actually exist, iommu=no-igfx would not disable that IOMMU. In this
particular case (Thinkpad x230) it included
00:02.1, but there is no such device on this platform.
Consider only existing devices for "gfx only" check.

Fixes: 2d7f191b392e ("VT-d: generalize and correct "iommu=no-igfx" handling")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
 - move existence check one level up

I have looked at existence check acpi_parse_one_drhd(), but re-using
that one wouldn't work for two reasons:
 - gfx_only logic is very much tied to acpi_parse_dev_scope()
 - pci_device_detect() in acpi_parse_one_drhd() is skipped in case of
   (implicit or explicit) iommu=force
---
 xen/drivers/passthrough/vtd/dmar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 78c8bad1515a..a8c09c0c84f6 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -389,7 +389,7 @@ static int __init acpi_parse_dev_scope(
                 printk(VTDPREFIX " endpoint: %pp\n",
                        &PCI_SBDF(seg, bus, path->dev, path->fn));
 
-            if ( drhd )
+            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn) )
             {
                 if ( (seg == 0) && (bus == 0) && (path->dev == 2) &&
                      (path->fn == 0) )
-- 
2.39.2


