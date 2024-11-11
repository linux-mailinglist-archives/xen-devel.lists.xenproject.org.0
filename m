Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C859C3CDD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833578.1248749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASRJ-0005RE-QZ; Mon, 11 Nov 2024 11:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833578.1248749; Mon, 11 Nov 2024 11:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASRJ-0005Ol-Mx; Mon, 11 Nov 2024 11:18:37 +0000
Received: by outflank-mailman (input) for mailman id 833578;
 Mon, 11 Nov 2024 11:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNnr=SG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tASRJ-0005Of-7l
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:18:37 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afd16837-a01e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:18:33 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so35731185e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 03:18:33 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97ce1bsm12579278f8f.36.2024.11.11.03.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 03:18:32 -0800 (PST)
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
X-Inumbo-ID: afd16837-a01e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzIiLCJoZWxvIjoibWFpbC13bTEteDMzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFmZDE2ODM3LWEwMWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzIzOTEzLjg3NzU5Miwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731323912; x=1731928712; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLkMCXmXyEs9hz0TjHnBnUDUJ2xbUt1SbWWsZK49qTo=;
        b=Hs3grXHGlyfK9xzVLazE+qJI/FdX9RpHmEC81wwfKQqh/AdkhOrf6RmZ23KeyhesIa
         8yH8ucb/vldbWxJhn3nT/JOiuDAwmZxB0d+ve7JyhKN/DNZ/j6RYPi6YpYo1zbgVq0Vr
         kBhlKkv8u9iUih02yXd2jXr4XXaC5n3MvZOIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323912; x=1731928712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLkMCXmXyEs9hz0TjHnBnUDUJ2xbUt1SbWWsZK49qTo=;
        b=pFWtlrKpxbuWXWJQIiXjlAqN6DSArus0bsDKHwHbXJoZLdJ+fnQi+947cSNDnYMvnU
         FfVlHYtbyJiQGJJelaBsr4oPkPG6g7UMlqRQkWq/6Bjw6LD8pqeKxNEuzmaetfZE4DiE
         3POmJNV4h71adzu7H5wBwUB1PUuUAXKnv0jVa1sZ5voFAKv6wxAOicrfzPHJq8WLOFnZ
         PYF1z14oi+ZlPRthtJVnUsl+d12KWtC/NR4Sn6rTmu6ermh6tHLDe1lTvpfkaAaZ4kJA
         DnMFRQ2sbZrtvJRfjTCswGPu5u4K0FE6BW1i3M4QMLpkJJD+4PyCQlnFkCVcwzCrPtdp
         Q2rQ==
X-Gm-Message-State: AOJu0YwHdWmJR3A23V6SUj1y+f6QODST5l3eJyNHEz4QEUp4KKmxpkf1
	BG/kKYJSKjaFU/HB7/kpznLuWHcVSaMqxtorkANjPBbTq8vpeIuWdsjH/qgbv/PnZbKgvblUpdK
	ADrU=
X-Google-Smtp-Source: AGHT+IHSlWtPp6ppWNhmOXcm+RZcgkKDmTEoJd3zcsNiiUqNfLGxbc/bN+YI6XLnK+kLNYxNnndeDQ==
X-Received: by 2002:a05:600c:3b9a:b0:432:b38e:a048 with SMTP id 5b1f17b1804b1-432b75029c2mr105230715e9.12.1731323912438;
        Mon, 11 Nov 2024 03:18:32 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/boot: Setup correctly fs segment for bogus_real_magic
Date: Mon, 11 Nov 2024 11:18:22 +0000
Message-Id: <20241111111822.6795-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bogus_real_magic code uses fs segment so it should be initialised.

Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- added "Fixes" comment;
- add initialisation, do not remove old one.
---
 xen/arch/x86/boot/wakeup.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index 08447e1934..99ac8594b8 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -20,6 +20,8 @@ ENTRY(wakeup_start)
         movw    %ax, %ds
         movw    %ax, %ss        # A stack required for BIOS call
         movw    $wakesym(wakeup_stack), %sp
+        movw    $0xb800, %ax
+        movw    %ax, %fs
 
         pushl   $0              # Kill dangerous flag early
         popfl
-- 
2.34.1


