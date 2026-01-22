Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uObLIb9UcmkIiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC656A3F1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211344.1522879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqU-0007Lg-0k; Thu, 22 Jan 2026 16:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211344.1522879; Thu, 22 Jan 2026 16:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqT-0007Iu-UF; Thu, 22 Jan 2026 16:47:45 +0000
Received: by outflank-mailman (input) for mailman id 1211344;
 Thu, 22 Jan 2026 16:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqT-0007Id-21
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:45 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1194e987-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:42 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b87003e998bso401411466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:42 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:40 -0800 (PST)
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
X-Inumbo-ID: 1194e987-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100461; x=1769705261; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIURivnVVNz+Sg90MgEK4c9c+A2jqXCTv9hUdU686As=;
        b=WQhqzsRpWji3kJNWGbP3Rhp1SgAbH4gHXfNhHHofUvRtZPvI1zdSXBroVAFNq8W31Q
         PxQ/irR7Yy24poddgqj2VeWl0nZ/HKLHhGfMj+WHP1vII7bxHLfnP9kVnb49KweLLDas
         COIz+i15MNruyRkiyFmE5WAfPyXozxPFZle9tFH0SkOMi1GfHaDAp5IP/MWPaOHoNTAD
         Wf6ZtwDWck9yy0n4vJtxDsYNd7elaQ1XHeMPb6KoOH7MoJrrrnVX2PfQ6K7BbD824Omy
         uOUFc3Xw3RTfsXI5/Hx17VE812u1NxhWzSFlPJDfRwS6nZ/TXnIDmWrY9wOWa3L66OUZ
         xwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100461; x=1769705261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIURivnVVNz+Sg90MgEK4c9c+A2jqXCTv9hUdU686As=;
        b=sx9m6J93ggmO7CMyfMJTb4zoCAFN0EYOsZwioqY7wX6xKT8E5kLFRlO/GLNgmJ0lf8
         mkPWHn11bpki6iD0hlOHzL4MLDCjy9+6a51RxmlmZdkWMs7ixuNmcu1cOQVIhJWOBV2c
         Ng+SB1Hud+r17Xm7/NBgFaN7VTzUHcFA/aLI2PMmX+P6T5oX360SjcHGSkXM1Lu3qJCa
         ZGDdDSznLGQ2iU2OzSQn+B+4hHmunptejn4jkG5sHAwWVWVn97z67utwWYyhOBxyfCXS
         CDh9UGFkUCQ6hv5cW+MqOIXA0Bf8hKijSHflZs/UgcU5NXRuJvZRj5/HBkB6uWd9Ae/p
         FFWw==
X-Gm-Message-State: AOJu0YwsAkESGxsS/KjenWwCHM0bZYskbGN7FKNhA3PY/rKZxS8rHlIE
	L4mYrVcPpR1VvQWq4f+wAzJAluXdB5+tmmgtGTLis/0gsgCT7Dgh9Cd1lmui2g==
X-Gm-Gg: AZuq6aI6rbwsaQiXB3mJipuJPCvLKPXjnxUXcXXwzESIvGOb5lLQ+nFXAEYcTzpe8bT
	E+MSQYd0niVilNgLzeTLdgJmQ2PD6HuinHOsS53iRYuVSPJ9bZjvPjKJGVJRUgGfeC4eUts9hEQ
	n9doz0s37Bw/dB0nO0c10tzt65oUCzbTw99GzCmf4fJcpawfERU9yu+QU9C1/8CMEdS5itCeoGO
	rATDzSf8xhmn4nr/7J1u1if1DsGIZQfkE4Iugb0FVDrfTMnQqZSCfLVrLFyuO36sRGXeAlqnHxZ
	r2WyvIN8t+TrCryIiFZDtBGUHMW+WuVbV7KeYu5KG/NczfqF6PShV8eVkiFwIMSZ62XwOYhuL6z
	gzrGeHpkaHZUvF6kT1atGNWDAP+QPwPi/2W929+jnwPhjGhozSSpjNiqJOHuwvlJ/aVYshkiM/H
	zOE5Aqm7BXn2Q6PvGqDaQUleWq5mFF4cA2VQgaVFCniH+2Ja98HZ/h9A==
X-Received: by 2002:a17:907:7251:b0:b79:eba9:83b4 with SMTP id a640c23a62f3a-b885a262ce4mr3468666b.6.1769100461100;
        Thu, 22 Jan 2026 08:47:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 01/16] xen/riscv: introduce struct arch_vcpu
Date: Thu, 22 Jan 2026 17:47:16 +0100
Message-ID: <ef706b474a23cb24a7bc119f8206e9df527b7287.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3CC656A3F1
X-Rspamd-Action: no action

Introdce struct arch_vcpu to hold RISC-V vCPU-specific state.

The structure contains:
  - Guest-visible CSR state, used to save and restore vCPU execution
    state across context switches. hstatus isn't added here as it is
    already part of cpu_user_regs struct.
  - Callee-saved registers used to preserve Xen’s own execution context
    when switching between vCPU stacks.

It is going to be used in the following way (pseudocode):
  context_switch(prev_vcpu, next_vcpu):
    ...

    /* Switch from previous stack to the next stack. */
    __context_switch(prev_vcpu, next_vcpu);

    ...
    schedule_tail(prev_vcpu):
       Save and restore vCPU's CSRs.

The Xen-saved context allows __context_switch() to switch execution
from the previous vCPU’s stack to the next vCPU’s stack and later resume
execution on the original stack when switching back.

During vCPU creation, the Xen-saved context is going to be initialized
with:
  - SP pointing to the newly allocated vCPU stack
  - RA pointing to a helper that performs final vCPU setup before
    transferring control to the guest
After the first execution of __context_switch(), RA naturally points to
the instruction following the call site, and the remaining callee-saved
registers contain the Xen register state at the time of the switch.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop hstatus from struct arch_vcpu as it is stored in struct cpu_user_regs
   which will be stored on top of vCPU's stack.
 - Drop the comment above ra in xen_saved_context struct as it is potentially
   misleading.
---
 xen/arch/riscv/include/asm/domain.h | 57 ++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 316e7c6c8448..0d9b4c4b525e 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -22,9 +22,62 @@ struct hvm_domain
 struct arch_vcpu_io {
 };
 
-struct arch_vcpu {
+struct arch_vcpu
+{
     struct vcpu_vmid vmid;
-};
+
+    /*
+     * Callee saved registers for Xen's state deep in the callframe used to
+     * switch from prev's stack to the next's stack during context switch.
+     */
+    struct
+    {
+        register_t s0;
+        register_t s1;
+        register_t s2;
+        register_t s3;
+        register_t s4;
+        register_t s5;
+        register_t s6;
+        register_t s7;
+        register_t s8;
+        register_t s9;
+        register_t s10;
+        register_t s11;
+        register_t sp;
+        register_t gp;
+        register_t ra;
+    } xen_saved_context;
+
+    /* CSRs */
+    register_t hedeleg;
+    register_t hideleg;
+    register_t hvip;
+    register_t hip;
+    register_t hie;
+    register_t hgeie;
+    register_t henvcfg;
+    register_t hcounteren;
+    register_t htimedelta;
+    register_t htval;
+    register_t htinst;
+    register_t hstateen0;
+#ifdef CONFIG_RISCV_32
+    register_t henvcfgh;
+    register_t htimedeltah;
+#endif
+
+    /* VCSRs */
+    register_t vsstatus;
+    register_t vsip;
+    register_t vsie;
+    register_t vstvec;
+    register_t vsscratch;
+    register_t vscause;
+    register_t vstval;
+    register_t vsatp;
+    register_t vsepc;
+}  __cacheline_aligned;
 
 struct paging_domain {
     spinlock_t lock;
-- 
2.52.0


