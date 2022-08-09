Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DA58D557
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 10:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382832.617871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLKa2-0006rI-B6; Tue, 09 Aug 2022 08:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382832.617871; Tue, 09 Aug 2022 08:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLKa2-0006p1-8F; Tue, 09 Aug 2022 08:27:14 +0000
Received: by outflank-mailman (input) for mailman id 382832;
 Tue, 09 Aug 2022 08:27:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLKa0-0006ov-AX
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 08:27:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ffb1f4b-17bd-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 10:27:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3307.eurprd04.prod.outlook.com (2603:10a6:7:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Tue, 9 Aug
 2022 08:27:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 08:27:08 +0000
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
X-Inumbo-ID: 0ffb1f4b-17bd-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFLplgkyafVrRKoqc8jB1P4clplGfpfOo2lycGmv5hd5LlQ8SLd3Ik0FsKLpPj3v6cmms94zCAtzvMZUNy8j5Vqr8jSOG/m5SAiGy63kIBR+YnTLPVMNxQVn5djqp8UfeReU87rgALhgC+Ct43ubeeKr3olhKbApnaHzeA9MFn/MNNrn5NDxzcvtoDHFuA3zRVssZM3kgSH5XPkKOV4LWtCYWV3hs4OcHjkpqTnA1msyohyqq7KuK6qhMeTYkr719oxixv/zh5b43TOETH4UzkjAO8+RFsysg1+vTGNKDtur+pXb1mnjjNRnrHlmOoneMDvt1yp949xguRBBNijGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3V6exqC7DjK0CpM1a16AgTs+9nQUwwXI9cvn6J8I4U=;
 b=KfdHuhyjISGFjPogc2y4eCGyA5hNqMTeZh6xe/Hw43mQuDMYlGuapiW2Q2ODxjk5UsKJHNHw8hasmh6+tlUuhCY5cmfPWfs204JnORuFraIDB2kZ9X4koRFAlb9gEWic3A9uTvEH1r45xOKDDRWzddtZdavrSgDQgZ7pajcxhD3z6ireiKW7PZX1aLaoNH/y3EtsvOz4MgpoUfD50ok7FK0PZiSLaHJP1uXoPr4HGXVYStsMaUw4TAzxB3QuZXnsPUF80Y2x08vdwsIQJClZLyH+p1jqKg0GO7/j+I/0JV9sIQ735hnmxULls41gyD9Q7Nlq5nfR3OE0RIPQKClgBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3V6exqC7DjK0CpM1a16AgTs+9nQUwwXI9cvn6J8I4U=;
 b=GCJMaxe58nHxNIruIEAusmYrgduWCECEb6dNWboX4eRV7kYDbcDcaQes2RR9RE9xVUGHQNBiVHRTr5EoE6W5FX93s8AeJwvaRZh7jtu7Hy/q9rzMAzQJsVz+NLzv3ORbFU5HgQRifA4ehrQHz3rqHqedFpkkowbkPbFFWrnims1o9iHMhkWZvPj28l1HyN5n3Ip/Uox3utI53HF0o+r3tvTpyztE/0vsCKm81ZYzVxDBsQK6u8CkhVUiB4ToOz20C7zMDK0cueTXCEu2CtIjHbn8bdr+DG9lCq6ETKdIFOW7MuipNQDa9/baCNATw4kIvDgVT6omTUWqJ0JN0fAFhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <14ce6b41-c422-abac-4b59-541511d75cae@suse.com>
Date: Tue, 9 Aug 2022 10:27:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
 <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
 <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <99e65678-c394-01f1-9f49-827388f2fff6@suse.com>
 <DU2PR08MB7325A733C5B374ED899A2007F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325A733C5B374ED899A2007F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0155.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2537e118-452a-4f7c-cbcf-08da79e0f32f
X-MS-TrafficTypeDiagnostic: HE1PR04MB3307:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r+Rc5wYf5BoK2PiMIbHZWAlCOZnmxBUPKUEfCj0g4YYwU/+D6KaXKLTicpiQ/+1ypltsCRmbGt1HzW5n3AJzYYptefN/C3JhnlByjqyHh/wLXQLAERhSj1A9R5XkiPswwi/dqPMbgLjFe+hFdOdzUQWkgUK1lWPhNetN8/3bpyIQSqLxEUyzJWdkCMHT5JMQuSkLdC8U03cGJuVZzNO6SOvcOQrm+bK8eY7HKKFyPj3IVLuvY9WArSRzdNR/iCRf5Y2WQZKctBPSXvKfWTvMoUiFsQURMA3atpNRgNlXipDjicP2kwdoKst98feAsky3z3dDpsV7OVujpQopI95KVY2gonGbG8df00jacXn4n5xpp1N38kn92tyOEpXvwPwBag9SINcGsJazvzDthS33gcjOc2u6RJBilSXtvOMJo4o5gCkXo3X4x1AZ9DNWyih2xE6538rxSXW5sfaYVXKaMl1eNqxTMY+3ICfv7dBKy7dqNI/9n3D+ETFwxpYuQuxh0q5jrMNFv4OESX9hewNYiMbiIhfa+tuWHTbQtH/L0jtjq1/b8HIZWeSyRjoqT7C9SvwlI0KCqRPNryJc/s1gfssdMG5PGj5JjeE1fBe1tzLozZGHzQiD24TX2XX2E9jWIN001ynSCJFWgVT1yq370pkRdM6tK2vZ9q/R9dTUu+4n9Ln9AtxCOrWpxJBcfxX4ixT0B6xkjfQr4zMo1A3D/KjG4VBW8oKk0vIWGAJXnpEnqVV0lz0etdhrVE/nXKGabasgtIdUT45Ld3HXllZ2ZE+k8ujAh6yvpjDWIHjQz1PGzTnr/1DvRvhiVhVP44f0nUEYhuDqYZV9XMLGVmtAGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(376002)(366004)(66476007)(38100700002)(66556008)(66946007)(478600001)(31696002)(6486002)(6862004)(8936002)(5660300002)(8676002)(54906003)(86362001)(4326008)(316002)(31686004)(83380400001)(6512007)(26005)(36756003)(186003)(2616005)(41300700001)(53546011)(6506007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEh5WjlXZVpscXRDUWE3SjU0U2V2dTVqS2Y3VlpOY0VOM0t2dmxxWG5pWmtP?=
 =?utf-8?B?cmpMTmsrZWtqYURwS1NuQW5iZkpINHpGSzlnUGRPbEF2UmlTTDBUMENzaUVQ?=
 =?utf-8?B?aE9pZzhSajdib2x0TUQ0V2FXUmtBbGxtSi9oZlNzakVlWTJ0NjRJZGpRS1Mr?=
 =?utf-8?B?R3BjWVZZZ0JXS1o1LzNuMGtJTitmWjA1ZGR1T1pBSGRVSWltaUtpa08ybjFz?=
 =?utf-8?B?ZG1vQy9CSkNwMUFoM09sQ1UxdVhNanMyM2hTeVZmMG9KVE5PSGRDWjRnZ1Fm?=
 =?utf-8?B?M0xna0pEZHF6QVNCME1DNzBtMWQrNGYyczZTS0l2cHJQS3BjS29QbEVwYURR?=
 =?utf-8?B?cTk5Vm1JM2hzRmJKc2Zjc21ST2Q3ZFQzNzdsdnFaalliUXJ2TjRQSjhNZGJF?=
 =?utf-8?B?RU40aS8xMW5mU013OFZkR1lRTm95UmtKM3J2azN0cE9PSXlRSGl1QXNINkRi?=
 =?utf-8?B?RGRZV1FYN2dvLzQvcXlxOTJGaWYrZTRSRTNUaFBlcy9WWU54RkJ5a3B3b21j?=
 =?utf-8?B?ZWpxcUtodkZnVHdvNCt0bHIrSDJSZ1g4Ri9MbEw3YkJsWW16S2RsU2kvV1VB?=
 =?utf-8?B?bXcraWdTcFRGZThXWXliZmlKcXROSXJ1ckVidy9VYVBxMWRKSmpJc1h2VnJ0?=
 =?utf-8?B?VDZYYXkyb3NIOHlyb3VydGVmZHd3SWZFTVpnZFpNUjJNcnJmQzZMbXNySzFz?=
 =?utf-8?B?dHhaRlRWaTJnOUVGRXVHanNCdlhDSHp0eEV4QTZ1TWo2cHBzRUhCSGdTRWRJ?=
 =?utf-8?B?eTRPNTNQbjg0V1FjUnkwei9BbmpIdVZMVmEycDdkQmR1MmVBcSsvd1FHRXlV?=
 =?utf-8?B?MkMwb3FYV2dOU3lCdGUxSTJvaGtRbDdGa3lXOEF4VVRsbmNNS2FMNEwrZUc5?=
 =?utf-8?B?TEhlTVROQnB4T1FEVDRYZW5kck9OUTlabGRMYzQrdTVmdkNCTGlZaXFWcFpM?=
 =?utf-8?B?M1JNYUxDdE03WHp6VUo5M3dDSitGUkpRZjlwakRYOGFJM1pqTm05d1NnYVZQ?=
 =?utf-8?B?TWp3Q29QaVJvQjhVR09xb0Zmc3hGdHNTM0ZBK0hjZ1BHbG05MUExS21VRmJj?=
 =?utf-8?B?YnRjdkFSMHd6akZDdXFsWEdYUnd5NmRFVVN4dCtOajRKdnBiOXZrbEtjMnBs?=
 =?utf-8?B?RkVwcUNlVmZiWHpMRi9kRTFQb1F6VzFRb3hOYXhWWmxYR05UTlk4SUxZRVlO?=
 =?utf-8?B?Q2daakdHLzdRbnFaUFhQdkQrRGUrUi9oQmVqYmNrbFRiemk4UEFRZXVZRTZZ?=
 =?utf-8?B?YUtsdXhkSHMwai9JdVlvRU5GeU9BNkNyeWMvbWkrc0dhbHZWbGYvZ2lGN0hN?=
 =?utf-8?B?eW9SWHBJK0VpbmZZZy9zaGxyQmlmb3p4Q2c3cm41REI3N2lONVJTUXorVXZ4?=
 =?utf-8?B?NDRIWDlkQnZnV3hMajltYXJqc0RpUFg3N0wybXJkYjNpQzlXZ1ZVSGRzU3Rp?=
 =?utf-8?B?L0YxWTExelhPbkRSZlNuS3pHWDRvUEE0L2hLOEVUcGpOcGJqdXlrb0hrMkFY?=
 =?utf-8?B?ZVdPenFyQlNwNjhBbjhBTnlwWlZMcjNEcHN6QThyWTFBVkNaVkRIQkF4TnQx?=
 =?utf-8?B?NjlWVzRCT2xrNndzaXorRmJWNG5HUjJaZ0xzRmZBMGhQc3FJRmhRTlZ0bTFl?=
 =?utf-8?B?NHBvRVpRK09MVE1Rc0xLa0lUNnE1WU5kL01MaHgvanZMa3BMakd4cUF0M3Vq?=
 =?utf-8?B?S1ZaZ2ZUZFp5ODg1emxac1ZEUjQ1S1RNdkJtMkZMSlRFMzhxL1N2czBsVnZ3?=
 =?utf-8?B?UXBRRUMwMDJFR2w5SmtrRHdKaXlYNnpiZkoyT21qYXBRUUJlUHNiekYvanJz?=
 =?utf-8?B?RWlEbmZaYzB3RmxFRTQwRUZxN090UWp0QU5HZVQ0K3Y0UnhPL0twZzAxeVhZ?=
 =?utf-8?B?OGxNTkhoVmtaMU92QkRaYTFKZnlFY0NCOUtYbnJYejNHTXJ4V1ltQlN6SlJ3?=
 =?utf-8?B?ZjlTU3FtNGVERjkzSXJ0TGp2WUQ3bVlxTThXNVNaKzZXU0dkdFFqeTRhSXkr?=
 =?utf-8?B?cHlIR21tS25DSFZFWHZQdzlLd3FXUlJTWFlUaHFzR09CRGJGTERXbVo1UnFF?=
 =?utf-8?B?a2NLUlJvZmpaZ09JYkJ4VDJ6UDI1S2k1aTg1MUM1ekljZFd0NzNBUUI0R2Vm?=
 =?utf-8?Q?DLav8S41z/7DXOxpNFYfovDpx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2537e118-452a-4f7c-cbcf-08da79e0f32f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 08:27:08.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQKXvvvoYMCIqGqJbEp/oDt3Tfpztcx7x6LMb8FXhKGl9TBdDevAPcn0vOkdQms1AUiBjh9OLJhvnHqKx5OLCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3307

On 09.08.2022 10:07, Penny Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, August 9, 2022 3:59 PM
>>
>> On 09.08.2022 09:53, Penny Zheng wrote:
>>>> -----Original Message-----
>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>>>> Jan Beulich
>>>> Sent: Monday, July 25, 2022 11:44 PM
>>>>
>>>> On 20.07.2022 07:46, Penny Zheng wrote:
>>>>> When a static domain populates memory through populate_physmap at
>>>>> runtime, it shall retrieve reserved pages from resv_page_list to
>>>>> make sure that guest RAM is still restricted in statically
>>>>> configured memory
>>>> regions.
>>>>> This commit also introduces a new helper acquire_reserved_page to
>>>>> make
>>>> it work.
>>>>>
>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>> ---
>>>>> v9 changes:
>>>>> - Use ASSERT_ALLOC_CONTEXT() in acquire_reserved_page
>>>>> - Add free_staticmem_pages to undo prepare_staticmem_pages when
>>>>> assign_domstatic_pages fails
>>>>
>>>> May I suggest to re-consider naming of the various functions? Undoing
>>>> what "prepare" did by "free" is, well, counterintuitive.
>>>>
>>>
>>> How about change the name "prepare_staticmem_pages" to
>> "allocate_staticmem_pages"?
>>
>> Perhaps - if what the function does really resembles allocation in some way.
>> So far I wasn't really certain in that regard, and hence I was wondering
>> whether "prepare" doesn't better describe what it does, but then its inverse
>> also doesn't really "free" anything.
>>
> 
> Hmmmm, “prepare” with “destroy” in its inverse? Do you have any suggestion in mind?

To be honest I was hoping you would make an attempt at finding a suitable
pair of verbs. To me "destroy" is more the opposite of "create", and I'm
unable to think of a good opposite of "prepare" (short of resorting to
"unprepare"); if I really needed to come up with something then it would
likely be "cleanup", albeit I'd not be overly happy with that either.

Jan

