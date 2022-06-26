Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BC55B422
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 23:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356140.584225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXw-0004Uc-Np; Sun, 26 Jun 2022 21:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356140.584225; Sun, 26 Jun 2022 21:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXw-0004QA-Jr; Sun, 26 Jun 2022 21:11:56 +0000
Received: by outflank-mailman (input) for mailman id 356140;
 Sun, 26 Jun 2022 21:11:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5ZXv-0002ze-Ou
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 21:11:55 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b18f4a4-f594-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 23:11:55 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id g26so15156220ejb.5
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 14:11:54 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 cq12-20020a056402220c00b004356b8ad003sm6367556edb.60.2022.06.26.14.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 14:11:54 -0700 (PDT)
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
X-Inumbo-ID: 9b18f4a4-f594-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zO50M0sKicPYbO3MfGNjKmAChEFlsCUJ3Pd09z6d3B8=;
        b=gt44c+Q2MGza2lsgnlUfudnqddhWLluw63hNoC7ABVuhmNz+eMsZ/igzq4PPys7uAt
         0KLpejzAQI1lgnQKGtTswVKzrEUzVLuSh6VVt13Wsw/Q0HIZ/SmXU5tOC09097ga1xGo
         9no9l3d/Yv+YQhM7Q7up8Flsvewa5RTsBERnSMvrIU6ILBrbFBJUo3HGTObRbMqCnSxQ
         4dn0sEkDSl28qqj2kdZqdmR7VPPtKUDy7EqykAndJvZ1u/1iS6f7Jf2ax0ZMmlF5BiFn
         ZXv38QdzmItBDLpCPS8t4Di+xSmb/8UClkgMJT+OaVI79nH7gdGXfAXG0nEhhW+jjxAm
         SbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zO50M0sKicPYbO3MfGNjKmAChEFlsCUJ3Pd09z6d3B8=;
        b=yIIc0dyclkGiyflFSqp7/pLtx3tNplULoJUQS2jh7Ok19f6k5dMPIwVo6R9oE+of4u
         4X7V53eX/Nw+1JnsQ2m2sDV7RRbfMyALg0WuJNSWmPQOEdrSSeziPhYccw6XlFilBvSA
         8rIrxMAfBI2oXpOchrf2ovctoUmvq3vG03KKR7wgHqnTlLvuvPak+GbbO2KlsnVT3men
         2MTixMb5aYcjLa2lrl27FYE0JMwTecmrCC3ZYEqFRi4r1Eyt+voMbFm8Sf8Il5HhSxJ1
         3PHIkJYVsRPI1uxlYK3GccKLtquTbfbOG4uke/fi+f1kUdhfKeGd6jBd99NV6RwS3Lw3
         eO1Q==
X-Gm-Message-State: AJIora/6JQaUXm+kNX4QpKgsdprR1oAiO9ZX2WeHgU1ftiPiI2Y/Wvcu
	WszIat4Qsim9ns0pGs3mMQLYYCxd3DE=
X-Google-Smtp-Source: AGRyM1sjgtHzgRZhQw1AoPrP9Py9kuXuomYrtZtw3vkLr3eTO0+YKeIo3PRd3Ing0GNcgtRcEXxhFg==
X-Received: by 2002:a17:907:3e18:b0:722:be7e:302c with SMTP id hp24-20020a1709073e1800b00722be7e302cmr9590234ejc.437.1656277914377;
        Sun, 26 Jun 2022 14:11:54 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/5] xen/arm64: traps: Fix MISRA C 2012 Rule 8.4 violations
Date: Mon, 27 Jun 2022 00:11:31 +0300
Message-Id: <20220626211131.678995-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626211131.678995-1-burzalodowa@gmail.com>
References: <20220626211131.678995-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function prototype for do_bad_mode() in <asm/arm64/traps.h> and include
header <asm/traps.h> in traps.c, so that the declarations of the functions
do_bad_mode() and finalize_instr_emulation(), which have external linkage,
are visible before the function definitions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
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


