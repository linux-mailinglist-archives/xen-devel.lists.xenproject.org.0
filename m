Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4C7978542
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798298.1208482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gY-0000RJ-Mo; Fri, 13 Sep 2024 15:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798298.1208482; Fri, 13 Sep 2024 15:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp8gY-0000MC-I1; Fri, 13 Sep 2024 15:58:14 +0000
Received: by outflank-mailman (input) for mailman id 798298;
 Fri, 13 Sep 2024 15:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp8gX-0000AA-Q1
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:58:13 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa1ba0d1-71e8-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 17:58:11 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so3009708e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 08:58:11 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f9038e3sm2348008e87.187.2024.09.13.08.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:58:08 -0700 (PDT)
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
X-Inumbo-ID: fa1ba0d1-71e8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726243091; x=1726847891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONf+Jyq8vL0urPVIlFOHx8t/HPCfJ/6VkXsjPeGFcqo=;
        b=dPdXEcCaDfhgCHGhDgffGOQTQhFjZQEoH2LnAqtiNV5cJ1gjYCskciGXsul+cUZDHX
         r18T0UrK9pmdXfrnIQyoxSRXBpmDsNczgicYv87GF4kSBW6mxDGrOga9CNYEzJHUm49M
         ugUjHbzCB0M92UetEzqZt9sn4bVmyuqT32z7s7fxlBP6Wb6vtHVPzK2HT6qqUrubehAY
         3x21xoAD7KA4VDNeoaP2pES2itMCnLtxPu2h2cDdnmcjJGZvODlSwd08jPy31hDNh8or
         cRV+8NhZzOnT808G4ZV/GlI0U5EpXkKT6ovuPLz+6H60PLGPEhvVG8DnomxGUcufvFbC
         Sxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726243091; x=1726847891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONf+Jyq8vL0urPVIlFOHx8t/HPCfJ/6VkXsjPeGFcqo=;
        b=QgRZk53fnri1uDE9Xws5OJQ5+ms9PYKf4NEsw3nt0V+bXZm5LX74d/VDMM33XEXfHr
         A7+o4S62OuHUNmtOlFDWqV1X8VF01EjgdEhpF1hbd0ukmUqp5dPtJNqiYCAB9EqWWa0H
         XmgQboaPgNP4GbeqKZozDM3yjBEEB6vSoDcdAYOgq2Tn1jaZn8vb8gxgTa19iUxUSrCW
         a4tPMkhbZvdDQUzwHo+7zdInBiOyeKhbaPGd7WyRO52ovZ4u6F/DZ0Nr7HJRqwxdhddr
         hLnYv++30EYesorEI9af+snewWhyV6iJbuO/16hdHWfaiUY21OCxMZJ0UwFmgayE1GBf
         s4Vg==
X-Gm-Message-State: AOJu0YyKE+in2q1HQC69BPpijGHEJ8CICo/FFDvTAyXruGn9MTZm1fIF
	e8d5kI8nEW7RiLzgZHhPazjM8L4IlVYgP1sv7hdbhY8wqZbg7AzjGq3jnw==
X-Google-Smtp-Source: AGHT+IHVyV3/53mx5hSKwamO6JkZO2nG5wLriakhH4NvhfjKgxrtoFdBNL5pOhBnAZxTkHhONSS0Jg==
X-Received: by 2002:a05:6512:39c6:b0:52f:c148:f5e4 with SMTP id 2adb3069b0e04-53678fb6fe9mr4520063e87.21.1726243090259;
        Fri, 13 Sep 2024 08:58:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 2/8] xen/riscv: allow write_atomic() to work with non-scalar types
Date: Fri, 13 Sep 2024 17:57:40 +0200
Message-ID: <bf5c566bd4c2adf0518a9785627bdc5f12a7187b.1726242605.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726242605.git.oleksii.kurochko@gmail.com>
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the defintion of write_atomic() to support non-scalar types,
aligning it with the behavior of read_atomic().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - use union in definition of write_atomic() to add support of non-scalar types. 
---
Changes in v6:
 - new patch.
---
 xen/arch/riscv/include/asm/atomic.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 95910ebfeb..e2dbb391f0 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -69,10 +69,11 @@ static always_inline void _write_atomic(volatile void *p,
     }
 }
 
-#define write_atomic(p, x)                              \
-({                                                      \
-    typeof(*(p)) x_ = (x);                              \
-    _write_atomic(p, x_, sizeof(*(p)));                 \
+#define write_atomic(p, x)                                              \
+({                                                                      \
+    union { typeof(*(p)) v; unsigned long v_ul; } x_ = { .v_ul = 0UL }; \
+    x_.v = (x);                                                         \
+    _write_atomic(p, x_.v_ul, sizeof(*(p)));                            \
 })
 
 static always_inline void _add_sized(volatile void *p,
-- 
2.46.0


