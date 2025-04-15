Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B8A8A4B0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 18:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954253.1348564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYL-0007KS-Hy; Tue, 15 Apr 2025 16:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954253.1348564; Tue, 15 Apr 2025 16:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYL-0007Hs-EC; Tue, 15 Apr 2025 16:54:29 +0000
Received: by outflank-mailman (input) for mailman id 954253;
 Tue, 15 Apr 2025 16:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4sU=XB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u4jYJ-0007HS-Ou
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 16:54:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4950cc7e-1a1a-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 18:54:26 +0200 (CEST)
Received: from SA9PR13CA0139.namprd13.prod.outlook.com (2603:10b6:806:27::24)
 by IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Tue, 15 Apr
 2025 16:54:21 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::8d) by SA9PR13CA0139.outlook.office365.com
 (2603:10b6:806:27::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.8 via Frontend Transport; Tue,
 15 Apr 2025 16:54:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 16:54:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 11:54:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 11:54:18 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Apr 2025 11:54:17 -0500
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
X-Inumbo-ID: 4950cc7e-1a1a-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syZ23NTL6y4I0x9XqAvnJPcm5dkHWvlTlK/Rx5vAyKAZ7VpCbj7QCsRDfTXkkNTGpqjd5JNzHCh37FUuIu5hNlIFrcNUTv5xebLh5DSFm6tmv4ksxrSjU2vp0/1IY9RH/eBuoicqzd2IP0OT31uWQfCLKTQ86u6AXDkKIpyOAKIHYwP9IKABxX4wPWht3fxpJtW37hgpvyQqruTn5hL/EpkAU3pVzy4adpsCeju2tdD5vKHPcTYerCUf8F81rQ1SrwJ0Cf+r+ebSNytySxbZ9wgCyUZ6xrWaoGl5SCWKze5Hhc7NWQYf6gXT0emChb+6bSbNQAIViswW9a/ssI2fVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Jg9hhUpjJaodqTmnAIJsJFxnkbZD6cQdRZdDLYzRtU=;
 b=j08cXc9rvwuNSputnqOkytMhO4aPXBJWTRNqTix5Cbv/yAsWd4nmpRlGZrlWsskg7RCPgL2jFB9mpES20tUNXJzwVxgLVUnkt5lkLLZJLu/YvI499V2szO0DNIViAMkNprqy9TI9kM2Be4ff6zll2if81+XAwyecpNWDNaXyY5B7SzLioNBM7jM7oNeQKGqmKtEshoqQmNLryyB1Jz2fd9WaJtTNq0X/GxrL2ZFjADc6nV92je1PKyyNv77mmLT/e6Kc6qK+jhlUL/aUwGm7VG7xJJsS9+AFlJl0Ht1UJ+r37RYA81hiC8OY/ffCWx4cn9OYMEpY1p+Rbh4XOEhN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Jg9hhUpjJaodqTmnAIJsJFxnkbZD6cQdRZdDLYzRtU=;
 b=Zb3d9K2z62qkoG7HSQgsI9+nBuuiO/raqPeUM7Aw0XeFQ4VU2/oa4JvnWcqlUsbQug+iwi8FXRFlzyHY+Stxr1ibHJsA+sWOoOTk9GXOqLPSs0SLYUDy83aWxtNDxqupIrd9ya/StOi5nw8iA/ahfnk7f1twE5outRt/OLnwXT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v19 1/3] xen/arm: check read handler behavior
Date: Tue, 15 Apr 2025 12:54:00 -0400
Message-ID: <20250415165404.435506-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415165404.435506-1-stewart.hildebrand@amd.com>
References: <20250415165404.435506-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|IA0PR12MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1008eb-28c8-4565-fd28-08dd7c3e2a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGk4dm16bFJpcUhqWGdldEJ5Z3RjckZQNzVsdUFTTzdSa29QYVNjbGRqYUFW?=
 =?utf-8?B?RDdERURBVklXRERKdzhrR2UrdTlYYUh2SktxSkJ6MXJ3bE9KSWpValRiY3lp?=
 =?utf-8?B?a3hpVTI3RzNXYlFLdjBkOU8zVmlLVEdINENiSUpQekxmb25uRVE0SGt1R2ha?=
 =?utf-8?B?b3NrQS84Z3BuNkJGZzZxQ1JJclI2TStxZG44L2V1dEJPd0tCWjZsa3RDRU9k?=
 =?utf-8?B?RUVuNS9JNHZxdEtYcUgxNjY3RVU5YzY2ajNnR3RsRlRQMU9wblFTa2FZeTRO?=
 =?utf-8?B?V0NZOXZNN2pOa3d0TGIrelIxaGpKUDBWZng3L3U3VzBzQ1R4c0w1Q1hNMjMv?=
 =?utf-8?B?N3M5bVdic1VoVXg1ZFFuUFB4eE9ZV1M4RjgvVGwvUUFkNW5zYW80VGpid0lI?=
 =?utf-8?B?YjdFVEg0eHhWbTIvMXJBUHBvOWJpd1VUem9kWU1BU0duQmZNdnBMSUpvTnRv?=
 =?utf-8?B?VDZPdXllQVRwczlHTG1VWDFyNTIzZGxSMTh4UGZRdGF2bjN5MmRlMU1JWGlD?=
 =?utf-8?B?YTVWZ1dBeC9Pdnpha0VhNjV2NjVLR0FJMGdQdzlsTmJpVDJYeEsyOXVtby85?=
 =?utf-8?B?b3FQOHpTdXVUQzhwUWo0a1ozN2RDVEpCMzBzeWt3RUNRN3ByMmp5Rll4R1BS?=
 =?utf-8?B?QkJ5WU92VXF6SHRFRnArMUx4Ly9SZWtNZUk0T29WUUpsQ082a0JtUmg3ZzBn?=
 =?utf-8?B?d2gzYWR5Q0loSDJtdUlqQ00xRHgwQjZkSEI2bkd1dmdvaVdCTzNvM0VQajhw?=
 =?utf-8?B?UmE1cHhFTGNIUzFITnpDbktDUWpUNDVvK0pvc2x4dTdWc1c3TGVSSTluTXQz?=
 =?utf-8?B?YWF5MGFSUTVSOEN2QXp1dk44enJqVmZwZnRxdWRVYlU5aFhPR0paODBiL1JU?=
 =?utf-8?B?K1BMR3VQOHFtL085VlpBS2pVZ3VzV3E2c2F2ZEppNEtuUkdRMzMwaGJKWXFG?=
 =?utf-8?B?QTkvbFBSTmJSemdyZjAyMm9aMzJsV1pManhGWk9VSW54S0pQVkxJbVdPdWI4?=
 =?utf-8?B?QmlYZnFvME94bVBqYUVLZEVSRUowS282SjdHYXBEYm9xVG1ybDZEalZ6MWFp?=
 =?utf-8?B?TTRhY2RGQVUvMTNDVW1qNVNza3NrbHZnRmtLR09Za2tXOFJ0TWNjOC90M3Jq?=
 =?utf-8?B?U0N4c1A1ajRGVS9ncnlaNzNzSXZxT2pmTTY0RUNQYkhPWm5NRjNKL3JHcmNG?=
 =?utf-8?B?Zk1XcTJlR2M5d1Z4RG11bncxYS9JUjBMenpzZUpqWXhmLzhtUVN6U0dkYjND?=
 =?utf-8?B?RE05VXB3NFlteXRNSnhOYzk0dFdCTVlNMjRGLzcwOWN1Q3BXMFkvclF3OS9m?=
 =?utf-8?B?UkFQSnlIaDNGVDJTZi91RTZBZCsvME5iYm9TVDdOSUlpSk92MnFuK0NHdHRN?=
 =?utf-8?B?Ky9EUGFIeTBzRnRDZlhlNU03TWpVd0VHK2Rna0oycERsamljR1V4bWtJSGRw?=
 =?utf-8?B?ODMrdU9kZDBZcnVDWFNBbzE5NG9PVExZeXVVaDRVNDVTd1ZwUUFQMVdNZjJE?=
 =?utf-8?B?L3lMMlBRa0JyQ0E0WG03UUZlK1hLZzZZUU9kcE9RelFLZ0xXVWt5M1NCSGVW?=
 =?utf-8?B?MkpnNk1CRjFocGlEc0syNXl6d3ZhVGpwQm15ZVNZWit5dVY4R0NpR3QrdGpK?=
 =?utf-8?B?bXRNOVFUWUhsSHpkZmhRbW1OcTBYYUZJTTFLZCtXK2ZKYmdJQWpOWGdiTGdy?=
 =?utf-8?B?S2xpSGVueGpUL21WWjVnYXBrM1doYTNJR0VFSFo4dXhwYk5LOVRCVHljV0Zs?=
 =?utf-8?B?bXI0ai9zT0FKRGJaRW5vVEJ1UGNTWVlCaVpEOXhZelZJbXVRQ3JEWGNyWkk5?=
 =?utf-8?B?RnQwZ2xIazUzSVlTaWRsdzhoYUFXdktmaFk2OEplUUl5R0hlZ0hrSXRkSkpY?=
 =?utf-8?B?SlJyNll5NjBLSHpzL0JNdk1neVVlMHZsR2JCN0t1Q2lYL1YwRVg0UURIa3g0?=
 =?utf-8?B?UDBvaSs1b000N09iK0JGUkhqWVZKcFlIaFVZZFZxMk52VG95WUdpSFdNSnIz?=
 =?utf-8?B?dVJyeWhzOGtqckd4c2hzWmVyNXc2aWZBYUg3ZVVXRnJ5YnQ5NmpOWHJlQWRp?=
 =?utf-8?B?Q3hDUlBXRmd0KzJmZWU3SmZIKys4d3hvMHRRdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:54:19.5227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1008eb-28c8-4565-fd28-08dd7c3e2a4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8208

We expect mmio read handlers to leave the bits above the access size
zeroed. Add an ASSERT to check this aspect of read handler behavior.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
There's no need to wait for the rest of the series to commit this patch.

v18->v19:
* add Julien's A-b
* s/GENMASK_ULL/GENMASK/

v17->v18:
* no change

v16->v17:
* new patch

See https://lore.kernel.org/xen-devel/bc6660ef-59f1-4514-9792-067d987e3fbc@xen.org/

Also see 7db7bd0f319f ("arm/vpci: honor access size when returning an error")

Also see xen/arch/arm/ioreq.c:handle_ioserv()
---
 xen/arch/arm/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 653428e16c1f..5a4b0e8f25c6 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -37,6 +37,8 @@ static enum io_state handle_read(const struct mmio_handler *handler,
     if ( !handler->ops->read(v, info, &r, handler->priv) )
         return IO_ABORT;
 
+    ASSERT((r & ~GENMASK((1U << info->dabt.size) * 8 - 1, 0)) == 0);
+
     r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
-- 
2.49.0


