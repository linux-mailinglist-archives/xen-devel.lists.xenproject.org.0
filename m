Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iB0QNLA+NWp+pwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827BB6A5F18
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CUF82vpz;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342198.1602412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuJ-0000Yn-3P; Fri, 19 Jun 2026 13:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342198.1602412; Fri, 19 Jun 2026 13:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuI-0000VE-UM; Fri, 19 Jun 2026 13:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1342198;
 Fri, 19 Jun 2026 13:05:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuI-0000SM-4c
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuH-00D4ah-Hk
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e84-2eae-0a2a0a5409dd-0a2a4501e918-36
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:13 +0200
Received: from [209.85.167.44] (helo=mail-lf1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e89-e031-0a2a45010019-d155a72cb5df-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:13 +0200
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5aa7a7ad475so2320038e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:13 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874313; x=1782479113; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eks+QTXUKxWGNd1IHclIX8XrRU2no0CF3MdEPRLJw+0=;
        b=CUF82vpzrIRaM67u6h/5yG19LfjFrnadlta1l82k8XXooMzgV3Tyt4pGdZjwck2t0e
         2lZCLPFSlAr2bz/wq3JqMWAYryFBx6oINnacAI0+Il+N/WruN9m8t5uIrmuf7sPU5gg8
         YVLCY+AU5MkkqerwbgwF925MqeZQgmF7yUQsGibOcgfwgGG0OHjhvKXM7YJPiMvCzmnl
         WHh7sVrsCsqBpQktlAsv3CYKhwcb1ZrZ8qNU04zy1O2RfB+aKC76er34383ZQEkUJrv6
         LeDtxQj4xeydGj40cy7nEtn+wniPPjCJkYQ+ogikbGG12ANsesbgiuQnQ0ZerUcaduOF
         SQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874313; x=1782479113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eks+QTXUKxWGNd1IHclIX8XrRU2no0CF3MdEPRLJw+0=;
        b=a1ouH964rDB7CN1Gjt6QXsmPiuQcNFGnOS+3scoJWFvND3VbnJtlXu2zzmE7VyGZ06
         jkBAe3oBnr6UyhAY/8R6BM+KUrMt/Pp39crwVSH7S6QCLalCdmyYRE6e/EZK8nvjlyXI
         31wh398mjjS8zKsswc+qreyAosMsHUJjvW8+swNa52PTwqo/UxEfElALMxGmlouvHTla
         xUTFLIOEgW/bL2SQf9SorZQA5eKyEAP7lx2ImQnKqZrH5bfQmO070HZPD6IW0Ew5tvI8
         QbUzLyyYRTNTih1MFhazx9XsDabk4RwPSA+EgonhQDboFv0Ke/BsqEAqgjn0zq/fMTXe
         /NMA==
X-Gm-Message-State: AOJu0YzZ6JEbR8m7TILparin0QXlX3z7QpfoKqZemHsfMqqeGZMrMfgn
	mBVh4Dt9srwLbnYoYgF3lVa03dEdH79XYSq3RWGfxfp8SwW4dQNjMUnDLhraELMRLR4=
X-Gm-Gg: AfdE7ckahCQg7bXZRvMvyYZCgCNrBbpezLBMD5iw2YDYD0g3XYrXuy2fVbtRNwgg1ex
	DKea+KNbKXFLTtldzNXoFnWdNCMCB02N+oilvpkx/cI3FQ6MbimxK9N6PvKgl11qGS9dGkXAX/L
	Mzmr/FKklwtpVj3MDM4LL7eE4VAW85JLC34lVapCwJK6uzlh9l5FHARp8aOygwg/bo/GnUZxAMf
	T+QVeCTyXTrvvXdngEefTrvJH0BuxZ6nj4rdXE/AQdabDe3nbawgHmn0aHb8lZ1e1m4mgjnn8IQ
	FQOMGpWQjJ+ioOJluEOZsCxwOj2hT7W/jI4DGsCiOISYxzFSfjaEqQZawrVp9YQrGZpYY/sOIQY
	tXGG46rxq2uaW5B+6lg9zY+sGTU7CrHvphiJO7m9i0USokghoe2kSYUr2v1md4yP4Nt5dWqB2OP
	vzEn91u9syntj5dWGQXeEyt0Dhl5Qq9/X51Gu9Eu0oADmEGWV+KI3r2Z2vM/kaWlsOBs0Kd8VxM
	Acq+eG0
X-Received: by 2002:a05:6512:3a93:b0:5ad:4cd2:9baa with SMTP id 2adb3069b0e04-5ad58f32ea5mr705257e87.27.1781874312427;
        Fri, 19 Jun 2026 06:05:12 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 01/16] libs/guest: Reduce number of parts in write_split_record
Date: Fri, 19 Jun 2026 14:04:46 +0100
Message-ID: <20260619130501.272832-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781874313-4B3A8E30-43106F80/0/0
X-purgate-type: clean
X-purgate-size: 1825
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 827BB6A5F18

Small optimization.
There's no much sense to split the header in 2 pieces, it will
just take more time and space to reassemble them in the final
buffer.
This also avoids truncating combined_length to 32 bit in case of
64 bit machines potentially avoiding following record_length check
(it could still be truncated writing it in xc_sr_rhdr structure
but the following check will catch it).
The function become more coherent with following read_record
function.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v3:
- clarify commit message.

Changes since v4:
- added Reviewed-by;
- improved commit message.
---
 tools/libs/guest/xg_sr_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index c7b3c6f3bc..9b2782b5cf 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -59,11 +59,11 @@ int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
     static const char zeroes[REC_ALIGN] = {};
 
     xc_interface *xch = ctx->xch;
-    typeof(rec->length) combined_length = rec->length + sz;
+    size_t combined_length = rec->length + sz;
     size_t record_length = ROUNDUP(combined_length, REC_ALIGN);
+    struct xc_sr_rhdr rhdr = { rec->type, combined_length };
     struct iovec parts[] = {
-        { &rec->type,       sizeof(rec->type) },
-        { &combined_length, sizeof(combined_length) },
+        { &rhdr,            sizeof(rhdr) },
         { rec->data,        rec->length },
         { buf,              sz },
         { (void *)zeroes,   record_length - combined_length },
-- 
2.43.0


