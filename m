Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AFE9A5049
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 20:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822639.1236586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2E4T-0004l0-Up; Sat, 19 Oct 2024 18:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822639.1236586; Sat, 19 Oct 2024 18:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2E4T-0004iw-S5; Sat, 19 Oct 2024 18:21:01 +0000
Received: by outflank-mailman (input) for mailman id 822639;
 Sat, 19 Oct 2024 18:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wyF=RP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2E4S-0004iq-LZ
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 18:21:00 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e32a4d19-8e46-11ef-a0be-8be0dac302b0;
 Sat, 19 Oct 2024 20:20:58 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d6a2aa748so2090044f8f.1
 for <xen-devel@lists.xenproject.org>; Sat, 19 Oct 2024 11:20:58 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d6383sm3935566b.6.2024.10.19.11.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 11:20:56 -0700 (PDT)
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
X-Inumbo-ID: e32a4d19-8e46-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729362057; x=1729966857; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ+XswcKE3eTwpfFb8whrcadqSkZhZ894uDrIh9ujhg=;
        b=N8WkivhBLANNsMBBkRQgtb3E6sDtTGigVL/WHmS3qTPLBVqsYFrtPw2yKt9DZs/ANW
         iReSdysqCn0KX6E1dHhANhSE+jZ9DMhpb/qFdvwRglj8viJQ+Tk9hadaHiioO4HcNSx5
         xcoMXa3YzShhtnjYfBtwZn0HIDD9HYB+peeoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729362057; x=1729966857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQ+XswcKE3eTwpfFb8whrcadqSkZhZ894uDrIh9ujhg=;
        b=Lw1OuPq6Ho4ugv7Nc2JtgpqCyq4hXlV/4gO0TKc54apaug4FOcnKCuUDXnKTturAQk
         X1xdaJ2ft+bvxcmUubCb+Oi98F8V8JitspZeftjppCneFK7QP6PfRaJfIFki3oYvCn97
         2FDIbpryMyDrQIONHSzZSxFsQxxWeGaMarCca/eFCqF9I9Ex0ECe5CmARQhd9LeJF2NR
         xBLz6/dd37Al+e0oX7PAtrkDnEFksx1D2pgeh65DhlABww4Ua8B0mO1lvmPY0EKYLqfe
         QjHTd1d4Y3kEmJwmTleUm9mvTpgTvuBToZxmzsSvL3WKP0LYsfRbqiwuacr0DeIVlm8Q
         5xFA==
X-Gm-Message-State: AOJu0YzTO8T7wdCKBDCPDbsiKt8GKgQg7acH10FPnu6CsmpvW0CJFb7L
	eRASe653u+ij+MT4CTGFb/vYK7UaPg6P+ycjNo8CWhZ0tnYNkt6GteK+CL/cLoLXKrsdHwQ2y5m
	u
X-Google-Smtp-Source: AGHT+IFfJF5sibyxVlWbMk0NcQlVo9m8EMt7Xnv2eUv43QIVWGecscVNiqZcQInxW/vq6wHKROq7Uw==
X-Received: by 2002:a5d:5512:0:b0:37d:4fb1:4fab with SMTP id ffacd0b85a97d-37eab6ec42dmr3645829f8f.57.1729362057124;
        Sat, 19 Oct 2024 11:20:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] x86/boot: Fix PVH boot following the start of the MBI->BI conversion
Date: Sat, 19 Oct 2024 19:20:54 +0100
Message-Id: <20241019182054.3842879-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pvh_init() sets up the mbi pointer, but leaves mbi_p at 0.  This isn't
compatbile with multiboot_fill_boot_info() starting from the physical address,
in order to remove the use of the mbi pointer.

Fixes: 038826b61e85 ("x86/boot: move x86 boot module counting into a new boot_info struct")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

This is a testiment to how tangled the boot code really is.
---
 xen/arch/x86/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6746ed8cced6..bfede5064e8c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1048,6 +1048,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
     {
         ASSERT(mbi_p == 0);
         pvh_init(&mbi, &mod);
+        mbi_p = __pa(mbi);
     }
     else
     {

base-commit: e9f227685e7204cb2293576ee5b745b828cb3cd7
-- 
2.39.5


