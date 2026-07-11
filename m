Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D4KoJwy0Umr2SQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503DD742EEA
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eNPfwxmQ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1360644.1613410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8o-00089y-GW; Sat, 11 Jul 2026 21:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360644.1613410; Sat, 11 Jul 2026 21:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8o-00087j-CN; Sat, 11 Jul 2026 21:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1360644;
 Sat, 11 Jul 2026 21:21:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wif8m-0007nS-7a
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 21:21:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wif8l-002mBf-L1
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 23:21:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3c8-2eae-0a2a0a5409dd-0a2a4507a3a0-8
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:39 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3e3-ac46-0a2a45070019-d155dd2de920-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:39 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so1305582f8f.3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 14:21:39 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d8cdsm74809460f8f.1.2026.07.11.14.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 14:21:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783804899; x=1784409699; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nPb7cp3xwXBCEs3XOqo7Tl5/hkWI0YjWiYbVfExIpM4=;
        b=eNPfwxmQnKBvR3NEDh1IBCOK2sLuk5NXeHegBAOL5iqpAWGMaMwwaq7W0Z0esPpELm
         Pa7RgkZ/ZnU5PZ5ochk+UbUDgdfg/PumZc1cSgQRu/IKOt0yv0Vr3oZ7aDrKg6LbmAIr
         pgU/Y4hMFftj0BAQgKfBayHk1CJXVPMY1s+hrBz/VucC2YOKJYwlbc7J3+SApy/PzSjR
         MPDtqm96eYag8WMwmjRsgWfphCfVcHh/gCYvcRwQ4SXkjygw6mU4nFzcH5F6sjqw2QDK
         NJncEvk6O7K0vwWiV9MdP/8TLfzsri+NVcUX3faNX2v3qG1v1VmjZqJOXeQU3g5p0orM
         AWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783804899; x=1784409699;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPb7cp3xwXBCEs3XOqo7Tl5/hkWI0YjWiYbVfExIpM4=;
        b=VB4C5e1MwDE7ZYCLM8Q5X8+WYUw8CHSlRNzfTCF6aXhjL4X3QO184P2OMmHsLwsb/t
         +iJOmpqzHw3xjS26Duz/D4sgV0AKkKkyRguMCg/p2PtarWj2NELngC6Tjt9jt30iWI5K
         uUAFPVdSMo8TBtzBj8DrCw0LptXtkC5aib/iacaZyssnDleO5bpK72a+/uGqfDm8t1t6
         di7OLVRkEqxqQf90eN2zHW9BaSRZR0fywn480AjU5p8v41uww++aJDqRLg5cnnakiE1x
         DLDwB00zJAP/Yx0ER0yhBZIPykmJ5O388A61TFavcq8GGMzm5MjhkVgCnkizuRyXLBii
         fJVg==
X-Gm-Message-State: AOJu0YxE5MqdqX62MpMHcc76dMcpLBGSMFdCNXVlPImzRCHoi0ibVQGn
	XkFBUwzNgizNbkex6+09n6ZWrjsXEqZHZ2BNeQ07J7Kj+PfL/SIMP4nKMK/xMNeWRyY=
X-Gm-Gg: AfdE7cmvvGiwrL9yDP9qppPEFbhvux64wqFXQKBXSPguGLc8mZOqZatOBXQhykUMSU/
	FXSdUXz4rtYXWmq0na/kltoS290u7UVXzVa4B5fZEnNslocOsD5ve84djR9NLTE1D2sdWEQDqED
	U/G6HVA/wunozt8Koy+BmkIO6pa0XOT/N0CogSJLI7ATf+lWOIw0oge/iG/DZiUaD7WajONkPFS
	Bvuvgs2FOeZ/GISqWf3IzUC0tSo/ISVWg3ukV90DhAyuxVnk8U+GDzuDnVIO8ECxUyKK/eNSRMb
	vNPLoYIPA063oGSjrQ34S8A7JwthzrVbzg2sahyh0EI2e+DY/uPycK9cJpGVd20z2Zh+Hl9PpKq
	cB5TXp/2Ge7IJxch3QTZAkmrWc5QDEVYpo0oZHWzSbrunLcRjA8zrGJk294rXAcJbNQcYfSC533
	2esOpwTqW1X3l5hxoOr/pGUVO+b1hnyZ8qyib7K/5xEHU9GeTFnwd1dAX7BiU8KvgDThHSC0qJr
	d8vHBglbAtUKnjPMCY=
X-Received: by 2002:a05:6000:290f:b0:46d:d693:88cb with SMTP id ffacd0b85a97d-47f2dce2db6mr3974180f8f.46.1783804898983;
        Sat, 11 Jul 2026 14:21:38 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v8 3/4] libs/guest: allocate various migration arrays just once
Date: Sat, 11 Jul 2026 22:21:27 +0100
Message-ID: <20260711212128.505727-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711212128.505727-1-frediano.ziglio@citrix.com>
References: <20260711212128.505727-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1783804899-D3F67201-D3630C6A/0/0
X-purgate-type: clean
X-purgate-size: 3795
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 503DD742EEA

From: Edwin Török <edwin.torok@citrix.com>

Allocate these array just once at the start of migration,
using the maximum batch size, and free them at the end.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v2:
- change prefix in subject.

Changes since v3:
- fix comment style

Changes since v4:
- change order of fields in structure.

Changes since v6:
- split preparation commit.
---
 tools/libs/guest/xg_sr_common.h |  6 ++++++
 tools/libs/guest/xg_sr_save.c   | 33 ++++++++++++---------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 7574c9f5b6..c07c6db59e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -246,6 +246,12 @@ struct xc_sr_context
             struct xc_sr_context_save_buffers
             {
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+                xen_pfn_t mfns[MAX_BATCH_SIZE];
+                xen_pfn_t types[MAX_BATCH_SIZE];
+                void *local_pages[MAX_BATCH_SIZE];
+                struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+                uint64_t rec_pfns[MAX_BATCH_SIZE];
+                int errors[MAX_BATCH_SIZE];
             } *buffers;
         } save;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index e7c22e6500..34e41cf410 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -115,24 +115,18 @@ static int write_batch(struct xc_sr_context *ctx)
     assert(ctx->save.buffers);
 
     /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
+    mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
+    types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
+    errors = ctx->save.buffers->errors;
     /* Pointers to locally allocated pages.  Need freeing. */
-    local_pages = calloc(nr_pfns, sizeof(*local_pages));
+    local_pages = ctx->save.buffers->local_pages;
+    memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 2) * sizeof(*iov));
+    iov = ctx->save.buffers->iov;
     /* page_data record PFNs list */
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
-
-    if ( !mfns || !types || !errors || !local_pages || !iov || !rec_pfns )
-    {
-        ERROR("Unable to allocate arrays for a batch of %u pages",
-              nr_pfns);
-        goto err;
-    }
+    rec_pfns = ctx->save.buffers->rec_pfns;
 
     iov[0].iov_base = &hdrs;
     iov[0].iov_len = sizeof(hdrs);
@@ -251,13 +245,10 @@ static int write_batch(struct xc_sr_context *ctx)
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
+    {
         free(local_pages[i]);
-    free(rec_pfns);
-    free(iov);
-    free(local_pages);
-    free(errors);
-    free(types);
-    free(mfns);
+        local_pages[i] = NULL;
+    }
 
     return rc;
 }
@@ -791,8 +782,8 @@ static int setup(struct xc_sr_context *ctx)
 
     if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
-              " deferred pages");
+        ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
+              " and various batch buffers");
         rc = -1;
         errno = ENOMEM;
         goto err;
-- 
2.43.0


