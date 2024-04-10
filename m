Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E0D89F090
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703039.1098840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruW2s-0007c8-MZ; Wed, 10 Apr 2024 11:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703039.1098840; Wed, 10 Apr 2024 11:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruW2s-0007Zm-Jk; Wed, 10 Apr 2024 11:23:14 +0000
Received: by outflank-mailman (input) for mailman id 703039;
 Wed, 10 Apr 2024 11:23:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruW2r-0007Zg-Bk
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:23:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6c9f591-f72c-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 13:23:12 +0200 (CEST)
Received: from SJ0PR05CA0064.namprd05.prod.outlook.com (2603:10b6:a03:332::9)
 by CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 11:23:09 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::90) by SJ0PR05CA0064.outlook.office365.com
 (2603:10b6:a03:332::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 11:23:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 11:23:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 06:23:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 06:23:07 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 06:23:06 -0500
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
X-Inumbo-ID: b6c9f591-f72c-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guKMcE1Yfb//Lo38t9iKQkjqvyjAwQ9FmbjnwAqb5NLBIOucexZw2zONuLNZwUyzRCNR/tAugHc3STi6ugwtVpIXP7hhX54x0yKaH5HKj/8qTxkndjU/RfBkREBIZRiUTXl9q/gCKgisIuDdJBrdWcP4mkd7y6zsQGjuerZFY9q1HKFTBJMQkXeRTFsu5b9vHVsGqaHyrzsdWkmJbyEWb49DHNKH4d8eNKPTJkk/YuehqID9d96Kzo3lfTuzQcfwBJjHqi/+QLBUFhYOxscUnCK8md8z1oUFubBoVzqniy0hYexHz4BaZa8DDKj/buoJnx+vC95c3bSVp7ZAcyzMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbGA5iRZ5pXlMn3s3WZS8If/pZJn3fhxbuHxWXnDtAI=;
 b=VmNc28exBNvWHBZ9osvpC7qPgVMkK56YAB5TcBP/jGWhvYms+wgE7Wfa9ZpRe6sfAH5OZbwX4X3skzEPJ6U0D1BcVfTUZVCdRsSrMHViMvnbC+otd4wgYuOJk/LgCxVjejOV8o6tkdk8LYQM0PAAsSbwMhzmBNK8mAKRx/+sIXtfCyQo4rg15F1YE9IvvtE45W+fmPbYZEgqQ9hw/nufbqVKrOLfTsq9DBrqEq94cHawQ950QC3fHMCOZSsnRVui9h+/Tmy/TdtXLNnM/WNSWdk6NBNN+TavuxBRfXbsuKrVW80JoJ1Jndo/gg3q+xtbBNLY/p9/wcIVzcbNR3UpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbGA5iRZ5pXlMn3s3WZS8If/pZJn3fhxbuHxWXnDtAI=;
 b=ptM5Hoom/WZG0yAA1GoQhhhxkjE6pZ4WKuVtJF4NvLePwcV+IUx+Y4xiiKDpgP20U+3DJc+kab4327prtIgFXS+V47KpnBR/C3cdssFc4V+kmgye3qY7NC5CrMEG7joFbd0vTauBU0iGMJF3VxIWsodWDxB5T6s9nIXv85jyz48=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1c2fe516-0a92-426b-85a5-f75f1b43cbca@amd.com>
Date: Wed, 10 Apr 2024 13:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] xen/arm: Reduce struct membank size on static
 shared memory
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-10-luca.fancellu@arm.com>
 <36108be2-d950-4839-a2a6-06462de7e952@amd.com>
 <045818A6-3E13-465B-8DB6-067877B8A035@arm.com>
 <698db158-fd87-401c-9c13-5b94f973436d@amd.com>
 <F5F625A1-094E-4AA8-AF8F-1CE61098EDFF@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <F5F625A1-094E-4AA8-AF8F-1CE61098EDFF@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|CY8PR12MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 205e92c3-25fc-4411-cd20-08dc59509990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	25GlbadcG9PChJNlyr9Wzw2lqlyW/vwqvHH8MpFNbJFgPA7JB6ft9VpKHom413N7pOOgU225Qn+loQ6J+aLu4wyqVUeiIsXkZWvQ3Lu3iq9yN0i/M2CFePYBB4DR2S2FTC27zbjvMZoPpG3CoqY/smAOLnhvqwH6OQsbVs7GHnAwnaKYaIrVrPYMQttk31cxA4NR/8LWJNl3nsdarU6brViWEIuX/iTkC8nFi3FpMWJORzbxY1FGQk7xwJWMxc2X/seShgcVOVNkkVvDkLqvoZDgLvZj9SW5ds4SMrO9TT4XkUeNTuhXJ7VC1TBXqFCgvcCHA6OuDBLX2Sb4RHqu/SycVNM1oEdw1YNb4bhdsfK3tmVmzuPmj3tDtr20QzP1OSu+fm9p/oK+gC1XszrK4ZVefoE2n5F6+a5Bq7a/RYTZjZGdrqs7PFzMNE7TFxwRoTvAtrt6IVwsMLvKD7XRCWTNjfPbGxjWif4+iKoVH34WLCuN8k93uyl1sRJrzXCCxnzdjipY4kxgPhTxX6vySHxOANnWNo/SRbAyPOiAH8EYAmmeY/j5PVswc2ZAlhRMJEqnCRQa+Pm582Uq17HujCZavIruEWLTV8ipRiqIgdUu0kwra7QkQ6g6OqxB+6Tvy3Q4sXW2GJtwC8yeU/xZOR7j+U2HOg/J741ejAvJKRCCeSlPxtQBinyyZK+HFbMhVpEBh1NayTIJ2totbinWdCcje8Eg/pJGgHmEjwNOW6QveuuFhbFri2gVARs0ZzDS
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 11:23:08.6708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 205e92c3-25fc-4411-cd20-08dc59509990
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316



On 10/04/2024 13:19, Luca Fancellu wrote:
> 
> 
>>>>>
>>>>> Afterwards, create a new structure 'struct shared_meminfo' which
>>>>> has the same interface of 'struct meminfo', but requires less
>>>> I would expect some justification for selecting 32 as the max number of shmem banks
>>>
>>> So I have to say I picked up a value I thought was ok for the amount of shared memory
>>> Banks, do you think it is too low? The real intention here was to decouple the number
>>> of shared memory banks from the number of generic memory banks, and I felt 32 was enough,
>>> but if you think it might be an issue I could bump it, or we could have a Kconfig...
>> No need for Kconfig. 32 is enough for now but I expect a paragraph in commit msg that you select
>> 32 which should be enough for current use cases and can be bumped in the future in case there is a need.
> 
> What do you think of this proposal:
> 
> [...]
> hence the 'struct membank' won't grow in size.
> 
> Afterwards, create a new structure 'struct shared_meminfo' which
> has the same interface of 'struct meminfo', but requires less
> banks, defined by the number in NR_SHMEM_BANKS, which is 32 at the
> moment and should be enough for the current use cases, the value
> might be increased in te future if needed.
> Finally, this structure hosts also the extra information for the
> static shared memory banks.
> The fields 'bank' and 'extra' of this structure are meant to be
> [...]
reads ok

~Michal

