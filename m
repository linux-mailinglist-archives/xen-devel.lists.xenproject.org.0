Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE4551781
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 13:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352751.579610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Fg7-0005o0-5u; Mon, 20 Jun 2022 11:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352751.579610; Mon, 20 Jun 2022 11:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Fg7-0005lJ-2F; Mon, 20 Jun 2022 11:34:47 +0000
Received: by outflank-mailman (input) for mailman id 352751;
 Mon, 20 Jun 2022 11:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Fg5-0005lD-I8
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 11:34:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8adfc35-f08c-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 13:34:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED8AC21BB8;
 Mon, 20 Jun 2022 11:34:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1FA1134CA;
 Mon, 20 Jun 2022 11:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uKlHJlNbsGJ7BQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 11:34:43 +0000
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
X-Inumbo-ID: f8adfc35-f08c-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655724883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=sFZCDHHdeMfba3WZMR9ZmHr8MgDiELflME+wwT8OZfM=;
	b=KsbBYHBwqPcIaOsBTaoPBqYic3Z0buj6zNzYSIesoD5Tt9+JchJYZcz+7aT63ca7qOBtrc
	MGYys/MoKrmKsaDyr4QD0UbFEZsNB6R1qVrKaVq/bFjExnxdb6kTYcTP1J7usIhLwUfk19
	0cX4iAibdLH1tP4Ppx0TQ6miO2cJHCk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2] x86/pat: fix x86_has_pat_wp()
Date: Mon, 20 Jun 2022 13:34:41 +0200
Message-Id: <20220620113441.23961-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x86_has_pat_wp() is using a wrong test, as it relies on the normal
PAT configuration used by the kernel. In case the PAT MSR has been
setup by another entity (e.g. BIOS or Xen hypervisor) it might return
false even if the PAT configuration is allowing WP mappings.

The correct way to test for WP support is:

1. Get the PTE protection bits needed to select WP mode by reading
   __cachemode2pte_tbl[_PAGE_CACHE_MODE_WP] (depending on the PAT MSR
   setting this might return protection bits for a stronger mode, e.g.
   UC-)
2. Translate those bits back into the real cache mode selected by those
   PTE bits by reading __pte2cachemode_tbl[__pte2cm_idx(prot)]
3. Test for the cache mode to be _PAGE_CACHE_MODE_WP

Fixes: 1f6f655e01ad ("x86/mm: Add a x86_has_pat_wp() helper")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- fix indexing into __pte2cachemode_tbl[]
---
 arch/x86/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index d8cfce221275..914ac5f29fca 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -80,7 +80,9 @@ static uint8_t __pte2cachemode_tbl[8] = {
 /* Check that the write-protect PAT entry is set for write-protect */
 bool x86_has_pat_wp(void)
 {
-	return __pte2cachemode_tbl[_PAGE_CACHE_MODE_WP] == _PAGE_CACHE_MODE_WP;
+	uint16_t prot = __cachemode2pte_tbl[_PAGE_CACHE_MODE_WP];
+
+	return __pte2cachemode_tbl[__pte2cm_idx(prot)] == _PAGE_CACHE_MODE_WP;
 }
 
 enum page_cache_mode pgprot2cachemode(pgprot_t pgprot)
-- 
2.35.3


