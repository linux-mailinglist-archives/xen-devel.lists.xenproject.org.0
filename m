Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D84113F3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 14:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190828.340619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSI27-0007eF-3H; Mon, 20 Sep 2021 12:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190828.340619; Mon, 20 Sep 2021 12:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSI27-0007cR-0A; Mon, 20 Sep 2021 12:04:27 +0000
Received: by outflank-mailman (input) for mailman id 190828;
 Mon, 20 Sep 2021 12:04:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSI25-0007cL-89
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 12:04:25 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4ef18d8-1a0a-11ec-b86f-12813bfff9fa;
 Mon, 20 Sep 2021 12:04:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 350D92004D;
 Mon, 20 Sep 2021 12:04:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD4E513483;
 Mon, 20 Sep 2021 12:04:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qQejNMZ4SGFcIAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Sep 2021 12:04:22 +0000
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
X-Inumbo-ID: e4ef18d8-1a0a-11ec-b86f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632139463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZubaKTTsXgUFZeDqZBtaX0Nm6q+Zb0+QJDfKEe2ZOB0=;
	b=TRbibNaBw9G4ffLO9IpRWu3FotMcA752oAO1A9dRbotpmFyTBVpvcurZUpUiTsjus4WhAX
	p5bgN1t3WNH9uKH9AtdSTbqZYYGBh0IilObJrSuGDgMRJ+586GNI7L3a+B0HartVxBcRI0
	2TvIh5lA5Lr5tp6fC757ZhZnP4jql9E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: efault@gmx.de,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] x86/setup: call early_reserve_memory() earlier
Date: Mon, 20 Sep 2021 14:04:21 +0200
Message-Id: <20210920120421.29276-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit a799c2bd29d19c565 ("x86/setup: Consolidate early memory
reservations") introduced early_reserve_memory() to do all needed
initial memblock_reserve() calls in one function. Unfortunately the
call of early_reserve_memory() is done too late for Xen dom0, as in
some cases a Xen hook called by e820__memory_setup() will need those
memory reservations to have happened already.

Move the call of early_reserve_memory() before the call of
e820__memory_setup() in order to avoid such problems.

Cc: stable@vger.kernel.org
Fixes: a799c2bd29d19c565 ("x86/setup: Consolidate early memory reservations")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- update comment (Jan Beulich, Boris Petkov)
- move call down in setup_arch() (Mike Galbraith)
---
 arch/x86/kernel/setup.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 79f164141116..40ed44ead063 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -830,6 +830,20 @@ void __init setup_arch(char **cmdline_p)
 
 	x86_init.oem.arch_setup();
 
+	/*
+	 * Do some memory reservations *before* memory is added to memblock, so
+	 * memblock allocations won't overwrite it.
+	 *
+	 * After this point, everything still needed from the boot loader or
+	 * firmware or kernel text should be early reserved or marked not RAM in
+	 * e820. All other memory is free game.
+	 *
+	 * This call needs to happen before e820__memory_setup() which calls the
+	 * xen_memory_setup() on Xen dom0 which relies on the fact that those
+	 * early reservations have happened already.
+	 */
+	early_reserve_memory();
+
 	iomem_resource.end = (1ULL << boot_cpu_data.x86_phys_bits) - 1;
 	e820__memory_setup();
 	parse_setup_data();
@@ -876,18 +890,6 @@ void __init setup_arch(char **cmdline_p)
 
 	parse_early_param();
 
-	/*
-	 * Do some memory reservations *before* memory is added to
-	 * memblock, so memblock allocations won't overwrite it.
-	 * Do it after early param, so we could get (unlikely) panic from
-	 * serial.
-	 *
-	 * After this point everything still needed from the boot loader or
-	 * firmware or kernel text should be early reserved or marked not
-	 * RAM in e820. All other memory is free game.
-	 */
-	early_reserve_memory();
-
 #ifdef CONFIG_MEMORY_HOTPLUG
 	/*
 	 * Memory used by the kernel cannot be hot-removed because Linux
-- 
2.26.2


