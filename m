Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA786E7E93
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 17:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523578.813779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xQ-00028f-Ab; Wed, 19 Apr 2023 15:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523578.813779; Wed, 19 Apr 2023 15:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp9xQ-00023t-0n; Wed, 19 Apr 2023 15:42:56 +0000
Received: by outflank-mailman (input) for mailman id 523578;
 Wed, 19 Apr 2023 15:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RA+/=AK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pp9xO-0001fK-QX
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 15:42:54 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9981225-dec8-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 17:42:54 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id r9so21017386ljp.9
 for <xen-devel@lists.xenproject.org>; Wed, 19 Apr 2023 08:42:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 f3-20020a2e6a03000000b00298dc945e9bsm2945367ljc.125.2023.04.19.08.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 08:42:53 -0700 (PDT)
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
X-Inumbo-ID: d9981225-dec8-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681918974; x=1684510974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6nuZqH4BFpdEi3VMqbbjTAjUlawv3o6/WP+NDuHGao=;
        b=FTQsPdb4VZ4U8RE3yeFfHXGlvbgFa0QGfqVFr+jC6kl6lxCZtsLyajUUqYQLMgURWb
         J4uGmuFYPY0pjFG3CvgZXBQ+DQSwKkx3aLHi8JiMlqqwFM7VZfY8qLUXuH8hNbaooToh
         oUl8JWcg6/dqqTOISasLH4ArbdoYMv/7qTsrk21lipm8TZ0o+iGKtQcaitVK3NT7LnHh
         cHUofTY6cexuLNRmw8QblHcS8LmQhx8wUSQySx0lMZFd0Mvb9N4HS1X65zhUQf+nG5lT
         3cGIRqrrWfhy8kgYqFl1kyHbNncTpe5lX859YIwTjvJeyWa/XSb9WXw3PXjXypHssGbH
         H7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681918974; x=1684510974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6nuZqH4BFpdEi3VMqbbjTAjUlawv3o6/WP+NDuHGao=;
        b=Ny8H3Ypi0tTbfRCZjJONA1mxkFCo4dXZGZAIfjCIQUdMSRHwCuiuqtLj7XlgQFYRZf
         LNHavrN3fJFflEYEFhkzyeUmj41cOPfCUzh/QeL+MfjXLJpnklR7x1XVbrIZTVQ+n2+r
         86XrsWL9/suZQ1qbxV3RUK/T93AdrAPID+LQYPDCqKVCVGrlTEx+LnAZIKEJGD61zurU
         1Itm8jscpnXvw60SeI++RWUkS7ZpdcWC3MMCPhCWNx687HDyrgTKXcJr+q2P3hgtZSl8
         gUDZT0TCSU3qIzJ9pjgAQuUxuNEh5XKGZh66Q+mxlBzQzPF9I0BKWQAzYYIFRTWSXYb0
         r86w==
X-Gm-Message-State: AAQBX9eqqFzqLlj6udxAlu3mgBWrAH7AnwjX67eCRhQTpbgtYzvJYFxq
	tylnPSnqEXv4+PBZItEM5Sza+JBaq4M=
X-Google-Smtp-Source: AKy350b0B/kQEXWANRl+Ln8SJiVSd3pvv9i8HvVi4kbbG70yeWrmbVGwKZQAs+lqgOodMZ12n2+Y5w==
X-Received: by 2002:a05:651c:cb:b0:2a7:79e6:1625 with SMTP id 11-20020a05651c00cb00b002a779e61625mr1987538ljr.37.1681918973693;
        Wed, 19 Apr 2023 08:42:53 -0700 (PDT)
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
Subject: [PATCH v5 4/4] xen/riscv: remove dummy_bss variable
Date: Wed, 19 Apr 2023 18:42:47 +0300
Message-Id: <6b56f750edc5d8f3ed41769896c865e3ea89c68f.1681918194.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1681918194.git.oleksii.kurochko@gmail.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.39.2


