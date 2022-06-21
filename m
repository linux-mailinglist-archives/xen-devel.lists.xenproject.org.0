Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2D8553689
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 17:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353304.580234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3g32-0006jn-9I; Tue, 21 Jun 2022 15:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353304.580234; Tue, 21 Jun 2022 15:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3g32-0006hD-6I; Tue, 21 Jun 2022 15:44:12 +0000
Received: by outflank-mailman (input) for mailman id 353304;
 Tue, 21 Jun 2022 15:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIjP=W4=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o3g30-0006h7-LG
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 15:44:10 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fced05df-f178-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 17:44:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id es26so18233706edb.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jun 2022 08:44:08 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056402033000b0043564320274sm10090705edw.19.2022.06.21.08.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:44:07 -0700 (PDT)
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
X-Inumbo-ID: fced05df-f178-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IJxvF7GeSYmid6ScjNEEek498j+4eSxJj5t2L79Xl+E=;
        b=ERDoRgYzh09EpTuGJ4Ne37c9ffY1DEjgZeztSETgJYYKUoulwFd9Z7JDcruu7SVVih
         9nvRYg71b6+utykU4GKc4jm0O2fwA6juehVcWlb5INeg6R/jlUcqcG5JjTSlowPzYMSG
         a8J+vQzFYSF9fIA20U7Qyhn03CWC87lj3IqTNiIVxhOEfWQI7GQOdlmB86w/nL5eC7qp
         6FoDFotzt/uhu3v2sqxhBE1bsdE5Yiq26UyDJQ/2SNC+1izotfYHNzsZ1CUqiKv2BEMw
         dtanUBLCMkeAQxXHFmGRbd1sGF04G5Tk8e4OEo6VIrfrHIrGtFhoK/tiCxz6Lv+zUV73
         +Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IJxvF7GeSYmid6ScjNEEek498j+4eSxJj5t2L79Xl+E=;
        b=Db4XTeY5mIORWe/r1eVoCWNd8z3FXRDMWwnR89ZQSPvJVL5CXDqDlI+nQ3zQNYktu3
         8BIYWDMMOfVd/CeOcA9n3dxxlJ46uaPJMisGRv7EiJzHlw67UfxoTYGnrgFn9XVbvuYv
         VPRxoe808f7h1pPaCXMoDKy5GveyF66hX2sI5Jo+43C47To/i+/gNeG4dVmUCViZK8mL
         Vv5aUy7RoxziufJLAZzukCt5dvyPKn7XtMaCBXK7uKRTvU+l1hAJ5GW7QrDBmjyoF23q
         A5Cnfnm35EW+RcP+nTvMpz3EYPLdvGTWBfVjsx047u/UTFa10EPj3EQlksZxPF0z7NIz
         HnTQ==
X-Gm-Message-State: AJIora86C+zDwSxn8dxob3bA6IRsJVP3fsvm+pvIwkXvuRNaCegnmSJK
	evyGfJ4xvqGOXg1pgq1K7yUtBdxStDs=
X-Google-Smtp-Source: AGRyM1vHWdTBeZG1DoXCObuAEzsXuhhg6bJU+EOzlXvuq81EdRlC2Jo74IcX77tViHZm7kJ8kJJE/Q==
X-Received: by 2002:aa7:c881:0:b0:435:5dc4:5832 with SMTP id p1-20020aa7c881000000b004355dc45832mr28151980eds.265.1655826247808;
        Tue, 21 Jun 2022 08:44:07 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: vtimer: Fix MISRA C 2012 Rule 8.4 violation
Date: Tue, 21 Jun 2022 18:44:01 +0300
Message-Id: <20220621154402.482857-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include vtimer.h so that the declarations of vtimer functions with external
linkage are visible before the function definitions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/vtimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 5bb5970f58..5f26463354 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -29,6 +29,7 @@
 #include <asm/time.h>
 #include <asm/vgic.h>
 #include <asm/vreg.h>
+#include <asm/vtimer.h>
 #include <asm/regs.h>
 
 /*
-- 
2.34.1


