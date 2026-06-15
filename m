Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LtIIJ9orMGq3PQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 18:44:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441AA688803
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 18:44:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=hjr+tzJU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1338455.1599490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZAPY-0008Bu-R4; Mon, 15 Jun 2026 16:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338455.1599490; Mon, 15 Jun 2026 16:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZAPY-00089O-OB; Mon, 15 Jun 2026 16:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1338455;
 Mon, 15 Jun 2026 16:43:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZAPW-00089E-US
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:43:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZAPV-007CPv-O3
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:43:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a302ba2-2eae-0a2a0a5409dd-0a2a45048be4-42
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:43:41 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a302bbd-1dec-0a2a45040019-d155802ea4d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:43:41 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4921e4dd62dso20167145e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:43:41 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97a07sm8140625e9.14.2026.06.15.09.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 09:43:40 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781541821; x=1782146621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Uxz4AFsb6BuvOZ2L5jpMpjXOP12D2W1S6mLyHuiDvU=;
        b=hjr+tzJUJ+eCx5agLkbKX+it1KF0/h6hT4BAPa4xAr9nW2ogNp6PcBT54mLj/j3fML
         VhKiwI/06msKP1TfT3nkbS66OuUpCiI68DDslc7m8qQB7FjjBYsuxEWiUFhkq4Lu5Nqf
         51bdTEclKoOc3xj0HeKAiJuX5QpZROutMxVeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541821; x=1782146621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Uxz4AFsb6BuvOZ2L5jpMpjXOP12D2W1S6mLyHuiDvU=;
        b=F3Wfr6xs+WmJmnaRwVGeNmd1gLE24NJy5ULSaiUzgaDxjz9ggeMW4m9/9lrA8+8K+R
         gi5F0II5Yr7s1o1nlgR04rItY9lZiEFdnHEjqJvVgdxBqza8EIpn4m7qZ1QiAxeYT2CA
         T4o1LqzxUCJNGZMFvCMptr6pP24pGt849IVdejvbsVoWTQfbbLxQRXP7+yY+fG4D9bHS
         8ErIq6GXPnmB7VkT/5JVJpeczuh3KPzzPTuWpE6abkchVepux9b3PuCFA5kuHK7MRT+I
         ovEpFqe6Wh9LTUnvJ5Xa7KdkBOjRa8j796gldtbjakJQzH4vLj/ccpwEy7sDNWGrUtJO
         ff/A==
X-Gm-Message-State: AOJu0YxSh7Uk0PZELCI0QXiXoHmeoX0EBjC/eOyanvxIJ1s+ayDiw7HP
	fxlRTFhcoR1CXIDUz9DTTVmrqohb8RfJ7XAYRinCsBlXdbJaKuG5NLTyLAF0iZtZgL7pG2tMQrz
	U1A/L
X-Gm-Gg: Acq92OFkwKjVadt6rY9ojaatfRNtJrYMm6uG+I2opwA+X6KbQzLpUmhsi+A1F9NAnvn
	G6zsFFqOSzqGCBlBT1qsflIeYWKf4Ch9/rqziT3jsfXb9G2CHmWUwtSWKM4RVVN6kjiP2H2xfGl
	1YfHa7Un8IF31KCy8RjNTCTYY+SpaNVezvyyRFMlT08wu+qbmH2brwShAuzpEdGOEnaHmgGLT3H
	zwEYIUevqoRxVVlVJs61Jy0M32wuhLRxMngKl7KoMwf8xsgbyetSZE4n6rQDKgP6AKdhWnGl832
	MsFehbuOl2reDcPSfCOzL9MttNAN8QJ6MPrpC3pDd2jB0dVgXDcZcJ9Q5Ha0bnsnl5vXAIiJUuG
	tJ9jFuSsP6ge1bqeRCNeJWUJywE2F9TU8twplgxEfEereYM0WseDpPlahycqouU0vwj/9IeviK3
	AmiSV8MOSpp3bE2gPjxaO60ecNLbsok8meCmgdR65SVABVtvI78aqe+NTgN1V+oaPhUZzI9lkeZ
	/3s
X-Received: by 2002:a05:600c:6215:b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-4922fab22c9mr4202245e9.3.1781541820907;
        Mon, 15 Jun 2026 09:43:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 1/7] tools/xenalyze: Fix -Werror=nonnull failure
Date: Mon, 15 Jun 2026 17:43:19 +0100
Message-Id: <20260615164319.3206324-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-2-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781541821-433673FF-C27E6193/10/73395122804
X-purgate-type: spam
X-purgate-size: 1256
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 441AA688803

GCC 15.2 with Alpine Linux 3.24 fails with -Werror=nonnull, complaining that
we're calling bzero(NULL, 128).

This is a legitimate diagnostic.  xenalyze has it's own error() function
shadowing the standard library one, and can in principle return when p is
NULL.

Extend the check in error() with ERR_MAX_TOLERABLE to short circuit the
variable tolerance check.

Suggested-by: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
v2:
 * Fix in light of error() being local

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2602806440
---
 tools/xentrace/xenalyze.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 876d59d42ca5..42feeb282e31 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -8767,7 +8767,7 @@ void dump_raw(const char * s, struct record_info *ri)
 
 void error(enum error_level l, struct record_info *ri)
 {
-    if ( l > opt.tolerance )
+    if ( l > ERR_MAX_TOLERABLE || l > opt.tolerance )
     {
         if ( ri )
             dump_generic(warn, ri);
-- 
2.39.5


