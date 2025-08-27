Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3549DB38FE7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 02:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097163.1451600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQYS-0008MT-VA; Thu, 28 Aug 2025 00:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097163.1451600; Thu, 28 Aug 2025 00:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQYS-0008K0-RJ; Thu, 28 Aug 2025 00:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1097163;
 Thu, 28 Aug 2025 00:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urQYQ-0008Ju-LS
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 00:31:50 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2407::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61525622-83a6-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 02:31:47 +0200 (CEST)
Received: from BN0PR04CA0158.namprd04.prod.outlook.com (2603:10b6:408:eb::13)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 00:31:44 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::c6) by BN0PR04CA0158.outlook.office365.com
 (2603:10b6:408:eb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Thu,
 28 Aug 2025 00:31:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 00:31:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 19:31:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 19:31:26 -0500
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 19:31:25 -0500
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
X-Inumbo-ID: 61525622-83a6-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocG/bWZ1cyl1GdFkzFI4hCaMVv5j/YPsXE2hSvO8SG7VNd/UW+rs9srsXBiZsGPzV45H1OljjuT7WFzuDdYMQSTV+QmYqLkDSSnw8+Gclmmuo5BE3Pa84HYwjJNeH8jKxjBlY0ewQEwqOG/Y4dkScGLWR7T4dl2znzvWCEe/aAksWBd2bk3LsfWo2lYsnVQttEO/54eROL68F/JKuBtG58VWRYHFf5ZP2yjna68ReI8OnKQ3Tr9e6AOZRRLA2k4MIzBfrLxKEMO/DdFJukT3rs1I3VCw9zsbRr3evcEzwG+IP8qCF+UqukziP+0o0TDDuhFQKxqz2+kajERwE82s+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yL0cWFAwGnZZOy5icEJM/ssMktP7OZmP1v5umEmd1s=;
 b=BUX+e8b3gxjVEZRwq8uLUF6dzpBUpsORxdwsQE/3HPQTOn/hnsX6iDe6Zx8En5WSXJUSWEvk6+t+Xisc3OEweWoeWldR/CZIFPCdA2SxFNnweEm3Bq3pn8at2Qn4jX4OXjRFYN0aLWiyycnHBYXerfdQsbm2G1qG7RqR/ow8jh5h3EiEcil2aKgg+U5zW5zApx0Ikd91ION7hg53Xs32lhpYTbpjmnaeQseOlTDwRoHkEaOu5aQq+BpN9kzrGHi9Qlqu3ftQiFmPhOAJz7YfSWIedPtVrOC1GCcqd+sJ12lCgaj2AVjEaDcoOZWtfreKvKm8pJbSWIXjk8kEpprOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yL0cWFAwGnZZOy5icEJM/ssMktP7OZmP1v5umEmd1s=;
 b=nr8Ipk0dtq1W4PrC7gzFGLLA5udVRuxyPFjNGn4oVUFSAqIeUv0UYM9OhYbicdbbBsvFMbmHc7kDAwfA6lDNFO/PK5U8pii15ki7n7Gi+828QP8JOJoNSyUfuhE57GcoJDnZAza1R3qucq9sLkIciD3LPg9p+JJnx57Ivp/sv7A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <12dbe129-9132-4c8c-8002-5c34ce90d42d@amd.com>
Date: Wed, 27 Aug 2025 18:11:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/events: Return -EEXIST for bound VIRQs
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-3-jason.andryuk@amd.com>
 <2d7bceff-d70f-4f17-b833-380ffc06577e@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <2d7bceff-d70f-4f17-b833-380ffc06577e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb7338e-5552-4bc8-b485-08dde5ca43d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGQ0ZHJZSUpvbG40OEFoUGtvQnY3OFU5Rm56UEVVdmFNZWJYTE5NRDBodUtK?=
 =?utf-8?B?R0toUE12YWgxbUtiZ2U1OCtzZDVoaVhGY0tkeDRrbTFJTXp6MUhndWg5Rm0w?=
 =?utf-8?B?Y0dWT0Y3WGtVYVNDOWJmUFNsMU4yVlg5bWFpUWxaNWJyK0NRMU9yY2dXaFpr?=
 =?utf-8?B?WlpUTFRrK0FzdGxqUGxDSzQ4eE5oYko1ZzBNS2hRdUJYbUJVekV1aWhISExT?=
 =?utf-8?B?TUtoemhyNjFoR1hRWVdOQWhZRmdiZEdsbUhiR0o3T2I4djljM1h1RWxnOTM2?=
 =?utf-8?B?ZVZYWDRLbFFwbGg4R0xXTjEwZHV2OFYyR1crSThDSm85MUdVQ3MwdVhqb0tz?=
 =?utf-8?B?KzJZUWRXeGQ0YXFvZWFHbnVRVWVoRUtzd1E2ZGo2cnJWTlUwWTlkYXR0QUU3?=
 =?utf-8?B?c1JvSW9NZjNaVHNJZFJHZFVodXY4RGcvV3VrWENzN254VGp3c042dXlJZEg5?=
 =?utf-8?B?R2U0SitlWWIxdGZBYVNlb2N0bWYrR1J6bzZ3aVdmN08vSWVGWGZ2dStJZFFV?=
 =?utf-8?B?M1Q3VXhRSkVHWUFyejRIR1ZhRTF5ck4xODBRR1EySEdnbnh6dGVSYk9VYXcx?=
 =?utf-8?B?RFNiMGRRa0w4bWFZbEpadytVV1dCZzBSTjVac3FmUXRoWTUrSXJTWTlFM0dv?=
 =?utf-8?B?eERIcUltZC92eVJKZkE3V1l2N3Z1MC96ZjBDSUMyRXIzWjFXRVJxSmFVbnJ3?=
 =?utf-8?B?TjRQTXJSdUpiQkZXUGFVa24yUWxHZGw2UjhZYmM2WFprOVJNbXBzMEljd2lG?=
 =?utf-8?B?Y0FveERlUTQvalFaUG5WbVNqb21mcGkyNkVtRHMwY1FhNEJleTVobmpEZXJo?=
 =?utf-8?B?OHhjN1hDWmF5aXFFcS8zNW1yejFTaHJUOGQ2ZmtGTXV5dGk1RmhGS1NKSjJs?=
 =?utf-8?B?ZURkSm9KZUJIb3doeFFjYUdoeUZMOXg0dDlDZEVvTGJkc3dOcDJMUVYyNGhy?=
 =?utf-8?B?ZUxMK2lmKzhwUk5PVTJXSGEzbDFHbXJOMVVjd3lWSXpjcmpId00rYm9PRU5M?=
 =?utf-8?B?bEEwbnc5NFd2dStxVE9CcG5WWXVKNHRvVC91ZWZvOXUwNnd2c3ZVaWVqeWF1?=
 =?utf-8?B?Z0x6TlJlM2dYRnlIMm1pdjQ4VFhkUGRWd0JKMlFsYzVKcDNXbW5BR1hidlJy?=
 =?utf-8?B?V1dYVXBwY0EyV295aklMWGxoek8veXU4aHZya0phQXVkYnpRYjdLanRLUHJm?=
 =?utf-8?B?Vjkxc1prU3lhVUc2QUhNTlNsRXpYNGEvTmtwS2N4L2VwdlVRNEJMWDc4OUpM?=
 =?utf-8?B?NzNsVURTNHd6Q0xkejNleHBzQUN3THNoQkcvUU8rZ052YzFCZ3l3WDVjMnhV?=
 =?utf-8?B?NXh3REtCSkN5ak9PQ2JZcmdEcDZGWmdBZDBpZW81cDN1Umd3VkhNdjhieGVo?=
 =?utf-8?B?bk5yVzhtUWNPSHNkT1V0VlRYeS9PNGJHeW5EdlZIcERTbUJWMVdGTEl3TFYz?=
 =?utf-8?B?VmF5eXUvRVQrWGtYNHNVNmplSUozeDByc01qYmU1NFhBRzhWREI2UndGTlk1?=
 =?utf-8?B?RDRQdDVHWWkvT0RRYWkxajZLRUowVW95d3BtdXZJZ0NJNCtMTVZYZHEvYkZ5?=
 =?utf-8?B?ZkJDaUxlYjBISGxCa2lNaDhYei92VWdnaGlVS2dIOStFTGNpU0RRR1kyb3RY?=
 =?utf-8?B?SGNPQkJWTFQvWXdKdHQ0N0syUm94UE5ZRjN4dEh6cmsxQ2NOZHZzTFhlcGJk?=
 =?utf-8?B?SGdpb2FJbUFlK0xhYjhxMis0MUZFSmpsNlhqU2RhWGN1ZUh0Qk45bGpkZzZY?=
 =?utf-8?B?MVAwVUZQc2xXRy9PTTlyMktPd1NrdGNydXVXS1VQL3pWTHBxNTBCcFIzejdP?=
 =?utf-8?B?Zjg0TllpUWtmbDhuS1ZIWG1ZTnBIclhWdVNnMmdSM2ZxeU1XQXYyMUhCSXJw?=
 =?utf-8?B?YWsrcFhyQi9aYXkyVDVGY3hLOENlOHlYSWNaSHZtVjJGYWdKQi8vS213Yklj?=
 =?utf-8?B?RjdtZ0xIcStGalpGTC9oOFFoUjZmYjZGdnFrc0tLTm5vZXBkSW5zL0RoRU5E?=
 =?utf-8?B?VlRzdVRhVzZnOUxITW9Lc2ZQR0dPc1Y1ZHFpZVN5Lzc4cjd2NDQzaFdORUJM?=
 =?utf-8?Q?vFiqGA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:31:44.0306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb7338e-5552-4bc8-b485-08dde5ca43d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083

On 2025-08-27 11:21, Jürgen Groß wrote:
> On 26.08.25 02:55, Jason Andryuk wrote:
>> Change find_virq() to return -EEXIST when a VIRQ is bound to a
>> different CPU than the one passed in.  With that, remove the BUG_ON()
>> from bind_virq_to_irq() to propogate the error upwards.
>>
>> Some VIRQs are per-cpu, but others are per-domain or global.  Those must
>> be bound to CPU0 and can then migrate elsewhere.  The lookup for
>> per-domain and global will probably fail when migrated off CPU 0,
>> especially when the current CPU is tracked.  This now returns -EEXIST
>> instead of BUG_ON().
>>
>> A second call to bind a per-domain or global VIRQ is not expected, but
>> make it non-fatal to avoid trying to look up the irq, since we don't
>> know which per_cpu(virq_to_irq) it will be in.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>
>> @@ -1381,8 +1387,9 @@ int bind_virq_to_irq(unsigned int virq, unsigned 
>> int cpu, bool percpu)
>>               evtchn = bind_virq.port;
>>           else {
>>               if (ret == -EEXIST)
>> -                ret = find_virq(virq, cpu, &evtchn);
>> -            BUG_ON(ret < 0);
>> +                ret = find_virq(virq, cpu, &evtchn, percpu);
>> +            if (ret)
>> +                goto out;
> 
> I think you are leaking info here. I guess a call of __unbind_from_irq() is
> wanted like in the error case below (note that the case of no valid 
> evtchn is
> handled there just fine).

Ok, thanks for catching that.

I'm going to add Cc: stable to the next version of this.  While it 
doesn't have a Fixes associated, we want this as a prerequisite for patch 3.

Regards,
Jason

