Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kwk1FQj3RGqZ4AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:16:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E906ECA81
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 13:16:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=JhVt65x1;
	dkim=pass header.d=suse.com header.s=susede1 header.b=JhVt65x1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349771.1607422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvQ-000132-VZ; Wed, 01 Jul 2026 11:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349771.1607422; Wed, 01 Jul 2026 11:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvQ-00011c-Rs; Wed, 01 Jul 2026 11:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1349771;
 Wed, 01 Jul 2026 11:16:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wesvP-00010r-Ns
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:16:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wesvP-00AhOL-4G
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:16:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f6f4-e002-0a2a0a5209dd-0a2a450c89fa-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:15 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f6fe-f399-0a2a450c0019-c387df82dc56-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:14 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84EC273A63;
 Wed,  1 Jul 2026 11:16:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62023779AA;
 Wed,  1 Jul 2026 11:16:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8NijFv72RGrZAQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 01 Jul 2026 11:16:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782904574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zaxfdhd/2xyg/xgn5cvnR+sq5s7uLGSyRRwH/Mnptzo=;
	b=JhVt65x1JsQycqKDgFnCPOiZKlZvFyiIG+Yag8Eg2mF0F/RPNqYvuM3CoqLPktKDgc8RUh
	sWkv/C0Pu55RkUH+1tuE0R6syoBBdpE23T3/7GOrhi9yi6ugkKaOkudPF0ZQawwpR97Vw3
	qQJrINcEdbhfiM8UIHMqIu6ZUgUaUjk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782904574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zaxfdhd/2xyg/xgn5cvnR+sq5s7uLGSyRRwH/Mnptzo=;
	b=JhVt65x1JsQycqKDgFnCPOiZKlZvFyiIG+Yag8Eg2mF0F/RPNqYvuM3CoqLPktKDgc8RUh
	sWkv/C0Pu55RkUH+1tuE0R6syoBBdpE23T3/7GOrhi9yi6ugkKaOkudPF0ZQawwpR97Vw3
	qQJrINcEdbhfiM8UIHMqIu6ZUgUaUjk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/3] tools/libxl: don't rely on xc_vcpu_setaffinity() returned cpumaps
Date: Wed,  1 Jul 2026 13:16:04 +0200
Message-ID: <20260701111606.4063972-2-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701111606.4063972-1-jgross@suse.com>
References: <20260701111606.4063972-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.01
X-purgate-ID: tlsNG-d25034/1782904574-A8AA8D51-0726AD08/0/0
X-purgate-type: clean
X-purgate-size: 1341
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,hard.map:url,soft.map:url];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04E906ECA81

In order to prepare for XEN_DOMCTL_setvcpuaffinity no longer returning
the effective affinity settings, use xc_vcpu_getaffinity() for getting
the effective affinities after having set them.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_sched.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libs/light/libxl_sched.c b/tools/libs/light/libxl_sched.c
index 2d6635dae7..2f6a70aef5 100644
--- a/tools/libs/light/libxl_sched.c
+++ b/tools/libs/light/libxl_sched.c
@@ -69,6 +69,15 @@ static int libxl__set_vcpuaffinity(libxl_ctx *ctx, uint32_t domid,
      * is possible that Xen will use something different from what we asked
      * for various reasons. If that's the case, report it.
      */
+    if ((cpumap_hard || cpumap_soft) &&
+        xc_vcpu_getaffinity(ctx->xch, domid, vcpuid,
+                            cpumap_hard ? hard.map : NULL,
+                            cpumap_soft ? soft.map : NULL,
+                            flags & ~XEN_VCPUAFFINITY_FORCE)) {
+        LOGED(ERROR, domid, "Checking vcpu affinity");
+        rc = ERROR_FAIL;
+        goto out;
+    }
     if (cpumap_hard &&
         !libxl_bitmap_equal(cpumap_hard, &hard, 0))
         LOGD(DEBUG, domid, "New hard affinity for vcpu %d has unreachable cpus", vcpuid);
-- 
2.54.0


