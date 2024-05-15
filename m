Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255C8C68D5
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:34:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722460.1126450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FiF-0000W2-Fd; Wed, 15 May 2024 14:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722460.1126450; Wed, 15 May 2024 14:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FiF-0000U5-D1; Wed, 15 May 2024 14:34:35 +0000
Received: by outflank-mailman (input) for mailman id 722460;
 Wed, 15 May 2024 14:34:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTPh=MS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s7FiD-0000Tz-HA
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:34:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cf22f48-12c8-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 16:34:31 +0200 (CEST)
Received: from BN9PR03CA0657.namprd03.prod.outlook.com (2603:10b6:408:13b::32)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Wed, 15 May
 2024 14:34:26 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::3e) by BN9PR03CA0657.outlook.office365.com
 (2603:10b6:408:13b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26 via Frontend
 Transport; Wed, 15 May 2024 14:34:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.0 via Frontend Transport; Wed, 15 May 2024 14:34:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 09:34:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 09:34:25 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 09:34:23 -0500
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
X-Inumbo-ID: 3cf22f48-12c8-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5I5k/828S1h0q2SiFFgvpojhsLSPhpFGGyLvVLMyFoMmbZ88rpFA+Kj+e+BxszefHfF7JfG2JpDK0dmPl8ytiVSxWJO3Xe7fwB3kX7PHwxXgHhzbprwlBBu8YFj3u/wFaARESMcMezH34dENEA0wmdiHJFbqZP/M8l2B8eA9LrsaRjJF2Lq6wnbmsaD+a/kCA2emCNplXg/fVREPHIXZoUUwp6JLxlXO6ZLokUAG07w1PGUB2/ltA4kOYl2K7rbCV4DaJ5TaDvpt1CgRte72tVJGb2dLmEjb0SrFZ0D444sWBQmf8Yo2qYlzOJFLpX2LcVm5j61rM2qntPqRfIieA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=na9INcQpOnXYA2PqNBCo4QBb/elEfAJ15EFW6fuAr3M=;
 b=LRzPQrmturGMSYqrdMWK5ok/NWPAtLVvksJ8uNe39nD/mp1DDU6LvYVrthWJxgFYv4ACDbPbX8dpfMAAd1C4LDVCYmrvI1cCRIi4MamgLIQb6fUJ6oukglC+81eH01tfe8CgHXk4mZe2pSM5c3d+viNRojAOr/rcuxNLXw6yMy18Nmm24TdX/6JvkVjX20WCt3FYgiC0ZsJx7JNVirzuj7GKo02idqftSrrPUSM1BMbxspKGjPlPd1cAGQo/6E3kiy2zS2fQACbbaozAGCiBygw9xURQM1jLB8RbYgWaF36EY8GqKP7W4Qnb96u2zMFXrfzxWZ6OWmJWn0Q4JPor1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=na9INcQpOnXYA2PqNBCo4QBb/elEfAJ15EFW6fuAr3M=;
 b=2A4xHK5NKnLh6/IgjDM4PNN+4HmWlBWV9+NcuIkfp3i07G9GfgepHSDPCUTQ/zkbJdm1B/Alt5IwP0ol4jE49zqTnQV57foI/8ooxFXYnCDaoeSAo/G48XmuWYI8CStJP6K6yp9SJWUCmQEHF26u757ahYXUd4ak+HLsOrVdDdc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <04e98df8-439e-4b17-9444-0bba19dde635@amd.com>
Date: Wed, 15 May 2024 16:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/15] xen/bitops: put __ffs() into linux compatible
 header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Rahul Singh <rahul.singh@arm.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
 <4ef575389520479cee0a79fccfc20e6891594d61.1714988096.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4ef575389520479cee0a79fccfc20e6891594d61.1714988096.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5f7ad3-2b0f-480f-c2b7-08dc74ec1f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXZvNm1ESHBhekgvVyt1QlZrUEFsWi9iOGNzeU43RXFRSVBrakJvYzVHNWdV?=
 =?utf-8?B?bGhZa0pLZUg3cEJyZElFTGN6a2svOEdUanRaQm5KczRmejMxVTArRloxSE4y?=
 =?utf-8?B?aTN2MGQrN3Z3VERaQ3hlZHJjWkZGKzczQWhhQlgxTTNacWdkRmNvcnJSK0gw?=
 =?utf-8?B?QXU3WWlGNDM5dkwwcXJDMGlLbTA2NTlxK2p6ell4SDdvR1c5NzR5NFhGSTlR?=
 =?utf-8?B?dXl6N2l0b3REMVVYRVJ5NmJvNXRkUWdlY3pnaVVuYTArekFDeENJWlpsVUtN?=
 =?utf-8?B?bWFxN2w5d1g0UE42c0RJSFRMOXI2VmFSNmVoNHFoY2hDZjJvQnVrQXd1RnZ0?=
 =?utf-8?B?R3JhZGtob0lES09jU3ZDcWh5R0ZndkNvUnFUbHZhaFNQb0tROWVHWnBSV0g0?=
 =?utf-8?B?T1R3K01zd3hSNGt1VHBBNXRETWoyMm1GNENzVHRoWHhhWjcrVVBLeVROSk1r?=
 =?utf-8?B?NHU4RHgrTjZWMjI2MFNZM2RkZjM5TmdGVHlEak5mVHpzSE9DS0NhVTJoSXpk?=
 =?utf-8?B?SW5KbG5vWWxpQW1YRFhja01uUDRpOFIyNzVjY3Y5d0ptMmJOK3M3UitSbUpu?=
 =?utf-8?B?Y2laZDNQcU92d05Od09wZ0NXc0RZS2YxSXQ2cjZkZEhwUlgvSGcwemI5M1Ja?=
 =?utf-8?B?aUJIajlvditIazhsRWdhSTFFRTc1WGVGdXlyNmh6MTd6dEIxSzJSTTFiVERB?=
 =?utf-8?B?RmVIVTNxRGhBNEVjS0hSR1BMcnBXdzN6eWp1YjFZZzdYN3Jvd1lid3VQNVVu?=
 =?utf-8?B?UFFBaDBva3FyNm5IMGpwVERucSt0bURUMDhod2hOZ2xlL0hjWVlZUDdBMzUy?=
 =?utf-8?B?RUxPcTIyb1hlcFphR2hDNmV4WEZtZDNmZUh5TEtneThpMSsxeG1DRHQreFoz?=
 =?utf-8?B?US9oOGF2WTdtaWowdzhkMkVXemQ5eDRJOVdIRmJydXg1cGZMZzVTazAzc3RR?=
 =?utf-8?B?eWRJU0NCNWlWYkx6MFNxZVZLWlJZN1JRL1FoK1NqNStmT0Z5MFRDSlhkWVI0?=
 =?utf-8?B?S0JHUTRVZWl0dkR2bUVOWlRiVDI4L3Z5M3F1YlhVektiSjlVQTk0Y2h2Umc3?=
 =?utf-8?B?OXVUdmVTa2FCSHR6THFUTGhrd1lwRHZ6YWJOTlBqczg2c2R1UXM0VlBQY1BF?=
 =?utf-8?B?eXEzeXBCMlJRZmFBYlNlTDN4VVZ3bytidVJXQ0VhdHBLUjBVVE96aVNWR2Vy?=
 =?utf-8?B?a2NnSVAxUFdOS1djR2FJemxBUWFTRkpUalhBendKNGw4b1RmcXhORGtRRHUz?=
 =?utf-8?B?M0M2VEw0NW5EaUdIQ3dTaGgvMCtzcXNpWXJyYzhtVml2eE5vVDNITUFTdTBM?=
 =?utf-8?B?RzBocDVUY1VGOUswNUc4WWlMdEdhSkIxNzdPdmhPK05OS3lEQXdNTnVHZ0xp?=
 =?utf-8?B?Mm15VVg4WkhmTWtLQkpleFExbWVEaEVvRndhcE8zY2hhVzdNcWthMk50WHNE?=
 =?utf-8?B?Q0RZNksxQlF0TXFEZDVLUEZHYldMZ0N1bEgraW1VSEpvQUtyUkRJYXM1M2dP?=
 =?utf-8?B?ZUVGZEhGVmZ0VDdLNlE4NWxwTElrSFk0SEp6RnFEbXpwSXBsSXA5cGRPVEhW?=
 =?utf-8?B?ME5wU3NFbERaNjR3emNWVjVzSlUrUXBwK3g2WmNJNmczejZWZFhrWkRxZGxi?=
 =?utf-8?B?SS9uV2FMWUhCeGRPcHlKcllwM3hnUkFLaDVOc05rdTFWMlAyMGQrbm81YjQv?=
 =?utf-8?B?QXZXVjJoZFpZS0UvRk54ZjdZQ095K0ZTWk9Gd2NDWUd6b0RYOExsQXRWTWdE?=
 =?utf-8?B?c2RESFVDM3BZVU4yd0xXZGIzT3Z1OWhScU0rZmZvelVSLzJVUWd5R0R0MlRv?=
 =?utf-8?B?VkNZZzkva0VJbzRSYzJGZz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 14:34:26.5854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5f7ad3-2b0f-480f-c2b7-08dc74ec1f51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397



On 06/05/2024 12:15, Oleksii Kurochko wrote:
> 
> 
> The mentioned macros exist only because of Linux compatible purpose.
> 
> The patch defines __ffs() in terms of Xen bitops and it is safe
> to define in this way ( as __ffs() - 1 ) as considering that __ffs()
> was defined as __builtin_ctzl(x), which has undefined behavior when x=0,
> so it is assumed that such cases are not encountered in the current code.
> 
> To not include <xen/linux-compat.h> to Xen library files __ffs() and __ffz()
> were defined locally in find-next-bit.c.
> 
> Except __ffs() usage in find-next-bit.c only one usage of __ffs() leave
> in smmu-v3.c. It seems that it __ffs can be changed to ffsl(x)-1 in
> this file, but to keep smmu-v3.c looks close to linux it was deciced just
> to define __ffs() in xen/linux-compat.h and include it in smmu-v3.c
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


