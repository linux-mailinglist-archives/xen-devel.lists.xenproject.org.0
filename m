Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCLRAbv2/WlklQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5E4F7FAD
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303757.1577100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQq-0008A0-B8; Fri, 08 May 2026 14:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303757.1577100; Fri, 08 May 2026 14:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQp-00081x-KC; Fri, 08 May 2026 14:43:59 +0000
Received: by outflank-mailman (input) for mailman id 1303757;
 Fri, 08 May 2026 14:43:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQo-0007kt-0g
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQn-00A90j-DV
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a6-bab6-0a2a0a5309dd-0a2a450581d0-20
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:57 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6ad-aaa8-0a2a45050019-d155da33c02a-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:57 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ba545100a13so360284966b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:57 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251437; x=1778856237; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MqW7oYxoiwR9Upy+HAuK/pfkhgDIEYHUh/OodAHs5I=;
        b=f2ZT5yfq+epYOENha3RXQUVZ9QozLPuaNWB4SRXAlmnhwOlxHK4Tp6bv4YTMvndzEl
         ljPf6e0x6Vt7xbZFp7UT/u+5pIJ0s0lWjbT91moc7RGjv5mS020EUx8Ap6IBvZXAcGfE
         aPHrT7f0wU3L93AlNFhIddp5DsVlef6Y7P25sPgcP2wKbhqonfx3wJUW+xy0WZcaMr04
         IpEPZNigNEJhIb+wSyUnQPyxNair8KTBk2EZU9qsXdqzIdu6mTRLtr8a1MJI2jZlt3JE
         z4PyWVqgcxlHUR2oCkQJcPlno0ZBxitBnW0cLIJwBgbzSSQ0pAukFZhNfOkFFVMsxsyB
         /lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251437; x=1778856237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6MqW7oYxoiwR9Upy+HAuK/pfkhgDIEYHUh/OodAHs5I=;
        b=exwo9fVKvVo4eYwqSjjFlql6Pk7SZXqJjDI1G80F14C9tXp2KWeF5Wdl6+WbDG+wpf
         abu9hBZ03zODuBGl6dl+4OidpMdA5XanTrdpVPXyfV0D7l4esYZndVLB3rfU5OuAs6vy
         1PtGoYi6pCsauzODMNNvn0Utkn1DG6f/A0Ja2G7WHdcfzJjdwTzgt3Rfyn5Ky19tda6h
         6WfXxfXjmMTdpto2uCeVRkPKeXAzq7wJh8LtsgqsbJYPxTtFRwyJWP6dRKxxq83vVeKW
         0P90J4OpVoxecwZd29MuCsH4QGfd6iAcwiXis8VSfSYuHDO+AIwu8HbNAnARaaBR7GIs
         ubyA==
X-Gm-Message-State: AOJu0YzJVft3vX378F+n5xm9PjeYueDyyM7m6BYrp7KZSgLGmt6KenBm
	u1VPWxj6iLk3Pmd/MBsmxpytwqUhVlYhIVslMcNdR10BdCkABxuirC4wROf4yw==
X-Gm-Gg: Acq92OHyyi38xxW31jF6UorHqWJweFTzHEMXFczFPTuXkXsqLWYZjT7kcU7T7fHuT05
	3LC9+iJLLmPTEAotvdQ3k7CZ6rMPX/niRY710PmkDQMPhOkvnvvpbae3T9zA+d4x6ZEK1aOp8rM
	A1cv1Na3GBMwWqc4gfSDDnLoEC3OHZSoO5jTSWpvCKkojtNVKRYMyUbcMc10LSDmx7YJgpZVcHb
	AyYZUulvz9361qaduO5axc2WXR/7WiwelSGJhpbGL4ruPJHHFtxEgMVcbGICAMJG36hhqL83a9E
	1255hoW9AeY7oh4DLZV984MN0YfFpKulbBFeMyUr1GZQlPX+RKFeqoj4YeA8WkwdN5J9tccY1+Q
	YLsHC4rmtJGyv8F2FefH2O1W7bn8cPR91GuXhG058XXEPLPqHwnD8qp2roibK3i2Bb8+cXD0HRE
	tY5PFOX2E/07NevMKSBsO55+cDudwedb0j3DRJHGfo66snfO6lyZXryezEbhrgN07X+Q==
X-Received: by 2002:a17:907:9495:b0:bc2:7f6a:e4c5 with SMTP id a640c23a62f3a-bc56ce33c23mr724437866b.25.1778251436435;
        Fri, 08 May 2026 07:43:56 -0700 (PDT)
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
Subject: [PATCH v2 13/26] xen/riscv: introduce per-vCPU IMSIC state
Date: Fri,  8 May 2026 16:43:15 +0200
Message-ID: <2471b51e89aff30765433d88b1646c5b2c72b5c2.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778251437-D917D443-B31D0D0C/10/73395122804
X-purgate-type: spam
X-purgate-size: 5109
X-Rspamd-Queue-Id: A2D5E4F7FAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Each vCPU interacting with the IMSIC requires state to track the
associated guest interrupt file and its backing context.

Introduce a per-vCPU structure to hold IMSIC-related state, including
the guest interrupt file identifier and the CPU providing the backing
VS-file. Access to the guest file identifier is protected by a lock.

Initialize this structure during vCPU setup and store it in arch_vcpu.
The initial state marks the VS-file as software-backed until it becomes
associated with a physical CPU.

Add helpers to retrieve and update the guest interrupt file identifier:
- imsic_set_guest_file_id() is going to be used during vCPU creation to
  initialize IMSIC interrupt controller things for this vCPU.
- vcpu_guest_file_id() is going to be used during update of APLIC's
  target register with the pair of information <guest_file_id, cpu_id>
  (to have MSI delivery mode work properly) when guest is trying to
  access vAPLIC's target register.
It will be used in the follow up patches.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Rename imsic_state to vimsic_state.
 - Use 'unsigned int' for vsfile_pcpu.
 - Drop initialzation of ->guest_file_id as it will be by default zero.
 - Add the comment about ->guest_file_id field.
 - Drop __init for vcpu_imsic_init() as it could be used during post-boot
   vCPU creation.
 - Update the commit message.
 - Drop locks around ->guest_file_id() in  vcpu_guest_file_id() and imsic_set_guest_file_id().
---
 xen/arch/riscv/imsic.c              | 35 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/imsic.h  | 23 +++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index a4460576f620..8b46419ca23b 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -16,6 +16,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/macros.h>
+#include <xen/sched.h>
 #include <xen/smp.h>
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
@@ -56,6 +57,16 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+unsigned int vcpu_guest_file_id(const struct vcpu *v)
+{
+    return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
+}
+
+void imsic_set_guest_file_id(const struct vcpu *v, unsigned int guest_file_id)
+{
+    ACCESS_ONCE(v->arch.vimsic_state->guest_file_id) = guest_file_id;
+}
+
 void __init imsic_ids_local_delivery(bool enable)
 {
     if ( enable )
@@ -312,6 +323,30 @@ static int imsic_parse_node(const struct dt_device_node *node,
     return 0;
 }
 
+int vcpu_imsic_init(struct vcpu *v)
+{
+    struct vimsic_state *imsic_state;
+
+    /* Allocate IMSIC context */
+    imsic_state = xvzalloc(struct vimsic_state);
+    if ( !imsic_state )
+        return -ENOMEM;
+
+    v->arch.vimsic_state = imsic_state;
+
+    /* Setup IMSIC context  */
+    rwlock_init(&imsic_state->vsfile_lock);
+
+    imsic_state->vsfile_pcpu = NR_CPUS;
+
+    return 0;
+}
+
+void vcpu_imsic_deinit(const struct vcpu *v)
+{
+    xvfree(v->arch.vimsic_state);
+}
+
 /*
  * Initialize the imsic_cfg structure based on the IMSIC DT node.
  *
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 136d9e816a44..42c1db91bd86 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -54,6 +54,8 @@ struct arch_vcpu {
 
     struct vtimer vtimer;
 
+    struct vimsic_state *vimsic_state;
+
     register_t hcounteren;
     register_t hedeleg;
     register_t hideleg;
diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
index c6c59215df20..2b84824cd377 100644
--- a/xen/arch/riscv/include/asm/imsic.h
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -11,6 +11,7 @@
 #ifndef ASM_RISCV_IMSIC_H
 #define ASM_RISCV_IMSIC_H
 
+#include <xen/rwlock.h>
 #include <xen/spinlock.h>
 #include <xen/stdbool.h>
 #include <xen/types.h>
@@ -61,7 +62,24 @@ struct imsic_config {
     spinlock_t lock;
 };
 
+struct vimsic_state {
+    /* IMSIC VS-file */
+    rwlock_t vsfile_lock;
+    /*
+     * (guest_file_id == 0) -> s/w IMSIC SW-file
+     * (guest_file_id > 0) -> h/w IMSIC VS-file
+     */
+    unsigned int guest_file_id;
+    /*
+     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
+     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC SW-file
+     */
+    unsigned int vsfile_pcpu;
+};
+
 struct dt_device_node;
+struct vcpu;
+
 int imsic_init(const struct dt_device_node *node);
 
 const struct imsic_config *imsic_get_config(void);
@@ -71,4 +89,9 @@ void imsic_irq_disable(unsigned int hwirq);
 
 void imsic_ids_local_delivery(bool enable);
 
+int vcpu_imsic_init(struct vcpu *v);
+void vcpu_imsic_deinit(const struct vcpu *v);
+unsigned int vcpu_guest_file_id(const struct vcpu *v);
+void imsic_set_guest_file_id(const struct vcpu *v, unsigned int guest_file_id);
+
 #endif /* ASM_RISCV_IMSIC_H */
-- 
2.54.0


