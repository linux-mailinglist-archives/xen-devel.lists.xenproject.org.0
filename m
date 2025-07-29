Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4C4B154AD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 23:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063124.1428916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrve-0000ro-Oq; Tue, 29 Jul 2025 21:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063124.1428916; Tue, 29 Jul 2025 21:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugrve-0000ox-Ld; Tue, 29 Jul 2025 21:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1063124;
 Tue, 29 Jul 2025 21:32:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gf+C=2K=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ugrou-0004NS-Ie
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 21:25:12 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8299ac26-6cc2-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 23:25:12 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-615234e9d3aso352079a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 14:25:12 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6156591fe7bsm1587728a12.51.2025.07.29.14.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 14:25:10 -0700 (PDT)
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
X-Inumbo-ID: 8299ac26-6cc2-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753824311; x=1754429111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYS1r36qs+Kqa8dRxSHhrgjOqY6KhuerE4DlOOPShYQ=;
        b=U5CQxhWZKvZnjz6Mj2dVSFW1JfGLGluXBdvF+Z743y6q2x7pGhY1JcwYlhmSupNykX
         IcL320zDtvOnFsYNQwf+n5cnj6t3mtpQ16RaUjcRbBh1BdnchqlDdNDR1wdqHoKzp6LT
         2ROVV4wvmt8Vm0S/XgxKG5P1gg2B9zAj4CNaE8+3JOYuoi2HXqqg9nPLIA0uCqDnHMro
         lZmnKH+9+7ZeMdIu4+cJcU3NjSq7MUBwBEh4T9N+ZNDqim0SYAWA0VOBsk4eO5Iyo6IU
         eynwFARZ/jkT+4ET43vfvOBjfV55FdCqltpmfavFj7F8thSWn+uXYIMMU1KmtFmfnXEo
         aHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824311; x=1754429111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYS1r36qs+Kqa8dRxSHhrgjOqY6KhuerE4DlOOPShYQ=;
        b=IU3c4/xvY+xgaITGLUKLSr99RQ7ovSjkLJliLYY9Jsf2XMeXRS3xnipVYdda3k9/o1
         GNkExAcz0K/mHoPGzhUCL4I49X++fsC06opduUBpUywZfz53e4AKzzkEvIZQ+xBdPRvE
         5XmT6jqjGk+1d+m2yOvZAW0NZIHGgtDj+n6Q7xovcFwo0myDPOERJijx9JXEzks4xUCE
         oceu997W2x7M9Iho3/B3NhpniE8Mqel1gBuNpIL2sg1WjoxeL94YHGd5cdzjozunvMuf
         hw9RobLX8yDhclZzK/3jEUov3pGxkXJgdI0bU/5SEEg7xafeWs/Jkx33ne6yjslelev+
         8lGA==
X-Gm-Message-State: AOJu0YwSVSgFh6cNhqGE7mYjFM8XyB1ckYK8iGYz4IBSTBwXwdGL5pDB
	F4k7jqqwGFivrmmFvS4ln1JyrMykYjOQ3QQ+eqOR3SSlneqsD/W9aDiu0gExikudYe8=
X-Gm-Gg: ASbGncvJT1MXGfaYNSc/HIjP58TKrRFlyUq5SzGhWxJeRZ1qa2v17IH/S1YxUsl9MDL
	cHT7A5MMHm59XntMQZa5aQ6nS3oXjUTkqObSukWEvi4bqOOlOwkVumW9M7OD/DZLsT1nQOBRBOP
	RZrfF3tdNApGEGOmG7s5KbiLves0ahnCuA2vB3vsJFzj5FibcrC3UCUZpNdTqiaa6/gFa5lXAqJ
	GrTEQrb4c8bA9Pxk4Matcgvr95hX1SPuZqvoapGHD1C88kSr4lffFNkVUpOyJcA+at3XLFEpJ/+
	OZaB5aP2SXw51CA5WHkgf9TqWQlKHrdO5HKxovC1hzYoVyypBYWhIxJF2oU3QN7HU82Erl+tMhL
	CpAaAoQmUCXiCmu0xnib3PkS1QeaeTjujt0XEST5XpWyWKTy2320RUjiIYowNSZuM9iztTAcx3B
	zjEpI6KdAaQLQDYX9DGUguYg==
X-Google-Smtp-Source: AGHT+IFUVt7RK+iIy4ct7MC7XBalbUEwTJ/tJpRWMV07x51wKB3a1AP0vBElMPIFL4EW2rRi0Ch/lw==
X-Received: by 2002:a05:6402:2110:b0:615:61fb:49e9 with SMTP id 4fb4d7f45d1cf-615871f3892mr469186a12.7.1753824310880;
        Tue, 29 Jul 2025 14:25:10 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 1/3] tools: add sizeof_field and offsetofend macros
Date: Tue, 29 Jul 2025 21:25:04 +0000
Message-Id: <556d53ef59bf771a727bd49116e91bb515ed7ec6.1753823663.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753823663.git.w1benny@gmail.com>
References: <cover.1753823663.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

'offsetofend' macro appears in Linux codebase, so the name was chosen to be
consistent with it.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/include/xen-tools/common-macros.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 0088208c2e..c98a6beffd 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -83,6 +83,11 @@
 #define __packed __attribute__((__packed__))
 #endif
 
+#define sizeof_field(type, member) sizeof(((type *)NULL)->member)
+
+#define offsetofend(type, member) \
+    (offsetof(type, member) + sizeof_field(type, member))
+
 #define container_of(ptr, type, member) ({              \
     typeof(((type *)0)->member) *mptr__ = (ptr);        \
     (type *)((char *)mptr__ - offsetof(type, member));  \
-- 
2.34.1


