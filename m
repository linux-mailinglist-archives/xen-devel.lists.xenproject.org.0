Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM/aOE1QsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B073255486
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250389.1547904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a9-0002rN-H0; Tue, 10 Mar 2026 17:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250389.1547904; Tue, 10 Mar 2026 17:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a9-0002oO-AC; Tue, 10 Mar 2026 17:09:21 +0000
Received: by outflank-mailman (input) for mailman id 1250389;
 Tue, 10 Mar 2026 17:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a7-0001QA-AZ
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:19 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df095baa-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso119284305e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:17 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:15 -0700 (PDT)
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
X-Inumbo-ID: df095baa-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162556; x=1773767356; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5Dqi7QE0P+NZcaNQ4Uuko5WRqJ3CVy0ngqKC6es19A=;
        b=nD53nNjwmA/lbqg4xCHcfXQrbVYhV5OqWNbt6K5tiI1lciiMxxVNBrIkCP5Qhq86PQ
         xz4tMjoen8Fch0yA33lS3NPN65kRYnV9yg3clqoaLAbFFqPIlmVGiQQqcDbvqhT7Istd
         k0BhuEdjc1LU86Mrk8wbxG2o/T7Pv9lQ/JxrOWEhAkUpriL4FUeHBvb4hIiy/7UTSr/e
         lPaknNQlGwefi3kCGFLNCmxex7eNv9JjD0WfLoSqdTcdaV8QgCWFwt8td8hDpdWOnpzq
         aOw0BpE63w7nGdb6HgzMli3QhOBPlgEZ8Vv11KWDW4oUUSX+2uWINTQXZa072E6HvqTY
         bakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162556; x=1773767356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5Dqi7QE0P+NZcaNQ4Uuko5WRqJ3CVy0ngqKC6es19A=;
        b=Qn53DSGpIPvAvjCejPB1+Jv3XqYdNUvDRHpRjGKzYMEZlcQJ/d6e1rh4XH7s+bf6jZ
         hbJWiXkBIb2cPyarJCFIh8eGkHq0sKx720vhgZHehRgSkI5CCtBHAaL50qSneNq/tpol
         XS/fxJmjuzqK0gCeecQvVL7KbLmDVfT1b/H2BEfAY1qLVuhXUD8Zg3h1Nnplrrk2nkAW
         cFsPBHg8rh9cvIxPNeLw3DIVAPq2kgYf4egY01OGiZWvfA/9to1L++X+2qGxiGvifF+z
         l1AYbK/SC9gZgdb/jPgYOhJvPtwU05ht+ar9HY2a9c/cooZCfSuKoP/UVlWX6TbuBU/+
         LL8w==
X-Gm-Message-State: AOJu0Yz4Wwi508SJb20q5EBZmfyziBBrYGZqgFDeWXTsMtfxIT7yY1Xg
	9lg8i5NNTx52qjorVXHm4nMpW785edZivoFKZxnywjHHTMaoUK7Rk5XDFfwH+WOc
X-Gm-Gg: ATEYQzztahiCkTpZWpKbUqqmkRVRxPJLPGQKl9LHil858Ki5j0MCFZ0QB0yE2gPFB61
	WiM4pqRCDoTSdOgfP6VH/z+i6cbF78tBe2bRiO9WykGVHVM2vQt+cU/3hLX0aYdpRHr5vzoYpED
	ibcG6E37ROOwzTMxQDpiF6siJbbEwY+zlt9Nab/oL8NK2j6MOhJhWrYcCoq4hEPjhtwJtY/zLlm
	Y4ajGR1bm6Cu50+yPbDQTNini2LpsRxz9WC3EW442lX2XvGYe+jZlYrapOMe/kqbauIbPF6+FEJ
	Om/89IFMRK4W2P4ecmwGlXLb1loAzqS/M+vvfT/eRNu1IltQdrl1CEK+tUlZX4+CVFd1mLezETt
	axs3TCPL4DDSqMX+2A+TVMhQQj3vPGXAUJctB7TNtqsCkxcxj2esdcawoLXd3dQeer6IRP5Jhh3
	+RdJ3WyTJIb7Gf3T3iT7R5JOnfJ5WobxMPVg8FxaQu+Uz2yn7sz6Duhrhq3YSyemsoXA==
X-Received: by 2002:a05:600c:3f0b:b0:485:3bb5:92c5 with SMTP id 5b1f17b1804b1-4853bb598e8mr120108175e9.14.1773162556236;
        Tue, 10 Mar 2026 10:09:16 -0700 (PDT)
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
Subject: [PATCH v1 06/27] xen/riscv: implement make_cpus_node()
Date: Tue, 10 Mar 2026 18:08:39 +0100
Message-ID: <fd64b8526a23e9d7775b9b48c5a933b0673c4fba.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9B073255486
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

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile       |   1 +
 xen/arch/riscv/domain-build.c | 108 ++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index b1514f1514a2..6c6c58ed1ac0 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
+obj-y += domain-build.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += guestcopy.o
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 0ce903a911ae..633f02e42c5e 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,8 +3,10 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 
+#include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/guest_access.h>
 
@@ -44,3 +46,109 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
     return 0;
 }
+
+int __init make_cpus_node(const struct domain *d, void *fdt)
+{
+    int res;
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    unsigned int cpu;
+    u32 timebase_frequency;
+    bool frequency_valid;
+    uint32_t *next_phandle = &((struct domain *)d)->arch.next_phandle;
+
+    dt_dprintk("Create cpus node\n");
+
+    if ( !cpus )
+    {
+        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
+        return -ENOENT;
+    }
+
+    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
+                                           &timebase_frequency);
+
+    res = fdt_begin_node(fdt, "cpus");
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", 1);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", 0);
+    if ( res )
+        return res;
+
+    if ( frequency_valid )
+        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);
+
+    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        char buf[64];
+        uint32_t reg = cpu_to_fdt32(cpu);
+
+        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
+        res = fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        res = fdt_property(fdt, "reg", &reg, sizeof(reg));
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "status", "okay");
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "compatible", "riscv");
+        if ( res )
+            return res;
+
+        BUILD_BUG_ON((sizeof("riscv,") + sizeof_field(struct gstage_mode_desc, name) + 1) >= sizeof(buf));
+        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
+        res = fdt_property_string(fdt, "mmu-type", buf);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "riscv,isa", guest_isa_str);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "device_type", "cpu");
+        if ( res )
+            return res;
+
+        res = fdt_begin_node(fdt, "interrupt-controller");
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
+        if ( res )
+            return res;
+
+        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
+        if ( res )
+            return res;
+
+        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+        if ( res )
+            return res;
+
+        res = fdt_property_u32(fdt, "phandle", (*next_phandle)++);
+        if ( res )
+            return res;
+
+        /* end of interrupt-controller */
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+    }
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
-- 
2.53.0


