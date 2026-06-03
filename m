Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3mJnJtYmIGqXxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673C637DAA
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="cH/Dp2Pz";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326224.1591662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIb-0005EJ-AS; Wed, 03 Jun 2026 13:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326224.1591662; Wed, 03 Jun 2026 13:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIb-0005D1-77; Wed, 03 Jun 2026 13:06:21 +0000
Received: by outflank-mailman (input) for mailman id 1326224;
 Wed, 03 Jun 2026 13:06:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIZ-000501-C1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIY-006lQ8-Ok
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026c5-e002-0a2a0a5209dd-0a2a45058c04-12
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:18 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026ca-aaa8-0a2a45050019-d1558036d569-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:18 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49068493267so75582595e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:18 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491978; x=1781096778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H+CjEBJpsrZPsr1tA2Dr4sF8Rh9SLgca+SlhR+hbSM=;
        b=cH/Dp2PzmOoFWwbjHSc5MOnndbvy/sldZmb95J6kVSSWpMQh5ns3c8HPTmEZlv4v38
         60IAICO71d1TTd+pzd1qZCvVNYDju9Ho/YCg4xQVIMojRlFvfxT2yprsWKKZGqBZ8CXS
         i7bc0VS6e7hpmUxouOBdveDeYxQ5pSyEGmvVTKbcoEP0kMRWPMxue9fMQdLhDzhv4xav
         KG5gW0MGzZWD85U2EvBMA7OML1kiqAHlQRaiUGgjAxj5FE6qhVrGNjnnp9QDT75eeioe
         d5867S3T0Ib4PRJMbAu6L1K+e6WAGfJA72KMOxWfkxx+FmI5mDKWZKm+owIUf/erh9Cy
         /0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491978; x=1781096778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/H+CjEBJpsrZPsr1tA2Dr4sF8Rh9SLgca+SlhR+hbSM=;
        b=Rz4nFDNd66hCwC+btgBDbKRPU/fKDrJVq9nYn4Uys4X3E7YeEmRYicoMuPa1cXKMyN
         WC6YGP5yej4Q4lphXmKQG1M+w+1clCmWnH3GBIkIkg4IvXghcX7xWaQPy84XX9QpsVX8
         KI/6z6ZdxJY4rgUGedzXWCKIAasDZkYTHyWUNW1hsOfLTTOq94GCr8dAppeQ5X8LjwFY
         iaqUAVepP4qnTqha25l/gu817YtRD/Om0TXpfRf41lkwr88gyICOv9W/XnW8vMzo2jUJ
         uV5jK/EZ+mRhlpDxuuUIjt7ZqPVcdmbrAeHdQfeVpkhxutNQ3IAT/8HDJRKMjzSiegQ8
         PYYQ==
X-Gm-Message-State: AOJu0YzGWn1DkVwPaUyzAtPJr4YWNS+TtWDbV6cDO5OX+OQDJgOP/LwV
	tgBxexUHj98kzvrWb6RFfUfucAjITDJB7PnZVfZitfgYpZL7d/Gru6c5n8crDHmX
X-Gm-Gg: Acq92OEM7v7l/INcdMHdxrtpAv8ULrIvmD2GotgxMlZxdqDHPH0EwMjyU6sD2Crr415
	lZmr9KFDIrS20I8TVNCSQohvlvdX5+b9qkvBnLzu0K9ccZuvoKdjdTJXtpkWjXDY4/7tyoCMFeZ
	iqMq+NpcmqOxXmVd5A6tDRGJ/lg/8z1sItIb5cEtC0pDE9e71RrsosS3oHm1eG7VoTzmA88FgTM
	Wd19pCGKlnir0jwQv3IUkSxhF6g/rxbDuUUHu8y/llWuvZ63uzbo5YpmZNCmOlb92Kl28cZcACd
	B7qXfoMUoz+yie3MmZ6eAe7CrZv8h0s89UfQL/LqQamjGZ0KgmeS5k49dHjTAng4W7alpfpvIdj
	x2Z7sWCBkCEeW2U2S/u1mZjp5UgUbqmdHPKY2RcHKZqWode8pRzqGhEdmimPIFC+cyGGmeA1EMk
	pZF3devaQ9INatoPPLuMsyW6KQcNjRL6F3g1s0aF4eeJhPmjTyN6824vX+0Ulas+Noro8CCt+Pq
	L6wZN0Xbq04ysEDKJUzwXZHYXTOhsh1o/m/
X-Received: by 2002:a05:600c:c10e:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-490b5e839bdmr49022045e9.4.1780491977829;
        Wed, 03 Jun 2026 06:06:17 -0700 (PDT)
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
Subject: [PATCH v4 01/16] libs/guest: Reduce number of parts in write_split_record
Date: Wed,  3 Jun 2026 14:05:48 +0100
Message-ID: <20260603130603.776452-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780491978-DA175443-10456DE8/0/0
X-purgate-type: clean
X-purgate-size: 1781
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4673C637DAA

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
--
Changes since v2:
- change prefix in subject.

Changes since v3:
- clarify commit message.
---
 tools/libs/guest/xg_sr_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 7ccdc3b1f6..86c148c62f 100644
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
2.54.0


