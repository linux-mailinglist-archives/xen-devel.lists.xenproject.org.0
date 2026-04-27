Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uASYFHVA72le/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF50471517
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294777.1571480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbI-0005m2-H1; Mon, 27 Apr 2026 10:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294777.1571480; Mon, 27 Apr 2026 10:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbI-0005jn-EF; Mon, 27 Apr 2026 10:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1294777;
 Mon, 27 Apr 2026 10:54:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbH-0005d1-M0
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbH-004Inu-2U
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef4047-5cb7-0a2a0a5109dd-0a2a4506ab9a-28
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:03 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404a-7371-0a2a45060019-d1558031b8af-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:02 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so125694715e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:02 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:54:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777287242; x=1777892042; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQuJg18CTxOpb+CiZpRsAxRqnG2FkStLAfpVtU9HpvE=;
        b=kTtT7Lziv85cvWbNwlixmOigtONfppaa1mm/AKF+AG+GL55f6ynqmHqxwbQZKgPPEn
         hxHdO2TRN5RveSyh5dKd5GVRRcCU1wruTL+PuVmt1UkSdAZ/6NweaSzT86LnFH0tQ3O5
         cc0aBuq4Spx6hwLNlVnXxLiek55WgnV8lsuB4GoeBkKrhvy1lBn4LpvBjqt1Zb6Eh+Sk
         fSJeoVy6tFn9RIEmDnblQ3h7iFEE54UZzl/wRdl1xp2QIjmTFv3XUFjiyU+p5S7ZCnKc
         R+aaR4r5flfGbNHc3Z1qbIVWVmVaUcIS50z9lt/QiUGSLedQqbDAM6ODfXhqnGy27GNX
         VfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287242; x=1777892042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQuJg18CTxOpb+CiZpRsAxRqnG2FkStLAfpVtU9HpvE=;
        b=qlYkYtHn5lu5Oyrze2xg2ztKtz87hKoykO8CHl5sOXFIgNuoGpWbibUwPKv3qSAkU2
         CT+whEmAmNlmDnEBq+wXqVNrqnCYLpKcjEYvmXTS+fULl3BwXm200ZD3v/IefYxKj5vB
         dWxaYkHmeRwiAElBJ3Exehfmrlw5zGIKO9/qFEaUEyBlUb3NXToEnp9e3g43HjIajGVo
         F3MWLiP9EWG77GStGWVIcb2OC5oxuCPqiDjYYOKu8AlyHAvkKvYrM1mrtEQ4yfnjRNNi
         B32UYk3Huzs/uKPwRd73tdbdtViA+dYdbnisNgmtsLN635/hiuG2Max5F1ugsr0QJ+xb
         BRoQ==
X-Gm-Message-State: AOJu0Yyqj4aVPx1FUqR0lUVgCo1T4ixuXxQZ9f3NuLIPJjMDK7u5dDXE
	00ynYx7y2N0e9lu4CgjNgfvbGbQYqaMiZ65I15Bz1RAmE8dwgaWIBkImCsUP+z+8
X-Gm-Gg: AeBDiev+4w/pBX0HJuSst1DXOBkmxzKmxY10IDq9u5ebBnohw6uXyeePDJvM8mxoC/D
	YooHiYfS0D3GoWHUrlsjI+kPaMgW1/W08Zem1Uct3GlIuNSCI4tQfo7dFKJVLw+c2cuMp3AyY1m
	xomX7mgczv7wl6iyeid4arQEEWbewIcR9SjvhuAdpyH3Z216KiX8zDbx2RECFQbJp5b12RFr+6a
	EUhBcnHK/aWs8EAjpW1KgDyrkc5luWs7XB5YmiLWNt1nwRaTdnI4rv3sUWLvB6wUKDDDOub64kH
	arNA0KzwyNxYIiD0NrBj4xZm1lehiLUVTH6eC7sr+fZUGd9CqEwwwTT+ygSQk124zkIoFD8dr3d
	t3JII9in5q6S1M3rT5PlNs3Sn/zwy3zkVw2y+fVR6HakZDjaEiYkn82J4/rE///v/G5+gC+9Y1a
	EY1wCvh66v2xJV5f9qaXzTUMbg3OnkhSTmkW3J6YYGOarNOuL2+C1AqQxWEKBNP9A//YYwSEXWD
	M6o
X-Received: by 2002:a05:600c:a086:b0:48a:568f:ae82 with SMTP id 5b1f17b1804b1-48a568fb009mr371461725e9.10.1777287241913;
        Mon, 27 Apr 2026 03:54:01 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/7] xenguest: Reduce number of parts in write_split_record
Date: Mon, 27 Apr 2026 11:53:26 +0100
Message-ID: <20260427105338.99792-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777287242-CFB7DD75-FEAE29A2/0/0
X-purgate-type: clean
X-purgate-size: 1580
X-Rspamd-Queue-Id: 4AF50471517
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
There's no much sense to split the header in 2 pieces, it will
just take more time and space to reassemble them in the final
buffer.
This also avoids truncating combined_length to 32 bit in case of
64 bit machines potentially avoiding following record_length check.
The function become more coherent with following read_record
function.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 7ccdc3b1f6aa..86c148c62f3e 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -59,11 +59,11 @@ int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
     static const char zeroes[(1u << REC_ALIGN_ORDER) - 1] = { 0 };
 
     xc_interface *xch = ctx->xch;
-    typeof(rec->length) combined_length = rec->length + sz;
+    size_t combined_length = rec->length + sz;
     size_t record_length = ROUNDUP(combined_length, REC_ALIGN_ORDER);
+    struct xc_sr_rhdr rhdr = { rec->type, combined_length };
     struct iovec parts[] = {
-        { &rec->type,       sizeof(rec->type) },
-        { &combined_length, sizeof(combined_length) },
+        { &rhdr,            sizeof(rhdr) },
         { rec->data,        rec->length },
         { buf,              sz },
         { (void *)zeroes,   record_length - combined_length },
-- 
2.53.0


