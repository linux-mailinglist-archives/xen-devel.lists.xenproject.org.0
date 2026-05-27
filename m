Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEKLEOIiF2rw5AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 18:59:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058C5E817C
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 18:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320659.1587879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSHa1-00024L-Ek; Wed, 27 May 2026 16:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320659.1587879; Wed, 27 May 2026 16:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSHa1-00021W-9w; Wed, 27 May 2026 16:58:05 +0000
Received: by outflank-mailman (input) for mailman id 1320659;
 Wed, 27 May 2026 16:58:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wSHZz-00021Q-En
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:58:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSHZy-007qKS-NB
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 18:58:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a17227f-e002-0a2a0a5209dd-0a2a4501868c-32
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 18:58:02 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a17229a-c1f2-0a2a45010019-d155802ed134-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 18:58:02 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so126461445e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 09:58:02 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm467713995e9.9.2026.05.27.09.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 09:58:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1779901082; x=1780505882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ4Qm6SMqSxkS+TqYsUM1vcGiPawhYrIMPuMEx4cAm0=;
        b=m6M9uSmC1J3K1t4rLdnovCbESwZnHEAhhRjdoSoyIsULZxh7Ckl9Y2rRpazZ/7XndS
         h/fIiU7zmB7hmaEdtQxYbJxSXny4+7o4wOJOiXD4bBAilzQAdblqlJ6E2X3SEo0UQIPq
         GwusQYfa8Giw3bdUuh5KqDvH9JkvIqFk9qEw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779901082; x=1780505882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ4Qm6SMqSxkS+TqYsUM1vcGiPawhYrIMPuMEx4cAm0=;
        b=phj7ZN3Y/Q6KMKLti7pRPOD9UcdiUWJeUFnpD+xgfU2lC6kVzeIDq8IJkoNJPuv9yU
         bKCOZ9FG4zNJtjMn3EWTl1NWeKyoRCMuSvYNUIe1Iao3LCx2w/q0mJ3qj1F0vI8Ka7aw
         aPlXtVqCnYauqGSST60T0f8SXZJwwCxqrbV4NGRM3gCZ548/T5M8zrMczxgSF2gXeLm8
         g/32w9/o0o0nBfWTSU4q7Skn5TeEw+I5TB2w9jo6E+KJiTsmACAq0lFHAoMuUK2ByCZq
         6sXWSqVcxxo4pQXMq4ukNuWsqLon4Wba5grcrZjtKUDvcR4VOXTr7U9lYWoutSyWnc0X
         bZcw==
X-Gm-Message-State: AOJu0YyAjYjBb4JxiFAKqfqtH2X4tk/DFIHLruboVO4t6gqxR1GdTGZb
	ADuzrGr5BYIUApN9oQZjwEPFfyUV1KYTGoyV/cCTaBf2zDv36BQLQiy1Nmz0EGWgVoZFFXQhO5l
	aXljO
X-Gm-Gg: Acq92OHnwTFnmSAYyiYE60ygL4w8PV3oe2GoEuec0QdFltMc1oNHKnMXB3+x14pQQSW
	zEc+k/emHAh7nhla7YuS2KEU2OoiIAfyrfEqUJLKIV3psPMA4Wh0lmMmByupjgo94fL5H/5KrHQ
	weBp7o7AWvGPi5FxZc2Hd4FSMBti2gBhS7y5G0qNZGJZt2452N8YA/3nOygHhUf3eQToKpEMw5F
	gfCHONY+JfXMoKqpNLf9RwuktUc2M8dRZEumBqXKLSi3o6KFNK1KyYNYBpnU2wUtXYU31/rRo8o
	/cz9fubVAwdLV/XKyTYiqammkTWqspd3eiOwENFCdwgtmNVE0+m6WYdouJceA32raxPbkwwjwRh
	6PkKfKfJEsJIuY8nF+Jf7tHrnCbfTZdlxOSKt9pxysurtwVV1PGSr+PEwdfxG3n0UE1arMYIFku
	NA/+PpTb10B+lyfFvVUulzBxhwZszhdEfgARkPNT/BlePyC2fX0Dtt+gTYtHOJlWfS9YGuW2old
	dXMT8hS3pX7h38=
X-Received: by 2002:a05:600c:530c:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-49055273be6mr310425795e9.32.1779901081639;
        Wed, 27 May 2026 09:58:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] Fix fallout from DOMID_ANY ABI breakage
Date: Wed, 27 May 2026 17:57:58 +0100
Message-Id: <20260527165758.2346373-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779901082-B5947FF4-A41AA156/10/73395122804
X-purgate-type: spam
X-purgate-size: 3402
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,ford.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:dmukhin@ford.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9058C5E817C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 23e2479ff9de ("xen/domain: introduce DOMID_ANY") broke at least:

 * xenstored domains
 * The Python bindings
 * The Ocaml bindings (i.e XAPI, and therefore XenServer/XCP-ng)

by causing Xen to reject 0 (the wildcard sentinel for decades) and
DOMID_INVALID (a recently introduced wildcard sentinel) without adjusting the
callers of xc_domain_create().

Under other circumstances I'd revert, but xenstored has gained a dependent use
of DOMID_ANY.

Fix up the remaining in-tree callers, which covers init-xenstore-domain and
the python bindings.  The Ocaml bindings, like libxc itself, expose this ABI
detail to their caller, so need fixing individually.

Leave a very clear message in CHANGELOG.md that all external callers need
altering.

Fixes: 23e2479ff9de ("xen/domain: introduce DOMID_ANY")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>
CC: Denis Mukhin <dmukhin@ford.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Both Roger and I said no to the DOMID_ANY change.  We both think that there is
still insufficient justification to be adding it as a new constant.  Next time
it's going to be a straight nack.
---
 CHANGELOG.md                         | 4 ++++
 tools/helpers/init-xenstore-domain.c | 2 +-
 tools/python/xen/lowlevel/xc/xc.c    | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 25f5a192ed48..1b54acf912a5 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - Users of xc_domain_create() must now pass DOMID_ANY to obtain an
+   automatically allocated domid.  The prior sentinel values (0 since the
+   birth of Xen, and DOMID_INVALID since Xen 4.21) now no longer represent a
+   wildcard input.
  - On x86:
    - Enable pf-fixup option by default for PVH dom0.
 
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 01ca667d25d1..2be5831a578d 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -21,7 +21,7 @@
 
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
 
-static uint32_t domid = ~0;
+static uint32_t domid = DOMID_ANY;
 static char *kernel;
 static char *ramdisk;
 static char *flask;
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 9feb12ae2b16..a94f01d40b58 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -118,7 +118,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
                                     PyObject *args,
                                     PyObject *kwds)
 {
-    uint32_t dom = 0, target = 0, max_grant_version = 2;
+    uint32_t dom = DOMID_ANY, target = 0, max_grant_version = 2;
     int      ret;
     size_t   i;
     PyObject *pyhandle = NULL;

base-commit: e63ba93511b33c0d3bb8cc5870f946f41e1d2655
-- 
2.39.5


