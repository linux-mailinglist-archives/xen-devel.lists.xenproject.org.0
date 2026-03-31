Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AIgIdEazGnHPgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:04:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA67370576
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269259.1558358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eO9-00050Q-7X; Tue, 31 Mar 2026 19:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269259.1558358; Tue, 31 Mar 2026 19:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7eO9-0004yG-4M; Tue, 31 Mar 2026 19:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1269259;
 Tue, 31 Mar 2026 19:04:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7eO7-0004fy-8X
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 19:04:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7eO6-002qYo-Jw
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 21:04:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1aa3-2eae-0a2a0a5409dd-0a2a450ba5fc-40
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:30 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc1abe-ef63-0a2a450b0019-d155802ac901-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:04:30 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so61121765e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:04:30 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a6ebsm66704905e9.6.2026.03.31.12.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774983870; x=1775588670; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES6McZgHHUK3/JfDJnTNyyxwZ5gq9pJEFKhOZMJXQbQ=;
        b=P9gcmbtxtyitWUWixZ3vvGuxg6sJ1cr9HaRZOdUkn+dNE+g1mdHIe4Vw4jU9FQ7oLd
         YrrK/KNiwMDPMi7ccSbi3ti8lybmF1O+OFAn5EDPVNYE3F5pG6ZyvN2u7SQnsAWwPCjf
         Ym2rYIrVpfBO+VsfVFmW1AICCrH7AE+5NK1bkNlV6vsdd+YC+XndrFTT7Uck0FNDDBvb
         MiAoVXo44rCFeMkn+EVHX3PAu0cPRe49UGrWdyhHE1DkYgFUQKAUQP7DUcHWgBkB/IyF
         4kVomkdmWbrLyG/9zwBxMZzJmVtOQWPmYs/086asFVJQl9PrNg5KrGt6NaSgB3YcVr1g
         MzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983870; x=1775588670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ES6McZgHHUK3/JfDJnTNyyxwZ5gq9pJEFKhOZMJXQbQ=;
        b=MKQO/Plvw44NBVFoa7V4RdNVscVN/p1/R3Z1Yw1m2qPfUpiaA0H1tnyuSzgSJPIZv0
         21HpOscy7FZDpVbA/dCr1VVaawATD7GkalMMfflpxwZWrZ78gUewYajgunIqSqlA+/vd
         +w2lIh3X4fG7grEneRu8TIWjQZnfu1I9B2SRpzAVpp6t2MBrU4F2GJpNUwSoMstmh6LH
         genLq32336JxJnGrk5+opRLBVZDxT+Vkb1PFVKRoYGwL6SxXdDz1eRQQvP7/+xQeOJKV
         twIkNtOolyk9pTxgNEaC5aTuLXH43RY3g3Vk/TMCGoHplbtqVncoyv3EBzsfwwNljncE
         fviA==
X-Gm-Message-State: AOJu0YyXY4dSyKTjxfKYxOl2pT+oJ4wtHqybke+b/CXE1rhkpC0EmAYQ
	4ZQ6shy5BiaWo4s0+or6rFmJo5g+7S9U7dVdBpWS/sbOMfDWEQ4wUU/U1cU1Nw==
X-Gm-Gg: ATEYQzxxlGbjyMdzhB4q8azOLTurb5aG03/fNu8LDqNkfMWEtvhUvnilVdFuzpR1vtE
	pF6eZcL6x36yPogJ17pto4yiJq9c25utRFC6lYoFzjyyAePhoeIehTDMWhNOVanO4yrf17yf05W
	FyXyLIizOvT8xjNaSHtIP582aPYGdUVJE7h7Ew1liGMbW6Z8ybAGocuxpXG9bfjYHWkq2QC95Nn
	wge+jHOBftij8QykAEZfzLYLHrVI2K8dEG6kvj8yehgwiSROwMVSJSyosDOmtFsl/oLCXIefbWo
	v/ipt8Zh2qkorXsE7mofN0QNMEiN46wImMNvh2eZJ3LNc4HZiWHGi6Bi16+6V660H57beVmpGUo
	gFypdFNrChBRdAwGyfmhWxrFjYjbSfiRGLTKnv/sUram3bdQiC1GHaqkR1H2TTAkDxNI9AIuG0c
	xtP1YDBVAaBnnC6kIsPMfp7GHHcQLl8FCWesZFCbEKZkVW8oCPVpT2db6RTwqSCprOJUh7pA3xI
	Vju
X-Received: by 2002:a05:600c:4fcb:b0:485:3e20:4013 with SMTP id 5b1f17b1804b1-488835d539cmr9040015e9.28.1774983869606;
        Tue, 31 Mar 2026 12:04:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v2 2/4] xen/riscv: add csr_read_safe() helper
Date: Tue, 31 Mar 2026 21:04:17 +0200
Message-ID: <f870d5def964ee06471d6dde0f66d6585eb5ca36.1774863161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774863161.git.oleksii.kurochko@gmail.com>
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774983870-9AEAA112-8A09532A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2490
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EDA67370576
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Accessing some CSRs may trap when the corresponding extension is not
implemented or enabled. Introduce csr_read_safe() which attempts to
read a CSR and relies on the exception table mechanism to safely recover
if the access faults.

This helper allows Xen to probe CSR availability without taking a fatal
trap and will be used for feature detection during early boot as we
can't always rely on what is in riscv,isa string in DTS.

While touching the header, reorder the include directives to follow the
usual Xen style.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/extables.h/extable.h.
 - s/csr_allowed_read/csr_read_safe() to follow the common nomenclature.
 - asm/asm_inline in csr_allowed_safe().
 - Drop the comment inside csr_allowed_safe().
 - Add ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 - Drop memory clobber as a memory which is going to be changed is explicitly
   mentioned in output list.
 - Rename local variable error to allowed.
---
 xen/arch/riscv/include/asm/csr.h | 36 +++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 01876f828981..1d47f70f7251 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -6,8 +6,10 @@
 #ifndef ASM__RISCV__CSR_H
 #define ASM__RISCV__CSR_H
 
-#include <asm/asm.h>
 #include <xen/const.h>
+
+#include <asm/asm.h>
+#include <asm/extable.h>
 #include <asm/riscv_encoding.h>
 
 #ifndef __ASSEMBLER__
@@ -78,6 +80,38 @@
                            : "memory" );                        \
 })
 
+static always_inline bool csr_read_safe(unsigned long csr,
+                                        unsigned long *val)
+{
+#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
+    asm_inline goto (
+        "1: csrr %[val], %[csr]\n"
+        ASM_EXTABLE(1b, %l[fault])
+        : [val] "=&r" (*val)
+        : [csr] "i" (csr)
+        :
+        : fault );
+
+    return true;
+
+ fault:
+    return false;
+#else
+    bool allowed = false;
+
+    asm_inline volatile (
+        "1: csrr %[val], %[csr]\n"
+        "   li %[allowed], 1\n"
+        "2:\n"
+        ASM_EXTABLE(1b, 2b)
+        : [val] "=&r" (*val), [allowed] "+r" (allowed)
+        : [csr] "i" (csr)
+        : );
+
+    return allowed;
+#endif
+}
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__CSR_H */
-- 
2.53.0


