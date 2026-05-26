Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNY5Hl9rFWrxUwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A875D3948
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319672.1587183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKF-0000GU-2D; Tue, 26 May 2026 09:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319672.1587183; Tue, 26 May 2026 09:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKE-0000Ey-R1; Tue, 26 May 2026 09:43:50 +0000
Received: by outflank-mailman (input) for mailman id 1319672;
 Tue, 26 May 2026 09:43:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoKD-00005J-Dz
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoKC-002r8y-PT
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b51-5cb7-0a2a0a5109dd-0a2a450ad64c-10
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:48 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b54-56b3-0a2a450a0019-d155dd30e90f-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:48 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-44509921fbcso6603823f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:48 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779788628; x=1780393428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm0Iw65jO+uKrMUpvtXIdJI78r5gGuJ870elFUF+nDU=;
        b=npKeDXmavQuZhgcKoefetGO/sP7Zk5ZEJpUSIvz8o7+hxIsCQuGwQoqpe4aj2w9Jbt
         /z3alHI1ijuNZglNbfU9TGopFyWzK/+q3zhipKNdLgU7OISsfwJ1AgvWjrU0rVV0WdH4
         MI+UjXBffqHEZYvwny0mToxjUb6m1ahI5vT1R7Hvjrs4LqNKmYr+W6MrM4jttZo8eqMo
         sd20VrCtLUkgT7OTvpmGR+rSFxm9UfcdyF+RiXBgWQ4ff5uyoR11ac+6C+5YJmjvLLIY
         QhL38OuQflu2YRsBgkCFvT8W9gqycIOBXW6ICWRWBhYfFiSCtOdjOY75bWetMfC1FMrb
         ZLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788628; x=1780393428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xm0Iw65jO+uKrMUpvtXIdJI78r5gGuJ870elFUF+nDU=;
        b=cXiQ2/lUYpFlswwclt5MSnro6oSUHJ+neubSCpnvz0Wj5wntnkQCi2yvPOqdCZuari
         hRoTCx1Cwot1kq454yWIw+eopKxnykGZQ/fiEvyZpkh2l/0mY5XYcNErKyhc50p6Za4l
         GjTUjse/UNnFwM4ngFpMbn/TmlM+Jyevm2Acgtv6UVGlwLWLhqaXOyAhZFTBHmle0Hvm
         y63+gJD8qI3wqyT3zqaiS14oy8QZ0ggG2dOAUPjsm8fz/6d8O6WdFS9YZQl+qD1ZFq5V
         NMR7AEtCLBKpXyDcl864n8oudvWl+v1lfJTBlU1DmnoJWUJQ1L4GDuQ/kpZQPXqEP/Q5
         4xIg==
X-Gm-Message-State: AOJu0YyQ4gZGzK1GZR7kQEwruIjxD1NKLkfUp0sQyrGCh6EpNqxBZJbr
	NOSHyWmWqGdY10zSY9Q04aPEJMmE/c5NBfBSEww6jBMLNFB6pyBlCYwUVPsHUCG2
X-Gm-Gg: Acq92OHXuoKpEq1kQwHvFupbApnNrF26s0hL8ZFeKgtN6pgvJOaEb7GGqQBDWwLHT3m
	zB3t12dT8D2FBeuhVRwdzpNiB3SoRGwS1RsfXRmpIHAsf42b5K3vmfdli/1RZZH3B067CDY12qG
	qVo5wdo+JZScs+V82TU5zQ9ZXfqf/RPQRI8Su6X7RVm0u8DTY3y4zeZysuud9qTbKSzEfyUVuvM
	FdLycfEVAyFvyqnOZFlkllIdhN54KuxQjM2AK5nGVJ0QOluZHQBjrZdaSvuX4X96jdf6/Cgo3zE
	DTdi3OZmrOfFqUtq9eDxaoLqmIKf6ecOATr5JO7q/QboiCs2cQQLBE/iHzR7zUGgfIUpPCaV1yI
	JPerwcOiY20pWGVRc1Gr5z78JiHVeZzQyeUATJZfXLd9yWidmdtkaNENtW4+y0cMNuXXpyfM2Xh
	LZdCS265AE/vmKdRf418mWJkcIq7YWWOVV3BNRr1vPlRwE6NyNy5A7+sGvBjCBCYeimNaNqzbkm
	Mz4K6Igw19puCGORnKZq302rA==
X-Received: by 2002:a5d:59c5:0:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-45eb368124fmr28746571f8f.11.1779788628043;
        Tue, 26 May 2026 02:43:48 -0700 (PDT)
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
Subject: [PATCH v3 7/9] libs/guest: avoids using 2 indexes
Date: Tue, 26 May 2026 10:43:18 +0100
Message-ID: <20260526094324.12286-8-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779788628-7D5868B7-F1F96C12/0/0
X-purgate-type: clean
X-purgate-size: 2688
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
X-Rspamd-Queue-Id: 31A875D3948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Simplify code, after the first scan of the various arrays we don't need to
keep original types and PFNs but only the ones having data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_restore.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index e148fc594a73..fb46142d8729 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -260,9 +260,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     void *mapping = NULL, *guest_page = NULL;
-    unsigned int i, /* i indexes the pfns from the record. */
-        j,          /* j indexes the subset of pfns we decide to map. */
-        nr_pages = 0;
+    unsigned nr_pages;
 
     if ( !mfns || !map_errs )
     {
@@ -279,12 +277,18 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         goto err;
     }
 
-    for ( i = 0; i < count; ++i )
+    nr_pages = 0;
+    for ( unsigned i = 0; i < count; ++i )
     {
         ctx->restore.ops.set_page_type(ctx, pfns[i], types[i]);
 
-        if ( page_type_has_stream_data(types[i]) )
-            mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
+        if ( !page_type_has_stream_data(types[i]) )
+            continue;
+
+        mfns[nr_pages] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
+        pfns[nr_pages] = pfns[i];
+        types[nr_pages] = types[i];
+        nr_pages++;
     }
 
     /* Nothing to do? */
@@ -302,16 +306,13 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         goto err;
     }
 
-    for ( i = 0, j = 0; i < count; ++i )
+    for ( unsigned i = 0; i < nr_pages; ++i )
     {
-        if ( !page_type_has_stream_data(types[i]) )
-            continue;
-
-        if ( map_errs[j] )
+        if ( map_errs[i] )
         {
             rc = -1;
             ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[j], types[i], map_errs[j]);
+                  pfns[i], mfns[i], types[i], map_errs[i]);
             goto err;
         }
 
@@ -337,7 +338,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
             memcpy(guest_page, page_data, PAGE_SIZE);
         }
 
-        ++j;
         guest_page += PAGE_SIZE;
         page_data += PAGE_SIZE;
     }
-- 
2.54.0


