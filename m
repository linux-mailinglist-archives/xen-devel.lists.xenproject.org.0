Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NIJJmBrFWrxUwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:44:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD175D3950
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:44:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319674.1587197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKH-0000oC-Fo; Tue, 26 May 2026 09:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319674.1587197; Tue, 26 May 2026 09:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKH-0000jU-9E; Tue, 26 May 2026 09:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1319674;
 Tue, 26 May 2026 09:43:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoKE-0000B5-H6
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoKD-002r8y-TG
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b51-5cb7-0a2a0a5109dd-0a2a450ad64c-20
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:49 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b55-56b3-0a2a450a0019-d1558029c583-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:49 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so28146625e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:49 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779788629; x=1780393429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYgK6iR894mAqSXBIRezXknZ0unnX59SBgdgZD/Yaro=;
        b=Ytk/LwkWOnfwfd6J3cyH5tWUfbV9ck4QJJ4s3x1gVeaIZTGYN8QJTnGz0fF8hOa79b
         902y+Oia6tMDqid2HBa6VbIyQZoQRHIgEFOwLs83BgwvNmR83mb17xKlEPBgmlythuiX
         NFD6fTEMyVQPXuOEpMy8LQZsBn3AwuGJ8ZVTJQeAgfgfJR1Q6oUw1AkFHSJmTed7OH0+
         ZGJk2GDIWdrqIrESycHNoDLEBQ5zOAR7BAZlg8qQImc+SEgFz5xwOekYIiAfeZCmBXcm
         Ne/CxYpZIOQ59QpidtRJdnlVz1DFIUj4YzqcqvznWiwkdZYoYGqKE5bkCHF6C+S+NpVw
         atsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788629; x=1780393429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYgK6iR894mAqSXBIRezXknZ0unnX59SBgdgZD/Yaro=;
        b=gbSpOo6I4NMOCnYGOEFCwzb4+OGRX7/Y8yG0rYt4soGHzsUdebc8bjrbWJqpgTjSMI
         VKkWg4M4YDyLY3MRxdYgYWTajzwdroLyYK6F5Jf+NxSRxUFgCyHJSSp4cO/GzlZ8K3f7
         Zzd8I9D/aPcowZT4AAi0k36bgYyHluADgtXhqn5AvinvkMiGb2fFJ3LeCzQsZ45W8vKn
         7p+yQRfecW4Sk3e58GSomn3sfRhz/g/9vrl6aVn4mNzN0IEaUBnkAWESuk8mfLaYvT/W
         5ID0H643jL6EgiJHHldqfchCNcHK2K42UaMir10GRoGhnnNqtDgEZydsv0LqBsa0+lI6
         6abg==
X-Gm-Message-State: AOJu0Yyo+Tpp/dIlHydbBgOO8mGxv9rygyirOhC7CBN+0P2kZ9t1HDdk
	RDRWj5WGV8YuPCneLn7RAqJkwWxkuOcog/lk+mLLJn8/LYLs9FWE3wqqIT+eC+6d
X-Gm-Gg: Acq92OECe+USF50uO2hfrt/QzWMeuakTol0p4vxXpV6QYXfoFcQaJv+m7YGLSVbZl5P
	14LSan85EocKN8d2NURULWVFQRwTnHLxO+P+zVrEXysfnPrqUIQyujmjjZDLmdYIL2/xk11m6tu
	RLEzbUujC9npR1Fx88BlFQzefy5c7SMYzN8nT+/en/RaRZwolC58fOAQ+WoUQhwzgoT5Go7r3jp
	CaN249xH175zbOL796rN8Pwo5lrkfhUR5XPa/Lsubpbl7uqI0+4M87Hv0K1mVledoelHgmoM8h+
	71TuUZYJuO2cgqsDuxahyDi8RYKt66Bb7D95Om44cKdGcPFB/dASwyXLAdSCa146RUNUdtLy1T5
	bw71ESaI3paKGtATs24wnCnaodZFFvDmsdLo50F90P1cr2R2z9rfXVBkfr7HEZI5IJzE6S8Ilru
	BD2Kn3ZDfz+rJ14BQoDqbCT9jmgIufLqF+qQHNuh+BkC4s6E9rncEaWw676abZNtG5J9yObFBz0
	rMeQ6YxfnZIgRWmDMJkH5kubw==
X-Received: by 2002:a05:6000:40cf:b0:452:273:5cd6 with SMTP id ffacd0b85a97d-45eb367fe78mr31935951f8f.1.1779788629128;
        Tue, 26 May 2026 02:43:49 -0700 (PDT)
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
Subject: [PATCH v3 8/9] libs/guest: fill directly iov structure
Date: Tue, 26 May 2026 10:43:19 +0100
Message-ID: <20260526094324.12286-9-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779788629-71F698B7-2100B5B3/0/0
X-purgate-type: clean
X-purgate-size: 4540
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4DD175D3950
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 77312bae9cf5..797b4d1a7da1 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -215,7 +215,6 @@ struct xc_sr_context_save_buffers
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     xen_pfn_t types[MAX_BATCH_SIZE];
     int errors[MAX_BATCH_SIZE];
-    void *guest_data[MAX_BATCH_SIZE];
     void *local_pages[MAX_BATCH_SIZE];
     struct iovec iov[MAX_BATCH_SIZE + 2]; /* headers + data */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 7d8055a3f9e8..593268f176a6 100644
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


