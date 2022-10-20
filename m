Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA6605F0F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:38:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426637.675212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTsD-0005n7-41; Thu, 20 Oct 2022 11:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426637.675212; Thu, 20 Oct 2022 11:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTsD-0005kh-0Y; Thu, 20 Oct 2022 11:38:05 +0000
Received: by outflank-mailman (input) for mailman id 426637;
 Thu, 20 Oct 2022 11:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tgfI=2V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1olTsA-0005kU-Lb
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:38:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a302b5b3-506b-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 13:37:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92DE21FCFA;
 Thu, 20 Oct 2022 11:38:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4090D13494;
 Thu, 20 Oct 2022 11:38:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id REBlDhkzUWPEBgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 20 Oct 2022 11:38:01 +0000
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
X-Inumbo-ID: a302b5b3-506b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666265881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bOeIQs06Ph1bJ91eHAC9fBVgauw5j59B8/KvO9VWdAY=;
	b=PBpvCe+eKaNf8bwyjdesNestAeyQ6jmQl9dMvpuhLdQXjqPFo9p9VBZgDru/8YYuiEsJmQ
	M0a4vZAgkjF5JxMl8e5xw+lL3Gdm19fY3NtK8sbry4qXU0+EZFADAIQWui+2pHnFqOrQMh
	DHvIn+IF35Oa8nHjrGVNSMG5sLUEBEI=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] x86/xen: silence smatch warning in pmu_msr_chk_emulated()
Date: Thu, 20 Oct 2022 13:37:59 +0200
Message-Id: <20221020113759.17402-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 8714f7bcd3c2 ("xen/pv: add fault recovery control to pmu msr
accesses") introduced code resulting in a warning issued by the smatch
static checker, claiming to use an uninitialized variable.

This is a false positive, but work around the warning nevertheless.

Fixes: 8714f7bcd3c2 ("xen/pv: add fault recovery control to pmu msr accesses")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 68aff1382872..898a252ed6f1 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -302,7 +302,7 @@ static bool xen_amd_pmu_emulate(unsigned int msr, u64 *val, bool is_read)
 static bool pmu_msr_chk_emulated(unsigned int msr, uint64_t *val, bool is_read,
 				 bool *emul)
 {
-	int type, index;
+	int type = 0, index = 0;
 
 	if (is_amd_pmu_msr(msr))
 		*emul = xen_amd_pmu_emulate(msr, val, is_read);
-- 
2.35.3


