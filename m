Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A537F9DCE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641915.1000964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2d-0007AF-AG; Mon, 27 Nov 2023 10:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641915.1000964; Mon, 27 Nov 2023 10:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z2d-00077d-6M; Mon, 27 Nov 2023 10:40:39 +0000
Received: by outflank-mailman (input) for mailman id 641915;
 Mon, 27 Nov 2023 10:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YqS-0004NR-8Q
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:28:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ac04e8-8d0f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:28:00 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B50E202A8;
 Mon, 27 Nov 2023 10:28:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2281C132A6;
 Mon, 27 Nov 2023 10:28:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OMI+BzBvZGU5fwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:28:00 +0000
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
X-Inumbo-ID: a3ac04e8-8d0f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycr4nnyHBdDBvJ+GYl2PkdDbUSfnWvY3qJvRrp1NPfg=;
	b=vBupVY1PuNl1EfwC9Apaf9wlKHRObRIQCO3YZhGXiqzByrlf5kNtMSkZJHMnqOv9qEIV+Q
	mr68zz+1opApUf/rSqpkVoIKviQhIPxRjjy/iePlFVxlcbnOQb0hvR3u5nVlr8H6jc6QKX
	7ZmuWdAEujUFYX4cw8FrSottaKdzqvU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 28/32] Mini-OS: add EXPORT_SYMBOL() instances to tpmback.c
Date: Mon, 27 Nov 2023 11:25:19 +0100
Message-Id: <20231127102523.28003-29-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spam-Score: 4.82
X-Spamd-Result: default: False [4.82 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(1.12)[82.74%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

Add the needed instances of EXPORT_SYMBOL() to tpmback.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tpmback.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tpmback.c b/tpmback.c
index 22adbd32..ab0df127 100644
--- a/tpmback.c
+++ b/tpmback.c
@@ -804,6 +804,7 @@ void* tpmback_get_opaque(domid_t domid, unsigned int handle)
 
    return tpmif->opaque;
 }
+EXPORT_SYMBOL(tpmback_get_opaque);
 
 int tpmback_set_opaque(domid_t domid, unsigned int handle, void *opaque)
 {
@@ -816,6 +817,7 @@ int tpmback_set_opaque(domid_t domid, unsigned int handle, void *opaque)
    tpmif->opaque = opaque;
    return 0;
 }
+EXPORT_SYMBOL(tpmback_set_opaque);
 
 unsigned char* tpmback_get_uuid(domid_t domid, unsigned int handle)
 {
@@ -827,6 +829,7 @@ unsigned char* tpmback_get_uuid(domid_t domid, unsigned int handle)
 
    return tpmif->uuid;
 }
+EXPORT_SYMBOL(tpmback_get_uuid);
 
 int tpmback_get_peercontext(domid_t domid, unsigned int handle, void* buffer, int buflen)
 {
@@ -838,6 +841,7 @@ int tpmback_get_peercontext(domid_t domid, unsigned int handle, void* buffer, in
 
    return evtchn_get_peercontext(tpmif->evtchn, buffer, buflen);
 }
+EXPORT_SYMBOL(tpmback_get_peercontext);
 
 static void event_listener(void)
 {
@@ -903,6 +907,7 @@ void init_tpmback(void (*open_cb)(domid_t, unsigned int), void (*close_cb)(domid
    eventthread = create_thread("tpmback-listener", event_thread, NULL);
 
 }
+EXPORT_SYMBOL(init_tpmback);
 
 void shutdown_tpmback(void)
 {
@@ -923,6 +928,7 @@ void shutdown_tpmback(void)
    wake_up(&waitq);
    schedule();
 }
+EXPORT_SYMBOL(shutdown_tpmback);
 
 static void init_tpmcmd(tpmcmd_t* tpmcmd, domid_t domid, unsigned int handle, void *opaque)
 {
@@ -1061,6 +1067,7 @@ tpmcmd_t* tpmback_req_any(void)
    TPMBACK_ERR("backend request ready flag was set but no interfaces were actually ready\n");
    return NULL;
 }
+EXPORT_SYMBOL(tpmback_req_any);
 
 tpmcmd_t* tpmback_req(domid_t domid, unsigned int handle)
 {
@@ -1081,6 +1088,7 @@ tpmcmd_t* tpmback_req(domid_t domid, unsigned int handle)
 
    return get_request(tpmif);
 }
+EXPORT_SYMBOL(tpmback_req);
 
 void tpmback_resp(tpmcmd_t* tpmcmd)
 {
@@ -1108,6 +1116,7 @@ end:
    free(tpmcmd);
    return;
 }
+EXPORT_SYMBOL(tpmback_resp);
 
 int tpmback_wait_for_frontend_connect(domid_t *domid, unsigned int *handle)
 {
@@ -1125,8 +1134,10 @@ int tpmback_wait_for_frontend_connect(domid_t *domid, unsigned int *handle)
 
    return 0;
 }
+EXPORT_SYMBOL(tpmback_wait_for_frontend_connect);
 
 int tpmback_num_frontends(void)
 {
    return gtpmdev.num_tpms;
 }
+EXPORT_SYMBOL(tpmback_num_frontends);
-- 
2.35.3


