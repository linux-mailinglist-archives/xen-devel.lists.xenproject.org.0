Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C311A74B99
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930782.1333395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA7t-0006wX-PN; Fri, 28 Mar 2025 13:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930782.1333395; Fri, 28 Mar 2025 13:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA7t-0006uB-Kv; Fri, 28 Mar 2025 13:52:01 +0000
Received: by outflank-mailman (input) for mailman id 930782;
 Fri, 28 Mar 2025 13:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA11-0005Dp-0L
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:55 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d192ab8b-0bda-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 14:44:49 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso1777585f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:49 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:48 -0700 (PDT)
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
X-Inumbo-ID: d192ab8b-0bda-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169489; x=1743774289; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOpUu990EoQlzQRzQ8NP3z9qRiebIA5naXnjIh1S24E=;
        b=qmwgr2c4hFtyNf3hMdqS6sOLC818gB/CPmLxPGTBhkj1eFyoCjZhWh0mbb62+RRss2
         Dg5mqmki8bg1AsusvqfGdvIr+wKUNszsVq486HMALP/2x7vbDETqjIvCLvun/K6iLx+e
         qxPKQSxk2I7k1kZRnR+eWMwKyP3Aok9w/FqIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169489; x=1743774289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOpUu990EoQlzQRzQ8NP3z9qRiebIA5naXnjIh1S24E=;
        b=vzPR5BC4wLJ1sBH2JCxbXTYRFgmhXE29T15Jhr9XkT9IR2v0tZ6Nx92O+HBL/e3vz0
         Jp17e+xy5M/4LOqrYYueJkNgBX+bjjS9w+cSvmSYPLFaXwBddPdG9/E1ldmh++QBmgpI
         IDhilwAO5BUHQlwc02aKBiXj/mtvYM8ICiiw4fSloDpVjn1FRqvDW1NHyLnFJo/wqeJ6
         bu9WaP0fgGaKXfIDFsqNwQNzvFNWQvNslf3rxq8uKmip79HO+qUZzbggxRlZGOiucb4X
         PiMZSfjZ2Wwh/4TBADh8wXUFCZ/uV7TMKRtI8m/jxxo508/msVfzXqS8jf8yCzTir2L4
         x0kw==
X-Gm-Message-State: AOJu0YytT0rbB6EToJan0azmyhdlOvEo3v2wAzuo+EIFy35gt6xhOYPJ
	i1Hfs/JWYpCX1OrPf4jol+3WnCI/epLBh5Q7kvlLA6kXa8TvYlXACCNmvUcGxlUV/E8jtThbtjH
	5YWo=
X-Gm-Gg: ASbGncuZeUfX4sYCuds4W4hkA3DflweRtoPJ7N0nQo9K2yigMqHsqsJG8h8no1MVi5W
	Ixbvo0hZampvC8mslXyZ6lawhe4aaGDUJ5FVKQm9JBvZT1fvc6fVaQYbNDXc2ZN7RPVe5FESSdI
	/yxno08lNofAbsB5ZtoWPA1RZ1LWO65MET3Sw0TZpxeNbr7keLpoTt0oaOgi1YB2rAD52OyOAur
	pGC8d9OnjzYIcuVMJvUKLVA37e8ZxagMr2DO6zK80f9YW5RE14uEge0sxe2lfUqJVk76KmFvMuD
	XDKO0RRW3IrWhz8JfqIOIU6Sw7fbS7cE1Sd03og785U2HkumrPs69+cJDoViszZHPzs3CBADiOC
	rv6z3N6Tdi8hPupxvgRmBkE3yF+gF
X-Google-Smtp-Source: AGHT+IGI7JO4UlPZY2avFsom7n/30LCzzvOjr02jm255ArguGao3va3hCkObUFth/phBf95IeTK7aw==
X-Received: by 2002:a5d:6da5:0:b0:39a:cc34:2f9b with SMTP id ffacd0b85a97d-39ad1746622mr8531467f8f.16.1743169488749;
        Fri, 28 Mar 2025 06:44:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v5 15/16] riscv: Remove asm/byteorder.h
Date: Fri, 28 Mar 2025 13:44:26 +0000
Message-Id: <20250328134427.874848-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the common code moved fully onto xen/byteorder.h, clean up the dregs.

The use of byteorder.h in io.h appears to have been copy&paste from ARM.  It's
not needed, but macros and types are.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/arch/riscv/include/asm/byteorder.h | 14 --------------
 xen/arch/riscv/include/asm/io.h        |  3 ++-
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 xen/arch/riscv/include/asm/byteorder.h

diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
deleted file mode 100644
index a32bca02df38..000000000000
--- a/xen/arch/riscv/include/asm/byteorder.h
+++ /dev/null
@@ -1,14 +0,0 @@
-#ifndef ASM__RISCV__BYTEORDER_H
-#define ASM__RISCV__BYTEORDER_H
-
-#include <xen/byteorder.h>
-
-#endif /* ASM__RISCV__BYTEORDER_H */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
index 55f329dde321..8bab4ffa0390 100644
--- a/xen/arch/riscv/include/asm/io.h
+++ b/xen/arch/riscv/include/asm/io.h
@@ -38,7 +38,8 @@
 #ifndef ASM__RISCV__IO_H
 #define ASM__RISCV__IO_H
 
-#include <asm/byteorder.h>
+#include <xen/macros.h>
+#include <xen/types.h>
 
 /*
  * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
-- 
2.39.5


