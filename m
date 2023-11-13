Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1287E9FE8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631718.985355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yot-0004aF-N8; Mon, 13 Nov 2023 15:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631718.985355; Mon, 13 Nov 2023 15:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yot-0004YC-JZ; Mon, 13 Nov 2023 15:25:47 +0000
Received: by outflank-mailman (input) for mailman id 631718;
 Mon, 13 Nov 2023 15:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2YlM-0005il-6J
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:22:08 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68683716-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:22:07 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50970c2115eso6303489e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:22:07 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090640c900b009e5ce1acb01sm4126763ejk.103.2023.11.13.07.22.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:22:07 -0800 (PST)
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
X-Inumbo-ID: 68683716-8238-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888927; x=1700493727; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3IanRET4oRDB/554uZaBMmk8ZcCL79rxTcGgU2jVuI=;
        b=ZTojBGG/LuJFgNd0mzP79FlXicHw+nRG3h6jnjxWZHHQ1gRhZU3dkRqTB+i/RBIgKJ
         Vx15YHRarcOMXwvTzH7KKKIhoGvXxJPN5Q9uJ7mGgQDKN32PGj+oNbTkpv8IoTNfoXCn
         bZNiWLNH35vF4xZeuR2BN5c2fhYYQQ7eTvgDd53foIHn7Z59l4ynOvK+jLw88FL1ri9h
         BXlvEsY9rCaiLovsdOgSnqsfheo5nVOzYXYCciKhw8jq2Jkj7vufiDb1G17rWJO5oLO8
         6SMCfybjEivY1eXKTHHX/iRph643RocV81NeUVtMrDjxAFUBOrbSjZ4kqL7L9QGSU6IH
         C+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888927; x=1700493727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3IanRET4oRDB/554uZaBMmk8ZcCL79rxTcGgU2jVuI=;
        b=Zk8sG/BYKMSMtvMQP44Vp7vyF25vdUOIYXf6y2BN/sLdkIiO3pcg8pYcUe9pxiz89O
         ciFdOHphiPsteAMw8VYbBAmY951pLrNqLDMCuxGE3NH9DXc2Lw/+qb6aZGrIbT1HlKN5
         sjeKS/abfTtIJOcR1wkhUBEFy1zRfye9Qx4qEXlFBYKh/RNdHVfWDMBOhPDRG5AljJb7
         2ID6/eIMt/z28bM8zsvEXdJIr2eF8DN7XEDPAU1p9Vn8PCNdVQnj0nSDgFofWNXeFu/m
         TarH/me/YyTCfxyqGnjdMW5bMuVLhW3MEy8uAg6KBg4LgPDnlXXtY96cpJms2JIbimGo
         PPBQ==
X-Gm-Message-State: AOJu0YwrzOMQzcBsuwRD5r7MKW6LuweoXIXnKShSgwLHOa4yxluaT49y
	GrtKMJUBH+TxRMTZKp6yVE7QSw==
X-Google-Smtp-Source: AGHT+IGrSDy3wD9q51MX9RzmoZqMhawPjp2jB+lPSAfi/Dv8LmkQCpZSU6Ww+isXzJecNCmpib4vPw==
X-Received: by 2002:ac2:5e6f:0:b0:502:a4f4:ced9 with SMTP id a15-20020ac25e6f000000b00502a4f4ced9mr4406770lfr.62.1699888927362;
        Mon, 13 Nov 2023 07:22:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH-for-9.0 08/10] system/physmem: Only include 'hw/xen/xen.h' when Xen is available
Date: Mon, 13 Nov 2023 16:21:11 +0100
Message-ID: <20231113152114.47916-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"hw/xen/xen.h" contains declarations for Xen hardware. There is
no point including it when Xen is not available. When Xen is not
available, we have enough with declarations of "sysemu/xen.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/system/physmem.c b/system/physmem.c
index fc2b0fee01..fa667437da 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -35,9 +35,9 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
-#include "hw/xen/xen.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
+#include "sysemu/xen.h"
 #include "sysemu/qtest.h"
 #include "qemu/timer.h"
 #include "qemu/config-file.h"
@@ -51,6 +51,9 @@
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/xen-mapcache.h"
+#ifdef CONFIG_XEN
+#include "hw/xen/xen.h"
+#endif
 #include "trace/trace-root.h"
 
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
-- 
2.41.0


