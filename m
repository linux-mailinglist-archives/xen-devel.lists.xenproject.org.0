Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DDD8C7816
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723363.1128200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7beA-0007nj-05; Thu, 16 May 2024 13:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723363.1128200; Thu, 16 May 2024 13:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be9-0007kG-Rl; Thu, 16 May 2024 13:59:49 +0000
Received: by outflank-mailman (input) for mailman id 723363;
 Thu, 16 May 2024 13:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be7-0005tl-Gu
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:47 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d0b9a40-138c-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:59:46 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 46BA51140163;
 Thu, 16 May 2024 09:59:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 May 2024 09:59:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:44 -0400 (EDT)
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
X-Inumbo-ID: 8d0b9a40-138c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867985; x=1715954385; bh=i0tm0hLqA8
	ZLzyhanisejpktcCRo0bXMjTCqyw0gS+4=; b=c+7KzSezfvynmGBLoAmYd+WTzm
	6Eo7ZAqWKL10udGCmQnv0LPk46g+EJiDfycE5Y1eSsJ04LaABvlGo20C2K4K106E
	csJDxEnM2QQZvviBMBbh1V8dRAnNgxY/1ZqwNkPB9ktA6I+bs8Xt0ZJfAmx/JftK
	QW+vQlbaye3hJ0sDB2nDnJNOmRjjVLAJ/ZwktGZcXLnHUcUTqBE7LxoFoD63N6r2
	+KxTsI6hneuNhEgbWx9R+fvZZR42j6bg2IDy3xpS0jKpL7gtiv4YJoiQzvlxO/V4
	B/GS85GqAg3JnKefGi3gs1Du+c7T06SSBAVG31pHF5yadUKhSX7RnGIY/nrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867985; x=
	1715954385; bh=i0tm0hLqA8ZLzyhanisejpktcCRo0bXMjTCqyw0gS+4=; b=K
	08V5F5EbgXuDdcOHoGgBxEk0szGPAhh9I5EUblwRDQy+eoo+LzPnD3UTckbiZu09
	QDrZi/774q0lBut6vTjZE4lz48pyZdyq07nK1WvVNn9okEoMh9/nNDps++M+M+Ic
	myiLzxLLyklVB39B2CogGJ9AeqPXL5fz6zU3B2kFE2Iv3nRUdfc14t2k78oN3gjD
	86Xzz/hSH1rLW8fDbx7Ajdh1de/CCmTmP2yV4zhtahVtgi6jepRO1UyG76Jd3KLS
	bWrbIsKChgP3j7hhGsZWmNYgKzlYM+jke9s/qe01U85/JolXr3W/I+l9YZYrAoV2
	2Xy8gGKG6gZ0SGtPEYjBw==
X-ME-Sender: <xms:UBFGZqHaAJf9PhvLyW3Y7WrB5gYi3IlxiwTaNllysIrUDWIRmnWLkg>
    <xme:UBFGZrXYK4IiN_qU0nIeWYdqnpofSCfgRor4s5xjJeM9j4O9SePu3Px09BEkcinKh
    ksMaocrmsf1ig>
X-ME-Received: <xmr:UBFGZkI7moV1pKWgal91L19OClOnSMBgJfPOAIzWqwLtyCpztvT9ROMsVEL8dKrpNmeGZPE8SBNvQprJyX-NwIwFjtHxPMpa4PycEbdjtWgqBwNl1SA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:URFGZkHzo5XiLHxifXOswET2_AifUan_9W_FgQ64Mcm3EqjkblmTpA>
    <xmx:URFGZgW9it1-Xqi1JzwMPC7HPztPgDVCev0DyoLlTLjfhXfkb5d67g>
    <xmx:URFGZnOVZxGqk3AKhkBRp8iPS0aNtRkRy8yGUUWGBApgp712Lk927A>
    <xmx:URFGZn2FAWwISqFzZZQxnpwLquN4-SQfFhSebICN44Tkvg3Y4AK8wA>
    <xmx:URFGZnQWdIAcx4KpH1NHdSdrZPv3-y-wT3hjlT78rNxYjlc4DH9WPI6D>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 07/12] libxl: Allow stubdomain to control interupts of PCI device
Date: Thu, 16 May 2024 15:58:28 +0200
Message-ID: <aeba05a5ec7a0657217933f165ee0ac7e86e1b1b.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Especially allow it to control MSI/MSI-X enabling bits. This part only
writes a flag to a sysfs, the actual implementation is on the kernel
side.

This requires Linux >= 5.10 in dom0 (or relevant patch backported).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/light/libxl_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da0794e..6f357b70b815 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1513,6 +1513,14 @@ static void pci_add_dm_done(libxl__egc *egc,
             rc = ERROR_FAIL;
             goto out;
         }
+    } else if (libxl_is_stubdom(ctx, domid, NULL)) {
+        /* Allow acces to MSI enable flag in PCI config space for the stubdom */
+        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/allow_interrupt_control",
+                             pci) < 0 ) {
+            LOGD(ERROR, domainid, "Setting allow_interrupt_control for device");
+            rc = ERROR_FAIL;
+            goto out;
+        }
     }
 
 out_no_irq:
-- 
git-series 0.9.1

