Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEFE3802B6
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 06:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127183.238973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPGr-0001iE-Cf; Fri, 14 May 2021 04:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127183.238973; Fri, 14 May 2021 04:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPGr-0001fZ-8H; Fri, 14 May 2021 04:17:53 +0000
Received: by outflank-mailman (input) for mailman id 127183;
 Fri, 14 May 2021 04:17:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhPGp-0001OI-Op
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 04:17:51 +0000
Received: from mail-io1-xd29.google.com (unknown [2607:f8b0:4864:20::d29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c813b84c-7565-4142-b8fb-a43f6111bbcd;
 Fri, 14 May 2021 04:17:50 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id k25so27007385iob.6
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 21:17:50 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g11sm2401505ilq.38.2021.05.13.21.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 21:17:50 -0700 (PDT)
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
X-Inumbo-ID: c813b84c-7565-4142-b8fb-a43f6111bbcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ZyiRnb9WVtOr1miy5zSjmis6+BOGxMggG62SA/umH8=;
        b=i6FKJqyF+Xk2tmcAcez6cPGV1ZKusR7+pKqGgdrNuN/FC+2v7cCt5bFEqQ2EfuThrD
         PXm03/YcOGFz+mwYopL+G/eosrSt/G2XEyle8jqxGQZjqJNWaKAB8dmf12XKNeRaTG2s
         ejOAujxyN7QxxbyfIdE7QzGmbYjJxNSdS7ugo2efj/UA+cTFG/kI+GJO11d74vN2NUr1
         /GWxzmtvsHeUVf7dOLSvAVkdR49ml/P3JXMyQ1VatKyfBQzh/niQmjVmNDgekzxSVe2V
         27LbGjxdGsTF/2edXaHKXc5PzdP8OrDwKxx9Gbw6UUnpdEBO49NGUfa59ZTeWl1Oxhnt
         Kckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZyiRnb9WVtOr1miy5zSjmis6+BOGxMggG62SA/umH8=;
        b=sOL/lGVyLEbOM8TZhDSS3Ucxx4VWHPPJb4iz3WzN5YvqJPsKj2Ldr43pPjTSu3w9tF
         mLpK0BK5QnkmX7x6ciuyeh6MKMWiX51+Mnx7AlQNKNC6hUpokJwLAuQXgKRWSZdt5l+H
         VGLyZ5CoAcOHa/2KhOJyc/ICXcAkN0EVd+x4SaNwx22/8viFyuGj28MaQQvL1NMqlazF
         sDchluqwFa7uFzF/BwJnRLEf4zQBT1Tb4Hdo71iKuSRv5ofN9FOqjCUMZA9QKxneazvY
         KgusoHx/zar9mFdtJHR5fvRQV+hal+JhuaO5xpjsHtxQhxX5iTG8wC93vKjzsg1PzpCL
         NblQ==
X-Gm-Message-State: AOAM530sneCnoVb5Yrnz9U1TijAzjHOgz95j6ZwQdVZ1Jo9LbTS8PXZV
	2FhyW+f8VWGqQV5xgFgpsNuW3nDjrjr9Bg==
X-Google-Smtp-Source: ABdhPJwIwS9f6N+lPyctzv8VNftZHmfOX9YZFwfBjbfRWb8nYN+en2Qog6o0n8Ilno+SY0bp9slkcg==
X-Received: by 2002:a05:6638:3ab:: with SMTP id z11mr41058043jap.58.1620965870246;
        Thu, 13 May 2021 21:17:50 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/5] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Thu, 13 May 2021 22:17:08 -0600
Message-Id: <3960a676376e0163d97ac02f968966cdfaccbf75.1620965208.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620965208.git.connojdavis@gmail.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/drivers/char/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..b15b0c8d6a 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,6 +1,6 @@
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
-	default y
+	default y if (ARM || X86)
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
 
-- 
2.31.1


