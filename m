Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ3jAJEwnmk/UAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 00:13:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9224218E1AC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 00:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240326.1541767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv1aO-0001iq-OS; Tue, 24 Feb 2026 23:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240326.1541767; Tue, 24 Feb 2026 23:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv1aO-0001fo-Ky; Tue, 24 Feb 2026 23:13:00 +0000
Received: by outflank-mailman (input) for mailman id 1240326;
 Tue, 24 Feb 2026 23:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZAD=A4=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vv1aN-0000yQ-Dw
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 23:12:59 +0000
Received: from hermes.ariadne.space (hermes.ariadne.space
 [2001:19f0:8001:704:5400:5ff:fe8c:fac5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a80c110-11d6-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 00:12:58 +0100 (CET)
Received: from helios (unknown [100.74.42.12])
 by hermes.ariadne.space (Postfix) with ESMTP id 6D17A2685B4;
 Tue, 24 Feb 2026 23:12:55 +0000 (UTC)
Received: from phoebe.taild41b8.ts.net (unknown [172.19.0.1])
 by helios (Postfix) with ESMTPSA id 66F4216000D707;
 Tue, 24 Feb 2026 23:12:55 +0000 (UTC)
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
X-Inumbo-ID: 5a80c110-11d6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=dkim; t=1771974775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SFbO8S6kahHkVMcy8JXpfMeiRBJODD3mjCpF+ZaBOXY=;
	b=a5j6prDMV454T99JO2AWQz9UNosw+0WnO5ptwI7XWfoAJWWeiy5xT6YBz6yah7TeG7KNrh
	crSk3OrWTxXYyDqpH9/0crRGlR7fUG4CZVHAFX+fLY7cAEgP2wW6rX9JVFotwhL+LSk8dC
	Gh69Ep//h9amRY9/tEjLGQCaZs0ks0w=
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Steven Noonan <steven@edera.dev>
Subject: [PATCH] xen/vpci: automatically use iomem_permit_access for PCI device BARs
Date: Tue, 24 Feb 2026 15:12:48 -0800
Message-ID: <20260224231249.6327-1-ariadne@ariadne.space>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ariadne.space,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ariadne.space:s=dkim];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ariadne@ariadne.space,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ariadne@ariadne.space,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:steven@edera.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[edera.dev:email,ariadne.space:mid,ariadne.space:dkim,ariadne.space:email];
	FROM_NEQ_ENVFROM(0.00)[ariadne@ariadne.space,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ariadne.space:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9224218E1AC
X-Rspamd-Action: no action

From: Steven Noonan <steven@edera.dev>

With vPCI, you shouldn't need to use xen-pciback for the device, so the
memory access permissions need to be defined somewhere. This allows vPCI
to automatically define the access permissions so that the domU can map
the BARs via IOMMU.

Signed-off-by: Steven Noonan <steven@edera.dev>
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 xen/drivers/vpci/header.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1f930b2a1f..ad3c09667f 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -1017,6 +1017,18 @@ int vpci_init_header(struct pci_dev *pdev)
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
 
+        if ( !is_hwdom )
+        {
+            int rc = iomem_permit_access(pdev->domain,
+                                        PFN_DOWN(addr),
+                                        PFN_DOWN(addr + size - 1));
+            if ( rc )
+            {
+                printk(XENLOG_WARNING "Failed to grant MMIO access for BAR%d: %d\n", i, rc);
+                goto fail;
+            }
+        }
+
         rc = vpci_add_register(pdev->vpci,
                                is_hwdom ? vpci_hw_read32 : guest_mem_bar_read,
                                is_hwdom ? bar_write : guest_mem_bar_write,
@@ -1040,6 +1052,18 @@ int vpci_init_header(struct pci_dev *pdev)
         header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
                               PCI_ROM_ADDRESS_ENABLE;
 
+        if ( !is_hwdom )
+        {
+            int rc = iomem_permit_access(pdev->domain,
+                                        PFN_DOWN(addr),
+                                        PFN_DOWN(addr + size - 1));
+            if ( rc )
+            {
+                printk(XENLOG_WARNING "Failed to grant MMIO access for ROM BAR: %d\n", rc);
+                goto fail;
+            }
+        }
+
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
                                4, rom);
         if ( rc )
-- 
2.53.0


