Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Cq1RA5EwnmlNUAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 00:13:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F618E1AB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 00:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240317.1541747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv1Zs-00010R-8w; Tue, 24 Feb 2026 23:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240317.1541747; Tue, 24 Feb 2026 23:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vv1Zs-0000yW-5y; Tue, 24 Feb 2026 23:12:28 +0000
Received: by outflank-mailman (input) for mailman id 1240317;
 Tue, 24 Feb 2026 23:12:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZAD=A4=ariadne.space=ariadne@srs-se1.protection.inumbo.net>)
 id 1vv1Zq-0000yQ-PJ
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 23:12:26 +0000
Received: from hermes.ariadne.space (hermes.ariadne.space [149.248.47.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46bbf3be-11d6-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 00:12:24 +0100 (CET)
Received: from helios (unknown [100.74.42.12])
 by hermes.ariadne.space (Postfix) with ESMTP id 5A65D2685AB;
 Tue, 24 Feb 2026 23:12:22 +0000 (UTC)
Received: from phoebe.taild41b8.ts.net (unknown [172.19.0.1])
 by helios (Postfix) with ESMTPSA id 4D34216000D707;
 Tue, 24 Feb 2026 23:12:22 +0000 (UTC)
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
X-Inumbo-ID: 46bbf3be-11d6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ariadne.space;
	s=dkim; t=1771974742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8V2La6Men6eXkqMSn0jYq+fe6TyrquuJznUHMk/qitc=;
	b=OGd4h3N5k3l0eL03XMTn4dBdfGmspN1HdTecg12lzbQzS0dXnb0K8Gb7t8dctm7sisbS8r
	CQ68faHuJqzY3NOTTfagaY7PQOA/97D3PX7lnpD+0ZdRYKv1CSzG9RpQAGMG/DW1R5jEGh
	e7r9RjItngnsYPbh13v2nw91L+yWfTI=
From: Ariadne Conill <ariadne@ariadne.space>
To: xen-devel@lists.xenproject.org
Cc: Ariadne Conill <ariadne@ariadne.space>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Steven Noonan <steven@edera.dev>
Subject: [PATCH] xen/vpci: zero guest-visible BAR addresses to ensure domU asssigns its own
Date: Tue, 24 Feb 2026 15:12:15 -0800
Message-ID: <20260224231216.6203-1-ariadne@ariadne.space>
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
X-Rspamd-Queue-Id: 921F618E1AB
X-Rspamd-Action: no action

From: Steven Noonan <steven@edera.dev>

If we just use the host's BAR addresses, the domU might not attempt to
reconfigure the BAR ranges and may never try to map them with the IOMMU.
Zeroing them ensures the guest kernel knows the BARs are not configured
and needs to make its own choices about where to map the BARs.

Signed-off-by: Steven Noonan <steven@edera.dev>
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 xen/drivers/vpci/header.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 739a5f610e..852dfd8ae3 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -1011,7 +1011,7 @@ int vpci_init_header(struct pci_dev *pdev)
         }
 
         bars[i].addr = addr;
-        bars[i].guest_addr = addr;
+        bars[i].guest_addr = is_hwdom ? addr : 0;
         bars[i].size = size;
         bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
 
@@ -1034,7 +1034,7 @@ int vpci_init_header(struct pci_dev *pdev)
         rom->type = VPCI_BAR_ROM;
         rom->size = size;
         rom->addr = addr;
-        rom->guest_addr = addr;
+        rom->guest_addr = is_hwdom ? addr : 0;
         header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
                               PCI_ROM_ADDRESS_ENABLE;
 
-- 
2.53.0


