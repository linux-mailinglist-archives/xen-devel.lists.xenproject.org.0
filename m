Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E862D0E1D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:37:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46172.81940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDtS-0007sF-D3; Mon, 07 Dec 2020 10:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46172.81940; Mon, 07 Dec 2020 10:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDtS-0007r4-8Q; Mon, 07 Dec 2020 10:37:22 +0000
Received: by outflank-mailman (input) for mailman id 46172;
 Mon, 07 Dec 2020 10:37:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDtQ-0007qN-Q4
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:37:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0abe833-55cf-4f67-bf60-d9b05dc478ed;
 Mon, 07 Dec 2020 10:37:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AEF0AC55;
 Mon,  7 Dec 2020 10:37:19 +0000 (UTC)
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
X-Inumbo-ID: e0abe833-55cf-4f67-bf60-d9b05dc478ed
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607337439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LnzNSEW5ph9csjSAH+eysCLiqYJb/8OEeRZ7MYumjZ0=;
	b=IC6rV8RbaAaBrHEHy9JPo9OWKLCS6sVs9vOqH+/rh6M7nXvuivFFoNJL061geOyIIDNlM/
	FIty9Jhyxff6m0N2UAanIA1dfsc6pDJxWowO8LU6PKAncapGiAIs56mH9Ii4TF1oOqxYWo
	liO1t3pBa6GOUOjVGG9Okd30d3aOWDQ=
Subject: [PATCH 2/5] x86/vPCI: check address in vpci_msi_update()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Message-ID: <c5bec6bd-b3cb-dc4c-0435-5154956cc4dd@suse.com>
Date: Mon, 7 Dec 2020 11:37:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

If the upper address bits don't match the interrupt delivery address
space window, entirely different behavior would need to be implemented.
Refuse such requests for the time being.

Replace adjacent hard tabs while introducing MSI_ADDR_BASE_MASK.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -682,6 +682,13 @@ static int vpci_msi_update(const struct
 
     ASSERT(pcidevs_locked());
 
+    if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
+    {
+        gdprintk(XENLOG_ERR, "%pp: PIRQ %u: unsupported address %lx\n",
+                 &pdev->sbdf, pirq, address);
+        return -EOPNOTSUPP;
+    }
+
     for ( i = 0; i < vectors; i++ )
     {
         uint8_t vector = MASK_EXTR(data, MSI_DATA_VECTOR_MASK);
--- a/xen/include/asm-x86/msi.h
+++ b/xen/include/asm-x86/msi.h
@@ -36,8 +36,9 @@
  * Shift/mask fields for msi address
  */
 
-#define MSI_ADDR_BASE_HI	    	0
-#define MSI_ADDR_BASE_LO	    	0xfee00000
+#define MSI_ADDR_BASE_HI            0
+#define MSI_ADDR_BASE_LO            0xfee00000
+#define MSI_ADDR_BASE_MASK          (~0xfffff)
 #define MSI_ADDR_HEADER             MSI_ADDR_BASE_LO
 
 #define MSI_ADDR_DESTMODE_SHIFT     2


