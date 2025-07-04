Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB1AF88AA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032827.1406208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaXA-0003tu-1o; Fri, 04 Jul 2025 07:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032827.1406208; Fri, 04 Jul 2025 07:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaX9-0003s8-VE; Fri, 04 Jul 2025 07:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1032827;
 Fri, 04 Jul 2025 07:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ASC/=ZR=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uXaX8-0003s2-IM
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:08:30 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20602.outbound.protection.outlook.com
 [2a01:111:f403:2409::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aed870c4-58a5-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:08:28 +0200 (CEST)
Received: from SJ0PR13CA0181.namprd13.prod.outlook.com (2603:10b6:a03:2c3::6)
 by IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 4 Jul
 2025 07:08:22 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::2d) by SJ0PR13CA0181.outlook.office365.com
 (2603:10b6:a03:2c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.15 via Frontend Transport; Fri,
 4 Jul 2025 07:08:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:08:21 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:08:18 -0500
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
X-Inumbo-ID: aed870c4-58a5-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCBGw/lWwliiONfuRyogoiTH4QRyjhPhEdznSEHuRrZYKub2Jw2wmZZX5s7GE6WhfV/5gUJ1yepql5EJwhj6G3k4t27Kzx2O3aROWLkl+qR2Y7U7itPuy+/+3Ai/6lgCv9SrOzOCQyLq0ztLiQCxoIX9f7w2jfIxm6zBW95zRF+oNSctowCEc3m1ZDjed0QWRrU/IAZJms21HtceRbFPFdzJWZ4zSp9ZaRVYkC7Hypw2Z2pKMg3xKfMDKg8oHLjufNctWbJD5OCS7Ojz48H0Xiq2PdwCBru3UZO+jiy7pXk/g67pxo7rq+yIBCoM9jHJgYREa44V5DFCtuMGvJCNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lznu2e3yOYYHT/BNToLtsezst7EBLdrtS4SiHKaBni8=;
 b=dP+LhvkOlwdYAdctR2KfHh+l9ErXm6ovvbmQwvKJfXEAJB7TiPfkctS3EqrPBmuKG1JM19EV8KioDOdQevR8Rr6GGlvKtPeq9GJ2w4MPlSZrTtiCODg/hz1iXOs98K/vIJ1TIqhDpgrCYLCW12Yj2Ee9UvKwrmJBGktJHH9GhHsLbCzDSi9QSuPmTCzFXMvn6Adu5LAUpYuEDbN7vmjszho65ycywEjWguA+FesK6PLcq/ez9441dUVnSRYYfyo+yVTQ4O1GCdP5CQrJFBLgJxyyGQAMV0u+db6qik4m59ersDnBap+4743U8y7EmeFtJcSGBF+sZPEH9o+ytGS0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lznu2e3yOYYHT/BNToLtsezst7EBLdrtS4SiHKaBni8=;
 b=nXGfbfpRahCejArv//F/dt1z+Rn8k6nw/ace0QOLzkuYVj0dF1DcRtDVRW627wl1tKeaiL2ycuDaPCYtaL9w44rcRQtK5d3g+oFMQoh4E5LStdhm1io9TXnPUcTTpZHeQf/1jkGIDEZodRYoIeKJ+NVSCftbPRf4CENYdxS7iNg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v7 0/8] Support hiding capability when its initialization fails
Date: Fri, 4 Jul 2025 15:07:55 +0800
Message-ID: <20250704070803.314366-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|IA0PR12MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cf50b2-fd81-451b-2b28-08ddbac98fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVZldmMwbnlFVXJqQ2RTdVo5cEVYUFRkSDI0SVhBWFVMUndqdlF3SUdBQWEv?=
 =?utf-8?B?UWNubDdaUENxdjMzaFppemJuYmE5QitOOGFVN0hTaDlXNjkxT2lPb3duWU9G?=
 =?utf-8?B?bWR0NnBEZmhqQms3a2p5akExVU9zQ0dLaGg3MFJQTjk0akNZUHltQWU0am1y?=
 =?utf-8?B?a0kwbzREa25uYVdmUUIrS1R5UmI0Tkpoei9oSWhELzd2dm54azBBVDhZUG9p?=
 =?utf-8?B?cHpWZEJ4Q2xYWEE5UklXNkhmUnhZejFIL2xDVTRYTFV4d1VmeHY0WUtUYWJE?=
 =?utf-8?B?WGFXYXc5SDhqYVBLODJTazk2Q3FSenVLSVgzRzNKd1oyY0h3UFpKVjMwNHQ5?=
 =?utf-8?B?ZkRtVVZkem81T2lJVW55bDlUajZudk9KY1JjSG5DSlpKZE1JUUU4UVExWFVR?=
 =?utf-8?B?M0M5S25Mcmk1OXh3N3BkY3RleHVXWlZ0YlR3UFA5K05TTmd4dFpBNWtZQzMz?=
 =?utf-8?B?bGdYUzc4RDBwU2hUK3RjQ0ZIWSt0dVFrbFZ5QVRsdk5ZbDU0WkZ1WXMzZS90?=
 =?utf-8?B?YW83Tm4yY3diSk1kZ0pvUHhJVjY4VHJNT2VCc0h6cGZ6eEJMK1NPN3JGNThV?=
 =?utf-8?B?ZWhoeFRlaVl6MzFuUU1scytDVFNTZ0ZGWmxkVGxJa0JJbHlVWFVMZmo4YTVp?=
 =?utf-8?B?TmR6UmVoZk1udVVxY2ZnYlNLQmdXbnViR2h0REF5WFk1RnVVZ0pZTWowOGRa?=
 =?utf-8?B?UndxUmJZM0FZbEF2RkEweGJkRDcxU2ZPaUdtc3Q3UmRjVW5iRG9wT0oxZW1R?=
 =?utf-8?B?bkQ1aEY4UFZsa2ZtSzRZSHI3NHk2c3I0QjBRZXQyK0FqNTRQVnY1T21oalVn?=
 =?utf-8?B?RFVpdDJXTnB3NHA5S2xyNEttNTJ6d2pNR0VMUDdnTS9sNnUwb1EvMWQwc2ZB?=
 =?utf-8?B?WUZCY0hncWdVMnRjNzc1S1dYQlQyQ2l6RHdvRVF5UUFGeUJNSVVzUnVsL014?=
 =?utf-8?B?QmgyMnRCV0VxQW5JdjBnQTlTSXpWS2N2UTRyVE5sdXg1cmdWV242ZndjVG5V?=
 =?utf-8?B?VWx2QmVUR3NTNkNsTkc0Uk40azI0MVllRHBEcXNaTit5N3B2NnFGNmtySnN0?=
 =?utf-8?B?emJGbEFuWW9kSVk1VW11ODJIY0FNWkVuREplUkNtMWtXU1pQbHdQLzU2bG4v?=
 =?utf-8?B?Ny9zREhVelAxVGRneEFsNTYyZWNEVmc5S1MxVWZjeGpidWt1THVFY1ZPT0kv?=
 =?utf-8?B?VThJTnhCYnUvTW1qem9Nb0grQ2JhYWhmSnRFaHdQU2JPOUluYlRYUkhpdmV1?=
 =?utf-8?B?SER4RkFqa1NvMlducFU5NWprMllFQ0l0YUQ4eUd2dllVSjBkMFM0cHlBUWl2?=
 =?utf-8?B?b0VKWVNsVGVCZGVQRkU5VTJhNG5IRkF4enZBM0JIcFdQZ1YrYWEyY2V4Yk1p?=
 =?utf-8?B?ZWRiM2JaeDRvZHlIQi94VTZCSG5scUhLOFFwUjU2UUc3bHZuVzNPYThDTWVX?=
 =?utf-8?B?dkZvNk5uUVM3QTRGUjFOU2V5MGhIMEZ2Q1RXMjlFT1duTW9kUFdlQ1BIVTlu?=
 =?utf-8?B?Y0RmZzRJUkFMZDdWMVpwQ2dsZUcwM1pRL3dmNXJTZWg2SlZXek9SUVlZRUZM?=
 =?utf-8?B?R2I2SVAvRUhGRm81cEtxNE1BbHRBdGNnL0hob0J1TURUVjF0S1BtclpiaG9h?=
 =?utf-8?B?ZnIxdTBrZUd2Y0hOYStvdFo2UVVuc0VWekh3OGRQTCtMV3BxbGtmR21KaFlt?=
 =?utf-8?B?Y0JaZTZpRjE1WTNOcGhuODBINVkyVFluR0M1Y2d0d2tlSnZacHRKK2V4U3Zu?=
 =?utf-8?B?UGdVZ3JuUnp2ZnBjaC9XOVJlV09sNWE1UkN3c2Mya0Z3QmpIQ3NHQXh4WWts?=
 =?utf-8?B?c0VkOGxtUXphWk9hOGtSNEpiRVVIYVlzWWhmeTVPazEvQjlIUU95M2RtWUh5?=
 =?utf-8?B?T0luK0FNcHlHckRDMlFNa0w2dDNaQ0ZWVXQwTk9YYTA4d1BLcGRpcmhObTRH?=
 =?utf-8?B?b0NhaXp0dFR4S1RTVW1CVW9HN3hmQ1kzeldvWVdqL2tKbCtjMGNpcEIwVjdV?=
 =?utf-8?B?SHhXWDZGejIyajg1MXI0Y0E3SU5GdTArdDBZUEh5N21NVTVBSjN2THVjS2lM?=
 =?utf-8?Q?qzGn7K?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:08:21.7079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cf50b2-fd81-451b-2b28-08ddbac98fb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698

Hi,

This series is to
emulate extended capability list for dom0, including patch #1.
hide legacy and extended capability when its initialization fails, including patch #2, #3, #4.
remove all related registers and other resources when initializing capability fails, including patch #5, #6, #7, #8.

Best regards,
Jiqian Chen.
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
Jiqian Chen (8):
  vpci/header: Emulate extended capability list for dom0
  vpci: Refactor REGISTER_VPCI_INIT
  vpci: Hide legacy capability when it fails to initialize
  vpci: Hide extended capability when it fails to initialize
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Free Rebar resources when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Free MSIX resources when init_msix() fails

 tools/tests/vpci/main.c    |   4 +-
 xen/arch/arm/xen.lds.S     |   3 +-
 xen/arch/ppc/xen.lds.S     |   3 +-
 xen/arch/riscv/xen.lds.S   |   3 +-
 xen/arch/x86/xen.lds.S     |   2 +-
 xen/drivers/vpci/header.c  |  60 +++++---
 xen/drivers/vpci/msi.c     | 111 ++++++++++++---
 xen/drivers/vpci/msix.c    |  63 ++++++++-
 xen/drivers/vpci/rebar.c   |  41 ++++--
 xen/drivers/vpci/vpci.c    | 279 +++++++++++++++++++++++++++++++++----
 xen/include/xen/pci_regs.h |   5 +-
 xen/include/xen/vpci.h     |  38 +++--
 xen/include/xen/xen.lds.h  |   2 +-
 13 files changed, 507 insertions(+), 107 deletions(-)

-- 
2.34.1


