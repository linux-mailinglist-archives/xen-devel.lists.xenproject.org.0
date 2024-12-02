Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26B89E071E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 16:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846723.1261873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI8QM-00047g-N4; Mon, 02 Dec 2024 15:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846723.1261873; Mon, 02 Dec 2024 15:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI8QM-00045d-KN; Mon, 02 Dec 2024 15:33:22 +0000
Received: by outflank-mailman (input) for mailman id 846723;
 Mon, 02 Dec 2024 15:33:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iA98=S3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tI8QK-00045X-A3
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 15:33:20 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2416::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0caeb50-b0c2-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 16:33:18 +0100 (CET)
Received: from BL0PR02CA0034.namprd02.prod.outlook.com (2603:10b6:207:3c::47)
 by DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 15:33:12 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:207:3c:cafe::9d) by BL0PR02CA0034.outlook.office365.com
 (2603:10b6:207:3c::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.15 via Frontend Transport; Mon,
 2 Dec 2024 15:33:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 15:33:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 09:33:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 09:33:11 -0600
Received: from [172.25.146.163] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 2 Dec 2024 09:33:10 -0600
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
X-Inumbo-ID: c0caeb50-b0c2-11ef-a0d2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIkWkbVi/cAPOf3h5VL1iQnsIqMSMdeYi8JWoo5g+VZ5yTxBN5cECJh1L2OQlM2mLW4Bd0JJEi6djSteCU4NtRvjb71ka3I4++e2YBFg8lsrB+4/tF4RwP+j6Kn2kAbK7e6MXddJLctnto9IZQGK4bz9AODOlwlNRyIaCXcecDTL5ON6atyIJKuJew0Ux4ebxsYjSxJUHApXfm5FsIM8r/xYI9rfVyqDJqPQH5RAS6FbTp6+rbiwG8+VQsQO2zLUOR4pQbCNiCjPPzeec7bdUBQ5egouaL84TA2fJ5e2fbuU8sGrfWkuTt+HknxfR6F7+hIK185poKYk7jJM4Ksp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgruRwCGnpC8s0feqCfANfitgNd0hEHhIo4mt08w4xA=;
 b=QtKYo/iR07W4MZmPWKKP1ghGKTMbjqwMKZllOchUXVt36BrUS0Czu0iiVOQPA3m/z15bNlbCWuDtKnaS5/HaRNKIlutd329qK8/+s0cQv2P+riZiOnhRA3mm4fNpi2Im2GSdIdZoe6DDm5f057wfcmx6B2fBZovcXMkVqK+5AGK13L33DU+QfzwiHX4LUTC8ESurfpuxFL4YoIv3DcfAxOO+LN2VijNqzyNsuAIhT5rPFqVuL74rb+4MUdJjfNmdG/Oz9L8bAKYRW5henEn5C/yA0PE7i37yI75wXlLOiBHXimOxUI+trHhyT1JwXAp/aRF3KEaKoPXHnQtuwE23sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgruRwCGnpC8s0feqCfANfitgNd0hEHhIo4mt08w4xA=;
 b=FHZQG/sdAK3AvQQTTW9T7HO/8EOaIqpiEJ1GbH9RsN+xrtedK4OMVC3s3TtYkqCnXEA+fgY64wLARLZIK4zB1W2gwqLaP/YwON1BXUTqCWgRf/eCBN6lv4BvM649bZlzGfBUvOZkQytrImKf/kFZWcOOCcp+cvoPmh8/mUWBCTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <109dc316-d9c4-4d18-b34a-ea182fad6529@amd.com>
Date: Mon, 2 Dec 2024 10:31:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
 <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
 <7ca79382-251c-403a-9d1c-9afd778bb203@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7ca79382-251c-403a-9d1c-9afd778bb203@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DS7PR12MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: c69e6edc-98c6-422d-3557-08dd12e6a17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEVFWEk3alRHbVRyTEJGVjFwQldLMTdhbzl4cXpndE1PSDlhVVV3dlZpdkli?=
 =?utf-8?B?Z3JYbC9nWWRTczBNM2x1VlFrWVJ2alF4UnZVWU5NalJUV005R2lPSXA3bnlu?=
 =?utf-8?B?N3RYWll4Vk4va0tiZ2dZdEhZa28xdC8rUlhZblR1V2M4L3g1WTJKMmRJWTBj?=
 =?utf-8?B?UnQyR3dnUXVSVmZ4VHMyd1JHRmYzdURwNms1Qkh3dXc5TWlCSU9uZ2VzK3RK?=
 =?utf-8?B?Mm1ZNlBjOWtmVy9LaDJNUmtpUGI2VnFJZUVtcWc0YiszcnoyQjJMclQ0eTBS?=
 =?utf-8?B?UC9NR2lLUDNVR3Y3TjdnODlyOENnUi8wQ2dPL0haekJXK1VwVDBnbTI4WGo2?=
 =?utf-8?B?MVA0ZkV2RkFZMkhMME9IZHpRRmJvVy9ITGhSSzJ0dXM3NmZScEpSNXRrUlFF?=
 =?utf-8?B?NDZhR1BmVmF6UkdRK2lRVVIya1ZyZXM2SFJPSm5LOThwaEl6NlhIS0taQVJp?=
 =?utf-8?B?eUtMV3VmVnVtK2JoSVJnelZiOE8xUUNFY01Lc1JacFdvbU9rcERadlNteUk1?=
 =?utf-8?B?Tk0rTnhCOUR5cnBtbnIyQmNFMy9OcVRRK3VES2NiOXljcmd6YTl0SW1PRDYw?=
 =?utf-8?B?YzRRa2VRN1BjTW5CUzAvSWtFMithNzZOTDIwUS80UHhEampaNE5yZlkyYXZM?=
 =?utf-8?B?ZUp6UW5LcjdVYmNlOFNEMGM3Vk9iQkE1UGgxeG5MYjBFRW5PbFJNbFFvTXNC?=
 =?utf-8?B?TWNMNVVqcUZycU1xRCtka1Z5RG9SYUJDTEV5Skc0bkhDZkxiSFhnY08yak5o?=
 =?utf-8?B?OFk1OFJINE5XT2hIWU82K0dSbVZhNS9ZVXNpRlJPNVF1NXgyeXAzKzQ1NUlK?=
 =?utf-8?B?MkxtWTlielJ6M2ROM3RrMk10S0gzQmFQV0VYNE4yNDA2d0lXZ3RjUEIrcEJx?=
 =?utf-8?B?OWh4aWlFU0hJdTh6VmFYbEJKQTFTUHpPY3RBam9hazhTdmpEQlZXVVYyTHRF?=
 =?utf-8?B?b3cwTGxkT0tUc3JHRnBjbU5CSGdCQlYraUVWc0xMRkpEOTdNcUtmSjhOUnpy?=
 =?utf-8?B?T1hvTXZYUmErU1F6M2V6UzRoaGFMczc4Z09KZUxvTlN5d1hJWWd0L0hWeDl0?=
 =?utf-8?B?cHdidzlWSG4xSnFXY2FVT0NIMUw3dmFFY1dNV3ZIbytsdThpRUxScjNYQktX?=
 =?utf-8?B?V2tYMjdyTExoUENycXYveFNTLzRpOVJMS3NBeWtIVURhWDN1a1BKbzcvRHY1?=
 =?utf-8?B?NUhSbGZTUFhTOEY4endxWVdEN0NEWVVwVllDRTFscjBwU3V4Sk5YVHN3NEpl?=
 =?utf-8?B?Sy9lNithdzVkRnRiQmVhQmpoVlpkSTE3UDAwNDl4ajJMOFNXVHFLTWthb3RF?=
 =?utf-8?B?Y1FuQTZwUExOUjh2MHI2Y0NtbmM0azBrU0dQa0RTT3lLZVRHd1M1Rm9FNWJZ?=
 =?utf-8?B?WGNPZFEyOHNTR3BtMWVmdmVJUy8wV2hxUnBacVlrTFE5am1ueHFSRWVFNFVv?=
 =?utf-8?B?RXkzQWpsUXJUSEZPZUtWTFlGVzZ2OTVGWFZHY2JkRXZyN3RwaHo1bk1STk9s?=
 =?utf-8?B?di9abUdUbE81NzdXL09VcU9zWGNSYUp6SGt6VTgyL2JGZUFUVFlEV2dibzhM?=
 =?utf-8?B?cGZMZUc4TFREc1gvVXhtTUR0TUhkNzJrUU1VV3E2MmF2S1RkUnlSRkh1NldX?=
 =?utf-8?B?YWRITXNyZVEzcjFVZzBud2EwUW9xWlAwR3B5R1pYUHpXbENwRU1qS1JJdFB0?=
 =?utf-8?B?bjZxN3JVWmMyVTF2cldhbmNwRXRYUHVmSzI3OW8wWU50ZTlFZ1BHc0VXaEtG?=
 =?utf-8?B?K1dWVTFPVmJac2hobjZEVWx3UE41Q2I0MnFldXVrd3VrUUY0R0p0S1Bvc2JX?=
 =?utf-8?B?cmZRTnVWdTk5aXg2WCtvaGdKK1Rha0N0aktzTGR4Z0tsYVhOV2Fldk9RUlZw?=
 =?utf-8?B?aDN6U01OaHJOVlZWemZXcjQ2SFZmUkZPcGd1T2hCQU1mT0pzTURMRUkyaUJF?=
 =?utf-8?Q?6yVU3Ypa7zo7NbcYMePLfZfW0+ctJSYJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 15:33:11.6747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c69e6edc-98c6-422d-3557-08dd12e6a17c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8420

On 2024-12-02 04:55, Jan Beulich wrote:
> On 25.11.2024 18:52, Jason Andryuk wrote:
>> On 2024-11-23 13:20, Daniel P. Smith wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/domain_builder/fdt.c
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (C) 2024, Apertus Solutions, LLC
>>> + */
>>> +#include <xen/err.h>
>>> +#include <xen/init.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/libfdt/libfdt.h>
>>> +#include <xen/rangeset.h> /* required for asm/setup.h */
>>
>> Should asm/setup.h just be changed?
> 
> Why would it need changing (and why's that #include needed)? It has a
> proper forward decl of the struct tag, and I can't see why it would need
> anything else.

My question was suggesting to just make the changes, but that was 
already done by Frediano in aa4ad424f0 ("x86/setup: Make setup.h header 
self contained").

I think Dan's comment predates aa4ad424f0.  So it is now stale and the 
whole line should be removed.

Regards,
Jason

