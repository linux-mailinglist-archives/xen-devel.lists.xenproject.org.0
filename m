Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN5dD42fgGl2/wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6275CC8A9
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 13:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218574.1527414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVX-00069J-6v; Mon, 02 Feb 2026 12:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218574.1527414; Mon, 02 Feb 2026 12:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmtVX-00065y-3l; Mon, 02 Feb 2026 12:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1218574;
 Mon, 02 Feb 2026 12:58:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lssc=AG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vmtVW-00064e-AI
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 12:58:22 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4897cc4-0036-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 13:58:12 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-480706554beso48047475e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 04:58:12 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbd0f043sm107954345e9.7.2026.02.02.04.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 04:58:10 -0800 (PST)
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
X-Inumbo-ID: d4897cc4-0036-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770037091; x=1770641891; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCI6k1gY6hOQ2mQg++ELmk05/We6ArMoGY0m7U5btes=;
        b=eVEIF2XKupOCYe1HF/FW+Ml5yT7nZQg28EDXtYJ4ZXqVIMuQwmrKBjiCiV2NCGjJK/
         Jj4cdqRb8694nY2IQV5KTIHuDG7ehBfaAX3Qc8dcRi12y/zVII107HMvqOikkAj4EMp6
         ejntekFx3AaTFLeRu1bBno+/xQAxPa7qs3Uav1uOcchlPAP+ybcxc9nX0pR95wUYPx0u
         oqmkeAusWfZxT/cOpePNSgfSgW+WrockMQTYct5qn+BmPPuLE/jS6UOASpi77O0JN8EK
         23kwe95sC/gBOfpy0yR96PbJtSgG0TqqqjTf2i2ixiU0U+LrmXPGnC0NWKcoXMwiXHN2
         hsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770037091; x=1770641891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SCI6k1gY6hOQ2mQg++ELmk05/We6ArMoGY0m7U5btes=;
        b=ADw+COdCO+Z0iOLzRib+j3/UKMclRB30cCUy0+29xfD/8fhnzg9BZgi6W5DNbbD70e
         aXf7I1izP3fpuZP3G67kziWvSjhIp0Rs46YFrHSVH7tbQ52TAdw9CJmLTDhUGw2QQpx3
         23Y2cVO8g+igN+5EupTFGlreFFWQoXwAGefaQkBkoW30ec4AWxVi370nrGn3FLTQdo1J
         nUIRPqoN8+0W3AF1MfcmM1hif7E2VT84VBLt7UjS4jHkq3JxMi28+IY5Kbm51zRXIr6q
         EiUHA3Pmxzkt7PyklN+qsRcYXwpuQPMbKDNTbrgKL6yjvQArBvi6CwiKu1ooh+d815iY
         RC2g==
X-Gm-Message-State: AOJu0YwszNlIvAUwQhspEnZDpbj+fKxw8jTB20WUCewGozKyymUAjSQ5
	CFaTmMKVKHrN02wxNvXm4ZKOsxnpDTgT7EWUVzKjz/gmwruxtdcO4bHdUqHPKA==
X-Gm-Gg: AZuq6aLzBIm8thjnNuwAT3iXBKddFeGgrEiiG7ALolS23QfxOwK8BlxUWWwv8w9utSz
	yB1RA8KT/Tb910mZtIh/VwAPYITplH2quM8zOyaQRg9gLgMCHfd9mSSirBZXYLJ7clNZDnfF7h7
	edlLq1Av5NHDAuLc2QDeHLVGDGhVcejZC9yo8rckIYqarUHFb2j8sDXwD/cLTLYtWzBl/leJHl4
	9R2C3f/GXFIsrovcoOW/1VbDZix8/IzA3F4VfV6m6Ahxd0cudsJSAPwiDeGd3Plbwl0HKp5ZqdU
	1mTXz+o90D1v79nfN/sQZpay2sCefhOvlT9WdvGelF60ElWMCzFsA2cd3fzCa3T6f1EQw2jDo1G
	Rw9EYZgma3OV3RIIu2iSQ5fin4Y1RyKOCbpHvn3eY2sy+j/MOO1NotmIArqRrWqFZRAeNHli328
	9GlnslKymE9AkJaU3DIz7l8r/AGm5b9vWCfqd9RJuy/jJDObwvp8wu7g==
X-Received: by 2002:a05:600c:1d1b:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-482db4939d8mr145289775e9.20.1770037091020;
        Mon, 02 Feb 2026 04:58:11 -0800 (PST)
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
Subject: [PATCH v1 1/3] xen/riscv: introduce struct arch_vcpu
Date: Mon,  2 Feb 2026 13:57:57 +0100
Message-ID: <98214488c67fac866ba519c368aef697da2d2bb6.1770036584.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770036584.git.oleksii.kurochko@gmail.com>
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B6275CC8A9
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
Changes in V3:
 - Drop gp from struct {...} xen_saved_context as it ought to be stable accross
   Xen so there is no need to be saved/restored and, also, it shouldn't be
   preserved across calls according to RISC-V ABI.
 - Update the comment above struct {...} xen_saved_context to make it more
   clear.
 - Drop CSRs and VCSRS comments in arch_vcpu as it is clear what kind of CSR
   it is based on the name.
 - Drop __cacheline_aligned for struct arch_vcpu as proper measurements can't
   be made now so it is hard to prove that the attribute really boost
   performance.
---
Changes in v2:
 - Drop hstatus from struct arch_vcpu as it is stored in struct cpu_user_regs
   which will be stored on top of vCPU's stack.
 - Drop the comment above ra in xen_saved_context struct as it is potentially
   misleading.
---
 xen/arch/riscv/include/asm/domain.h | 49 +++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 316e7c6c8448..cca39effc1ba 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -24,6 +24,55 @@ struct arch_vcpu_io {
 
 struct arch_vcpu {
     struct vcpu_vmid vmid;
+
+    /*
+     * Callee saved registers for Xen's state used to switch from
+     * prev's stack to the next's stack during context switch.
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
+        register_t ra;
+    } xen_saved_context;
+
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
+    register_t vsstatus;
+    register_t vsip;
+    register_t vsie;
+    register_t vstvec;
+    register_t vsscratch;
+    register_t vscause;
+    register_t vstval;
+    register_t vsatp;
+    register_t vsepc;
 };
 
 struct paging_domain {
-- 
2.52.0


