Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E5849E3F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676199.1052198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xl-0008Ie-MI; Mon, 05 Feb 2024 15:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676199.1052198; Mon, 05 Feb 2024 15:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xl-0008Fh-Ej; Mon, 05 Feb 2024 15:32:49 +0000
Received: by outflank-mailman (input) for mailman id 676199;
 Mon, 05 Feb 2024 15:32:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xj-0007I6-Np
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:47 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf9f5f23-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:46 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cf206e4d56so62538941fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:46 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:44 -0800 (PST)
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
X-Inumbo-ID: cf9f5f23-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147165; x=1707751965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7nIInFHf/RafTmU6CQuEwerWXKJeKZlR4hvjiIhjCs=;
        b=XV9FPg150ydHA0kA5D1DSQKXu9oUyZdrsbhsB/dlnYOmqT8YhcChFi99+QPbcnGGOu
         PB8/D9KAU3/h4oyQ53BlV8QoWibvuAUm84mJX8ET+oHdw6GMntaPQaR10ji/cFUySrWv
         Hn6HsTDGjs8fkDdGtfeZj3Oq0UuTiyfw4TPn2wnNaymvXq2MW9KlSlnJ0vr8Iv2vMW2I
         Y9tuR3iAI5lZ1CNmpPm2loLkYCMsC0RzMGnBhq6tOOK/8XQwS46NNOIXEj2w7mVoyJeT
         inkiGy9mf7RwMxp88Tw424XI3Vu1HjRnK5MQSJs3xMligSaYvXIqbwAAh8qfqJvQ6gUg
         yYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147165; x=1707751965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7nIInFHf/RafTmU6CQuEwerWXKJeKZlR4hvjiIhjCs=;
        b=s0A3q2b+0BjyzSwbZcXbG5HAXiCZVUkn9kW6y7VFo8iaoPVuB0jbdHxJVzz13zV9Xs
         AnrvfK6TtSfMEcGCr5aBzSLKDVWxUOn750fkwlZsZpqnQiTQDS1bhl2iQeIeiO3luFNm
         7VyVOncrALcxuIg2lbvUrfNBSdAK8lIHpvYrq3qkbYXS6b3i6PEAvCCmvbjKfwXHNPhF
         oRzuYyTTuAuV+9bYqQYjOUWdcz1V4YAuWiobzNndZMDIC/FPxhTmxNSR3SAw3V5/CW+D
         NdHadOIOm1N4obc9xJTCmdI0k2OqlMmbpzuKdV3NlH9AYhHbQcsdsfB2+E6mMX0CYKin
         twKw==
X-Gm-Message-State: AOJu0YwF8D6tLwYBUjCaUp3QSL5o886H5Iyxmgn4HpNEteZfMgdJYJ16
	gWtbV4REqVHjl1TH5z7jL+KdI7EeX4R+chxvlTKFqBbPfjamEI1PoMpkJtLU
X-Google-Smtp-Source: AGHT+IFd+bY/f3tOidrDAoSnrjgkYzg/PzJxIDWWsz5vk2I/6CC/zK1pHIKy39mg2sVxdskAAqt7Xw==
X-Received: by 2002:a05:6512:3494:b0:511:530b:6026 with SMTP id v20-20020a056512349400b00511530b6026mr1337078lfr.27.1707147165433;
        Mon, 05 Feb 2024 07:32:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUaO8apSIii5fy7hiIr4GJtFrmfvIiIQzlpxzA8WWC28Z3zeVp5ovRDKCeTVzYjqILkDChdbbAi/S+5QbpEe2y26hM2gESmOtJSpzYIiku5NKD4O8+6RHxTbWivbeEu3URtQILagduFe3/Iw2rjQqbvYxtc479XKTjvpLIS+ZP48L8TSqwR9XHBJetx63NWjE/747l1kt/g8JCajWGwAzqmO5Fi/WTDJXbioGDC5C0Jg+HaLAjcZUxOrspHGFtjnzbPFFaDUGdPnum2jFGDoO6FEO82u88csdg7N0r7tUs062blmx27gPZju7moQw5L/Dh7pTsJ
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
Subject: [PATCH v4 04/30] xen/riscv: introduce cpufeature.h
Date: Mon,  5 Feb 2024 16:32:11 +0100
Message-ID: <4d58fd5071272acb145cdfd286a90b7bf1c0682b.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 - add SPDX and footer
 - update declaration of cpu_nr_siblings() to return unsigned int instead of int.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/cpufeature.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 0000000000..c08b7d67ad
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_CPUFEATURE_H
+#define __ASM_RISCV_CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+static inline unsigned int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_RISCV_CPUFEATURE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


