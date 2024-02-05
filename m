Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530CB849807
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675781.1051256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwX5-0000KJ-SF; Mon, 05 Feb 2024 10:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675781.1051256; Mon, 05 Feb 2024 10:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwX5-0000Ho-OE; Mon, 05 Feb 2024 10:48:59 +0000
Received: by outflank-mailman (input) for mailman id 675781;
 Mon, 05 Feb 2024 10:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/8nl=JO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1rWwX4-0007md-7l
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:48:58 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a759ff-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:48:55 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a30e445602cso1093350066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 02:48:55 -0800 (PST)
Received: from localhost.localdomain ([185.25.64.249])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a1709067f9700b00a37b0d09d9esm1201965ejr.119.2024.02.05.02.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 02:48:54 -0800 (PST)
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
X-Inumbo-ID: 28a759ff-c414-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707130135; x=1707734935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyOiV3AtGDkj74WIW4cpDGcIhzL87xknPQ5xMGnZjFU=;
        b=BkI7HZb+4tjFY6J2grE41eVeBiL1g9SX21GRd5BaK9d8L878fr/VBpXRD1twtggbzT
         Swo0WVXAvpyjvM+h6OV9dIjhXdRaMeeM6AhcMjXShZzsf9JIj3exCZgIK2cdzcJN6+QP
         R6PnyAQiNr7ikqJwKipIkPkoYlRazHSLcIUv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707130135; x=1707734935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyOiV3AtGDkj74WIW4cpDGcIhzL87xknPQ5xMGnZjFU=;
        b=DVJXX/K8vnotIvpB63Fpld/MsmAmas/tne5GUYR1Zc/Xt9pDzwy/L5nqlXUI+EHSUM
         Jv6CuW1DOl+1CZIpGxDOOHUQnp8m3G+gqztp2zWT7Od7QZSpCAoJAOI1nhtEV87IjL/P
         /wWjBC3/NlGx0jbl/WzGPH0vsabMMmF7OArFpL6TsssE5vI+5atFR6zYbCRuAcggmk0e
         k/iiPHMZGY3duK6I3BQFnqDi5yqaAN4uVZ1NKNDyABYVm+eLZ2gycWn5rRKnAiolg2uC
         kDoZ/GpQzTbpWxPWTrlHvEh4Igt4iB0j0yuvn5T/C/kSolYL/GE22Yv4wz6vUqg9/U/Z
         2stA==
X-Gm-Message-State: AOJu0YzS+dNurY7E0D/nPsqkj4ZyGQFgs8eZ5joe8uXQsiQhD4OFwkOI
	8s9kB+6P7OtxYgzhHU1Jab+aoDEqbaVyc4NtHaewRazkE8DGE7HxIsAuG8VuVac=
X-Google-Smtp-Source: AGHT+IHPLlbZu4hWveArh5WSuBHr1gOP3+SDiU520//wgpfaMV+kcP36tWgTHecNQ37wF0+k7GpUXw==
X-Received: by 2002:a17:907:7893:b0:a37:8574:357a with SMTP id ku19-20020a170907789300b00a378574357amr3791718ejc.4.1707130135261;
        Mon, 05 Feb 2024 02:48:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUVRlAMaIT1cI3q/pqat/a+scZbTiTUAU99J6Qy9e6AOqD0zjH5Jn+KZT8lmMdND00XdJqlLV+MqCccIDR+OhI/Hq+E/5JwNM4oCuKPdVlKI145C0NNblESX4jDyqErin+lxCXnEd3DZBiywKF1Z7KDi3CiQqfnLbGety0jw09DvbNdFoj8MQ==
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 4/5] Reduce assembly code size of exception entry points
Date: Mon,  5 Feb 2024 10:48:40 +0000
Message-Id: <20240205104840.14942-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We just pushed a 8-bytes zero and exception constants are
small so we can just write a single byte saving 3 bytes for
instruction.
With ENDBR64 this reduces the size of the entry point from 32 to 16
bytes (due to alignment).

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/x86_64/entry.S | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ecdd6e5b47..b6a157d96a 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -898,28 +898,28 @@ END(handle_exception)
 FUNC(entry_DE)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_DE, 4(%rsp)
+        movb  $X86_EXC_DE, 4(%rsp)
         jmp   handle_exception
 END(entry_DE)
 
 FUNC(entry_MF)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_MF, 4(%rsp)
+        movb  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
 END(entry_MF)
 
 FUNC(entry_XM)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_XM, 4(%rsp)
+        movb  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
 END(entry_XM)
 
 FUNC(entry_NM)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_NM, 4(%rsp)
+        movb  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
 END(entry_NM)
 
@@ -933,28 +933,28 @@ END(entry_DB)
 FUNC(entry_BP)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_BP, 4(%rsp)
+        movb  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
 END(entry_BP)
 
 FUNC(entry_OF)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_OF, 4(%rsp)
+        movb  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
 END(entry_OF)
 
 FUNC(entry_BR)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_BR, 4(%rsp)
+        movb  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
 END(entry_BR)
 
 FUNC(entry_UD)
         ENDBR64
         pushq $0
-        movl  $X86_EXC_UD, 4(%rsp)
+        movb  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
 END(entry_UD)
 
-- 
2.34.1


