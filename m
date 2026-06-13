Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4GatDULQLWr3kQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2B767FD3D
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XrkGWS8B;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337553.1598833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD8-0001Qv-3m; Sat, 13 Jun 2026 21:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337553.1598833; Sat, 13 Jun 2026 21:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD7-0001Jb-TR; Sat, 13 Jun 2026 21:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1337553;
 Sat, 13 Jun 2026 21:48:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWD5-0001Bb-QO
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWD3-00DVVl-Rp
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcf9c-2eae-0a2a0a5409dd-0a2a4507e990-32
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:09 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd019-229c-0a2a45070019-d1558034a55a-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:09 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so16301755e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:09 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387289; x=1781992089; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tveinKkdLcmjhqS/kzPOX7fy7Jx+F9+BOrd+vNDtpvg=;
        b=XrkGWS8BiIbjByWP/bNX8NsrFao1xU+Gw6bBX+QM9aepnX+zzIjLenK/9ctU4iiGH6
         tGCb38u203o411r8Q/x+O1wosqxfHPMJC2yMIgYgXNzdCEXWfZsySvA0txDoqcIlXp+o
         2wpmDwJW7Ay+jP5MSPu01GTWKY9zeXNCNXhxp5sUfw2+cUDe8XE9DJj09wnkvS27Lthe
         /+jWADoH7D3uY8e43AQ99m8KxxIQW/U86LktI77hxHfylHyPGVpFaEcaX5mXyb96QXKn
         e7QyZwsHGs7VZQiftMuqX1zizSTTmGSUsiCCPtBvaXd4ceXn3HzUY58brqrcUTkaHtb7
         chuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387289; x=1781992089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tveinKkdLcmjhqS/kzPOX7fy7Jx+F9+BOrd+vNDtpvg=;
        b=p/7K2ThCUi0ArC0mk6kXgmCncH1GsjbmaZog8fI1JngUiMSItQdOLQvqxk8Fd4RYfx
         gh+pZohdij3/WOOe8li3Rn7ImVbkN4wbYmH9dVv/lrSi7dOJCv169+gkJ4OZMi7xV3Tr
         yyAIsNprKWs2pRRSg5km5u9bSCZavETgSwi5M9k9bjHN/WK3BTyl+dr2dxoqTNxaKM8w
         geICQubiG1/DblrSIqfFBe7AYjAMO8rxEzk9/FlTDZx7HPWpm4yMBVYXJSMNxPD3ZF3p
         vQnu2mccDG8dGFrmtvph2w+2489GQn6HsL4SAG4EyvMB43JoKfUsQ3mD/NbsVM0MaukH
         TqFg==
X-Gm-Message-State: AOJu0Ywxr6Q7SUUJUSp8lQX0iO6ceX9rrdKdqKfIHzNVyBPnSURySEiA
	0JkcqQ/131nGSO1vLx1cUUL9xLnzUoD+E+n3ZdHgCCHLLBJCNZW+wrwHs6RfQdxcdJ4=
X-Gm-Gg: Acq92OHu4l9IU+2WfqsGuwf+RfZ+wQyZuBDBxmRqN0pHJeYPnDJWwfmXCTdCdnhCktB
	+M3km5iztb4OjNb269HhNNIJduSoqcRrcEUzdN25CElqgbxh00Wuk80O4Oygs2FhLfb+2grVv03
	vvq8NVmxVX/84BuIlNa2CkMQQEJN9gx+CGFI9eOLqfCm6uPZMQ0oBE3MYKAD1f5hYXYNJM7Xfr5
	jDUvGZGr1Xi2nd35/YSA+tFC1kQeuMOIZQY7UM+0ec+6kz9da0YNwNRRl1U5h7xmp3fR0RoP8jt
	bFyocU3gEg53YwksrfjVw7NvOcTUwfnn5fuIswriBSNg6Oz63orBiy4h5Gwu03rwkziZuLvKt5C
	F8tOE5gDxQA45dCNB7+6Exwr9tRYROQ0sKeprSRcE2blDnoWV8w2+4KnS9HLOB7oHXEEntXY46g
	7m635lnQiFXeud5Xo+9oYv2EYSUjwwYnOHAbt9F1yLDCs/Sb2QOu2eAgIRYlgOXxI1478tcpDcb
	CbMU0kTx78bPYMXQkdbAs6mIg==
X-Received: by 2002:a05:600d:6451:20b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-490ec481088mr62001335e9.3.1781387289119;
        Sat, 13 Jun 2026 14:48:09 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 01/16] libs/guest: Reduce number of parts in write_split_record
Date: Sat, 13 Jun 2026 22:47:34 +0100
Message-ID: <20260613214749.20620-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781387289-09D6FC48-AECF335D/0/0
X-purgate-type: clean
X-purgate-size: 1879
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: DB2B767FD3D

From: Frediano Ziglio <frediano.ziglio@citrix.com>

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


