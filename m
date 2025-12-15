Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48483CBD9F5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186907.1508337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV76n-0004Sg-Ei; Mon, 15 Dec 2025 11:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186907.1508337; Mon, 15 Dec 2025 11:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV76n-0004QB-CA; Mon, 15 Dec 2025 11:51:21 +0000
Received: by outflank-mailman (input) for mailman id 1186907;
 Mon, 15 Dec 2025 11:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJJs=6V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vV76l-0004Q5-OI
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:51:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d2b465a-d9ac-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:51:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 546C25BD26;
 Mon, 15 Dec 2025 11:51:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBACD3EA63;
 Mon, 15 Dec 2025 11:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OVl8MzP2P2kPEAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 15 Dec 2025 11:51:15 +0000
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
X-Inumbo-ID: 5d2b465a-d9ac-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1765799476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zofGwPLby7nvfeoCr3/JFRizKbFgb4qmHExK0anYVbc=;
	b=j/l6OXtnPlyFD+aK0AfVx+S/6mNNID4/6LFos7reMAxgwuGGFpOs7Lz/3OgUBgT/659Mh0
	KmJfnQDMMqsW/C3DvVBMU406jezgjktFIjGNr7uejhhLZP3cm++683/uZ/pgBkqNYB8t4s
	dknWjtRlk2r9Vir12LPzyzfQIJTQx1U=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1765799476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zofGwPLby7nvfeoCr3/JFRizKbFgb4qmHExK0anYVbc=;
	b=j/l6OXtnPlyFD+aK0AfVx+S/6mNNID4/6LFos7reMAxgwuGGFpOs7Lz/3OgUBgT/659Mh0
	KmJfnQDMMqsW/C3DvVBMU406jezgjktFIjGNr7uejhhLZP3cm++683/uZ/pgBkqNYB8t4s
	dknWjtRlk2r9Vir12LPzyzfQIJTQx1U=
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
	xen-devel@lists.xenproject.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] x86/xen: Fix sparse warning in enlighten_pv.c
Date: Mon, 15 Dec 2025 12:51:12 +0100
Message-ID: <20251215115112.15072-1-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]

The sparse tool issues a warning for arch/x76/xen/enlighten_pv.c:

   arch/x86/xen/enlighten_pv.c:120:9: sparse: sparse: incorrect type
     in initializer (different address spaces)
     expected void const [noderef] __percpu *__vpp_verify
     got bool *

This is due to the percpu variable xen_in_preemptible_hcall being
exported via EXPORT_SYMBOL_GPL() instead of EXPORT_PER_CPU_SYMBOL_GPL().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512140856.Ic6FetG6-lkp@intel.com/
Fixes: fdfd811ddde3 ("x86/xen: allow privcmd hypercalls to be preempted")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4806cc28d7ca..b74ff8bc7f2a 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -108,7 +108,7 @@ static int xen_cpu_dead_pv(unsigned int cpu);
  * calls.
  */
 DEFINE_PER_CPU(bool, xen_in_preemptible_hcall);
-EXPORT_SYMBOL_GPL(xen_in_preemptible_hcall);
+EXPORT_PER_CPU_SYMBOL_GPL(xen_in_preemptible_hcall);
 
 /*
  * In case of scheduling the flag must be cleared and restored after
-- 
2.51.0


