Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1946C7F716F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640372.998457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSy-0008Dl-Gt; Fri, 24 Nov 2023 10:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640372.998457; Fri, 24 Nov 2023 10:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSy-00087Y-6w; Fri, 24 Nov 2023 10:31:20 +0000
Received: by outflank-mailman (input) for mailman id 640372;
 Fri, 24 Nov 2023 10:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSv-0006hy-Qq
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:17 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a6fc53-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:17 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a00a9c6f1e9so250539766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:17 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:15 -0800 (PST)
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
X-Inumbo-ID: 99a6fc53-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821876; x=1701426676; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jpQXpOanTl7F1fyE6Rm+pjLHmxqDoJRr4gmJ1oRAfo=;
        b=Qk9lRbStMb+58dFAt4ryUIttRveMSD7ecbR4fjeoQ4hH1pP2sRbG9CwvYBIXGAazRr
         9Yx/6QIpaKfdmf6vfaIrikphp3YMckVVIiy2TTcp582SagydVZ4wLdAwKwIUbrZG1Oiw
         m6QZwHzwEodPpiUjab0ojd7alp5BMFCt7eSiIOSzdK+VxCQSyMOTtve7KzHfOwSaGlaT
         Lsa2kyPwtgQLFqYxxhBRSGNcTzJ5fBNCVF6KzCRl69HyXFRYOkYZUzV6bn4oSCU0lEX7
         4NdtyEavRQ+JWaIDxxNpC+m0kMK2PYLTACadAbBp0YuU1gTLAYbGblfL+4APjD/UpB5c
         zfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821876; x=1701426676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jpQXpOanTl7F1fyE6Rm+pjLHmxqDoJRr4gmJ1oRAfo=;
        b=raHbPBePHmNzwC/tzVfQ1FFXjJKuuY+G66E0hU0woKthQbCAfhAYhz6aH1izytINLw
         m8aKUwDYIbXzdNOjRradAbFkGDnsHAcaOY3u6AnTjVfjzAOsa9zPznqZ7QHAXiGdpc7D
         DhOnsCwOKGSAmw0O39zfSUNpIjm9IfYof1lUvDokhT0gidThNM3J+WwhTaZnd0FTtMQs
         PxP9yrszK3pEfAKvdHtT+CWg8uIvzwc9eGnLIWG9m3RCuq+vcj9ckxsT/AC2t6FWy1Nk
         1VSKV0KuZArLywUrwfGR3iIICCQYPE+xTQvbBMzGH/i3aWeXt2aTecRPSYTah0yWx9ID
         kWiA==
X-Gm-Message-State: AOJu0YzB6oJUMETIUGS/oaHuDlsfQnVY0IlLu0Ai3DfM8VG27g7JYizN
	/icsJMgRYhxnyAQReFsdMcrXqFvbeMBuhg==
X-Google-Smtp-Source: AGHT+IGFnauBn5PH1KK5OOrie5nVlx4bqPf2gtp3LgEcix1+CNsSbC9EWY3xHXNc4tZKdpFMlEKyUA==
X-Received: by 2002:a17:906:29d4:b0:9fa:caf3:fb17 with SMTP id y20-20020a17090629d400b009facaf3fb17mr1568695eje.51.1700821876562;
        Fri, 24 Nov 2023 02:31:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 07/39] xen/riscv: introduce arch-riscv/hvm/save.h
Date: Fri, 24 Nov 2023 12:30:27 +0200
Message-ID: <acb870b980a791d7800d47c08c9574275159df39.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - remove copyright an the top of hvm/save.h as the header write now is a newly
   introduced empty header.
---
 xen/include/public/arch-riscv/hvm/save.h | 20 ++++++++++++++++++++
 xen/include/public/hvm/save.h            |  2 ++
 2 files changed, 22 insertions(+)
 create mode 100644 xen/include/public/arch-riscv/hvm/save.h

diff --git a/xen/include/public/arch-riscv/hvm/save.h b/xen/include/public/arch-riscv/hvm/save.h
new file mode 100644
index 0000000000..1eb037830d
--- /dev/null
+++ b/xen/include/public/arch-riscv/hvm/save.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Structure definitions for HVM state that is held by Xen and must
+ * be saved along with the domain's memory and device-model state.
+ */
+
+#ifndef __XEN_PUBLIC_HVM_SAVE_RISCV_H__
+#define __XEN_PUBLIC_HVM_SAVE_RISCV_H__
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index 2cf4238daa..80328c3216 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -91,6 +91,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
 #include "../arch-arm/hvm/save.h"
 #elif defined(__powerpc64__)
 #include "../arch-ppc.h"
+#elif defined(__riscv)
+#include "../arch-riscv/hvm/save.h"
 #else
 #error "unsupported architecture"
 #endif
-- 
2.42.0


