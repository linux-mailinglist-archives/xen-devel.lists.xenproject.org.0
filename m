Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E06BB409
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 14:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510049.787023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcQuW-0000f5-OY; Wed, 15 Mar 2023 13:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510049.787023; Wed, 15 Mar 2023 13:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcQuW-0000bl-L0; Wed, 15 Mar 2023 13:11:20 +0000
Received: by outflank-mailman (input) for mailman id 510049;
 Wed, 15 Mar 2023 13:11:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcQuU-0000bf-T1
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 13:11:18 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddfe0eff-c332-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 14:11:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 13:11:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 13:11:13 +0000
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
X-Inumbo-ID: ddfe0eff-c332-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkZjILPDxqeBgn1FtCBvaYvVGvoLzWy0IZy6QWJ+I7yG5gYXCtHODc0Nl2Hmi1u++Umf2BhugAIjBPSPryAqvbQIYLsKfzvIrRwFP9wTJAHZr0mygQmnf9KXhPKIwHE8plA/ywlQsRrZzBIm/jG89G/kuTKDeRf8p4VwhzY8v1WINRsTTGiCLER1tqIGt/nRTzPO0HHoFPX3isP8w5KIcIZH12ISW87vHqDHgS6z25hrGQ8v8E7UQQCVp6Cx/sO2/WbfQ/royeZfevLjMjRJoj8XgRdj7YjWk2+Y6Wj26JlMW5iZFGH9wunmfwhfEM/fzcJ8N8aybAxMRq+9ae/cOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBwXD6E2Z8R894di53fgXpLAR/qTALMxrCUPujuCOEE=;
 b=BU5RzcbhBvP7udjygEz2ZTBS9RYX561bg6mUWdc8e2Qz5zm9eIxCsZ/8qFwb3gWUGX1HU4VIS4pXd/qzyWaWMn6fJp8y4dJHtUrVdflp/M5BeHfdnrNSBsq2Yol296XUHhxqQDzlYcbFK3DtszV7a7Suj8Rs/HbAL8oPLGqd63XDCumhv3xOLTqNxMbweWVspLBchUqQ1+uvamUOIm78UjNR5lznT8LTO1FMUze3msqS5GAJ1G4Q188stcMWY7cWzyYmr8B5i33jmdaUE1EDdQnaLXzkXmXr0q9kbhZk0X8PhrgDw83Y8/Gp0lq+5YLnSelLgcnh4Y8XybixRt9EuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBwXD6E2Z8R894di53fgXpLAR/qTALMxrCUPujuCOEE=;
 b=wD9EJ9s6DfRIkxKmEeRmzwzSLh/OPFl0eOCwOUwgj7pgb9+IXIw0NlGri5kyp4eg7ufbi/r3dCz88oK4nPfOVrt1dHqm8+3DP1Fkdk5k6mOol9WL2LQ5qb0UVVEH9eLVnjGweHnx61nE7ADIZlhbAo3klTX5Yg+5Q0dBvHy5pvZZYo5IoUjuKDuuvjLCc8AgxWqYD3OtdwCocIMn5K/0Z5wGK1WR1WewX93a4wmppRUkONIkBMvrAoSJiNt3kZcv7Dur2ScwTscyC0dg1xGB6Qwe/qXUP+UW/pHgtdCLbj5yfxa0/Xhgwk547bOyk3z+O1xUuHQ3lU+k7JLWYCsyxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <737fec84-42da-3b9b-6cb5-d18406925403@suse.com>
Date: Wed, 15 Mar 2023 14:11:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230314142749.8845-1-michal.orzel@amd.com>
 <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
 <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 504dbe58-e293-4b19-da84-08db2556c0d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TDPZvPnsJJ9g7jy0GWTLCCfL2FRgLZfrn7RUbgui+T98RO90DvYoYu92uleghFKM82mELIbeQNl2eXuv8u6/RmXH8y0o21mC6xliIhjEBAKXIqthzRvY3BzC861LBx7NayzXhR3F/LqXAQFC2/n/SV812OVlXfOCilZCG9oswe98ruw0e8hvTC2oCy/om0eHmrEskgFz1WdVcms18Yxze5PLnlvveNNquGt5ZlgoAhuoZaNvAm8eUxk6X49zcHMxu+rt4by/zq7vrBST1Ygp85cc5T6gvgiNn+ffyG4p16Rhh1477b2MWj9HMHzmmA7xp7mDY2QxYiW1vJAnvbo/EBCbaOSv5evB9vtBJExV8URxct84ecba5n2z5Vk60sCMbenObSDN6HDf+CRu9DlcEAgtEdP46Q5AoVPjIZ/2+Jt1elMgs6ZbMkzDVHF31giSXoycxcZ5ztjHezojgUOo635WtMw0k3NtigxzLfXO67BFRKY/YSn9zCa90agQNKqxtWQD733lwqFTIXl2rYV2MnemaXStlJnMm0NqfK9weW9+aLjQQKykNqghjZM9EB3JXcf+RPEvvP21MoQPm6uPUqL5of9oEQGJOoK2+Nd/qJXX1eu6OKNErKE1kDTDqS+XlypJ7oQeENj+SV1gk+aVsP+JKLNmeh4uCIYLuGfRXG87gV+FWB6Iz4ctHfP3sxmIMVxhH4E0qOCHeAUsdY6KQYhrEAKGZDTbg0g3fLiCvozSgI0b68KugdBvRB3eaIS/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199018)(86362001)(2616005)(66476007)(6486002)(66556008)(66946007)(41300700001)(6916009)(316002)(26005)(8676002)(83380400001)(5660300002)(8936002)(186003)(54906003)(6512007)(478600001)(36756003)(4326008)(6506007)(38100700002)(53546011)(2906002)(31686004)(31696002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWUvYU92RWNKUmRwYktYK1RGVXZnekJMS3M3TEFsUkdvOENSVG5WUno5cDk0?=
 =?utf-8?B?TDJLMW1obzdRNG1SdjI5WTl4YTIzYzg4bkFBY0ZVN1pkelJUbFlzMEdKK3dZ?=
 =?utf-8?B?elFLWVk0VWRyd0ZKY1FrblZGcCtHMW9ub0sweGp3YTEvU0k3TW5MQmM0UGpP?=
 =?utf-8?B?U3lrNWFwWG9QaFU1ZWVSWXJQMlV0OE16ak1QL21HVUw3ZE8yTHMvZE1jL3Ey?=
 =?utf-8?B?Y1VEUnlHcDE3Zms0OGNlNHVLYnVzd1NXQ0w0azBNUmdBMVUrRXMweEREZEw5?=
 =?utf-8?B?ekxKcVlySHY5ODBkRGpvbVpjWDlibDM1YmlpZ1NhOXpQaTlHLzJ5WmQxUzdD?=
 =?utf-8?B?QVJ5blpOKys0SEN1QjlySTczU2YyUng5RlJVYXJidHB4cjdtNHhOMVRpbjMr?=
 =?utf-8?B?NUFremhuTTQ5YkprQ0JxYUtVaFJPdmY1K0tTT011c1l3Q212NWJQd1FLSFBh?=
 =?utf-8?B?YUp6M3MzSDBzQ05DVnlXVHB1T1dENEt6dGswMDd1SFRMbkxkSW1xZ1EyMWtU?=
 =?utf-8?B?N0taaGlrQzdoR1UzNzRNZlE2dUNrYUw4WW9IL0IxL01ub2NKbS9ocVgvb3Aw?=
 =?utf-8?B?eThLYnZ2NHV5bzlvY1dxcDc2ZVhtVDgrWnZNQ1k1NnBrRHZEMnZFcEZKZEgw?=
 =?utf-8?B?TFcwZnI0UjlodnlVMjBGYzN6VUZkWWdCbk9SRTFnazVtd0paUUROVC9xbnUx?=
 =?utf-8?B?cXpjeWNOM3l2MzdGeFp0aFgyN0NhUE84R1p3U3VlWkxFMWNzejJPQUt4Y3Fa?=
 =?utf-8?B?clJueURmYVZESU14UThrQ1FGSm5lYVRXd0craFBER2FBQ3MvQWxQczdEdkxO?=
 =?utf-8?B?NDF4a3ozY0V2Y3M5Q0FaVzBMSnJvMUhseVREbnBKNEpkNkt6a0h0NjVuVi90?=
 =?utf-8?B?R25NVDZnS0F4VUZDY0xKbUpOUCszT2hyYzJIZDZkWGhCOS9obk9vWUJsaGFm?=
 =?utf-8?B?WjdzV2hYbzlNMkNEQzVoMGYrSUpWbS9haG5TWStWVVBrMmtuR2ViWUIzRWIy?=
 =?utf-8?B?c3RYMGpPYjg0ZHhJTXg3MTA3TzgvMjlVRVU1bTNINEJwRTVrWVdId2Q0ZS8x?=
 =?utf-8?B?L25hbCtFVTdiUjdoa0V4TzhBT2U4L3lDeHRmMkZsb1dFTmFKTGF4SG05WW1F?=
 =?utf-8?B?UFZvd2x5a2I0aytuRys4NHo4b0J3UXByVGtuRkNOZnp6K0dCTjBnRmhOaXdY?=
 =?utf-8?B?aVBseWNUQU9OWGVpaWZWUXE1M3AySFpEZ2hPK1FVSGpkODI3R1kxN0tvR0hV?=
 =?utf-8?B?YjQzUlZaVFMvN1diSTNXT3NnTkFRelphaUp3elgzblNCZGcwUXBKZVRwNWlj?=
 =?utf-8?B?eE9ORVlEcTd1OFVuUW1rUGtjcXdLRDN4ZDg1aitrTW9hTGVBNWsvUUg2clpi?=
 =?utf-8?B?alViZEF5dDJRSnhPVDhoaE9NSVlaRHI3aENTd0YySWdlQXE2cjhGdDdUSUZs?=
 =?utf-8?B?a25OalB1Y0xlSzNraHZWY1lhL1kyVHFxNWoxQU1pcGVGWnRwbGkrRk9XZ053?=
 =?utf-8?B?STZtd3NjLzhGLytwSThUQ3RhVDArUFF2bmVrQ0lzMFhGSlk0d1R3VS96V2lT?=
 =?utf-8?B?NE5CeExHWHo3Q2xPa2FQeDNPME9jQU9ZSjhGTHZ6TDhyaVhkNnBhdm1zSHBl?=
 =?utf-8?B?N3pZelBPR29tbk9WZjVMYWpMQ0FsZFpwRG9lUGxYUHhXclhmTHY4UStBbGNC?=
 =?utf-8?B?R2EyNE9LZUc5UnFzSkVrQ0crTk1KK254RmR2a1VwcGw1V2ltWjh3NU5DeFdl?=
 =?utf-8?B?VnY3QXVRckdYWlQ3cExZQ0x1akY4WFpySUJFd3BWWDM5OUFDYzdaNWt5WTNC?=
 =?utf-8?B?eWs2L2hIYUF6VWZWMG0vdVhlajJLdkVzYXZVMFpQSWVGNE5Hbng3MnJwc3No?=
 =?utf-8?B?WVdMWUZXdzNXUDY5d2FReU5YVDd1aVpXVmJvcEtCNFA3NldaVEpqM3hPUnl0?=
 =?utf-8?B?aHA4OGRPaytSRzJRMDU1eWc1NTNLRUkzbzlsa05UenZZNGdXcjhzZC9PRnUx?=
 =?utf-8?B?Tnl6NFRHTVJhSEQ2ZGlSb2EvS3lIMC9Pa2E4QXpKMG9hU2dxTFh6YklQU0Vm?=
 =?utf-8?B?R3p0VWZpZmE0RGZaYlhobUR5UmR3cyswbFRNTVZLNWk2d2kwdENsQVB4ZGZK?=
 =?utf-8?Q?3gqEMinevqeGBVd9M3yYmN4uR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504dbe58-e293-4b19-da84-08db2556c0d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 13:11:13.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3NITEUqkMQbJorwferltcwhmwNUcf6FmGxsGA9sbhGzOFcLlljsn7hACHr5kRG7SSLNIA3OINh0o6/ydMDH6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684

On 15.03.2023 13:34, Michal Orzel wrote:
> On 14/03/2023 16:17, Jan Beulich wrote:
>> On 14.03.2023 15:27, Michal Orzel wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
>>>      else
>>>      {
>>>          console_rx++;
>>> +
>>> +        /*
>>> +         * Skip switching serial input to hardware domain if it does not exist
>>> +         * (i.e. true dom0less mode).
>>> +         */
>>> +        if ( !hardware_domain && (console_rx == 1) )
>>> +            console_rx++;
>>
>> The consumers of this variable aren't really serialized with this
>> updating. That's probably okay-ish prior to your change, but now
>> there can be two updates in rapid succession. I think it would be
>> better if the variable was written only once here.
> ok, makes sense.
> 
>>
>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>
>> When invoked from console_endboot() this will now switch to Dom1,
>> i.e. that domain becomes kind of "preferred", which I think is
>> wrong. Instead I think in such a case we should direct input to
>> Xen by default.
> Switching serial input to the first usable domain is the major motivation behind this patch.
> The number of times I got pinged by users with *apparent* Xen issue on true dom0less
> just because input was directed to dom0 which was not there (not everyone seems to read the
> boot logs) forced me to create this patch and manifests that this is not the behavior user wants.
> Switching to Xen console would not help at all. Also, we already have a way to set switch code to 'x'
> to default serial input to Xen.
> So I think what I did (switching to the first existing domain) should be the default behavior (just like it was done for dom0).

Well, I'm not going to stand in the way, but if one of several supposedly
equal domains is to be "preferred" in some way, then I for one would
expect justification for doing so. If that's the route to go, then the
patch snippet you provided looks good to me.

Jan

