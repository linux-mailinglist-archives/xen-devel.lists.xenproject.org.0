Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F28CEAAA
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729748.1135028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8n-0007vW-Iy; Fri, 24 May 2024 20:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729748.1135028; Fri, 24 May 2024 20:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8n-0007r0-ER; Fri, 24 May 2024 20:03:49 +0000
Received: by outflank-mailman (input) for mailman id 729748;
 Fri, 24 May 2024 20:03:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8m-00076x-7T
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:48 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb530fd6-1a08-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 22:03:47 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso137040041fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:47 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:46 -0700 (PDT)
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
X-Inumbo-ID: bb530fd6-1a08-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581027; x=1717185827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcvFli469CD4OUU+qKqIt2aUdVZOLqd4ksEwvUfVXhg=;
        b=tMjwoj/WoBzXXrRXI2vSSvfnBCJUWWz2JveF3LyAps+Pya3YK+JxJBS6kXaBfBZeN/
         xwpVYmd255e+fgjFbdMkTNpVmNeZgfSt/QJpJ54YSxj2G/6bqgv+/2ue7gFY8Pr9slWf
         VANQO/Rex4kK+QKsF3EQfMDB3lPTApNOdUqIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581027; x=1717185827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcvFli469CD4OUU+qKqIt2aUdVZOLqd4ksEwvUfVXhg=;
        b=n9LqQtZqtqt8J12rNKWvpCLDqcRJQ2rPm7CgOU2xMFA8gOtJaMGpCeLarlwIfRErtj
         ApLX5wTbLxO7XYFn72P6/KpzRP+Ju5u1C0RMtQ9j92gU9kvu4p6K66XBCPUniE9CJDUE
         6m5XldV8uUCPygnY+2ar/fWFnwRvSv6+KgaIf2xYPQ/Sw1BZ31uWBMG9KsemRFcedlDr
         YHzt9eGP+TL9RvoaSS2HBUQhZ2qwRSmRERvVyA1RvxQla8F6yObamWnyx/r5qaJ2SL+Z
         UwyCUoMVKPpsmsphynTEzcE6BI97oaqy1Y6wZcWqzPaxfOZEp8NIXX33UE8W1GJgmb31
         OA9w==
X-Gm-Message-State: AOJu0YxuS15NSPVwp/73eGplKVLxIaLWqw46gsusG1yYHnKFZyEEfFoV
	vkVoJe8lBkMOHbUHv9sjzNrNxN0n9kC/83ZLM01AF0+RyC7hdZXMgm0nbqNp0EI0iAdd96xudeJ
	4LNs=
X-Google-Smtp-Source: AGHT+IFW77E6sOaTPxeY1Anh235eDcr+kQYnA1qSCVR/tfE2QVye//bW0h/5/1gXeVXq88hbfi6MTA==
X-Received: by 2002:a2e:8910:0:b0:2e2:64d:6849 with SMTP id 38308e7fff4ca-2e95b27b09bmr24937071fa.50.1716581026945;
        Fri, 24 May 2024 13:03:46 -0700 (PDT)
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
Subject: [PATCH v2 04/13] xen/page_alloc: Coerce min(flsl(), foo) expressions to being unsigned
Date: Fri, 24 May 2024 21:03:29 +0100
Message-Id: <20240524200338.1232391-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is in order to maintain bisectability through the subsequent changes,
where flsl() changes sign-ness non-atomically by architecture.

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
 xen/common/page_alloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7c1bdfc046bf..8d3342e95236 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1842,7 +1842,7 @@ static void _init_heap_pages(const struct page_info *pg,
          * Note that the value of ffsl() and flsl() starts from 1 so we need
          * to decrement it by 1.
          */
-        unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
+        unsigned int inc_order = min(MAX_ORDER + 0U, flsl(e - s) - 1U);
 
         if ( s )
             inc_order = min(inc_order, ffsl(s) - 1U);
@@ -2266,7 +2266,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
     ASSERT(!first_node_initialised);
     ASSERT(!xenheap_bits);
     BUILD_BUG_ON((PADDR_BITS - PAGE_SHIFT) >= BITS_PER_LONG);
-    xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
+    xenheap_bits = min(flsl(mfn + 1) - 1U + PAGE_SHIFT, PADDR_BITS + 0U);
     printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
 }
 
-- 
2.30.2


