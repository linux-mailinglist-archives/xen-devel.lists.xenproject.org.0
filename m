Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018CA8CB2AE
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 19:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727006.1131397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5f-0004n8-3x; Tue, 21 May 2024 17:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727006.1131397; Tue, 21 May 2024 17:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9T5f-0004l3-00; Tue, 21 May 2024 17:15:55 +0000
Received: by outflank-mailman (input) for mailman id 727006;
 Tue, 21 May 2024 17:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryb1=MY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s9T5e-0004kx-8t
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 17:15:54 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6a1317b-1795-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 19:15:52 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e576057c2bso83555081fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 10:15:52 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01a2esm1633701766b.185.2024.05.21.10.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 10:15:50 -0700 (PDT)
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
X-Inumbo-ID: c6a1317b-1795-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716311751; x=1716916551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8KPCauD1h/QxTPyhyMp5VxJ7O+vNU2tVT5i7N7FwDg=;
        b=bqNs0vlyGD9nO3m7MdjXfQa48aWEQOmCBp8QG77zT3D31uipM3VqdgCVZkiFDijQBj
         /KaXaOa24wMEgd+OVZEa2xRhv+bNqPgc3lntih6LQPMq6VWW98GnuSlAmXEP3vPQYOn9
         Pk7RkQf8ZYSAhSktIJJB1th4ROICnIOkmQd4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311751; x=1716916551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8KPCauD1h/QxTPyhyMp5VxJ7O+vNU2tVT5i7N7FwDg=;
        b=MkbsFLWSUV8O5hWQed1FsBo+NuOvJM6YOVlDKazJbfjjbV9ogAFv0D/Zh/djCScxEH
         Cd05l9QM0u084uNqQlespRzaYXDOrNCSq10YzaahMkIdWTCFT4SKxPCX6PnOE5UXXTzg
         IR9noBksa1RC+WAaigyIN7lSkXogdkTL3ZF8q6QpXXizjMu2Gq6/GPkPxaY3512LYPIy
         wiqyfZYOL6PRLRJ1y7LcxEGvPBSVS680egVcrmkXMuWMuGav3lbXwGDaDSQwD1v6107A
         ip988Oi/1eJGf67m8ndPdXR+YKFanfy7JsnzG2CRtgg5Ogg355hOluMgQ7v0SLccDfWY
         ck0w==
X-Gm-Message-State: AOJu0YzWqg7zOcB9XbdsaUe2DgMk6hF6l0FnOiPfFkKL3pJbilEMVstK
	0mx3lctyo0MngxiMUkQmuDu/xW1p9cEedMvsKDVHxZNbDfi/b8+Jsv/XDtuseEoJ9J16/KASWMD
	x1jo=
X-Google-Smtp-Source: AGHT+IGwSfiFmsPP2j0uUZoXchMnqqeT1sZn4y+yf1F1qYyLp3rJi6sjSSAbgO/rbThPohw3cpuxeQ==
X-Received: by 2002:a2e:7a0e:0:b0:2e2:466b:1a56 with SMTP id 38308e7fff4ca-2e52039e2c3mr254345661fa.53.1716311751043;
        Tue, 21 May 2024 10:15:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/3] xen/lzo: Implement COPY{4,8} using memcpy()
Date: Tue, 21 May 2024 18:15:44 +0100
Message-Id: <20240521171546.3650664-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is simpler and easier for both humans and compilers to read.

It also addresses 6 instances of MISRA R5.3 violation (shadowing of the ptr_
local variable inside both {put,get}_unaligned()).

No change, not even in the compiled binary.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/common/lzo.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/xen/common/lzo.c b/xen/common/lzo.c
index cc03f0f5547f..3454ce4a7e24 100644
--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -25,15 +25,8 @@
  */
 
 
-#define COPY4(dst, src)    \
-        put_unaligned(get_unaligned((const u32 *)(src)), (u32 *)(dst))
-#if defined(__x86_64__)
-#define COPY8(dst, src)    \
-        put_unaligned(get_unaligned((const u64 *)(src)), (u64 *)(dst))
-#else
-#define COPY8(dst, src)    \
-        COPY4(dst, src); COPY4((dst) + 4, (src) + 4)
-#endif
+#define COPY4(dst, src) memcpy(dst, src, 4)
+#define COPY8(dst, src) memcpy(dst, src, 8)
 
 #ifdef __MINIOS__
 # include <lib.h>
-- 
2.30.2


