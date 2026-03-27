Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKUfACg4xmm7HgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C076340A8E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 08:56:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265114.1556203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6233-0001gB-5n; Fri, 27 Mar 2026 07:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265114.1556203; Fri, 27 Mar 2026 07:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w6233-0001du-1F; Fri, 27 Mar 2026 07:56:05 +0000
Received: by outflank-mailman (input) for mailman id 1265114;
 Fri, 27 Mar 2026 07:56:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1w6231-0001Pc-7t
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 07:56:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w6230-005b5O-Jw
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:56:02 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69c63812-2eae-0a2a0a5409dd-0a2a4501a130-0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:56:02 +0100
Received: from [40.107.208.21]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <penny.zheng@amd.com>)
 id 69c63810-6400-0a2a45010019-286bd015fa4b-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 08:56:02 +0100
Received: from DS7PR03CA0185.namprd03.prod.outlook.com (2603:10b6:5:3b6::10)
 by SAWPR12MB999140.namprd12.prod.outlook.com (2603:10b6:806:4e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 07:55:57 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::a3) by DS7PR03CA0185.outlook.office365.com
 (2603:10b6:5:3b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 07:55:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 07:55:57 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 27 Mar 2026 02:55:53 -0500
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
 b=zC7SEEq8vWMuIDXfUO6udV4HiArIfhki+36Log5uAKhImzKgYV90Ok3uj3zI4IUcPCAY56/taL4+zFkCLjRD2NYaqa3QM4jYmkIDvIhs8htOYZgUCAMn/qqNBHjqsK9GKqn1eSb+n7bYAVTeKzpyaE/NfIeHA6+L9h/8FiYKxouV17UXLhtzhVQKTceY7b60rMBs8mn8Jyt+eL0XTgui7pFVjV/xjT2O/fT0c3LZUJaCrD4kTXrlPz2ADW6qVmNwFv1kNezLu7UCDtjRwEK5lZwif7K8WUwmQ7x7TI3L3V9etKPTcMSEaL185K81M9SlqmxYykLm6SlmbmmtjeL7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNsX0tz7KlxvUQL2XaR7OMvrzRJaltI17tS9Ud2WDAA=;
 b=XnZ/PWz+cBLW9r1WryD3oMmzYX2IEDIKBHx+bEO+Ys5VyhWOHPjVrm64ZDf7/3lA5iTJnnUQaOyi7+Is5lsyc6na6fCHVB97A5XClKHzjjwk22oGGJHnRfVi9snrePBBQLEktfBPRjmGaI3PdpiHikTclwr5ChRHdQy7qfpwPQ6lOsDNIMdTq7vjbv/vfLDU4lf9e4uOLijV8bTBcsUzjCDd13ZolDxjIDMnHr9iptjzxFzjDWf+rLKWUZav2vdYLvaqsUe0cNxkbB6ygiHxeRsO4ORJ9DsorlxaHVxiesKx/x7Nmfasu/lgPxsJR5sFsgenKDnZx+d+NJiO08UlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNsX0tz7KlxvUQL2XaR7OMvrzRJaltI17tS9Ud2WDAA=;
 b=B2b50Wg0e0a9j9P2GwUQN1CRcuFyVI2X776RCK6okwsE390SiypyNBuhE/gV2aS8Ydt0p+JTLhJv2d/bmyZSPbg5+4FwUsygCF4ckDJU6gVsOCzcukDSs3qcEI05Bz+khLaQji8iTHhPOPtzUsawj0LVv/ifRZOPpcW9/OYy9k0=
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
Subject: [PATCH v1 2/3] xen: introduce shared_info_to_gfn()
Date: Fri, 27 Mar 2026 15:50:24 +0800
Message-ID: <20260327075025.3008606-3-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|SAWPR12MB999140:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6f8299-73fd-4ca5-5474-08de8bd64775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xYmsDNwZFSenjicddY0Wln64GqMWPMXmkMfFANZkyp3fVTpRyUvjrIiyNTJM8ByjDWFgocA0DzL+cRkP/CPdGd1YD92a3Mer7fVjJvEtE7QE9pwmaZQFOOF664rWrJEKbqQFfLARZKqc9xCfmSxO20IdAWwxhWhcqOdYdB5c16s5/6EqgRa5gwMx3sq+P7gqWc33KGWth0q6646wJEfNmLgqSN2043dSffRlrldfb5OBo0I5pwkbtA0Epp44b6ZLhFPi8w76yGEsaMCjs05xQLLviRvQd/82B8uW91sdKStu+40KePn0jRoXAmRdYFRrufuOwDwzmyvDIsdVaopzwjE6nCs+G3vp5xgldiLwVRIBAbUVfyWkrJMWizMzZhyQkqGQe6bfUuT2DmhbWp8rNw08hY98mIKT4gprusky+spsy39Qs/mW9OMXYhxb6mmqiY2pTFmrU7CNv3wdmDO8ahipkL3a8nmzNGsE4YNgBHZo/9LWvGa4K+nFraE58I+FLemg/bdINX/oK2Ro4d3gJEB0ZwQhrJ7/2Ipvb1qIvChmA1vBYdzjaBZy9VtqNCMn1bASGf0uc1ULDLTJ4CiN49Bi4RRtPBBd7lvUs1q1Gj/XXyrGI1k1s3Kmf+Jx2UjgYFIJEYJe6MkzCnA4gJaXm2PsNXhBhyDZOA0q7y0LZFfddYWmiOTCcCiRik/PTZAArnj4MrbfTtC10e09L8whVaWH9wFVScnN77yvOSGHUd6xq++SnxOqZ/yrJukphmOJ8ancOakr8T49WXzYHFB9wQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A8VTo/pORTP+2pYrrybf9YerEAoonv7n36O3olGpMIFEwgB8794FhGQbqqe+YhATuqTUYSSIZxkXXe93IBxocspCL4FskCDEdlmGoFYlDx7l1zA+NrMr5n81ncvodb7b6CIxPFQV35atiuKOnaXaZ/2ivybZzUFbz/8FK1zGw3DTXPJtxARL2EON2qxuLkD3Sa1lctIZKIuX+l95rOIvK+cwi2o0Epnu4A4TtM6Gs8TpfATl04mFyXVkNgY8U7ovXobI/TcSucvgvq++M+MFtl5aWumaoU3GDqTszrhQeCWhFaGn892vYu1CxbqHRWjNK8GRX7jzue/wOqe/Nb4p83cf3wAWgMM0K573ubPCjjM9/OaY0rDh/pxExhuOf7yUMy1KHeOfViEIK982IcdXY6ieB4MiYkjZTW9fH3Xj7M+j2Rhm04RP/tSQjww/GCg7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 07:55:57.0627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6f8299-73fd-4ca5-5474-08de8bd64775
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999140
X-purgate-ID: tlsNG-d62444/1774598162-48A14DF3-E19205C8/0/0
X-purgate-type: clean
X-purgate-size: 2550
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
X-Rspamd-Queue-Id: 8C076340A8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On ARM, mfn_to_gfn() is a simple identity macro that actually does not return
the correct GFN for domains other than direct-map ones, so getdomaininfo() is
returning the wrong shared_info_frame on ARM.

Introduce a common shared_info_to_gfn(d) macro to output correct GFN for both
ARM and x86 in getdomaininfo():
- ARM: uses page_get_xenheap_gfn() to read the stored GFN
- x86: simply wraps the existing mfn_to_gfn() solution which consults the M2P
       table

Suggested-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Signed-off-by: Penny Zheng <penny.zheng@amd.com>
---
 xen/arch/arm/include/asm/mm.h  | 2 ++
 xen/arch/x86/include/asm/p2m.h | 3 +++
 xen/common/domctl.c            | 3 +--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index d1873ec212..8d61b74e4f 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -308,6 +308,8 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
 /* Xen always owns P2M on ARM */
 #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
 #define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
+#define shared_info_to_gfn(d) \
+    page_get_xenheap_gfn(virt_to_page((d)->shared_info))
 
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 3a5a5fd43c..725403b28f 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -582,6 +582,9 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
         return _gfn(mfn_x(mfn));
 }
 
+#define shared_info_to_gfn(d) \
+    mfn_to_gfn((d), _mfn(virt_to_mfn((d)->shared_info)))
+
 #ifdef CONFIG_ALTP2M
 #define AP2MGET_prepopulate true
 #define AP2MGET_query false
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c5..284926aa61 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -104,8 +104,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 #ifdef CONFIG_MEM_PAGING
     info->paged_pages       = atomic_read(&d->paged_pages);
 #endif
-    info->shared_info_frame =
-        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
+    info->shared_info_frame = gfn_x(shared_info_to_gfn(d));
     BUG_ON(SHARED_M2P(info->shared_info_frame));
 
     info->cpupool = cpupool_get_id(d);
-- 
2.43.0


