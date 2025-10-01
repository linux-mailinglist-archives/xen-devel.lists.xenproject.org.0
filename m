Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DDBBB0216
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 13:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134792.1472407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3uwm-0002rm-Vo; Wed, 01 Oct 2025 11:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134792.1472407; Wed, 01 Oct 2025 11:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3uwm-0002pT-Sk; Wed, 01 Oct 2025 11:24:36 +0000
Received: by outflank-mailman (input) for mailman id 1134792;
 Wed, 01 Oct 2025 11:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOib=4K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1v3uwl-0002pI-S2
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 11:24:35 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 312a6cb6-9eb9-11f0-9809-7dc792cee155;
 Wed, 01 Oct 2025 13:24:29 +0200 (CEST)
Received: from BLAP220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::23)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 11:24:23 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:32c:cafe::19) by BLAP220CA0018.outlook.office365.com
 (2603:10b6:208:32c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Wed,
 1 Oct 2025 11:24:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.1 via Frontend Transport; Wed, 1 Oct 2025 11:24:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 04:24:22 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 04:24:22 -0700
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Oct 2025 04:24:21 -0700
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
X-Inumbo-ID: 312a6cb6-9eb9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1ikkegCF/wWjmfChu03JbGMCC9Oa4GNkD7A5lHk8Q+Uc/BB3BpCNF3N5+uzVHZUXVXT7mBNsbFcY0DJMqitIe2s6bF7Eonr2IK+hav7zS3OZi9CmXhGj/Kn9KQ6PG72mFf4MIH2UxXeFPQtUluAkTyLh8SZ5iWhrKuqTLS6RVsvS7cCu5idEeI9p3b90g2rAPB+3fAWNeO6ydRJEX6SHt+ijHT38zepD5WmjB7F62us3K23LBEPTg1Pan0EZF8xENUvjmk5zmPOp9c10rJqdrEMZKW4Rb4yNC+4Cnikps6mT0NJpdzMe9sg0PbURd7cuDKIsOqK7M/8BPD2o+ZlGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K76MlRObKdsbphfoXgvpDhn2rRXsy3ANcImePM5vvGA=;
 b=RcJ19/CqzAHVnweganYZzTM92fHg69Q/9lRq0zMYeqipzx4LrX5lbwDqm1fwtfq6f7uhzCO/qCVdwSvFxLtexrw0EfFF/yMk5dZxmiK7Bg+D07ZVceDPkDPykKzQ3h7w5SUvoaS1n1ULgKbQqBNZxqhpDg1NEwMn4BdyZgKv8+YwAhHTZb4hzuQVT/h61NrRLSmiDvTWm0QeJuVeMw3x4X9LaLUraDvCIvP8ydD/gb025i7qS0xwcqu2E441SabDZd57vBxGO7Io4e4stKLvm/pYLY/cRGGP6aaPVrV/+20aB4abqUspMbIvb3RhZOuBffQGXIQtvaGyJMB5v5L6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K76MlRObKdsbphfoXgvpDhn2rRXsy3ANcImePM5vvGA=;
 b=g4Z4muNxRTjjMZ2aDh/FEf3ipU7XLh278r7ydjrrMYzLotcgWFpr9robTIqcZSaFXm7TEolhDuKuH/utml+4hkVm+RF/FW0NT+5bDZWTPfPSr9eDQckTkNax4U20dyjb9b6kIWSmxih47azrN+4mGfRjt8Igb6Rq9Tvet+oxOO8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a54d9baf-839c-43a6-836b-4ea9decd172d@amd.com>
Date: Wed, 1 Oct 2025 13:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: init-dom0less: Replace err() with more informative
 messages
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
References: <20251001075149.31545-1-michal.orzel@amd.com>
 <DD6WJ6AVBQRV.154QDILMV3EW2@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DD6WJ6AVBQRV.154QDILMV3EW2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: e5de3ac9-1d61-4788-d669-08de00dd125d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHVRT0tuTldla1VpUkIydXA5WE5FMys2WkFVZWlYdUIwUTlTd1NkcXNoNVRr?=
 =?utf-8?B?dWNVZHlsRjNOSWtBeHJoS3QrdHM2S09WWnZvT1BNSEVYUTZBK21WME5TMVYw?=
 =?utf-8?B?MHgrbFNEYUNUT1FsaStuYklhN1REdnMzeVE1M0JGb0x6Mi9xLzJaZUNheFZ2?=
 =?utf-8?B?cjRxdW5PWkhLNGhqVHBsalpDdEVCdmxUTUN4SEFkS1d5R1oxZXljb29hUUQ4?=
 =?utf-8?B?UDMxeDZiVldHNE5Ec25zdFlWWThxU3kwdjNRdE1iWkdyT3NZc3VTcUZHRVZO?=
 =?utf-8?B?M3lMaWtWM21uSXAwc2NkZjdXaVdYbGY0cjczNkIzSlNzZW9GUlF3VlY0R29N?=
 =?utf-8?B?Z0pkNDFBZ2lmMFBRUUw1czRVeWdyd3dRVUt0ZzFCSHJxZjlmaFJsSGRnNXBC?=
 =?utf-8?B?QlNnV3J4R09jMW1YU1ZwWi82akRldWMwdS94YkRuWU80ajB2ODZDWkg1WnZ6?=
 =?utf-8?B?Q1BMOHVyVytXaGNNbzdSaDQzYWFkellROSswdWNxYkZJMXhHN05vOFBKYVR0?=
 =?utf-8?B?K0YvSkJFS3g1UVA0TDZ6SkVlUktOTFV2TVFhMnFEQjc3NkxaelNZVndjYlkw?=
 =?utf-8?B?REs3ZmZoeWRjV0t4N3VLWFZ6ZjV2em0rS2d6bTc1TjRodkVOTWlYSHdFcFlX?=
 =?utf-8?B?dE5NaWZpMktEUEpxWm9yVUQzRWlxWDYyRXg1Z1M0YzdCQnJ0MmtsVi9ybHFr?=
 =?utf-8?B?eXBiUzErbytrZHVHSjllSGhla2VBWVdHaFd6ZTRaTHRsbEVHVGpUVXd1M2w4?=
 =?utf-8?B?YUozRzdwbGtuSEQ0VW5UalFaNG10Wk9sT3RxQmR4R2FoZGNqTkl5NzA4YjhX?=
 =?utf-8?B?K3JyODFwWENicnZzbGJBY2xSM1EreGFzTW1EWU9wSGs2TFo2Ky9pdzdlajZ6?=
 =?utf-8?B?L1NXUXkvd0svTzZscW1VNjU3YnhFVlR4eXpnbUtWZ1lGeDFqTExtc1FPRzln?=
 =?utf-8?B?Rkh5RHBwbXpUNm80bzhFMWJ4SmFPcFJ6KytKTi84Ty9zK1FaWlVPaytoV1du?=
 =?utf-8?B?ZVhJOVVPRGVLeDZXU2FiclpDS21uREpFVktHb1NYZDJ6a1NSU3VlTG1iK3JC?=
 =?utf-8?B?NkRKQS9VcElLa3EvNElBMnpVS21GcVludlNNeWlMZWt5clFUdDhZWFdsaGhp?=
 =?utf-8?B?UzhyNlQ5NHo2SUREckx2MUhqRWN1SUZQQmN3MUxERnFDa0NlRkoyWnNsajRi?=
 =?utf-8?B?N0xUd1BSRHdESjZOdjh0K1lRaXJkSUJXNU1YRDR4bHNONW4rMFA2RUx4UDRC?=
 =?utf-8?B?MURXOHo5cXRLd2lNeTFaS3NmTnhqRzA0LzY1cVE2LzVvczRmS3BKcm1vNGoz?=
 =?utf-8?B?WlYzcEN6RzU0a25HQkNZWE0yUTZOeW1vZnRwRTM0d2VXOStVdUlPOFZzM256?=
 =?utf-8?B?dW40NUVCVUJuVHNnTzZML3RzVzdFTXhYMHFTTHovckREem0zMFVwTXE3eVZq?=
 =?utf-8?B?K0pLTHJIOGpNa1hYWGFidmZvQU1BMFduMGFYb0hrUmdOaGFiUDJXM2pOTXVi?=
 =?utf-8?B?UVJlNHNGWVduZ2o1ZkovTHlqdjF2L3VRTndQZ2QzR1AyUVdtZVpQMDBxUnA1?=
 =?utf-8?B?aHVLK3VPNXRZais2ZjNITVJ3Kzd0dmp0dEFMdGpORkJCcFNENGc1TmtySGZI?=
 =?utf-8?B?TENOeUp5VUFIMDlUSmVWTUtvWXpnM1RUTklreWFoYW8xUG5KbW9KemFrMHZz?=
 =?utf-8?B?blNVZEVmTU9uY3RUcFhBSW5BeGRSZy94OTdueVZERGZaVmFHZ0Q0ZjVqeDlF?=
 =?utf-8?B?UnRtUjdWUjFsc1Nya1h5aE1oaGhkUnNaVkt3OVZIY0JuS3AzRytNOGtGb2JZ?=
 =?utf-8?B?SWVPNGE2RHdWNFM2cDVaK3BqZVc1SGlPcml2b2RiVDJVcnQ1WTZ1ZnQ3aGhP?=
 =?utf-8?B?NXduVzVWQUV4bXQvRWllLzFDODlMZllRdGlCOUJhckRtY0o4R1pLZUw4MjRX?=
 =?utf-8?B?czg5SytNR0hzRmxCU0cwTXYrNzJVQUxXVDRZSmxjdklLRkRHb0tYNGVENHhy?=
 =?utf-8?B?UzI0VTR6Y2I3ajVWb3I0alltZnJwUUh2TVViZ2ZtRm16REpYSDRJR0l4OUcw?=
 =?utf-8?B?Z2JtRWl4emE3dzVUdU0vdE95R3Q5aHFSbnVvOWI4KzdKMm1WNWlsQWowcmNi?=
 =?utf-8?Q?xMEs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 11:24:22.8671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5de3ac9-1d61-4788-d669-08de00dd125d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195



On 01/10/2025 12:09, Alejandro Vallejo wrote:
> On Wed Oct 1, 2025 at 9:51 AM CEST, Michal Orzel wrote:
>> Current use of err() has the following issues:
>> - without setting errno, on error it results in printing e.g.:
>>  "init-dom0less: writing to xenstore: Success"
>>  This is very misleading and difficult to deduct that there was a
>>  failure.
>> - does not propagate error codes to the caller.
>> - skips "init_domain failed" message by exiting early.
>>
>> Replace err() with more informative messages propagating rc when
>> possible.
> 
> Sounds good to me. Only suggestion I'd make is to also print relevant arguments
> where needed, like...
> 
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  tools/helpers/init-dom0less.c | 25 +++++++++++++++++--------
>>  1 file changed, 17 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
>> index a182dce56353..3dd2d74886eb 100644
>> --- a/tools/helpers/init-dom0less.c
>> +++ b/tools/helpers/init-dom0less.c
>> @@ -288,24 +288,33 @@ static int init_domain(struct xs_handle *xsh,
>>  
>>          rc = xc_dom_gnttab_seed(xch, info->domid, true,
>>                                  (xen_pfn_t)-1, xenstore_pfn, 0, 0);
>> -        if (rc)
>> -               err(1, "xc_dom_gnttab_seed");
>> +        if (rc) {
>> +            printf("Failed to seed gnttab entries\n");
> 
> ... also printing the domid and the xenstore pfn here. Or...
Domid is printed from main() before everything else, so no need to print it
again. Not sure why we need to print pfn but I can add it here if it's a must.

> 
>> +            return rc;
>> +        }
>>      }
>>  
>>      libxl_uuid_generate(&uuid);
>>      xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
>>  
>>      rc = gen_stub_json_config(info->domid, &uuid);
>> -    if (rc)
>> -        err(1, "gen_stub_json_config");
>> +    if (rc) {
>> +        printf("Failed to create stub json config\n");
> 
> ... the domid and uuid here.
> 
> Similar suggestions for the other printfs.
> 
>> +        return rc;
>> +    }
>>  
>>      rc = create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtchn);
>> -    if (rc)
>> -        err(1, "writing to xenstore");
>> +    if (rc) {
>> +        printf("Failed to write to xenstore\n");
>> +        return rc;
>> +    }
>>  
>>      rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
>> -    if (!rc)
>> -        err(1, "xs_introduce_domain");
>> +    if (!rc) {
>> +        printf("Failed to introduce a domain\n");
>> +        return 1;
> 
> nit: Maybe -EBUSY so it's -errno like the others?
There are other places in this script where we return 1.

~Michal


