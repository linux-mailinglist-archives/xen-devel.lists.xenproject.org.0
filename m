Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A/mNic4xmm7HgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80123340A8C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265115.1556212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6236-0001xM-K3; Fri, 27 Mar 2026 07:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265115.1556212; Fri, 27 Mar 2026 07:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6236-0001v5-G3; Fri, 27 Mar 2026 07:56:08 +0000
Received: by outflank-mailman (input) for mailman id 1265115;
 Fri, 27 Mar 2026 07:56:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1w6235-0001th-6J
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 07:56:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6233-001U1q-0Q
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:56:06 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69c63810-5cb7-0a2a0a5109dd-0a2a450599c4-16
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:56:06 +0100
Received: from [40.93.195.1]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <penny.zheng@amd.com>)
 id 69c63814-5aeb-0a2a45050019-285dc301fdaa-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:56:06 +0100
Received: from DM6PR12CA0001.namprd12.prod.outlook.com (2603:10b6:5:1c0::14)
 by BN3PR12MB9593.namprd12.prod.outlook.com (2603:10b6:408:2cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 07:56:00 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::a) by DM6PR12CA0001.outlook.office365.com
 (2603:10b6:5:1c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 07:55:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:56:00 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 27 Mar 2026 02:55:56 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blHN6y9jzhIuJGYzhqPjqNlrZAPN/fD+ljVWlyYBeQKvySE1ePd9STgaggr/qq/GZBzNpJS4LFHa1B0rIQIZS/Zw+k2pmgUA43XVCAMPGfRn+qqjIVvIlckbPHsqqZ6OT3sEprIlNcoCHWbCsrmj9gakT0SzPT4LBhSFHzeZwa109lPmPCsTr1agYMdoD01AanoJXGnH3Db7VuU/LvTwDM8EUemti+Gg/PrrusS+ysYrMyxCFMM56LaM2+jax6P0a+L9OtMoH0xyqpg3nzFGMJNHGpa7A7cQI1qXExe96JrWQP33id75fXtpwrhzfNajBKPHpO0vlLs08x2qwdFvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l83BYNp+aMnzNw6sbx4zGflMnyM8f979yRPcRxeM/Wc=;
 b=CLhB4GCjRCB3cnQjZ6SL81WyE0IJezNKN5f867ZxoyOUmUHOCjyhVrax0RW4MF1nKZKZEQiCRM2xjHAOcaGupEONkIRou1qrHk55rzICrtdMp+w6GBVDWTen6/f1K4vjpDH7Qp/MVPUjkXnpgoTxPi1xzDMcJ745OMfKOS2sCkKD7XReiotBBRVJ9NE13KNObbwnHCp45b1VESJfCcmwgb+0icSR+iVhkWrf8g3X2IyYqdxrrCXjv6GTQVlAmru8zSD9LIjFKg0dCkWtcABRdEklKAGoWAgrdOsMbpPBcPsD4SLDpjzN6R7beT/3fFP//GcC9c94E57kta4hb1G6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l83BYNp+aMnzNw6sbx4zGflMnyM8f979yRPcRxeM/Wc=;
 b=P1x2hj4Ruelvo/clAEPWhYWebSiVY5PeI+9cCOaT1Q0DDq7nKOAXhNxd6zyZYLkxbT1BPJo1WRATYbLknIqxBYp9oab7PjrQPzk2FrTskvhTjZtZozAT6KJTLy0d0s3UkQwFW7VALzlAeUo2EnKI5a9lXTel6Ag0FGl6cNgbDso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <alejandro.garciavallejo@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Penny Zheng <penny.zheng@amd.com>
Subject: [PATCH v1 3/3] xen/arm: fix mfn_to_gfn() usage in memory_exchange()
Date: Fri, 27 Mar 2026 15:50:25 +0800
Message-ID: <20260327075025.3008606-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327075025.3008606-1-Penny.Zheng@amd.com>
References: <20260327075025.3008606-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|BN3PR12MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 030b24cd-9b52-4120-8851-08de8bd6495b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XGCfPDFJjj0q+KsZOsa9QmBSzxUgwYzTe4zabtLozCVEGSV3JIodl9KbNBATcu3H6NdQw9DaPUhYo0OnHBUEILX7Smgf6DBJWPZrVlgePxtsTn3RNdgbSfDazueQ9JtHsBQdI6Zzf+MGT096aSiwkfrbTD3/5beMTpXou/U4e7drSotSTzgtp9Yt0O6bkIZhY7N0DGC+DPmKeWwGDaEcD0ld9fngIp3ngJK9N6FAXGMddzqjBuy6vCg5RTsZOgAC7hhnPbakB2g8+a2P+0jrujxax9q0oXYSddLqhw0Phc3WXga4CXGoWaHnz0pOsq3Doa2SWY8rV3+HwNt7mvM1T21fhUtqthXhmgAQX0dX+PbMBJTujzeUwfdBNqxgWXXVeciqt5PmwNMh7dCrmid80afoUC7B48twLR1Uq+kNyJ4evExv4wNDXJubKAH4m6Ie5WxeImgeVWYaeTqfNQWhBKBcfKacHikUNLBMNwjaj+Pq158HsdXFU5owIoLMW64KwgECsFES0tWcjpzK00UAku+B1rqqk7SfvHdfHE7kpMeiEHCmWqRiY5p1CFyU4ZuwaOp8qwcB7qy6QoMX1YlyHtUBlk6YYHHY4eE1zeQbPkb25FF8/q/z/dEefvDt0DsX9Mp5ocvyIfDbFtJ/wNN9eICxUmZHZdD9xy+/Yyv0NjBeAlECpid1dAuEfHb8CoTmBYNT64UlThOs6qafzqA/VBUASnghmFaLQKH85KsuBEnV59ede8lDW3UncBgkIjird6HmoVOYIe+vLQpaFoIY0A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QPCjrOfrHFcz3+dQDJc8dYBxXaM8THu72CB3MWgm1q2qdmRa3jzFcdyiYiJ/THNF38+ZhGHB0asMY9zLfDQ4mrWyJO8CCCzMqXTOfYaUmiRPZMLt9U0FxnWdH2oar0ni5EN/ZGnTXxqANCVCNU+c2AZZtHR2EiBf/xrI0Mz9i6y5vIvAchji8G6/CXPZuD/yAXffpXNKq8QRlkNkj4D5Mdo5gmZGQLTm06yrQsWeq36v5C+IJaWShZ4+58/1J3Zn4tmsvsL3/Gi8Ujodg+d5Kd6sd7ysIwnonsgq12ZY11L39VwRcbHOqBMYHwaUXAY9TNqUGVsz8Ag77O9QE1XOmIn74+/4EVc9+Xntd5gNBFC5vPI+s52jkUFDId49WLdx9iqX2XZ1zl1A2dMj9qZ/D2H5tSrJo15esqkPyzdIbiJTIHJ7wTIz0P5TPfv9RHZE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:56:00.2670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 030b24cd-9b52-4120-8851-08de8bd6495b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9593
X-purgate-ID: tlsNG-c201ff/1774598166-80769488-C032C8C8/0/0
X-purgate-type: clean
X-purgate-size: 2523
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Penny.Zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:ray.huang@amd.com,m:Penny.Zheng@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:penny.zheng@amd.com,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[Penny.Zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 80123340A8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On ARM, the only callsite of mfn_to_gfn() is in memory_exchange(). Although
memory_exchange() is actually not reachable on ARM because steal_page() always
returns -EOPNOTSUPP. We still need to fix it here to ensure correctness once
steal_page() is implemented for ARM in the future, and avoid propagating
broken usage.

Fixing it with the following steps:
- Recording the GFN into the page's type_info via page_set_gfn() at stolen time
- Retrieving it via page_get_gfn() at consume time instead of mfn_to_gfn().

With the only call site removed in ARM, mfn_to_gfn() macro is no longer
referenced and could be removed in ARM.

Signed-off-by: Penny Zheng <penny.zheng@amd.com>
---
 xen/arch/arm/include/asm/mm.h |  1 -
 xen/common/memory.c           | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 8d61b74e4f..14cb3c3dfa 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -307,7 +307,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
 
 /* Xen always owns P2M on ARM */
 #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
-#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
 #define shared_info_to_gfn(d) \
     page_get_xenheap_gfn(virt_to_page((d)->shared_info))
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 918510f287..5c462c302d 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -814,6 +814,13 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
                     goto fail;
                 }
 
+#ifndef CONFIG_X86
+                /*
+                 * Record the GFN in the page's type_info,
+                 * so that we can retrieve it later when consuming the page.
+                 */
+                page_set_gfn(page, _gfn(gmfn + k));
+#endif
                 page_list_add(page, &in_chunk_list);
 #ifdef CONFIG_X86
                 put_gfn(d, gmfn + k);
@@ -849,7 +856,11 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
             gfn_t gfn;
 
             mfn = page_to_mfn(page);
+#ifdef CONFIG_X86
             gfn = mfn_to_gfn(d, mfn);
+#else
+            gfn = page_get_gfn(page);
+#endif
             /* Pages were unshared above */
             BUG_ON(SHARED_M2P(gfn_x(gfn)));
             if ( guest_physmap_remove_page(d, gfn, mfn, 0) )
-- 
2.43.0


