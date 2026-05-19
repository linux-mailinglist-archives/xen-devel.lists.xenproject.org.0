Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOZ+Ge8hDGrjWwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B257A4F9
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 10:40:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312577.1582659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzL-0001sh-6Y; Tue, 19 May 2026 08:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312577.1582659; Tue, 19 May 2026 08:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPFzL-0001oV-1R; Tue, 19 May 2026 08:39:43 +0000
Received: by outflank-mailman (input) for mailman id 1312577;
 Tue, 19 May 2026 08:39:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPFzJ-0001lN-4T
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 08:39:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPFzI-00CbtC-Fy
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:39:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21ca-bab6-0a2a0a5309dd-0a2a45018a9a-22
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:40 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c21cc-c1f2-0a2a45010019-d155da35a5c4-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 10:39:40 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-bd2e8931915so818301366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:39:40 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4c2a0dasm689854066b.19.2026.05.19.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 01:39:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179980; x=1779784780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN0HIj7hPfFykJ64wvxm1nWm1JGJKJwdvn0hxtsjuhM=;
        b=ETaQEUEnQZUyQAs3rbO/Sg1DIHp6rgLcdAfF4Oh2H6bt1neKJNtVK7Fv8p7JQg6608
         pvNl+0cCyc7A7RHkyJ6B8sWUN40i5sAZQzNEmYPR7t0vb151FQQDU3n2hW/OefxaJO2g
         Pawgtw8JWSvISqIgO48R+TttryKZi40wBxAvyWGsIvniqbShj6wNj54O4D6R5zdC4rEJ
         UnZMydGh0wSr0JWQmDTuC64IVcyEAEULll6qs2c9SQzHWZ3SdUkYaLJguGBG6L5rEYHH
         oaFpGwxxPzZ/wnEbSTm/v+AkSpBwaT32tlBaP7k4rn+REV9KzDMyvcWwpmcjJ+uZyqkj
         +kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179980; x=1779784780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mN0HIj7hPfFykJ64wvxm1nWm1JGJKJwdvn0hxtsjuhM=;
        b=pslW0qkHtLj7Lgt/tYiz2pibtcN1bG24nxKkRsatVerya4xyYgkNVuIGtTfM7mURFO
         Lis28+5lGPq0Zwj4ZVvx9mvn3tNQ4ieYheUDdNUW0480JzqSMZTnl3DeKRyKaMdmEmC1
         9bkRn6NTo06lZC3TBD6/KlbCz3GziU4N7IeBNBhkdS+kmib3RSs0bmY/ONy9a7JNoC6B
         I1XLuVDaKp7chrW4MQOJ1NTTTB5No9vsDAFoh4w/pD04AM29YdJFieZauM2CchN67zys
         onrEhxc4ZsbmZpV/uiMXLS9meGh32nLjA1S6hVpxMku7Ake8yNkZPx7Ci1VOnJbn1Uhi
         kvgA==
X-Gm-Message-State: AOJu0YwwyPXL4Yq3sQRMy7cbAgeiL36thEs98W/MJ7bTMENZnpksxQET
	7ibb5z7TVogvI5KBt2c8IEncgPwgVGHyckpNrue5B89IgRksP7lz9826wQqKqw==
X-Gm-Gg: Acq92OGmOrK2LjzXJ/ATcYSVrWi1RsvyY69JC0vgmEfJedaS/d5AZeWoj95r+Kws/2/
	zWabYVXx1EGMkLd4/gvJJ9h0aHxNvnsJI4zz5B2Qn8m2FIzqlrdZT3jvJnjf95+CFTuOyI5/IJU
	SLnqFIFrm8tSTHnIU11MnIQn+RqC9mBJ6qkdfbtvKiN9cTpwzzS/TYyLODSoEpBwXiE8XhACoVy
	lwjkFTEIzBChoUWLtNo/DR3V4krOlc6ajEtAunHUXQV2J7ZE613sjJ4aZKjYn03rqlEny9s6idl
	3JqEkvRJ9Wqjn2UzRE1LOdO4SV8mUseiocrxv7MaBHTzrqHaYV3iHGz6y4BuULi8DCJ6GG1SNAG
	xAX0vSOz2b+qW/w5nEstDYt1DtYSyWT6ek+BaXsx/iv0hatMtQk4xJNcxaYIKZUYORi/rlfR4Px
	hGTZs/imkmztMX10p5+7wqkC3Pb49ZA2Tgc8lxrxb3zdfno7kUtBrc9jKrTRN0oA5lbQ==
X-Received: by 2002:a17:907:940d:b0:bd4:f2c7:25e2 with SMTP id a640c23a62f3a-bd51534c830mr839814166b.5.1779179979517;
        Tue, 19 May 2026 01:39:39 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/3] xen/riscv: fix switch_stack_and_jump()
Date: Tue, 19 May 2026 10:39:26 +0200
Message-ID: <1ac102874c8f7190ea09787a035692b03e4b46cf.1779179301.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1779179301.git.oleksii.kurochko@gmail.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779179980-B6143FF4-F7C4C7EB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2802
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1C2B257A4F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following compilation issue occurs when UBSAN related stuff is enabled:
prelink.o: in function `smp_processor_id':
  /build/xen/./arch/riscv/include/asm/current.h:46:(.init.text+0x274e2):
  relocation truncated to fit: R_RISCV_JAL against `init_done'
make[2]: *** [arch/riscv/Makefile:45: xen-syms] Error 1

The switch_stack_and_jump macro uses "j " #fn which assembles to
JAL x0, init_done is a RISC-V J-type instruction with only ±1MB range.

Without UBSAN, .init.text is small enough that init_done (which lives in
.text, not .init.text) is within 1MB of the JAL. With UBSAN enabled, all
the instrumentation calls bloat .init.text well past 1MB, so init_done
is now >1MB away from the JAL. The linker tries to truncate the 20-bit
J-type offset and fails.

The linker confusingly attributes the error to smp_processor_id:46
because the compiler inlines that function into the same init function
that ends with switch_stack_and_jump, and the debug info places the
JAL within that inlined scope.

Note that the `tail` instruction looks more natural here, but the `jr`
instruction is chosen instead to avoid depending on how the assembler
expands the `tail` instruction and which register it uses as a scratch
area (`t1` in the case of GAS), which would then need to be listed in
the clobber section of `asm volatile`.

Fixes: e66003e7be199 ("xen/riscv: introduce setup_initial_pages")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/include/asm/current.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 5fbee8182caa..cc004670d18c 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -51,11 +51,11 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 #define vcpu_guest_cpu_user_regs(vcpu) \
     (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
 
-#define switch_stack_and_jump(stack, fn) do {               \
-    asm volatile (                                          \
-            "mv sp, %0\n"                                   \
-            "j " #fn :: "r" (stack), "X" (fn) : "memory" ); \
-    unreachable();                                          \
+#define switch_stack_and_jump(stack, fn) do {                    \
+    asm volatile (                                               \
+            "mv sp, %0\n"                                        \
+            "jr %1" :: "r" (stack), "r" (fn) : "memory" );       \
+    unreachable();                                               \
 } while ( false )
 
 #define get_per_cpu_offset() __per_cpu_offset[smp_processor_id()]
-- 
2.54.0


