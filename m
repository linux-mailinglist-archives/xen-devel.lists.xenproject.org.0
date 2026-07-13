Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HlKZKK/rVGrihAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 15:44:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349F274BC90
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 15:44:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hkqDSl8Y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1361677.1613824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjGwI-0003as-JA; Mon, 13 Jul 2026 13:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361677.1613824; Mon, 13 Jul 2026 13:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjGwI-0003Yz-GD; Mon, 13 Jul 2026 13:43:18 +0000
Received: by outflank-mailman (input) for mailman id 1361677;
 Mon, 13 Jul 2026 13:43:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjGwH-0003Yd-3J
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 13:43:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjGwG-0058LF-4S
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 15:43:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54eb6d-e002-0a2a0a5209dd-0a2a4508d08a-22
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 15:43:16 +0200
Received: from [209.85.208.177] (helo=mail-lj1-f177.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a54eb73-ee29-0a2a45080019-d155d0b1c0d1-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 15:43:15 +0200
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-39c923b8c2aso28078041fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 06:43:15 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39c84b854cesm26688741fa.27.2026.07.13.06.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:43:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783950195; x=1784554995; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHAFX5d6Kn9+qaaTgP5OT5PfigaR15/Uc88+6WBjX00=;
        b=hkqDSl8Y3MIsZ7HHRI2+g8hh4LG15YtXhDT73xAh/dNlfHI2Mn0JEwuhThXG+1P7sQ
         LgBzKH/m8OWxikWQO9kX1rqYZH4tChHGmEAlh0f2UoyZ50RxS4+HZR/nT7OFTMojVBUp
         kpDWbvHxkhNMB9ypgQnyCGrOPjK0EwcDl7UFJpmLPPtxvPC4X9R9Sa862cX17d5OHi55
         mvIha0zTfo3N4TkwqKvvOgiiQYSkgeoVmEvjPoowSLojSdP4Bj5IaGfk0NgJMJwHI5sy
         G/14JkVEuksc1bw5zvLic3GeKkgtyO6+3dRQI3xMewBAY15gXlDKkz486EGkFnUmxyoF
         uXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783950195; x=1784554995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHAFX5d6Kn9+qaaTgP5OT5PfigaR15/Uc88+6WBjX00=;
        b=LvfnhI1ccv6ykeaTVt/FBdekzgOBci0ZpFz09Hv7WSBnpLfWcILaYcYDeN1X6NawjE
         ZZftoDocTd83w5gzVmfYA66/3C3BKnb+E0BrNfNX5KQYAgNLzSFkcepI3y+mzYYKSusn
         f5tYipdSNFPVcRgZlF6YFz4WD7eA0pXyMK3vAH2iJJXFMnueb1+hkEIRWr89xqA29eEu
         EA5K8IdhVRRDSO49kuMhjxTCqkp0ruVnUclfSysJ2+DQX6JKeylUNkVhdmAK+5B6ws1d
         JBGgh7EvWo5+CtNJex1ORvqhazgMv1Hy/oZP72AqyPayd+Gqix+OT2e/RGOcs14HXZb7
         NuKg==
X-Gm-Message-State: AOJu0YxD4/PaI1Tad3qwx+RMikljB2PUXMWI8zh+sUJ5skv3nouAItj2
	/MpC0ducr58652a/CEXSdsuNGEfTuLpIkz+i7gDccS17B+k+gYJTVLGroae6lQ==
X-Gm-Gg: AfdE7ck/ZWIl6ViOUDjqC9zWT2X8mMtS9Y38WBtP1hll0tF80S51gOvJTwJB7mjZYgl
	rMGWxeL0CHm/a3q0QPO1/U2PKnAe/gSUT5HKdypTCOYS9P+fNursFACbm8DouRz0rqWUcc2m/Yk
	Vlt4XOK6CXHrpZZBukg0vzpBnvn/x3r8N+PE0FoqRYicnGbCVg+KM3z3aksyoHrmQpVg84qvVDU
	k5fY/mSL4Z6hnQKUoDjYo//GLRgaA02ffXoS5G+TE24nWbGLePMWUFX5EQaXH4UMW2xEGLqB2/x
	ctB/BuR+eOxGhWSsYf0QBDrdcg3Aw7n9MYHOyJyWLy2EiT+3/w5XrfjiFclFuqPh9JJ1QXvrici
	ZmfZ+hywd9cPKj15943XsjtsaUi0uUpvgQdTe3r+wRPDkAW71SsERo9LqNN3KaVNJXwvd1C4nNL
	K+NcSIsLIJPmSML7X2zidivvIr/tGuIvRvpzK9cyOkjLYcBOFMUqp12YQYfQ==
X-Received: by 2002:a05:651c:4397:20b0:39c:74ef:1a96 with SMTP id 38308e7fff4ca-39caa89a171mr14793191fa.36.1783950195062;
        Mon, 13 Jul 2026 06:43:15 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>
Subject: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
Date: Mon, 13 Jul 2026 15:43:07 +0200
Message-ID: <8087862a1149a8875b578c2b3d044919d8563a39.1783950107.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1783950196-7AE2701C-9202D5F4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1031
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 349F274BC90

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Address the comment from ML.
 - Reword second RISC-V's item.
---
---
 CHANGELOG.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 356be88351a9..4dca8359cd4a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -46,6 +46,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On Arm:
    - Support for guest suspend and resume to/from RAM via vPSCI.
      Applies only to non-hardware domain guests.
+   - Continued Armv8-R MPU enablement.
+   - Drop ThumbEE support.
+   - FF-A v1.2 support.
+
+ - On RISC-V:
+   - SSTC extension support for Xen (not for guest yet).
+   - Introduce domain build helpers (CONFIG_DOMAIN_BUILD_HELPERS) which allows
+     to load Linux kernel, initrd and allocation related things forfor device
+     tree-based domains, laying the groundwork for guest boot support.
 
 ### Removed
  - On x86:
-- 
2.54.0


