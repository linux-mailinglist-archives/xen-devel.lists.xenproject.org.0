Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E13A55669
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 20:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903966.1311887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqGh8-00047I-F3; Thu, 06 Mar 2025 19:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903966.1311887; Thu, 06 Mar 2025 19:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqGh8-000449-Ba; Thu, 06 Mar 2025 19:15:46 +0000
Received: by outflank-mailman (input) for mailman id 903966;
 Thu, 06 Mar 2025 19:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0m9W=VZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tqGh7-00043m-5t
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 19:15:45 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2407::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62e2c6af-fabf-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 20:15:38 +0100 (CET)
Received: from CY5PR03CA0017.namprd03.prod.outlook.com (2603:10b6:930:8::41)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 19:15:35 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::8f) by CY5PR03CA0017.outlook.office365.com
 (2603:10b6:930:8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 19:15:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 19:15:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 13:15:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 13:15:30 -0600
Received: from [172.19.192.96] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 13:15:29 -0600
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
X-Inumbo-ID: 62e2c6af-fabf-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfOC/Npa0405yVmTtIASCbY2z5IETQ2UdxRl/z52lgSaLlFSsbCXMwUr5BA7FViJeETaYXcfDvM0IcrUDoROHkt431dhFPurZX+P1XKXSHllWgjTqsQSFU8GiN5GAOxjDTOLYtmLLQ9T1DWyFDAZdNfumK0/2NKDThSWOLA7AhzCnnYzVEw6U1GwxUmQNqjKmQxivtZvR6j7OqWGz9lh2+uYbwSmrQX4ck0Mjrwr/ME82xJbHWfsKmr41rZlAS8ApB78//ZH8oh4tQ9aLiIBn93FQApWwVWIFKCTmX0SHRmApkiy7l4Q+Vr37wt1cMKJ1sM2ZTA++VEis16Tl/JwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApfgN2aia//xxSiC5wzEE0OScHtZ0agICMxSNAp7hSU=;
 b=PscfxVYUST7nnCF4a+BngY/UKTg/6raarjKO4z9+gCpLEDFX6aQL4mwzq+Aiy3so4w1lZyl7P6lCpWugJSQdVYhmBS8JlceucsitrB683MMpqYxUUKB0kJdN6T+8TFng9ilFJ82L7pmblZJw0CJcJSMoRnsFReWhjKx3YMC1fifg2ms1se+e++QylrMN/r21fNqs/ripoI6n6QwlzazSzVNJfHTUisFrLhfnkChSXvEQois5kfJtoQIBWAiGnQHCJXDGvkrYNu3zsQibS6A+aZlsEh9VgHLHMSQzUGzsoTudCD9aAjaigkSOy23g/TMUMfLlHKIbJoFKu5FNSAPvWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApfgN2aia//xxSiC5wzEE0OScHtZ0agICMxSNAp7hSU=;
 b=sKltildq+6rluWIfRIJzkXjjMiyvHvYnO9gkW4HmHdT0erJNGQbbov8VjnDGUyjXihZwRnxSakMEY1t7N2afq+7MZvtAehOloxC/X4qx8Z2J0snYYRxbRHtktydVUNo3ZdWZehOehksbn/MsMqBE+Bc+MjJLdDNnBwtfIfxD9P4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a2092d85-9b4d-40d3-883e-60207d2e3412@amd.com>
Date: Thu, 6 Mar 2025 14:15:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] xen/arm: add support for R-Car Gen4 PCI host
 controller
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
 <8e567e7db48ba6d268c5e3a3481d53d891524d68.1740382735.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <8e567e7db48ba6d268c5e3a3481d53d891524d68.1740382735.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf90cbf-303b-4bdd-a836-08dd5ce34573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmFwbFhXQjdTdWtyTm14SlVWVWlmdTNROFpsNzBJbGJUeDdRQnlac0V5bDFj?=
 =?utf-8?B?bDhBOHJucXc0SSt6dHQ2aytMblVjWXZpbmdSYUd3UjNPN1VUUTNCWWthOXBx?=
 =?utf-8?B?MVdBd1FKcUZvRm5JU05STUEwRm9TMDRSc0ZvVlAvU1NYbmt2bjd5RVd1U2RB?=
 =?utf-8?B?M2ZxWkxLTXJEOHZ6Ymp0OGpNTUxhZFBTQlJXMW0xYUVkV2R5dDdjMU5IUUdv?=
 =?utf-8?B?STFXU05NNWdJWkE5dXNKWUhrUVNwOXgra1NJNy8xMDJnOWZKMTZkSEw2bE9n?=
 =?utf-8?B?ek1zNTE2WnloUHlzQ001NXRoREJvYkFVd3lXNGhGYVdnQkJPQm5sU2JRb3Vh?=
 =?utf-8?B?b2dHbVViWkRVayszSE51SUgyWTRMbTR4Z2lDTEFpc1V5YlEwdUw5Qm90NDNj?=
 =?utf-8?B?SkhUNTF3VmtvMWdjWk5uNG5reVp2ZStDdFlPTi9CVlZVYzR1RlVMS28zVDEv?=
 =?utf-8?B?ZVJJOUY5U09VcW5rTlNYUEdBTEFkOE5sQjl0SDcrdkxmK2lSRmFUSGY2V2R3?=
 =?utf-8?B?SlUxbHdHcldkVFhhcjVIWGptZStQM0Y3ckx6ejlabkZCRzh5aGE5ZWhmMnFi?=
 =?utf-8?B?cjYzSjl1eGtJSlJDdFEwamQ0ZVZIU2krekU1Wi9FTjBRaHI5ZnVLWU9EYi9O?=
 =?utf-8?B?cU5ubmoxNlRndXhZbjhWajVrSEFSdEhtdWJkc09LNmlMaWNoUnhVbkRmaHV1?=
 =?utf-8?B?ckVoQ3VvbDBZUHNkT2FkcmpSS1pmZWg5UkJLRUFCQ01TaHZaZFpqcW1uaVV4?=
 =?utf-8?B?eDhiVnRKeTZseG1PK0NBMi9NV1c5WC8zOFlqU0FRYW9VUW4rbWNXak9POEla?=
 =?utf-8?B?bFZjWWdyaFcrNzBHSDV5QStkd1d1RXE1dVUxR0pEaC94SEtzdEpNQkp5ck1w?=
 =?utf-8?B?Sy9BQmlCZTUwRHNVVE1IQTkvcmpVQnpXS05XTHhhR1lETmNrRnd1NXRnZ0k4?=
 =?utf-8?B?UXB6M0w5WW1rdVBBRFNJUnVsVnlhc2ZBdjRrTGttdldjZ215emFHa2svWGJU?=
 =?utf-8?B?cEp5YllRSW1JZlEwVjA1L0kxcXRkQ28zWVJ4TTNpWTJGdEdlSWpNbE9IVkJt?=
 =?utf-8?B?VTUyWlBKb28xeGc0ajlKdnJQMEVTOE5ZOEUrUDJMTjBodjU0enRldUU2Nm1p?=
 =?utf-8?B?ZHVMOUNMdURETVhMeCtKSHVxUmQ5Q1JoOVFQdnhvZ2FLdVZNa1hNMGxwMzFr?=
 =?utf-8?B?dFdCKzZzMkdWQzhKOVUyTyt0WE80RTFVWEh6U1hma04rVkd0VnhFWGhNNDJN?=
 =?utf-8?B?ekd3OVVlTmp6TWd4L1dJcFJoV1NXVzFBOXZRYTFjdk9tZmZlc0E3M3hQeEpa?=
 =?utf-8?B?Mmc5Z2IzTU5EOUpSSnpsb1UzeU4vaWdIait4bHUzNXpLTGdNTFVwSkZRV3o0?=
 =?utf-8?B?TmdsSzhReUxNT0VzQ2JXYng5b1VNVEEvZlI0VGlHTW94cDZFdzZwTmtjK0lW?=
 =?utf-8?B?elFxSGJ2bk9PaU9CM0trelIyQ1hDM3NjRk55Unh5a1IwMHV4Sm9UcnV4Vmor?=
 =?utf-8?B?bHh5dUF0alVZYXo1STZ0U0QyYm9xQnNUWk9EcXpDZWw4WkFRTEszSGlCbU5n?=
 =?utf-8?B?U0NlU0U2NSs5RlNnd2o1dm8yMnZSdkFKRHh2TU9FVVFFK2lsUGRWd3UwWGtS?=
 =?utf-8?B?ODFXckVHSE1RU0JVVnA4YXZtYW03MGFGWk05ZGhMMDk5Z2MvVmFCMjEwNG1J?=
 =?utf-8?B?VGtvaGpUNkJta1AxWERxMmMvVW1QTWxMdEhib0I5V01EQitUdGZyRHp1TFdv?=
 =?utf-8?B?ODhqc001bzFmM3NrZ2dCcmdldXZONGl6dFRXanNweUFpSWYzZWl4NTUrZE5O?=
 =?utf-8?B?dzNvQTRCckZCa3FWMGZuS1VuRXNubFBDSkVDTGU2MVk4Q0pQSGJ3ZkF0YXlP?=
 =?utf-8?B?WWVuV3J0eEFVK0VJMktrWGJuWUZkNm9mUk1CbTJoNWZMeCtaYkhJRjRuSW56?=
 =?utf-8?B?UUVQTnBueVdrRjhsb1N0N1IxNVhZSDJVNnF3SVdmUFJuWmxZSXFlUThvWXVV?=
 =?utf-8?B?ZFowU21BcndRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 19:15:34.7298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf90cbf-303b-4bdd-a836-08dd5ce34573
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066

On 2/24/25 04:18, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add support for Renesas R-Car Gen4 PCI host controller.
> S4 and V4H SoCs are supported.
> Implement config read/write operations for both root and child buses.
> For accessing the child bus, iATU is used for address translation.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/pci/Makefile         |   1 +
>  xen/arch/arm/pci/pci-host-rcar4.c | 529 ++++++++++++++++++++++++++++++
>  2 files changed, 530 insertions(+)
>  create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

Can any parts of this potentially be reused for other designware-based
PCIe controllers? If so, could those parts be moved to a separate file?

