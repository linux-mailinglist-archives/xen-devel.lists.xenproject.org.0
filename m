Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eExyFK/2/Wn5lAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970D4F7F82
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303745.1577058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQi-0006hh-OR; Fri, 08 May 2026 14:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303745.1577058; Fri, 08 May 2026 14:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQi-0006dN-JH; Fri, 08 May 2026 14:43:52 +0000
Received: by outflank-mailman (input) for mailman id 1303745;
 Fri, 08 May 2026 14:43:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQg-0006J3-QL
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQg-007XVC-6p
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a5-2eae-0a2a0a5409dd-0a2a4502de26-2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:50 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a6-af86-0a2a45020019-d155da33a5c7-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:50 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-bc23bebd345so31302266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:50 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251429; x=1778856229; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yGl4LH5XFe9FwGLjZCEW5kyIYDSUJUrG5QxrUQAt3k=;
        b=YlIDZheTxRIsmAZj2iWN6ARrv4uC197sV8MXFaBvPIfPcqeq+0SgqAfvewPD0VA10+
         DQkXbwgpzeHMLt2sbTrovV1drcaPsSp6gqYhMXnPUn52d4WGYTtWknRM9pwlIT5gXFGS
         zVNqvQtDjdvq01DLxsrPcLg+3C7GrPZ/XyiE/1sTNqZTl5rKKpbD/z6iHAVwk0KI5aGX
         u0hnf8JcnVnAx9PLW6+/AKzbFxwAoH8hyOkVx+gF56kYAr5Ipdp04zeh8+UvaIDFGtA+
         Q8H5TFR2uRDi5uQmpC3xbiytPduJ/M+zXqrYjiGfkHh2ZKea5a5JFvAozBhNHrFaku1+
         OZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251429; x=1778856229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8yGl4LH5XFe9FwGLjZCEW5kyIYDSUJUrG5QxrUQAt3k=;
        b=X/+6gUqfJCTcjBgC2nw1lopKvI6Rgo+NG6a17dxGgFEYRmScUzUc/5qLUbmqePmtpP
         dXOOZwxY4uExVmAh2+IOn2n+Id5WpQ3s3d4EVI8bIY+OGR6HYoyV+CZ9F6vOhvRfpoII
         FwXAu7JpjpPUBidCvAA4ihS81ebplcJoMfsaotB+QYvNAFZS/eFL7OV5YHB9yGxCjElb
         uG0XS685PNBvfKL4oudKVWcQGGndK9qR1FSwm135adGjUXIARKf8fDEtj9pGlvsCsF1Q
         Y7+qBQiSWhSK4/9OSzJtGeds6QTirhl+497IjTaSnnWpz8Wu/pmyLBXs8/1od7o42Uqo
         WaDA==
X-Gm-Message-State: AOJu0YzfNFtIRGWUJT/URXqm/ek8nOy5J6cG+djp4/nFYiAlHhC5KJUL
	n05lF3P3DvgHYLZIBJkwL5FmOzXoTNlUHMbaTquPl1sv6MabifVkdUzvNNNaIQ==
X-Gm-Gg: AeBDieulw6vLzepIwdhvSe6VT0PS/gAV9uGJTsZw+Pr5cl+p8FOz7PnJSPl2jnF5o8R
	/5h4BXUy+CBg28kntmalSNDZSONkTl6sySY8UYrHrvVOaXbljRNZAaUPvOAWxtiz/hZw7ECgQgY
	eZ/r6d1g1+usVnxzqqqH0T8OwAGrHv7CW/b7LyOErpJEs6EDIKtGyp5WBs88OnO+HhExM7QPw0t
	vx8pd8G0oewHIITLw8u6+eLKY0IV5mXuNxnkS0cQ2XVPo9QzJRaBCypMlw+H8zGLsc2iZRyl7sy
	rNZHh0UcPElJzAAtVr2X4ltQ8dv1v5nfVktLMEzhDoPDqtIFL2syGha4f7fJ0nQOGGXtEM11zbg
	1HlPZgM04cIPsbgMLz1pgAr0oCbZ9HAQ0Obx2gCzyBOwKfvWeYH0+ncx6/7sqzps7eLIrVrNWoS
	MVPZusi++VrNbDSkzoyTxuGodE6KcPrL0FSl4lkx13veZNiMKaQfbSjKW6OFeYo4Yc/w==
X-Received: by 2002:a17:907:3f8e:b0:bc5:7c6d:8656 with SMTP id a640c23a62f3a-bc85d0b153bmr241091066b.19.1778251429347;
        Fri, 08 May 2026 07:43:49 -0700 (PDT)
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
Subject: [PATCH v2 08/26] xen/riscv: implement make_arch_nodes()
Date: Fri,  8 May 2026 16:43:10 +0200
Message-ID: <92338cb9254da76cccb242154d0617603b856052.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778251430-A937C161-1AA0B3AA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1158
X-Rspamd-Queue-Id: 4970D4F7F82
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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


