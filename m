Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B676BD61E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510731.789016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhx-0003kj-Sl; Thu, 16 Mar 2023 16:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510731.789016; Thu, 16 Mar 2023 16:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhx-0003gN-Oi; Thu, 16 Mar 2023 16:44:05 +0000
Received: by outflank-mailman (input) for mailman id 510731;
 Thu, 16 Mar 2023 16:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcqhv-0001vH-IC
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:44:03 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c264a272-c419-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:44:03 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id ek18so10081498edb.6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 09:44:03 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 hp12-20020a1709073e0c00b00925ce7c7705sm4019163ejc.162.2023.03.16.09.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:44:02 -0700 (PDT)
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
X-Inumbo-ID: c264a272-c419-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678985042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxFxWR/KwNqWUfgbN6kCM9vb2gHfOtn9xHZ/ZPjul4U=;
        b=hf8g/Fxc5oaFRgjbBfeo44LV4rFHntMIDn1UufA20RsVgdRbEnhVEjDukHMIqwZgOE
         YmiHJ9Bbi0Ol9KUaqXBK0PZZuJUNJh+oAgVTDzj6/w9WACsgPQVm+omlHfJmN6dIFzwT
         2KXrADc4QUHHv4jJXB/u1HPaoXee2fCUrLNIQYmEKB7ca4N1ajrFCvgnzFHaCbOiBxX0
         KrhElEeqCD+NqvIFYbU67xa1CQ8ZS+P60GFll3qFxHbA06Y+BJLOeEYtsasWRA8GRWtb
         nNcQ/GTBhe2tQZSD+VDo56nUTbH4KWwjMmGIhoYA2CSXp6zCleruMhvMaIngNJhGuCyY
         I28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxFxWR/KwNqWUfgbN6kCM9vb2gHfOtn9xHZ/ZPjul4U=;
        b=Dd0M5S1djZvkGp4x81eBEafhpZp+H6Ov4uTPf7DSYjnmPZTfSWPEXxUP12f/WkyDpT
         sZnHMmrjuKEa9V+wbzvr1IIOVhYhzzC+N7LQZBuACUErhpA1uxWUAzr92iouiyiG+0LY
         xZGJN22ASJCp5JarNNpyTRq/ha4b91Vc04R+OpjC6ukt2bVM42KetSrHOZ73a4Pw80hB
         MnQ22pcyqU61NcEOwOwqCurWhVXRgcbV6t6aw3UQiy4cwf6JEaKt51LbD/GdUrFWxHiY
         lRUZnpyChpXt3mGYmXzm6PKG8O3PgmPeB+5pgIUFxce3rvGGG+cxOwyV+sKMuULzPeBE
         vC/Q==
X-Gm-Message-State: AO0yUKUJa4RQe7NqCs2nCGTgyfkB/u2X6PMSOh5i+W36cm9QkUhhE8NF
	ZbCyi3skO3NVbzoQ1L2B6k7x3AGPY8/Nkw==
X-Google-Smtp-Source: AK7set8osAS2FBpUkGXOeHYbc87SoPDnIeSlNu4XfZkJO1YccDHGo05zz52VAb1COkwDkPuSqeblHg==
X-Received: by 2002:a17:906:f1d9:b0:92b:e566:98fb with SMTP id gx25-20020a170906f1d900b0092be56698fbmr11998167ejb.12.1678985042704;
        Thu, 16 Mar 2023 09:44:02 -0700 (PDT)
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
Subject: [PATCH v2 3/3] xen/riscv: remove dummy_bss variable
Date: Thu, 16 Mar 2023 18:43:54 +0200
Message-Id: <c180968b64b3cc37fc5f204684ff52d55d15cfd6.1678984041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678984041.git.oleksii.kurochko@gmail.com>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After introduction of initial pagetables there is no any sense
in dummy_bss variable as bss section will not be empty anymore.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 * patch was introduced in the current one patch series (v2).
---
 xen/arch/riscv/setup.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a3481973ff..276efb8034 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -15,14 +15,6 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
 
 struct boot_info boot_info = { (unsigned long)&_start, (unsigned long)&_end, 0UL, 0UL };
 
-/*  
- * To be sure that .bss isn't zero. It will simplify code of
- * .bss initialization.
- * TODO:
- *   To be deleted when the first real .bss user appears
- */
-int dummy_bss __attribute__((unused));
-
 static void fill_boot_info(void)
 {
     boot_info.load_start = (unsigned long)_start;
-- 
2.39.2


