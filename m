Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A062484651C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 01:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674759.1049912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVhav-000348-Hh; Fri, 02 Feb 2024 00:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674759.1049912; Fri, 02 Feb 2024 00:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVhav-000321-E1; Fri, 02 Feb 2024 00:39:49 +0000
Received: by outflank-mailman (input) for mailman id 674759;
 Fri, 02 Feb 2024 00:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgAc=JL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVhat-00031v-9g
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 00:39:47 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ff47a32-c163-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 01:39:45 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-511207d62b6so2372268e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 16:39:45 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n11-20020a170906378b00b00a36a7f0f087sm298651ejc.222.2024.02.01.16.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 16:39:44 -0800 (PST)
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
X-Inumbo-ID: 8ff47a32-c163-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706834384; x=1707439184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EisdkplKjb+6gPzuhq8ok8YmwsZwgkvtvLjmMqQhmg=;
        b=susvAqfe8bZnZnLuHoM1qL1Q9CNoKjbTdyaH4yZ1FeL7MUbQDOjSDGHEvqS5zs5ZM7
         9R7E4ij/iXxR3WjdwdDnlpzyfDGSypFk6CbtWPJY/6nb7kuYljEbFpkXEnQVriNhTWKF
         Dadz4Xw58yz69AV3w+r3pK4dKN5a7zpo9Pu04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706834384; x=1707439184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EisdkplKjb+6gPzuhq8ok8YmwsZwgkvtvLjmMqQhmg=;
        b=RGuvGZ+LeLq0mBHPVlFSH1WRwtbwAZy/xmjZiuWf6GHV+khINItX9uOA71kyCImSjx
         8b+RVmcm//a+BPDm+ERrEOHsoZtDBH/ASwO5yQf1z1QcIKDK4KAfrl0kUmJAFkD0VsZS
         FWY7y3r5PTeVL2QKDhswvj93NDtVrHTdpWOkwI3CUy8u0Rqwp1f4zG5QlnibgXpoNXlr
         1S4oP/J3p3FAnk2Vvc1XrdwYXIZsyT/xEjpDMxH2DS/lEW+fZYdtBiZkksPpy75MaswO
         01CYrZkpvUCIkYX/j8SAV2wjLNKs9BcouFFp7UtztWoxsm2+VqvcN3nLLy+bVpvNazrX
         xi+g==
X-Gm-Message-State: AOJu0Yyb8kxk1xW4B2DSKxiHn0DP35gWTgEmjVLFCjyGteNV5y9f2o+1
	8rSjuNXPJ/d5QDL1oFJW+grSWB0fg0W35ttKYaxzLx9QFpyg6hXYBPA8pj7J2OjQcJRg727ZPrD
	x
X-Google-Smtp-Source: AGHT+IFpdZknAV/M2vLYEnw5xA1s2f+VaDjY4Kop0dtLfxUXeprQVZtqtiqIJFqKiGo20Izj1EMP9w==
X-Received: by 2002:a05:6512:707:b0:511:3622:508e with SMTP id b7-20020a056512070700b005113622508emr133273lfs.62.1706834384542;
        Thu, 01 Feb 2024 16:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU9JRUni8fQW8KcKh/baFTMBFJUgblA7/G9GXFqu91nn3iBWBu1BznpGc8SMHt1M2ITUM2j+Oahx4t0r07ElbTECbVz4/gVuvnrZYMZ+RE5NiRBk4jF7Cx3vrD8FB3dPwrjvKg0DhzhtRa+9aNGj/lvmIesvneKmuGxeHf3NW7vR7pVOlqv53U2LcHHY1jOAw==
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen: Swap order of actions in the FREE*() macros
Date: Fri,  2 Feb 2024 00:39:42 +0000
Message-Id: <20240202003942.647599-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wherever possible, it is a good idea to NULL out the visible reference to an
object prior to freeing it.  The FREE*() macros already collect together both
parts, making it easy to adjust.

This has a marginal code generation improvement, as some of the calls to the
free() function can be tailcall optimised.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/include/xen/mm.h      | 3 ++-
 xen/include/xen/xmalloc.h | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3d9b2d05a5c8..044f3f3b19c8 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -92,8 +92,9 @@ bool scrub_free_pages(void);
 
 /* Free an allocation, and zero the pointer to it. */
 #define FREE_XENHEAP_PAGES(p, o) do { \
-    free_xenheap_pages(p, o);         \
+    void *_ptr_ = (p);                \
     (p) = NULL;                       \
+    free_xenheap_pages(_ptr_, o);     \
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index 9ecddbff5e00..1b88a83be879 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -66,9 +66,10 @@
 extern void xfree(void *p);
 
 /* Free an allocation, and zero the pointer to it. */
-#define XFREE(p) do { \
-    xfree(p);         \
-    (p) = NULL;       \
+#define XFREE(p) do {                       \
+    void *_ptr_ = (p);                      \
+    (p) = NULL;                             \
+    xfree(_ptr_);                           \
 } while ( false )
 
 /* Underlying functions */

base-commit: 3f819af8a796c0e2f798dd301ec8c3f8cccbc9fc
-- 
2.30.2


