Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF01580BC7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 08:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375073.607365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGEIZ-0001qf-2f; Tue, 26 Jul 2022 06:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375073.607365; Tue, 26 Jul 2022 06:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGEIY-0001na-U9; Tue, 26 Jul 2022 06:44:06 +0000
Received: by outflank-mailman (input) for mailman id 375073;
 Tue, 26 Jul 2022 06:44:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGEIX-0001mI-T6
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 06:44:05 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50044.outbound.protection.outlook.com [40.107.5.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 571c3e10-0cae-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 08:44:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5132.eurprd04.prod.outlook.com (2603:10a6:10:15::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 06:43:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 06:43:58 +0000
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
X-Inumbo-ID: 571c3e10-0cae-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMsUdrqHBBS+GlHzQ9Zn7IAR22Ac8GZwf4iYInjfuDzMUUNTusAnovwvpvZvGvPtkuVVt/o9Q00FhKnx17ioXzhH875sVVl6SXb17XOSgZJt67ZVlhUhucZ43BI9nQKqF2iahfUQIJkkmW6gotHSOj/uXH0TPtKkayhQU4RUJiBU5JEGk50j6cauJvAJmu2RrS5luHY//GS4mXcvw4rDiUQb5gJLW1nS2ESr1V4XhTLwNYTAaNUV7NvFOAOQFcLYVudBdOWse+pUpozhF6Yt2t6CpCHXXPcERMR19IVipbX/xIk34YqYAldiSU/Bu8MubUiTo+ZsQDv7uvUDzrVvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JodecHY5wlWk92we986JthwxWXbstFcsY1oybc9Sdqk=;
 b=PiYk1xr/Fyy2FAm9N1noMf7bH7NW4M+Lc9ub2zO+QbzqvAGA1Hf96oNCCHorqhkuxVdwVhPyBAfsEwcioyclTfjCWj6SafiMJVSXZ6VSPMc6wsFQQzMO+B0pNDcftEMG75UVcOmqSaQ6Dl4NgkM2Fps6m2/qL98mOz7i66IYFxXcLY0u0FxPIfTup8EdgrePn/pY0JZGn/IvMW0YeNmYs0ph+980uZFKvtFJ4WuToEUHTRtpS/w7c5CKQmODGNzhwRGXsxItpupn/83XAkHIp6rmIKuzvggP34GCqmRsSU0b9mAK0AK9UQ217x2Mqlk0ZNRURI3g2uV0q3542036dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JodecHY5wlWk92we986JthwxWXbstFcsY1oybc9Sdqk=;
 b=vTZ6pakDHC8P/HA1gpjks37vw9z0+Q5rew3RRV0vIHeCw7vcD0G5B+/mc1P0Md8U7ELWEeDryCNV1lEc2ZEQdSx+cjgOSSW8vDhwJprarVD0ldoa4dvP9VCfDmS31BEkNLwtIKGd08Xlh87MAgGs2y53cItzlMQ6j/QjU0uy1oVO020ka1Ufe2tqHMHwEDMZ1MGbCKiOTNVkOFp0GP24yyn46rgH1lLiuc+0FfY/5mJ3QJYlyPG0kTWGfx0AR79ecJjmuY+5JfqzKV48EdJgeVzKIFtG47+h083GtbXl+B5hz/NzOZIj/gtIjU8DDFM/vmS8NlZbMMBKkyk+likW4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <181de4f8-3787-af7a-4c4a-aa5ab01580d8@suse.com>
Date: Tue, 26 Jul 2022 08:43:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 6/8] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-7-Penny.Zheng@arm.com>
 <903b6203-a475-5a83-0b2a-f3a8fa345b73@suse.com>
 <DU2PR08MB7325D9F476CA130AC4E6AC30F7949@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325D9F476CA130AC4E6AC30F7949@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c276b1e-1b56-4cdd-b637-08da6ed23777
X-MS-TrafficTypeDiagnostic: DB7PR04MB5132:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yc6TAVllO+saWiUa5TwIWHTz+6VgPcMaCWUpVuIEIda4e1+nCV3SNFtYOIsFLf+W/QS2xGPLku5IpAibQjQE6iyKQwzD7PfYodkrx0jwaG8f1o7euWBljC4o6ENwkra80sPEGkSLgzmjQtmoBZsDTqX3akf0jMryfOi2E4nUn3/qgd/V0Z6TA9UaWUsBgSdP/DFrUFycizUJd/WZEtfKhk5GccJEaEA4ZupsTMbOTEZ54kncD/hsG/dR6FISRF1AFa0DP/IHS/pNxR8ScqaxX5SZrRDq3/dYcVYRW2Wguta2veclLtzWE9WZ5jpZCaIHGBHa4jZaFa2ag4YEAHiddI24qejTmh2vfl+1NjPMRMhITd0xdfa7BlXhBQEIs3DPbHIIrbz7NfQoZqZe7h4PQXVE4WFaCL+ypekg7VnUam2mysHjeU1gDqapra5qWdPg92Hr0aJxEjTzf7SoAcgak+nULz0aTOBJ9julR1NqeF/4FY6XeurFGrQyuE/hkURguz/fpnc7qmK1X3K1Akj5K3N+TrSnuY9qVphez02osg0cq5t6xmYcEKgQIwASABrAVwqWAYOKYxsJLY5cTxy2wWfIpcQVORsfbb6eDrEPnvW866W0fdkBQ+NzjCzwWS0/+O0bbU9hV/UHcxZ3RTqveTKrk6jvoRBFOsEgHtN2+w/cYdrmHp01DemYE1D/+AlZ4NdvCDg2vowCY9XkDnross+/Za1LoeuzwXk8ogdmgj4OQYyXGrBAZD1D0jKbpTBZLd3dPJnhi7PYMf2DmKG7iOT35/A6gNrbiFfFH1B/e67QkjX39yMdppQbEstHALmFd0c0tXyxzhlAyiwpIIDc5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(396003)(39860400002)(346002)(5660300002)(478600001)(8676002)(6862004)(8936002)(31696002)(6486002)(86362001)(2616005)(83380400001)(2906002)(41300700001)(6512007)(26005)(186003)(6506007)(53546011)(36756003)(38100700002)(31686004)(66946007)(66476007)(66556008)(316002)(4326008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDh0Rjc4VUN2YXdnd2MrTUdUQWVndFpVM0krWGpkVGRUTk1jL0lvb1VVQ3Fu?=
 =?utf-8?B?Q3ZzSUdMNlJ4STd1QVYraUpDazJ4MTFYdUdtSlJrSDV4c2I0TmFxVkhpSGhS?=
 =?utf-8?B?S2Ivc2xmRnRveVN0U0JkdklEeElGeTltVU1Db2FsTVFDc01QK1ZrZVk4amxX?=
 =?utf-8?B?cytacURVOTBwTFBKRStjaGxYaDlZbTVYcU5ENFhyR0FVZzF6YWErdEhDZ1pP?=
 =?utf-8?B?L0p4dWhjckdXTjhJa1dielhsN2ZhUElEeUQ5elBnTWd3SnB3ZDJYWDdydnVy?=
 =?utf-8?B?TDJKNGhnSE00ZWJucFIyeE1CZ3dWck4xYlovUFdBOVdvZEVxVkU3TnAyQUR3?=
 =?utf-8?B?K2hLMTZtaFgzTng5dE9BUzVjb1BqbHdpTEdVNUZtVmRoYzJTTE9QbWFuSWdJ?=
 =?utf-8?B?RVh4cXE4TlFHWTVxUEJ0aXpTR1JqM2d3NmZqUlYxSWpieC9qNElmb3h4MkdW?=
 =?utf-8?B?T0tkM3pCWGZXdE9tSmMwa2ZHZzZHajBEYjFwMkpiaDA4TEdiK1RnQVYzbkRO?=
 =?utf-8?B?NldIdVlFbDFIOEhpRlF1T2FGMm1CdzZoNTRkdVloU05xaEVtak9hcWNXMDBu?=
 =?utf-8?B?VjBsWlZITklVVVMvUjBWK0RFMHBxWSthcDNkWGIxaTFYVUNwSnRPWEViM2dx?=
 =?utf-8?B?VUs5L0ozSURBTHN1dlAwT1NMRFFNeUwrYjQzVEZpUFQ4aUdIbW93Tmx5RG1h?=
 =?utf-8?B?YTVhRmFVQmVhVjF5WFNSWm1GbUdpWk1BcVhZL2ZSMUJPOGR3MjRyMjJBTmxw?=
 =?utf-8?B?VnBhc1MzcVU1UEpBRHZoMGoydzJRcHprSUFXSExsVERhNFAvSGg1TXZmZUJz?=
 =?utf-8?B?Qm9zN25tNFNXcGRLVFFPTGVTOXFYNk41Zk1yUWR5RTdOaFgyeU9VR2hPZ1Iw?=
 =?utf-8?B?MXZLaWtuWllOb2V1UUpMWlFyaWNFeFB2V2hNYkNBTTRlbXdwNU4wcUJxMlZL?=
 =?utf-8?B?S0xWelh3U1VtUDBkYjNJY0xXdG9FVmZlNWZMVzZSTktyN051d1h1bEVVaDcv?=
 =?utf-8?B?Wmh2d0FJRFNqa3J4ZjJZbVhUWStpaDNTNE1GR1I5dWZUVTJ2RXB5QTdNZjVP?=
 =?utf-8?B?RzBpVXZjZWd0d1JmZ2UxbFRKSUJoZW1STmJLWThXaWtKUnNPUVNVTEkyTkdO?=
 =?utf-8?B?N3lLaEZETktKbkxWWEJsMVhEamFtM3doQ1ptczhuSHREWmZFVkQwdzdjbnlV?=
 =?utf-8?B?VXlGMEhzbjNCbXNIeVZtOVByekV3aURXc0VNS25VbnVwb002U2Y0dnh2QWdY?=
 =?utf-8?B?SnpyYzlaUC8yT29MZTRHWDE0Zjh5czh0a3pDbS9UdEk0NldHSW5mbGVabW1Y?=
 =?utf-8?B?M0hIYWR0cURhWGxxd0NTMTBEaUMrOEF6aGFVY2czRU1sZEl5eXFkd3laOXIv?=
 =?utf-8?B?SVR1VXBTb2xhMzc5THQvL1FBU2VPMHp4dnE0SVFsS2toL1RkeFZFejVDS000?=
 =?utf-8?B?SHluUklSeVhhOWpsV3lvcnRSVGMxQjBVcVE5S0FnVGFZRTFOc3lsbThFc0NB?=
 =?utf-8?B?UWpTajFaZDgzLzBLODZ6VEpQWGNQVHNiNUtWazg3akZYTEdaOHVFNlhmR3Ba?=
 =?utf-8?B?cWhiODFoTTdoNGhDV3h3L2NWSlJsRXk3cm5NeGdJVU5yTWdQN29CL3pBYWhy?=
 =?utf-8?B?cDFzRnRxRmtmVzh5NHBlYmY2bGtyOXUxQWtvT01pN05BbWlYVVJKYkduYVFG?=
 =?utf-8?B?Z3hNREZvbE9jVmM0aVFwc0ZtVXhpMXU1Uy8wb3JyZFkzR2Npc3YzQ3BwZFBD?=
 =?utf-8?B?STFhU0FLZ2FMMEFZazdDVm5kUGlyZ1JHR21SeEVqTkplcENUeE16OG5ldjFy?=
 =?utf-8?B?SVRmZTBIQUY1ZEVyQmRkeGdKMkZma1Z1S043MTR3UHhoaUI2dzgydDdPMVcz?=
 =?utf-8?B?VE1LbEhUd3VkNnhwUng4aWliZ1p1Qzk1MGU5KzJhT2VtU0RxeXQ5V0xIWXps?=
 =?utf-8?B?eUZvaC9jWk52UHlFcEhxaUkzaUxLWVE2dVVSdm9DVXBoNGFmY3lSNnZkWWZh?=
 =?utf-8?B?d1ZlR1U2c1RYdkVtS2VXZDAvdmhMenRUZ3IzRmlYd0tvWXRrVHB0RGZLOG5Y?=
 =?utf-8?B?ZEhsc0VzMDVaajRpTEc1elQxQktwc1lJamFaN2tpa3NGZ3gzL3VjSXdwTExa?=
 =?utf-8?Q?nE3Y+eGkg/yfz0jIYFBPAC5WA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c276b1e-1b56-4cdd-b637-08da6ed23777
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 06:43:58.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvYoQHA2UuQVegj+r0AYam/6rFRpHrM7OVb0BGFp06QQYlnN9/go2MI69IM1BZ5sVMUnn+WVDVR8S298YcNnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5132

On 26.07.2022 04:57, Penny Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, July 25, 2022 11:36 PM
>>
>> On 20.07.2022 07:46, Penny Zheng wrote:
>>> Today when a domain unpopulates the memory on runtime, they will
>>> always hand the memory back to the heap allocator. And it will be a
>>> problem if domain is static.
>>>
>>> Pages as guest RAM for static domain shall be reserved to only this
>>> domain and not be used for any other purposes, so they shall never go
>>> back to heap allocator.
>>>
>>> This commit puts reserved pages on the new list resv_page_list only
>>> after having taken them off the "normal" list, when the last ref dropped.
>>
>> I guess this wording somehow relates to ...
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2674,10 +2674,14 @@ void free_domstatic_page(struct page_info
>>> *page)
>>>
>>>      drop_dom_ref = !domain_adjust_tot_pages(d, -1);
>>>
>>> -    spin_unlock_recursive(&d->page_alloc_lock);
>>> -
>>>      free_staticmem_pages(page, 1, scrub_debug);
>>>
>>> +    /* Add page on the resv_page_list *after* it has been freed. */
>>> +    if ( !drop_dom_ref )
>>> +        page_list_add_tail(page, &d->resv_page_list);
>>
>> ... the conditional used here. I cannot, however, figure why there is this
>> conditional (and said part of the description also doesn't help me figure it
>> out).
>>
> 
> I was thinking that if drop_dom_ref true, then later the whole domain struct
> will be released, then there is no need to add the page to d->resv_page_list

If that was the intention, then it should have been spelled out imo. But I
think it's not a good idea to skip the list addition in that one special
case, when keeping things uniform is actually cheaper _and_ more consistent.
In the end I expect sooner or later there'll be a desire to restart DomU-s
which have crashed, which would include re-using their designated static
memory. Then you want to avoid leaking pages like it would happen with your
approach.

Jan

