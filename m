Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CD52D0E20
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46186.81952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDu1-00083Z-LZ; Mon, 07 Dec 2020 10:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46186.81952; Mon, 07 Dec 2020 10:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDu1-000836-Ht; Mon, 07 Dec 2020 10:37:57 +0000
Received: by outflank-mailman (input) for mailman id 46186;
 Mon, 07 Dec 2020 10:37:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDu0-00080q-M8
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:37:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 061eb0b8-8fab-4991-aee8-8e903c804c7f;
 Mon, 07 Dec 2020 10:37:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D456AC90;
 Mon,  7 Dec 2020 10:37:49 +0000 (UTC)
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
X-Inumbo-ID: 061eb0b8-8fab-4991-aee8-8e903c804c7f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607337469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OC3OfGR5DZdR8EuXTTcO5WQ7g/MmFBAWeu7zrUpaC9w=;
	b=rwtn5BKYsgGh3qL2FyJhV5bplsEtPXJJOPqBDwjAUNCdE83OvlQpqrow8LetIGNuOlD1Na
	qnRsW96IKjEdVVks81tubhuuv8D/XSx8nXcRNRJgOeQzocxLqo4L571aCYVRVJMgvJa+2l
	sfXFfAPjw7KnpelNOsuWlytaxQhdGn4=
Subject: [PATCH 3/5] vPCI/MSI-X: fold clearing of entry->updated
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Message-ID: <c27c1c50-2d98-1796-f0e5-8fbae9f50045@suse.com>
Date: Mon, 7 Dec 2020 11:37:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Both call sites clear the flag after a successfull call to
update_entry(). This can be simplified by moving the clearing into the
function, onto its success path.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As a result it becomes clear that the return value of the function is of
no interest to either of the callers. I'm not sure whether ditching it
is the right thing to do, or whether this rather hints at some problem.

--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -64,6 +64,8 @@ static int update_entry(struct vpci_msix
         return rc;
     }
 
+    entry->updated = false;
+
     return 0;
 }
 
@@ -92,13 +94,8 @@ static void control_write(const struct p
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
@@ -365,10 +362,7 @@ static int msix_write(struct vcpu *v, un
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


