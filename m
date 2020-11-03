Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DF2A4362
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18210.43130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtre-0003jO-Er; Tue, 03 Nov 2020 10:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18210.43130; Tue, 03 Nov 2020 10:48:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtre-0003iz-Ae; Tue, 03 Nov 2020 10:48:34 +0000
Received: by outflank-mailman (input) for mailman id 18210;
 Tue, 03 Nov 2020 10:48:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZtrd-0003it-Ct
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:48:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id de19c2c1-ad7d-42ac-9a8b-0508dd27284e;
 Tue, 03 Nov 2020 10:48:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A292ACA3;
 Tue,  3 Nov 2020 10:48:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZtrd-0003it-Ct
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:48:33 +0000
X-Inumbo-ID: de19c2c1-ad7d-42ac-9a8b-0508dd27284e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id de19c2c1-ad7d-42ac-9a8b-0508dd27284e;
	Tue, 03 Nov 2020 10:48:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604400510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gYrpeny+gi/EErZyFZ2M4dvf/JKpXhwPCuX6X8avS6Y=;
	b=TTJaZChX9Xj+6Abp8cQvkg5eXolfXzll3Ugxc0bv99UUKLvhDIQn3Hd0GsBJ3MOPhW403J
	kdAEQUi6NP7Zn3Y1j/wUiJVVIQCJIfFGcKVPR/Mr83ihqcm+0QoNKO4MMoYu4buxaxFS6i
	3UgXsLH6CK12C1Fo4aUXtuVDqYjHVGg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4A292ACA3;
	Tue,  3 Nov 2020 10:48:30 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: drop guest_get_eff_l1e()
Message-ID: <8a94e96d-14e6-d145-3532-91dab96c8209@suse.com>
Date: Tue, 3 Nov 2020 11:48:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no actual user of it: pv_ro_page_fault() has a
guest_kernel_mode() conditional around its only call site.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -56,27 +56,6 @@ l1_pgentry_t *map_guest_l1e(unsigned lon
 }
 
 /*
- * Read the guest's l1e that maps this address, from the kernel-mode
- * page tables.
- */
-static l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
-{
-    struct vcpu *curr = current;
-    const bool user_mode = !(curr->arch.flags & TF_kernel_mode);
-    l1_pgentry_t l1e;
-
-    if ( user_mode )
-        toggle_guest_pt(curr);
-
-    l1e = guest_get_eff_l1e(linear);
-
-    if ( user_mode )
-        toggle_guest_pt(curr);
-
-    return l1e;
-}
-
-/*
  * Map a guest's LDT page (covering the byte at @offset from start of the LDT)
  * into Xen's virtual range.  Returns true if the mapping changed, false
  * otherwise.
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -5,8 +5,11 @@ l1_pgentry_t *map_guest_l1e(unsigned lon
 
 int new_guest_cr3(mfn_t mfn);
 
-/* Read a PV guest's l1e that maps this linear address. */
-static inline l1_pgentry_t guest_get_eff_l1e(unsigned long linear)
+/*
+ * Read the guest's l1e that maps this address, from the kernel-mode
+ * page tables.
+ */
+static inline l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
 {
     l1_pgentry_t l1e;
 
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -342,7 +342,7 @@ int pv_ro_page_fault(unsigned long addr,
     bool mmio_ro;
 
     /* Attempt to read the PTE that maps the VA being accessed. */
-    pte = guest_get_eff_l1e(addr);
+    pte = guest_get_eff_kern_l1e(addr);
 
     /* We are only looking for read-only mappings */
     if ( ((l1e_get_flags(pte) & (_PAGE_PRESENT | _PAGE_RW)) != _PAGE_PRESENT) )

