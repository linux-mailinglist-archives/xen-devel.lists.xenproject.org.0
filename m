Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF92D0E21
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46192.81962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDuO-0008CY-Tm; Mon, 07 Dec 2020 10:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46192.81962; Mon, 07 Dec 2020 10:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDuO-0008C8-Qn; Mon, 07 Dec 2020 10:38:20 +0000
Received: by outflank-mailman (input) for mailman id 46192;
 Mon, 07 Dec 2020 10:38:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDuN-0008Bx-Oe
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:38:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c4508fc-0767-4faf-be4c-2385ea740217;
 Mon, 07 Dec 2020 10:38:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76A91AC90;
 Mon,  7 Dec 2020 10:38:18 +0000 (UTC)
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
X-Inumbo-ID: 2c4508fc-0767-4faf-be4c-2385ea740217
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607337498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AS8IwPtcpvu14uVMpQu9DCQyxF2L6BDwPNijCmQt0k=;
	b=ibN8vOXpYtPtStZKnBzSRx7tU2UOddRdJILoOX3eyZRgzT0S5uXfTW82FfutI954Hz/G/0
	qck5vTZgEVO0IPXNRP2137bnX89jTpb4cNA2IrqUUmgZttsz7fQVtohhBZM9Tna4kGXLWM
	9/aEmkKX502Wg4Rtvdn6E5T1wYlVV/Q=
Subject: [PATCH 4/5] vPCI/MSI-X: make use of xzalloc_flex_struct()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Message-ID: <062e84e0-0e19-001e-df65-b06318cc5925@suse.com>
Date: Mon, 7 Dec 2020 11:38:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... instead of effectively open-coding it in a type-unsafe way.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -23,8 +23,6 @@
 #include <asm/msi.h>
 #include <asm/p2m.h>
 
-#define VMSIX_SIZE(num) offsetof(struct vpci_msix, entries[num])
-
 #define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                               \
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
      (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
@@ -449,7 +447,8 @@ static int init_msix(struct pci_dev *pde
 
     max_entries = msix_table_size(control);
 
-    pdev->vpci->msix = xzalloc_bytes(VMSIX_SIZE(max_entries));
+    pdev->vpci->msix = xzalloc_flex_struct(struct vpci_msix, entries,
+                                           max_entries);
     if ( !pdev->vpci->msix )
         return -ENOMEM;
 


