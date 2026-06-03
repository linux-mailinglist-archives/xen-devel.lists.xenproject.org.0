Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uy//GqrrH2qusQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16010635E30
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=ImHNjhDa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1325895.1591254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhM6-0003Ne-4s; Wed, 03 Jun 2026 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325895.1591254; Wed, 03 Jun 2026 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhM6-0003Lv-1M; Wed, 03 Jun 2026 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 1325895;
 Wed, 03 Jun 2026 08:53:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wUhM4-0003Ku-3K
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:53:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhM3-006GWh-91
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:53:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1feb8e-5cb7-0a2a0a5109dd-0a2a450988b8-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:39 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1feb92-2497-0a2a45090019-d1558032b8ac-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:38 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b7866869so5154805e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:53:38 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b7c6b966sm24070335e9.2.2026.06.03.01.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 01:53:37 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780476818; x=1781081618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=51sWtCRS4J99P4zhCE42T3n9PAMZGO1IQnnN5g2LOlo=;
        b=ImHNjhDaQSWfu9ISIYBezYgUHW1zLob6VP9srTe2uHGkmoxR+fDxweC93uFoxLkYuE
         eJ5kWZ3q03y8sBf4Sl8zCoOOOmWPW+3L3kRNXNuvESsaZIeZlz5VfArlwg2adWs7ugo8
         DmN3gf9Wd4IHRbVntfmMyqhXiEt3BcckgSqPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476818; x=1781081618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51sWtCRS4J99P4zhCE42T3n9PAMZGO1IQnnN5g2LOlo=;
        b=EzN/i+qXW0uolthZhfg2EAs35L6DXoKwXfq/pppj/MKEZoSOCs0N10G80v/85O5Lsj
         YkIoE0F8ECCaA+JGoGNDtbkiPXe2TX/tC2zV4W8HqKY9SeZ1ZnHNoBkOV93GNNNXuKbw
         QjO23ldG40hcngl4rU+kiqAaz4upBD1Yw8IJAC9+hsoNj2O2LPo9aTaRl/e8I/8sYTkG
         4QBp6c3jSFar+dK0CEVU5kb3D80DYmmDRyBsDu67mPtQFb2f5xUoU1uZReCf599TL5jI
         +feLOkBH6KhkeR0S/00K2OJKzab8XrNsSV9LerSZAruZ0qhnK6n5H5mOwOHxn6gJqB0N
         evxw==
X-Gm-Message-State: AOJu0Yy0g6TezWLYi0n0Od2MbGw9NHmRg3LEYEir9lD/lT10vhTOuBEC
	oGd26d7bdRLaO5CFnKeO4EQrbA9tjM5SPYM7huube9MqdTsrcg0c4V5ZRvGZPf+wyzlMZ12T0wj
	EvKrn
X-Gm-Gg: Acq92OGv/ib97OpfTOVkqYggepYDtHv5w79Hf2hF0D+YBnLFe224w+ReXNQQ1seYKhn
	1o5/WJk9lhDIpaQx7RlEc/Irq5ioVNbTQ6+gm7L57+KnweddzRHvZcb+eykmkxc/lS/n0HxYeEK
	0AhxjnprcCKv16R5zHWj1AYdsbpd/Kmy1/+7pLE5t2UPtrPBwlzamHYHC5wkbOU5h5ZA0CTnrx/
	40aouzUlClMb7hbVJJ2YBQinGtD494tEyOrFg9Hm8+xRFR5Prl+R+6pctROpLFEUOJvnru/gw/f
	nhBVGlMr/UVjqOwfilvGue0l0Bc5b6V12H6pt1CijnPdhSSgTm0HnYXq9O9HIo6l33qrZ5AavtS
	iOcKKelx/Ei36jvoe9lYFPmegZHIzrGnBos9LGDL8GdkfS9oAd3Go7F+2cWz50FF8qoM8AMqMcF
	/KRQdNBGGMmHwiWOu3K9GGtdvUe9WCL6X7pRHqKQT3AP9bnf3K7Ws5jVqRp/cv1jH9jAiy+LUgx
	sB0Au5rHqOHmnc=
X-Received: by 2002:a05:600c:4510:b0:490:a298:3859 with SMTP id 5b1f17b1804b1-490b60f001amr36093385e9.24.1780476818036;
        Wed, 03 Jun 2026 01:53:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
Date: Wed,  3 Jun 2026 09:53:29 +0100
Message-Id: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780476819-42F76A53-E5AFDBEC/0/0
X-purgate-type: clean
X-purgate-size: 1272
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	SUBJECT_HAS_QUESTION(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16010635E30

Switch to using the system liblz4.

This brings libxenguest's lz4 decompression in line all the others, rather
than using the unsafe decompressor from Xen (itself a port of Linux's unsafe
decompressor).

Andrew Cooper (2):
  tools/configure: Detect the presence of liblz4
  tools/libs/guest: Use the system liblz4 in the bzimage loader

 automation/build/debian/13-arm64v8.dockerfile |   1 +
 automation/build/debian/13-x86_64.dockerfile  |   1 +
 tools/configure                               |  79 ++++++++++
 tools/configure.ac                            |   4 +
 tools/libs/guest/Makefile.common              |   2 +-
 tools/libs/guest/xg_dom_bzimageloader.c       | 128 +++++++++++++++-
 tools/libs/guest/xg_dom_decompress.h          |   6 -
 tools/libs/guest/xg_dom_decompress_lz4.c      | 143 ------------------
 tools/libs/guest/xg_dom_decompress_unsafe.h   |   2 +
 .../libs/guest/xg_dom_decompress_unsafe_lz4.c |  39 +++++
 10 files changed, 254 insertions(+), 151 deletions(-)
 delete mode 100644 tools/libs/guest/xg_dom_decompress.h
 delete mode 100644 tools/libs/guest/xg_dom_decompress_lz4.c
 create mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c


base-commit: c069c014f21fd1f5925d8c30c18adb4f26381475
-- 
2.39.5


