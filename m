Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9DABE413
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 21:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991088.1374998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHT07-0005eL-FE; Tue, 20 May 2025 19:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991088.1374998; Tue, 20 May 2025 19:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHT07-0005cm-CC; Tue, 20 May 2025 19:51:47 +0000
Received: by outflank-mailman (input) for mailman id 991088;
 Tue, 20 May 2025 19:51:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHT05-0005cg-Tw
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 19:51:45 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db208a5f-35b3-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 21:51:44 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so65264455e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 12:51:44 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a361a81fd8sm16125594f8f.81.2025.05.20.12.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:51:42 -0700 (PDT)
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
X-Inumbo-ID: db208a5f-35b3-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747770703; x=1748375503; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brUjMfaV3P30faob5uS22kyYef5+r4S1qnZtqZ4kPUc=;
        b=lj8aduuJRvB5RuzXacppf+vlLa/Gu3sYKuMgZUh/T8BYL7AENFq0T0CqGpNsh3rkbC
         T1SS9LO+J4eLLdzWBmXuYSXmtLM7aK2NsV7sP22kOpdo/XAyW5nU5DkQa/Xfh3GCA3EF
         2Au8Ib1XhR+opY4/yHKsLwEj5cH3PTVf8RNho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770703; x=1748375503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brUjMfaV3P30faob5uS22kyYef5+r4S1qnZtqZ4kPUc=;
        b=ruRrUI7EJJZrvNQmv9CrczS5f7YOS/KLaO+EZMZJs7Ti5qkTF57FkyY1kgJdlG0IF7
         yiCaSjzi7J5bhr+ezp4tr/erpqP14IY8NnyM+MQ2IK1CHE9NcMCaNNTYrvsxXG2a95xp
         pGFjzQ6VqUgQSGxYIus/Cx4ZkidZmio3zrXRZ6dnhKY4leVI2wWzZOR0fHFeq6QCc0TB
         ta6vcKqAKQeBPUX2H1FqLstuSQWcCqu81qB4ThhPiIa9K+vwr1e34n+ethy077w+r3UP
         gLpU+87aRJC96iwJIa0Jiev5xne/ikRosgK+vpDgZ2LjgOy+0FavqYxjrh9eP4dGTIzD
         rMIw==
X-Gm-Message-State: AOJu0Yz46F6Qrjm/3L+S+OO707yK8IbqYqYrE+NFpBzgSUZDhKwmQ1nE
	7AQKDHTP5PwwONhCa6D38+jZTYDGkNJ4bohpWO7vb0kH6hsR4awVUWef6SnKHiEU2DjG6ikRjDz
	HKdnK
X-Gm-Gg: ASbGncvLfZG5HV363IsKf8JOxo3Gz2zCbvwgQVaWquQdqKbEykgJUkwdKtynDDEJa6I
	XDQXJk2cli8NBjYlKwUueEiOEP4cBWqMH+IyOpldUX2bXPdP0aeRofd0AZNv529aknEIvismk1t
	D7ZPp5sW5VgVro3+q+BA9nBsmmW0Suuty0HkT2koRR6tO0Rey8tCqYWTN6wqMcjKq/U7D0qtNqb
	CIxQn7LOpetxWgg7zjKbCK+ENRJygp4ImULE3LqeIP368cP9s7D3AHt50VuXG2WlNj0/9JRfU2S
	4vSwK8rBIPQ27OOuj4GmBYusrcpGAqbnahdrMm/aj/orraQ4GR5CCVnq6xIEOdHY6qgp564Kxb6
	iNoremlaTmyvwOzD8kz4ipIIqOJeqwuopTYg=
X-Google-Smtp-Source: AGHT+IHwTmoUPjzxB9R4rC6MR+1xLjbwHeYTOXAdAZWvxNXv96qxjVqefiE/9mSSKB9C+yr/iOPvHw==
X-Received: by 2002:a05:6000:4284:b0:3a1:fd60:887 with SMTP id ffacd0b85a97d-3a35ffd2bbbmr14319014f8f.45.1747770703321;
        Tue, 20 May 2025 12:51:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH TEST-ARTEFACTS] (Re)add python3 to alpine rootfs
Date: Tue, 20 May 2025 20:51:41 +0100
Message-Id: <20250520195141.198061-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XTF uses python, and we're looking to reintroduce XTF testing to Xen.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/alpine-rootfs.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index c304e2ebfbd9..c999b89dbcd8 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -22,6 +22,9 @@ PKGS=(
     xz
     yajl
 
+    # Xen Test Framework
+    python3
+
     # QEMU
     glib
     libaio
-- 
2.39.5


