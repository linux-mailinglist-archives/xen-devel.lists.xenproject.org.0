Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B321843DCC5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 10:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217724.377897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WY-0004vX-RK; Thu, 28 Oct 2021 08:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217724.377897; Thu, 28 Oct 2021 08:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WY-0004sb-Kz; Thu, 28 Oct 2021 08:12:34 +0000
Received: by outflank-mailman (input) for mailman id 217724;
 Thu, 28 Oct 2021 08:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mg0WV-000420-E4
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 08:12:31 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8ed97ca-37c6-11ec-849a-12813bfff9fa;
 Thu, 28 Oct 2021 08:12:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 533B81FD50;
 Thu, 28 Oct 2021 08:12:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D7CE13B7D;
 Thu, 28 Oct 2021 08:12:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6B8ZAmlbemE/MQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 08:12:25 +0000
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
X-Inumbo-ID: c8ed97ca-37c6-11ec-849a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635408745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xwab1206kf6LPwimd9DqBNkl2HPMyacCxBPHJc6oauA=;
	b=lXctq1nTr/IrpFNo9dzqTLg+Mk1DHZaLUAO1sv3bfQ2soI/KtJHeCVSpvwoaVFIthWU0W7
	JK3fBD95T9sTH3Cj0cGhOQFvUtMTlplsFlS4HSWyMKrCHMfX6hpvgOsajs2KiFqgr1ce3n
	S/YBqk6nsSp6iJ9uuY1NpttjHYqYmSc=
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
Subject: [PATCH 4/4] x86/xen: remove 32-bit awareness from startup_xen
Date: Thu, 28 Oct 2021 10:12:21 +0200
Message-Id: <20211028081221.2475-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211028081221.2475-1-jgross@suse.com>
References: <20211028081221.2475-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

startup_xen is still 32-bit aware, even if no longer needed.

Replace the register macros by the 64-bit register names for making
it more readable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/xen-head.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index cb6538ae2fe0..38b0a3226c95 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -28,13 +28,13 @@ SYM_CODE_START(startup_xen)
 
 	/* Clear .bss */
 	xor %eax,%eax
-	mov $__bss_start, %_ASM_DI
-	mov $__bss_stop, %_ASM_CX
-	sub %_ASM_DI, %_ASM_CX
-	shr $__ASM_SEL(2, 3), %_ASM_CX
-	rep __ASM_SIZE(stos)
+	mov $__bss_start, %rdi
+	mov $__bss_stop, %rcx
+	sub %rdi, %rcx
+	shr $3, %rcx
+	rep stosq
 
-	mov %_ASM_SI, xen_start_info
+	mov %rsi, xen_start_info
 	mov initial_stack(%rip), %rsp
 
 	/* Set up %gs.
-- 
2.26.2


