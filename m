Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CADA7A0936
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602538.939215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoGL-0005Ji-Vy; Thu, 14 Sep 2023 15:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602538.939215; Thu, 14 Sep 2023 15:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoGL-0005HD-SS; Thu, 14 Sep 2023 15:28:13 +0000
Received: by outflank-mailman (input) for mailman id 602538;
 Thu, 14 Sep 2023 15:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmf-0002W4-Om
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:33 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 086614ae-530f-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:32 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so17360401fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:31 -0700 (PDT)
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
X-Inumbo-ID: 086614ae-530f-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703452; x=1695308252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L30JDM9VKR3vohfWC6t+/aEUvp4uCHLEHY7aFFRjYQ=;
        b=j3kvlqarny28KCk7ru9bS3QPEeRCC1DUbUwx9E7xAqJHGbGqTK4Z4+3vtbn3p5dyxa
         imCgIJQg5pqyKxD111m/CXNqUNeE40qV31H5HXAOKW8z+UtoPkZtUB/iRG9hQTFv2W2g
         rFy//veHzA4xYDujyFispnWKc/mRnYPV5NWXLvLulyoylxTNoJV3vJLZM2iXX1LIrP+o
         Pq3iPR6UHYEEIUhpf1IGf2P4uSEiRS7Tc9+SoKD9rPXhK1f0i7DDhVOn/XAVHglomJWz
         XprMaSQSZwKw7UccyNnQKwmPDz3wuL4sIKAqhNgd9cNUhh9KDwFViBNkeCnU+BgEJM9K
         Pw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703452; x=1695308252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L30JDM9VKR3vohfWC6t+/aEUvp4uCHLEHY7aFFRjYQ=;
        b=DVCgE+Qqu/OJhYRZypX2SPkSBJCcJVofAovfRArUVB6Eu8DWLKR9cLmMgnQhNAaYDA
         7TtkwpDDtDenZUTbw4dAIRG+9Sy8FbgkjGn3t0yx/DnOr/9A36tdJrlklbITCxZfLrAO
         UD+eEjTNqEkRIkvE1H5Llp/JsnkN98HvRich+fvmJ7lcP1HO4irjdfDTJW99hUiydqBO
         SCqXM7dzvgq+KZYntfGWKZINU+/lhugGh8dtQBucOZOxCuovLaGKTPMcgeERYBtfPrHA
         crD+JyEFG6r0/IONHluROgH1Lg9lvb4WSFkTPSGX+YorhmP8OekdmYWJrXkAfeVTzzc4
         BN5w==
X-Gm-Message-State: AOJu0YwFKDIfvWQdKf+Y9sz564ds+sEqFMu97EGgo7yi+Y5D9jBFjust
	PdWVgL+B+jOH2T72Kl2hGfke5k/sOIE=
X-Google-Smtp-Source: AGHT+IHF+uiXxX/1isf9yvbWKHkRbvy4tzJKtVv5EQCEfF/HahoPmmlK8cU/BL6kXEgFB3nUwCtIvA==
X-Received: by 2002:a2e:3613:0:b0:2bc:fd50:573a with SMTP id d19-20020a2e3613000000b002bcfd50573amr5094637lja.6.1694703451812;
        Thu, 14 Sep 2023 07:57:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 29/29] xen/asm-generic: introduce stub header softirq.h
Date: Thu, 14 Sep 2023 17:56:50 +0300
Message-ID: <1a957cbe1ed8954c6b83cfc97e376b65d03e12ee.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/softirq.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/include/asm-generic/softirq.h

diff --git a/xen/include/asm-generic/softirq.h b/xen/include/asm-generic/softirq.h
new file mode 100644
index 0000000000..83be855e50
--- /dev/null
+++ b/xen/include/asm-generic/softirq.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SOFTIRQ_H__
+#define __ASM_GENERIC_SOFTIRQ_H__
+
+#define NR_ARCH_SOFTIRQS       0
+
+#define arch_skip_send_event_check(cpu) 0
+
+#endif /* __ASM_GENERIC_SOFTIRQ_H__ */
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


