Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3CB8691C3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686179.1067860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexUh-0002kb-Pg; Tue, 27 Feb 2024 13:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686179.1067860; Tue, 27 Feb 2024 13:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexUh-0002iK-Ma; Tue, 27 Feb 2024 13:27:39 +0000
Received: by outflank-mailman (input) for mailman id 686179;
 Tue, 27 Feb 2024 13:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fto1=KE=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rexUg-0002bP-9N
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:27:38 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8b6cca6-d573-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 14:27:37 +0100 (CET)
Received: from MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::18)
 by BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 13:27:34 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::7b) by MW4P221CA0013.outlook.office365.com
 (2603:10b6:303:8b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26 via Frontend
 Transport; Tue, 27 Feb 2024 13:27:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 13:27:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 07:27:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 07:27:31 -0600
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 07:27:28 -0600
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
X-Inumbo-ID: f8b6cca6-d573-11ee-afd6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilBTWxFnGU2PV0RgxG/LfsGp3Gr7LHnLdMcXAI+abyI4Z/13deZjwvpmrrjSr7gGM6lEgi1kj53gjn9vgRnhqM6hnbycgVXJQEuOZVaXSlvYgfVALOM5Mo02s1iY+l2F2S1Zl+/mrIwEhwa8UAblFbMdAdMQINcDWWGGS1HRkjMYmYv5XtXQdVu40d7c7P4/YpNVfN1rSeoPa7MrZ0AMapwFCOpIZXRkc+UE58c+1Tte1oZjKvKLWnNCoyHSsP48wGEOyFPZZ8XVwpwuIYULn7i5ZRoXJKoXWzszeyMurFIZ+gASMLufPkR1V2NSN1NwQIuSWAfDS2cQbuplFFTPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fG32DN/8O+e4OkIL0FSBLZGXZRyL1cyzCIz9t1QoEI=;
 b=cpqgITKuYRJKWCFU0MKAFUg4koIOkp7hU2Z1xfxG5GUyV+N51p20Hj24HNE8dtMXfvNufoHCzAURPQ884IThZ+3pP0gJAiWf0ND6ikg1Y2IffdqhU2P7PSy8PMMVZL2XkGUp8wNiJBo/hD2L7zClgFP2gD48/G+6MvKqYTy+xxpLowLf2+18wMNU0aN7g5a3O9T2GrNLfMsXkyPN/bzvwXD6+MzrKU9QVTKbgp7+M5DLpMQVET5yVDQIOdRnSR+VeesL0+5IZzJD9u6O5f9Fhj9/y8ZgNsIzDsfVPILZ9+DeLI7RfadPdzdVfjr8e409Rdwb5TbBwTSdjkczLHSfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fG32DN/8O+e4OkIL0FSBLZGXZRyL1cyzCIz9t1QoEI=;
 b=P7gPVF5fy0s2VcjdKs/qONxdbbSpTJr2s8Ur6Va+cu+WRCmhdIhK/3JWZH6iVKbT+k4UL5IUuZJ5C1LzLUBA8YojO9PKpWxgxelGUF5Dm8/KbFmghynjcSIKTPet8gEPjN04pIc97j5VJzWhntmJDtjWyvi0oF1hAHj1XCJoLTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f3ff21bc-55f9-465d-95a2-269101b3d71e@amd.com>
Date: Tue, 27 Feb 2024 21:27:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <4c9bf719-7ad9-4739-9edc-eef06dcefb9f@amd.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <4c9bf719-7ad9-4739-9edc-eef06dcefb9f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|BL1PR12MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: d31b6b61-7903-4b56-d62d-08dc3797db16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xa6KAPn2iQsh92daJHsl0ArZT3UqkL15Gc4AFfdG+n3BoYn2kWIH9VSAul+u7lRagmglkECd6kjcHCltcC1dDULuA/6dNKgTDNh9UtbD8NL3plrmPXr6nPnAeSoWATUyjLw686oYb3h0uuH7cXbtDyt2YNBLFEJA85TJ74pKfc6W69r+7TgOiElXEGcmwYA7muViB2YDG8pgDb2aghCAw/mXTVHRestDewgeekG6L/kUP6WlcQlooPEbepmASqY3bpKA3NpDqe7VzRM0Nczrz3Y70LUEhMcjbuEIstUzs5ys/WfgKoPSJNpJlVBB5sFeHiiT51LIE7gTZq8ffFmu/4FZOub81fUvV8pe7Pm9QeOsxF4saXElQE3qij9rRehh5qwqqkc724u+Qpxg348d3UzpZF1vb/eXyR6g6Ii2NXYD/8/i9NGbzqltA6e4d7kSQB1T9yyaPjA+L5Ou6DbH6QNfJw13GJJmq5L4yBof8RjpbqHTcYXC0QOeB3hM86oA6iov15+iWSXI/w1hkNoeDiBdCSvMulhTtjhP02+M9t7ngW+b8p1fRp9rez6IKxYnWYZuam3MgCZB84ImSLTXye9tQUvMsfjEqOUtIZeFtCW6y5kt/UOM/GaZK7aauQh1uou+PquaobcqT9sj1yNgMyYemytasmBCoorhRnWL10VEzbmx+8CAJGqo1q3NnFED6uKK7x/jqNivG8yvhyKhmgie9ky22axx/kGd6WjBvT7lhEnU4UrEKqgbgGfuSI6L
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 13:27:33.3345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31b6b61-7903-4b56-d62d-08dc3797db16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5126

Hi Michal,

On 2/26/2024 6:29 PM, Michal Orzel wrote:
> Hi Henry,
>
> On 26/02/2024 02:19, Henry Wang wrote:
>> An error message can seen from the init-dom0less application on
>> direct-mapped 1:1 domains:
>> ```
>> Allocating magic pages
>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>> Error on alloc magic pages
>> ```
>>
>> This is because populate_physmap() automatically assumes gfn == mfn
>> for direct mapped domains. This cannot be true for the magic pages
>> that are allocated later for Dom0less DomUs from the init-dom0less
>> helper application executed in Dom0.
>>
>> Force populate_physmap to take the "normal" memory allocation route for
>> the magic pages even for 1:1 Dom0less DomUs. This should work as long
>> as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
>> guest address as the magic pages:
>> - gfn 0x39000 address 0x39000000
>> - gfn 0x39001 address 0x39001000
>> - gfn 0x39002 address 0x39002000
>> - gfn 0x39003 address 0x39003000
>> Create helper is_magic_gpfn() for Arm to assist this and stub helpers
>> for non-Arm architectures to avoid #ifdef. Move the definition of the
>> magic pages on Arm to a more common place.
>>
>> Note that the init-dom0less application of the diffenent Xen version
>> may allocate all or part of four magic pages for each DomU.
>>
>> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
>> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> NIT: Generally, the first SOB is the same as author of the patch.

I will fix in the next version. Thanks.

> [...]
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index b3b05c2ec0..ab4bad79e2 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>           }
>>           else
>>           {
>> -            if ( is_domain_direct_mapped(d) )
>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
> I struggle to understand the goal of this patch and the proposed solution.
> The problem with magic pages applies to static mem domUs in general.
> A direct mapped domU is a static mem domU whose memory is 1:1 mapped.
> Let's say we try to map a magic page for a direct mapped domU. That check will be false
> and the execution will move to the next one i.e. is_domain_using_staticmem(d).
> This check will be true and acquire_reserved_page() will fail instead (similar to the
> static mem (no direct map) scenario). The only thing that has changed is the message.

Yes you are definitely correct, I missed the check for static mem 
domains. Will fix in v2 once the proposal in the other thread is agreed. 
Thanks for spotting this issue!

Kind regards,
Henry

> ~Michal


