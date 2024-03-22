Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E911D886E73
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 15:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696911.1088148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfpQ-0007MQ-DN; Fri, 22 Mar 2024 14:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696911.1088148; Fri, 22 Mar 2024 14:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfpQ-0007Kd-9I; Fri, 22 Mar 2024 14:25:04 +0000
Received: by outflank-mailman (input) for mailman id 696911;
 Fri, 22 Mar 2024 14:25:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lJY=K4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rnfpO-0007Gb-WD
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 14:25:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f77d1a17-e857-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 15:25:00 +0100 (CET)
Received: from CH0PR08CA0029.namprd08.prod.outlook.com (2603:10b6:610:33::34)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Fri, 22 Mar
 2024 14:24:57 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:33:cafe::37) by CH0PR08CA0029.outlook.office365.com
 (2603:10b6:610:33::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19 via Frontend
 Transport; Fri, 22 Mar 2024 14:24:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7430.0 via Frontend Transport; Fri, 22 Mar 2024 14:24:56 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 09:24:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 07:24:55 -0700
Received: from [172.24.153.109] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 22 Mar 2024 09:24:54 -0500
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
X-Inumbo-ID: f77d1a17-e857-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyakiNmcPFK+z/ATpBs7Kk9urmGMkHAFpdATjN38VECKYoilJHLOJ1KTffxlqVl53VMcHEfiYJPCt4VNg5m93hZaKKSkEEWYiIeMV4dKugQRg/a4eIjjWSh/ZEn/27XRu9ad4qMY6bXX9D3m8C0c4CdIAd7evm2Q43+zn/OZ0cQ0Qa7WT0H9crj5Fhk5OxhrqL25TNwDR80aFfLHipL7BliE1f6GpOUZTqXKapLzFMpYb/Oxe1GBu5acZg8evKLstMI53TJglanLXQvTPTiZ6vTXJGvWwyheSOIacf3spCL21gkY9pVFEV59fcQBrxDC4XTmTxAF1Vc6VqI9X0MkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+zLBygDoQy5LOS5f84CNPD8kLqL2PQj/RNpkH+1M30=;
 b=QcdzmkQqhuzgMv50eicPMLSZy4xTFAUWklYJgYbvN1I2Cj9y88ijxkPb1eDuN9I9mzRUkcqPEHzfZPH6iqXstKr67EZlO1KiCYgdqL4Epgvcg1TPK+t6n99Tfdbapvg9S+kVzGnU7LhFDzypqPEJVyHsn7o9m+XuuK/lOrAlU1dQq3Y5gmZzje62FJHfEpoTirB3t9PD2GduFC2ZYYBbvUu/Wqw2RkCjrH+9lG1YqlSpu21ozwu6V+o8nFjv5ppmNt9QbKKjMff6LD9fTT0+zUKCD+HK3e0On2D3ZW4BCqJ5hBFjqCKNjukJEzaJOxYdVwdSe74j9Y0kfXNOhEsTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+zLBygDoQy5LOS5f84CNPD8kLqL2PQj/RNpkH+1M30=;
 b=Q/l/7cXCP4EF82fyl8ubx7j2bpdgul+YQjw/VDvovu23d7OXIsMjeGOqIums/mGNl5XhpUZyxrV2ZqbJN7UjuamWw/2UZKCvEByfZb3TO4DELj2E17J64cCU+2MXQ8BwYjmEJom1/bzt/lpocabjSFkMNyakw4sKuwuarjavUJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <63cad597-b48f-43df-8d53-0ee8c1aa744d@amd.com>
Date: Fri, 22 Mar 2024 10:24:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/PVH: Support relocatable dom0 kernels
From: Jason Andryuk <jason.andryuk@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240319205849.115884-1-jason.andryuk@amd.com>
 <20240319205849.115884-4-jason.andryuk@amd.com>
 <ad5ef9ee-d509-435d-943c-8d7005c823d2@suse.com>
 <183f17a2-cc7b-46c6-81b5-ac1f5daacb7b@amd.com>
Content-Language: en-US
In-Reply-To: <183f17a2-cc7b-46c6-81b5-ac1f5daacb7b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 005e7c19-b179-4508-7ed9-08dc4a7bd975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0CEqw3cMNe5wIRNDfeHxUj6DAr+1Qb12LitQIkYd6ksLZc0Jht07Y4M8sHW+tbAyo/K/4fvJIha3nFUdUjbHd880EcAMU+gldgRvjHMuBi7NB5/Q26UhiEdfvQSRKa96XOxSXc/zi62XRehwoe/7OlvcUeGvAE2I5XA/7MOhvcoxSe22W9ZYiAJhLbMq17JoXtgZYCVIx70gBd16dBNVHZ6uq9AyD3XHdiWnsEJDOHWhj+5JUpMU2+xJnYO48VAXCFuOTpj8ilxmGatx1G1IEaEewzjqd2RvGf/pPq/dYr/T6Xy5qGQWALkf31MT5e0qjPyt5Obov8Rq2ua7i1SDbKNESDrH37TcPvkuWQNpNKZN7Sdajj1PXauFP+po3niOfRsm5kfipr3W58JpOk+WgCpjp68iLEFrraGZVkUdbF+CSA5S0mNQTYvfC4M5rPm/WsfWwpdeGfr8TRc089AUEOWOoCq7iVcunydixVrgjqD7SoLCndsxZaRfukjYJqcnXYl9tFvNwllfi9xA/c71LG5TGkzaRrlKPgkIU958QwGSFR6cdPxB2N3rKZmIt1AOF0NnPwFfSmE7z2jtaqfq21uCdBI8rxfBB5DPbNUZhb6nXwE4EIHyWXMf6f5JvfQMytyjCdRXsXKhbLywYxQDpu1SLJPJxSHcnWazmPbQS/21B4g6T5VHRMSNe9cQO0kcxArAHVDeYw+ze3MIKPmGcUrI3w3r6LM/TfPSdK+IDwh68kNCPqg0twczJhl1JffN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 14:24:56.7056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005e7c19-b179-4508-7ed9-08dc4a7bd975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162

On 2024-03-21 09:45, Jason Andryuk wrote:
> On 2024-03-20 10:39, Jan Beulich wrote:
>> On 19.03.2024 21:58, Jason Andryuk wrote:

>>> @@ -536,6 +565,10 @@ elf_errorstatus elf_xen_parse(struct elf_binary 
>>> *elf,
>>>       parms->p2m_base = UNSET_ADDR;
>>>       parms->elf_paddr_offset = UNSET_ADDR;
>>>       parms->phys_entry = UNSET_ADDR32;
>>> +    parms->phys_min = 0;
>>> +    parms->phys_max = 0xffffffff;
>>> +    parms->phys_align = 0x200000;
>>
>> I think this wants to be MB(2) (requiring a pre-patch to centralize MB()
>> in the tool stack to tools/include/xen-tools/common-macros.h). And I
>> further think this needs to be an arch-specific constant, even if right
>> now the note is expected to be present only for x86. Which then also
>> needs saying ...

Are you thinking something like the following in libelf-dominfo.c:

#define X86_PHYS_ALIGN_DEFAULT MB(2)
#define X86_PHYS_MAX_DEFAULT (GB(4) - 1)

and setting as:
parms->phys_max = X86_PHYS_MAX_DEFAULT;
parms->phys_align = X86_PHYS_ALIGN_DEFAULT;

libelf is arch neutral, so there isn't a natural place to introduce 
arch-specific defines.  Or were you looking for each arch to set it?  We 
only care about x86 right now, so we can do something like:

#if x86
#define ARCH_PHYS_MAX_DEFAULT   (GB(4) - 1)
#define ARCH_PHYS_ALIGN_DEFAULT MB(2)
#else
#define ARCH_PHYS_MAX_DEFAULT   0
#define ARCH_PHYS_ALIGN_DEFAULT 0
#endif

Thanks,
Jason

