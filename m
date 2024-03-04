Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F5A8706A4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688436.1072530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhAtx-0007tl-S9; Mon, 04 Mar 2024 16:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688436.1072530; Mon, 04 Mar 2024 16:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhAtx-0007rt-PF; Mon, 04 Mar 2024 16:10:53 +0000
Received: by outflank-mailman (input) for mailman id 688436;
 Mon, 04 Mar 2024 16:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bpxf=KK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhAtv-0007OP-Ul
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:10:51 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c497fdde-da41-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 17:10:50 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso1062774566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 08:10:50 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o4-20020a17090611c400b00a458d85f9d9sm202394eja.142.2024.03.04.08.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:10:46 -0800 (PST)
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
X-Inumbo-ID: c497fdde-da41-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709568648; x=1710173448; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH1o9ervsPKAzEGLoFJ5wQZrXDTVu2urG7J9ug8iYgw=;
        b=vcAZo85w+c6NmrADiHaA8pYv8mwhpRX082etIj99UqIah//93PJ1GYo6gOGM9xVeuP
         e/wEK3EATdwaR/a4waHyAsD9TOxVY5gzx5kE1t03ionJkfhm6dO1wslUGgE/huNCHayS
         Dp11WgsP0qyAUNvHtzFPbjgAcLAFEgz9V2vcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709568648; x=1710173448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH1o9ervsPKAzEGLoFJ5wQZrXDTVu2urG7J9ug8iYgw=;
        b=K5t/PGs8RJ3SQ3jTHI1RWVwpZp3r1+x+DbK5Zsrk191gtUzniCToFogentAsZ5xzWh
         DeR+zN1hpUP2x6rGLBSiks65u/VjDiGidvyzxchenwhgXj108maBl3xOFtRpYJw/ewCs
         eQ4Zubzd5py6IpHB6EoV6S6qGQ8+vTfMIpg9DIXeqEO1AXidfk5kHldNruYwo2cTpJ5m
         IVc84fCPY/hVscHiNn5ekE4MCE2LKtn8XhI7xd6wLi0y+bUcB5jAdjdpCG/+B8h/wJYF
         SubrQuhbFVHY4pLVQG5KJiATb+BdDrnH2rbUuKcQRD8MG2SKNJgf1AWQtLwEJRaTxAWT
         R9ow==
X-Gm-Message-State: AOJu0YzKXx4nuObgOIzFA/uQmBVXSl/akobGdFn9By6bIJFg1qswxEHR
	2uYQD5FWtrkvwEPOfI7jgFORLwE7aslbMYEjj40KoAe5XUptsLZO+OaNIo6+oTyUhAXBclzKgfF
	u
X-Google-Smtp-Source: AGHT+IFY7Zi3s5N1fO8bKi7PdLeyirYiZkfQWHjAWNFGcAEoYFpgczXzC9wdr4CmnLT9Osd3gTWMCA==
X-Received: by 2002:a17:906:f6d7:b0:a3f:c3f0:69bf with SMTP id jo23-20020a170906f6d700b00a3fc3f069bfmr9230056ejb.13.1709568648570;
        Mon, 04 Mar 2024 08:10:48 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] xen/nospec: Allow evaluate_nospec() to short circuit constant expressions
Date: Mon,  4 Mar 2024 16:10:41 +0000
Message-Id: <20240304161041.3465897-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the compiler can reduce the condition to a constant, it can elide the
conditional and one of the basic blocks.  However, arch_evaluate_nospec() will
still insert speculation protection, despite there being nothing to protect.

Allow the speculation protection to be skipped entirely when the compiler is
removing the condition entirely.

e.g. for x86, given:

  int foo(void)
  {
      if ( evaluate_nospec(1) )
          return 2;
      else
          return 42;
  }

then before, we get:

  <foo>:
      lfence
      mov    $0x2,%eax
      retq

and afterwards, we get:

  <foo>:
      mov    $0x2,%eax
      retq

which is correct.  With no conditional branch to protect, the lfence isn't
providing any relevant safety.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/xen/nospec.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/include/xen/nospec.h b/xen/include/xen/nospec.h
index a4155af08770..56cf67a44176 100644
--- a/xen/include/xen/nospec.h
+++ b/xen/include/xen/nospec.h
@@ -18,6 +18,15 @@ static always_inline bool evaluate_nospec(bool cond)
 #ifndef arch_evaluate_nospec
 #define arch_evaluate_nospec(cond) cond
 #endif
+
+    /*
+     * If the compiler can reduce the condition to a constant, then it won't
+     * be emitting a conditional branch, and there's nothing needing
+     * protecting.
+     */
+    if ( __builtin_constant_p(cond) )
+        return cond;
+
     return arch_evaluate_nospec(cond);
 }
 
-- 
2.30.2


