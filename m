Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +cDmJ7fT6WnxlAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EDF44E5A3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291707.1570557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7G-0005oV-Ej; Thu, 23 Apr 2026 08:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291707.1570557; Thu, 23 Apr 2026 08:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFp7G-0005mi-BZ; Thu, 23 Apr 2026 08:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1291707;
 Thu, 23 Apr 2026 08:08:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFp7E-0005mQ-Mh
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:08:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFp7E-000vM8-3G
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:08:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d389-bab6-0a2a0a5309dd-0a2a450988ea-22
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:08:52 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e9d393-2497-0a2a45090019-c387df83acb4-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:08:51 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4EA85BD52;
 Thu, 23 Apr 2026 08:08:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A9E8593A3;
 Thu, 23 Apr 2026 08:08:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DIPtGJHT6Wn6XQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 23 Apr 2026 08:08:49 +0000
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
	t=1776931729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7U7QJ030xhKjZghEjJ0m4/ia2XnyEiFESLJvHSV1fHs=;
	b=sNjPuSxWVfwXjBuoUfhrRbuwtRg2anglf4C/npN7NYezjmxdIlQYR5qc4YCMIVaTsWtIBk
	dnULHiwqF1X1elyFd8bA8anBEYrwmJTUkmPf+43V23U53USanBMT0KUY0zZP2mnssHLN+v
	v5mFTj7soRGwNmYFqFFmhkDfEwzdALo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776931729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7U7QJ030xhKjZghEjJ0m4/ia2XnyEiFESLJvHSV1fHs=;
	b=sNjPuSxWVfwXjBuoUfhrRbuwtRg2anglf4C/npN7NYezjmxdIlQYR5qc4YCMIVaTsWtIBk
	dnULHiwqF1X1elyFd8bA8anBEYrwmJTUkmPf+43V23U53USanBMT0KUY0zZP2mnssHLN+v
	v5mFTj7soRGwNmYFqFFmhkDfEwzdALo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/4] xen/public: introduce DOMID_ANY
Date: Thu, 23 Apr 2026 10:08:37 +0200
Message-ID: <20260423080840.530547-2-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423080840.530547-1-jgross@suse.com>
References: <20260423080840.530547-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-purgate-ID: tlsNG-bad1c0/1776931732-48AAEA53-03F03C49/0/0
X-purgate-type: clean
X-purgate-size: 1192
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E6EDF44E5A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add DOMID_ANY to xen/include/public/xen.h meant to be a wildcard for
domids.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
This is based on Denis Mukhin's patch "xen/domain: introduce DOMID_ANY".
As my series is another use case for DOMID_ANY and it is a backport
candidate, I've split out the definition of DOMID_ANY from Denis'
patch in order to make progress for my series.
---
 xen/include/public/xen.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b12fd10e63..f35a6f21f0 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,13 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+/*
+ * DOMID_ANY is used to signal no specific domain ID requested.
+ * Handler should pick a valid ID, or handle it as a broadcast value
+ * depending on the context.
+ */
+#define DOMID_ANY            xen_mk_uint(0x7FF5)
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.53.0


