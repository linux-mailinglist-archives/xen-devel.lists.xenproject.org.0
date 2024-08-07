Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31094A599
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 12:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773302.1183771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdzV-0006jY-2f; Wed, 07 Aug 2024 10:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773302.1183771; Wed, 07 Aug 2024 10:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdzU-0006gl-Tk; Wed, 07 Aug 2024 10:34:00 +0000
Received: by outflank-mailman (input) for mailman id 773302;
 Wed, 07 Aug 2024 10:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sbdzT-0006Kl-Mh
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 10:33:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e3dd574-54a8-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 12:33:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF7AE1F86A;
 Wed,  7 Aug 2024 10:33:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F69213297;
 Wed,  7 Aug 2024 10:33:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xoCyGZZNs2b3HwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Aug 2024 10:33:58 +0000
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
X-Inumbo-ID: 8e3dd574-54a8-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723026838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=39Sts4C7oOClwSNtkpQ1zmallaopCCgiNRjix3mq5lw=;
	b=cp39cEpulefVdJvWEbkFEXb/5Sp9ly9hCFrGYQI5Qf7h206XcUY8ulLm2WXOg12OTFD0il
	ifZLdzXja31H7tveD0eID8tzH3YaW8MweJKThiNL9geUACCQ0BFLu8ah6p26kYSSEOO3H3
	kp9HCu1Yjt0eniKv7W1OZuXDak5J1Ac=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1723026838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=39Sts4C7oOClwSNtkpQ1zmallaopCCgiNRjix3mq5lw=;
	b=cp39cEpulefVdJvWEbkFEXb/5Sp9ly9hCFrGYQI5Qf7h206XcUY8ulLm2WXOg12OTFD0il
	ifZLdzXja31H7tveD0eID8tzH3YaW8MweJKThiNL9geUACCQ0BFLu8ah6p26kYSSEOO3H3
	kp9HCu1Yjt0eniKv7W1OZuXDak5J1Ac=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/5] xen: move checks for e820 conflicts further up
Date: Wed,  7 Aug 2024 12:33:34 +0200
Message-ID: <20240807103338.22007-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807103338.22007-1-jgross@suse.com>
References: <20240807103338.22007-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spam-Level: 

Move the checks for e820 memory map conflicts using the
xen_chk_is_e820_usable() helper further up in order to prepare
resolving some of the possible conflicts by doing some e820 map
modifications, which must happen before evaluating the RAM layout.

Signed-off-by: Juergen Gross <jgross@suse.com>
Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 arch/x86/xen/setup.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 96765180514b..dba68951ed6b 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -764,6 +764,28 @@ char * __init xen_memory_setup(void)
 	/* Make sure the Xen-supplied memory map is well-ordered. */
 	e820__update_table(&xen_e820_table);
 
+	/*
+	 * Check whether the kernel itself conflicts with the target E820 map.
+	 * Failing now is better than running into weird problems later due
+	 * to relocating (and even reusing) pages with kernel text or data.
+	 */
+	xen_chk_is_e820_usable(__pa_symbol(_text),
+			       __pa_symbol(_end) - __pa_symbol(_text),
+			       "kernel");
+
+	/*
+	 * Check for a conflict of the xen_start_info memory with the target
+	 * E820 map.
+	 */
+	xen_chk_is_e820_usable(__pa(xen_start_info), sizeof(*xen_start_info),
+			       "xen_start_info");
+
+	/*
+	 * Check for a conflict of the hypervisor supplied page tables with
+	 * the target E820 map.
+	 */
+	xen_pt_check_e820();
+
 	max_pages = xen_get_max_pages();
 
 	/* How many extra pages do we need due to remapping? */
@@ -836,28 +858,6 @@ char * __init xen_memory_setup(void)
 
 	e820__update_table(e820_table);
 
-	/*
-	 * Check whether the kernel itself conflicts with the target E820 map.
-	 * Failing now is better than running into weird problems later due
-	 * to relocating (and even reusing) pages with kernel text or data.
-	 */
-	xen_chk_is_e820_usable(__pa_symbol(_text),
-			       __pa_symbol(_end) - __pa_symbol(_text),
-			       "kernel");
-
-	/*
-	 * Check for a conflict of the xen_start_info memory with the target
-	 * E820 map.
-	 */
-	xen_chk_is_e820_usable(__pa(xen_start_info), sizeof(*xen_start_info),
-			       "xen_start_info");
-
-	/*
-	 * Check for a conflict of the hypervisor supplied page tables with
-	 * the target E820 map.
-	 */
-	xen_pt_check_e820();
-
 	xen_reserve_xen_mfnlist();
 
 	/* Check for a conflict of the initrd with the target E820 map. */
-- 
2.43.0


