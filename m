Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE93A65DC8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 20:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918002.1322761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0l-0005cN-He; Mon, 17 Mar 2025 19:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918002.1322761; Mon, 17 Mar 2025 19:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuG0l-0005ZW-Dx; Mon, 17 Mar 2025 19:20:31 +0000
Received: by outflank-mailman (input) for mailman id 918002;
 Mon, 17 Mar 2025 19:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuG0j-0005ZC-Vx
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 19:20:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e24106e3-0364-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 20:20:27 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso17563975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 12:20:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292d0sm113505845e9.20.2025.03.17.12.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 12:20:26 -0700 (PDT)
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
X-Inumbo-ID: e24106e3-0364-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742239227; x=1742844027; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Y7GwBSlIe4JephGxyPDWgw/D8tBlpC4fN0V/a15tzs=;
        b=J5mfVEKoseh5nLjUA+ahNpiCm9UI1gXOjzMJlZb47WGMPeO7XK8zAKAuaPPquaVKzh
         AFCb5l7uc7118gQafdd7z+Ma4NdF4MGVfkN09rCJ65qA7ldaTNfg87JXpM5CVdmidJyz
         ER5PEY5aEcMAr+ks/cKhxRESHlbA/bjKku434=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742239227; x=1742844027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y7GwBSlIe4JephGxyPDWgw/D8tBlpC4fN0V/a15tzs=;
        b=qrKiUa7hL7OKGVUorMZ03PpglCsV28LjABXHsZUX6vsBoVY9Bnk/k/vSnQnCd2tG9i
         v/zC4z1UWm75g+l0T5dzp8SnQ6pFrEW3CYaOk1xuZ7DbTqYqGo9k1pFRMtFT/bLuHiM4
         jS/UJzq9LFaDZiwSqR06QDO6VLmjDlFQYAocJEXXXwcRM+fpd62HLQImFcfqEiDH90hC
         LVV7PocOhVj5WuvZtxehPOtGjsfoXmjlZOA7WWT37Pr9kFkCQsHzr3sf0d8A9gUKsRto
         +XwTw7EQKSkP7Qy3PknNnHQCP18FC7kDblBch5NX5FSYtz4Yb2SnOT/x14kY8V4O70jm
         RYKw==
X-Gm-Message-State: AOJu0Yzx8qvEnT/Dj9M5nDsNRIRYD6kQltSs+y6439rE1RfVkzpkXHao
	3OCJFaLV8ZLPkCxWtl3/4/ZINL8jGZfIEJUGtuiY/UedRjZS/SGYtXxQe17IOUhEmvJ8JR8ec9e
	u
X-Gm-Gg: ASbGncsN1ALzKQE/aOkeZYzoobe2+NevdpIgaGSsVpICiIUNsyJSH14y/kr5sa9mhVI
	La67upKznrWNg7ikIHACg1FyAMQXh8hpJuXto9JYZpSsqt3uZvSx2LtURUVxEgAQUeCFr3tso5m
	euSi6eFhOYrQwqxzd2qussGhs3YO3R5xdBGHuqOvhksy86ezj3BDB/X/B7+7z4FpOwEdDfkXVr4
	Q1kBfLtmXLnBKuJKiFocOl8THVQhC6YHJTOnSnNKRSFYVjK1YVlae847PIdXd1rJMNmSOkTyvaG
	vHrcbRPuNKasSnpJyUql/60WRORtTk3cMIaWkHenAuWObv2gakPkCW7JT8Ri6wWChEtZ+30IyXX
	4rbdmwKbsALtU6an8x2llQnhBr8UjPa2tBhw=
X-Google-Smtp-Source: AGHT+IHNlTogmWx4Y4vymfRt5E/KjMhTddP35N7hrPExX5OLCaUeV5rGSCgTxms64jHRtMrdblGExQ==
X-Received: by 2002:a05:600c:3ba6:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d1eccbba1mr121781805e9.18.1742239226944;
        Mon, 17 Mar 2025 12:20:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] x86/traps: Move cpu_init() out of trap_init()
Date: Mon, 17 Mar 2025 19:20:20 +0000
Message-Id: <20250317192023.568432-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317192023.568432-1-andrew.cooper3@citrix.com>
References: <20250317192023.568432-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_init() doesn't particularly belong in trap_init().  This brings the BSP
more in line with the APs.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/setup.c | 2 ++
 xen/arch/x86/traps.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index bde5d75ea6ab..718297ca541a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2024,6 +2024,8 @@ void asmlinkage __init noreturn __start_xen(void)
 
     trap_init();
 
+    cpu_init();
+
     rcu_init();
 
     early_time_init();
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index df1155bfb673..a89f4f4f34ea 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1938,8 +1938,6 @@ void __init trap_init(void)
             l1e_from_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
 
     percpu_traps_init();
-
-    cpu_init();
 }
 
 void asm_domain_crash_synchronous(unsigned long addr)
-- 
2.39.5


