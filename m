Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2826191E5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437312.691612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6j-0000DS-Uq; Fri, 04 Nov 2022 07:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437312.691612; Fri, 04 Nov 2022 07:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqr6j-0000As-RM; Fri, 04 Nov 2022 07:27:17 +0000
Received: by outflank-mailman (input) for mailman id 437312;
 Fri, 04 Nov 2022 07:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BBJ=3E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqr6i-0008IY-AR
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:27:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b3dc702-5c12-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 08:27:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5DDD71F88E;
 Fri,  4 Nov 2022 07:27:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 141161346F;
 Fri,  4 Nov 2022 07:27:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g8RvA9O+ZGPxQAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Nov 2022 07:27:15 +0000
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
X-Inumbo-ID: 1b3dc702-5c12-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667546835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mK6Yb+HDZYey+MdThM5vOztF2LsAJko2NCXxRRCzJLc=;
	b=t3mgxfquxmqCHwEFGv0Srb4QFx+nwnJALEZtwSkmnIZa5QyQvTvP3kpfqv/K5cOhfote+p
	/6XtoH9b9jQ7QKZsswIc2w6HhjyjLmX6LHGnp8tZNaIvJHApg+HmnQoo5vQOu1OIrl4uXc
	ChvpghyJuz4ckYNeOxBRjHbbqoKGEKA=
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
Subject: [PATCH v2 2/5] x86: remove unneeded 64-bit dependency in arch_enter_from_user_mode()
Date: Fri,  4 Nov 2022 08:26:58 +0100
Message-Id: <20221104072701.20283-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221104072701.20283-1-jgross@suse.com>
References: <20221104072701.20283-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for 64-bit mode when testing X86_FEATURE_XENPV isn't needed,
as Xen PV guests are no longer supported in 32-bit mode.

While at it switch from boot_cpu_has() to cpu_feature_enabled().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/entry-common.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/entry-common.h b/arch/x86/include/asm/entry-common.h
index 674ed46d3ced..117903881fe4 100644
--- a/arch/x86/include/asm/entry-common.h
+++ b/arch/x86/include/asm/entry-common.h
@@ -24,8 +24,8 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 		/*
 		 * For !SMAP hardware we patch out CLAC on entry.
 		 */
-		if (boot_cpu_has(X86_FEATURE_SMAP) ||
-		    (IS_ENABLED(CONFIG_64BIT) && boot_cpu_has(X86_FEATURE_XENPV)))
+		if (cpu_feature_enabled(X86_FEATURE_SMAP) ||
+		    cpu_feature_enabled(X86_FEATURE_XENPV))
 			mask |= X86_EFLAGS_AC;
 
 		WARN_ON_ONCE(flags & mask);
-- 
2.35.3


