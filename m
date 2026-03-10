Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP8aDDVSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:17:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E62555CC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:17:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250486.1547983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00hw-0001fh-RZ; Tue, 10 Mar 2026 17:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250486.1547983; Tue, 10 Mar 2026 17:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00hw-0001d2-Ou; Tue, 10 Mar 2026 17:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1250486;
 Tue, 10 Mar 2026 17:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aG-0001QA-Ut
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:28 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4b15c46-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:26 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so42815305e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:26 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:25 -0700 (PDT)
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
X-Inumbo-ID: e4b15c46-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162566; x=1773767366; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy9UOUys3UP8UGf9H+CdlAJHj+mjN4CkBQ2c+J9DOhU=;
        b=eNkH5XxLel6q25erVdnuA/b+IoXyWg4q/2/UpEnkdLsPiMKy/4uu2H4blxnTOeL43u
         mvi9c5fS6pjKKLKoe0XSZOP2XkWZajy6qsALKX6kRK239LJgbNrv2B1iPwCOHdE7ublF
         ERA6JBJlI9lDkC5G3LpJwJkopK1TSvZlV52/HKToY9qbB9hoKHnK1uM1vc20MS8iMLo6
         5C/wve2g6jX4zePoPLBfUafAjkobFF8FRsB4ALCyqDA+VvmhIfx50V+hrw+eprrVcIhq
         1zZ6wQOWPwSWMqDsTFOZN4fLNkC6oztnWRPWpKX8OZ8hX1T0GLI4Y8UJa6GKT+28Oc/S
         L0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162566; x=1773767366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wy9UOUys3UP8UGf9H+CdlAJHj+mjN4CkBQ2c+J9DOhU=;
        b=rP8cj9b6+erkrcpdNfhnebUHne8iCqDDYTPebTNEgXIr6ux/5Rp4i3MuLhax1VvblO
         VNqB1pYEGX35DSyGaIaZYswv+X7Est5Gvq31fSxzx8Z2I70MDDlG9vs3Mg2QalCiPfgV
         SLSLyVsVkVaG+i1DUaqG6DN2dnIlIxprpLxaSSr3MJwRfql/n38eCBq59LEPvHmcZZr4
         2PWIwfDXi0QhjQjxovTSgAAuY5Z7Nqa4mkyWYDd8zWx2jlTI+yyuWuhd1RxyGjcXiqPx
         ae1kNGDUuP4DOUsU8O+lHtMNs7iwhWXCH6gK/+MHcaU4J4mw+yJHg/+1v7XEvA6kYj+d
         tG8g==
X-Gm-Message-State: AOJu0YwImh8gYk4S0YGZUZflFVnvkN+QrS+dIp71TiOG9Yx/u8GHiw+Z
	QfI7M5WJbHt/9YqM/4AFAPuR70t2/TTL6wQmYtBLEI6/diQCzTQFMzTpUs+dRqLd
X-Gm-Gg: ATEYQzw+hsVIW+JvFrgEPa5FNJbhVxpwf2mJyqWdudyAArZjP/Kj0lFee4OPv61EX6E
	MjHmx4znsP/aTt8ipilMoPHMW3nbhFxTNEaNguLdVeQAS4DruLv6yE0hlFu54sALeyvRKns0r5C
	4qpKfoC0u5JrNH94skM6yEccPHLC3ehV+ybPX4hZ1mcBA2MZOW/b85L9eRpyq0X1xAo1VRCIoc8
	JJ9O/VFEc97tdRSWslN+B3/VSicV/7yJtcUN7UNzlgsntRVe/RieElmG9zvqUzZg8ibLcKHi/LK
	dd4LkFxhhviS4Dp96NEDFiMfIUsTkfmwvraln2nH8QchyUz5YWB8O1xXyT+yq9gMMRrOpUR7xmr
	F9sPkLqYkBDhGSLlh0mjPpca6Lr4vcE6yht5RMXMQ9sEcSoBqfwItUeYs1BF3VN+sglHHVNLjEb
	TNWk2ZeY11fpiBjaRMwPZLggi/ojPz8SHpgpjlZpRqaR+i3gvVPNaLta90smBxT/KqIQ==
X-Received: by 2002:a05:600c:3b89:b0:485:3f1c:d8a4 with SMTP id 5b1f17b1804b1-4853f1cda4cmr106634755e9.9.1773162566012;
        Tue, 10 Mar 2026 10:09:26 -0700 (PDT)
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
Subject: [PATCH v1 14/27] xen/riscv: introduce per-vCPU IMSIC state
Date: Tue, 10 Mar 2026 18:08:47 +0100
Message-ID: <8196fa8f000e384af697a44cb3d50ece966e82a7.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DB5E62555CC
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Action: no action

Each vCPU interacting with the IMSIC requires state to track the
associated guest interrupt file and its backing context.

Introduce a per-vCPU structure to hold IMSIC-related state, including
the guest interrupt file identifier and the CPU providing the backing
VS-file. Access to the guest file identifier is protected by a lock.

Initialize this structure during vCPU setup and store it in arch_vcpu.
The initial state marks the VS-file as software-backed until it becomes
associated with a physical CPU.

Add helpers to retrieve and update the guest interrupt file identifier.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/imsic.c              | 42 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/imsic.h  | 17 ++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 0956b187705f..bbadbdf352a1 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -59,6 +59,29 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+unsigned int vcpu_guest_file_id(const struct vcpu *v)
+{
+    struct imsic_state *imsic_state = v->arch.imsic_state;
+    unsigned long flags;
+    unsigned int vsfile_id;
+
+    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    vsfile_id = imsic_state->guest_file_id;
+    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+
+    return vsfile_id;
+}
+
+void imsic_set_guest_file_id(const struct vcpu *v, unsigned int guest_file_id)
+{
+    struct imsic_state *imsic_state = v->arch.imsic_state;
+    unsigned long flags;
+
+    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    imsic_state->guest_file_id = guest_file_id;
+    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
@@ -315,6 +338,25 @@ static int imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+int __init vcpu_imsic_init(struct vcpu *v)
+{
+    struct imsic_state *imsic_state;
+
+    /* Allocate IMSIC context */
+    imsic_state = xvzalloc(struct imsic_state);
+    if ( !imsic_state )
+        return -ENOMEM;
+
+    v->arch.imsic_state = imsic_state;
+
+    /* Setup IMSIC context  */
+    rwlock_init(&imsic_state->vsfile_lock);
+
+    imsic_state->guest_file_id = imsic_state->vsfile_pcpu = NR_CPUS;
+
+    return 0;
+}
+
 /*
  * Initialize the imsic_cfg structure based on the IMSIC DT node.
  *
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 506365f199c7..bdb1ffd748c9 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -52,6 +52,8 @@ struct arch_vcpu {
 
     struct vtimer vtimer;
 
+    struct imsic_state *imsic_state;
+
     register_t hcounteren;
     register_t hedeleg;
     register_t hideleg;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index a63d56fbd5d9..13a563dce066 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM_RISCV_IMSIC_H
 #define ASM_RISCV_IMSIC_H
 
+#include <xen/rwlock.h>
 #include <xen/spinlock.h>
 #include <xen/stdbool.h>
 #include <xen/types.h>
@@ -64,8 +65,20 @@ struct imsic_config {
     spinlock_t lock;
 };
 
+struct imsic_state {
+    /* IMSIC VS-file */
+    rwlock_t vsfile_lock;
+    unsigned int guest_file_id;
+    /*
+     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
+     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC SW-file
+     */
+    unsigned long vsfile_pcpu;
+};
+
 struct dt_device_node;
 struct kernel_info;
+struct vcpu;
 
 int imsic_init(const struct dt_device_node *node);
 
@@ -78,4 +91,8 @@ void imsic_ids_local_delivery(bool enable);
 
 int imsic_make_dt_node(const struct kernel_info *kinfo);
 
+int vcpu_imsic_init(struct vcpu *v);
+unsigned int vcpu_guest_file_id(const struct vcpu *v);
+void imsic_set_guest_file_id(const struct vcpu *v, unsigned int guest_file_id);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.53.0


