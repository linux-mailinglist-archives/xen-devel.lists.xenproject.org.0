Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E720DCFEF65
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197012.1514696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWoI-0008Vu-9b; Wed, 07 Jan 2026 16:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197012.1514696; Wed, 07 Jan 2026 16:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWoI-0008Rm-4l; Wed, 07 Jan 2026 16:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1197012;
 Wed, 07 Jan 2026 16:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zi0g=7M=bounce.vates.tech=bounce-md_30504962.695e8fe0.v1-4b6fc8b114c14eb3aa834fc567d9a59e@srs-se1.protection.inumbo.net>)
 id 1vdWoG-0008Pk-HC
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:55:00 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98f3754a-ebe9-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 17:54:58 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4dmZ003Z0yzlfk13
 for <xen-devel@lists.xenproject.org>; Wed,  7 Jan 2026 16:54:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4b6fc8b114c14eb3aa834fc567d9a59e; Wed, 07 Jan 2026 16:54:56 +0000
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
X-Inumbo-ID: 98f3754a-ebe9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767804896; x=1768074896;
	bh=GaUw0s07s4BUFWE/xvZWFDAom+ukE1VoOC1T4wtN5q8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=x+Xb3K69hbuQW7YnvMdLTJNYJm8fF3sm6H2MO+ZVZqSrh7jRl2Qgj/N+Dv5BVqs5s
	 DkXmgmPtdlHYUUTlBwfMP1zTKgpUxc4v6ZohghNyq6EaRH+poyTVd7mEYFAYWhCtmu
	 hCi+IUHWfDXYy3MNlt5cfc8ZeyLGT7EqdoGz+7pY3BdBz8gdqKiA1RNdkb9QJir9k8
	 bLl/Ao2gzRH9busfvwBuL2P3+b6h+LaJK/u/BetvXEtxAsx2I7tCFNxqx7b67ugZYD
	 uT+9o4EnmKEeDc9bfV55ZKG9CR5YLrP1bMwvXVprsamsP8V4ZT2zeVIYFeENnIa5X9
	 k/gDTBZKn6R/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767804896; x=1768065396; i=teddy.astie@vates.tech;
	bh=GaUw0s07s4BUFWE/xvZWFDAom+ukE1VoOC1T4wtN5q8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NNKwyWi7me6a3GkyHeVCJi3aYdOuyppU1hG6cOKVVMrWHcslWdbovjGZXG8JF4oeF
	 f38FI34C+copDbvmpMuxWz5gkbb4/0Z05mNt3GKLL41LY2NgbYWvapGvRxrmAXHbB1
	 IFIWzFfcaSUV8DrHfR0ZS2WDp30bsPBVFIxte4nUTXjMLU6d2hg96bEOktbgqfHcZB
	 NorohMrlq/rh3g4CdKmR05/9YTBYA43G8NA+sDfk1LvG0yiCBo3q9eCrS3JUPkebs7
	 kgSuCDQ+97XG5mdZHKVeL/yBqfaYibEf5liczsZYZtSkwuFP5pDrKOwTyLr6z8QM58
	 7vq28euP6L7Aw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v1=202/2]=20x86/pci:=20Prefer=20using=20mmcfg=20for=20accessing=20configuration=20space?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767804895542
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <27c85c2cded576b3d5253c6e182e24341201c3ea.1767804090.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1767804090.git.teddy.astie@vates.tech>
References: <cover.1767804090.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4b6fc8b114c14eb3aa834fc567d9a59e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260107:md
Date: Wed, 07 Jan 2026 16:54:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Current logic prefer using CFC/CF8 and fallbacks on mmcfg when accessing
>255 registers or a non-zero segment. Change the logic to always rely
on mmcfg unless it is not available to avoid locking on pci_config_lock
if possible.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Are there x86 platforms where MMCFG is the only way to access PCI configuration space ?

 xen/arch/x86/x86_64/pci.c | 52 +++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
index 8d33429103..3b3df8014d 100644
--- a/xen/arch/x86/x86_64/pci.c
+++ b/xen/arch/x86/x86_64/pci.c
@@ -14,62 +14,56 @@
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
 {
     uint32_t value;
+    int ret = pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, &value);
 
-    if ( sbdf.seg || reg > 255 )
-    {
-        pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, &value);
-        return value;
-    }
+    if ( unlikely(ret == -ENODEV) && !sbdf.seg && reg <= 255 )
+        return pci_conf_read(PCI_CONF_ADDRESS(sbdf, reg), reg & 3, 1);
 
-    return pci_conf_read(PCI_CONF_ADDRESS(sbdf, reg), reg & 3, 1);
+    return value;
 }
 
 uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
 {
-    if ( sbdf.seg || reg > 255 )
-    {
-        uint32_t value;
+    uint32_t value;
+    int ret = pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 2, &value);
 
-        pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 2, &value);
-        return value;
-    }
+    if ( unlikely(ret == -ENODEV) && !sbdf.seg && reg <= 255 )
+        return pci_conf_read(PCI_CONF_ADDRESS(sbdf, reg), reg & 2, 2);
 
-    return pci_conf_read(PCI_CONF_ADDRESS(sbdf, reg), reg & 2, 2);
+    return value;
 }
 
 uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg)
 {
-    if ( sbdf.seg || reg > 255 )
-    {
-        uint32_t value;
+    uint32_t value;
+    int ret = pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 4, &value);
 
-        pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 4, &value);
-        return value;
-    }
+    if ( unlikely(ret == -ENODEV) && !sbdf.seg && reg <= 255 )
+        return pci_conf_read(PCI_CONF_ADDRESS(sbdf, reg), 0, 4);
 
-    return pci_conf_read(PCI_CONF_ADDRESS(sbdf, reg), 0, 4);
+    return value;
 }
 
 void pci_conf_write8(pci_sbdf_t sbdf, unsigned int reg, uint8_t data)
 {
-    if ( sbdf.seg || reg > 255 )
-        pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, data);
-    else
+    int ret = pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, data);
+
+    if ( unlikely(ret == -ENODEV) && !sbdf.seg && reg <= 255 )
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), reg & 3, 1, data);
 }
 
 void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg, uint16_t data)
 {
-    if ( sbdf.seg || reg > 255 )
-        pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 2, data);
-    else
+    int ret = pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 2, data);
+
+    if ( unlikely(ret == -ENODEV) && !sbdf.seg && reg <= 255 )
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), reg & 2, 2, data);
 }
 
 void pci_conf_write32(pci_sbdf_t sbdf, unsigned int reg, uint32_t data)
 {
-    if ( sbdf.seg || reg > 255 )
-        pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 4, data);
-    else
+    int ret = pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 4, data);
+
+    if ( unlikely(ret == -ENODEV) && !sbdf.seg && reg <= 255 )
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), 0, 4, data);
 }
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


