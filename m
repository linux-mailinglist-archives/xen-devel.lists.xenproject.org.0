Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XJ01AdcmIGqYxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D29637DAD
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kVYcBR52;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326225.1591671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIc-0005Rv-L7; Wed, 03 Jun 2026 13:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326225.1591671; Wed, 03 Jun 2026 13:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIc-0005RB-H7; Wed, 03 Jun 2026 13:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1326225;
 Wed, 03 Jun 2026 13:06:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIa-000569-ES
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIZ-007IV7-RI
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026c8-bab6-0a2a0a5309dd-0a2a4509cd16-24
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:19 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cb-2497-0a2a45090019-d155dd33a82f-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:19 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so454628f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:19 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491979; x=1781096779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRDIkYEFhAoyg2vrbD/w/bb4Chd8wbV0BhcfXDreNEc=;
        b=kVYcBR52fQcUI6cy9IRMPpDCSQMBdjMZez2Yq+EJpXXHEGaSdsvJrdHsUTx0MfO3xY
         ijGrlIIOy0pZcIHmV/pem0jC7vL5YTDUaBTLn3rE8Y2DdN0WGveWUeKvIEVEqd/Zax23
         wM0uXmc5o7yl0puzvtWEn3aRsD0GI/Och4YsvlVh0+OxlxJ3p5ZxML8h8Rm7juY4eMZs
         6wVHZS4tMHspwu87Tmu5feBmACrSd61Lx5xgUW3IOzUcCNCcPJUaX352LzJd9E5N5ioK
         MsbQKkB5ezLpv7l6TUBjJh+X7MQnhuo9x8N1+ds2iAB5yVr0bzBNWQ95AquXvLqDafJq
         g7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491979; x=1781096779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRDIkYEFhAoyg2vrbD/w/bb4Chd8wbV0BhcfXDreNEc=;
        b=inErtMQEgsJdiAwC5YvOMqtEJmqX0abNLUhd6Dmds5jYtOPPZVsrkkav2UTFcQ4Da8
         5cp6Xw9nqzOYNtEw7iAtcAXpIEEPm6RTVbHe9oIo6nZ/+Ke80JkQK2h7zRFA8y/aCgEY
         2FKNZHQBV/VXh51oS14HwJuBojGTSkA6Qjpk9PJ75a8bwuqI1OR1Xoe7hklEMNB8znqR
         x5IX+JrFRTVq3jfvbT2VcVQDoVI1Eh4qEtL9DnfLRrSDvf3V+KMEtz+WIUcO2IdqFHbm
         4tYCTnzC2ElMnmSadmVt+ldlLElmYoMbTn7MT0yOjJJetkZOil87ayMAELGMWqUXvOu8
         6Qtg==
X-Gm-Message-State: AOJu0YzZ0t/6xzVX7SwFaKKlBQAw21tzj5EEECqccXqYucLgy54d96dW
	oExqfs+JOAYQ+e/KJINY8lq5xmlVGDlHQNF4GkMe4Gfs1qauFYlmTe9K/4lvgPP+
X-Gm-Gg: Acq92OHKchBif1sW9xVhYXRUvD3xtcIn5i4f9ZqnIn/cmaCOtNpZxo3XzNPp48SQdMj
	GPZI/MzMqSJeLyhbRSYzBV8su2Tss/XDMvQGruM3ydPbx5BS/OOn71PX6o47ZJ1eEE3WtLk3g4J
	vlU7D/G7ipudkR3EnhKmiV9/o+MTKUQqxhRz6A7iXLhG9qtFdlzrIstQYapQQnaIVQkS8WCC8vv
	rfn7H6+/1acqpNsqZ1r77LrHOfsnJBxnLn7NOBkEaOpnKHsb2gsHYKkw+reWineX5TkO2tIqMw2
	p4Vs0vn7XJcNWsrMGiBsWbbCuY0aJek+aSsJeLVYidY6y3bn3D3FzKsYjGhJKCz+tvekqtx3kRi
	Xb7MckmqVvc1JlESVrlbBrRDfhCqXQWkPif/iPQlMhDBFVpZdfNGrT07qea7BAajphMKAVuE5tZ
	dFKB8a7lSMbtnN9CuMats3I+paSvWIUWZx8K72WsdzoMOtAXyTG2U0hJFKn4mIkkwGi+al8Gs/K
	vNAnPM+1u9gIOjyh88KfAAjjMbesVYqiPW9
X-Received: by 2002:a05:6000:124c:b0:460:1c93:6eb6 with SMTP id ffacd0b85a97d-4602131fbdemr3055480f8f.20.1780491978817;
        Wed, 03 Jun 2026 06:06:18 -0700 (PDT)
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
Subject: [PATCH v4 02/16] libs/guest: Reduce number of I/O vectors in write_batch
Date: Wed,  3 Jun 2026 14:05:49 +0100
Message-ID: <20260603130603.776452-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780491979-41F6EA53-F63CB1A6/0/0
X-purgate-type: clean
X-purgate-size: 2621
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
X-Rspamd-Queue-Id: A6D29637DAD

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
Reduce number of pieces passed to writev.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/guest/xg_sr_save.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 3b2c5222e4..1700d81905 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -97,9 +97,12 @@ static int write_batch(struct xc_sr_context *ctx)
     void *page, *orig_page;
     uint64_t *rec_pfns = NULL;
     struct iovec *iov = NULL; int iovcnt = 0;
-    struct xc_sr_rec_page_data_header hdr = { 0 };
-    struct xc_sr_record rec = {
-        .type = REC_TYPE_PAGE_DATA,
+    struct {
+        struct xc_sr_rhdr rec;
+        struct xc_sr_rec_page_data_header page_data;
+    } hdrs = {
+        { .type = REC_TYPE_PAGE_DATA },
+        { 0 },
     };
 
     assert(nr_pfns != 0);
@@ -115,7 +118,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 4) * sizeof(*iov));
+    iov = malloc((nr_pfns + 2) * sizeof(*iov));
 
     if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
     {
@@ -216,28 +219,22 @@ static int write_batch(struct xc_sr_context *ctx)
         goto err;
     }
 
-    hdr.count = nr_pfns;
+    hdrs.rec.length = sizeof(hdrs.page_data);
+    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
+    hdrs.rec.length += nr_pages * PAGE_SIZE;
 
-    rec.length = sizeof(hdr);
-    rec.length += nr_pfns * sizeof(*rec_pfns);
-    rec.length += nr_pages * PAGE_SIZE;
+    hdrs.page_data.count = nr_pfns;
 
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    iov[0].iov_base = &rec.type;
-    iov[0].iov_len = sizeof(rec.type);
+    iov[0].iov_base = &hdrs;
+    iov[0].iov_len = sizeof(hdrs);
 
-    iov[1].iov_base = &rec.length;
-    iov[1].iov_len = sizeof(rec.length);
+    iov[1].iov_base = rec_pfns;
+    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
 
-    iov[2].iov_base = &hdr;
-    iov[2].iov_len = sizeof(hdr);
-
-    iov[3].iov_base = rec_pfns;
-    iov[3].iov_len = nr_pfns * sizeof(*rec_pfns);
-
-    iovcnt = 4;
+    iovcnt = 2;
 
     if ( nr_pages )
     {
-- 
2.54.0


