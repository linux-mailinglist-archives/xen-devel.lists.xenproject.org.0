Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA24722D56
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 19:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543818.849115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgx-00024m-6y; Mon, 05 Jun 2023 17:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543818.849115; Mon, 05 Jun 2023 17:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Dgx-0001vQ-15; Mon, 05 Jun 2023 17:08:27 +0000
Received: by outflank-mailman (input) for mailman id 543818;
 Mon, 05 Jun 2023 17:08:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNO+=BZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q6Dgv-0001hK-Jj
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 17:08:25 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 945e8a35-03c3-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 19:08:23 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f70fc4682aso44516565e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 10:08:23 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0030c4d8930b1sm10247405wru.91.2023.06.05.10.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 10:08:22 -0700 (PDT)
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
X-Inumbo-ID: 945e8a35-03c3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685984903; x=1688576903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ0i8Te1opYVMDeoQr+YKauj4QQYILajO6V4WWhluDI=;
        b=AijknLkAw44KoXyWtWTqPOsvWTUeCgC7yDC7DbCsgHQz9BlJiEr2hVaVzvBy+qe9lT
         ek7JourSTY0vpLo85i752gOXghl8nqswKcR/qGpevLS0eZQTBa/74cnskV6I7fedT9AV
         cQE4lWvvgxUeUiccmC+gwbp9pU6KZmj+sWCW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685984903; x=1688576903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ0i8Te1opYVMDeoQr+YKauj4QQYILajO6V4WWhluDI=;
        b=Y0rtgHgRvtjQHOH67jETDM75LZzirLygIWmhNNzc6qqSSreOP1H8/vfRhL8EKtk2e2
         vNZP7V2Uf6jRAUxgp9JEu0vfBCN/7rbDvIyUdj3vxvlLshSpwYKuRACEn7w3W72v4a/v
         4CzJp3k4PEJFucUy2AVtpyTm82AMVcE4r7TVS3Nx0bRSfgZmZncyGmuSL3M2vsMh05l8
         NHARJTi2Xn1dKvnj+qmAPZ0YcqHJi0/lZv4PCwuOAgFAGRtHA8O9tRl3/Vr9fhqwy6TO
         Y9qCelwJ5KACCv0H0F8XOa5j1umkGJI1OAICMZUTTEmrtLa93fkvinfN4TVTRQ3YLFPh
         guUg==
X-Gm-Message-State: AC+VfDwk1z1sA/PFKNaUUtZ+ucghM5QhFubY5r3gtjIxeFOwOELszTcJ
	ujC1P0DZ4fYFs5kkCCTRonDwl8engt+jXzLhPQ0=
X-Google-Smtp-Source: ACHHUZ7u1sk2+R+asIIG0fkfef+a11cKVB0k6wJX3/SpkDo/ZSUS+7nRmWIapgoPCzcCH2bOcbZjgA==
X-Received: by 2002:a05:600c:282:b0:3f7:3526:d96f with SMTP id 2-20020a05600c028200b003f73526d96fmr4020879wmk.27.1685984903394;
        Mon, 05 Jun 2023 10:08:23 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/4] x86/microcode: Ignore microcode loading interface for revision = -1
Date: Mon,  5 Jun 2023 18:08:16 +0100
Message-Id: <20230605170817.9913-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors report ~0 as the microcode revision to mean "don't issue
microcode updates". Ignore the microcode loading interface in that case.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * New addition
---
 xen/arch/x86/cpu/microcode/core.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 892bcec901..4f60d96d98 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -874,6 +874,21 @@ int __init early_microcode_init(unsigned long *module_map,
         break;
     }
 
+    if ( ucode_ops.collect_cpu_info )
+        ucode_ops.collect_cpu_info();
+
+    /*
+     * This is a special case for virtualized Xen. Some hypervisors
+     * deliberately report a microcode revision of -1 to mean that they
+     * will not accept microcode updates. We take the hint and ignore the
+     * microcode interface in that case.
+     */
+    if ( this_cpu(cpu_sig).rev == ~0 )
+    {
+        this_cpu(cpu_sig) = (struct cpu_signature){ 0 };
+        ucode_ops = (struct microcode_ops){ 0 };
+    }
+
     if ( !ucode_ops.apply_microcode )
     {
         printk(XENLOG_WARNING "Microcode loading not available\n");
@@ -882,8 +897,6 @@ int __init early_microcode_init(unsigned long *module_map,
 
     microcode_grab_module(module_map, mbi);
 
-    ucode_ops.collect_cpu_info();
-
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
-- 
2.34.1


