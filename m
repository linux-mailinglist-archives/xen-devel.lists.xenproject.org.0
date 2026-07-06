Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cX+xHLPQS2olawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA4712EC8
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BfGfYPuG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355500.1610355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliN-0000X5-Cp; Mon, 06 Jul 2026 15:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355500.1610355; Mon, 06 Jul 2026 15:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliN-0000Ry-0C; Mon, 06 Jul 2026 15:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1355500;
 Mon, 06 Jul 2026 15:58:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliL-0000JL-JR
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliL-00AcTL-0K
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09e-5cb7-0a2a0a5109dd-0a2a4509a9ae-10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:32 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0a8-97e6-0a2a45090019-d155802ed9ea-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:32 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493c486f012so13701865e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:32 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353512; x=1783958312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUaoD57i3eG5vrKrWLrvtGucvmcW9ojWQ9m6U5XgH3E=;
        b=BfGfYPuGjF9KV41z8atdAB3O+2og8t0CuOcNymD/zHoq1BHKJDcSmUNb/eAh97ZR6C
         BkwUxL+tisCmEql568JMe3wTbfpUgsNwy8DqVEUKr0ys6LMbg2vH0/nDMVZupWQ5Qe4L
         wzgtsgl1M1TqO84qrJGg4c7ciKXU75Ra0I/S1dT98WW7TGFucAviOFkPRVr8DnqBbXfe
         sk0EO3K9KOkt0JEFt6vlSGQ4Fjqh4fu5xOCZLyvjs8Fr8erFDc7vZuiz88muhF+kIGsr
         6XYX4zVxjJJmVC3Tu7JAwbS+WxaioiIyByLpSVGHBdhzjU4gtj6mwz85jxr1w1xkMVA/
         +6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353512; x=1783958312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUaoD57i3eG5vrKrWLrvtGucvmcW9ojWQ9m6U5XgH3E=;
        b=BMXtFheM3fpiy/BWoUnE/iYdVMwm7Amna8tq6DM47YPiFIuFW3f/KbeWaoPiCC/iAu
         yjkEMR/MZWXlAtNs+4nZtQdSuoNFtOeDBWWF/ie6OXUFd5KcsSHwUuA8TedNKiAI0DT2
         Dgp5Kk/f0Tx0UK1wRm9jxBukeX748RNflMq0C6VUANPDsxC9uR5eyzvRUQxJmExdbvJF
         Ho1yi+5mji3i6ISZtyxXi/ZIegcmLAsPuH5zgQACRa+CmfgKTBiRiY8b55vWnCpKHMSZ
         jGMi++8c7F73hdKQLimHtb2TSxd0ZHYhwIUyBtWDjnTCYvALXs+ylV3R9zTqVC54QS83
         x9fA==
X-Gm-Message-State: AOJu0YzXMdxoHM3yZjFpO8ACQKIGd7VCD1i0+aamKZmptFY2dcYrC2cw
	UkRdcDXsXYJ8b1LZ3JKMpGIq9QacSkVilsHsiDi9S7JX/vLxcxF/0ONAe2m7DQ==
X-Gm-Gg: AfdE7ckyp3fKQU16R9nDC8DIMPBYff6OxdnfjQSHrv1Umww/SV9txQdX+AhGwtYh+Sj
	Cx6aN1YaLbNg9jfOdy9Ye49hAjPVcLKjt/VYgjhyFltUntIpUzfD981ELxiK1xflN6X9r8TFS0S
	wdsIGVHqqkjKdytU2ffFc14FTA5b21pZw0EHKSe7NTrO/TlIJ/AAe3jch6W6yRq/m+4y88Hzyt9
	8RsAhofFBC4aY2DaXGRd6SKNGwPAJdw98tUvOekq8mmifEa3xtHgkJPMcOszaCJ/m6IBxGT+MP9
	xnZAh1ApyE8pk8YewBH7k+Qiq60BeRseONpeDK2WfN5WTUmlI6LpL7nphxdcPypa/AjifPrVbY8
	l9c6B5PeWl9kqC7/KwdcdFPDj0BpEPey2k2a9axFqTiHSbYxTScVXsYdM94vPplbnN+lfOvEsWF
	F1Ii92w3tbEl+KDDs9x2zYI/Smd+ZxfDvlEKWK+6/jxMwmy21YsUcE6s+d+w==
X-Received: by 2002:a05:600c:6995:b0:493:bcef:5646 with SMTP id 5b1f17b1804b1-493df06ec87mr13987345e9.12.1783353512181;
        Mon, 06 Jul 2026 08:58:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 10/26] xen/riscv: implement make_cpus_node()
Date: Mon,  6 Jul 2026 17:57:51 +0200
Message-ID: <d8e17abcf195ca97056c8ed078ad968f68fa4ca9.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1783353512-46F3D986-F00E2489/10/73395122804
X-purgate-type: spam
X-purgate-size: 12770
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
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,citrix.com,amd.com,suse.com,xen.org,kernel.org,wdc.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: C5AA4712EC8

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
- Drop Acked-by: Jan Beulich <jbeulich@suse.com> as extra changes were done
  because of the changed in prev. patch.
- Move isa_str allocation and construction out of arch_domain_create() and
  into make_cpus_node() as a local variable, since the string is only
  needed during FDT generation. Use a two-call build_guest_isa_str()
  pattern (size probe, then fill) with xvmalloc_array, and convert all
  post-allocation error returns to goto out so xvfree() runs on every path.
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
 build/tools/fixdep            | Bin 0 -> 13632 bytes
 xen/arch/riscv/domain-build.c | 125 ++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100755 build/tools/fixdep

diff --git a/build/tools/fixdep b/build/tools/fixdep
new file mode 100755
index 0000000000000000000000000000000000000000..42233e2669e9cdaf1c31723ad22c00f6c9291f7c
GIT binary patch
literal 13632
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
X!V-7*S$v5Ihst>tURt71Lc;$7AAVAt

literal 0
HcmV?d00001

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 5f6f4b6248a5..33cd1ea80f39 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,8 +3,11 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
+#include <xen/xvmalloc.h>
 
+#include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/guest_access.h>
 
@@ -48,3 +51,125 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
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
+    char *isa_str;
+    int len;
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
+    if ( (len = build_guest_isa_str(NULL, 0, d->arch.isa)) < 0 )
+        return len;
+
+    if ( !(isa_str = xvmalloc_array(char, len + 1)) )
+        return -ENOMEM;
+
+    if ( build_guest_isa_str(isa_str, len + 1, d->arch.isa) != len )
+    {
+        res = -EINVAL;
+        goto out;
+    }
+
+    res = fdt_begin_node(fdt, "cpus");
+    if ( res )
+        goto out;
+
+    res = fdt_property_cell(fdt, "#address-cells", 1);
+    if ( res )
+        goto out;
+
+    res = fdt_property_cell(fdt, "#size-cells", 0);
+    if ( res )
+        goto out;
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
+            goto out;
+
+        res = fdt_property_cell(fdt, "reg", cpu);
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "status", "okay");
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "compatible", "riscv");
+        if ( res )
+            goto out;
+
+        BUILD_BUG_ON((sizeof("riscv,") +
+                      sizeof_field(struct gstage_mode_desc, name)) >= sizeof(buf));
+        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
+        res = fdt_property_string(fdt, "mmu-type", buf);
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "riscv,isa", isa_str);
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "device_type", "cpu");
+        if ( res )
+            goto out;
+
+        /* Start of interrupt-controller */
+        res = fdt_begin_node(fdt, "interrupt-controller");
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
+        if ( res )
+            goto out;
+
+        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
+        if ( res )
+            goto out;
+
+        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+        if ( res )
+            goto out;
+
+        res = fdt_property_u32(fdt, "phandle", alloc_phandle(kinfo));
+        if ( res )
+            goto out;
+
+        /* End of interrupt-controller */
+        res = fdt_end_node(fdt);
+        if ( res )
+            goto out;
+
+        res = fdt_end_node(fdt);
+        if ( res )
+            goto out;
+    }
+
+    res = fdt_end_node(fdt);
+
+ out:
+    xvfree(isa_str);
+    return res;
+}
-- 
2.54.0


