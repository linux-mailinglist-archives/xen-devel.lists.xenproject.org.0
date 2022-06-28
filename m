Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1F55E591
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357167.585669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cl4-0001mI-Tp; Tue, 28 Jun 2022 15:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357167.585669; Tue, 28 Jun 2022 15:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cl4-0001ie-Ne; Tue, 28 Jun 2022 15:04:06 +0000
Received: by outflank-mailman (input) for mailman id 357167;
 Tue, 28 Jun 2022 15:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6Cl3-0001MY-8x
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:04:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cce3726-f6f3-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 17:04:04 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id ej4so18004090edb.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 08:04:04 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020aa7c04e000000b00431962fe5d4sm9785589edo.77.2022.06.28.08.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:04:03 -0700 (PDT)
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
X-Inumbo-ID: 8cce3726-f6f3-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UuYWZQeJKj9O8pOqNcM3ZHmqzZL57A1GnfhK3BOWViQ=;
        b=o2fhUTpFrFf8bN2Q/dR0BNHDWBLCS+GUjUsmVjNwYaSe/T3V2odWsrmzOXQ8O+MWRU
         LzJ6tUofAyJKvfIGGy+JJQQj6dpIUPVft9G8d4y61n0xhcMhGjOm0A6iCKclihdjUChf
         XJajD1692yuJMow1b8wQ8EdNeFf8LZT6wpf00PTkYbn4paD0NSR3z4r9XOKVE+hvQH0s
         VoVWohf+GPYCTlX1/+8ezTIBk/NopRT2Jr+BxbbLj4m51+KP9o00kas5B2SNH3rlVql7
         t62EwCWmQCJ8iSltqFRFY8tYiSw8aEVWogOwq/2U7elDKoAD7PNmI0dkyirBTJYX/reA
         mdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UuYWZQeJKj9O8pOqNcM3ZHmqzZL57A1GnfhK3BOWViQ=;
        b=1CdEdASIFH10cykdfqM2vfuV7THIrbGyhyQvPx7oKL4oFcMAETbl8GtmEHBaI/kAyJ
         bE24LtO74kfaKRFFZrP31jdqjCLxc5OqSK9XB12E7vLG+4j8SzXdrNzIPWhpTuoJPshU
         2JquMYSlRG1YyB1fX4loRDHX1YXaErIxLFa+smWzMBDFIdvYQWhrJ0+H6VZ/PCRaBSwQ
         wsLEsKpMzQMI4UkzlhZH/qJqddKiWIszA7uzNHgQ8Ky7q7cWeYBvt10o9bTnZaouePAV
         C3ua67zy+jT/noYPkcdYfU2NWqkjHAqwGjQSmDl9CYA1A99luA8vCE4evEuH3f9nFgWp
         /DEA==
X-Gm-Message-State: AJIora/y8LCM1IMUzWhB0mhraRfbZBwkmI+Zr9gfjPTSTo85OfAUtQXK
	9013h8X+xnKF1E5LTKb3qkefyd4xyBg=
X-Google-Smtp-Source: AGRyM1uBUIqLV8SKYrgSLRFmpLFMEyzHqGF+QMDoPC2VSVa/9V/6McvCD0l3L0wWzy8JRya7KmaXNQ==
X-Received: by 2002:a05:6402:414c:b0:435:1e2a:2c7f with SMTP id x12-20020a056402414c00b004351e2a2c7fmr23926753eda.132.1656428643870;
        Tue, 28 Jun 2022 08:04:03 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 5/5] xen/arm64: traps: Fix MISRA C 2012 Rule 8.4 violations
Date: Tue, 28 Jun 2022 18:03:37 +0300
Message-Id: <20220628150337.8520-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628150337.8520-1-burzalodowa@gmail.com>
References: <20220628150337.8520-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function prototype for do_bad_mode() in <asm/arm64/traps.h> and include
header <asm/traps.h> in traps.c, so that the declarations of the functions
do_bad_mode() and finalize_instr_emulation(), which have external linkage,
are visible before the function definitions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- none

 xen/arch/arm/arm64/traps.c             | 1 +
 xen/arch/arm/include/asm/arm64/traps.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
index 3f8858acec..a995ad7c2c 100644
--- a/xen/arch/arm/arm64/traps.c
+++ b/xen/arch/arm/arm64/traps.c
@@ -22,6 +22,7 @@
 #include <asm/hsr.h>
 #include <asm/system.h>
 #include <asm/processor.h>
+#include <asm/traps.h>
 
 #include <public/xen.h>
 
diff --git a/xen/arch/arm/include/asm/arm64/traps.h b/xen/arch/arm/include/asm/arm64/traps.h
index 2379b578cb..a347cb13d6 100644
--- a/xen/arch/arm/include/asm/arm64/traps.h
+++ b/xen/arch/arm/include/asm/arm64/traps.h
@@ -6,6 +6,8 @@ void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len);
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr);
 
+void do_bad_mode(struct cpu_user_regs *regs, int reason);
+
 #endif /* __ASM_ARM64_TRAPS__ */
 /*
  * Local variables:
-- 
2.34.1


