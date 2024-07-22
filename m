Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A2938EF9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761816.1171880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryQ-0006gC-1d; Mon, 22 Jul 2024 12:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761816.1171880; Mon, 22 Jul 2024 12:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryP-0006d3-Tx; Mon, 22 Jul 2024 12:17:01 +0000
Received: by outflank-mailman (input) for mailman id 761816;
 Mon, 22 Jul 2024 12:17:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVryO-0005pO-Ea
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:17:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b003585-4824-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 14:16:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B0851FB6A;
 Mon, 22 Jul 2024 12:16:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39B69138A7;
 Mon, 22 Jul 2024 12:16:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZttyDLpNnmYiIQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 12:16:58 +0000
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
X-Inumbo-ID: 4b003585-4824-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Egb0SYtRB9pNdsEw7/uOObXIsq6lW6qyCeWg38yHfSM=;
	b=MKK4HPiHSnwTZdflIzMCKzOOigqb3aR4YLzBdUiM2OSEMdQfqzrPAojEY9yC6BXtF00kOd
	NT7vURriElgHqgD+SSumwxkqW3ur1rD01MRFkNRz8TlBTlyWh1/XUhuQVAea6cdgsXD+m1
	p9rqIuH0fA2DCB612moxIHZBansol4I=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=MKK4HPiH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Egb0SYtRB9pNdsEw7/uOObXIsq6lW6qyCeWg38yHfSM=;
	b=MKK4HPiHSnwTZdflIzMCKzOOigqb3aR4YLzBdUiM2OSEMdQfqzrPAojEY9yC6BXtF00kOd
	NT7vURriElgHqgD+SSumwxkqW3ur1rD01MRFkNRz8TlBTlyWh1/XUhuQVAea6cdgsXD+m1
	p9rqIuH0fA2DCB612moxIHZBansol4I=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/3] mini-os: remove some not needed stuff from arch/x86/time.c
Date: Mon, 22 Jul 2024 14:16:42 +0200
Message-ID: <20240722121643.18116-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722121643.18116-1-jgross@suse.com>
References: <20240722121643.18116-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.81
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6B0851FB6A
X-Spamd-Result: default: False [-3.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO

Remove unused or not needed stuff from arch/x86/time.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/time.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/x86/time.c b/arch/x86/time.c
index a473a9e1..7fd7abef 100644
--- a/arch/x86/time.c
+++ b/arch/x86/time.c
@@ -48,7 +48,6 @@ struct shadow_time_info {
     uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
     uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
     uint32_t tsc_to_nsec_mul;
-    uint32_t tsc_to_usec_mul;
     int tsc_shift;
     uint32_t version;
 };
@@ -57,19 +56,6 @@ static uint32_t shadow_ts_version;
 
 static struct shadow_time_info shadow;
 
-#ifndef rmb
-#define rmb()  __asm__ __volatile__ ("lock; addl $0,0(%%esp)" : : : "memory")
-#endif
-
-#define HANDLE_USEC_OVERFLOW(_tv)           \
-    do {                                    \
-        while ( (_tv)->tv_usec >= 1000000 ) \
-        {                                   \
-            (_tv)->tv_usec -= 1000000;      \
-            (_tv)->tv_sec++;                \
-        }                                   \
-    } while ( 0 )
-
 static inline int time_values_up_to_date(void)
 {
     struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
@@ -143,8 +129,6 @@ static void get_time_values_from_xen(void)
         shadow.tsc_shift         = src->tsc_shift;
         rmb();
     } while ( (src->version & 1) | (shadow.version ^ src->version) );
-
-    shadow.tsc_to_usec_mul = shadow.tsc_to_nsec_mul / 1000;
 }
 
 /*
-- 
2.43.0


