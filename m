Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB9lG+ChsmnbOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C678270CF0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252080.1548897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e74-0007il-Rg; Thu, 12 Mar 2026 11:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252080.1548897; Thu, 12 Mar 2026 11:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e74-0007ft-Nr; Thu, 12 Mar 2026 11:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1252080;
 Thu, 12 Mar 2026 11:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0e73-0006gG-1e
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:21:57 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac67d48b-1e05-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 12:21:55 +0100 (CET)
Received: from BLAPR03CA0173.namprd03.prod.outlook.com (2603:10b6:208:32f::35)
 by DS5PPFD22966BE3.namprd12.prod.outlook.com (2603:10b6:f:fc00::662)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 11:21:49 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::ae) by BLAPR03CA0173.outlook.office365.com
 (2603:10b6:208:32f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 11:21:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:21:49 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 06:21:46 -0500
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
X-Inumbo-ID: ac67d48b-1e05-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdwFOJLt9vlEHVBamaCRsdGomWgkR28q8jXTETF5GHnCNPqjGoDJdAFndp9JJoWrfCWVpUl2NDqxwAD3MJDJxWOqsHT5U7EXkxcgHF9JCu//OgmNxtFrj6ISbPZU0u6PCkCBmTtl9uscQZ/d0hzKXy23NbyPFr9Z3CmRdLGigtmGy2wH6hx82PSQby/TcrnjV5I0gYiEzeJtKbBwH7ujOUuZHGKsh9jES2E5dSscchqMH8T4r9SgAmhZ/bUYXiNSYIB1MzlYXQp12ybV/H9MbSXL7Rbv+LMrX7vu4P1X7rkDJtFYwwYcoXXJhW9f1GWis6+yn3/h2TedMdgz+qp+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3XZe9B6SBQbKn8ypeUZSmODNlvYz970OWYJkLumTS8=;
 b=Zotl9oheACloDlcH4fuVeVA9pA8kTKNjs16BsFs/tKGQja2orxHsq1wFixX8KelCj3uJhDKDKjvoCKp+KYWioTv1DD7cMUEfm5+owSBS+E9SwWqTSc4lkFWf/BIPmcU2tdcaW6ukh+RDBvrsfmnOQPdkYZAIGzb4AZj0TMWDfDS4Rouu3RNKCHXLUKWXMgY78quJbIta9OhHd+B6FQtpl8jl0IRSBeg/FigYY/rxvjrUhAqGIFr++26vZ0/Awqe6vpg/VbVwxK/ri1W0z2J6ApSnvajgUZpF9N7lM68Lpc4sjhunzezmMCM0I0L8ZKP1cdfwR4rPHNZjGiJQw3/FaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3XZe9B6SBQbKn8ypeUZSmODNlvYz970OWYJkLumTS8=;
 b=I41yhbnbCCdgxN4HPe7jxHsRLs1+DJQrW9TQO00TYuJ/OSljlFN4UBfqukqJvevuauTZqYEflT6OLCOYSyc/G8Fyby3dhwRVh0SZ5ruM2gemQMqCL9ocIU9f/Da7TbK3vcP5ThSXoijyFo0PY74TtprOviLMjTNMqz4wj5b6QWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 5/5] x86/hvm: Un-indent the HVM_FEP block in the #UD handler
Date: Thu, 12 Mar 2026 12:21:14 +0100
Message-ID: <20260312112116.22563-6-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DS5PPFD22966BE3:EE_
X-MS-Office365-Filtering-Correlation-Id: a1bddbd4-34bb-46d9-c773-08de80298d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M80IomQrWaBTjaPrn8qRafC1MRET4Uc6BdN07XML7ADd693QHE5w2s9Cuo3TLolDUQ3EmEEeoKhKEIdYd1CN3W5+AMlwvYiKaCUYSHeIostRq1zQUsxAvFFEtWRDhyIcjVr2LovdS10gt2VFpyeLzoaNh3bZ260M9S0fVAFiQ066nCwbuY9+wwINvEgqbU/EQzj0UayNNZrlp8/Ezq71sZsQKoRGwP43Up8vgdIFB5Zxs8ofww+BRNCHNIV5MGLu0V9UNt3iFOlfR+fKimKl5VF3fVh58XPeik2nztJ4GJQ0UVSr+T+eGzEvQe7qOxH4yxVgWLeL9weS1QyoaMmeJ0AutRg1H3pooPAOz+2+i8t102/2zk5ZTzl5XLoeoV+T6j8Z7cvwm6opHEpAHMRX/E5jt8WQ1pmEt1nKUw3TqA8jmTyxG85+qgt7k7eFaTJZyHgBL0XK+yjIdpTizYUmlX87dJcO6gSp2EbslL2WumxbGnpqF13sHWTEDqK0GmS+NceIyUBGC/Tg/irjtPyBmYXyD19c5N8m7uOxFTcMMBgghPyBatdf6pI7/i04XdjDGgD3mjBuIw15u3KKqoPAPFiPNiSjRJNng2nTJxRObFbfEujH8SoshdBDDScQcCEBzWOoD4Xlr0f+Qr/NDMZlTWgQ1CI5mz1sO0npf1DiZuzOFi6En7RXrjJqFFBWg/fEoy87oeOxKsxwLco6LrstBppVr0GqRvL6mrIxJaAKtldol5eqvaV2ar9EkWbZSHwU/XjscZYttzBclzf9fGpitg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B41kkjv6oc6ttN8PFcrSRImCRottItfd9+FR7GwO7jGjKS49tWsrbJhr/ILyeKRVnEE716wUw74R5GijJ2DoirUR3xeIoY/tmpjmvwqImm9bJnXoyU3C5HHoL8+OcAE8W6I3F1b+JycSXR+NrRUu5676LYU+XiqGDkbi6IOXzYO/X5vJ6dq1ZeKA1aenS8vefk5Fz9TFUqW7CLgwtmXVfdtb24rZYXBU4uTqteY1TPQG8CEwa/KoLXzUv+Sl1oiRL2Kmt0RiJixNPm++cz9lV6glzSosEZp2u6uIhGTL0QAcix++qAxidQtxgOhN+fyp+Eiohzl+NOQH/GK6tZo8LBAYiAazvNxASs1D6WA/y+NJSmWJbFK6C1iU2vwxmGgQZMYHVnejY/zQdiXJxqMEfjxJS7tlr0ZEFBZiZjZKuC0ikPtg3uZ+aTUX6pinKXJN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:21:49.0692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bddbd4-34bb-46d9-c773-08de80298d9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFD22966BE3
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0C678270CF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

FEP is now the only reason for the #UD handler to run.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/hvm.c | 43 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c8cae41705d..4c00cf4c4fe 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3837,35 +3837,34 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
     struct vcpu *cur = current;
     bool should_emulate = false;
     struct hvm_emulate_ctxt ctxt;
+    const struct segment_register *cs;
+    uint32_t walk;
+    unsigned long addr;
+    char sig[5]; /* ud2; .ascii "xen" */
 
     hvm_emulate_init_once(&ctxt, NULL, regs);
 
-    if ( opt_hvm_fep )
+    cs = &ctxt.seg_reg[x86_seg_cs];
+    walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
+            ? PFEC_user_mode : 0) | PFEC_insn_fetch;
+
+    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
+                                    sizeof(sig), hvm_access_insn_fetch,
+                                    cs, &addr) &&
+         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
+                                     walk, NULL) == HVMTRANS_okay) &&
+         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
     {
-        const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
-        uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
-                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
-        unsigned long addr;
-        char sig[5]; /* ud2; .ascii "xen" */
-
-        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
-                                        sizeof(sig), hvm_access_insn_fetch,
-                                        cs, &addr) &&
-             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
-                                         walk, NULL) == HVMTRANS_okay) &&
-             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
-        {
-            regs->rip += sizeof(sig);
-            regs->eflags &= ~X86_EFLAGS_RF;
+        regs->rip += sizeof(sig);
+        regs->eflags &= ~X86_EFLAGS_RF;
 
-            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
-            if ( !(hvm_long_mode_active(cur) && cs->l) )
-                regs->rip = (uint32_t)regs->rip;
+        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
+        if ( !(hvm_long_mode_active(cur) && cs->l) )
+            regs->rip = (uint32_t)regs->rip;
 
-            add_taint(TAINT_HVM_FEP);
+        add_taint(TAINT_HVM_FEP);
 
-            should_emulate = true;
-        }
+        should_emulate = true;
     }
 
     if ( !should_emulate )
-- 
2.43.0


