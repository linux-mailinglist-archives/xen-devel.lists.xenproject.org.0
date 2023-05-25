Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86DE710F8F
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539713.840888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtG-0007pn-LR; Thu, 25 May 2023 15:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539713.840888; Thu, 25 May 2023 15:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtG-0007hu-G6; Thu, 25 May 2023 15:28:34 +0000
Received: by outflank-mailman (input) for mailman id 539713;
 Thu, 25 May 2023 15:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/QV=BO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q2CtF-0007Iw-5E
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:28:33 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cedc8939-fb10-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 17:28:32 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f3b9c88af8so2696988e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 08:28:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d22-20020ac244d6000000b004f37c0dfcaasm246853lfm.118.2023.05.25.08.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:28:31 -0700 (PDT)
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
X-Inumbo-ID: cedc8939-fb10-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685028512; x=1687620512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwG3AnwYJS+DU9adWejunsOd8v1f8pd4XLzBxkGPaG4=;
        b=JTWkfkif1+qceBtUUaP1P/LT30dp7yhQ3qOblax897UX2yC+BmvpW6wNmjSCGlp1qk
         /wXutc/LMGl4dT6C1hhw6NtyeFs13K/s9Ou8ANw1LtRDwbTaZPNqXoRYfvU2rkyVE7iU
         m45hSv4+/7vWMIt7Ii7ktR1uxVGa64Q5G/GNSxSAeDxev2O+LC+mdaLUnqIozp3LM49Z
         qrD1QZl36yGaFJtwdNOccgzQGJbzQAJA1fWminzaWPrNJCWvAsrSG3E6Blg+PLr5sYCo
         RUxQscAG1Uk2kRqQ080R/w9BhO6+neeG0jt6dPwvW/Gndi907CumessFZFuDxEhOOVDS
         jefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685028512; x=1687620512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwG3AnwYJS+DU9adWejunsOd8v1f8pd4XLzBxkGPaG4=;
        b=gM45+YUxtUdp6kUGXKmPaATn13FQ/i51j5mR+8sYMmDH9HrRBrCPoqgjB/ika3ba5C
         7KPM83PsKBCow+3rScw3zDo61oafPAfXbSlfobZxxVr3qzOZdDXqBiN+7EKVnDcS8es4
         Eelg8Y9KmiqqLZ0UeA/IKwIOPIzx8zmd9a/UUVECPEkhr48DH1JYVMDGDQ254oiJxr6d
         Xhg67zs2vafvQrDbhA/yV/kYIxgzk9A6g4Dw5yGSZn7go7lEN5D1MRUIpqESBCzKbGGZ
         xgSLgmLI3AZYBkdgtTMb9J4/bsRMzmOm/MP+cD1+Ip80c6l3Ughoz4omNmhOIBJyWbUI
         oUKg==
X-Gm-Message-State: AC+VfDyLSxZjABLmrR9XqrCmaVOgmWlq+TP/DO+7uBL4n+IH3NCXfJaG
	NBkkJU1JgCtxwMru7junSQBpXvY/dhY=
X-Google-Smtp-Source: ACHHUZ4vr7O7ztP9Ch0rL2DTwYQconLtosuUvlnWmCXVHIcHCiwPS10arJ7erkjc7Wm6/ivKbi2nqA==
X-Received: by 2002:ac2:4850:0:b0:4f2:5007:bd7f with SMTP id 16-20020ac24850000000b004f25007bd7fmr6275460lfy.36.1685028512122;
        Thu, 25 May 2023 08:28:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v9 5/5] xen/riscv: remove dummy_bss variable
Date: Thu, 25 May 2023 18:28:18 +0300
Message-Id: <03151586ddd34f61a24809d11bcc0be5e847b384.1685027257.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685027257.git.oleksii.kurochko@gmail.com>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V9:
 - Nothing changed. Only rebase
---
Changes in V8:
 - Nothing changed. Only rebase
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - Nothing changed. Only rebase
---
Changes in V5:
 - Nothing changed. Only rebase
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 * patch was introduced in the current one patch series (v3).
---
Changes in V2:
 * patch was introduced in the current one patch series (v2).
---
 xen/arch/riscv/setup.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index cf5dc5824e..845d18d86f 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,14 +8,6 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
-/*  
- * To be sure that .bss isn't zero. It will simplify code of
- * .bss initialization.
- * TODO:
- *   To be deleted when the first real .bss user appears
- */
-int dummy_bss __attribute__((unused));
-
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
-- 
2.40.1


