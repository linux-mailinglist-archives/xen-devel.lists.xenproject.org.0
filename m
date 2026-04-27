Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHv6Cy+a72kUDQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:17:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3947704A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:17:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295126.1571822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPa9-00079T-2Z; Mon, 27 Apr 2026 17:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295126.1571822; Mon, 27 Apr 2026 17:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPa8-00077L-VI; Mon, 27 Apr 2026 17:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1295126;
 Mon, 27 Apr 2026 17:17:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1wHPa7-00075y-PN
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:17:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHPa7-00DDSo-67
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 19:17:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a09-bab6-0a2a0a5309dd-0a2a4509e65e-34
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:17:15 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a19-2497-0a2a45090019-aceafc1fae06-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:17:14 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 12679437DE;
 Mon, 27 Apr 2026 17:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC974C2BCB5;
 Mon, 27 Apr 2026 17:16:59 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777310232;
	bh=745VKRe61Lf8afs4o89V2mPmcfGcqMzEwAyCkwUFzR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ccnzw+capg6i/qeCJEEZZnJkaeh2P8NEABjGdQ84B8/8ElHQuhaIfwHK4KyIZjuzW
	 fShA2udW2NQ0Ct7kJfcn/Kb043ljqkq7hTjPsRqwiNPGH9FmgvMogRNjEATWGrG26g
	 6zW5qtX0OAMj+t+S60HkjDsyGYMrisyc3m/7o9VPvVvQnsaPOrT5y+ZTzyh8Xto7fx
	 AWFGU9d3c0Mo3tNoddRUR02dQmZ5LMWSNNkmTWtszo39IueJ4zsAp4+3T5NcIhGntz
	 oVxgjUbjxhRTuJF8KweLMZaWvhi+rfu1/RR3XrUIQOPEazAae4t8SpoXJ0czDjJbhT
	 7qOjNG8l7cqnA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-x25@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [RFC PATCH v1 1/9] uaccess: Split check_zeroed_user() out of usercopy.c
Date: Mon, 27 Apr 2026 19:13:42 +0200
Message-ID: <a6d39afb167871e0459946dfd6b28bc994ae3c81.1777306795.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1777306795.git.chleroy@kernel.org>
References: <cover.1777306795.git.chleroy@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4389; i=chleroy@kernel.org; h=from:subject:message-id; bh=745VKRe61Lf8afs4o89V2mPmcfGcqMzEwAyCkwUFzR4=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWS+nxmtvkzq83WmyICs092/GNmylHyYwx1uy/R0rjqso Tc19NiJjlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjCRrBxGhr1T21lnr9ow8bLw mlcX9LlDfR53LmTbs/fCv2dGAh23RTkY/gpGWFpU+sbMuNm2suHwI9OT2xZsfrLc1dbD4+idxHd 72DkA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1777310234-92D77A53-3E504FEA/0/0
X-purgate-type: clean
X-purgate-size: 4391
X-Rspamd-Queue-Id: 81E3947704A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:tglx@linutronix.de,m:chleroy@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:dmaengine@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-fsi@lists.ozlabs.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:linux-wpan@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-serial@vger.kernel.org,m:linux-usb@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-fsdevel@vger.ke
 rnel.org,m:ocfs2-devel@lists.linux.dev,m:bpf@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:linux-x25@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-sound@vger.kernel.org,m:sound-open-firmware@alsa-project.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-arch@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[chleroy@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Until commit f5a1a536fa14 ("lib: introduce copy_struct_from_user()
helper"), lib/usercopy.c was containing only the out-line version
of user copy fonctions.

That commit added function check_zeroed_user() into the same file.
Move that function into a new file named usercheck.c, so that next
patch can change usercopy.c build to a conditional build.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 lib/Makefile                    |  1 +
 lib/{usercopy.c => usercheck.c} | 22 ------------
 lib/usercopy.c                  | 62 ---------------------------------
 3 files changed, 1 insertion(+), 84 deletions(-)
 copy lib/{usercopy.c => usercheck.c} (73%)

diff --git a/lib/Makefile b/lib/Makefile
index f33a24bf1c19..7c0334d7675b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -59,6 +59,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 percpu-refcount.o rhashtable.o base64.o \
 	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
 	 generic-radix-tree.o bitmap-str.o
+obj-y += usercheck.o
 obj-y += string_helpers.o
 obj-y += hexdump.o
 obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
diff --git a/lib/usercopy.c b/lib/usercheck.c
similarity index 73%
copy from lib/usercopy.c
copy to lib/usercheck.c
index b00a3a957de6..15b0d9a18435 100644
--- a/lib/usercopy.c
+++ b/lib/usercheck.c
@@ -2,32 +2,10 @@
 #include <linux/compiler.h>
 #include <linux/errno.h>
 #include <linux/export.h>
-#include <linux/fault-inject-usercopy.h>
-#include <linux/instrumented.h>
 #include <linux/kernel.h>
-#include <linux/nospec.h>
-#include <linux/string.h>
 #include <linux/uaccess.h>
 #include <linux/wordpart.h>
 
-/* out-of-line parts */
-
-#if !defined(INLINE_COPY_FROM_USER)
-unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
-{
-	return _inline_copy_from_user(to, from, n);
-}
-EXPORT_SYMBOL(_copy_from_user);
-#endif
-
-#if !defined(INLINE_COPY_TO_USER)
-unsigned long _copy_to_user(void __user *to, const void *from, unsigned long n)
-{
-	return _inline_copy_to_user(to, from, n);
-}
-EXPORT_SYMBOL(_copy_to_user);
-#endif
-
 /**
  * check_zeroed_user: check if a userspace buffer only contains zero bytes
  * @from: Source address, in userspace.
diff --git a/lib/usercopy.c b/lib/usercopy.c
index b00a3a957de6..7a93f56d81dd 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -1,14 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/compiler.h>
-#include <linux/errno.h>
 #include <linux/export.h>
-#include <linux/fault-inject-usercopy.h>
-#include <linux/instrumented.h>
-#include <linux/kernel.h>
-#include <linux/nospec.h>
-#include <linux/string.h>
 #include <linux/uaccess.h>
-#include <linux/wordpart.h>
 
 /* out-of-line parts */
 
@@ -27,57 +19,3 @@ unsigned long _copy_to_user(void __user *to, const void *from, unsigned long n)
 }
 EXPORT_SYMBOL(_copy_to_user);
 #endif
-
-/**
- * check_zeroed_user: check if a userspace buffer only contains zero bytes
- * @from: Source address, in userspace.
- * @size: Size of buffer.
- *
- * This is effectively shorthand for "memchr_inv(from, 0, size) == NULL" for
- * userspace addresses (and is more efficient because we don't care where the
- * first non-zero byte is).
- *
- * Returns:
- *  * 0: There were non-zero bytes present in the buffer.
- *  * 1: The buffer was full of zero bytes.
- *  * -EFAULT: access to userspace failed.
- */
-int check_zeroed_user(const void __user *from, size_t size)
-{
-	unsigned long val;
-	uintptr_t align = (uintptr_t) from % sizeof(unsigned long);
-
-	if (unlikely(size == 0))
-		return 1;
-
-	from -= align;
-	size += align;
-
-	if (!user_read_access_begin(from, size))
-		return -EFAULT;
-
-	unsafe_get_user(val, (unsigned long __user *) from, err_fault);
-	if (align)
-		val &= ~aligned_byte_mask(align);
-
-	while (size > sizeof(unsigned long)) {
-		if (unlikely(val))
-			goto done;
-
-		from += sizeof(unsigned long);
-		size -= sizeof(unsigned long);
-
-		unsafe_get_user(val, (unsigned long __user *) from, err_fault);
-	}
-
-	if (size < sizeof(unsigned long))
-		val &= aligned_byte_mask(size);
-
-done:
-	user_read_access_end();
-	return (val == 0);
-err_fault:
-	user_read_access_end();
-	return -EFAULT;
-}
-EXPORT_SYMBOL(check_zeroed_user);
-- 
2.49.0


