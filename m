Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB885AABC
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 19:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683045.1062369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8CK-0001tP-3E; Mon, 19 Feb 2024 18:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683045.1062369; Mon, 19 Feb 2024 18:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8CJ-0001rr-WA; Mon, 19 Feb 2024 18:17:00 +0000
Received: by outflank-mailman (input) for mailman id 683045;
 Mon, 19 Feb 2024 18:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP9f=J4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rc8CI-0001rg-Gu
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 18:16:58 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f53f2dc-cf53-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 19:16:55 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 722FE3200922;
 Mon, 19 Feb 2024 13:16:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 19 Feb 2024 13:16:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Feb 2024 13:16:50 -0500 (EST)
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
X-Inumbo-ID: 0f53f2dc-cf53-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1708366611; x=1708453011; bh=Uo8NGN15Y+wR+Mg2EFtNRg5h410lOfUh
	X9FiMUkUpNM=; b=ePuwMlpkFCfcozI+MhZqTBm/Dg8ocqkEHLyQsWztZqNGpe9s
	nCqPrTjcFqSoUCgm04bnW1Yymew4DGgov8d55FlgtUzGeq5mFqkbCDDdPb74gbRb
	8181nh6MIynBD3h22iGeiLurm0BK3Xcb/FMpihuMHPK2n52+7z4J0t7c98jcLFch
	wqcQDmy/iUeSLMYlPzTc1EtYqrrfflSGCg+UZgLG5GdUPO9badV6jAKGmfTCa7iX
	KCsn/kiovcGBl2CXn2PHaEDDynOt/ncBEThP+jYpdzujAkLb4AqhG+sVC887CwWl
	o2XERoGrbgTVPWr6Dte/6tYGLYUCGZFw2fM+9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1708366611; x=1708453011; bh=Uo8NGN15Y+wR+
	Mg2EFtNRg5h410lOfUhX9FiMUkUpNM=; b=NwiBHl2JlPG4RfBLrLc3Di0dZEGVk
	1sxrKKmwlUQgPG5xaTShd7X6H56R1Ug/GnCCGIZU1P3qBwgQrb3IP1eEchGYJ5c8
	WqeXs9YER/iDyHtzeySPS/sZsXeEwJl1p0sL5z7Qg6tMk9QoWnO1Rovw6reHREUz
	r5/WwlnAPPVlNWqlVCT05NuUaz1FKPbhaLFaOjhJSOhkqVddHZlrUB1hYRzc/qk2
	Oc2EAiiC46G+AQ1WZRQ+dzeJgfAjr1C7gk+8AdJTjg0rwVNqyBqCDoDm7hoDKrw0
	yo5oRXjabMXLNexRNy8Lh3dkxT9NadIWrz5jse8jAGD+gmTFCOIdvnf0Q==
X-ME-Sender: <xms:E5vTZfqMG8b-uLaFuCcGyr3VfYk09m_3_nyKYJJsNy-dLZZOuQcjcg>
    <xme:E5vTZZq-0ST2NthJrPCm1Yh5tCuFztXwviIqJ9s1Dw-pxYbGfzdDMZjS2SuBLAbdF
    uRJ5_ysYr9etg>
X-ME-Received: <xmr:E5vTZcPb5FccXDpLCin3inCl0UXD9OP6FeWVQUtBIpUY2FBK6V57og2HDpI3e3s4pdipexfHOunEGZnoUlCh6WX74CzlkqbIQOCAWPUrN4yWus9DQbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:E5vTZS4wigD3HxxyaUXVa3yrppnf2lVQzErSE97wvRlJ51bq0Oz4tA>
    <xmx:E5vTZe6by-yFSfjQZqBAdQM-IPOa9iatqsDrOjZRjjr_zCrKbYxjyw>
    <xmx:E5vTZajUF2XL490zVSESdjVosKLRrVwYEAqNkzY8vDbh-qqhjcVG4w>
    <xmx:E5vTZZ3vBlgtfMM6kfe-6PiIL-_US0XMQeXbwFkeQvjM4BfuFO71ww>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 1/2] hw/xen: detect when running inside stubdomain
Date: Mon, 19 Feb 2024 19:16:05 +0100
Message-ID: <20240219181627.282097-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce global xen_is_stubdomain variable when qemu is running inside
a stubdomain instead of dom0. This will be relevant for subsequent
patches, as few things like accessing PCI config space need to be done
differently.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 hw/xen/xen-legacy-backend.c | 15 +++++++++++++++
 include/hw/xen/xen.h        |  1 +
 system/globals.c            |  1 +
 3 files changed, 17 insertions(+)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 124dd5f3d6..4a09ea2561 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -603,6 +603,19 @@ static void xen_set_dynamic_sysbus(void)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
 }
 
+static bool xen_check_stubdomain(void)
+{
+    char *dm_path = g_strdup_printf("/local/domain/%d/image", xen_domid);
+    uint32_t dm_domid;
+    bool is_stubdom = false;
+
+    if (!xenstore_read_int(dm_path, "device-model-domid", &dm_domid))
+        is_stubdom = dm_domid != 0;
+
+    g_free(dm_path);
+    return is_stubdom;
+}
+
 void xen_be_init(void)
 {
     xenstore = qemu_xen_xs_open();
@@ -616,6 +629,8 @@ void xen_be_init(void)
         exit(1);
     }
 
+    xen_is_stubdomain = xen_check_stubdomain();
+
     xen_sysdev = qdev_new(TYPE_XENSYSDEV);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
     xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 37ecc91fc3..ecb89ecfc1 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -36,6 +36,7 @@ enum xen_mode {
 extern uint32_t xen_domid;
 extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
+extern bool xen_is_stubdomain;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
diff --git a/system/globals.c b/system/globals.c
index b6d4e72530..ac27d88bd4 100644
--- a/system/globals.c
+++ b/system/globals.c
@@ -62,6 +62,7 @@ bool qemu_uuid_set;
 uint32_t xen_domid;
 enum xen_mode xen_mode = XEN_DISABLED;
 bool xen_domid_restrict;
+bool xen_is_stubdomain;
 struct evtchn_backend_ops *xen_evtchn_ops;
 struct gnttab_backend_ops *xen_gnttab_ops;
 struct foreignmem_backend_ops *xen_foreignmem_ops;
-- 
2.43.0


