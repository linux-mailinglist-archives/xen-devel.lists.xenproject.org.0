Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Smr9EHpRT2pseQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:44:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD572DE58
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bNFQ79MU;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357592.1611989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQq-0007ef-4b; Thu, 09 Jul 2026 07:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357592.1611989; Thu, 09 Jul 2026 07:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQq-0007dL-14; Thu, 09 Jul 2026 07:44:28 +0000
Received: by outflank-mailman (input) for mailman id 1357592;
 Thu, 09 Jul 2026 07:44:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whjQo-0007Bx-61
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:44:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whjQn-00Ca40-J3
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f514d-e002-0a2a0a5209dd-0a2a4507bdac-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:25 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f5159-9c8e-0a2a45070019-d1558029ccdd-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:25 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493ec555a26so2512215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 00:44:25 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm69114695e9.2.2026.07.09.00.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 00:44:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783583065; x=1784187865; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YenDywqbNZBwQc5oagyk/xEUwwKpzwyMPkUM94WQxwg=;
        b=bNFQ79MU3scsJyHtRQrt+R13/8XsqlDi/+suoLDH0aR9t5+yxy9pviiBXc0ML6I6IB
         u/TZRH2akVIgqSEV/WX9CsL+VGmSIMYFyg7bZajGqfuWJHTPoXgI93i0+8eVQnREVbUF
         x9KPydIpeqCj1N9xiTgcNpvsUxK7F/ZrpbzXkaR7taSoy/lMve3ePEKzcV8xAVx2Phfu
         8TrAZIkKydiuCY79B19tuyS6OTg7ndmF1BV6+GE/H69IuwnwH7PXqVZz5SCi0jPMlHJR
         E0M1v8PVj7gLIBOeqsmD39YUKYXpZxQnmyLSg7dh62p8yYvVGJn1syyMfryRRaF2AoHU
         +6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583065; x=1784187865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YenDywqbNZBwQc5oagyk/xEUwwKpzwyMPkUM94WQxwg=;
        b=b6zEZfMAwwEEjYnH/TutjD5kGxgI1bgQrYEoExG4sB9qAfsGM6KFjQl+XvqXfa3ZX+
         jl7Dwl9PvV9Y+K0tio0Ur17RLJr+7t5r6SVrkrAcHNklVhdJjNST9wrhiNk6bJTH5LOp
         kL1QDy3hZdSIVydz0vhDFPYs4Bk8uVfq9gzhAJjLuD94CFgHqmlFCc66hGOfW7fntOW8
         NTAXFdS6IJ+Tv+4KFUvw4iwBBKbIQR/jgUztjhdm9RiDKnnpHjMVkmiAfstmZFBLtllp
         tyZBeoKnzsh5eDi3zjy6rMa6XiSnnVdHR/hIzbRWoXUDiNMgm8LZJhfSGhDs4kWEWrdy
         V9YA==
X-Gm-Message-State: AOJu0YzvkyHIBnhv0gEwqZnCcNybVIGgM2mDP6wFVVJMA13UX460IB/X
	hH9V/h3pWav2+IlOB1SQSBtaF9kT7MqM5uTxzJUlfo/gdGJmhWAjBJM3J9K6U1hM/G4=
X-Gm-Gg: AfdE7ckbGQsynPM78dLEe1R2EO50g3sSCAwjvPdTPcgVFUihReRLrsGwpMVa51bNUnM
	B9sEjDcCH5EI3PuFqxo6ogI9tKvYEOmvSF65Xzen+29cHx/MoKNX5trDxQ44Gxc5dtG2n0n/OdY
	r15oDZeyu/ioxawp0NeRKJxm+CGpVvABkSxsr3DI75xegTE5iyuNPImhNqUE+WCVsK3T4sR7GTj
	P7E/0Rt5ZO7kpm8PYdiZykdsRGhH1J8Js5pf8i38Iew/DjFer7FpestPGPwwZmUyuzlUr0ECPoS
	cW6iGaebwSq6TpYsxCG3W2KasnmJcZ9mB/vQjg7YSzvl7XHWKOfOvn3RI5JTbayo9lCeWqbaSi7
	oILcpbIx49cPPbzaYCqecrKuOBPeCXTX4GuZRIyxAbcVp5vQA/CJ8qgNoGs+bY50za5YVS1yZbs
	//FPp+lm8Op4mdXyy8zjvVuC52AYd3cwa/WtgBKW0M4KdenAK/ImSeR604VksRwYA2qQLoJ5rTl
	x0BIgv+SjJEftdjRy8idZV9phB4IQ==
X-Received: by 2002:a05:600c:4753:b0:493:b84f:9c28 with SMTP id 5b1f17b1804b1-493e6892e6dmr55979615e9.4.1783583064828;
        Thu, 09 Jul 2026 00:44:24 -0700 (PDT)
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
Subject: [PATCH v7 3/6] libs/guest: fill directly iov structure collapsing them
Date: Thu,  9 Jul 2026 08:43:54 +0100
Message-ID: <20260709074358.256084-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709074358.256084-1-frediano.ziglio@citrix.com>
References: <20260709074358.256084-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1783583065-7D72125E-F8BA5D33/0/0
X-purgate-type: clean
X-purgate-size: 3965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: D8FD572DE58

Instead of storing page pointers into an array and lately adding to
iov vector add the pages directly to iov to avoid "guest_data"
array.
Each page was sent using a different iovec item. This potentially exceed
Linux maximum (1024).
Coalesce adjacent IO vector elements to attempt to reduce the number of
overall IO vectors for each operation.
Also some implementation (MiniOS) emulate writev with multiple write calls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v2:
- change prefix in subject.

Changes since v4:
- added Reviewed-by;
- improved commit message;
- minor style fix.

Changes since v6:
- merged 2 commits;
- reduced diff.
---
 tools/libs/guest/xg_sr_save.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index a6734579aa..84fdbe4140 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,6 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = NULL, *types = NULL;
     void *guest_mapping = NULL;
-    void **guest_data = NULL;
     void **local_pages = NULL;
     int *errors = NULL, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -118,8 +117,6 @@ static int write_batch(struct xc_sr_context *ctx)
     types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
     errors = malloc(nr_pfns * sizeof(*errors));
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
     /* iovec[] for writev(). */
@@ -127,7 +124,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* page_data record PFNs list */
     rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
 
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov || !rec_pfns )
+    if ( !mfns || !types || !errors || !local_pages || !iov || !rec_pfns )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -218,8 +215,17 @@ static int write_batch(struct xc_sr_context *ctx)
                 else
                     goto err;
             }
+            else if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
+                      page )
+            {
+                iov[iovcnt].iov_base = page;
+                iov[iovcnt].iov_len = PAGE_SIZE;
+                iovcnt++;
+            }
             else
-                guest_data[i] = page;
+            {
+                iov[iovcnt - 1].iov_len += PAGE_SIZE;
+            }
 
             rc = -1;
             ++p;
@@ -231,28 +237,12 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    if ( nr_pages )
-    {
-        for ( i = 0; i < nr_pfns; ++i )
-        {
-            if ( guest_data[i] )
-            {
-                iov[iovcnt].iov_base = guest_data[i];
-                iov[iovcnt].iov_len = PAGE_SIZE;
-                iovcnt++;
-                --nr_pages;
-            }
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
@@ -263,7 +253,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(rec_pfns);
     free(iov);
     free(local_pages);
-    free(guest_data);
     free(errors);
     free(types);
     free(mfns);
-- 
2.43.0


