Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373B6896F56
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700531.1093827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs05A-0002zy-T0; Wed, 03 Apr 2024 12:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700531.1093827; Wed, 03 Apr 2024 12:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs05A-0002yR-Q4; Wed, 03 Apr 2024 12:51:12 +0000
Received: by outflank-mailman (input) for mailman id 700531;
 Wed, 03 Apr 2024 12:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFJ5=LI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rs059-0002yG-9Z
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:51:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d69b53d5-f1b8-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 14:51:08 +0200 (CEST)
Received: from CH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::11)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 12:51:05 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::5b) by CH5P220CA0009.outlook.office365.com
 (2603:10b6:610:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 12:51:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 12:51:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 07:51:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 07:51:03 -0500
Received: from [172.25.194.180] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 07:51:02 -0500
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
X-Inumbo-ID: d69b53d5-f1b8-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYVMmDwPp79OXmBYRsFPUQ6hwYtwr2/tK/6IUiJWTGVfWXVAhgFpbz5D33Qwyjp9ap5LXFqFpdyrK2+7X/9vEn+IByEOYJNKRKlfAu0mabCP1BVD9OjBE24rbUyXuj+U6bniJmnyD96rMsZso7yPaK0kf4cuClQstint9i+BLZJQ/onVI3M6jlsC/MHkbEG6gQ+N/ooG4YeBVrtZ13MW8PMy3ilW7c1LsxbrwFvW1ovAUjzyBaFfguo9C1wVjJqkmB2gNvvgqJC34pcRh0poXjGpyUoiiiX9EEmGnTz5ixQd3mpV31qFjrYnL4xzUJlNBLHTxXSBX8mV1z1PMFxPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMyIZ6BpMbAlZ4idaFKVciVEJZm2R12PLhnjEgAwobM=;
 b=MM5M9hIAIUTz9pJGq2tjR0VP0ZJ/7M2IHFfp1NQsGBUuFfXmUl90m+oBDWgjL9hoM+0XpYqi38fc/Xh/DJiMRG/5CMeN6Bo+pA7gYtGda2CCBq/lqswtnVIU03xBF7HsOBJfgQyBY/jnMAbZnVgMC8Li6xD4fHQhqYum3DLHRTQ1hdbDMG7LZ8/uQ0GKKPGe0b2q3i04AEHSawF2JLMSFEcGH3dF0dJMKsJ7mHnODS/yjTi8I3HoOXkYKtuSwTTlsLiJImUvx7xmDPA5J5Qz4se1n+tCmxRyqQ/JEKXPmpGWYvzoh6vVC7tISQgtD7yuMD2m+addlL95EmBCUOzXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMyIZ6BpMbAlZ4idaFKVciVEJZm2R12PLhnjEgAwobM=;
 b=P6UTHV1XPdlXUK7629pJt+lzrzT/41Bw16wSfXpDNKZ4XDlUIp6h3owNtHoHt2BVuRUQn+K+H/v48W2UR7+6tqw6rgVT1AAN4n3ue9A88EFM4eb0zrcucatMgLNdCMcTO0CYFSYQwiDkdDcKBBDegCm9EWNdgAc0toq9oyugQ80=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <5e7d8c67-cb22-4433-a5b5-169e6e96ac6b@amd.com>
Date: Wed, 3 Apr 2024 08:51:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] tools/init-xenstore-domain: Replace variable MB()
 usage
To: Anthony PERARD <anthony.perard@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Julien
 Grall" <julien@xen.org>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-2-jason.andryuk@amd.com>
 <3bcdb957-717e-4505-951e-711c87744f6c@perard>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <3bcdb957-717e-4505-951e-711c87744f6c@perard>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: e731e82f-0ebc-4f03-733d-08dc53dcb987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dMYWT1u7Te9yFGb08hoAsr7OBgHFyPBbqRQoOSS36o40JIWfy92xaof/usEixDuJV4SjmlH7NBiFDnGx1lU5c764EvNhC867iLe8zuihbTiGWknyMAYBkcWEXmb+SAYBO5mFKmKxjjCRXNYP5aA8/A3JQ4Mh6TU5HkHMfJBwnLqUWND5E5Ay72Mg9QqHfNuww3obgXroU8A4N29Tqhm/HhhG0mF1PiQKBUNtQWGJxlStCtvmo27ltNt32eMv0od3EGKnk2jEF7yaFEC2VwFLyEmE88JgM/XIKJVf4sLSZN8mFrvHoOXMx/pm3PczI4fpRx2jJMqkFtKfhP+NUyGigzwJ8D21u54xSWHGMkPRNHsij2oVbXNz5S2+D8mkktdv03ROBbWZtusk+u/8sGI4UpkxRVlN0zCjPVU3kKyGChmymfhPY7JV/FCpaibcFgRbbdDxdlD3S6gFI7NHf/mF+z7PQPcptW0EcV6RxPRp4EBMsMvz5o4fkw9Puc5k1UfdN0xPVKdLn/495r8Qz+5kTESJp4oG64ChHhiTbrMKqLVWRO0Dqdc+j+BZauJT9fz4lHPdVHt1UQ4hpvhopDB6FeXpzD+4C0RvcmVFWjPzocBxd+OMANlcWnJer4e8gDKbX7ZYch/6CqGKg4QDx0HlegTP7/Xf0fJA6L9ImOV/xlJXB6kYEo80IicS+HKrRfZGzlxO9vtPKB7nyTm6pdSk41AwlnDhUfkJumpkz+XNsSYqcQzm8LpkPY1fTml7eOcV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:51:04.8465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e731e82f-0ebc-4f03-733d-08dc53dcb987
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416

On 2024-04-03 08:41, Anthony PERARD wrote:
> On Wed, Mar 27, 2024 at 05:50:59PM -0400, Jason Andryuk wrote:
>> The local MB() & GB() macros will be replaced with a common
>> implementation, but those only work with constant values.  Introduce a
> 
> By the way, this is not true, the macro introduce in the following patch
> ("tools: Move MB/GB() to common-macros.h") works (compiler doesn't
> complain) if you do something like MB(maxmem+0) ;-).

Well, I think I wrote the wrong word for the description.  The old Macro 
might have been okay, but the new one as (_AC(_mb, ULL) << 20) fails for 
MB(memory):

init-xenstore-domain.c: In function ‘build’:
init-xenstore-domain.c:82:28: error: ‘memoryULL’ undeclared (first use 
in this function); did you mean ‘memory’?
    82 |     uint64_t mem_size = MB(memory);
       |                            ^~~~~~

I should have written "only work for numeric values."

>> static inline mb_to_bytes() in place of the MB() macro to convert the
>> variable values.
>>
>> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
>> index 1683438c5c..5405842dfe 100644
>> --- a/tools/helpers/init-xenstore-domain.c
>> +++ b/tools/helpers/init-xenstore-domain.c
>> @@ -20,7 +20,6 @@
>>   #include "init-dom-json.h"
>>   
>>   #define LAPIC_BASE_ADDRESS  0xfee00000UL
>> -#define MB(x)               ((uint64_t)x << 20)
>>   #define GB(x)               ((uint64_t)x << 30)
>>   
>>   static uint32_t domid = ~0;
>> @@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
>>   static xentoollog_level minmsglevel = XTL_PROGRESS;
>>   static void *logger;
>>   
>> +static inline uint64_t mb_to_bytes(int mem)
>> +{
>> +	return (uint64_t)mem << 20;
>> +}
>> +
>>   static struct option options[] = {
>>       { "kernel", 1, NULL, 'k' },
>>       { "memory", 1, NULL, 'm' },
>> @@ -76,8 +80,8 @@ static int build(xc_interface *xch)
>>       int rv, xs_fd;
>>       struct xc_dom_image *dom = NULL;
>>       int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
>> -    uint64_t mem_size = MB(memory);
>> -    uint64_t max_size = MB(maxmem ? : memory);
>> +    uint64_t mem_size = mb_to_bytes(memory);
>> +    uint64_t max_size = mb_to_bytes(maxmem ? : memory);
>>       struct e820entry e820[3];
>>       struct xen_domctl_createdomain config = {
>>           .ssidref = SECINITSID_DOMU,
>   
> Sorry, just notice they were more versions of the series, so repeating
> here:
> 
> Looks like this change actually fix a bug. When `maxmem` is set, we
> would have "max_size = maxmem", otherwise, it would be
> "max_size = memory << 20"
> 
> The macro should have been written as
>   #define MB(x)               ((uint64_t)(x) << 20)
> 
> This patch could be backported to 4.17 and later, with:
>      Fixes: 134d53f57707 ("tools/init-xenstore-domain: fix memory map for PVH stubdom")

Nice catch!

> Anyway, this patch on it's own looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thank you.

Regards,
Jason

