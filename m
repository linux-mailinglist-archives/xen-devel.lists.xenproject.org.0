Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cj6HNAu0UmrySQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4FD742EDD
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qKOmbQSn;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1360645.1613415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8o-0008GJ-PF; Sat, 11 Jul 2026 21:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360645.1613415; Sat, 11 Jul 2026 21:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8o-00089s-M3; Sat, 11 Jul 2026 21:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1360645;
 Sat, 11 Jul 2026 21:21:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wif8n-00083H-OR
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 21:21:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wif8n-00Ac2k-5L
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 23:21:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3bd-5cb7-0a2a0a5109dd-0a2a4508bcba-4
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:41 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3e4-ee29-0a2a45080019-d155802da550-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:41 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4938d5f86f3so14815375e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 14:21:41 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d8cdsm74809460f8f.1.2026.07.11.14.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 14:21:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783804900; x=1784409700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLiExMbqfLeimgkvhGVcWHLdFUDKqJKlc0Jm68oRzVw=;
        b=qKOmbQSnonOZqgUT0DSCYCeFR4DGS3A+5LtGSPToBckEZQQ4PdEft7c7loD27vgJR2
         Nk5PIqcU7gVH3IEmnSRxnaPBMYXyWOAgsc+5Sny2rufiywI6YIRlAbNTdG1E71eMKK/0
         wViJW7jqArTW72lRorwOFJSgXiR7dhEJZomBqml2d3kpRZJg8GbRsH3c0ceNGVbMi01g
         kzlQxXbwAhHTkLOmAGO4cDdSi8ZomLyVZ+TsxgmkFgHibZFlTX5+/ap3MUOyLGQqdmi0
         M6wQbd7WtF5jH3gc5sInILU+67DkYc8cxn/mQHtWYzcQtDZtxOgnYmUZ6LDiQ+5huPnS
         GXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783804900; x=1784409700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLiExMbqfLeimgkvhGVcWHLdFUDKqJKlc0Jm68oRzVw=;
        b=dBUFBjlFN9CtECmrobEQrVLtA2d4p1H2qYhZit2NtutYmzlcfnEDqJuZ8SBSjXKPqh
         8/IZo5kbt5cNKp633gAlqRBOYK2Vd3L/9Fga7eVL9nWDjm3Rlq1pOLOH8Esa4jearnFk
         YdGX73JnMu3ChvR0FE4MAp4zLveNjR9dLEwCEuydaAPB9MVBGKVn6cx7je17X/16S+l1
         Fc5L278YOWSl01kp/h65BMz9+nKHm4ivbQInXKSPohk59riOFuT/aYxLN67Xy0CxJitl
         TrgMjz6B++2e6pnHtwkXdmkfPPdH8PaOSPVYgZ/eKfaYiQgcVvJJ/N5QCJ/MP+dq3Z9G
         PjnA==
X-Gm-Message-State: AOJu0Yz3hJ8CJopmHsvXG9WziSX6ZWQyOb2xAgdpw0zUC6yG+YW/Do2S
	nclyNXl+IWeBW7eM8bYhJ35KT9qRLk6hskWGeemZbgKUak+G8K3HL2MPVOjYAl4k54Q=
X-Gm-Gg: AfdE7ckrRYtjB813tepjrLlzguNCl5mjrbXdygCeprWHWN4uMzGaZ0xwcIxr3aTktyn
	y04oHvMFKg4yENqXuliKwrUOb9XTDK/axW8qJA6jucn1UsRJ+BvoQpY0JZINk0NKseyAJbcykXa
	nLCvUe/zUxM+oS8p7Q3hKPJcIDRca3RGtHvnlH+BtNoxhHusFw7M27hZJ8Flk3A0af2X8+OLuMb
	toxiyC9vpdORNMZajV8i0QyPBKmUgRvhOurFfD5Vj5xE+4XQZJpYK6Y9xOS1K+2GWGVQpkS7gqR
	hLdJIZThrSNC2Ycd4wRO1cGi2zA/xnb2AnzHVVX+/+2W+d23y+/nuyXakMDV92OfDYqQ7+XhJTK
	9hOLod99asy8zgPWLyXJKiA1cuuOsUPnF9XfNAnbR9UwL3zIXn6gH48JdP+BFGZpdiOLNyZIwPP
	8LAm8cgCuBfXYPW7XtjasH/xtWgprtlLCzM/ZPV3iSzbiQ4SHc/OF/s4U7aj78dQUiv4GgRm6uQ
	NGhMijx6e2T00IniFw=
X-Received: by 2002:a05:600c:6749:b0:493:edde:54c8 with SMTP id 5b1f17b1804b1-493f8885b92mr39245425e9.8.1783804900465;
        Sat, 11 Jul 2026 14:21:40 -0700 (PDT)
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
Subject: [PATCH v8 4/4] libs/guest: use Valgrind to detect various buffer overflows
Date: Sat, 11 Jul 2026 22:21:28 +0100
Message-ID: <20260711212128.505727-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711212128.505727-1-frediano.ziglio@citrix.com>
References: <20260711212128.505727-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1783804901-11D7201C-55CF5499/0/0
X-purgate-type: clean
X-purgate-size: 4031
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 7F4FD742EDD

Previously this was done as buffers were allocated separately.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/ctrl/xc_private.h    |  8 ++++++++
 tools/libs/guest/xg_sr_common.h |  8 ++++++++
 tools/libs/guest/xg_sr_save.c   | 12 ++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 8a325c17b0..bef96521c3 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -45,8 +45,16 @@
 #if defined(HAVE_VALGRIND_MEMCHECK_H) && !defined(NDEBUG) && !defined(__MINIOS__)
 /* Compile in Valgrind client requests? */
 #include <valgrind/memcheck.h>
+#define MEM_NOACCESS_BUFFER(name, size) uint8_t name[size];
+#define MEM_NOACCESS_INIT(field) \
+    VALGRIND_MAKE_MEM_NOACCESS(field, sizeof(field))
+#define MEM_UNDEFINED_INIT(field) \
+    VALGRIND_MAKE_MEM_UNDEFINED(field, sizeof(field))
 #else
 #define VALGRIND_MAKE_MEM_UNDEFINED(addr, len) /* addr, len */
+#define MEM_NOACCESS_BUFFER(name, size)
+#define MEM_NOACCESS_INIT(field) do {} while(0)
+#define MEM_UNDEFINED_INIT(field) do {} while(0)
 #endif
 
 #if defined(__MINIOS__)
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index c07c6db59e..d3fc7f363e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -245,13 +245,21 @@ struct xc_sr_context
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
             struct xc_sr_context_save_buffers
             {
+                MEM_NOACCESS_BUFFER(na0, 16);
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na1, 16);
                 xen_pfn_t mfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na2, 16);
                 xen_pfn_t types[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na3, 16);
                 void *local_pages[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na4, 16);
                 struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+                MEM_NOACCESS_BUFFER(na5, 16);
                 uint64_t rec_pfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na6, 16);
                 int errors[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na7, 16);
             } *buffers;
         } save;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 34e41cf410..c5022b2a1d 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -115,8 +115,10 @@ static int write_batch(struct xc_sr_context *ctx)
     assert(ctx->save.buffers);
 
     /* Mfns of the batch pfns. */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->mfns);
     mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->types);
     types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
     errors = ctx->save.buffers->errors;
@@ -124,8 +126,10 @@ static int write_batch(struct xc_sr_context *ctx)
     local_pages = ctx->save.buffers->local_pages;
     memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
     /* iovec[] for writev(). */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->iov);
     iov = ctx->save.buffers->iov;
     /* page_data record PFNs list */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->rec_pfns);
     rec_pfns = ctx->save.buffers->rec_pfns;
 
     iov[0].iov_base = &hdrs;
@@ -788,6 +792,14 @@ static int setup(struct xc_sr_context *ctx)
         errno = ENOMEM;
         goto err;
     }
+    MEM_NOACCESS_INIT(ctx->save.buffers->na0);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na1);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na2);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na3);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na4);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na5);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na6);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na7);
 
     rc = 0;
 
-- 
2.43.0


