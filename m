Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B326C387D27
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129425.242936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2Lq-0000fk-23; Tue, 18 May 2021 16:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129425.242936; Tue, 18 May 2021 16:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2Lp-0000dY-UU; Tue, 18 May 2021 16:13:45 +0000
Received: by outflank-mailman (input) for mailman id 129425;
 Tue, 18 May 2021 16:13:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lj2Lo-0000dE-Ki
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:13:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f83cbe19-95fc-4c38-b49a-355a1957fb1b;
 Tue, 18 May 2021 16:13:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C605AB020;
 Tue, 18 May 2021 16:13:42 +0000 (UTC)
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
X-Inumbo-ID: f83cbe19-95fc-4c38-b49a-355a1957fb1b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621354422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVTfOHZt+5GTfUvqHRoOkSW+lbhVxEv08w2Zo444uTE=;
	b=iEqxJpQLu0ZIQx4U0CyNmVw7WjftF8ZLl6GpUil/nIg+X+4SOMWbBwS4UEQj8FFAqUdzsY
	XdA3Nh7xHNo1veHXHHEGFXiRT79nujhokYmlqGlcYv+k5k/uwt/G+EhakiEHzRRkDklYKS
	/JwR5pffR9UpeZ8DiWJ/DChfrk+zCao=
Subject: [PATCH v2 1/2] xen-pciback: redo VF placement in the virtual topology
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Wilk <konrad.wilk@oracle.com>
References: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
Message-ID: <8def783b-404c-3452-196d-3f3fd4d72c9e@suse.com>
Date: Tue, 18 May 2021 18:13:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
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


