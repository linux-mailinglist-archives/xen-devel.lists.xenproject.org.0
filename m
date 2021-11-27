Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C82245F7E8
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233597.405424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMp-00071M-EW; Sat, 27 Nov 2021 01:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233597.405424; Sat, 27 Nov 2021 01:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMp-0006g3-0h; Sat, 27 Nov 2021 01:19:03 +0000
Received: by outflank-mailman (input) for mailman id 233597;
 Sat, 27 Nov 2021 01:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMk-0002cc-Sq
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:18:58 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe7aa13e-4f1f-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:18:58 +0100 (CET)
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
X-Inumbo-ID: fe7aa13e-4f1f-11ec-b941-1df2895da90e
Message-ID: <20211126223824.914161382@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HvFnLhSNQWkY7FyV6dqkmiDpk27hPnt+iT7sMKioVYY=;
	b=S54cLFbDUKq5nFn79t2f2+gRu/qeyK47uzVuwGG/moNnGbWQ4ZXxrGLGZV0feqpma6dc8c
	tOmoQ3dSStV4MaqLjWDZXKaaGyCwX7m94K4qqRySR0BCHLTvcjw3G47NJ26H+hsoAdCwsM
	cv+9tx7mmof5+QOUdVY/+1T0cNRVxXwhPtyxroAGiNse2fIX1QlrCzLeu3Jfd74tKTTftr
	gZ6ccrLlloBq2oYXiRYcEnr5LUlrJVQ+CWtNb1ATwviM4hfbaAFMfb8iZfk/cGVc9v3d10
	WklJDWGfj+DFOMLZ5ka3pAgMhNG2Zn0Csvy5rIU6a0UpiSNBS1+AmB0BnCVaZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=HvFnLhSNQWkY7FyV6dqkmiDpk27hPnt+iT7sMKioVYY=;
	b=TDa4ILzwayLrgVPnZsKOtHgUePuy50wAzaCSVtRqj9WSzHaJh3r5YZZigx7IJQ0xPWCSIA
	LZRjcdcylCSboTCA==
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 14/22] PCI/MSI: Make msix_update_entries() smarter
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:56 +0100 (CET)

No need to walk the descriptors and check for each one whether the entries
pointer function argument is NULL. Do it once.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
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


