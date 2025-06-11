Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92361AD5D39
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012015.1390580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPEV-0007uf-Gt; Wed, 11 Jun 2025 17:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012015.1390580; Wed, 11 Jun 2025 17:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPEV-0007s9-D9; Wed, 11 Jun 2025 17:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1012015;
 Wed, 11 Jun 2025 17:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPPEU-0007s3-0C
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:27:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2412::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5536e2a2-46e9-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 19:27:23 +0200 (CEST)
Received: from MW4PR04CA0123.namprd04.prod.outlook.com (2603:10b6:303:84::8)
 by PH7PR12MB8054.namprd12.prod.outlook.com (2603:10b6:510:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Wed, 11 Jun
 2025 17:27:17 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::1) by MW4PR04CA0123.outlook.office365.com
 (2603:10b6:303:84::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 17:27:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 17:27:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:27:16 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 12:27:15 -0500
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
X-Inumbo-ID: 5536e2a2-46e9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q02sexjmPiKE2cBeBXTByrMMhmf4hcvV7OxyH/FX57Xu+zg3T3DUz44ExsDS5vyBbTPTx3ASbAzMLEKrY9rBAfzvDiiEee/L5HxnOIlJET/ioseX3d2GvNrnfL8Hj5ptpIwjIpzchq80CM+FsVp9BVpoBJo3aD1w1xzn2JV73kCRSf7nEwHBFD+XaXcHowp5mjs4OHN9idIO+YOmC0/iMUl7wdFi9895mSre/AKtBUfu2sZwD8m8z+3qKGJr1xkuTb1qyYLEvxZ94qKkKbT7q69IATHK9zTDbh1tqBi8ZKsvWbDEar5I4CbTjLlzSuBzZE5lu3fj7DHi+s8slOyouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt1ezhVNOiPDAuhq6Fd8EDVtLvjnuzgEI1XEGDcz4T4=;
 b=f4QsVQUAtpDWG7MNrz1wHjk7BaC99dYYiwt8qMSk3PFkpH+Ml+uFHjMSyN2f4/+/i9uFelmb7A7QyykbZfIBD+lEI9s7umSz3aW8VwdKmGlDuO3DI4z4UPROJgsYl3ypCBdSjyMMzwbkebkYzSHG+YUzWt4uRT2JNyuLpq4KPR9mdHzGONGvoPBdpy6Eq444UgFd9s0snhFAs7+73+P4Ep9CrV8J+hE3nf04jSy40leNhRKHXcTuvXPWF4UhWP0/8zqn0fpGek3/9K0OzeprXQkD/wyfOT4923Olhp/BpG4D4yPpdG1Z5EIYrvaPwLxhojK0d4SLE5KEsIrXUKWcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt1ezhVNOiPDAuhq6Fd8EDVtLvjnuzgEI1XEGDcz4T4=;
 b=NQgDzVFME08vuScoUV5l6owQB6CNSZMpstzaHq0jNC/fuVKpInqVwbVLb3XMWFbZ6BsI9JLA8bsjgh54HNbj8PKmYNCsFoH7cbgx/GOccfQFBGbJQD6Qt9axd8wRtatQU2ekjci/JeTnky/FNUZeLJRzGyXQCBJ+VcOOXZ+tj70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bf6924f8-26c6-4f89-8441-155735384a8a@amd.com>
Date: Wed, 11 Jun 2025 00:48:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-5-jason.andryuk@amd.com>
 <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5f6d43da-2600-4c1c-9bcb-f13e8fce921e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|PH7PR12MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d695dbc-05f0-4ca0-77bd-08dda90d366a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUk1UXJmNUlFSG15TlBGcnZDdVRrWlQrYjZZNzBGdEdYcFFqREdhblE3TG9F?=
 =?utf-8?B?KzZYVkNwZFpBWVRlU25vdmVPdUJvUk9qOTdzY0toTENqTVpVQjlybVVUeGI2?=
 =?utf-8?B?WUQxNUxLVGc4SUdmU2tpNDZ4ZVdvRFU4anQxdW9UVVVLcTBtMmdVWHlZSzZx?=
 =?utf-8?B?U2R6a2EvUU1KWHNKQldTdU8yRDJJUjR5bmxrc0l5WVRFQTB6eFRXU3hoQjdP?=
 =?utf-8?B?Q2Q5VTI5ZkZmbEQ0R1JDbWJ6SzRkSGtlc2pNMk9tZXkvQ2FwOGg5SkhGMWhN?=
 =?utf-8?B?VjcyT3ZueTBGOFlCbTJLVlhnRXVoMytpRFR2RHhhN3Fhc0NxZWs3TFFTK3hp?=
 =?utf-8?B?dnNCQWUwVm00Mi93Skl6TUY2MC9RTGZtTzZ0ZUpkVVpvS1JPKzRHcFFsd1kr?=
 =?utf-8?B?NzhrVWNORWxoOXFFQU9lbUVOMG5oSmdmUENRTE5aT2dFNStmOVA0b2pOQ2hu?=
 =?utf-8?B?dTFrZ21nd2dUMlZwbU0xYzNHWlJhWXFlek5ENHF5R2RLTVMwSW1OSi9CZ29r?=
 =?utf-8?B?a3JIZTl1Q1p3WWloYzRLY2NYd1N3bklhQ2xIa0Z3L1NVUkhITnJGMmNmRGYy?=
 =?utf-8?B?Nk8xRHBzbzlBc0h4S3B2VVNjOE1Pc2U4REtyWllrY2pzb1dkRTZScHRlc0N0?=
 =?utf-8?B?RWtMdWZDY2NXTWV3OG1MRWpDbG85bTh2dHlzQXZ5MUZXK211Y0NESlkvWkhS?=
 =?utf-8?B?SlNBbE9nSytVTFNPdVlLcXpBRVFZK1JDek80NEJESjk2U1hzWStvZUF3ak1C?=
 =?utf-8?B?czlPM2IxNVAybHdYWmZqNTROQzlDNWg0YkE5Umo2OHJLZkplNVViQjBscGlx?=
 =?utf-8?B?RGhzZnp5c0ZKUzBOOE9iN2w4V3Fhb2ppMXM5U0NOYTArK3UrVllOd24vNys5?=
 =?utf-8?B?QnMvOW81RlAxUGpHWHNybFBYWTkwRkp0WmYxQ01qUGxQSTVldWpDWkJoa1Q5?=
 =?utf-8?B?Y2kzMks3QWxxbFpEQnRiSHRvRGRTMGwvZGZucTJNOU8zWUluOWJ4TTlISnZp?=
 =?utf-8?B?cklTa1JoNCtiQUtJZmRHMnh3bS9CSS9CcitkK3VPYW1xbWVMV250MStiTUo4?=
 =?utf-8?B?bVhUb1kvNnRsQmlqb0xGSmNqL0V1MDNTNjMyM0dGcGkyUG1tSUJQNmM3OE9u?=
 =?utf-8?B?OEdRSWhpb2VLWVBXWnJ2OGJzaWg3azdmbTNBQXoyd1N5ZWRWY3dscHNnMldm?=
 =?utf-8?B?RFhCYnJEbGFGUWZrOWVmU1NDMW83SVZPRVI3STJ1eWFtamx0dEwzemp5WmJq?=
 =?utf-8?B?QmF3L0w5Nyt0aUtzY1N1L3Jsd0FZUXF6YVBvUWk3bklMVWM3NTI3TVZEUDZw?=
 =?utf-8?B?R3BHTjdIZWhFWUlybnYxSDUvcm1JVnRIUC92VkFxQXYyZm5hcWc2VHRuRzNH?=
 =?utf-8?B?Y1pGOHA5My9UaFoxbXU0ekROV3h1OUJxNW0wQlJOSWY4aXdOSlBnTXFkVjNN?=
 =?utf-8?B?UUpMRE9qb1NVN2lmM2FlbFVyOWV2NUtMMUlWdmZadmlEeUlVSUtzeTZOTnJr?=
 =?utf-8?B?c01oRXFlNE9qRFc2TVZ0eUxyOTU3UEhXRDVDLzVQbXF2T09kMHFKRnVrU0JV?=
 =?utf-8?B?ZXhub09rYU80VVhkTms1VG5sWXZVdUhkdThuOHVXTkwzam9xMVltRnZ6c1Mx?=
 =?utf-8?B?VUV6cE5VaFVBQ2pKTUJxZlU0a0treTFjZDJkYjdFRGRnSytZTmlETW5BYk12?=
 =?utf-8?B?OEhzVU5laTdwYUQyNEYva3Q2L3pOWExvV08rN1FtcnRVdnUzM0Rac1FuRDhr?=
 =?utf-8?B?Y3NhenFYazNGRmJoUjdFRjFKclo4djBzZGpyaVczeDR3Wm9zU2htc2NOaGZ5?=
 =?utf-8?B?dU5ISnhWazdCT0NFQXM0L3BHWkN3S2VtbkZua2JaUWZnQVZjMU1UK09YbGpF?=
 =?utf-8?B?OGpKcUp1ak9reHpTYnJpTTBVdTRlLzRJWlpHOEZCYmVIWDVSSERaNXNydEdw?=
 =?utf-8?B?THBmMzZqcUtYT3lRcUlEMWh6aUtiM0ZnVHhHREhDUjhJSVd2TlA3Mm1KbHZv?=
 =?utf-8?B?S2RDSklhVzIrT3VGcnVWTFZ3VlJ4aExNYzByanUxd0oxeDROOXNzSXZjdHI1?=
 =?utf-8?Q?bqxTlu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:27:16.7813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d695dbc-05f0-4ca0-77bd-08dda90d366a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8054

On 2025-06-11 09:27, Jan Beulich wrote:
> On 11.06.2025 00:57, Jason Andryuk wrote:
>> Allow the hwdom to access the console, and to access physical
>> information about the system.
>>
>> xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
>> permission would be required.
> 
> Why would xenconsoled run in the hardware domain? It's purely a software
> construct, isn't it? As a daemon, putting it in the control domain may
> make sense. Otherwise it probably ought to go in a service domain.

My approach has been to transform dom0 into the hardware domain and add 
a new control domain.  xenconsoled was left running in the hardware domain.

I suppose it could move.  Maybe that would be fine?  I haven't tried. 
The Hyperlaunch code populates the console grants to point at the 
hardware domain, and I just followed that.

One aspect of why I left most things running in the Hardware domain was 
to not run things in the Control domain.  If Control is the highest 
privileged entity, we'd rather run software in lower privileged places. 
Especially something like xenconsoled which is receiving data from the 
domUs.

Running in a service domain is a good suggestion, but we haven't made it 
that far.

Regards,
Jason

