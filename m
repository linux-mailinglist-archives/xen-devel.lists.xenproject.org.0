Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uTvfE2K/UGoF4gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:46:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C6739399
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 11:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ahKXg/Yh";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359007.1612808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7nn-0006b9-ED; Fri, 10 Jul 2026 09:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359007.1612808; Fri, 10 Jul 2026 09:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi7nn-0006YW-BA; Fri, 10 Jul 2026 09:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1359007;
 Fri, 10 Jul 2026 09:45:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wi7nl-0006YL-Jj
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:45:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi7nl-005mgB-0T
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:45:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50bf3a-bab6-0a2a0a5309dd-0a2a4501b5c4-34
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:45:44 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50bf48-3ea4-0a2a45010019-d155dd2ac404-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 11:45:44 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4728c12ba97so336648f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 02:45:44 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f214d2sm57585180f8f.33.2026.07.10.02.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 02:45:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783676744; x=1784281544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViDQVIrWNry3kq6NtICZkOlvD8UDkcI76ThKXkGwtgY=;
        b=ahKXg/Yhp2++rITeDq6STK3xfXKW/5uv7H2nHN845ns253ooleOho7UsKff6iQEr68
         eJDpRMWslYdtV22dBj0wYqb3/nMm6Sdq5+TqSJXEpwXAVioZ5+fFrOryB0uz/s7bo0Zj
         8h2TKO6KoXFpXM6Z7S9rgrdS1S2fwLRb5Avt501EzyV9wv01Zt9LsfK12DBzVKZC/POc
         cGQ3eDAbdgJ/oPR/er6eDt4Hmaum5dsAzRdwUW0p3jfeDn1eNm1I3vNnrd3YsnhR81Mc
         dhXA3xPIlfhzH1QL29gTER0yP512o8qPMTaauPOkqyA5xRyEViEOKKbLardW6wTYQcv8
         zT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676744; x=1784281544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViDQVIrWNry3kq6NtICZkOlvD8UDkcI76ThKXkGwtgY=;
        b=GQoIApero/fxN6pryaru7MwthWRUmTI39vsArPFHvTdz/XP1tDDZwuh7C8mpImF2g+
         s1/mLRrkVzZlFu58YB7oubuKhQCGUSuBXV3E4QlnUZT3KgSIDxnLNLHW2Yuva8lUpZ7a
         gL/Cmz2EFomHMui3DDDJPfn4w2+LpjvD4gAkSKLHwTsbgrF5Tv5X4rsf4loO83+2iNC/
         145e1GK0Pc9q4YSDTvsncJnWUPTpcYVO0DaG+SzQwqgPDgFJCwOZwtbB4eksc9+ZYfeR
         5RlJDZcOFMbVxKLZsuAq/N6P48t22/zPkhgcrnMviTiH+cRIJCfSq8aUBLrN+CtRHwcb
         XImg==
X-Gm-Message-State: AOJu0YyxrsKW8y91eeGaz+9U6nPNx7DmecMvTr/R/X02GLFV6BUzmVcy
	ugSXbF8BtrY8BRjBGxP7rusZNZu+k+yGiyW7/dR+iYxeLJO3n1o2b8q52OpbGw==
X-Gm-Gg: AfdE7clnecOSKsykyBM8vvd5fzPzmq9hliPq2qtEhYiw2sqwOTx6iZHgI5OdmH80tnb
	ToDR0TvHbc1hMasu97FX4psjI7968I7Pz7N+6B50+AKnYXDXZFNb/6Dl77NJLGSpO5vnlt/y863
	43s4QrakWi2EktWBrTnLHL+X78ycByE+9LNNeOQ41DhfH6mOk3vQfJCG+uLXpiVqjKgoq7uMsAB
	fXuhWFLY7MUvk+wrRmnmDfPRbBBhbmTcUXQ3kkGFNcSz0HsmyCjQqp6zrz9fN1Bopplsgd+42uB
	LMttezz573p1c4ynQsgxu0JqQFFgt0LcSisf28JurTmcg5O5s0j2UD+ZnlzhJXwJOYsPmJjqqiU
	eGYarbTRO7APLZiNLXHHE+N2UXQLFnlw2N/es6PYw43ffGOXz+lLrBCuF1Sd+T2Y5Fsjow2+Wz+
	ZiMaDCWO69aPVEW8V3c7wB7X13NjVkmwQYsjBbbWCWbP35LgHoCl/euTCORw==
X-Received: by 2002:a05:6000:2583:b0:472:55a:ef9b with SMTP id ffacd0b85a97d-47df072dfd8mr12064352f8f.8.1783676744169;
        Fri, 10 Jul 2026 02:45:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>
Subject: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
Date: Fri, 10 Jul 2026 11:45:35 +0200
Message-ID: <3111d0f6481046f6303e6d564ebafd381d763815.1783676659.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783676744-3E6F20A8-D67E070B/10/73395122804
X-purgate-type: spam
X-purgate-size: 864
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url];
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
X-Rspamd-Queue-Id: DA3C6739399

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 356be88351a9..c6f1fcf5aeec 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -46,6 +46,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On Arm:
    - Support for guest suspend and resume to/from RAM via vPSCI.
      Applies only to non-hardware domain guests.
+   - Armv8-r MPU support.
+   - Drop ThumbEE support.
+   - FF-A v1.2 Support.
+
+ - On RISC-V:
+   - SSTC extension support for Xen (not for guest yet)
+   - Add support of CONFIG_DOMAIN_BUILD_HELPERS which allows to load Linux
+     kernel, initrd and allocation related things for domain when device-tree
+     is used.
 
 ### Removed
  - On x86:
-- 
2.54.0


