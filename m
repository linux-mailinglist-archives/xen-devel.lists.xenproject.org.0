Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A5904F6F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739063.1145996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKTu-0003Nj-6Q; Wed, 12 Jun 2024 09:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739063.1145996; Wed, 12 Jun 2024 09:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKTu-0003Kx-3U; Wed, 12 Jun 2024 09:41:26 +0000
Received: by outflank-mailman (input) for mailman id 739063;
 Wed, 12 Jun 2024 09:24:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V2Vf=NO=nfschina.com=zeming@srs-se1.protection.inumbo.net>)
 id 1sHKDz-0007J8-3Z
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:24:59 +0000
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by se1-gles-flk1.inumbo.com (Halon) with SMTP
 id a0d21b7e-289d-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 11:24:55 +0200 (CEST)
Received: from localhost.localdomain (unknown [219.141.250.2])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 96FED60230176;
 Wed, 12 Jun 2024 17:24:49 +0800 (CST)
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
X-Inumbo-ID: a0d21b7e-289d-11ef-b4bb-af5377834399
X-MD-Sfrom: zeming@nfschina.com
X-MD-SrcIP: 219.141.250.2
From: Li zeming <zeming@nfschina.com>
To: jgross@suse.com,
	bhelgaas@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: [PATCH] =?UTF-8?q?x86:=20pci:=20xen:=20Remove=20unnecessary=20?= =?UTF-8?q?=E2=80=980=E2=80=99=20values=20from=20ret?=
Date: Wed, 12 Jun 2024 17:24:06 +0800
Message-Id: <20240612092406.39007-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ret is assigned first, so it does not need to initialize the assignment.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 arch/x86/pci/xen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 652cd53e77f6..67cb9dc9b2e7 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -267,7 +267,7 @@ static bool __read_mostly pci_seg_supported = true;
 
 static int xen_initdom_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
-	int ret = 0;
+	int ret;
 	struct msi_desc *msidesc;
 
 	msi_for_each_desc(msidesc, &dev->dev, MSI_DESC_NOTASSOCIATED) {
@@ -353,7 +353,7 @@ static int xen_initdom_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 
 bool xen_initdom_restore_msi(struct pci_dev *dev)
 {
-	int ret = 0;
+	int ret;
 
 	if (!xen_initial_domain())
 		return true;
-- 
2.18.2


