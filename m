Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1D617BB4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 12:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436349.690416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYWp-0003p2-OZ; Thu, 03 Nov 2022 11:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436349.690416; Thu, 03 Nov 2022 11:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqYWp-0003mQ-Km; Thu, 03 Nov 2022 11:36:59 +0000
Received: by outflank-mailman (input) for mailman id 436349;
 Thu, 03 Nov 2022 11:36:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqYWn-0003Ct-Cu
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 11:36:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d23708ba-5b6b-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 12:36:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64E041F385;
 Thu,  3 Nov 2022 11:36:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2225213480;
 Thu,  3 Nov 2022 11:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5ETtBtinY2MEHwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 03 Nov 2022 11:36:56 +0000
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
X-Inumbo-ID: d23708ba-5b6b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667475416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mK6Yb+HDZYey+MdThM5vOztF2LsAJko2NCXxRRCzJLc=;
	b=kXqfwiKMdh9juEVxLq/XwrPXmX7SB2cxef3a31IZCdP9dQWBaNfSqFJxrMjZHT4Z9ML6rG
	pVIF8wHcHue8M1//i+/XCN0IhieNQ20fbVOJsCKv5zlarDyZcQQnAH0zAxIADInsArD5tT
	8T43gbRaTSNsxxlmazfgdFihOv9Swfw=
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
Subject: [PATCH 2/4] x86: remove unneeded 64-bit dependency in arch_enter_from_user_mode()
Date: Thu,  3 Nov 2022 12:36:34 +0100
Message-Id: <20221103113636.25543-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221103113636.25543-1-jgross@suse.com>
References: <20221103113636.25543-1-jgross@suse.com>
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


