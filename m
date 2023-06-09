Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BF72956D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545750.852288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YY2-0005QK-Na; Fri, 09 Jun 2023 09:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545750.852288; Fri, 09 Jun 2023 09:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YY2-0005NU-Jk; Fri, 09 Jun 2023 09:36:46 +0000
Received: by outflank-mailman (input) for mailman id 545750;
 Fri, 09 Jun 2023 09:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0cG=B5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q7YY0-0005NO-T8
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:36:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eab::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23f89a43-06a9-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 11:36:42 +0200 (CEST)
Received: from PH7PR10CA0003.namprd10.prod.outlook.com (2603:10b6:510:23d::24)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 09:36:38 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::8f) by PH7PR10CA0003.outlook.office365.com
 (2603:10b6:510:23d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 09:36:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Fri, 9 Jun 2023 09:36:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 04:36:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 04:36:34 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 9 Jun 2023 04:36:33 -0500
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
X-Inumbo-ID: 23f89a43-06a9-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAP3h2S3/PN9hEFmMbuRmNYzH96gmtv5D8Dh+fyicDAWIGM5BWaMl6CPx4b6XOgHlgz6CP1rCma2G2nCoFaB62zPa6FXeMtPu1cDRrXaXK2plftpCavEH9w/8Z8EuD/Z5eEVoJnUw5PsXgRPYQmutxUxtfOWYAKHjCsS7nrh0eiqbwHXL5/+V/BOulQE49h9nSmbevAg9FGGD3ulM2VCiw9xDf29mJqpizCWWyx+ENcdvP3J4VGQxZWbdLe/qnhnyNm2RAmUWyag5rINIZsumSBlx7UhBbSxGcR3whoU8YOq7n7AMA0wANVsnNnrtgoVe4MXKZGeUjYTpbGanE9wFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoqt0ZH7gZsrkAN5dbkVkm74ZnmBovzVLSU6Qi9oBuo=;
 b=KGc8BCX/FOL0mdYGRgC0LbHkuzDPxx99cN8we6Uv8l424hDQLcNTksQCNUjtBeQSW50NA+6GOaSx1iiBLO0ib21rpSuvacsPmP8fudf+Rl0s5PVvgk90MB1jpFkMvLY5sIFcyeXZD4JKhfuz4VvyRjOdueOgMXplITIJGSKxF0/NHt0vxoHQ00iNtBsulR6Am261P5ax4NiWp79ERvjUNOSVlON02EP4kzd5PlTLBkhrbqh2VYlNnGRLuM9By14HCH/IUy1DJ2FUbaY15ECuRy9zHifv0nXYLvbrEgSIgeD/CXpHIYJ5YFlWv4thrYaEqvewr5k7qosgeOijQhuOEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoqt0ZH7gZsrkAN5dbkVkm74ZnmBovzVLSU6Qi9oBuo=;
 b=zrDAYHGGpAbwq8yc5zh7TNR1mTQjlHVze/kP3TA4h4JuM4KAbqYFZuVBns5ekc/bsrAQ+5EPmp233zCdTa3+ZxdLbXM4x8lPpc0NecNht7qFS2crP3p5lVEgohjTeWg8d7zIqaInAdEnimcsKUtmaocHXwvuA2z4XGDQXGkbVD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8efd91fd-bb36-9073-654f-fef32d0da443@amd.com>
Date: Fri, 9 Jun 2023 11:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Xen reliance on non-standard GCC features
To: Jan Beulich <jbeulich@suse.com>, Roberto Bagnara <bagnara@cs.unipr.it>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"consulting@bugseng.com" <consulting@bugseng.com>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
 <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
 <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b2cc6cf-6fa3-414f-7447-08db68cd048d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DxgJ8TD0ct+HwU3SdAbDzjd9vcjfN8sU+zEq3fOzVN5LrO5WgAbiC0rkBDnzvJTWGn0Bo0WopR5rRa8NCL7VBGuZqg/ggMWr+IQU3oCSLiIhkV+1Kq/vsk4PzrSjLWwCmpOXJFlzFvd/QGGo/0ymTUq1MNpsNiW/gBt2qNBVJ0vvAwBX0jMcj+ElHIEI7tO/JQyvrSzsKQtrPwecPkWqpVkdd6maGwf6gGomTqKaFNLn/auLmS3zg789saBJQJKzkJlUUdj6cgJKYieJKce3nuP+pLc6wScl4PYS8B9NsJG7TCzQSIEKECXcVHKf7/0etjE4ktbNdNsrFvOVl03tVRRrrHFIVySrRRJeKaq3xgPvcE98zHNWNB75D33PNN3uVY5+4G5genY5EHkkHsY9tPFC4OCVUQWI3d9LpW0U/3hnS8z0RS/pgLsCbh8HxAyFMMCFOw0tljLqsocjF2bCSv+FuzodeQcFzHoN73LQwaxix1pdkCj5ogezesmdU6IowTfBOjYrax6mfQ1DXfKoAcCS4YiM3BZuse8JWtE+FTpXBAqC/sMlfSv3NLwoE0pXxQNMpK6iRyC2Lryod95VZ/QWhv6L4K/zR90wToeA4HZjhe4bLs6bvqAd0/7J9MBISWiZUHvgZQEmFhFTczOh0xnQQIXCnjx5OCzfU1gRn7UNWp/mj+rDQmEd0sFcAbcwUYzfLDMbf2ZZMXeeoYFG9P5p52YGeTq9H6pgDDZxdnfvUxHX47lbmzO1QN/mIjS0iaq/OL96vKg0VD8NgLz5xZLjk+iji+5GfgBY8qzGoqtzYBPsz8FCJCekW/TfqMpW
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(53546011)(36756003)(40480700001)(26005)(82310400005)(186003)(5660300002)(426003)(41300700001)(336012)(478600001)(2616005)(54906003)(8936002)(83380400001)(16576012)(8676002)(110136005)(70586007)(316002)(70206006)(81166007)(356005)(4326008)(82740400003)(2906002)(31696002)(86362001)(36860700001)(44832011)(47076005)(40460700003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:36:35.6395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2cc6cf-6fa3-414f-7447-08db68cd048d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954



On 09/06/2023 10:54, Jan Beulich wrote:
> 
> 
> On 08.06.2023 14:18, Roberto Bagnara wrote:
>> On 07/06/23 09:39, Jan Beulich wrote:
>>> On 05.06.2023 15:26, Roberto Bagnara wrote:
>>>> On 05/06/23 11:28, Jan Beulich wrote:
>>>>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>>> You are right: here are a few examples for U2:
>>>>
>>>> xen/arch/arm/cpuerrata.c:92.12-92.35:
>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>> xen/include/xen/spinlock.h:31.21-31.23: expanded from macro `_LOCK_DEBUG'
>>>> xen/include/xen/spinlock.h:143.57-143.67: expanded from macro `SPIN_LOCK_UNLOCKED'
>>>> xen/include/xen/spinlock.h:144.43-144.60: expanded from macro `DEFINE_SPINLOCK'
>>>
>>> I'm afraid this is a bad example, as it goes hand-in-hand with using
>>> another extension. I don't think using a non-empty initialization list
>>> is going to work with
>>>
>>> union lock_debug { };
>>
>> Yes, this is C99 undefined behavior 58:
>> "A structure or union is defined as containing no named members (6.7.2.1)."
>>
>> Here is another example:
>>
>> lpae_t pte = {};
>>
>> whereas we have
>>
>> typedef union {
>>      uint64_t bits;
>>      lpae_pt_t pt;
>>      lpae_p2m_t p2m;
>>      lpae_walk_t walk;
>> } lpae_t;
>>
>>
>>>> xen/arch/arm/cpuerrata.c:678.5-678.6:
>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> xen/arch/arm/cpufeature.c:33.5-33.6:
>>>> empty initializer list (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7.8: "An empty initialization list." [STD.emptinit]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> Both of these are a common idiom we use: The "sentinel" of an array
>>> of compound type initializer.
>>
>> Wouldn't it be possible writing such sentinels in a standard-compliant
>> way, like {0} or similar, instead of {}?
> 
> I would be possible, sure, but the question is whether we want that. Iirc
> in review comments we've been asking to preferably use {}, for being
> shorter / less clutter without resulting in any ambiguity.
> 
>>>>>> U6) Empty declarations.
>>>>
>>>> Examples:
>>>>
>>>> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> Looks like these could be taken care of by finally purging our
>>> EXPORT_SYMBOL() stub.
>>>
>>>> xen/arch/arm/include/asm/vreg.h:143.26:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> xen/arch/arm/include/asm/vreg.h:144.26:
>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>
>>> I'm having trouble spotting anything suspicious there.
>>
>> The macro expands to definitions of inline functions
>> and after the macro invocation there is a ";".
>>
>> The preprocessed code is then:
>>
>> static inline void foo() { ... }
>> ;
>>
>> where the final ";" is an empty declaration not allowed by
>> the C99 language standard.
> 
> Oh, I see.
> 
>> Removing the ";" after the macro invocation is a possible solution,
>> but other possibilities exist if this is strongly unwanted.
> 
> We have other macros to instantiate functions, and there no stray
> semicolons are used. I think this wants doing the same way here, but it
> being Arm code the ultimate say is with the Arm maintainers.
Apart from vreg.h the same applies to TLB_HELPER of arm32/arm64.
I think also TYPE_SAFE would want to be fixed.

~Michal

