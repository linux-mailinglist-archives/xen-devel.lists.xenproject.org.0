Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447357F9D6B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641725.1000551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YoJ-0001Ra-1h; Mon, 27 Nov 2023 10:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641725.1000551; Mon, 27 Nov 2023 10:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YoI-0001NY-UE; Mon, 27 Nov 2023 10:25:50 +0000
Received: by outflank-mailman (input) for mailman id 641725;
 Mon, 27 Nov 2023 10:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YoH-0000Co-Is
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:25:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549a28c2-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:25:48 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADE80202A8;
 Mon, 27 Nov 2023 10:25:47 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 84D56132A6;
 Mon, 27 Nov 2023 10:25:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id JY4dH6tuZGWTfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:25:47 +0000
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
X-Inumbo-ID: 549a28c2-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtTXnS8twSeqnIiZ7AYCOkSOLGbyxVJLKTGBp2+gyoo=;
	b=QfuLCQS3JRkaG0G9i4/hjoQ9rA6p1pohqz+leGCYPJxjnqn2B5/RTbzr0qJoc2AEYpYNCr
	5SVTeMcI0iSD+YC2DqZfsiGOMYAi1Gxt6TacmfESNYTbaoiWmebJ0M8ywih0CuMCocBc47
	LtZQpC73wmeE+H7WmUPxol4h5BfYBFc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 04/32] Mini-OS: add EXPORT_SYMBOL() instances to hypervisor.c
Date: Mon, 27 Nov 2023 11:24:55 +0100
Message-Id: <20231127102523.28003-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Flag: NO
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
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

Add the needed instances of EXPORT_SYMBOL() to hypervisor.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 hypervisor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hypervisor.c b/hypervisor.c
index d3857e70..f2cbbc1c 100644
--- a/hypervisor.c
+++ b/hypervisor.c
@@ -31,6 +31,8 @@
 #include <mini-os/events.h>
 #include <xen/memory.h>
 
+EXPORT_SYMBOL(hypercall_page);
+
 #define active_evtchns(cpu,sh,idx)              \
     ((sh)->evtchn_pending[idx] &                \
      ~(sh)->evtchn_mask[idx])
@@ -157,6 +159,7 @@ inline void mask_evtchn(uint32_t port)
     shared_info_t *s = HYPERVISOR_shared_info;
     synch_set_bit(port, &s->evtchn_mask[0]);
 }
+EXPORT_SYMBOL(mask_evtchn);
 
 inline void unmask_evtchn(uint32_t port)
 {
@@ -180,9 +183,11 @@ inline void unmask_evtchn(uint32_t port)
             force_evtchn_callback();
     }
 }
+EXPORT_SYMBOL(unmask_evtchn);
 
 inline void clear_evtchn(uint32_t port)
 {
     shared_info_t *s = HYPERVISOR_shared_info;
     synch_clear_bit(port, &s->evtchn_pending[0]);
 }
+EXPORT_SYMBOL(clear_evtchn);
-- 
2.35.3


