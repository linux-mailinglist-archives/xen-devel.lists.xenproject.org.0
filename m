Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF3A790A7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935806.1337185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyir-0002e0-Uz; Wed, 02 Apr 2025 14:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935806.1337185; Wed, 02 Apr 2025 14:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyir-0002cT-RP; Wed, 02 Apr 2025 14:05:41 +0000
Received: by outflank-mailman (input) for mailman id 935806;
 Wed, 02 Apr 2025 14:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MBi7=WU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzyiq-0002cN-Uc
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:05:41 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2418::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dfde14e-0fcb-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 16:05:38 +0200 (CEST)
Received: from MW4P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::6)
 by SJ1PR12MB6289.namprd12.prod.outlook.com (2603:10b6:a03:458::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 14:05:33 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::28) by MW4P220CA0001.outlook.office365.com
 (2603:10b6:303:115::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 14:05:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 14:05:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 09:05:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 09:05:31 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Apr 2025 09:05:31 -0500
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
X-Inumbo-ID: 8dfde14e-0fcb-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anMscykytJ/bnsdYtzyoQqxklXc2dxMxvioFyj6VOfEyQXag6XbeFh9KPR7qw0icmeHIVLSjuzycHIJADWCGxI9xM3D6DrNid0ZvKGje01YrDocyJGyJ8V927flwexOieOnDx99BcI1iVZpd9Q1XZ4lz0ga2f7T9hxlHrZjWbO+IagXuP0q7xJEVQgP4c/dcW2Oge+saW1zX/3RE8z3iO9infQkVAo0ojcbJDvhjpOFx+r+JmhhB7B4isEm1HzbzxWLIw4+hi8xZn7HPH4QMiJFz2ttcgpZVebETxbs2/K7qL28oFrU/F3GL+syfTnSxBiXYYfobYn7caMIUh3dQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QfUJLszbI9BishTllASLZuC8witncdVXux36r4o72w=;
 b=cg/gy62laxlKsWLOzB22dmX/2qN9C9NlDRtPPLnOoZoqDzaV/46th+7c9NlTLxk6FyKnGaWsFdlDKHUlvL+mhenwmNLEg0wV56CRgZubBCBIif0AyzE9DrXF8pV5HFHiXe2ycoeMnoJy3cKx5lXAJ92q1qEWud5qFq0EFhoP/d82Z7CBibWueFZn/VPkMvYn4eOqtDlTVKohXNACSjbtXjKpmRMPEXAkkqG9vSvfcyMHB7I1y5QXM9FPPq6LX1/lW47WnMl97SRl2Y3/hlKRcUEJqZf5vcRiSwYGljKj4x8/ACOoX0HjqBW1KP2DVe5Du7B41YcuwqJmlJl6ABfVmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QfUJLszbI9BishTllASLZuC8witncdVXux36r4o72w=;
 b=09rH7e0ajjmvAvYPAUTuthbPNTW7hG1TX34fjq2RhnZGOV43xNB/0fObEBuwXV2pii0dcZwusrY0TX7ABEzwLDOmZsl/VFlcQpjKoM6TtOhE5o4WQ7wMGVD3nbndMhMUpO/bx3cCXLuY+CZYCJ7sk/X+5PSKoMrErxhI9PGQ6OA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2b25f792-2e57-402f-8b57-d54f721e8291@amd.com>
Date: Wed, 2 Apr 2025 10:05:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/arm: dom0less seed xenstore grant table entry
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-5-jason.andryuk@amd.com>
 <6765d129-66dc-48d9-aaac-2b973edfda80@suse.com>
 <3d800459-7762-427e-8765-044adbb6459e@amd.com>
 <alpine.DEB.2.22.394.2504011648360.3098208@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2504011648360.3098208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|SJ1PR12MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e191d0-7354-41d9-2d38-08dd71ef6f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVI0SkhURElycm5NRmFBc1l0NWU2N01LV0txNnJqOWVzM0Q2VzFhYUp1K3pM?=
 =?utf-8?B?R3VOckkzUUx4YUdSN2RUTzhJSVRpcE1LdFJpTTliOGZxRml6emFVL0s0L1dO?=
 =?utf-8?B?UEVKU3VWSFVoSVpGSFNQN24vNXZZczNKeG1hbzBmYXB6YTFKRHpROGc5ZnNa?=
 =?utf-8?B?N0dNY09rSi81T3dCbE1aMnhOdmRWQU5FcGkwd0xyT2hZcldacEFncmtDajRa?=
 =?utf-8?B?blNWTG5BbDVZRkM0TDFGYTdYYzVac1phQVh0RFg5VjdqK2F5cEF2cnlFY0h5?=
 =?utf-8?B?ejE2d2VQWDhDVCszOFhZUGdtQnJsRHVaYktsYy9xdGFRMWQ2SlVSSWRtMXdO?=
 =?utf-8?B?SHBVRHJvWE9TcFdTaGRRejlKSHpWNTdqbzdvRE9uTUIwSi9NL0FjK1pKR3NO?=
 =?utf-8?B?K0hZZktVLzdTQlU0Z3BpWkNSVTZ0UmxEMmpBTDhDWnI3dlBaenRqYnhCeEVX?=
 =?utf-8?B?dkljS1FZRzNuUHhMclNvcllHRG1UeXFsZ1hMY2dsRkVpU1lnOVdSaDZWT3l4?=
 =?utf-8?B?aTBhQ0FwdGdTdU8wZmFwTkx2QlRkYWs1cE9TV3Z4aUZ1SW5HZG95QVpWSDlJ?=
 =?utf-8?B?VjVmRGlKcWJpYUp4RFZPOXpjMW5FOEFzdkQxU1lpQkZLVFNuZ1JhYzZteU5z?=
 =?utf-8?B?bzhzL1Z3ajhWUDREZW5wZHFrZko0bVQwMDZWNXlVei8zQ1hZdkRxZDc3NkJH?=
 =?utf-8?B?a2JVdHYxQVFHekhxK3BUdllyeENCUktmMGJxbFZiR29Kem42V3oySy9uNjdT?=
 =?utf-8?B?V2pmZ29NSVVMV2FXREJQK3NMNmxzRlFYZnVveDdjUEpYdE0xTzNzZVVoN29Z?=
 =?utf-8?B?bzlldEJpVForcUdIUDRwU29jajhEOUhQdUtpQmhMYitnWXJTWEhGdG1OTEpR?=
 =?utf-8?B?cENMQ3g2UXF5dk83VGZlblY0MnE1YXpqZGZDd3prenYrM3FGQ1NCTkFwMWkw?=
 =?utf-8?B?Q2xKMFF2d2w0UGo0RUd4RkdHbFNlOU9KdkdPRkI2SGdCb1NlaTA0L3ZPQXVp?=
 =?utf-8?B?WGR4VS83eU12UTRneDdjZ2R6MGZxS2grQkdZa1VjV3I3cXZSVmRZSml1aG1L?=
 =?utf-8?B?WkNKNi9xSHA4eUUxenlDZkVLUFoxZklSTHlQbVU4dmsyUitRd3JxbGtJOFZH?=
 =?utf-8?B?bndMY1krb1VCT1RIUTlweW1aNjVOQ1J6UTFESkg2WjFNODNiTno3bi83T2VN?=
 =?utf-8?B?U01vZUM1UEVxVHBiQVVMQkd4UWFweXpLSzhTSWRqUHpmNFR3clVhM0orU3Zo?=
 =?utf-8?B?eVhFRjJVbzZkb1Y4dFJ4ajZyNGpTYWY0ZzZkaEFXYnhBWmlrdTdQWWFYaGJS?=
 =?utf-8?B?THRtaTUzOGhQby9YRStNdDBabWlEcU9nb3Q5RHdOQWJDZk41ZFoxQ0c2TUFZ?=
 =?utf-8?B?SlcvOGFlNEdqUGZzMkVaYTA3cTU2SldRSkxvZytBYnZXWW1CcFhna255eFJy?=
 =?utf-8?B?TU1kallWVWRwdE02ckpDZVBDQ2g4T01KSG9yUVAwMHA5RjY1TFp4VFhZbVo2?=
 =?utf-8?B?eFhZRnZ4NytuR29uZDhqSDB4WVZSTm96SUViemFOTllCYmVEZTVhYVBUT3Fv?=
 =?utf-8?B?TVRUVkZpV1ArLzFUeGVPaU1XUnNPdDZydHJoNmtRVkk3SC9aMzhqa0w1N2Zy?=
 =?utf-8?B?WmlOYTZDejFkd3dSR1hkQmhPd25kSnd2QkZKVVlGVkJoRjV2aW5kOFdOZk5W?=
 =?utf-8?B?Qyt2bWdYSUNFTG0rZDdkTVV1bElBdW0yR1pOc3dTMk5jWFdDbnM4OThZbWQ2?=
 =?utf-8?B?QnpDYzd6ODk5aERNNG5DZWQzSTJUS20rNlU0a2hhRXNMT3ovYUd3NDcwSHJ3?=
 =?utf-8?B?NXJMOTdQQnNocUdxajQ1bFgvSkcrUWhJM1U5Y1N4RDdaTGFoTjJRT0ZuUlN1?=
 =?utf-8?B?WUxNT1o1VUZYdE9FdUFUWnZqTVdvRzhsa2dKNVU4QXROSVgzeUdidGRDNys1?=
 =?utf-8?B?bzNvMjBEaGpscThBOUVwUlJoR1VpdUVIVWFrMmpuUHJVdWdXY2VmRllRTmtO?=
 =?utf-8?Q?ubm1u7j1RQtWecDYie3xKIgrIFXDMo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:05:33.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e191d0-7354-41d9-2d38-08dd71ef6f21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6289

On 2025-04-01 19:50, Stefano Stabellini wrote:
> On Tue, 1 Apr 2025, Jason Andryuk wrote:
>> On 2025-04-01 08:16, Jan Beulich wrote:
>>> On 31.03.2025 23:43, Jason Andryuk wrote:
>>
>>>> --- a/xen/arch/arm/dom0less-build.c
>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>> @@ -865,6 +865,10 @@ static void __init initialize_domU_xenstore(void)
>>>>            rc = alloc_xenstore_evtchn(d);
>>>>            if ( rc < 0 )
>>>>                panic("%pd: Failed to allocate xenstore_evtchn\n", d);
>>>> +
>>>> +        if ( gfn != ~0ULL )
>>>
>>> Is this an odd open-coding of INVALID_GFN? And even if not - why ULL when
>>> "gfn" is unsigned long? The way you have it the condition will always be
>>> false on Arm32, if I'm not mistaken.
>>
>> The gfn is pulled out of the HVM_PARAMS, which is a uint64_t.  It is set like:
>>
>> d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
>>
>> But pulled out by:
>>
>> unsigned long gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
>>
>> So your comment highlights that unsigned long is incorrect for ARM32.
>>
>> While I realize fixed types are discouraged, I'd prefer to use uint64_t for
>> the replacement.  That is the type of HVM_PARAMS, and uint64_t is used on the
>> init-dom0less side as well.  Using unsigned long long to get a 64bit value on
>> ARM32 seems less clear to me.
> 
> The types that correspond to hypercall struct field types should match
> the hypercall struct field types.
> 
> I think gfn should be uint64_t to match the definition of params.
> 
> Similarly among the arguments of gnttab_seed_entry, flags should be
> uint16_t and I think frame should be uint32_t. This last one I am
> confused why you defined it as uint64_t, maybe I am missing something.

With Jan's suggestion, I am dropping flags.

Yes, frame should be uin32_t since it is filling in a grant table v1 
entry, and that is limited to 32bit frame numbers.  If the frame number 
is >32bits, then the grant can't be seeded.  I guess I'll put a check in 
the caller to ensure that.  Looking at the supported guest memory 
maximums, 32bit gfns should be enough to cover all the limits.  > 16TiB 
would be needed to exceed a 32bit frame number.

Regards,
Jason

