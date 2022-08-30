Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C855A5E7D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 10:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394904.634492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSwv3-0001Af-Rr; Tue, 30 Aug 2022 08:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394904.634492; Tue, 30 Aug 2022 08:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSwv3-00018T-Ow; Tue, 30 Aug 2022 08:48:25 +0000
Received: by outflank-mailman (input) for mailman id 394904;
 Tue, 30 Aug 2022 08:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSYc=ZC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oSwv3-00018N-4b
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 08:48:25 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8090e2d2-2840-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 10:48:23 +0200 (CEST)
Received: from DM6PR02CA0067.namprd02.prod.outlook.com (2603:10b6:5:177::44)
 by DM4PR12MB5279.namprd12.prod.outlook.com (2603:10b6:5:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 08:48:19 +0000
Received: from DS1PEPF0000B075.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::99) by DM6PR02CA0067.outlook.office365.com
 (2603:10b6:5:177::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 08:48:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000B075.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.7 via Frontend Transport; Tue, 30 Aug 2022 08:48:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 03:48:19 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 30 Aug 2022 03:48:17 -0500
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
X-Inumbo-ID: 8090e2d2-2840-11ed-a60c-1f1ba7de4fb0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HetMtg1lHqoMqbOxQ3SBvyFACZv/6QZek29mudjMNx/YeVR07l0v+pcWxflgqr6YDRM/AXZn9dk3kvc7pKvOgC1uwt+r+RYvCv87Uwoe7SEUyPpVKsOyoe5QXB9XPr7c49JU8ApInmChKJRqjYlNJztMsOuNyh9Oag7skChQG/Wdq1H3X4a4FfmlbgaO/Bbnk6vx2vKTQvi3t12Y5CYcb0SH1JMytnL/L6Yy9rhKzVVCE4mgyKwojjCeKGFvASy/a6BkzuPoW3CxmdF3mdtE4MaS9Wr+aS0aBb5YceakVvv5EoKFKRPWLqbrOMmrcCN9YMxJw3NYm82OqkTKj0WNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztxM+hr2zJzn43pWTsJvzqiQDjunNWsEUXTnlUUm1hs=;
 b=Aw9QOuJnlj9BzcrcURAy17NZbTGMimt0n4Rjr3oeRVz11wTUeqZtj/WsaBQQQDyYt3N8g+Ntok8hQW/EpeWEXtkyS04n4/kqaOF+aF36PTTbJqxkyhn1/pycLhCm5FIw3OdVi/SJhef71a2rnjtRnIuK8okUUlPkPLwnl+lCVrki5SlyK8IuTpFnzv6SdCLBNFLBuMjUvA3qZoxuwypGqLcqT9ZOT+OXdrzGTkSz+b4orN8N4ryzvyvKdMC68biTd2o2anQJd0ANePFgNEIFchO05pcxFz8fTg6zGNpEApyHMate8fEJ1f8EEMa1alkEnqueAZA4lT4RAAN8N2dQ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztxM+hr2zJzn43pWTsJvzqiQDjunNWsEUXTnlUUm1hs=;
 b=l42qV8xF8lsjp6hRuIEN3hLmMYrSpdYngsghc9crFIOMhKSgK1+mnaOg703kTHLJwdWO+v4o2q/nGP4Ebhy2GidAvs+J/JP0hXN7BlsTo6hu/TPWySgL8+ZcIZiyUZWdyjxoCF6ucMSLViCWALA9Tvf6sioPPmtsOkG/QXoif9c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <536cad9e-53b5-2eae-0cd4-06f899229470@amd.com>
Date: Tue, 30 Aug 2022 10:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f24ee58-2e6b-45f7-bf7a-08da8a64637a
X-MS-TrafficTypeDiagnostic: DM4PR12MB5279:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mbzRoAC08DKbTz57/kB42rhxyOpQxp6MWx4juI6WHd1vj6GFg9xyABF1fuHHIMMIZm9M/KiEjamCWTYxd8NBu7jxy6l7Mfj8BaFUVTl+VitGAtFbCRrL2WU7W+Yvv+YCDP8YFDD36v3Tk9axbGL9Hyni3pWQYHeqBACr2iS9DQuPBZdzTtUqAWso7jsQnYhOFYuPL7Lfo+9dga3bgcJVYB/oDi+NcMbCA0JqjjFPlZSYIXDFvdzqHB6rXmhXfdhVQBqiBEXiozdwrYmwqb2VxHtO8emA4pmwTmbPIBkur1RDfsa+WJmu3dynKyAtxdZ5Zbk1vpwkHiHRXcljS/eRpBMYRa3XfUuZx6EJDqMI7vq4LOH6dqa7gZl2UE3K0YT4R4OPEPy8gpBqErztUpukLayEJSUAIP8fccsMIhLs5UFnMNCA8gvguYPFVXyz//6cAIl92smrgHhkBEC/oys7RMCCX/QqMN0hdeMHdLgmW8t3rVRXmWzdlyi2lyJisnNnKysvW6ncOB0keEPgiD1wjvsidwyuFA8uq2R9g3cnrhLZU/uqnqNxAoBY5aHVzPDdvm9fqOB//Ig82TYMGGmwRBpUgRJhooxApePbW1MA9Yf5SYhTzNaz8r2mugiuWP7Z2F7bznYEaAQ6Jw2/iNobupixFQFXDWwF4lsjQKaywtEdbvr40B21gLOzqO5UKr99bxT2dzxzr57ZBOIfL5OnN8tLaDA6JF01x65SOuubew5Xdfm/MdDClWggdVwnpKnqPrJQEnqTHjC0rIu3zx6lgD/JiNxUtsZkJNeCNM5jHelEKt8ErmjvCu2j5hVlu8Dvfm5Dt8SS0eD8xNX2KieK3A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(40470700004)(46966006)(36840700001)(40480700001)(53546011)(86362001)(82740400003)(82310400005)(31696002)(478600001)(6666004)(41300700001)(186003)(336012)(40460700003)(81166007)(356005)(83380400001)(47076005)(36860700001)(44832011)(426003)(110136005)(54906003)(4326008)(8936002)(5660300002)(8676002)(70206006)(36756003)(16576012)(31686004)(2906002)(316002)(26005)(2616005)(70586007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 08:48:19.5604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f24ee58-2e6b-45f7-bf7a-08da8a64637a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B075.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5279

Hi Henry,

On 30/08/2022 10:00, Henry Wang wrote:
> 
> Hi Michal,
> 
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>
>>>> Did you consider putting reserved_heap into bootinfo structure?
>>>
>>> Actually I did, but I saw current bootinfo only contains some structs so
>>> I was not sure if this is the preferred way, but since you are raising this
>>> question, I will follow this method in v2.
>> This is what I think would be better but maintainers will have a decisive vote.
> 
> Then let's wait for more input from maintainers.
> 
>>
>>>>>
>>>>> -    if ( ! e )
>>>>> -        panic("Not not enough space for xenheap\n");
>>>>> +    if ( ! e ||
>>>>> +         ( reserved_heap && reserved_heap_pages < 32<<(20-
>> PAGE_SHIFT) ) )
>>>> I'm not sure about this. You are checking if the size of the reserved heap is
>>>> less than 32MB
>>>> and this has nothing to do with the following panic message.
>>>
>>> Hmmm, I am not sure if I understand your question correctly, so here there
>>> are actually 2 issues:
>>> (1) The double not in the panic message.
>>> (2) The size of xenheap.
>>>
>>> If you check the comment of the xenheap constraints above, one rule of
>> the
>>> xenheap size is it "must be at least 32M". If I am not mistaken, we need to
>>> follow the same rule with the reserved heap setup, so here we need to
>> check
>>> the size and if <32M then panic.
>> This is totally fine. What I mean is that the check you introduced does not
>> correspond
>> to the panic message below. In case of reserved heap, its size is selected by
>> the user.
>> "Not enough space for xenheap" means that there is not enough space to be
>> reserved for heap,
>> meaning its size is too large. But your check is about size being too small.
> 
> Actually my understanding of "Not enough space for xenheap" is xenheap
> is too large so we need to reserve more space, which is slightly different than
> your opinion. But I am not the native speaker so it is highly likely that I am
> making mistakes...My understanding is exactly the same as yours :), meaning heap is too large.
But your check is against heap being to small (less than 32M).
So basically if the following check fails:
"( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )"
it means that the heap region defined by a user is too small (not too large),
because according to requirements it should be at least 32M.

> 
> How about changing the panic message to "Not enough memory for xenheap"?
> This would remove the ambiguity here IMHO.
> 
>>
>>>>> +     * If reserved heap regions are properly defined, (only) add these
>>>> regions
>>>> How can you say at this stage whether the reserved heap regions are
>> defined
>>>> properly?
>>>
>>> Because if the reserved heap regions are not properly defined, in the
>> device
>>> tree parsing phase the global variable "reserved_heap" can never be true.
>>>
>>> Did I understand your question correctly? Or maybe we need to change the
>>> wording here in the comment?
>>
>> FWICS, reserved_heap will be set to true even if a user describes an empty
>> region
>> for reserved heap. This cannot be consider a properly defined region for a
>> heap.
> 
> Oh good point, thank you for pointing this out. I will change the comments
> here to "If there are non-empty reserved heap regions". I am not sure if adding
> an empty region check before setting the "reserved_heap" would be a good
> idea, because adding such check would add another for loop to find a non-empty
> reserved heap bank. What do you think?
> 
> Kind regards,
> Henry
> 
>>
>> ~Michal

