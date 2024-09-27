Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221DE988932
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806446.1217840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDxs-0006nf-W1; Fri, 27 Sep 2024 16:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806446.1217840; Fri, 27 Sep 2024 16:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDxs-0006lQ-Sr; Fri, 27 Sep 2024 16:37:08 +0000
Received: by outflank-mailman (input) for mailman id 806446;
 Fri, 27 Sep 2024 16:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDuL-0001aC-So
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:29 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b90ecc-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:26 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7b28so2639951a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm150697966b.89.2024.09.27.09.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:25 -0700 (PDT)
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
X-Inumbo-ID: 38b90ecc-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454805; x=1728059605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vqI1PmTrCMsFkwqH2ZKg8mKiDsRsn2nxQ/Gez0HurI=;
        b=JNEfruLGXuoFwtCVmvaI2NbqUaioCoP2+XNPHfi/vSZ8WuTQwG43/LWT5lu7B8QS4O
         6DRavxt/rZaETbPgHm3rlHIIlIp91laUo5kvOm+H4a9rLbb3YwieFFZB7y7ZRPoj+ZjG
         A8b5N9S0PDKPgu2NcQK06J4WW5Nh2yYyNYtXhukxhKC/RYg0NTTbymAgckYhgworVHEn
         s8cwxRpxdpXitnxGZlOLuiljeFEzRLeZkyb9s2TpFBTjuAEUn0nn3HU7lrVEHE9el2YA
         N9w35eb8ZXnq6/q5Mv5cUKujkibVabBSum+a/ceITWJQYazXpKEGAabznRR/Xe3qsAGf
         21tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454805; x=1728059605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vqI1PmTrCMsFkwqH2ZKg8mKiDsRsn2nxQ/Gez0HurI=;
        b=rE/fFLViAjhMZZ+GKoR2szKhXgNaKEw5sIZ574sxvA4WxEnl7Q6yw8RkxoKJAwog+r
         Kghf5lcQ2jPX2gPKRt96y/lrmaREJA0erDfXY6bF/fchah7vlbtr/asR7PMgkSMIYN9T
         6bKt7Fm/+qTXX+2PVPdKtkT7fr0hNsLIQ2fBLtXHTHhTDgVQUDlTpYUfORVjhALGz6+z
         hpTnScUAs2tFMOFaRS6V25HncZ8CHp+6qbElzqiEik3kiY2JdxZg1pzueTpgj5SkWA6v
         PLnncbGTZ7eEhHtwlZuNGSfGO+PhD2XWiqfPPtKycBZU6DnEo3AYFEuFg079fBmIBDC6
         QbcA==
X-Gm-Message-State: AOJu0YxAxvWCsm3LNlzakuboIAa8SJgy/zxKeb0X0V+hQiaD+v3RzYCM
	XC4lRqMJcpi2IhkN0OUv6RkArB59snCMyAcNPdsOs5FreY9omKyxt+qFVQ==
X-Google-Smtp-Source: AGHT+IFEi62tiH0OkymrRFEP2hzoCZcydJe31gphU1xKa1aOfSbeMSI9AniBinfMCvbPqfr8MXVlow==
X-Received: by 2002:a17:907:6d1a:b0:a86:a41c:29b with SMTP id a640c23a62f3a-a93c48e80bdmr369021766b.8.1727454805497;
        Fri, 27 Sep 2024 09:33:25 -0700 (PDT)
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
Subject: [PATCH v8 1/7] xen/riscv: allow write_atomic() to work with non-scalar types
Date: Fri, 27 Sep 2024 18:33:13 +0200
Message-ID: <09b925f9732699b348c6f2654d3bb5aaa0f0badd.1727449154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the defintion of write_atomic() to support non-scalar types,
bringing it closer to the behavior of read_atomic().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/include/asm/atomic.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
index 95910ebfeb..9669a3286d 100644
--- a/xen/arch/riscv/include/asm/atomic.h
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+ /* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Taken and modified from Linux.
  *
@@ -69,10 +69,11 @@ static always_inline void _write_atomic(volatile void *p,
     }
 }
 
-#define write_atomic(p, x)                              \
-({                                                      \
-    typeof(*(p)) x_ = (x);                              \
-    _write_atomic(p, x_, sizeof(*(p)));                 \
+#define write_atomic(p, x)                                          \
+({                                                                  \
+    union { typeof(*(p)) v; unsigned long ul; } x_ = { .ul = 0UL }; \
+    x_.v = (x);                                                     \
+    _write_atomic(p, x_.ul, sizeof(*(p)));                          \
 })
 
 static always_inline void _add_sized(volatile void *p,
-- 
2.46.1


