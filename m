Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E731D9AB993
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 00:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824297.1238404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXo-0002ev-F6; Tue, 22 Oct 2024 22:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824297.1238404; Tue, 22 Oct 2024 22:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXo-0002ZQ-94; Tue, 22 Oct 2024 22:40:04 +0000
Received: by outflank-mailman (input) for mailman id 824297;
 Tue, 22 Oct 2024 22:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3NXl-00026E-Sc
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 22:40:01 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e98bd7-90c6-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 00:40:00 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso890427866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 15:39:59 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913076f5sm396704066b.95.2024.10.22.15.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 15:39:58 -0700 (PDT)
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
X-Inumbo-ID: 91e98bd7-90c6-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729636799; x=1730241599; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdLdfba2PiBiA/2L4zZymgw8I8BN4e9PskPZBu3Nv6w=;
        b=Ihjnr8/+wom3b/zS/Ia1BfcNE8bMXF1u2KR9Ul7dX+biBWfkvuzkl12w2CoXzj4N0b
         M16uiHZU0p1hcPHchO9wJRyKfETvtANvEF4vPlpgY9squBbh6QkA4rbCQSJtnSqnpg8C
         o1y9MYMkMKekDk3K0gQy7KZA76eF4qnyCzMe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729636799; x=1730241599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdLdfba2PiBiA/2L4zZymgw8I8BN4e9PskPZBu3Nv6w=;
        b=sP6QrB/42gFFst3wtWfEJBFpdvaalhEx3OMf5EpGzefMiU85IapOZM2hqIrbw/FCIX
         8bdo5teOfgK7WkgcAPLpIu3Tc51FleD6gYqKeZ16gyszAnbYGbqFjb+XzzeWe/DFN/im
         MMsZCwriRs/1AevfvB1dQT5CY3AJGZ3yEqdpQaazzBqsJp9pVcqqtEn6sxUPWcAqF24W
         20A9DtES5Busj/QanReJLyYo3hvctHk97aL/WVkFvTDqZdaSplvWAxB3/F5zFXu6V2Ga
         Q0dMMR39Olhu2afYS7KTsAHD0ViU151yN/4f+K3iwgWBo0HoNVzLtbBySznx0Jn4/v+h
         /l7g==
X-Gm-Message-State: AOJu0YyYlN6p+ptvHjvkZVDLol4Ysb9iR3C/GxCISx63Q18Cl0A8Ks7P
	1mSVFo2kXC7dXnBEB3kauDlWpUeq0Vknrn+c2S+BhB2iiV8DJKskKmWir6hhmZ3SwYL0j2AVpoR
	8
X-Google-Smtp-Source: AGHT+IGVn6i0LkXUb+yXm4tFD12xZCnycC5rC6hMgzmTv7Rd+Ezlg7+7CgXEXOhLqSGyFukr8Be94g==
X-Received: by 2002:a17:907:3d92:b0:a99:fc3d:7c76 with SMTP id a640c23a62f3a-a9abf8a8f8dmr43877566b.37.1729636798692;
        Tue, 22 Oct 2024 15:39:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/3] x86/boot: Convert move_memory() to use bootstrap_map_addr()
Date: Tue, 22 Oct 2024 23:39:52 +0100
Message-Id: <20241022223954.432554-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022223954.432554-1-andrew.cooper3@citrix.com>
References: <20241022223954.432554-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

move_memory() is very complicated, and buggy.  In order to fix the latter, we
have to address the former.

Given prior cleanup, bootstrap_map() is now implemented in terms of
bootstrap_map_addr(), meaining that it is counterproductive to plumb the
mapping through module_t.

Delete mod, and introduce two same-sized/named fields.  At this point in boot,
neither fields have their named purpose, so indicate the purpose in comments.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

This is broken out both to ease review (I recommend git diff --color-words),
and for bisection purposes given how many times I've failed to edit this logic
correctly.

This does not conflict with anything in Hyperlaunch v7, but it does remove the
only callers of bootstrap_map() remaining by the end of the series, allowing
for even more cleanup.

In terms of bugs.  The ones I've spotted so far are:

 * The blksz calculation depends on the previous thing having been unmapped
   first.

 * The calculation halving blksz based on BOOTSTRAP_MAP_BASE is bogus.  It
   might plausibly be a remnent of 32bit Xen with the absence of highmem.

 * The caller of move_memory() is strictly moving modules forward in
   memory (dst > src) with a possibility of partial overlap.  The while loop
   maps dst and src, blksz chunks at a time, ascending, with s < d.  This
   results in memmove() doing an unconditional backwards copy.

   I don't see how this logic could ever have worked for an overlapping move.

 * The caller of move_memory() already has a good mapping for dst, so we don't
   even need to split BOOTSTRAP_MAP_LIMIT in half to map both parts.
---
 xen/arch/x86/setup.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 059b597331a7..46a0b3093c2c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -492,26 +492,29 @@ static void __init noinline move_memory(
 
     while ( size )
     {
-        module_t mod;
+        unsigned int start /* frame */;
+        unsigned int end   /* mapsz */;
         unsigned int soffs = src & mask;
         unsigned int doffs = dst & mask;
         unsigned int sz;
         void *d, *s;
 
-        mod.mod_start = (src - soffs) >> PAGE_SHIFT;
-        mod.mod_end = soffs + size;
-        if ( mod.mod_end > blksz )
-            mod.mod_end = blksz;
-        sz = mod.mod_end - soffs;
-        s = bootstrap_map(&mod);
-
-        mod.mod_start = (dst - doffs) >> PAGE_SHIFT;
-        mod.mod_end = doffs + size;
-        if ( mod.mod_end > blksz )
-            mod.mod_end = blksz;
-        if ( sz > mod.mod_end - doffs )
-            sz = mod.mod_end - doffs;
-        d = bootstrap_map(&mod);
+        start = (src - soffs) >> PAGE_SHIFT;
+        end = soffs + size;
+        if ( end > blksz )
+            end = blksz;
+        sz = end - soffs;
+        s = bootstrap_map_addr(pfn_to_paddr(start),
+                               pfn_to_paddr(start) + end);
+
+        start = (dst - doffs) >> PAGE_SHIFT;
+        end = doffs + size;
+        if ( end > blksz )
+            end = blksz;
+        if ( sz > end - doffs )
+            sz = end - doffs;
+        d = bootstrap_map_addr(pfn_to_paddr(start),
+                               pfn_to_paddr(start) + end);
 
         memmove(d + doffs, s + soffs, sz);
 
@@ -519,7 +522,7 @@ static void __init noinline move_memory(
         src += sz;
         size -= sz;
 
-        bootstrap_map(NULL);
+        bootstrap_map_addr(0, 0);
     }
 }
 
-- 
2.39.5


