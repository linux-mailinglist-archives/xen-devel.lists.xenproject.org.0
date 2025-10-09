Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B28BC9218
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 14:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140626.1475459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6q9K-00065N-Bi; Thu, 09 Oct 2025 12:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140626.1475459; Thu, 09 Oct 2025 12:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6q9K-00063w-8n; Thu, 09 Oct 2025 12:53:38 +0000
Received: by outflank-mailman (input) for mailman id 1140626;
 Thu, 09 Oct 2025 12:53:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zQ7T=4S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v6q9J-00063q-D6
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 12:53:37 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6f67120-a50e-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 14:53:35 +0200 (CEST)
Received: from BY3PR03CA0021.namprd03.prod.outlook.com (2603:10b6:a03:39a::26)
 by LV3PR12MB9143.namprd12.prod.outlook.com (2603:10b6:408:19e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 12:53:31 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::8d) by BY3PR03CA0021.outlook.office365.com
 (2603:10b6:a03:39a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Thu, 9
 Oct 2025 12:53:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 12:53:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Oct
 2025 05:53:29 -0700
Received: from [172.28.217.164] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Oct 2025 05:53:28 -0700
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
X-Inumbo-ID: f6f67120-a50e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CE8r3R8NoOUNlU/ozII1zIhMyrh0h1ChG96nCRRIUKhZqRaOPkCptb4lhFkWXoVz+ETdpF1yvlnojNi2xTLTCEwEvExbvtILOhXO1KlU2stOclksLPMBKZCZehrs5MoLayt55R/jPa6mJ+wcIbgG82kNOXxQg+gkl7JMKE02ce0reS85JGJpIsTfO0YhagkELBNHCfafR2beCAloVf569n13KZ9awnE/hVasyCt2PI0Jgf/rVukvWpA1yrpF5O6k56aaE70dgpSe7qYNlcwym7uGE/4o1jPnCr1fNrlLPBpu5WrFX6s1yyeR3thoTZKQR/u3EH9QIzrJUgibN0LGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4xIl5OdSlkig+e6ZpoL8aGvzZkMHBQ0pJ1JXmPemjQ=;
 b=EeEkQXUyz7gsEhR+0vmwz19mc1IHdF3a0eNP7oggTZjsueSFoRYKUNINvOGNC03RdA/2xXP+hFSO+q5OHt8UOi3sMXj+NEJ5OMU/LDKtpgzyIN0vZiyNf6bG4MrW6pz+Z/Urgy/UihY4XpA1MYpx/fTXWqinj7XGotq8vScfdeBXFgZRXl8BMsssddmYLM1Iql0rc4HLgcLmpd5bf9jMseVmmnmtozZa/uJRwcY8exwrl6IPVKAW10yEiBR4A42CZIbFCmm64lb14qJxONrIRPOlZIUGD6GzByMu4gjBJdWcvrsJq9j4si4SZ1MGQoU+kyVg8xwqHVsYiOgrfkMBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4xIl5OdSlkig+e6ZpoL8aGvzZkMHBQ0pJ1JXmPemjQ=;
 b=nZScX4RWGoU24xy3GBBKZYGcUZn4vFsm7zD9l/88yvJJUHLnNcjs+VAF6kpwVTUXJWlz8hXn8vuBW3uribBAJJBUsdGKUjqvtMfOsGAOJOmx9tmLjF9UnJ4OJg67DvpXqKF8/xBD9DYsoyhcS6g0KEB/JA8NoUdQ5QTpTTZ+OH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0923545c-ea7d-4b57-af37-351ede01d5e4@amd.com>
Date: Thu, 9 Oct 2025 04:19:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
To: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20251008201106.36204-1-jason.andryuk@amd.com>
 <cf852476-8a51-4623-b4aa-d9fc42622b1c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <cf852476-8a51-4623-b4aa-d9fc42622b1c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|LV3PR12MB9143:EE_
X-MS-Office365-Filtering-Correlation-Id: fd470e05-14d4-4d1c-366e-08de0732d90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzFCVGhsbit0aWZBUjd0VlIxeHZVZlZKUnRKWGczYlN0QTB5VTE4aGRLZHkx?=
 =?utf-8?B?c2tMZGxsYkFWMW0rVXdybFpub29ZelFOY1NjUjlxNGZsZHpYNlRhRmZhTnRK?=
 =?utf-8?B?WENpR3BUZCsrYWtDVFBpcWJtVFJxa0tyNmF3cmZ1YXM1V0tMQWR0S2VNN3Q1?=
 =?utf-8?B?a3pFSlVKSElVcGdaOVliTnQ2Y2RvQVF5WkFtbTQ1QzByL053RGlHYXdWVC9N?=
 =?utf-8?B?cUF0MnpQY0ZFWlJMQmExMDYyYm84V2JXVm9kanVVeGZOaTJHNjlDQnExc2xQ?=
 =?utf-8?B?T0NvcGZOaDdqSGNZQnB1OHcrdXN3NFV6QTJDaG5rT0ZEbVVjMFlsbTZUQ0N6?=
 =?utf-8?B?aE9CS3I5Sy9pTlo1ZVRUNnRkYlorSDEzT0dtcnFsVjZ2QWdFSTJiVWh6dmFy?=
 =?utf-8?B?ME9nemE0UUFPaldjZDdyRWJod3gzOHVoaTUyYUpIRnc2cDkvYWZLbzY1ekNL?=
 =?utf-8?B?VE1Cd09mUC9HZDZEOFhBVDVHdll6Qm9uRnhhaWV2Q2JNbjI2VFR0S3FUTG1Q?=
 =?utf-8?B?bUMvWEVJbzVITW5FeG1UMTdZbzVDTndkekhSbjJiTlQ0VEMwQ2FaWWRUZVVH?=
 =?utf-8?B?VlJQMnAvWVcvUlBhdzZWZmh4bnk2a2NzcUpnVStlSE1GUVdoTVY4WE80VS80?=
 =?utf-8?B?K3JyUVM5TUluYWdEdzdEalB2cysvWFFBbUpWQk83MjgxZjlQVmF0ZXVqbDJU?=
 =?utf-8?B?U2RtQ1hKZ0hSNlFpd2d5Mlp4bU9oeFBESXFEUEtXL01UV0Q2MFpsZnA2TXBY?=
 =?utf-8?B?ZFcvcWd1SzgzMm1lRmdEN0poeU9SRWFIS3JkLzVKd3Mzb2NQVm8wdC91Z0gr?=
 =?utf-8?B?Y2d0L0hrc3VUQldKWk1QbkZhWTZjZmxqSmgydWJoQUNDcTQ1LzhLNFdxT29k?=
 =?utf-8?B?VjFhb0lmeWRUclRWbk9NcHNTNHpYVjNLMmd5dnZsb0dpcWlMRlVyOTZxdDJP?=
 =?utf-8?B?bDRhTTZuUzJjV2pxQjdwUjNCV01OdllPZWJEZStEd1FWc3JDMi9mR1ZkbytM?=
 =?utf-8?B?UWFqNXJvaXUrRk1ycGFtTEVSY2N3d2ZEbjkweGtkOHd4OEZtNWhHZ3pXNEpE?=
 =?utf-8?B?T2xpL1BwY3NQd0I2UUhBUTVUZHNmbWNPR1BXeWdGQVhhYmtpSVNhV0srenZ3?=
 =?utf-8?B?TS9XOXg4ZytOY0ZySmNiT0sxTXdhL1dCa0dXZ2x0QVFCS3pyY3BqN1RMOFlC?=
 =?utf-8?B?YVEydmFtWXpIWkxSMThiRzliMkdDd0VlSWJvRXZUV0Mzd3pYajJIN0dMUHpF?=
 =?utf-8?B?c1hHSTNkbkwxNk5xNkRtbDhkR1JHMnU1SS8rN1BzRnNjOTFac0RONW1aQ05l?=
 =?utf-8?B?bmpWaVc0RDlKMTFDWCs2Z0dsSWZNT2xHcjh2bnNUOWVLUG1GWEJ1MVJka3Ar?=
 =?utf-8?B?aisyRnVUci9mdVpJa3locHdxOWxDYmJxTDIwdnAwMUk0cUp0b3N3SDNzcDNp?=
 =?utf-8?B?aEFPd2F0K1hsTXI3U2FvalFYRVNmWEdGK2Z0bFdSL1VDWEw5ZTI2ZllCUWdR?=
 =?utf-8?B?eElwTUhwN2U1ZW0rVG4vcXFiaWpWOXdaZkN5bnNPQml6VzJURzlsUmZvNkRE?=
 =?utf-8?B?TitvYWVNT1B0MEE3Wmt6ZDZSYktkNjRSRHA2UGZud3ZETm1xU1FIbEwyOUwy?=
 =?utf-8?B?UDltbnBtYXJjMjZPN3BRQUswTWs0VjVOM0JZYytrMVpaQUJVWFFiVU9MU0h0?=
 =?utf-8?B?V0RhZVREL2RqVlRqSnlsemVQZDd6VU9odFRrTXRxeCsrVUhvbE1NNE1IRFJh?=
 =?utf-8?B?NUkwYlV6dU9HYVNRbkZXTGhMamVYd3hpTEVLWWtGNmZiVlVxREZuZDEycG9z?=
 =?utf-8?B?UkplNDBUK1pOanhJUG9vUnhVcHlQZ2dFQ0hRWmNiZlYyWU93MmN3N1ZObkt0?=
 =?utf-8?B?cS9uSllucC9jSUV0ckI3MS9tQWp3MGlZQ3dSRGs4N1ZqZHNuVTJYdHJzOFFt?=
 =?utf-8?B?VUhXNi9zQmFHR3RSa2IwZjZ1T0ZRN2xGeTFWTmRlY0h1UTJOVVBhNHhMd1gr?=
 =?utf-8?B?VVVtQm42SkxVdmtHaDhXOWY2cURObUV3TjYvYTJpRkJFdTI2Q0RMalFaR0xO?=
 =?utf-8?B?aitnRVlZd05zSHpJSlR6ZUViblhMajFKVXBzcHEzVXhndjlHblhXeGduSmFO?=
 =?utf-8?Q?2SCw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:53:30.3001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd470e05-14d4-4d1c-366e-08de0732d90b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9143

On 2025-10-09 08:36, Jan Beulich wrote:
> On 08.10.2025 22:11, Jason Andryuk wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
>>   F:	xen/include/acpi/
>>   F:	tools/libacpi/
>>   
>> +AMD IOMMU
>> +M:	Jan Beulich <jbeulich@suse.com>
>> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
>> +M:	Roger Pau Monné <roger.pau@citrix.com>
>> +R:	Jason Andryuk <jason.andryuk@amd.com>
>> +S:	Supported
>> +F:	xen/drivers/passthrough/amd/
>> +
>> +AMD SVM
>> +M:	Jan Beulich <jbeulich@suse.com>
>> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
>> +M:	Roger Pau Monné <roger.pau@citrix.com>
>> +R:	Jason Andryuk <jason.andryuk@amd.com>
>> +S:	Supported
>> +F:	xen/arch/x86/hvm/svm/
>> +F:	xen/arch/x86/cpu/vpmu_amd.c
> 
> What about xen/arch/x86/include/asm/hvm/svm/ ? It didn't need specific
> mentioning on the X86 entry, but it would now. Also F: entries generally
> want sorting alphabetically as well.

Yes, that all sounds good.  I based this on a revert of 
8395f275ebd11b4cacb12da09911e7918ccc7518 and alphabetization was 
incorrect there.  Sorry about that.

>> @@ -601,7 +618,8 @@ M:	Roger Pau Monné <roger.pau@citrix.com>
>>   S:	Supported
>>   L:	xen-devel@lists.xenproject.org
>>   F:	xen/arch/x86/
>> -F:	xen/drivers/passthrough/amd/
>> +X:	xen/arch/x86/hvm/svm/
>> +X:	xen/arch/x86/cpu/vpmu_amd.c
> 
> Didn't the v1 discussion result in there being no need for these X:
> entries?

I thought Anthony said they should be split out for proper nesting:

 >The exclusion is likely unnecessary, and ./get_maintainer.pl will just
 >get the information (email, ...) from every sections that a file match.
 >But the duplication is necessary due to the "The meaning of nesting"
 >described in the MAINTAINERS file.

I took the second sentence to mean they should remain.

> As long as there's agreement, I'd be happy to make adjustments while
> committing. Oleksii - I take it that ./MAINTAINERS changes can still go
> in pretty freely?

Thanks,
Jason

