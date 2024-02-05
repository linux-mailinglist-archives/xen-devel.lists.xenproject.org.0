Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5991849EBA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:49:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676341.1052482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Di-0003jB-6K; Mon, 05 Feb 2024 15:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676341.1052482; Mon, 05 Feb 2024 15:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Di-0003fX-3C; Mon, 05 Feb 2024 15:49:18 +0000
Received: by outflank-mailman (input) for mailman id 676341;
 Mon, 05 Feb 2024 15:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0yA-0007Hv-5F
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:14 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00f2f61-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:33:13 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5112a04c7acso7293837e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:13 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:12 -0800 (PST)
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
X-Inumbo-ID: e00f2f61-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147192; x=1707751992; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHfOArS8uJvdUvmhNcbyjrkgkF05plzKh9QEvVv6hbw=;
        b=bLoNxZCoOZz11OEsjc8LJGnXFcSvDYbnpuvISuu5kV9G0XNkROTmOrbuHslvbCwB7/
         8yVGHvX0G+dJo08hoBkFIG0o1DKW1BPelVWjxsD3uXOYDomSGtgx+xp7wqHleKW54VXr
         X5r4rs72J/UtLVnM798rieJxK8DvLFqxq4kngMI4Cx2A7Rl6rK2EXodEB9Gj7xtme7YI
         E8vVeSD5yM2a9fs7KqvZ6Pr8W7og01EKKvWcanRqWt85LmV3XKXw7N/G64JCzErxfqob
         kXJ0NLJvUqcXIFj8GJcJVefjXJIZehML3pg5+sb7X5e6UAnODOEx604l9oOA3PPVcKNU
         VBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147192; x=1707751992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHfOArS8uJvdUvmhNcbyjrkgkF05plzKh9QEvVv6hbw=;
        b=OC26O00Xke4vbFjyJf4o1Us3ZZyaXZ59+y4CuGfQSYEj7ZULrQUxe5yVKAR2aXg3aY
         JpuvAmrPs5i7XyfFKaM3+rldBmXD/+D6thhrMcksj/rCO55Hojt4DLmzdW3pJ02dY33p
         OrbGLZYUCUfosYQKYsAo9qm26OBO55iQtGhI65gb9k4qyO5dHnxSIa2zqeSxah87KN6I
         qCaynFosp/WQoOn/4PpcXavE6EJ6ChnYKhBByCpn6X10KGEt+IdfCXU7g8YJH5ripIXk
         pqghPCg2R9sqNI0eCE9oyCz3Vg3fkVMyza9TqGRP4VbH0i3wiQh6i6pHuq2lO4upvUUS
         MQmQ==
X-Gm-Message-State: AOJu0YzqTIU167HfXgwYy+CUW4MFRSjvvrAEc2QwGKijGrwNtH4BjJBG
	NBNcWxNNkl64+as2AC/yYFJCMuVnnp/Yh1Ue4jJy0CqUy1yTtZMiFBgVBsQl
X-Google-Smtp-Source: AGHT+IFBvdM1BK0z6wUkWhrRiZ3w2wNb0SO1kX6dmGbvkfVIsOwXcHO3jk/3iF64lOET80/d5b1U7A==
X-Received: by 2002:a05:6512:3d1d:b0:511:47ed:d744 with SMTP id d29-20020a0565123d1d00b0051147edd744mr4893576lfv.12.1707147192622;
        Mon, 05 Feb 2024 07:33:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXFoXbLJwXhoXwmg9HQ+lqPXk8ylmx6jbLjT+zM89gRYK/F0wv/tsMO4LoKFT5RIGEPAjMnZtD9g8xotGFo6TZrZ7UmGcGLygewAGSL5QM9fTZN1n8ffiiEhq1ZH2XVuRwtsb9xjdRLQTjItvvEuW6JbI7lAfj4eugYX4XgbSMr/lBK6App7anZC0zPg96h0B7Xd5vLLt39uhriz3C3sqzNSUnrzA4uWJYcKw==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 30/30] xen/README: add compiler and binutils versions for RISC-V64
Date: Mon,  5 Feb 2024 16:32:37 +0100
Message-ID: <d62dff38ee661f3fb713554d544c966fa889fd83.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index c8a108449e..9a898125e1 100644
--- a/README
+++ b/README
@@ -48,6 +48,9 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.43.0


