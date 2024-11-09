Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF5C9C28EA
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2024 01:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833010.1248303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9ZTP-0007X9-UR; Sat, 09 Nov 2024 00:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833010.1248303; Sat, 09 Nov 2024 00:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9ZTP-0007Tz-RE; Sat, 09 Nov 2024 00:37:07 +0000
Received: by outflank-mailman (input) for mailman id 833010;
 Sat, 09 Nov 2024 00:37:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Zvo=SE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9ZTN-0007Tt-QZ
 for xen-devel@lists.xenproject.org; Sat, 09 Nov 2024 00:37:05 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba2088ca-9e32-11ef-a0c6-8be0dac302b0;
 Sat, 09 Nov 2024 01:36:58 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99f1fd20c4so390008466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 16:36:58 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0ad2cdcsm294743766b.87.2024.11.08.16.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 16:36:56 -0800 (PST)
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
X-Inumbo-ID: ba2088ca-9e32-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJhMjA4OGNhLTllMzItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMTEyNjE4LjUwNDE5LCJzZW5kZXIiOiJhbmRyZXcuY29vcGVyQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731112617; x=1731717417; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMqDlkmdt/fddKZMacTV945+a8ec8UbBh+hwQOHboRo=;
        b=HyF5+bSdCpPyMid/LWhlsouFQ+wDFXwHJByvw2Np3MPTQe1X4ORNAwB8hChyWVer6C
         HXRVB3ilYQL3Buh/omnVsuBU7615HKbJWyK6DsOCEtZR32RSSYIPpqIeXMfUfMF4M92g
         l8odEsFKoVJj3gb005ZfqZxmNFI4bath/hdwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731112617; x=1731717417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMqDlkmdt/fddKZMacTV945+a8ec8UbBh+hwQOHboRo=;
        b=NnBqocQ4P8nKLpNl/xojbEV5t9jTvjAf4fUT6rE2eFESXLVU7Tm4ClCiT5a4q/3pK1
         +UbPQbh+AbCXkzDaYKWWbgywrHUoXuYnT5qS+ZBYUe2JnpZmBr2QYV0anf/6Idkh9B71
         jOMOZEnvG2+USxrN6RhatcWR0YWx0t9z4QNvb9GH7DIaMH6s7oJbbqN2P3eR27+uxiOa
         GSskoVIOjc9PAvt7QXzgakPwEicZDllk7M9K2owBiJDkAJTECY4KsvJXg8FueVkVtjZe
         8LZjP7TJDQXyyX83SKlRrYV++DqSCPhTfR3TSnvVnTvM1WVEXsaYf1/WTQWcRfNE4cxM
         KHKw==
X-Gm-Message-State: AOJu0Yx9NsSJBkBEsiAYsv8UDgXkAIrO1fNvA+o+lMfJSNXBkIOUj9Xp
	QNsT5jb/AlCmghUj5QKNZR5VPYDVdsA2Jyo3WTp6dKW41Aw5BRQxHnExTe45iIBp+dokT6CChOQ
	M
X-Google-Smtp-Source: AGHT+IEpoeQ7J/3kohUZZrrSK4cg7vHNUX8hAexOALYXq8HaLGo+LVJ53p2s0kGyl+IysZTEwliprA==
X-Received: by 2002:a17:907:608a:b0:a99:499f:4cb7 with SMTP id a640c23a62f3a-a9eeff0e34fmr469881066b.23.1731112617267;
        Fri, 08 Nov 2024 16:36:57 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/wakeup: Fix code generation for bogus_saved_magic
Date: Sat,  9 Nov 2024 00:36:54 +0000
Message-Id: <20241109003654.884288-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bogus_saved_magic() is in a .code64 section but invokved in 32bit mode.  This
causes a real encoding difference.

Before:
  66 c7 04 25 14 80 0b 00 53 0e    movw   $0xe53,0xb8014(,%eiz,1)

After:
  66 c7 05 14 80 0b 00 53 0e       movw   $0xe53,0xb8014

The differnce happens to be benign, but move the logic back into a .code32 for
sanity sake.  Annotate it with ELF metadata while doing so.

Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This issue dates back to the very introduction of S3 support in Xen, in 2007.
---
 xen/arch/x86/boot/wakeup.S | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index 08447e193496..c929fe921823 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -153,15 +153,16 @@ wakeup_32:
         /* Now in compatibility mode. Long-jump to 64-bit mode */
         ljmp    $BOOT_CS64, $bootsym_rel(wakeup_64,6)
 
+FUNC_LOCAL(bogus_saved_magic, 0)
+        movw    $0x0e00 + 'S', 0xb8014
+        jmp     bogus_saved_magic
+END(bogus_saved_magic)
+
         .code64
 wakeup_64:
         /* Jump to high mappings and the higher-level wakeup code. */
         movabs  $s3_resume, %rbx
         jmp     *%rbx
 
-bogus_saved_magic:
-        movw    $0x0e00 + 'S', 0xb8014
-        jmp     bogus_saved_magic
-
 /* Stack for wakeup: rest of first trampoline page. */
 ENTRY(wakeup_stack_start)
-- 
2.39.5


