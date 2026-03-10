Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JvKMk5QsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A8E2554A6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250385.1547863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a4-0001lm-Cn; Tue, 10 Mar 2026 17:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250385.1547863; Tue, 10 Mar 2026 17:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a4-0001ee-8x; Tue, 10 Mar 2026 17:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1250385;
 Tue, 10 Mar 2026 17:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a2-0001QA-8G
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:14 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbfb5bb6-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:12 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-485445e80bdso8157385e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:12 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:11 -0700 (PDT)
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
X-Inumbo-ID: dbfb5bb6-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162551; x=1773767351; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQTAxI2vfkx2VNhH7t+uCNbpYCzRGkHrgeV3afpytNg=;
        b=kIjMY2TcOtVm0g3FH3qXIIVTveg8pfwxQiN1UaWiKLI1fZEE8HG/LKLIhsdl0rAsh0
         aq/FFZcQtk17wFCtGONbgOBUZZOnrKVqbftQ2dmEwfetAuEss+9wvpJBkjm+IwCecz2o
         VYhBe7tYXanN0Ty6qFlPuxfjBRzUNAkBPNLxnDiTXxp+kdKoHGrdpwWeBZZy4VvFnprc
         mlT9NKMjz2LlewR5T90QVcGTGyApkbsK2sdAPBehqrif06Zxl40wZ0pILSZOG7GTkijz
         62ZrQXWyHa9ltAck5tcpUTV0T9wVouuOpoQbxBscADJ+CL/JI2YYr0Gg3PEUDSy+QxOh
         DWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162551; x=1773767351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dQTAxI2vfkx2VNhH7t+uCNbpYCzRGkHrgeV3afpytNg=;
        b=OpqSUlkLAp5FiFhB3WgTZ62cqOqCiFrSJgdjMowzjBgjw1QZ+yPPFf257MXOmNhXow
         M+XVDU+6NRyJzqkXxB7Dj62plnc7bzzir4jIRFORGYbA9tXTUVeywR6KpDaJuS/QP5tt
         1E9rP7t+cO8dFNJ8NYG5fac8ZLztGPFtWGVSz1oy1vX3t4skoi/3AkxmtNSwo6zTdHGk
         8t6Amvk8r8dLscuHQ1KedLFt6rwzrAsD28i0eVJ0OHyWH9FNcjm03E8S+nPuCr4RroPA
         wyF9ki6YRuI0bBepqN0moTIp/Dr5VmMlaHyH4hx2b6xLXlA0ivHT/aHww33BtiG6wiFR
         rpEw==
X-Gm-Message-State: AOJu0Yz9IObBU1SDPmzipXcRqWwaUXBqSBPm9K6cs90ipWcVQfB17JrQ
	mzk1AUyZ+9Q89eMK4LsnGAoy1sgYyjtnG0Bzyf5Jkzau2l4fFosBkQI8KZLigJo7
X-Gm-Gg: ATEYQzxT76sa6bVxEiqIc8mFvyMGd4kKUJtTPeiD1/ZqBUdvKlvEaiINWl12AM6rd7M
	/wWvqmFfT/yrsELfQhN/LWLjqwprkomjoDYKIB0Gee39Tch+VgSs+5B6S4tO3mctHgS4oBRGnbx
	lNpckjTO1QAcMSs6oHNpTNuJHjdodotpzsnPh2JeE/StQI7mpkiVTwwVCJTPbXhm6nqRGR8/Alj
	6Otulw6vb4H0byMUKNBRepDoivlroMTQZOM6Xaqlk1Lv8OHdD/MN1VJnDgmLAZl/4grOCUpH+J7
	fOIJ+WAdZ/Hg9UcaW4mKUOwvK+I11zyszQ/8M0bCcoGzlrx+gwiKnRsVyEihTjtKNDvjksvvCO5
	/yImGnLXE4QYRkcJQGeCVNdX5b9AJy6CBBQpC81U06/Hy+NJcFYY2q/GKEddyQWnmpu+Zm+3ThG
	sBg2VhW0saqCJcn07ekZQ0xMMZl04z2wcXyS+0SDE7MqlsssSsntkAH0hOoWhGNdf/lBf7sg==
X-Received: by 2002:a05:600c:6995:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-4853a27a9eamr154877525e9.0.1773162551415;
        Tue, 10 Mar 2026 10:09:11 -0700 (PDT)
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
Subject: [PATCH v1 02/27] xen/riscv: Implement construct_domain()
Date: Tue, 10 Mar 2026 18:08:35 +0100
Message-ID: <3a86599284108e6f2a27488a03145f8dd1b71def.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3A8E2554A6
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

Implement construct_domain() function for RISC-V, which performs initial setup
for the domain's first vCPU, loads the kernel, initrd, and device tree,
and sets up guest CPU registers for boot.

It also creates additional vCPUs up to max_vcpus and assigns the device tree
address and boot cpuid in registers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/domain-build.c | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 xen/arch/riscv/domain-build.c

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
new file mode 100644
index 000000000000..0ce903a911ae
--- /dev/null
+++ b/xen/arch/riscv/domain-build.c
@@ -0,0 +1,46 @@
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
+    BUG_ON(d->vcpu[0] == NULL);
+    BUG_ON(v->is_initialised);
+
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
+        if ( vcpu_create(d, i) == NULL )
+        {
+            printk("Failed to allocate %pd v%d\n", d, i);
+            break;
+        }
+
+        printk("Created vcpu %d for %pd\n", i, d);
+    }
+
+    domain_update_node_affinity(d);
+
+    v->is_initialised = 1;
+    clear_bit(_VPF_down, &v->pause_flags);
+
+    return 0;
+}
-- 
2.53.0


