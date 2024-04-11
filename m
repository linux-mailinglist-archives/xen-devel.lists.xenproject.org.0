Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162AF8A1920
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:53:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704054.1100163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwjw-0002dr-F2; Thu, 11 Apr 2024 15:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704054.1100163; Thu, 11 Apr 2024 15:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwjw-0002b3-Bv; Thu, 11 Apr 2024 15:53:28 +0000
Received: by outflank-mailman (input) for mailman id 704054;
 Thu, 11 Apr 2024 15:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Poi8=LQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruwju-0002ZT-Ft
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:53:26 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0596f54-f81b-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 17:53:24 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-789f00aba19so488235785a.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 08:53:24 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 dw7-20020a05620a600700b0078ec2d73c9esm945976qkb.4.2024.04.11.08.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:53:22 -0700 (PDT)
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
X-Inumbo-ID: a0596f54-f81b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712850802; x=1713455602; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RRN4wyQVKK8sx/p5OaCggnAVPVY2eawZsZuVzZ2KlCg=;
        b=V6H+v4qJVJ9oP5u2Z/TClafiRRJn3eIkANuNCDJ5RjNt+iLNO2xc6FCXWDc1qEJOhr
         DBHnDGhrNdeiyPEsY8UkqD9nSc7kPx2p12gD1xy+stowNF14nRRLLgxwiLcXGNGTkJqQ
         TxIAezazWvD9M/+vwW/BGd0pW8R7WiOfrGV1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712850802; x=1713455602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRN4wyQVKK8sx/p5OaCggnAVPVY2eawZsZuVzZ2KlCg=;
        b=h651CrNaMi2+0kqUGO+RXYAEMxvcfVuBI1LS8/cuVwnH9z8HNvT5drHOeQzMiVbchV
         zkye56Y1eprgt4rPfen8Jybn0dhmrgEAdaIj+0WbLkb5gQ+xq68H1brW9eE86z6GWRUW
         3hISPpAUoQ5Z8tIkRD4yLwGu1ppCko+Fp2R3afyzUItY9srmfk26Vnm1jmGyQkyO4AXg
         9AhGr0dCSSyjbIHnAIw7HOjwfKIw9lIa0MyvBE2DwSqT1s5AW08A5MKVj80Ck+6P8gQy
         dQb5mVOwZJBVn7uyDP6/n1eFpIlyAbmb5cSjf9x1erXBG+6PasIQu2ic/FAuAhdefv82
         QNRg==
X-Gm-Message-State: AOJu0YzxlhggOWOhaYz9oKtgvDcLAdHuZ4QYi/XQS8YYFY4cE76pTfHH
	Is2abTwOEfpIoaMxsPQGWS7iG/HxXnGmA2WtipfaBfA54VoaU5009uXuXwMd9haViXcvRAyqV90
	J
X-Google-Smtp-Source: AGHT+IHzC7kWDx1kLumqb1s4U8lf3wUnnSRI5UUmJQKzT2d15wfPZW8XcZBHfnAv9epFFCrStISumg==
X-Received: by 2002:a05:620a:4691:b0:78d:67aa:9d66 with SMTP id bq17-20020a05620a469100b0078d67aa9d66mr53749qkb.15.1712850802389;
        Thu, 11 Apr 2024 08:53:22 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] altcall: fix __alt_call_maybe_initdata so it's safe for livepatch
Date: Thu, 11 Apr 2024 17:53:14 +0200
Message-ID: <20240411155314.73811-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting alternative call variables as __init is not safe for use with
livepatch, as livepatches can rightfully introduce new alternative calls to
structures marked as __alt_call_maybe_initdata (possibly just indirectly due to
replacing existing functions that use those).  Attempting to resolve those
alternative calls then results in page faults as the variable that holds the
function pointer address has been freed.

When livepatch is supported use the __ro_after_init attribute instead of
__initdata for __alt_call_maybe_initdata.

Fixes: f26bb285949b ('xen: Implement xen/alternative-call.h for use in common code')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/alternative-call.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
index 5c6b9a562b92..1896063e5da5 100644
--- a/xen/include/xen/alternative-call.h
+++ b/xen/include/xen/alternative-call.h
@@ -50,7 +50,12 @@
 
 #include <asm/alternative.h>
 
-#define __alt_call_maybe_initdata __initdata
+#ifndef CONFIG_LIVEPATCH
+# define __alt_call_maybe_initdata __initdata
+#else
+/* Must keep for livepatches to resolve alternative calls against them. */
+# define __alt_call_maybe_initdata __ro_after_init
+#endif
 
 #else
 
-- 
2.44.0


