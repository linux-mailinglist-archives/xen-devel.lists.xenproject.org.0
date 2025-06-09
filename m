Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA5AD24B7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 19:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010390.1388498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOfxu-0001vn-FC; Mon, 09 Jun 2025 17:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010390.1388498; Mon, 09 Jun 2025 17:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOfxu-0001sg-CW; Mon, 09 Jun 2025 17:07:18 +0000
Received: by outflank-mailman (input) for mailman id 1010390;
 Mon, 09 Jun 2025 17:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DgcR=YY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uOfxs-0001sa-F1
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 17:07:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2de15980-4554-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 19:07:11 +0200 (CEST)
Received: from SA0PR11CA0060.namprd11.prod.outlook.com (2603:10b6:806:d0::35)
 by SJ2PR12MB7799.namprd12.prod.outlook.com (2603:10b6:a03:4d3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 17:07:07 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:806:d0:cafe::f6) by SA0PR11CA0060.outlook.office365.com
 (2603:10b6:806:d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 9 Jun 2025 17:07:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 17:07:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 12:07:05 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 12:07:03 -0500
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
X-Inumbo-ID: 2de15980-4554-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOEjeE4wyC5Q9+OVem0Gcu4VVCNa8VQP2EjdghM+yGZ2jUFSN/EdexcUKubVFBzKcvkm8PgAJ/kk6/mFJCw5Nipb6KV4cGNY5XehBRYDvJDzBecy+mm5Qs8Hn2FXlZkUzG8WzP/cANY07xnoRemVUPiHPuoqlJf8LJoFr7b0fqUG2QbxX0XsMfg+2IUIRv88hDigzAnb6TVedPNPBBZVZLpNnFFnDelwT1hQwEYpCQ2WoUCSB04+BL5jVHVMc5hVgjVNrIy3RMrfW5LZF84f7WFF9qr6igz+Dl3M5FJqqbAK/K9xsHtZ6m7SJO85LMvfZ6Ej9Eyrx/nWC0Ya2tfa/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5BSugR0vnffgsQIou3yc8PFf2hPaHLWN4mLggwndVw=;
 b=qtpHlN80zsjpVIgFyZrSqKQl7lVAlReWVUzCwAc/dmWgygF//QqIVim0k3/DCdRE119xlMKp0aMvKLNqtkBf8oHyQvaaI5OQWHVHXDRtCeF+5BA8VEAyYc3z8YALIAYAgLebzudVCHjf6DxfBueWx699Rt2qlkRqEt99EaVcMO2w9Ya4iwKzxPpgj1YJaQ/lCZJzn9HdlH8b7zveE8XCd53fjIRW7HBA5X9xjjMEesTm26m6M71WJa49gz8y6NqPnFuMMjnolL8HXNnR4Ito+tqnmvFOPpEAN2DqwHvCT3IphSutVyJxS8i3F5lubw0klCbgvgBQKgmkw5k8iXpAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5BSugR0vnffgsQIou3yc8PFf2hPaHLWN4mLggwndVw=;
 b=TFkB8HqD325GyhFA46OVM1jV21enSrWOR4/bw2M5Osjn4EtXR5zVP9OjTXjvtnX21BOFG8JO3XO5UHBZOfwrjyF2DfCDzkhGjbYNH/ubCkGonQj0CfoFP3WzGZso0KcYouwetEik/Reu6dH4OCioPvYsWa/+k2Cf7v9pZBbw8JM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <59f37fcc-9226-46c5-8dc8-7bd2100d8f59@amd.com>
Date: Mon, 9 Jun 2025 13:07:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] x86/hyperlaunch: obtain cmdline from device tree
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Denis Mukhin
	<dmukhin@ford.com>
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-7-agarciav@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250429123629.20839-7-agarciav@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|SJ2PR12MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ce83d1-4cd0-4565-e95b-08dda7780fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SU00Y3pWb2hwRUJkaWtud3NlQmxmVUkyWW42VWpic0JJd2tsMU1HSmp3QXJa?=
 =?utf-8?B?S25uSnlwN2c5YmdBL2J5dDJGQnZ1T2JFcm1EQ1lTaFdCM3FJVTlIVHd2dUU3?=
 =?utf-8?B?dlVubFhacjZhVHhUbStTY3o2R3lFRTQ5UWZ1R3RscGc2TjNDR05QSGx4VWFi?=
 =?utf-8?B?Nm5FUExMc3FHUzFXckdkbmNQUGhncCszQTdoeXY2TEk4aU16d0dKNUU0Ymwx?=
 =?utf-8?B?Qi95N01MRW5JL2luNjhzSkdIbmlYeVdxU3Z2SVhzdVk2WlEvY1dFZy9mdGR2?=
 =?utf-8?B?KzBuL3M4aWJUYUF5cDR6Vk9rUHNqQlA1LzQycmMzUXMxWGYrZmFEb2FEUGJ4?=
 =?utf-8?B?QURGSXJWUU1tSTJXZFF4Z09GcElQNk5iUm1uZFZ4eENsUi8rcm5OT3JjMGU0?=
 =?utf-8?B?WjRlNjhrZjlFUUVMdDNZMTNvaHB4ZklUTnJORzJGN1MwRm1ORStNR2N2Zjdp?=
 =?utf-8?B?cVNOaEw4Q1I5UHdxN0F6R3JhR3NMd2FoZ0JrRnpONkxrVlhnUHVPbWswNjFi?=
 =?utf-8?B?c09GNTcwOFpHbFo0OTFIQzNaMEhCQ0pFMGVXYkpTcktuZCtPNnUreUJQQzdY?=
 =?utf-8?B?SFZFeDJ3NFAyL2QzOUZ5a0t0YUtOTVRrNUVzZ2ZKQWxZQUxVMC9ac3V1S2Z5?=
 =?utf-8?B?WWg0MlMzdkNtK2dSWDVTWEhTZFpjRG5IWlNxN2t0a05pM1RIRUc1U2xSRXQy?=
 =?utf-8?B?b3ZPQzV3WVVmK0NlSG42di83UWoxdXRBRU5ETUkyNjQydHFMOUYyWmRicDlh?=
 =?utf-8?B?QXZXeTlLdG0weWdoOWdJdjJxK0NZdFl5RXovU1VtZ2pXVmw3RzBuZE92WWV1?=
 =?utf-8?B?RENHMk9LQm1ydmhxSm5ud0dncXJyVExwTXIvSW42QndvcXU5RWowZlNBU3BZ?=
 =?utf-8?B?YVl0MnFrYnBoRlUyZEJKYzAwNHNzdzk3UFowMXBuYU9sTmZQb0hqWHUzY3hz?=
 =?utf-8?B?aEgrV3Vqa1JFazN6VG9lcXJheVlLSGlFRGMwN1JSN1ZTR0FjTGFpVkZjcWFo?=
 =?utf-8?B?UlFJOEhTbFM2c1ZEOWk3RnJGNGRXMWY5UUU5SG80YU9ubmZNTWswWUYvcks3?=
 =?utf-8?B?T2lSTzNDbllZVyszMmNtV1F3U2dmd2VwUEVmRVpCa2VzZnpQb0liOGw3Y0FM?=
 =?utf-8?B?THkzdUxKNHVpQmJ1UFNFYURVR3hMSnRUWm1XSHZLMFNhMXdBeDNYL1R6TGZo?=
 =?utf-8?B?VjE1ODg0dnhaa0grMmZPUTVNbkJDYjFJcnBSNlB6cFJiS0gvMEVRdGliakVE?=
 =?utf-8?B?bjR0blpqektCT2xQZkU3WE9wYUx3eDNJU0RITW92Z0VTQWc3K1I4L2dGNUtL?=
 =?utf-8?B?d2tGaHFsN2QzZ0VsT1ZmcmEvclZEYVBSTTlvbDlINnZQWlYyVHMrYXFqUDRT?=
 =?utf-8?B?ZitIbXRqUitjK3gzakdTSnJJbUR4WGI1OEdJVXVKZkN0TmYvME1SenJ1cm55?=
 =?utf-8?B?L054VllLaldKem1DT2piMkxMTjdWMENxd0o5M1AyeGxKV2x1eHNaTnBCUy91?=
 =?utf-8?B?TVZ1ck9Ra0ZsemdXTFZPNFZCandSQ2I1SGN4TGVCc2xIU1Q3UmRlemo1emRJ?=
 =?utf-8?B?OEdERklHQ0NpODRzTmF3TUtBd1hrMUwyS2RCblcvbUlxNFg3YzJJU0hPRVpl?=
 =?utf-8?B?RUpZZHRyWkFLWmF6cG1oaWlkZlNQVWtCQ0dqeGhaVDZnL1BGWDlMREx3cWhN?=
 =?utf-8?B?MW5ES28xSFhNWUNXWlcySlAzNFFxQ2FmZUZRR09UN0I3TG9kWG9xSnVXNVdz?=
 =?utf-8?B?WGZXOEpwYS9HbVFCSG1qcE1GZ3Y1VmNoRHhKQmRoa2t6YUh3OGU1ZGl6ZzRj?=
 =?utf-8?B?WkRhV012TGRJWDFsT0JrUzlHa2VxaVovTzAyYTNoM1RRZUZjNDRvM2cvNXFI?=
 =?utf-8?B?Ym0vak50RlNoZVJIRlZGbzh3ak10ZjhES1dzNkdrMG1zam41S204TldGK1VF?=
 =?utf-8?B?cU9kU3dtaXZUWDdkeWdwS21ySndIYUVwS3FEVW5wQ21jdFk1aUkrM0FXVW9r?=
 =?utf-8?B?RG0yZzFNd1RNWGQyUitDeTFwMzR5NEg1Snd5Z1dUbWo0STlLV3Q0ODdnOXBi?=
 =?utf-8?Q?czGlGz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:07:05.8349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ce83d1-4cd0-4565-e95b-08dda7780fcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7799

On 2025-04-29 08:36, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Add support to read the command line from the hyperlaunch device tree.
> The device tree command line is located in the "bootargs" property of the
> "multiboot,kernel" node.
> 
> A boot loader command line, e.g. a grub module string field, takes
> precendence over the device tree one since it is easier to modify.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> ---

> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
> index cbb0ed30a2..dabe201b04 100644
> --- a/xen/common/domain-builder/fdt.c
> +++ b/xen/common/domain-builder/fdt.c
> @@ -219,6 +219,12 @@ static int __init fdt_process_domain_node(
>               printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
>               bi->mods[idx].type = BOOTMOD_KERNEL;
>               bd->kernel = &bi->mods[idx];
> +
> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
> +            if ( bd->kernel->cmdline_pa &&
> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )

The logic is incorrect - it should be:

             if ( !bd->kernel->cmdline_pa ||
                  !((char *)__va(bd->kernel->cmdline_pa))[0] )

If there is no cmdline_pa (which happens with the "reg" property) or the 
if there is a 0-length string, then check the DT for bootargs.

This fixes the "reg" case to read from bootargs.

> +                bd->kernel->fdt_cmdline = fdt_get_prop_offset(
> +                    fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>           }
>       }
>   

Just giving a heads up in case anyone is using it.

Regards,
Jason

