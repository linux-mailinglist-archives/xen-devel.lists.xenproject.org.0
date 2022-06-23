Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599F5576F3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354728.582002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JPl-0000TY-5q; Thu, 23 Jun 2022 09:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354728.582002; Thu, 23 Jun 2022 09:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JPl-0000QE-1r; Thu, 23 Jun 2022 09:46:17 +0000
Received: by outflank-mailman (input) for mailman id 354728;
 Thu, 23 Jun 2022 09:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4JPj-0008LX-2z
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:46:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50b0d5a3-f2d9-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:46:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B5AB21D14;
 Thu, 23 Jun 2022 09:46:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE492133A6;
 Thu, 23 Jun 2022 09:46:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EFUOLWM2tGLmLwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 09:46:11 +0000
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
X-Inumbo-ID: 50b0d5a3-f2d9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655977572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYI7V/dmnXpWZM2zlRb/pc+ci8hD5Th5E8mJSClVr9Q=;
	b=ibWYLSIpJW3cxc8VSyWjDZrMrjlU3h6E5ttl0nic13fOU+GJYulTpVShiW7JRjZs1Cdb/g
	3Sm4LdhKI2YpIuuRVieTgokm3PWXoIahWFwWWt60PzWC0PDY9EPCX1U7ReIJOg3y7Oi81V
	XzYONG1YZZnLXEbgbiBqj/5espOq4aw=
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
Subject: [PATCH v2 3/3] x86: fix .brk attribute in linker script
Date: Thu, 23 Jun 2022 11:46:08 +0200
Message-Id: <20220623094608.7294-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220623094608.7294-1-jgross@suse.com>
References: <20220623094608.7294-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
added the "NOLOAD" attribute to the .brk section as a "failsafe"
measure.

Unfortunately this leads to the linker no longer covering the .brk
section in a program header, resulting in the kernel loader not knowing
that the memory for the .brk section must be reserved.

This has led to crashes when loading the kernel as PV dom0 under Xen,
but other scenarios could be hit by the same problem (e.g. in case an
uncompressed kernel is used and the initrd is placed directly behind
it).

So drop the "NOLOAD" attribute. This has been verified to correctly
cover the .brk section by a program header of the resulting ELF file.

Fixes: e32683c6f7d2 ("x86/mm: Fix RESERVE_BRK() for older binutils")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 81aba718ecd5..9487ce8c13ee 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -385,7 +385,7 @@ SECTIONS
 	__end_of_kernel_reserve = .;
 
 	. = ALIGN(PAGE_SIZE);
-	.brk (NOLOAD) : AT(ADDR(.brk) - LOAD_OFFSET) {
+	.brk : AT(ADDR(.brk) - LOAD_OFFSET) {
 		__brk_base = .;
 		. += 64 * 1024;		/* 64k alignment slop space */
 		*(.bss..brk)		/* areas brk users have reserved */
-- 
2.35.3


