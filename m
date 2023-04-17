Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4BD6E45F5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 13:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521987.811057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMd7-0005S1-Nt; Mon, 17 Apr 2023 11:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521987.811057; Mon, 17 Apr 2023 11:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMd7-0005Pw-L1; Mon, 17 Apr 2023 11:02:41 +0000
Received: by outflank-mailman (input) for mailman id 521987;
 Mon, 17 Apr 2023 11:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poMd5-0005Pq-Ts
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 11:02:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d1f90b0-dd0f-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 13:02:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 11:02:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 11:02:09 +0000
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
X-Inumbo-ID: 5d1f90b0-dd0f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0+tTxMhwZ8fUg/ZpXKJBKhwsrNhY07oanbzPnWBVv82mK11+k8no8qJ8m6DX7lcvlswiKvGICnxqKgNGWEvKf71+sS079bm76OZbwcwhQTtVoI37U5DnwCgzHolfmY9+CqQ7W4xciECD33pacQ74B3qYZZKMHRUnBaokvXPPZh32Kyl4QBEqMQySzdxBAPCP+UG8C2hdYK26ThOzufPPzo/EHqXa2QNEiKANtM0BmaGIopz2KAg2R3BZXDERvOIr32dBeKT5XMyzfZM0+GA31VZkN7VSVyuOxHkxIDrBfsFIjAlWas0/18cBFFdYgGjGkB38l5KNo9GwhrLRYRNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vO59h4mbsX2JtvtV8+BTsUc+CYbHjxMOfqt9GLOhVI=;
 b=Rq+1T7ixx+5o4wUOmmzj0NZYZIiTXlPb6IxxGNe9LoJo+kYbBezp6zY3SIIJ/DGHgevXBCNl7yPKYDcQbsD0kwHqMjBKkZAJzv5su53In47JYvC3m6FwLqT28NQBn6qKzy4O/KIYZjawjF51VGmgMDO/ROVQ9y3prszcznPtypPogx2TCaBRVgMxc4TNGpWLfsRb3hbqRHWapeOocOqB6a8N7foyu8GI81VjsZTA8Vb2wVK8jzDXLeQjpiTjNBHyrwYUrFRtjS1NKLxIqtyLOsf9KPKn1ustu2s/ax6qLfpU9uCip6TODDDgbXzW5YotufOyn32QbwzzvYAxM7BtLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vO59h4mbsX2JtvtV8+BTsUc+CYbHjxMOfqt9GLOhVI=;
 b=wt3h9uOo99gkIpK7ez5Pm1s1sBPMOj8yK9bRcHKLnUPma7+7N1USr+hzjxBxOMAdXLIUyQe69jG0T/+MBT1YUsLIJJZBCKFfraKetPKGs1YcrUQpXiCg1tLBdqh4wwYy14LUXyHgLXNfRfjVIgrVqEnwLZ5pf46MBtmsPfFlGxjDqQJaMmi73uEW6temETS/C46udY7p7eOXmjtu3BWlJoq8W6cDpsQ6IAGZvviA2doR30TGUsITmert9GRvQ1OuDV3Y1jpzfVHTV/BOs6cyQ/UNOZrJCTTilnMDOedTuRA53VYZUOr8wVeKbBG/TqbMjso7EXjGb6NP1hXFFV4Xog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bf70c3f-d360-30b7-3ea1-e076fdf94709@suse.com>
Date: Mon, 17 Apr 2023 13:02:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD0krtCOrEwiKMFP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: d74966bc-2d72-48fa-ff2b-08db3f333031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qopsNDbRwkAA3S1NGDfX4n/+q6szXXxPcWwvKhPkPbwgdoUiqNqE8Kue6uDHJonOOZjumY6dGMHxgZJczd1jBTrDNAyq9oXgm+tJKnm7o/MIvtPcU3FFJjlh8cMJ7CrGE3ikcxUu1rIZFy1V0dVbFyxsGGxFa66pVk5ACG0315zAzcerzOBcpGfPQEgtVccNSbCOwHlkOX9jDbL8D+h4Agv2BHZe9dw5hi9JQUmU9fEpV57NXVcuIfhIm2FuovmsTzfJWjOeBw2vHqgxsj4maxQ71L7k/6/obYjhNRWySi0j2mUO8G8zetpteuEYfBn6wHmCsQ17A4wNXkzYN2KLJNVs+QjQtm7eR3tdrYXzQZ9Cb8jXTpvJ7JPAIxGJ5++ftIuGRUDcftUr7lhtN6ikV9yRW51sjj+I//UXrHnsi5UZgRusbqdeMIhjdc69HBxppYmi5Go+49cAWSeorklJRG9pTU1RmbW9Mtu49hwHnOI52iHjbBWot+FCPbrW+8lBpE9ZFgvWrKXCJCm6a89vkwVShDgqI7ussldTCJLMublGxM1xOH6fQhDGCA3gsRJk6aNRdIsF2BYlXOX6ic2Go+T+mnM78khE92j+1KhQ0w5aJJ/BC22eds7dkZIYpGAKv9A+JDkPbjmcCclrj3BMzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199021)(8676002)(478600001)(6666004)(38100700002)(8936002)(316002)(41300700001)(66476007)(6916009)(4326008)(66946007)(66556008)(54906003)(186003)(2906002)(53546011)(36756003)(6506007)(26005)(31696002)(86362001)(6512007)(83380400001)(2616005)(31686004)(5660300002)(6486002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTQwcUhwazM3aGl2NVA3eEFzY3VVamVxQ0k0ckVLdDdJbDM0OS92MEtNUEw3?=
 =?utf-8?B?azZsT0piQTV1ZUZVV0xtamEzVmZqcUt4ODlaZ0ZGQkoxQ1RUalAyNW8rU1lD?=
 =?utf-8?B?MzN0cUdEUXA1NldZK0JqeDYvUVM5RVZzTTM0QXlmSll2VXVoaE9HUy9UdytB?=
 =?utf-8?B?ckw5bzUzVXNsUkRzYVJobFUwZHgxeEh0YUcyN2RyZWdseGNrMzJMUTVJQmxZ?=
 =?utf-8?B?MjQ0akdhK0lpZnAvVkVFWEdiVVgyV1MyLzdIdjZhN3kyOHVEbW1jRXRUWklu?=
 =?utf-8?B?bGZ4UndmL0hWRS9tUCtMbVU0clMxVWh2Y201L09NdWJMVkQ5MFNxZEM4eXg3?=
 =?utf-8?B?K2haMkdpZEhQcXNNRHFWWFlIRS9nMk12cWR1RGlOd1JqNEZzci90clNOVk80?=
 =?utf-8?B?em02blQ4RlhjaDlpS2ZQeU9xVWdkUll4TVNmQ1Zqcmp4YlJVWG5hSkUvS20w?=
 =?utf-8?B?TXQrNG0zVmw0WUIyekNHN3hqRnVESEFNWjVaRzc5b0g0RUMxdWdUWVZvQ0NH?=
 =?utf-8?B?cW9JdUtBWTMwUTVJNFI0ejBrSzh5MHgzWDA4RUFxaXV3TnNyaDVvTnFzdnlT?=
 =?utf-8?B?enQ1dWtEZTYvT2ZkeklWcnllWWJmSGxMUy84WTY0UXIxZHZMVitrTUp6V1h2?=
 =?utf-8?B?ZHM3NTF4VDlsZjdPeGovNDBGNWFrY0xpUFIwdjlFVGtaV0xkQkFac1czSjMz?=
 =?utf-8?B?K1A0bWZSODJocHBoNGc4eDVFbG45bEpKOGlTdmJOeFFXTEFTSm81NGc4TWY3?=
 =?utf-8?B?R3cyb2pNZk1vcWhjR0lTYU5VaDZQeEs3UUJCaloyaVFLdFJpcGU2cG0ya3FQ?=
 =?utf-8?B?K1FNc3F3bUd6RVNHMk44ejZWSWV3SWhCcytlK0ZXZldFaDRPNnZFMjBDaHZ6?=
 =?utf-8?B?YUlzdmVqWk02MW42aXlMRGpiZzEyRVRQZ3Z0bXJiVHVYTkc2dENXUi9mTjcx?=
 =?utf-8?B?dEFQRGNOWXREN2h2ZkNib1RZeHA1c0ZTYWhIV3FJdVBWL2ZhRklFRUVoazYw?=
 =?utf-8?B?YStXeWtQMzRhNTBkMlRNdm9mM0tpWTFwVWJER2xZQ0VBQngxT0liQTF1aG5r?=
 =?utf-8?B?T20vQ3A1ZTBCcFFnYmIyZWk2MGVDVXoyQnVPUG1EeTE4VU02QkJSdlJ3L2FR?=
 =?utf-8?B?UjkrdVRaSzU2dC92T1dZOFF4bUFiU0xyZVdGKzR3eDhCZy9Wem0wdkhwbmJl?=
 =?utf-8?B?Y2RTVUIxS2NpWDg5eXlwOU90bkdCejg5bzJXSWFjbWNsYkNJdzE4cjdqNDNF?=
 =?utf-8?B?Ui95Y3RGQzlYZkVxbjROOUlsL2ljMEJOZkZkUUgxS3J3SGJiaHloSDBodGhY?=
 =?utf-8?B?OGR3RmJZSEZYZEU4V0ZWZEMxNXhJSjFqSEQ5eXdmeUFnVjdhUWU5TVlVZXl2?=
 =?utf-8?B?TklXNkY5eitOSk1kN0kyMWwwSGxKQmdSS2I1Z2ZlTFBVbU1rWEVvc000MlMx?=
 =?utf-8?B?WGs0K3BqckNwVUh0SzBIZ25WNkRiZFNVYm9uWHpKYjlBSzFUUHlwS2lySWZ6?=
 =?utf-8?B?QmFQNFc0NkZjMkFEK2pOLzF2bzhvaHlmUWpMaUI4NG4yN1BiaDRCWUZacjFY?=
 =?utf-8?B?dmR6aTd4WG0ydGpLS3dNdHh1WWtTejVUZGo1ckxGbE9UU0J3ZjZQUGJGY3pQ?=
 =?utf-8?B?RE1DeHBPMzUrdTZadjl4ZWZ4bG5Pd1pxOXR3bVJuejdTQTFWeEE3cXAxb2E3?=
 =?utf-8?B?NDd6UFJBMFZtVkEwbDNHSjVsSEZKSnNodzEvNmE5NFc1Y3ZLTHh4OStIa2VW?=
 =?utf-8?B?dHVWS0xEdCtHQThnejhyTDA4OUxvNG1KcExSSzFqZTdOWXBLZHVWWklOTEti?=
 =?utf-8?B?anhHOHJGeW12dThNOHU2c0pEM3hSUE9WckxCelZzeFV5Mlh5TWRXOTRGM015?=
 =?utf-8?B?QThsajA0NFBwZkZ1cUE0SWhPNWg4QzhXMG5Gci9TZmgxbjhwc1FuTkVISkh6?=
 =?utf-8?B?UVA3T2htS3VIT2VqenhJa0kvUGMyNEtYekRNdkxNTEU2SllHQXV5OTlmMTl0?=
 =?utf-8?B?aGpFWTZ6eVdwUW1sZWhKaDBCeXJuMW1IVHlodm93MFBGYVg5V1o4NHB5d215?=
 =?utf-8?B?WnZ4Rk1CdENIRTdkcDNSclBldWJScWYxYjBLVWEzZFJvTklkN2t4Nk1aQk5Q?=
 =?utf-8?Q?Q8WElPZd6Ui3mEiERpLMEJ6wE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74966bc-2d72-48fa-ff2b-08db3f333031
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 11:02:08.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TOzdSWrerzb1XioZjM0UKErIZMRhDdhKUst/bd1VkHwQKyY0aKqRz71YdgMuxaVnYS/HhcbH7XEOJnK5rwPJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

On 17.04.2023 12:51, Roger Pau Monné wrote:
> On Mon, Apr 17, 2023 at 12:34:31PM +0200, Jan Beulich wrote:
>> On 17.04.2023 12:17, Roger Pau Monné wrote:
>>> On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
>>>> Above I have proposed another view on this. I hope, it will work for
>>>> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
>>>> after returning from pci_remove_device(). By "harmless" I mean that
>>>> owners of those refcounts will not try to access the physical PCI
>>>> device if pci_remove_device() is already finished.
>>>
>>> I'm not strictly a maintainer of this piece code, albeit I have an
>>> opinion.  I will like to also hear Jans opinion, since he is the
>>> maintainer.
>>
>> I'm afraid I can't really appreciate the term "harmless refcounts". Whoever
>> holds a ref is entitled to access the device. As stated before, I see only
>> two ways of getting things consistent: Either pci_remove_device() is
>> invoked upon dropping of the last ref,
> 
> With this approach, what would be the implementation of
> PHYSDEVOP_manage_pci_remove?  Would it just check whether the pdev
> exist and either return 0 or -EBUSY?

If the device doesn't (physically) exist, it would return e.g. -ENODEV.
If it still exists and the pdev also does, it would return e.g. -EBUSY,
yes.

Jan

>> or it checks that it is dropping the
>> last one. The former looks architecturally cleaner to me, but I can accept
>> that moving there might be more of a change, so wouldn't object to going
>> the latter route.
> 
> One of my concerns is what is expected of PHYSDEVOP_manage_pci_remove,
> I don't think it's expected for PHYSDEVOP_manage_pci_remove to return
> 0 while there are users inside the hypervisor still holding a
> reference to the pdev.
> 
> Thanks, Roger.


