Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KBppOOImIGqsxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9416D637DDB
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o28oC+Es;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326240.1591758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIo-00084c-T2; Wed, 03 Jun 2026 13:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326240.1591758; Wed, 03 Jun 2026 13:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIo-00080a-Ce; Wed, 03 Jun 2026 13:06:34 +0000
Received: by outflank-mailman (input) for mailman id 1326240;
 Wed, 03 Jun 2026 13:06:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIm-0007UU-00
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIl-000siy-C9
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cf-e002-0a2a0a5209dd-0a2a450cc1bc-30
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:31 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d7-62f1-0a2a450c0019-d155dd35e4b0-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:31 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso2818198f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:31 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491991; x=1781096791; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwnZlaNynVBSXMUBTGRaz5p9t0WwZCVY/lkJngWndkM=;
        b=o28oC+EssQ43Q0lbdMTetPeq6VinXKVV/lwahvhOfWcOGTqWYobjj5OMgiFDcWkmLs
         awHpPKNwiOSybJ7H7wQlupNrf1OIcdBaL7LsG+ZMknZr2iJU92KAMPtNdSlRzFxiCNfP
         tL6K1reY5Vlnu+i7VomW4vkIPo/v4FIc0adpsjGBxmNVsbAAwdzYPYFOx8OE62Q7lE6k
         ez0oEtrn4tvqqYiLIlgSSwZWmk/P2SJAbvRYHtPdsbT/EN4ELzJ9aINBhwfgu7PJpflI
         l4aJ6c8xbmqmU6ehWwXdgwaGH/W5SCSPTm1zwH9+66m6q08QIjC0+qn3PmkrQY2Lp2TB
         VeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491991; x=1781096791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wwnZlaNynVBSXMUBTGRaz5p9t0WwZCVY/lkJngWndkM=;
        b=TC4/Z8qRpU0/UznLi/okcIBXWzvoE/nQuJT9PpcHsvyGG8XWWWrtftOtMYq9rzQgl+
         Zo7zpp1t0vxyK6AZCh8MFyEfZJLZDXCY97RPImMY/1tjXcxlYyboL7MLJmkhFBACy8z6
         qrizztEED9+gUTSSdyR2lHAjVfrhG7PrTcenaDy5iLL/VrlybOr+Nl5/TpWEhXqwfSlm
         X176Lvyve5Y0JNRc2u5Uc/P6ZuMSZ3V/dGlIIKaF4dT0H+xUAsDi/FzbLyLrPkXXV1GP
         lwdgMKoudHqGJd1ulU4CBrZ63RyGYZE1BMwiDg+XySwGMhcOMRKSWas04yW56tsP7g4S
         0geQ==
X-Gm-Message-State: AOJu0YzJFZR4Wde8w8wEHxKMeXvjRlC6xerOHajF+FtCWMR6i+vLAMcA
	eY/wf72kH2Bk9dlQaateIvosMJ706Xrn9DoisMznsZp9Lv5lvRBNaw9uM4Jkt6tF
X-Gm-Gg: Acq92OHNHPIUj+srUzxJjDzWU0tzhW5vxM1oQbSd+BDmvZyr/A7TQwH6OBewOi57ceU
	ISF4j8VhPjn6y75uM47ndGlYI6xYXMDpoxZZob3tMaTTiknSgJz2aTZ/tGTdFUs6nr5ao9ztUZQ
	kJ1znG6AcyszSRJx2hNQa7Ur7yAbLfhBdxNPGl6aIXFl94KMWAFLy8zOV4HhrKy6qae8ScVPo7H
	ipH8+Mnqmu9r+PCg5lcV3aJBCAOcssZwPSBZB7weQAfsD2FWzUofa32g9DH2pBICJIJ5oIFtWmJ
	wIQnsnZ42b0VbSACjGYt2CHD52uL4lg3NAJ8XaYj5zMHtRRx3MW2EmLW9ZhJhWDlrwG9sZknf8N
	EsuuCMZKFvL9M8mAYEy8jRcf8tBpRzdgqkc/ija5/gspiZgM8prja1cK3gXPo4LpiJqu5mk4prF
	bS2Bxw6mdoMKUi19SLZgZhP+B0PiGnAdASzMKIup5MrV11CY/AYSPEw+NANiv+v70DO7SUOA1u9
	JViD9NUaEB6hjJZUonZ99FWU5zA3fOlJheRXWJYZwGCK7Q=
X-Received: by 2002:a05:600c:350c:b0:48f:e230:c3fb with SMTP id 5b1f17b1804b1-490b5e95f97mr56158965e9.33.1780491988654;
        Wed, 03 Jun 2026 06:06:28 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v4 11/16] PoC: libs/guest: use foreign copy during migration
Date: Wed,  3 Jun 2026 14:05:58 +0100
Message-ID: <20260603130603.776452-12-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780491991-DBB7CCF5-220DC120/0/0
X-purgate-type: clean
X-purgate-size: 8537
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9416D637DDB

From: Edwin Török <edwin.torok@citrix.com>

ministat confirms the improvement:

```
x baseline
+ foreigncopy
    N           Min           Max        Median           Avg        Stddev
x  20     1.1306997     1.1447931     1.1356569     1.1365742   0.003242175
+  20     0.4311504    0.44180303    0.43616705    0.43600089  0.0031094689
Difference at 95.0% confidence
	-0.700573 +/- 0.00203311
	-61.639% +/- 0.133355%
	(Student's t, pooled s = 0.00317652)
```

The tests pass too, which means that it has correctly migrated all guest
memory.

Frediano: This PoC was adapted to be included in a final series.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 42 +++--------------
 tools/libs/guest/xg_sr_save.c    | 81 +++++++++-----------------------
 3 files changed, 30 insertions(+), 94 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 72c9511f38..0e0e279ae1 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -256,6 +256,7 @@ struct xc_sr_context
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
             struct xc_sr_context_save_buffers *buffers;
+            void *dest_buf;
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index fb46142d87..b589f0397d 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -259,7 +259,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
-    void *mapping = NULL, *guest_page = NULL;
     unsigned nr_pages;
 
     if ( !mfns || !map_errs )
@@ -295,27 +294,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     if ( nr_pages == 0 )
         goto done;
 
-    mapping = guest_page = xenforeignmemory_map(
-        xch->fmem, ctx->domid, PROT_READ | PROT_WRITE,
-        nr_pages, mfns, map_errs);
-    if ( !mapping )
-    {
-        rc = -1;
-        PERROR("Unable to map %u mfns for %u pages of data",
-               nr_pages, count);
-        goto err;
-    }
-
     for ( unsigned i = 0; i < nr_pages; ++i )
     {
-        if ( map_errs[i] )
-        {
-            rc = -1;
-            ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[i], types[i], map_errs[i]);
-            goto err;
-        }
-
         /* Undo page normalisation done by the saver. */
         rc = ctx->restore.ops.localise_page(ctx, types[i], page_data);
         if ( rc )
@@ -325,29 +305,19 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
             goto err;
         }
 
-        if ( ctx->restore.verify )
-        {
-            /* Verify mode - compare incoming data to what we already have. */
-            if ( memcmp(guest_page, page_data, PAGE_SIZE) )
-                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
-                      pfns[i], types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
-        }
-        else
-        {
-            /* Regular mode - copy incoming data into place. */
-            memcpy(guest_page, page_data, PAGE_SIZE);
-        }
-
-        guest_page += PAGE_SIZE;
         page_data += PAGE_SIZE;
     }
+    if ( !ctx->restore.verify )
+    {
+        rc = xg_foreignmemory_copy_to(xch, ctx->domid, nr_pages, mfns, page_data);
+        if ( rc < 0 )
+            goto err;
+    }
 
  done:
     rc = 0;
 
  err:
-    if ( mapping )
-        xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
     free(map_errs);
     free(mfns);
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 593268f176..ae61f97a47 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -87,12 +87,10 @@ static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns, *types;
-    void *guest_mapping = NULL;
     void **local_pages;
     int *errors, rc = -1;
-    unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
+    unsigned int i, nr_pages = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
-    void *page, *orig_page;
     uint64_t *rec_pfns;
     struct iovec *iov; int iovcnt = 0;
     struct {
@@ -168,61 +166,18 @@ static int write_batch(struct xc_sr_context *ctx)
 
     iovcnt = 2;
 
-    if ( nr_pages > 0 )
+    rc = xg_foreignmemory_copy_from(xch, ctx->domid, nr_pages, ctx->save.dest_buf, mfns);
+    if ( rc < 0 )
     {
-        guest_mapping = xenforeignmemory_map(
-            xch->fmem, ctx->domid, PROT_READ, nr_pages, mfns, errors);
-        if ( !guest_mapping )
-        {
-            PERROR("Failed to map guest pages");
-            goto err;
-        }
-        nr_pages_mapped = nr_pages;
-
-        for ( i = 0, p = 0; i < nr_pfns; ++i )
-        {
-            if ( !page_type_has_stream_data(types[i]) )
-                continue;
-
-            if ( errors[p] )
-            {
-                ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
-                goto err;
-            }
-
-            orig_page = page = guest_mapping + (p * PAGE_SIZE);
-            rc = ctx->save.ops.normalise_page(ctx, types[i], &page);
-
-            if ( orig_page != page )
-                local_pages[i] = page;
-
-            if ( rc )
-            {
-                if ( rc == -1 && errno == EAGAIN )
-                {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-                    ++ctx->save.nr_deferred_pages;
-                    types[i] = XEN_DOMCTL_PFINFO_XTAB;
-                    --nr_pages;
-                }
-                else
-                    goto err;
-            }
-            else if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len != page )
-            {
-                iov[iovcnt].iov_base = page;
-                iov[iovcnt].iov_len = PAGE_SIZE;
-                iovcnt++;
-            }
-            else
-            {
-                iov[iovcnt-1].iov_len += PAGE_SIZE;
-            }
+        ERROR("xg_foreignmemory_copy_from failed");
+        goto err;
+    }
 
-            rc = -1;
-            ++p;
-        }
+    if ( nr_pages )
+    {
+        iov[iovcnt].iov_base = ctx->save.dest_buf;
+        iov[iovcnt].iov_len = nr_pages << XC_PAGE_SHIFT;
+        iovcnt++;
     }
 
     hdrs.rec.length += nr_pages * PAGE_SIZE;
@@ -239,8 +194,6 @@ static int write_batch(struct xc_sr_context *ctx)
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    if ( guest_mapping )
-        xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
     {
         free(local_pages[i]);
@@ -764,6 +717,7 @@ static int setup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     int rc;
+    const unsigned dest_buf_len = MAX_BATCH_SIZE * XC_PAGE_SIZE;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
@@ -775,6 +729,16 @@ static int setup(struct xc_sr_context *ctx)
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
     ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
+    ctx->save.dest_buf = NULL;
+
+    rc = posix_memalign(&ctx->save.dest_buf, XC_PAGE_SIZE, dest_buf_len);
+    if ( rc )
+    {
+        ERROR("Unable to allocate %u bytes of buffer", dest_buf_len);
+        errno = rc;
+        rc = -1;
+        goto err;
+    }
 
     if ( !dirty_bitmap || !ctx->save.deferred_pages || !ctx->save.buffers)
     {
@@ -809,6 +773,7 @@ static void cleanup(struct xc_sr_context *ctx)
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
     free(ctx->save.buffers);
+    free(ctx->save.dest_buf);
 }
 
 /*
-- 
2.54.0


