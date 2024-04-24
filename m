Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63668B017D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 08:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711114.1110818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVi1-0007Em-2n; Wed, 24 Apr 2024 06:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711114.1110818; Wed, 24 Apr 2024 06:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVi0-0007CG-W3; Wed, 24 Apr 2024 06:02:20 +0000
Received: by outflank-mailman (input) for mailman id 711114;
 Wed, 24 Apr 2024 06:02:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzVhz-0007C5-EH
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 06:02:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e88::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343bdb05-0200-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 08:02:18 +0200 (CEST)
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 06:02:15 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::a9) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.28 via Frontend
 Transport; Wed, 24 Apr 2024 06:02:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 06:02:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 01:02:14 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 01:02:13 -0500
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
X-Inumbo-ID: 343bdb05-0200-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUwrUnXJ0xnOq/cNF9Ar42tHQjh2JwK6DVlDUO1lrIcBIxHViTTD7PJLkIF+BCz0e762o413NRYXH/r5cwH5GG56nTxXx1SMkX6a9/28d7zf9adrsQPMYk9xSXNW174UMPmSmhZRhKrfMw3uwWk2Uh2x1t/tzeGi+yMi3mbJX1QlWILk3HFJfgsn+9/G+pPfKKnEIvijJzg9K4VXs1FuGelTwOIpASze83zEXUHA6C+IAMGDpjByTgKCZOmk60UI3/z16uxLUwI8d0MLis8rEKFM/O9p7kAhVZVbShlXSzUFZjIZUIOAaPCtN5uy5uCbOCceuDdQ14+a8cyUSPVhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1SzlAlu4mvg6KH36iAeFziAGC68TiZYtx695q0ymeU=;
 b=A/aCWeNM6UVIjrsmDXMpcIciTJMjrCz/ZkgTQDsMvnoSKkPxexypdlFVQRHVThRP6aTT6E44QMviooc8qsAgeTfI5sQGlaDLJ7Pp5rqWSaiXW5xDUqRgQa/mEdHDnWGWyyuiYZmGTe1PAhGg4hqk6J6mMhyUVwQjbZXDYnhlvLGGhOFjrMnhNmUSrZ67rrefHvFn1gos2fVkAJTXPoukWcy94IcFlRxjv2ImCGPqroj9jtCj3OvwUOi22stCqSEg/MFr/uIbhaR++Y1+1vOyCkbIPJYXEtoYPhpfsRfOjOW1+AoCKE0MWhVaMfJ1mlKAQAfRutUnVPHiPBmw3O4ArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1SzlAlu4mvg6KH36iAeFziAGC68TiZYtx695q0ymeU=;
 b=GynHEN6i6VR/+qx8deTTPYIHVlII9652H1He5rC5p9RyT68XxbPygzqW1W6orbrTKUDsdJuYm1uWAYoQaeeGtPoTs2HHhIm2o4SOHenBApcAqTyBCInjcwk6pVAQJNJnA3K/a7+63zgZomqcka2tdRd6UgFvFhIcNn+AhZXkh1E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dc095b66-8401-42e7-bc15-b8c8dee1c591@amd.com>
Date: Wed, 24 Apr 2024 14:02:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] xen/commom/dt-overlay: Fix missing lock when remove
 the device
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-2-xin.wang2@amd.com>
 <6cba6a94-8bc3-4302-846e-0eae03e77306@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <6cba6a94-8bc3-4302-846e-0eae03e77306@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DS0PR12MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 0499bbda-bd0c-4cc0-86bb-08dc64241702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC84aSt0QWkyZzZxcnhJNW9laEIzY05Kb0xqbmlEaHNNR1E0V3ZFemxJWFZs?=
 =?utf-8?B?UEF0OHhHS2NEMExETjJEdnB3VENLdXhFczl1QlI2NDlVQjRBS0ZNcFJjSGdq?=
 =?utf-8?B?bGRYaUpyU1NYbWkvb2JOWWUvcERSdmVLc0xtMkg2MjJWWHg1RFBqT0RUNnl4?=
 =?utf-8?B?cXBiSjdRSXp3OEpRbjBwMWVmUFZHRW1HKzE1ckxYOXJJOGkvbHBvYXhNZUsy?=
 =?utf-8?B?VGU4VUZuT25vRDlodHdZajg1Um1YcGF3Q2Q1eEFqTWViQ2NUWXp2WTlTK0NO?=
 =?utf-8?B?a1RxVHhLQW1YdHVwYUZKbG8wYjF4YUVwUUF5ZDRNYXZKYVJTMFlTYXliZFZG?=
 =?utf-8?B?cVhETTJBL1Mxc2N4TGlHR1UxeWRmUk8vMSs3MktPbHU1Y2YvYlIzR2NxUVlQ?=
 =?utf-8?B?enBhdjJnQzZQNHJVeGJyT3FiVVNCdER4UDlDT1FCeTNXaTBNQ1JtM01nKzlW?=
 =?utf-8?B?ZzhJOG5oSHpmUDdmOVZ3cUZ3MGxXV3RlT2lKZlhCd0FtZTRQUXNiUEI1RmlV?=
 =?utf-8?B?UUcwYi9lRWYvVUE2RjNTR2ZBTjRxQmdpdEZKZGJqbVd2UlZwQk1sUk9LbEV0?=
 =?utf-8?B?RGNxdW9kSi8zYjAzTk1qUDluUVp6RjVZSHZROU8vMGtMTkV2ZGZVeC9zTUgx?=
 =?utf-8?B?d2RpL3VxeWRFOFBRVFZUZ0VEZ0x3YThoNDB6ZTIwNFAzUHo5MjdFOVVSLy9W?=
 =?utf-8?B?blZQMjNUTE1QSVBqZGhKeWtkWUNBVnhjZTBaSFJldm96L0pCcmNRNkFDZVlq?=
 =?utf-8?B?SDlpUG0wRk1GdkhyY2puYTZEVXFId0xGbGFGSmJoUGYwVUVpOEhxWTdRSVhq?=
 =?utf-8?B?bVNEWHd3cVJXd0FuTHhLdS9lempOd2tSOFlkQ3F4MkFlbGxBbmx2Q0VHc0wz?=
 =?utf-8?B?bHE4aG92NTVLWnRHSHc3a2V3QzlENUtFajVUbWtteEsvK08xYVUxL2RyTHR5?=
 =?utf-8?B?RGNESWoyT1VVd2g4SC9ma1psWWtXMFN3dFkxWi91eUtmS3ZyZG5HMFV5M0N1?=
 =?utf-8?B?NmFid2kwTWE0QlFRSjVxWmVBeGtlQ1p4WjVodW0zbGtJM3IxNWNKeGZtRHBT?=
 =?utf-8?B?QjhoamV4cFFYQkowN3BVaEd0SlpNOWp1dWxIU2FuWU42V21GeWhQSitiREN0?=
 =?utf-8?B?UWJZbTdiQTEyeWdIVFdkb0RHSmpyUEdJR0swb3ZhYk5QK3hvVDVOMU1QZERL?=
 =?utf-8?B?cXF3ZXpRVFVwWnBTK2l3WFFrM3lGKzllSWR0K1IydXd0TWEyM1JSSEVGakJt?=
 =?utf-8?B?V3RTcFpiVW5CYjJvcEQraUp1OHVkd2h3QXVoOEMwOEloQyszL05aWnpMd2Zy?=
 =?utf-8?B?U2M0MFYwbVI1dzBxeDlMcHpjNFFhSlljWm0yczFSaTY2M2ErenFNaEw3WnZH?=
 =?utf-8?B?MklQemp6UVhCbWcwTDJJeTRDanNVMnVPS0hRZnRNekVTNGl5emI0czkzeEs4?=
 =?utf-8?B?NXBqWUtBamE1bm53a0t3ajFsbTltU3p5SjB0M1JlYkhIRDNpVyt3bk1iYnBj?=
 =?utf-8?B?RmFldlhLV2Z0dTcvR3JEOHVIVkZzWEFyWTJLaE9rb0M1dEdpbjZwc2xNdG14?=
 =?utf-8?B?d1d2MUwyMjBzZEtobmlzdWw2MUdiWW9YTXpEK0dtNVRadkhaTFZETVlyQ1BG?=
 =?utf-8?B?Zy9MaXBSb05Od0cyWXhDL29ObGZBTVd2Tmt3UnpjT2M4QkdXUi9DTnF3a2JE?=
 =?utf-8?B?R0lrejFianZCODNkZmdhRG9BNzhRSjBFaEpoa2pFMWc0UHo5TC9IZmVybnVR?=
 =?utf-8?B?RjVOUzBTOW1NRWtTQnRwQmRSZVlYQVFPMkpaaWw1VjUydXR2MGVUTE56cElD?=
 =?utf-8?B?NTJXaisvUlRqN085bzBQZEpRUXRMRElieHIrL2lvR0g5WndBNmsyalVhOUQz?=
 =?utf-8?Q?7FDnuwhR7AOZs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 06:02:14.6940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0499bbda-bd0c-4cc0-86bb-08dc64241702
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6534

Hi Jan,

On 4/24/2024 1:58 PM, Jan Beulich wrote:
> On 24.04.2024 05:34, Henry Wang wrote:
>> --- a/xen/common/dt-overlay.c
>> +++ b/xen/common/dt-overlay.c
>> @@ -381,9 +381,14 @@ static int remove_node_resources(struct dt_device_node *device_node)
>>       {
>>           if ( dt_device_is_protected(device_node) )
>>           {
>> +            write_lock(&dt_host_lock);
>>               rc = iommu_remove_dt_device(device_node);
> Any particular reason you add two call sites to the unlock function,
> instead of putting it here?

Oh...you are correct. It is indeed better to put the unlock here. If 
this is the only comment for this patch, can I respin this only patch as 
a v1.1 or would one of the committers be ok to fix on commit? Sorry for 
the trouble and thanks for the suggestion.

Kind regards,
Henry

> Jan
>
>>               if ( rc < 0 )
>> +            {
>> +                write_unlock(&dt_host_lock);
>>                   return rc;
>> +            }
>> +            write_unlock(&dt_host_lock);
>>           }
>>       }
>>   


