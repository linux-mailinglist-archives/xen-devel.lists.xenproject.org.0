Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17B46ABB6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239893.415996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSd-0006RK-E2; Mon, 06 Dec 2021 22:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239893.415996; Mon, 06 Dec 2021 22:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSd-0006DR-1C; Mon, 06 Dec 2021 22:27:51 +0000
Received: by outflank-mailman (input) for mailman id 239893;
 Mon, 06 Dec 2021 22:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSZ-0001Vt-MY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:47 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcfaf114-56e3-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:27:47 +0100 (CET)
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
X-Inumbo-ID: bcfaf114-56e3-11ec-a5e1-b9374ead2679
Message-ID: <20211206210224.600351129@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=C4aqXfAyJVKaI/8MMq5VzC8OB/kEeYXdYvUuhO7tMOc=;
	b=o92QiOvGzQZzHfMpzPjv7r4xBNXDoXGJJvsICsdexRSxr3AhYBn+Fzw5huMDLf3tG2MlDP
	WPSsWv+ttwoXNCO+kVRoYtBXd2056cZn+SXvjveHEIGW4wLgMSNBAD+EM1KCcz3isX+VnT
	7oA+S94AQMnlPWXc6OAJe8Vh+beStrB/fVp0eysUbozportvEaGqCfzk+tSiRYaAb9ydmC
	tUqitzzV2rJq9he1vqAIx8of13iw8IY3uTwV+VW+qoDZuhKvoTgvmfg6uyCTUe4lGxMUHD
	D8um59x3FnVAH2aKssNe992rOhVmHhCOdInM7HatkhXksCk91x8Z5YuFrRqVxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=C4aqXfAyJVKaI/8MMq5VzC8OB/kEeYXdYvUuhO7tMOc=;
	b=1tAEn67IPG8WXGNZydrODGd+7PMJ5gxXdDqFiaHVsGUGG9TZGgvwu2VK3mH3VYJ+XD3fmr
	KDMRzr5BxWyF64CA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Cedric Le Goater <clg@kaod.org>,
 Juergen Gross <jgross@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 14/23] PCI/MSI: Make msix_update_entries() smarter
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:46 +0100 (CET)

No need to walk the descriptors and check for each one whether the entries
pointer function argument is NULL. Do it once.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -642,8 +642,8 @@ static void msix_update_entries(struct p
 {
 	struct msi_desc *entry;
 
-	for_each_pci_msi_entry(entry, dev) {
-		if (entries) {
+	if (entries) {
+		for_each_pci_msi_entry(entry, dev) {
 			entries->vector = entry->irq;
 			entries++;
 		}


