Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DFD9CF28A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837919.1253831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBztn-0004HD-I2; Fri, 15 Nov 2024 17:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837919.1253831; Fri, 15 Nov 2024 17:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBztn-0004FC-FP; Fri, 15 Nov 2024 17:14:23 +0000
Received: by outflank-mailman (input) for mailman id 837919;
 Fri, 15 Nov 2024 17:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuMk=SK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tBztl-0004F0-EZ
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:14:21 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:200a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a055e60-a375-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 18:14:14 +0100 (CET)
Received: from BN9PR03CA0609.namprd03.prod.outlook.com (2603:10b6:408:106::14)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 17:14:10 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::32) by BN9PR03CA0609.outlook.office365.com
 (2603:10b6:408:106::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Fri, 15 Nov 2024 17:14:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 17:14:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 11:14:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 11:14:08 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 11:14:07 -0600
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
X-Inumbo-ID: 0a055e60-a375-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjA2IiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjBhMDU1ZTYwLWEzNzUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjkwODU0Ljk0Mzk0OCwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/RS50gZ7ll50uW0KbGIGPEhlniKGvLY2Pu+0aohVD9dhy58E18MNlimyiYfUgaGnDix7LtTKT405ZwYCPefwGWF2x4xY4ST9j6jgSX6t4+SDObnhote701mWPBxd8LhY70EwrVeefUYkWcxxpn1EhFlp1KN2ID93C16YWS4stwjSKfz0A/AI7D1pm0EzgZJTo6KWvlFptwbTSIVtzAM9sA4JkBNty03BOt1ABzhzPb2F5Yt0U5J42zlcLJvZ4W9SJFTm+mykuHMLFSkBbQu7EnHoXgkdWxCm/at4bKGZEl6odDYNAMBqWrouc54HJW1bEm7LXBPiNKLvxY8OHKG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U27MWjamgrwi1T2d6lRtdMSo83fRLXmhOZbb3c1j0Ik=;
 b=DK/m/9j0j0y52f0YHiFUENcn2aOesJnE+gZ4SSyPu/XCUQUUqhe5QWkAWCVXfM8EynTCXixAwrvwGMIgkcGirvZdPzx51zzAikdsERg2+DTwB0WkCAoAClaIem774RVAaq6jP24cm8ycwao2RoY95OGrXhBbsIgPe5X9S+fWZTwdAsm209jkQdhldvq8ZQ0GEBlEo1GTloECUuIsxAO/uU+KJcjrOW1Y84lAh6kpHbWH57DaMwJhVnYmSWD3GLNTLDr+J5AMXqW6rcE9DVxc+mqAVL6x4TUV+HX9sv65OK/o09zDLbxf+uQowlKUU7jC42Jg69HHoffFtOzSWHTJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U27MWjamgrwi1T2d6lRtdMSo83fRLXmhOZbb3c1j0Ik=;
 b=p8UAyxaGQutOnww8KNMInrQGNMvd49BYS13XHY+o9ShcFC+nKc5Q+4UxTrGdJaLW7st0UBCb52ynIVxXNhbu4bgyxqzG/ior4vNRn1HFiF8w6mjOMzawqLM7HF0EmBv+hhzGkxQtQeIDPgVaPYG2B70tkRsBU7Ud4afwdEEBTOM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <861e75dc-ee82-4809-b225-7b3624059446@amd.com>
Date: Fri, 15 Nov 2024 12:02:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] x86/boot: convert domain construction to use boot
 info
To: Andrew Cooper <andrew.cooper3@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-2-dpsmith@apertussolutions.com>
 <24e23ea2-e359-41f3-be62-6b7bdff4e074@amd.com>
 <f45f516d-cf90-419f-b7a7-7fc91f9f2729@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <f45f516d-cf90-419f-b7a7-7fc91f9f2729@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: effcc8ef-4ca4-4459-2b08-08dd0598eb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUVSVTduRDJaUU1jaHFNUk1Mam9WYWdLTG1JbmdTSmJtR3pqSDErbWh3N2Z4?=
 =?utf-8?B?Q1ZQbFZQRjZDOEpoaHpxWFlHSXV4UFNmQmVBbTA1Nk9MR0JoWFFNRFFEU2lE?=
 =?utf-8?B?S3NBcGxqSm5OenowVUxtWGUxdGEyMXRiWUlaK0FyMk9HdndxRGM3WE1HeTNy?=
 =?utf-8?B?SFlKS0ZxL2IzZTJOSkMvUkVXN1cxWjU5cFhjeWVYRDFvUWNoblFBZ0Uza0Qy?=
 =?utf-8?B?dTR0dXZ6ZDRIMVIvSCtGRDVTazRZak52dnVUbHVrdTFmT2pNN3cyQU93bVk4?=
 =?utf-8?B?eXpMa0tvY1crYm1RQzVZWTNGZGpEV3huaWFnWE9CZkFhcmQwTzRjSlZVellj?=
 =?utf-8?B?VUpvQVErdWJFbFFWazZNVUdjbm0vZlA5OXNMTm9sZi9xTnNpRmNuY21xeTZC?=
 =?utf-8?B?OGpPWElVTTVxaXY1MDc4SXNoVUNjZGdkdkR1WlBhOHRacFo2TnhIcDBqY0R4?=
 =?utf-8?B?TWxmWFFqMFozaUtJMW5JeEJPN0FKNGxkL0phbSszams3dk04d3ZYYWJ2Ump0?=
 =?utf-8?B?YWR3K3RvY3dVSW5PK2l1TjJ0R0RIUysxcTl5cldoNzREU25ZS2J6N1E2Q0ZS?=
 =?utf-8?B?YXdERjhzd1pDZXIveGhuS3VwQU9od3ZIejJQUnRjTGliTlREVmdQSnNUbVda?=
 =?utf-8?B?Vit5bk81VWJvNFdNRDJvWVltZ0QxZ2RYNHJhRjlSdDZYa01YWCtOUXA3VGNW?=
 =?utf-8?B?NWlIbGZRTERGRnBNdndOTk5ORCtDOThybkRlYVFkSmNpM0NvaEhrQks4emlG?=
 =?utf-8?B?WG5pV0sySVZQemVjUXR4RlJDSU56NFBySWRvdG9oazdEMU9kdTBPdEd5ZTJY?=
 =?utf-8?B?STc5Sm1YSSt0bCtiWC93TlpZd0owZTdCamE0WFA2dFRFczdNV3UrZlhTa24w?=
 =?utf-8?B?UTZSK2JIaWNTM1Z3T2oyOHRSYXpGNTdkZVNCaHhPUGRlT0hJQ2gyeFVQSEg1?=
 =?utf-8?B?OElRb3ZWRnZsdUhsZjJiQWJtdHgyVFkxRktHOUFoK0s3N1pmbjVLdzZrdllz?=
 =?utf-8?B?WUZpdVlGU0lLK21VbTRYZmo1bHJtM3MvNVV6dDVBd1BieXFOa2pDbHNwTmJ5?=
 =?utf-8?B?RlBNOVY4RmtEaHdxYXA4Q3p3M0l5K1JwaTVodElwWUpNTDNFbWVUU1BIdmF6?=
 =?utf-8?B?QzIvL1BPclBmS2RielQwZEVOZExKV001a3FOdE9wM0hxc0tYTnArSmdBWWxM?=
 =?utf-8?B?MTg1QUREZklSTXRJbW93NStKbDlES0VaTlh1ZXc2NU5YTE1pMzBTZThrU05E?=
 =?utf-8?B?MkJ0UUlDTE1jTDJtcnJjNEo1ZlQzUGpXWU5kbk5ZNmRkQjdFd2RKTzBhSUkw?=
 =?utf-8?B?UTZOczdhaVlqRjVnckEzR2ZXbzA3OFZGdFFlR0FMSFRlcUorNmx1cHM5K3FU?=
 =?utf-8?B?V240Uy9qNlAwS3VZb0VCT1dPV2hyWG9vWC9jZnF5S2x1a1hBNWlUdno2YXpa?=
 =?utf-8?B?emhHM05HbHFrMGdFSGhZd0d1WmdXczRoVmtkQnVxdjNheTEzcE0vRklvdm44?=
 =?utf-8?B?L2VaZ0xydURENEtoc0NyUWtaaC9XSWo0cW93ZGNtRTRxc3JZODFaQkN3SUlF?=
 =?utf-8?B?T0d5OGszQUNIdVo1b2FWNlBYMENadUdpdng3cWNRUkFaQ2FWWG11TXFQa2Fy?=
 =?utf-8?B?RkQzTWNqNzhUUUp3NEs1UFovRVhKUGcvOGpFYUZvRFh3eDhXNkhoZTZVU2NW?=
 =?utf-8?B?V3loblhtbjMybEFoajVJbTRDRFdqdzNpcmNta1dxWlJBYkc2K0lZbFpMYlUy?=
 =?utf-8?B?VXdRRUV4aFJPdDN6KzJBWlZlSzErOHIySGF1a0tmSzZVemV6NGpnejZMaUZw?=
 =?utf-8?B?VnUveEk3dGE0QTBWVkh1YlRmcStBZXpTaHUwUHdrTFZXNGw4aUtUbFJFUW12?=
 =?utf-8?B?bUkvbkFRQmxEbEdhRW9hZTYxV21KUE5NanJLVE1DcHhQY0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 17:14:09.3250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: effcc8ef-4ca4-4459-2b08-08dd0598eb18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132

On 2024-11-15 12:01, Andrew Cooper wrote:
> On 15/11/2024 4:33 pm, Jason Andryuk wrote:
>> On 2024-11-15 08:11, Daniel P. Smith wrote:
>>> diff --git a/xen/arch/x86/hvm/dom0_build.c
>>> b/xen/arch/x86/hvm/dom0_build.c
>>> index 3dd913bdb029..d1bdf1b14601 100644
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -1300,16 +1301,26 @@ static void __hwdom_init
>>> pvh_setup_mmcfg(struct domain *d)
>>>        }
>>>    }
>>>    -int __init dom0_construct_pvh(struct domain *d, const module_t
>>> *image,
>>> -                              unsigned long image_headroom,
>>> -                              module_t *initrd,
>>> -                              const char *cmdline)
>>> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>>>    {
>>>        paddr_t entry, start_info;
>>> +    struct boot_module *image;
>>> +    struct boot_module *initrd = NULL;
>>> +    unsigned int idx;
>>>        int rc;
>>>          printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n",
>>> d->domain_id);
>>>    +    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
>>> +    if ( idx >= bi->nr_modules )
>>
>> What do you think about introducing a new define:
>>
>>      #define BOOTMOD_NOT_FOUND (MAX_NR_BOOTMODS + 1)
>>
>> For first_boot_module_index() to return.  And then:
>>
>>      if ( idx == BOOTMOD_NOT_FOUND )
>>
>> ?
> 
> Care would need to be taken vs BOOTMOD_XEN, which could have the same
> numeric value in a big HL configuration.

It's a little subtle that BOOTMOD_XEN could be at MAX_NR_BOOTMODS + 1, 
and first_boot_module_index() will return that for "not found".  Which I 
overlooked when making the suggestion.

>  From a "reading the code" point of view, a range check against any
> invalid value is better seeing as the next thing we do is index an
> array, so I'm marginally on the side of "keep it as it is".

first_boot_module_index() is looking for a specific BOOTMOD_*, so I 
thought it would be a little safer to just return either a valid index 
or BOOTMOD_NOT_FOUND (which might have to become ~0).

> This particular logic can't trip because of earlier checks in
> __start_xen(), and gets rewritten in patch 4 in the conversion to
> boot_domains, so I'm also not overly fussed at extra polish on this
> specific piece of logic.

If maintainers are okay with it as-is, then I have no issue with the 
code as-is and

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

