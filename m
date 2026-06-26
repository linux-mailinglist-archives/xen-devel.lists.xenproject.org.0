Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vcWRIg6fPmocJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF7B6CEA5F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZRHLVDGL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346303.1604890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lz-0006MO-C3; Fri, 26 Jun 2026 15:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346303.1604890; Fri, 26 Jun 2026 15:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lx-0005xC-M5; Fri, 26 Jun 2026 15:47:17 +0000
Received: by outflank-mailman (input) for mailman id 1346303;
 Fri, 26 Jun 2026 15:47:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lo-0004HM-Hd
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8ln-008hTo-UF
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ec9-2eae-0a2a0a5409dd-0a2a45038a38-48
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:07 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9efb-ec1a-0a2a45030019-d155a732d90d-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:07 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5aea915df15so438567e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:07 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488827; x=1783093627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGVs0W5yuF//qwARTLwYow22/uS7Po5fojk55jJOeWQ=;
        b=ZRHLVDGLanKzMM7ZWMUVg9kgeNY3HQmQRt86jnFNrit/+NUC2f4fEXrABOqwYyLAKc
         229BR7nB+OgXNPu225bpcP694JKcJOHxIDmq12SDHJ5lewAY3w5caPjTpLdFNaOiS6vK
         XeaE8szFGlF0psM/VGT4x4Xs6rTAm/cJCm6jzNrInwuiVSyOa9+s6IHZUx6ysHv/dzMt
         QFttU9Y0CmZG0k6LUoIqUBbkwPxwMGaYq3N5ei06Dv10QsIJsmIhxc5uMlXLLDYahdAY
         R2u4x1d1ABloub+P0kSW/b+2GxQaWPy4F1/b9ivwozHsLYslheC1j1R2BIjc6FdWk39J
         mBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488827; x=1783093627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tGVs0W5yuF//qwARTLwYow22/uS7Po5fojk55jJOeWQ=;
        b=JVwlKGK1EZ4khCgD20q7tRJ9Cn6wdJdf81hAT9LLSOQNUkdzV6J2FwPphWtUnoYPfs
         sfeNl3omxIsg8L//XCR0BhHRraDMrR/dUPk3gRa1IgEK4hCfbJj03VLv4FOoO2QiavgO
         TwPpfUW0mU3zQKTYWvKJXqC5JxFYU4M14SM6YX5yrRYmngbzFMqEUYQomEJqgVRLHSjY
         PfluhCTWT84ddwrH1hFslX7mvfhLczIsywHpgyRYguVSLVfUYI7T5WqknbQc0zE4jMll
         6ATN8pY4C/qmvcOCAgd14wssKb6RkaR2ZgTQWEVsWEnlLu/ts6UBdoKSt0bah19Dmboe
         J7sA==
X-Gm-Message-State: AOJu0YzDIgow/AvlzRBNJlP3q8JLI75TApWxvbkcDphjwdKIE0DmGYnn
	IJSvgch7DjGjI1kyerkJyn8u/hU8Ygv2FG+aw+sEDoegmQ34KmQ3Uv+/e/tZSQ==
X-Gm-Gg: AfdE7cmcIUqSTBsQsPpGuN3/WU6h1dvIo8FQe185o4z4XU7i1gd92II4z+qKMPRum9g
	kXoBNWLyLIzGnAfSuoXhfGEwvshl9CiPvidjk0yeUpyOlfW7lrdM4/IqqJgqEdeYRoxrIEaKm2W
	F/vY1sc+ZdU+W4SQktguhGPjzAB6By6SyRbDXIiha2890fu3H3uXki0JwfHJoPeBrUCqH2UEMVg
	EYuuqcEQrDv7capbHZPwhTbVDz/1cM2bnL+fW8RSk+yp0Lox5k2I69kYoM3I0F2bJuqrLEHK9Wz
	Hnvtp2ZBGg5l7yKGdBRFh5t6jGbYNAn8w317K3CN5FhNPdPIAE7O92BhELAy+Eu9UFTUMw0Kt6z
	g+FDDWrbbDY9r7RvA5vE6yBp3+IZMaf7vES0zJ4WqHVQh98jnakRU/iSpbXyu1mGo5plPAsdlRR
	4i4jmL/1SKCnHBR7ocvWYmW4YpBoZ4Hj574psZJl5jXx+NjRJj21zk+u+VAg==
X-Received: by 2002:a05:6512:6085:b0:5ae:a488:cda8 with SMTP id 2adb3069b0e04-5aea488ce07mr1932782e87.42.1782488827120;
        Fri, 26 Jun 2026 08:47:07 -0700 (PDT)
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
Subject: [PATCH v4 22/25] xen/riscv: implement init_intc_phandle()
Date: Fri, 26 Jun 2026 17:46:31 +0200
Message-ID: <3d06d182ab718707ddce2445f317bfd6e661fb5b.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782488827-BC7875D1-CF050ACD/10/73395122804
X-purgate-type: spam
X-purgate-size: 1376
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
X-Rspamd-Queue-Id: 6BF7B6CEA5F

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Nothing changed. Only rebase.
---
---
 xen/arch/riscv/dom0less-build.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index 4cc00012aa8d..a1fa51b996a7 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -4,9 +4,26 @@
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 
 #include <asm/p2m.h>
 
+int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                             const int node_next, const void *pfdt)
+{
+    if ( dt_node_cmp(name, "intc") == 0 )
+    {
+        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
+
+        if ( phandle_intc != 0 )
+            kinfo->phandle_intc = phandle_intc;
+
+        return 0;
+    }
+
+    return 1;
+}
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     /* No RISC-V specific nodes need to be made, at the moment. */
-- 
2.54.0


