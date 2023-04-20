Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF66E8E62
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 11:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524001.814508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQnx-0001ib-80; Thu, 20 Apr 2023 09:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524001.814508; Thu, 20 Apr 2023 09:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQnx-0001gD-52; Thu, 20 Apr 2023 09:42:17 +0000
Received: by outflank-mailman (input) for mailman id 524001;
 Thu, 20 Apr 2023 09:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppQnu-0001g7-Tg
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 09:42:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0db647f-df5f-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 11:42:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8759.eurprd04.prod.outlook.com (2603:10a6:10:2e2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 09:42:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 09:42:10 +0000
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
X-Inumbo-ID: a0db647f-df5f-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKp2rN9f7ze6JpqZMZeQ4jPXO+lrTtscDlwVZhxF/mj/kpOwDZgAV20w3lAkGFB46nI+td0yDf8pxVzGogluXPKlkaUilSmzQK2pduuGh9lyguafRW+OaftP1Qkb4KH5eMTlAK5W1lOaV9I3sQZH/xQ4uBgY7U8Y7J5ajZIeQ0KF7o6TmtsHJEaalNbPbfxiGoIcDkqFI+zUGY5s+KWHJiq8pL3+FkCno+e8LEKigNBcvFfBhbaU41kX8PPFQYbzzsVBmhnsUqqwQzKUq+iZaTy+Ccj4tl+LUZnI6Pva4GHF7g2svwfT1tTq5adNnwvsu2dsUQRJkk/42liKt5Rogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKucVmGm0UiV2SG8WSNasg7AjjlCN6GAmny2xDfinp0=;
 b=Y/FV8bnvjerkfkfn+qqXUSs9mW3DFOcdQbkPvkYx1Yq1qd2ic5et8lXWbRAT3e1uADSt9+k2H8PtDGoU+AEiAYbr0IlESNn3cgj9tjYZA8RG/W9QwCiO3P0k03xiM1vJ+haifLt0B3cfLfz/2p1eS5diZvoFRJ8qxWziO1pCRJ4g8QnfH1VoNHub8vgSd8gYE10H6VsggggNTvVWNQfffUlvPi8bkr7ZWp0veJfgPD8mRSeWQ8F+SdKuqRAxb3YKDXdinE+HDKlqHEqGdhrXLFsjs6IFEB89PubvSLQ5FIZf/vNNFdZtDY85u0RCT1ZYCBXFjJCtFvKB6FttVgKrpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKucVmGm0UiV2SG8WSNasg7AjjlCN6GAmny2xDfinp0=;
 b=Wee8qOHmfCn1ynZq/cPo82CQNITbHESZxXAmezbYlLAq/sT/b69XPpRgrBES8FaAk1vr1dw6DPd+V0mQtTSSina6Fmvfxa7W1g8iGd/ngzpJXtA6pfZ45RR3ETEKnsMirMrfGDOYYfWknNp3I9d2Nbm8kLxaJD1JaGMjF8NpzQ5nLIZGjYzDktSgBV0UMofRootUlfAm+HPvtNCBuk+zXCFVHCixV7kIBCGgIEfuWWpeevObKv08vlRR+yMJovmfjWx1ixi08VO/r0Yf66eXy/aTFE9xJhi01xXnNnkh8pHNZYSODYfDHLulKfBgg6+gzMNwMK+Hbqwx6c0piJh9Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8041b90d-ccdf-20a5-a2b9-d21a5454646a@suse.com>
Date: Thu, 20 Apr 2023 11:42:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/5] x86/HVM: limit cache writeback overhead
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <18fcf499-a2ae-ab48-a66f-ca0499097e8a@suse.com>
 <1c79060a-89c0-6dbd-47cf-964192b82020@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1c79060a-89c0-6dbd-47cf-964192b82020@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a645a4-5684-41a4-d0d8-08db4183837b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	65eE3X7oxGE2BliZP1wxxySf745xYF8hmMS2mDCvjWuv4gSHmTSJs8aEjCQcQaZFGymSFIJ/mJ+jXjl0eR6dvNz9BblAOxMVmS2VYsfAWSQr/0m0CaPc+0ugq7kZBOSqQXaeS44mmooA9VhjqNuJOHYjBTaBx8Of87jqbWHaaMOBAaR2aoW0wIU75txzEbNE/o7BT5LglbrddGaieoSm/q7HrON3Mv9xwGNpl+OBLJrHMdPhokrlPZUiAU7ssyXiIVwAu1icxciqdypqmmvXhcsQ3SFJwyKBCeAsuix8wncos0NcIDjMrNdPoU2z4t143oaD5AHVExQHUr6BE5XIIAxN9xbL19r77AXUQK/RkSAo6RFFmS1+xx7cbUT40AVbVF+fqXj97Uw0+uFHwKTzK78PX58ZddBFkIaGSaIFDckYFYrxaFzIqow/0Wxt+zO0E8W8+ZiwmwG5MXYn87DAhlF5kvKY8J550o47s7op1C//yn8nJuz/RjF2lSFITADyUlOjTs9w/tHIkg3nH00O+TOEfZ208MdDX4gOspzqLTkE/8VoyHx5sjlUPbC20xzz0mmlFIHBD76PE5BRsUaNIr8+8XCNzcoe/veOQwFx2vXv2/zMp+JMk/zjjtuLqqURghrjiKvAllElI7h06mIhHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(36756003)(2906002)(8936002)(38100700002)(8676002)(5660300002)(31696002)(86362001)(6486002)(6512007)(6506007)(26005)(54906003)(478600001)(2616005)(31686004)(83380400001)(53546011)(186003)(66476007)(66946007)(316002)(66556008)(41300700001)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0hQMFRnaExRNjMxTDI1RmtDRUQyMUVxUVJxREExRzl0RmlOOEw1MFRsVENn?=
 =?utf-8?B?RWdqMWNiNGdVMzh4NUFJTktvRmREd216T1dzOFAxREhEU1pUUHZoN3Zwc3JC?=
 =?utf-8?B?ZStVWndxRE4rZHhJWFdRUnhuQmJVMkNUTUE0THNaVU5ZMU9uakgyYUtFdWw5?=
 =?utf-8?B?eWZGMUtROUhlN2dQYlQvc0x1NTZDaU9hRTY0VnlHR2hhRmtjSUgyVGlPVklN?=
 =?utf-8?B?Zy9KbkxWZklVTm9wYTFrT0k3cjYxOHU1QWJnd2lpT0RabGZTcGZZOW1zY1N5?=
 =?utf-8?B?MUJ0eWt3TEl2RFNSb08yZTJ4UkN0TE56aVZETDFKVThWb1lFL3R6N2FjZEJF?=
 =?utf-8?B?WklqWHRhcFZrT2RucVA2SVpIT0pMWHFsQXJyQllzYmx0UUZFMFhqN0JmL3ll?=
 =?utf-8?B?cXpIVVR2R254U2dNWTQ4SWVQc1hDeHFjaGRxWWsxWUxWbW0xazBIYnFJVUxJ?=
 =?utf-8?B?Q3ZmYlVWYzZWcjZCTm5TYmtxdFg1ZFhkaEk2ekE4NVlVYTBTSEdaMEh6NjNN?=
 =?utf-8?B?d1pwZDZrS1pjUHdDOWRzKzlDRE13U3JPM0V1M1RJZ0dLem1YbkdoMktNTHN1?=
 =?utf-8?B?VGNPNldoVEx0YmRQUkU1cjZkOHZpZVlxMlB6QzVmZVdLSDM3ZW91S052WktL?=
 =?utf-8?B?ZEFnWVluSkYvRVhJZjJtc0NNK2RiNlk1cURtVXhSSHQ5aFJyamZmSGdoVG12?=
 =?utf-8?B?SzRQd0NYRDdBUDNrR3BpenJ1OEd6UktOdmFXS0c0VjF4TklobWNJa09QdDYy?=
 =?utf-8?B?OHlyT1lXSi9vNll6eVVGbVRObDA3SC80Ym5KaGxkbXJ3UHc5TE1oUUVBaU1t?=
 =?utf-8?B?OHhDWWMvNzBHaXl1aHJndHlQcXJqNGJuRXNYa1ZpbWhtakU2MkVQa1Y2OTJw?=
 =?utf-8?B?aXVQS0NJU1Z0SElJZU9IK3M2Y1lseXRZS0k5dkxsYk5uU1hzb0VLa3lZc1Uv?=
 =?utf-8?B?MkJRVUlYMmF6dUI5NmliZmtzbHR0LzVXN2FYK3RJelpnN2hlTHBrdjd1c3JH?=
 =?utf-8?B?eTc0YUFFKzRsTU1Wc1ovanRMaDNvdkpUU0F2bmZTQ0tvcElpdTFGSVprSDVY?=
 =?utf-8?B?cWgzZ29ScVdIazBRamR5U3hEVWlQb0hKN09qZEVtRHQ5RE9RYVI4azB5c0JM?=
 =?utf-8?B?bVBvZ25YOE00RVZNZ2pRZ25JWFNReXVFYms1cTNMQmlvWktyTGVhRGdUWVR3?=
 =?utf-8?B?VElrQkg5SCsyTU1hSEJSUHI5TFN4bGJBQW4vSGdvK3RaNXJzU1dKSHN6SG10?=
 =?utf-8?B?K3I4REd1SktGa1FZc0FKNnhaSmZ6c216UmxXSUJxRitWZmNDYnVYVHVZWndB?=
 =?utf-8?B?eFBqVURubEFYb1JWR1R4b3B2QnY3YXIrSG5TRVVUdkNZekt2ZG1nMFlwUEdv?=
 =?utf-8?B?SmxQaU13dW1OWG9kcXhpNDhlWXhqRWdWUXZuajNhRmoxOURsVTMzRnNxbXI4?=
 =?utf-8?B?VDRldVlaaFE4dnJHQjRyeVVHRDAzdTBzaW1zWmU0MnJsenBNYWxrWHVvbzFx?=
 =?utf-8?B?SUNqMWM3UmZzbTlPSytrNWJSSjJ0aEdyTm1RajEydVNFQ2E5d0tsZnBRcWpo?=
 =?utf-8?B?V25wMFpubnhzQmk1OE04b3VnZ1ZxUHF1VzN2bC9Ndk9ZYjQ2Z0x5czl3Zyto?=
 =?utf-8?B?dFRteEtWNmhxaTNVeDk1RG5sZjBrNERXOGtiYVE0Qll4RVhqMFhCYk1mRkhU?=
 =?utf-8?B?VzdyWXkzSE1oZGQ3bm12dG5iSTZseE5CVnJCcHdQK2pOaVJLY04wdkxIcWR5?=
 =?utf-8?B?TmwxVnRMUXhZWDd4RU53eXg1L21ZaUlQdDhrdHVzb09ZS2p6YXZWTXI4cmNq?=
 =?utf-8?B?MFdKYkZDMmltTSszWXhPQ0NSUXRDa2RMb1AvZk5xVFFCZ3hmbDhIazk1ZzNM?=
 =?utf-8?B?dG53b1kwQlZqRFBTQUhDVWJWUFRvbFhrZ3BSTjZScXdEYW5kSkY5QWlYUjFZ?=
 =?utf-8?B?MUgxcTRCYVJBK3k3dDhzRVJ4dHBKd2VGWEx4ODRCNDZLaXVNRXJWTm9sb3Yr?=
 =?utf-8?B?anUreFdPUHZ3Vng3U1k3Lzd6TnhUNkpxSHQxUEd6bWVPeUNnbnpYRk1qL3Fl?=
 =?utf-8?B?bUZDNmMvbGVuYUVnVEwyVWFhZTk2T1Rwa3A0Q0NxTHhtK3U2M1FSYlgxc2NG?=
 =?utf-8?Q?YDOCEoRLAYZ6GY+kgEFOy+ROS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a645a4-5684-41a4-d0d8-08db4183837b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 09:42:10.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3wrILNknWZlegYP94AtaUMyOsjorucqvseEClBkkc+mS805LpugMkBUpouYH+ROEloccd+Q+5nUN2BlFoW0Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8759

On 19.04.2023 23:55, Andrew Cooper wrote:
> On 19/04/2023 11:46 am, Jan Beulich wrote:
>> There's no need to write back caches on all CPUs upon seeing a WBINVD
>> exit; ones that a vCPU hasn't run on since the last writeback (or since
>> it was started) can't hold data which may need writing back.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I find it unlikely that this is an improvement in any way at all.
> 
> You're adding a memory allocation, and making the fastpath slower, for
> all HVM domains even the ~100% of them in practice which never get given
> a device in the first place.
> 
> Just so you can skip the WBINVD side effect on the L1/L2 caches of the
> CPUs this domain happens not to have run on since the last time they
> flushed (which is already an under estimate).  Note how this does not
> change the behaviour for the L3 caches, which form the overwhelming
> majority of the WBINVD overhead in the first place.

You're thinking of only single-node systems here, it seems? I view this
change as particularly relevant for node-constrained domains on NUMA
systems.

As to "making the fastpath slower": That can only be the
__cpumask_set_cpu() added to hvm_do_resume(). What do you suggest? I
can certainly add a conditional there (and then I could also make the
memory allocation conditional), but I thought a LOCK-less RMW memory
operation might better be done in straight line code.

As an aside - after having thought of making this change, I did go and
check what KVM does. And (surprise or not) they do exactly this.

> So my response was going to be "definitely not without the per-domain
> 'reduced cacheability permitted' setting we've discussed".  And even
> then, not without numbers suggesting it's a problem in the first place,
> or at least a better explanation of why it might plausibly be an issue.
> 
> 
> But, in writing this, I've realised a real bug.
> 
> Cache snoops can occur and pull lines sideways for microarchitectural
> reasons.  And even if we want to hand-wave that away as being unlikely
> (it is), you can't hand-wave away rogue speculation in the directmap.
> 
> By not issuing WBINVD on all cores, you've got a real chance of letting
> some lines escape the attempt to evict them.
> 
> But it's worse than that - even IPIing all cores, there's a speculation
> pattern which can cause some lines to survive.  Rare, sure, but not
> impossible.
> 
> Right now, I'm not sure that WBINVD can even be used safely without the
> extra careful use of CR0.{CD,NW}, which provides a workaround for
> native, but nothing helpful for hypervisors...

Wait: See the title and the earlier patches. We're not talking of "evict"
here anymore, but of "write-back". The few cases of "evict" are left alone
by this change. If any of those are affected by what you say (and it looks
like some might be), then fixing that definitely is unrelated work. (You
may have meant that latter part of your reply like this, but you haven't
said so in any way I would recognize.)

Jan

