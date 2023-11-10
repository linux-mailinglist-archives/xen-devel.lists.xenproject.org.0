Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DE7E7DCE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630619.983726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPT-0008Go-1G; Fri, 10 Nov 2023 16:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630619.983726; Fri, 10 Nov 2023 16:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPS-00087c-NF; Fri, 10 Nov 2023 16:31:06 +0000
Received: by outflank-mailman (input) for mailman id 630619;
 Fri, 10 Nov 2023 16:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPP-0005EV-QX
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a337266-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:31:03 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9df8d0c2505so460863966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:31:03 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:31:01 -0800 (PST)
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
X-Inumbo-ID: 8a337266-7fe6-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633862; x=1700238662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9cK1yjpDKWQCw8xI+NWHuaVAE4NsCYRJpwmxLZ2MEU=;
        b=a7G9g0EULeOnzOzKD93sW5vhHxYzKrPIGtTp1bqeZ/THoLlykL5kD+AnX2QA1fEsl7
         HT6n/LozvHrubdR49GQWQO98TwryUYsrMtBtubEoePbkemiIC3MuZtkPrBZPKpG5G8bw
         IRCn6NzTcdU9SO1m91Phx+TeswWDqEEmEKHwbB9PvjPW9gwm1urIMU/iW6OZxExLAp9Q
         AtAJHkyEAZcCTekYbABVhUSyjrEYvRsCYaFop7KIUw07OS9zh5iUlhpaUyVVwHCtcZxv
         i8FtYiOOwX2ENbxVxaMPeUEIVNr/VRTFW/XwYtwswJ2g0CppgTAcO33NeP2ME5tPpDhz
         c44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633862; x=1700238662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9cK1yjpDKWQCw8xI+NWHuaVAE4NsCYRJpwmxLZ2MEU=;
        b=OD3K6vVNacSJDrxrHbQZQrbuewedskxQcvpNxFup68nKTIGVdNDZb1GhHsSHpoBH06
         AbMFe5vhqpJmD08nks9XYn+bkFODCA7adEfqBTVTVZLN4KVXhdFh6HOoHZopWaSrnvu9
         R554Q339YFaLqhlgcUsRK6c0FVRhlAH2/jnZBOBsd8bFhxk13mkodEd0aose1QcJDncP
         N7qwJdJP7FUSa0PrNCK87z0KAj38cLnAWYz0F9c9UlrR1J0cl+LtZNWLGNiozdAZ+hgD
         EWGP+poXJz92XiPiHWz8nFKymIRp+XLsAMTS3mWVvHIOGbpKXHhP8ERK6URDp1LuVNn9
         sRxg==
X-Gm-Message-State: AOJu0YyzmQVg81i7FplSMzKpxvHso1fdcuCwnDbKG3retBpv5bO0JOoc
	j4D3CIzkFtE7ZZAb+MBsdjcX4TJMSuQ=
X-Google-Smtp-Source: AGHT+IGdZf8lmwn9Nhc8WsjdLlVrjitW0A/updKdWdxjrI/StxCwh4MAjzORsIsFJpgwbCyJbTTdYA==
X-Received: by 2002:a17:907:77d1:b0:9bd:81c3:2a85 with SMTP id kz17-20020a17090777d100b009bd81c32a85mr2614152ejc.32.1699633862171;
        Fri, 10 Nov 2023 08:31:02 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 11/15] xen/asm-generic: introduce generic div64.h header
Date: Fri, 10 Nov 2023 18:30:37 +0200
Message-ID: <e981144f6058a4761912c0f89e48b7053466dd81.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All archs have the do_div implementation for BITS_PER_LONG == 64
so do_div64.h is moved to asm-generic.

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- rename base to divisor
	- add "#if BITS_PER_LONG == 64"
	- fix code style
---
 xen/include/asm-generic/div64.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 xen/include/asm-generic/div64.h

diff --git a/xen/include/asm-generic/div64.h b/xen/include/asm-generic/div64.h
new file mode 100644
index 0000000000..068d8a11ad
--- /dev/null
+++ b/xen/include/asm-generic/div64.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DIV64
+#define __ASM_GENERIC_DIV64
+
+#include <xen/types.h>
+
+#if BITS_PER_LONG == 64
+
+#define do_div(n, divisor) ({                   \
+    uint32_t divisor_ = (divisor);              \
+    uint32_t rem_ = (uint64_t)(n) % divisor_;   \
+    (n) = (uint64_t)(n) / divisor_;             \
+    rem_;                                       \
+})
+
+#endif /* BITS_PER_LONG */
+
+#endif
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
2.41.0


