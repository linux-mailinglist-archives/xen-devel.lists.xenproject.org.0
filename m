Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0733923E7C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 15:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752455.1160670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOdI1-0001Rs-Vp; Tue, 02 Jul 2024 13:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752455.1160670; Tue, 02 Jul 2024 13:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOdI1-0001Pb-Ss; Tue, 02 Jul 2024 13:11:21 +0000
Received: by outflank-mailman (input) for mailman id 752455;
 Tue, 02 Jul 2024 13:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3J5=OC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sOdI0-0001PT-FC
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 13:11:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2414::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 916ce287-3874-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 15:11:18 +0200 (CEST)
Received: from SN4PR0501CA0061.namprd05.prod.outlook.com
 (2603:10b6:803:41::38) by DS0PR12MB7875.namprd12.prod.outlook.com
 (2603:10b6:8:14d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 13:11:11 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:803:41:cafe::49) by SN4PR0501CA0061.outlook.office365.com
 (2603:10b6:803:41::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.21 via Frontend
 Transport; Tue, 2 Jul 2024 13:11:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Tue, 2 Jul 2024 13:11:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 08:11:07 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Jul 2024 08:11:06 -0500
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
X-Inumbo-ID: 916ce287-3874-11ef-92e8-0d9d20120eaa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUK7oA9iSOfv6ozm9mUpeEzjo1AHxx9sHtzqmcKA6MxMu3H2UYbZYGR9g4ZTL7EdbXT78iQ3p0Es8GRCFtHzlfYgLPMQ6RIWHVn7UcWXvuhdPNOThKjy3nmfUdxKr2rfcxDIoCNAdB+4IT2WzPPTwqLjXYO2qR0pCKUaYxexCrNVKgTyXpLXvuhZIgrw+7pLiSumYBZe3kWGJ6I4EQmW/uSXMIvpDq5ApOY31QCUtbcrsu9/dAubH9pSx8O9Qkix3INLF+jARj1BAIE8UJ0iaRFD7iXp1ytjbO1Le3QoRkK2wZLJvfQwKoxY3U5W9zg+4+vRG9v04yPLNvVsDHzt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeWdMwVCY3f6tmMWnRqlf2QOlbDIcDm8kK0e0AHA6s4=;
 b=UClKFA4ceThDIMMc21fo/nPbeXpGJz7ZuKF/C+tVb4MT9PQoaobdfWIIifGBTZwcVJtO1tHgLSMO/gcXMz6FCX9+qcyTsN8Vcx2WbgQRyerS4laXE3E4DWyBBzCRwbhaO0lKUHJ7LsSHfYijcBvLS/Z3vuen8TRCSbbY92kPSrof9k9LY77IQdPLhGboxEjOyyl9XhcFkdh8187xr0vzWaI93yGvLwnVSCjgV8iaBl9r71QcXEMr+XsB/Z+eNI/6jXfTpuu7kzYveb+i4RogkzLH7i8YEGmSQF0iiOmBmho4JRiNYw+lF/uLTAKiauhZhlHO3jjkRs8k0PcXJ3lqvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeWdMwVCY3f6tmMWnRqlf2QOlbDIcDm8kK0e0AHA6s4=;
 b=WsAZfKVAgmmr8rGl3r+uz17v7OJ+ICAyv6VNH0ZBRg2u+06hwxuAzb20Oc3ETzbhRiupyroxxS4wZ7ZZgFM5QPHkHZ4QVAHtfKZJOCGOgFwZfQDbpg6dWkhzjNwg2Y5GlU7GTrmd5M2M7VLC3NGJbKES8ML9iRxpLUGQxpesinI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <baae2108-675a-4e83-84b3-c791e57c3509@amd.com>
Date: Tue, 2 Jul 2024 15:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/9] xen: introduce generic non-atomic test_*bit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
 <2f60d1fd7b3ac7d603486ce03a112d58352bf16d.1719917348.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2f60d1fd7b3ac7d603486ce03a112d58352bf16d.1719917348.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DS0PR12MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2bdfd8-7dfe-4d7e-aec1-08dc9a9871da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWhET21tWXl6VlFSb2x5Y3FCWFNkZS9nT1d4cmJVb1NuY0dXQmJ2b0FFcy9X?=
 =?utf-8?B?d1lmeW5wV3NVNUpldjJPSWE3WUdhYjYxVlg3YnJiRVRIRVNPSzErTzJZa1lG?=
 =?utf-8?B?NDZ6LzlLVFExN2o0dHB2THdVUDJGcXBNREZOZDdPekZYUkEwdDhkbmZDUTl2?=
 =?utf-8?B?bW5IRVJRN1A4ZG9WUXFXRWdmMW5hQkVhNlQwS2p5S3owbE9tdGVKMTlWakR0?=
 =?utf-8?B?T20xZ3RZUlJiYmV4dHdsQkd5VWtueXorY1JQOWt6ekZjV1dxNitJbFJMRzBj?=
 =?utf-8?B?Z3JqWEpXM29VeVR5cDlXV0Nld2tBVTVkYUNXdUMvaXk3T3VhZlpLaXMwODRy?=
 =?utf-8?B?TkxXdkRjeEtuN1NPaFpIM3NCZEoydGJYT3JhR0NwY1JqcytPdzZZU2FVaXUv?=
 =?utf-8?B?cXduV1VSd0s4QzZKaGloNVVGOVN1aWQwMEt2d3BUNkt2L0ovaDNZSERMdExP?=
 =?utf-8?B?Zzh0R3VON0ZqOVUvN1ZBWk5JSUZNMDRrOFo0VkFURWxxMmlaTnlCVGZKOUp4?=
 =?utf-8?B?NmJFc1NyZXZQeHE1cVJKMDRtWm1lR1h0Q21HRFVuY0tseERpYUlsM1NUOG43?=
 =?utf-8?B?clJmVzFHWURLTTRmWjNZUWQrU3lQS1lSSWZsVldJOEcrVWdJc3dHUVlWTlRy?=
 =?utf-8?B?bFhEOThpaUl5OEhKMllTSTVQQ1FUL0RGSUkyNWNudVJIWEN4QmtDM0FQbzlV?=
 =?utf-8?B?T1FCQWpFMDYraDYzYmswME5XS3RLdEVtbzdabE11SFNuQTY0WWJlWFMxWitH?=
 =?utf-8?B?bjRKdkZhV2ZmS1h5a20rYStCSXFhZnRCVFQzamE5anVJaUx5NTNsNDZ6T0Yz?=
 =?utf-8?B?VkEyQVFMT1V1Z0dpS2ppS0FjQmxmWmJkVHpueVBtT2Z2ZnZvRSs5cFc3NkMv?=
 =?utf-8?B?L1VwKzc4Vit4UnFOeDNicmhlWUVYNXRta0tFZGdKNUpIME9tR0VEYWRpSUkv?=
 =?utf-8?B?RTVvL1B2ZldHMlJBaGIvTDJNNytTbW1QYU4rbzNZTjAyWXpFTzhsUG1LYUdS?=
 =?utf-8?B?eVpPK01EYklZWXE2Wm82dEZMZkxMemhiUUFIeUhRREQrZ2JMS1RaTDM4V1h0?=
 =?utf-8?B?TkZWMGZ0RkZyL21kb25hdHlqTXN1RU51ZHNQQXhUT0FFY0VYOGVHT2txOVZy?=
 =?utf-8?B?aFJ2TUdBUldYeVJJb3ZCOUhkMEY2NXJOMUJ3TE5YSFpJa3NHRVlydHlVRHlL?=
 =?utf-8?B?VXBlcXBaYXNVdFJUZHArZ1M2dU5YK2ZGR25VY3M1Ymc5R29sQUtYb0l5Mito?=
 =?utf-8?B?SE0vME44aXhQTEZjU2lOTEhPVXNTY2JDVHRncXYvaWZFK2xRVm0zMVVPcy8r?=
 =?utf-8?B?a1Z0QXNhTmZTQmdHMDI0LzZEYXZJQkx5Z2tBSWkrRERjMkthU1B1aWhmT2Fp?=
 =?utf-8?B?SXVXM3ZKR1B3cThsZmprZUNHL1k1M2t1bUMzTWh3UG1SaDNuTzZraW1CendJ?=
 =?utf-8?B?U005M0QwcWJTT0Z3QXFJWktNRzcrbitKSmpmLzFjNC8xVEpPU0NaTk91T2Ns?=
 =?utf-8?B?NGU0REdMcEVIVGFiWU9sWjA0ZFVsbFQyZ041YUxhMWt6Qm9PZnB6b3UzeVJQ?=
 =?utf-8?B?ZE16TFpHZzhIK0lZZTZyZTRERG5JSm5NN2p3anVnajZFL01xbWNaMVFPRnVF?=
 =?utf-8?B?WUoybEd6b3A4b1ArNUtGaXprM1pFclFjRFkyZ3JZSVFBbnUwTlZ6bmdNTzB1?=
 =?utf-8?B?RURSNjdEMWZIaksrV3h1ZnowK1hJN1Y1ZHR6TjVEb0dNbUQwMmtwK0o3Zlg3?=
 =?utf-8?B?ZHliNzVOS3FVL0d2Yk8zT0x1VzBwNERHTkh0K21QSU1FUTExWkYwMytGd1ZS?=
 =?utf-8?B?N2pUZStYMmJLRFF1YndDaXZHN0toeC9rN3N1VTFDWlFTMFVrdlpuYzJaOE53?=
 =?utf-8?B?VmtMRk5GdVBKWVNhQTFSR0pjR2Q0SndMakhyT01uZ1FPNmV3dGltc3ZqUVdt?=
 =?utf-8?Q?sI68pEFu/j44/kzt3NSbots4E0H54Op0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:11:11.4850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2bdfd8-7dfe-4d7e-aec1-08dc9a9871da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7875

Hi Oleksii,

On 02/07/2024 13:01, Oleksii Kurochko wrote:
> 
> 
> The following generic functions were introduced:
> * test_bit
> * generic__test_and_set_bit
> * generic__test_and_clear_bit
> * generic__test_and_change_bit
> 
> These functions and macros can be useful for architectures
> that don't have corresponding arch-specific instructions.
> 
> Also, the patch introduces the following generics which are
> used by the functions mentioned above:
> * BITOP_BITS_PER_WORD
> * BITOP_MASK
> * BITOP_WORD
> * BITOP_TYPE
> 
> The following approach was chosen for generic*() and arch*() bit
> operation functions:
> If the bit operation function that is going to be generic starts
> with the prefix "__", then the corresponding generic/arch function
> will also contain the "__" prefix. For example:
>  * test_bit() will be defined using arch_test_bit() and
>    generic_test_bit().
>  * __test_and_set_bit() will be defined using
>    arch__test_and_set_bit() and generic__test_and_set_bit().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with one question...

[...]

> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index 6a5e28730a..cc09d273c9 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -4,6 +4,19 @@
>  #include <xen/compiler.h>
>  #include <xen/types.h>
> 
> +#define BITOP_BITS_PER_WORD 32
> +typedef uint32_t bitop_uint_t;
> +
> +#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
> +
> +#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
> +
> +#define BITS_PER_BYTE 8
Shouldn't you remove the same macros from riscv and x86 config.h ?

~Michal


