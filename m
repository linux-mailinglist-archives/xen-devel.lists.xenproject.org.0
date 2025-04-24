Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC71FA9B017
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 16:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966378.1356599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xB1-0001HK-Dd; Thu, 24 Apr 2025 14:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966378.1356599; Thu, 24 Apr 2025 14:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xB1-0001Fs-Av; Thu, 24 Apr 2025 14:03:43 +0000
Received: by outflank-mailman (input) for mailman id 966378;
 Thu, 24 Apr 2025 14:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s25R=XK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7xAz-0001Fm-MH
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 14:03:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2414::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb6f4e17-2114-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 16:03:39 +0200 (CEST)
Received: from MW4PR03CA0192.namprd03.prod.outlook.com (2603:10b6:303:b8::17)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Thu, 24 Apr
 2025 14:03:33 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::e4) by MW4PR03CA0192.outlook.office365.com
 (2603:10b6:303:b8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 14:03:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 14:03:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 09:03:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 09:03:31 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 09:03:31 -0500
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
X-Inumbo-ID: eb6f4e17-2114-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcYktGYNRU77EubGq5eCbqfJG5WcWrow8pozWEAnCRCUIFPv0PbFIqO/e2essqb8Ul3OIVPAclfry5VWWLuVxzd15OWhvcEpzAw+Q8oLIE0oy9uISIGK4IGT4s8GE8PG2yCHx6/zzSTPiGmVu7pRGrwYvRWXiQqRKKmXiQppypAI4vBA3oPK6wZbLcCgQOUzXZgbFgyU5KXF6+cXLcarXLUVEW9BYlVCSdCLOvHma8UN1BinTbOPWxzrWy6qjRYIQv1RLLC23aT9u5MsuuI7NcFZaZyMXClAh0DQvxXo78Txbo3KF7BWZKtrzHNyrpVXbyiAdNo6huUL3fyloqAJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTQHCu9KWktPy13w/iSWHJooRMu5Pvj4JAIHKDnikFM=;
 b=wnsTrKwHUImcCIieHzOl2S0KJOgrtIZxS+lQqZyBhKyqclr9FIgtWdXx5fWw+sHB0swrVjA07jImep+I+M5IsUSXBGJpkD62rzQjqSeGTUYW1L4+/osYufkjdFrzcZ61a3JPvJjqYEwXxlJieB2er+NdzWIVmBw5lwEHI8ujtVvkrt6aKcbu0auaWoG0yCqVuQVEML1Xr1kkwO/c+3q3TPBbXpPDKo+otW7mlvuToEXsIzOfMXvUlNvePISIRyjCDfZa3Bd5LSId5qFrd1W9znvKXor8vNjRqSJHxNe38AQP2xZpiGzi00pHTQuibMzNX2ZSzub5R4epGYXbc3M6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTQHCu9KWktPy13w/iSWHJooRMu5Pvj4JAIHKDnikFM=;
 b=0PZCk1BomiXe79kXJLusnrMF6aPB7b5fk75tlxHneLShuQAK6d0qVyczel00mZQGgM5nS/lbLQp1PX7X4Zk6cYvBfuDtdbtliaFIdcDg3spk+bzKqadY+qSXm0PQJX51yGirs9O77k53ntcWU/xMiommg0IV1tiNv3kmbKZmCOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8d0e6837-27d9-41b7-bf7a-4f4108a7a84c@amd.com>
Date: Thu, 24 Apr 2025 10:03:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vpci: Fix msix existing mapping printk
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250423212229.32721-1-jason.andryuk@amd.com>
 <fc4bb04a-8d6d-4744-9be3-399aea5081e2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <fc4bb04a-8d6d-4744-9be3-399aea5081e2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 3756d066-6895-40c2-22c6-08dd8338cc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3R2ZmcyM2xyc2Y3a1VTWm5STUhVTm10OFo1Slg5eElzNVpQTXkvblc0OU9z?=
 =?utf-8?B?czNhRkwzUytoUlJYTHU2T0M1WVVUNGFwMTBZdXpTb0d4dHUxenErN1BWT3ps?=
 =?utf-8?B?TTBEaW9KL1lKd1V5SFZnMHNZRlZnaUJJdWtnYmt3K0dzcERhYXNEL1EwVjhy?=
 =?utf-8?B?YythWDdBKzVwY0dDQWxkajliRXBTMzVHT1kvaGlVbXZ0dXhvNitKT0x5c0x1?=
 =?utf-8?B?WXZ6TFlRS2VLOHNSRVNMd2s3TFV2RGU1SjFLVzRLSGpKVjJ0SHgxVFgvNFZo?=
 =?utf-8?B?ZUZ5R2lkM2gzbmxkcG9OZFEyTTVJaXBzM3FjZThKeWVZNWl3UFlzZ0Z4TmUz?=
 =?utf-8?B?bGFqditiZzRZeitkbWdTNW5XS3hORmUrcndwaThQQXBXb0RHUEp4bmhZOHhG?=
 =?utf-8?B?QWQ2UVNoREhBQlV2VGtydHVHRnh0OHNON24vU013QmNicG5FMGdWM1F4UXRn?=
 =?utf-8?B?R0YvVm1ya1hFMmlabUlUUEtSVGcwYnRRTlN4TGQyTWlVTTYxUWFBOTRyazFV?=
 =?utf-8?B?NElIY3JpTzRpcHFoTGdIdnNJZzlNL3B1T0wyRDN6c0JuNHlMTm9nVTVQMlVM?=
 =?utf-8?B?ZU1ncmUrS2dsRm5HRXl3QmJMQWpKVVlmMHlBbnBMenlESVlnRENoTG5IN3lV?=
 =?utf-8?B?cWhxamRYWFhOZzlacngya2xPNUxMazVnbmJrL1NMejAySHZ0Y0tyQ3Q4a00w?=
 =?utf-8?B?RkVVWmYzOWdkRXdwMmlvaXY0S3VwTWRIUG1ZTXU2enczMmNZNHZqSnVrbVJt?=
 =?utf-8?B?YzFiVmxLc1huRzNudDVHRE1KN002K240WWZMUVdQWGdiR1dGYmZhcDk5cStM?=
 =?utf-8?B?dWpscU9lTGt6SFl2bEZuQ3E5MlRaeEpwQUhOYXZEWkNYaE1zNVFwT1VvZXQz?=
 =?utf-8?B?K2JSbytxUTNTOUkydlZQendobmlrZjJmUytuWkRtVnhDQ2U0TERMSVNSMEhC?=
 =?utf-8?B?MmQya2VZTHVSU29yWjhjOEl4cFBnL2xIRHd5YzJyKy9SanZlQU5TUTFISVAx?=
 =?utf-8?B?dHFtVGdhNFNEMyt4RzN3NGRha2hlTzdpQWxnVy8vNnVYNGsvZFY5a3cxUkt2?=
 =?utf-8?B?cmdOWUJqcjRZVkQvTnlOTWFDdmhQKzZYdUVabXJnSS9nQWs3bTNMWkxqN0tJ?=
 =?utf-8?B?cVVMWk16bGh2RGZacUxzVy8vaUI2dWJRU2J4VVJLQ1QrQWd0UHdpZG83TDBN?=
 =?utf-8?B?T1Q4TkpTczU3VlQvMWs5blBuWUdIR21FMUwxSHpMRU5kKzhSSTJWdFBwblUz?=
 =?utf-8?B?bnJUbFowMW5STngrMklHdHNKZXFNYUNFWjBZblh4dDRtNmNRWndwaUFhdE9X?=
 =?utf-8?B?bTBhZElpKyswc2VNOXptRG95R0g0a3Vwd0k3bXk4eFhDUXVtWUhFRUt0aHVj?=
 =?utf-8?B?MStJenUxNng5YytJSkVNN3lwQTR6a09oeDFrTGZtQzRWbER1VURmMXcvVzl0?=
 =?utf-8?B?Wml0UU0vb1Z6dUxycWhCNGpIaFVvdk1MWEJvcnoyYWIxMWptb0FOL0owTFlZ?=
 =?utf-8?B?c05vemtNZS8zaW9hL3p1dHEydFBpTXpxcnliRENiQ3VjVm5aS1FieTViV2RV?=
 =?utf-8?B?SXNHMG54RjBSZGxhZ2JVNWo5aXVwaEpweFRrcktpWm4yeHFjZWtsR1Fpb3cv?=
 =?utf-8?B?Q2pqQUYyQW1MVXVsajEweHNmREh4N0NUUTZwaW41UW5VMjU5MW8zN29XTDVZ?=
 =?utf-8?B?bzRtMndlODV3YjhqQlpJWUNPcnhhNmV2NzRQdnI3L0JPR3NJdlhGb050bWNy?=
 =?utf-8?B?Yk9Uclk2Mkp0cmNNQm92M1lKZDJCUEJTaHhRMGpJVHNBekJLZlBZWEdDSVVL?=
 =?utf-8?B?c2NVL1FseVYxaTQ2QjB0MTlPNmNxcTg2VWlONlQ4NnpWckl3UHh4N3dvaFoz?=
 =?utf-8?B?K21JOFRBaGNha2NRUmh6SlhmQzRJZWt2YXc5OGRISEFITW8wVmJMZ3hkRDNj?=
 =?utf-8?B?QUY4YkdTb0NqUlFwZE1qeUI3N09JWDhOL3hFemEvMDlJMmFETXY3WkxJYzlV?=
 =?utf-8?B?bnBpYk9mazlkT3ZLaTVzNnNLU21JL0E3dlF4ZC9rUzN0TkQrcnNlVEE5T2Fh?=
 =?utf-8?Q?pyURfU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 14:03:32.7691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3756d066-6895-40c2-22c6-08dd8338cc84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

On 2025-04-24 02:18, Jan Beulich wrote:
> On 23.04.2025 23:22, Jason Andryuk wrote:
>> --- a/xen/drivers/vpci/msix.c
>> +++ b/xen/drivers/vpci/msix.c
>> @@ -666,7 +666,7 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>>                   put_gfn(d, start);
>>                   gprintk(XENLOG_WARNING,
>>                           "%pp: existing mapping (mfn: %" PRI_mfn
>> -                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
>> +                        " type: %d) at %#lx clobbers MSIX MMIO area\n",
> 
> Imo this is a good indication that the format string better wouldn't be
> extending across multiple lines. Then it would also be possible to grep
> for it (in the sources) using e.g. "existing mapping .* clobbers".

Sure, a single line works for me.

Thanks,
Jason

