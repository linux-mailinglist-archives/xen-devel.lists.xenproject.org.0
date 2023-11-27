Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932427F9D9E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641771.1000635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yxu-0007xy-MU; Mon, 27 Nov 2023 10:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641771.1000635; Mon, 27 Nov 2023 10:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yxu-0007vG-J5; Mon, 27 Nov 2023 10:35:46 +0000
Received: by outflank-mailman (input) for mailman id 641771;
 Mon, 27 Nov 2023 10:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yqa-0000Co-JG
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:28:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa4770a9-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:28:12 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5495621BFD;
 Mon, 27 Nov 2023 10:28:11 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AD2F132A6;
 Mon, 27 Nov 2023 10:28:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 2swsCTtvZGVNfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:28:11 +0000
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
X-Inumbo-ID: aa4770a9-8d0f-11ee-98e2-6d05b1d4d9a1
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 30/32] Mini-OS: add EXPORT_SYMBOL() instances to tpm_tis.c
Date: Mon, 27 Nov 2023 11:25:21 +0100
Message-Id: <20231127102523.28003-31-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++++++++++
X-Spam-Score: 15.33
X-Rspamd-Server: rspamd1
X-Spam-Level: ***************
X-Rspamd-Queue-Id: 5495621BFD
X-Spam-Flag: YES
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [15.33 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 BAYES_SPAM(1.53)[86.00%];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam: Yes

Add the needed instances of EXPORT_SYMBOL() to tpm_tis.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tpm_tis.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tpm_tis.c b/tpm_tis.c
index c3998f2d..ad95e289 100644
--- a/tpm_tis.c
+++ b/tpm_tis.c
@@ -673,6 +673,7 @@ int tpm_tis_request_locality(struct tpm_chip* tpm, int l) {
    printk("REQ LOCALITY FAILURE\n");
    return -1;
 }
+EXPORT_SYMBOL(tpm_tis_request_locality);
 
 static uint8_t tpm_tis_status(struct tpm_chip* tpm) {
    return ioread8(TPM_STS(tpm, tpm->locality));
@@ -1264,6 +1265,7 @@ abort_egress:
    }
    return NULL;
 }
+EXPORT_SYMBOL(init_tpm_tis);
 
 int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** resp, size_t* resplen)
 {
@@ -1281,6 +1283,7 @@ int tpm_tis_cmd(struct tpm_chip* tpm, uint8_t* req, size_t reqlen, uint8_t** res
    memcpy(*resp, tpm->data_buffer, *resplen);
    return 0;
 }
+EXPORT_SYMBOL(tpm_tis_cmd);
 
 #ifdef HAVE_LIBC
 #include <sys/stat.h>
@@ -1392,6 +1395,7 @@ int tpm_tis_open(struct tpm_chip *tpm)
 
     return tpm->fd;
 }
+EXPORT_SYMBOL(tpm_tis_open);
 
 /* TPM 2.0 */
 
@@ -1550,4 +1554,5 @@ abort_egress:
     }
     return NULL;
 }
+EXPORT_SYMBOL(init_tpm2_tis);
 #endif
-- 
2.35.3


