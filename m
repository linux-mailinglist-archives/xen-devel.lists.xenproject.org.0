Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF926806D2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 09:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486612.753999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMP8d-0007WY-Tx; Mon, 30 Jan 2023 08:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486612.753999; Mon, 30 Jan 2023 08:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMP8d-0007Te-Qm; Mon, 30 Jan 2023 08:03:39 +0000
Received: by outflank-mailman (input) for mailman id 486612;
 Mon, 30 Jan 2023 08:03:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMP8c-0007TR-1S
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 08:03:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2068.outbound.protection.outlook.com [40.107.247.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98848321-a074-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 09:03:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7432.eurprd04.prod.outlook.com (2603:10a6:10:1a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 08:03:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 08:03:34 +0000
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
X-Inumbo-ID: 98848321-a074-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni1I7/76kVYAZWz7FNWj/O3jxeoh9vtEKHNATkkCrs6sWZ5rGLZvU3pwBKP2s9dnagYhvPx/oOSTSdA1ik08PduhyXlUDXYRFxgFF0hV/iL+4qnJ8MZ/5Xq4BApu1MVRB1B6q3NnoJXZfSkLG6BTLxLkRoyDtY784A4XY4V6v4AixcA8pTLINNTQMp0PznlNflRuy4hx2HcSFH3VEKNWnMick27CEvBV3IFmcUvRoJmnLyMwHgxLgZo5HFaWW9KvlJAqOD2zcbRUl77hTZgNA1FNRn93xfTgN1BsFxIrnyioEWdDrrlOv26Mr7ZPbzdIhBKn4Re1hFC40QauG1p2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOaCDG/C2sJdD5TzBiisp/1yDh1cwFvX0sisRQDW49E=;
 b=IFRsXLwlUyw6Dznfn+cMKeZfRS/A3Xq/qrCF06/PnlKtrJznPX/NoyB+1E9IldUSQeKIFccY/l2jg3sLbh4u/G9cXxJkYOH6IHeqfJJnezcMLGfM4SxxMWSP6Z1n0BupdwDXT3KxyPgMMP38baOEyFdw3voQnhE+VAm+PHpGxrT3OZcFqs+UqhAZf29cm7ya7pR1MaXrNnkO0oZvUROd8s5NElkSwxSsWSb8bTR83QCneXcW5Ng08wTih1MhTEn+Qcsdc/LTN10vKcIl0EATJDLGZMRV5oGbtwwgyWbTs+wDejBUNF03rzeY3ezEFuPPJzFojT/tVhmtUONvG/OMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOaCDG/C2sJdD5TzBiisp/1yDh1cwFvX0sisRQDW49E=;
 b=B92Q6FxEvuCX9WGwaEL0oGaVq0ruUbujWF1eQTip7PdBhSuj6kdNn73sC8wdoxR8HQMFueRZ/z5X96fFYSNZjXDvRfxEAMxh+QrRzXF/xTVYMxi+GVg6SnfZ+uYxOxTKD9UWbvtFop+njUoPWCgMVv7GO6RRf/5mWtuVevT2tJPfEpGOVJWiqhHiwr0l7uJB9BE6E6sviKoqPmF/Ad3PKwc6KBlv0BM32VpRNw4nwXFXrF/nz2QDoy4sH8V8SSJPDezwch4MrPG8CC5DJ+LYh56YXSYfQ92FFNfupZvMJwaccLVzHPNV+U0kb5vCp5JThrbKeBi8MXtJFbs+wGDfLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44118a7a-3ef6-e984-babb-f5b75e5e53a2@suse.com>
Date: Mon, 30 Jan 2023 09:03:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Ping: [PATCH] Argo: don't obtain excess page references
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f9cd7b84-6f51-d797-cd2a-b9c9bc62b0f6@suse.com>
 <d03dc8b3-4c1f-2db0-4d97-944972dc6e06@suse.com>
 <CACMJ4GbUjLczb9ru_QUERGaNCModspnqgGwAgCqUN+oZ_90NDA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CACMJ4GbUjLczb9ru_QUERGaNCModspnqgGwAgCqUN+oZ_90NDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a96e581-e809-4256-4e19-08db02987bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bUZRHa69HjxJIqQc0bGs+PtFbUlSuaVRLqb9Px6OjDlJAps5pxshCyA1btaasQ0CUyuMhYQeEG6sw9gC/bpPUnniftjYB9tmJyGSyD6vvInhF30P8DNdBmI+mxiwqSiiuoQQwwUd8nbOvFDbwkxEVsq/ZEjd54xjn5Yd+ZR1R4ZfeuBy2FnFcTgt+QRG6Wjdb5cjg0UOz+8FPysEtJq7Pz2DF6yU5HkwtwKieyjFIDYyfxAZQHC9T+ksQGE7VJp1qYuyXGv5eIuSTe2leT3TsnCP+pmzvU/oxjH3YbG3L+XLcb1E5Hyb47Su4CW5PV17n4fEQtkRZajQEOKi76WAH133Qr7yGX4iaJrjpYTd4TAtX5uYYOtiffm18wacxz8NNPRxu3AVBxeVFx/FPVO59vj0ia42Sf3GYIVOnkhkr3sHKYb87ZyylgwniHWrqn8Y6mWEzu27qycW+wxXo7oyrYYq4lzj2i9eLI7k2ntA3BUkIiiwetCjLWBlMweiSmp7BrgcDYKAMPMu83G2kJXLWAPzkPdQz2OMYWZsx0S3dO3ZuIu6QoU+ooVWgihP50wOrUutb4m+vpRSXR4tYyeSrVxKP7TZyjehIaN5w0Uo2HH05l+NSXy7/vEt6kE9u5gLsCrxq1E5FAU2NsA7SK7LDfTD4FTE+WFWgzdeFx7l28Z4Os0Tr/nCJMr+1WIlqJht+a7HksnzW5vXpJxjRJM6I1tKWvLwf8O12gnz9+KESuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(366004)(346002)(136003)(396003)(376002)(451199018)(86362001)(31696002)(38100700002)(36756003)(41300700001)(8936002)(5660300002)(316002)(66946007)(66556008)(66476007)(6916009)(4326008)(8676002)(2906002)(83380400001)(2616005)(6486002)(478600001)(6512007)(53546011)(6506007)(26005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGdFNUErSU04aGc0TG9EQnJKblV1QmhtRldBNis2a2pac2VXL2oySTV6ZG5Y?=
 =?utf-8?B?UTRIMm9qZ2dSNW9NL2dqOTN0Y1pnRWh2dWpldU5xMGJWblVzY3gyT1ZMdGht?=
 =?utf-8?B?TXgrZWJXanR3VEVRODdacUp6dnkyWEEwTmRndTFRdXFpM25KSVZLcENhekdv?=
 =?utf-8?B?SS9WRVMwRmc2V1paSzFPWTJ6ZzBzZis1d0NqWGxPUHliUUduN3JHYjhMbm9L?=
 =?utf-8?B?ZDlPekNFdG9qTGxzY3ZXdG1ET0pPamRKeG0wY25XcDlPaTVzRzFFUjBIMG9W?=
 =?utf-8?B?R0ZRT3FKaDJjc0xsaWdXY2pWbkdhN3BRc2lwc1A2N3Jsb3hlMFJRQXlLQWIv?=
 =?utf-8?B?UFVheDU3WWdPYkxtbXJ5cFRMampOcFFxaVNEK0RiaU03WVBhZ1BKUmpwSDY0?=
 =?utf-8?B?MFl5VHNMK1dtZDY3MlhiQjVrb3ZIS2IxMEVpYVZaL3Y3YW5CaE9SWEtSeFpK?=
 =?utf-8?B?VGZKMDI4aVlRY3B1bmRobkdENXFlR0F5b1hKTFltU0dIWGdJU3BvWEJybUtF?=
 =?utf-8?B?NS93QzlBWmVKenFhZjVkTll1VjlFcDVLUmFKdk1leksrM1Fsc1V0T2ZCZ0tV?=
 =?utf-8?B?bTVoOS9QeUZ2MjluYW9nSnM3THBhZmYrSUV5cExVS2Y3STk2dW9LbDVidG9H?=
 =?utf-8?B?ZktsemdNMzFLdC83WGNHQnhpRnpRRWViNm5VYnhpd1NvL1dxcFlSUWl2Tk1P?=
 =?utf-8?B?MGYySWkyS0hIeWRNSHZJdlh1eGpiK3pOWW5Xd2pFVklQaC9xTm1qUGF4N3g3?=
 =?utf-8?B?Q1c4Q0Y3QUQxVEQ0NGZYaWI1REpYUFQwaHVQZFVyUCtEdC9MdDNHak9nMUg3?=
 =?utf-8?B?YzkzSmRxdmczck13M0NvQlJudW9EUXJJUHBZQm02R0drZkh5VzRWSnZzak14?=
 =?utf-8?B?QzMzQVlZTXQ4UjBzekJ2RUhOVFBQZGxDOUVhUkkyQVVuZ3d3T0I1eUJZWHZ0?=
 =?utf-8?B?M0FmeFcrbDhuVEduaDk4MlRBTHZsbVNxUmRWVldSdFdBdnpVbzNKUS8ycEFQ?=
 =?utf-8?B?NlBlWVRMUy9zcmdiMVRGQkZaS0svSEdvNzR0dEVMMTJ6aGhkNjN5OFJQanJD?=
 =?utf-8?B?OHl5QU8xWWg3ZngwOVU0amcvejU5YnNsQWxJVkE1bFJ2RlQxU1Z0UHdVckxU?=
 =?utf-8?B?QmdFTWZ5VnhleDc2TWZlb2RVd1B6cEdpamcwSEhxRjd4Nkh5RHdvU3dGV0p0?=
 =?utf-8?B?R0xhYkdMWThsdUNHQmxMY3NMc3kzMFJHa1ZjeDJPbWMyb0hvZXRKN3dMTXVr?=
 =?utf-8?B?bHg2V0NSWkhKZS9PNkw2OFdnVHJ5RGsxdWxPanU2TDJOY1QrQlkrSGdJR0hO?=
 =?utf-8?B?Vk8zUDV0Q1NtSUZhN3VzV1VMSmFUeWRYbWlLbGJ4VkZHanU3czVjb05QbU9n?=
 =?utf-8?B?OGlvcGUwN0FHYWxSV1ZxY0ppU3FmMXM1T080ZWRPTmMyeUxXTWN5cDVIYVBi?=
 =?utf-8?B?S01hWlJpMjFKZUlzWEhlUDU3MnhkbmxCR0xyNkpna3FRUDVneEZGWUs3Sy9o?=
 =?utf-8?B?aG5WcDI3NkVoRXhuVFlvOGZPUUovTVFVSVBGNHc5aWE5ZXg0dzZrcm1FeHFG?=
 =?utf-8?B?UVM0b1p1NU02SmRzWDhVOW5QUGQ1aWJCMmVMYWpRb2RJZEtiVXUzbXhxai9D?=
 =?utf-8?B?Y2I3eVNmTEp6U3pSU1ZlUGQxRDJBMjAxbUg5MEZXUTRpU01MYXdMOEJrTCt3?=
 =?utf-8?B?bmVKSFo3RlVnS211TVR4WVRWWXFCcFJNbTFXcG5SUHgybDFWN0E0NzFUakpL?=
 =?utf-8?B?alpEai9tM3Z6V0FHTUdKUThNdFI2Y3FIYy9IK3VOQkExWEdNWkQvVDJubGw4?=
 =?utf-8?B?YW5RbE5uVk5DNS9kT3I1Q1NGOGs2czBETE1xUGZKb0xHT3VKQ3huUUdxd1dm?=
 =?utf-8?B?azFBUlUzVzBmc09LUmdLdlJpdWw4aE44T3l2V05jWENEb1oxQVZoaXBGK1d3?=
 =?utf-8?B?dnNtanNFRDhXUjRsYWxYLzUzNTZGZkVVQWlGVG5XMWJhZThKcXNnKzlJeHJC?=
 =?utf-8?B?amhMNUg2UGUrVk5OVXNtd0hrU3Q2SlMyRWk2YVJvU2lWZ0dCZk0xazhCSjVw?=
 =?utf-8?B?QmZ1d0FHemg5a1NvaXJNYlZDYzBuaWpZbjlIQ2RjbzJjT1cvMURXMHFJYVRN?=
 =?utf-8?Q?qM+SfIPpqFpDENJsUV6mCTJYH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a96e581-e809-4256-4e19-08db02987bb4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:03:33.8786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06nX71JXq5o35c8QKwcGx07v7rmt0f1t30/NOlCAEStwYS+BdQdCUq0Q0rXUqx1EG0dxMmf+QzT3zyU7Nq7Z3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7432

On 30.01.2023 05:35, Christopher Clark wrote:
> On Mon, Nov 21, 2022 at 4:41 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 11.10.2022 11:28, Jan Beulich wrote:
>>> find_ring_mfn() already holds a page reference when trying to obtain a
>>> writable type reference. We shouldn't make assumptions on the general
>>> reference count limit being effectively "infinity". Obtain merely a type
>>> ref, re-using the general ref by only dropping the previously acquired
>>> one in the case of an error.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Ping?
> 
> Sorry it has taken me so long to review this patch and thank-you for
> posting it. The points raised are helpful.
> 
> Wrt to the patch - I can't ack because:
> the general ref that is already held is from the page owner, and it may
> actually be foreign; so the second ref acquire is currently ensuring that
> it is a match for the owner of the ring. That needs addressing.

I'm afraid I may not understand your reply: Are you saying there's something
wrong with the change? Or are you saying there's something wrong that merely
becomes apparent due to the change? Or yet something else?

> Am supportive of points raised:
> - review + limit ref counts taken
>     - better to not need two general page refs
> - a type ref rather than general may be sufficient to hold for the ring
> lifetime?
> - paging_mark_dirty at writes
> - p2m log dirty would be better to be allowed than EAGAIN

I can certainly extend the patch to a series, but that'll make sense only
if ...

> - allowing mapping of foreign pages may have uses though likely also
> challenging
> 
> I should let you know that my time available is extremely limited at the
> moment, sorry.

... it would then also be looked at within a reasonable amount of time. I'm
already sitting on way too many unreviewed patches.

Jan

