Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690127F9D67
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641722.1000534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YoF-00010v-MA; Mon, 27 Nov 2023 10:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641722.1000534; Mon, 27 Nov 2023 10:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YoF-0000xt-Gb; Mon, 27 Nov 2023 10:25:47 +0000
Received: by outflank-mailman (input) for mailman id 641722;
 Mon, 27 Nov 2023 10:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YoD-0008NG-Dc
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:25:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5169d7ec-8d0f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:25:42 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 31D6C21B08;
 Mon, 27 Nov 2023 10:25:42 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 09058132A6;
 Mon, 27 Nov 2023 10:25:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Oaj9AKZuZGWLfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:25:42 +0000
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
X-Inumbo-ID: 5169d7ec-8d0f-11ee-9b0e-b553b5be7939
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 03/32] Mini-OS: add EXPORT_SYMBOL() instances to kernel.c
Date: Mon, 27 Nov 2023 11:24:54 +0100
Message-Id: <20231127102523.28003-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *********************
X-Spamd-Bar: +++++++++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [21.50 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 BAYES_SPAM(0.00)[16.52%];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MX_GOOD(-0.01)[];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 21.50
X-Rspamd-Queue-Id: 31D6C21B08
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to kernel.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 kernel.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel.c b/kernel.c
index 1f97d8dd..0b444940 100644
--- a/kernel.c
+++ b/kernel.c
@@ -50,6 +50,9 @@
 #include <xen/features.h>
 #include <xen/version.h>
 
+void _start(void);
+EXPORT_SYMBOL(_start);
+
 uint8_t xen_features[XENFEAT_NR_SUBMAPS * 32];
 char cmdline[MAX_CMDLINE_SIZE];
 
@@ -181,6 +184,7 @@ void stop_kernel(void)
     /* Reset arch details */
     arch_fini();
 }
+EXPORT_SYMBOL(stop_kernel);
 
 /*
  * do_exit: This is called whenever an IRET fails in entry.S.
@@ -199,3 +203,4 @@ void do_exit(void)
         HYPERVISOR_sched_op(SCHEDOP_shutdown, &sched_shutdown);
     }
 }
+EXPORT_SYMBOL(do_exit);
-- 
2.35.3


