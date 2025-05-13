Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1CAB5649
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:39:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982843.1369192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpqc-0001Nm-8k; Tue, 13 May 2025 13:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982843.1369192; Tue, 13 May 2025 13:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpqc-0001MK-4u; Tue, 13 May 2025 13:39:06 +0000
Received: by outflank-mailman (input) for mailman id 982843;
 Tue, 13 May 2025 13:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ffC3=X5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uEpqb-0001ME-CQ
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:39:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a17e3fba-2fff-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 15:39:02 +0200 (CEST)
Received: from BN0PR10CA0008.namprd10.prod.outlook.com (2603:10b6:408:143::27)
 by DS5PPF1ADAD2878.namprd12.prod.outlook.com (2603:10b6:f:fc00::646)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 13 May
 2025 13:38:57 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::25) by BN0PR10CA0008.outlook.office365.com
 (2603:10b6:408:143::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Tue,
 13 May 2025 13:38:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.1 via Frontend Transport; Tue, 13 May 2025 13:38:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 08:38:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 08:38:56 -0500
Received: from [192.168.94.239] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 08:38:56 -0500
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
X-Inumbo-ID: a17e3fba-2fff-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koZDTQbC3aCSbV5E8VjuMfPOacq1poNuzD4nno+Oc8eNCvRcQPkcEy72CUchFnbSiNbWPNqJRkyP7K+M4OBi+QKeoP7u5sB17B04K2dvwzojypjnqUMARMD0Bd4xCrZGLCgeemZh9w7hAfmXs7Sb0Le82QEVcWJvcAQ/vvKVMPREJnxeDmpGaftZD26YvagfR9AvsQ+oBWIC8zG/EkzsBkVIxkhvicBbkQViur4jlh8yWI+jVugq+dbTDAv1kp2opaXguR0nVKcyBzvYhddYVd6Yp5D2pxv21y+pNqx/gie4z8/RjsHgKKy544MJg3KrNxsAd6H0cEYuzgrzvbcOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orluJ8TcxPOIyUFAoseuIzVylR2FrEPCWeTZIvbzfqc=;
 b=xHo2s9TJezVmlpXa1ZlxODWIJEzwhX7vrWi/6UlPDixUgxKnbkOviuadH15cuhmkDIS3Mr0IFIb+t+OerVsPfpiWOvbnIKIxLSJ82iESHI3o7K41/mGRyxiptc8zStJB7gP3xfypB/+V2G5h2W/6qnNKANyRl6Vna6LcTz6tr9IzNeqofTSlwgVeW+qRWuKgzWpM47Aw6gkYI9wYxtDUYeWNc66awbHw1PN6OGAhCCqbuM4+lb/5XuJE/ZJjLLXCEoQTY2+ZjpTvlgdt74wu0Ik5RtdUeyWRTB/3yhZr+b+YOZl4t8uNA//hSHjeWsfCmyStlFQo8eBtLgZ8VNBZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orluJ8TcxPOIyUFAoseuIzVylR2FrEPCWeTZIvbzfqc=;
 b=xsLogA4NedjxkHVNlQ9SfEl8Vn8PCpNa9NhKLtUyveX2YE/x5WMAuEc0+6W8cIRGmCAyP9vZ3wep1l8uwSwzyRIeBnodKhg1ii4t6iTKAj+Lh/MsWTPkJSzPjNsPy/fEPx9AchG9uqh10RAsriFW1gXkWtMdo+Ukl9gLqt1B2Iw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <fa96bd97-8938-40c2-bd11-1dc809af487f@amd.com>
Date: Tue, 13 May 2025 09:38:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Only access legacy altp2m on HVM
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20250512235409.18545-1-jason.andryuk@amd.com>
 <d7fae914-392c-4f5f-a769-194673515901@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <d7fae914-392c-4f5f-a769-194673515901@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DS5PPF1ADAD2878:EE_
X-MS-Office365-Filtering-Correlation-Id: 428e8d24-2eec-4907-3ca7-08dd922382fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUdOYWJHMERta1NGTExjWldGU1ViblB6eVY0NEpYZXlNbkNTeWo0ZVQ3K2Vq?=
 =?utf-8?B?ZW9yY0dTSE92eTNodytaM1NiQWZ6SE1YTGVRL0NZTFY3Y1ltekJzR0hUZlFm?=
 =?utf-8?B?ZzZXL1d0MW9KTHIzYVk1NCtOdXhWQU5TR05oQzk3RzBlVXIwZ1EvUU94RStJ?=
 =?utf-8?B?cnFCQmxjNjZ4OHBnUVg4blY2ZUtPcXVDRHRydkp3REVmUDNrZkdhRnNBUkUr?=
 =?utf-8?B?TEtGZFBaZjlxRmFuVVVWQ2NKWm1hdDF0UjlxeDRrenBESDN5VVNMRE9hMFRX?=
 =?utf-8?B?ZUd6eXc4QVVrREhMVzYweC9CN1ZaTDBaYlRGejJHMUw0elRXWXVoVitLL0Iy?=
 =?utf-8?B?NU1SVm1SUzQxVW9RaVFqaytzQjhBYU9RR3NNbUxNQjlOZVRyRzZhRFBHQkZU?=
 =?utf-8?B?dmlmWFpxVVNkUVc0SnJxVzdsVWp3YWl3eDR1cmN4WEQ0Sitjd3dLWnpSaStS?=
 =?utf-8?B?VkpENW44VmlKUUtnTGZRVHhwTjQvV2ptWDFNelpCWTBGdExYbjJSeTFkSkNT?=
 =?utf-8?B?ZFc5THkrSGRtSWFjcVc2UUtUL1k5UjUxT2tOK2dJc0hSMXE2UEowU1NZWGhG?=
 =?utf-8?B?eE5qamc1YmZVRlhMKzRGWUNOeGJIUTZqZUsrMCtESjdCZUVGaUorbXdZMC9W?=
 =?utf-8?B?OWZnOEYzN3phUkkyTTFyRFZJL0xUTnkzS3JhR0wwMVlMMWpzK3VBaUU4aVY1?=
 =?utf-8?B?a2YvVVNDdGxSelFJcG5KekxBSHBTK085aEo4emg0NlE1c3k2c3VwK2ptbDNt?=
 =?utf-8?B?dU5KVXNjTUQ0cGIyaGU5UU9vejQ5SURuZVl0VllWd2lZQXpTS3U0WDltK1J0?=
 =?utf-8?B?ak9yNHV2V1VBUzJGSTBsT2x4ekRMdFJNRTRmbFFwamtCM3NRa0RwRjZQQlNP?=
 =?utf-8?B?WkQ0Y0VYMlhOVmYrL0IwMkdRY0YvVE84bFg5Qkt0TlhrSWxBa1RJbHk4VEto?=
 =?utf-8?B?YUYrN2QxQ0U2Z1VHd1hjaStWS0lLbnRiT1NQcnAxbzduaEpFWUYzcXArVEIx?=
 =?utf-8?B?dEswYjJ1OUJBSHU0a0lmYTlXbGxaclNjS0Q1L3dUSTY0eHJpMXJKNzZwWkpa?=
 =?utf-8?B?NFcwZzZ0cFRCWVBQZWhreDVvYVZrY1lyUXd2MCsyWXRiRkpkYzRiWS9ZMGFJ?=
 =?utf-8?B?UnpqR2pVUXNtZ2p4eFdaWFp1VVR3cHAzb2R3TEZEa1ZYYmYySG96dzZaMHh6?=
 =?utf-8?B?QkNVZUduM1k3clhDV01Ick9tUUI0OGY2ZnhRZkU2VzJibTI3anlnQmRpVllB?=
 =?utf-8?B?d1VjRkJINkdtSnZsdCtlOWRjZ2dUQlJzTDJRa1BIOW5kM2h4Qk05ak0rR0Vv?=
 =?utf-8?B?bVBCeG1aMDhCS1FZRzIwYlJYbmhCc25lTjVYWDBKOGdLRTV4M3M2YVFkb2h1?=
 =?utf-8?B?Wjk5Y0lOVFhNTXRPTHQ1b0R3S0JUbHJ5bk1VY1F2ZE9XZnh0S1ZwTk00eGZK?=
 =?utf-8?B?SE5kU0ErNmZZMVYvNlpET0d3VXBIWmhVL3R4ZDRxWTQwWVFGWVkzU28vam94?=
 =?utf-8?B?bHNjdWhKcUFrMGZoZ1I0L2JEUCtBN0VpWjB3Ui9kMk95TGEzbitaTDNyMUdp?=
 =?utf-8?B?NWhac2tDbEkvbk1pSHpBTmdranQ4MHB3TEJ0Z2oySXM2eFRrc3k1NU1UU3VH?=
 =?utf-8?B?T1c1TzFPRlZMOTNXUU83VDZzOHNNT2ZmVmNSQ2FhUU50QTNNbG02UmE2N2lG?=
 =?utf-8?B?UUlvUlRkZlRkb3UzbWN5dExDbHNtcHlzS3VSeG9yMkVEVlNrb3NzdnlzV0dL?=
 =?utf-8?B?KzJXeXFqNE1nQVVkK0ZGaUJablBRZTFVcktKOVhvSmRsMlA2YWI3cWpDcVpq?=
 =?utf-8?B?S2l4Y2lWNHBDajlHaUxjZWV0c3cwL1V6ZW9hRXFsSUZqb1k4UXRsTW1oMkZ0?=
 =?utf-8?B?UTNGM1doSGVSZXNQVmorbkd2ZE5yZjFibEtyS2VDRDRiUDVNdnEyM3JTUm9M?=
 =?utf-8?B?NDFSTXl6UEtUY2xMUkdSL0dFallYK3hLdmNpWmd0N0NSSVhzVU5ValBZUWhR?=
 =?utf-8?B?SzEyOW0xd0JzejhjdG0vU2VrdlJubDY4cTBDWThMcU4wVTJyMVhrUVIvelJT?=
 =?utf-8?Q?Wkgdoo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:38:57.5070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 428e8d24-2eec-4907-3ca7-08dd922382fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF1ADAD2878

On 2025-05-13 03:27, Jan Beulich wrote:
> On 13.05.2025 01:54, Jason Andryuk wrote:
>> Only access the HVM union b_info->u.hvm on HVM guests.  The union
>> access is not guarded, so this reads and sets the default even on
>> non-HVM guests.  Usually this doesn't matter as PV and PVH unions are
>> smaller and zero-initialized, but the zero default will be re-written as
>> a -1 boolean.  Generally, it it could incorrectly set b_info->altp2m
>> through aliased data.
>>
>> Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Change-Id: Ifaca3533dcce3f409c2efa292c7e96fba6371d9d
>> ---
>>   tools/libs/light/libxl_x86.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
>> index 0b1c2d3a96..b8f6663829 100644
>> --- a/tools/libs/light/libxl_x86.c
>> +++ b/tools/libs/light/libxl_x86.c
>> @@ -821,10 +821,12 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>>        * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
>>        * Otherwise set altp2m based on the field info->altp2m.
>>        */
>> -    libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
>> -    if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
>> -        libxl_defbool_val(b_info->u.hvm.altp2m))
>> -        b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
>> +    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
>> +        libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
>> +        if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
>> +            libxl_defbool_val(b_info->u.hvm.altp2m))
>> +            b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
>> +    }
> 
> I think at least the latter half of the comment wants to move inside the
> if() then.

Yes.  Actually, I think the whole comment should move inside the if().

Regards,
Jason

