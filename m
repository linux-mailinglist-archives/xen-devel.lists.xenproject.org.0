Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD632D0E24
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46196.81976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDum-0008KE-74; Mon, 07 Dec 2020 10:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46196.81976; Mon, 07 Dec 2020 10:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDum-0008Jp-3o; Mon, 07 Dec 2020 10:38:44 +0000
Received: by outflank-mailman (input) for mailman id 46196;
 Mon, 07 Dec 2020 10:38:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDuk-0008JN-0g
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:38:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36e9e0d0-0900-4a11-ba07-6623289f4d0a;
 Mon, 07 Dec 2020 10:38:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F00DAAC90;
 Mon,  7 Dec 2020 10:38:39 +0000 (UTC)
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
X-Inumbo-ID: 36e9e0d0-0900-4a11-ba07-6623289f4d0a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607337520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMaRwYz5dvWjnaq+mpxQL4O/edeAvh/v0+ETeYdF/Bs=;
	b=k52pv2vR8IpMuzkQozOyWQFM7qLtIAIPtOoBi3rDcDplqXnRKOu3hn3IUS7BWcV3Y5QNQJ
	+XyDanG+NWa9lyAcf5knGIkZieajrFi+GZ4O+/8YMe8ceApkfWnfEjanKygngouvO1knNn
	fFL1D8wVpoPsrWFCQWYv5vrM+yFmMNI=
Subject: [PATCH 5/5] vPCI/MSI-X: tidy init_msix()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Message-ID: <e21e4936-f356-8c8e-845d-d60880a58ed4@suse.com>
Date: Mon, 7 Dec 2020 11:38:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

First of all introduce a local variable for the to be allocated struct.
The compiler can't CSE all the occurrences (I'm observing 80 bytes of
code saved with gcc 10). Additionally, while the caller can cope and
there was no memory leak, globally "announce" the struct only once done
initializing it. This also removes the dependency of the function on
the caller cleaning up after it in case of an error.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was heavily tempted to also move up the call to vpci_add_register(),
such that there would be no pointless init done in case of an error
coming back from there.

--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -436,6 +436,7 @@ static int init_msix(struct pci_dev *pde
     uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     unsigned int msix_offset, i, max_entries;
     uint16_t control;
+    struct vpci_msix *msix;
     int rc;
 
     msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
@@ -447,34 +448,37 @@ static int init_msix(struct pci_dev *pde
 
     max_entries = msix_table_size(control);
 
-    pdev->vpci->msix = xzalloc_flex_struct(struct vpci_msix, entries,
-                                           max_entries);
-    if ( !pdev->vpci->msix )
+    msix = xzalloc_flex_struct(struct vpci_msix, entries, max_entries);
+    if ( !msix )
         return -ENOMEM;
 
-    pdev->vpci->msix->max_entries = max_entries;
-    pdev->vpci->msix->pdev = pdev;
+    msix->max_entries = max_entries;
+    msix->pdev = pdev;
 
-    pdev->vpci->msix->tables[VPCI_MSIX_TABLE] =
+    msix->tables[VPCI_MSIX_TABLE] =
         pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
-    pdev->vpci->msix->tables[VPCI_MSIX_PBA] =
+    msix->tables[VPCI_MSIX_PBA] =
         pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
 
-    for ( i = 0; i < pdev->vpci->msix->max_entries; i++)
+    for ( i = 0; i < msix->max_entries; i++)
     {
-        pdev->vpci->msix->entries[i].masked = true;
-        vpci_msix_arch_init_entry(&pdev->vpci->msix->entries[i]);
+        msix->entries[i].masked = true;
+        vpci_msix_arch_init_entry(&msix->entries[i]);
     }
 
     rc = vpci_add_register(pdev->vpci, control_read, control_write,
-                           msix_control_reg(msix_offset), 2, pdev->vpci->msix);
+                           msix_control_reg(msix_offset), 2, msix);
     if ( rc )
+    {
+        xfree(msix);
         return rc;
+    }
 
     if ( list_empty(&d->arch.hvm.msix_tables) )
         register_mmio_handler(d, &vpci_msix_table_ops);
 
-    list_add(&pdev->vpci->msix->next, &d->arch.hvm.msix_tables);
+    pdev->vpci->msix = msix;
+    list_add(&msix->next, &d->arch.hvm.msix_tables);
 
     return 0;
 }


