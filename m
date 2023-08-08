Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA53773A57
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579803.907958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMNC-0006ES-It; Tue, 08 Aug 2023 13:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579803.907958; Tue, 08 Aug 2023 13:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMNC-0006BY-Ec; Tue, 08 Aug 2023 13:03:42 +0000
Received: by outflank-mailman (input) for mailman id 579803;
 Tue, 08 Aug 2023 13:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMNB-0003KL-EK
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:03:41 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff15ba11-35eb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:03:41 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3179ed1dfbbso4856344f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:03:40 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b003179b3fd837sm13699587wrm.33.2023.08.08.06.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:03:38 -0700 (PDT)
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
X-Inumbo-ID: ff15ba11-35eb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499820; x=1692104620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaUnmMyQzDhGHHuFVEoa7z0wlHrRhTGB1FTCEPFAUdE=;
        b=gZ8xL6bwBxFzJByOAln36wXNPZouGdnItFdcjErxU7T8URfC6pdPKuOWRETdwBl7SX
         5dSGLgtKA4Obpgvqi7CUGW57RKP02v7ZzRT/wOOv4aQTclSm0PkvHpXWKVyDxSpJpiYU
         dDU6fEF49KXKEvE9QkgxJxf6QzHlacyMGbE/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499820; x=1692104620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaUnmMyQzDhGHHuFVEoa7z0wlHrRhTGB1FTCEPFAUdE=;
        b=iBDpFvn8nDlyrxxZ0tM0P5F/4pTZZHJ+NCzGv7SsqDOTKMoxWEy/qF5KJGwJxhPFNW
         WWS9upVmpwAwLo6rhi1ixG0IaUbHuRYRbxsn+mMtsJ1Do2dq4079181fyAz+UpoATBKa
         HlVPJIh3OvkTWzkH6UD1CdUOQQPa0WBh2msdm2UmBANnlcD0MVGMBFBJ4zZO+SPe9hTp
         iwEtMegJ6e6SyEULW0qmvVZOkYmGkADLGQ87KGRxz3fh5l0eC/VAGEyJ9rr7WR7dX5We
         Y7VlCHvj4Y+4NtQY42Dt0fgbNbjY6gPJEPn9q6AMweRDcYiKL6DUKzLXapfF7VF4K2k5
         jw/A==
X-Gm-Message-State: AOJu0YyIRuV5Ay43AxiV9nPOd5SpfTKWTZ5lhHQOLbamYQmq70I4v5Xu
	uQ379hR5NHrXZ+hqS3CA/2MIEJAaJzyL67sPsC4=
X-Google-Smtp-Source: AGHT+IEYDGSkpMaqWcQxT/ufTuQ3pPRFdEjSmZM59zxeeh9HwU47uTo5ykj5hPRSkOhQ+CiG94Ay4Q==
X-Received: by 2002:a5d:5346:0:b0:317:5a9b:fcec with SMTP id t6-20020a5d5346000000b003175a9bfcecmr9185739wrv.14.1691499819257;
        Tue, 08 Aug 2023 06:03:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 1/3] x86/microcode: Ignore microcode loading interface for revision = -1
Date: Tue,  8 Aug 2023 14:03:29 +0100
Message-Id: <20230808130331.27995-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
References: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors report ~0 as the microcode revision to mean "don't issue
microcode updates". Ignore the microcode loading interface in that case.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
  * Removed R-by tag. It wasn't meant to be there!
  * Fix wrong substring inserted in printk statement
  * Returned the printk severity to WARNING

I still think both this new print and the previous one in the function
should have severity INFO instead, but I'm not bothered either way and they
should both have the same severity because they highlight equivalent events.
---
 xen/arch/x86/cpu/microcode/core.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index bec8b55db2..205bb52201 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
-
     ucode_ops.collect_cpu_info();
 
+    /*
+     * Some hypervisors deliberately report a microcode revision of -1 to
+     * mean that they will not accept microcode updates. We take the hint
+     * and ignore the microcode interface in that case.
+     */
+    if ( this_cpu(cpu_sig).rev == ~0 )
+    {
+        printk(XENLOG_WARNING "Microcode loading disabled due to: %s",
+                              "rev = ~0");
+        ucode_ops.apply_microcode = NULL;
+        return -ENODEV;
+    }
+
+    microcode_grab_module(module_map, mbi);
+
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
-- 
2.34.1


