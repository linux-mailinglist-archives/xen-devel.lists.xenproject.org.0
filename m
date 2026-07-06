Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2iIGO7XQS2onawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C725A712ED1
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Al+T4YoE;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355504.1610374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliR-0001LG-67; Mon, 06 Jul 2026 15:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355504.1610374; Mon, 06 Jul 2026 15:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliQ-0001H0-Se; Mon, 06 Jul 2026 15:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1355504;
 Mon, 06 Jul 2026 15:58:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliO-0000ra-JW
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliN-00AcZM-TF
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd081-5cb7-0a2a0a5109dd-0a2a450a953e-32
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:35 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ab-e40e-0a2a450a0019-d155802be9ef-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:35 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493c5220cb7so24616975e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:35 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353515; x=1783958315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zPPT5yH4g3srmqRgr/MmJI9wmQx9NN5+pUlXZUXu18=;
        b=Al+T4YoEWiQ/7CIdwwh3JcAjYPAxbsYvOrxOZmOwOdsWbqoMRPtz2eZDn3fSnpDT0v
         dXLzZNkhrXG2ko1leutgpH8YQWJuvC1Yj8MeV0NcLBO0T0mfhelF8XyMdy3sN2Z4/vk6
         bSGeWGQK580v351KREkD2cWI14Z8T9qU3scueoh5clzIaXG3cUGi+AgoNmh8gergCzUL
         9SBUh592BtGwM04Nd6LNhcT6Hj3jlbJdxC+sKff8dlX8g5c9ZoqJY69mbm/dGR0C/l11
         qEL90idaVBxo+yLLFWy4l8P8kVvh0lxzbtEWGKwrMq3epVZbeBZb0x6wAjXKrCbZ+V0g
         4fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353515; x=1783958315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zPPT5yH4g3srmqRgr/MmJI9wmQx9NN5+pUlXZUXu18=;
        b=kt6lctsszAhjl/3GSB4iPtN/PQ+NNTnSeMDYAVMNiM+HyVE5SJ7r/ingM1dkstSpih
         J2BkGyySskp1LC2al49asnEfUDWLKwu9MPXri9tWe9wrZdKBbnDR6HhrmUbulTLd/IM6
         SBPF7A8KDjLpWzLoq3uRfh3ww1AQgF46tqqk0qPEk38qVbfVHQbhFUharfKOXFxPOIJb
         v7mjnoLIipjqPubPOwGcULtNwjiZouGlcSsbs4E30Ib2z0qCxqPaUia0crVIMmVNOl9m
         p7dWtv32flN7vkdaiG+0EypTtdRaj0gnFEmPhohjUdqepWyUjcOPB4fj1VWrLwCIIvhN
         A4cA==
X-Gm-Message-State: AOJu0YzTj1pIqsEl68rCSIZjeItUSqS3WOEvtvlKHplHvNYMAyYQ9jYG
	LY/Xsng4Zc1mcal08EMJsOdIkpBn8YANyDFajOGfqBYBYYuqIHk7aQVn2cqSiA==
X-Gm-Gg: AfdE7cmYjEWsiQIWXoXSXV7Ckjx7z9IVVMyuxO+oMaQfM9lto/gXTlwsdSk006ivtTh
	qg2+D8Kt5tOXSpTRxSQ9/CsoMjN0uPfdoe6hMvrFviq9a4XvbAedrnoEukkprAgF+khiAGlV2eL
	5N7Col0F6z42QZyxcfG11qlezLsz+rYaz5nX44nAF1r3MUKzvjY6enLwbiqLglCyCmhIYCg6SxI
	pPXe1+hU1cpkXTySXokHU1rwZqbO6S4xRrFk4afZmU6XCpRkI0GQkLSr0HLJlnRqF3Xcgw5r0+F
	6x+UQ3yQ8wxgszqvF1mtfdDCqddhmpm39lctC08AMl5X+OQSpM2eJVDgCApcCcOoT+ng+Yk47nD
	1sNniPrFT8S761FM5Osp23Uxy4tMB6xNOKBTrLivf7TDxi84lkt9c89jace4K9Yf+b0H8rTIyVG
	jsXBqCTUl8uH9NoMVpgUAiYCAl66JVAgFiy3TSWmz/mzASmiAVm+0H1Ykuyg==
X-Received: by 2002:a05:600c:818f:b0:493:b750:bd20 with SMTP id 5b1f17b1804b1-493df041d26mr14237625e9.15.1783353515285;
        Mon, 06 Jul 2026 08:58:35 -0700 (PDT)
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
Subject: [PATCH v5 12/26] xen/riscv: implement make_arch_nodes()
Date: Mon,  6 Jul 2026 17:57:53 +0200
Message-ID: <982cafc2caaa2977d0a51dece7c6e92b9001a745.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1783353515-D4B2CDDE-E068D889/10/73395122804
X-purgate-type: spam
X-purgate-size: 1386
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
X-Rspamd-Queue-Id: C725A712ED1

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Drop "Add" before Acked-by above the footer.
---
Change in v4:
 - Add lost Acked-by.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a683972e9235..4cc00012aa8d 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -2,10 +2,18 @@
 
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 
 #include <asm/p2m.h>
 
+int __init make_arch_nodes(struct kernel_info *kinfo)
+{
+    /* No RISC-V specific nodes need to be made, at the moment. */
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
-- 
2.54.0


