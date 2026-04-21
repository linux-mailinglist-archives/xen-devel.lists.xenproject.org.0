Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKyOMowq52mo4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:43:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9763F437CAD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288466.1568766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5l6-00063Q-Mu; Tue, 21 Apr 2026 07:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288466.1568766; Tue, 21 Apr 2026 07:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5l6-00060a-H6; Tue, 21 Apr 2026 07:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1288466;
 Tue, 21 Apr 2026 07:42:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF5l5-0005wP-9b
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:42:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5l3-00Aj1o-4H
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:42:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a7a-2eae-0a2a0a5409dd-0a2a45039be0-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:58 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e72a82-672d-0a2a45030019-c387df82ce28-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:42:58 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3900A6A7F5;
 Tue, 21 Apr 2026 07:42:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09AB0593AF;
 Tue, 21 Apr 2026 07:42:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 06I5AYIq52k4NwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 21 Apr 2026 07:42:58 +0000
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
	t=1776757378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTqmf1xyf3XOmhzfHM4kVR7INI+guIyweqMv4PH8HFk=;
	b=B54tmGhihPT2R3BnEz/fgBfKivKnAx6y60GfjxZzdvHY8ctP6GN35d82xvNTEUseq2eglT
	c1sqUYaBZorDQjjufRuS3et5jApgu/DhmWNMe5JwX67nu0quya46cfI8H7hm8a8XJ0kG1O
	aFeffKDgdxE7spdX9qc5R37Q9vXl37c=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=B54tmGhi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776757378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTqmf1xyf3XOmhzfHM4kVR7INI+guIyweqMv4PH8HFk=;
	b=B54tmGhihPT2R3BnEz/fgBfKivKnAx6y60GfjxZzdvHY8ctP6GN35d82xvNTEUseq2eglT
	c1sqUYaBZorDQjjufRuS3et5jApgu/DhmWNMe5JwX67nu0quya46cfI8H7hm8a8XJ0kG1O
	aFeffKDgdxE7spdX9qc5R37Q9vXl37c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 8/9] tools/xenstored: make XENSTORE_SERVER_FEATURE_WATCHDEPTH available
Date: Tue, 21 Apr 2026 09:42:10 +0200
Message-ID: <20260421074211.308473-9-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
References: <20260421074211.308473-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-purgate-ID: tlsNG-33051d/1776757378-2B56F938-38887BE8/0/0
X-purgate-type: clean
X-purgate-size: 785
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9763F437CAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add XENSTORE_SERVER_FEATURE_WATCHDEPTH to the available features now
that all needed support has been added.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index a5258dae6d..00875d6b5c 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -43,7 +43,8 @@
 #include <mini-os/xenbus.h>
 #endif
 
-#define XENSTORE_FEATURES	XENSTORE_SERVER_FEATURE_ERROR
+#define XENSTORE_FEATURES	(XENSTORE_SERVER_FEATURE_ERROR |	\
+				 XENSTORE_SERVER_FEATURE_WATCHDEPTH)
 
 static xenmanage_handle *xm_handle;
 xengnttab_handle **xgt_handle;
-- 
2.53.0


