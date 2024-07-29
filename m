Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BC93FDF7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 21:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767110.1177696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVcP-0007tE-G5; Mon, 29 Jul 2024 19:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767110.1177696; Mon, 29 Jul 2024 19:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYVcP-0007qR-Cx; Mon, 29 Jul 2024 19:01:13 +0000
Received: by outflank-mailman (input) for mailman id 767110;
 Mon, 29 Jul 2024 19:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVSF=O5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYVcO-0007qE-TM
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 19:01:12 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:200a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eac48a1d-4ddc-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 21:01:10 +0200 (CEST)
Received: from SJ0PR05CA0091.namprd05.prod.outlook.com (2603:10b6:a03:334::6)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Mon, 29 Jul
 2024 19:01:05 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::7a) by SJ0PR05CA0091.outlook.office365.com
 (2603:10b6:a03:334::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.18 via Frontend
 Transport; Mon, 29 Jul 2024 19:01:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 19:01:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 14:01:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 14:01:03 -0500
Received: from [172.28.183.80] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 14:01:02 -0500
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
X-Inumbo-ID: eac48a1d-4ddc-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrZFI/xNlwiTl1o491HZl17zq+84zs3QAeI9HNA5hyFB0NC74Yaxr2Z2GGmPxOrqh6incdc9FdchI5SB0IMTVjri5kI1wYBchuyE99wJL2oHtcB8qhf+T16MoVM4OLRGcgWy8PCh4A+H0tEmlD7FGU8ie9ccL4hvEfvm6lY4O16RuBBDQCe6zgC1yUdTTlZjcVx8yUNNkXyXio2UvgNIPY5qE7QuuegBhQE3Xm7czsREdwTGULzsM7cPNGiEhKWMJ/DFe36TJT5ppu8Qx6Czamm7EJMwg7vA9J5bFtFqOuxeMNjrLRGd3jwBGt9TbUByh6U/z3FfYsKBA1BiIiA+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0UZJOlVK4SzrZKcExMnE76yioHMQ14SuFpawkbHYpw=;
 b=UMq3uOTtzFC232UbQyXlBiEcIX22++/KG6Jf9W+CJjatjyj68wAzpztq8WSu4notLSldb8u3Gi/WyEyvLkvfCVRg5RIRfrcI5lKm/jlTcbraNFRMK/JUimlK8BJiaWhprHMbI/ekiL8dfjC43VT//NCF4QFsrWEogISIHRMDMjLsV2+Q5jwHFsLKhBeO9/LNFhO7UwXcVPho6dlC/TG+Ek+c+3omgh82+6Ht4Lty7ytZ6+9TuKpe5Wryf7OouWd6xpezSojvdif5hh9iDSpFeZUo6+U70PLubqMIc3As9ykU2qX7N2MzIWa3QflOAgCGYs5z6KN5v1zLr/umcSXfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0UZJOlVK4SzrZKcExMnE76yioHMQ14SuFpawkbHYpw=;
 b=HkTfUabqOH7jBWi3KYMZuKx5nOK4iGhtbOoDxElx1NihV5GrQU4yyGU/+Mvb/K1ok4jHiAocimR8mvaKhgDGiNc9vRUX2JdpQZzlR9tciu4Ee6JP24t72zwAo+IPSbSzYQN+x9LDVtBPcwfRDJIz/K8aV7pn2y7s5HCaLCBuVP8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e816ca86-3b1f-42ea-b338-de73d9fb6370@amd.com>
Date: Mon, 29 Jul 2024 15:01:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen: silence maybe-unitialized warning
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <20240729142421.137283-3-stewart.hildebrand@amd.com>
 <b49f76cb-f22e-498e-83ae-68cc9840c48d@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b49f76cb-f22e-498e-83ae-68cc9840c48d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: abd5411e-768f-436e-8fc9-08dcb000cc18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2ROOXFkeE5Xa1VkYi9kdlhRVjJYODh2MW9wUXp2dDhaS2dUZG02c2JvMUcx?=
 =?utf-8?B?SVZrSkkzT0l0Z1NFVCszZUVKS3QrRzcrRG5rY0NMaklQV3MwY2tWQjFBVWow?=
 =?utf-8?B?RjEveGk5TTFhYTNzY0RIUTRJRjIxTWNMODRyUi9uTmx1M3Z1eTRKckRzNlkx?=
 =?utf-8?B?TUdmR1RzOHFheXNFMkM4eGY0N0hLUWgrdjZpa3Rvak1DbDdqUnpJMUd0cVRE?=
 =?utf-8?B?bkExeUFOT1ZqOTJaMmpLU2RvSnlVeFo1a0VWTmJjdEZNNmY3WnUyemlwS1pR?=
 =?utf-8?B?Q20xWm00WjlkRkZEZk5LVEtHYmRkTnRaUDMzWEZId0QxS3BJemZmdHEvQUx3?=
 =?utf-8?B?d3c2UkV3KzVvZjZpTDhyeXJMUm9aZVpHVGtmR1VSbTk3MTZ6ZFV2SklicVNV?=
 =?utf-8?B?ckFPT3FNbFhpczUzZDA3aEFldTdzQkpxRHh3VnR3WGFYbUp2Q0FNQ1FEMFZy?=
 =?utf-8?B?YU1BWEYyR1dKcHdoL2p2RWRteFQ4eFFzOWloU09RRlkvQ0xSNGpXL25jalli?=
 =?utf-8?B?U28zWWlkbWdCRThSWDc3MStCYkluSzhBUlJBQzV4QUhJbTFEM29oNWY0emN4?=
 =?utf-8?B?Nlp5elB4WWpvRzhXc3dpZlZHbjFGbHJVeHZ0V0ZZdlRKbjA0R2ZJaXZvYnJH?=
 =?utf-8?B?dmFDWFNuK2k2OTJQTnJNRDVFd0hwNHNYM0hxbVRScVRIcXJySGp3OElVRlJG?=
 =?utf-8?B?cU9BR1o3SExwTm1hUjBubktIRHIxUW4rS2VvcW91VHZlREc1WUh1dnZvT01k?=
 =?utf-8?B?NjV0QkgvYi9VUERlY0l6blVDWEJ1WnBaQmVsa0lNVFl6blpVbHdsQjRUbWt4?=
 =?utf-8?B?RUFlbzhwSzZtUVhSUXVKN3BaaFQ3SjQ3MkhHcmdsZno3QlJ0L0dwazUrT2d6?=
 =?utf-8?B?MC9vdldsWXJmb2VOQnk4T0d2ZnplMlN5bHZ4N1EvU0dLZ1hQU05seDBMcGlT?=
 =?utf-8?B?Vm1zV0NGQndvazI2d3FyK3IreUhqUE5DRm9QTDdHRGk1NVVYdm1VN2RHOTI3?=
 =?utf-8?B?NklhQ3VhWG9ubFRTeFNaNWJ5NFNmeUtGYWc0azN0dnNQbDdzaC9PeG1tZ0NW?=
 =?utf-8?B?Q2h5T2hwMWUvQy9GUVN4cllCVXd4RlI1YnJaUURwd3F6OEQyWExyVmNjOVVx?=
 =?utf-8?B?THJhTHFIeWI4NUJIUE9LMTYyc2V5TkM4RElaWmVEakJYR0dJYWhaU09DRyt3?=
 =?utf-8?B?T2NWb2M2dWo2OENZTFJnc21pN3l0NmRGYkZQQ0pTZUlUZEVHNkFGOTc4Yndm?=
 =?utf-8?B?SmgxTWNHR2JBeDUvbS9LeVl0U1BVNUlOcThtdDlzWVNGTWF6dHN0WDl6Ymp0?=
 =?utf-8?B?bXRGWlpSTFgrYk5yVDBOUXpMK0pucnJ5aUpmT0FqQkp5K0s2YjNiVWQwUmRE?=
 =?utf-8?B?OUpaN2pxdUdsUkVNZHNOUW9QcnkwYzAyRTZMOU9DSW1ST3QyTVYrSkczMjJK?=
 =?utf-8?B?bUJURGVGZmtEWmwzZ29yOEVNYjBWRWM1ejRtWkRCUzhqdUNDVU5tV1o4a29q?=
 =?utf-8?B?RXhrcVJJanZSU25LYVRYOW5sZThsTmRKMFJnU1VJVktCV0xPYVhqUkhiOERV?=
 =?utf-8?B?aW82WFA3S1d2aEV3Y1ArVnViVnE0RVZSUG5kK2h0ZXBnRTBsd3hQMSt5clJK?=
 =?utf-8?B?YnBjNTFjQkFCNUVvWERvZGtFcmFoTVdpWVcwVlVyOE5GK0kvNWhmaXZnRFdI?=
 =?utf-8?B?NGluQUJOMjVRaUdSL2poTmVoNFBSc3o3bFRVanFSSVhCK3JRSkgxWWNHUTJn?=
 =?utf-8?B?bzdvM2d3dFpYRzdWK0cxQlV5SG9raXgzVFFrdlUzZ0xEdEdKakNDQVNvR1pD?=
 =?utf-8?B?dXlZS2dHNC9IeHBmYndoYVFTZDgweGxQQm5qL2RIcHRKZXRGTGQwQXBUakV4?=
 =?utf-8?B?T3Uyd1dLZTlVSjAyN1orS1cxbFMyNUwwdTMvWUVMVHR6TXB2R0l4UHJ6ZWFY?=
 =?utf-8?Q?2JfbT5VFIsJoj+Yjy9Av4o4Zk26Su2cC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:01:04.8855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd5411e-768f-436e-8fc9-08dcb000cc18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660

On 7/29/24 11:03, Jürgen Groß wrote:
> On 29.07.24 16:24, Stewart Hildebrand wrote:
>> When building with gcc with -finstrument-functions, optimization level
>> -O1, CONFIG_HYPFS=y and # CONFIG_HAS_SCHED_GRANULARITY is not set, the
>> the following build warning (error) is encountered:
>>
>> common/sched/cpupool.c: In function ‘cpupool_gran_write’:
>> common/sched/cpupool.c:1220:26: error: ‘gran’ may be used uninitialized [-Werror=maybe-uninitialized]
>>   1220 |                      0 : cpupool_check_granularity(gran);
>>        |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> common/sched/cpupool.c:1207:21: note: ‘gran’ declared here
>>   1207 |     enum sched_gran gran;
>>        |                     ^~~~
>>
>> This is a false positive. Silence the warning (error) by initializing
>> the variable.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks!

It just occurred to me: should the subject prefix be xen/cpupool:
instead of plain xen: ?

