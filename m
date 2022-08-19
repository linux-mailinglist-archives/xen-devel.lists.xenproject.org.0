Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14159A6A8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 21:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390441.627918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7v1-000690-EX; Fri, 19 Aug 2022 19:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390441.627918; Fri, 19 Aug 2022 19:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP7v1-00065k-BR; Fri, 19 Aug 2022 19:44:35 +0000
Received: by outflank-mailman (input) for mailman id 390441;
 Fri, 19 Aug 2022 19:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yp9C=YX=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oP7uz-0004jK-CC
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 19:44:33 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58d37be8-1ff7-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 21:44:32 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id s11so6822506edd.13
 for <xen-devel@lists.xenproject.org>; Fri, 19 Aug 2022 12:44:32 -0700 (PDT)
Received: from uni.. (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.googlemail.com with ESMTPSA id
 r17-20020a1709061bb100b00731745a7e62sm2695059ejg.28.2022.08.19.12.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 12:44:31 -0700 (PDT)
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
X-Inumbo-ID: 58d37be8-1ff7-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=oaP6VIExQ6VB20XSakrb2m2jk5jIzbKw+InFoPyPqpQ=;
        b=Kz5hlhDsAbE0V+Hdu1MkI+s4ScUYUw82Sk7ZdPlemeKVuLsEpXlxQb4oL3hG77d8uQ
         hG6zGuv0HkHplTMk90v9s74MUJ8iZFvXkfQ0Bi9BnOH9mKWH87JDFRxyIx2Xhye13I0M
         VDf7tis8w04matFtPdEsCVryt9Xg7N5+OmuIZdqE1maHVol/qy6qDMQfETEF+Mq+WatC
         ZfWnniIkX0UwC3ad3z8/e4+5hKDMJSTFOb38hJGYh8GYGBo/cUgZxAm1MxuLvPjWqkcR
         42Bk6ZZuSjFOm1ibIu3QaRJQ4HUAKhMV780Tplom+baXVv06cb7gLgoxWneCOg1kHnWA
         I3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=oaP6VIExQ6VB20XSakrb2m2jk5jIzbKw+InFoPyPqpQ=;
        b=jaP2bWz0K0EgX3i9t9Ufems4Q6gMMJlCbjdEJXOYAHz6TJubbEJnXckpzj1NnhmQa2
         UfZbfj70h2YWXAhZMwIHT3L4gvhUhxqFmhlsgy2eMnsrk0wWuUF2JhsSL0Cb1Liw3UDZ
         XrIiDB6i+JB+589H975NZhRMdOFeyzftV8ITiocWScgDcfzMZTDrsrk1aShnpokOKU89
         TcQ/N7rGUwLejn6Eb/Q2vh6juknV+O6EY4fSjiA+GpqSIwl38uCa/LC7Ovui49GlFdZp
         zRrKVMzmNSqYqMY1SuIo7W+ddOVXRPzYiHVt8QIt2ayDRgAULLRKgfwx+febNAZeWv6q
         jtRQ==
X-Gm-Message-State: ACgBeo0YJYd34GAFO14T+80fFQlN9oFNVC1XGbC02GP4eR8T4T6N1QpA
	bm8e7RJJEptKNQqx07yQkFHzjE5mHwk=
X-Google-Smtp-Source: AA6agR5ALNTr5VEXaywB+zWMCz2vNmDS8Jlmfx3ifRTq40lScBZJBLJj4C0orNke/WLKx35poe6nyg==
X-Received: by 2002:a05:6402:2706:b0:43e:5df1:2e04 with SMTP id y6-20020a056402270600b0043e5df12e04mr7137371edd.315.1660938272143;
        Fri, 19 Aug 2022 12:44:32 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/7] xen/rbtree: Fix MISRA C 2012 Rule 20.7 violation
Date: Fri, 19 Aug 2022 22:43:57 +0300
Message-Id: <20220819194359.1196539-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In macro __rb_parent(), add parentheses around the macro parameter to prevent
against unintended expansions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/lib/rbtree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/lib/rbtree.c b/xen/lib/rbtree.c
index 85a4f20313..eb418baabb 100644
--- a/xen/lib/rbtree.c
+++ b/xen/lib/rbtree.c
@@ -46,7 +46,7 @@
 #define		RB_RED		0
 #define		RB_BLACK	1
 
-#define __rb_parent(pc)    ((struct rb_node *)(pc & ~3))
+#define __rb_parent(pc)    ((struct rb_node *)((pc) & ~3))
 
 #define __rb_color(pc)     ((pc) & 1)
 #define __rb_is_black(pc)  __rb_color(pc)
-- 
2.34.1


