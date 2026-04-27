Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMG0IIKa72kUDQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:18:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16949477279
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295169.1571867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPbd-0001Ln-Ms; Mon, 27 Apr 2026 17:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295169.1571867; Mon, 27 Apr 2026 17:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPbd-0001KE-J7; Mon, 27 Apr 2026 17:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1295169;
 Mon, 27 Apr 2026 17:18:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1wHPbc-0001Jb-DX
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:18:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHPbb-00GS5q-Qd
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 19:18:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a6a-5cb7-0a2a0a5109dd-0a2a450adc26-26
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:18:47 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a76-56b3-0a2a450a0019-aceafc1f9b1a-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:18:47 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E16F243CD6;
 Mon, 27 Apr 2026 17:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5390FC2BCB4;
 Mon, 27 Apr 2026 17:18:33 +0000 (UTC)
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
	s=k20201202; t=1777310325;
	bh=x+yz+Ptlr8yUKihbRCrYsj2OzN4+HDHdWj3mTkeeywo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YS9v5orti9jIm2coPKy7cH4iQCLjTYOH2T4kGrmAKw1lk2UpD8UcWDut4XHtMo5CX
	 290KHU3PNOVzMmnTKEL1o/OfzgOnzBVsJnbuGicRbc3HqjVsrjLo1DZ4Ncwz6tafWZ
	 SG8/hG1Ct8pUgSHrDrW4chwaJ34uCldA2tlOQo4bI8M4kMxsW5bP0OLNOAC7BeTwPk
	 Mil/pgBJA2/iCGWwmbEh5WNZZrQ4Md/gtqmnREocwFdhobkWjiqhIB30lRO/GV15k3
	 DZOePxOSt4vdcYmGqKSVWX7R1FegGyxqEmqkjMUEcFWkKzHsBpXNo8/6bbP3EGANbq
	 KZwGUUWEURiLg==
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
Subject: [RFC PATCH v1 6/9] uaccess: Change copy_{to/from}_user to return -EFAULT
Date: Mon, 27 Apr 2026 19:13:47 +0200
Message-ID: <1a55107abe15dd78450888e2b5327c3a56af29b7.1777306795.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1777306795.git.chleroy@kernel.org>
References: <cover.1777306795.git.chleroy@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416; i=chleroy@kernel.org; h=from:subject:message-id; bh=x+yz+Ptlr8yUKihbRCrYsj2OzN4+HDHdWj3mTkeeywo=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWS+nxkjryH88LzkjscmK202zhcwuOPhcJTlidTVNdtCP 9vs/VPG2lHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAm0nCN4b9/yT75hpDtr4zk 9XPfORmtVO2p/XH+8bFg730PPNfMvn6dkWHDjsJSC09Vr9bDobdrxTgfMm1ckveKR+Rkud3skLM HLXgA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777310327-CEB778B7-CD0BDB58/0/0
X-purgate-type: clean
X-purgate-size: 2418
X-Rspamd-Queue-Id: 16949477279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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

Now that copy_{to/from}_user_partial() are used by callers which expect
partial copy with number of not copied bytes as return value, change
copy_{to/from}_user() to return an int, and return -EFAULT when the
copy is not complete.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 include/linux/uaccess.h | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 2d37173782b3..33b7d0f5f808 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -211,7 +211,7 @@ extern __must_check unsigned long
 _copy_to_user(void __user *, const void *, unsigned long);
 
 static __always_inline unsigned long __must_check
-copy_from_user(void *to, const void __user *from, unsigned long n)
+copy_from_user_common(void *to, const void __user *from, unsigned long n, bool partial)
 {
 	if (!check_copy_size(to, n, false))
 		return n;
@@ -221,10 +221,20 @@ copy_from_user(void *to, const void __user *from, unsigned long n)
 		return _inline_copy_from_user(to, from, n);
 }
 
-#define copy_from_user_partial copy_from_user
+static __always_inline unsigned long __must_check
+copy_from_user_partial(void *to, const void __user *from, unsigned long n)
+{
+	return copy_from_user_common(to, from, n, true);
+}
+
+static __always_inline int __must_check
+copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	return copy_from_user_common(to, from, n, false) ? -EFAULT : 0;
+}
 
 static __always_inline unsigned long __must_check
-copy_to_user(void __user *to, const void *from, unsigned long n)
+copy_to_user_common(void __user *to, const void *from, unsigned long n, bool partial)
 {
 	if (!check_copy_size(from, n, true))
 		return n;
@@ -235,7 +245,17 @@ copy_to_user(void __user *to, const void *from, unsigned long n)
 		return _inline_copy_to_user(to, from, n);
 }
 
-#define copy_to_user_partial copy_to_user
+static __always_inline unsigned long __must_check
+copy_to_user_partial(void __user *to, const void *from, unsigned long n)
+{
+	return copy_to_user_common(to, from, n, true);
+}
+
+static __always_inline int __must_check
+copy_to_user(void __user *to, const void *from, unsigned long n)
+{
+	return copy_to_user_common(to, from, n, false) ? -EFAULT : 0;
+}
 
 #ifndef copy_mc_to_kernel
 /*
-- 
2.49.0


