Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D3AABFBBD
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992348.1376112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmjo-0007Vv-Lr; Wed, 21 May 2025 16:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992348.1376112; Wed, 21 May 2025 16:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmjo-0007UE-In; Wed, 21 May 2025 16:56:16 +0000
Received: by outflank-mailman (input) for mailman id 992348;
 Wed, 21 May 2025 16:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHmjn-0007EC-Bp
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:56:15 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 807a5dcb-3664-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 18:56:13 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-74267c68c11so6121353b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:56:13 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742a9876d51sm10145775b3a.141.2025.05.21.09.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:56:11 -0700 (PDT)
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
X-Inumbo-ID: 807a5dcb-3664-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747846572; x=1748451372; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RLYMRivYweydZfPNnM0rOXuUXXKFPj67o1KMs4fjDc=;
        b=W9KPk6YJq8fYhOxFSL1XdErtwnuiuYJoVQwF83DQNcrH8cCzPjTUQ5hNPqCE3XBjGO
         4OLyMab6FiO8WNqH+hqsIykYzDdH+hyI5v9VgFSbCaa/iD63sQPuSf2KPy1O+a+dFipJ
         pfP3KjGn/oeMRVsFVsrwecFc4wy04qmcsz1Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846572; x=1748451372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RLYMRivYweydZfPNnM0rOXuUXXKFPj67o1KMs4fjDc=;
        b=wbqrH+Jd+bXTJncSko5PFl9rFQ0I5ZcMYpPryQ9dOGuGVYNy8trgGbkKhKCgu3wSr6
         VYlRGML7cCSYGPaEQg2DAEo9bJsvcXWWCEE+YpjmcmVK4T/NKhVSpPskXVU7giQoeTNr
         9EQ/7jCVb8udTJYTXIgPRXojO5zZvSTIS6otjlw1RRcPF394rTnc8b+KyL1T2yVV6obb
         9sEmKzjDVoTS8yQexeoBUq57PGCbqsMkXqxoLY7XVbXgsejbcgQLC8V9tqTGE85A49Qp
         /fBWDb65joiiybI+QOcefqxBChBuiiM8c60bvYnUtmfRjK8QVcLR4xvOGK0fxEpypLu5
         YJRQ==
X-Gm-Message-State: AOJu0YwSPxC9awmSbLCB/3Z08N8YdV/0Dgn/V2cg+IkS8HTrzZSAYk6/
	gRjuWLqfs9jPZYj3qEAD23i299P/w6g6fWgM4nI+SZ3+PkOul8Wz+34T+roFMBkNPFI4JYFow7j
	d0GD3
X-Gm-Gg: ASbGncvUUKiFx7zpcnBDf1GuXrFI6WLK4e3SiDu4NLii0d6W/zCslNZvFISsolbo5xF
	DvirxW+vbwLtveu+c1UM28rroQjdxMGDZgX3fJMYWTw0sMfH0KaFfupj8fMn4cOiV85dSnsb3t8
	GEnUPjQ7bYlwS3tQUYWDphPkisDQgUQFLfIA7oVfXa5SOeuyxlSqndWkNEjPwjCXu3IdH1WuIVV
	DzyENouLmXVmbXZlnc91nc0e7EVhPysWCHmgyasOhJe4YuacwfeDjJTLg1sDWWgdOKWQtcnpfaU
	Chli+reh9YubuXHD4+8N/UNvNz47CadD1cc1WObTNBv9/ntFQkufzl8g2RWfhddCq/AWNTpz7HX
	ULxSf2bS8iBZ768ckyCp63xnItN9jLQ==
X-Google-Smtp-Source: AGHT+IES7Ek8EzshDBdhQSGONc0yvnA3KTmFWE2v1kEF+JfemXRUcsXF1uGp1Mv7bkHt0QAWpR5ZQw==
X-Received: by 2002:a05:6a00:b56:b0:740:a52f:a126 with SMTP id d2e1a72fcca58-742accc52cbmr25285685b3a.9.1747846571808;
        Wed, 21 May 2025 09:56:11 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] x86/boot: print CPU number in bring up failure
Date: Wed, 21 May 2025 18:55:03 +0200
Message-ID: <20250521165504.89885-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521165504.89885-1-roger.pau@citrix.com>
References: <20250521165504.89885-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Print the CPU ID that fails to respond to the init sequence, or that didn't
manage to reach the "callin" state.  Expand a bit the printed error
messages.  Otherwise the "Not responding." message is not easy to
understand by users.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/smpboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 0189d6c332a4..48ce996ba414 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -618,10 +618,10 @@ static int do_boot_cpu(int apicid, int cpu)
             smp_mb();
             if ( bootsym(trampoline_cpu_started) == 0xA5 )
                 /* trampoline started but...? */
-                printk("Stuck ??\n");
+                printk("CPU%u: Didn't finish startup sequence\n", cpu);
             else
                 /* trampoline code not run */
-                printk("Not responding.\n");
+                printk("CPU%u: Not responding to startup\n", cpu);
         }
     }
 
-- 
2.49.0


