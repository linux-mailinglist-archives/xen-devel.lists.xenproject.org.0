Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E3FAD096E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 23:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008885.1388054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNebB-0003a7-4J; Fri, 06 Jun 2025 21:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008885.1388054; Fri, 06 Jun 2025 21:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNebB-0003Ye-1R; Fri, 06 Jun 2025 21:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1008885;
 Fri, 06 Jun 2025 21:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyhR=YV=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uNeb9-0003YS-Ua
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 21:27:36 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20613.outbound.protection.outlook.com
 [2a01:111:f403:240a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e810917-431d-11f0-a303-13f23c93f187;
 Fri, 06 Jun 2025 23:27:34 +0200 (CEST)
Received: from MW4PR04CA0143.namprd04.prod.outlook.com (2603:10b6:303:84::28)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 21:27:25 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::26) by MW4PR04CA0143.outlook.office365.com
 (2603:10b6:303:84::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.33 via Frontend Transport; Fri,
 6 Jun 2025 21:27:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 21:27:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 16:27:22 -0500
Received: from xsjvictlira50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Jun 2025 16:27:22 -0500
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
X-Inumbo-ID: 0e810917-431d-11f0-a303-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBD30eMPy3TePdkw1d8L9N+fPYHq+lG9Uq4kPtKX7+Qf1xWKfzPPuaYsqQJAt1/KaVqHZZM33NE5M+0uEcIfBL3VQGnvlJ47cIFMNhUNzuNwiDWrcGiOvBbK4ABuOa0TeVyY2AUMK5J4Nxg3Ci5EQcLc9Q2jSw7ykf5z10mdPIOz6Q2e8evFB2RbWDPNpt+PIRTPAR6YpzHU88kJ/INmBiq92qmbAunNT1pSzMjJjunBvOVePoXzv3fVRaOm1KfCYBn+YNV8qTjQXX2lmMb3ZAmBqhajyKiI7r8M40ibovn6QUxJ1NCBsHdV4QPXC05WnxUkj8Dl9mBe43tgzqNa9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5YW/b3b+f5TMgHQiFZZLzwDRl6w9W7KsuqV06/eSyM=;
 b=NdLzZ9+lP1mNSZjJ8+jcwEAWsKVQijgrbHhff9bhXfEmzx9dGtr/yqXzxd3DvcT/bp3Sup1j29Kos8oOlh+2ulmMnZK+rBjBapTxwqI9V+0LpBstM2RkV7l1PKUjUAtpACvHqOngAChB5m8HMtucf5yAbyXvsJ3Re+jVRDRT/zb2auVNi5qg0nH8CdmBfidBW862N+IbR0KFexJdPvPhN2kRajYgBxXT4VugscokgKj1aqoKbg5WIL4M2L8j1cy6+baX8Ct3BLx9t69Hbebme3BaIUPWTPHht/XJTc9vllXb6Rrk3k81F29JYok3UN8iFiBKW7aGGzoxEt/Ef1qUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5YW/b3b+f5TMgHQiFZZLzwDRl6w9W7KsuqV06/eSyM=;
 b=0qLA/3c9avhq9NxIgo2krWk/94mjkoXFNKOZ9b7vxOkjJxi0rUQOX5N3kryuUkf4lrYvKuQnGF2SCCfVt5dMQWo4Efx+b3B11O7y9gyAjptUlKULesPPhIYk9FW3SUcwzpX7qR7Ro1dG5L2+MmWZgxUQxvycy5y5PoXMRtgm2rY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 1/3] xen/keyhandler: add missing noreturn attribute
Date: Fri, 6 Jun 2025 14:27:07 -0700
Message-ID: <20250606212712.1901838-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 246bdf8d-3111-4185-254f-08dda540ed62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGx1YStBSGZDQlQvaER5N1ZpTWM3TGlqWVE5UkU2VHdOMVlqM2kwaVhTbEJQ?=
 =?utf-8?B?Ly94c0FJN2QyS2JWQjcvZzdHNkt4ckFwb3V5bWFVT3ZqRExtczNjVlE3TnlZ?=
 =?utf-8?B?TFVERUoxUHFkZFo0V040akRTOFdmWTZoWGF4Q08rSTZPeTVNTDZwSmtQaXhm?=
 =?utf-8?B?V09ldEFVbGlZK2E0V2o1WW9uRW4xNDhxQXhOSzd6dWo3dDFtbmtScjhmMzRJ?=
 =?utf-8?B?VGlQV0x2Q2k4NXpaUytnOVdURTVDYWlhc2JHWEp2aDJzajNrdUxKK29mWFFJ?=
 =?utf-8?B?a0grN0puZ053TitOb2lxM2RseHByektWMk9VS3JyelRoeXFLNEdLeVlEODlk?=
 =?utf-8?B?TGo4ZUh0eTRDYVBvYlMwL2ZhcWVGZWxrZnFFZUlRWUdmUkRmK0ZmRmdkd1Yz?=
 =?utf-8?B?bnkzM1l1RG1kclBjOUMwR2UreXBiTG15NkpVZTBjS2QyMGtmY09lOGRmL0p3?=
 =?utf-8?B?eERZQTBzZ05Ma1p3Z1p6bXpkRU5oV0NSMGorSkN3ZWZFVEU2d25wTEsyWkZS?=
 =?utf-8?B?M1hYNlo4R0l3VEJWUWExam1oWFh3elJRU0IyWHo1MU9URnhuMnR5Ky9qS1RF?=
 =?utf-8?B?eTdjcktoYmYxemgwWDFSLzgvK2d5RjNpalhCYUJJYkNKNjN4eWczYWVmSFVY?=
 =?utf-8?B?SXJtaEdLc0xUbVB1dFdJckIrbFJPUzVXeWRyT0hRS2tkU2ZSZ1psOFZnbW0z?=
 =?utf-8?B?dE05UUNRbXdPZ1FGNXVyNUNleU5UZmVnV1QrK1paSUU2eEFvaklsSDRkaDVx?=
 =?utf-8?B?WVhvL2V6dy8wZzdUV3MyV1dNbDNmdGFiYmtBS29VcUFIUXMvdW9mVmV0ZlhD?=
 =?utf-8?B?WDZXTVB2bXc3MkZyUCtCV0VMYmZDYTFSSkJ6WkpXejdiYjcvTmQwVmFMRm5S?=
 =?utf-8?B?cVB0dzdyZm1OQklnWFZuSWdBVGMzbmN2ZVB1NFRLRHJCVUlHSmE2R2xLVXBi?=
 =?utf-8?B?a1VqSmt1TTRqQzBLRS9RZnRrY1ZrNzdseW9QYnQwYXBGUnRzekhKRWNpNWJn?=
 =?utf-8?B?RkVrbGJvK0hNcUJBZmVCbkpXb2NtelN4bXlFUUtkd25RUzB0SDZVdmxYZ25C?=
 =?utf-8?B?dDlLSDhxOFlhSmYyNWttanFEYWVLekRBTEpEQnpVTUlQV3dHalJtd1p6alRn?=
 =?utf-8?B?NENSMnhRWkJ0dTZhclpHc3JBTjBwVUtMa1drRnpwb0x2b0tzMEMydGV5WTZ5?=
 =?utf-8?B?L2RHSGRZditTMWZubGgvUTVuWVZxNXpNWjY4Yy9jQmc5VlVDRi9uazFnbkJz?=
 =?utf-8?B?YkUzdGpHNTlpbjc2VVYwVk94SjZrN0F4VHpNSDV6ajRmQitPcCtwek9SczFR?=
 =?utf-8?B?ajBGT2pEcjJQOWxGcHdiVU5LTFpnV2pDQ1JKWHAxSldXaWdnb1FMdUEvaFJi?=
 =?utf-8?B?VTNpcGJJQnZVdDFxQ1p0RjdEVWppZFZXMk5SWVdmU3RDenFVc0M0SG5KMy9a?=
 =?utf-8?B?b3RUZ29KOFlHVlZJSVRJM0drK2hjOHlNVnI1TklORFhDdjdiWGR6SW9RYVVq?=
 =?utf-8?B?Q0FtaEFZT1JidWVlV3ZuU1FMMGVoMnpvU2E4Wm05MW8wR3lpcjRrWkpxSWs2?=
 =?utf-8?B?bWxST0ozZkQ4YVQ5bkhQSVVVR0pNYW1zY3hPaEs3anpqUTZsLzRwRjdUeVZQ?=
 =?utf-8?B?K0hrOExRK0tnUnl4MEFza3l2UmxpeExyK21jQnpFNnlrQUJIdU5qNkMzY1FQ?=
 =?utf-8?B?ZWtHeFhmT3RkaTlIWWZURmZ0dDI2dVdwN1plakJObGZwamhwVWRrdTZuOG1h?=
 =?utf-8?B?NFNpNWw5TTkvUXFLcWxzZ0FKYWZ3WmNEc2VDK3ZKYTBpd3dGWlZQQVMweFYw?=
 =?utf-8?B?N1ArUkw5Wmk0cW8xN1RTY2JxcndOYVVuOVBPZG1rUmd3cWx1cGFtZlkvbUVM?=
 =?utf-8?B?eTg5ZE1Ya29iVkV0YXYwL0MzcVcvaXBzaTB4dnprc3Z1OE5kWXdhNllJOUhW?=
 =?utf-8?B?ZjN2VlFHM3FsMTgxYml0cTkrdXlNQUREOUFGS2FVb2R0L010VVEzNE1rWDJ4?=
 =?utf-8?B?akpRakZlUzZRZHJEL2lVMnliRHZiMmx5STVkaC8rT0lHcXZta0dBT3g1MkpG?=
 =?utf-8?Q?sJKB80?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 21:27:23.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 246bdf8d-3111-4185-254f-08dda540ed62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Function `reboot_machine' does not return, but lacks the `noreturn'
attribute.

Functions that never return should be declared with a `noreturn'
attribute.

The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
currently accepted in Xen), and also Rule 2.1: "A project shall not
contain unreachable code". Depending on the compiler used and the
compiler optimization used, the lack of `noreturn' might lead to the
presence of unreachable code.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Changes in v2:
- improved commit message
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/keyhandler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 0bb842ec00..b0a2051408 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -251,7 +251,7 @@ static void cf_check dump_hwdom_registers(unsigned char key)
     }
 }

-static void cf_check reboot_machine(unsigned char key, bool unused)
+static void noreturn cf_check reboot_machine(unsigned char key, bool unused)
 {
     printk("'%c' pressed -> rebooting machine\n", key);
     machine_restart(0);
--
2.25.1

