Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E459AB992
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 00:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824299.1238419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXp-0002yc-6T; Tue, 22 Oct 2024 22:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824299.1238419; Tue, 22 Oct 2024 22:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3NXp-0002pu-13; Tue, 22 Oct 2024 22:40:05 +0000
Received: by outflank-mailman (input) for mailman id 824299;
 Tue, 22 Oct 2024 22:40:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjUh=RS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3NXn-000277-9S
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 22:40:03 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92fdf875-90c6-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 00:40:01 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso3114901a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 15:40:01 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913076f5sm396704066b.95.2024.10.22.15.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 15:39:59 -0700 (PDT)
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
X-Inumbo-ID: 92fdf875-90c6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729636800; x=1730241600; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C87F54BHlnewuAYUBvjYbM5M2wyL7R+xBacmzm9+EfQ=;
        b=TkcQYSG+fVoVvmvpw4y1IOjAsh6v3C8xtNs9ejvlTnJjD0BGPKvu/Xp6rp+b+mQUZa
         1yRbPX2F8ZlNav6Euz76T8iEcjYs1an49rVSj/rhD98PaObv9AcbkGBS8lQLxU6uGEWR
         +FDwsoKljC/TPZsufuyT/be7hBXMvi8K+5ADQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729636800; x=1730241600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C87F54BHlnewuAYUBvjYbM5M2wyL7R+xBacmzm9+EfQ=;
        b=EUfKxRsmPnON0T5q4dqlRBXUkHCNRczVjaeSC8EGdyBmTftw1t8/2Nc7AzP00ZEV0o
         +epR3GmBx0ldcfzCt1yUm9EiTVPqgEfvhvje/E4ntUC5Txf9g87HC/J0EWcs1wrpeuxo
         sMuUm2k6j6RXw79/HVHlGdv52skMUQBmkwDohnEm1qfbgGWJ+oMal76/xaifwW5mw7EV
         vywOhsaQQisEjOXRbK3iQa6WqsbWwm2aEH550zRj/sDpJ3tGUsC76XzmUwcdW7UhOl0r
         PGuIzn2o7vLla8lMw0OFIvPxx6JuQ2Kj0Nr0+i/VldPGpS7I+DTpevA5uH4JZGHtXLi9
         ZSvg==
X-Gm-Message-State: AOJu0YwOPkI1xB3eUVVuysig+Vi+4zLred4YYLdJ1fBM++iACIxnGeRX
	VP3VO4zHR1LVnBFADETg0CxTD1uog46IRaiqJF+BbyTBRO4d+VBKjlfyF3BF9tkpFtYZBmoieUF
	P
X-Google-Smtp-Source: AGHT+IGwkerqzCYPmxUQirCtPpPgH8/ENEiUF9o2wQYWSdRbqopzg6LlHTHKmeTfkmTH6WL+hcjxiQ==
X-Received: by 2002:a17:907:9403:b0:a99:e98f:e73d with SMTP id a640c23a62f3a-a9abf8b06f9mr43186166b.37.1729636800293;
        Tue, 22 Oct 2024 15:40:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/3] x86/boot: Simplify address calculations in move_memory()
Date: Tue, 22 Oct 2024 23:39:53 +0100
Message-Id: <20241022223954.432554-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022223954.432554-1-andrew.cooper3@citrix.com>
References: <20241022223954.432554-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Given that soffs is the offset into the 2M superpage,

  start = (src - soffs) >> PAGE_SIFT

is a complicated expression for the frame address of the containing superpage.
Except, start is converted straight back to a byte address to use, so the
shifting is unnecessary too.

The only done with the mapped pointer is to have soffs added back on for the
memmove() call.  bootstrap_map_addr() passes through the offset, so we can
pass src directly in and simplify the memmove() call too.  For the end mapping
address, this simplifies to just src + sz too.

The same reasoning holds for dst and doffs.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/setup.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 46a0b3093c2c..152cd696d6c2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -492,31 +492,26 @@ static void __init noinline move_memory(
 
     while ( size )
     {
-        unsigned int start /* frame */;
         unsigned int end   /* mapsz */;
         unsigned int soffs = src & mask;
         unsigned int doffs = dst & mask;
         unsigned int sz;
         void *d, *s;
 
-        start = (src - soffs) >> PAGE_SHIFT;
         end = soffs + size;
         if ( end > blksz )
             end = blksz;
         sz = end - soffs;
-        s = bootstrap_map_addr(pfn_to_paddr(start),
-                               pfn_to_paddr(start) + end);
+        s = bootstrap_map_addr(src, src + sz);
 
-        start = (dst - doffs) >> PAGE_SHIFT;
         end = doffs + size;
         if ( end > blksz )
             end = blksz;
         if ( sz > end - doffs )
             sz = end - doffs;
-        d = bootstrap_map_addr(pfn_to_paddr(start),
-                               pfn_to_paddr(start) + end);
+        d = bootstrap_map_addr(dst, dst + sz);
 
-        memmove(d + doffs, s + soffs, sz);
+        memmove(d, s, sz);
 
         dst += sz;
         src += sz;
-- 
2.39.5


