Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SCqtLa/QS2ojawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FEE712EC0
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ik/sDORW";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355493.1610331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliI-0008Az-Lc; Mon, 06 Jul 2026 15:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355493.1610331; Mon, 06 Jul 2026 15:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliI-00088S-Gk; Mon, 06 Jul 2026 15:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1355493;
 Mon, 06 Jul 2026 15:58:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliH-0007ta-9J
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliG-003COz-MK
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd092-2eae-0a2a0a5409dd-0a2a4502b80a-30
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:28 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0a4-5a27-0a2a45020019-d1558031d16c-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:28 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493c59f740cso22407835e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:28 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:27 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783353508; x=1783958308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLy3qyx924BwMCcddx6KluNT1kSq6alsUk5vcF9j5ys=;
        b=Ik/sDORWAvy5pbB9ArKmqNnPtyhxbWROlpS5mG2HXJyjVbtKUkhL+0cJwp8sLOoLic
         d8MldxFUAaB9D+1EGcLgY+ltTcnnA1kdcrkjhHqzuy0Xnpqcqz5dvAGclFUP/TNxCC2l
         zNydx4khxzHpOIVddCBWXZaOwIK6S7B5C8C2TJz8yacIyuwxORPep2fbm8wLtacuAwi8
         oUYEbARg1BJNrA6zNHV074n+S8dGzUaDafjjUBvnQ/jPRzVVHx4KBnt2rl/4vC6u/l+D
         FVJtYNGXFhxyu9gTcYBh4H7aepnAZ6CyaqBlT9VLxm5C44/Q3aKoDd53VbxJFzrW1yj0
         KTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353508; x=1783958308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLy3qyx924BwMCcddx6KluNT1kSq6alsUk5vcF9j5ys=;
        b=IMMUC6Llfz9nOdb2ecqFeWIZellKZA97XLJofIvtjFN93JswAwCjtlO+rs2EX6We00
         NuiL18W9re1ftblltBD2fLPsrrxYAPtLEDKpziaova8hBlI/nftoCVIJMLap0ALTEOQM
         ZvrgPiXK3JI9e+qx8tumyjYroxPRb6StC25hQsl6TURdHP2jVoU9u31Lovmnmrh+z2BG
         SymOSd56R6Iq4H+2ONSfU7UpDRUN1wVtQiwTc5RC4U+/cAtSHe98Ht7FcJM7HT2r3Ue4
         QeVFmmesOkvBvXkwVVpWAqY925gd4e9rbsA1XYODl83Q4stTqwYhUczVUPZahx6qAAdo
         08AA==
X-Gm-Message-State: AOJu0YydBSPyF4hxh6MuWzBJRfFvzcIsDKTXN/4LgUbBK9l6QdB0IChN
	EZV1LZVhQKdhbS8HhClQhP66auzmHJ7+n5SiN8Qv7P9iYLFkN7c2Miea8DGqHw==
X-Gm-Gg: AfdE7cnvjloGxuwySAa4ZMFfH25ayOm41yeu6wujypVsTPiVzsW2UnHsI1M+dDPIGWQ
	Jc5PGjdVxeka8LX8MDXVXrzXCFl2UFHxZH8L+yGGt3QX7XFx6xDabnaN1rh80i5pXeuRu2TKQaf
	9Xve2I+IuqcdeXmz0Rc8zSFRWBpvbq2EEjpsuSW8ume0ci8ad7hixiRepz+aJ1S0dR5ia0C0FA4
	7dVjrhx7b7ZiWaYzusO9YkwWn7946M73xyntOBJOEbZxDiak+oOZN6rkp4iC3nghfhpbMYEVefR
	fWFcb9OC7oGPPdxhmgmZJBWCT/v+F1UdaXgpBB4WQAXAH89HO/uFd546UdaXFyxOoH963mOriAh
	P+iUzUucsBE0RWlf4bP3eDbmj1b3sDk96HFOdIsW7Tt449Up4AORxae1TyuQ83jXf+lgXt4Mdf3
	W2cB2SxCCIusVJSKzd5Nvwk3IV+J4Cq/nzA0BlPMUII9mQd/FNXOUtQPlf9A==
X-Received: by 2002:a05:600c:3143:b0:493:d800:204f with SMTP id 5b1f17b1804b1-493df0a7521mr14274605e9.21.1783353507784;
        Mon, 06 Jul 2026 08:58:27 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v5 07/26] xen/riscv: Implement construct_domain()
Date: Mon,  6 Jul 2026 17:57:48 +0200
Message-ID: <77cfcb52b46c96d68e1fe4032b238bf40f77e3f1.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783353508-547197C5-2B2108C2/10/73395122804
X-purgate-type: spam
X-purgate-size: 3114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65FEE712EC0

Implement construct_domain() function for RISC-V, which performs initial setup
for the domain's first vCPU, loads the kernel, initrd, and device tree,
and sets up guest CPU registers for boot.

It also creates additional vCPUs up to max_vcpus and assigns the device tree
address and boot cpuid in registers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Only rebase. Nothing changed.
---
Changes in v4:
 - Drop the blank before v%u in the printk() failure message so the output
   matches that of %pv.
 - Restore Acked-by that was lost in v3.
---
Changes in v3:
 - s/%d/%u for printing vCPU index in the failure message.
 - Drop dprintk() for successful vCPU creation.
---
Changes in v2:
 - Rework construct_domain() to print that vCPU1...n are created using %pv.
 - Use true instead of 1 for initialization of v->is_initialised.
 - Drop unnessary BUG_ON() in construct_domain().
 - Add TODO comment above *_load() functions.
---
---
 xen/arch/riscv/Makefile       |  1 +
 xen/arch/riscv/domain-build.c | 50 +++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 xen/arch/riscv/domain-build.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 8f7fd625dddd..fd5e499eb4b9 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
+obj-y += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
new file mode 100644
index 000000000000..5f6f4b6248a5
--- /dev/null
+++ b/xen/arch/riscv/domain-build.c
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/fdt-domain-build.h>
+#include <xen/fdt-kernel.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+
+#include <asm/current.h>
+#include <asm/guest_access.h>
+
+int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
+{
+    struct vcpu *v = d->vcpu[0];
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
+
+    BUG_ON(v->is_initialised);
+
+    /*
+     * At the moment *_load() don't return value and will just panic()
+     * inside.
+     * TODO: it will be good to change that.
+     */
+    kernel_load(kinfo);
+    initrd_load(kinfo, copy_to_guest_phys);
+    dtb_load(kinfo, copy_to_guest_phys);
+
+    regs->sepc = kinfo->entry;
+
+    /* Guest boot cpuid = 0 */
+    regs->a0 = 0;
+    regs->a1 = kinfo->dtb_paddr;
+
+    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
+    {
+        const struct vcpu *tmp_v = vcpu_create(d, i);
+
+        if ( !tmp_v )
+        {
+            printk("Failed to allocate %pdv%u\n", d, i);
+            break;
+        }
+    }
+
+    domain_update_node_affinity(d);
+
+    v->is_initialised = true;
+    clear_bit(_VPF_down, &v->pause_flags);
+
+    return 0;
+}
-- 
2.54.0


