Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C29731D03
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549715.858404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDG-0006Tv-Mq; Thu, 15 Jun 2023 15:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549715.858404; Thu, 15 Jun 2023 15:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDG-0006Rj-JF; Thu, 15 Jun 2023 15:48:42 +0000
Received: by outflank-mailman (input) for mailman id 549715;
 Thu, 15 Jun 2023 15:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9pDE-0006RS-Kd
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:48:40 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18e765e1-0b94-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 17:48:39 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f7fcdc7f7fso7359415e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:48:39 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b0030497b3224bsm21374699wry.64.2023.06.15.08.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:48:38 -0700 (PDT)
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
X-Inumbo-ID: 18e765e1-0b94-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686844119; x=1689436119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhal1etJcoQVv2Xj28gXUSWBqPiytpkGg3ZC25OkTWA=;
        b=CJKdztpwLwg32RhJ+fc1jM+0mM9Fs37dYwmugnDGjfuYVNyiVEjIn6s/GpP6t1BWuz
         I4n7Ve2H+GU1HlVDbkcd7/8KgNRpkYRuN7ZvUOqDeMW0DGTc2jOhnO69XwGF+g6SpSpu
         LrLDwGG1DB+o49pWoHInDSRqHyhdfexDUOj7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844119; x=1689436119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhal1etJcoQVv2Xj28gXUSWBqPiytpkGg3ZC25OkTWA=;
        b=TmYzwuLiPq4qF60dlx2kjgX3zCG4/yVvgr4Oe24aWcW830Sn8NGbhI+O4u3X2rg3wg
         aRsihOMPTsPjlc8Cdh9pCRKrKkwnKiHuj/cXuOn3UtNyzCPBirJ9uJJWWJFofY1Xux2r
         J0+eHphD8vmYblzRKkody8qnLLTKSWgXO6RCbNpRUpIyI9nLG03fTYph13HOGo+DsZa+
         QekI8vi6v6vMVzSwS0eETjQ6jiOHgQkK8h9PavXcY5PQqqUozOLE7xVuU5ct+Vm2iXqd
         iSjRvkt+0joDUwiqxd9n1DzXPHBa2KBLBXMNympYHOA/2dLErBrhLxfDKBAzYUrF40fb
         ly3g==
X-Gm-Message-State: AC+VfDxMkHB9boxkFJYVDW5wrf8bkWjsHsOnAYN0KSxDhDxQigoct0DR
	7w9LdsWY0jD+X2+zUiD5DgU9Okn9qLMLKgtdOYU=
X-Google-Smtp-Source: ACHHUZ5pk6DdQICbIzSsGjHZ33b6KNwddueizS4fOfbWOZhYaSWZLU0xq3PVlUBAFWdH0aoj2vDItg==
X-Received: by 2002:a5d:4687:0:b0:30f:ba3a:85c5 with SMTP id u7-20020a5d4687000000b0030fba3a85c5mr4532927wrq.25.1686844119084;
        Thu, 15 Jun 2023 08:48:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/5] x86/microcode: Allow reading microcode revision even if it can't be updated
Date: Thu, 15 Jun 2023 16:48:30 +0100
Message-Id: <20230615154834.959-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615154834.959-1-alejandro.vallejo@cloud.com>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code currently assumes all microcode handlers are set or none are. That
won't be the case in a future patch, as apply_microcode() may not be set
while the others are. Hence, this patch allows reading the microcode
revision even if updating it is unavailable.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Hunks taken from v2/patch4 (Jan)
---
 xen/arch/x86/cpu/microcode/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e65af4b82e..df7e1df870 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -750,11 +750,12 @@ __initcall(microcode_init);
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
+    if ( ucode_ops.collect_cpu_info )
+        alternative_vcall(ucode_ops.collect_cpu_info);
+
     if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
     return microcode_update_cpu(NULL);
 }
 
@@ -860,6 +861,9 @@ int __init early_microcode_init(unsigned long *module_map,
         break;
     }
 
+    if ( ucode_ops.collect_cpu_info )
+        ucode_ops.collect_cpu_info();
+
     if ( !ucode_ops.apply_microcode )
     {
         printk(XENLOG_WARNING "Microcode loading not available\n");
@@ -868,8 +872,6 @@ int __init early_microcode_init(unsigned long *module_map,
 
     microcode_grab_module(module_map, mbi);
 
-    ucode_ops.collect_cpu_info();
-
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
-- 
2.34.1


