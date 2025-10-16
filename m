Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 552CCBE5C9D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 01:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144794.1478056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9XMy-00040h-Oa; Thu, 16 Oct 2025 23:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144794.1478056; Thu, 16 Oct 2025 23:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9XMy-0003xh-LT; Thu, 16 Oct 2025 23:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1144794;
 Thu, 16 Oct 2025 23:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCbN=4Z=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v9XMx-0003xb-Nn
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 23:26:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9754be12-aae7-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 01:26:50 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so13737645e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 16:26:50 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5833dcsm36885399f8f.19.2025.10.16.16.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 16:26:48 -0700 (PDT)
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
X-Inumbo-ID: 9754be12-aae7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760657209; x=1761262009; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YClZXLeX0pB5pdUdqdhEoYeXVD8Jv4KNegou1kZsW9k=;
        b=UF+/qJo079hV9l0sQSmvg+7Dom7Ty2Jecg+KTRxrsxmdYcUzlw51dSrbhEdQL4OLEi
         r2AGsIBlJ+pGIFjIRxUx/EQuLM/FNgHuj5Y4Hu/TIt1GtA1wsFaVeycbo0zdw4rkdl01
         nyniMOZPMD9XTziSbaMHek7uBVx4v1T/2qq2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760657209; x=1761262009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YClZXLeX0pB5pdUdqdhEoYeXVD8Jv4KNegou1kZsW9k=;
        b=tc3BkIQFm5AokO7tYxsVU6lCDchR105xlO8F5G6f6UdNkk6BUadTqbq2cWYYNiG0b1
         I+xpzo76WHfGW807rQANYY7i/VaBVUGfTlDBAzyIDZGRwOvGF7gr8C5QI0aQ7ztGBMYk
         pqJdmPcETVXMzcQMqnlR6UNYXc9mmQEezw2Y9EoaLfhE3Ab5Mvobul3GSxQXOcTsz+JI
         O6S3augXYzV8g0rGU5KgJA32tND8d4vhDwzDVaP841Duz27jv1BXciSyv8ZAztNyJSQC
         w7XKoNRJQ9Oo6IueMzpXNxHQIIcD+Au3r2W17HuNGXeKn9J6MRt9UWIUYjFmgANH9CK1
         Xg1Q==
X-Gm-Message-State: AOJu0Yxt2zKaTxNPp0ZCpbUngkHOlDi1+0+yweOpOwFB8DjQmJ9L9/ee
	gXgQnIHwQ+ClwwxJ0t/i4JVACzB/VSqSrZHZhe7Y3Ir1K/bD+avD2qeUn/OeJYr86i0zP3ur03A
	ZXFIkisSOYA==
X-Gm-Gg: ASbGncuuUARkILguY3tVkNWpPM/1vzuqWWqFh7KkT58fyUnIxGxiW37ygn205nhJbqB
	+loMXR8cN/J6FLwUFJeYroP3zEwFDCnefYprXKTuCjALROqAb1jS5w5OJ4+DjRrknM8m7ntTRyu
	ERE74e9j6Scq7LrR6KGJGBY5v9KUKiJ4P2VGFsEL7YhMNETZyEbggxUuWtalvJDGPsdT29kOqK5
	8LFjA3VRX26D8L2nhcmzmWCPf+Q7dzFVbpxtk85Jx6pI/Vbw9vBBaSe/HOnA1aCUp6Kf47mQqRf
	2sHXMZysvboUU32IiXrrbOTGFXJEcZLY8fp/X5m4UZ/qQxw3Sr9ipKiHyDtXliAgRe3V+/poJFh
	Bf3tOS+FmbQAc1LuTLVzcsPAjMkHFil2txIGqRXS0BA5JLocDdRlvf/WhTUeIqO7j/OU1vDwqkY
	gepDRPUYC/rkjigDg3J2sFJr5U79VsmImOqy4TaxuZiXNxKA==
X-Google-Smtp-Source: AGHT+IHxNOdRvXOsirKX0EoRqpvHBKPWY34FxNuD1I6M7zR8Nw4e7abpaW2Wbd13aI1oH9+HpvacQQ==
X-Received: by 2002:a05:6000:22c5:b0:3ee:1368:a921 with SMTP id ffacd0b85a97d-42704bf7238mr1500875f8f.28.1760657209379;
        Thu, 16 Oct 2025 16:26:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21] x86/ucode: Fix missing printk() newline in ucode_probe_amd()
Date: Fri, 17 Oct 2025 00:26:46 +0100
Message-Id: <20251016232646.2688404-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
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


