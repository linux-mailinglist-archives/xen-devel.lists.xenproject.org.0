Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HrtOsj2/WlklQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DFC4F7FF6
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303807.1577167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR7-0003Jg-Ne; Fri, 08 May 2026 14:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303807.1577167; Fri, 08 May 2026 14:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR6-0002qU-IJ; Fri, 08 May 2026 14:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1303807;
 Fri, 08 May 2026 14:44:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMR0-0001ui-Hs
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQy-00EpjT-BR
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6ae-5cb7-0a2a0a5109dd-0a2a45048fc2-18
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:09 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b9-1dec-0a2a45040019-d155da36e428-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:09 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-bb91b426e40so355072266b.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:09 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251449; x=1778856249; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I+oddooa9AtYM/3fWA2kwT7rhEB1jpQvIHH/BXdEDw=;
        b=OjABRNRkgfw2DLXeTrM74ciDwTGdhFQXE7aXPSju8zPbT6JU9KLj0RyGsU71Z7tkXo
         1YxVwbMNLkPUNsaBA4WqxDjI8/xEg1PV7yOM7ltp0E0RLQXsE8lkjVaS4JqI66QlmgvH
         2dHPNuawWCe70ITi69GXqi49AhZfs2/PzsLi6jRNWj9eASc88F2s2RU8tn8UafUWGu6N
         QFfDtULQ0TYNXa3yNcH7dtrdhz6PdYF+ckvHrSENlkOj8QUdcqAr9Drjz9/7StqI4yLU
         uNXRpCyy2ODkOfy+KvbB5H9if3t/UnWIt1TTISS3yoKLwNORySvsmBmp/eHD3Xy5QvFj
         SuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251449; x=1778856249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2I+oddooa9AtYM/3fWA2kwT7rhEB1jpQvIHH/BXdEDw=;
        b=gFah+JctzMYdhTqcxGT/ZvZqrTEoa5LvFu/J391NmqKOEOoiIgWkNwgiOYg4Ag+goj
         zWnF+HR3XHzurI5nKPt/Gw0D0bGP8rs4pbRHUOTXxacuUwws0RkPoFWYYExNlbpamt7O
         EZ+dQSSxsRUZ2kG+Qpqk/7bv8kP2V38yBUccqnDCjhEvy4iFnPxoUxFmrkZQo8OozTWo
         q+xgrw+PVkVPdWMwu7Mc0q+6ik2fI7AYTS/5FA1vYKzkLgn90ezDrw48ZhN0tYynV6UC
         c7H88Br9bzLmJM1k1BVc/NdQ0mNtc29qmSrysunos6VyON/43o+Po8bnSOl1d7EKNA7W
         +O0A==
X-Gm-Message-State: AOJu0Yyqk+irlkdoFhqBO7rc39X61sn+omstqtLP9ADrPfgehxjw4xRQ
	hJvYuu3Y0/twLJCRUhFyhqkjpEWEdNFT1EOY59D4sBg3VpeAaIbgQqyDT0M9uQ==
X-Gm-Gg: AeBDietR6Q6kr+ptO94MkWqvfQxhS59PQT6K65GRY+cpV9XeiQ4gdbfEtH99ZZIlLRO
	ogv/G2gKxx61RfUs5f+6wYbwgwZtp0lSngdj/iRPo8wmggR2mzAa+Qxr9JFWDrwFu/acS9GdhhE
	FptOwycuBXh8AO/ppmNwNDYqNdgDgj+mAbQ5o5QnBYIJxDWqdrP1KUtuFmpTtwBODqa9Z2SiOYk
	GNAST0RE5DjIdUJ5SiUBlV/GX18DvBnqEmccH6kqyXfPNKr2A7W1MEo3LdfT4YK5w4ewxkOPIqw
	zkxLS47phMMYG4NZE0JxMDnqUjxnbJ0brpZcXNQRD9ReDfFOYdAErMkTLAud4JEZXlCifoBE9le
	5FYtC/bN5s2VlR7iWHdroU3He+Q4+gsWnd04u68lBl2OMhWo/Xe/w2ON2GCepstae49YypVARaP
	FgHpT8Se+nX+tYRgco3oRB0rmJSEb8/ZEgDx0dYLw2T1saa2bRXSB2oneMqmgen1JcNLPi/sL19
	ULF
X-Received: by 2002:a17:906:ef0c:b0:bc3:5164:bc1 with SMTP id a640c23a62f3a-bc56ad30ebfmr785929066b.10.1778251448965;
        Fri, 08 May 2026 07:44:08 -0700 (PDT)
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
Subject: [PATCH v2 22/26] xen/riscv: implement init_intc_phandle()
Date: Fri,  8 May 2026 16:43:24 +0200
Message-ID: <a3f84bf31c4d557f348abffb01929160fe7cc3e2.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1778251449-28F753FF-0A2F673C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1316
X-Rspamd-Queue-Id: C9DFC4F7FF6
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


