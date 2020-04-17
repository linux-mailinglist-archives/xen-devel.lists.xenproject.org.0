Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B68981ADFBA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:25:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRvf-0007Xr-C3; Fri, 17 Apr 2020 14:25:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRve-0007Xl-8x
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:25:14 +0000
X-Inumbo-ID: 4025c09c-80b7-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4025c09c-80b7-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 14:25:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20A21AB5F;
 Fri, 17 Apr 2020 14:25:12 +0000 (UTC)
Subject: [PATCH 01/10] x86/mm: no-one passes a NULL domain to
 init_xen_l4_slots()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <19d7ad4f-c653-b7b6-59a8-90c9700c9200@suse.com>
Date: Fri, 17 Apr 2020 16:25:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
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

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1696,7 +1696,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
      * directmap.
      */
-    bool short_directmap = d && !paging_mode_external(d);
+    bool short_directmap = !paging_mode_external(d);
 
     /* Slot 256: RO M2P (if applicable). */
     l4t[l4_table_offset(RO_MPT_VIRT_START)] =
@@ -1717,10 +1717,9 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
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


