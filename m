Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0138B28658
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 21:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083766.1443224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un02K-0007Jg-HR; Fri, 15 Aug 2025 19:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083766.1443224; Fri, 15 Aug 2025 19:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un02K-0007Gy-Ck; Fri, 15 Aug 2025 19:24:24 +0000
Received: by outflank-mailman (input) for mailman id 1083766;
 Fri, 15 Aug 2025 19:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fG+3=23=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1un02I-00077V-LE
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 19:24:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2413::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ccef44-7a0d-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 21:24:20 +0200 (CEST)
Received: from MW4PR04CA0039.namprd04.prod.outlook.com (2603:10b6:303:6a::14)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 19:24:14 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::1) by MW4PR04CA0039.outlook.office365.com
 (2603:10b6:303:6a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 19:24:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 19:24:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 14:24:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 14:24:11 -0500
Received: from [172.31.85.68] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 14:24:11 -0500
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
X-Inumbo-ID: 70ccef44-7a0d-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=musyiadMv7Cct85TxZ2ienEB84ZiorNRHQFTr80NJkKG5FgCCT9luvI/x5wyVVvm9gJL80j/TLvLVEuOT/PaeLTKDr0QeK/P2bj1BxEwQTUUxJOSq2LbLXO+AZd0vgFuR6e7wYqOcmK2pK3hgBE82mIWfojrsmiITfTG4ZzOvqLCDTFLOTyOCLUu11AiEbGE2iy06PfYMKtcxW6Di8M0lJZ8x7TjrKquZeX6caMnKv10P6o7XN+ArZiwFkdrpO9PF5Dg0kVtbOveucMvVjXfkPfMsbEE5dfTze8f5ct26UeZTffnZiZWqPx+XgGM/rnPMpajy5TeTxhzYp6BjWy6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqXfgjrsJCPYSErrVtY/J9xbSb3TkNGVIS0aoEEeO7I=;
 b=CIoMlvxMPMtc52ShAj6SuWfk1j/FXKu6FEJs5cfJxwUKVIWnDnp0a63PhW+/81OX+nM39ovj4WU90dJgM6iwZagQsyyQh43VCEY309gxK6EnTOfSHfnNpcytRKNZoG/ggMmF2lJcTbiWDhp/RD1G73ZKArdAWIg10oEt3GxwfMbrQomzetDZewdh7+CWUKhGBCoefx6wCCBPWx3ZR9VXwU0nRHXhZCu5Ph0ejlOJvo8qmYpmrkyOipTqcuMabP0SV1YsNhSF5K0ET3oobTKL7nYoH8bYCX1kCeawzLzbxaQvMfUuUYVCIlpWFqtonXJpGN8eRLsdzvciskxLDquGqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqXfgjrsJCPYSErrVtY/J9xbSb3TkNGVIS0aoEEeO7I=;
 b=GWfrYgL9AaNXRJTNppe236ZfrGrwQWrwyF+CiLfIaTQsysfWL8iPNLKJQaNFSx83stYmPnL5nre3hWWKUQPGimQ4NpXKq5MDG7WH2sBDpo4T4UaE9GabyZXvzQxWAste1NYr61CYPi3FtmlFvyMz7JcvadoLgeE2XDmrnUma3+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <29a8d359-464c-4a46-ad28-c2c391a83115@amd.com>
Date: Fri, 15 Aug 2025 15:24:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/vpci: make BAR mapping more resilient for the
 hardware domain
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <Jiqian.Chen@amd.com>, <jbeulich@suse.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
 <20250814160358.95543-3-roger.pau@citrix.com>
 <269db2aa-9ca1-446b-98f7-60ea2386fc03@amd.com>
Content-Language: en-US
In-Reply-To: <269db2aa-9ca1-446b-98f7-60ea2386fc03@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a8a74d-d058-437c-0cc6-08dddc315129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3FWamZ2NHIybmIvWlNPQ1V6SEkxamJ4REdWYWxMeEEyWmZ3QkJHRXJVNVEw?=
 =?utf-8?B?UUt0L0w0Zmp0WXZEckV4ZmluTFg2UVhJRWc2bWpSV3dKbW81SjJPRTFkZitD?=
 =?utf-8?B?OHhmSlN4MithcE1zQTE4VURITjlBYVkraEpDZ0tJQ2Npd2hSUXBXaXQvWXJh?=
 =?utf-8?B?ZmUwSWFPM2l0aGhHeUIxZjNtYytYUjNGNGtiWFBIN3VsSXFZaG1yVWhaU1R5?=
 =?utf-8?B?R29XZUpkY0dmeTJZUEN0UHhqa29YSUNSQ05oY1k1emFrMTE4Y3pTakFpSXlJ?=
 =?utf-8?B?ZGJabVBraFV2RlVrVkczVDFsNDVuSktlQzVkSTBMWGZuazRaS1lQbUVzekFY?=
 =?utf-8?B?RDRWc2ZNTXlOVDdtTmtEQWtzY0hINWJERVQ1UlNlWEJpWVo0MVpNNXpkNHZJ?=
 =?utf-8?B?MFcvaTIwMXFWemN4b2Y5RlpqM0dranRtbEg1UmdsL2QvTjRmaEdFT3Zwb21i?=
 =?utf-8?B?b002NXoxNzJEU2JEdm5nVnZyT1IxZ1BCZWIxYThCM1RRbDBReDQwMm56Vms4?=
 =?utf-8?B?VkxGSnpFMVArSlcycHFmMXdnQVFpUXJFazFxT1E1SUoxeEhvYnExczdWNzRZ?=
 =?utf-8?B?MjVTTlRYempxeXdkRTNzcEJUNTZSdVlRVG1CbEhzY3VLMTZ5Y0ZLMEdVYjZY?=
 =?utf-8?B?cGdnY2hhSGlOSnU5UU5ISElXT2lDMWduK1Z1VWR2MVI2U3phWlB4ZEFjMkFY?=
 =?utf-8?B?V1prL2MvSzAvSTlPYWxRUmFjK2daYzJ1M0tydFNRQlZxOGlMN1JuSnoxd1JY?=
 =?utf-8?B?ck8yMDlPYlNCNU4waHA4UUlQSGw3eElXOUl4YTlrQ2NkNVc5MmkzMXZRRmZW?=
 =?utf-8?B?WW1tWk9IdU1la2dEZGZqdTVycitHYSt4UER3YzVGNGZmdnpBUHdiVVFLZ3Vv?=
 =?utf-8?B?SFB3NWxaV2wyRGJQaXAzWitkQ0xYbG9lZm1ONzRxWTc3UjhLOFdybVpDVXBC?=
 =?utf-8?B?eGt5d0w0QjBzMndaanZyQ3BNa04xRURSVW9IOFp1c2hrVjhsNTNKYjg1YjU4?=
 =?utf-8?B?VE9LRzVrdTY4bGgrODI0Vm15eFNPZHYxYlM1MVpwcDhYUzE4K0t1YmpYb1U3?=
 =?utf-8?B?Umo1aVluR1lPTzM3OUpNT2lsN1kvVGZIYXNPdXZ5QVpMWm1wRDk2NGgySzdh?=
 =?utf-8?B?WEVKN3pYbm5KaU1JZEhVK2tkMlhRL1BRNjk3VUprVm9pdzNxVk9SR3hYaExz?=
 =?utf-8?B?SGoyVnRIOVZlWlpIeDRzQjE4OTFpSlJHS1ZVMEt4T0c0djNIVzRXanl3cmh3?=
 =?utf-8?B?c2xIRVdXUW5ITUJMOU1GcTNXZmd5aktrQjNreXAzVUZYMzRmSEVHbDl4T0Ew?=
 =?utf-8?B?bEs0bFlTd3grMTVCcVpHeEJjU1AveHcwS1FreE1GNmp3N1Jta3NZR00rVzFO?=
 =?utf-8?B?NVpuMXgyemNQYXMwSENZMGF5YjdiaHF1bnUvc1pjWGs5Y3liQTF4aDUrbFEw?=
 =?utf-8?B?Ti94amhWTzkrSjZ6eE4wQ1M1azA2anFvU3VMaFVNaTd0NVhvdnZpMDNUQU9H?=
 =?utf-8?B?Smg2Znd6MmNtZlFvU2lrR1V0SXNxUHBjYW91QXpmTDl6MjE3K3hPb3Nod04x?=
 =?utf-8?B?SGtzVnNDY0o5c2hoWWFrR3V5aWVUK0NzcnJGUjJTUm5xUE1iaW5pQmtLWnQ2?=
 =?utf-8?B?S3RiM0tJSzVYV3BmWGRUQTlDR1hzUFVmMW5YTFRua3EvQmZ1NmtWM0VGU2E4?=
 =?utf-8?B?aTdPMnNGNkF1c0hLQ1hPdjRJTkkxR29oMUpLbjVkY0JWUEFCZm1nUE1vRVNY?=
 =?utf-8?B?cXY4MDdUZ3dkaXM2SXJqRW55T0hrZm95VmZlNlRvdFV3VFVrSVdkcUJHS0VV?=
 =?utf-8?B?ZXBmUTV3blFGcFg1a3RwWXhDUmhUeWpESEhvNEJGemM5MnYrUWQ2RjJ3WEFJ?=
 =?utf-8?B?TFlOU3hQWHNtUURPbGE0RVhyWlF3OVhsL254N2ZjN1NzUytKQXIxY1pKa3Zl?=
 =?utf-8?B?aXZURldodXNKZHNvRFJxOGJ6c1ZMaFcyWVNCQWI1RHd6SThSSzhOanVIaFFI?=
 =?utf-8?B?RlFJN0RlYlR3clFiSVdLeVpaYmhlREdOcSsrZC8xNTBuZVZ4ZGFxUnZQZ08v?=
 =?utf-8?Q?6fwoUj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 19:24:12.8273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a8a74d-d058-437c-0cc6-08dddc315129
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024

On 8/15/25 14:53, Stewart Hildebrand wrote:
> On 8/14/25 12:03, Roger Pau Monne wrote:
>> The logic in map_range() will bubble up failures to the upper layer, which
>> will result in any remaining regions being skip, and for the non-hardware
>> domain case the owner domain of the device would be destroyed.  However for
>> the hardware domain the intent is to continue execution, hopping the
>> failure to modify the p2m could be worked around by the hardware domain.
>>
>> To accomplish that in a better way, ignore failures and skip the range in
>> that case, possibly continuing to map further ranges.
>>
>> Since the error path in vpci_process_pending() should only be used by domUs
>> now, and it will unconditionally end up calling domain_crash(), simplify
>> it: there's no need to cleanup if the domain will be destroyed.
>>
>> No functional change for domUs intended.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/drivers/vpci/header.c | 51 +++++++++++++++++++++------------------
>>  1 file changed, 28 insertions(+), 23 deletions(-)
>>
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index b9756b364300..1035dcca242d 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -64,7 +64,8 @@ static int cf_check map_range(
>>              printk(XENLOG_G_WARNING
>>                     "%pd denied access to MMIO range [%#lx, %#lx]\n",
>>                     map->d, map_mfn, m_end);
>> -            return -EPERM;
>> +            rc = -EPERM;
>> +            goto done;
>>          }
>>  
>>          rc = xsm_iomem_mapping(XSM_HOOK, map->d, map_mfn, m_end, map->map);
>> @@ -73,7 +74,7 @@ static int cf_check map_range(
>>              printk(XENLOG_G_WARNING
>>                     "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
>>                     map->d, map_mfn, m_end, rc);
>> -            return rc;
>> +            goto done;
>>          }
>>  
>>          /*
>> @@ -87,17 +88,27 @@ static int cf_check map_range(
>>  
>>          rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
>>                        : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
>> -        if ( rc == 0 )
>> -        {
>> -            *c += size;
>> -            break;
>> -        }
>>          if ( rc < 0 )
>>          {
>>              printk(XENLOG_G_WARNING
>>                     "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
>>                     map->map ? "" : "un", s, e, map_mfn,
>>                     map_mfn + size, map->d, rc);
>> +            goto done;
>> +        }
>> +        if ( rc == 0 )
>> +        {
>> + done:
>> +            if ( is_hardware_domain(map->d) )
>> +            {
>> +                /*
>> +                 * Ignore failures for the hardware domain and skip the range.
>> +                 * Do it as a best effort workaround to attempt to get the
>> +                 * hardware domain to boot.
>> +                 */
>> +                rc = 0;
> 
> If we return success and size is zero, we will potentially attempt to map/unmap
> the same region again in an infinite loop. rangeset_consume_ranges would invoke
> map_range again directly without returning to vpci_process_pending.

Sorry, I sent the previous email too soon, I see now that it shouldn't be
possible for size to be zero.

> 
>> +                *c += size;
> 
> This line is now only executed for hwdom, but ...
> 
>> +            }
> 
> ... it should go outside of the hwdom check because domUs still need it.
> 
>>              break;
>>          }
>>          ASSERT(rc < size);
>> @@ -213,28 +224,22 @@ bool vpci_process_pending(struct vcpu *v)
>>              return true;
>>          }
>>  
>> -        if ( rc )
>> +        if ( rc && !is_hardware_domain(v->domain) )
>>          {
>> -            spin_lock(&pdev->vpci->lock);
>> -            /* Disable memory decoding unconditionally on failure. */
>> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
>> -                            false);
> 
> This path could be taken for either map or unmap. Do we still want to disable
> memory decoding in case of unmap?
> 
>> -            spin_unlock(&pdev->vpci->lock);
>> -
>> -            /* Clean all the rangesets */
>> -            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>> -                if ( !rangeset_is_empty(header->bars[i].mem) )
>> -                     rangeset_purge(header->bars[i].mem);
>> -
>> -            v->vpci.pdev = NULL;
>> -
>>              read_unlock(&v->domain->pci_lock);
>>  
>> -            if ( !is_hardware_domain(v->domain) )
>> -                domain_crash(v->domain);
>> +            domain_crash(v->domain);
>>  
>>              return false;
>>          }
>> +        ASSERT(!rc);
>> +        /*
>> +         * Purge rangeset to deal with the hardware domain having triggered an
>> +         * error.  It shouldn't be possible, as map_range() will always shallow
>> +         * errors for hardware domain owned devices, and
>> +         * rangeset_consume_ranges() itself doesn't generate any errors.
>> +         */
>> +        rangeset_purge(bar->mem);
> 
> Reiterating what was mentioned above: if map_range returned 0 without
> incrementing *c, we won't make it back here.
> 
>>      }
>>      v->vpci.pdev = NULL;
>>  

