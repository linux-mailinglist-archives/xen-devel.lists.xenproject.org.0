Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Hy2Hqea72kUDQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:19:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD84773A5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295196.1571894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPcG-0002rs-Bd; Mon, 27 Apr 2026 17:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295196.1571894; Mon, 27 Apr 2026 17:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPcG-0002qG-7r; Mon, 27 Apr 2026 17:19:28 +0000
Received: by outflank-mailman (input) for mailman id 1295196;
 Mon, 27 Apr 2026 17:19:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1wHPcF-0002pV-0A
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:19:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHPcE-009MNW-Cz
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 19:19:26 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a9c-2eae-0a2a0a5409dd-0a2a4501bcd8-4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:19:26 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a9d-c1f2-0a2a45010019-ac6904fea574-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:19:26 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 180046024D;
 Mon, 27 Apr 2026 17:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25EEC2BCB7;
 Mon, 27 Apr 2026 17:19:12 +0000 (UTC)
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
	s=k20201202; t=1777310364;
	bh=xblTv37x9V4gU3cvmA9ILfz6xXNOv0sNe2zU9C6a5nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8kV5Zhk7HZbxy8X7mxqUL5UgTTJPPuuLtSKHKOe5PwbIiNodL9/7ESxRbcOMv4dB
	 NN/pd897F5mMQZv6MW+RM/3mikWvqmJGQCtupbd6YHiobStaCQu79RRkwt3Bs1rL/A
	 WmXtcy3vIzgejB2MGSu6MrKJ33itreKKdFlemNypyCUExoUHGXA1bHbqFqaNX4ujdd
	 iXZiXWTV/w69yfgs2V8e+zdWAilhhtsvDDxzPIT8CbbievjXPmrPwVloE5aoqLKmYP
	 ca2+sf92YJQm2mLHcpyNlGd6mMQP6QhUed6Hx8vk/CloBjO7tSgz4fayv+CeXka+Fz
	 NwGM6tvALNVmQ==
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
Subject: [RFC PATCH v1 9/9] uaccess: Convert small fixed size copy_{to/from}_user() to scoped user access
Date: Mon, 27 Apr 2026 19:13:50 +0200
Message-ID: <8780eb2ef80575931a339e5225bc80eb13e9be6c.1777306795.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1777306795.git.chleroy@kernel.org>
References: <cover.1777306795.git.chleroy@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3638; i=chleroy@kernel.org; h=from:subject:message-id; bh=xblTv37x9V4gU3cvmA9ILfz6xXNOv0sNe2zU9C6a5nw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWS+nxlr/n9yu2DE7uwkCZGbl0uCp6Y1JLvZTPpz+P/PY xNqPMoaOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBE9HwZ/ns82Ho9PV2Q+7Pp 5fqvs6O/v3YN+3EgL+Wk4b/co1rlkZ8YGVZxmDl7XFiUcmPSTPW14WGSHT6/1u4pcTY2cjD0U7P bzAkA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777310366-BCC6CFF4-9C02882D/0/0
X-purgate-type: clean
X-purgate-size: 3640
X-Rspamd-Queue-Id: 27BD84773A5
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

copy_{to/from}_user() is a heavy function optimised for copy of large
blocs of memory between user and kernel space.

When the number of bytes to be copied is known at build time and small,
using scoped user access removes the burden of that optimisation.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 include/linux/uaccess.h | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 33b7d0f5f808..3ac544527af2 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -50,6 +50,8 @@
  #define mask_user_address(src) (src)
 #endif
 
+#define SMALL_COPY_USER		64
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
@@ -191,6 +193,9 @@ _inline_copy_from_user(void *to, const void __user *from, unsigned long n)
 	return res;
 }
 
+static __always_inline __must_check unsigned long
+_small_copy_from_user(void *to, const void __user *from, unsigned long n);
+
 extern __must_check unsigned long
 _copy_from_user(void *, const void __user *, unsigned long);
 
@@ -207,6 +212,9 @@ _inline_copy_to_user(void __user *to, const void *from, unsigned long n)
 	return n;
 }
 
+static __always_inline __must_check unsigned long
+_small_copy_to_user(void __user *to, const void *from, unsigned long n);
+
 extern __must_check unsigned long
 _copy_to_user(void __user *, const void *, unsigned long);
 
@@ -215,6 +223,8 @@ copy_from_user_common(void *to, const void __user *from, unsigned long n, bool p
 {
 	if (!check_copy_size(to, n, false))
 		return n;
+	if (!partial && __builtin_constant_p(n) && n <= SMALL_COPY_USER)
+		return _small_copy_from_user(to, from, n);
 	if (IS_ENABLED(ARCH_WANTS_NOINLINE_COPY_USER))
 		return _copy_from_user(to, from, n);
 	else
@@ -239,6 +249,8 @@ copy_to_user_common(void __user *to, const void *from, unsigned long n, bool par
 	if (!check_copy_size(from, n, true))
 		return n;
 
+	if (!partial && __builtin_constant_p(n) && n <= SMALL_COPY_USER)
+		return _small_copy_to_user(to, from, n);
 	if (IS_ENABLED(ARCH_WANTS_NOINLINE_COPY_USER))
 		return _copy_to_user(to, from, n);
 	else
@@ -838,6 +850,41 @@ for (bool done = false; !done; done = true)					\
 #define scoped_user_rw_access(uptr, elbl)				\
 	scoped_user_rw_access_size(uptr, sizeof(*(uptr)), elbl)
 
+static __always_inline __must_check unsigned long
+_small_copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	might_fault();
+	instrument_copy_from_user_before(to, from, n);
+	scoped_user_read_access_size(from, n, failed) {
+		/*
+		 * Ensure that bad access_ok() speculation will not lead
+		 * to nasty side effects *after* the copy is finished:
+		 */
+		if (!can_do_masked_user_access())
+			barrier_nospec();
+		unsafe_copy_from_user(to, from, n, failed);
+	}
+	instrument_copy_from_user_after(to, from, n, 0);
+	return 0;
+failed:
+	instrument_copy_from_user_after(to, from, n, n);
+	return n;
+}
+
+static __always_inline __must_check unsigned long
+_small_copy_to_user(void __user *to, const void *from, unsigned long n)
+{
+	might_fault();
+	if (should_fail_usercopy())
+		return n;
+	instrument_copy_to_user(to, from, n);
+	scoped_user_write_access_size(to, n, failed)
+		unsafe_copy_to_user(to, from, n, failed);
+	return 0;
+failed:
+	return n;
+}
+
 /**
  * get_user_inline - Read user data inlined
  * @val:	The variable to store the value read from user memory
-- 
2.49.0


