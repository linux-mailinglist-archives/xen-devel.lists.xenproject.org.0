Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E1710F8E
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539712.840883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtG-0007iM-Dq; Thu, 25 May 2023 15:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539712.840883; Thu, 25 May 2023 15:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtG-0007eQ-3Q; Thu, 25 May 2023 15:28:34 +0000
Received: by outflank-mailman (input) for mailman id 539712;
 Thu, 25 May 2023 15:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/QV=BO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q2CtE-0006oN-5y
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:28:32 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd7e7230-fb10-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 17:28:30 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso2741115e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 08:28:30 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d22-20020ac244d6000000b004f37c0dfcaasm246853lfm.118.2023.05.25.08.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:28:29 -0700 (PDT)
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
X-Inumbo-ID: cd7e7230-fb10-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685028509; x=1687620509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObHRDoMQo8U3MMOm/by0OlrwtRpV6knweGLD9K1sUP8=;
        b=drPj5fG4WKbu9d3nAuD6VrAYls8hQO9/NYjfguD0i9Poaj0iRwR+THXvfyzM4FF+P/
         wuaw256sDJlu4mJnX90KkPNnuQubJt3XuiP4eJxmKRkq3MuHTJTYSOkhoT2IL7vQ7ZIr
         qwZT+pDSTKSQMYbaD+pn9SuaKanVAWR7cVh0bo15evTaVWUGbTGuUHt66iRCddyRpeJG
         kZIO1om0Ex8QvSDCo7oWjiofpqiNVm5Dw7vUcNEsoO+hoBhkSgRZQVcSJ1popT4H7X1z
         Of+pRN7ycVD73EkLDzGsGAfedwaITfADfN41qlL03KiLEgLF3rnfsoiUe3qy8oLLaCfF
         I5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685028509; x=1687620509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObHRDoMQo8U3MMOm/by0OlrwtRpV6knweGLD9K1sUP8=;
        b=TgZEU8TjDSn6VaAY3W3oFqh/3nURh+MTwmPhKx7dLJfRxMNoYqAQM9pBeeafwYXU5r
         N/kL2iMvJLgh79QyorUtPQUZnh1aC2qSQjnk95IyxAj0C9D8cyI7hbCZ68L9GdC2aooi
         Z0voQ4OOhHykR8M/f46sQfm1aJ96eE6/DLjo3lRSkLw8REeqPoyVFMrL5/TVCuirHb28
         x4TjUbqIjjRrr/Q2ZCo04+iGvUt95Qf5zuXQxgkh89VpGF+2S7yZm5dW4MIYG6TWllPA
         shu+CpslSmpeqHm9dZZ3eL9Q9GqVkX9nPFbAhMQuXstEoZwgh6GpxnW2SdWSodNEHyjc
         zw9Q==
X-Gm-Message-State: AC+VfDxl+NkEkHGOktiZHRKSJiqaBQ+waAvNSRNt5ljdFrF9Eubvtmc2
	KKDyGPxb3JEsuQPuMKBy9QRWPP+ootU=
X-Google-Smtp-Source: ACHHUZ6uJoNS31A74ZGm3w3R7FoQGZ4ZyNwMNZs5ONYPsi80/dMr18p3ZBIuGnO4iiD4j0AxztChFg==
X-Received: by 2002:ac2:51ad:0:b0:4f3:a3e0:8502 with SMTP id f13-20020ac251ad000000b004f3a3e08502mr6333998lfk.33.1685028509497;
        Thu, 25 May 2023 08:28:29 -0700 (PDT)
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
Subject: [PATCH v9 3/5] xen/riscv: align __bss_start
Date: Thu, 25 May 2023 18:28:16 +0300
Message-Id: <1158df1cde660e817c4f6d6e0a46ef22bd92dc04.1685027257.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685027257.git.oleksii.kurochko@gmail.com>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bss clear cycle requires proper alignment of __bss_start.

ALIGN(PAGE_SIZE) before "*(.bss.page_aligned)" in xen.lds.S
was removed as any contribution to "*(.bss.page_aligned)" have to
specify proper aligntment themselves.

Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 * Nothing changed. Only rebase.
---
Changes in V8:
 * Remove ". = ALIGN(PAGE_SIZE);" before "*(.bss.page_aligned)" in
   vmlinux.lds.S file as any contribution to .bss.page_aligned have to specify
   proper alignment themselves.
 * Add "Fixes: cfa0409f7cbb ("xen/riscv: initialize .bss section")" to
   the commit message
 * Add "Reviewed-by: Jan Beulich <jbeulich@suse.com>" to the commit message
---
Changes in V7:
 * the patch was introduced in the current patch series.
---
 xen/arch/riscv/xen.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index fe475d096d..df71d31e17 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -137,9 +137,9 @@ SECTIONS
     __init_end = .;
 
     .bss : {                     /* BSS */
+        . = ALIGN(POINTER_ALIGN);
         __bss_start = .;
         *(.bss.stack_aligned)
-        . = ALIGN(PAGE_SIZE);
         *(.bss.page_aligned)
         . = ALIGN(PAGE_SIZE);
         __per_cpu_start = .;
-- 
2.40.1


