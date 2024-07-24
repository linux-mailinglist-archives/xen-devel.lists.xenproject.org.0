Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FCA93B3B0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764283.1174655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxf-0005Tv-K0; Wed, 24 Jul 2024 15:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764283.1174655; Wed, 24 Jul 2024 15:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdxf-0005RR-Eh; Wed, 24 Jul 2024 15:31:27 +0000
Received: by outflank-mailman (input) for mailman id 764283;
 Wed, 24 Jul 2024 15:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdxd-0005Od-VT
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:25 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c892aca8-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:23 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ee910d6a9eso10076811fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef26f1bc4asm14240491fa.40.2024.07.24.08.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:22 -0700 (PDT)
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
X-Inumbo-ID: c892aca8-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835083; x=1722439883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G2pjQd0Lv6vwExyaSIrvv5vmUPPgawgWplARMvkx+E=;
        b=Mrsda4eaC9nBeobRf4UuXBCtazwOdLvRunCaoKrFLrrRil8deqV/VOHXtib2IjCNxq
         Io8YYc/gql/q1LD/E0nBK9gkyJiQ1uo05gPdXrpsFJiqe/hsqtwQCnJfPYqhth7ZjCDR
         6jpBkpQTTpcivWE9JiP639wAWg4UkGmKGrX3DgNLQ1baoEWdnd55Bb4T0cKJANnIOPyk
         efSv49lg4GTJLIP1kqYdSFqEE1xtgQA0kV5oSTr1kV6EP204iphZEnnk/bZUjc70LNQs
         lLJg4f2ucqlHXCUpJFh/kgJNLukecDNokMpQCwL/Wsq7aqbZvPURKSijLVs4jTzD1NAY
         1sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835083; x=1722439883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G2pjQd0Lv6vwExyaSIrvv5vmUPPgawgWplARMvkx+E=;
        b=bfif6kH84Yfz09kKanwZWERD5fSoz1GKCYuPNWWQp5bkDWHi/1LEedRR9g+OjWcv2R
         c7KurY01Zboxs21KEU0ZFinmTNsj2qemqklnXxuAhKbSXkCB1Ni9a5VYWeooDBRallLg
         9apye8aeSZcMrt8YAMO279cXJ8qFgJOzFx1dMOsgE9KMQH1K8QSzOL3/q8ZKoDENgxcU
         xjIEhXRl0+ywr4GP99Ggapok5fdu8TiNWxYJtWl211+Xch7+C2UqRBuKzyBn89fuHMI8
         lFBWV8zAi6lME/N4nm19XcByTfZofMDTs5K22tWot713xnemXu0SWhHvzOUNEVhAL7WV
         Gs3A==
X-Gm-Message-State: AOJu0YxNmbKvpb/0y9ZcxNAXufGR3wEAH8BTJRlaAQNNHAmL5X5BkCt3
	np2Cr8FiS0e1keckOrKPNQs1qzcKd7uHiLtYw3r6s5Kup8IfBTPRavJMGuk8
X-Google-Smtp-Source: AGHT+IEUnSTWoqw7sceknY8fvoknuG0Nuu+QDZ2ocZ66OWkjz85ttdEXvrTQKmznCSQhtObHHduKxw==
X-Received: by 2002:a2e:b618:0:b0:2ee:daf3:5d30 with SMTP id 38308e7fff4ca-2f03a4f64a2mr154841fa.0.1721835082374;
        Wed, 24 Jul 2024 08:31:22 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v11 1/5] xen/riscv: use printk() instead of early_printk()
Date: Wed, 24 Jul 2024 17:31:15 +0200
Message-ID: <f80a93ee72a5887a9ba259db61e4571379315f6f.1721731887.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721731887.git.oleksii.kurochko@gmail.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As common code is available it is better to use printk() instead
of early_printk().

Also the printing of "Hello from RISC-V world" is dropped as
it is useless and "All set up is enough".

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V11:
 - Nothing changed. Only rebase.
---
Changes in V10:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 - new patch
---
 xen/arch/riscv/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 8bb5bdb2ae..e3cb0866d5 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -23,9 +23,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
-    early_printk("Hello from C env\n");
-
-    early_printk("All set up\n");
+    printk("All set up\n");
 
     for ( ;; )
         asm volatile ("wfi");
-- 
2.45.2


