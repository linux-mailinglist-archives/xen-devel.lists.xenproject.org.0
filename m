Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB3C916BB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 10:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174620.1499575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOugT-0002A4-DS; Fri, 28 Nov 2025 09:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174620.1499575; Fri, 28 Nov 2025 09:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOugT-00028P-95; Fri, 28 Nov 2025 09:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1174620;
 Fri, 28 Nov 2025 09:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V56+=6E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vOugR-0001q2-H0
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 09:22:31 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2d0f262-cc3b-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 10:22:30 +0100 (CET)
Received: from BY5PR16CA0008.namprd16.prod.outlook.com (2603:10b6:a03:1a0::21)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 28 Nov
 2025 09:22:26 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::76) by BY5PR16CA0008.outlook.office365.com
 (2603:10b6:a03:1a0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Fri,
 28 Nov 2025 09:22:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 09:22:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 28 Nov
 2025 03:22:24 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 28 Nov 2025 01:22:23 -0800
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
X-Inumbo-ID: c2d0f262-cc3b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4PUaX3cfeyivzL81GhGsRc04zMFOUH0GKLc82dv85/iBx79xgycRDfZvqb3nPzKj4qrxzb9W8pKrr9JUcPZ2CowZ8o+l+DLGVe2ttpDPHbd2G+1BWWBsZY5TrEEIE0pozwYlWzAfT0LMg3gOkPjNcIJRUG7T3IX6zfWkmhmnRWR8gAc11z4Q8ygnRsuWrHz9KhMhkrFzTFK5+Boy9kCyWLZTzdNEt4P3lG40g5P5OHlcCmqtddEh2bUkAnpBeJVqK0x3gBhTTMK4/q806Le78IpS2QOFYXrsLOuhZ/ERiQS7O6I8p7IlcUvuKWA6z6Lu6w1JKGyKsjoblSTqjAa1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPZ7W7SxxB1tXe0MmaLlPapNOfnEVEZrhQASAuU9JI8=;
 b=QZLpK/Qt5E0N8MYthdtgZDTosnYuprnujjE7oxl4adjkcp/n9ySI0QniiJNkYgvfG5N4HQTHufb3fJ8ajymYAu/il/kspLjKWHH0UaZCFGch7Wi75H/0WMYJIj25duIbABHUtnIyC8cRYQW3nSy/J21b1f/12i5ufIq3rm2Wz8l9W3EL3NQFAtHcbv1YdRoA2JqWCOUrqtk6ZlFdOuZrQlmnDXkv0bXwK6H0JD+hqgh0xeofdQaLlheEKcpeIg3AM8132XYV7oWQOZc6zX26EZuwDqOPR46nUMWRM2bQ4H07SgL1ve+G8dfOyQgbJbC/iwDgmnPgShDzOzFPElBsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPZ7W7SxxB1tXe0MmaLlPapNOfnEVEZrhQASAuU9JI8=;
 b=GjEXVImTlpGKoMLq9x18wPEZBC9PPsAzU5JNQnwVAExsVvfXKl9bKd0P+VogrnOJh3joOIh81ytj8SSnOSR7hie3rfhW1c7H20TjyQYbJvVZbgw7v2ugzOixCL8ue7vw6YSdvq6Sa1rUHCaz1KAhJ5wOp05/zBqXvQ80m6gnfbo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f2174149-1673-4cb8-839a-d96ad0588000@amd.com>
Date: Fri, 28 Nov 2025 10:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/dom0less: move make_memory_node() to common
 code
To: Luca Fancellu <Luca.Fancellu@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <cover.1764260246.git.oleksii.kurochko@gmail.com>
 <dba41b3415313112a7612b5cfaf7ce0ee4a4a1ee.1764260246.git.oleksii.kurochko@gmail.com>
 <ECE56FA5-058A-4031-A4B3-74B3C2134A4A@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ECE56FA5-058A-4031-A4B3-74B3C2134A4A@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: 72948932-d8cb-40b3-b186-08de2e5fa587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkhIbmdZWnBGcWFtamJaRlNud1RSVGNtbUVDSm54SWJFbG9Gb2FHVElsOG9F?=
 =?utf-8?B?czlQUGlYV0o0NEhhUkJEU21LTXhoRy9hZWQ3MUV5ajhLRWRZZ3FqVEdWNzUr?=
 =?utf-8?B?S3JXcnlwUVpxNktKYU50ZFJrZDgwZG9kR3JrK0FNM2ZUdzZnUnZSNVFucVI3?=
 =?utf-8?B?YkRVcStLV242OStQOS8xODQ2N3lGTkdpaFFVWnBBTEFieWwwK1kvaFFuY0pZ?=
 =?utf-8?B?Q3Z5YldzWmlvQlZ5QVUvaER0cFB2Zy8yZ1dtZ3hNYzFoUHdXRTRsUTZxU0M0?=
 =?utf-8?B?MUlFbEtaWnYvV3Z5UUdrZ0Y5aVlIbmx0cnF3R2F5OFRJdE1TZFl3WGVBWlpk?=
 =?utf-8?B?Tml2elpaSEVuYkFkcEp4b05uMTB3UEcrS0VCbzNSZDJuVXh0UzY4R3Aya212?=
 =?utf-8?B?QU5QSlpjL3ltdWdDeDNreFBxeGpRTzNYZWdrWThORDgxeXRoS0NpQURFeWhS?=
 =?utf-8?B?cFY3ZldxVXBNdUtBMXJwWTVYUnF0QWdDVndIRDhESWN6bVdMS2wxRDBaSG5H?=
 =?utf-8?B?TFJENzYrUGZGWDc3Z3Q4cVNZQ2ZrTUNOY3hiZkI1ektKUWVwRU5kNDBGa2RC?=
 =?utf-8?B?VmhwdkFSOG1yNUk0Qk5sNDRSVk5nSTJ6b0FjM09UN01xVXZxR1NHcGcwaXdR?=
 =?utf-8?B?L1lJWXNnaktHUTUwUWw0UFlBTjdCaGZDWDZTU1R0U3VYdnNYRU05TW1iYnFS?=
 =?utf-8?B?VG00RklGS0FuZ2EvcGltNExyY0N5ZEVpcjJxbjZ5cHBYU2RzMzN2eWsyYXVv?=
 =?utf-8?B?SVNMUEtNdzNrejRMbGVqSi84eVdibWYvUnluYmdGVU9hOTdqZUZ3allzcFkx?=
 =?utf-8?B?eFdsVDd6MzZPczRqbTJ1WXdqQU5QNlhRZmhQUFdMRGJmNkRIZXRQY1orYmto?=
 =?utf-8?B?S01kR3E3S1BxbnRoMFV0cmxiU0tXRUVXazNhQWF5cGdNd1BmUzF1emtCeDY1?=
 =?utf-8?B?dEwyZHArcUUwS3R0azRqZ3JrK2xkNUtJYzExMmZRM3hWTDdkUzJueWxSWHl4?=
 =?utf-8?B?UXZQb25GeU5TbVhkTnZMTlNldVp4NndYM0lKZFdtQ056b3BLdUJzKzYxTnZp?=
 =?utf-8?B?aHdSciszTmplRWVLMjdTR0pLei9DdGU5SmZKN0hpTUNhNHRxWDVoazNYUzJV?=
 =?utf-8?B?bk9IQXpKNzhFWkMvNnhrYnJjSy9HNlNSSnd4aDBqTk5PYms1NUhwb1BIUzY5?=
 =?utf-8?B?Z3BvM2c3UkRrclRaNStGWTQ1UlNCemdZM2ZRTHlXeUdZQW5ncGlxeGI4bW9y?=
 =?utf-8?B?NjBKbzUzL0tSWGoyR2hZQ3hXN0JTbjBLM3Axbys5VmtHbGFBUWZad0tpdm1i?=
 =?utf-8?B?b2E3clJ1akU0M3lPTDFGTS8xanZJQmR2cW1IMXc0ZG9hRkY5YlpVK2pWRmps?=
 =?utf-8?B?bkF4MS9nb1dnNjZ0cXMzK0dkeFIxeGJVaHBQc3lHRzI1Uy8xSkpyTWZjL0FK?=
 =?utf-8?B?TmNpeTFNbGRtcERQNU5XK28vOU5VWFg2YXZSNE93VU9SL3dVeUNlZC9vUVl6?=
 =?utf-8?B?NmYwNG8zME9sZ1M2T1hkY3dQL0RiaTZRQXJHVjlya2EzYzRhQTBMT3dvZHZF?=
 =?utf-8?B?dXdUMEV6MzRTUUJOQXYvT3NIRU5Ga1hVTTlxUXhUK1cweENuZjhhSjNJbG9r?=
 =?utf-8?B?VEhGc2ROZjhWejFGUlVlellDdXczRVdwVnpVcy9kVGY4bVN2ZTM3N3hWTVZn?=
 =?utf-8?B?N1IyUkVNNzZEaEZxcmZ6YXZ0RTFNTHNBY3ptOXI0TVNRM2xPdUNoM2pGdHNR?=
 =?utf-8?B?WEdjRk5qZkhocTRSUDcxMTFyWE04VUNTTUJIblNNR0FIUU02VFFSMU1nM1dr?=
 =?utf-8?B?SWFNY1BxZWhJdXdzdGtIRHFyUEtvU2NCRGlMa2MxNUg2aUV3S3RLaG9YbVo0?=
 =?utf-8?B?cWlLWC9iMk1nY3hjV3Vud042ellRNmNOc2JWSjFBQ2lJQlNtbHpuK2JiNjJX?=
 =?utf-8?B?MXV5OTlpTnF6Nk1hK3dnRkJRb1o2TTVNd05ITHdqcllmVXhEdWhtZnZZR3hU?=
 =?utf-8?B?Um1IZitqblJpLzNmRG92OWx4Zmllc3EwSFYyV0VSb1pJNmwzUGJmaStFN2Vx?=
 =?utf-8?B?WHdDWjZWR1RERVBFVExHRTA5b3duN3VYRWZ5QkJyNSs4TG1RM2VjRUIzdW4r?=
 =?utf-8?Q?1Cc8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:22:26.5753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72948932-d8cb-40b3-b186-08de2e5fa587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149



On 28/11/2025 10:06, Luca Fancellu wrote:
> Hi Oleksii,
>>
>> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
>> index 774790aab3..6708c9dd66 100644
>> --- a/xen/common/device-tree/domain-build.c
>> +++ b/xen/common/device-tree/domain-build.c
>> @@ -8,6 +8,7 @@
>> #include <xen/mm.h>
>> #include <xen/sched.h>
>> #include <xen/sizes.h>
>> +#include <xen/static-shmem.h>
>> #include <xen/types.h>
>> #include <xen/vmap.h>
>>
>> @@ -451,6 +452,80 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
>>    return res;
>> }
>>
>> +int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
>> +                            int sizecells, const struct membanks *mem)
>> +{
>> +    void *fdt = kinfo->fdt;
>> +    unsigned int i;
>> +    int res, reg_size = addrcells + sizecells;
>> +    int nr_cells = 0;
>> +    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
>> +    __be32 *cells;
>> +
>> +    if ( mem->nr_banks == 0 )
>> +        return -ENOENT;
>> +
>> +    /* find the first memory range that is reserved for device (or firmware) */
>> +    for ( i = 0; i < mem->nr_banks &&
>> +                 (mem->bank[i].type != MEMBANK_DEFAULT); i++ )
>> +        ;
> 
> NIT: maybe we can fix the code style here, maintainers can give their opinion.
I'd prefer to keep the movement clean.

Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


