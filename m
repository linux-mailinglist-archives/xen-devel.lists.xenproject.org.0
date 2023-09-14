Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAF87A0816
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602355.938905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmM-0003Nw-3t; Thu, 14 Sep 2023 14:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602355.938905; Thu, 14 Sep 2023 14:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmL-0003Gq-U2; Thu, 14 Sep 2023 14:57:13 +0000
Received: by outflank-mailman (input) for mailman id 602355;
 Thu, 14 Sep 2023 14:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmK-0002WX-3Q
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:12 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb32b320-530e-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:57:10 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so16352151fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:10 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
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
X-Inumbo-ID: fb32b320-530e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703430; x=1695308230; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zDDTwDOE0/1jXRUL7qB40DNiEiInQL/Y1uSME8BtmQ=;
        b=P+41IGRrakrKripwlIiD9MYkh8YFTMk8gHXDi5GaFc5jQZd+bl0Za6+iLEU9nndQMO
         Id7fWatYg2q35cAeB6uCN4wi7rWSxGMmJhtulBML7cUjgTQlOYer5tHB2GD0Y0FwvOKE
         0yL6UiOVHmjSCqNZpjLKTvxw9iYXYZ5rTZoqz+pGqEo3PhE9DneNwVEVgPHh3vtqMVYU
         98P0NFzMqrH20/gR75DntjvB13TaBjWddHd0bYmVX2yLIKfYQo2Jq5Y4mdzvfHxLrvQ3
         GBI7XoN0B1Sk6NzsOAinPRk60fgKYotsywFgqSLkQ0J6PtFM2gxCc7p1ZPEDGDO/V6kL
         R36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703430; x=1695308230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zDDTwDOE0/1jXRUL7qB40DNiEiInQL/Y1uSME8BtmQ=;
        b=cpJYOvUXSyiuZjH2mH9MfCrO0vNAUwe5o9oXQS3/dwwMe+IGNosLF5xviKPsrxDYbq
         j0rG8rEuAQThcXeJOkmmfojhWWnRu7Vb5lvLutoxyEQwkrjq63Iza7OeCyD/LP62raI6
         RjHpfQrn3W4kF1arBKvTysGBjpOGnv/lmKZrx/KRT2Sfk1lE2A9AuQcFVFX56xV0FDqW
         vnxGysGYydcDgLtS+criLlMkUVJl9iVsbwqbJ0FEC4t5/LkX6EP1/bQ5VZs8cYUemWAo
         JzGz9pVIKpihN3sogLZX7gqY9NvDruGzl4HdMkcRMUvqqY8PwQGch7okwDk5pv4KlRZa
         8+KA==
X-Gm-Message-State: AOJu0YzHmIc32xwZQPXsIDXyZE6hMkTKj7A5CFTQb33DF0Ttj1Lbdhvl
	duVxzaXL5Z6UYL8KY5CyLcJUCOSXCMk=
X-Google-Smtp-Source: AGHT+IFoZ0A8rgK6AQvchbbrAOZodjA7xlN9nYRxm/YKnEp+YTFDJDf1bt4T9gO02KL2vKUduyFP8g==
X-Received: by 2002:a2e:3c0b:0:b0:2bd:14cc:ab1b with SMTP id j11-20020a2e3c0b000000b002bd14ccab1bmr4986642lja.44.1694703429763;
        Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 03/29] xen/asm-generic: introduce stub header cpufeature.h
Date: Thu, 14 Sep 2023 17:56:24 +0300
Message-ID: <c89b1a60ee40576a2841c222a2cefc5ae2a301d3.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces stub header needed for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/cpufeature.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 xen/include/asm-generic/cpufeature.h

diff --git a/xen/include/asm-generic/cpufeature.h b/xen/include/asm-generic/cpufeature.h
new file mode 100644
index 0000000000..86e2a8b455
--- /dev/null
+++ b/xen/include/asm-generic/cpufeature.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_CPUFEATURE_H__
+#define __ASM_GENERIC_CPUFEATURE_H__
+
+#ifndef __ASSEMBLY__
+
+static inline int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
+}
+
+#endif
+
+#endif /* __ASM_GENERIC_CPUFEATURE_H__  */
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


