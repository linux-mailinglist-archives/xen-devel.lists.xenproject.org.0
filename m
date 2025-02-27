Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB00A4869E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 18:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898338.1306906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhi7-0005bk-Gh; Thu, 27 Feb 2025 17:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898338.1306906; Thu, 27 Feb 2025 17:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnhi7-0005ZS-DN; Thu, 27 Feb 2025 17:30:11 +0000
Received: by outflank-mailman (input) for mailman id 898338;
 Thu, 27 Feb 2025 17:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A9KE=VS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tnhi6-0005ZM-7b
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 17:30:10 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2413::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7be84896-f530-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 18:30:07 +0100 (CET)
Received: from CH0P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::11)
 by BL3PR12MB6451.namprd12.prod.outlook.com (2603:10b6:208:3ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 17:30:02 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::5a) by CH0P221CA0032.outlook.office365.com
 (2603:10b6:610:11d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Thu,
 27 Feb 2025 17:30:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 17:30:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 11:30:00 -0600
Received: from [172.23.201.196] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Feb 2025 11:29:29 -0600
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
X-Inumbo-ID: 7be84896-f530-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqfjNeEZDqTkumi2gDv+ItGUheQObcK/DZ3yaGdsrFY5gYJec+jk5oEWd17Y+nsDSmk4YVCL8SkTOdk5y/eGfR/UaUSxI7VUsiNttquFYICXE0jdQKBN3A0iBq3kDmM+pA7XGYsWOcjSsQIslaly3I5w3IeSk2vJhl1Fmw3HP8wHvjN5mL5glqkDGtFiczp2k2ebqGY0lTi7Cu04nGAGqEgAQBv5TVfm/P4kn05OGiihuRjXgWJi3Gj3sMW39zcOH2CVS1uDhdNVTOaZ73Z4RzhHa38TewIqkOdIryoo3uiVpTQybyZJmtiZ2h1liThApUjbxF5s2dutPp/LbHeBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+49RT3K2F3zmhcQyc6kVZHasUgLxrl07CE8XASnC7BY=;
 b=xa9AweNEwg1PoqZljNgYzvzsh69+PfEgYzV2t2OzFk8svhRZxwtiwbhz374KcPLq9qiIqzOwvX9CGtOvfAQSw9c+1Cq7vJWtrOQqgFk5mxs/gxB+09A23Ee5qu11MDNWOTQrQhhLGhka/RfSWo5FmG8S+a9ATTLkgYkq3ZEo1T2pkUt2xCDMDhLyrVIlr13hpMcOWFDIONwgfAPxB1oK10mW6sDtQ8YVXn/cG7SUM6DthN/2GR+hEWzwYLs0EDMqokQqmxGPXPyOQDJd+FlbtXlAw7GMjC2l1QzQNRsL2wVJ7ah6VrJzXQusbZ0v1KtFLKtvLW3xP3GNS0rhX9fTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+49RT3K2F3zmhcQyc6kVZHasUgLxrl07CE8XASnC7BY=;
 b=qa7DUxA6W5/0cQEPQ3BaegM7LPjPclJZKm3ZETH2peRLNbV4aS/bF+jF1QvtIM/srGXMbLiANkmw1r4aqUHrCmkrUN30oUsu/rSr0VXNmGDEpVOHzPdN5Mq9BNVDrR+Z20ftMXJalbQF7ntHq7BzpuG5kx4iyIQwRa8aMt+o74M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <49447cee-a0b5-49f9-a10e-1d9afa61dafd@amd.com>
Date: Thu, 27 Feb 2025 12:29:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: drop pci_segments_init()
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony Perard
	<anthony@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
 <bcfad8f5-fa69-46b9-9ded-a6ca41949ff1@amd.com>
 <68fe94fa-21ab-45a9-8664-d8c2638635dc@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <68fe94fa-21ab-45a9-8664-d8c2638635dc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|BL3PR12MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: a7aa9b1b-bb37-401e-b57e-08dd57545e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z01XZys3S2ZOcTh1VE1iakQ1dUtnU0YzaTVqc1hWSCtVZjRSNWFLRDZMdjQy?=
 =?utf-8?B?Q25aWU95aDJkQUFUS0l5bE9qVDJoVXBZWXpKaEVyYmJwNjVGZEdDcFJVcG5V?=
 =?utf-8?B?REhhSnlvMFVOazh1d1c3VEtNN3M0M04yTkJieGVlL0E2VkE3ck5Xdk9DaGYr?=
 =?utf-8?B?bmcxK3orampvOFpmMSs3SG5vZVhISWVBUUlUSGFjejJzK1JNbzlVWUZwQ295?=
 =?utf-8?B?U012OTV0T3p1bTFPaE4yUnBlNm9RNllxWk1qRVlqc00zWThLUkovSUhoNVFi?=
 =?utf-8?B?bTU5MHA3QXJkYzF0TE5ac0JVY2U1Z3I4enk4ejZJbVhRbFJVNW9kM3J5dTZD?=
 =?utf-8?B?VVpVdTNuQzJIcGNNNmxGOUZOK01NNHJEZUptNmhVVU53aCtiRjJRTFhmSW5D?=
 =?utf-8?B?QU96Z2M2VFZhTmN2SlNpYTFpVHVmL3NyR2FOWnJad3NQTHROMUtvUEJqTzBD?=
 =?utf-8?B?em9PMGM1SkJVenFSa2VsMEU1TytBSWdLSUxtVGpJdUhzU3J1NC9LdmtPYlAw?=
 =?utf-8?B?b2tCNWxUV3Bneld2cnU2azRDVk5lTjJCL3JNd0hBdmR2enBwNU54UjFaL1lT?=
 =?utf-8?B?dkh6ZHZzLzdXbnR4T3EwUEEySnlVWmpQblU5UHMrS2dPRDl2SGY5YnYrZzk3?=
 =?utf-8?B?Zi9SaEphczNEUUFPOU95RHpqam9peUxJSndiQjYzcEdMdW94MmpGQVU3c0g2?=
 =?utf-8?B?cGthTitvcWRlZ3pVWVRkM1d6anpCZnVMUUVzOXZTQmRrSTg1QmEwSHJIamZX?=
 =?utf-8?B?c0VtT0VRM1NMR3Q0a3VhV2docE9RaXdxYi9BZjh5M1J6ZUE0alRweXY3TnFn?=
 =?utf-8?B?SjBGNTBFYjJNUHNBdER6YjRkMTR2MnQ4cWRyTlFwZW1ZcWZQVThVcnlDRGtu?=
 =?utf-8?B?Qk1CQXRhVjdscm5GSTdKaU56b2xudmxUbnJKQ0NTeGRmWGo2RE05UzlOK1lJ?=
 =?utf-8?B?TWxHMHNmNEJXMHpCOXJWa3JFVFhKWlFrWUx0bWtFOG9XZk9HZENyQXMrKzlT?=
 =?utf-8?B?NE9UQzRRUjMyWTU5YjU3NWx4bEY5Q0NtVVZuNHBScldlV1Boc1JscDVsWUtZ?=
 =?utf-8?B?UGZteWZSdzFqN0pmOWsvWXZzUzM2RjJXNVliRTZQVXF0dHBXemo1ZlhaZzlt?=
 =?utf-8?B?eDBFOHFIS3dYeWwyQ3I0aE1sdjVUTDkrTTREaWVySHJ2QXlSN3lYQ1dkeHcw?=
 =?utf-8?B?bWdPeVVROWFUU0NRWkFzUktwUThia1dVTjFWU25ZSFVualhPN1h4RXc5Q3lr?=
 =?utf-8?B?U21pa3FsUDJYckdnN3NPVU1UeVYyZ0t4TWtxZTdBZG1GcUpRSmJBd1ZLc2pW?=
 =?utf-8?B?VVNiVHZVaThzSWI2cGxYZ2JsSWMxZXlsWVVGZXBaRC9ESm0ycGlpS2VUNkJD?=
 =?utf-8?B?SWtiWlVtWXJMY0puZXhtak5udDlpMmNmUlZVenptWVYwR3lGS0Z3R1NtTE9n?=
 =?utf-8?B?YnpERUlLdFZ0Qk9wYTBkbTREQWhPZXdPa09RSnpScFBYS2JucFhFblpwd1V3?=
 =?utf-8?B?cWdWbXZ3cGJER3VyeHVFcGh5WWZ4S3R5K0tYWW1GVGNMWHdPYmtHZVA5UUdG?=
 =?utf-8?B?dWFoR1NOTkNNOGQ5ZWU5Wk5EZ2lvOWRNS0EyL0M4SUpjVXdEMXIwTWNnalc5?=
 =?utf-8?B?RGZJbURUSGdrUFF3OG1GaWQwbUsyNWJKUjFEYktEUFQzN3NYYXEyVWM3OXFi?=
 =?utf-8?B?cXptaVNSVTN6bFltcTVqeE54RlN5UzRMTXhUN1B4cmI0SnNSS3VtdkErME1R?=
 =?utf-8?B?WjhzaFF2a3VRWG5UR25sSVpmZ25hd3VXKzVCNG9pcGdmUmJWWnEySHJBcmY4?=
 =?utf-8?B?aXliZ0dqVGYrMFhlKzM3a29CUk1ROGdkUTFHN0ZZSmZ3bDJ2YWlxLzV3NkZT?=
 =?utf-8?B?aVVDVHhCUTZJaUlLcXkvckJKa2hXRGwrYUJLblp5Yk5wbmZ5SmR6cEphY1pq?=
 =?utf-8?B?a3JHSlhLSHNOaDJYRElHdisycTdWTzRZeEE1NitsNFNlRDYyd0tTMVQ3M1Rr?=
 =?utf-8?Q?gND1tFEJ955KaHZIwXhQi416nC/b7E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:30:02.4489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aa9b1b-bb37-401e-b57e-08dd57545e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6451

On 2/27/25 01:58, Jan Beulich wrote:
> On 26.02.2025 20:57, Stewart Hildebrand wrote:
>> On 2/26/25 06:38, Jan Beulich wrote:
>>> Have callers invoke pci_add_segment() directly instead: With radix tree
>>> initialization moved out of the function, its name isn't quite
>>> describing anymore what it actually does.
>>>
>>> On x86 move the logic into __start_xen() itself, to reduce the risk of
>>> re-introducing ordering issues like the one which was addressed by
>>> 26fe09e34566 ("radix-tree: introduce RADIX_TREE{,_INIT}()").
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> This is entirely optional and up for discussion. There certainly also is
>>> an argument towards keeping the function. Otoh on Arm there is the still
>>> open question whether segment 0 really is kind of special there (as it
>>> is on x86, largely for historical reasons), or whether the code can be
>>> dropped there altogether.
>>
>> Segment 0 is not special on Arm as far as I'm aware. You can have a
>> perfectly functioning system with only, say, segment 1, for example:
>>
>> (XEN) ==== PCI devices ====
>> (XEN) ==== segment 0001 ====
>> (XEN) 0001:00:01.0 - d0 - node -1
>> (XEN) 0001:00:00.0 - d0 - node -1
>>
>> Segment numbers can be arbitrarily chosen by specifying the
>> linux,pci-domain device tree property.
> 
> Right, that was the vague understanding I had.
> 
>>> --- a/xen/arch/arm/pci/pci.c
>>> +++ b/xen/arch/arm/pci/pci.c
>>> @@ -88,7 +88,8 @@ static int __init pci_init(void)
>>>      if ( !pci_passthrough_enabled )
>>>          return 0;
>>>  
>>> -    pci_segments_init();
>>> +    if ( pci_add_segment(0) )
>>> +        panic("Could not initialize PCI segment 0\n");
>>
>> IMO it's okay to remove the call here since there is already a call to
>> pci_add_segment() in
>> xen/arch/arm/pci/pci-host-common.c:pci_host_common_probe()
> 
> Is there? I can't see one, so maybe you're working from a tree with extra
> patches applied?

Ah, you're right, sorry, I was looking at a downstream tree. The
associated segment would be added in Xen upon the first time Dom0 calls
PHYSDEVOP_pci_device_add.

