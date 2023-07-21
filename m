Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E675C6BF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 14:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567506.886640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMp42-0004BK-RY; Fri, 21 Jul 2023 12:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567506.886640; Fri, 21 Jul 2023 12:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMp42-00048j-Ow; Fri, 21 Jul 2023 12:16:54 +0000
Received: by outflank-mailman (input) for mailman id 567506;
 Fri, 21 Jul 2023 12:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pf5t=DH=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qMp41-00048d-3u
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 12:16:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 78750575-27c0-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 14:16:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FFD12F4;
 Fri, 21 Jul 2023 05:17:33 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C6EF3F6C4;
 Fri, 21 Jul 2023 05:16:49 -0700 (PDT)
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
X-Inumbo-ID: 78750575-27c0-11ee-b23a-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Date: Fri, 21 Jul 2023 13:16:27 +0100
Message-Id: <20230721121627.1229906-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux commit 33629d35090f5ce2b1b4ce78aa39954c603536d5 has
removed the 'snps,dwc-ahci' compatible from the generic
AHCI-platform driver control module selected by
CONFIG_SATA_AHCI_PLATFORM.

A new driver, the DWC AHCI SATA platform driver is now implemented
and handles the above compatible when CONFIG_AHCI_DWC is selected.

The module is needed for the Arndale board to have the SATA controller
working, so enable the CONFIG_AHCI_DWC as additional kconfig parameter
in ts-kernel-build.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Tested successfully on:
 - arndale-lakeside
 - arndale-metrocentre
 - arndale-westfield

arndale-bluewater must have some HW issue, don't have much more info ATM.
---
 ts-kernel-build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-kernel-build b/ts-kernel-build
index 6c8f1d6a..73104874 100755
--- a/ts-kernel-build
+++ b/ts-kernel-build
@@ -245,6 +245,7 @@ setopt CONFIG_SENSORS_LM90 n
 setopt CONFIG_ICS932S401 n
 
 # Enable some additional drivers for Arndale.
+setopt CONFIG_AHCI_DWC y
 setopt CONFIG_PHY_EXYNOS5250_SATA m
 setopt CONFIG_USB_EHCI_EXYNOS m
 setopt CONFIG_USB_OHCI_EXYNOS m
-- 
2.20.1


