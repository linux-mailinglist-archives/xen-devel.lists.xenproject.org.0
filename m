Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D067CA5CAAA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908729.1315837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Km-0002OJ-Os; Tue, 11 Mar 2025 16:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908729.1315837; Tue, 11 Mar 2025 16:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2Km-0002MM-M5; Tue, 11 Mar 2025 16:20:00 +0000
Received: by outflank-mailman (input) for mailman id 908729;
 Tue, 11 Mar 2025 16:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ts2Kl-0002GP-3e
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:19:59 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe9ad35-fe94-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 17:19:56 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e5b56fc863so8299651a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 09:19:56 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c74a9303sm8706016a12.42.2025.03.11.09.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 09:19:55 -0700 (PDT)
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
X-Inumbo-ID: abe9ad35-fe94-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741709996; x=1742314796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQepzrELpS8uLMcFNB90Tm4w1kaOHz8q3MeG0GD1qWc=;
        b=Ue9g3FUJiDMwXKek6RQ/+UCaO9jHFP3DYthoiU1jobAG4JsRx82Z+QU+cjeAjo8SoS
         2jTYr5l9dJgiMmJLrg0WMJ5lFL/65BmX+NWnit5mHCwlbxMhBBUyqMlB7YfdoyVHm7q1
         sOuvuECxmnQ5JFkGhayYWrN5FwFpluHINxtfzMmgB8Cz+Q91qjdQtjPTtN5TzOaEqzLc
         EreI/qIEPq6/FWOzq3YNURgf6xFfQ/Ys1vs4V7kmOH7QVmLWQqMtY0b/1S5ORsdI4es3
         mukuYclSXcQPFy+4o6WWIKkLe7gpMbX+51iZX9rMHmOckucQdv8Er3IXzlYc+pcj+z3l
         NNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741709996; x=1742314796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQepzrELpS8uLMcFNB90Tm4w1kaOHz8q3MeG0GD1qWc=;
        b=Qx5DCObvOyD74iJJhiBSog3WjwToL6dTNbKPtZczUNURdyejbjHEa79tB/c05G5avr
         QQDMv+FqDj71+hg3ZswyaZpKnrEVII2N4z7cZ3tHL8DaeFMYn4/Co0YcgHQ/X0oxP5RA
         m6kvCifI7NzRRISThnL5Z6Zr4Z1yomE7tnhxnxDpYNLJhuJxWqXpOu0UfTgCSXE/J+K9
         rtIJorv9u0VtK1FDBbQ6eQdTuSUbmV0nbjM3rIdmezL9zuuqgcTR9CpFcrBWlhn2ZPAA
         ZwuF7eWLlbWKYknM75cXq8ncYLbDvMNn9pBfQ3oibFh99l6L2zsqJETWLjkdgm5JZSsS
         /Igw==
X-Gm-Message-State: AOJu0YzZmrRCViBGaUbVgGDKKJcl0kirISrbvqNHiWQTC4nXRZKB21gC
	YvdhR3Fc1Ioew5+6ZOWT+JtNe4bo1GXxJfcp84M03slFFq7IJ4L8tlZTMg==
X-Gm-Gg: ASbGnctMQqXDn5yuTtANOh2lkvl7SyTxjGQoiYvOw+quCX906uu8c/jdPNDOcqX4rvN
	TaPgeIBF5GecTEY1bd4edF3B5ftg+97NWDe+bujs87EqCvzUJwwOcMmpeVTwrAfNZpsey8gNq+b
	1e9bO8SEmcN7X+o0NqEsUILzzGq0vFyoHy09NAxheM65F5ak6cAipNiwn6dZPsVCBEldmJTcf9N
	PXVqo7t1fTmaSSIxKii1Oy3ZFisE/dANe1b/+sWLKx+MHBbp56+Da77vhVP3F4W9c2aoIkUfkMO
	YYZzApou6zwOHMU5v3EnsGWqWKsPgDwo4EcyntPtZW2YAxuC6diddjYeNLKFlAPHpelETgRK579
	P2/W6KHc8LH/HDA==
X-Google-Smtp-Source: AGHT+IGnz5Lz4uBm1/LYXK4AZe1jYq/2LJ6oeTqZZ2SPV4Pzsa6zoYd37LPWMJhocPh+b8o1AJg0Jg==
X-Received: by 2002:a05:6402:274d:b0:5e5:c3bc:f4e0 with SMTP id 4fb4d7f45d1cf-5e75f985a00mr5485606a12.29.1741709995666;
        Tue, 11 Mar 2025 09:19:55 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/4] automation: select APLIC and IMSIC to handle both wired interrupts and MSIs
Date: Tue, 11 Mar 2025 17:19:49 +0100
Message-ID: <31ee47c8906f13869e085e442b285d7ca6202023.1741709885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, the `aia` option is set to "none" which selects the SiFive PLIC for
handling wired interrupts. However, since PLIC is now considered obsolete and
will not be supported by Xen now, APLIC and IMSIC are selected instead to manage
both wired interrupts and MSIs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/qemu-smoke-riscv64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 8f755d0a6a..b2e112c942 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -6,7 +6,7 @@ set -ex -o pipefail
 rm -f smoke.serial
 
 export TEST_CMD="qemu-system-riscv64 \
-    -M virt \
+    -M virt,aia=aplic-imsic \
     -smp 1 \
     -nographic \
     -m 2g \
-- 
2.48.1


