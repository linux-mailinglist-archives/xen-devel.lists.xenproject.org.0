Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54669716D9
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794336.1203163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncZD-0006yO-7L; Mon, 09 Sep 2024 11:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794336.1203163; Mon, 09 Sep 2024 11:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncZD-0006wX-4i; Mon, 09 Sep 2024 11:28:23 +0000
Received: by outflank-mailman (input) for mailman id 794336;
 Mon, 09 Sep 2024 11:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UDgh=QH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sncZC-0006wR-HI
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:28:22 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8aa83a-6e9e-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 13:28:21 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5365b71a6bdso3372210e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:28:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f915029sm741534e87.308.2024.09.09.04.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 04:28:19 -0700 (PDT)
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
X-Inumbo-ID: 9e8aa83a-6e9e-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725881301; x=1726486101; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIhmaQvwOZxB9UqBa/yqcXNAVX6lc87CE/UXbFErwZI=;
        b=Jp7qT/C0f6GKI4o2ZWLjIY6tCgI+zS8kyYcEQ+Mlli1jC04zL8ucxODS4oe0fjQorJ
         QQz3ONFDpAxCS5jS6Jsc74bf5oTGJAMPLhsTTireFE8n666Ufb7HP0hvoEeieVhTTec+
         xrpS2XlhacRRuZyqJAzs82plN85Vd7KrAT2VPX5dbw9CmpMmUHuqsviNHHS6GpwCLzFH
         Rj43iG9Y3Bu0Pv10FZN69qTFAaSFIphmEw1x2+dxtg8LPR/Pc7CVRNZjk3TRdAWW/9lz
         f2u9CG6nvWcbSOz5BUV6fXvDh2wXfrSYMFVhJ1e92p0xdFZafXLfX6U4IdnficuPcXJt
         GKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725881301; x=1726486101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIhmaQvwOZxB9UqBa/yqcXNAVX6lc87CE/UXbFErwZI=;
        b=toOguXNcACdhY81QEBGiPuQ/rrfIzxORpy0jknnDcxXP2k+nhChR5MdM7Ok9kWjQgM
         IO7Jin5qeCJeKcDzHKIZwvf1T+eMxMht7/TRlMJCrquuRxCACd6peqgpSQZnP8F6HI4d
         QpAVWUCdIzNx0Odrav+NOVhUvPyV0eNS+9+5IcXxBRLcjHiu4xOD4W7VBKZD9QT23+5I
         lVx9A8mIkSylu3+s4sE13YBa6s/Ok/LnD9A/ug3NjUWq5YUwmz7YM+hBsKwj2+zgfPpj
         hQUbPx7EBiYz5yuq3NPsCvzdqxXD1TNOfhMHdEoggTWNeMbEOszH+b8ZvyxAAEdK3u+7
         csPg==
X-Gm-Message-State: AOJu0YxvFpZPVTRKbaD/MLSDSPX0PN4/JnW5l4YfGWfJCucQSvMHBoEN
	fOVa2VAtiXA6+gG76IyhOuZw3BhSqg8E20WWJd7D457++NaKh4JTlKYK1Q==
X-Google-Smtp-Source: AGHT+IEkLKLy7M8YBGZ8zqVFioiILxIAh44c+aEsi7xxVX2J2eMqbHdVPopwCoBpPamGQkRP7jraPA==
X-Received: by 2002:a05:6512:3989:b0:536:54d6:e6e3 with SMTP id 2adb3069b0e04-53658819213mr6667542e87.61.1725881300178;
        Mon, 09 Sep 2024 04:28:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/riscv: fix type mismatch in read_atomic_size()
Date: Mon,  9 Sep 2024 13:28:15 +0200
Message-ID: <20240909112815.37921-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a typo in read_atomic_size() where a 64-bit result
was incorrectly cast to a `uint32_t` instead of `uint64_t`
in the case of 8-byte reads.

Fixes: 3cd46d4ec8b9 ("xen/riscv: introduce atomic.h")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 31b91a79c8..41f03b2e0c 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -45,7 +45,7 @@ static always_inline void read_atomic_size(const volatile void *p,
     case 2: *(uint16_t *)res = readw(p); break;
     case 4: *(uint32_t *)res = readl(p); break;
 #ifndef CONFIG_RISCV_32
-    case 8: *(uint32_t *)res = readq(p); break;
+    case 8: *(uint64_t *)res = readq(p); break;
 #endif
     default: __bad_atomic_size(); break;
     }
-- 
2.46.0


