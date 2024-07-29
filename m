Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7393F2BA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 12:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766567.1177063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNet-0003rP-Df; Mon, 29 Jul 2024 10:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766567.1177063; Mon, 29 Jul 2024 10:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYNet-0003pT-AX; Mon, 29 Jul 2024 10:31:15 +0000
Received: by outflank-mailman (input) for mailman id 766567;
 Mon, 29 Jul 2024 10:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYNer-0003pN-Ls
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 10:31:13 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acf5027d-4d95-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 12:31:12 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7a1d42da3e9so212765685a.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 03:31:12 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73b46b4sm501905385a.53.2024.07.29.03.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 03:31:10 -0700 (PDT)
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
X-Inumbo-ID: acf5027d-4d95-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722249071; x=1722853871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AI0UK5qCNOOrU7GfTGx6cClk9X+EWmbw1QdJSQJMxLQ=;
        b=Y1PpxrTKUd+mL+E50W0ijLhl0cJBg8aRfbd633oImXwDqGuFkr+HeH/w069kUXYKeD
         K+QTJF01mhOgAKxzltjaPEr0Ei9gjWIXFYkOVywo4dWHqj+QHKSkdPcrOrgfCofJzUDx
         1Oxhg3TUoTzx1KcDXp9tX346PhKQc6m8nNYyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722249071; x=1722853871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AI0UK5qCNOOrU7GfTGx6cClk9X+EWmbw1QdJSQJMxLQ=;
        b=UKgRtNCqGvSCGWT2qHcFvvYId9gufEGGpqrOueU/sSiNlxgmGUDBsnn8eA6T4D/Ti+
         NYKT3gTSbBORdtaR+10QSOqfyDAuRI3zQcYXf8O1PgLfPQ5vcXAxbTcHLkiOvvlbJsSy
         VKtLbHyOTS+sQe/klAoS0nxLpJrNmoLuz4iJWhGDrT0Rr+cMte/MEBIv7JTm4qYzgkaS
         e7Ky0w0V5F1H84NEgTEdcL0FAZgC/Z4nO/AlzUDtJBUi53VGuqtbNqoApHo/3dBoLrgM
         ogwqDntTf+G1Q00jMCwVq6XCEWbSSyjVa1AWVbHMGrUh22unu4ZdReRGAEMp2FuBMVz9
         3lzg==
X-Gm-Message-State: AOJu0YwGYRaDAfsZ10DfHvJV2qgJPZeJj0dw0IgcgUpk9NsPzrb/fowK
	RNs8uV0/2hetFjRMKXy/tLfjdh9RcXygc5QLW+xtgmvDjCkRahqZplQ9e9ovqCUiXar8rQVfS/z
	P
X-Google-Smtp-Source: AGHT+IHTYKTe5I7K3KjDdlckLM6QoOsRNqwdZH6h6uDlkL9PQzvOgXZAQDuDhoGiJnbSWdu5CQtUhQ==
X-Received: by 2002:a05:620a:472a:b0:79f:8a2:c33 with SMTP id af79cd13be357-7a1e5230095mr918579785a.8.1722249070858;
        Mon, 29 Jul 2024 03:31:10 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v2] x86/altcall: further refine clang workaround
Date: Mon, 29 Jul 2024 12:30:50 +0200
Message-ID: <20240729103050.38401-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code in ALT_CALL_ARG() won't successfully workaround the clang
code-generation issue if the arg parameter has a size that's not a power of 2.
While there are no such sized parameters at the moment, improve the workaround
to also be effective when such sizes are used.

Instead of using a union with a long use an unsigned long that's first
initialized to 0 and afterwards set to the argument value.

Reported-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Suggested-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/alternative.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index e63b45927643..12590504d465 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -183,13 +183,13 @@ extern void alternative_branches(void);
  * https://github.com/llvm/llvm-project/issues/12579
  * https://github.com/llvm/llvm-project/issues/82598
  */
-#define ALT_CALL_ARG(arg, n)                                            \
-    register union {                                                    \
-        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
-        unsigned long r;                                                \
-    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
-        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
-    }
+#define ALT_CALL_ARG(arg, n)                                             \
+     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
+         unsigned long tmp = 0;                                          \
+         *(typeof(arg) *)&tmp = (arg);                                   \
+         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
+         tmp;                                                            \
+     })
 #else
 #define ALT_CALL_ARG(arg, n) \
     register typeof(arg) a ## n ## _ asm ( ALT_CALL_arg ## n ) = \
-- 
2.45.2


