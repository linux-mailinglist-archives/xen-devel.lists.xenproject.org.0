Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIkvCEaUhGk43gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:59:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2FF2E7D
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221912.1530027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnywZ-0001lt-C6; Thu, 05 Feb 2026 12:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221912.1530027; Thu, 05 Feb 2026 12:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnywZ-0001j4-8I; Thu, 05 Feb 2026 12:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1221912;
 Thu, 05 Feb 2026 12:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpzf=AJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vnywX-0001iy-2O
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 12:58:45 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63440aa7-0292-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 13:58:38 +0100 (CET)
Received: from BY5PR17CA0057.namprd17.prod.outlook.com (2603:10b6:a03:167::34)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 12:58:33 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::e) by BY5PR17CA0057.outlook.office365.com
 (2603:10b6:a03:167::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 12:58:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 12:58:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 06:58:31 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Thu, 5 Feb 2026 04:58:30 -0800
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
X-Inumbo-ID: 63440aa7-0292-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILIklL1+02hRLseKuFTdjs+W1m9hAkec5XtcH8WjehH3p3kEspdWnFS4iLdhqc2ASaLuss+FhMQ09C1h6KYtEPisiiMsjMozZsWFMG/sRNDFblCskUEzLphX/TnbdvfnloFzFEfUXUM/qVrzkctXru6sw/H17lheWDLfoyUB9tKeQs9L2ErFSIKkChNA2DGI7Bq8/XsphnyPgL3Z5l7C/qJ5zzp040TMyh/GW7ccJo71sEJ4r5u0lUNndvNfpNv+3AOMeOVumED5MrUAK//WHytRUAq1Y9WudN4/fmjXYMPEUXWfqh7cRD/bZChfzMXD1hRuJXQR9GD1meHn8Wkr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9c1MjqVRjC0TadqvV4eh4kKo/EmKHGJVFivLDSc5iE=;
 b=t3B+n3C8kD6qexE971Fx3lNxp6U2VD/tRPCSN5usozl+ENeLT5Fnbjwp0d+oGBKsq7KJ8fZsmDDYj6O0SgYvvw/BsIyHVFPOz7D33BWmvrDQINVjzgTsyarEclORgn5bb9JbrYCJmatzOSAdErD/eG2USQb0sPbKvF5jQxZL3iFCCPWmRn0P7felGgSe6xY46ZCAeRBEWIoc4yuqZ6D47QimYKmikDaRDnj449XNvom28WjubjQa4H+63LGQLZKj+CtZjekiJH7r3s3GbkeLot/CvgCf5nGYJBvzyGw9MV5/ge8rUoBeEhB1MeJr2fKDYm4MtrnkU2I63irrVqr+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9c1MjqVRjC0TadqvV4eh4kKo/EmKHGJVFivLDSc5iE=;
 b=xmUyyjJ8gw3T0MAw1hSs7xAsAE6J9Mgv5GgCXfvXMERM6P6My/uYr1ozdRm0Nwcy160Um0MFJUazohNwID3cvInvBAb1cc8uMSO7BixiXSiKDDUzbWpe+htBITNvXiKZtVNVJylCYOpf3DyH8ix+xDGLGN+j8bJhqt/aMwEbxbw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
Subject: [PATCH] xen/arm: Fix memory leak in xenmem_add_to_physmap_one
Date: Thu, 5 Feb 2026 13:58:20 +0100
Message-ID: <20260205125820.116555-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b289b1-dcbf-418f-00df-08de64b64404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DokbqQoTwvrQ3P8CTngIuV9bA9r9AESoJkinUFBNM1HjCsu3NYZTvaO+p3n3?=
 =?us-ascii?Q?A5o8yBtN3ANupx8IB+/MoP6ZbMEP8wPBAMJoW4oze1NN+WQFMnTu4ecn/kI9?=
 =?us-ascii?Q?C9hJzIZ4UfoHN2tAvizSPPz+JoqTBiBXKLp5iy6UDlPf6hsDj+OVWEWNZPIF?=
 =?us-ascii?Q?R8RbLx4BljKuAGdJnHKTYRWSLTPNfS3Ul6vS0k67nu2rEaoweF4LUjlPsZVJ?=
 =?us-ascii?Q?s3lzp+C/8CqELTFCLpnuaSR2OZMIc07EwoW9D8ZrXXGU+bsLNaGw4d96jjkz?=
 =?us-ascii?Q?22UYHAj/VU+CvSqb9PCQYhvIifw9G7Z4AFJWrCBfeQtaBUSByP8vslt8mN7s?=
 =?us-ascii?Q?nfYACtG4P6uAebUb/PrUALd8V93A0GQWBIiY3Pq8TWnF80OtzZ1CKOfUJ1qt?=
 =?us-ascii?Q?HbNXX9LJmoq2pYt0k3Zayb/ITDOEd4OgHBzS6gexdjUvqJvGXJF/B2IFxTrX?=
 =?us-ascii?Q?06Jm0bOMrpQLrSGRCGkFJRAeAbyZqAyaDyzj3LujyVmQN4bbDgKMkWUJwkR7?=
 =?us-ascii?Q?vbtARMXvEX6/T4e/csU5IgQpNLoQ8TPYLF1RqOZXh9ouEZtIL0WQn3Rnivge?=
 =?us-ascii?Q?BA7bNEUivRYEhAouaLfO1mX9+twaj8wDrhgCcuiEXA0wZGINAEaNP6kVwMoj?=
 =?us-ascii?Q?9d5kIio1zb489+tez9fZa4IJuEKAvPsyAIpolW1rTuWp3/2wSzD6VMm7djUV?=
 =?us-ascii?Q?cveRz5c7WovKGl47dDpVn2pB0mbyRQniajrHaQBWkwOQVbitUcNVM8ECBsbC?=
 =?us-ascii?Q?DR36wqsrbHgxdpG7RoiLeSG76rA8lAe+b3/nmXtTXu3zpyHAlVQdfFX5Llj/?=
 =?us-ascii?Q?EcZg5NoXDXsSRVH3e5Fn8PtSdX7t4Ypdg2KRhy5+0nUJvKUtBqgFYGaRyFm9?=
 =?us-ascii?Q?zhwUtyzrXbU2zr+PKNRIer1sbnggpSynDUEH9VE5TDFqQGkEdxmM5DN1S6Om?=
 =?us-ascii?Q?K8mpM0hQXjubou9P6cgLZJNUY8SoiTpHhCVXKdqSULOi3AJvkHVk3aIavOvm?=
 =?us-ascii?Q?D5lD2Q4W7/qJxXJNtEk/SzP/QZgab1R9xXMHBVxaa4a/mXP8FoP6D3LaoI6+?=
 =?us-ascii?Q?q/Jj6So5IJSCUQ4hrPnBrEfHutm9Nj+qxzdnwVRLdP0Fe7DQTYu3lGcsNNhg?=
 =?us-ascii?Q?8v5WQIHH+0zMhIArJtNFJNv7ANacmGpP2QLjx/jU/v4lPUiaxPO6l72rkWxU?=
 =?us-ascii?Q?xF9r/bwtb0cR8k6UGqk015DeA5JscLOjRRD0rZoriucVrsPA+SxsrVGOKngW?=
 =?us-ascii?Q?UWbNIkAaiaFUGJn9GaA0OhIR0lUq9d0ASdZDFN9QXQ2xsrOLJIN2j21HBQgm?=
 =?us-ascii?Q?7E2G8h5Ucbw7HuYOcCaydSMw2hsgXlE13blbtzAD0Rtgk6QoIa8z453rBIm4?=
 =?us-ascii?Q?N90wc0cXK65Q9FdOM2zJ7Cgi9JPuyrlloxRkpddUK1WCY7Ry/ZWl3LmoSyzL?=
 =?us-ascii?Q?o5dugULEC49WpwUGL4VOhOcAKYTB5rbhpRudnlb0AMQP2OCDjhNZpFjPxGk/?=
 =?us-ascii?Q?CikUn7Ox//VlVlpDpDhErp71J8C2Bck96ynl6VQ7Xb1IqVJNMBZf7yNCRFri?=
 =?us-ascii?Q?+QDqWwmC0g6qtMLzzcqaeI+MJXVI4p1VDEL4n5jV2kLF48eeqFOxrjbwt97K?=
 =?us-ascii?Q?l+r6dXs3khMw+qHYLKS13QGtUhHMPpwl2aKyO4VwAtsd9xXU4S8x8YESy/4n?=
 =?us-ascii?Q?2bqd1g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LLty5+AtH2LuGknat5qkct+91RbMYrYyr7FMsYMGeVo8fNPH5n3sou3DE4dNllNk5Us4rgGxsxGRay2nWF7ZXC3wnq4C7cfPhNyi0HqiCf+gOOR7JQ5K6W5sz8A0gI1twfWFEQOCrpLW9ZkRmrNcoj5rr4930voVxY52enfwcXscHTU3uDCBsQ2Bh71Dg8c8a7g2UusLlwQf940o5IDeWuJk6W0iD/Biunupg45vjmfMw2D9PZMEKMwIjm2KsuuNonU7QOHsQYqY5dhRZ4pCSvngnYxriCqPaA/0zBv/GVoTEPAlo4dwa1fzQSo/V3aGdolgU5I1fpEZVnG6XcXVtahcGCewjPNwjL0/DLhcVrvNPd5wVkOOp2t2hzqIaapFBMwSt2w+woqcAy8eIhlHHLKWPKm0r9QyI0xW019+Hcc0nmBGEr2gkJ2sUU7zBpfH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 12:58:31.9773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b289b1-dcbf-418f-00df-08de64b64404
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Xenia.Ragiadakou@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 78C2FF2E7D
X-Rspamd-Action: no action

When a guest maps pages via XENMEM_add_to_physmap to a GFN that already
has an existing mapping, the old page at that GFN was not being removed,
causing a memory leak. This affects all mapping spaces including
XENMAPSPACE_shared_info, XENMAPSPACE_grant_table, and
XENMAPSPACE_gmfn_foreign. The memory would be reclaimed on domain
destruction.

Add logic to remove the previously mapped page before creating the new
mapping, matching the x86 implementation approach.

Additionally, skip removal if the same MFN is being remapped.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
I'm not sure where to point the Fixes tag to.
---
 xen/arch/arm/mm.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6df8b616e464..b9f1a493dcd7 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -166,10 +166,11 @@ int xenmem_add_to_physmap_one(
     unsigned long idx,
     gfn_t gfn)
 {
-    mfn_t mfn = INVALID_MFN;
+    mfn_t mfn = INVALID_MFN, mfn_old;
     int rc;
     p2m_type_t t;
     struct page_info *page = NULL;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     switch ( space )
     {
@@ -244,6 +245,33 @@ int xenmem_add_to_physmap_one(
         return -ENOSYS;
     }
 
+    /*
+     * Remove previously mapped page if it was present, to avoid leaking
+     * memory.
+     */
+    mfn_old = gfn_to_mfn(d, gfn);
+
+    if ( mfn_valid(mfn_old) )
+    {
+        if ( is_special_page(mfn_to_page(mfn_old)) )
+        {
+            /* Just unmap, don't free */
+            p2m_write_lock(p2m);
+            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
+                               p2m_invalid, p2m->default_access);
+            p2m_write_unlock(p2m);
+            if ( rc )
+                return rc;
+        }
+        else if ( !mfn_eq(mfn, mfn_old) )
+        {
+            /* Normal domain memory is freed, to avoid leaking memory */
+            rc = guest_remove_page(d, gfn_x(gfn));
+            if ( rc )
+                return rc;
+        }
+    }
+
     /*
      * Map at new location. Here we need to map xenheap RAM page differently
      * because we need to store the valid GFN and make sure that nothing was
@@ -255,8 +283,6 @@ int xenmem_add_to_physmap_one(
         rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
     else
     {
-        struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
         p2m_write_lock(p2m);
         if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
         {
-- 
2.43.0


