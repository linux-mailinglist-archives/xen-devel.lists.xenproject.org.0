Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A686E139
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 13:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687648.1071364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg2E3-0002sj-0A; Fri, 01 Mar 2024 12:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687648.1071364; Fri, 01 Mar 2024 12:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg2E2-0002pm-T0; Fri, 01 Mar 2024 12:42:54 +0000
Received: by outflank-mailman (input) for mailman id 687648;
 Fri, 01 Mar 2024 12:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jGsc=KH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rg2E1-0002pg-G4
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 12:42:53 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37025410-d7c9-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 13:42:51 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-21edca2a89dso1007918fac.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 04:42:51 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 w1-20020a05620a0e8100b007853f736893sm1608490qkm.5.2024.03.01.04.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 04:42:48 -0800 (PST)
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
X-Inumbo-ID: 37025410-d7c9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709296969; x=1709901769; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/yrDSPpcrVwedi2F9gehZixolrotrnrXDhAVNv+q5K8=;
        b=CiCl0A4YeR8sEJ9WxWF5tmtjG/2JKVjvFIqPwrJvspQKDNn4hY4RtifFS6uyTwDhUV
         eftjN4CSW6bUK2PHxKYFdCiBVcRooir+cilPrzUAtDecJmLESM7d32Aia+gZ3H9H2g7M
         ncOG6O5dUVZ2XS7F7G6tgnDs0IaeOZY8Ej6pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709296969; x=1709901769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yrDSPpcrVwedi2F9gehZixolrotrnrXDhAVNv+q5K8=;
        b=mvQqlLBHJTwVpZz4jd5QsepZ8c/2VjolBN/7psc/PLpahylnyvqOZ0cUZI1od+gzwJ
         gGWY6WsORruMS6Zqw3dNsHL0zgM2AorTBs9vAq4mkJyMWtPIK1lsxgEYpDqrM+kiCWad
         L8OjkM9qZeauMSGL+obXwVSf9qHXkTehPYXRxUCKPxzSxFDwWYs/jRczcuH4qkvHL6Ew
         kehLr4Xq+WYNxg2x8IXa0d59gpXuoQAARFiZdoREfU0jhEa/EWwZaEHZM+7W/vvAp5CZ
         HxZ1L7ViOMuaxOhNhp6ZZ9wToeL7x3dIWGdSS/vAWUWGUlfpDp2kQRC9ofwf52eeqXCs
         or9Q==
X-Gm-Message-State: AOJu0YwhHSF/mLo6tGFq0Yjyf8a2kuaYjMjNrSXtB4a2h07AfGK1hM6+
	H/9lPWa77dpO7ng2W73LlygzlNlVQVKjPQYcNnza7WOvEL7kktcYAP3Z2cqEjhB3a0NhEWnwCLW
	x
X-Google-Smtp-Source: AGHT+IFdz+nfx5bajN0waBAIBb91rv9mlMdNQKfvkPLeyZAeD3briXViiPraIye9heLYeSUlV7o9lQ==
X-Received: by 2002:a05:6870:ab0b:b0:21f:cb22:86b1 with SMTP id gu11-20020a056870ab0b00b0021fcb2286b1mr1504835oab.11.1709296969252;
        Fri, 01 Mar 2024 04:42:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mm: re-implement get_page_light() using an atomic increment
Date: Fri,  1 Mar 2024 13:42:27 +0100
Message-ID: <20240301124228.56123-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current usage of a cmpxchg loop to increase the value of page count is not
optimal on amd64, as there's already an instruction to do an atomic add to a
64bit integer.

Switch the code in get_page_light() to use an atomic increment, as that avoids
a loop construct.  This slightly changes the order of the checks, as current
code will crash before modifying the page count_info if the conditions are not
correct, while with the proposed change the crash will happen immediately
after having carried the counter increase.  Since we are crashing anyway, I
don't believe the re-ordering to have any meaningful impact.

Note that the page must already have a non-zero reference count which prevents
the flags from changing, and the previous usage of the cmpxchg loop didn't
guarantee that the rest of the fields in count_info didn't change while
updating the reference count.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 4d6d7bfe4f89..2aff6d4b5338 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2580,16 +2580,10 @@ bool get_page(struct page_info *page, const struct domain *domain)
  */
 static void get_page_light(struct page_info *page)
 {
-    unsigned long x, nx, y = page->count_info;
+    unsigned long old_pgc = arch_fetch_and_add(&page->count_info, 1);
 
-    do {
-        x  = y;
-        nx = x + 1;
-        BUG_ON(!(x & PGC_count_mask)); /* Not allocated? */
-        BUG_ON(!(nx & PGC_count_mask)); /* Overflow? */
-        y = cmpxchg(&page->count_info, x, nx);
-    }
-    while ( unlikely(y != x) );
+    BUG_ON(!(old_pgc & PGC_count_mask)); /* Not allocated? */
+    BUG_ON(!((old_pgc + 1) & PGC_count_mask)); /* Overflow? */
 }
 
 static int validate_page(struct page_info *page, unsigned long type,
-- 
2.44.0


