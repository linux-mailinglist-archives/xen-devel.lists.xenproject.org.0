Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD3F43DCC7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 10:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217722.377870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WS-00049z-35; Thu, 28 Oct 2021 08:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217722.377870; Thu, 28 Oct 2021 08:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WR-00043u-Uv; Thu, 28 Oct 2021 08:12:27 +0000
Received: by outflank-mailman (input) for mailman id 217722;
 Thu, 28 Oct 2021 08:12:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mg0WQ-000420-Hl
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 08:12:26 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c82b039b-37c6-11ec-849a-12813bfff9fa;
 Thu, 28 Oct 2021 08:12:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 523121FD4C;
 Thu, 28 Oct 2021 08:12:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BF4814083;
 Thu, 28 Oct 2021 08:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0BTdAWhbemE/MQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 08:12:24 +0000
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
X-Inumbo-ID: c82b039b-37c6-11ec-849a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635408744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWdDMKt9ZR6fJrJlomm3JcZ8sxGTe4D9W9jT8YxWMnw=;
	b=EuCcEXH/JLcU3tuPtMKIUeyYxSTGsXxYljjToHY98i+p3XwMuqaFiCREzyeFYCGweS9rqI
	+YHRCmT9ZqgJJnWVT/jjIYMdsOS57chc9ALp35rBB4lx0XZbVGQ5dfdwDea1ng60jsFqzV
	h2/kbtg7V1Eb8DRcHhV82XPX1/s9cSc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/4] x86/xen: remove 32-bit pv leftovers
Date: Thu, 28 Oct 2021 10:12:18 +0200
Message-Id: <20211028081221.2475-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211028081221.2475-1-jgross@suse.com>
References: <20211028081221.2475-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some remaining 32-bit pv-guest support leftovers in the Xen
hypercall interface. Remove them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/hypercall.h | 40 +++++++---------------------
 drivers/xen/mem-reservation.c        | 27 +++++++------------
 2 files changed, 19 insertions(+), 48 deletions(-)

diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index 454b20815f35..02156b76aa92 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -323,9 +323,7 @@ HYPERVISOR_get_debugreg(int reg)
 static inline int
 HYPERVISOR_update_descriptor(u64 ma, u64 desc)
 {
-	if (sizeof(u64) == sizeof(long))
-		return _hypercall2(int, update_descriptor, ma, desc);
-	return _hypercall4(int, update_descriptor, ma, ma>>32, desc, desc>>32);
+	return _hypercall2(int, update_descriptor, ma, desc);
 }
 
 static inline long
@@ -344,12 +342,7 @@ static inline int
 HYPERVISOR_update_va_mapping(unsigned long va, pte_t new_val,
 			     unsigned long flags)
 {
-	if (sizeof(new_val) == sizeof(long))
-		return _hypercall3(int, update_va_mapping, va,
-				   new_val.pte, flags);
-	else
-		return _hypercall4(int, update_va_mapping, va,
-				   new_val.pte, new_val.pte >> 32, flags);
+	return _hypercall3(int, update_va_mapping, va, new_val.pte, flags);
 }
 
 static inline int
@@ -461,16 +454,10 @@ MULTI_update_va_mapping(struct multicall_entry *mcl, unsigned long va,
 {
 	mcl->op = __HYPERVISOR_update_va_mapping;
 	mcl->args[0] = va;
-	if (sizeof(new_val) == sizeof(long)) {
-		mcl->args[1] = new_val.pte;
-		mcl->args[2] = flags;
-	} else {
-		mcl->args[1] = new_val.pte;
-		mcl->args[2] = new_val.pte >> 32;
-		mcl->args[3] = flags;
-	}
+	mcl->args[1] = new_val.pte;
+	mcl->args[2] = flags;
 
-	trace_xen_mc_entry(mcl, sizeof(new_val) == sizeof(long) ? 3 : 4);
+	trace_xen_mc_entry(mcl, 3);
 }
 
 static inline void
@@ -478,19 +465,10 @@ MULTI_update_descriptor(struct multicall_entry *mcl, u64 maddr,
 			struct desc_struct desc)
 {
 	mcl->op = __HYPERVISOR_update_descriptor;
-	if (sizeof(maddr) == sizeof(long)) {
-		mcl->args[0] = maddr;
-		mcl->args[1] = *(unsigned long *)&desc;
-	} else {
-		u32 *p = (u32 *)&desc;
-
-		mcl->args[0] = maddr;
-		mcl->args[1] = maddr >> 32;
-		mcl->args[2] = *p++;
-		mcl->args[3] = *p;
-	}
-
-	trace_xen_mc_entry(mcl, sizeof(maddr) == sizeof(long) ? 2 : 4);
+	mcl->args[0] = maddr;
+	mcl->args[1] = *(unsigned long *)&desc;
+
+	trace_xen_mc_entry(mcl, 2);
 }
 
 static inline void
diff --git a/drivers/xen/mem-reservation.c b/drivers/xen/mem-reservation.c
index 3782cf070338..24648836e0d4 100644
--- a/drivers/xen/mem-reservation.c
+++ b/drivers/xen/mem-reservation.c
@@ -35,6 +35,7 @@ void __xenmem_reservation_va_mapping_update(unsigned long count,
 	for (i = 0; i < count; i++) {
 		struct page *page = pages[i];
 		unsigned long pfn = page_to_pfn(page);
+		int ret;
 
 		BUG_ON(!page);
 
@@ -46,16 +47,10 @@ void __xenmem_reservation_va_mapping_update(unsigned long count,
 
 		set_phys_to_machine(pfn, frames[i]);
 
-		/* Link back into the page tables if not highmem. */
-		if (!PageHighMem(page)) {
-			int ret;
-
-			ret = HYPERVISOR_update_va_mapping(
-					(unsigned long)__va(pfn << PAGE_SHIFT),
-					mfn_pte(frames[i], PAGE_KERNEL),
-					0);
-			BUG_ON(ret);
-		}
+		ret = HYPERVISOR_update_va_mapping(
+				(unsigned long)__va(pfn << PAGE_SHIFT),
+				mfn_pte(frames[i], PAGE_KERNEL), 0);
+		BUG_ON(ret);
 	}
 }
 EXPORT_SYMBOL_GPL(__xenmem_reservation_va_mapping_update);
@@ -68,6 +63,7 @@ void __xenmem_reservation_va_mapping_reset(unsigned long count,
 	for (i = 0; i < count; i++) {
 		struct page *page = pages[i];
 		unsigned long pfn = page_to_pfn(page);
+		int ret;
 
 		/*
 		 * We don't support PV MMU when Linux and Xen are using
@@ -75,14 +71,11 @@ void __xenmem_reservation_va_mapping_reset(unsigned long count,
 		 */
 		BUILD_BUG_ON(XEN_PAGE_SIZE != PAGE_SIZE);
 
-		if (!PageHighMem(page)) {
-			int ret;
+		ret = HYPERVISOR_update_va_mapping(
+				(unsigned long)__va(pfn << PAGE_SHIFT),
+				__pte_ma(0), 0);
+		BUG_ON(ret);
 
-			ret = HYPERVISOR_update_va_mapping(
-					(unsigned long)__va(pfn << PAGE_SHIFT),
-					__pte_ma(0), 0);
-			BUG_ON(ret);
-		}
 		__set_phys_to_machine(pfn, INVALID_P2M_ENTRY);
 	}
 }
-- 
2.26.2


