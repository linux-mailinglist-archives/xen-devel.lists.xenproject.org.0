Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKZfLBA/tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9628754D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254118.1550109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d6-0004Wc-Ts; Fri, 13 Mar 2026 16:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254118.1550109; Fri, 13 Mar 2026 16:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15d6-0004Rm-P4; Fri, 13 Mar 2026 16:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1254118;
 Fri, 13 Mar 2026 16:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3qR=BN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w15d5-0004GG-CC
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:44:51 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f339755f-1efb-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:44:49 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6642c9254c2so1346891a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 09:44:49 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66350b86008sm1394733a12.28.2026.03.13.09.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 09:44:47 -0700 (PDT)
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
X-Inumbo-ID: f339755f-1efb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420288; x=1774025088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuU0sIa/VVlWbkh1TAky3TiyUmxNd2Qh9VKL5gjHn0k=;
        b=loPICnzuKd343iWNPlJjaz33BKshEr3w55lwx81Vx1L8DJlYD+Xj8yZ1WWxL6m8w1c
         QmKkrkGz8odl2XG4ygR8VIIbhQ8or1AwgN+NaJDU4OuCxB/u0PLBbUiD5eigJS3zS1Kl
         gMdKaWIZHTzG/Dpd0nz5DvkgxfFygAZHoEbFSsCDTA6qbVAglL6hUi3liDJbvxVtKtev
         L5oQ90PillVZuhth7ofS7r7H4seGToHKYlneB56Fs5slSc1jOC6XGpyCnq7pTwJqTeyz
         sYYOL9LYIHRhpH9wUsr+gG9aAXbEUfA0LQV7+9u0laOV4Cn8Duqh5IhvaoJgqG7FnMxV
         NRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420288; x=1774025088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuU0sIa/VVlWbkh1TAky3TiyUmxNd2Qh9VKL5gjHn0k=;
        b=qXLo0fT1mShYtzutR/wqxW4lwYM3NANAnhEbvZ1DE4Cx3MXyJns21rTjD8LYaYS5RB
         xij4EXh2vycupr1/t/m2T6YExNuWrmYEXIhfGMWSwisR08GxeXMaEg2ZtfzS9/PZjjBJ
         yjeJ0H1SDkPNRx+X6RNPC+MesSHVuoWRbLiAoiPslMYXjdzos+Pkt89rPSknf5sR81VM
         DPBCCDgN4HhcKc1dZ1xYBLkej0mf/uKkhsogvbGV8KCE4U5L9FtRSbsA29r/pKn/TTA8
         jurHppnQFcTyAhUcks0tl7oLlnv4CRGgo5+oMMhq1PBRe1TtbchANk4bJuHSTdMRvEhL
         wp3A==
X-Gm-Message-State: AOJu0YzoX3UOlwXEPt8sU9Xqt8Bji6bDNnybHunoUI4JmZr7SfIo5aZq
	p1OQ7dim268B3SJwERwQhpg7+yKgk9RLx71ieK1dBT+g/aWUwcsUiJDJddAMUg==
X-Gm-Gg: ATEYQzynBJVmfcAzl4RaWR68gt42aLpUM464+JwyErMi7VtSE2CcqGapHrvKV0hcOQ+
	RkEYHvJWrLeqfkLETQPwHPrui9bEAzYeqbLmJVwsq5/AlfQVXMZ3bzuwZeUthGvJW7KI1TF+p6P
	8+ZhDZ7aLZJww1r7KH3F2mZi4yH2lrURDCFR4ICO0ccgIQO086d8SM2QoQ5zW/C5Dmh4WNg46PN
	fX2WgGAJddiMpaov+tAXHXb4mQvBnUsVDzRJJ6VrmvkwCrRNIG8Gs+O6b/YlfSMKrJtd7Klv5Lb
	yDU03z3NkC0PBgaR5Jy8407yX9IopAEDxlzEPKXVAYz5KuI2I3y3Sb5LuZ7lnK/FyeurnObgiYg
	yflk5SUcsVi+9OYe/c0AEQ2NxgHb3DayMhXJTIQashCs9Tn5tUUoYNSkdPNY2ZQmJqtIm2alIlm
	VM4o/AIgAQHU4rSVexi0yNbOOFRr66YIJhy+j0asQl1VUHv9unUKMrrzaqkzGi1y9WaTS8itOyE
	iAnLAw7
X-Received: by 2002:a05:6402:1e96:b0:662:fd15:1ae with SMTP id 4fb4d7f45d1cf-663babf76afmr2209158a12.21.1773420288310;
        Fri, 13 Mar 2026 09:44:48 -0700 (PDT)
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
Subject: [PATCH v1 2/4] xen/riscv: add csr_allowed_read() helper
Date: Fri, 13 Mar 2026 17:44:36 +0100
Message-ID: <2ea34e564533accb33ccee66b4a8c7a750733ae0.1773419622.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773419622.git.oleksii.kurochko@gmail.com>
References: <cover.1773419622.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 65D9628754D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Accessing some CSRs may trap when the corresponding extension is not
implemented or enabled. Introduce csr_allowed_read() which attempts to
read a CSR and relies on the exception table mechanism to safely recover
if the access faults.

This helper allows Xen to probe CSR availability without taking a fatal
trap and will be used for feature detection during early boot as we
can't always rely on what is in riscv,isa string in DTS.

While touching the header, reorder the include directives to follow the
usual Xen style.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/csr.h | 34 +++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 01876f828981..b9bee3d25d21 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -6,8 +6,10 @@
 #ifndef ASM__RISCV__CSR_H
 #define ASM__RISCV__CSR_H
 
-#include <asm/asm.h>
 #include <xen/const.h>
+
+#include <asm/asm.h>
+#include <asm/extables.h>
 #include <asm/riscv_encoding.h>
 
 #ifndef __ASSEMBLER__
@@ -78,6 +80,36 @@
                            : "memory" );                        \
 })
 
+static always_inline bool csr_allowed_read(unsigned long csr,
+                                           unsigned long *val)
+{
+    bool error = false;
+
+    /*
+     * Use "+" as a constraint instead of "=" to ensure the compiler passes the
+     * initial value into the asm volatile block. Otherwise, if the instruction
+     * (at label 1) faults, the variable 'error' may contain an undefined value
+     * instead of 0.
+     * If reading of CSR register was failed, we don't care about val, so "="
+     * constraint could be used in asm volatile block to not force always init.
+     * val argument before being passed to csr_allowed_read() functions.
+     *
+     * This avoids the need for an additional instruction inside the asm block
+     * to explicitly initialize 'error' to 0 before executing the potentially
+     * faulting instruction.
+     */
+    asm volatile (
+        "1: csrr %[val], %[csr]\n"
+        "   li %[err], 1\n"
+        "2:\n"
+        ASM_EXTABLE(1b, 2b)
+        : [val] "=&r" (*val), [err] "+&r" (error)
+        : [csr] "i" (csr)
+        : "memory" );
+
+    return error;
+}
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__CSR_H */
-- 
2.53.0


