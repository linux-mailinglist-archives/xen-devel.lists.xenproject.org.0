Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBWvJGr08WmElwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:07:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D949493DCA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 14:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297275.1573369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3gc-0006vh-31; Wed, 29 Apr 2026 12:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297275.1573369; Wed, 29 Apr 2026 12:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3gb-0006sW-Vj; Wed, 29 Apr 2026 12:06:37 +0000
Received: by outflank-mailman (input) for mailman id 1297275;
 Wed, 29 Apr 2026 12:06:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wI3ga-0006rt-TK
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 12:06:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI3ga-00CWOJ-9E
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 14:06:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f1f444-bab6-0a2a0a5309dd-0a2a4504d07e-8
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:06:36 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f1f44c-1dec-0a2a45040019-c387df8391e6-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 14:06:36 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73CF95BD76;
 Wed, 29 Apr 2026 12:06:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34656593B1;
 Wed, 29 Apr 2026 12:06:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0AanC0P08WlVVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Apr 2026 12:06:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777464391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fvrcx0L64Kf/ax26AArSQHlhXePuAaFw8eCivbX6h2o=;
	b=rWr/AfLq4Do+4dGLXmUZJqNCAoB45EdHlTZSg2IwN9IL1oCtvpBDagiq0jX7Xek2Xi4JJn
	Z7+DdkS8/mcNF6geCcvdWZVVcpLlp+3q0qmYv4/ktlDc+EeE7+j5xVEbvlm4i09Ivv7kXo
	NHF8neRjrnlvcfVC7z5qay6IRn292Yo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777464387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fvrcx0L64Kf/ax26AArSQHlhXePuAaFw8eCivbX6h2o=;
	b=doVE1FUrkPKeHwe1H2jkYGx4rnIy0eeUbZYQ3rsmgB2jCy5clURQBb4p8G5b2OFJ93GHxW
	1+8olA1VIi/lGydAQAmwvhEejrON41IMYFXXczIKTo+rhMAy1UwY3InhjUc+40okaw6CLE
	G9n+/SeTgrXuoOtVf/KcJtvpExmQljo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Denis Mukhin <dmukhin@ford.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 1/4] xen/public: introduce DOMID_ANY
Date: Wed, 29 Apr 2026 14:06:16 +0200
Message-ID: <20260429120619.1013440-2-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429120619.1013440-1-jgross@suse.com>
References: <20260429120619.1013440-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-purgate-ID: tlsNG-ebf023/1777464396-2B3673FF-AB0E0F40/0/0
X-purgate-type: clean
X-purgate-size: 1320
X-Rspamd-Queue-Id: 6D949493DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,ford.com:email];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[11]

From: Denis Mukhin <dmukhin@ford.com>

Add DOMID_ANY to xen/include/public/xen.h meant to be a wildcard for
domids.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
This is based on Denis Mukhin's patch "xen/domain: introduce DOMID_ANY".
As my series is another use case for DOMID_ANY and it is a backport
candidate, I've split out the definition of DOMID_ANY from Denis'
patch in order to make progress for my series.
V2: update comment (Jason Andryuk)
---
 xen/include/public/xen.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b12fd10e63..2149b8dd38 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,13 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+/*
+ * DOMID_ANY is used to signal no specific domain ID requested.
+ * Handler should pick a valid ID, or handle it as a wildcard value
+ * depending on the context.
+ */
+#define DOMID_ANY            xen_mk_uint(0x7FF5)
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.53.0


