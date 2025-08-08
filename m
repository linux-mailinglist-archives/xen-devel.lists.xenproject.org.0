Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFEFB1EF69
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075019.1437477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcc-0006O4-Kt; Fri, 08 Aug 2025 20:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075019.1437477; Fri, 08 Aug 2025 20:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcc-0006Kk-CD; Fri, 08 Aug 2025 20:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1075019;
 Fri, 08 Aug 2025 20:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTca-0005tW-EG
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:24 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 884a98fc-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:23 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-459e3926cbbso12472755e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:23 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:22 -0700 (PDT)
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
X-Inumbo-ID: 884a98fc-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684603; x=1755289403; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13MkauBuH09ermsY/i1fhguUQBZhfWnVGzvmuz1PuqQ=;
        b=ScOn8kF4jiQ8iKD/gbwMSxVCNgNincQLxNBtLg6hOoIx/eYp20LCDuOcAygCTnaLq/
         K5Nz+JhzjGsjonOvEvpHRzhy9dyk65e5qOqjQw7uGYSFA0RN622+gQjCidGdcOKwAdlr
         gXqLlp6w1INOOFI2gdmBJx3U9YqSTX1iWCG8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684603; x=1755289403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13MkauBuH09ermsY/i1fhguUQBZhfWnVGzvmuz1PuqQ=;
        b=LeBNYUcSrdyZ35LlkmBMHHkPPE2zOIaCyeLMQDFC4wRRrun9vdw+FZbXss2tdMRv8W
         znVvmvLvfLnlzNuSNjK4D8bFfICWYqfND422H6Bh/DIRIM7ffSXAdmFr7LhPMo0+GkrH
         d21UxXQmtcJwEr+dMmWWC23zFM0SRCLfd/GPCtjznZQPAv8eT78NAAMgysnGh0HGVscO
         ynN0bYcaRwUNYd91fxMOj28JvMsBmBehlFRhna/qn2lF9jzJp+ha0Ay1Q7pKb1wr37yf
         Me7pQTFmx+V7j4dFA/TRbKblHsGoghvHN5+ZEQDsGkoR97aNL336ScI7jPOs50IS2GrY
         UuKg==
X-Gm-Message-State: AOJu0Yz18Jb8ZqO43JuEGtjth2mPdhy+WW+iTkiYGpcj86RQIwSy6KIJ
	ouZ8Poppff5B2wBHpmh5IZWAb1FrqIlmAW2c3+FWh+NV6zhrmJ1ASbhHFhPP560qKsB7oceak4g
	XVlMM1Yo=
X-Gm-Gg: ASbGncvDP9VVkSEf8Kwc6w+Qfp4Cl3v0anl/iB46zSXDeXy0RCZkpoM58q9givyIKA1
	Dl8FROs58foZbLE+We07lzjnVaPDvLUIMK+LewgPhG8ypI6gpEeFzw48DzvEP1O/qt7OlKA2P6K
	tFPSAbo5grw4eiBDK/vkzR19T4e1lP2vvcGwoZ9X3ZtgguOuFVq8mb0OQG4L453aOFtKbx9PX3C
	18fpMqahC55qy74ylJEfXKlvk9pJTyt1AFX2crKbZO6ND6mKnYOOC6msWMrXJAqfkrRRvtGi3AW
	AoT9+H8CsgMn3h4CHNH0xORj652luBMur0xUkDIyRqZ+IGOPU4BjZ0Dv3EB1XofPaA+1aheRgeY
	DQTWbe5iphzLtyYT7llvkXvN8ddMIGTHMbEeqkQ6ATWAgfZj1W5fKcQA13+MJFPQAjipJOM6/qo
	zk
X-Google-Smtp-Source: AGHT+IGbesx9l8nGMf7CTQnVncyxpSWuGQ63dhjBS4w7wPbc3OOUllijciJt7hVxgf563vnk/RVjJg==
X-Received: by 2002:a05:600c:1d22:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-459f4fc40b1mr34036485e9.32.1754684602672;
        Fri, 08 Aug 2025 13:23:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 04/22] x86/idt: Minor improvements to _update_gate_addr_lower()
Date: Fri,  8 Aug 2025 21:22:56 +0100
Message-Id: <20250808202314.1045968-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After some experimentation, using .a/.b makes far better logic than using the
named fields, as both Clang and GCC spill idte to the stack when named fields
are used.

GCC seems to do something very daft for the addr1 field.  It takes addr,
shifts it by 32, then ANDs with 0xffff0000000000000UL, which requires
manifesting a MOVABS.

Clang follows the C, whereby it ANDs with $imm32, then shifts, avoiding the
MOVABS entirely.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I'm disappointed about how poor the code generation is when assigning to named
fields, but I suppose it is a harder problem for the compiler to figure out.

add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-24 (-24)
Function                                     old     new   delta
machine_kexec                                356     348      -8
traps_init                                   434     418     -16
---
 xen/arch/x86/include/asm/idt.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/idt.h b/xen/arch/x86/include/asm/idt.h
index f613d5693e0e..b5e570a77fae 100644
--- a/xen/arch/x86/include/asm/idt.h
+++ b/xen/arch/x86/include/asm/idt.h
@@ -92,15 +92,16 @@ static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
  * Update the lower half handler of an IDT entry, without changing any other
  * configuration.
  */
-static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
+static inline void _update_gate_addr_lower(idt_entry_t *gate, void *_addr)
 {
+    unsigned long addr = (unsigned long)_addr;
+    unsigned int addr1 = addr & 0xffff0000U; /* GCC force better codegen. */
     idt_entry_t idte;
-    idte.a = gate->a;
 
-    idte.b = ((unsigned long)(addr) >> 32);
-    idte.a &= 0x0000FFFFFFFF0000ULL;
-    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
-        ((unsigned long)(addr) & 0xFFFFUL);
+    idte.b = addr >> 32;
+    idte.a = gate->a & 0x0000ffffffff0000UL;
+    idte.a |= (unsigned long)addr1 << 32;
+    idte.a |= addr & 0xffff;
 
     _write_gate_lower(gate, &idte);
 }
-- 
2.39.5


