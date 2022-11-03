Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B34C617BB2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436348.690406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYWk-0003V4-Fq; Thu, 03 Nov 2022 11:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436348.690406; Thu, 03 Nov 2022 11:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYWk-0003T1-CG; Thu, 03 Nov 2022 11:36:54 +0000
Received: by outflank-mailman (input) for mailman id 436348;
 Thu, 03 Nov 2022 11:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqYWi-0003ST-Bj
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:36:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ced2a0dc-5b6b-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 12:36:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B5D0921D0A;
 Thu,  3 Nov 2022 11:36:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72B7713480;
 Thu,  3 Nov 2022 11:36:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJJtGtKnY2P4HgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Nov 2022 11:36:50 +0000
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
X-Inumbo-ID: ced2a0dc-5b6b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667475410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CU5Zv+MxpH9Viqrq9cuAJbtGqlqKE19LW/YuoUb07c=;
	b=EoOrn3NQCcelDwLrz6uRb8Qdpe2LcmeDtFqRskvTLgiYp1OIbmEUexGEbMyEIOYJ42dKu/
	12zWG8reRqNsGvcRjBnqFgs8u2C5XKriMxPc4fnl1Yc+FvgUrhX7K0Dl2C6TbloaatAyqV
	ljzr7Loq/CVmv4IC7XuZaPSEWg0URFU=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/4] x86: add X86_FEATURE_XENPV to disabled-features.h
Date: Thu,  3 Nov 2022 12:36:33 +0100
Message-Id: <20221103113636.25543-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221103113636.25543-1-jgross@suse.com>
References: <20221103113636.25543-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add X86_FEATURE_XENPV to the features handled specially in
disabled-features.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/disabled-features.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/disabled-features.h b/arch/x86/include/asm/disabled-features.h
index 33d2cd04d254..c862552d7d6d 100644
--- a/arch/x86/include/asm/disabled-features.h
+++ b/arch/x86/include/asm/disabled-features.h
@@ -81,6 +81,12 @@
 # define DISABLE_SGX	(1 << (X86_FEATURE_SGX & 31))
 #endif
 
+#ifdef CONFIG_XEN_PV
+# define DISABLE_XENPV		0
+#else
+# define DISABLE_XENPV		(1 << (X86_FEATURE_XENPV & 31))
+#endif
+
 #ifdef CONFIG_INTEL_TDX_GUEST
 # define DISABLE_TDX_GUEST	0
 #else
@@ -98,7 +104,7 @@
 #define DISABLED_MASK5	0
 #define DISABLED_MASK6	0
 #define DISABLED_MASK7	(DISABLE_PTI)
-#define DISABLED_MASK8	(DISABLE_TDX_GUEST)
+#define DISABLED_MASK8	(DISABLE_XENPV|DISABLE_TDX_GUEST)
 #define DISABLED_MASK9	(DISABLE_SGX)
 #define DISABLED_MASK10	0
 #define DISABLED_MASK11	(DISABLE_RETPOLINE|DISABLE_RETHUNK|DISABLE_UNRET)
-- 
2.35.3


