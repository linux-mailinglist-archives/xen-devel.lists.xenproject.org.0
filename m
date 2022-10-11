Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409AB5FB384
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 15:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420288.665048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFSS-0005OE-4L; Tue, 11 Oct 2022 13:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420288.665048; Tue, 11 Oct 2022 13:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFSS-0005M0-0M; Tue, 11 Oct 2022 13:38:08 +0000
Received: by outflank-mailman (input) for mailman id 420288;
 Tue, 11 Oct 2022 13:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiFSQ-0005Lo-Fx
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 13:38:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef049f53-4969-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 15:38:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 13:38:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 13:38:03 +0000
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
X-Inumbo-ID: ef049f53-4969-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAqyLWgnwc1MzGZbcaO/mrqyISNO5iiM4gZ1kU/DTopaRN4Vd3L5KY8dlJaGH9yQbpMTYLLGLuLKZpI/lD1rtizraDFE4V4UHNXv4FZCTj1ajTWvhG7ulqumM7Wr87+tHMuBX4Cqk6oPSXvSXlOO/8V1rZQZpdebvGTP1SSSNc++Hj2oxduT+opvNd4EIQhLih+XQXo2Zgsup0DCT6b+PRq/ZMX+wepyBcKvj8Ozi8nZcqx35nRypUA3t7j/ZSAd1fL9uES4O/wvePma17YKXNFXXONaWWcmEKB+tX/l3ETYssVMjYNPru9aSwuDCFGcF6tBA+TESB2mShtYEJawLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7FxmdC11CggFfz6/skPhgjgBNHXzbsJ4GzURyS4DY4=;
 b=aG3y1u2kF5n2m9ieCGogw17gLrw/zKcgaf6TJeDIWtGvz/sDftM3wxoxMSa3MvD/BsgX5X+LGPUFB5xLR/9Pg9Zng3QSigjRf0ZQKqJJQz3ykWSYA725tCISFK803ajDOohGjXNu5NRlJ1V58/qHMzqEvK8aiwprxU98qL+2pF/vTUMNsbAXJFmdGXFgdWlxl/oQyI+9ZTBXSycbRBwU++qaAyvc+ndb1majAs/6NvuwLToX5BMM8ZZ6NhcXajYkZOv+t89un+icXV53rDvt8I4KkOTtEbWTu1KLFni7CUsEDhxG8m2303n+fd7Wgnipe081BAn6h9JR4i6Xq3UA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7FxmdC11CggFfz6/skPhgjgBNHXzbsJ4GzURyS4DY4=;
 b=BaVHsRRz2d1mD8ylCJSYlLccKHSEcpLqbQST10hJUNiiocTIdqp3mdnI0Mtr6KQgdvtv1ntf5nrHS6yej3jde9rxLy63qqbfPgEBKhuCMio/+2BleGN/DRFPA0xCoZnQjXIFW3+Ff5oSnUhBm4cVNMNqQ5jxoJg9MOu3amgXq5wbXDCSRlE1VsUO0TYlDx6PekVTysIQwGpnEeMq8ZuQBpbdR7bbWtkI28F574QfBEi+mYhDrbOxIiPZfMN9QHUEVcIfq0RWS7eQnqMw7znz7YS7SkK0BtgahQsoCxNRxkeX6lGwxBkwVfKhSgbSm0Xc6qtRrfl9jLfYxHLzX7aEPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f417bc91-8453-92d5-e357-30e584130e67@suse.com>
Date: Tue, 11 Oct 2022 15:38:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Henry Wang <Henry.Wang@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
 <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
 <acedd354-9050-5340-ffd8-259aeb95b101@xen.org>
 <77349d2b-de72-3e68-362a-493f350eeec4@suse.com>
 <d297735d-771e-22f2-1b46-9c390ebb5afd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d297735d-771e-22f2-1b46-9c390ebb5afd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 607a6902-1613-450b-e381-08daab8dd237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XPfiLv7R8q2Io/IesH9UqejZ1jCwI+AOq1lFQeZB5tB0IU9oFzcR8RdKaOmiDW1V8FDUtBFd45W+VAMn9ahdVA+QCkjvF2poufb+UMvBNrqizE1yn/UksKnSkdkSwHqtlTSN8n7jJNuPIWim4vsGBQdJW64Ga4Wot+xyaPK6HhzakJDkQLnV6d872p+H8GNfC5zsscryhopB1c0bPqaVeANZVmLdhZePTrf0+8zMwual83z7CNYRKbImEZ0P6SNa0sxCpkspKZmEbD+aPMQ6EuaF7JsBtNvfXjY+Yt1qfcNAp/455fyDR5HJMIXvNA3cgTDOnizzzDOfjGyOzyj0exIrot8W3JMIDioPV0QE5CqeTPPHHeRuTPMcFr+Na/8DRSrBRPSDlowEX41m1GLgL5AnFHVdLbuuZ+jexxv9r4/Fb+3Aom0I1xaMB+NPFiZBV7MNApiFkyzMf5/miX6OcIRkRZvyXjcTEWDa5Xj5+DCMTDiZUm8ZvRiOuMdoo8LwIANEhlb2k5/YYMcUkSK6OPnfZw9JcMSuzcjaDCZgFUBPHnaAceNYNx7PDL59sOyUqXnmuA/Ru285Fu4VwgxnAUxFzDRNOX/cluuljyHlp/BF+AUnHQAB17APFvsHx9xNJUbMe3ZxqjcPcCt6Bt3NzqQVdl7+xvdUp7IA1FRcQZnhb8u0mnBZI1zM7niDAquJLgQVJiR4LuFxkecnr7z3AZftBXq9BwWqCck0HnYDtPTh8nm8fY5tppg6F5ck1kl7DjFPj8vvTIlUInTVWZQAEODholq84lJQ4BGdkYXUE1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199015)(31686004)(36756003)(6506007)(26005)(6512007)(2616005)(186003)(53546011)(6486002)(478600001)(2906002)(83380400001)(38100700002)(4326008)(41300700001)(31696002)(6916009)(54906003)(86362001)(66946007)(66476007)(66556008)(7416002)(8676002)(8936002)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnZsdkttMnBBNk8vTWg3R3FwZnFuZDRXLzI2VHhVbmhwT3ptSGI2S1NoRnhW?=
 =?utf-8?B?S05HbmM3Y2VsZlEyRkhuU0tmVDFoN0FRbUc5V1B6M3FiejhnZmFMREttb1lZ?=
 =?utf-8?B?bFRHMWErYWFhbE5TYVdkamV4SkkvbXk2cGg4NHV4UkdXclpPSWcwMVdPdW85?=
 =?utf-8?B?bHZGR0RTcERGcnVGdWpQeXMwRllTK285YWRLZXNWQUMzZTRoTThQeVhiQmV6?=
 =?utf-8?B?L2JIazkxMU41TDFNS01wVXVSclY1NDI4ZVA3eTJyS2YxOSs5bWpwTFp3UHp6?=
 =?utf-8?B?blZvbUN6ZElOa3pQTEplTWw2UTR2ZlNGYzdiSjJOMmdZTkF4ZDAwbmR0UTlX?=
 =?utf-8?B?eTZ5ellpLzZoMDdzbjBNNzdaRkdEZ3pKUGp3ek5aWmIvR0xWWEEyU3hvWWJu?=
 =?utf-8?B?aUsxTUoyWHU2ZjFBUVBHdW1uMzNWNmlqYUZrT1pTUlNnRnhzOXAwM1FraVox?=
 =?utf-8?B?bG1XWlBBZklyek9qWVlYRG16TUc1cE15ZUlxNTJqRXhRcGxUQ0YzZWJOV0ZV?=
 =?utf-8?B?eUJPbjBIbFRSZThqT0ZQTEZHRFc5YUVYVkVCemhiV3dGUnBOMENleUZObnQ0?=
 =?utf-8?B?L1FEbithaHpLSW9udlN1cUQzYXFwVExpRGdxRm42bFBzdGI4bW03cEt1dmZ5?=
 =?utf-8?B?WHQ3QUVYdnZSbzBJUGVBeWozVUJwNjZ5MmJYNTFrU20va2tyVXFaY2ZKZ2F4?=
 =?utf-8?B?WFhrQy9nc2dtdzdvWkNGNHphWG1nOGkvN0hieTJHQW5zcGtYbTNKaUhRWWhk?=
 =?utf-8?B?U2xEQWtsc3V1QmE2QUpGNWRSTlBTNHlJdWNVTUE4SUNKMlpON2xSaTRqUUZi?=
 =?utf-8?B?WVRxL1JNS2llWWJ6NHFQOCt4akFHc0JKTmlvNk8xMTVUUUNiVWI4VGgwMjd4?=
 =?utf-8?B?RENIRlM3MVI1YktwSVc0aTNiRXBkMVdDN3Ntck40NmtwbThnQUR5dlg0QVFw?=
 =?utf-8?B?VjhyZ01kVjk2b2Y3NHdUUndVc1o3amxZanhlak4yK1A0TStoUGtwRmNpZWpl?=
 =?utf-8?B?Ni9WM3VlWVNpMThxS0dJRmZKWWx5Nmh5UXFRa25LekdOcFp4NE5uQVlxUmYr?=
 =?utf-8?B?aW5oOWVqZEdGVDZydWlxVFJTMTdQdWt1bEZvUXFhcFBVcFNkUk0xYmxrNVYv?=
 =?utf-8?B?WmhXZ3lsMXZuamhzT2pWcUxSUVpUTDlNOFErdjI3Yy9aMktYOFlqMk5nVWpR?=
 =?utf-8?B?L3BhMjdnYXRqZnJ0aWNMUk1ZTWhjRFhjNWJCVVdsUzJKd29WNzZiUXE0eGNP?=
 =?utf-8?B?V3hJYVVHVFlUUnZkZjVLaFFsVm4zaWQ1QndnS1hVQnZyWWIrdXZ2RS85M3Aw?=
 =?utf-8?B?QnA3V3Ira1orVVg0OWpLbUJVbHFnamRFTmV4SFZBYTVab1Rpdmp5TU1IaHJZ?=
 =?utf-8?B?TU9haVY4dVFDRUUvRFlpWHZXYnk4WDltVFpyVy9iKzlETmV2REpJT296cmFm?=
 =?utf-8?B?Q2t1YTVsRzVxeFRMcExUWkY2RjZrUHJMVTRIbHdYajI4SHkrM2VKMXJ5Ty9J?=
 =?utf-8?B?VU5kUkQ3OFJQK1FmR2wvbEtuQXduQmI0eEdkaDgvalNGY0NtbHViaC9KaUtS?=
 =?utf-8?B?R2o2MlJWVlEydzE1N2xyZndCTHU0djBCWEF3NlRNNjNxMkFlam9raG5McnZa?=
 =?utf-8?B?bHVVS3BIRkp1MkZ3WTF1RVphZ0JpWFhzUHgxZ2xCOFdVZWd3OEVmU3B3aE1Z?=
 =?utf-8?B?VXBnNGE5bTdZZjk0eW1nZmcxbzNJTUdPMDhRSDBiY3RQNmt1V2hYamRuWVhs?=
 =?utf-8?B?OC80VFNvYUZyK0xSWXUyeittY1lKbW5rMnk0akZBeENMdzBtWkZRc2FGcUJJ?=
 =?utf-8?B?RVZWamZOdDZJTVBTQVRIcDd5WHJLVU9keklEOFhLQWlXSGZmMjRBQnlZMW96?=
 =?utf-8?B?QmZJdXJ5M0lvMkxNRzBwTGtkWmkrWHN4RVpua2ZNalNCU2Nzc0VzcDhWR0w1?=
 =?utf-8?B?SWJzMmkwM0JKY1dRM1h2RnNPMVVXbjFJaWtOcHA0MUE1b2hjVnVCWFBMMVJK?=
 =?utf-8?B?SnVYN2ZBMVFZWHNQMWl3RXRKTXRqOUZ6TDk3STRWZXc3U3Z0MHJva0V0eXNu?=
 =?utf-8?B?RVZNQU1HT3FjaTNHWGtidjBja3I3dEx4aGVSTk45QjFSUFllemh2bjFmdVBZ?=
 =?utf-8?Q?mljVeVf8Gdf5UQ9/Rvvhm6j6k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607a6902-1613-450b-e381-08daab8dd237
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 13:38:03.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o04SGZFCaGkzEo3IIDgKvAmYcndWsSRy+wsEuatYUzVBG8vBPwO4Vyd6ifQYWPWCYCSFeghcXTDg+EexwNbchA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8898

On 11.10.2022 15:33, Julien Grall wrote:
> Hi Jan,
> 
> On 11/10/2022 14:28, Jan Beulich wrote:
>> On 11.10.2022 15:01, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 11/10/2022 12:59, Jan Beulich wrote:
>>>> On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> Rework Arm implementation to store grant table frame GFN
>>>>> in struct page_info directly instead of keeping it in
>>>>> standalone status/shared arrays. This patch is based on
>>>>> the assumption that a grant table page is a xenheap page.
>>>>>
>>>>> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
>>>>> to hold 52-bit/28-bit + extra bit value respectively. In order
>>>>> to not grow the size of struct page_info borrow the required
>>>>> amount of bits from type_info's count portion which current
>>>>> context won't suffer (currently only 1 bit is used on Arm).
>>>>
>>>> I'm afraid this isn't true: There's no requirement for a guest to pass
>>>> all different GFNs to VCPUOP_register_vcpu_info, yet map_vcpu_info()
>>>> tries to obtain a reference for every vCPU.
>>>
>>> AFAIU, this would be a reference of the **count_info** not **type_info**
>>> (which BTW will never be incremented on Arm because we have no type
>>> support).
>>
>> I should have said "obtain a writable type reference".
> 
> Thanks for the clarification.
> 
>>
>>> The commit message is only referring to the 'type_info's count'. So...
>>>
>>>> With my adding of GFN
>>>> (really gaddr) based registration of the runstate area (already
>>>> looking towards 4.18) the maximum possible count is to further grow.
>>>
>>> ... I am not sure which problem you are referring too.
>>
>> Wow - a mere stub (but not inline) function to make the build happy.
>> Then why is the description talking about one bit that's needed on
>> Arm?
> 
> Because share_xen_page_with_guest() will always set the type info's 
> count to 1.
> 
> TBH I don't exactly know why we set it. I always assumed this was a 
> requirement for the common code but never checked.

I don't think there is any such requirement. In fact there are only
very few uses of type_info in common code. By also setting
PGT_count_mask to zero you could actually have the compiler eliminate
some dead code ...

Jan

