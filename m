Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E932E992966
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811913.1224603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxlBn-0002Nf-F5; Mon, 07 Oct 2024 10:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811913.1224603; Mon, 07 Oct 2024 10:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxlBn-0002MA-CQ; Mon, 07 Oct 2024 10:42:07 +0000
Received: by outflank-mailman (input) for mailman id 811913;
 Mon, 07 Oct 2024 10:42:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4XqV=RD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sxlBm-0002M2-Ht
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:42:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cabc0e05-8498-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 12:42:04 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4C8C21C0F;
 Mon,  7 Oct 2024 10:42:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C82D132BD;
 Mon,  7 Oct 2024 10:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kbxuGPu6A2fJLAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 07 Oct 2024 10:42:03 +0000
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
X-Inumbo-ID: cabc0e05-8498-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728297723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BD5PqP23e7/83Pok91rp0zgpvGvnOoNWAFujvQURO0Y=;
	b=uXtvUwVVTWamdCCB5gkbPQvkslxeS+AD8S+d35rK1j18gHSNdXkZbY6KSMibb5uqLZ77k9
	FN3V799o9L39Sf6Q/QXuu7pAmtrAnngIbO0BEn9k9X5vkbR5H65Vc/QMt8zqqBn7wmTMFq
	t8KIn7KNpc3beG5wxA+k1bmoVvOEWXA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=uXtvUwVV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728297723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BD5PqP23e7/83Pok91rp0zgpvGvnOoNWAFujvQURO0Y=;
	b=uXtvUwVVTWamdCCB5gkbPQvkslxeS+AD8S+d35rK1j18gHSNdXkZbY6KSMibb5uqLZ77k9
	FN3V799o9L39Sf6Q/QXuu7pAmtrAnngIbO0BEn9k9X5vkbR5H65Vc/QMt8zqqBn7wmTMFq
	t8KIn7KNpc3beG5wxA+k1bmoVvOEWXA=
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
	Niels Dettenbach <nd@syndicat.com>
Subject: [PATCH] x86/xen: mark boot CPU of PV guest in MSR_IA32_APICBASE
Date: Mon,  7 Oct 2024 12:42:01 +0200
Message-ID: <20241007104201.15607-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4C8C21C0F
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Recent topology checks of the x86 boot code uncovered the need for
PV guests to have the boot cpu marked in the APICBASE MSR.

Fixes: 9d22c96316ac ("x86/topology: Handle bogus ACPI tables correctly")
Reported-by: Niels Dettenbach <nd@syndicat.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c12ae42dc8b..d6818c6cafda 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1032,6 +1032,10 @@ static u64 xen_do_read_msr(unsigned int msr, int *err)
 	switch (msr) {
 	case MSR_IA32_APICBASE:
 		val &= ~X2APIC_ENABLE;
+		if (smp_processor_id() == 0)
+			val |= MSR_IA32_APICBASE_BSP;
+		else
+			val &= ~MSR_IA32_APICBASE_BSP;
 		break;
 	}
 	return val;
-- 
2.43.0


