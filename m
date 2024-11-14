Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531459C8B01
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836419.1252326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIX-0002lJ-6T; Thu, 14 Nov 2024 12:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836419.1252326; Thu, 14 Nov 2024 12:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZIX-0002jI-3C; Thu, 14 Nov 2024 12:50:09 +0000
Received: by outflank-mailman (input) for mailman id 836419;
 Thu, 14 Nov 2024 12:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBZIV-0002Aa-Gz
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:50:07 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f857c341-a286-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 13:50:04 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-432d9b8558aso4427795e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 04:50:04 -0800 (PST)
Received: from localhost.localdomain (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae1685csm1416809f8f.83.2024.11.14.04.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 04:50:01 -0800 (PST)
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
X-Inumbo-ID: f857c341-a286-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmMiLCJoZWxvIjoibWFpbC13bTEteDMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY4NTdjMzQxLWEyODYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTg4NjA0Ljk0MDM0OSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731588604; x=1732193404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2manZp1AIdPBh7iI0RBUSq4id6SrxSe85LAkzhSm0W8=;
        b=PAY+pbIwGDlp9zrIjhP7DMuLmHLsbMb7wRmxUV96GugReJo79/r2AIJwPb06+6X5/Q
         aZlkxmFYWxUL3BxvCQX/LSStoeRhBOe2p1rdVJHzCPyxASlNvEn8Vh0PxtlVFG8fH3wy
         TcWYcPKm7rFmO5I9zwsxSDn9ZiSH9PoDPKafI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731588604; x=1732193404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2manZp1AIdPBh7iI0RBUSq4id6SrxSe85LAkzhSm0W8=;
        b=ZlGqTIz4iH6XApw5/9bb0i5CmMtcdtWKOfL68icp/ryMc7kxkrZMRDmB7xSnfKJt3r
         025RpYFfq5vyCESGKkH/XLqQapRnrqAZeHeiNyr/75l2K9sZaeIKndZ7S0D7ZUTP0ICU
         b2IQMNaZEMuvA+rxX3zegw4Ti+c6l37Arix7owfmDcVWqiYLtcUPsxka2PqUOrX0vZ+e
         QUla5HrUAKTLZQ+Z5a0VqVW4yKId2zOTiUDB63Hvej9OS3yItKa7fsP8C2kM/8MP3+V9
         d/ynbmg88Z7Aew7JbUGGJrons5LgNf6zi+a6hGJx/NJ1K/Ke50l3p7jyXyjyfJftf8Lf
         rsbg==
X-Gm-Message-State: AOJu0YzfvHkOh2bdEs8EzWFSAGli6r/9UVVjQg+E/ZW8u9YL8yl/dW/c
	3i8Ck0zkyZWBO/WkAx/hR/HTxhtt9j87p5R4hkF69ads7dEiyM+rZIy7UG3PTEtwSII91DcT5yu
	NAPY=
X-Google-Smtp-Source: AGHT+IHLGbOvOAaIXdjY4KfHj/39O0tKCjcFUmS9HRx7rBg1TvHHiskK2fLnljDucY2pR3fwLCE3Fw==
X-Received: by 2002:a05:600c:4e47:b0:431:57cf:f13d with SMTP id 5b1f17b1804b1-432d973e2e1mr31221715e9.3.1731588604127;
        Thu, 14 Nov 2024 04:50:04 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/boot: Use header to allows inclusion of public xen.h header
Date: Thu, 14 Nov 2024 12:49:48 +0000
Message-Id: <20241114124950.24808-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114124950.24808-1-frediano.ziglio@cloud.com>
References: <20241114124950.24808-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to include other headers and avoid duplicated declarations.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/boot/public/xen.h | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 xen/arch/x86/include/boot/public/xen.h

diff --git a/xen/arch/x86/include/boot/public/xen.h b/xen/arch/x86/include/boot/public/xen.h
new file mode 100644
index 0000000000..399b86b5e5
--- /dev/null
+++ b/xen/arch/x86/include/boot/public/xen.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* This header allows the inclusion of public xen.h */
+
+#ifndef BOOT__PUBLIC__XEN_H
+#define BOOT__PUBLIC__XEN_H
+
+#if !defined(__XEN__) || defined(__XEN_TOOLS__) || __XEN__ != 1
+#error Unexpected defines
+#endif
+
+#include <xen/types.h>
+
+#ifdef __i386__
+
+# define __XEN_TOOLS__ 1
+# undef __XEN__
+# include <public/arch-x86/xen.h>
+# define __XEN__ 1
+# undef __XEN_TOOLS__
+
+#else
+
+# include <public/arch-x86/xen.h>
+
+#endif
+
+#endif /* BOOT__PUBLIC__XEN_H */
-- 
2.34.1


