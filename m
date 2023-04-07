Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9706DAFE0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 17:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519067.806241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkoKX-0002M3-6d; Fri, 07 Apr 2023 15:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519067.806241; Fri, 07 Apr 2023 15:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkoKW-0002L6-WE; Fri, 07 Apr 2023 15:48:49 +0000
Received: by outflank-mailman (input) for mailman id 519067;
 Fri, 07 Apr 2023 15:48:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVqb=76=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pkoKV-0001rE-9T
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 15:48:47 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae10e726-d55b-11ed-b464-930f4c7d94ae;
 Fri, 07 Apr 2023 17:48:45 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id s20so23593326ljp.7
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 08:48:45 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 v12-20020a2e9f4c000000b00295a583a20bsm874765ljk.74.2023.04.07.08.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:48:44 -0700 (PDT)
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
X-Inumbo-ID: ae10e726-d55b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680882525; x=1683474525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dR16O0lugGTgYXlwGY6UhsQKrRSYw0CGkPTToCj++Ug=;
        b=WNtfsY4gAIKeRRXFCMruuMW9ZmEahyFB2wL7ubeBg+g9lGealukXMDfhRE1Y8sDvr1
         XKpW8xy5x7dKsTnjBzJS9Th7BV7Y2rc5yvDVY4IsrCaRjqCRdzDm3hlymk4pJQN8JBO6
         jF+ZvJivr55eMmvEhZhgP5sZ4tpik0pNAIeJ8ApqjKGIG3YEROX3SUxvwo+W2Ncg+QPK
         Or+Ws0WpsQ4fUmVsn0pUnxU2Zca34uwq2J16MO6bdpgjboqcJAf+zyznCgs1fssWos7B
         fUgtreelqzzAqy+Fgnqcq2al94r4uQMOmh5Dof4DmeOi1q5x5jyDqYlGNra3kfcEqB3a
         MhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680882525; x=1683474525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR16O0lugGTgYXlwGY6UhsQKrRSYw0CGkPTToCj++Ug=;
        b=QzowfV09XlT4N7tuOWoTu1TCATz56kWehqiRKabg89IBOxtRZxNZWeKD1q/qSNJ3NI
         8+N0tHIxzZEZnUmJG92Ymg+KNhv0XoaA60mDSe1F4rInbBWXyWoPAouE8RQZEdT/nJ4k
         IiegWpEBXDr/j7h3mFAEr97+q3dhj5jr6DvVYZorrTEw5LCSvRLyWkls/FbRrSmrCCT/
         N+AsHewZJdGo/hgMW56CuFYbF0sb2ssam0DLIfttwdt8x1EDSgRx08/jahLPrGT2/arz
         E7EryCpKNGKWUd5bmSbEuh8sy1S/S7YRrVmZmyvbTheXfRLDSSuzzvVzLYDIyfhJJk0w
         2clA==
X-Gm-Message-State: AAQBX9fcB+5W5U69V3EZD91GPZLuutfiBM5w2OmcIsvRdYJG2fESAEMu
	LQluQ3TLqCs2M9HzV9COyHXyMoeOWH8=
X-Google-Smtp-Source: AKy350bkZK1Y1VW7X1oCiqKF1QUHOQQXqi85UO/S8xap3BZ/klg3do3at0JUwxjNXS5JlXSehm7jmA==
X-Received: by 2002:a2e:9dc7:0:b0:298:39f9:fb2f with SMTP id x7-20020a2e9dc7000000b0029839f9fb2fmr532236ljj.31.1680882525256;
        Fri, 07 Apr 2023 08:48:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 3/3] xen/riscv: remove dummy_bss variable
Date: Fri,  7 Apr 2023 18:48:39 +0300
Message-Id: <a9794d6c3990c5656aaf417f6d94228bb5749a75.1680882176.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680882176.git.oleksii.kurochko@gmail.com>
References: <cover.1680882176.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.39.2


