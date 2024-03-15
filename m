Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E687D343
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693997.1082795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwz-0000Yk-43; Fri, 15 Mar 2024 18:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693997.1082795; Fri, 15 Mar 2024 18:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwy-0000VV-Oo; Fri, 15 Mar 2024 18:06:36 +0000
Received: by outflank-mailman (input) for mailman id 693997;
 Fri, 15 Mar 2024 18:06:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBww-0005yW-Q0
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:34 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c239e088-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:34 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso33951371fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:34 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:32 -0700 (PDT)
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
X-Inumbo-ID: c239e088-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525994; x=1711130794; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0ZJ8zwoyTFUoE2+lGEttRsQ4y0+B4y5V6UHVOCeBNM=;
        b=DhgWlfJiAVi5S5LTFIEFEnWfufJdnAkQaOGZzNqTLfaGBQ+5LWDOeFRmyp07W+gW+l
         qmm+aVI+zkFnWRqQY/y916e+VE1ueRqlIsXZT8MB4VgJPsqQT4gNWcmwfvdeUdAUENOh
         BXBTstKfWVHZOH8XWr7A/UvXCxZ3ecacW1EK7Vxo41RzTjlxukxI8e1JGBlwULKfpc4+
         SLl2N5HGMQAMQsFU5AmjhruoUP0wgjG3yyZj8wlDQiAcU/iKT4NJVeQZYQEtrByShPTO
         4Vp54DeiEswXwKPhBYmkll5V8ydSKvXxtIyv9hKCKKVgCBH+PTCuMszvY5Y2Zf1sdBMH
         ejcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525994; x=1711130794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0ZJ8zwoyTFUoE2+lGEttRsQ4y0+B4y5V6UHVOCeBNM=;
        b=AZXxQ1B5qUjguBsgjdydtxN7kcKl7wyaWyFGuOfIbLGNRKQNdr6S42L4Mgay1rgKpc
         4lMyBBvr6Ad7nszIB0jG2vHNO77/CD5hNQ8eyQU7H9b1yKcrdC8wo64MxHNMt927YEHu
         FAsTXnqPsIE+AbxznvmA54VERazyw33jKxyEC3SFGOoVF5sBjF140qZJ3Z4F2e2VOvNI
         eWNXGpC5H9hHq0RJZsSdhJ+Yh1AhLqFpHbI/unsQ8/XX7b0md9OAYxuDL0sNoKmIKKxP
         +mspAAzpTDBya6RJPSKn4pRTSw3ofxdKYQe5euJcQ+kXwQyXDVyPsfp3elcLlKBJ9iTn
         rNng==
X-Gm-Message-State: AOJu0YzriUIsmuQ0Y1U5xuVeVLd2kSp8Eq8lEKGjhlhOD4wLjw/ZMaFm
	GFf6n24E7gqkB/pKaa6/LFeudgs0Q++TYL11vygqWAG0RG2o4w66VLLTeNyuLrE=
X-Google-Smtp-Source: AGHT+IEFpC4E3dzwNXrHarHMlll3uOyZpHEq5UMYSVHFD+AipS9Kb5z7/0V71gSLRwGuwVN3xlM7SQ==
X-Received: by 2002:a2e:b5c8:0:b0:2d2:6227:d30a with SMTP id g8-20020a2eb5c8000000b002d26227d30amr3421195ljn.2.1710525993654;
        Fri, 15 Mar 2024 11:06:33 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 12/20] xen/riscv: add definition of __read_mostly
Date: Fri, 15 Mar 2024 19:06:08 +0100
Message-ID: <a82a8608b0834e82945182290d7d76d7a24c8358.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of __read_mostly should be removed in:
https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/

The patch introduces it in arch-specific header to not
block enabling of full Xen build for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
- [PATCH] move __read_mostly to xen/cache.h  [2]

Right now, the patch series doesn't have a direct dependency on [2] and it
provides __read_mostly in the patch:
    [PATCH v3 26/34] xen/riscv: add definition of __read_mostly
However, it will be dropped as soon as [2] is merged or at least when the
final version of the patch [2] is provided.

[2] https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/
---
Changes in V4-V7:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/cache.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/cache.h b/xen/arch/riscv/include/asm/cache.h
index 69573eb051..94bd94db53 100644
--- a/xen/arch/riscv/include/asm/cache.h
+++ b/xen/arch/riscv/include/asm/cache.h
@@ -3,4 +3,6 @@
 #ifndef _ASM_RISCV_CACHE_H
 #define _ASM_RISCV_CACHE_H
 
+#define __read_mostly __section(".data.read_mostly")
+
 #endif /* _ASM_RISCV_CACHE_H */
-- 
2.43.0


