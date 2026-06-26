Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sc92HgefPmr8JAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41196CEA08
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aFmNTRke;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346277.1604783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8ld-0001uJ-0U; Fri, 26 Jun 2026 15:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346277.1604783; Fri, 26 Jun 2026 15:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lc-0001oH-Rh; Fri, 26 Jun 2026 15:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1346277;
 Fri, 26 Jun 2026 15:46:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lb-0001V4-Ih
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8la-00D1eP-VG
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee5-5cb7-0a2a0a5109dd-0a2a45028256-18
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:54 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eee-5a27-0a2a45020019-d155a72bc5fd-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:54 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5aea367c965so1125147e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:54 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488814; x=1783093614; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+TCKMUSTuyvYICiXP6HL6dmH/uLiRs4XxAzoc6J/CE=;
        b=aFmNTRkeF13lSg79F+24Vw/T0BoRFYokJtbfv017PPU/0/NoFqwMvOE/cwyQqe6v2d
         MC2RYjB5H9Dh3YJC46rGv5WXiVfrSYYl6hu7m3qPf4A9DwDsoYlQWnok2wKJ38Ghp73v
         0I0Zw0M2S6b+VEia1wHeSPLjzQUzFlMC7d/R7Hu9t6ZEjFpx/W9kY5jREfamNGra1DNO
         WrIcQWvFK4uPF1iMJgrdMeaemJj9LD54TZzyAFbKW0GAdlThmwsOuLPahemwskjmfkVU
         63yFj7d1VekI4ZpN8a1NJ7ZufnL/MT5xjdFROVIZ/sWK3Z+4xMNjD1IPAcjcttnjdBK+
         ZXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488814; x=1783093614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+TCKMUSTuyvYICiXP6HL6dmH/uLiRs4XxAzoc6J/CE=;
        b=l67ECE/NWASE2Jqhs2yEF62r0PoHJy/N3rM98wL+287WdxDc5pmIrtzpn/kWkC16/1
         Y0nFbRHTKUJfo+RHokRIPLS3zdzlr2w+Rq2glRkJZHpFldGl3jlbBW3abeb1E3IlAb5D
         /GhxQxxBkZyGLP69FRtPB+VHdgbHo5JPkIxsvrFhRBIb77t4yM9VgMJV3Om7H3m63OCa
         FIWTkaLaqWBlHGCfVCMrdH5MVOuHrpR3Sd+0qnhyOoRn4/q9aZyydw9O2YSXsgcP2qxT
         Fo+klLaHRDaMiF9ZAHzjFbCOq4x+aoIwlto8c77nav2D0u2oxXfIQu/cTDzW80xkuE0l
         qrsQ==
X-Gm-Message-State: AOJu0YzN5wbv0Z7PTwpL/6jxsp/c3E32Hdcbe2HWAt2xmeeyYS/PjIWk
	PF1TxpWLF96ApMfVlQQRwyGqIGRlJLkLVcFhDgtyoK8TEWZDuV6C+Zh5PlqKaQ==
X-Gm-Gg: AfdE7ckcL0Idn4P3Q4H/I1P5GUlsTJUI7cSxw1FugfLna5C8vezha0W2b6B4CBX4ocO
	8WlJOFOnG7OXWC523fyu3O/M6OUOpw5jQF9ctCQU4KNJZ7sa6mWNzvRpjmE2qpaJvRiw9/adV9B
	nZCnqA/scXRnTfxG0MoH8xWVsg/jeYTJKbFmXh/+O5+XdrrpmWzWE9i7gn4xvBK3IvVWBhQhNeh
	xa2nhKMLdw1Q4bKvSckfEgngb/dEA9eWozEOI/TFaZ/Pats0pZpF7zuzXgV4gUT5Ljb5PRXBHP6
	x+Ml0M3B3krfbnDttfps0raic4dFXe7s9pkhp/ByGHnCQnmH/VVL56wYmaK6oRY9tyBI8yb9ayk
	MlNRU//uqoiIRnFXSSnC3vHnVxemI2nMOm1xILbKMUDqTAUK560j0er5NoIBqy6ZZ3T5spJ2Co9
	r66t5ZsVT2RqB9itXKpWcDn+BU0mzgJMfmCtgchN5b8HrSn78TcT2iKYDErA==
X-Received: by 2002:a05:6512:651c:b0:5ad:317f:a9a6 with SMTP id 2adb3069b0e04-5aea1f3f8demr1909934e87.8.1782488814088;
        Fri, 26 Jun 2026 08:46:54 -0700 (PDT)
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
Subject: [PATCH v4 09/25] xen/riscv: implement make_cpus_node()
Date: Fri, 26 Jun 2026 17:46:18 +0200
Message-ID: <56211b75a05c8738d23caac9273ce40e39e8663f.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782488814-4F1127C5-113466B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 4834
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
X-Rspamd-Queue-Id: E41196CEA08

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Update the comment in make_cpus_node() to match code style.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v3:
 - Add blank line above make_cpus_node() function definition.
 - Move 'unsigned int cpu' from function-level declarations into the for loop.
 - Drop 'uint32_t reg = cpu_to_fdt32(cpu)'; use fdt_property_cell(fdt, "reg", cpu)
   instead of fdt_property(fdt, "reg", &reg, sizeof(reg)) so byte-order adjustment
   is handled internally.
 - Add matching /* interrupt-controller */ start comment; fix end comment to
   /* end interrupt-controller */.
 - Update d->arch.guest_isa_str to ->isa_str in make_cpus_node() function.
---
Changes in v2:
 - s/u32/uint32_t for timebase_frequency local variable.
 - Drop +1 from BUILD_BUG_ON().
 - return fdt_end_node(fdt); instead of res at the end of the function.
---
---
 xen/arch/riscv/domain-build.c | 106 ++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 5f6f4b6248a5..198a420f55a7 100644
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
 
@@ -48,3 +50,107 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
     return 0;
 }
+
+int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
+{
+    int res;
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    uint32_t timebase_frequency;
+    bool frequency_valid;
+    void *fdt = kinfo->fdt;
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
+    for ( unsigned int cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        char buf[64];
+
+        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
+        res = fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        res = fdt_property_cell(fdt, "reg", cpu);
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
+        BUILD_BUG_ON((sizeof("riscv,") +
+                      sizeof_field(struct gstage_mode_desc, name)) >= sizeof(buf));
+        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
+        res = fdt_property_string(fdt, "mmu-type", buf);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "riscv,isa", d->arch.isa_str);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "device_type", "cpu");
+        if ( res )
+            return res;
+
+        /* Start of interrupt-controller */
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
+        res = fdt_property_u32(fdt, "phandle", alloc_phandle(kinfo));
+        if ( res )
+            return res;
+
+        /* End of interrupt-controller */
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+    }
+
+    return fdt_end_node(fdt);
+}
-- 
2.54.0


