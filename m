Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF46518558
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 15:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319640.539934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsTk-0006mx-N0; Tue, 03 May 2022 13:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319640.539934; Tue, 03 May 2022 13:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsTk-0006lH-Jg; Tue, 03 May 2022 13:22:12 +0000
Received: by outflank-mailman (input) for mailman id 319640;
 Tue, 03 May 2022 13:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nlsTj-0006lA-IE
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 13:22:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09a1e0a8-cae4-11ec-a406-831a346695d4;
 Tue, 03 May 2022 15:22:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60A7521871;
 Tue,  3 May 2022 13:22:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0838913AE0;
 Tue,  3 May 2022 13:22:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4IeDAIIscWIASAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 03 May 2022 13:22:10 +0000
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
X-Inumbo-ID: 09a1e0a8-cae4-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651584130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CsELYWB9g735n4psOgGA9RLVHOTzorxnOT84eRzNkC4=;
	b=bTPrVtI98WQI22j4IYJLmfiH/e8o2FSFZ7FrB5SFsp33Oi13Cy18uQCxYfHrJpShK6M1t4
	K9qPTJ0SxyLjKyMS0KuYdCJGf2bVdcqC2KyIgsR1uPLFEPrejQ1cJVWYyEMo+F3ATAxyEM
	DnCZsYFDCVgN2tCW6uOkWMgAo9KNMnI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: jbeulich@suse.com,
	Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/2] x86/pat: fix x86_has_pat_wp()
Date: Tue,  3 May 2022 15:22:06 +0200
Message-Id: <20220503132207.17234-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220503132207.17234-1-jgross@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x86_has_pat_wp() is using a wrong test, as it relies on the normal
PAT configuration used by the kernel. In case the PAT MSR has been
setup by another entity (e.g. BIOS or Xen hypervisor) it might return
false even if the PAT configuration is allowing WP mappings.

Fixes: 1f6f655e01ad ("x86/mm: Add a x86_has_pat_wp() helper")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index d8cfce221275..71e182ebced3 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -80,7 +80,8 @@ static uint8_t __pte2cachemode_tbl[8] = {
 /* Check that the write-protect PAT entry is set for write-protect */
 bool x86_has_pat_wp(void)
 {
-	return __pte2cachemode_tbl[_PAGE_CACHE_MODE_WP] == _PAGE_CACHE_MODE_WP;
+	return __pte2cachemode_tbl[__cachemode2pte_tbl[_PAGE_CACHE_MODE_WP]] ==
+	       _PAGE_CACHE_MODE_WP;
 }
 
 enum page_cache_mode pgprot2cachemode(pgprot_t pgprot)
-- 
2.35.3


