Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFF8BC625
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 05:17:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717184.1119169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3orK-00067R-OJ; Mon, 06 May 2024 03:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717184.1119169; Mon, 06 May 2024 03:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3orK-00065v-Le; Mon, 06 May 2024 03:17:46 +0000
Received: by outflank-mailman (input) for mailman id 717184;
 Mon, 06 May 2024 03:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3orJ-00065p-Hk
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 03:17:45 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 333d6ad2-0b57-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 05:17:43 +0200 (CEST)
Received: from SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 03:17:39 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::6c) by SJ0PR13CA0003.outlook.office365.com
 (2603:10b6:a03:2c0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 03:17:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 03:17:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 22:17:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 22:17:17 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 5 May 2024 22:17:07 -0500
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
X-Inumbo-ID: 333d6ad2-0b57-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbgZPesOC2rLzdSEt85MtUh/n6RTz/M74Wss+KVb7zUL4E8LkRAdqa4zzzgq65tgKu9zGwzyZecZSL40xqhP3X6Xp2LKZA6j7igougWAv9Tg2fXDzCuETkzF+HSXR8Mmo3zNng2Xcvmo34dRSrZ5i2hm0oMhfaEzjjQyhsPpH2L4ZeauyTSIOJXwyNUKZIOOiYnMiQNSDChVKHZEhqcZ1ZzF0ji866rnCYjct0dHjgAtt0pvj1yHxf9KgGH+OoykQucK7GXA7nA3YItxSmQU5jciIE28HjkWLQtUwTHsmqiD8gxTzEGNB0d0WVAn9mt4lqXOpcueCVDWixyLv+Bvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3hk1YdDFiTAoBiixgOKcQVHRL9CcqXxHTnZ3dq1RBs=;
 b=Naux0+UvGuNJ3MWeLUGQGupYhirlQ+wd/+kztJh3DcyIbaXDG3I9R3NYuMivuKO6wiPQKZSSzHamimWdhv5TbmNhIjvEaacy6ANbVHaK06cENb3h64xKDy1DzpA95Mpxo4d77rIZVw/nFv8sUSyxUWOFRoh85XxPTdwPCvqdyvTHXGoBsakLD3OKK2NECAhyrsUfG+T7q0d4Ki793+upIpG7bbSj35PtmsNuk7pA88BEO2FYr4XPzNFV6XAkmsH7brbQKn+B3t8b5G7DK0i3+uGbT1f4a1XvlJ54kodSDhMwTewwk41tNjHyzI+pp+E8xC4IAevGEJFEeAWMJ+HVVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3hk1YdDFiTAoBiixgOKcQVHRL9CcqXxHTnZ3dq1RBs=;
 b=HnUbYtU0+ScnUkKOf4b/Vg2QCLlE2T06lH+tRott7mQa0m+CD3BmoockZ8BIGLbSi/2Nmr4+FE1gjuCwNTRv4BTFam/H/248ilRzABJh+lsETS2ZSyIGW5SXNHB0yPpxhMliKFBQpM8aJTz2JL8L0amnKv+3F8duxy3p+r/4EGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5d1848c6-1dfd-4f8e-901d-cbba7c203f57@amd.com>
Date: Mon, 6 May 2024 11:17:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] tools/libs/light: Always enable IOMMU
To: Anthony PERARD <anthony.perard@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-5-xin.wang2@amd.com>
 <7336a5a0-9df0-4e90-846f-9c1647ba5319@perard>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <7336a5a0-9df0-4e90-846f-9c1647ba5319@perard>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|CH3PR12MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: f67f547b-5c71-45a9-2a4a-08dc6d7b1595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFZGcFpmL25RdFFSQTY3QlMrcEF0anNVS1d4WGJlT3NuSGNIQWFvMlA0OVNq?=
 =?utf-8?B?eUo0bFJkUFNoS01BYnh4R3c3RFNGTUhWQVpwM0VOSldGVmtVOUl3SHVWTWg5?=
 =?utf-8?B?U25tdWJQeXVBTFp1KzdHYTF2N2ZuYTJReURnS1NPQ2RwOC9yeXFZZWJQK1Jp?=
 =?utf-8?B?VlNJSm00cmhNUEk1cCtJNjBpV1VYR3VCUEcwdjdNcVZwMmdENzREUUR6czVk?=
 =?utf-8?B?Y2hEU0ZwNWhSM2Nua2hxWUdDTW5DQTFLVVdmRXpQWGE0Nzlxd2JENzRQbTUz?=
 =?utf-8?B?am1PN3YyaGFDOVZzUnNPdzF6ZlErS3JIWjBOM2hHZkh0WmxKQW5udEJRemlK?=
 =?utf-8?B?aWZreVN4OTA3cVExTkU3a2dWMEcxR3Y5TktsL1dVN3cxUThQTnRnZFR4SjFs?=
 =?utf-8?B?RDZ1U2J5N3hDMjRITHA4aWdRc2xxK2lCcU5Dc2dybkJwbTFRU3ZZU0ZsVFpi?=
 =?utf-8?B?ZStxK0c4NHdkS2tDV2dFZjFYaWtnaWlsSU1Ra0lqZnozSVJjaTRUVTMvSmpH?=
 =?utf-8?B?eUw1c1BZMEorbDBSS2ZFYTZ4Z20wU2RWVGpRdmx1OEFVUXArdEFnT2xuOTlT?=
 =?utf-8?B?N3FkWkR6VVJBNEdINCtCbk1IWHhNVy9UZ3QveFE5TXhVdGNqT3RwdGtpalgz?=
 =?utf-8?B?ODA5Y3FKT2lhRm5Sa1YrWGJmWEdlZEQ0OFBZeUhPaEg5ak9LRCtYazk0MzVz?=
 =?utf-8?B?dnIzQllOWnlEQ2R5VHhzN2ZlUkcxSFBEK0drQytvTmJ2UGlVQnRuak5jN0VQ?=
 =?utf-8?B?NWhQamhQY3UwMng5RHVTZWgxN2xjUHA3SHJxdG0xY25ybnJtalQ5eHFHdDdh?=
 =?utf-8?B?SHVJeDVsTXlndmVRUHphaXZ4Nm5HQ0NRamgraFZGY1A0RE8zODBpL24zbjZM?=
 =?utf-8?B?eEEwYnBMVEN1LzlVZW1RemlOZVRFeXUxZ0NnRDBMREcvSlo5UUN0UDJFTlVo?=
 =?utf-8?B?bk04eSs2cXdOOXNnM2FYNFlaWUpVbFhTUXpKWktQdk1MUkdpWUEyejB2aUdy?=
 =?utf-8?B?bjZSbXYyWWxFV0ZuNisrU09SMEc0QWNkL2lUajM0T3hFTWk3ZlZzbHArbldG?=
 =?utf-8?B?QVFmdTdxK3NzRGtnQnhBck1IUUFOVjM4RDdlMlVUSlRvb1RrTTdpKzlNcFBG?=
 =?utf-8?B?OTVnUHB5eGNxc0RUc3pRLzdxVUt4Zy90cUd2WnNqeGt6ZzEzWFFhVDlxTkNn?=
 =?utf-8?B?cXVuakdkZC9GMVo2cWJjRng4QzN3MEx1NHJRUUlwUm5rbHpWSDR2OWZYcnRy?=
 =?utf-8?B?WFVnNDY3YmpMSlFyQzI5TU94SEF5WlhtTHlPSUZMR1F0MjBqWmlBU1NYVGdZ?=
 =?utf-8?B?MDNoU2x0VEFmQTBzRW5tRHJyYVBxcEVEUURJL0dGcTdxVEcwY1ZUQ1Y2Y014?=
 =?utf-8?B?NU03QVJ4c1hlNVRUWDV3LzRQS0E1NTBnb3dtVEI1emdqQ0xPTzU4OEQzcHNS?=
 =?utf-8?B?UlU2TWpQT3piVDlVMnV2NlF1c2FnbHc1LytISnhPb0tHQm9xWDVCeXhhdDk0?=
 =?utf-8?B?NFArNUNrY1dRRmlzOFBiNzErcVNob3hLNUZsQWE3MGtNdERXaDFuVHFRM1lJ?=
 =?utf-8?B?M3NUaDVZY0VrZ1Y0bTB1Y0lUdGtaZW9Qbmlkc0RNYmZXYjk5eW54UkFINUlU?=
 =?utf-8?B?NVF0VXREcWFaaENGY09WUlhYNHBldWpSdUFjNVA5K3I3UkkzMkc5THI3Q3Bu?=
 =?utf-8?B?VUk1VzNoUGc4Z3FteUlveFpEdU9YWnRyRTRSZHowVzdjYy94ZXNJc3h6aTF0?=
 =?utf-8?B?Q3hVMXlEcVNJT1dYZ0MvZ3FWMmdLc1oxRnlUUjVOZG9vU05oRlh3bEFXRnN0?=
 =?utf-8?B?Q2V2bTlpM041TlBGblR2cTZzRG93dldWcGJhUnBGcHd4d1VzdEpJZk1YNmxE?=
 =?utf-8?Q?7TRsBPO2CpOwH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 03:17:38.8551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f67f547b-5c71-45a9-2a4a-08dc6d7b1595
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455

Hi Anthony,

On 5/1/2024 9:47 PM, Anthony PERARD wrote:
> On Wed, Apr 24, 2024 at 11:34:38AM +0800, Henry Wang wrote:
>> For overlay with iommu functionality to work with running VMs, we need
>> to enable IOMMU when iomem presents for the domains.
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   tools/libs/light/libxl_arm.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 1cb89fa584..dd5c9f4917 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -222,6 +222,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>           config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
>>       }
>>   
>> +#ifdef LIBXL_HAVE_DT_OVERLAY
> libxl_arm.c is only build on Arm, so this should be defined, so no need
> to check.

Ah sure, I was just thought in the future RISC-V/PPC may have the same, 
but you are correct. I will remove the check.

>> +    if (d_config->b_info.num_iomem) {
>> +        config->flags |= XEN_DOMCTL_CDF_iommu;
> Is this doing the same thing as the previous patch?

I think so, yes, we need the IOMMU flag to be set if we want to assign a 
device from a DT node protected by IOMMU.

Kind regards,
Henry

>
> Thanks,
>


