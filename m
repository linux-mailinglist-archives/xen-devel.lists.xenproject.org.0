Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41602B15E57
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 12:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063731.1429489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DD-0000Tl-0G; Wed, 30 Jul 2025 10:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063731.1429489; Wed, 30 Jul 2025 10:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4DC-0000NU-Ph; Wed, 30 Jul 2025 10:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1063731;
 Wed, 30 Jul 2025 10:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh4DA-0007vC-QR
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 10:39:04 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696b43f0-6d31-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 12:39:03 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61539f6815fso569744a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 03:39:04 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af8f1b17364sm183230166b.66.2025.07.30.03.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 03:39:02 -0700 (PDT)
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
X-Inumbo-ID: 696b43f0-6d31-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753871943; x=1754476743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=myCOjy5AlwEAEeYWdeB1cmjCbhIGNW2RDrEZChzShWg40GnoBZXiiAASyfqpBSCYwO
         FPoU6ywQCZPqTLqcYaDx3QDyrLVOxtpN3S3DG8kGf4Q6L/GXiHC13R0Eq3Kvx+hDgHkk
         8OpMqK4yieGss8G5oAq9Go/hoqrWZs32jjGGkSCiQjQTD5MDwZ9JAjhk6GLg22EgnAKB
         EzxRqi8zdqK4+xZ5TopQFLFoX2MLCv34qPl7aVyje35BTwq2Wzlk4eVTgATJUW+m+w1/
         o0rkpj1p9PYgsCbKMFiTm/LRlYtK1eiEL55YHj1tqfcaGQ4OqaxeBmKyJcCvFReLSuSj
         sdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753871943; x=1754476743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYagUw7+nV4AIrSjbYjtskD6tyaobfXIr4xaV+yxYuw=;
        b=WjI14gu09l8edgkxcwmeSi9SZLtORjDbd3EEdTok/as9AXViz929V9HKSrO33U0xV0
         52VHYP9cs6ewA0yP5Z1uNCYl3P54AKtvbIAUNzCfx4b7+FE5fsWjIOasQVYrjpIw5NzL
         t+tmKE14hPqS1eF80Gzanawkj9mAWc5g57FGf+NaNWkD1pLOENTAom+27wjSVJ2/RTNo
         GFdYYuuM6ztFBEDNK8G7ZKGS4xQt35l9tCxaJruP6wzc2AXtUOiaKHnRTJFbMtJb11RV
         2t91e0pJEaKmI8CAnoBCNwV5TbHkegicWA3kgn4kiDVvd/rObmZBQYIumWL6Q/Vhv5Yv
         zpNQ==
X-Gm-Message-State: AOJu0YzzHHVBUi81QixqudBPZeHWB6fAZfh/dVtC1hzIJThBOmQJqKxE
	8B8jP/45WIHrxWQwGF/oBJBvbfIon4gr0Z+Jir3QgQQEVZNWntIBDo2VD1H2TcKvQfQ=
X-Gm-Gg: ASbGnctL0m+VZsh3agm7ixJkSSkgUx/ltYoWNzmDOHXQptzSjtHJFCbVMOvR5YF7FWW
	X7ec7O4qxoVNN4+DGT2OsJK45/AJw7RFqoIzKsfhzLIt79N18OzauK4fv7nJr9lVVKrwjG8oh/2
	P5cPgAMyvodCobZRhrHEJHEMuwTJewgKE7+XyR09Gj+waYnrbPbDOHHjYiKWQyHaKDHAoc2UqPe
	q6yYDmapLLlvkSD1PMn0MWu8yEK8jN8j3Ynf0rvB1f0uU51P5N3eTTg25cry7jNnFdy6i1IPcyM
	3r9ZaW+2h0zzGKJkfWkJ0i550KUEnWs8RA9aeUKpk7ibmJxww1ZemYEc9i3ZibWvdHr8klYzz5S
	xxrFgK/oIJdQeF/Wh+fLY6IQdLzMUzXPxfdo8FZcAb3NAwpCVVIf0bPE1aIOH9lpvo3EAZRJZnz
	w2gUn8A+sbOfMRhwkqElD9nmivslCvG2x8
X-Google-Smtp-Source: AGHT+IGFiXekcR8blKO5TUEoiFDOiAdM5EjlIbRUyZkhFA/cY+/QuElLp1rzA57PY3FCyVK6uOsLZg==
X-Received: by 2002:a17:907:96a3:b0:ae3:5118:96b3 with SMTP id a640c23a62f3a-af8fd6a393bmr107374166b.3.1753871943107;
        Wed, 30 Jul 2025 03:39:03 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v11 5/6] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Wed, 30 Jul 2025 10:38:49 +0000
Message-Id: <eacd62525dc4954894b44d03db5a5ff98d66c4ec.1753871755.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753871755.git.w1benny@gmail.com>
References: <cover.1753871755.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 155ea1f79f..872e97999c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -739,8 +739,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 
         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }
 
         if ( config->altp2m.nr > MAX_NR_ALTP2M )
-- 
2.34.1


