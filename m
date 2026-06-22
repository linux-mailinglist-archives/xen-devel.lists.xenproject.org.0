Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pCzcFI9COWr2pQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:11:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E697C6B0353
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:11:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=nKvwqEM5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.1343780.1603004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfMq-000809-23; Mon, 22 Jun 2026 14:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343780.1603004; Mon, 22 Jun 2026 14:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbfMp-0007xh-V7; Mon, 22 Jun 2026 14:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1343780;
 Mon, 22 Jun 2026 14:11:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wbfMo-0007xZ-9u
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:11:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbfMn-008AYo-4o
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 16:11:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a394280-2eae-0a2a0a5409dd-0a2a4504a6da-2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:11:13 +0200
Received: from [209.85.208.47] (helo=mail-ed1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jens.wiklander@linaro.org>)
 id 6a394280-5f9f-0a2a45040019-d155d02fa54c-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:11:12 +0200
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-696bf0e7c9cso1006133a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 07:11:12 -0700 (PDT)
Received: from rayden.urgonet (h-79-136-84-34.A175.priv.bahnhof.se.
 [79.136.84.34]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6977b856f92sm3086817a12.11.2026.06.22.07.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 07:11:11 -0700 (PDT)
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
        d=linaro.org; s=google; t=1782137472; x=1782742272; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZmgTQFt/+lCFYefKQLr9tGkc0QVSDEHEQScMjpKoI4=;
        b=nKvwqEM5nGtQAtVncYDRThKZbqGxItAT39YhUv7fykX88ZSFH8xuEhAZ1kx6av4/u1
         4bIXCESvgx6uIN6dMAFHHbh9/nC2DYdbvFZVefs6fferl54slzxp+9znl6gRDHZjgi4p
         JskbYgtlj3riArskXoVeqOfqSxCORzbORrgBs6OSmYt06JqZU6k0SvxqFUjNAtML5as2
         4yzZwz/myO7InPM4i2pvcODkFJJom31O18WkMBO3hep6yJuiFYc+gaHDVJ2d83tJLWPh
         Fydh7g3XEDZbGrJihFMvGGaqiKPmeQnPnSJrfQ2nff948mgi3TTLV3wyE/o9pxp/gMNi
         f/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782137472; x=1782742272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZmgTQFt/+lCFYefKQLr9tGkc0QVSDEHEQScMjpKoI4=;
        b=plrkgMaSXXefRYoE/Fjb529QZT3v06AiYsH977OwGC5hwBPcG95FYVZUmlvokRADRy
         azaeqfBf9XblEOjTdxo5nKbF3Uw5/lEIdK6SO2kJ6dKLV1QGuII4cWZmntK0KGIRfyhU
         NwFt07ma+Kpnzfshu9j5c7a5+TOOP0uFOoM9NbTs4Rc8OivguV+c37YwzgwQ9WboLP6o
         O9f8wjFu7/tDM+RFUxejsRC8VKmQPCJLnAUdClb3c9METvKhFIJrNjHp8vAPxN+7ilcT
         uNVFRWP0bHdqDIvFxrPs0JJEJxslBG7pQYu2acz7mCDJZ1mitNBv1ZZM0R0jrNvJI1MU
         auGQ==
X-Gm-Message-State: AOJu0Yw1SSZrVB/bo53Eb3qqsn9aMoQUZMG0RN1ayFvacc9pWaomZBBG
	fkfw/H0jnlIWHlMjQO7fjigOwANR0qXFTJE4W1gOVYKoWRmnGxIJX3b4MjAxeteTM+wCDH5xS/R
	CwWrw
X-Gm-Gg: AfdE7ckuaf/KTjRAlZK6uzUl4OQ0f0zBF33tNddv1Bj9TbSBiJENMwMcsDMCDnvThvT
	ZpNcs7+I1GoXdbLXktDuNB0Oh3nmy40iMH6O15RxN4k62pqlVJ4cFyklZ09feqDh1ZUcijbNJQl
	LyswIFWvwsZ0NxIdrKKVNmfwbZh3GkdW1rFLt/8BbgFCjlRoAdMgalPvBioqRue7to5+bidmjYT
	Dk2ga1dU5rFbVOTIgdRd16BzwlAEpsD/wePDjbP+1knr/wseD8EbMJudtHu7ZtR4QNjqwTVRvou
	6507dHlANSdHDTrdeQBmUrj6k5tjeYyY2xO1nMQdD/2dOlmv06LyAF7em9WETpCmU+7WshdHkBL
	Dqs/fXlSknWZyvfphu6+3JvxAmo1rixoh9gmH2pCkbJr57XCzC5mawJD2Bn0fkmcTBiLcYcwM+M
	qCWmtCdOyMSAbpPWY1UjKfNt6lydWcbkDOAra4Hmz/l4V8O+jeR4JRMZ0BHJk4taWi8q92Qajcc
	onBzRBO0vMDAN+3I8quVe1GoI7wvb8=
X-Received: by 2002:aa7:d992:0:b0:695:3031:90bd with SMTP id 4fb4d7f45d1cf-6973bb8c48bmr4106878a12.11.1782137472428;
        Mon, 22 Jun 2026 07:11:12 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jenswi@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [XEN PATCH] MAINTAINERS: update Jens Wiklander's email address
Date: Mon, 22 Jun 2026 16:10:28 +0200
Message-ID: <20260622141103.2799695-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782137473-45FC9141-24D17327/0/0
X-purgate-type: clean
X-purgate-size: 673
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:patches@linaro.org,m:jenswi@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,epam.com:email];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E697C6B0353

From: Jens Wiklander <jenswi@kernel.org>

Update Jens Wiklander's email address to @kernel.org.

Signed-off-by: Jens Wiklander <jenswi@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 195d6cb0e2de..81bd0dfeec30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -544,7 +544,7 @@ F:	stubdom/
 TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
 M:	Bertrand Marquis <bertrand.marquis@arm.com>
-R:	Jens Wiklander <jens.wiklander@linaro.org>
+R:	Jens Wiklander <jenswi@kernel.org>
 S:	Supported
 F:	xen/arch/arm/include/asm/tee/
 F:	xen/arch/arm/tee/
-- 
2.43.0


