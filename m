Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D9763B83
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 17:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570569.892464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOghn-000656-Fg; Wed, 26 Jul 2023 15:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570569.892464; Wed, 26 Jul 2023 15:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOghn-00063O-Bz; Wed, 26 Jul 2023 15:45:39 +0000
Received: by outflank-mailman (input) for mailman id 570569;
 Wed, 26 Jul 2023 15:45:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOghl-000626-OG
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 15:45:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe16::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76b00937-2bcb-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 17:45:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9908.eurprd04.prod.outlook.com (2603:10a6:800:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 15:45:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 15:45:34 +0000
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
X-Inumbo-ID: 76b00937-2bcb-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuukAH57hSROk9eOL7yUvnAC8/kCLPq43spMkF82wRWRrqHbM6I/u25N4IQcPwoVDabMuLEwGJOCLzDTYsSJ4CW6xrJuWBJmxAPGGONZdnKoWmz3fPMJqlIqvE+WwnoQbzAkonRiK6FmSsqMy4pAYoRjIvLqqYDCXrQ5NeiZSMaNrrp4C7q+7d/soRVET385cHI3uTzpiZLBAX4wMpdRWoQ9uEdibBPX1Kchvlz2NrW9f6H7LIf8DSer73SD0wuNFgtXDitME8mbUnFNe0KnrZyMSsS+Cd5DObJj7jcAvB4LCOf5frn5ABJwiUxZFsqE8Vgra5EA87avQ/yUUW+EhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySz/SFnjsUPAdbt+mpclW9aPO7ASJpsNoKdb4AiohCM=;
 b=kRL57QaZ2euyeFts0sE1KlwdGybzcsSXciLXHDpdPRoPXckADDsTZwUvSUkjZeXpIOhGY0ZYEWFys08SO14QqppY1ZMrP6LnxY29/EItteUO9e2pDrRhP+ozv65JJASTsigj4CP3iBu+uX6qdjykb02CczZNAA+ba5bO/ntbHz418aDq2OgsRfcEJpUT6cGZ2ETuAp2Nvs8kZDedt2XkgmYyDwrh3SVk2rMegSg1D7f4fWfFD6LJ5SxjCLs/lAnGd3rly2UYrg9BoKt3VtyntsmSyhnr2ikuFXJ+vaL6WjVnggKDdZTdIyG8jLa8j/CHqOO9MmNIijS7i9gjZS8U2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySz/SFnjsUPAdbt+mpclW9aPO7ASJpsNoKdb4AiohCM=;
 b=X5+Zhdv1SZlOePgFHPSmcpPfjg56AvnSpUDrIdOdQlepwi4MRC6WJO1dks0t3Kvx4f7sMpLosxlz5SXKCg/FjCE1SnZ9EyiGtqJ4fRk813PKn3rNATeonODKTk8LgonqimvzkTJyns71IKfWzj4hwz1weWqfjY6iWTKHP4aDfqtVODhldw41TB5aQg49kWNnywPs66zbePSzfE4Twvj8A56T+e1Cb/10moHt3cKc95W83da8FXr6G/Y9wLNc5t6rgGFUe/wwS2B365NeBYtNhsJZuWoVS5WXlWzeZXEpG7EJ8B9ajWldOh74BLt4oxqtqgJroetym4wW87QWpeTbIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4bd511d-965a-153b-a649-ff9c679a006d@suse.com>
Date: Wed, 26 Jul 2023 17:45:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <f326168638ae05f5f387e4fa018ac2ed057bac8c.1689958538.git.sanastasio@raptorengineering.com>
 <019914c7-c6ca-70b9-6c90-e1891f4201c4@suse.com>
 <cf7e418f-763a-6f27-d498-c88b19c8a9eb@raptorengineering.com>
 <ab870428-fbce-240a-d4c7-4298fbed4050@suse.com>
 <825b00d0-432b-5db8-fe12-2266dffdf06f@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <825b00d0-432b-5db8-fe12-2266dffdf06f@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bb4c54-d606-48a0-1594-08db8def59d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K39cOPEfAJHjDX5RH8NWi1o22zcYSjubfALC4/dd4ynXOuDCowbiQkF6P87crmd5XjSpd1ZU5bLkgjaIctQc1WBwkffNAkpvWl/SSm++cQFppm1DvkLFiNTCVdHn2cYAi2SjBq/BKNIJJagVjwkqWBozeYgkMZf0npgnFjnqLflSu3cGysnMaatrwRzzKN8+1vBFc8OJGk4MN8hSixidm4EnBpBKi54/v6VPZ73vXCwdqZck9ofigQYl4FnQMX8/Ddz91wlhD6u1lRR0jVIOwEkESovxdkDDRfCkMOPccqQKsfvzTyo/yV8qngT8twOwGI53TFZ7oTnALeF139CVV0Odv+e4GL+hFuv5orIhe6Wrnf9ereaGHoBRezsM8WqVwAEADIm8nerQa9/P2qY/q+x1a7QE+HWZlUFPlznMCL1I0Ji0L2+dfCERvXOKGyq/jrR1vM/UK418CuQfqVvKELCNS/eruhPDq3OwavAa48mJorPLluEbhFbe8EWcTwDEJ8e8m+RgO1tuidb65XcV1XwwV2SHxbHKyOZ5uWDvLNf25edFQCnxrELuSI0RGYYFPikaBWY2Y5+xbAFvpU5y01/SCZSR+S3BcezXJn/XY4sI//wiORfdneDiTolF/Vy4sq5PD6xE8eqBnBgiwBvAtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(54906003)(66556008)(66946007)(66476007)(2616005)(36756003)(6512007)(83380400001)(86362001)(31696002)(38100700002)(186003)(6506007)(26005)(6486002)(53546011)(478600001)(31686004)(41300700001)(5660300002)(2906002)(316002)(6916009)(4326008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDRxeFRmdnlxNTllTkt2ZGhrQVVLR2IySzM3NFpTbDUwamxPbmFNVVVjcnU5?=
 =?utf-8?B?V3hTc1F5UzBNREhhSDVZUlBnc25CWTZ0VWdSRmZtcWpyMlk5V3NybHRQMHVn?=
 =?utf-8?B?YlFJRmdoS08ybTA1N2c4YlNQOENHZXZhV0s2dXNrbDZoTkpRTXh4OUJqNWp1?=
 =?utf-8?B?dWU5UlhPNXcxUWRXSUtheFE3d0xVUFNLVlJLdGVZa0hpZkdZdzZlRFBzR3hs?=
 =?utf-8?B?RGVOWlkyamZCdDZlNVJ5OVZoV1R3aStwOTc0WFZ6RVh6MjUwR2Vzb2p0REtC?=
 =?utf-8?B?eDBGT3ZTdkRZK3NXNGxYbmQvMHd5SDJuUTRqcTBlWCtkT2RPTWFVdmdjNDVu?=
 =?utf-8?B?NDdkT2E5QTVscHA0SG1HUTNTVTdaTm9Od2gvZzJpckhXanpXM2ZPQVVHOG9O?=
 =?utf-8?B?b3lveDhyeGF4MFMwZmE1SnF5VEdRckRYbE9TR1FVUEJBNVI4WTFIbldkcktj?=
 =?utf-8?B?SGZjTjlqRjZCNHBCV2xPS3djQTFDaVU3VkJOL0JUbGRLTmFoVjJGdytlTUhK?=
 =?utf-8?B?VDRUQzdBTUdKM3RaVzdpenVWRjlhOTdDQVBDQzRkZktXdjlvZ25KSmFTcUNU?=
 =?utf-8?B?akd0TmwrMEsvMWRFcHI3U2ZuRWRZZ2thb0gvUFN5TVNTejk4K25zODhnMGlr?=
 =?utf-8?B?Tkdlc3RXQ3h0VmZ0RjBkaGNuVE9jY3NnRVlCZEtoSms4d0Yydjh5T29tU1Bv?=
 =?utf-8?B?UmYyYzhUb3BaUURqaDZqMnovblV2NXpqNVJvOEdRZ1pzekZ0d2pjN2liQkhv?=
 =?utf-8?B?ZSt5UFVzNjd3b0x1UTBzNnlCUHU0blBWbmdnbW5OV1J2Sm43QmNJQXl5YStt?=
 =?utf-8?B?Z0IzZzZ5cjlRTW9wOXpCNE5aT1ZCN1ZFTklBVUM2ejBBVkZMRmU2Z3hRMmt5?=
 =?utf-8?B?U2lScDRCMDlqS0hBUGFyblo5bmFFczQxa28wOXFGZm9XcS9KTEFWaVFLcWdW?=
 =?utf-8?B?ZHROTnVnUlo5RlN3K3QwZDJKQWNERUM2RkRDQmNvUmtFcmRYdGd5dm5tR05u?=
 =?utf-8?B?WTc4Tk9WNkhpSWhWNzQ2cFJKdjlVcmZYOXd6bU1LcXF2WVlOZ2swRU54d2pR?=
 =?utf-8?B?VUs2LzNUUEltRC9FL2haRnVZVHUxN3dhRDZFTStRV2xPclYwN2tYTnJxdTl3?=
 =?utf-8?B?TWFnclJDc3RqNFBtYzVIY2M5Wk04RGEwaElaeUFuNkJMWWs0K1lpaDQ0RjUx?=
 =?utf-8?B?REVkNTJRV0pEMEtSc0Z0NGNMbVh2SFVwNkxEQTFYSjUzakNNNmFSVnVKcklt?=
 =?utf-8?B?c0JqYU13alVZUndYczBvQjdLNXgya0o5ekU3VFFycnJSQ1ZJVVVTcXBaaW5I?=
 =?utf-8?B?UUxVQjhPSWpkNXEwVGM0ckI4RjNwRFBGTSttVkJHaEpkQW1mbVEzWit4ekt5?=
 =?utf-8?B?dGVXRi9pVFFvV1NOUkt3UngzTWFueXo4Z2FQQmRFZzkzb1BjZ250bXY0N09X?=
 =?utf-8?B?aVFSVUxZTXB1NzFkU3NTWkZVVFUvVnpzQWNMV2VBekdySUhldVprOFd1TFI1?=
 =?utf-8?B?S2k3T2lYalYyenIwQnZLWGpFeTFHMEFNN1JWS2JNcGFyaTl0cjVDWDNpUSti?=
 =?utf-8?B?aDFEUjhBRml6Zkg4RWxpS0VvTG9SeXNINHBFRU5YN2RqN2FCSkk2UkxlZ3FF?=
 =?utf-8?B?YkZLMjNlKzVWK3g0aCtTMFZSVjY2cmFEcTlDbm5kNVE0OGxHTXNaaTd0WjRG?=
 =?utf-8?B?Sng3U2hJTG8vNWtTZDJCcXNjQXI4NUVJdnBYdSsyY1hvUVRZbE43M1NOV3BO?=
 =?utf-8?B?VWU3R0xHS0wrSUZ3ZFFCR3BYSFduZUJFL3lpZ3VVYlFkbEdTaklrZXo2K0JJ?=
 =?utf-8?B?SnNyN0o3OGpDRzhXMGoxREszcmRya0dJbGhlQlVDeHJVLzJQOU9IY2dVbEtj?=
 =?utf-8?B?THBaVEpJSzJleG42YXhxZXVKbUIwTFY4SE1DQ3ZsNmJHbm9KWU8yYVlkQXQ0?=
 =?utf-8?B?VWVacktlK2JHWVFaajNzaWdPUmtZenRMalhYUXN2Vit2SkN3T3h0cXpDd1Jl?=
 =?utf-8?B?OHFtZ0FWZXpKTVlVdk9qK3h5WkhvREFOSnRkYmNiVFhyQzMwME1BRENrZVAw?=
 =?utf-8?B?QVN4cFNPa2szUGxxS2dsT3V3U2tVU2xqa1lzNnBaY2RZWW1NQWZpYUNxWU03?=
 =?utf-8?Q?soFbyDEIhR0S6w77heaWl5kHu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bb4c54-d606-48a0-1594-08db8def59d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 15:45:34.8328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XXcJvu66yzc7v6aJ5DhXUfCoVs+8CPQcjYuv3oL0UfcN9Yf6znQFNbcp0lrvKk4edpfR5ixWu4kkIzH+3cqCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9908

On 26.07.2023 17:42, Shawn Anastasio wrote:
> On 7/26/23 10:32 AM, Jan Beulich wrote:
>> On 24.07.2023 17:06, Shawn Anastasio wrote:
>>> On 7/24/23 7:40 AM, Jan Beulich wrote:
>>>> On 21.07.2023 19:02, Shawn Anastasio wrote:
>>>>> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
>>>>> including an early serial console are provided by Open Firmware.
>>>>> Implement the required interfaces to call into Open Firmware and write
>>>>> to the serial console.
>>>>>
>>>>> Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
>>>>> 64-bit Little Endian mode, a thunk is required to save/restore
>>>>> any potentially-clobbered registers as well as to perform the
>>>>> required endianness switch. Thankfully, linux already has such
>>>>> a routine, which was imported into ppc64/of-call.S.
>>>>>
>>>>> Support for bare metal (PowerNV) will be implemented in a future
>>>>> patch.
>>>>>
>>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>
>>>> While I've committed the earlier two patches, I had to back out this
>>>> one. In my environment (gcc13) the build fails due an unresolved
>>>> reference to memset() out of boot-of.c (supposedly from of_call()).
>>>
>>> Does removing the `{ 0 }` initializer to `struct of_service s` on line
>>> 43 resolve this?
>>
>> Yes, that's what's causing the call (and removing, whether or not correct,
>> helps).
> 
> Thanks for confirming. Removing it should be fine since the code
> manually initializes all of the other fields of the struct. The only
> behavioral difference is that the members of `ofs_args` at indices >=
> nargs would be left uninitialized. This shouldn't be an issue though
> since we're guarding reads of the array on `nargs` and `nrets` and thus
> only read explicitly initialized values (and of course, firmware would
> do the same).
> 
> Naturally we can't avoid memset calls forever. I have lib/ building
> locally, but if we could get this series in without having to make those
> changes here that'd be great.

Are you suggesting I should put in this patch almost as is, with just
that initializer dropped?

Jan

