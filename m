Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A752EAAFC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61886.109132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlcz-0004W1-Tk; Tue, 05 Jan 2021 12:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61886.109132; Tue, 05 Jan 2021 12:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwlcz-0004Vb-Qd; Tue, 05 Jan 2021 12:39:57 +0000
Received: by outflank-mailman (input) for mailman id 61886;
 Tue, 05 Jan 2021 12:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwlcy-0004VV-QM
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:39:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92c006c2-b92c-48ff-b7d5-c7abad12542c;
 Tue, 05 Jan 2021 12:39:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 153EEAA35;
 Tue,  5 Jan 2021 12:39:55 +0000 (UTC)
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
X-Inumbo-ID: 92c006c2-b92c-48ff-b7d5-c7abad12542c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609850395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toAF4aeG+6sjzqGkBWMokesHdNyBSzsbmmZTb/XmjUE=;
	b=P3pVPzeBIGDvquFZ9Gry9a9War5glgzRiK12mrT1/RzD4t66QCbsAg40RJYaBqmDUp6BFS
	jx+hvQj634ySsrPCsCb8YfgOsiDvWMBminrHmO2UgXhc7xlKkZHg1t341F1GThXP/YdG9Q
	8Kz6dbCRZrg5mc9s8DRZ/LSe8ddDWyU=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] vPCI/MSI-X: fold clearing of entry->updated
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Message-ID: <e642e8f9-be34-8998-66ae-3fc64dcb16cc@suse.com>
Date: Tue, 5 Jan 2021 13:39:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Both call sites clear the flag after a successfull call to
update_entry(). This can be simplified by moving the clearing into the
function, onto its success path.

As a result of neither caller caring about update_entry()'s return value
anymore, the function gets switched to return void.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Make update_entry() return void.

--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -37,8 +37,8 @@ static uint32_t control_read(const struc
            (msix->masked ? PCI_MSIX_FLAGS_MASKALL : 0);
 }
 
-static int update_entry(struct vpci_msix_entry *entry,
-                        const struct pci_dev *pdev, unsigned int nr)
+static void update_entry(struct vpci_msix_entry *entry,
+                         const struct pci_dev *pdev, unsigned int nr)
 {
     int rc = vpci_msix_arch_disable_entry(entry, pdev);
 
@@ -48,7 +48,7 @@ static int update_entry(struct vpci_msix
         gprintk(XENLOG_WARNING,
                 "%pp: unable to disable entry %u for update: %d\n",
                 &pdev->sbdf, nr, rc);
-        return rc;
+        return;
     }
 
     rc = vpci_msix_arch_enable_entry(entry, pdev,
@@ -59,10 +59,10 @@ static int update_entry(struct vpci_msix
         gprintk(XENLOG_WARNING, "%pp: unable to enable entry %u: %d\n",
                 &pdev->sbdf, nr, rc);
         /* Entry is likely not properly configured. */
-        return rc;
+        return;
     }
 
-    return 0;
+    entry->updated = false;
 }
 
 static void control_write(const struct pci_dev *pdev, unsigned int reg,
@@ -90,13 +90,8 @@ static void control_write(const struct p
     if ( new_enabled && !new_masked && (!msix->enabled || msix->masked) )
     {
         for ( i = 0; i < msix->max_entries; i++ )
-        {
-            if ( msix->entries[i].masked || !msix->entries[i].updated ||
-                 update_entry(&msix->entries[i], pdev, i) )
-                continue;
-
-            msix->entries[i].updated = false;
-        }
+            if ( !msix->entries[i].masked && msix->entries[i].updated )
+                update_entry(&msix->entries[i], pdev, i);
     }
     else if ( !new_enabled && msix->enabled )
     {
@@ -363,10 +358,7 @@ static int msix_write(struct vcpu *v, un
              * data fields Xen needs to disable and enable the entry in order
              * to pick up the changes.
              */
-            if ( update_entry(entry, pdev, vmsix_entry_nr(msix, entry)) )
-                break;
-
-            entry->updated = false;
+            update_entry(entry, pdev, vmsix_entry_nr(msix, entry));
         }
         else
             vpci_msix_arch_mask_entry(entry, pdev, entry->masked);

