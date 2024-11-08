Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19739C264B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832907.1248249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VL7-00041j-GQ; Fri, 08 Nov 2024 20:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832907.1248249; Fri, 08 Nov 2024 20:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VL7-000407-CS; Fri, 08 Nov 2024 20:12:17 +0000
Received: by outflank-mailman (input) for mailman id 832907;
 Fri, 08 Nov 2024 20:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9VL5-0002pM-Rj
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:12:15 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be3bc89b-9e0d-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 21:12:13 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so19007521fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 12:12:13 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d7e6sm2334739a12.14.2024.11.08.12.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:12:08 -0800 (PST)
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
X-Inumbo-ID: be3bc89b-9e0d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmQiLCJoZWxvIjoibWFpbC1sajEteDIyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlM2JjODliLTllMGQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk2NzMzLjYwNTYzNSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731096731; x=1731701531; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPC86lay0Nkrz6T/SvUOsZkRaQ4nDoNQ73rWRAiZP1Q=;
        b=DQXDNKDQkIOJFBPJztbV95k5Oyw0OZyVgA4iJ9avddSZImgTu7hxnunVWtmJWDvVzI
         5V1en2gHk0IuomW0Qj/9FXPc7r9GJh3oUClGUMZ7puhYLrjb6vDgRnk/eU0j8XF+/F/A
         ZS8wJwERgDOXaiYQGYFsucMvpNwEODdnHJZ74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096731; x=1731701531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPC86lay0Nkrz6T/SvUOsZkRaQ4nDoNQ73rWRAiZP1Q=;
        b=oZLEfnkvJjmJon1La+jXV4TUTKXZyIHJughHPfgunZfe6A1CpKM/hjkR7Ak9t51cq0
         vZuo4nE99GD6fw9aZ1Hc7HWt3C1+jJORE9C/tEliAs8O3yW11Br9GVOBzjjcVb+zZ6uk
         WfC/UDRyFYSatYFHPzZt8oQaA77rCW/oKvx1K+rJ5eR/+C0pww10uhRkrUKJTM5QOSXI
         1ObQ66qcZUcZbk49iGH38RG/JM1YvC9N0uBgDiaY8VVuxX0Iohz8+2ocj9edSL1bfDaD
         fDPpPgVc9PVUc2rYRwYKyK/E+G7ULggU0KgTD0jp3W1bL0RBbqxqLF0Xbq9b6H2k3qLM
         WNow==
X-Gm-Message-State: AOJu0YzWgjsfis4fOfaiXXpAATXA/Ow4VUsFOIY96mXhx5CUiWFLeLy2
	4aaUcdX1a8T9VXVVOuVJhXpo4MoBEBNS2Bni4eu7ytfj8oKOv/Y5XrU9JbOzdaXaPEhiEMnxDCt
	z
X-Google-Smtp-Source: AGHT+IG8ArwTwcoDg/F3fTYByQlPv12EikWzpKo2ua6iZps9ZqcCDDaY8ChLzyACKMjfL1xqzWx7jQ==
X-Received: by 2002:a2e:a90a:0:b0:2ef:17f7:6e1d with SMTP id 38308e7fff4ca-2ff201e74b6mr24958381fa.4.1731096731082;
        Fri, 08 Nov 2024 12:12:11 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] x86: Drop mach_mpspec.h
Date: Fri,  8 Nov 2024 20:11:47 +0000
Message-Id: <20241108201147.812036-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108201147.812036-1-andrew.cooper3@citrix.com>
References: <20241108201147.812036-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This header is included in exactly one location.  Fold it into mpspec.h

With this done, mach-default/ is empty, so remove the include path.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/arch.mk                                |  1 -
 xen/arch/x86/include/asm/mach-default/mach_mpspec.h | 10 ----------
 xen/arch/x86/include/asm/mpspec.h                   |  4 +++-
 3 files changed, 3 insertions(+), 12 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/mach-default/mach_mpspec.h

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 8f8aeda679d8..80b4431c8906 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,7 +3,6 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
-CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
 # Prevent floating-point variables from creeping into Xen.
diff --git a/xen/arch/x86/include/asm/mach-default/mach_mpspec.h b/xen/arch/x86/include/asm/mach-default/mach_mpspec.h
deleted file mode 100644
index 1a4e3f8c4f35..000000000000
--- a/xen/arch/x86/include/asm/mach-default/mach_mpspec.h
+++ /dev/null
@@ -1,10 +0,0 @@
-#ifndef __ASM_MACH_MPSPEC_H
-#define __ASM_MACH_MPSPEC_H
-
-#define MAX_IRQ_SOURCES 256
-
-/* Generic (i.e. installer) kernels need lots of bus entries. */
-/* Maximum 256 PCI busses, plus 1 ISA bus in each of 4 cabinets. */
-#define MAX_MP_BUSSES 260
-
-#endif /* __ASM_MACH_MPSPEC_H */
diff --git a/xen/arch/x86/include/asm/mpspec.h b/xen/arch/x86/include/asm/mpspec.h
index 45e474dfd1b6..267768e7595e 100644
--- a/xen/arch/x86/include/asm/mpspec.h
+++ b/xen/arch/x86/include/asm/mpspec.h
@@ -3,7 +3,9 @@
 
 #include <xen/cpumask.h>
 #include <asm/mpspec_def.h>
-#include <mach_mpspec.h>
+
+#define MAX_IRQ_SOURCES 256
+#define MAX_MP_BUSSES 260
 
 extern unsigned char mp_bus_id_to_type[MAX_MP_BUSSES];
 
-- 
2.39.5


