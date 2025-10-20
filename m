Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF18CBF1837
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146288.1478737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnw-0008Bh-Ly; Mon, 20 Oct 2025 13:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146288.1478737; Mon, 20 Oct 2025 13:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApnw-00085T-Ez; Mon, 20 Oct 2025 13:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1146288;
 Mon, 20 Oct 2025 13:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vApnv-0007gg-Cn
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:20:03 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bb903da-adb7-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 15:20:01 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47114a40161so47998145e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:20:01 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c65sm15267835f8f.15.2025.10.20.06.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 06:20:00 -0700 (PDT)
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
X-Inumbo-ID: 7bb903da-adb7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760966401; x=1761571201; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YClZXLeX0pB5pdUdqdhEoYeXVD8Jv4KNegou1kZsW9k=;
        b=FB/lX7Zq3iEK/0ctor8sRECqCiyWO6JlzdJTia20bucoUSAUW1UFnEaw9/nyr/vq8s
         WOmGqW1+4uixJQSNdDj0XKGm716LyJ8wpIBJOiBvpIjyAkXAF+M9j6kOgLb3f8iCoVly
         Uj/65CpwzhNoZOSLLYz9S0Vjlk25BRUw/zmms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966401; x=1761571201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YClZXLeX0pB5pdUdqdhEoYeXVD8Jv4KNegou1kZsW9k=;
        b=wqUUcalCWxodBWjqApWpA6OSz51QKYqtqyz00sodtUaOjD2Lwft0Sv8842C7gIyI3x
         oIPM+QiDT8pkbSvy/B7XQ91YGean+QGDw0xCtw10lHU1WpnZ5g4RE2OaFfnVAXCN38yA
         fdUPIDhEtqcHP60pVy9rV+tCl33hBZa3d8IklrOLVm9jLGFt0Ll1RgnWw57mpKIn1oxc
         KPvJfyYNZbcuiukKt/REVO8Ded7Ya7ZBLMzyr3lPFdwFLpjjOuh+ns41JIlGKtJz5m8Q
         538xxsHrxzWc91dvvFaYwf6Hg0kHtrEqM4emsHffrwv62cwqnWH5m/9ftU9VwmyhhKqH
         oB8g==
X-Gm-Message-State: AOJu0YyGuOCLyN9HBHqr1Zfc+wob3lWhXrAvSABO2mvyZHHflGJ2caHe
	QRpOmcn6OeCNG64EncMkUBR0b3Grqz/5n9hIz54XCcW7IDJDyjeH57fZLInGGdyvB0bPDBJq9Sj
	qZnvLT4Fjyg==
X-Gm-Gg: ASbGncuGSCgwGj6IkymfSqKOxFMyV/Awa43UhMiZWSiRO/WY9vSlq8dUaVkvz0TjdJ1
	U8ST6rOTfo7nUkC5I4KZ7XaK44KtHb1tvccbdnKiwFTgwV2DehrcQpGrgYklO4edAbaQ5tsH/9e
	TPKLuzgt1AAYFQ1V6bUYiHDdzy7XVHXdpKe7GV7S1yuahlTcKgx827maYogo6Ewe4FtPmXz6E5/
	OgqrXTNzzdP0/X5eJ3EoRy88dl+4Kux/JHxwqYelgdxsvyOYKgyhsarF6qAEa6IAsS1aH8rFMix
	tFHQnpwcnQzdJJxjPqP6p86OYHLA/k9RsUxrgRWLd/yzCckHNDw35rUlzQJz0hDROqQRhqq/arv
	cLQ5kTio/nsJzGOv6+To8GC7osW4mNMLJ2v7GgKCZG3GaI+MxUqznLMwBFQ1U14L75qrlqXG8Mk
	JQCULptWJgNIjCy5SyYKthYOooW8SguNH69nKTJF3ocfdNZBk7vf0Eh4C9o54pRg==
X-Google-Smtp-Source: AGHT+IEiYUNYQCTl8KEffiDtETjildS3uhoapKNIU5qTRVtrY08cmVxTsc+VFs/0OXDzgECKAU5dCQ==
X-Received: by 2002:a05:600c:8b0c:b0:46e:731b:db0f with SMTP id 5b1f17b1804b1-47117912b5fmr108884555e9.28.1760966400759;
        Mon, 20 Oct 2025 06:20:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 1/5] x86/ucode: Fix missing printk() newline in ucode_probe_amd()
Date: Mon, 20 Oct 2025 14:19:51 +0100
Message-Id: <20251020131955.2928261-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.21.  This is a formatting fix with basically 0 risk.

It is encouraging that no-one has reported this bug so far, because it
suggests that no-one has turned off digest checking and then looked at dmesg.
---
 xen/arch/x86/cpu/microcode/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index a5729229a403..59332da2b827 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -519,7 +519,7 @@ void __init ucode_probe_amd(struct microcode_ops *ops)
     if ( !opt_digest_check && boot_cpu_data.family >= 0x17 )
     {
         printk(XENLOG_WARNING
-               "Microcode patch additional digest checks disabled");
+               "Microcode patch additional digest checks disabled\n");
         add_taint(TAINT_CPU_OUT_OF_SPEC);
     }
 
-- 
2.39.5


