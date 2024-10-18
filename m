Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5C9A31B9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 02:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821489.1235326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1b4v-0007ZK-RT; Fri, 18 Oct 2024 00:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821489.1235326; Fri, 18 Oct 2024 00:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1b4v-0007Xm-Oh; Fri, 18 Oct 2024 00:42:53 +0000
Received: by outflank-mailman (input) for mailman id 821489;
 Fri, 18 Oct 2024 00:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paTR=RO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t1b4u-0007Xg-VU
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 00:42:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2417::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7194871-8ce9-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 02:42:51 +0200 (CEST)
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by IA1PR12MB8518.namprd12.prod.outlook.com (2603:10b6:208:447::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 00:42:47 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:408:20:cafe::f1) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19 via Frontend
 Transport; Fri, 18 Oct 2024 00:42:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 00:42:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 19:42:45 -0500
Received: from [172.21.242.153] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 19:42:44 -0500
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
X-Inumbo-ID: e7194871-8ce9-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opET5GyILpUYiawNrdmM6DVi4sK4gltuYag5lJzDt9Hd/YUBx65jnsS5LE4qDADY6zwsBPluNda8sF+uqItZPAxQcB2OlQPHouSeaYP+6drPMFYfzrMhDA4fCOQGGKQ6dCgAcDb4fk7w5rvvyqfF6ZTCvek0Fq6l1M1JNXLbJoH9jhFulyMRBcgkpmDQtWokrGXZxaZZuadAoK5FjedtHQRCd12svircPjqNrFJi73iJiKdtBzKCuMUkS7CXl514CQwAth5F/byjZnVgf5MohcNe3oG2DWVZyxrZErpzI+8AyTTG/MNaSz0oZaxpCDx99u8BB35rbnpYM0f0JzS7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSrMqtuJMc2lXNjsjYK9vb2y0nNh0jXdP0MkdIJ7OLE=;
 b=SBTp6eKN4KjRBzXqEDr/enN0+qth4brJxzYN7hUWUmQKJoBB7KbVXDtu08Rx8kfIYZq0FYDoPcX2abCvity68+vCeVshEyeCtzndl+9osk4qeOrvpYWaAt1MYMaF/vJT1Sb4yTJAzkwp6SP4jXCeovJKaQBMyu0cHce7iBayffvukrzBN67nrQdgMIOnk08rURH92OVnAik2T/I94NEkYuYMTFj2eVLk8wY4czaL5Tpq/dSCKGtZ0d9vdznvojixVavAdOUKGXXRN2VQSSQfixTLPhqAhYcL7yiT4sN0tMrHJWLVIJgA6S/0pDIu77xfdfVgFsCTAURQ00oQeSSKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSrMqtuJMc2lXNjsjYK9vb2y0nNh0jXdP0MkdIJ7OLE=;
 b=h31MqlrWNDd4y0nI2B8c/6ISyicDajAeAahc441laK4CIQ7n7yvNLl2S8o9+xr4bJwJ0rmX01dylWt1FqC96MEk+6qsdwIr6zDvHKp2PC9NmyulxtF6lYq6NhfIm/UwA4/Q4n1b6QcKxz4RCiXmvzO/9zrphsW42Bka5UmA4bZk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a94f876a-5f9a-4f21-be28-f4192c991337@amd.com>
Date: Thu, 17 Oct 2024 20:42:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/44] x86/boot: transition relocation calculations to
 struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-14-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241017170325.3842-14-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|IA1PR12MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d7e7db-5d99-43d8-a9ac-08dcef0dc936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnF4d2dqNVVqYzFKOER0MCtKRHJKeG9pc3F0Uks5Z0UwTy9UbTVQVjNZMjV2?=
 =?utf-8?B?dkZ4a1lteGo3V2hDdjM0NTI4RlZaYnRPVDhOMXVUNFk0bXJrNG16OFR2V2N3?=
 =?utf-8?B?UTR4a2xjVWFEdGRPYTAvenlmWDVMSTNyNGhDVU96c3lJQzNqVlRXb0pGai9K?=
 =?utf-8?B?aGwxOXdLdFJQcTNEeDNwL0pvSWF0YmgrcXBaaEhhMmNHMVJLaVN5QkM0UElE?=
 =?utf-8?B?SzBpSkI4TENJMkdjeXFQWFIzVlZnczczQy9QN3Y3QzJlcG03QktBNHhjNTBO?=
 =?utf-8?B?clo5WTYwa1pscGhrOTFjRnNkc1djN3NKa0tMN2R1UFRPS1R1eHFKcWNCcXFo?=
 =?utf-8?B?cld2b2JlWVlva1JGL3RRb0sxdDhrTm5qREhiQXZYeGsxVmpYVDhlQUxCTkN2?=
 =?utf-8?B?TzRaT25Hb2JvU1JlMVkxenNLL1BNM0tkdDUxTEMxR2poOHBpYWhDblVCZHhQ?=
 =?utf-8?B?REI5UkpVSTNHNkFzVjl2eGt6TGFDT3oxWHZMVnJ6eC93R3FIMC9qcTQ5TXZM?=
 =?utf-8?B?TmNZTnV0SWI4VVRrR2RRNEZ0OTNndXd6RFp0K0p3WVk3eWVUWVNEQzVDK21r?=
 =?utf-8?B?QUhpajVraTNubVdCOFRrOVFoT2M3TUxSTTB1NDQ2UHJ2K21lbmg5WC9CZFdp?=
 =?utf-8?B?UkMvNi9KbytDcVRqUXhXS2F4dEYvbUxiRWdmdldlcGI4VjUrMmNFODQ0OXlj?=
 =?utf-8?B?TWRIZDJYVmduZ0ZFZm1JR2w5U1hBS0tvUyswMGorZkZPaElYa2k0MnhwTXpR?=
 =?utf-8?B?TU1ob0svbXEvWE9ibFgxQzgza2VSMFJWNTBibU5nRmF6c1hZTU1ydnBLakhZ?=
 =?utf-8?B?Y1VweWprbGxQUUo4ekVjYjNNa2V6ckMxMFZJQWc5K3FJZHcxUkNSVklxMytm?=
 =?utf-8?B?RnU0Tk1JNk5naTdNZ3ZCRU9BMDROa0hjbk5jdFpYSjJsalBhWU1ZcmI5dUVE?=
 =?utf-8?B?R0c0S2YyRVNiZzV4bVhsL2VoWU1MUVhzaXI0NU5rcHZQcm1SMzJWVGl1QXlX?=
 =?utf-8?B?bHczbHlKeHZCdHQxWnUzNGdiZFFjYmNuUUVHVEE5bkRBOGhYRnpNQnovYjBU?=
 =?utf-8?B?RUNkMmg2cmxYalUrV0JKS1V0bEt4WFRkc0tKZUtxbFk1d1hxUzVOekFSSkU1?=
 =?utf-8?B?dnNmWG93RmhsTXZ0SXJFK0VHNzluZmRXV0VTVWhIMS9PLzlVMUx2R2poSDJ5?=
 =?utf-8?B?dmRNY1ZHY3J1OXdPVDZlcFhJejVuckQzQllTTVZjTjQ2M1R2RGlPRUFBZm9v?=
 =?utf-8?B?QzJnRTVKQm5xNXh3STFRSUpYNWlZdE5UR1pxZHVtQWYvcXd5dGh1TktkQkFH?=
 =?utf-8?B?S3puazFCMGNCc2J2VzFYbytRQlNFZC9tZUNxcWVheWF1ejduUnEzaTZPb1Nv?=
 =?utf-8?B?TnQ4R2hFREhlNnlZamdQdEo2UUJVRW9hbURUWWVvbm1KcWpOa2NzQjlXcGFx?=
 =?utf-8?B?R3NCOEc0UU1RVElVT0RvZ3NqMmhuUytncW9sRVJyaGtyanJxQ3ZHSzduRkpj?=
 =?utf-8?B?a3hWeDQzZTk5N3RqTVZWR0ZoZDlvRCsxVXNNVm94T0xmcHNUWHVCcEtEYVI5?=
 =?utf-8?B?NUNEZ1ladUVsQ1NqTGtjbG1OMkRQV08zYXVtUDlwUmczU053bFdwMDBiZTJr?=
 =?utf-8?B?Mk5FdlVITURUSHowanRsZWQvdWhMeFIrUUJvUWNuSW1LSXUraXBNNm1DMjU2?=
 =?utf-8?B?WW9xSmtHSEdoOU5aTnlOc25LVGovbXhTT0tVeEkydlRLV1lUcWV2ZzJLaTBJ?=
 =?utf-8?B?OHBmZFVGZFU3NDlTNlYyaXN2WlFzKzQ4L1NKa0ZvWUNNeU95d0dJdyt5RlNV?=
 =?utf-8?B?eHdvLzJDeUE0djRtdXFoajVTd04yWTQxSTRSUWVBL1c1eTZpeXlxOEhqNFNw?=
 =?utf-8?B?RGlQa3poYXpETkowbGpWUktWNUJuelFKV0pKZWNESFFKWFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 00:42:46.8558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d7e7db-5d99-43d8-a9ac-08dcef0dc936
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518

On 2024-10-17 13:02, Daniel P. Smith wrote:
> Use struct boot_module fields, start and size, when calculating the relocation
> address and size. It also ensures that early_mod references are kept in sync.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v5:
> - removed unnecessary paddr_to_pfn, allowing condition to collapse to one line
> - correct a missed conversion from .mod->mod_start to .start
> ---
>   xen/arch/x86/setup.c | 38 +++++++++++++++++---------------------
>   1 file changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index d51b0b03bc97..44cec48fc877 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c

> @@ -1528,11 +1526,10 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>           panic("Not enough memory to relocate the dom0 kernel image\n");
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        uint64_t s = (uint64_t)bi->mods[i].mod->mod_start
> -                        << PAGE_SHIFT;
> +        uint64_t s = (uint64_t)bi->mods[i].start;

I don't think this cast is necessary.

>   
>           reserve_e820_ram(&boot_e820, s,
> -                         s + PAGE_ALIGN(bi->mods[i].mod->mod_end));
> +                         s + PAGE_ALIGN(bi->mods[i].size));
>       }
>   
>       if ( !xen_phys_start )

> @@ -1686,12 +1682,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        set_pdx_range(bi->mods[i].mod->mod_start,
> -                      bi->mods[i].mod->mod_start +
> -                      PFN_UP(bi->mods[i].mod->mod_end));
> -        map_pages_to_xen((unsigned long)mfn_to_virt(bi->mods[i].mod->mod_start),
> -            _mfn(bi->mods[i].mod->mod_start),
> -            PFN_UP(bi->mods[i].mod->mod_end), PAGE_HYPERVISOR);
> +        set_pdx_range(paddr_to_pfn(bi->mods[i].start),
> +                      paddr_to_pfn(bi->mods[i].start) +
> +                      PFN_UP(bi->mods[i].size));
> +        map_pages_to_xen((unsigned long)maddr_to_virt(bi->mods[i].start),
> +            maddr_to_mfn(bi->mods[i].start),
> +            PFN_UP(bi->mods[i].size), PAGE_HYPERVISOR);

I would vertically align all the parameters inside the (.

>       }
>   
>   #ifdef CONFIG_KEXEC

With those:
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

