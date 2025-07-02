Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D4AF0DB1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030432.1404105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshv-0004MZ-K5; Wed, 02 Jul 2025 08:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030432.1404105; Wed, 02 Jul 2025 08:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWshv-0004LE-Ee; Wed, 02 Jul 2025 08:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1030432;
 Wed, 02 Jul 2025 08:20:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsaq-00082X-Bm
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbef403-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:22 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 12C702117F;
 Wed,  2 Jul 2025 08:13:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D154A13A24;
 Wed,  2 Jul 2025 08:13:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lIe6MR/qZGgKSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:19 +0000
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
X-Inumbo-ID: 6bbef403-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htojwPjo5A/RDFHxCU3Tp6Z00hTGIFV3R4TmEvlvLDM=;
	b=sNil9WMRqbOF8i/cIJmCEKpdGC2Y19ZrCU5pJeM5pWZ9nlU78bnsqWJl0bzhaKhg+ascrZ
	gnY7dJtBfH+C1rVGYZwhKEBR2aFy3CnuZahnuR3JArVYIpGhXAP45D6r2N7UP16xTLwFAY
	SzsJPYsQO7JP3HhooDfAyuAi2sWK1DY=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sNil9WMR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htojwPjo5A/RDFHxCU3Tp6Z00hTGIFV3R4TmEvlvLDM=;
	b=sNil9WMRqbOF8i/cIJmCEKpdGC2Y19ZrCU5pJeM5pWZ9nlU78bnsqWJl0bzhaKhg+ascrZ
	gnY7dJtBfH+C1rVGYZwhKEBR2aFy3CnuZahnuR3JArVYIpGhXAP45D6r2N7UP16xTLwFAY
	SzsJPYsQO7JP3HhooDfAyuAi2sWK1DY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 04/19] time: unbind VIRQ_TIMER across kexec
Date: Wed,  2 Jul 2025 10:12:39 +0200
Message-ID: <20250702081254.14383-5-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 12C702117F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
X-Spam-Level: 

Deactivate the VIRQ_TIMER event when doing kexec() in order to be
able to set it up again in the new kernel.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/time.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/time.c b/arch/x86/time.c
index 52916e15..3a2a1d29 100644
--- a/arch/x86/time.c
+++ b/arch/x86/time.c
@@ -36,6 +36,7 @@
 #include <mini-os/types.h>
 #include <mini-os/hypervisor.h>
 #include <mini-os/events.h>
+#include <mini-os/kexec.h>
 #include <mini-os/time.h>
 #include <mini-os/lib.h>
 
@@ -193,3 +194,16 @@ void fini_time(void)
     HYPERVISOR_set_timer_op(0);
     unbind_evtchn(port);
 }
+
+#ifdef CONFIG_KEXEC
+static int unbind_virq_timer(bool undo)
+{
+    if ( undo )
+        init_time();
+    else
+        fini_time();
+
+    return 0;
+}
+kexec_call(unbind_virq_timer);
+#endif
-- 
2.43.0


