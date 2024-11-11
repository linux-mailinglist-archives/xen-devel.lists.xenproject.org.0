Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE79C3ABA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833405.1248544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQYW-0006dn-Vl; Mon, 11 Nov 2024 09:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833405.1248544; Mon, 11 Nov 2024 09:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQYW-0006bc-T7; Mon, 11 Nov 2024 09:17:56 +0000
Received: by outflank-mailman (input) for mailman id 833405;
 Mon, 11 Nov 2024 09:17:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNnr=SG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tAQYV-0006bW-3Q
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:17:55 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d26c1b7d-a00d-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 10:17:49 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d8901cb98so3014578f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:17:49 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed987d95sm12504533f8f.44.2024.11.11.01.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 01:17:48 -0800 (PST)
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
X-Inumbo-ID: d26c1b7d-a00d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQyNmMxYjdkLWEwMGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzE2NjY5LjkyMzk1Nywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731316669; x=1731921469; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoK10uqg/eof6UsDV5W1ljmMjN103pwl7a9vNQHLSLI=;
        b=TWHVnfs4+MMu87/1HjoH4/hGB0r9ggUPlLhIxuNQoK1jNgZlcNCI7d8nok6I4W0h4t
         yhmZ4paiUUaBtVadCce2XRGmPNTKUCdmJRFGglBYYntfzOT3aZNlHxTB65YYI19g+S9c
         5RBcv6R1nK95yO192piI0nAIPnFlpmhgQyKYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316669; x=1731921469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoK10uqg/eof6UsDV5W1ljmMjN103pwl7a9vNQHLSLI=;
        b=cinDQFesKWWo1iwbq9XfLr+PuUJ4GU2eLcSk1eVEJTLtl8I8wLGkm5Hn+ctwoT4Cef
         /Uk4HIjZTvz/NJLjGZKZ4x9kgrT1+R4Okxlhc+Rw8aTsEc3Q86G9q3vZYlORzloHI3/H
         gMVc9jRsn1LIveOb6gFOHZj5/vkyPTD5VRl/hNUsroFzxXnPvlMFAWQQiuPWsyOKz8sl
         l05Lh/KAgXGasqKu0T2J8wLpNy6dDtB2rJlc7HfLNAU7IhRZr2Sg6kuvqQAVBdqZVMZq
         LdAAStNuPhkpd77XjUMrZS+/I4gPb8L2dkH5TjyYwQEkYqVC4YMtPCyfjYFpCMPOdCuX
         3s+Q==
X-Gm-Message-State: AOJu0Yzid+e3XJrEtppBi5fyRmW5tR+q7HAsuWTfTAHt2i1wP/ol1OmQ
	En6pYfwNDPJJlIi8pGUlHbD8oPJRUv3+DXs27U32+g8lcugdPOrHAxu/vLIHsQibNbnwZHWdFLg
	4ti8=
X-Google-Smtp-Source: AGHT+IFaWdGkzHS8bA+P2iLdlI4sEbL1uodfBNX3EUD4LjH0t8WFaHeY/wPwNzch5DiNWlkLEEXLKA==
X-Received: by 2002:a05:6000:4818:b0:381:ebf4:e5e8 with SMTP id ffacd0b85a97d-381f1a6caa7mr9618989f8f.7.1731316669017;
        Mon, 11 Nov 2024 01:17:49 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Setup correctly fs segment for bogus_real_magic
Date: Mon, 11 Nov 2024 09:17:39 +0000
Message-Id: <20241111091739.4885-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bogus_real_magic code uses fs segment so it should be initialised.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/wakeup.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
OT: Seen another similar patch on ML I suppose this part of code is not that
tested. Also, considering EFI code, do we always have VGA available in these
cases?

diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index 08447e1934..b73b947bdf 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -20,6 +20,8 @@ ENTRY(wakeup_start)
         movw    %ax, %ds
         movw    %ax, %ss        # A stack required for BIOS call
         movw    $wakesym(wakeup_stack), %sp
+        movw    $0xb800, %ax
+        movw    %ax, %fs
 
         pushl   $0              # Kill dangerous flag early
         popfl
@@ -44,8 +46,6 @@ ENTRY(wakeup_start)
         call    mode_setw
 
 1:      # Show some progress if VGA is resumed
-        movw    $0xb800, %ax
-        movw    %ax, %fs
         movw    $0x0e00 + 'L', %fs:(0x10)
 
         lidt    wakesym(idt_48)
-- 
2.34.1


