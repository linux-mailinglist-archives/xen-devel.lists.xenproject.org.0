Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09F6AB366F
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 13:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981334.1367729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERng-00087J-IM; Mon, 12 May 2025 11:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981334.1367729; Mon, 12 May 2025 11:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERng-00085H-FL; Mon, 12 May 2025 11:58:28 +0000
Received: by outflank-mailman (input) for mailman id 981334;
 Mon, 12 May 2025 11:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uERne-00085B-RB
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 11:58:26 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 685a8808-2f28-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 13:58:24 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so2442436f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 04:58:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7c89sm164194925e9.38.2025.05.12.04.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 04:58:23 -0700 (PDT)
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
X-Inumbo-ID: 685a8808-2f28-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747051104; x=1747655904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13MkauBuH09ermsY/i1fhguUQBZhfWnVGzvmuz1PuqQ=;
        b=plBb4XBSk5cbphflK+cEQ/t17tGc3iWKTI0HfY3/6ZF0MVDliEwcis6of9Fb3LAE69
         ToX3oXs9ifm4lDuzNOBEC4B4IJtgscJYaNc6NukVzsfA/Sgk2qHIjX0FzpTHdi/StYZ0
         tHsvKq7ORcZd1J/4OGNU6hZAX1Y3AAflSArOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051104; x=1747655904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13MkauBuH09ermsY/i1fhguUQBZhfWnVGzvmuz1PuqQ=;
        b=blkyarepP7F+yvJzVK4OnUE7h8wnbZcJQNJ6U2CCA7hUF4BApUm8pUNV+vDtHrcjpv
         N/nlTLz0bOKp2NidKX0dymUSKyob6UuplNzFi7r+rRS5ZU8SzAge2cho0CF0I0WqVNUs
         md9MgLNfvTeoO4XwKrWD8XgJuAytxnzXLdJKTJCwwCeEY9m89fSd8JeMEdBm5slCTBLS
         1xd5Dubua7F4MmIZyIb3yAGAEjMWhLYY3T5MPMIRiCACJyk/by2EVVqg2MCSojIMqUHr
         SdG62ovOIOvUaeEhd626TaQtyGNy5thisRMNuVzs/kw3cr3qGF2qZlTmBbHFXpHCwRO6
         kJ2Q==
X-Gm-Message-State: AOJu0YyhbjjKEU3rznqbDdqksldKX1h/SYoC+GB98gMXjnLAKpLRV68A
	QN7sQLqAR7rOVkakBcFCng6CEjLccRXCbYHzjcnX13P3EIyUU1ZBFXi63SHds21WbVqmxoenWWz
	9
X-Gm-Gg: ASbGncunAopm9GqRHYwYm8ljHC/J7sT96FPPDcj8pWphjof0UwHjVoCUe4ZnpKSVQJK
	yG1gdg4gapLiSV8gfPrdc/+9Z1+F/7oWHjfArucRL7dY1AhLOhrat3PP+Ju0diqRDTk7IZvpbld
	jMlveRX8PJv98T1uF3DJU00a/CBEVN/IY93ock3w3sj/KDJLMBA5UY9MENzOBh4jMYTcMVuFtSM
	AqnlFg/o2uETial0kuBelurKm5z/dZ7NrEl1y8HEx+j2xtMQfUxtvyiIuHxy9mS8MbGQ7w9rEyp
	Lxkt+oxdY4fNr8tNDyKRKzqF4aI7SiBvPcUetWi5+WVxH1s+kln6/TgbWaseD8Y4bcL/71VFoof
	3l4BySd3HBjeXnPMO7BnNpZPp
X-Google-Smtp-Source: AGHT+IG6QrcUJ/ZIO7OBToaPa9UL75zA32ElOmFpp6UnK2ZFdurh8+2ji/LkDXOULYW3JqN7m+ZCNg==
X-Received: by 2002:a5d:5f56:0:b0:3a0:85b5:463b with SMTP id ffacd0b85a97d-3a1f64ab29fmr10853978f8f.48.1747051103794;
        Mon, 12 May 2025 04:58:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/idt: Minor improvements to _update_gate_addr_lower()
Date: Mon, 12 May 2025 12:58:21 +0100
Message-Id: <20250512115821.3444375-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
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


