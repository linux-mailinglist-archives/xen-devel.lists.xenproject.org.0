Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BF5A5CC5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 09:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394835.634399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSvXF-0004VN-RF; Tue, 30 Aug 2022 07:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394835.634399; Tue, 30 Aug 2022 07:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSvXF-0004SE-Nz; Tue, 30 Aug 2022 07:19:45 +0000
Received: by outflank-mailman (input) for mailman id 394835;
 Tue, 30 Aug 2022 07:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSYc=ZC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oSvXD-0004S8-Pt
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 07:19:43 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dd53444-2834-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 09:19:42 +0200 (CEST)
Received: from DM6PR02CA0139.namprd02.prod.outlook.com (2603:10b6:5:332::6) by
 MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 07:19:38 +0000
Received: from DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::92) by DM6PR02CA0139.outlook.office365.com
 (2603:10b6:5:332::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 07:19:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT078.mail.protection.outlook.com (10.13.173.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 07:19:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 02:19:37 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 30 Aug 2022 02:19:36 -0500
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
X-Inumbo-ID: 1dd53444-2834-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RX6TB4n6IQuHCjgmgoq1EoDiW8QjYZIaaTDuhc4gGsPlTTEqed8SLOYlTTPU7MtKxNTOGJq6N/PdROnemW7F/zb3EYdZzk8t93Oyh99ZcfkbylvevRDGSmCe38/Gl/1RKTnXagR8LziKUOQ2WwIexg+kJmRa3AalJNuSrwcWRP22dh5Y5FEJzJRnHNm3ogjeTBrycj2EuzOHIgEJyE+9LHfOFi5u7F7bWCdqXLuC0E1JIzBivxFDtDkCwvFAfTiQZlTFNKm4OANZlgzqEQaOquzI5KrZY4VB9jgFo8AIM3vbW0WCb6qcFxduPx+ujTba+q3Jk7B6mWSvcCoE3PKH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s79t06qftNBONqpmUuRjtwq3E7kANLOmTWqdqpg+Ko=;
 b=mJW2v2mdribHouIU23+JEel6By5pvk4SOj9miKgJziZQR/+/zOt4xFovsi3YIX+XGtBFl47G4eo4EsxrbLxU/Y3LdW3u5EXM9Mq5leqp2TsvYBhI2lhNR70aVITu6Jt8XQtz6SmlrZyXta+Bkt8CMvEi8zzH0z8JUNGEi+mtb3sBbqQzLcPyyUzNDE224Pn3ParQDwKvyCVPSBWTlPiIGg6eRAue6Lsm9pkv+pdxBA5taEGckC9Px2NPeKwGkyRb7qxAK1JNRvuNtgpYSguT18relUo+kYo8TmJ/CQDBYw8I/EYEi/X/b9axttjVc2/MeLkoKfRwzNv9TDEG0lVO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+s79t06qftNBONqpmUuRjtwq3E7kANLOmTWqdqpg+Ko=;
 b=1c8ThOBTnZx/sA2nEsZpVqqO5ssYJ5mzyYucJjpuXPxX68U3pzQ61FCUQHifdhaoYkIAQk0I4HCjqhCG92yaxwSoeWoRoj+mvZpcCqmWKcWU0Lpmepvjjd13H0IGyhlbsU66as1ueaKZ2LFqK3LoPjx9i4zo5EcRFgUZnyH+RiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
Date: Tue, 30 Aug 2022 09:19:35 +0200
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7036ffdf-3bd7-40b3-3208-08da8a57ff9d
X-MS-TrafficTypeDiagnostic: MN0PR12MB6079:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2EfArdcIbccRGSxVp8G913+fsbeYCXF95TAL5bfhzLB+6BODY9bhnEiuMtB8s1E7eMq5G8aFTELHPwiUJMeuGWV+UoHQ0ZssWK7KvjZJdD1eh08AU1yvbYhBvYTFYm94mEax1PqtmxEmTJ3kZLByuFWDE0zBb9LwQYEd0NYOuhQv01mfclXGuAa6+XljuiRKPBtIBQCJGbZhvNqV8U4OjmMH/lsGUZNoMPXJpCEJSZYXmVK/eBHhV8iij3/tSUS1Agk4G7OmMAcJzFY2DVcTjYpAygPSOZqmwh/SvE2I2XNAO8BpTd5s9SfOVdFVIwSQ2y7G1rFvvuuwB29qsp/szhif9e7SUkF8Ea8nMn/2V6ks9z6kTxKhGSRJOrxxHV7nmNZH2pYXoWvv35BGdLswpHqGIMxWRJc5lCiO/WH0tB5fF86ejDQ1RQqyE9Zc8IcL7p+hHP8sfLc+FRaKatMGN+y4K6mLTQkghn8OawoChwV04aSdq63fuf+WmfGG6yW64yPyWPgxZcjoUVwp5yYHiHp+Cdp2xSZsXjn4UeujXCX14MFMkkh5A21yhs7lagSEoWaZAUKICQGhAnbGk5Uyl0deEBd1LpYTb+uqu1ckS2cNqJA583CHuIapPRrtBwOmyFl7jWNdVZUZHeZZHRWZun7gQhgz2ZUlSmYBBS6Ml03rSZz1poPBnoijrYPhT83eg6vJphvvi2gmTdfi5QrHG19OG+zYx637ttAQPmAe7odU6wkM1xCWli3mmnbcBbOkK4IOdlL9twERWrSsKzthlXlyrC9iw2xHWfUDz4CHqgw5GInjiEz5+kvizMlHhctmFtvu9zZ6Pf8mAbDBU6OYVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(40470700004)(46966006)(36840700001)(478600001)(16576012)(70206006)(70586007)(110136005)(54906003)(2906002)(31696002)(81166007)(31686004)(316002)(82740400003)(356005)(86362001)(2616005)(36756003)(83380400001)(186003)(53546011)(40460700003)(426003)(41300700001)(336012)(47076005)(26005)(8676002)(4326008)(5660300002)(82310400005)(40480700001)(36860700001)(8936002)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 07:19:38.0532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7036ffdf-3bd7-40b3-3208-08da8a57ff9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079

Hi Henry,

On 30/08/2022 08:11, Henry Wang wrote:
> 
> Hi Michal,
> 
> Sorry about the late reply - I had a couple of days off. Thank you very
> much for the review! I will add my reply and answer some of your
> questions below.
> 
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>> Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and
>> heap allocator
>>
>>> This commit firstly adds a global variable `reserved_heap`.
>>> This newly introduced global variable is set at the device tree
>>> parsing time if the reserved heap ranges are defined in the device
>>> tree chosen node.
>>>
>> Did you consider putting reserved_heap into bootinfo structure?
> 
> Actually I did, but I saw current bootinfo only contains some structs so
> I was not sure if this is the preferred way, but since you are raising this
> question, I will follow this method in v2.
This is what I think would be better but maintainers will have a decisive vote.

> 
>> It would help to avoid introducing new global variables that are only used
>> in places making use of the bootinfo anyway.
> 
> Ack.
> 
>>
>>> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
>>> +        {
>>> +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
>>> +            {
>>> +                bank_start = bootinfo.reserved_mem.bank[i].start;
>>> +                bank_size = bootinfo.reserved_mem.bank[i].size;
>>> +                bank_end = bank_start + bank_size;
>>> +
>>> +                reserved_heap_size += bank_size;
>>> +                reserved_heap_start = min(reserved_heap_start, bank_start);
>> You do not need reserved_heap_start as you do not use it at any place later
>> on.
>> In your current implementation you just need reserved_heap_size and
>> reserved_heap_end.
> 
> Good point, thank you and I will remove in v2.
> 
>>
>>>      /*
>>>       * If the user has not requested otherwise via the command line
>>>       * then locate the xenheap using these constraints:
>>> @@ -743,7 +766,8 @@ static void __init setup_mm(void)
>>>       * We try to allocate the largest xenheap possible within these
>>>       * constraints.
>>>       */
>>> -    heap_pages = ram_pages;
>>> +    heap_pages = !reserved_heap ? ram_pages : reserved_heap_pages;
>> I must say that the reverted logic is harder to read. This is a matter of taste
>> but
>> please consider the following:
>> heap_pages = reserved_heap ? reserved_heap_pages : ram_pages;
>> The same applies to ...
> 
> Sure, I will use the way you suggested.
> 
>>
>>> +
>>>      if ( opt_xenheap_megabytes )
>>>          xenheap_pages = opt_xenheap_megabytes << (20-PAGE_SHIFT);
>>>      else
>>> @@ -755,17 +779,21 @@ static void __init setup_mm(void)
>>>
>>>      do
>>>      {
>>> -        e = consider_modules(ram_start, ram_end,
>>> +        e = !reserved_heap ?
>> ... here.
> 
> And here :))
> 
>>
>>> +            consider_modules(ram_start, ram_end,
>>>                               pfn_to_paddr(xenheap_pages),
>>> -                             32<<20, 0);
>>> +                             32<<20, 0) :
>>> +            reserved_heap_end;
>>> +
>>>          if ( e )
>>>              break;
>>>
>>>          xenheap_pages >>= 1;
>>>      } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-
>> PAGE_SHIFT) );
>>>
>>> -    if ( ! e )
>>> -        panic("Not not enough space for xenheap\n");
>>> +    if ( ! e ||
>>> +         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
>> I'm not sure about this. You are checking if the size of the reserved heap is
>> less than 32MB
>> and this has nothing to do with the following panic message.
> 
> Hmmm, I am not sure if I understand your question correctly, so here there
> are actually 2 issues:
> (1) The double not in the panic message.
> (2) The size of xenheap.
> 
> If you check the comment of the xenheap constraints above, one rule of the
> xenheap size is it "must be at least 32M". If I am not mistaken, we need to
> follow the same rule with the reserved heap setup, so here we need to check
> the size and if <32M then panic.
This is totally fine. What I mean is that the check you introduced does not correspond
to the panic message below. In case of reserved heap, its size is selected by the user.
"Not enough space for xenheap" means that there is not enough space to be reserved for heap,
meaning its size is too large. But your check is about size being too small.

> 
>>
>>> +        panic("Not enough space for xenheap\n");
>>>
>>>      domheap_pages = heap_pages - xenheap_pages;
>>>
>>> @@ -810,9 +838,9 @@ static void __init setup_mm(void)
>>>  static void __init setup_mm(void)
>>>  {
>>>      const struct meminfo *banks = &bootinfo.mem;
>>> -    paddr_t ram_start = ~0;
>>> -    paddr_t ram_end = 0;
>>> -    paddr_t ram_size = 0;
>>> +    paddr_t ram_start = ~0, bank_start = ~0;
>>> +    paddr_t ram_end = 0, bank_end = 0;
>>> +    paddr_t ram_size = 0, bank_size = 0;
>>>      unsigned int i;
>>>
>>>      init_pdx();
>>> @@ -821,17 +849,36 @@ static void __init setup_mm(void)
>>>       * We need some memory to allocate the page-tables used for the
>> xenheap
>>>       * mappings. But some regions may contain memory already allocated
>>>       * for other uses (e.g. modules, reserved-memory...).
>>> -     *
>>> +     * If reserved heap regions are properly defined, (only) add these
>> regions
>> How can you say at this stage whether the reserved heap regions are defined
>> properly?
> 
> Because if the reserved heap regions are not properly defined, in the device
> tree parsing phase the global variable "reserved_heap" can never be true.
> 
> Did I understand your question correctly? Or maybe we need to change the
> wording here in the comment?

FWICS, reserved_heap will be set to true even if a user describes an empty region
for reserved heap. This cannot be consider a properly defined region for a heap.

~Michal

