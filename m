Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEU0AnZSsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B063925562B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250569.1548074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j8-0005tj-Gs; Tue, 10 Mar 2026 17:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250569.1548074; Tue, 10 Mar 2026 17:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00j8-0005pe-DE; Tue, 10 Mar 2026 17:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1250569;
 Tue, 10 Mar 2026 17:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aL-0001Q4-H7
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7a07e20-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:31 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so28934155e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:31 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:30 -0700 (PDT)
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
X-Inumbo-ID: e7a07e20-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162571; x=1773767371; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hH9znhbJsO7IzrzhoOYnrjac5Z3LLI2ieI1hChueBHI=;
        b=Y4DkD/FJ6idyy/ETSIEB3Lce9eUGQw5qOmA5brIy9bFsihE5ZkKdJivL5KOxB3BaeX
         SQ0fBpcbDGKb+qltfLu6uqgQMOlYBJr7VfCJ9SCwBET2c7s6k4L9/e2MEtAtvjoKrR4s
         xXj6GLQGX2pd9W4cPwHj+NNBZUIzP//YY0s6ugNpHuIOVtoQmTAcBdG40mNU8QbAsBr9
         tJUV2gKNyw07ofkZy9hc2sNUjKjMJLU7nC7eFh3ZZz+Zu0Jqn3xmd2PgJn3MH8MOxxr+
         AFnXIfHCRd0eAm97JNB/vYubKihg7X7tqcXBKxeoDAoRNDa+FKwSQU9s9OIt+b3CobW0
         47LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162571; x=1773767371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hH9znhbJsO7IzrzhoOYnrjac5Z3LLI2ieI1hChueBHI=;
        b=s5bIpSPsmRDMnARCaWBRrBfgJ7kiKLqVfkgygy+f4vsIql46lN0tUGh85UbxzBkHcM
         H4GC/RLg4Fiuwb1ctU6iSd245i/sOowycwTjlRQAnIh8WGQ8hvC2hB4EGfZT3W55Yeoq
         NYsXcqGaMVeyUUyYMSOGgVsCq+98Cs9J6LNWL7oF6vp4DQMKMB1fQGMql95P7QDr7mUt
         A83abdLLH4xjM9df3QiOTunTrXRqQ2HeH92tlUCgrtBIMcT24ygzSICFV9VksGZ6mSNt
         c6G0B6Juc+wGFoJ6hzOjFuQ6ri8JW+jBZrLwFPANEPq1+N4GSTVsYrJwLk5Vea5jBV6Z
         n5hQ==
X-Gm-Message-State: AOJu0YzXHUVXdt6ffDH5Zma2zKtV5EEJ+6aCOZ0y4WGDOMN8keEm+6ms
	4oExoqL05jtpzH84MVngwK9diCZ8eJIp5RHB0lgHLl/mrMj+XfcFSXX6D06hMZR8
X-Gm-Gg: ATEYQzzzPkY4PTwqAcym4km0sRIM7X4QhNVdyN7qvxKjyVRS0gB9mtyU0PI7SB+DdWa
	I+/7qmRwQUOye3njOV/DRQRFirWK1QLeGlU62Ywj6Xo8TNm8lT53S77z6zXfP22Wz30I3zfXQdk
	X3thEGSgoXAsb1PgEcyMYCUYtMqjvpglSTWaebSNuaMwG71uqbu6UoRXmhwzFnGWrawrBeSXqYp
	OCihTGWPjNjW83gEe4UZNAxkUCh4xhmQePyOINiXwFKuRYgO3xAnbWvBUnXEYwmR7tejQhoEugB
	q1KghQHiiN/c53sqjEmJvo/NaEluMNn4zf7WsqwwYLe6JfZVLS6UHqJykaeTc8PC4oHbNr2peMw
	A8TFuqljC57yyZk8AXtgl1W3tXUb2N5uxtspaDDpqLg/z7PYvVGPtDi8aA2+xqrCKsAqAIrWhLz
	LB+aJTin3SZPZ+XvPbsGBYG4XzGiEVyLOQBmlbv0FXXu4iDrPWR+lzFU1yb0dpK2165zjNlQ==
X-Received: by 2002:a05:600c:8707:b0:485:3ff1:d5c3 with SMTP id 5b1f17b1804b1-4853ff1d6a6mr122929915e9.5.1773162570910;
        Tue, 10 Mar 2026 10:09:30 -0700 (PDT)
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
Subject: [PATCH v1 18/27] xen/riscv: add vaplic access check
Date: Tue, 10 Mar 2026 18:08:51 +0100
Message-ID: <0fc9adf790d4f981e8117bd9759c7e64bb11e439.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B063925562B
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,microchip.com:email];
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

Provide a mechanism for the virtual APLIC to determine whether a guest
access targets the physical APLIC MMIO region.

This is required to correctly identify and route guest APLIC accesses.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aplic.c            |  1 +
 xen/arch/riscv/include/asm/intc.h |  3 +++
 xen/arch/riscv/vaplic.c           | 15 +++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index e139946a05a0..754b444a2a13 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -38,6 +38,7 @@ static struct aplic_priv aplic = {
 
 static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
+    .private = &aplic,
 };
 
 static void __init aplic_init_hw_interrupts(void)
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 76d2fd09cb8b..e6b6c179415a 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -25,6 +25,9 @@ struct intc_info {
 
     /* number of irqs */
     unsigned int num_irqs;
+
+    /* private data pointer of the interrupt controller */
+    void *private;
 };
 
 struct intc_hw_operations {
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 0c69f087cf4d..82e74a609ee6 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -127,6 +127,20 @@ int vaplic_map_device_irqs_to_domain(struct domain *d,
     return 0;
 }
 
+static int cf_check vaplic_is_access(const struct vcpu *vcpu,
+                                     const unsigned long addr)
+{
+    const struct vaplic *vaplic = to_vaplic(vcpu->domain->arch.vintc);
+    const struct aplic_priv *priv = vaplic->base.info->private;
+    const paddr_t paddr_end = priv->paddr_start + priv->size;
+
+    /* check if it is an APLIC access */
+    if ( priv->paddr_start <= addr && addr < paddr_end )
+        return 1;
+
+    return 0;
+}
+
 static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
 {
     int rc = 0;
@@ -143,6 +157,7 @@ static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
 static const struct vintc_ops vaplic_ops = {
     .vcpu_init = vcpu_vaplic_init,
     .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
+    .is_access = vaplic_is_access,
 };
 
 static struct vintc * __init vaplic_alloc(void)
-- 
2.53.0


