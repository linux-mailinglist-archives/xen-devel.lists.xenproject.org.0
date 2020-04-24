Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA071B7813
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1T-00032p-Jt; Fri, 24 Apr 2020 14:09:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz1S-00031w-F9
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:42 +0000
X-Inumbo-ID: 385d13f0-8635-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 385d13f0-8635-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i73GryKu2F55P7dpYQ8AYC2nWGmKgcztTRkoevvtces=; b=ifCSB49tKxVEMTt06aZ/ovgvXd
 t1kpGS79L8/8OmM9hEi/dgd4F9cGlvrTrmvj8P1XtE41DVKzPKukZDFIK7+TWMMHw7CaXksJVBmO6
 MwZ6JX1GW/YZZBV7LR1N9aUar7fp1HCXfx1SU4fjf4xfPACBU270w13b5bcB7iwyc8y0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz1I-0001he-AR; Fri, 24 Apr 2020 14:09:32 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1H-0001fN-Uj; Fri, 24 Apr 2020 14:09:32 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 09/15] efi: use new page table APIs in copy_mapping
Date: Fri, 24 Apr 2020 15:09:00 +0100
Message-Id: <6c27c79964eb16eba4743515689b9fd7eb3409d1.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

After inspection ARM doesn't have alloc_xen_pagetable so this function
is x86 only, which means it is safe for us to change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
---
 xen/common/efi/boot.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index a6f84c945a..8e96ef8de2 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1454,16 +1454,20 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
             continue;
         if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
         {
-            l3dst = alloc_xen_pagetable();
-            BUG_ON(!l3dst);
+            mfn_t l3mfn = alloc_xen_pagetable_new();
+
+            BUG_ON(mfn_eq(l3mfn, INVALID_MFN));
+            l3dst = map_domain_page(l3mfn);
             clear_page(l3dst);
             efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
-                l4e_from_paddr(virt_to_maddr(l3dst), __PAGE_HYPERVISOR);
+                l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
         }
         else
-            l3dst = l4e_to_l3e(l4e);
-        l3src = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
+            l3dst = map_l3t_from_l4e(l4e);
+        l3src = map_l3t_from_l4e(idle_pg_table[l4_table_offset(va)]);
         l3dst[l3_table_offset(mfn << PAGE_SHIFT)] = l3src[l3_table_offset(va)];
+        unmap_domain_page(l3src);
+        unmap_domain_page(l3dst);
     }
 }
 
-- 
2.24.1.AMZN


