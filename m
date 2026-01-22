Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOzLJMJUcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D96A41D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211352.1522953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqc-0000iZ-Bw; Thu, 22 Jan 2026 16:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211352.1522953; Thu, 22 Jan 2026 16:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqc-0000b5-3s; Thu, 22 Jan 2026 16:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1211352;
 Thu, 22 Jan 2026 16:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqa-0007Ij-2q
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:52 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 165fde96-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:47:50 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so162741766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:50 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:48 -0800 (PST)
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
X-Inumbo-ID: 165fde96-f7b2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100469; x=1769705269; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhPCPrLN9zev/AujtYrNqtpuJ2Oszmh0GkcNP2XIraQ=;
        b=MYuuD2FrcDYLOF7v8v1l0WHSzgCRmUPD5ey1IAaXSYD50YGGUBtss480sDNr37bfHl
         4N0VjrFSuSPaNEoig8DmOSFevbVcjR3oXum3S1RJis7edCOLgxEfNbTylWVmSi13aWPd
         bzBgHHfc5K27V5iqUvhh5Gg7rcqLLeG0g5aBpetxWoI9UQS4tRLHErQ1xCCV+93ioTDZ
         tNxg8JwPH/aNO2s1QLna5+ePZ2voeuV3ANlOsF6N9E5wdmgHhz+i21+lcPdK0oGOqV3k
         7pvyqxoGQdweItxgHKXalpI8IZ7t/BKSA+VfSVErnQw2SpdqveEZD4nKQ3oAUriB9kFY
         a+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100469; x=1769705269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhPCPrLN9zev/AujtYrNqtpuJ2Oszmh0GkcNP2XIraQ=;
        b=kvZt+ECwv5gpsi8O1EiCnaMlucE8KFojUvnyMlX1f27IuqMhiTu73WN7pTzkcm7lak
         X/zlHHhTu0ZZHDRrOAyyxOk8fsVhMrQ4ZYsSETphCnzaJhXCNsLBrNU44Ko1Sxx/o/YA
         p04TZnRVM/wMK8aDEFvif6mEc7XEZycqE1ksm6M6VOoUQ+BKY1lWUfySeviHtYrHsT7L
         yUzh37rc6lsnkIBJVUVOo2D8OW4gXf4MwiE9ElRsIL8OUUt7vKyiX65qCd+Fu55KO4/v
         nqEsk+V4m6b5UQt7szlJWnjwQC9gvzElHc9Ip8O9PJa8iv0HKoYG0oMFVadPUduG+9uR
         b7Ow==
X-Gm-Message-State: AOJu0YwhpS4beNgg/rGhTD2lvnmSm/ZpEaJHTh5zjOWa2/QY4kgy60LX
	bXNYElU7fhDvADR1o2L9CyHSU98jr8EuW7vyEopDhcpRk9yZU0DCf3XY+ayFwQ==
X-Gm-Gg: AZuq6aJdAYih20fhC5sUtXQVBAql9lD28MnruizlXm3l+QqRd6966EPiAw/+yO3tLVA
	QU9vgNdwh3Btr12EHkW7HJCaOEb0hUbUzQ5QcsayqEV3Hmt3kMO2Q7og/BLSx7gfZo/Eh/kcIrI
	Uvqs4Y0jA16qA38tu6cqN23EHRLE+uAdVBrBFqyWdDrN2LLrbL46AoeLMvklfOHqMcJ1oO4xACq
	OC1NX8K66VvrtM8AV8+UM4UEpaauP59S/dS8B20KGz5bnVNuHh2YYN+8Cb1Qc9SF5F1JNM1zjgR
	Ocom0irAsl4aXHREa2rpN+u89IOEPVH2d0sBPbaBwztflBLGOpnmV8KtAupeB1AgmIbtyi61Pyk
	tvB7XN21iRrFObxZve7u0fFT+FSoVWXBFKrfwQMMcRTScFcZaQWxGHVDTNL/8fzAzgR2nNjIRNg
	SUlEG5MaZifYES61R2yInbPy8b33ynUjTZk/TtX1nmZGHzlK5Q1Qi6Rg==
X-Received: by 2002:a17:907:7250:b0:b87:3c4a:e68f with SMTP id a640c23a62f3a-b88003423b0mr654314366b.36.1769100469187;
        Thu, 22 Jan 2026 08:47:49 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 08/16] xen/riscv: add temporary stub for smp_send_event_check_mask()
Date: Thu, 22 Jan 2026 17:47:23 +0100
Message-ID: <062dbab8751bd0c27b913ce78de3a3eeb0ffe22f.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8A0D96A41D
X-Rspamd-Action: no action

RISC-V SMP support is not yet implemented, but smp_send_event_check_mask()
is required by common code and vcpu_kick(), which is introduced later.
Provide a temporary stub implementation that asserts the mask only targets
CPU0.

cpumask_subset() is used instead of cpumask_equal() because some callers
(e.g. cpumask_raise_softirq() or cpu_raise_softirq_batch_finish()) may
legitimately pass an empty mask, which would otherwise cause false
failures.

The BUG_ON() ensures that attempts to use this function with multiple CPUs
are caught early once SMP support is introduced.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - use BUG_ON(cpumask_subset(...)) instead of "#ifdef NR_CPUS > 1".
 - Update the commit message.
---
 xen/arch/riscv/smp.c   | 7 +++++++
 xen/arch/riscv/stubs.c | 5 -----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/arch/riscv/smp.c b/xen/arch/riscv/smp.c
index 4ca6a4e89200..d645364ea47d 100644
--- a/xen/arch/riscv/smp.c
+++ b/xen/arch/riscv/smp.c
@@ -1,3 +1,4 @@
+#include <xen/cpumask.h>
 #include <xen/smp.h>
 
 /*
@@ -13,3 +14,9 @@
 struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
     .processor_id = NR_CPUS,
 }};
+
+void smp_send_event_check_mask(const cpumask_t *mask)
+{
+    /* Catch missing implementation once SMP support is introduced */
+    BUG_ON(!cpumask_subset(mask, cpumask_of(0)));
+}
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 9e30a9a3b50b..c5784a436574 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -65,11 +65,6 @@ int arch_monitor_domctl_event(struct domain *d,
 
 /* smp.c */
 
-void smp_send_event_check_mask(const cpumask_t *mask)
-{
-    BUG_ON("unimplemented");
-}
-
 void smp_send_call_function_mask(const cpumask_t *mask)
 {
     BUG_ON("unimplemented");
-- 
2.52.0


