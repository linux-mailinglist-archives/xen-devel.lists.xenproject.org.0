Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60614938EFB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761819.1171890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryV-000773-E4; Mon, 22 Jul 2024 12:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761819.1171890; Mon, 22 Jul 2024 12:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVryV-00074C-B0; Mon, 22 Jul 2024 12:17:07 +0000
Received: by outflank-mailman (input) for mailman id 761819;
 Mon, 22 Jul 2024 12:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVryU-0005pO-6s
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:17:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f112dc2-4824-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 14:17:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B7A921849;
 Mon, 22 Jul 2024 12:17:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF2B2138A7;
 Mon, 22 Jul 2024 12:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id txsdMb9NnmYtIQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 12:17:03 +0000
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
X-Inumbo-ID: 4f112dc2-4824-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vN1oYJgnKGXgHS+7WZJ4Q18USh1zc0tS4qvELPG//0g=;
	b=l6XNNSormHLDQBcjM97GIRBqTF/133nH+AlzKg2vtmDgbPPgW7gRbZvsyqJdqBOmZYdN9x
	qi82ljcj/E5XsQKv15B1S4EQ5cc3qZoMxJXazlsrIpnPD053XrNpB6twXWKE80MIlWI4QT
	oihsNOqNqs2ticUVAwyB2UUKuBgWehs=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=O3T7queS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721650624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vN1oYJgnKGXgHS+7WZJ4Q18USh1zc0tS4qvELPG//0g=;
	b=O3T7queSEzN2XVVxG1f++WZkkjdp+K9+jUCCfCabUE6kDkip/ZXjYjQh5jSWg1a/bKhNKh
	zqAvjlvq1Xv8SMmB50p1oYh/B9Wng2HGgaH9Q9rV7ICEaBCEyXi8JueZ/53kTXZ+1Vhbzg
	GtYNCJPoLBSYtEtQOv9i/UKLTmOQPRg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/3] mini-os: simplify monotonic_clock()
Date: Mon, 22 Jul 2024 14:16:43 +0200
Message-ID: <20240722121643.18116-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722121643.18116-1-jgross@suse.com>
References: <20240722121643.18116-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.81
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0B7A921849
X-Spamd-Result: default: False [-3.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email];
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

monotonic_clock() in arch/x86/time.c is more complex than needed: it
has basically two nested loops making sure the time data obtained from
Xen are valid.

Simplify that by merging some of the used sub-functions into the main
function and using only a single loop. Further simplify the code by
using struct vcpu_time_info for the local instance instead of defining
a similar structure in the code.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/time.c | 58 ++++++++++++++-----------------------------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/arch/x86/time.c b/arch/x86/time.c
index 7fd7abef..52916e15 100644
--- a/arch/x86/time.c
+++ b/arch/x86/time.c
@@ -44,24 +44,10 @@
  *************************************************************************/
 
 /* These are peridically updated in shared_info, and then copied here. */
-struct shadow_time_info {
-    uint64_t tsc_timestamp;     /* TSC at last update of time vals.  */
-    uint64_t system_timestamp;  /* Time, in nanosecs, since boot.    */
-    uint32_t tsc_to_nsec_mul;
-    int tsc_shift;
-    uint32_t version;
-};
 static struct timespec shadow_ts;
 static uint32_t shadow_ts_version;
 
-static struct shadow_time_info shadow;
-
-static inline int time_values_up_to_date(void)
-{
-    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
-
-    return shadow.version == src->version;
-}
+static struct vcpu_time_info shadow;
 
 static inline int wc_values_up_to_date(void)
 {
@@ -113,22 +99,7 @@ static unsigned long get_nsec_offset(void)
     rdtscll(now);
     delta = now - shadow.tsc_timestamp;
 
-    return scale_delta(delta, shadow.tsc_to_nsec_mul, shadow.tsc_shift);
-}
-
-static void get_time_values_from_xen(void)
-{
-    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
-
-    do {
-        shadow.version = src->version;
-        rmb();
-        shadow.tsc_timestamp     = src->tsc_timestamp;
-        shadow.system_timestamp  = src->system_time;
-        shadow.tsc_to_nsec_mul   = src->tsc_to_system_mul;
-        shadow.tsc_shift         = src->tsc_shift;
-        rmb();
-    } while ( (src->version & 1) | (shadow.version ^ src->version) );
+    return scale_delta(delta, shadow.tsc_to_system_mul, shadow.tsc_shift);
 }
 
 /*
@@ -138,19 +109,22 @@ static void get_time_values_from_xen(void)
  */
 uint64_t monotonic_clock(void)
 {
-    uint64_t time;
-    uint32_t local_time_version;
+    struct vcpu_time_info *src = &HYPERVISOR_shared_info->vcpu_info[0].time;
 
-    do {
-        local_time_version = shadow.version;
-        rmb();
-        time = shadow.system_timestamp + get_nsec_offset();
-        if ( !time_values_up_to_date() )
-            get_time_values_from_xen();
-        rmb();
-    } while ( local_time_version != shadow.version );
+    if ( shadow.version != src->version )
+    {
+        do {
+            shadow.version = src->version;
+            rmb();
+            shadow.tsc_timestamp     = src->tsc_timestamp;
+            shadow.system_time       = src->system_time;
+            shadow.tsc_to_system_mul = src->tsc_to_system_mul;
+            shadow.tsc_shift         = src->tsc_shift;
+            rmb();
+        } while ( (src->version & 1) || (shadow.version != src->version) );
+    }
 
-    return time;
+    return shadow.system_time + get_nsec_offset();
 }
 
 static void update_wallclock(void)
-- 
2.43.0


