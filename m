Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCnQLsRUcmkIiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B36A432
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211355.1522973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqe-0001EX-CQ; Thu, 22 Jan 2026 16:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211355.1522973; Thu, 22 Jan 2026 16:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqe-00016a-3I; Thu, 22 Jan 2026 16:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1211355;
 Thu, 22 Jan 2026 16:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqc-0007Id-1p
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:54 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18716147-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:53 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8707005183so195855266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:53 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:52 -0800 (PST)
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
X-Inumbo-ID: 18716147-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100473; x=1769705273; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFNz2eINTf9rVU++UNSQJpwAORPoMimHJyiwu4QoyIk=;
        b=B39nKBiuAKmmI+eUiNNlVTEPXbQ12gOBTMtFDuNLQJ5/mvfGEJuCm2B5DCNwtg1GVc
         1lvvlKIV7sLpLNKDQlnkBypxYCWQ/1HuIQdUcGfYSZ5C9conPZybhk0ceR1f+OiiqThz
         YWKRV8tV/PL+CTy9AkZmHuslYND5RIs9KLN+AVgRS7OnVcoG44VIdykx9Jr8JKZE3fXi
         I87TyyJDnZzhoNODZNLG7Fy/bAs3DESXYRafUjp8zxUX+PxobPeQwtkP0Fyd8pRFr4N+
         hkNVxnFSCiYdsPjRzXueyXEQTpHe30YvwT9PMvpe7xVKyN3hceeSJJcVZLeq/a6Av2kv
         teJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100473; x=1769705273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFNz2eINTf9rVU++UNSQJpwAORPoMimHJyiwu4QoyIk=;
        b=lqmCTUe5TfUSnK1Bu2NVpEMAIXt6yKeCjFsL2ZYTPjhf1BpXIRLKmeTWiGFm8cqbkc
         fG6FEIq0D6olP/U2bUHIWmRDCPLdJc5D7bshuhGWdNuqKI+Z3NN9i2Ed7zob7wDNcR2Y
         PpylVGECn4H/HhptWnklarHDhuazzCCS74iVTMBKrElnSLuKL/8QJYUVy/AQtvH7Lnah
         MJK7dC1FriSdxvYBRAmQmzR9sMP9uaDQQs0UYfPPsssVpTJG5lgoGnvKVW/Aq4etLGX4
         qaMWxE8mw4YiKiUZrVPcD9IKPx8EndbSJfv5JM2anXkVv1jB20mUgfMmbX6FWbM6E5sA
         LkVw==
X-Gm-Message-State: AOJu0Yzp3mStcLV3m5ACHpGazRmxwb/qvxAjUaQp+Xc9C/++d6WyRDYI
	QtTL7P2jwSVvxiYlkwAkZ8W5MhVlWaDblUIDtqwzhORHP1xzGwAmkYaBye8anQ==
X-Gm-Gg: AZuq6aII4n9OtrDtGADr8gZeUN+c9TqpK31qmZPkk+lym1dcBuOUpjroEmNny2SEPJM
	k24r5KhlcjUwfbfq5/0NY6kFWQgi42Mj9GRv+qSNjI0FwsrGy8JqE/BM9iGUSZL5DMj0xak1qIS
	7UWihf3xQRUlFMQg7KIes5jCRUrmDVHfPFzJHJv6EFqmp9MLn4iZI8wrz5sTxCYT1xD0cEUSlGz
	1IAWuaVfwa0CELRzHmFcTOH8EMqm3f+mn09BmY8RPO4i0isXZlavNQhz4s7+gOQIdpnv+cGytDM
	nt5R1M1yd1vSP2cWgOFmXhwrWJ9yLB4yaEcslRAfinQaNKD9s3cEMkggcnnkQVMs46P5E5emIuN
	KM4lnm+0Oo6MleJkPwT3dzoK025AI6QwgJ0zAKbtr50jVWFo4cVTTlwfWxdRNMoCr+foyHNdSDd
	QDnUZJ7H49pMLX5DtABkmY/8h0Kqyopxj7B6B/EfJce5Ii/INpQKYvGKnfGNj8NJF1
X-Received: by 2002:a17:907:7256:b0:b84:40d3:43e6 with SMTP id a640c23a62f3a-b8792e0b88fmr1732932566b.6.1769100472698;
        Thu, 22 Jan 2026 08:47:52 -0800 (PST)
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
Subject: [PATCH v2 11/16] xen/riscv: implement SBI legacy SET_TIMER support for guests
Date: Thu, 22 Jan 2026 17:47:26 +0100
Message-ID: <0cca5db24ac772b1d1145e189b26ace63ef9a58d.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A98B36A432
X-Rspamd-Action: no action

Add handling of the SBI_EXT_0_1_SET_TIMER function ID to the legacy
extension ecall handler. The handler now programs the vCPU’s virtual
timer via vtimer_set_timer() and returns SBI_SUCCESS.

This enables guests using the legacy SBI timer interface to schedule
timer events correctly.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/vsbi/legacy-extension.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/vsbi/legacy-extension.c b/xen/arch/riscv/vsbi/legacy-extension.c
index 2e8df191c295..090c23440cea 100644
--- a/xen/arch/riscv/vsbi/legacy-extension.c
+++ b/xen/arch/riscv/vsbi/legacy-extension.c
@@ -7,6 +7,7 @@
 
 #include <asm/processor.h>
 #include <asm/vsbi.h>
+#include <asm/vtimer.h>
 
 static void vsbi_print_char(char c)
 {
@@ -44,6 +45,11 @@ static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
         ret = SBI_ERR_NOT_SUPPORTED;
         break;
 
+    case SBI_EXT_0_1_SET_TIMER:
+        vtimer_set_timer(&current->arch.vtimer, regs->a0);
+        regs->a0 = SBI_SUCCESS;
+        break;
+
     default:
         /*
          * TODO: domain_crash() is acceptable here while things are still under
-- 
2.52.0


