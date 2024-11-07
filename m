Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2687F9C102B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 21:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832185.1247600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99aa-0002fX-Gx; Thu, 07 Nov 2024 20:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832185.1247600; Thu, 07 Nov 2024 20:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99aa-0002ds-E0; Thu, 07 Nov 2024 20:58:48 +0000
Received: by outflank-mailman (input) for mailman id 832185;
 Thu, 07 Nov 2024 20:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2I65=SC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t99aZ-0002dm-0Y
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 20:58:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11ff62cd-9d4b-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 21:58:43 +0100 (CET)
Received: from CY5PR15CA0185.namprd15.prod.outlook.com (2603:10b6:930:81::24)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 20:58:39 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:81:cafe::a5) by CY5PR15CA0185.outlook.office365.com
 (2603:10b6:930:81::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 20:58:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 20:58:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 14:58:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 14:58:37 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 14:58:35 -0600
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
X-Inumbo-ID: 11ff62cd-9d4b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjBkIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjExZmY2MmNkLTlkNGItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDEzMTIzLjQ2NzU1MSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScUzk6qu1RnjWQldmFeBiApbj9E9WGtJbWGlTF1Zun5MzxEAXX/HOnsklxKLsn9Awdjd5TGLjsWjBMwycYh2Fj2SiUlTbRh6d1Wv3G6UzOwH2adMpEE/mKGu++YjdazicIMdxKMD30Mx8PWd/fW94hku/kZD2PCsExEskr3ssEm2FKv7aqNk4uHZxfvlMTkYRKvAcu+m9HyyUyiu0TDcvvaS+5ew7SXNlSNlv9tSLevaTCggTIvUXvUaW+AijE7zZ0+jCiFSYJu6IHRLMaDGrZGLy/9oQkgpMczjkmKO+brhmcVz/VXiKvyzNEs7CpW7DYZqxqAeBLDtiGS9ypCN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qx0dw3guOB3XMuPqs5dm8Tr2WH50uT+xQ2WTwDKtohI=;
 b=HR202OX+zTioKlbfLxbyztQ2T0KZPsBxB5e5SZzGom+8TuIqDAwinRln3IQerTM1DEFI62+Zp7Lj2Rw9Mm1oJTukFnifuctZb3ps2MwUkTq6gkMjwxA2MJ7cNqVNgpNfjztW4381t1IpN/brrurWiw+Jbs3O9qhGPMoteevEtY6087JrXT+S7uZHYtKzo1ISGSwSubT2hfGeLnAwljwx+2qnBMmy+SSamFZvE9wko0GK86uLKU7qxfcS4MB2XcJAb1iEx5/DSIswUqR0O2f5Y0YRcl9OAJbMtzOx9Zt2vawUNQhcnCFEV7+FGkMlclQCUgfEno2sTVG/epWc59DpGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qx0dw3guOB3XMuPqs5dm8Tr2WH50uT+xQ2WTwDKtohI=;
 b=XY4J06FgBDSLLzRw1LchwwSvrQt1njBtdNLzaefVy0oslSrhMHa0zFID0invHpOeDpAXlI5/NdENibUxEiPmFQR8gb9aSi5OVlfGBeEvM50dHEcINk3fISesR1Ti2d63vFTgRGNx+9obaOHhDVhEWnl0lOjGDUXgORh6gTTg8aM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eb450574-071e-48f5-aab2-0af469b909e1@amd.com>
Date: Thu, 7 Nov 2024 15:58:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-11-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241102172551.17233-11-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a5e219-2ca2-4c66-476b-08dcff6ef3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME43bjRCODJGbUZNUjhJcWRYNmtBeTRVeVR4M3VNM29PNHJBeC9lZ0hYRTVL?=
 =?utf-8?B?aFE4bzdmdDAybkxPaEY1RStmSHZhYWExRFZPMTFYV1pwYkcyVjJNVGtBYzBi?=
 =?utf-8?B?UGtuT1QvemZ0a1QwTmpBaGo2SS90MTd5OXYxa3BONnV4cGcyZis5OWo0WnF1?=
 =?utf-8?B?Rlc0WEhOdFhoR285cnRKcGw4NjZjN0l0bXFqUXZ3UGw1R21vOHlrdWFiaHFF?=
 =?utf-8?B?TS9LWWx5ekk2THdrTGlQMTV1RFdvQlpGdklJeVlmV3NOUCtsUDYwVldObnFR?=
 =?utf-8?B?bVF6T1ZjNWVLTGFLZVdON0dHdE9rRlluQ08rZFF5dFFDdnpET2hZSXVpNllH?=
 =?utf-8?B?cmkwR1ZPb0pCQkx3eWhhaHozcHFKOU1XU2RGaTBZZlJ4Q2ZISlh6WEtNSnpl?=
 =?utf-8?B?YndrY01FMG1JaVQzK3pvRzhDZ1ljVEVCSHRTOU5pQ2FEcERsRHJPd0dYR0lr?=
 =?utf-8?B?QWJ0a1JuN05FVDZhaUJJUjlteGR1aE1zRnExVGk2WVZydTVZbDN6TkJYSnNi?=
 =?utf-8?B?bUVMcjg5d1V6OFlCYkhIZlRlcXROd1RTb1l5RTFwMFAranZmT2tTMWFOUDdv?=
 =?utf-8?B?V1JoMEFXbEt2MmY3elZTRllNUzBrcUhlKzdFelVIY0gxT25mckt5QWllVm9J?=
 =?utf-8?B?bkNDbHJuUmpmYTdjMmpxMmJjWlMvbTBkNzRwRldnN2QwcW0vU1ZQaHNpb05J?=
 =?utf-8?B?Wm9xdGwxMlNLdTEydGlKRTVqbkNzV3lCekNLTXBid00vVE9LWWNiWjJVYlJU?=
 =?utf-8?B?T2ExM2pHSXpMWVkyWGZsa014OStWSzFrQzQwUWxVOXpjdlRLMWh0Smppa0ZY?=
 =?utf-8?B?UWZqUWpXYTVXNU9TUjlxYXNNTEN3bm1ZTkRVNUFnQndYRytzNXBaRlF1RmFr?=
 =?utf-8?B?Qm5DVWRnaTByMFhsZkEyM3Rab1QrUGhOOHJQcGZiNTFJZlFzVE1aNE4vYVlt?=
 =?utf-8?B?QzJmK3dxNW1aSjczNFlVV2laNUViZE5PUzdNMmlUaGxKMUlnSUxCUEJwNzRy?=
 =?utf-8?B?K3VyZktwdnRyTFZlT1dGMXNzc3VCc3MvY0hOQ1hSZjFBaVArZi9tOGNvQkJi?=
 =?utf-8?B?UWNTU2lIUXN1SGN1SFF5NjhmRXVCbVcxRHdxak5LeFk4Sm4rNmUrWVM4K0FO?=
 =?utf-8?B?SzVYLzAyVW1PZHk3clJiSFlENGZBUURjU2ZkNmFWQ21oQTczMnA5YXpWUHN3?=
 =?utf-8?B?ci9tcUtHZ0tsb09tZ0VrUjg3NUVqbVlITSt2b1JZdUxLWGFzb3JJR29LUDVz?=
 =?utf-8?B?dEVNam5WcEZoM3k2M0NvK3Vmbld6c0Z5eFpKVjZKbTZSK3JrM3BjbkI2T1Uv?=
 =?utf-8?B?WWJXOHBJYjNRUXZ3a1hhV0E3dFdrMTlKVG5wK2h6cGNydDZFU0tqMmd0UVpn?=
 =?utf-8?B?VDR2SlpTc0NwVmVjVGtVRThIQVQxUUgxUGltOSswdGJFWUV4MmE1NVF6WXd1?=
 =?utf-8?B?TGZqb08zSktRcGMrNTQxdWxQZnNpUGNXNVZjTmxVZ2lZdHdxWmcrWXlDRmph?=
 =?utf-8?B?MlB4VS9yQWFiUkN5QU5ySEx4N2xKVHkwNXlWZjVDYlpzOUFPb3pkbmg0S2o5?=
 =?utf-8?B?Q0tyQlZDMkMwYTNoaDdYZ0V6WDcvbk5ZaERpeVZMWjVpbXcxZjUzMk5XV3Ir?=
 =?utf-8?B?RW9EcGxjaHVUR1U2S2E0NDM4Q0tmS2laSmRiY3JFYkN2Qm55NmpRUFNjSEZr?=
 =?utf-8?B?czI4Y01WUmkrU2ZtbVdhK3pyVVJLdTQwYUUxMFpTZHZqS0JxY2RFNHNYYmc2?=
 =?utf-8?B?Sno4dlFCNy9oTmdBVWlZSVgrUEdnbVlpakxobmdGcEU4aDRvL2dKL3lHanNL?=
 =?utf-8?B?b0IzbmtMbTltMkxISW93NzFmWU41eEQzcEpCOC9XaG5vc3FiTUxVZzlZWHU4?=
 =?utf-8?B?eXMrdHNxVGFYNXFMWk90cThUOTMvSTNNVEtFY0RYL3FFZFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:58:38.1161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a5e219-2ca2-4c66-476b-08dcff6ef3e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

On 2024-11-02 13:25, Daniel P. Smith wrote:
> To begin moving toward allowing the hypervisor to construct more than one
> domain at boot, a container is needed for a domain's build information.
> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
> struct boot_domain that encapsulate the build information for a domain.
> 
> Add a kernel and ramdisk boot module reference along with a struct domain
> reference to the new struct boot_domain. This allows a struct boot_domain
> reference to be the only parameter necessary to pass down through the domain
> construction call chain.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v7
> - collapsed the incremental changes to the call chain into this commit
> ---

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 18b93d6a272a..6e25a9f726c7 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c

> @@ -1026,11 +1019,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>           panic("Error creating d%uv0\n", domid);
>   
>       /* Grab the DOM0 command line. */
> -    if ( image->cmdline_pa || bi->kextra )
> +    if ( bd->kernel->cmdline_pa || bi->kextra )
>       {
> -        if ( image->cmdline_pa )
> -            safe_strcpy(
> -                cmdline, cmdline_cook(__va(image->cmdline_pa), bi->loader));
> +        if ( bd->kernel->cmdline_pa )
> +            safe_strcpy(cmdline, cmdline_cook(__va(bd->kernel->cmdline_pa),
> +                        bi->loader));

I'd indent bi->loader so it lines up with __va, since bi->loader is the 
second argument to cmdline_cook().

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

>   
>           if ( bi->kextra )
>               /* kextra always includes exactly one leading space. */

