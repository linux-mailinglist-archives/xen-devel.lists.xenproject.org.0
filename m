Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E162D0E1B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46165.81902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDsl-0007d1-9T; Mon, 07 Dec 2020 10:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46165.81902; Mon, 07 Dec 2020 10:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDsl-0007cd-6D; Mon, 07 Dec 2020 10:36:39 +0000
Received: by outflank-mailman (input) for mailman id 46165;
 Mon, 07 Dec 2020 10:36:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmDsj-0007cW-Hd
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:36:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c91e369-21c9-4ef9-889b-9149c4a43501;
 Mon, 07 Dec 2020 10:36:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 462CCAC90;
 Mon,  7 Dec 2020 10:36:36 +0000 (UTC)
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
X-Inumbo-ID: 0c91e369-21c9-4ef9-889b-9149c4a43501
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607337396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHB5r6OeiC4r+XsAY4TkW/gaxfa4JhjmUmX1cIlsY/M=;
	b=KSy3ouoalq6V8ozWVhV/B2ffu6NX7EhxXXSXAcMZc4Moma2FBMbxzcnC5f1tht5UFPnRah
	FYgqgclkislV+At0LJQJW22GZ2jBCfxI1P2hA4G6HmX3LpcPPYJyOqpfqdpc572pAGkcZx
	hxOLWhJ9G6FPl2I1g+PK1usJVgH/R8Q=
Subject: [PATCH 1/5] x86/vPCI: tolerate (un)masking a disabled MSI-X entry
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Message-ID: <fef14892-f21d-e304-d9b1-7484e0ea3415@suse.com>
Date: Mon, 7 Dec 2020 11:36:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

None of the four reasons causing vpci_msix_arch_mask_entry() to get
called (there's just a single call site) are impossible or illegal prior
to an entry actually having got set up:
- the entry may remain masked (in this case, however, a prior masked ->
  unmasked transition would already not have worked),
- MSI-X may not be enabled,
- the global mask bit may be set,
- the entry may not otherwise have been updated.
Hence the function asserting that the entry was previously set up was
simply wrong. Since the caller tracks the masked state (and setting up
of an entry would only be effected when that software bit is clear),
it's okay to skip both masking and unmasking requests in this case.

Fixes: d6281be9d0145 ('vpci/msix: add MSI-X handlers')
Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is a presumed alternative to Roger's "vpci/msix: exit early if
MSI-X is disabled or globally masked".

--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -840,8 +840,8 @@ void vpci_msi_arch_print(const struct vp
 void vpci_msix_arch_mask_entry(struct vpci_msix_entry *entry,
                                const struct pci_dev *pdev, bool mask)
 {
-    ASSERT(entry->arch.pirq != INVALID_PIRQ);
-    vpci_mask_pirq(pdev->domain, entry->arch.pirq, mask);
+    if ( entry->arch.pirq != INVALID_PIRQ )
+        vpci_mask_pirq(pdev->domain, entry->arch.pirq, mask);
 }
 
 int vpci_msix_arch_enable_entry(struct vpci_msix_entry *entry,


