Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ja8DFGa72kbDQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:18:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F6477114
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 19:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295148.1571839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPap-0008GT-M6; Mon, 27 Apr 2026 17:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295148.1571839; Mon, 27 Apr 2026 17:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPap-0008Fb-Is; Mon, 27 Apr 2026 17:17:59 +0000
Received: by outflank-mailman (input) for mailman id 1295148;
 Mon, 27 Apr 2026 17:17:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1wHPan-0008E3-U1
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:17:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHPan-00DDcu-Al
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 19:17:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a40-bab6-0a2a0a5309dd-0a2a4502df54-14
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:17:57 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a44-af86-0a2a45020019-ac6904fe96d8-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:17:57 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D6C426024D;
 Mon, 27 Apr 2026 17:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B91DC2BCB9;
 Mon, 27 Apr 2026 17:17:32 +0000 (UTC)
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
	s=k20201202; t=1777310275;
	bh=W5kkD2qOaf9p6y+JEmiY6YQ2keZoelr0Bif5djAA9uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dWIdgH61f3FZjJK5/4M8qA2Z3PdTv2PxzuZWcauBhk9DdVxbBkauIdrH8T66hguCp
	 RKByLYUodinjcBlbYhttuH2LGK1CACi5Chox46drqrLCValqYMs6iS6hvWfa8xjP86
	 SRX8mzMn7HjzzZ5PMWVnIWvrJFLR/iyEIDn4Oi2BFSrDeboqSnIrX7WfhL6Ub+tY2g
	 I0hH+wNzy6c//f0TkDzcuax+fX8WXY8rTh4FJ51XM25PFd/tzjClOdpIOdXk4NjGqA
	 oBIlgUIOAdKFgg5RvdKRR4Lqk1Q+lbng1I1sXXDqtORIX/zFE6g7Yv8vrz97KbzGDV
	 XrdmpG3tF9W3Q==
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
Subject: [RFC PATCH v1 3/9] x86/umip: Be stricter in fixup_umip_exception()
Date: Mon, 27 Apr 2026 19:13:44 +0200
Message-ID: <9e8e43d4f81d8f8b6f68311f1c6f859d718d36e4.1777306795.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1777306795.git.chleroy@kernel.org>
References: <cover.1777306795.git.chleroy@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=chleroy@kernel.org; h=from:subject:message-id; bh=W5kkD2qOaf9p6y+JEmiY6YQ2keZoelr0Bif5djAA9uo=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWS+nxnda1Jdur5TX+RgO1P4hHufdruHR358Lz3BYPORx G8pRRuZOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBE9kkxMjTtX+zW2RH44ELN UZ/TjtH3Kj+Uzdh01e2y7qEZTgrchx8y/E9kjcpJ3dj/tNZwXUT0XHGmyS9k3dX75mj427u7JaY VMwMA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777310277-896CC161-549AF82A/0/0
X-purgate-type: clean
X-purgate-size: 1002
X-Rspamd-Queue-Id: EC0F6477114
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

fixup_umip_exception() calls copy_to_user() and checks whether
the returned value is strictly positive.

A subsequent patch will change the return of copy_to_user() to
return -EFAULT in case of error.

Change the test to checking that the result is not 0.

At the time being copy_to_user() return an unsigned value so
'strictly positive' is the same as 'not 0'.

Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/x86/kernel/umip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/umip.c b/arch/x86/kernel/umip.c
index 3ce99cbcf187..dfff28ea1dea 100644
--- a/arch/x86/kernel/umip.c
+++ b/arch/x86/kernel/umip.c
@@ -409,7 +409,7 @@ bool fixup_umip_exception(struct pt_regs *regs)
 			return false;
 
 		nr_copied = copy_to_user(uaddr, dummy_data, dummy_data_size);
-		if (nr_copied  > 0) {
+		if (nr_copied) {
 			/*
 			 * If copy fails, send a signal and tell caller that
 			 * fault was fixed up.
-- 
2.49.0


