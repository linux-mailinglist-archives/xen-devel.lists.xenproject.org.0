Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 817773152CB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83286.154597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwH-00079L-Ix; Tue, 09 Feb 2021 15:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83286.154597; Tue, 09 Feb 2021 15:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwH-00078W-9A; Tue, 09 Feb 2021 15:28:29 +0000
Received: by outflank-mailman (input) for mailman id 83286;
 Tue, 09 Feb 2021 15:28:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9UwF-00077w-Jx
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:28:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwD-0000tq-Tk; Tue, 09 Feb 2021 15:28:25 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwD-0007gX-KT; Tue, 09 Feb 2021 15:28:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=DDJbcY16/y5U53JjUe4ikLZjvgyi9SSn2g/0HtB+Inw=; b=S16UaSjNKVbDDvcp6CNg1HvSo
	X7fraRQzjcyIYmP2WyNFGLKbE2zl4DOolZXI5pIj3RWPD9NlBG7W1ydCmBdFI0Pd59350wgA+cpOA
	/V3rbONk4wgXhCjfDEFh7tXjHSVIyvBSUmkzYmAp0jhr7MkTC/F3Yvl4oHre/DyCaoTK8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special pages in the IOMMU page-tables
Date: Tue,  9 Feb 2021 15:28:12 +0000
Message-Id: <20210209152816.15792-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210209152816.15792-1-julien@xen.org>
References: <20210209152816.15792-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Currently, the IOMMU page-tables will be populated early in the domain
creation if the hardware is able to virtualize the local APIC. However,
the IOMMU page tables will not be freed during early failure and will
result to a leak.

An assigned device should not need to DMA into the vLAPIC page, so we
can avoid to map the page in the IOMMU page-tables.

This statement is also true for any special pages (the vLAPIC page is
one of them). So to take the opportunity to prevent the mapping for all
of them.

Note that:
    - This is matching the existing behavior with PV guest
    - This doesn't change the behavior when the P2M is shared with the
    IOMMU. IOW, the special pages will still be accessibled by the
    device.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/include/asm-x86/p2m.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 7d63f5787e62..1802545969b3 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -919,6 +919,10 @@ static inline unsigned int p2m_get_iommu_flags(p2m_type_t p2mt, mfn_t mfn)
 {
     unsigned int flags;
 
+    /* Don't map special pages in the IOMMU page-tables. */
+    if ( mfn_valid(mfn) && is_special_page(mfn_to_page(mfn)) )
+        return 0;
+
     switch( p2mt )
     {
     case p2m_ram_rw:
-- 
2.17.1


