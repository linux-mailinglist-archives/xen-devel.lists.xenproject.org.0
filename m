Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5439C0F82
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 21:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832162.1247579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t98f3-0002yD-04; Thu, 07 Nov 2024 19:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832162.1247579; Thu, 07 Nov 2024 19:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t98f2-0002wE-Tf; Thu, 07 Nov 2024 19:59:20 +0000
Received: by outflank-mailman (input) for mailman id 832162;
 Thu, 07 Nov 2024 19:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2I65=SC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t98f0-0002w6-RG
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 19:59:19 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20622.outbound.protection.outlook.com
 [2a01:111:f403:2409::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c03320d9-9d42-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 20:59:10 +0100 (CET)
Received: from DS7PR03CA0350.namprd03.prod.outlook.com (2603:10b6:8:55::27) by
 DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Thu, 7 Nov 2024 19:59:06 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::7) by DS7PR03CA0350.outlook.office365.com
 (2603:10b6:8:55::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Thu, 7 Nov 2024 19:59:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 19:59:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 13:59:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 13:59:04 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 7 Nov 2024 13:59:03 -0600
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
X-Inumbo-ID: c03320d9-9d42-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwOTo6NjIyIiwiaGVsbyI6Ik5BTTA0LURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImMwMzMyMGQ5LTlkNDItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDA5NTUwLjI5NDE5LCJzZW5kZXIiOiJqYXNvbi5hbmRyeXVrQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un44ICz1tHtJjorgdgKMVi3hhcSxzCQg0sTm7C3RKmwagD98Zb1+8tpvICt//2CpZZuAAtiosbGA0uCNAreh5rSrzX7IX8E7b1wcQLSE6d/cT6HYAqm6Tmv/HSihgOTAttr1ZkxcUdzo8NE96W+/lt1HcrQxwaH8rn0qOOJI6PJ7p9fZuEq9xfFvUIPFPhKDNAnP221fOoXkJ3/FNzhj9JLJKB9xFQ4F36L0GZkBNp296FlYM2It4lLxr//xf+37XQiq5uNbECxDuCgqDi1F6Fjyq4EcHtAXn7HvlwVU19Rym/EzLvjlrplCGfSXlMGJiew1GbCDTLGzaGKpTiRduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErXqcHMPA9yICIr4IEoPKUPrzh0rH2SAjbFJPlGRQIQ=;
 b=pyLhzOrYzOwI8YG4ZWpQyIc20gHW62ovb0A6g91oGM5pB/ffF7gWGj/GaCx8iG9T/a4iMircdy29E9JV5zUQgn0875h9sI9t8fDpoylqZhqaLbARnolG/xOj+NFQjANapPm3G8/k0p2a9bvZN75sdYjcwDM+j54JyaWHkZjDaN0PZyv2bIyj/nTL9dDN6lwwVQNFIYFgX4CO2K5dtFxDRuMYrPPc5qmyftLkLisY73c3C40tk4AnUqpzbzezwbdjtpZbmGSKt8B8Ac3r8VHeKxCrQ69A/iMJoTKNBRGUy8L8cVMpuSFi08gC/rbKFrXAPc5D5h+KEMa6lyjORinG+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErXqcHMPA9yICIr4IEoPKUPrzh0rH2SAjbFJPlGRQIQ=;
 b=eruB3VTs25SfUjjSVeh6d7F2boSSbeKWx6+Ik0FhmaohQmQTaOqZkB/ifI7VlkOgEuYI/mLL4UHUAqo4ayb6VqPq5+y0gle301rHNlUmsK4tZWxqM2+FdJuDeYl6KSCP7yiLgU+OppIzSglVqk2msjChP/7RJfiqsxGsKpY+LVk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8642417d-ba48-4fc7-b893-a34044d319e0@amd.com>
Date: Thu, 7 Nov 2024 14:59:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 04/12] x86/boot: introduce module release
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-5-dpsmith@apertussolutions.com>
 <773dbe75-d1d3-41ea-8ff7-c031e0e9a920@amd.com>
 <599e55ba-b9d6-4fc9-bf59-ddd95b9a2482@apertussolutions.com>
Content-Language: en-US
In-Reply-To: <599e55ba-b9d6-4fc9-bf59-ddd95b9a2482@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: f647d835-1136-40c6-bf38-08dcff66a267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVhSbFJRejNTcjlweUJsbGNsTTQ4WkFwQWxrbm5YcXU1alR3bEVaa08zNkk5?=
 =?utf-8?B?MEVoNVNteFJmMGJNZVgrM1BIM1RVU3NpSWhmSHlsZ09GaWZJMFVmaFlHUktE?=
 =?utf-8?B?TjhWd0FNTkFTM0YvSEw2RHZPUi9YOTlYWWZmb2pPNVNCdG9hZUFTWkFoVkcv?=
 =?utf-8?B?dlRKTTBNYldoODRVcGpXQm11Y0c0RkkrYlQ0WFVVNFJtUXc5Ynp1aDZPLzIw?=
 =?utf-8?B?MVhHVzJ1VVV5bmJaNkNDMDVEVWpkazZySW9SNk8rQWZYTHA0UDZRS1Zzbk1l?=
 =?utf-8?B?bTVOcmJhbFpxYi8rQ0U3V2xMa2tLK3BtQlRPVWpiSHpaTDdMdGZoZWROaDNh?=
 =?utf-8?B?Q2dpeldHellEeDBmMU9LRU13aTNvZDYyU0RNUGhGRmtwa2xwVUxDTDlJdU9y?=
 =?utf-8?B?VHNjdWltcmZlK1RlbFN1eEQ5TE1lYVQ4YWtUK0JvZ2czWTNCTWhDQ2Y5Nmxx?=
 =?utf-8?B?Vlc3MDVYYVhzaGMvMnNLS0ZEdHJyOGthQ3lQVUJzTGxJV3doYXZLenorbDc4?=
 =?utf-8?B?WEpvaWNzVnQrUmxGV0lxbSsyc2tpRGNielBhZ3Jpc1laZlZ1amRQVmw3NzZu?=
 =?utf-8?B?VVNmVTBxcDlIcTBuUm5EWXNOWjBxQTVIVHUwWGJhYjdzR0hUUW8wdmxlVmUw?=
 =?utf-8?B?Rmo0ZGIxRjBuM1hnWW91Uk1pZ0pCcHpWWlQxSzVYS0NIUmZUcThITmFZM0xx?=
 =?utf-8?B?d3Exd0Z5NVpNaysyRHBkYWRYbHNEbERSU2NYRGlyTUl4THBITk1UZThRL2d0?=
 =?utf-8?B?YmNmUGpJdEtleENKMnVuaE9POWoxdm9pMGU2RUdUT1hZU21HVUxrYkcya0VR?=
 =?utf-8?B?UXl1V0JzVmw4Um5jTFRSbkF4Ulk1NnR0eHBHeFNvc0w5YVYxVytjUU9FUXI3?=
 =?utf-8?B?Q1o4RjI3b2I2NDd5dHIya0dlc3J1Ym9mS09qVzVzNmhBWitGT2xOYXBJcDk3?=
 =?utf-8?B?VzdWd0dPVS9WdUlyN1JiWWl4bGdlRnZlTXhYQWZhSmw2UEdRMnFvb3FmUzBT?=
 =?utf-8?B?TFpBb1pmdm4waks5Q1lNYkdrKzBKOWg4bk1lOUh3SThqVnc5S09aZkNTMDlM?=
 =?utf-8?B?VDFEaXFEQmhsWGVnRk9oaWZmVkRDWW5iSUFLR015cTcveXNaSjM0VjVIU0hM?=
 =?utf-8?B?NW5SNGROTThxeEU4RmN3K25TT1lGSlZKKzlxbHREdjA2WTRGSFpJd0hkMnha?=
 =?utf-8?B?OHBzK09MbkdPalpEbEwvaVJNRDQ5b1BKUGViNTRYYTQxUUlMTGtVbkxLNzFD?=
 =?utf-8?B?aFZhS1RPQVljQ1Bja1hmblVNV1JKNjRIRVVUSVlIbmhnUGlFd05aQmI5a3VO?=
 =?utf-8?B?Rm5HNWhLZk1oSWxicEJKaGFsb1p0TzFNUHlhQ25WNnUxOXpNYUtOYytxQ1RG?=
 =?utf-8?B?Q2pSVUFSVTFKUEFIcjBsL0tiSGdPYkNXUUc3N3V4WEx0TitSanNMUlk5MDB0?=
 =?utf-8?B?ZlNVR1NYL0RWSDk3cTRyZTFBUXRsWkxlaTNOWVVBNWVNLzJBSDhpa0NVSEFl?=
 =?utf-8?B?dk1FRk10YWlsWmVsVTdJYU9MbTM3K0didU12aHVtTnVKYXoyTjIzUkRjRUxF?=
 =?utf-8?B?MnMyL2IwdldicERPREdNUU1xeHp6TUVnaWg0dGpBMlk3N3lpc3REQURNRUZG?=
 =?utf-8?B?c05kYUluMzc2czFIU2gwblZmYUFCYldka2o3bXRiMzdjZ1Bjd2RqL2ZYcWMv?=
 =?utf-8?B?bjBDZFBiK3VQSHYwUmtxcThKSnFISTdlNFBPNHpDZGZQQ0ZrWnVLUHZrSEIz?=
 =?utf-8?B?d3dqcHBFM1BjL2JKMzlKOEpGTi9seEQ3R29jQ0t1eFYzVXEwQTJQTGZDQVFN?=
 =?utf-8?B?MEZlWFZqSkdpRHBHdTVidjRkUzV4Kyswdy9yanMybUUvVHdjci9XMExid0Nv?=
 =?utf-8?B?STd2alhDeGZPY211Mk5pM0ZXb0RzZ1RhdXpHeGM5UktQeVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 19:59:05.5129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f647d835-1136-40c6-bf38-08dcff66a267
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011

On 2024-11-06 19:46, Daniel P. Smith wrote:
> On 11/6/24 17:16, Jason Andryuk wrote:
>> On 2024-11-02 13:25, Daniel P. Smith wrote:
>>> A precarious approach was used to release the pages used to hold a 
>>> boot module.
>>> The precariousness stemmed from the fact that in the case of PV dom0, 
>>> the
>>> initrd module pages may be either mapped or explicitly copied into 
>>> the dom0
>>> address space. So to handle this situation, the PV dom0 construction 
>>> code will
>>> set the size of the module to zero, relying on 
>>> discard_initial_images() to skip
>>> any modules with a size of zero.
>>>
>>> A function is introduced to release a module when it is no longer 
>>> needed that
>>> accepts a boolean parameter, free_mem, to indicate if the 
>>> corresponding pages
>>> can be freed. To track that a module has been released, the boot 
>>> module flag
>>> `released` is introduced.
>>>
>>> The previous release model was a free all at once except those of 
>>> size zeros,
>>> which would handle any unused modules passed. The new model is one 
>>> of, free
>>> consumed module after usage is complete, thus unconsumed modules do 
>>> not have a
>>> consumer to free them.
>>
>> Slightly confusing.  Maybe just "The new model is to free modules 
>> after they are consumed.  Thus unconsumed modules are not freed."
> 
> okay.
> 
>>> To address this, the discard_uknown_boot_modules() is
>>
>> "unknown"
> 
> Ack
> 
>>> introduced and called after the last module identification occurs, 
>>> initrd, to
>>> free the pages of any boot modules that are identified as not being 
>>> released.
>>> After domain construction completes, all modules should be freed. A 
>>> walk of the
>>> boot modules is added after domain construction to validate and 
>>> notify if a
>>> module is found not to have been released.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---

>>> +    {
>>> +        struct boot_module *bm = &bi->mods[i];
>>> +
>>> +        if ( bm == NULL || bm->released )
>>>               continue;
>>> -        init_domheap_pages(start, start + PAGE_ALIGN(size));
>>> +        release_boot_module(bm, true);
>>> +        count++;
>>>       }
>>> -    bi->nr_modules = 0;
>>> +    if ( count )
>>> +        printk(XENLOG_DEBUG "Releasing pages for uknown boot module 
>>> %d\n",
>>
>> "unknown".  Since the operation already happened, maybe "Released 
>> pages for %d unknown boot modules"?  I'm not sure of the value of that 
>> message.  It would be more informative to provide the module index and 
>> maybe a page count.  The index would at least point to which module is 
>> unused.
> 
> Ack to unknown.
> 
> Can adjust the phrasing, the question is there a desire to have a 
> message for every boot module freed. Guess I could do a single log line 
> split across multiple printks, Thinking about the case where someone 
> tried to abuse the interface by loading a bunch of unused modules.

It's 63 modules, so not too many.  And this is the boot path, so it's 
administrator controlled and shouldn't really be subject to abuse.

I think printing the index of unused modules makes the message useful. 
If a module is provided to Xen, but Xen doesn't use it, it is worth 
flagging which one.  As an example, if I thought module 3 was ucode, but 
it isn't getting used, that is useful information for further investigation.

>>> +               count);
>>>   }
>>>   static void __init init_idle_domain(void)
>>> @@ -2111,6 +2139,8 @@ void asmlinkage __init noreturn __start_xen(void)
>>>                      initrdidx);
>>>       }
>>> +    discard_unknown_boot_modules();
>>> +
>>>       /*
>>>        * We're going to setup domain0 using the module(s) that we 
>>> stashed safely
>>>        * above our heap. The second module, if present, is an initrd 
>>> ramdisk.
>>> @@ -2122,6 +2152,11 @@ void asmlinkage __init noreturn __start_xen(void)
>>>       if ( !dom0 )
>>>           panic("Could not set up DOM0 guest OS\n");
>>> +    /* Check and warn if any modules did not get released */
>>> +    for ( i = 0; i < bi->nr_modules; i++ )
>>> +        if ( !bi->mods[i].released )
>>> +            printk(XENLOG_ERR "Boot module %d not released, memory 
>>> leaked", i);
>>> +
>>
>> Why not release the memory here instead of leaking it?
> 
> Because you don't know if it was mapped or consumed.

So this is more of a sanity check since it should not trigger?  i.e. 
it's a bug to see this message.

>> I feel like the corner case of mapping the dom0 initrd is leading to 
>> this manual approach or releasing modules individually.  That logic 
>> then has to be spread around.  discard_initial_images() kept the logic 
>> centralized.  Maybe just replace the mod_end == 0 special case with a 
>> "don't release me" flag that is checked in discard_initial_images()?
> 
> That is what started me at the options to deal with it. The two I came 
> up with was a flag and this approach. Weighing the pros/cons of the two, 
> the deciding factor is when multi-domain construction is introduced. 
> With multi-domain with a large number of domains, a balance has to be 
> struck between holding all the kernels and ramdisks in memory plus being 
> able to allocate the desired amount of memory for each domain.

So you're saying that by piece-wise free-ing memory, you can have more 
domUs loaded by the boot loader?  If free-ing is delayed to the end, 
memory is tied up that could otherwise be assigned to domUs?

Is this the real motivation?  If so, it belongs in the commit message. 
As it is, the commit message is lacking in a specify reason why this 
change is needed.

> Perhaps a 
> balance can be struck, with a discard_consumed_boot_modules() that walks 
> the boot module list, and discard the ones consumed. While only dom0 can 
> be constructed, it would be called once after create_dom0 call returns 
> (per Andy's suggestion in response to this comment). An expansion on 
> this could be that instead of using a free flag, use a ref count that is 
> incremented as it is claimed and the decremented when it has been consumed.

Are you expecting 1 kernel image gets used to create N domUs?  Or are 
you only handling 1:1?

Is mapping the initrd only expected for a single PV dom0, or do you 
envision mapping multiple initrds for multiple PV domUs?

It seems to me that more mapping might help alleviate keeping memory 
tied up.  Freeing XSM and ucode early helps, but those aren't 
particularly big.  An initrd in the 100s of MBs is significant though. 
If you hyperlaunch Xen and 2 domUs, you'd want to be able to assign ~all 
the memory.  Losing 2x ~100MB as unassigned for copies of the initrds is 
wasteful.

Regards,
Jason

