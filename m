Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A287C6E7F17
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 18:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523613.813839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppAHX-0000Ef-DT; Wed, 19 Apr 2023 16:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523613.813839; Wed, 19 Apr 2023 16:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppAHX-0000By-AT; Wed, 19 Apr 2023 16:03:43 +0000
Received: by outflank-mailman (input) for mailman id 523613;
 Wed, 19 Apr 2023 16:03:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppAHW-0000Ba-5p
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 16:03:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe9145a-decb-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 18:03:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8942.eurprd04.prod.outlook.com (2603:10a6:102:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 16:03:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 16:03:36 +0000
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
X-Inumbo-ID: bfe9145a-decb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR/qI7erq912LHe6FBh+2DNe0ZIoU3HSbpDRFhwADgh5QFLE47LahrbQKxKgmyrsc/cWGAZ8jPero8cjsfjaMogN9p+bR5Lh7rp79+MaZpHbY5lyOFRcpV/UW49H6DcknY9ZZZl2yE0RvILbUK+DsTC4rvc6EVjBI6iguW995+li3Rs8uqPV2HgpPSJULPJA/TQBBZxrqJJaCayx7KFrBN6wSbzwQ5R9PGBa6rFHJiyfBynaAJuYUJ+qIxfyttiITGlhiWeoA7dUDfWmwJfgeWkPmy8UKoA1VfQSrwcXnN9RK36k3jieoYs4l/qNcHg6tlHlN471Bl2y64AEefpp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTiADMqIJtFaQvtva9EyWgQK6SXimH726hZ7fGv33Jo=;
 b=BynraFVj9uaLPI2bKrvcF8sQXANQdK+V+Td4srsW+Szg3n52TxuukalzfzuQ5ediXLGXbeh9QqY0QwnMv5tF6sI4r9VbWecIJMLpQZmQfY7C0E9nDuRIFl2bFRng+FpJnYW+sf9OS2GU0uMf3VLarFpkDuLotWo1UkE7BnPPfdQvkp26c33yfK0X5DIOk6ffxDpV7i152g1qcgM3WFL6GdA5iK6rr4NHSW2k9TsO2lymaP3C1pse/LOhOvEMzucaFiPg+e0ZA4daSFoJlrc+XbsR+0rR6lLLus0Nc7z55jFZOTivFW1eIYaUqvaQMsb72oqx1PX7UNuozTwu61bjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTiADMqIJtFaQvtva9EyWgQK6SXimH726hZ7fGv33Jo=;
 b=0mHxrVf2tu69o2yXnoYPn6HThodihiRwX0ZQJQobrVZY+vlLnxxlXYhTRtjgUW8xvH2oAjbhgCOij/xUjDwl/ffHFGfqUynkcNVJVWvnv5nNKMeJwhZ3rzMRA+U/c64wBCzoAezN7V4dnHIo8M3eQXzG7ELcLI48MwwbUJ5sx6xKQyHDfAfsoDwJA6PzZf2b6q6z+xbTweHbT6h6OBpy4Cw0ulmpVjDudu1pZV9dAJCJAq8Y0ADE/4YH8SLgckIu6akMVFo49fJwjiW3MLZKZB3KI7FYRQG/o/FbKgASeH3XQkUqe/AhmaRe92dlEuwtcvkbCwLC1QrYyRfscokR4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <add420e4-cdaa-64dd-74ec-08244b9e238e@suse.com>
Date: Wed, 19 Apr 2023 18:03:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
 <d301e110-f840-a032-c406-2f7404752783@suse.com>
 <ZD+ljXSEPCmPMAtN@Air-de-Roger>
 <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
 <ZD/UMyeckvCq0ivf@Air-de-Roger>
 <86823b76-6be1-da65-7608-af391ff48978@suse.com>
 <ZD/uX1VqYchQ4GgT@Air-de-Roger>
 <4cfcaed2-21e9-a794-86b4-97f9b350c0d4@suse.com>
 <ZEAPgFiYZoeJMLqc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZEAPgFiYZoeJMLqc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 9354a200-b68e-4eef-9c55-08db40efa210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H5DRLGmvr46QVMecjji/xG1Dl6vgpG2tj3+GH8y+0/9BfFABX21gzjo8F2/fW4j0P+V39lAhpGxb28cdwTF2pEyWUs+VgYvn4m25fGxBc/qJtKrEPzwWGlFwDfZg2aQAc4QTPfoji9DS8VhVI/pZ7XMi89Od9RsI6yR92Ga0Kze2xE0K3M/1wOAteD3+O/xCjMs7lWzldYeVY5/JsQMg/9zMH9KIJhavxuyGlpvtfpHNi256EhRbemjYqmKyGUxvmcMFFOnC2JMwfL+qyWg2TshsFDtc1dONVaD3W2d/McqMJpoWhrUi2LJ4grMjLWkOADCf1B54giYc5WLbUmWgUFWce0AWUhmm1QQjEXWzLzy1GzJSaxU/bhd08ugEuTp+KzWfZRG75dW+b3uJb8BdURKXeACJRELtXJuKUQLhsfoMILAcesKZ7qYRO/6lpp2Krs6YK3eAicnl7/qdu7wArqjJ/s3UquwufqjJLTEKBicABpNQ5K5PHaeUiDyTJTcbn6ts+p8n4h7qwXHAbduhJclPQaepdPC6QApOnMrrUy+URBRfUOjIe5R0ayk7gaY5zGiM5xv9F47ZhBm9wIN+Y12nDGbA86fTS2PLzqyL+1kKBY3TOhpVgMAe8FmWrfJ0DwYok5TqyESOnI3k6O/cXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(5660300002)(4326008)(86362001)(2616005)(31696002)(83380400001)(966005)(53546011)(186003)(6506007)(6512007)(26005)(38100700002)(8676002)(8936002)(478600001)(110136005)(6486002)(36756003)(41300700001)(316002)(66556008)(31686004)(66946007)(66476007)(66899021)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFAvd0VmYit1czkxQUhheXloUmRVWWxoRU9lOWJ5UnhwOWp0cG5jQ3JiazhE?=
 =?utf-8?B?MzBqSDV2YzI5TVV4RkozaWd4Y2NQaUdIcGV6dXdZYkoyZDMzcTBkazIrMGRp?=
 =?utf-8?B?eE1icXFMZVN4VytMSTZ0T2I0ZjEvTDc1VitNb01UWm1qaCtJUXZyRWZRaG5L?=
 =?utf-8?B?OWJNNWx3OHNoS2tPL0JXMnJnK3V3SUVFRStUOTNFeVllUGdBOTRXcHJ2NWZ5?=
 =?utf-8?B?TGJpeWRUbENTSFFqQ2g0akErOWN5V25RNXVocm1CM2dUT1FZT3hNUjR5ekx2?=
 =?utf-8?B?SXhaR2U0WG1vWkRlSHRIaC9xeWw5bDJudWRlT2NBak5WMktnVDQvZ1JhRWxC?=
 =?utf-8?B?dHYzUUpYSHYvVnZOZlN5SzZLNTBDNkV5YlA4aG1uZzR6Skw5OGJudHBOVGov?=
 =?utf-8?B?aDFhWEZaOTBrVVEyRGcyZWMwVlBNblJrdnpEaml3S1dyeTJ4Y08xWlU3TzVn?=
 =?utf-8?B?MFhDenpmUEhjMHIycTVpVlgwV3dyLy9FaDZCN045Q2VsM3E1U1hiV3pDUXBv?=
 =?utf-8?B?OFV4NkJqemVJYjZLWmR3eC9CdG1sRStkc0xFUms0ZGNjclRmQUhDTnFhbmxt?=
 =?utf-8?B?WjhxV2x2RmxYOG43TEdHcFE2WUM0cWM3blhxVC9mbUpFbnVJdVFlUE9MUjhq?=
 =?utf-8?B?SjRZcHM1WkZQUW9COXJkMEt0QlFwSmJNZHJRMHJZVC90SElzQVE2ZkcwNDJD?=
 =?utf-8?B?VHlyRityajR2TTdLK3hCRE9HaW5NemQ2dmxBRkFxYkRHQjRBbUxLdit0UmtG?=
 =?utf-8?B?aE1mTk4zNmNzSEd1aGo4dFB1RDJoQVZCenV4V256TVNBVEJRTlBCWTkwbjNF?=
 =?utf-8?B?ZTd5dFBNL3VNN3ltZVBVR0o1TTN5cHNaUWhMMEx3RDhRbDg1YWVEbjc1bW14?=
 =?utf-8?B?d3ZpUXJpSWJJRjB0MXRBeFRybmhRcFRYMHdFZHBkTkJnalREWlVXMUF5M2Ur?=
 =?utf-8?B?RmdsTVBpVEZySVJac3h5VGVBQ1ByYW9mMkoyNnRuY1FMSVRjUURwcmR1QVEx?=
 =?utf-8?B?MTIyRDEwNXd2eUVBSVVmWEVaQkZaaUlUTXJwUkNFeWd6b2NvRzUxVlRCQmxu?=
 =?utf-8?B?SXJHOThpbTljV2dwQnovYVJ3YXNOQUczaytyK2k0b2U5YmRmbmpYSk55ajVR?=
 =?utf-8?B?VlR2NTRXZkZVV2Y1M3k0cnhXTjVINSt1MTRBKzkvZFlXc1FjMEFkY0RZUTRN?=
 =?utf-8?B?Rk1OaUJZSjZ5U1pIc01ZVmFLdE5IZTUvdkxHdmhtM2ZDZ0dDMjYwVytkcyt2?=
 =?utf-8?B?aGpmcStjUytzR1RSaW5kMGFHZmlZN3lBVHlMQndGZFJPZGkzeTVBOGNlR0lQ?=
 =?utf-8?B?bTc1bERkbWVhVG1EM2xCUFcySTNGZUJvUTVNTXJ3VXlhVHdCQUxVY2tlb0dl?=
 =?utf-8?B?bXdOWE5QQ3hXNCttNGMzY0NmTHlXVitvUURGcDc5cHczL2xnemdPaFNET25N?=
 =?utf-8?B?VUN3SzI0OFpDVDRVQlkxWjBWd0ZkM2VBM1duTDZCejVZMmJtbTVjQ0NzT0lG?=
 =?utf-8?B?dnBpYjBNUGxrbVRDcUpmc0RQNEM0M3k1WG5Vd21lSTRUOUJ6TnhCeFJleTRR?=
 =?utf-8?B?QWJWNG5HSUlKRW0vWnF2dlBybzI1OWtCTzBldW1MREZaRTArdUlOcjBwcnlD?=
 =?utf-8?B?Mjk4K1RTeWgwYnVMSG9QeWQrclA2S0RoaTN2MWh0bEd4VkwvVzF3dDZQdngx?=
 =?utf-8?B?UWwvOWIrMHYrbGRVMHdmeklsSjU5Wk8vT0lLc2ovbHJXRThvZW5QWEFQVzY5?=
 =?utf-8?B?NDRlVmJnTEN3WHJURDlTMVQweW5ndkE4ZWhIWXM0UGlsb3g1MC9CYjNBenBz?=
 =?utf-8?B?Vnh3TlpkRXR4SjhNYWkxRmNzK09aK1haYVYyTHhjMFdRQ3M3WmM3bnoxcGJS?=
 =?utf-8?B?UXdnaEFlNWk1ZU1mNVUyM2RjaVFQOW5Cd2lVaGxscHRjK1d6bitwNHQvTEt3?=
 =?utf-8?B?SjJkTTNlZFFHRHFYUG9TK3RpKzZ1U0ExbXZ0VS8xeWI4Y2lTVSt4MzRId0VS?=
 =?utf-8?B?VXJ5VUNCdWFqSTFYWk1ZZ3ljajJCSDNKYzkya3lzVUlHMm9mdTB6Q251SE1t?=
 =?utf-8?B?QWRaWjJ0SkJYTUg4ZVNTN3lVTGdwQThZTXVteUMvTTZhV0xCTDI5aW5LbFBB?=
 =?utf-8?Q?5haRNnS7TRGiz99bu0snKOVsf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9354a200-b68e-4eef-9c55-08db40efa210
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:03:36.5330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRZIE6+1r609sXKkoYKDLK+51YmEZcsl+QCG6F+4ZSCHwIKDP0bJg1RQ0k1PP4HimQvpGgaI86MBi8+w+nk/kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8942

On 19.04.2023 17:57, Roger Pau Monné wrote:
> On Wed, Apr 19, 2023 at 04:39:01PM +0200, Jan Beulich wrote:
>> On 19.04.2023 15:36, Roger Pau Monné wrote:
>>> On Wed, Apr 19, 2023 at 02:00:38PM +0200, Jan Beulich wrote:
>>>> On 19.04.2023 13:44, Roger Pau Monné wrote:
>>>>> On Wed, Apr 19, 2023 at 10:43:22AM +0200, Jan Beulich wrote:
>>>>>> On 19.04.2023 10:25, Roger Pau Monné wrote:
>>>>>>> On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
>>>>>>>> On 18.04.2023 15:06, Roger Pau Monné wrote:
>>>>>>>>> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
>>>>>>>>>> On 18.04.2023 11:24, Roger Pau Monne wrote:
>>>>>>>>>>> --- a/xen/arch/x86/include/asm/config.h
>>>>>>>>>>> +++ b/xen/arch/x86/include/asm/config.h
>>>>>>>>>>> @@ -44,6 +44,20 @@
>>>>>>>>>>>  /* Linkage for x86 */
>>>>>>>>>>>  #ifdef __ASSEMBLY__
>>>>>>>>>>>  #define ALIGN .align 16,0x90
>>>>>>>>>>> +#ifdef CONFIG_LIVEPATCH
>>>>>>>>>>> +#define START_LP(name)                          \
>>>>>>>>>>> +  jmp name;                                     \
>>>>>>>>>>> +  .pushsection .text.name, "ax", @progbits;     \
>>>>>>>>>>> +  name:
>>>>>>>>>>> +#define END_LP(name)                            \
>>>>>>>>>>> +  .size name, . - name;                         \
>>>>>>>>>>> +  .type name, @function;                        \
>>>>>>>>>>> +  .popsection
>>>>>>>>>>> +#else
>>>>>>>>>>> +#define START_LP(name)                          \
>>>>>>>>>>> +  name:
>>>>>>>>>>> +#define END_LP(name)
>>>>>>>>>>> +#endif
>>>>>>>>>>>  #define ENTRY(name)                             \
>>>>>>>>>>>    .globl name;                                  \
>>>>>>>>>>>    ALIGN;                                        \
>>>>>>>>>>
>>>>>>>>>> Couldn't END_LP() set type and size unconditionally? (But see also
>>>>>>>>>> below.)
>>>>>>>>>
>>>>>>>>> I see, so that we could also use it for debug purposes.  I guess at
>>>>>>>>> that point it might be better to use {START,END}_FUNC() to note that
>>>>>>>>> the macros also have an effect beyond that of livepatching.
>>>>>>>>>
>>>>>>>>> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
>>>>>>>>> find START_ENTRY a weird name.
>>>>>>>>
>>>>>>>> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
>>>>>>>> I take it that you're aware that we meanwhile have two or even three
>>>>>>>> concurring proposals on a general scheme of such annotations, and we
>>>>>>>> don't seem to be able to agree on one. (I guess I'll make a design
>>>>>>>> session proposal on this topic for Prague.)
>>>>>>>
>>>>>>> Oh, I wasn't aware we had other proposals, I've been away on an off
>>>>>>> quite a lot recently, and haven't been able to keep up with all
>>>>>>> xen-devel email.  Do you have any references at hand?
>>>>>>
>>>>>> Andrew said he had posted something long ago, but I didn't recall and
>>>>>> hence have no reference. My posting from about a year ago is
>>>>>> https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html
>>>>>> Subsequently Jane went kind of the Linux route:
>>>>>> https://lists.xen.org/archives/html/xen-devel/2022-08/msg00236.html
>>>>>>
>>>>>>>> One thing needs to be clear though: Macros doing things solely needed
>>>>>>>> for LP need to not have extra effects with it disabled, and such
>>>>>>>> macros also better wouldn't e.g. insert stray JMP when not really
>>>>>>>> needed. Hence I expect we still want (some) LP-specific macros besides
>>>>>>>> whatever we settle on as the generic ones.
>>>>>>>
>>>>>>> The stray jmp can be inserted only in the livepatch case, if we end up
>>>>>>> having to add it.
>>>>>>>
>>>>>>> Maybe we should just go with Linux names, so initially I would like to
>>>>>>> use:
>>>>>>>
>>>>>>> SYM_FUNC_START{_NOALIGN}(name)
>>>>>>> SYM_FUNC_START_LOCAL{_NOALIGN}(name)
>>>>>>> SYM_FUNC_END(name)
>>>>>>
>>>>>> As said in replies on the earlier threads, I think these are overly
>>>>>> verbose and come in overly many variations.
>>>>>
>>>>> Right, I would only introduce the ones above and as lonog as I have at
>>>>> least one user for them. I don't think there's much value in importing
>>>>> the file wholesale if we have no use case for a lot of the imported
>>>>> macros.
>>>>>
>>>>> The main issue with ENTRY() and ENDPROC() / ENDDATA() is that we still
>>>>> need a tag for local function-like entry point labels, would you then
>>>>> use PROC() for those? ENTRY_LOCAL()?
>>>>>
>>>>> I have to admit I prefer the FUNC_START{_LOCAL} for that purpose as I
>>>>> think it's clearer.  I would agree on dropping the SYM_ prefix from
>>>>> the Linux ones if there's consensus.
>>>>
>>>> Okay, I'm glad we can agree on no SYM_. But what value does START have?
>>>> And why would the type be (re)specified via ..._END()? FUNC(), DATA(),
>>>> and END() ought to be all we need.
>>>
>>> Does it imply that we would then drop ENTRY()? (seems so, would just
>>> like to confirm).
>>
>> Yes. ENTRY() may not go away immediately, but I'd expect it to be
>> phased out.
>>
>>>> The type would be set by the entry
>>>> point macros, and the size by END(). To cover local vs global I could
>>>> live with _LOCAL suffixes, but personally would prefer e.g. LFUNC()
>>>> and GFUNC(). We could also limit ourselves to FUNC() plus DATA(), and
>>>> have (non-)global expressed by END() and e.g. LEND() or END_LOCAL().
>>>> One less macro, but maybe slightly odd to have the .global directives
>>>> then at the end rather than at the beginning.
>>>
>>> Hm, yes, I do find it odd to have the .global at the end.  FUNC and
>>> FUNC_LOCAL would be my preference, I do find {L,G}FUNC a bit
>>> confusing.
>>
>> Well, yes, I was expecting this to be the case. Hence why I said I could
>> live with _LOCAL suffixes, even if they aren't my preference. What we
>> may want to keep in mind is that sooner or later we may want to have
>> non-aligning variants of these. That'll again make for larger names,
>> unless we went with e.g. an optional 2nd parameter which, if absent,
>> means default alignment, while if present it would specify the alignment
>> (which then can be used to effectively specify no alignment). E.g.
>>
>> #define ALIGN(algn...) .balign algn
>>
>> #define GLOBAL(name)                \
>>     .globl name;                    \
>>     .hidden name;                   \
>>     name:
>>
>> #define FUNC(name, algn...)         \
>>     ALIGN(LAST(16, ## algn), 0x90); \
>>     GLOBAL(name);                   \
>>     .type name, @function
>>
>> with these helpers (and count_args() as we already have it), or ideally
>> something yet more simple (which right now I can't seem to be able to
>> think of):
>>
>> #define ARG1_(x, y...) (x)
>> #define ARG2_(x, y...) (y)
>>
>> #define LAST__(nr) ARG ## nr ## _
>> #define LAST_(nr)  LAST__(nr)
>> #define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)
> 
> Would seem acceptable to me.  Would you like to make a proposal
> (likely updating your previous patch) along this lines?

I wouldn't mind doing so, as long as there was at least a vague chance
that this also comes somewhat close to meet Andrew's expectations.
Andrew?

Jan

