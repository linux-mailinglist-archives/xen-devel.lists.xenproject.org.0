Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30708CEAAC
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729757.1135111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8z-0001xX-9n; Fri, 24 May 2024 20:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729757.1135111; Fri, 24 May 2024 20:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8y-0001nD-MN; Fri, 24 May 2024 20:04:00 +0000
Received: by outflank-mailman (input) for mailman id 729757;
 Fri, 24 May 2024 20:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8w-000773-8d
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c09c0368-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso122388366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:56 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:55 -0700 (PDT)
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
X-Inumbo-ID: c09c0368-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581036; x=1717185836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlC1OJvyxmbXQCbGIy6Vwf8C5QyN1N/4JG+CgGnlpRU=;
        b=W4Vn8jeMcf3e3Cf/cA2EbswwJAAdH3KK18eI/yxPtwDuKoqzUGRjtN3B0aseVZk9rK
         d1wPt2Z+onl0uBjpQB304H5v59sdyYfF0at5/rWFQP1U+rVMPPu0d5D/uRjhSthuwrZg
         M68n9HH+In3Qcx3hW6+KkVaycHp0jIQvGN+pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581036; x=1717185836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlC1OJvyxmbXQCbGIy6Vwf8C5QyN1N/4JG+CgGnlpRU=;
        b=fyPa+BHgkBftErxLTBSL8tlwlmE4HcMJhKUFWKI1CJmZfcxzdWRVevv/ozlhbTM/a1
         ePxJxG5CkYFWc+vMbhx+XXC33cqJlOxB1TJa3SvQvBuZ6SJX3CMyTh/adHDvJ9Q9Dmi1
         Nkw8+Aadyg+i98tn+JqGwwQxxOerVfZ3jbAflMJMM0n5wbe7DzsTW4kw3vjKttPjWbUA
         ktCf+We0OSvrRYg9TiDF1BxrXmR/B1JEJ9pU7+CEkT1Ec2kqd1UMf9WzxkiKIQNyxWOo
         /K+KM+91nGhHCMbN10VthXq9qE5qCMlYqEXARS2GcH+o+JRvSJfBhL0cF+/RT4iJDHfz
         NDLQ==
X-Gm-Message-State: AOJu0Yx5PvClYnxw99THLKLfQOJEB7vR/sByZ86HSnUXcsrvjfHq87SP
	aRQTSz0+pLiwfBRYpNHpISsPZy6p6A55k77beqfU7ga2v6bO3OWevvdTN3pgn7te7cyrPNic78A
	aVWE=
X-Google-Smtp-Source: AGHT+IF8O0rWqo0YlTUhztmqD2tpEsu9ss1HcoDAnauTBrFqCne9vXBOwm/Ri806Jb93zik3jeTNJw==
X-Received: by 2002:a17:906:4ac1:b0:a5a:8bc4:f503 with SMTP id a640c23a62f3a-a62641dfe3fmr206635666b.25.1716581036021;
        Fri, 24 May 2024 13:03:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 13/13] xen/bitops: Rearrange the top of xen/bitops.h
Date: Fri, 24 May 2024 21:03:38 +0100
Message-Id: <20240524200338.1232391-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The #include <asm/bitops.h> can move to the top of the file now now that
generic_f?s() have been untangled.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * New
---
 xen/include/xen/bitops.h | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index c5518d2c8552..6a5e28730a25 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -4,6 +4,8 @@
 #include <xen/compiler.h>
 #include <xen/types.h>
 
+#include <asm/bitops.h>
+
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
  * position @h. For example GENMASK(30, 21) gives us 0x7fe00000ul.
@@ -15,27 +17,13 @@
     (((~0ULL) << (l)) & (~0ULL >> (BITS_PER_LLONG - 1 - (h))))
 
 /*
- * Find First/Last Set bit.
+ * Find First/Last Set bit (all forms).
  *
  * Bits are labelled from 1.  Returns 0 if given 0.
  */
 unsigned int __pure generic_ffsl(unsigned long x);
 unsigned int __pure generic_flsl(unsigned long x);
 
-/*
- * Include this here because some architectures need generic_ffs/fls in
- * scope
- */
-
-/* --------------------- Please tidy above here --------------------- */
-
-#include <asm/bitops.h>
-
-/*
- * Find First/Last Set bit (all forms).
- *
- * Bits are labelled from 1.  Returns 0 if given 0.
- */
 static always_inline __pure unsigned int ffs(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
-- 
2.30.2


