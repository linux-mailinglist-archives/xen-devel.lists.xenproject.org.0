Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046EF6219FE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440335.694512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osS13-0005PC-Dw; Tue, 08 Nov 2022 17:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440335.694512; Tue, 08 Nov 2022 17:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osS13-0005MA-AF; Tue, 08 Nov 2022 17:04:01 +0000
Received: by outflank-mailman (input) for mailman id 440335;
 Tue, 08 Nov 2022 17:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osS12-0004ie-BC
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:04:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130052.outbound.protection.outlook.com [40.107.13.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56082b79-5f87-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 18:03:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9210.eurprd04.prod.outlook.com (2603:10a6:10:2f9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 17:03:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 17:03:56 +0000
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
X-Inumbo-ID: 56082b79-5f87-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhjLirYx8UoAZC4CW/S8M21/trTezCwc03cGWGcp9wHPPSiesUwtS7yI1xZFg7YrbKa51rhhKZdkAkl8+YTkgMTc4Im93YtGiM/qBCzTKxdHTLlfyKNJHUyRq7DHxtpJO1fMOG9wb6ueW2+9RyhbovgWJxWOhV3M8iB19kmWfiL5r/zBUXKcyqAfp6YAsI7m57E77OzZcfGwg0X7UnvjfbJd2eB6G2Ht8AuVfKdk4m+YPuJ9JWLwu3mqzUp+rhNbHpqOj9qJ3Gc9eIG5GObDWvsu7ypm4xRbe9iSEs5HdvQGowCsOM+jyX2xKKo3GBM6uim8aToUxFkuN+TPIx+gRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIwhKR6A6y6PoKtR5lrUX/3UkdxxKbE4L4T14bNkSGc=;
 b=PebWJZGtbA6BAO9j4uQt2cBprYozPC15eBQU6lEyLcOqFrEHz//uFfdlrQlCryEPJFddUltWXWQKWjFCQsZdfPSXORP2J+QfU3GUtGgbY28Vq4iOziqz/tJnKxVZ1p1I+HQ8+rVgm8YhVv0HnhnPTGEHY/FHj8zUmA6D/ZwyjwSwmTyuRoh7gJsVocRzjNiCMtfY+Nus78yPadvXQn74UWj9faWC6g5cgNAF9hVjv09kJqvwFV1IpkfDP32w8sELP6xIhVZrR1xuiJtqDuxhUIFdsv0SgJW24TbcjHnrj9U8x8NlPUMg40Nc68rlbDR+YjB3QiwXxFPtapNcoM+AoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIwhKR6A6y6PoKtR5lrUX/3UkdxxKbE4L4T14bNkSGc=;
 b=ajPiDef4JTBRoDVwBBQu3AS71euX2vF8fc7K0L/jCu9QSbr6xaqQd0/dL/GufCLWb98lMYA4LVLiPt66zr0Byieseqt6T0I9Y4OaMKrUy81oppmmeomS+9GgICbTF7CGJqgVHvqALIwKEZeiMnCEDMHoz+k6zpQH/EMjkVxjStclwwiJxf4FRqbx1FSdJXzjShzxzdW1vjf1JBJN/y6o7P+TAwWzkYNcJvogIRAHMtns3bdTudnnv2fhej4HV2BAFiEkZsABxuWjUKePiM7GwNjlJEag+TONKL2BWHPRu/dy6sb1FhblyZTx6I9aGAydRrCGG9OpIvXd+B6nPqjG3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
Date: Tue, 8 Nov 2022 18:03:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2qHOfemg/wrc07N@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0288.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fae40c1-eed0-41cb-2901-08dac1ab38ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YEqag4xuMcAZVLIvtzsMwSB6qYKk88QoAnKITGWCLKPwJ6HBxRMvrnBZQJ5DQGLTfuET4OJdzWKGQd5/fhvTBOHIhqfZCMuZqZImgVxu66gNYPT5kHPE0WZCUwfEgKeTYPkllMlvaGEmxbqgmNiHrQdXhfEvJ8Z2l0wic2h+8mmD3FxXMlOznWa9EtC5zY5YMFjPcdv0Sm/H3/++M+xOHsTe56qSZzZeTXA0EBgqA+auTc4G0nb/hieTpnlR6KNEosFSh1XrW3NqO3cDPHYMmlhoqJZENlTwn65gwI//IYouDXgQlNJVJt39uLdtgAN7hNr/2NGnhuSaUqFZ/LEddKplETQ40mZRhNqhGfko3OCIAF3iKvM5mVpSPyc2PscmYIUAIGTbngmRs5gldV76w23tmyFQNA0sas/aURbPxLyCiyZb19Ydrksvp1u/5Xfiqt/fr0mKOr7j94Rr/ciqrXWvpkGBjyBm9AdIjCreigHuA3f/oYlJY0pLDk/EGBlFtQoGocTl9m0jevEi5S7RXqDYs3HX8w06er4zEqSIQigKcPYVMpcZdJtSQwjIHSCTCN7YiEXCFoPcGjk7fTrWUcOrVi+RLriFgm0oHGJ57bazQn/wRRW5Uia8EvgQH+rBdgueZre6t64wa6Apf83IcbEX8DHekoZNcnKVqZT800DBz2WBFim7mtIq8jndfJErZUsiBD3O7Y81yEdWBsHvnq4NwnIGHJtP9iqSWuqYXSK3PTw6ppEd14ZKJjNtJI8AIPnnoZLch5IInOcbBTlvLvbJ6vzEz+1ofXtrtIMM0iI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199015)(316002)(31686004)(6916009)(54906003)(8676002)(36756003)(66946007)(66556008)(66476007)(4326008)(6486002)(38100700002)(83380400001)(478600001)(41300700001)(186003)(5660300002)(2906002)(26005)(6512007)(8936002)(2616005)(31696002)(6506007)(86362001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2RrditCYlpRNXVqMmNZQXR4alo5NDBTK2hSWVlrUXptL2p4L0EzdEp5TDM5?=
 =?utf-8?B?clgxM3hld3lyRnJTa2RqenFPaDFUWENhUGthaEtKMnZ4MTMyWkMxSTN0SDVE?=
 =?utf-8?B?Mk5JUFRudk5rV1NyTzEzWXVRMFY5bkNialJkZzJYVW1IVVNuMEpCdGd4VUh0?=
 =?utf-8?B?ajN1OW5qY1hpYlQ4cXB5YWEvV1E2Mm5ZWjZQdXRDcGd3UVhPU1cwdzJjUCtG?=
 =?utf-8?B?ejJ4aDE3QkhjS1hqL3JpSi80VHFSMzFqeXFPQWhvamd6dkxjSVlQNlVmNzE1?=
 =?utf-8?B?R2FFOTJhM29CYThMd3BCTnFkV3NEeDRWLy9ZTW5peWU2ZnhQcHJuUWRscHFS?=
 =?utf-8?B?ZlJjZ3JESG5NdXdzNjYzTTJXaG90NDdTSFlqUmwrSGVJZHo3MzM5b3VZdWNG?=
 =?utf-8?B?ZGtGTDkzN0ZhVzJ3OFZLMnM4Q0UrUWozK2toeHRlSkVkb2luNm1zdEZHY3dj?=
 =?utf-8?B?elJ2aDNSd0V2d0JpN2E0YTVaMmlBOEp6N0o3SjJmM2liekZsYjZWYzFoQnAv?=
 =?utf-8?B?b3ZiRlY3aFp0RWJ2ODAyTFF6ZU9oczl3R0lGNWRoZUt3cDJKa2F5aFRVWDZV?=
 =?utf-8?B?VitQQ2psY2RmandETFBOQk9SOG8wdWVnUlh4YS9BaDV0cEFBSW4yV3FTTVVB?=
 =?utf-8?B?a1A1QzRJWXBXK1NvSC9sVWUxc3NRdy9ZVXVxUE5rM2UwKzlpZkhHTlNPbW51?=
 =?utf-8?B?RUJlZTRPUWhkZmtQYVJtTTVDNlYrUWR5KzRhMzF3bDN4ZHVGekJKdDYxMVdH?=
 =?utf-8?B?WlBRREZTa1hieWxqSjJrNG50L2Q5UXNZRzVCcTRkU2JpWnFOdHBvYndyeWpk?=
 =?utf-8?B?RjB4SDFCUUJ0YXhsTGQ4aWtGU0lBQk9NayttVHhOcWVENzM0bThuL1FpS3Rl?=
 =?utf-8?B?ajdrWjRuRWRjVUpIbnBHbVppU2lTbzlYeTBBZ2hVcFdkNzRXaTRtRWsycUFa?=
 =?utf-8?B?UHYyQmQ5OHQyczFRZTI3MytjcXpnc3JDSlJVano5QUJRdlNBa0xiS0lUQW4z?=
 =?utf-8?B?RVk3M1c2OFBKekpjYUhFNUZJcTZBcmlVWHhOWmxHUU5Xd3E5Tms0dnNvS0hP?=
 =?utf-8?B?cmp1czF1ekR2V2ExeFl2SDErZnV3Q2pWZng3dXpnellhTDk0clJ0SDRQbCtZ?=
 =?utf-8?B?VjRXanE3Vnd6WHNGUGIxeDVOVUpjdW1DUFo1Vy8vWG56bFFwbFFzNnM1a3pS?=
 =?utf-8?B?bnM0NnFlaS8vVEovUUsrTTcrUTZxU0tVTllhazNMaTR5ZXpKaUVkd2Roamp1?=
 =?utf-8?B?S0RCQjZwRU5BLzBaZk9XY0kvMEhUSHZJc3dUd0d2YjczTGM2N1MrSGJjQTdU?=
 =?utf-8?B?dUpFYkpCMjlRNC9XOEpVcmZid3hOTi9qMHhmYVZGQUsxQlAxYVdFWTdzQnEv?=
 =?utf-8?B?UVlyUVE4SFJBaGNvdUlMNWJkLzdEaDdlc1BGWnZTSE9qVlR0dDR1L2VNWEkz?=
 =?utf-8?B?Nm03U3NOcHhnYUtQTFgxY29xK1ZnMTBub2lLT1E1NUUvT1FSVUVWRy9rTW1q?=
 =?utf-8?B?MkU1UkQ0b2dTTDRBUjZGQlVEbTRyeHUxK0dvazUyWUZaVEpNZ3cxV3VReEhm?=
 =?utf-8?B?aDQ3TWgwbjlmRm9kSmlqMUhXcjA1VWQ2YzFxZDJpcGhqQlhhSnRZZXMyNlVT?=
 =?utf-8?B?YW83ZGNFWnFWVVpMTXRVVklDWUZyd2VhYmdrVVY4WXdGRk00ZXBzZWR2MUVz?=
 =?utf-8?B?bWxTM3dMbGpGZU1rbzFoc3JySkIyTGo0ZjJWMUZNZ29NUkxnSkNEdnZYRHFy?=
 =?utf-8?B?dWl0MmpVVzNvQVhjY2RxM05yZGxRRWUrUDEzbVJ2bmQ3cjJrcEFZcE96RlRi?=
 =?utf-8?B?NGhBVTh4RGtwb1hiMlhrK1FkSWJsSEJ2Yms3cWFOREloUFRERmJvYU16YlJq?=
 =?utf-8?B?RVRJWEVRTm5Fc3R1SnRxczlYZjFkeURVcllZcGRxenlUNEVWYUFRMloya0Iv?=
 =?utf-8?B?MEE1dStFQVl3bCtiUzBabzNxbFBOQmVqU3BiRkxIbFI4VTRvMi9hb0R1Ykhy?=
 =?utf-8?B?c0JGY0dXcE85d2F0K3lFcmNyL1pacWthaklEdlF0cHRxelVpVlZSaTJCQmZ6?=
 =?utf-8?B?cHBhVHYzWjlrOTV6Rit0ajlLeW9HVkpSZWxiMjkyQW9MTDJiSTFjRC9wT2U2?=
 =?utf-8?Q?m5Jfdnpt6eIpO49XoTIxCZ4qU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fae40c1-eed0-41cb-2901-08dac1ab38ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:03:56.1815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYHZ7yxAkPBiNdtUxYoFp5cQklSZ4tyEZxI6l8T1s02INlDd/9OdLRI2wNmaMHZmsnQiFNdxnds3j5sbF/p2NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9210

On 08.11.2022 17:43, Roger Pau Monné wrote:
> On Tue, Nov 08, 2022 at 05:14:40PM +0100, Jan Beulich wrote:
>> On 08.11.2022 12:38, Roger Pau Monne wrote:
>>> Like on the Arm side, return -EINVAL when attempting to do a p2m
>>> operation on dying domains.
>>>
>>> The current logic returns 0 and leaves the domctl parameter
>>> uninitialized for any parameter fetching operations (like the
>>> GET_ALLOCATION operation), which is not helpful from a toolstack point
>>> of view, because there's no indication that the data hasn't been
>>> fetched.
>>
>> While I can see how the present behavior is problematic when it comes
>> to consuming supposedly returned data, ...
>>
>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
>>>  
>>>      if ( unlikely(d->is_dying) )
>>>      {
>>> -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
>>> +        gdprintk(XENLOG_INFO,
>>> +                 "Tried to do a paging domctl op on dying domain %u\n",
>>>                   d->domain_id);
>>> -        return 0;
>>> +        return -EINVAL;
>>>      }
>>
>> ... going from "success" to "failure" here has a meaningful risk of
>> regressing callers. It is my understanding that it was deliberate to
>> mimic success in this case (without meaning to assign "good" or "bad"
>> to that decision).
> 
> I would assume that was the original intention, yes, albeit the commit
> message doesn't go into details about why mimicking success is
> required, it's very well possible the code relying on this was xend.

Quite possible, but you never know who else has cloned code from there.

>> Can you instead fill the data to be returned in
>> some simple enough way? I assume a mere memset() isn't going to be
>> good enough, though (albeit public/domctl.h doesn't explicitly name
>> any input-only fields, so it may not be necessary to preserve
>> anything). Maybe zeroing ->mb and ->stats would do?
> 
> Hm, it still feels kind of wrong.  We do return errors elsewhere for
> operations attempted against dying domains, and that seems all fine,
> not sure why paging operations need to be different in this regard.
> Arm does also return -EINVAL in that case.
> 
> So what about postponing this change to 4.18 in order to avoid
> surprises, but then taking it in its current form at the start of the
> development window, as to have time to detect any issues?

Maybe, but to be honest I'm not convinced. Arm can't really be taken
for comparison, since the op is pretty new there iirc.

>> As a minor remark: _If_ you're changing the printk(), then please
>> also switch to using %pd.
> 
> I've considered this, but then printing: "Tried to do a paging domctl
> op on dying domain dX" felt kind of repetitive to me because of the
> usage of domain and dX in the same sentence.  Anyway, will adjust.

Simply drop the word "domain", as we've done elsewhere when switching
to %pd?

Jan

