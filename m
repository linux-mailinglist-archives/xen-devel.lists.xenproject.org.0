Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98E7A69A77
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 22:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921164.1325138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv0Wf-0006vL-Ew; Wed, 19 Mar 2025 21:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921164.1325138; Wed, 19 Mar 2025 21:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tv0Wf-0006sw-B8; Wed, 19 Mar 2025 21:00:33 +0000
Received: by outflank-mailman (input) for mailman id 921164;
 Wed, 19 Mar 2025 21:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XZm=WG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tv0We-0006sn-Bh
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 21:00:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2413::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fce585e-0505-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 22:00:29 +0100 (CET)
Received: from BLAPR03CA0113.namprd03.prod.outlook.com (2603:10b6:208:32a::28)
 by PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 21:00:24 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::d2) by BLAPR03CA0113.outlook.office365.com
 (2603:10b6:208:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Wed,
 19 Mar 2025 21:00:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 19 Mar 2025 21:00:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 16:00:23 -0500
Received: from [172.17.183.194] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 19 Mar 2025 16:00:22 -0500
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
X-Inumbo-ID: 2fce585e-0505-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSzIhfbSjc0CWAQUbiu1r8mB/fSpFSayqN/pItKeimVsI+7DzYKuF/pm0ww+FAAgwmNZuGKH9f0d/6S2KsZRFlF6MKFzsoWdrz5SjhqsjVQ9B1J02SNhCZcouoaa04XdPn/EEbvpDaN1m0kq6y2bPN43vgrzUUv7W/h5J7NV20hXL9Lj1miqsyGoj/bPJLhC6fj/h8kUEFXYiM9Dnn6Lq/BwCMjO9HLA4thRN8LoZgEWIX9hmE1SgIDx5G8R84E/rC68PRzFT2ImGLRbzW2SNNo3b5L4PVDSsxdoI0QYyka4f4/BhKvk2vYqFzBOV8ZtFUDD31pEXgYIxdl11ZFixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bgh4E+ItHHg/+K4yT0RvVp7gaPJ1C6RvwzeLly09b8=;
 b=qLVS2JB3bAYwOYfqsITG2FP4owwVs+ahp1nq2J57BK2qlOE8p9Ehe73NPlu4kUcoCDH6pd/b/UXVJZgBZTdP6kd3X86DdhqGUzZVxek1GXLrNU6orz6hplzxMrSovWxbuCcgwsxJ5h770QL3VfLxNJ9lf4UNi/IRjSu5FNlWpgDtiaYsskU6Vh/FzDlyFXom6xGFBi0uTyu5MnnpeTAQAcAk2k19L4Zd5jp6wwi7BEKWvvGfEqjgNLXJG/uBSHFU2SMvV+gFotmWEeACHwF1xuY0MroxTRm/mhzqd0nYEdbExEjnBHjAF5ryHEXfKHsb7qdKG2YYFMqXJneBk9ZVfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bgh4E+ItHHg/+K4yT0RvVp7gaPJ1C6RvwzeLly09b8=;
 b=hBBLLwxukqdC2ugugiVMXCH/QyM33ZH32xxIFNDLHg2yRRYQt36kYqRiuFKZPOdkhbANiuEWDalI1o/ZrK/IEYKzKrY58a2RDuIdUlX2faJD0HvhwlqYrmstHHvyGlWDcBZASE1LxDq5ivem1Inle4hBOiGB3ufgfwrzNAadsf0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f231aebe-aa6a-4321-b7b5-dcf7b1014eec@amd.com>
Date: Wed, 19 Mar 2025 17:00:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/2] xen/arm: translate virtual PCI bus topology for
 guests
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <20250311201330.365499-1-stewart.hildebrand@amd.com>
 <20250311201330.365499-2-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20250311201330.365499-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: cc027b44-140b-4c9d-1d25-08dd67291153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFk0UWY1c2M1cWZra1ovTnR5cE9Ob29nZURXWFVYV3A1bzB2QW1CVExhdU5k?=
 =?utf-8?B?NFdlYm5UUktRWmQrUVBFQ21kOGw2MUZ3RllSRkRQUyt0UWNlenlOZ1Z1cTVr?=
 =?utf-8?B?enNqVkh3WlhJeHV3Y1poSHVST3d2WWY4N0I3LzdZU0JUeFRrWlkvejBOVUJX?=
 =?utf-8?B?b1VYY3Bya1VicDRIVnhid3hMR0ZFbUVVUXB1UjcyRG0zSTJPNlF2S1JrOE5s?=
 =?utf-8?B?QlBuQ010ZkZqWWI5ZW9DdDlWdEJTZmEwaWZNazRUNVZWMjBJb1dOd05qVHE4?=
 =?utf-8?B?Yzd1VTZpSDBvNXc4WGtLVVZDMGFTMEFMbzE2enNrSWh3bVZOMHNORW51eU90?=
 =?utf-8?B?WENodWJxVGd0TDdSVEQ2dFB6aTNxNW9OZlJ4ajJSd3JjTDBxS1pCd3VaU2p5?=
 =?utf-8?B?SkdRbzNJREdVQllJcFhtYWRUM20yV1E5WC83WEQ2MFRGZUpRdFlZU3IyM21X?=
 =?utf-8?B?N1VwRzZpOVZaTWVIbDUxV0lCZGx3VTVBZGlLVlpjeGo4R2QwaG9ZUUdMM2dq?=
 =?utf-8?B?REp4WFM5WGplZ2pZOGd1VWVLSnpPN1NEK0YrVWhLbGRsYXlIUDFIM1RnVy9I?=
 =?utf-8?B?V0ZLRTFWTmRDb0RLUk42cU1NYk9YL2Q1QjNueWFWd0s2RktLSWZwdmU2VzdX?=
 =?utf-8?B?V1ZsZ2Z4QlJ5bGp6N3BRT0lFd0c5RDN2WEZhU0I2MEhQMnd4aTM5VWQ1WUVJ?=
 =?utf-8?B?QjRJYmtNaFdrUElrNFl4dHBhZUE1K0dQYWZjN1Q5Y1NPU0lCL0pIRURKWWR2?=
 =?utf-8?B?b2FnaVcxamYyS2FzeFpuSUdiYlRsalk2Y2pMY3lmTTh6MnBzVFFvdjBwZkpB?=
 =?utf-8?B?TnkwNXBrZGo4Sy9XMXU4bGFNdWRtU2R4NDlQaHlsQWIyd29BYWlCcGtWS0x4?=
 =?utf-8?B?bjJUZE5UOExVWkYzNSs3OHhGK3FwZjVPS1RGcFRuWVJYU2NZN3c4aHhSaFd4?=
 =?utf-8?B?T0VJd0Q0RDZLVElzbW1scHF1aXcrcTNmdmYvWTRwc1J3RTdlUXlpeTRoSmx0?=
 =?utf-8?B?WnorcnQyTC9yb1pSMXIwN084SmNKekI2VmtUeGZwQ016SWRJTnFHcjhIQ0hG?=
 =?utf-8?B?NGhyS202eFB1Rzl4eFZpSmFxMUtPUG1MMEozTzBXRU9lb2JtM2h3MDhzSTZM?=
 =?utf-8?B?RkEzcnJiSGRJSktwZDBjaGVPZ2RKcUdSVHF0ZlRudDBtdUVOQXNXdU1iMkVM?=
 =?utf-8?B?K0NRbWpybGJTWWNpd1dCbEFTZEluQzVTbUJoSHVUNmVsVGZSajVJWkdiS3hr?=
 =?utf-8?B?UmxyeGxSR3RiaVZpdXNldzJneC91cnd4SkpaTWVKSTJPZG8xMU5sK2lrUEs3?=
 =?utf-8?B?QlFvOTJLVzNneHd0TDZPU0RqcEgwdUVvWE5sTGp3alErTUVUbEhmSnRMQ01y?=
 =?utf-8?B?WE1VQTF1ZGRNUkp6K05zUkx1K1h0eE1DUmQ0R3dzaGxzK1V6T05tTGV6MWhU?=
 =?utf-8?B?UFFsNjR0Z2IwejMrdUlKaFlhYk5BTklTRFNwd0ZGcVhVLzRLQi9pSTcyTEE5?=
 =?utf-8?B?Z2F4bnZtVyt6OWcralV6NVhaWFd2Q2pMSGRsUmNZL3JuSkEzL3pmSnZJNHEy?=
 =?utf-8?B?VzY3amNYZW0yRVdocCtXR1VreTN0RFdLdTM3UUFZMGdZYjc1QVJHaTJwRFlV?=
 =?utf-8?B?c1htS2x5V2NCTlYvWkpobWZRS1NiU21VMFMwU3JJR0FKNWJNUHEvbk8rbXl6?=
 =?utf-8?B?ZXMrMlV6Z1QzL0x5L1hUcVZxc3U0ZWVZeXk4ZXRsbGEyK0VmaUFMc1krVXBp?=
 =?utf-8?B?d3hIN3FaT3lqS3dWM210UTdydFR1b25jZ2l0UnVXc0NPTU9hOEx0bDlLUnlm?=
 =?utf-8?B?b2ltamRjcGVuRGVPVlBDY3FjVzNRZzhyZUp3em1wSHZqRmwyUEEvN25lY3py?=
 =?utf-8?B?enV5em00U3lvdXhsNWtJMXZneGp2bEhtRXc0RjZqNTYrLzhkbitvdjV5RW84?=
 =?utf-8?B?bHI1a0YydzdkRXkyUzJmMGt4ZzZucXcvcyt1WW1aTEs3MWE2UzNxK1pmTCtS?=
 =?utf-8?Q?xZbcmysqLmS5yL1/pbQ+CkaUoNlzik=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 21:00:23.8145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc027b44-140b-4c9d-1d25-08dd67291153
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998

On 3/11/25 16:13, Stewart Hildebrand wrote:
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 807401b2eaa2..e355329913ef 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -311,6 +311,18 @@ static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
>      return vpci_assign_device(pdev);
>  }
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
> +#else
> +static inline bool vpci_translate_virtual_device(struct domain *d,
> +                                                 pci_sbdf_t *sbdf)
> +{
> +    ASSERT_UNREACHABLE();

Unfortunately this leads to a warning in the vpci test suite:

In file included from emul.h:88,
                 from vpci.c:18:
vpci.h: In function ‘vpci_translate_virtual_device’:
vpci.h:317:5: warning: implicit declaration of function ‘ASSERT_UNREACHABLE’ [-Wimplicit-function-declaration]
  317 |     ASSERT_UNREACHABLE();
      |     ^~~~~~~~~~~~~~~~~~

... which can be fixed by doing:

--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -85,6 +85,10 @@ typedef union {
 } pci_sbdf_t;
 
 #define CONFIG_HAS_VPCI
+
+#define BUG() assert(0)
+#define ASSERT_UNREACHABLE() assert(0)
+
 #include "vpci.h"
 
 #define __hwdom_init
@@ -112,9 +116,6 @@ typedef union {
 
 #define PCI_CFG_SPACE_EXP_SIZE 4096
 
-#define BUG() assert(0)
-#define ASSERT_UNREACHABLE() assert(0)
-
 #endif
 
 /*

I'll send v18...

