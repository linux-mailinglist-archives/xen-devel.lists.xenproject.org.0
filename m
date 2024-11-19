Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B29D2293
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 10:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839848.1255630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKfV-0001Z3-9D; Tue, 19 Nov 2024 09:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839848.1255630; Tue, 19 Nov 2024 09:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKfV-0001Vw-6b; Tue, 19 Nov 2024 09:37:09 +0000
Received: by outflank-mailman (input) for mailman id 839848;
 Tue, 19 Nov 2024 09:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Qpl=SO=amd.com=Luca.Miccio@srs-se1.protection.inumbo.net>)
 id 1tDKfT-0001VO-CA
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 09:37:07 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:240a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d23eb244-a659-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 10:36:59 +0100 (CET)
Received: from BN9PR03CA0280.namprd03.prod.outlook.com (2603:10b6:408:f5::15)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 09:36:54 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::a8) by BN9PR03CA0280.outlook.office365.com
 (2603:10b6:408:f5::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 09:36:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 09:36:54 +0000
Received: from [10.252.149.239] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 03:36:52 -0600
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
X-Inumbo-ID: d23eb244-a659-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwYTo6NjEwIiwiaGVsbyI6Ik5BTTA0LU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQyM2ViMjQ0LWE2NTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDA5MDE5LjgzMjgyNCwic2VuZGVyIjoibHVjYS5taWNjaW9AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NugkcZLAA63JwMXDdRkB1yQCMJJSqyO8n1OKynQkEjONjpfJLnAIEL8PaDdjCc804AdrLz9oBmujCHQbvB/ROmJC1H5aJ+EQAjc6ZI/iWsob/q9nSys//H9JJLo/oIm98Q1RDzxMEhRUh1qOLcaOYtM0s/Q+gKmoto76fDu7cUY3kGCWP5XnhU/GLvXocO7VQy34EYDW7JS0JI4p2jFn+SwjHFMkKtZ8TUonaSITlqsnBEnKsWzWsTHSIJ9rYhLiKgrD1Te+fxLxa6XbNtQNErivTAM0kQSZgCbYZyzv2HaraAmvasbTpfZuf3T4mXLO2KWPp598iEatcDPAqSabCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC8+7P4BZ4TtVH7pSD2h0XJoYBoRY8fes6yNWaAApKs=;
 b=dH1uF9ZqRO439Xe7RBPclkTNhWNVzs5ccRa+SziXxsTdLvOTMrnAvJCHZu0MDb4eocp7rkPftVy+tZbTa0qiIyq38QGxrYt0z7jfrxnUUIxN3Nodfl4AtVAQltnqWsEjFtO6Ina1M1Km9XWlRPXA1PDQam99f0sdLNc9fOZtG+oEotulgnO9bMwiuEVcpaq23LR8A5dhKDGCL8xSjC/8KGQL0l0yODt7U5M/mIZysnE49A8QW91b5PahcNAvcYsY6yTFH5tZ0TC0icoHnysAoFY9lATk9NrE/njStu6/le6Qbbva3Jp3LDF6XORF58IiAOK3keFvC1FYZuWK19EaDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC8+7P4BZ4TtVH7pSD2h0XJoYBoRY8fes6yNWaAApKs=;
 b=WFzc5vlyZykuUS3/3Gal8uTobrLyhuTIm1mG2vVjk0/QncDKrtbNlRf1/FQKPZFpN09FrMX6SWQG1u7Og6tOlU3HznE50AkMd7m1ztzzebQ/5yUOVOdHivn3alOW/0QoxRQxjgKWLoaSS5Las7wuzmtIR43Al+ReOQrMFsXLrWE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c489a328-3d21-450c-8f1a-d8235166971a@amd.com>
Date: Tue, 19 Nov 2024 10:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] UBOOT_SOURCE/SCRIPTS variables must always be set
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>
References: <20241118141205.3513831-1-luca.miccio@amd.com>
 <alpine.DEB.2.22.394.2411181620500.1160299@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: "Miccio, Luca" <luca.miccio@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2411181620500.1160299@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 55442cec-aa98-4110-8c41-08dd087db40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bS9xOUh2QklGUWNDL2w1SDZJQTNiTXNmT2kzZXBHSFpxVDF6eStWeXNFbDZm?=
 =?utf-8?B?ZW0xQ2RCMGJReS8xWFhLajVxVjAzS1ZYbjBKRGxwUmJuNzN5T2JTdTBEZFRI?=
 =?utf-8?B?SGNRWTB3MEZtaXNUZ2JsUFQvb09xZi9xVnJhbm5qdlduWTM2ekRiQU1FMlRP?=
 =?utf-8?B?VkVaTVhscyt1SDVsTmZacDAzMjJHcGNkV2VETnNyTnF2ZGhyZm5DSlFxd1Iv?=
 =?utf-8?B?aEJkNllwS1V4ZGt5RURqN1hjTmxZdGFXUC96bjZxbE50V092b3dRMCt2dTRx?=
 =?utf-8?B?ankyK205N1Bid3dCN0daUENwc2tiUWc0WjVZdm5ieTBGQVdpK2FHTllMWHpj?=
 =?utf-8?B?TTBmbjRQemx0SWY2Rk9XcnZhUkxrTHRPOW9HR3daYk85d29wUjY4ckpCWlha?=
 =?utf-8?B?VzhuZVQ5MVRybFZtSXJjQzF1ZDFod044c3VQazQzYW9FQXFWY0Z2OEVyck1z?=
 =?utf-8?B?MURFOE1PRHVnWkZxcHA1SlpzaU5QVkRXbkxoSkE4UmlNMytwYUd0U2ZjMkV3?=
 =?utf-8?B?QmtHVlNLQ1dTcVRoWEpQb2tldmo3d1F0YzhIUFpESkxjdGdzWDIzSkc2KzhV?=
 =?utf-8?B?OGNOVUtDbHBaTy9SMlVPc3VBVGZKUVZrYmloRWxQVEZlZFNNNVl1ZVIxRDRL?=
 =?utf-8?B?QkNrOHdTSzZROWYrUE9KOHhKQkQrN0ZueEduaGRTQUlUeXFsbHZQdDVsRVpj?=
 =?utf-8?B?aEl6eXhvNXdvN1RrT3JDUzl5OVI0aVBBNG5JUE1OV0RITmZ4aXZZU2NSaUhE?=
 =?utf-8?B?bzF5cjdRWC9JVGpwbE9JRG5CZk5USUNnSy83MVRNZnQ4Rk00K2JLa2c3NWhO?=
 =?utf-8?B?Mk5BUkkrQ0t0QklXeHZ3bVVGL3c0OHdlODhBWjZmelpkMzZ3ekw0OUpzYTgy?=
 =?utf-8?B?blpHYmtXZjlaU29Oais1WnM4dXdLd3JPbFpCVkd0NUc2ajdEcUpCdjJjb1NH?=
 =?utf-8?B?OHZ3MmErV1RKcGtEc3I4UjlpaHl6bm5mRG1BdEFHWXhDWWZ3NGU3WUh1VHpw?=
 =?utf-8?B?Y2ExcHJBdmpuUDNheU9ocjBDRFVYQTFNeVRIa0tZOGk3YldHcnRTdm5McmtI?=
 =?utf-8?B?NnBheGtubmlUSFdON003VFlzdmZ6RUQ1NksyOWdDRXNwdWVoUmdMajZtNWNH?=
 =?utf-8?B?dzErRzA3NUF0c1ZtZWc0aHlZUlhxR2VoTWg5VU9kc1BVbU1sTzB6dEZ1M0F4?=
 =?utf-8?B?Rnp2NHFDSGloR3JnSFcydGhoN1Q5L2ptbXZ0bTAxRGJmSnZLZTJSR2NMODJa?=
 =?utf-8?B?MUhGTEoyaFUwTURIU01FOVU4MVlzS2FMdVF6ZUEwaDdwVlRHZFdoMHlUcERv?=
 =?utf-8?B?MHZlZzB5YTBZOVlKdTQ4TXBEYUxXNkNjakQzd0p6VS9DWHRyelhKK3Zpdmg5?=
 =?utf-8?B?dEJBMTV2b3VlWnJWaGlTSWl5alV4ek1pVlhsQXFGQmJmbzhyMVdlbE1sNS9X?=
 =?utf-8?B?N3VBTUdVVGJEdjM2VXdHQjZwK21FSUY1VHZ6VUxQdjdZZHhGRlo5bXdvL3Ri?=
 =?utf-8?B?cGhud1c3NGtWUmZTRmdpR3h5QXNUZTN2WSsxTFVwVDVFamJPSzBIWng5SG45?=
 =?utf-8?B?NjRLVHlsUHpTM1dBVjNNeVFibmRQNEFOUTRwSGl0VDlSUTZYS2NkeERkc1V3?=
 =?utf-8?B?VWx1S3c1YUFWYzgweVFRWHFHa0V5UzhqS0pmSk5FMFY3TUVoTk93M1NFdDdx?=
 =?utf-8?B?Z0VLZncyL1d6TFRUMEJRWGsySWhBdEhqVVpMTWVjMlkyY05EYktkNWhPVy9O?=
 =?utf-8?B?WDVlSnN2T1g3bmp4aTU3Q1A4c2phTGJOS2JTNDRDOWFLbWpxUFF2cVk1dG1L?=
 =?utf-8?B?UUpzY2NNNndjTVhhZU9aQi9md2pnV0p1VEpkTzB1OXlmNmY3SVk5bHF5V2gv?=
 =?utf-8?B?UFQ4VThnZUpYczR1TS9FVUZhbjJtdU9uL05WNGd6T0tMS3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:36:54.0130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55442cec-aa98-4110-8c41-08dd087db40b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893

Hi Stefano,

On 11/19/2024 1:23 AM, Stefano Stabellini wrote:
> 
> 
> On Mon, 18 Nov 2024, Luca Miccio wrote:
>> The current README incorrectly omits the need for the UBOOT_SOURCE and
>> UBOOT_SCRIPT variables for uboot-script-gen to function properly.
>> Moreover, the script silently fails if these variables are not set.
>> Return an error if the the UBOOT_SCRIPT variable is not set and
>> correct the documentation accordingly.
>>
>> Signed-off-by: Luca Miccio <luca.miccio@amd.com>
>> ---
>>  README.md                |  3 ++-
>>  scripts/uboot-script-gen | 12 ++++++++++++
>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/README.md b/README.md
>> index 4fcd908..ae2fdfd 100644
>> --- a/README.md
>> +++ b/README.md
>> @@ -272,7 +272,8 @@ Where:
>>
>>  - UBOOT_SOURCE and UBOOT_SCRIPT specify the output. They are optional
>>    as you can pass -o FILENAME to uboot-script-gen as a command line
>> -  parameter
>> +  parameter. It has to be set either in the config file or CLI argument
>> +  though.
>>
>>  - APPEND_EXTRA_CMDS: is optional and specifies the path to a text file
>>    containing extra u-boot commands to be added to the boot script before
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index dcf5bdb..b07cbf1 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -1210,6 +1210,18 @@ then
>>      UBOOT_SCRIPT="$uboot_out_opt".scr
>>      UBOOT_SOURCE="$uboot_out_opt".source
>>  fi
>> +
>> +if test ! "$UBOOT_SOURCE"
>> +then
>> +    echo "UBOOT_SOURCE not set, either specify it in the config or set it with the -o option"
>> +    exit 1
>> +fi
>> +
>> +if test ! "$UBOOT_SCRIPT"
>> +then
>> +    UBOOT_SCRIPT="$UBOOT_SCRIPT".scr
> 
> This doesn't look right? Did you mean:
> 
>   UBOOT_SCRIPT="${UBOOT_SOURCE%.source}.scr"
> 

Yes you're right. It's a typo. I will send a V2 right away.

> 
>> +fi
>> +
>>  if test "$fit_opt" && ! test "$FIT"
>>  then
>>      FIT="${UBOOT_SOURCE%.source}.fit"
>> --
>> 2.34.1
>>

Thanks,
Luca

