Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF699609C1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783912.1193228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siv5A-00044j-V2; Tue, 27 Aug 2024 12:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783912.1193228; Tue, 27 Aug 2024 12:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siv5A-00043G-SO; Tue, 27 Aug 2024 12:13:56 +0000
Received: by outflank-mailman (input) for mailman id 783912;
 Tue, 27 Aug 2024 12:13:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQW3=P2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1siv59-00043A-Pl
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:13:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d31e7336-646d-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 14:13:53 +0200 (CEST)
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Tue, 27 Aug
 2024 12:13:50 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::52) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26 via Frontend
 Transport; Tue, 27 Aug 2024 12:13:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 12:13:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 07:13:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 07:13:48 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 07:13:47 -0500
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
X-Inumbo-ID: d31e7336-646d-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWwiyyDiYjYbUgVur4yfgKMrpJVJJiRB2nNIKGVUng68J7izJtg/tMs7/zOd3gwLdQixv7z0tD62f6krOL7uYVvlCj0LIhL0oDwGiqzBsH3YaOJG/UHm6WCof+vJm830HGgPIQHQPhbyYp6hpizS4kyfb+htso4AExeJEK1aK6uHyxFO5L0RUHiU/u+wBukKG+lkd09Ey5CAM+XmqIU2ZDjly3OBWC+ITEZJeDTS3s3t/bVgUF2AgrderTNtxwtHKI/TQFiZ2mjcEPjvoqxrbFpOH3MOU6N07QMAOdNvyYUKPaWKM0nWgOHtYDXQYlw5pzCGsmkpIqYcXoxDDQ9Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8Dd+Wz7gQgBrVRFPtl6TPBK4TLlbA/9FtynOwB2JhQ=;
 b=WZHbEFF9yL8QEX++rJhpW64I9IcCQZQn77rDJkxKK+yiYpyrRgIYg9LtlROqmM40+QOAyrf6PJY8sWDaLt8DhQHq5FNkEjC6wwzag1RnKc4+CEzn+A9G6XWtCvqpcUXkCSTIRxy0tXjrkINo/TgTuAYGZ/lxx4k59k4M6b6U/vryCcjeWXpxRQjqflVFyvAzvhBKjUljfDp5ItZUVHcmOiseqgRN52M7N7NS47AIBYl++5Lk6WTDivO+maZUnVnlXRg2E1FWR2W+0FuXWUPbzYrrA2HF0JEYnOIEPosoBGljRGTIocrKInJudb+vL6ngqEEKIo9WtxlA2vez7Gdjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8Dd+Wz7gQgBrVRFPtl6TPBK4TLlbA/9FtynOwB2JhQ=;
 b=yuwWDlvOKygRfbuorKsd0Sg3374o3+4tmWc7ur2DVk/39eudqeu5H38uphoxzeptbouWvy4mrNg5+Mm+yvOqLdrS0U0Deu7b9NAgE0WZscBHR3jt3cmrf9KCjyC2+zAKWi0q0vHxYAs8TRuVMWRedYgzFQaTcrRHEMoWjcxxpro=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6513e2ea-0471-41ca-b328-ce1bc1deddaf@amd.com>
Date: Tue, 27 Aug 2024 14:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_to_sgi()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <20240823230100.1581448-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240823230100.1581448-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3754bc-c6da-4756-1539-08dcc691b58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmRnd2toYnh6WHhBOTFnVWJYUjl5MnRFdjRaanl3emdHVHBTZkJ4eHZWK0FT?=
 =?utf-8?B?Y1YrbzIxSmhxemxhcHJ5eWxzVHV6Skh3ei9jNXYxWjY1UCtzeUxYT3NWSDRq?=
 =?utf-8?B?Qm9hRTEyaTlhZ3dGVDFyVjVWVkRwOHBCUzdERFZNNnFXMEwvMXFyRXhiMW1H?=
 =?utf-8?B?SURLTTBOenQyQkRtQ0ZaRTE4SmRTK3pCakYzbXl5ZE5laWZESS8vaUhKK0hw?=
 =?utf-8?B?eHBnb3JQcTNqNTNLc21wWUE5T0lvejA0M1lSMG03ZFo3WVFtVVRTK0tsWmJ2?=
 =?utf-8?B?aldiN0FWR1hDSmxKMVFBTTBDVUw3L3VMakdyMFppbTJyTVp1Z2dUNXNpczMy?=
 =?utf-8?B?SHAwTzRLeEJyOG1naUJvb0FXT3N1YXFzTGpOZUQ2enlUeHdCVEd6MS82SWdM?=
 =?utf-8?B?VW96WGk1NUluUVBmd1ZpdEVoejZRa2ZDajJDUk80QmxYaVhXa2k5NVdRbkQw?=
 =?utf-8?B?aDBqSksvMWprMTg5d0M3VXU4ZjBQYXhxWDNMZGMyYW9OTDVKLyt5VGpPUG1K?=
 =?utf-8?B?K09uVEhQcnNhVFJPYjByWjZuc3ZLUzhGWVNzMUJZSExzU2tSeHd5NFl0L2FR?=
 =?utf-8?B?QVRoY2lpNU0rSW9IMm5iNmVUeTZWaS9YWVN0UFd2cDJ3V0s5OWpTNUhCd3JU?=
 =?utf-8?B?ZmNGVlpYdWE3dEgwZGlBN0ZXNW9VbjhBMDBzYlhBNUp1WU0wTEoxeVNQU3dU?=
 =?utf-8?B?d0luZVZJcTgyWU0ydituaUNIeU52Z01VYUVaSjZ6Zk5YN2krNWVPR2hVcmRC?=
 =?utf-8?B?czVHazFEUHp3c3Z5SEo4UU8yRGdHMlNJV3R4VHZnR2hKZURSN1VwSnJCSXBZ?=
 =?utf-8?B?TVkweVIyb2FhcGZ1bUIwV0pjcUtDWU1zaW4yRlBsTXNIK1l1SEZWWWNRQnVC?=
 =?utf-8?B?UDdNWTdRdWdBMWo3V0dHUnpiUjh2bDdRTmVPZ3dCTDRZMXZrNnN3QVpON3pC?=
 =?utf-8?B?VENSblY1eGhWMWlMQkZlM1AwMXdjQ2Nsam1lYWJLTFZoOHdBK1pndzBrTGFh?=
 =?utf-8?B?TE9KTkNnUVAya3hOZlJFVDNudys1VHliNC9ISWs1dmk2V25HQWNSY3VHREFn?=
 =?utf-8?B?NE55TEdiU2VUZHZXV0JBV0JwRFk2UUxMTklIZXkzdmd3TTdEZlAzNVBZK2VI?=
 =?utf-8?B?cHlrYTZBQnk5M3BIR0srRVMzd1NsOTNyNnVCVGxJYjh0cEJVOVFpS0w5aUpu?=
 =?utf-8?B?cklzRVV6cmhjTlovU3JYckhTR2pUSTM2a2wxRDBqblg3KzJscXZOSmkyT3Rx?=
 =?utf-8?B?OWV4U3c0d1JzUkFrYXNMbFlaK0JobW00bE1UUWhBZVNiYmpSWDJ1R3BIU3dF?=
 =?utf-8?B?ckNqcGJqSEJvU3RmNk04ODZnMkVDUFlJV3VDU2xvdWV3MEhzNE83VmRMOC9h?=
 =?utf-8?B?TCtPQ3ZzRmxndDRxZE5OOW91MWdlWFhRK0JBWmZIRGc1WEw2Nk1oT2RXd0Iz?=
 =?utf-8?B?L2xjUWpIam1aWVBVTnVjdjRWYTJmMm1DUjJsejNZSHdJZEV5MjA2N2NSWk02?=
 =?utf-8?B?dE9UUjNrMDdrVnhhNnpuc3ZaNDJaMXNKbEZ1bmdoU1p0UzdlK3lzazA0VVI3?=
 =?utf-8?B?eC9ORjhITHdtYndIaFZsZ0xkOENPdTlHeVdFQVZqMDh4Q3hUMmxySFM4VDJu?=
 =?utf-8?B?Y2ZxWlJvcHdLeDM2bWlNcldZR3BmNkZnT2FWWWJuMDZzQkxYNDdMT3FXaDVV?=
 =?utf-8?B?bWd0UTNlWGc2bFJOWDZiQzh3RG1mRjVXbG1uQUJRcVpORGNpL1FNN3h6S09m?=
 =?utf-8?B?cEppS1pWYVRGblJRQTdGcDQvM3BJS2dQdEhkVUcxME02bmN2TzBHVDh5TCtO?=
 =?utf-8?B?bmFoZUV1OWVJc2svdy9xUUVmbEZaazY0MlhrYWlJTEd0aGdrVWZwek5DRmw2?=
 =?utf-8?B?Qk9zK2xPd2o5bHpobjhYakJvblpCWlM0b0JabXdMV2dYNi9SWTYwTHlSOTcr?=
 =?utf-8?Q?U/FXLFvNjWbl+6vKTyALVceNfFla/r2+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 12:13:49.6216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3754bc-c6da-4756-1539-08dcc691b58d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367



On 24/08/2024 01:01, Andrew Cooper wrote:
> 
> 
> The existing expression is just a very complicated way of expressing a loop
> over all bits of target->list.  Simplify the expression.
> 
> While here, fix the two gprintk()'s.  Because of a quotes vs line continuation
> issue, there's a long string of spaces in the middle of the format string.
> 
>   $ strings xen-syms-arm32 | grep -e VGIC -e GICD_SGIR
>   <G><1>%pv VGIC: write r=%08x                         target->list=%hx, wrong CPUTargetList
>   <G><1>%pv vGICD:unhandled GICD_SGIR write %08x                  with wrong mode
> 
> not to mention trailing whitespace too.
> 
> Rewrite them to be more consise and more useful.  Use 0x prefixes for hex,
s/consise/concise

> rather than ambigous, and identify the problem target vCPU / mode, rather than
s/ambigous/ambiguous

> simply saying somethign was wrong.
s/somethign/something/

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <JBeulich@suse.com>
> 
> In a fun twist, we can't use target->list directly in the expresion, because
> the typeof() picks up constness from the pointer, and we get:
> 
>   In file included from arch/arm/vgic.c:11:
>   arch/arm/vgic.c: In function ‘vgic_to_sgi’:
>   ./include/xen/bitops.h:305:19: error: assignment of read-only variable ‘__v’
>     305 |               __v &= __v - 1 )
>         |                   ^~
>   arch/arm/vgic.c:483:9: note: in expansion of macro ‘for_each_set_bit’
>     483 |         for_each_set_bit ( i, target->list )
>         |         ^~~~~~~~~~~~~~~~
> 
> Sadly we need -std=c23 before we can use typeof_unqual() which is what we
> actually want here.
> ---
>  xen/arch/arm/vgic.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 7b54ccc7cbfa..081cbb67fb52 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -470,8 +470,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>      struct domain *d = v->domain;
>      int vcpuid;
>      int i;
> -    unsigned int base;
> -    unsigned long int bitmap;
> +    unsigned int base, bitmap;
> 
>      ASSERT( virq < 16 );
> 
> @@ -481,15 +480,16 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>          perfc_incr(vgic_sgi_list);
>          base = target->aff1 << 4;
>          bitmap = target->list;
> -        bitmap_for_each ( i, &bitmap, sizeof(target->list) * 8 )
> +
> +        for_each_set_bit ( i, bitmap )
>          {
>              vcpuid = base + i;
>              if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL ||
>                   !is_vcpu_online(d->vcpu[vcpuid]) )
>              {
> -                gprintk(XENLOG_WARNING, "VGIC: write r=%"PRIregister" \
> -                        target->list=%hx, wrong CPUTargetList \n",
> -                        sgir, target->list);
> +                gprintk(XENLOG_WARNING,
> +                        "vGIC: write %#"PRIregister", target->list=%#x, bad target v%d\n",
Sth like "bad target v2" where the word vcpu does not occur anywhere in the msg can be ambiguous.
Can you add the word vcpu e.g. "bad vcpu target v%d" or "bad target vcpu %d"

> +                        sgir, target->list, vcpuid);
>                  continue;
>              }
>              vgic_inject_irq(d, d->vcpu[vcpuid], virq, true);
> @@ -510,8 +510,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
>          break;
>      default:
>          gprintk(XENLOG_WARNING,
> -                "vGICD:unhandled GICD_SGIR write %"PRIregister" \
> -                 with wrong mode\n", sgir);
> +                "vGICD: GICD_SGIR write %#"PRIregister" with unhangled mode %d\n",
s/unhangled/unhandled/

> +                sgir, irqmode);
>          return false;
>      }
> 
> --
> 2.39.2
> 

Otherwise:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

