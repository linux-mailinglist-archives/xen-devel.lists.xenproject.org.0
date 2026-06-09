Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LJ5dIe9NKGqeBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5248662F99
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b="XF/gsP8W";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1333725.1596895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0I9-0003qt-C6; Tue, 09 Jun 2026 17:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333725.1596895; Tue, 09 Jun 2026 17:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0I9-0003pU-9O; Tue, 09 Jun 2026 17:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1333725;
 Tue, 09 Jun 2026 17:31:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wX0I8-0003ci-4v
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:31:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX0I7-005Nrm-Hu
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:31:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284dd9-2eae-0a2a0a5409dd-0a2a450cb48e-2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:07 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284dda-62f1-0a2a450c0019-d1558030ccd3-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:06 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490b8a97b11so64327575e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:31:06 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm113509696f8f.27.2026.06.09.10.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:31:05 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781026266; x=1781631066; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9XiKbIS7n67HdmfB7W1QPCM8I8PH63mcFkD09L83Oo=;
        b=XF/gsP8W/GppIyMVC0k+q64VE5VrPLt0yk51WYZO7Zsv1p0pKrhvt8I9hHYDYYBpTR
         01Svty9fQNBIFTJ7q3uameAfUJOLx5ReZnyZLT53vGONcO+StXvm7/IM06emMnKvrK1Y
         UzrSbusQguZHl3v0jNSgImcZhntQsBzuG8uaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026266; x=1781631066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9XiKbIS7n67HdmfB7W1QPCM8I8PH63mcFkD09L83Oo=;
        b=mjBhZLrw+DLCWWsQQCtBNjgrnKUeEKHptT/3C2R0qLdMWVVVGFuCpnAs4x7EicrdRj
         byBCX/tGvAN2QHd8B4Hs7mg9zBJsYL9svQ+i5g0akrpfyOW2uWrdjehgZB4AKpjX2ZgT
         8anKt3626D6EFRCRYMlXbbmAJiiKVWqrWRIHNnNCfQa5wIPS0xg7lvNy2b3QawDkfKWk
         dc+FGEoq0hkJ2fooyst4Q9BvqWy+355YTGKcaZcDYodZ+LiW3QfZabX0JCiwLXuiXmA/
         nP93rbokq8ufecpQhDxR9KFdHBPN0rEB7V86jVq8aGjQSPbV4L0H0czH8rp6Df/akzEo
         N1AA==
X-Gm-Message-State: AOJu0YzsvlesWypB0hzT0hTR3E4R/kTbExzjRGac0CyFm+QnwcPbfivf
	OqxRYsMX3piLgSm0xVJ6Bgj2hN1srMTT5e5CnUKfjMFJAHs7VZRpvevrq+ZbFaNA64mhlWUvgEh
	UV1WY
X-Gm-Gg: Acq92OGIvjB84RNNQVx9S49OQwwkyhlPA5LILZlW5xmwfnoZIOqC1lO1cQsY+bDSYJj
	YwNr+pR8m82wa7MZ7Tc/auTBPFN+T1kFsLv7hoz9bVww/jTs9JtlRjPmjJPuQ0lNGwRjDOih8VE
	pRppkOE/mhkarplMq6xPPayO5peOBVbJkFCwisD21iv2rQ7X46Kw8XwzZQ8o+qEIUYXJGTJCrVZ
	SL7r2nDQK4IDC5virpm/aTVmTjPK359Nk76INXKyoyykmU+2TcX6+HyeY1JJuh+lc6TCGM4Pcxu
	1gzwQoeOU8L9XHyat7WcN6v4fr4Y5aXtd+Og6OUdpDivjCi2l32ALWljZcX/ybHamQrg43iAszc
	f+SHexXViAVvSLJg6qxol+xzSmkpnVFQFdepQQ44mCDhP4kRLIRQaOxkNnQ7F62hDZMMRrvGqHD
	8tDIYx7HQ9O75WRzQdqToVABYgYnz6g4AQStHKI+4nhHaIl1CqhZ770hJYPiUsUnmw2suV88Mkg
	IlaaPyezWWvbM0=
X-Received: by 2002:a05:600c:34d3:b0:490:bd66:e526 with SMTP id 5b1f17b1804b1-490c261391fmr359348995e9.32.1781026266222;
        Tue, 09 Jun 2026 10:31:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/4] CI: Fixes to containerize
Date: Tue,  9 Jun 2026 18:30:59 +0100
Message-Id: <20260609173102.2908514-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781026266-DB97DCF5-C058AD17/10/73395122804
X-purgate-type: spam
X-purgate-size: 2254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email,vates.tech:email,cardoe.com:email,invisiblethingslab.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5248662F99

These were missed from prior changes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/containerize | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 8bd2a847aac0..70494645e09f 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -27,8 +27,7 @@ case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.18" ;;
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
-    _centos7) CONTAINER="${BASE}/centos:7" ;;
-    _fedora) CONTAINER="${BASE}/fedora:41-x86_64";;
+    _fedora) CONTAINER="${BASE}/fedora:43-x86_64";;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _trixie-ppc64le) CONTAINER="${BASE}/debian:13-ppc64le" ;;
@@ -42,13 +41,13 @@ case "_${CONTAINER}" in
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
     _trixie-arm64v8) CONTAINER="${BASE}/debian:13-arm64v8" ;;
-    _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
+    _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-16.0-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
-    _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
     _bionic) CONTAINER="${BASE}/ubuntu:18.04-x86_64" ;;
     _focal)  CONTAINER="${BASE}/ubuntu:20.04-x86_64" ;;
     _jammy)  CONTAINER="${BASE}/ubuntu:22.04-x86_64" ;;
     _noble)  CONTAINER="${BASE}/ubuntu:24.04-x86_64" ;;
+    _resolute) CONTAINER="${BASE}/ubuntu:26.04-x86_64" ;;
 esac
 
 # Use this variable to control whether root should be used
-- 
2.39.5


