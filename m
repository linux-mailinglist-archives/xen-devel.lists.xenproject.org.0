Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ++BbA0hzT2r4gwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:09:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A1672F64B
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:09:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=voaj42SX;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357844.1612178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlgh-0004Ed-Oi; Thu, 09 Jul 2026 10:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357844.1612178; Thu, 09 Jul 2026 10:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlgh-0004Bo-Ll; Thu, 09 Jul 2026 10:08:59 +0000
Received: by outflank-mailman (input) for mailman id 1357844;
 Thu, 09 Jul 2026 10:08:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <doruk@0sec.ai>) id 1whlgg-0004Bc-2c
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:08:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlgf-00D3qJ-FK
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:08:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <doruk@0sec.ai>)
 id 6a4f7326-2eae-0a2a0a5409dd-0a2a4504d760-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:08:57 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <doruk@0sec.ai>)
 id 6a4f7339-a01d-0a2a45040019-d155dd36e5fd-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:08:57 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4759b4f0897so968921f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:08:57 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa09608d4sm51513868f8f.25.2026.07.09.03.08.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Jul 2026 03:08:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783591737; x=1784196537; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R38Rncr/E+UsAEWrPcumXybq6cXHOZxrmRPFJ81xA0g=;
        b=voaj42SXHGofT9QS5QMm27wi/Cr/73yEo+WDdJcaLkhZmsvp63gNUGERYNHjsLW/Q1
         ANdxGMlRo89M1Om4mrO7JitLhU98kvtTWTbQ+YWSSkHyjSMAje9bJrXCr919LBkHrxrx
         wUR7aRD+pXomiAIUENak6CVedp5PGxZPw0kGClWTkQIjbw1/ehzGr8TQpp0Suxdu7jLQ
         W8UoR5UkIb6K2Wy7KN7Vx5JG7tZ7oirhcdvRG9z3wwHzM6o4FlqZao/TfUZLxbq/76w2
         rDq9JyTrGhb55sIDhEWrL85YoibJH5HJB52Eitl2pQZYONZQJ6X2cCt9Z00xvF1VTSGi
         2A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591737; x=1784196537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R38Rncr/E+UsAEWrPcumXybq6cXHOZxrmRPFJ81xA0g=;
        b=cOACKKzZTvPNPue2laKqNmJDS60nmwKMIj40J5kTy2s7QqgiGR1Iz+EqzD/HDgYzbX
         0W0X4j2NOveLAaWDsR/dn+0t1F7198PKYc7DhJPNQdnG3TnRPqOKNbb0yQ3+yVzUOcYY
         fXQAc7fIIVHvYVBHYXKd2P5m6GTulxYj8c/fZIyTsBFxJ+IOkkxS8m+0w/sQSH4VTVaM
         gBZR00DaGur5zFnj4Zf6heTEvEsTh0wMr/STE/RFvN2H3m4VWrrFXRWH3I8jjHgs2d38
         dznANQpC4mIIySYZay36obn617IHAz64SCrtIP7tiOOuRl+RUyHE3iWS2ytM4SaXd9R9
         EIdQ==
X-Forwarded-Encrypted: i=1; AHgh+RroqUkqK1CubJ2Lcv8luxVP94l2BH+drDEZCxA5jBIynmAjPEhO0McolR0sug6h6gCua4AulUXNBII=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+c3RIVKYo7ncZyvt5oEz0yWad8oHcuiG5Ll8ZNnq7ji8Mjd/I
	LSk3N9WajkgK0ARIVJOh0XJF9ooYcEhILmgLh3VOTKBADRT/kiX/V8jjFaCahrIpU4FT
X-Gm-Gg: AfdE7cm4hk6XQISMRqve6ntivbUFSIpBs7otqs2iNPvXH1UY31eVjK1NuBI+01c0o7T
	ziqH2LbskEws1YKIXDWm+JOHu3hSlmMmd9N338zPpAzblHi5eMXlqJQQOSWpKdv3HxL8rr5QQ0y
	QqDOcXxBi2wcu5df3bDX9KjXDf5+OAHyFXKX+2P9b7hRN+rxEmytRLSMEl4Y7sFDQcErFhFVYN2
	ZA+UN7DE58I8LNHur87z3pxV6y/x15yVKcVZLPaHTmdaOkKylEN396SyB1GNIav4pBkydMSfXpn
	eY5KIDrYXgKINBYvdgZ5Pf6qE16c72VA291ZEqK+DrGDSmbf7PlMzpfajXBX6flo+FzT5TyIuSS
	U0kbg/iii3B2RAohZRCDVY+3YxLDnn+cJGfbpkyGMkwe6cxMOzxnklt79RLudJfYhzAAfFziI8f
	kd80szsOHtuLqE2ajFZF/vQW1JQX5mg/a1n56YSbokOy+bgsRFTVu0WXHnbOo+6BLk/lNscUMIR
	PFATAD7Z5SbqdHa1UcMHxFdkgRsU8fKpok=
X-Received: by 2002:a5d:59c5:0:b0:475:f0f0:9ec8 with SMTP id ffacd0b85a97d-47df0813a82mr7441246f8f.51.1783591736321;
        Thu, 09 Jul 2026 03:08:56 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2] xen-blkfront: fix double completion of split requests on resume
Date: Thu,  9 Jul 2026 12:08:53 +0200
Message-ID: <20260709100853.7489-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783591737-ACB3B1CC-B920370C/0/0
X-purgate-type: clean
X-purgate-size: 2238
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:axboe@kernel.dk,m:xen-devel@lists.xenproject.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[0sec.ai];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[doruk@0sec.ai,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67A1672F64B

When a block request is too large for a single ring entry and the
backend does not support indirect descriptors, blkfront splits it across
two ring requests. This only happens when the frontend runs on a
64K-page kernel (e.g. arm64): there, even a single-page request may not
fit in one ring slot and must be split. blkif_ring_get_request() is
called twice and both shadow slots (shadow[id] and shadow[extra_id])
point at the *same* struct request, linked through associated_id.

blkif_completion() collapses the pair on the normal completion path,
recycling the second slot and completing the request once. The
suspend/resume walk in blkfront_resume() does not: it visits every
shadow slot with ->request set and calls blk_mq_end_request() or
re-queues ->request. For an in-flight split request it therefore
processes the shared struct request twice on resume/migration -- a
double completion.

Skip the secondary slot of a split request in the resume walk so each
logical request is processed exactly once. The secondary slot is the
linked one (associated_id != NO_ASSOCIATED_ID) that carries no
scatter-gather list (num_sg == 0); the first slot always keeps the sg
list. The bug is only reachable on suspend/resume or live migration of
such a guest, so it has no local reproducer.

Fixes: 6cc568339047 ("xen/blkfront: Handle non-indirect grant with 64KB pages")
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/block/xen-blkfront.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index f765970578f9..8dad7bf5f664 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2079,6 +2079,15 @@ static int blkfront_resume(struct xenbus_device *dev)
 			if (!shadow[j].request)
 				continue;
 
+			/*
+			 * For requests split across multiple slots, process the
+			 * underlying request only once: skip the linked, sg-less
+			 * secondary slot.
+			 */
+			if (shadow[j].associated_id != NO_ASSOCIATED_ID &&
+			    shadow[j].num_sg == 0)
+				continue;
+
 			/*
 			 * Get the bios in the request so we can re-queue them.
 			 */
-- 
2.43.0


