Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962093F7AA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766791.1177312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRIm-0002dy-EV; Mon, 29 Jul 2024 14:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766791.1177312; Mon, 29 Jul 2024 14:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRIm-0002bj-BD; Mon, 29 Jul 2024 14:24:40 +0000
Received: by outflank-mailman (input) for mailman id 766791;
 Mon, 29 Jul 2024 14:24:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVSF=O5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYRIl-0002bd-Ay
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:24:39 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2414::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4712b653-4db6-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 16:24:37 +0200 (CEST)
Received: from DM6PR06CA0046.namprd06.prod.outlook.com (2603:10b6:5:54::23) by
 SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 14:24:30 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:54:cafe::26) by DM6PR06CA0046.outlook.office365.com
 (2603:10b6:5:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 14:24:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 14:24:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 09:24:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 09:24:28 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 09:24:26 -0500
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
X-Inumbo-ID: 4712b653-4db6-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OA/sbVZtZZiK76ej6AVrrEfQre6mXbqj3vYi6rk+xmiORJe3NG9swdMuqMRdw2srZFsortk3DhEiF+8DiBbYt73+RsKjTYOWigxA3WTUvymANPOlifvNCzDc2fWnupNleW7r4ntfA5Bw8yqWAzGHSmm12udQWINqfs2aX3sBpOZtj9E39dQr+ReSsnZISN/s/fxkWR5GVrjIjOFmsUchMwt95xwGo2v5VqCwgiEJPq9CC2y37MwaP/XUVsn6VtRGdS4qmAM4ccto6CBs30S6zNWiQmuuDYfNxWxN5f8j1Lmc0E2ThI18DFO0q+L9D72VZl3BWvZInBh0zLSN5uVZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yeTMOahb9lxcvfHiHivc0gVIAteJro/1tGJf8GjS/g=;
 b=Fru9bJEPVaLEBNqjZMKYuHBjp2g5Gh9JQa4n0HggAhNrNZMOfEgV0s04T/Dt1O4RdqxEOewjh6nXFXqIxSO774gh8Tec/Oyg5cdEYMVoXoFHTw+DfgvCrGqsvegxvVWJcVTvpLsBZtyahJNl1VYBr4h97tWUM0Hu/k0EV5xnQVLMVWaDRESLCZ/8YYQaNwJxKIkhCxKNeglbuN2GKlkQZzr4ACx7Z1wmEkuXe2JmZkL3KsZTlUP2i4lnF5TVFGEz+fbbobP42LMOXwNLm8DOnAO4n8VVmVmzz4Fx3TZefhHyZq53dac53V+qgFLkjMn1Cb2rlvwo/TWo6djmJ2udIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yeTMOahb9lxcvfHiHivc0gVIAteJro/1tGJf8GjS/g=;
 b=vbi1dnaOmlTvf9UQF7xs/3zgTfGXz5cfv/pTjG/uCqcTC24Fnla6MtuClHJhJR0BmbArbq997A8E1VcjX+1m2Q1/Aqz6CQRG/7o/mH4ZqhX6U3Zh+cnJDOJixilw+ixoSIzpFWsNcjfVTBwVcCr4ti9501q8jb4Lb0Wuq36nN9w=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Dario Faggioli <dfaggioli@suse.com>, "Juergen
 Gross" <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: [PATCH 0/3] Stack checking on Arm
Date: Mon, 29 Jul 2024 10:24:14 -0400
Message-ID: <20240729142421.137283-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d7997b-1284-42da-e7a7-08dcafda282e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUxTSHdpVlBIM3ZoMTJ0SUU2SDRKWVd0ckxWbzlnaEpHNngxbFE1NUFsbDdV?=
 =?utf-8?B?YXI1NE1xQ1l6bkowOFUzbzU0enhFWkRxSWR1cmRNM29uYjBvVTZzWHlhbFg5?=
 =?utf-8?B?UmxnUkRWN1NNblNKYXBhdlpFL3Zsc3E4VEYySS9FNi83OHVsV1RyVWhaUjZa?=
 =?utf-8?B?VUdpOUN0dnE5VWEzVmM0cmYxY25JWHphaFRUR0lNTmVNdVNwTFFXRm9qdS9n?=
 =?utf-8?B?NWZMN1kxU1lZUzFCakI1KzFqWmFUK2cwNzBlNitRZWxuNk5DeVBndnhWMUNZ?=
 =?utf-8?B?YWdWeWl0RGVwQVpYUTBwU2JDamNEKzRnZ2lScDh0MFpvTzg3YTkwS3RQQ0VZ?=
 =?utf-8?B?Q3FpQTFUVUNvUEJ4UTFjOXorY1lTZ3BaS3gxVlFEQUZHZ3lOUiswVThTTlpU?=
 =?utf-8?B?TXVRaXBObk84b1IzV0dMZ3RVR1I5aTJiZEJsZFlkK3kyeVRjTWlSQlZWN1Ro?=
 =?utf-8?B?am9xSm1WRTk1KzdzVllldnJkNTJnRW1CclFyT3NRclpvaDlvRFFSSTRHZmFT?=
 =?utf-8?B?R05sSUtFRHA5KzNrdnArTy81MnhSSjcrZy9tVWJvTHZNSTQ1TEhIRElVcS8v?=
 =?utf-8?B?SjNkNmY2c25YUXh1ZVhVNXFZMGhpYnJaaFg2QmR5d2NwTEVIbEdYZ3JqME9D?=
 =?utf-8?B?MUgwOXdIRDYxU244TmN4cjhiV3QyYTBrajg2Wjl3V3g3T1VuUER4MEpjVFNz?=
 =?utf-8?B?dFFpTVdyZ24xenAyMHN4SUZpU01Ma0d5KzhDVm1NR3N5dGxBNUNQeTl1aXcx?=
 =?utf-8?B?QVhqVHJCTUhWS01Yc2t1TzA2c2VXVXZrR2tNVkcxemtyb25LWVUrY2F3QnVK?=
 =?utf-8?B?dUdmRkNWQkJVVzdFb3Z2Q1poV1JCUWU1cTZTVWpIVTg5Yko5NmJkSC91TXFp?=
 =?utf-8?B?ZkJTYmc3bVVIaG05dThYUlhmTGE0WTNZZXVzOWZTMXdrcGY2SldBV0J5YUMr?=
 =?utf-8?B?MEdoZzhQaCtyWlZQVEZxRkIyNU5oQWd3M3pPVENzcC95U0g4cTBSTmpNaWxN?=
 =?utf-8?B?Z0RqUkFoVy9VVWxXZXlCcXN1cGxBb29oOHJ1L1d5ZFFkaUNBRHFPWnFlK28x?=
 =?utf-8?B?SHRjUHhQS1ZMWW9MYlMremFJTTVDY21zTTA4QXo3V2hpbUtsQkV4S3VUaG9v?=
 =?utf-8?B?aGw1cmVLRXROTXo1Z1BxKzdoam41WUtod2tKN0hzcGowQnd6WmE5RERxdWRk?=
 =?utf-8?B?Z05TK3c3V05VWDFhTkdoQkxGOHNKMTVlT1U2NW43WjI2S2VUYW5hMDVzZnBX?=
 =?utf-8?B?U1V1R21mSmFpN0YwMWpFZkdmc1daeHE5Z1FZc0pESCs4Vk1RUkNpZXVJS0Fj?=
 =?utf-8?B?WUNEREc4M2c2SHMxUmdod2N2RXBFZitkVmRZTWk3QnNpM1JjRFBQdmNINFhQ?=
 =?utf-8?B?eG11Tm9VYVZOaGNkRWRPdUZ1MjBqajNpczk2R0xiQXlIamF5Z2FTOWRoWXdC?=
 =?utf-8?B?Mld1L0t3YlMwNkRHSEFPcDk0T0dqUW9mY1F3RWUvaXpuNlpNTlVvemtKbmY0?=
 =?utf-8?B?eCtUb3Y4bVozTmxEOFByVHJTZmxwcjZVYUJxdUUvUWlSeU0yc3FtalljVUdU?=
 =?utf-8?B?MTEvUDBoWTdpR0w3YUtiRmlGSU56NEVMaFhZUXA2bEFYSmFzY0hUL3V1RUZY?=
 =?utf-8?B?Ui9pSEx3WThaN2dGNFFVSkU0dTAyWVhoZW1sSXhlcUdZWkpzTENJc25BTkNX?=
 =?utf-8?B?bE9qcStEVkNnK0JVM0hnTkZoQ2tJVVZsKzdsQzEyQ1NaM0lUaU1Jc2Uvc1Nu?=
 =?utf-8?B?WUU2cUxkMGlZeUdtNzRMRGorQ3dtc0pKYXhpZ3d1MjBQZStRRTJWNzJvdXpU?=
 =?utf-8?B?RU1veVl1VlJuRmE1ckJpQW1nSVBXS1pvUS9yVnpJOFJHaU53RFlVWjJXeUxN?=
 =?utf-8?B?WFNEM3QwNzZpa0ZHRDRmYWl1YndIRW9PcW54ZFMwV2dUdzczZnYwaWJrUnBj?=
 =?utf-8?Q?ogY5nWtfkw56UC1uDiEa7en3vuFepqa5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 14:24:29.0411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d7997b-1284-42da-e7a7-08dcafda282e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361

This series introduces stack check instrumentation on Arm. This is
helpful for safety certification efforts. I'm sending this in an RFC
state because I wanted to gather opinions on the approach of using
-finstrument-functions.

Stewart Hildebrand (3):
  xen: add no_instrument_function attributes
  xen: silence maybe-unitialized warning
  xen/arm: stack check instrumentation

 xen/arch/arm/arch.mk                     |  1 +
 xen/arch/arm/arm64/head.S                |  4 +++
 xen/arch/arm/domain.c                    |  3 ++
 xen/arch/arm/include/asm/arm64/cmpxchg.h |  4 +++
 xen/arch/arm/include/asm/arm64/sve.h     |  1 +
 xen/arch/arm/include/asm/atomic.h        |  2 ++
 xen/arch/arm/include/asm/guest_atomics.h |  1 +
 xen/arch/arm/include/asm/page.h          |  2 ++
 xen/arch/arm/include/asm/traps.h         |  8 +++++
 xen/arch/arm/setup.c                     |  4 +++
 xen/arch/arm/smpboot.c                   |  3 ++
 xen/arch/arm/traps.c                     | 45 ++++++++++++++++++++++++
 xen/common/sched/cpupool.c               |  1 +
 xen/include/xsm/dummy.h                  |  1 +
 14 files changed, 80 insertions(+)


base-commit: b25b28ede1cba43eda1e0b84ad967683b8196847
-- 
2.45.2


