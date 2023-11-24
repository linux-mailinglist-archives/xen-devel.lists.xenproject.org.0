Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DC67F7174
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640368.998426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSu-0007Tu-Uk; Fri, 24 Nov 2023 10:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640368.998426; Fri, 24 Nov 2023 10:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSu-0007R0-Pd; Fri, 24 Nov 2023 10:31:16 +0000
Received: by outflank-mailman (input) for mailman id 640368;
 Fri, 24 Nov 2023 10:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSs-0006hy-VR
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:14 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9786007d-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:13 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a03a900956dso334979266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:13 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:12 -0800 (PST)
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
X-Inumbo-ID: 9786007d-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821873; x=1701426673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ucpLU7thxOuTv6VJ60QuJlvjJEFvpS9myNu9FChE48=;
        b=RdsjmUSE6fpxszTmlVKvWVq3HcXiOBmSgZCHP7cymBYAsyAiyCsJTV+mhzqzjuFTcR
         fNvCCtEsiEwGOq9P8j7Ogq2oURJkQgieQsrZFoWIASbpUj3aJKmTWwdZNJnkciq1xnWa
         LM4LsOjyuNCqxwDv6HCX0QyIhrotkOpE+ShLww3B4vwXo8LqKaCKTJSd+ldu7Zc50BUK
         TsG4l3m26Odzy9KsehKhuDCjXYJq/2j0707+8zRlMrF4fz4PCPWfObMD26tfONes/d1L
         IUvI5Od7R6SNt1MdM0HyjhNWqW4M8fBQxnu+ugh9BxpGYDYGg0j/jj14jzRmliZCOBIm
         7QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821873; x=1701426673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ucpLU7thxOuTv6VJ60QuJlvjJEFvpS9myNu9FChE48=;
        b=RdyF61vzB9ZeWZUSuhyMM2nb/3yEbPyZm/tH11EZyu2owry3zJwZRuCOQFP7KQmBBu
         N1iAgqpyVk4FsXy5MevqjvRjOXywGmx14jxQbF3NawV6MATiIfdvXhD1QTVWgsNFOxQ6
         Txoi07vKvjVpiXwk0lWBbQTekPTJeJX8hmnttH3AnJ3S5zUe8DaVThZMmZ2uE4WbyJJ1
         rju+ZWMnTHzxlz5ZOBtQ6qZUBQljT/9IE4o0w91n00ojOxzLu9kk+kj1bbQ4caxg2wQT
         muXJrslhNJCz912gwz7may6C2pC+ynG7FMDrAfc/lWyGI+2973mPknoGoyOnj1JB07QN
         HApw==
X-Gm-Message-State: AOJu0Yw9qlD/ysWPAEqaZD+lNj9LAHkzJ0B34ZApNZFpzGva6v+1C8r+
	ZS36mmXU9dWDeAtI44l7Rswxe6q+FO/ZIQ==
X-Google-Smtp-Source: AGHT+IE8Q22nsynCQY2Kd70S9IklfAvkgerK9R/E5puHXB7qvdnLIwXkt86TZGbQO3gJqEfuWlBNRw==
X-Received: by 2002:a17:907:7da9:b0:9fd:9e54:a4fc with SMTP id oz41-20020a1709077da900b009fd9e54a4fcmr5846321ejc.15.1700821872896;
        Fri, 24 Nov 2023 02:31:12 -0800 (PST)
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
Subject: [PATCH v2 03/39] xen/riscv:introduce asm/byteorder.h
Date: Fri, 24 Nov 2023 12:30:23 +0200
Message-ID: <f55b209773bdf09c8563037f8bc6fb51d1df4c88.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/byteorder.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/byteorder.h

diff --git a/xen/arch/riscv/include/asm/byteorder.h b/xen/arch/riscv/include/asm/byteorder.h
new file mode 100644
index 0000000000..320a03c88f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/byteorder.h
@@ -0,0 +1,16 @@
+#ifndef __ASM_RISCV_BYTEORDER_H__
+#define __ASM_RISCV_BYTEORDER_H__
+
+#define __BYTEORDER_HAS_U64__
+
+#include <xen/byteorder/little_endian.h>
+
+#endif /* __ASM_RISCV_BYTEORDER_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.42.0


