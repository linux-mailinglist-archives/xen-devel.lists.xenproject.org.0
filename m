Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKIUO01QsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85593255485
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250395.1547948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aE-00049p-Tz; Tue, 10 Mar 2026 17:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250395.1547948; Tue, 10 Mar 2026 17:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aE-000434-AD; Tue, 10 Mar 2026 17:09:26 +0000
Received: by outflank-mailman (input) for mailman id 1250395;
 Tue, 10 Mar 2026 17:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aC-0001QA-TF
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2848d12-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso119285105e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:23 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:21 -0700 (PDT)
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
X-Inumbo-ID: e2848d12-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162562; x=1773767362; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rURaUWIfuvEbzAV4qRTHMl8D0NEHhwV33eVW20ka7rs=;
        b=C5U75V08T2eumDwAH2EDZUc5bj3oRmeew2Y8x38i48ivsuCKn21B/0v96m3Mtxhgws
         MCKzwHFbQb96EHhpiDRYl/4ALkWdwIMjH5jL1aUgO2NNyv23eVZiIH5rm60hjyiSaDcd
         vbEOyhdmaoQweN0RmZv7kavQNUJon81I6Rg8nK1ptDZieyfL6UO4JMfNO9PG79Xhyihn
         nTxbssDYlIlv5NtEVlwF536WO210wCvkX1jPhB8iJ+Gyb71vSkXsRJO+aavadaxxYNut
         hNujCpr+4nuOYZtQPYu4E9K8NeOS5gxArN5NwTCesrqzlNV50llGtBKHszC8tbHfGkCI
         RTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162562; x=1773767362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rURaUWIfuvEbzAV4qRTHMl8D0NEHhwV33eVW20ka7rs=;
        b=ogNp1xnCpeGsInlGTEbrwYdrUQttKeLwssmxAZlRQrh8R1UfZkwgqkA8lyaVJ12L9r
         krdkSFpZJVYYM20LupnK9w5Z2muJs+m+IofcAJxb+Q0udpTiBTSkYdpj/tK45Cu5KHm5
         Uoq1MFzGk+tYipRchxSFy9g3DLUa9KuFFfbTxMnTLfoXIIN2d2RNMsU/l+otlyUZVBk4
         crv7zzBoTNp4DG8m2Cj7Q8kLJ1IO0Wa0eJS2AgIfnI9GbHoHxbr1M5l6ar8mmeOY5VSQ
         ARrLn1V3kvdf+x0N1Xto1/uDml93xsYECdjARImCMBM1dcSZLJLkZpASXpAeEkQvdXxC
         xMNg==
X-Gm-Message-State: AOJu0Yy1aklCbKiRzRZgZChYZKnI5q5cSLjM0l6dXuIJd3/RAzdaUPLv
	KzYvax1YkSVo2GjZw6PX5v6q+rJ3uJTtiXbmFbxZIQcvPy16SOBBeBgpY8ckx2U+
X-Gm-Gg: ATEYQzy7aiaeyT+65hUHg4QmGtwL8aLajPl5mGHpPgZFKj7xkuip5ucbQiV+9ZtueUb
	Lld2ztB+pHEFf/idDJOVXNWCHp3pztjw8bg/vNJDuiUaEyE9vyOctYWos6sb5DBnlAQZ917xAgw
	HLQR+uA4NAAanQjFMAplHEvmjjvP2FUel70poEX4rSiXz5vrgZRSYeh+Kle+/dRhVskAmtNL1j1
	n0ou2lGXIobBnBeDSFPRB3qFcoFbbRE/Q9b+m0qqVhkXed6jehzDrTJv3/EYXaKqtuyPOVXNApu
	ICI4JXidB20ubwCsXI0JuEiHKf5uY1wWfba7e+gBHkWuOZhU5k96DZBCPkeb8QYBZXuY9g18fa/
	ThoIwqsvzxn11ZtpA38dZZu/MYfivJjgHF+1/Gt/kn/cNrMA3I/NndNHj3+6BY5+MUJW1Ouu05L
	5M4Z5aTRa2/xzHz9YYn6lM/hQmMSPKHmITkFP8aYovovclJ3aRQkyShoaIW1Tz/+ghQRpkBA==
X-Received: by 2002:a05:600c:528c:b0:485:3d3e:167b with SMTP id 5b1f17b1804b1-4853d3e20d2mr103614505e9.5.1773162562331;
        Tue, 10 Mar 2026 10:09:22 -0700 (PDT)
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
Subject: [PATCH v1 11/27] xen/riscv: create APLIC DT node for guest domains
Date: Tue, 10 Mar 2026 18:08:44 +0100
Message-ID: <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 85593255485
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

Guests require a Device Tree description of the interrupt controller
topology. Add support for creating an APLIC node when building the
guest DT.

The node is derived from the host DT and linked to the guest IMSIC
via the msi-parent property, allowing guests to discover and use the
APLIC interrupt controller.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aplic.c | 82 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 739e8dab3498..e139946a05a0 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -12,8 +12,10 @@
 #include <xen/const.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
 #include <xen/spinlock.h>
@@ -295,6 +297,85 @@ static void cf_check aplic_set_irq_type(struct irq_desc *desc,
     spin_unlock(&aplic.lock);
 }
 
+static int __init cf_check aplic_make_dom_dt_node(
+                                    const struct kernel_info *kinfo,
+                                    const struct dt_device_node *aplic_node)
+{
+    uint32_t len;
+    const __be32 *regs;
+    const void *data = NULL;
+    int res = 0;
+    void *fdt = kinfo->fdt;
+
+    res = imsic_make_dt_node(kinfo);
+    if ( res )
+        return res;
+
+    res = fdt_begin_node(fdt, aplic_node->full_name);
+    if (res)
+        return res;
+
+    data = dt_get_property(aplic_node, "#interrupt-cells", &len);
+    if ( !data )
+    {
+        printk("%s: Can't find '#interrupt-cells' property\n",
+               aplic_node->full_name);
+        return -FDT_ERR_XEN(ENOENT);
+    }
+
+    res = fdt_property(fdt, "#interrupt-cells", data, len);
+    if ( res )
+        return res;
+
+    regs = dt_get_property(aplic_node, "reg", &len);
+    if ( !regs )
+    {
+        printk("%s: Can't find 'reg' property\n", aplic_node->full_name);
+        return -FDT_ERR_XEN(ENOENT);
+    }
+
+    res = fdt_property(fdt, "reg", regs, len);
+    if ( res )
+        return res;
+
+    data = dt_get_property(aplic_node, "riscv,num-sources", &len);
+    if ( !data )
+    {
+        printk("%s: Can't find 'riscv,num-sources' property\n",
+                aplic_node->full_name);
+        return -FDT_ERR_XEN(ENOENT);
+    }
+
+    res = fdt_property(fdt, "riscv,num-sources", data, len);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    data = dt_get_property(aplic_node, "compatible", &len);
+    if ( !data )
+    {
+        printk("%s: Can't find 'compatible' property\n", aplic_node->full_name);
+        return -FDT_ERR_XEN(ENOENT);
+    }
+
+    res = fdt_property(fdt, "compatible", data, len);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "msi-parent", aplic.imsic_cfg->phandle);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
+    if ( res )
+        return res;
+
+    return fdt_end_node(fdt);
+}
+
 static const hw_irq_controller aplic_xen_irq_type = {
     .typename     = "aplic",
     .startup      = aplic_irq_startup,
@@ -310,6 +391,7 @@ static const struct intc_hw_operations aplic_ops = {
     .host_irq_type       = &aplic_xen_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
+    .make_dom_dt_node    = aplic_make_dom_dt_node,
 };
 
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
-- 
2.53.0


