Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF375B17A2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402832.644734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDDz-0007Ha-27; Thu, 08 Sep 2022 08:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402832.644734; Thu, 08 Sep 2022 08:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDDy-0007Fm-Tr; Thu, 08 Sep 2022 08:49:26 +0000
Received: by outflank-mailman (input) for mailman id 402832;
 Thu, 08 Sep 2022 08:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWDDx-0006wz-31
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 08:49:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23749ad3-2f53-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 10:49:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 235EF1F8A3;
 Thu,  8 Sep 2022 08:49:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D98F31322C;
 Thu,  8 Sep 2022 08:49:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FLzdM5OsGWNFNgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Sep 2022 08:49:23 +0000
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
X-Inumbo-ID: 23749ad3-2f53-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662626964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRQlMbR3LekauN/VGAqwz3/4iPTsfJTb9AkfSRaurK0=;
	b=Hd9Ngqvs9Q7HjcnnFHdEJnluFdjs2Wj0yx7QF7U6WlXYjs7VkdqwdTeiOTJdFoIUG+LQfF
	4GbxxQll8c0/5O+q2qlKl7gbNHHZP05WdF57KoK55JwvRKci1L2aeMv9LnUQ4xXNTmGKW3
	77gVzi15lfi7uuJQtkiQDGwKbuzddZg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 01/10] x86/mtrr: add comment for set_mtrr_state() serialization
Date: Thu,  8 Sep 2022 10:49:05 +0200
Message-Id: <20220908084914.21703-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220908084914.21703-1-jgross@suse.com>
References: <20220908084914.21703-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment how set_mtrr_state() is needing serialization.

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch instead of old patch 1
---
 arch/x86/kernel/cpu/mtrr/generic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 558108296f3c..cd64eab02393 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -684,7 +684,10 @@ static u32 deftype_lo, deftype_hi;
 /**
  * set_mtrr_state - Set the MTRR state for this CPU.
  *
- * NOTE: The CPU must already be in a safe state for MTRR changes.
+ * NOTE: The CPU must already be in a safe state for MTRR changes, including
+ *       measures that only a single CPU can be active in set_mtrr_state() in
+ *       order to not be subject to races for usage of deftype_lo (this is
+ *       accomplished by taking set_atomicity_lock).
  * RETURNS: 0 if no changes made, else a mask indicating what was changed.
  */
 static unsigned long set_mtrr_state(void)
-- 
2.35.3


