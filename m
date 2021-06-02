Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D180399649
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 01:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136250.252710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaAU-0002Sh-Iw; Wed, 02 Jun 2021 23:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136250.252710; Wed, 02 Jun 2021 23:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaAU-0002Qf-FX; Wed, 02 Jun 2021 23:20:58 +0000
Received: by outflank-mailman (input) for mailman id 136250;
 Wed, 02 Jun 2021 23:20:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loaAT-00029h-21
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 23:20:57 +0000
Received: from mail-ot1-x332.google.com (unknown [2607:f8b0:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de30167b-aaaf-48cc-8052-2ad81dfe9267;
 Wed, 02 Jun 2021 23:20:54 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso4014343otu.10
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 16:20:54 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id h7sm306175oib.49.2021.06.02.16.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 16:20:53 -0700 (PDT)
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
X-Inumbo-ID: de30167b-aaaf-48cc-8052-2ad81dfe9267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XGumMjGtg94IhtORkgOv43FTexceLATJry4J5HfIX+U=;
        b=GJUKuWulbkk8SiS+7y0Ky1aZjFcBJhMGZhbVX0fOShDv4f/+h8ysaXfiB2J6V6FK/5
         i8Rr74urSUQYipKjCAPone16N6EfHWJcTHx1bIWW8Q8jP8Ki2osR6fI+vPFHXpILT42V
         z9l3rHbAEYdPSvt0VC/TKvFA9Uq5kAgzxKO9mYZ+IGoaeqCLoHMes96tSD9/va3MN1iR
         LtO9FyrU2SozQvgzNLk55wr6cULy8QYbrBaoBUqKmWYqK91VVmQmeiNrPmBr173nKZiN
         pVlomKcGqqjx7ZfL+U6wa8G6b+jUeEqdyNiDONT24imy2TBMm8GrOvTUZ28IoRhVK4V2
         goog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XGumMjGtg94IhtORkgOv43FTexceLATJry4J5HfIX+U=;
        b=i8I+tUNyQsptqLBF/OnvTxZZEDIsJbZncgL7QgB8B1XMwvnTWC32UEg1DnKJppN+hy
         PbOXRftYF0zfJUkmCLjW2JTka8bx1GTqtSXH0Fb6fru2LbwJvobutVTUvtdMjPC/j25+
         Oyrkz7ubOTCVkFbqagChqHRVALe48xx54pUrCQ+lGz6Q/qwQOrNYw+2oWJdQSPxYg+jU
         OZY3kObl2xiW+a+VKNpIaiCXX2jUAnP2QNTXlKuWQqgwOpGvxYbfhPCqs/3c5hpqwwcC
         WkiTC3T+TpjiRkPABlY3DfnS/k7CIqgGP5T89XhtJs2j5LEIqL6GTPMTlz8amoD9MOSx
         xIkw==
X-Gm-Message-State: AOAM530+KT+T2JPPvGpqCox8YFvy/FZ5cu8iUBGu+xK0SyM+Z3rVgJE6
	4k7rlYRaU5+cACbxYcccxlYJXzMNHxAx+A==
X-Google-Smtp-Source: ABdhPJzkjPITBzNC90Mrf5dLPcyf/H6/h4Eur+atA8GPWeyJqE0uLWrj/FCfRNDEiW/2Noi/J9FIwg==
X-Received: by 2002:a9d:1ec6:: with SMTP id n64mr28337289otn.3.1622676053680;
        Wed, 02 Jun 2021 16:20:53 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 1/2] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Wed,  2 Jun 2021 17:20:44 -0600
Message-Id: <d2d19b62bd2a570db97f2940e6152bf93dc01632.1622675569.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622675569.git.connojdavis@gmail.com>
References: <cover.1622675569.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/char/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..2ff5b288e2 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,5 +1,6 @@
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
+	default n if RISCV
 	default y
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
-- 
2.31.1


