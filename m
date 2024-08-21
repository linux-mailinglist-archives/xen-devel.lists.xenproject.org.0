Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBC9591F4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 02:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780804.1190405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZZB-0008N9-G9; Wed, 21 Aug 2024 00:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780804.1190405; Wed, 21 Aug 2024 00:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgZZB-0008Le-Cx; Wed, 21 Aug 2024 00:51:13 +0000
Received: by outflank-mailman (input) for mailman id 780804;
 Wed, 21 Aug 2024 00:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfJ1=PU=kernel.org=gustavoars@srs-se1.protection.inumbo.net>)
 id 1sgZZA-0008LY-NZ
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 00:51:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ffe58fa-5f57-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 02:51:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DD8EECE0CDF;
 Wed, 21 Aug 2024 00:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72621C4AF12;
 Wed, 21 Aug 2024 00:50:59 +0000 (UTC)
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
X-Inumbo-ID: 6ffe58fa-5f57-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724201460;
	bh=MMIPR++xC4Kxl0qx3QpEQFYibLJHZ0WBuJz0u9FG8Ls=;
	h=Date:From:To:Cc:Subject:From;
	b=YGDaaMoBOcm195MUxo0J1sIHd3EI71AAyN4+WATK/dt4PTYWPWfVin3mMWBBp2dOf
	 vs/EMEUcopSmQQa2zLhzHID4prfpVvaR4QX5UyyiUQsU8pGvEv3tXXUw76dp+lQbj0
	 Q4fgMBqaFgD910RPClrfYLxCdBlTwyO/uwNb/aWWywPpimUQ6EGqeF4WGynK15UXUu
	 D4lSfQc+TVvfq4/YtNCSmha97fuWqE48x+LhvDYxMVHnDekjiDx2MC85kdCu52RIPm
	 RRBhVJO9X8R6MyFy6Q5oD6Zn1PGJX1Y4ARijGhafpemw57SG0/mOSHnysYCC7vc2wb
	 aEbX0FZ3RiIoQ==
Date: Tue, 20 Aug 2024 18:50:56 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] xen/pci: Avoid -Wflex-array-member-not-at-end warning
Message-ID: <ZsU58MvoYEEqBHZl@elsanto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with this, fix the following warning:

drivers/xen/pci.c:48:55: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/xen/pci.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
index 72d4e3f193af..a2facd8f7e51 100644
--- a/drivers/xen/pci.c
+++ b/drivers/xen/pci.c
@@ -44,15 +44,11 @@ static int xen_add_device(struct device *dev)
 	}
 #endif
 	if (pci_seg_supported) {
-		struct {
-			struct physdev_pci_device_add add;
-			uint32_t pxm;
-		} add_ext = {
-			.add.seg = pci_domain_nr(pci_dev->bus),
-			.add.bus = pci_dev->bus->number,
-			.add.devfn = pci_dev->devfn
-		};
-		struct physdev_pci_device_add *add = &add_ext.add;
+		DEFINE_RAW_FLEX(struct physdev_pci_device_add, add, optarr, 1);
+
+		add->seg = pci_domain_nr(pci_dev->bus);
+		add->bus = pci_dev->bus->number;
+		add->devfn = pci_dev->devfn;
 
 #ifdef CONFIG_ACPI
 		acpi_handle handle;
-- 
2.34.1


