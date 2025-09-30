Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F2BABBCF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 09:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133745.1471821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3UQG-0000zL-8C; Tue, 30 Sep 2025 07:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133745.1471821; Tue, 30 Sep 2025 07:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3UQG-0000xU-50; Tue, 30 Sep 2025 07:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1133745;
 Tue, 30 Sep 2025 07:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v3UQE-00089Y-Iy
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 07:05:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfcec0f3-9dcb-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 09:05:14 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A05161FB9F;
 Tue, 30 Sep 2025 07:05:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D06413A3F;
 Tue, 30 Sep 2025 07:05:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kk1UESaB22jlRwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 30 Sep 2025 07:05:10 +0000
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
X-Inumbo-ID: cfcec0f3-9dcb-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759215910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWVg40kg3cCGlbRyjRUpQT7gp/Qt5+z4LTlGPsiGrXQ=;
	b=GRVg5tr0HEd/zfji2Am9gUzCqwhy/P7cpZ0YqMKn1p2vm/K6PZjvE/xKZ+HTt1e5zEfSPv
	LOjQd5/AGoxOsinDK3vohhJW6ExL1IshA4USHZvyAShs1Vinh0d0R9nNWByddY4+O84CE8
	iDnY1/zxQYKvD6WCT3sUZxg9Y/4NvRc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759215910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWVg40kg3cCGlbRyjRUpQT7gp/Qt5+z4LTlGPsiGrXQ=;
	b=GRVg5tr0HEd/zfji2Am9gUzCqwhy/P7cpZ0YqMKn1p2vm/K6PZjvE/xKZ+HTt1e5zEfSPv
	LOjQd5/AGoxOsinDK3vohhJW6ExL1IshA4USHZvyAShs1Vinh0d0R9nNWByddY4+O84CE8
	iDnY1/zxQYKvD6WCT3sUZxg9Y/4NvRc=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: xin@zytor.com,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 12/12] x86/msr: Reduce number of low level MSR access helpers
Date: Tue, 30 Sep 2025 09:03:56 +0200
Message-ID: <20250930070356.30695-13-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930070356.30695-1-jgross@suse.com>
References: <20250930070356.30695-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Some MSR access helpers are redundant now, so remove the no longer
needed ones.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/msr.h  | 14 ++------------
 arch/x86/xen/enlighten_pv.c |  4 ++--
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index d42cd2c19818..43924d8a3d66 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -290,21 +290,11 @@ static __always_inline void native_wrmsr(u32 msr, u32 low, u32 high)
 	native_wrmsrq(msr, (u64)high << 32 | low);
 }
 
-static __always_inline u64 native_read_msr(u32 msr)
-{
-	return native_rdmsrq(msr);
-}
-
 static __always_inline int native_read_msr_safe(u32 msr, u64 *val)
 {
 	return __rdmsr(msr, val, EX_TYPE_RDMSR_SAFE) ? -EIO : 0;
 }
 
-static __always_inline void native_write_msr(u32 msr, u64 val)
-{
-	native_wrmsrq(msr, val);
-}
-
 static __always_inline int native_write_msr_safe(u32 msr, u64 val)
 {
 	return __wrmsrq(msr, val, EX_TYPE_WRMSR_SAFE) ? -EIO : 0;
@@ -369,7 +359,7 @@ static __always_inline u64 rdpmc(int counter)
 #else
 static __always_inline u64 read_msr(u32 msr)
 {
-	return native_read_msr(msr);
+	return native_rdmsrq(msr);
 }
 
 static __always_inline int read_msr_safe(u32 msr, u64 *p)
@@ -379,7 +369,7 @@ static __always_inline int read_msr_safe(u32 msr, u64 *p)
 
 static __always_inline void write_msr(u32 msr, u64 val)
 {
-	native_write_msr(msr, val);
+	native_wrmsrq(msr, val);
 }
 
 static __always_inline int write_msr_safe(u32 msr, u64 val)
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index df653099c567..277e053cf3dd 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1097,7 +1097,7 @@ static u64 xen_do_read_msr(u32 msr, int *err)
 	if (err)
 		*err = native_read_msr_safe(msr, &val);
 	else
-		val = native_read_msr(msr);
+		val = native_rdmsrq(msr);
 
 	switch (msr) {
 	case MSR_IA32_APICBASE:
@@ -1156,7 +1156,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
 		if (err)
 			*err = native_write_msr_safe(msr, val);
 		else
-			native_write_msr(msr, val);
+			native_wrmsrq(msr, val);
 	}
 }
 
-- 
2.51.0


