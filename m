Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411AE8C97B0
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 03:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725788.1130123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8s1A-00059c-Si; Mon, 20 May 2024 01:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725788.1130123; Mon, 20 May 2024 01:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8s1A-00057j-Q3; Mon, 20 May 2024 01:40:48 +0000
Received: by outflank-mailman (input) for mailman id 725788;
 Mon, 20 May 2024 01:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s8s19-00057d-NG
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 01:40:47 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8c0ef78-1649-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 03:40:45 +0200 (CEST)
Received: from DS7PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:3b7::6) by
 SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 01:40:41 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::fe) by DS7PR03CA0091.outlook.office365.com
 (2603:10b6:5:3b7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34 via Frontend
 Transport; Mon, 20 May 2024 01:40:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 01:40:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 20:40:38 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 19 May 2024 20:40:37 -0500
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
X-Inumbo-ID: f8c0ef78-1649-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llM6NhCelw5DeDW6oxQ5PHDXdNaf8GRd77YDtTv9oipksUGue8s8KTAgrnn2xeJB8GbBioyUY7xpB0XT93krw459AY+Z1eboC5mWCBzXD/3cmgw2P2svanXwFw/ILZ4RqUbPAoMPJHNwLuR7GEFM91MYiVqHcEekVPXsgU/JDeo9fy6vks7mAbLdXqTwx2I8BSDKTpf96v7knvorqMsCodxxuxP28LH5zfUP/tMKvFKiPbA/BaSZj0dgsowNVWOyhWiwjRozzMvSjYZYAdqWVUOjFcjQPOmUiJ+TeAOWWYJ2hApFpJijqE4qVylGyZauropxEFwWCEE0vyjrFYcjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEUp9WTVQyswgeb6eSjJSLyIAOn7Qu+yXZBdvP93TQk=;
 b=G5QCBSq2CnOu4iQlOJFsEg+W1DBPpIVbIYNRe/z+ykQqhBajWEk52uTGV+hU2kFZnfahRypIK2lpjk/75083LpaxPe8+AeW5w+7nJOcckAAE4Awn7tcwWlcpN5Tmj2M+5cb6BGhdBW3Kxd3SYbb6gneuvJWdiiyJNTeavOKA7yHELmUcElxEHLsYFgw2ln6iwZiU7f2uzxyISRwxKHGta2YWtmql0cGCXmOs2Euo+8mx/vNk+PFMATKi9gK/yrk+QGcqdaQdrOnRLVOE3BNPObNrnoNMIm6oT25y1vJGccyYAkOMInqDzfoi4T7hF9Ace606ykSxuT6Ubv+UOi1d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEUp9WTVQyswgeb6eSjJSLyIAOn7Qu+yXZBdvP93TQk=;
 b=iAZeGcbT3xwmyaQug2vs87yNwq/WYuuuxPisphYnLW1U5rIK6wvsfgwrvysylKIw4ohxmfJ4Ax4e+6ngXYO4SKaMyyOUECXM6jtMb+vRcK+R3CCZ9NtayYHg1g75CJytu/eq6NwuPXe8Ldue6Cqyi+lnjmL6ZCRxVhi9bBYUW5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e6c9c37f-1ecd-4b76-ab97-b3649503f0ae@amd.com>
Date: Mon, 20 May 2024 09:40:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm, doc: Add a DT property to specify IOMMU
 for Dom0less domUs
From: Henry Wang <xin.wang2@amd.com>
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-4-xin.wang2@amd.com>
 <01825e63-3cf1-4539-85e4-d87fecbcfcf4@xen.org>
 <d208a4d6-8d3c-4bee-a77c-a3f4758ac9ae@amd.com>
Content-Language: en-US
In-Reply-To: <d208a4d6-8d3c-4bee-a77c-a3f4758ac9ae@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a023ac-b53f-48e2-b986-08dc786ddb47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTFsanJNN3RpNWdkRkI1cyswOTVpZ21JZXQ4RFFwMENhVjRueTZ4UjFlMzh5?=
 =?utf-8?B?Q05xZmswaG5SVkphKzlFTEdxRGpER0JKTEd3bkEvTlpMbUc2V2ZBY2xRYms0?=
 =?utf-8?B?K2ZMUTJmQ1RXNlFjZGNQYWJxUG9VVVMxZXFhcUdJNzNpRjBlNkMzeE5tUEsx?=
 =?utf-8?B?NUxnU0hUZjdkMGVWazFnUW1wazVjcTd0VWhkMTdXaG1xM053RGxScEVvdk45?=
 =?utf-8?B?eXoxcGd6cjVNbWFLNWxTL0xBUDQ2dENoZWtnUzU2V2lCU0pUcUxRVlVKN0ZO?=
 =?utf-8?B?ZmhvbUJtaTYxTmMyRHVPS0lRTktSVVpXODUrSEM1bjcyZlBNNis0bWRyNjNo?=
 =?utf-8?B?OXFRaWxXTkxJUWdrU2xaSHdjc0ZsM1RhMFQ4OWJSQ0JwMEFERHB3WXZyYmRn?=
 =?utf-8?B?bjBFT0NidzA2ckVwbCtnM0lnNnBzVEhsMng2MEhLR2Zuc29QVCsvSXpVUlBa?=
 =?utf-8?B?VlBrN05uRExIUWxWUzR6ajFMZW5PcFF1eVlkUEdIYWRmNTV2Zk5YNVFtNitZ?=
 =?utf-8?B?blZ0RCtHbEt2Ri9nZG9ISHhPME9aTTVVRkJnQ0kyYUtURW9ScHZlc29mc2Q0?=
 =?utf-8?B?Q2xRckh5d3Z6NXZKUlgzOGhJK0c4Q3RDMUF0aHJhNWlYSG4rei9vOU5QaG5p?=
 =?utf-8?B?dDZSMlY1Z3FwQWR2K0p1ZmJxd2VGc3dZcnF3eDN0RTU2L0ZOZHNwVW5TSWM5?=
 =?utf-8?B?NFltYm4rR3hQdWhnTTlsa2ZBQnVHR1JTcmxJWEdFVy9ST05HajNqVWw5YlFa?=
 =?utf-8?B?NnN3NEdxRk1mbWszQ2hTWE9VTGMrVU4vSG5uUlV1OVBMTTRzcWQ4Y0d3cGNo?=
 =?utf-8?B?bk9MK3VOVHpkR21qaEl4VGFWOGJEYkpQZldVSFVJVUtrTW9HRC9yQlZCbmhC?=
 =?utf-8?B?VXhJZ21mREl6Y1NnTFQ0aUZnYjJxTlRrc09OTHRGRUN0cG1LY2tQZmlHT3Zj?=
 =?utf-8?B?TGZPbkNQbDJNRUZLMFQrSk1FaHN0MWEyZVFXa1ZjaXIxUmovbEljY3BaYUd3?=
 =?utf-8?B?eE9rV09BcEpIZ0VhK1l6Z0tqVHhwbEl6bmE1NGtVVEViL1NPR2E0ZllnSVlE?=
 =?utf-8?B?S0gvajNTT1NKQysrcUVZQkt3elZBeUhTRDZPdU1raUc5bmJuUHFEZ3ZUc3Np?=
 =?utf-8?B?cTFxNmtZQ1dhZTArMzdPTUdYMVhDK0xOWTIxaHJFd1lPN3JlT0VvalF2ZTZK?=
 =?utf-8?B?RlBuTjF6MjJ6SEFvbXA0dGMycE9kbGhlV1dMcG41ZlhSOThzMlNpZnl0ZElt?=
 =?utf-8?B?bzRlNG1zdkxBa3ZXZUplYmFmVFUxNzQ2bnJrbkpZcXBFeVFDVHRiSzUwYlpI?=
 =?utf-8?B?aEoyM0tJSjBxQzkxempHWUNRWTlBbDBHVXdXdlNVRmdEQk1hb0NEbk8xVlZu?=
 =?utf-8?B?U25RWDdPMUhVT0xjaG04REFEWjNpQ1NTLzZCNmNiemd5MHRSR0pTVStZQ3Bn?=
 =?utf-8?B?emtXTmcvVDNwOXlQM1gzc0lCNE9hZzgxVTRxUkpLMVQ0ckVZaUJaNEY2dE5Y?=
 =?utf-8?B?WmJQR3BrL1ZMMFpUckZOOHRib3paSWlxWVdENTFRQ2RuZkE0a0RzNWVmYjFo?=
 =?utf-8?B?c0RXb01TMnU3QlEyR1h0bGtZWXMydXAyeXFYb0xBRGlTWkwrNy9TY0tsQUpE?=
 =?utf-8?B?ajV4UEpGZkR4K0tVeWNFMlpDZW9vSU16NUJnN0E3MW9OTTZHWlpWLzZXWWh4?=
 =?utf-8?B?ckdzUDFOT3dLdURRSm9TbDdUelducjhNTWF5OW5vQjVTNE9UUWEzYUhWaTY4?=
 =?utf-8?B?Y05uTmVtbnpLWGM0L2V6NG1UK2RwV2NQQklaUXVuTytVS0hMalNmaStJc0hV?=
 =?utf-8?B?dXI2b3l0dWNLSUtpcmRhS09qNGVXZm9JdkRiTlY3d2VtYVVrNGU2ak13VWFy?=
 =?utf-8?Q?TBfb95FQ4fQA0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 01:40:40.2322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a023ac-b53f-48e2-b986-08dc786ddb47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847

Hi Julien,

On 5/20/2024 8:41 AM, Henry Wang wrote:
> Hi Julien,
>
> Thanks for spending time on the review!
>
> On 5/19/2024 6:17 PM, Julien Grall wrote:
>> Hi Henry,
>>
>> On 16/05/2024 11:03, Henry Wang wrote:
>>> diff --git a/docs/misc/arm/device-tree/booting.txt 
>>> b/docs/misc/arm/device-tree/booting.txt
>>> index bbd955e9c2..61f9082553 100644
>>> --- a/docs/misc/arm/device-tree/booting.txt
>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>> @@ -260,6 +260,19 @@ with the following properties:
>>>       value specified by Xen command line parameter 
>>> gnttab_max_maptrack_frames
>>>       (or its default value if unspecified, i.e. 1024) is used.
>>>   +- passthrough
>>> +
>>> +    A string property specifying whether IOMMU mappings are enabled 
>>> for the
>>> +    domain and hence whether it will be enabled for passthrough 
>>> hardware.
>>> +    Possible property values are:
>>> +
>>> +    - "enabled"
>>> +    IOMMU mappings are enabled for the domain.
>>> +
>>> +    - "disabled"
>>> +    IOMMU mappings are disabled for the domain and so hardware may 
>>> not be
>>> +    passed through. This option is the default if this property is 
>>> missing.
>>
>> Looking at the code below, it seems like the default will depend on 
>> whether the partial device-tree is present. Did I misunderstand?
>
> I am not sure if I understand the "partial device tree" in above 
> comment correctly. The "passthrough" property is supposed to be placed 
> in the dom0less domU domain node exactly the same way as the other 
> dom0less domU properties (such as "direct-map" etc.). This way we can 
> control the XEN_DOMCTL_CDF_iommu is set or not for each dom0less domU 
> separately.

Oh I think I get your points, you meant the XEN_DOMCTL_CDF_iommu will 
still be set if the passthrough dt property is "disabled", but user 
provides a partial device tree. Yes you are correct. I will update the 
doc to explain a bit more details as below. Thanks for pointing it out.

  - "enabled"
     IOMMU mappings are enabled for the domain. Note that this option is 
the
     default if the user provides the device partial passthrough device 
tree
     for the domain.

  - "disabled"
     IOMMU mappings are disabled for the domain and so hardware may not be
     passed through. This option is the default if this property is missing
     and the user does not provide the device partial device tree for 
the domain.

Kind regards,
Henry

