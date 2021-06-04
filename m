Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78739B03F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 04:14:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136642.253270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lozLp-0004iO-Ve; Fri, 04 Jun 2021 02:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136642.253270; Fri, 04 Jun 2021 02:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lozLp-0004fc-S5; Fri, 04 Jun 2021 02:14:21 +0000
Received: by outflank-mailman (input) for mailman id 136642;
 Fri, 04 Jun 2021 02:14:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjsn=K6=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lozLp-0004Ox-2S
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 02:14:21 +0000
Received: from mail-oi1-x22c.google.com (unknown [2607:f8b0:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b1117d1-b2ad-41e4-a745-4a9a6f0f6384;
 Fri, 04 Jun 2021 02:14:17 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v22so8342820oic.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 19:14:16 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id a18sm179903oiy.24.2021.06.03.19.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 19:14:16 -0700 (PDT)
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
X-Inumbo-ID: 4b1117d1-b2ad-41e4-a745-4a9a6f0f6384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZbDVJKRN1h+8ugXIRuULkaSTcePO99uJiv3nqLXkYks=;
        b=mzd0yWht+bBXQ7vxyzqrmz0JSyMelxK5Wto0CHXFj8OXkamJOfCe6oXUy+EwCVeoPT
         VXm/5JWiHGNbOdyeAKNerGspye0XF3fzYD31uaOVdEFKUay+yJMqSleDMl6kJKczJL04
         g8DJ8W4rQbF4qsT/rDwNVskkrRSZltY5Ok1LOXJIYkbR3o4EmFAJwXtcdYb6Xbx2O6tf
         On6/8sQpZqN9Inec651Ni/JLMtixsZDDqtOBi49sNty+Kc7CnYlfnec7unuYj5uAWNJZ
         cAVTJuZfRDlL6HUTiOjihJBtn4MBOJ+bOU9YFaeEIHWzhR9GWUWb6PRHOoiaOWhhrEeW
         cOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbDVJKRN1h+8ugXIRuULkaSTcePO99uJiv3nqLXkYks=;
        b=SX2VlmcZyult84FDjI23tZHyoewAWb5ePvfckoiRj8jaYvyeqb8f7jFFZ/6rbEtpwd
         cT7jBY+dr+5uXrMjCM6y/5hVWQlgmK/hnOt6W1GN4ExtTaU6oUGx+ISQm2ohHrtuQfy7
         e/90RCFrRrvzP4vxflJpjf1+0K6S5shPDfXfHOVEkc5m5Nj1MsH3EYIxxjk+zbOu0P3m
         ulsiv4in4FyN1Hd9APHoWsRM85EuJKk+b1TlP8Lfa99KcxtVo/8fcXwcHsWfB8dlB3Jo
         8Ro7lGpobWA3KwF0WYhF0/KqqGAHV+VNULPJ/fLbtw3baKSybHiIBOjeEq0so4bBVZz2
         Y0Lg==
X-Gm-Message-State: AOAM530P280+t+UqeSHsSLacboAZ6BMNomSIIQp9MSYDU2cTbPQQpPGz
	WFPseLlDFSaCpGLrCt8HvVcTIHl07dNdng==
X-Google-Smtp-Source: ABdhPJz7PVplV54Nb4viAJbz2T54+ZJyAw/+03cBpvvFxv1RRXdQScjyLp6tEaVgze13BYednDvf+Q==
X-Received: by 2002:aca:220b:: with SMTP id b11mr9359038oic.89.1622772856520;
        Thu, 03 Jun 2021 19:14:16 -0700 (PDT)
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
	Wei Liu <wl@xen.org>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 1/2] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Thu,  3 Jun 2021 20:14:04 -0600
Message-Id: <3886e351e8333f68462b0d2f9ecb1e243cb8b9ec.1622772299.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622772299.git.connojdavis@gmail.com>
References: <cover.1622772299.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


