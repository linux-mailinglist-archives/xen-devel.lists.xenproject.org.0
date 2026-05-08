Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIuBJsD2/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B804F7FC4
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303766.1577121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQw-0000t2-4F; Fri, 08 May 2026 14:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303766.1577121; Fri, 08 May 2026 14:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQu-0000fP-Vd; Fri, 08 May 2026 14:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1303766;
 Fri, 08 May 2026 14:44:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQr-0008UU-Bs
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQq-00A90j-Oj
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a1-bab6-0a2a0a5309dd-0a2a450ad498-34
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:00 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b0-56b3-0a2a450a0019-d155da2dd564-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:00 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b9358dd7f79so346790766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:00 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251439; x=1778856239; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf0PN9PpYiXbtYRSRq7xGC31fGLLdoz6at7ycs7iR6U=;
        b=G/RSBu+uCm5kZrPRB9rnDa8dxzQY7sJTXjHplcmS3/9KGUdqV4oZKZEfaR4MsfNBJP
         NCgtI5FzNEWntrP4EQa9ntQB0D70Ic3Z03CKAVhK6Ui6KokW9au8bLvVwwbUWTiy4qJS
         ulMxmaBwQUvbyqfvc662r2rldz7qUmNSa0S3zQJjeJHc3HPCu9zI3bhon5wj9xktpU8n
         KwjpWDy5OC4yX+ZMvehlwm6VdxCYjaHT2i09ACL5MwYVdbyVXzHsdSXkR/zvz/3Xisoo
         uD7EGpznJk91QqSHJqWr8ZeD1fScZwjwgykPeMn+OJ6FRJPzudygvxscgOsMDXV6mYUC
         V+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251439; x=1778856239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf0PN9PpYiXbtYRSRq7xGC31fGLLdoz6at7ycs7iR6U=;
        b=H3CxaYnvzNkW3XfK/VvENlx9YYZ8d+QBQoqx9vUu+DyifT+QKb4N6BpeH/TecdmE6a
         b2Z0B7r+FvUBdli99BtOmx6Ic4YR/erni0DjFi+XLsuZbuPjZAcdM0wZlSuq++5SZ3x1
         dODHAwgDeZZn8xB0MmBqyGl1fEIvTfbVmgZa/3uIFGsV/f4sU9DQMI00Oi9qKOOZjX8c
         XUYlwKjwXGvgvU/pnJ6z2146wzEN+x1GDHV2QTxAGFLWOnMjMqj/7/55jNadfjFKjerv
         U7ja4Q0g5zzOLcK2EnF59NsQkggyuSTthqTjMxuMdmZLmpVTem0Hq+auvFGZp/LJ8ye/
         gkSQ==
X-Gm-Message-State: AOJu0YxhXp2xNN0IbMl0KyRXu0liwmlOVM27qq64aPoPM9Px6swfQVI1
	jhNurpci58Ns7TOoJsFHubxhhnNE/MnaGTLbiVSy6Q7NBuLwICw5Iveg+LfhRA==
X-Gm-Gg: AeBDiesVlXK0fAf8dN2hHYfFDnLQgSu6Wnu/OVicyXS9KVhTwoKcZCNG4Ybs+ahFkhM
	k36r13GQ+tAMdVHJucevWvmau+FJVUcdxIiHB/fIrVD1hF1sHEhX+hgurN4Ye1SNv8+7kGJ+p04
	V50Ypk9vQefSCTojm8qXTxFKASFryrM57uicEhFB9mDM+tPRRgp85HGHJRGHsWgIjT8IskZkw1j
	edgeV9+ksJM29je6gPQG5R/raub8WaBWtISAvd4BO2BKjTRLtsPTlzV7bdiDgNQ0CSXhWvEuhbJ
	7KJCpmgFlqncF/ft8svBhWUJao7Omxj3ZyT9kZWVv23AjmtcC/p5E8tZsuMMHBhk3YqO/gEL3np
	H8KIdzCuqMG5vVAzQAXXJVv8VVfOtI4sRGmPQT3WoWoG34lInSt+Xp/Bo3TThAuOKRQwVFX+MWN
	g69kqi5Ig2j6CW7aWXycSS3CZ5TGgFolmg6tELfg3+C1njRzDjYnJKDarJUeZPogHCjw==
X-Received: by 2002:a17:906:ee8a:b0:bc6:92e5:818a with SMTP id a640c23a62f3a-bc692e5827amr609579166b.21.1778251439207;
        Fri, 08 May 2026 07:43:59 -0700 (PDT)
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
Subject: [PATCH v2 15/26] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Fri,  8 May 2026 16:43:17 +0200
Message-ID: <fc5560cd49a2b952ce7724c23e41da3368833d9f.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778251440-73F798B7-DD593986/10/73395122804
X-purgate-type: spam
X-purgate-size: 2725
X-Rspamd-Queue-Id: 52B804F7FC4
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
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the momemnt as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop __init for domain_vintc_(de)init().
 - Update the commit message.
---
 xen/arch/riscv/domain.c           |  3 +++
 xen/arch/riscv/include/asm/intc.h |  3 +++
 xen/arch/riscv/intc.c             | 36 +++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 7aa00d6cfd95..6de5b82b3724 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -306,6 +306,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     return rc;
 
  fail:
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 3b30d000066a..89a9c6806e55 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -80,4 +80,7 @@ void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
 unsigned int intc_irq_nums(void);
 
+int domain_vintc_init(struct domain *d);
+void domain_vintc_deinit(struct domain *d);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 122adf78a391..7f9850416bb4 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -11,6 +11,7 @@
 
 #include <asm/aia.h>
 #include <asm/intc.h>
+#include <asm/vaplic.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
@@ -94,3 +95,38 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
 
     return -EOPNOTSUPP;
 }
+
+int domain_vintc_init(struct domain *d)
+{
+    int ret = -EOPNOTSUPP;
+    const enum intc_version ver = intc_hw_ops->info->hw_version;
+
+    switch ( ver )
+    {
+    case INTC_APLIC:
+        ret = domain_vaplic_init(d);
+        break;
+
+    default:
+        printk("vintc (ver:%d) isn't implemented\n", ver);
+        break;
+    }
+
+    return ret;
+}
+
+void domain_vintc_deinit(struct domain *d)
+{
+    const enum intc_version ver = intc_hw_ops->info->hw_version;
+
+    switch ( ver )
+    {
+    case INTC_APLIC:
+        domain_vaplic_deinit(d);
+        break;
+
+    default:
+        printk("vintc (ver:%d) isn't implemented\n", ver);
+        break;
+    }
+}
-- 
2.54.0


