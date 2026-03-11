Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKDBNZWAsWmjCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:47:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49602265ACA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251173.1548436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXG-0000ST-Hf; Wed, 11 Mar 2026 14:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251173.1548436; Wed, 11 Mar 2026 14:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXG-0000Oz-AY; Wed, 11 Mar 2026 14:27:42 +0000
Received: by outflank-mailman (input) for mailman id 1251173;
 Wed, 11 Mar 2026 14:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0KXF-0000Ns-Dw
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:27:41 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74afc3c2-1d56-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 15:27:38 +0100 (CET)
Received: from SN7PR18CA0002.namprd18.prod.outlook.com (2603:10b6:806:f3::25)
 by PH0PR12MB7839.namprd12.prod.outlook.com (2603:10b6:510:286::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.23; Wed, 11 Mar
 2026 14:27:28 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::75) by SN7PR18CA0002.outlook.office365.com
 (2603:10b6:806:f3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 14:27:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 14:27:28 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 09:27:26 -0500
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
X-Inumbo-ID: 74afc3c2-1d56-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hktbEHC8uoz/N1wwmwgCUkxURNtUHzDe9DbTnku7tD/pI3o9zto4kE+bhe6SzhY9TUz6rH0+BSJQ9D/Kbxe+I6QhgwG2Ezwwdt8X/9IYiSmOd25/8OdXWv2JZgh3jbRI0vr+C/yDONgsgBE5joX3QO5nIGz6XdjsL+vo1DVnAMETfaEaAofuLrBHMkjYLKfLJhU6xexxD7AClJo6qTixyZyTCDu/BN5/9hE7SF6rPjurjgdJTBX0/wMlPN9+radXFpHvL7dKR2Lb9yyWMowlNxsKgpFDd2lZGF+R6L56q5aWbMwhSD7Ig95nvHYNAjsBRZCGXjbfsIe4xUtZ5AcKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdWkxG9i7l3rW3T6Rp/jnTpeGEs/5PuOgfzAZHWlwfs=;
 b=wWpC6IMqtUL1hMTPj6Ysm7M2BXxJ/EXXeTqrCzRsQ1IustJdjTfpaT4FLkRElA3awrvtOYQjQNn1aT2UJm26/a9IVdA9p6cyITW9/C4YjJJiJhtnbWfH+PhTS0fPGu+D4mZOJJiK4eLxM5Bp2f9RNY9JXwnVdb4r6598qPb6wE2VGJArhftQGy7U3AZ6I5ESn883idRYbf35vK1ocVxVWYtQOAF6aFxU3IDd0zpRqHpTmtpxzDrKnEEvgOfR21pM3RvfDf3toJdTTaTmYhnMVE9ggq567kSQqfe/PTN0Okq4oD7IotSn0jTdy82IoiMM2zaN1rNdMAfNtBMz2OnkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdWkxG9i7l3rW3T6Rp/jnTpeGEs/5PuOgfzAZHWlwfs=;
 b=ayNpLI6vguhwi4JepUf4YGkvEpE+N7PJPNtdtXHFsMITs4gNoUbP8JFNLORetEFqZcuBF2sTL9VLriMHJQ3uX2USzb/gH7u65qt1lozWTVzTH03Pp1qbYdSmFF+1Lzj4M/oxOKeQN0IJpvWZT2m96lWe05pgltjhkDFO2M8q+6c=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v4 3/4] x86/hvm: Remove cross-vendor checks from MSR handlers.
Date: Wed, 11 Mar 2026 15:27:06 +0100
Message-ID: <20260311142711.16754-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|PH0PR12MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da0f76e-ac80-4421-b574-08de7f7a52e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zT5lDCDbMtFPdumg1Hnp2G/t/dSK62HbvoyxPkX7i7twBUuU9W+TavWTnbiCcMaG8H24ecEbB4adSX/chzx9kfPb8X7+gM2fhKXNsdBTEhmHfmn6A0humXKxMg+kR4SSKJIfVh6GEkwbztgA/Iz65lqP+Vzf6O1WeOpqqJJcib/XKEpxu/o7nCtFdD9FG6x2P8PkCNdR1Kp41HLRPV0jEPg1jX3OACG/3c5sd+ieUUEj+Xy1Bb23Vs6nIj0Z2Om/NPcCWYTFGREzqsbgfVS+ZtNzaXFabA2B4P6P1GJUv/fu2LXm7ikXyLmvjMkIOzLrbkpBV+NJZoVskwNjSB8+TvXeG6IqBAV51Xlds6FLVhNPw3khFKTnWa48xWXT4MWZ06B1c3QCZyfNIIy/G0MsNaQEkhWsPxsqwkOe80tp9GDaSjq8YkKP4IlOYRPkS6tcYBoBtN4RtlVTt3e8Qqp28GgHKyXt/XRza+dnNJu+/XA8FFKY4TMSGj06e0RhrIazZuDliN5ZGUyl/yapfTnq4DTkAZ4UOjrCUBDFwtorAi+lOJdL7mdiCJwA/wuSMxlI/hYs1nD4GyQoSvxCjN3PsCCKEROVN+OheCyESKXLL7ePxN0HOwNP+CsEaB3Z0i2gM+A4weYM8cZrGLn195dlRwiNfCQLGw9ddaHeNapDU9abwToaaiQuVGyR73qNcM84CDlzz1ileBpN9mITdN1sod9xyKpwNMKnB11QSp9+VLMtgVQ4BlmIHo+X4q39glOt76JUksMUAALTk/ZwzQ2S/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uBpz632AZlrE6ixwiH//fdJEBCjBO91PTo2FthfRCYYDRVZGLGdhb1QrHQ/yA13T5qZ1Tu6IS7MMq7Ovfox1Gc/E3/cJbquQWYoz7g09UeRz7t2vs/zYF2QYvHGb23EpLltdhSnbdj9OqyFrPuqQnNSTdnCn2gPSej2GpvoDy6FUD16GPXTmzXVAnsI2UWhVDx7q8ymN9LCKdPzuJiUUYH3DLQ/UxWWVz8Xl0UauxVsB4E0Z+xB5WnUM2j/9Edn/AIOtuE7IqBuF6qMJCA9OXbBwFNxRfZwEBiOqkRdhN2degdGkSYUDTZ10IsOpjQuH4BI12d2iAI+3jxmJdSb6tFjxvsUH6Gf2RKfSeNIwTl73gMEmEddQlFWif2YyQO5T+6l1FxsAS9GRelmYns1iCx5ivKOKNsA1WYYAqA1uZN/vR4xSbc++R3Fm/BdYj2za
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:27:28.5829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da0f76e-ac80-4421-b574-08de7f7a52e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7839
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,vates.tech:email];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 49602265ACA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Not a functional change now that cross-vendor guests are not launchable.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/msr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 6a97be59d52..d10891dcfc8 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_IA32_PLATFORM_ID:
-        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.vendor & X86_VENDOR_INTEL) )
+        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
             goto gp_fault;
+
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
 
@@ -189,9 +189,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * from Xen's last microcode load, which can be forwarded straight to
          * the guest.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
+        if ( !(boot_cpu_data.vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
         break;
-- 
2.43.0


