Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33AC916B8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 10:22:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174618.1499565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOugF-0001sl-54; Fri, 28 Nov 2025 09:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174618.1499565; Fri, 28 Nov 2025 09:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOugF-0001qE-20; Fri, 28 Nov 2025 09:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1174618;
 Fri, 28 Nov 2025 09:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V56+=6E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vOug6-0001q2-CY
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 09:22:17 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2a4c0fa-cc3b-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 10:22:02 +0100 (CET)
Received: from SJ0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:a03:3a1::17)
 by CY5PR12MB6575.namprd12.prod.outlook.com (2603:10b6:930:41::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 09:21:57 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::51) by SJ0PR03CA0372.outlook.office365.com
 (2603:10b6:a03:3a1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.16 via Frontend Transport; Fri,
 28 Nov 2025 09:21:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 09:21:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 28 Nov
 2025 03:21:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Nov
 2025 03:21:56 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 28 Nov 2025 01:21:55 -0800
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
X-Inumbo-ID: b2a4c0fa-cc3b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2VdNyjy74iCqWD2U4aQ0/dPAUmMvECX8/zXns1vyYyCx3+eNLcFswTz4o0xp7O32S/TQIfsrE9KoZfydOaumcwazPR3fKdNMr51FdKrvVjbSOYYPym++PVC5TsaDULKVV7WIf2O2YvBmu7N26t/qVjqHNaWBHzAARqM7P/BP4HUIhMc+EXcWlUxY/5okQYrbdil4ISiPjhXKdHQyEMunnh1WahYOWZOYpdmbLzz6TPQIwZYGVy51JHIoJyy9t7/3E+7JH+oGLQO7+U3m9asbFdleZhO10Mrcmce6aP7dkC0KF661J3XwH47NGDx9MSHpM4kuWTOUlBeNcV+5Ibivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1mIa9MrqqUEDIVc5iZEApMT+ZHnQRaHBA7qu9NvOT4=;
 b=sj+ftqvo8Mkl71MI/mlXsE5IG5IVoIayGQEMQdC2Uj7P65+EBMd1r2QqzL7Hoadb/0hmozkOq0h+k079GMxCfz7euu/7c+tAJdurhYViga9lcOfYTfXfFnGUYjhVFIXlu4FDq5b49ctD3gzQkA6N+QjZUE1gXUSecBZezc6SzHcoG2o4ScpuDHcVeIFH7jiz2VkYzY5ns0Av0NUEovinyl88g5SJ+SoryW5k5bmP6zT6SXU4KiqG+spjEepAP+xto4spHg8rsM6trSrLxeWMxw1ccDJLWATM57TdZxMENN0t+i76aoDqlUbespvYEwjxrDdWZQoq0bTp66KvkChRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1mIa9MrqqUEDIVc5iZEApMT+ZHnQRaHBA7qu9NvOT4=;
 b=qmTiCYSkFp3OVDfXn8xp2O4jZM7eJs+iLnVEnjssStdb6Vh/2y0l3X1h3W7fJqSqz8Zwwtu1de7NGbZNzGA1O5sfc/xeEY+Kb7joet5ohCh2uULmer+UCko9ecGQtQEYI98dadHwoJLv+FIM/y/JJCNJ42FwZ13WRd2Ilib1UJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <34703d62-5fa7-41a7-b2a1-ee5a2fe67c59@amd.com>
Date: Fri, 28 Nov 2025 10:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/dom0less: move make_chosen_node() to common
 code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1764260246.git.oleksii.kurochko@gmail.com>
 <84178652f3cd60303ac1e81f36f852bc685e0ba4.1764260246.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <84178652f3cd60303ac1e81f36f852bc685e0ba4.1764260246.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|CY5PR12MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: c550b61c-ba57-40b5-d2e1-08de2e5f942a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFppeS96dTNnWk1RUFNsTUtMeXR3bEYrT0R2SDRNN2xJeDhtTUpYYjRVcm9i?=
 =?utf-8?B?em85QTRRYVFkRmVZR29WdmR2dG9udktaQ1RqRk9PRUFGTzFqMjlub3hEZXJV?=
 =?utf-8?B?ZU0rYUZKZDNJOEFIV1JZejdEQkRaZUx0M1dpTHJnZHhGUk5tK2lJTXVBQ0Vi?=
 =?utf-8?B?S295SGxKN01sRHo4dUhManJpWlZPU01VOHJFbEl3UDQ4Z1ZRcElKZEdCL3BX?=
 =?utf-8?B?ZFMwcVNvd0VIREE2V1JSMDNpQ2RKUXE1SEw3TlowSDEvMmVnT0Q1R05ySFRR?=
 =?utf-8?B?aXBTcmYvd1pEVytLS0E0ZlBBSjBad2pxSlZKSFNocFRwRld6cTAxYmw3amNO?=
 =?utf-8?B?TnBCNHV0R2IyOFFIeExVcjJOZW44VmVLcnpDazltN0tpQkljR2w1ZW9qaXNl?=
 =?utf-8?B?dzVQaGpjT1A0WlpYQy95Z0pOcFlaemxzUjFzbGxtMEpubTMxUWh6K05TSHNS?=
 =?utf-8?B?TUFuZzBmdUxjQjF1QVpwV1E5em1Gb1pIMXBZdjRmdzVqS2huaFBaZGEyY3Fj?=
 =?utf-8?B?M1Jrc2hZWEZEa0p5d2NsaXBPclBnWmU4am0wT01XUGRyWXMzc3hranU4UTVI?=
 =?utf-8?B?ajYrL21HcUxDa3oweVdURVZxSytLcTBOME93M2xIcFhsSkNLVEFZUTdZZG1o?=
 =?utf-8?B?TFZMYVBGM1hqOFhocStnc0MvbWU0UkRqSk1hS0ptTU5Dc1Vwbk9DbFdGc1JJ?=
 =?utf-8?B?Q2xROFc2M0JJUzZTZEpTcXczWTJtQVh2MjFxQ0lEZDVTUTYweHIrMkZ0UnA5?=
 =?utf-8?B?U0Yya01ETExsd2RPdFVRbGN1cUxCSEJySGtyZ0JkaWhQRGNCaU0yejFvTWpR?=
 =?utf-8?B?ZXBNQk0xVE9hcHFYV1Nad2hKZVJFRldLUG9acTN2TlJKbnhzWm5SQndNS2RD?=
 =?utf-8?B?WkNjbGc4L2tKREZBd1V3bXlUTTFRbi9jSXJ3V3N5VzNrK1MyYlIxWWdCbUJI?=
 =?utf-8?B?bGZXd0hjZlhaaTNVWjBlS2hpaE91a3FyUDF1V0o4MGUvUlJSeTNESU9MQVVN?=
 =?utf-8?B?UmtHcnBCOVdhZ3pTTEZDUUMzT0JUS21JV092TUxLR1ZMUGozbHFlMlBYQklQ?=
 =?utf-8?B?YTQwOWFtYnZhdE10NjJ2NEkzWEhFMTFWWXAvSTIvWCtZdmJCL0lwTnpmeG9r?=
 =?utf-8?B?dThtemIyczJwbXNOZlhFeXBRVjlJNExDcnNPUmtOUjZCR1h2MXI3TlNGZzFG?=
 =?utf-8?B?TDBIcE40NEE5UmxSZlNmTVBSdXVFakFRVkh5am1DY2Q0aUlqR25Za0s4cnJI?=
 =?utf-8?B?UDNtRnhhWGxrVjVid2tRL05iNUhmbFNSa0YyZUdYYmtQdy9taytUdThCaXAy?=
 =?utf-8?B?ZjJJbDE3ZUFOYy9hWUlWZ2ltNmlWaG5BMGkyWEd5eGxsUnEyYVhOVE1QckxZ?=
 =?utf-8?B?T1B6TnIxVmY3RW9hUVVKbk9rQWw3V05RMnRzbDNKQmxjSmZ4TnRsMjQrdnlE?=
 =?utf-8?B?SUxYNDR0Mm5GdmxzNVI2UjJUYm4xaHZ6T0FBcGJJdXNKWmlMQ21DTDU2dzAy?=
 =?utf-8?B?Y0pNckYwcjNiT3BWZ3c4UlI4ZEZZdUJ5RTNCc0x0Z0RvRHBIUFRwdVpuczFu?=
 =?utf-8?B?WDZKNzJRa0ZndTc2T1VqRXlLUUNNZGZESTlTTjd0V3NwS1BkS2o0cWtUUkFG?=
 =?utf-8?B?aTd5NE0wcmxCSUNGZm81K1lkZUliREhsUURBdURzMmU0SEs4MnBwNkRrRUdU?=
 =?utf-8?B?QTg2ZGZ4SHB0bC9LeE1GTjB3SkZhZk1lRmtiblRSaldFUERsOFZ3ekhXOHpQ?=
 =?utf-8?B?eUhXS0ZDMTQ5WXJYNjFRWGZYSHZ0d1N6dVVNMEtaN2pVQjlla3RhK1BYRTd0?=
 =?utf-8?B?elBGWFlFLzdadm40Q3NObnZvN0lEa1VWS3hWY1RMUWdWazBwT0czSUNVeHpS?=
 =?utf-8?B?TUtFaGxNWURMbXRjVWJwSGZ5R1hWY21SRWk3cndtdE16eGNJa3NVQWRtMDYy?=
 =?utf-8?B?bjRMS0FIeDhKQ2FKOVpaY2t0UHZiUGU2THY4d1E5OVhML2JWeWRnelRYUS81?=
 =?utf-8?B?b1YzeEYrbkl5S0w1a2pIOHdGUHpSVFpHeTF4dGpHWng2QkVqbnpHVDE3U0Fi?=
 =?utf-8?B?OWNaOTVuQmFOamlXOHhWQ0hVUytuV2M5OUNHV3hXTkUvRWhVZmhyNGl6dTI5?=
 =?utf-8?Q?RaQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:21:57.4456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c550b61c-ba57-40b5-d2e1-08de2e5f942a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6575



On 27/11/2025 17:26, Oleksii Kurochko wrote:
> The current implementation of make_chosen_node() does not contain any
> architecture-specific logic. Therefore, move it from arch-specific
> files to common code.
> 
> At this stage, there is no need to introduce an arch_make_chosen_node(),
> as no architecture-specific customization is required.
> 
> This change avoids duplication and simplifies future maintenance for
> architectures like RISC-V and ARM.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


