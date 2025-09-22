Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49957B929CF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 20:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127957.1468476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0lOK-0003iE-VS; Mon, 22 Sep 2025 18:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127957.1468476; Mon, 22 Sep 2025 18:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0lOK-0003fV-S6; Mon, 22 Sep 2025 18:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1127957;
 Mon, 22 Sep 2025 18:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpIQ=4B=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1v0lOI-0003fN-Hs
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 18:35:58 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7d9f1b7-97e2-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 20:35:53 +0200 (CEST)
Received: from SJ0PR03CA0332.namprd03.prod.outlook.com (2603:10b6:a03:39c::7)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Mon, 22 Sep
 2025 18:35:45 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::f2) by SJ0PR03CA0332.outlook.office365.com
 (2603:10b6:a03:39c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 18:35:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 18:35:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 22 Sep
 2025 11:35:44 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 22 Sep 2025 11:35:43 -0700
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
X-Inumbo-ID: f7d9f1b7-97e2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFrB9QlXFqY4ERlbWhkbPuT/+hHEjdw9VWKlVtz33rk80GYQtqrN6/1mX4NsqM76yKyXcyeKd2HyD7gpEY0JqL+P6qyUblRTNG5j7/bcCJXzW5XOY+5HqX6xiPaihwB3bgMB8dMaQDbEiH/Wvxs1C53IA4LhSuEoAt0aU6uhx6jiPBHshRu5gchyIFIucEikYcQMhZQRe8PUkcvE1nvqJeYiTDKe8aowX9eu9H97O2Ek6+jmgsS7F22En7jMFn1U15JwpIiJgq7th08GOd41MLT7B5GhusMLAwdzbLIpOOg3XMn5CLwHsgPxpW7lXA6/02GloVQqFctfitWdQdffnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooOvjJ9DHe6Z8LVn14Sd59ANehwdCzGl1qi4gBik598=;
 b=Q9BNG6d0zOAiOy5Unuh10w+JBvggjNDWZrBU37ktTxmD0ilT1VKFoRgcsQyyl/aH37VkwC5gICrWGcA1SRh4xIasp61mp38X+FdPLJlIw4Q/hKnqdqkH1ctx25UNjVCuJx71LOrHovjgzDDIOJamGbTKsSEeyZSAvzOBxLJljYL3qS/uoptgx3cKtkQKGUh7a+PA7V/D7ERRvHGTHfUvY84iQJQ3YsLw8yghoC2UNxBaznLGmgAKjtZwb2b6QFzN2xnLQpdacjrLZEVOy9fM4sKpPhFSFN0gvzBjnM5VMCNjf8M/mdS7ISyaUewshKEuQ6JdUksKPz0sgJbzc/9hFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooOvjJ9DHe6Z8LVn14Sd59ANehwdCzGl1qi4gBik598=;
 b=ko0kg3iJPq3YBYKmpCPjWMbEpDWnKiQ+pWTfK/9ZnXsXSrpgazUdztNs0USiQxTVMGOCRVEJLsSXZwT6ZP/fNiFwWwoIacpiR3+yn91uF80YHjXPVzRjxC1vFJFo+FCBCTJJrn9SHW8xCZf+5P4iNTDk3nMXlf6nbHOHZgxiJ0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: add myself as vPCI reviewer
Date: Mon, 22 Sep 2025 14:35:35 -0400
Message-ID: <20250922183537.8861-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: a07e7674-21cd-4500-28a1-08ddfa06d78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qi9LWVNNTEp6SFdIUjJhNHlieTNrczE2VUxwelZFMGVqaDRxa2VyQ1Z4Y1dt?=
 =?utf-8?B?aDl5SHRqTmFsWTZkd1orOTUzSjZuZ1RZTzhYblB3QXpqdnpaUVAyanpQKzla?=
 =?utf-8?B?UUVCbjJEZzBucHdjZW9WUis2eGdVcS9sR1JnNE1Qem12NXE1UmVISSs4YXp2?=
 =?utf-8?B?VlpwMXpyeE9Ua2E4VmpLZEFyWnRZS1JlQzU2ZUFmT21ibUVtUEZNeUZ5MmNI?=
 =?utf-8?B?RTdsMHhmOEVuK0tYUWlzQW41VUNaZ2lSSExIOVR0eUMrbE8wa0NZTFY3YTBs?=
 =?utf-8?B?WGhwRTFjNkJvWFUyZnVvNjl3VkZWMFJBM1YrMHdSVlRWalBpSjdSc2xhVVNC?=
 =?utf-8?B?cjVVOE81WGxFWnVqYVNDd2U2Sk9hazF2b2VvR2M4V29GNWlvTVNsRUYvSzFl?=
 =?utf-8?B?blZqZjRpdHd5NFppKzFJN2NOeTE5NExNenFiT2h5aVE4UVdTS3J3YW83emw1?=
 =?utf-8?B?RWVKYVFZS2lXRzB6Zm14TkpEL2ZodUpyNnYxbHRFeE80dmV2SHdwbVZQQU40?=
 =?utf-8?B?MGliNDRLa3dHdEJCTEhzdmFVcWh2ampyOU5QcFhndytiQk5CakNseGdYRGZL?=
 =?utf-8?B?SDdXUTNMbmdNNjNVVDMxZ2tXbzc4dExPZnZLQXVObzQvdHFVbXBQTEI4ZlFY?=
 =?utf-8?B?SkVmZ0tWaitiZWZIZmwzSVh2WG55cGliWmRWc1lmN1BoNHd1NXVjSi91VGdT?=
 =?utf-8?B?Y3dzb2ZBb1ZEbzlWK3RNMnM2TlVoalhybnlSY3JDNm4rd1A2aU5sYkUvK3dt?=
 =?utf-8?B?Z1ExbTM0RVpJTGk5TFBya1FtdDZZaFhvdG1hYTdGM0lRQmJsQ3FMSC9zMXlt?=
 =?utf-8?B?TmJiWFZZV0VRaThGU3poS1NvOGxqZHJISnllZEhEaFNRUzNYZWRiM2hqUGU3?=
 =?utf-8?B?Q0hIWmx2M0diUFd4VUY5czBYWS9IR1V1b1Z4OVNFWTdSTmhKWE14c2FUZ1pD?=
 =?utf-8?B?OVpjWE9OVjZiZElRZkRkWlBvbmtWVERYWjhVQ2ZST0c5TkpERXMxczhPdCs5?=
 =?utf-8?B?aDFmbDRuOE5sbHJPNzg2eDJvY3IzOWt1SzBwa2JkY0FDQ1VZTnB0Q29yck9H?=
 =?utf-8?B?NHo2WlpZT0JIeEd2VmJpZTBWdEI2RDZXTVRsZGRZZ3krQUZSTDhRR3BoVVpv?=
 =?utf-8?B?YjRsWkhQVXlYcDMwcW81YlpFOWJQTTFZSkgxeUlTZ1NSdXc4OGp2QVJ0NFp6?=
 =?utf-8?B?Q0cvZWhROFJ3RjcxMnRQaGlQYnVtOXI3SXlieVdsajdxR0RaNXIwNUhpV25B?=
 =?utf-8?B?TFVSMnNFZUowM3UzNHhLV2pkMUVwRkdxVUwrY1JWSStwYkJQN2Z1R2toZzd4?=
 =?utf-8?B?UEZPbmVKRlpQYThWR1l4RjYvY2UyeFc5d3BCQ3E2QWZDb0NHbXl2YjlSb2pV?=
 =?utf-8?B?TEZvajFTSmRYZ1p6eWxYREROeHJrMTU2Tnp6UGJHcEJ5KytJYWR4QnFPd0Ns?=
 =?utf-8?B?Sm9DN0phMS85NExpSUEyekljM1MxS2JjYUJIUkJxOWNqYnU3b2I3VGthWnZj?=
 =?utf-8?B?bFFlYnpFT1RLYXVjVDQxUjJIdTJrYnA5VHlaL1pXaUtaK1k4RXR2Zkl4U1hI?=
 =?utf-8?B?TnNHUmdxY21FYzZzVmQxQnhWaTlFcDRQcEV2UWZ3cmdVZitCVGZpcDRiY3E3?=
 =?utf-8?B?ajRZZS95OU40ZnVBclVpSXFuUkVLQnk5YlphbklTUkxTUnFNM1lRTGxwMFJl?=
 =?utf-8?B?akFSb1U5RDBhYVdBcjk0MndUcllybVJ4UTdIdzF6LzBvcER4WFRNczFwemdw?=
 =?utf-8?B?cnBUcTlFdExrUEhPR21weitzSDAzNVF0QWlPRUNiSExWRTlER3JPYno2N1pO?=
 =?utf-8?B?YUR1N3A1RlI5dEcxUEJmaTIydDZnRmJQSWtHZ2N1YXg0SmpnNUtDSVBtT0NK?=
 =?utf-8?B?S3NrcmtqWEQyYUMwMmRaalhyQk1BNDUvcnFYRFQwaXA3WW1tRklIa016VE04?=
 =?utf-8?B?cnJkMXo3TlVvNDI2a3h1T0dTZVdoaVZtWUR1MHdSWFQrMW5SY0Fza25VVzVu?=
 =?utf-8?B?R0g5aDVWcU0wY05zVTFmeUJULytmcXdJSFQ2RTkyNGw0V0hOK0R3UnB5eUhl?=
 =?utf-8?Q?J80Fq1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 18:35:44.8168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a07e7674-21cd-4500-28a1-08ddfa06d78c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005

I'd like to take a more active role in reviewing vPCI bits.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 31dbba54bb6f..793561f63f83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -578,6 +578,7 @@ F:	xen/include/*/vm_event.h
 
 VPCI
 M:	Roger Pau Monné <roger.pau@citrix.com>
+R:	Stewart Hildebrand <stewart.hildebrand@amd.com>
 S:	Supported
 F:	tools/tests/vpci/
 F:	xen/drivers/vpci/

base-commit: 656b9ca03bd340715aecf405da63c515afb344a1
-- 
2.51.0


