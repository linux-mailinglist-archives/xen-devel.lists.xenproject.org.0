Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2010993847
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812432.1225184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuOE-0000ar-OM; Mon, 07 Oct 2024 20:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812432.1225184; Mon, 07 Oct 2024 20:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuOE-0000Yx-LS; Mon, 07 Oct 2024 20:31:34 +0000
Received: by outflank-mailman (input) for mailman id 812432;
 Mon, 07 Oct 2024 20:31:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxuOD-0000Yr-FC
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:31:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2417::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22d021db-84eb-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 22:31:32 +0200 (CEST)
Received: from SA0PR11CA0014.namprd11.prod.outlook.com (2603:10b6:806:d3::19)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 20:31:27 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:d3:cafe::b9) by SA0PR11CA0014.outlook.office365.com
 (2603:10b6:806:d3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 20:31:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 20:31:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:31:26 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 15:31:25 -0500
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
X-Inumbo-ID: 22d021db-84eb-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJJGdRxyt+YKdBCeyRZjY6/7Waj0+DAHQVVgngH9J2QVPeAXd4nfpXR8Qy1wslSW7QdlbeRNycqJPx/CNc74w7ZEs07gx9XySAodP8S2Cxy9znY7gB9LiyqqTrQIkJUpSFnoEs8Vb6lOwb8ingyunyiUYVldjYa8rYDNjfWG/DaX/1vHIczurRYMw33LQHCopY36THwJU5QsgnjPagW7B0o42ExX8y+dm1gCVogZGnWFI1CoEI0Ci4StN2bXPdOlq7jLGMsyncYuVJCTdw9p1xgMLfRaeZhhQko3lE52hSzUZNY3JPT4ckmBlGqHZHg2W/pCWcwmPHekYkXMvq1ZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVgA2uvEditNMcaetxjBNpetmRO/dF8TLAN1iuHd40E=;
 b=F1IlltoEdzsHYw3X5bA5fLZd4OtnJXJY/UIzFNxU6vfb57G609im/F3CUQcGH5shCxZw2+7HhoWQroGisJYV9NrULQbOwn7BZPN+0WxsMo3VC5ccJXSEZ/tpJRa2hIgxvDqWYhFWoWoe1edzVMlZBqgG3E2aZhLGps7vKFwoaqDed2f8TaGuiv6RxBKSGJlGHTwWyEVCLJIo/OVwS4okFGVOtYuWgBYyxCj0yZrtct5Vi4sc7yo59v5e2QdaYwg0DvnnZ3E6nv9Np+Bpge/PlMnvI+ygav5g0dHbJqa8Wil8DU3GNfhY35M7GESp446lsozdNFkTtDq8X3XfmzFOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVgA2uvEditNMcaetxjBNpetmRO/dF8TLAN1iuHd40E=;
 b=VUhDxKFSzU1zbSe7Fg1WcdsJ4dgJEzPBGSJwsK+YF6/8IU61pEkGoTsvhU9qxS0YgY4jUXAxZ58NZwe6HaQM9O/MkgVqQaO4CT3pDrijczPxFGNplAV2JbtaP2rOkARO6zozxGU0bTFTksL1MfYCK5L81n+k93rTP56u2I6nGRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <87771eef-050a-4d2f-845f-cbb053be4f72@amd.com>
Date: Mon, 7 Oct 2024 16:31:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/44] x86/boot: update struct boot_module on module
 relocation
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-14-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-14-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2adfc9-bdd0-4228-9ced-08dce70f04ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eE8rMm41RW9waDEwc1N0RnVrb1FOV0Q0c2tjbExyN0xVMy9ldkVPNnFKTkVC?=
 =?utf-8?B?SE8veDZaSkFNSElwWG0vZXVqZFYwVkk4Z1c3VVFhNlN0cVZJaFBRbnpuakFP?=
 =?utf-8?B?Yi9NSFNkMEk5MGtOSUVtZDROSG9Ec1FCRU5hMnNTRVE3ZTZ4Sm1CcC9MeFVJ?=
 =?utf-8?B?cnU5UUZJVXljakVoaHUwVXBEaURTa3BQdVJMT1g2S1Vjaml2R2NOcTRtN3Uv?=
 =?utf-8?B?VTk2MEtLNUlNbjA3VW11MEkrWXl4RDFSRGUvbzJxQlQ1RnJGcWJya1FsOXI3?=
 =?utf-8?B?N244c1FtS3RUcDNSNzU4MFVkZnFkK3MzOXBZTHpyQlAvU1B3TFZTOEU3WEFL?=
 =?utf-8?B?bnlWRlBKbjMzWFZvOFdDamVnWDFZdFF1QnB0KzludHgvZjZUTU9tRCtBYWpG?=
 =?utf-8?B?TVEwWXpGTjM5V0x5TjVSeGlBUWNSTTlXSTF5NGg4TDk0UGFyQk1OTUJ5V05I?=
 =?utf-8?B?Q2c1emhPbkl1eE8yekJhL0N5U01LcEg1SWMxVUxEbnJjL292YUlqbnM3Zkhm?=
 =?utf-8?B?RFl6SEJCcGcxZ1lZMW9WZktYSkZzWTk4V0pmNkd5MUpkVXdLWkdMdVkwQUFT?=
 =?utf-8?B?dnNWM01RbC8xRWFCZVYzdVh6c2lLN2liZjRCMzl1L09kTmdQaHU0cm92ZjB5?=
 =?utf-8?B?Z1A0Y0FkbG4xVHZ0S3lteWRlVWxZT3RCK3l1M3NwOVlKaVpoMSt4S0syTnY0?=
 =?utf-8?B?TEgxUkJzY0VSNWFvU3hqNnZHUXNueElPMDZqSnUzckxVNnRQTkRDbG0vcUNu?=
 =?utf-8?B?ZkcxbWNJcHVheE0weWFybERPY3hOQ3NEdllUNlBhN3dLd1pZL3FVV0p1V2FV?=
 =?utf-8?B?alhBdHFqY0ttZld3QUtLZXhNUVB4NVhnU3FPaUFISTdHa1c5a1JPNnBRVk1Q?=
 =?utf-8?B?UVVHREhTbzlPNyt4bzY5V1BpbTdkdlFZcmFFek1VTUJ2b09zbFF1ZjR2N3R1?=
 =?utf-8?B?U1NEVUEwbGtFaUlKVkVjZGJDQVJXR3FrTEVETGJXdzVjZFh3eVVNcGFZbEVH?=
 =?utf-8?B?VFJSdFJlKytDbmlPa3NGRlNCWE5sVERlNk5wYjk2UWxGRmZjSy9zRFVkd1Ja?=
 =?utf-8?B?UElNNGc3Z1J3blZVODhDdWczbWRGM3pHMmhvdVVVM2FFb0g3Z0JscXRTYlZV?=
 =?utf-8?B?eDNtdGZ3Tyt0cVZMWHJhL3hBb2UwTUNkaUNONjNyNkxLUU90eTVTZk9KZW5P?=
 =?utf-8?B?dzE2dnNBaUJreHVoekRVY3NzZy9KSlZ4cUFTTHNHNVBFUC9JZlNRRjYxa1NV?=
 =?utf-8?B?R3lUcmZvWSs2MTBlZXZtRDdRR0w3b0RkK3ZsWDJCVFJpV081MTZjYnJqbWFS?=
 =?utf-8?B?WUdsMWlPYzk0bHVUemh0ZzhQVUc5MDJpaktEV3ZkZ1YvdThQVWY2Si9hUTNu?=
 =?utf-8?B?OTh6OFNROVI4TURrdTY2U2NGRzFmVWtTaGNJOUxXMDNTVSs2cTBhSDBValhq?=
 =?utf-8?B?T2YxRmZ0eDJGMmtlVllHSkFyaGtRSFBpbHdzTUNBMDMzOFM4djFsN0k0V2N5?=
 =?utf-8?B?U21ycll6d1VlSzI4TGFxRWNMSldrbGhLQ2k3Z04vVEJLM20rdUhUL29sY3RJ?=
 =?utf-8?B?UFdaNitwVEdQMTllTUdEODBIOFdKL05SYzNtaGlIOXVIWmYyTVFuWjhXYjMv?=
 =?utf-8?B?ZjJGTWtNSHVrcGZFN3dmWWZBOGpSTDR3OWhMN2pvbUl4YjJkZ0FjSHgrSzlt?=
 =?utf-8?B?aVFRNnRxSjBKaXZ6VUVCM3pMRlR0Kzl3b0J3UE90UTJxejlURWkydmFTaHlZ?=
 =?utf-8?B?NENHUitKUGM5aGZ6bDNITzl3L1M4a0VrR3NIZ1pKSUs5RzYyZHhFN0tnTGpq?=
 =?utf-8?B?WThMYUJEVXJXL0UxUmNIek43bURBVFFiZ2pVY2NPUXZqV0ovUzBzSFlPeSs1?=
 =?utf-8?Q?dIbaMBlM5Fee6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:31:26.9899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2adfc9-bdd0-4228-9ced-08dce70f04ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664

On 2024-10-06 17:49, Daniel P. Smith wrote:
> When a boot module is relocated, ensure struct boot_module start and size
> fields are updated along with early_mod.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/setup.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 093a4f5380d1..f968758048ed 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1392,8 +1392,11 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>            * respective reserve_e820_ram() invocation below. No need to
>            * query efi_boot_mem_unused() here, though.
>            */
> -        bi->mods[xen].mod->mod_start = virt_to_mfn(_stext);
> -        bi->mods[xen].mod->mod_end = __2M_rwdata_end - _stext;
> +        bi->mods[xen].start = virt_to_mfn(_stext);
> +        bi->mods[xen].size = __2M_rwdata_end - _stext;

The last patch did:
bi->mods[i].start = (paddr_t)mods[i].mod_start;

and start is a paddr_t.

Is virt_to_mfn() wrong?

> +
> +        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
> +        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
>       }
>   
>       bi->mods[0].headroom =

