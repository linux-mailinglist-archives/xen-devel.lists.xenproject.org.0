Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D08AAA114
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 00:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976502.1363644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC4Wv-00040s-BW; Mon, 05 May 2025 22:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976502.1363644; Mon, 05 May 2025 22:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uC4Wv-0003yd-7n; Mon, 05 May 2025 22:43:21 +0000
Received: by outflank-mailman (input) for mailman id 976502;
 Mon, 05 May 2025 22:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mk45=XV=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1uC4Wt-0003yX-IM
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 22:43:19 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 561afd10-2a02-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 00:43:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3335E49CE9;
 Mon,  5 May 2025 22:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F3CC4CEF1;
 Mon,  5 May 2025 22:43:15 +0000 (UTC)
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
X-Inumbo-ID: 561afd10-2a02-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484996;
	bh=1rX1VygvKUtt1fWJvrpYXGnj2mNZwGwmHDPfH9Do8c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g5PP+AIhnTqpIR8E8rShkE+8WwTq89tcv3i6axFqB5+Kt8VXED7wpdCDhQ9VVcfnL
	 ejmSrXXsFCgCjypYJlbY/R2QMh9zoAWbG8GGgbNAPUkmrTGssUV4sCaa2aReNrVO9G
	 7om32qCqsbC2c5xwlLPa9iump10x6qRnKQYdh2AP0TVfeX5ijAx3lAnHqRwnciTlo2
	 93ZdD9GA6CfuraL8WpFxZ7SzhGyuXt0xnpgGzp+ZfRm85qQCAWGnaNrikO4ZtudhYG
	 N45G5FKuHENeKGsDs3vtteT8/XLvN5l2I2KdDWsHjboN95HzpCHaI1sD7zPVPBZ5l2
	 Av1mf3WSQuNOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.12 117/486] xen: Add support for XenServer 6.1 platform device
Date: Mon,  5 May 2025 18:33:13 -0400
Message-Id: <20250505223922.2682012-117-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Frediano Ziglio <frediano.ziglio@cloud.com>

[ Upstream commit 2356f15caefc0cc63d9cc5122641754f76ef9b25 ]

On XenServer on Windows machine a platform device with ID 2 instead of
1 is used.

This device is mainly identical to device 1 but due to some Windows
update behaviour it was decided to use a device with a different ID.

This causes compatibility issues with Linux which expects, if Xen
is detected, to find a Xen platform device (5853:0001) otherwise code
will crash due to some missing initialization (specifically grant
tables). Specifically from dmesg

    RIP: 0010:gnttab_expand+0x29/0x210
    Code: 90 0f 1f 44 00 00 55 31 d2 48 89 e5 41 57 41 56 41 55 41 89 fd
          41 54 53 48 83 ec 10 48 8b 05 7e 9a 49 02 44 8b 35 a7 9a 49 02
          <8b> 48 04 8d 44 39 ff f7 f1 45 8d 24 06 89 c3 e8 43 fe ff ff
          44 39
    RSP: 0000:ffffba34c01fbc88 EFLAGS: 00010086
    ...

The device 2 is presented by Xapi adding device specification to
Qemu command line.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Acked-by: Juergen Gross <jgross@suse.com>
Message-ID: <20250227145016.25350-1-frediano.ziglio@cloud.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/platform-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index 544d3f9010b92..1db82da56db62 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -26,6 +26,8 @@
 
 #define DRV_NAME    "xen-platform-pci"
 
+#define PCI_DEVICE_ID_XEN_PLATFORM_XS61	0x0002
+
 static unsigned long platform_mmio;
 static unsigned long platform_mmio_alloc;
 static unsigned long platform_mmiolen;
@@ -174,6 +176,8 @@ static int platform_pci_probe(struct pci_dev *pdev,
 static const struct pci_device_id platform_pci_tbl[] = {
 	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM,
 		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{PCI_VENDOR_ID_XEN, PCI_DEVICE_ID_XEN_PLATFORM_XS61,
+		PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
 	{0,}
 };
 
-- 
2.39.5


