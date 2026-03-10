Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CxdNlBQsGmBiAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33702554C3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250391.1547918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aA-000395-S0; Tue, 10 Mar 2026 17:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250391.1547918; Tue, 10 Mar 2026 17:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aA-000300-FZ; Tue, 10 Mar 2026 17:09:22 +0000
Received: by outflank-mailman (input) for mailman id 1250391;
 Tue, 10 Mar 2026 17:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a8-0001Q4-Af
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0890da2-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:19 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4853510b4f3so41185485e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:19 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:18 -0700 (PDT)
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
X-Inumbo-ID: e0890da2-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162559; x=1773767359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhr/YFfUk73fJbCvGKZFP0P0mCzExALFTOhZRjG1AeU=;
        b=ZFB8LKD577w5idg3ca7RIHLuzqpe2Fu47tUN54QV/8l+a3/zswFtxLLB+X9pw7D70S
         4kPdDAGUl6qYCf5lOijzS+sXCPjMYio140HCkdMOVoKkyqJEcw1RMxCMITOvpG2e1gzs
         cwUNyOq5UYaRnjNHZ3WoQObixO/L4pezOHHPrDwAXPid03gO07yqG2xbH9T0O4ILYRpi
         PQP8E0dPXzQWRKGnHlW4h5ZpE8Z1aCSCQZ7q8X/3k0DRioJ999zuS6GEnWT3K31Xy6Ou
         4qPG+l80rJj3hTxPuNkINB0e4FcAX6KiimVdnHlRaAtWgjAYu/eaWV3OQD+phCoEH+Qq
         /qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162559; x=1773767359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhr/YFfUk73fJbCvGKZFP0P0mCzExALFTOhZRjG1AeU=;
        b=SRtqobsqq4ggtMGsYnwTFEI2sP8OFabO9IMc6UiJo6/jFQRdVU55dXNL/7MB7c/uGt
         7+d0rwV9JmL2DzOKvSIDomaTX4TXH6YKYJ8g+j2C6+Z3Ic9Q491spU1LKJun6BgcW7tr
         FsObgh5fr3ICfXBnLISHrZqsKWw9Kq5Mb7ce+5xb9VXO3MhawB4PzHrE0wIfdrGa6ng2
         qu1JM52ea+B2LWbd8iKGw+zWZ+QcwTBcylMW2LKIJcawKssnSPPP0qBFvNKvIsK/oRWt
         tlwSzdl7DI4LndijfgqwmVgH/UPqfvoaqSWm3PpZSNf3WTk3VST8WJLxWHihATjLsBOi
         oyzQ==
X-Gm-Message-State: AOJu0YwMN1IR8Rx3cs4SkliJPpq5z794UqsCOn0s8gWNaDYCJq1+n/Jx
	oSavh44WKPWBsJz3b/q5/etEdXNTz5CRk2KsC80GPXIh8XY/hk0slgElaioABJhJ
X-Gm-Gg: ATEYQzwTJdFqqZUyxY1CpAZP+OOj2DXV3O1qXW2Ot8qr+T9ZNgk0UK19WrhkMMspw7g
	cNn+99Ilp5ax1cJFrtG8CHw+0a3JPSCKutyMv9ZUT/A1ab1oEVZ6aQZpQCLhvhErSWepTX4U1xF
	hlr2MpxddjImo0IcjjXok0agmijOJt14lOtwwZw8dFXED/5Fsm6B7AuKe7c8j7lsyLfkZnrk19G
	xwUj8exfS6GHzzZxSaBp99rIbsu9fiT1aS+ff8yYrBbwE9fqB/j+hE+WCNUGYizp9lJWnkg+gCg
	uLdlaOjLLAh+C/KQfT6NoIdFl/AgZIyFytAH2aXwQxqKjEG/eIc/WzUGaJA3NZ+NE9LfhNlfK5c
	QizKS9i4BxSGIOOfcOhlOYa7zXzh1K/WZyiT6rUotXzNv6CwBhzdR4zAiB440MUkWO9MzeEot5Z
	VEiLUzp+/8vQzw2TWLkZI9q9U8EmgXqx5MzlcakbESidRD3OmKxJOYp60ubdWDA+UU7w==
X-Received: by 2002:a05:600c:1e2a:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-485269582efmr253670135e9.16.1773162558685;
        Tue, 10 Mar 2026 10:09:18 -0700 (PDT)
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
Subject: [PATCH v1 08/27] xen/riscv: implement make_arch_nodes()
Date: Tue, 10 Mar 2026 18:08:41 +0100
Message-ID: <9c97b4bc6fb8a5e556c38cfe7e34de0eb3cbbbb0.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D33702554C3
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

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile         |  1 +
 xen/arch/riscv/dom0less-build.c | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 xen/arch/riscv/dom0less-build.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 6c6c58ed1ac0..fb04cc5a56b2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += dom0less-build.o
 obj-y += domain.o
 obj-y += domain-build.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
new file mode 100644
index 000000000000..10863cffc96b
--- /dev/null
+++ b/xen/arch/riscv/dom0less-build.c
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/fdt-kernel.h>
+#include <xen/init.h>
+
+int __init make_arch_nodes(struct kernel_info *kinfo)
+{
+    /* No RISC-V specific nodes need to be made, at the moment. */
+
+    return 0;
+}
-- 
2.53.0


