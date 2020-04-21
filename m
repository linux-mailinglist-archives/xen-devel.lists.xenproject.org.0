Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA771B2265
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 11:11:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQovr-0008Uv-FW; Tue, 21 Apr 2020 09:11:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQovq-0008Ul-FM
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 09:11:06 +0000
X-Inumbo-ID: 073a9a18-83b0-11ea-911a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 073a9a18-83b0-11ea-911a-12813bfff9fa;
 Tue, 21 Apr 2020 09:11:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 873A4AC19;
 Tue, 21 Apr 2020 09:11:03 +0000 (UTC)
Subject: [PATCH v2 1/4] x86/mm: no-one passes a NULL domain to
 init_xen_l4_slots()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
Message-ID: <8787b72e-c71e-b75d-2ca0-0c6fe7c8259f@suse.com>
Date: Tue, 21 Apr 2020 11:11:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Drop the NULL checks - they've been introduced by commit 8d7b633ada
("x86/mm: Consolidate all Xen L4 slot writing into
init_xen_l4_slots()") for no apparent reason.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Adjust comment ahead of the function.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1653,7 +1653,7 @@ static int promote_l3_table(struct page_
  * This function must write all ROOT_PAGETABLE_PV_XEN_SLOTS, to clobber any
  * values a guest may have left there from promote_l4_table().
  *
- * l4t and l4mfn are mandatory, but l4mfn doesn't need to be the mfn under
+ * l4t, l4mfn, and d are mandatory, but l4mfn doesn't need to be the mfn under
  * *l4t.  All other parameters are optional and will either fill or zero the
  * appropriate slots.  Pagetables not shared with guests will gain the
  * extended directmap.
@@ -1665,7 +1665,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
      * directmap.
      */
-    bool short_directmap = d && !paging_mode_external(d);
+    bool short_directmap = !paging_mode_external(d);
 
     /* Slot 256: RO M2P (if applicable). */
     l4t[l4_table_offset(RO_MPT_VIRT_START)] =
@@ -1686,10 +1686,9 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
         mfn_eq(sl4mfn, INVALID_MFN) ? l4e_empty() :
         l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
 
-    /* Slot 260: Per-domain mappings (if applicable). */
+    /* Slot 260: Per-domain mappings. */
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        d ? l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW)
-          : l4e_empty();
+        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
 
     /* Slot 261-: text/data/bss, RW M2P, vmap, frametable, directmap. */
 #ifndef NDEBUG


