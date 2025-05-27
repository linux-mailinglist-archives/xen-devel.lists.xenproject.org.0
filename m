Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08FFAC5186
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998508.1379232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvq4-0003iJ-0e; Tue, 27 May 2025 15:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998508.1379232; Tue, 27 May 2025 15:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvq3-0003fl-T6; Tue, 27 May 2025 15:03:35 +0000
Received: by outflank-mailman (input) for mailman id 998508;
 Tue, 27 May 2025 15:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uJvq3-0003ff-3r
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:03:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c21ec47a-3b0b-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 17:03:33 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so27384505e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:03:33 -0700 (PDT)
Received: from andrew-laptop.. ([46.149.103.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f24b6471sm273166855e9.24.2025.05.27.08.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 08:03:31 -0700 (PDT)
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
X-Inumbo-ID: c21ec47a-3b0b-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748358213; x=1748963013; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztdVfT4mxbj+5WIVFfsMLxndJVFXBgQyRQpEKpBUWUw=;
        b=mD23X3tDxgYLIbxrA6baMxtSkj3iWJqgACi7iCEqiezbGACX12jy7UVNgSWmxM7pB4
         mMf5M4zj+uDh9FmXCvcDkzzoJKBcNLLpvHxhxO9iFmPs0ASmzK4dLJcGD49W9x9yF2/u
         BgMCHR4tmtgsn2Sx1Hx3MerUwEWAIDo1RT8/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358213; x=1748963013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztdVfT4mxbj+5WIVFfsMLxndJVFXBgQyRQpEKpBUWUw=;
        b=VhGh1BBNpidTvaFMH5yGBm8Iuw7K0CBy15i8rwcD2v2Yv4H+rlaGEyllr5YdXcYY9N
         DQN12fING3yZlftRna858vbkGuoHH/7NhIjiaVL7EDOg1DYd3+VC802rGXIaq/32O+Te
         SSi46CMz72/BbpVC1aUbkPz0Fx5TZ60GnpvNoR+etkivmucUWWC2fsWjsM6UmS5Jpbau
         TAT+dWVWTz80l+d3pa5HoNc05AJfvB+gF+Y0NhD9wb3VMqWMBlVXCOuO/jMN1uUuV8Bx
         452nGsAGJoIkeOI6zVHhtlvI6hotRYILnhr56vGifcq3ao6aydsKyq6W/99Tuod9vAVj
         COWA==
X-Gm-Message-State: AOJu0YyEn+cvt3Q8iAPgptaFBMkOR+w5GkGbyDBUNw4KnVbRuURruFtI
	DUEhgexV/2UEfe6CCx16TaLBbDfI+B+ljOArWUnS1C5tzkQ/Z7nr5hpYIAZIDESXi5Jj2tnHKvk
	0EQZO
X-Gm-Gg: ASbGncuhTeqmbOHpHxPSbWRB7flVZSWzFrHVNAwPMdEprGL4ESk+Y9A+tcIjlVXXWVg
	BioAk2U9YSTwbG5EfKZ51S1mCLg81VJTc4kgGXr9yS5affB+hy0k92XzDSzVqgXhAN8sG69RMiF
	ht5kgfoIOWnA0NvDewrqVVUL2zOoVmJomjQddWWkJhbRa1JrD5zO3BmQiT9DLhy6WAMsRBLH8Lq
	pwhFHCx8Bbqh6eguO0CprSm7tl4S/JyIDRkx4A0sMppyZceRZdUvnFfSX+CoKzT15XZndORhySz
	iBCNvO73hWy8YbhPRAGkWgbDRmyrsbNruZYlwEm+MsyDXbbn5EHfSgkQ+kcjkOg=
X-Google-Smtp-Source: AGHT+IG8HOx/gt8VB9bumc5o8u1nlVH9jDCaITTRPrJJXYfW8RzY/eJFn3rZDzNXzv69KuKhQCH/qw==
X-Received: by 2002:a05:600c:529b:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-44fd1a021c5mr9943355e9.2.1748358212764;
        Tue, 27 May 2025 08:03:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/hvm: Drop unused vpic.h includes
Date: Tue, 27 May 2025 16:03:30 +0100
Message-Id: <20250527150330.47108-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's only hvm.c, irq.c and vcpi.c which need this header, and they all
get it via asm/hvm/irq.h.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/io.c       | 1 -
 xen/arch/x86/hvm/vioapic.c  | 1 -
 xen/arch/x86/hvm/vmsi.c     | 1 -
 xen/arch/x86/hvm/vmx/intr.c | 1 -
 xen/arch/x86/hvm/vmx/vmx.c  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index de6ee6c4dd4d..23a5ea0e6197 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -26,7 +26,6 @@
 #include <asm/p2m.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/vpt.h>
-#include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/emulate.h>
 #include <public/sched.h>
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index f896b9ea121b..7c725f9e471f 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -33,7 +33,6 @@
 #include <xen/nospec.h>
 #include <public/hvm/ioreq.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/support.h>
 #include <asm/current.h>
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 61b89834d97d..32e417bc1592 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -38,7 +38,6 @@
 #include <public/hvm/ioreq.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/support.h>
 #include <asm/current.h>
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 91b407e6bcc2..b35dc8c586f6 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -20,7 +20,6 @@
 #include <asm/hvm/io.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vmcs.h>
-#include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/nestedhvm.h>
 #include <public/hvm/ioreq.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index c2262c584822..d8879c304e15 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -32,7 +32,6 @@
 #include <asm/hvm/vmx/vmcs.h>
 #include <public/sched.h>
 #include <public/hvm/ioreq.h>
-#include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/x86_emulate.h>
 #include <asm/hvm/vpt.h>
-- 
2.34.1


