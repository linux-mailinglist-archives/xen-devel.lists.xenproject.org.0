Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJSNHlVVcmkJiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7D6A503
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211432.1523018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixst-0007AN-Td; Thu, 22 Jan 2026 16:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211432.1523018; Thu, 22 Jan 2026 16:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixst-000789-Qw; Thu, 22 Jan 2026 16:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1211432;
 Thu, 22 Jan 2026 16:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vixss-000783-BP
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:50:14 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a51f212-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:50:12 +0100 (CET)
Received: from PH8PR22CA0016.namprd22.prod.outlook.com (2603:10b6:510:2d1::9)
 by BN7PPF0D2C72F0D.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 16:50:05 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::68) by PH8PR22CA0016.outlook.office365.com
 (2603:10b6:510:2d1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:50:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:50:03 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 10:49:59 -0600
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
X-Inumbo-ID: 6a51f212-f7b2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F16LbJM365Mjp73ksxnDTLcGqvz77xXQTgRjVNdQoLxG6CansKNb7fWd/h9ij9ih6LEY+xenNB0w/4U+9PLSvV9EBEJ8Mf5SzhzG60Y+wEcPVcTok2XXVoqKAEsbnnSZAjvafXWlcTxTwjJDoEM6ZSjsUMc/A2udQJDYXnaQZymtJE2xVlI4CCjIG6wbXYgxrWbEWop/INi7vZubL2G8u8GFN5snF/S9LIe+JiGnK19UwWbgfFZavVmJadjznkTB9oDFXIm244oc/+711YZubi14pw1uyLkajCbQjAWBNFhxhR3NTMcT3HfhHLxWD0UmvstRIxj1nPAC57VywDiizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EmXfLyMCmn0zGN/UiCxh5bIuJ3Np7zB11ymzGrJfEo=;
 b=vDm6BA112AYdrblBXZtcb0LwTsHTIlnZQriQo0wDyHYSsCELDw724NuZTTqESovDs4tUlv8/XMaje2aWXgQF/h8tEZSpjMI5ZAiBFhOOnRBy/aZg4LuPXHAThv+U1anVNEr1UPxr4Tqmb0l+TZpJjpK+c9E+4QeNmdnTnPgbDB30qquFM0k68waSxIG4Q3ihWUFCWJu9Qoewq2N9p5Dc0DnA4kKC7WmqqfBstt2l54hstj9vZTLxjdg8eQlDsBCZqPvUf8tfyNfrkioHXfSj16a0JsFCZoLXEmAHP6fhkHbuDRDR+/wUhsKwcBkyRDPW6Wp++EhAN4pm64lOWi22OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EmXfLyMCmn0zGN/UiCxh5bIuJ3Np7zB11ymzGrJfEo=;
 b=1SOSfcadga/SqWfjU0EvCXbp0pEVQf50TL5rW7NHYMrQithJnZRSjMP/fbjripvMmUmDUnzhSmasnAjiU49x/K0ME03oPSu554GSnFp27kYR7B11O5kXHPE465+eW4jRPpytZl5vmUJ+w1OItpncHKUIhZhI+HONhHTwIJM4W5A=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH 2/4] x86/hvm: Disable non-FEP cross-vendor handling in #UD handler
Date: Thu, 22 Jan 2026 17:49:38 +0100
Message-ID: <20260122164943.20691-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|BN7PPF0D2C72F0D:EE_
X-MS-Office365-Filtering-Correlation-Id: 35533bef-394e-450c-9267-08de59d64a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0Y1Q25sYnZtY1pSOEEyWlZIWXdUbXNZWEVxbHhyaVdWaG9NK2p1WkxmcHR0?=
 =?utf-8?B?TUQ1NGVTQkd6Y1A4MVFVWERBc2VlMHRiUm5JL0FseGsvR3UzYzNMSDVhaW1Q?=
 =?utf-8?B?Ym5NckRXa0VqZVg2aWZxZGFyb01OeWRKYjZ2Wkh6WVhJeExwdXpGdEpkTW5V?=
 =?utf-8?B?emlyU0w3YXYxSk53dExFYTdpVTB5bnJ3ZlZWaUVmdE9ZZEtHY3Y5ODd0Mm9Z?=
 =?utf-8?B?eXpZdmVuRjNTbVVxUC9sMHhBbk1ra3dNZkdsYy9tOFpnQmVRRTllZm51ZFFn?=
 =?utf-8?B?SDVEb3Avc1BXaWJSeGRYS0UrYzdwZWFOUWhLNzJjUXVKaElJdFNuNDlGY2tH?=
 =?utf-8?B?QktHTFMvUnBuRDR6TmNobllJOXRZb0tnUWR4REdDc0JyUmFEdWtSNlZqMVFK?=
 =?utf-8?B?Zkp0ZVFWK3gzRGpCclNRc3pDNlVrVUNOSERXS0I4TWdhTXhqem9ZdCs3Z0VR?=
 =?utf-8?B?SzdNbDkvVEVLNDEyWXAwMWt3UFB6MUk1cnhRWExxOVBxM1V2OTBpUVl4eFNJ?=
 =?utf-8?B?VlFIb01BQXJVRE9jeE5ON2ZDWWkwdWo1dUljaG9yQlZMQ2t6WlJkM3J5NXVt?=
 =?utf-8?B?VjRVblZ3R29jVTlwb1VHVGY2YzNsRTRwTTE1Nm05ZmRLdGRNTVNTcUpUd3o0?=
 =?utf-8?B?bW1CTW9DUi9MN0g4V2NTN011c3FGa0Y5NkxGcDg2OUhmTXQwRERMNGZnOVF3?=
 =?utf-8?B?K1Z3KzFFS3IvakwxOGlvU0tCd2YzWTZNSitPRmh5TXBObnVCTGtwakgxUTRa?=
 =?utf-8?B?S1lIaTZNTm1ZK0s1MTJKcU83UjRhdUp4YjFCVGVEcWFDempxakxNeHBBR0Jx?=
 =?utf-8?B?c2ZuVXQyRWpUaTF6NmVocmpLZVRuVXhBWHFGUUJpaHVzVG9LSENFRHVweG1D?=
 =?utf-8?B?eDh4WFlmS0tFUmYzNEZXWHhDNnQ1MlJhNW5SOGJ3azlzRWRudWVKUUJqQjA2?=
 =?utf-8?B?bDRkam9FcGhOUnAzR2oyMU5FTkdQUzRsN3dzUlBHOCt3MjJPL0pZQkFiTjlM?=
 =?utf-8?B?U0xwZnZPOFl2YjRUdzkzbkRIdEdpSDBjQWRGOWJsUlBLZUxobUxuQ2JuNm5w?=
 =?utf-8?B?c2RBZ3N4RElZQjgyZmZzamYzVGhDSjBHdndMTlFsS0xuTmIxc29SOGpaU0VC?=
 =?utf-8?B?aDk5dDZzNitJdHo5UElUSm12WDJoUVYrc3lIQmY1SVJrMUZFbDBWWVI1VXpi?=
 =?utf-8?B?ZVFNTHpEYXdCdzJTTmMwNGt2YzQrMG8wZ2I3ZHBRVG5RY3hjNHVlV1BXVmZV?=
 =?utf-8?B?ZFUzaWZTV1E4cWN0cUpzOGZpZXJkUlE4LzRiZ3VCS3Q5ai9lYlMyVDJEZ3Mv?=
 =?utf-8?B?UWZ5MWY3dUYxVkFKVzhJUEMyby9ZdUJlVzA0dVlobmdYbHdlQ3BtTkc4RjBW?=
 =?utf-8?B?eGc2SzlSZjA2bEpTcm40NXRESTlUZXA1bDJZei9pU01ZcUlleDJTSkdNd2l2?=
 =?utf-8?B?S2szTGdHTU9kTC8yS1YvekpzMWw3MGNHQkwrd2hEUmNadHRyOWxDNDhBcno1?=
 =?utf-8?B?VGd6OS9lSE5YM1ZDbVhwRFlOVmI2MVBKeUxOenhLbEVodnJJNmZEQnVNM0lk?=
 =?utf-8?B?bERidnBOZzhod3B0UWEweU9ONmp1L1RUL1EvQVB6UGZiL1BpM2RVNU9oVGRE?=
 =?utf-8?B?UVdPQkxzS0d5cU93eDg1THhaY2grZHE0M0JMdDhPc3ZjSHFxRzE3VjVjcDdG?=
 =?utf-8?B?dC8xUEVkZ1oxbENXZU53bEpOak1tRkJNODdsU1hadjFuZmVJUVB4RWxnMnRu?=
 =?utf-8?B?Tmc4cTZGMnNnWUs1SFgxaXF1ZTR2ajZ1T2FjMFozUGZuUGo2SFVPTHJGU0VG?=
 =?utf-8?B?NnQvSmN3SnMwWUFqWG4rZURkOXE5YTg3MitjZ1B1bXNZUEhaL3NLN1V2NDRQ?=
 =?utf-8?B?TGRZL2E3MlRYNjZJLy83OHNjbHFWc3l4cHlxTGF2a04zclJSZUpMaDcrckxu?=
 =?utf-8?B?NG5oVm1tZWxqKzdYc01lYjVHTjArVmptSVdMMGkwcFY0cE04aXoxN0xmQTdq?=
 =?utf-8?B?SnVsbjBocWUwSXRwbisvTUh1bmJ0M3N6d0JpaWZ3MDBtSC93a0JNbHd1MVBY?=
 =?utf-8?B?MU9ld2VMYWdmRlJ6WUxLUUNld0FKUVIxU1BLMVJVSDhUazBuUGs3MHZHUXhK?=
 =?utf-8?B?ejE3aHhiQ25nWlFaUlJpZE9BeVJGUWdGeHVocjBZTzM2ZWg1SVJHTEhCUlFn?=
 =?utf-8?B?WVk5MmhGc3ZNQUxuUHR4SDZ4V1JUYWJQdEFjM0RHb2FqOGtRVGF2RkljU3F4?=
 =?utf-8?B?SkJjVDNZaHgyc0J5ajltdWh5alFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:50:03.3182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35533bef-394e-450c-9267-08de59d64a16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D2C72F0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 32A7D6A503
X-Rspamd-Action: no action

Remove cross-vendor support now that VMs can no longer have a different
vendor than the host, leaving FEP as the sole raison-d'être for #UD
interception.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/hvm.c     | 25 ++++---------------------
 xen/arch/x86/hvm/svm/svm.c |  4 ++--
 xen/arch/x86/hvm/vmx/vmx.c |  4 ++--
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..611ff83a60 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3832,28 +3832,13 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
     return X86EMUL_OKAY;
 }
 
-static bool cf_check is_cross_vendor(
-    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
-{
-    switch ( ctxt->opcode )
-    {
-    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
-    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
-    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
-        return true;
-    }
-
-    return false;
-}
-
+#ifdef CONFIG_HVM_FEP
 void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
-    bool should_emulate =
-        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
     struct hvm_emulate_ctxt ctxt;
 
-    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
+    hvm_emulate_init_once(&ctxt, NULL, regs);
 
     if ( opt_hvm_fep )
     {
@@ -3878,12 +3863,9 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
                 regs->rip = (uint32_t)regs->rip;
 
             add_taint(TAINT_HVM_FEP);
-
-            should_emulate = true;
         }
     }
-
-    if ( !should_emulate )
+    else
     {
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         return;
@@ -3903,6 +3885,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
         break;
     }
 }
+#endif /* CONFIG_HVM_FEP */
 
 enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
 {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..0658ca990f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -589,8 +589,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
-    if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+    if ( opt_hvm_fep )
         bitmap |= (1U << X86_EXC_UD);
     else
         bitmap &= ~(1U << X86_EXC_UD);
@@ -2810,6 +2809,7 @@ void asmlinkage svm_vmexit_handler(void)
         break;
 
     case VMEXIT_EXCEPTION_UD:
+        BUG_ON(!IS_ENABLED(CONFIG_HVM_FEP));
         hvm_ud_intercept(regs);
         break;
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 40e4c71244..34e988ee61 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -797,8 +797,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     int rc = 0;
 
-    if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+    if ( opt_hvm_fep )
         v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
     else
         v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
@@ -4576,6 +4575,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
             /* Already handled above. */
             break;
         case X86_EXC_UD:
+            BUG_ON(!IS_ENABLED(CONFIG_HVM_FEP));
             TRACE(TRC_HVM_TRAP, vector);
             hvm_ud_intercept(regs);
             break;
-- 
2.43.0


