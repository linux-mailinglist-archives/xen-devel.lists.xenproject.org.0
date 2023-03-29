Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E586CDBBE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 16:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516282.800162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWXz-0007dE-Md; Wed, 29 Mar 2023 14:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516282.800162; Wed, 29 Mar 2023 14:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWXz-0007aZ-Jl; Wed, 29 Mar 2023 14:13:07 +0000
Received: by outflank-mailman (input) for mailman id 516282;
 Wed, 29 Mar 2023 14:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phWXx-0007aT-8Q
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 14:13:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1085fc5-ce3b-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 16:13:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 29 Mar
 2023 14:12:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 14:12:59 +0000
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
X-Inumbo-ID: d1085fc5-ce3b-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0HjRaqs9hBf1Z2Pi3feSeWSKkdpUBIQ2tBzfAe86evdAOoY1wBsURVdPaJyittv6kVG+noWN512VPbm4T2+NQhuQsxs9NrzIdyBbmPPXJhUFjQexoh64gVVnYnUMXjw9Fws54mQVm/Jjttm/nasDFRydJH6BwYgFkpMOrob0HOLNXHxywb3dE2v/69HWryeFxt8mVTuPTA1Hj1giPKLLhL6Gt7znc+pXGW90B20GSCVhZ63E6OWLg3CIVlp4ljVNdylvfjYMN+8O8E+VXIEHGDyIs4v/RJCR1B5E+NAVX1mH5vwiZ85+KirVv7k4QC+v513BM+W0GwgiI+AHmzKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBtAeFoGBgB6X6C/UjpTqT4lSAbFKF2yQ9jl3O4F1KY=;
 b=b/dg/XdGoTRRI12IxKAhe6WfjDgrldkr/zksQuMfmKzUNsk8l5aUtahSxEcHIoDVa7G3ncAd9XgSKbQMdN7FcV1xDWfeCXzTYG2vXBG2tVwZotqlzt3oWI4EpH+Ql5UzGh5ktchIxOYcZXSBaaXC59OCzahKY8NFHVwdArFVFZXcPE3teDS2H/1kCN5XGoANqFeKmJ1UfOh/a4Ke0cFC+aFl5tpsIQwr2LPtWSpcwcZ534Juqtt2qFl+zFx3l6GxPaJtylqGULyMukjWzE8RGRjYqalhgVgZatykJjfwW6ljNX9z2EUEGohF5fH6BzC62thUQWGjrqASEYTCIiAaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBtAeFoGBgB6X6C/UjpTqT4lSAbFKF2yQ9jl3O4F1KY=;
 b=RHXoeeTmeW7ZvVPzz4o4KG8XpSXCtC8h43/2Mn67qhP8qwOH+1cTKI8ANkNFgzMN7UEU9YaG/HO9cu7fQ+J2bkzhcYO8o4XtFFSYvRC+VeqelvJMliZOXNxGKzBaBCsULw2bFXF60njktB6UicV9nG49/usAy0+2pHbuHGqkwweZbqng1j+z0T3p6f0OVeFzV5flnjQ9YwuJuQN23Uj4nNhVxC/PXC1mIVSv4nAKL+JbF4W2h92y3tyNJrXEnGFHalN2y87DI4TXKskbGJtB422jX66bmwT9n2u/Y3SpTfTBtrOonD5EPcXPqOhgOd5C2Tr+WflXbVR+zMZVbgx0gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9cf8a791-6d20-bfd6-dd74-2473c4606b65@suse.com>
Date: Wed, 29 Mar 2023 16:12:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
 <e238bffa-5eba-b18f-ed73-1c5c9730cf70@suse.com> <ZCQYLkoSfZ7klmNC@mail-itl>
 <2c689aeb-db4a-f2a4-d1b2-31f1283c0de7@suse.com> <ZCQ8vmkqvyH/KJEX@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCQ8vmkqvyH/KJEX@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf58263-af0d-482e-5dff-08db305fb362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uRgYoWmJFGsuuGnK9xh/p2LgztagvVfYXOS2pP7pn3YwYuKkoHxiWdoZBRoqF1DfB+uq40eB4iWtrBvIzb4Pgki8lr3HJT7yiyw1K2BH7970h6DOCBxELI9Sfn9ucDm6eVub7Oka/xkYi+5FDVjdj0Cm1WltGW7l59RX7Tk2IKEQi1grezQl7rmlQtPZwixWBB6voSgWpCKaaGQkyT97f6+QVncb0SvZPPUQvRY+yWseNrNlwBTkrI+q0jj6+wmzsXS2t2wxr94Z7bod41HM2zuI0BrzcA42B2ZlKUZYiH7ZNOt/i3A/r4dMtqTgi3SPa0hvgFu9aBsmpEWZljVwPdxP4k73IRDZpiAjlJdZX1/j28nV1zGT0wiMUcC5ZdUSDpL7z4Nmzcx4IMFM6j3fKAlVoeHIn2GMLWxLZNNTOINjgm5QnqEOOD0lSEpXv0kDnJ46hNyDrDkY4fH/feGGotuIaZn9krm6fjaljn2fHjGfg8H4FXRn6MOOtZjeTFqhkpi04ZZhRcQWrV7t3EK7CWWjhW7XWabw1tVRkFWgmLIfV2ZyTvliVr3es6e51npQ4Au2XRFMdzBmEMozOC3e1yRycS+In1vW5K/XrfJiGjH7V8kCwTZszqDcIvQQCb14ljiW6A0qOv/SRYNQsm6MmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(66556008)(66899021)(8676002)(86362001)(2906002)(31696002)(26005)(8936002)(66574015)(6486002)(316002)(66476007)(41300700001)(36756003)(54906003)(478600001)(2616005)(53546011)(6512007)(38100700002)(31686004)(5660300002)(66946007)(186003)(6506007)(83380400001)(4326008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGFWbU5mYlgvOHYwcDRGekVBVnE0djFaMTEzZTg1Rm8wYnRTYzAyeVdqMkhI?=
 =?utf-8?B?TjhjRHdHK0VRZ0FwTWtVdnlMWHE5VXJrbHlqcVoxMkZKN3Y4MmtSbHd5OVFt?=
 =?utf-8?B?SXpYZnRUbXVpbThRUjd5R3UvRWNZcFVCYXFlQnZmRXpwU1ZjdTRmbTVMd2Rz?=
 =?utf-8?B?dVl0M1NaRlZvZzB4Z2cvRHUyRVpFVlRYL3FybFp3Tmw2U0pic29vMjRBYktL?=
 =?utf-8?B?QXcrbXdicUdybEhKR091UzlZTHVkdkVWZExsNit5NGRRYTAvMG5yRjRpanpP?=
 =?utf-8?B?WFZhUDBFa0RCR0Z0N3VtWEdGUElqV2xEYng0VnorSEtDSndGMzNNYks1MzJm?=
 =?utf-8?B?RlVCMVdiVCtoTXgyMTNacUFwRU4yMkg4ZGVtMGtNREhOazRnMjBlbFd3NGxY?=
 =?utf-8?B?TzloUEZwNUhldi9LMy9heDRNcFNiNWZsRWhEdm92c3BoNWgxdk05OGI2SUE4?=
 =?utf-8?B?a0x1RVBwdE5UZldhZndveHVTc3JRWXdHWDhuY29sSVRPTjhEamxzZ3huMUlJ?=
 =?utf-8?B?MlJmTXJMZjNtd1o1RjJzdDdJRHh4Wkx5c3NUTzFTUmJsYVIrOGRZTE5BUGZZ?=
 =?utf-8?B?aUFyMnVWZTl3N1pwV2h6blp3aDRuZHdHZHNMZVNybGtaUnZxQ1h1MkpWNzZK?=
 =?utf-8?B?TDVqK2xQOE9HbVFGeHpqcjlzRERBQVlSaXkrMlVCRkhPaGlPWDloaU04ZkF6?=
 =?utf-8?B?VTBPM2lYbkpPTGN6MEdpQXYrOGUvQ1poeTQrMi91NG9WTHlPdTIwTG5YSjk4?=
 =?utf-8?B?V2p3RDkwNnc4dTl5akJ4TjNUZWkxbE1ULzVpRHh4aUtXSkxWMG00YzJSNmVn?=
 =?utf-8?B?a1ZpeFZMMWVrdlU1ZGVLT0IxZ0xKNHpYRDdjdnJjM1JjZGFtYk1iK1V3RGds?=
 =?utf-8?B?R0JBT3oyeHM4U2lINFVndUFsTGdjODVDVkRVaTFjOWkrWWNWck1HTGIrSWtJ?=
 =?utf-8?B?Qmw0anI0SzY2N3NpL3RZWHdkakVOS3NFNmt0QUJLTlFKT0hXOTFpQnBsbTZB?=
 =?utf-8?B?V2dBVFowcFVUSis5S0NiZXErMGtPR3ZKOEJKejFweUpac2VYaE1aSDlGVzY2?=
 =?utf-8?B?N3I3cnRXTUZyWGVYZFI2T3hzbTRoSFh4T2QwQlRFUnZ3c3BkOGk0dEZuVXNq?=
 =?utf-8?B?WVJtWVVrRDF3M1VpNVhFa2pSSlppTDJtZmhjeHBWVW1pYnBXYVZRcncwaG5u?=
 =?utf-8?B?TDk1Z3AwT01KZDJnRXllVGtpYVo0RHN4OEd4UzEvMHpHa3J6azNjcHMzT3RZ?=
 =?utf-8?B?YUUrZGwzSHZ6ZytTVUlINkVvZzhxdjh1K25hdUVwSXVlZElCL0ZHWEdFeGZw?=
 =?utf-8?B?RHZFN2tsMUVwMkV4RVVlc1JuMVpsVUswaWphdGZGLzR5Z3pQYVlIcjRCUVlN?=
 =?utf-8?B?MnJuS0JGQjM4cEkxSTg4Z0d5L1FONERGN2k4bGJtcU12NFNqR0ZRMDV0ZWF5?=
 =?utf-8?B?Slg5bEJOTTNLMk0wUVBIYjRkNjFSV3NUczRWR0RHNkNMNklqTXg2ZWk4R3lL?=
 =?utf-8?B?RzNiWE50ZWMyczRVUXpSYlB6cGNMdC9qVUV0SUJyOS9FaDhrSFJHaUxBcVdT?=
 =?utf-8?B?UzBJVFVXRFhzbFV0VXZURlRHV0U0TndYcVRJaGFCMldQRWZGREg2enZER1NT?=
 =?utf-8?B?RGI5R085OVhQK0RCcXE2V0xjN3Azb1hLV1lxdzdSVkJXVnQ2RENCbnFKNVhq?=
 =?utf-8?B?K0VjcTVwYTZqb3l3aXc0RVk0ejMzeWErd1JlcHhwZTRvVDYyWHA1VkxveUZa?=
 =?utf-8?B?ZWFjZHdUQ1JsWmNLckswbkgzMEI5blJkaks3NDJXVXpJRGRnRWNZVWErelE4?=
 =?utf-8?B?dG1NRllubUhnMnFTaHM1RHVLWXRLc2s5T05YTGtaN2s4Skx2QUVKeFdRbzND?=
 =?utf-8?B?Y084SGplYWMydlkzVHgxdGFmR2NONlNNRnpWYUJITFhlKzBHR0JRbjdrYzgw?=
 =?utf-8?B?T3JLMVVRa2lPT3hTbjZZYk13STFyUUp5ZmlyN2ZvNjJreTBhRHlhM1lZNU85?=
 =?utf-8?B?YlZQNk1TR0ltUEpYZEFnUG5DZ0hKZnJza2NsZU5DdkUwOExaQ0RTRStOZW0r?=
 =?utf-8?B?b3hBQWVobW04WlhKVzM2aWJteHZRdzg3b0dVNHRkNGVqcVlxR2VvdFp0czYr?=
 =?utf-8?Q?UuwCA/bjhgrnp7Agdr8ghzGha?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf58263-af0d-482e-5dff-08db305fb362
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 14:12:59.4506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fU5b/R7gxc10swLIwyXslmTIKU9m5kOteEG7t5NfxvbuCv67RPNmar1cNGnY7u6/pOKBcnKGt5cSCGflxmFqQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

On 29.03.2023 15:27, Marek Marczykowski-Górecki wrote:
> On Wed, Mar 29, 2023 at 02:39:22PM +0200, Jan Beulich wrote:
>> On 29.03.2023 12:51, Marek Marczykowski-Górecki wrote:
>>> On Wed, Mar 29, 2023 at 10:50:20AM +0200, Jan Beulich wrote:
>>>> Taking both remarks together, limiting granularity to 16(?) bytes
>>>> would allow using the advanced EPT functionality down the road, and
>>>> would at the same time limit the suggested bitmap to just 256 bits /
>>>> 32 bytes, which I think gets us below what even an empty rangeset
>>>> would require. Plus lookup would also be quite a bit more lightweight.
>>>
>>> Indeed, in that case it makes sense.
>>
>> Hmm, I've checked the SDM, and I was misremembering: Granularity is
>> 128 bytes, which might be too large for the purposes here.
> 
> Indeed, it seems so. In case of USB3 console, I want to protect 64 bytes
> of registers...
> 
> I guess 16 bytes granularity would work, but it feels kinda arbitrary
> without any good reason to choose this specific number. More logical
> would be 4 bytes (as common register size), but it means 128 bytes for
> the bitmask.

Which is still acceptable, so I'd say 4 bytes it is then.

>>>>> +        }
>>>>> +    }
>>>>> +    gdprintk(XENLOG_WARNING,
>>>>> +             "ignoring write to R/O MMIO mfn %" PRI_mfn " offset %lx len %u\n",
>>>>> +             mfn_x(mfn), offset, len);
>>>>
>>>> ... make it here. (By implication: I'm not convinced this wants to be a
>>>> gdprintk(), as I think at least one such warning would better surface in
>>>> release builds as well.)
>>>
>>> Right, gprintk() would make more sense indeed.
>>>
>>>> At the same time I don't think any message should be issued for write
>>>> attempts to pages which don't have part of it marked writable. We deal
>>>> with such silently right now, and this shouldn't change.
>>>
>>> At least for HVM domains, it isn't really silent. It's domain_crash()
>>> (before my change, not reaching this function at all).
>>
>> Well, yes, but that's one instance in the lifetime of a domain.
> 
> What I mean is that it isn't a common or normal case that HVM domain
> would exercise in normal operation. It's abnormal situation and as such
> it should IMO get a log message.
> And even for PV domain, such message would save me quite some time
> debugging related issues...

Sure. I don't mind a single message. I also don't mind a few. But I'd
prefer if we could avoid relying on (general) rate limiting to bound
the volume, at least when it's the simple case of dropping writes
which don't overlap the intended to be writable region.

That said - if for HVM previously we crashed the domain in such cases
and this now changes, then this change in behavior would also need
mentioning / justifying.

Jan

