Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B6356EE7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 16:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106710.204039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9Iv-0000IV-0R; Wed, 07 Apr 2021 14:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106710.204039; Wed, 07 Apr 2021 14:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9Iu-0000I6-TJ; Wed, 07 Apr 2021 14:37:12 +0000
Received: by outflank-mailman (input) for mailman id 106710;
 Wed, 07 Apr 2021 14:37:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU9Is-0000I0-P0
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 14:37:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad8feeeb-105d-4109-9eac-9139ac9511ca;
 Wed, 07 Apr 2021 14:37:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FC69B02B;
 Wed,  7 Apr 2021 14:37:08 +0000 (UTC)
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
X-Inumbo-ID: ad8feeeb-105d-4109-9eac-9139ac9511ca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617806228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVTfOHZt+5GTfUvqHRoOkSW+lbhVxEv08w2Zo444uTE=;
	b=dxVMt1/MVxgxezDMjlgFkrsbkJzJf8KChJcL8kJJ1zHCy9qoOD2zfpNADajoT/Nr6KBjwo
	K0ayqSBdIFgYfl9hZ9vTy5u6JM/xcbZj9wo5X0WIqG9Pyr+x7WN8/bP6o7YxOckCBKkQda
	sP/6d+ZqCyE66qO8kJHMEj3IqxxEmlg=
Subject: [PATCH 1/3] xen-pciback: redo VF placement in the virtual topology
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Wilk <konrad.wilk@oracle.com>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
Message-ID: <32d6a8d4-c06f-7fe0-1376-4b80fac8c6de@suse.com>
Date: Wed, 7 Apr 2021 16:37:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The commit referenced below was incomplete: It merely affected what
would get written to the vdev-<N> xenstore node. The guest would still
find the function at the original function number as long as 
__xen_pcibk_get_pci_dev() wouldn't be in sync. The same goes for AER wrt
__xen_pcibk_get_pcifront_dev().

Undo overriding the function to zero and instead make sure that VFs at
function zero remain alone in their slot. This has the added benefit of
improving overall capacity, considering that there's only a total of 32
slots available right now (PCI segment and bus can both only ever be
zero at present).

Fixes: 8a5248fe10b1 ("xen PV passthru: assign SR-IOV virtual functions to separate virtual slots")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: stable@vger.kernel.org
---
Like the original change this has the effect of changing where devices
would appear in the guest, when there are multiple of them. I don't see
an immediate problem with this, but if there is we may need to reduce
the effect of the change.
Taking into account, besides the described breakage, how xen-pcifront's
pcifront_scan_bus() works, I also wonder what problem it was in the
first place that needed fixing. It may therefore also be worth to
consider simply reverting the original change.

--- a/drivers/xen/xen-pciback/vpci.c
+++ b/drivers/xen/xen-pciback/vpci.c
@@ -70,7 +70,7 @@ static int __xen_pcibk_add_pci_dev(struc
 				   struct pci_dev *dev, int devid,
 				   publish_pci_dev_cb publish_cb)
 {
-	int err = 0, slot, func = -1;
+	int err = 0, slot, func = PCI_FUNC(dev->devfn);
 	struct pci_dev_entry *t, *dev_entry;
 	struct vpci_dev_data *vpci_dev = pdev->pci_dev_data;
 
@@ -95,22 +95,25 @@ static int __xen_pcibk_add_pci_dev(struc
 
 	/*
 	 * Keep multi-function devices together on the virtual PCI bus, except
-	 * virtual functions.
+	 * that we want to keep virtual functions at func 0 on their own. They
+	 * aren't multi-function devices and hence their presence at func 0
+	 * may cause guests to not scan the other functions.
 	 */
-	if (!dev->is_virtfn) {
+	if (!dev->is_virtfn || func) {
 		for (slot = 0; slot < PCI_SLOT_MAX; slot++) {
 			if (list_empty(&vpci_dev->dev_list[slot]))
 				continue;
 
 			t = list_entry(list_first(&vpci_dev->dev_list[slot]),
 				       struct pci_dev_entry, list);
+			if (t->dev->is_virtfn && !PCI_FUNC(t->dev->devfn))
+				continue;
 
 			if (match_slot(dev, t->dev)) {
 				dev_info(&dev->dev, "vpci: assign to virtual slot %d func %d\n",
-					 slot, PCI_FUNC(dev->devfn));
+					 slot, func);
 				list_add_tail(&dev_entry->list,
 					      &vpci_dev->dev_list[slot]);
-				func = PCI_FUNC(dev->devfn);
 				goto unlock;
 			}
 		}
@@ -123,7 +126,6 @@ static int __xen_pcibk_add_pci_dev(struc
 				 slot);
 			list_add_tail(&dev_entry->list,
 				      &vpci_dev->dev_list[slot]);
-			func = dev->is_virtfn ? 0 : PCI_FUNC(dev->devfn);
 			goto unlock;
 		}
 	}


