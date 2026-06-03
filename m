Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M+pcKtwmIGqjxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA60637DC6
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=C9mAA7oC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326232.1591725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIj-0006xV-5L; Wed, 03 Jun 2026 13:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326232.1591725; Wed, 03 Jun 2026 13:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIi-0006uD-UI; Wed, 03 Jun 2026 13:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1326232;
 Wed, 03 Jun 2026 13:06:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIh-0006Yj-7X
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIg-00Fz4z-KI
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cc-5cb7-0a2a0a5109dd-0a2a45078556-42
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:26 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d2-229c-0a2a45070019-d155dd36ddaa-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:26 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so3566860f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:26 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491986; x=1781096786; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ga8NUbQdyZJ7AuIJzNxg+MgQvikeNA0e9nhxhm+dxDo=;
        b=C9mAA7oCwVS19b6k/gIZJx+pWIb8o0GCXMnwMC3AJtZacp1vJeqeeKClOAHEC2tEhG
         nHt1n+24GQN0hrg5LpjMSgmVEKL6Vdhe+C1gPbyRWChERBw5sw8qKdLAKEDv9YdESP2B
         EvkSw5OHRTLXJ/C2jJlb4F4Po957LCrJ/SH+YEioIN+U7+puysHptHTKRkLBw30RiX2u
         rwTfcg853qmsthuv1ma5lON0tJgUJu80fOShsB7g9JmWSQvqzxRC/VHGwSrn90keZyuw
         7pIUrkmLb+xGvmeaxD+V25ITj2mcX+PMNRcrtSxO5Q7CcHkHuB1DqmjA/TQGyKt34qqX
         xHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491986; x=1781096786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ga8NUbQdyZJ7AuIJzNxg+MgQvikeNA0e9nhxhm+dxDo=;
        b=IE2vPeXc5JB+Jzuh7B46yPx00iwC21yvjFJjIy62OJHksfaTadpEwVmkpYyhdARtZh
         NCNaStEU4GEo0Drc5l8m4VhxFjd/Ib34h7vAqKAAkrNBKceDJWSO8KOHzl3eT6DnscqQ
         3S6gfyBtjX4GR+Nn6hnG4v8iZv3faku8izMc+FSu2UAJvaYRoV74wUceyPUaGVcRccm4
         330zQH93SGUpgjUNiiYtiEhrnXzOkp9/y7/aPYGsTf29bZh1JFDP3cIRnz9RSNXR+se0
         pkI/x0f4W0GDZDHhwNPrWJs+RlMnVjSxv+4O7xHme63d5hzqAgfYjRRK1dAyDPnzt8bc
         D5zA==
X-Gm-Message-State: AOJu0YyPcfgCDFnyNL2CbQz05vFYDuyisCnRbzPxxUAn2Mhm2erX+Pah
	0BSTyM8aX08IR08Q8+t/8qe9/Ipl04zpuxzeCHahXgSidb287GvFvl7OS0dPobBh
X-Gm-Gg: Acq92OEy98SgewwPXtMpSnQVO8x5zr90ATUiSASQ6/+Cqj80S69XXJncx1lVr/BM3kg
	Lyn9IH3mdEk0E3QFBpWpB588tU1TXHRmBWWQry4AJ3SWUFtf5JahkmKvZy2Am4Jbbm0gikjrq4L
	QDA/bhTgDxm0lYTk5g0UHsWQvMxw+c0+LBPjI4QpVQiH2adXmw4z7xU+0T4t3UquQM2g3vnUbOb
	MzTFw+jEEhj20PE5vbHng7Dgt7K2DS/4kyEb3sWT7cnZylzB11cIntkRprEIDZQlotK/CW0Mr7C
	RA1ha1aHM86NT1FBYov8EzC6oDt9lAMkEnEBSdYoGBnzGeasC5L2fonU1cfVmpRVcaiR3hKvfSk
	68WrEA5g5QgOPzpSSmNxoYwCg0gUl3Nk5Muq/24CbHRXwaVx7B1yaUp+kr/gBRU49ZMCHulO2gb
	kMW41uNTNS/eGoHXLiPQt0lG6OuouCUFmPyusgQhQri9VY8Xzh4OPTxLFMz5i/vXc0yHrGUN9Z2
	r9Ss0HyoET0K5LuzQp2c5EPbJ9t3r2we/xY
X-Received: by 2002:adf:eed2:0:b0:452:6aaf:76cb with SMTP id ffacd0b85a97d-4602178b717mr3700601f8f.1.1780491985582;
        Wed, 03 Jun 2026 06:06:25 -0700 (PDT)
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
Subject: [PATCH v4 08/16] libs/guest: fill directly iov structure
Date: Wed,  3 Jun 2026 14:05:55 +0100
Message-ID: <20260603130603.776452-9-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780491986-22971C48-3311927E/0/0
X-purgate-type: clean
X-purgate-size: 4533
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
X-Rspamd-Queue-Id: 5CA60637DC6

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Instead of storing page pointers into an array and lately adding to
iov vector add the pages directly to iov to avoid "guest_data"
array.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h |  1 -
 tools/libs/guest/xg_sr_save.c   | 62 ++++++++++++---------------------
 2 files changed, 22 insertions(+), 41 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 82549b5589..e8452746e4 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -215,7 +215,6 @@ struct xc_sr_context_save_buffers
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     xen_pfn_t types[MAX_BATCH_SIZE];
     int errors[MAX_BATCH_SIZE];
-    void *guest_data[MAX_BATCH_SIZE];
     void *local_pages[MAX_BATCH_SIZE];
     struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 7d8055a3f9..593268f176 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,6 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns, *types;
     void *guest_mapping = NULL;
-    void **guest_data;
     void **local_pages;
     int *errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -114,9 +113,6 @@ static int write_batch(struct xc_sr_context *ctx)
     types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
     errors = ctx->save.buffers->errors;
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = ctx->save.buffers->guest_data;
-    memset(guest_data, 0, sizeof(*guest_data) * nr_pfns);
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = ctx->save.buffers->local_pages;
     memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
@@ -159,6 +155,19 @@ static int write_batch(struct xc_sr_context *ctx)
         mfns[nr_pages++] = mfns[i];
     }
 
+    hdrs.rec.length = sizeof(hdrs.page_data);
+    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
+
+    hdrs.page_data.count = nr_pfns;
+
+    iov[0].iov_base = &hdrs;
+    iov[0].iov_len = sizeof(hdrs);
+
+    iov[1].iov_base = rec_pfns;
+    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
+
+    iovcnt = 2;
+
     if ( nr_pages > 0 )
     {
         guest_mapping = xenforeignmemory_map(
@@ -200,60 +209,33 @@ static int write_batch(struct xc_sr_context *ctx)
                 else
                     goto err;
             }
+            else if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len != page )
+            {
+                iov[iovcnt].iov_base = page;
+                iov[iovcnt].iov_len = PAGE_SIZE;
+                iovcnt++;
+            }
             else
-                guest_data[i] = page;
+            {
+                iov[iovcnt-1].iov_len += PAGE_SIZE;
+            }
 
             rc = -1;
             ++p;
         }
     }
 
-    hdrs.rec.length = sizeof(hdrs.page_data);
-    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
     hdrs.rec.length += nr_pages * PAGE_SIZE;
 
-    hdrs.page_data.count = nr_pfns;
-
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    iov[0].iov_base = &hdrs;
-    iov[0].iov_len = sizeof(hdrs);
-
-    iov[1].iov_base = rec_pfns;
-    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
-
-    iovcnt = 2;
-
-    if ( nr_pages )
-    {
-        for ( i = 0; i < nr_pfns; ++i )
-        {
-            if ( !guest_data[i] )
-                continue;
-
-            if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len != guest_data[i] )
-            {
-                iov[iovcnt].iov_base = guest_data[i];
-                iov[iovcnt].iov_len = PAGE_SIZE;
-                iovcnt++;
-            }
-            else
-            {
-                iov[iovcnt-1].iov_len += PAGE_SIZE;
-            }
-            --nr_pages;
-        }
-    }
-
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
         goto err;
     }
 
-    /* Sanity check we have sent all the pages we expected to. */
-    assert(nr_pages == 0);
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-- 
2.54.0


