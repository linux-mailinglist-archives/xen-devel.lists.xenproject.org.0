Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0847A08CC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602458.939125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo51-0004BT-TE; Thu, 14 Sep 2023 15:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602458.939125; Thu, 14 Sep 2023 15:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo51-00049m-QX; Thu, 14 Sep 2023 15:16:31 +0000
Received: by outflank-mailman (input) for mailman id 602458;
 Thu, 14 Sep 2023 15:16:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmb-0002WX-60
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:29 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05023a52-530f-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:26 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcbfb3705dso16495241fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:25 -0700 (PDT)
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
X-Inumbo-ID: 05023a52-530f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703446; x=1695308246; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok1TJYwJQJI7C0pX6S7p2xUmNjrsXD97NUag9YwJGF0=;
        b=GhJ5MwRsCwNw3qAl3AAeYkG7HGO9uHcZwYFjpDiOhKFvayyx6oGvxoyCWJIeJei5qg
         pfzaI/vMEZVWUrVsjuA6KVRPyAqj9KPsIQIEnNMaRg/K4htYFYHDHV8016fSWhp1Xm0P
         QTPnj+XnkT9CEEg9iO2rsgxj48kcvhvLu1kLFo2XMijiVjc2jjkVIzC8n4IW9weOfWUo
         XO8GokO5lo1dsOJURdQ2oLP0yUF2NdHSjIW0IUJGUWn3zn/35gxqzeQxLf1T97JcEXbg
         E71KQu9UpzUFbNC93qbGFQ6MPBcfe4A3dz/2rjLmetst0yDAdeQGF88DFZmLZ7uUz5zF
         5xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703446; x=1695308246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok1TJYwJQJI7C0pX6S7p2xUmNjrsXD97NUag9YwJGF0=;
        b=DpgD0SDcu+DVXbIe7dbgpiFRE1VgL7YDoFaw02lHqAUmNZcFIx0eKMwccje+69LqTm
         +OfZTH962bUooOMBdE3vQF/QTLHZGYE0tzZD6We5Y5pSPwjmXq0A5LdjN/u/jZSpD522
         JHwOslNJkcNXIUlktG+OOqRJHZhTUckfhpeF9ak4SCQId9goma1TWxM5qCfD3CfbiUhI
         nW359IDoSbQzHLLPmGlKbWJWGgnx0WOmYT+EwmoBGFBYTBvokpW4fCkEAOMJqYPbcVFu
         O9sG6cFjOzN3fI0iyjIqOpYbpHyB7rv4seISiUbBeSr1P0KT75wWVTpWZV21H6pV+sh8
         AwmA==
X-Gm-Message-State: AOJu0YwuSF2HRxb8t1C9JEU8nmzzgb6smidF7x3CxsajA7caRH7lXPVU
	b8EgjtdMFcA1D6IBKZXhs95QD1JOsMU=
X-Google-Smtp-Source: AGHT+IGbJcWrraL1eWxsT86XyCys0UVC8IK8YvDLuazDOc0+RZw4dzxYICFJILoCRVA8v8ix9rJL/w==
X-Received: by 2002:a2e:960e:0:b0:2bf:789e:b5dd with SMTP id v14-20020a2e960e000000b002bf789eb5ddmr4778805ljh.53.1694703446235;
        Thu, 14 Sep 2023 07:57:26 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 24/29] xen/asm-generic: introduce stub header guest_access.h
Date: Thu, 14 Sep 2023 17:56:45 +0300
Message-ID: <56793f5bb85535f4e5be90fe83d0dc9850330b0e.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/guest_access.h | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 xen/include/asm-generic/guest_access.h

diff --git a/xen/include/asm-generic/guest_access.h b/xen/include/asm-generic/guest_access.h
new file mode 100644
index 0000000000..b865d37f4e
--- /dev/null
+++ b/xen/include/asm-generic/guest_access.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_GUEST_ACCESS_H__
+#define __ASM_GENERIC_GUEST_ACCESS_H__
+
+#include <xen/mm.h>
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
+unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);
+
+#define __raw_copy_to_guest raw_copy_to_guest
+#define __raw_copy_from_guest raw_copy_from_guest
+
+#define guest_handle_okay(hnd, nr) (1)
+#define guest_handle_subrange_okay(hnd, first, last) (1)
+
+struct domain;
+unsigned long copy_to_guest_phys(struct domain *d,
+                                 paddr_t gpa,
+                                 void *buf,
+                                 unsigned int len);
+
+#endif /* __ASM_GENERIC_GUEST_ACCESS_H__ */
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


