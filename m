Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F60A6A9F7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922633.1326530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHt2-0000gA-So; Thu, 20 Mar 2025 15:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922633.1326530; Thu, 20 Mar 2025 15:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHt2-0000eX-Pq; Thu, 20 Mar 2025 15:32:48 +0000
Received: by outflank-mailman (input) for mailman id 922633;
 Thu, 20 Mar 2025 15:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvHt1-0000F3-MH
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:32:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a8dc10-05a0-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:32:46 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso7275625e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:32:46 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556afsm51545035e9.19.2025.03.20.08.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:32:44 -0700 (PDT)
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
X-Inumbo-ID: 92a8dc10-05a0-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484765; x=1743089565; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UEX+Ken0lbbz27KSN/mzaQf3lnapm0uhTGtmqgbZOo=;
        b=FlihSZAb74THOHKI5J8i4jjiBxHKkF/BdRUD0kIju2ZlXavEWzm1OICSQwmaQWB4KU
         Fc95gHpIF60vfN1f+Q9rR+YyGw4z9cg8O2+ZLf22XWmo2BiheD7N4bMd11Vdd7g5V51j
         Vv2dFkCtFKlcLANeR+TUuRqZYVoNqHdWiRtrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484765; x=1743089565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UEX+Ken0lbbz27KSN/mzaQf3lnapm0uhTGtmqgbZOo=;
        b=QkwL+BhgJoU6/5gEk6YZhtihDt9l5Jxf2nvACs1XVLwbkZl4pXifinyoLi6vjhuDqa
         9ferlWUFmDWAw0O6vQgBc1PYDXTEyljX4vBk/WrpGJaW63RNnEZYBlmEeFtjkAVmkkOe
         KC78xqpZ/rLd6aGVlumZshk7jrNPbMfx+cM8pSXNvFmpzq/CPG2S8JHY36ZQtL2tAT2A
         1Up1quoDsvd4SBPWc1YqWFwAbv7yEirODmbCdnKVpiUhW75B0PV7TZA4Vh/cqbf0mllS
         xe4nK5PiauYX1lUu7+L/HaLCOK02b/Y/buhMbvNfN63pJiK5V92aQ4ojHjlq4iwLJ10t
         r5WQ==
X-Gm-Message-State: AOJu0Yye0lSaXb86jD8MwTIS+apsDgyeDaMfAa6zcVFu8SE0JRtS6ipq
	E8s5yPfp77Z9TODGhHsm73gSlh7Bqfwix9eX37uoSqBhE60FjnzHg0NXWRC6viUYxRmcZfshq4k
	D
X-Gm-Gg: ASbGncsglpuq/Hoht8B8rFCC0ZAUoBFwWZJB4ncnbM4ST6UJJuTM9x8P0rzHEh2KpBb
	JlJa5ACWICNeiwLg3gvG74VlRG/ZPyvXX99OvxLZO84jlzx6VrhAIdGp8IsZZOegaLk2ZTVCR0t
	TxjGzIkfdcu+TeEsMYMtqKq3NXUlwmBedqdAZj9NqJDOGbke6MsnqLJ2B9Jxd0X9KXMIHrz+rUR
	aSenGWP5ccnVRJYLcnuiU6/wLKl2uEZPBX2zoqgJ3q34mYzRbE5fbQ5t7APy8xTcZRbkRYPP/JB
	ZiEIftxaF366f/p6aMvhDAp+ieR8AVgAhJj38w9M0yJxtySmSccZqFs9OOASVjLhlI5iY03atw4
	dySSbakCGglc/SOHI7w==
X-Google-Smtp-Source: AGHT+IHVBVpwxr+14HowxZhb4xySOpff81SzByFKI/X0s9jQT9eg33Bk/bN7dboiD1UQk8wa11ixow==
X-Received: by 2002:a05:600c:870a:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43d436c8b99mr75406465e9.0.1742484765258;
        Thu, 20 Mar 2025 08:32:45 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/3] Xen: Update compiler checks
Date: Thu, 20 Mar 2025 15:32:40 +0000
Message-Id: <20250320153241.43809-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320153241.43809-1-andrew.cooper3@citrix.com>
References: <20250320153241.43809-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We didn't really have a Clang check before, so add one while adjusting the GCC
check.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/xen/compiler.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index b118e4ba62eb..cc955be32664 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -1,18 +1,10 @@
 #ifndef __LINUX_COMPILER_H
 #define __LINUX_COMPILER_H
 
-#if !defined(__GNUC__) || (__GNUC__ < 4)
-#error Sorry, your compiler is too old/not recognized.
-#elif CONFIG_CC_IS_GCC
-# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
-#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
-# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
-/*
- * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
- * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
- */
-#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
-# endif
+#if CONFIG_CC_IS_GCC && CONFIG_GCC_VERSION < 50100
+# error Sorry, your version of GCC is too old - please use 5.1 or newer
+#elif CONFIG_CC_IS_CLANG && CONFIG_CLANG_VERSION < 110000
+# error Sorry, your version of Clang is too old - please use 11 or newer
 #endif
 
 #define barrier()     __asm__ __volatile__("": : :"memory")
-- 
2.39.5


