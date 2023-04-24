Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E74E6ED053
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:28:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525447.816651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxAt-0002d2-Cj; Mon, 24 Apr 2023 14:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525447.816651; Mon, 24 Apr 2023 14:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxAt-0002aG-9T; Mon, 24 Apr 2023 14:28:15 +0000
Received: by outflank-mailman (input) for mailman id 525447;
 Mon, 24 Apr 2023 14:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqxAs-0002a0-An
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:28:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2048.outbound.protection.outlook.com [40.107.13.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e970377-e2ac-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 16:28:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9059.eurprd04.prod.outlook.com (2603:10a6:102:220::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:27:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:27:43 +0000
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
X-Inumbo-ID: 3e970377-e2ac-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJcL+MazkewhHYYcVcAEuKV4GRMbnTim7OdmJQ/bG1O5SKi5RjLHAfWoJK5ZyZOrtEOPBzy3M1X/uD+G+y0OoyEGnNWePM1/Rwcn+9zfl9JQpaHeXKxREWFWm47xtoUK1oSl+Ngp1N/rZaY0xiYC4VYnlY9KlWQ0YEnepEwLnYTvWvWcgUzX9+g2llVTZEm7stOrcFucN+n45X8wr+bUjkpR4t1AHbd/CgOZRb/5WGeivrVCAifwHFVw0y83RQrjTkYoK4+KbKF8neyjLDgc6qhc3gL/lchcUU3M80Kh0uBIRAR4+hJKkLCC8Q8AUBUXuHAN0gOcB7wLVsmjYM1I0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AR/32oQ0LXq2/CHm3IaI5u1LOce7N+Pf+2xDoBpsYo=;
 b=HbYcCRcUbeIlw1GFsXhQe8qkL16yMu3NrV7W0NE8atZ2Yc8AiOgyYu2Ru2M9XYlYpVoMO6JAg3+0sNlgGB0XsCP1bvB2QjkKnzR5wMbcY0GIT8sWmBuo/mny+FT1vyIExoYn+FvsWekbyqESnrdIzcKfS99SNOGhNKbQdteypgZO4F/bb1eUgAdNESajpln9Zqlk0XAIaK/yEcOGi5C3ejJe+hJGU9h3EqpHUUIvB1VenqTkZgmCPvbGBVifRRUpBZdktp4DCBD8Oo+qONMwC2gHP/0xqe8t02nw+Ry9youBhYzcBpF2LG6rJ2fbHY4Uf+Yyfqh9uEPgCdL0bef1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AR/32oQ0LXq2/CHm3IaI5u1LOce7N+Pf+2xDoBpsYo=;
 b=dGoLQ2ZyQE9WmUBRu0Q8Vwk0m19lngzc4deWlvRlyzvCSqhMyGb+HoVCz3RjeHB1MZbk5AEUgAxUDCutalkVoZ+kdFHyNPWr5HLXcYm8oIDmHI7CwJANIF9OrFIi8pfja0jjF+wc5zXIyHrTJWAa5cZ1Op2N7t9Np71zSpgZ2klwsVbi/HsYfDvutOggdHjPS6But9o23J6Ynj+Y/BhMZLwIsETWTUmUfzYQD87HrGoE8A6L4e96tz/ijRXN6+pmjgWEdpCOQW4RWwzW3Z12ne7k9zdk+YdRKmuHq7ahlpknGFi5LZ4fgo+L5iYH0Btlwtn9vp2GdKK6PySdLEuxBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0f574f1-5696-636d-6409-170a6b193f86@suse.com>
Date: Mon, 24 Apr 2023 16:27:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger> <87354t8pqg.fsf@epam.com>
 <ZEKLN8AlzDUckorU@Air-de-Roger> <87o7nh727c.fsf@epam.com>
 <bb71c3f3-20a7-b020-6685-879bd4e5786d@suse.com> <87h6t574e9.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87h6t574e9.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c5728b-416f-4b2a-d980-08db44d01138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ZtOvIATYy2KAmUtrpQJbYZMvo+7C6t7iMKeXePl+M+L2wV/HAY9YG5tiJLRWuoCM7JF025wH4Sao6HutZ1wDWodkeXQt2GYT6251naLI+jjhgA9a2sMA7vHbJlMsEq8sEQhK7hU/+mZYtH8YSAbw+O8Z/jrR23XIkNP/+TV/zZVwzIKldqp2MOX8evCr3rdUlqIMOkphXFty8e2bZ/2XqCF/Tg2ECCoY1faQpIr97hW0aBP2TvUzUbMGL4VVKThzfgmCr0LiA+h2A0INLd5yzkdWxvvaCTwM0R/ZwCENMdtkh2T0oUlUSW4F8JsIWbTdZRaNy+RHJhuBR2wn922eb7o/j8mehic+10nVEsHi/IWjHolmtQHGpnsES2+j1VvHy5knYGhDoEUzdgk6hb/Ign9DN6gfLZLeNaEtJotdrNqTpxevaLwZPmPM+Or0rFdF01qus8DlVJ01aD3DRNeLG8tmdWZKUrd/D3eEbWd6ms8QRLVnNc7XESMZrbJzi67nWxid/WyQFTx1ccFALEb/oCEil2de62Kb6SRNJawKj+NSPY51WKFV7lPw3LmaxbM7G06nCc0BourAKOe5rI1NCxxJgXmZCH00be10DPbhBkhRJGErXrzhBlUlrG08NG8ZEWWdKQQ4PeCdzU70NqXfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(66946007)(31696002)(478600001)(86362001)(6916009)(66556008)(66476007)(31686004)(8936002)(8676002)(54906003)(7416002)(5660300002)(6486002)(66899021)(41300700001)(2906002)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2t2Qjc1TVFIQVprZFR1dmRqTEg4YXpjNGhNTXd3b2NmcHVYNEwydVNhRWtR?=
 =?utf-8?B?M0dia1hwQk5EWmQ0RlFhVzFLL2RjVG9DRWdQdkxsMGJGVHEvN09Qd213UUYx?=
 =?utf-8?B?UFNYVW9mVTNOQ1lTWUIyV01pTVEwQlVsM0MvNzVaTTdndzRwaFo1OGZiODdl?=
 =?utf-8?B?elYzcFpteFA4alJuUjVXL1BFZTd0REZEVUo2ZHJrdVhEYWFNZzJETTlQSTY4?=
 =?utf-8?B?cGptcVpEY2dpb1EzVkkyZjdEL0JRWktLbklaUUFVRDFoV2pWTy9VemZta2pt?=
 =?utf-8?B?MFB0V1JMR3A2ZEFtaStpWUtiQVBnYUpsMmF1NGxZb0I4NlZGdVlsVzcwWmk5?=
 =?utf-8?B?U3JYWDNpVmJjejlmS3RjZVBMcUJqNnp3UE92czJvU0w4U2ZHeVRGUmpkLzMy?=
 =?utf-8?B?Y1d1RGtFT1JlZldkdDNqL2l2dlZoVkZoU3IrWFpUWXpBZjd5VGdYYmpoSEdV?=
 =?utf-8?B?ajZkRVdGd0Zsd2J4S0tGL0dnVE5PMkQrSTJ6MVUxbllQS1JpRG4wQ0VLbFJ0?=
 =?utf-8?B?WEZlVHJtbjNGc1FjNytWSVlvSmg2ZG9RckRkUW9NNzBhTHp6QTl0Qjc2b3N0?=
 =?utf-8?B?LzEvT2U5TzZrRmRMZGdMRkZYYUZtbExPOVE0M3cyNHhJaC9KQ0p5dnI0RXdW?=
 =?utf-8?B?K1lhdm5sdmZQZk5FYVIxbXBOOHBZajJnRlY4bTVsZFBuZmlYWktkeVc3TFkx?=
 =?utf-8?B?UHY3T2JWMXRDSXNNMkcrQTNNSU5rNU9yS2RJdUN0VjdxMGIxM0g2TEwzZ0l4?=
 =?utf-8?B?L0FWWU9SVFI4SExlc0JMYVBWWHlVTWxjNUpNT2QxV012YWFDSVZIV3ZaK0Ex?=
 =?utf-8?B?dUYwRXpQZStJbElNVmtKbm81dmgvOFREY09uVzN3WkQ1YlhiczRiZ1ZZQkFn?=
 =?utf-8?B?SlNxT3NKMzZmSDF3Zi9vTnJoZVNCNkE4VlRxK1JWaC8xdDB5aU8vczdtdEll?=
 =?utf-8?B?aDB6NDZ0cXp4T3ovdk1ZeUw2NE12aXVLaityVmFackNreGQ4TFNHR1d0YXMr?=
 =?utf-8?B?M2RsTU9tMEpTd0J0QnBvRUpZRzJ5Qms3ZVpJOTZUSFJvVU5xN2tMZHY0aDVR?=
 =?utf-8?B?UThXdEdhNlZFREtpOWlFZDFweVh4bi84cUdhWmVDYVFwMVBGTHRRTTVmMjdK?=
 =?utf-8?B?WkRQN0ZyU1hUaTJzVHpOUGtkajNEMGhrZXZLa0x0NmVtdXROZVpYSXZSSHJk?=
 =?utf-8?B?MzkwNVkzQXErclRjSDdIMVNyOERtcEZ2ZXo3Q0diQ054Ky94RTBGbnNIRisx?=
 =?utf-8?B?MzUxaGVlNnoyS3ZERXU2N2JRT0Z4R201ZWhYa01nVGNtT0tCUzBHWno5QnFm?=
 =?utf-8?B?T3RVOHlWeDNhK3hQT1llUENrN0hWM01VL1JxY056YXFnR1MxOGtCVW83WURa?=
 =?utf-8?B?VDJzUUN2SzJDdlNkN3Y4ejZyNFQ2UklyQXE5WkJJbWE4QTJEOWpEWllubEQv?=
 =?utf-8?B?SUMwQkVjMFI5ZUdJNXN5ZGRRcXQ3bVROdDgvUGU5SkVhTEJDb1RJSDhyNE1l?=
 =?utf-8?B?d29aWkJnT1BCWTVLYXptN3lQZHRUMWdueEhiTXMySldWTCtCZ1diWFlBZTgw?=
 =?utf-8?B?d2JPUWlZSWNQYVh0SjByR1ZzMThBOHhVOFlCb0pFRTRBaERrMWdPZWhGVFVk?=
 =?utf-8?B?TDVkZk5XR3pNTnk4dTRDUWxvSUNTYllwM3NCeXNjSEs4a09RZEZHSFNFdFNX?=
 =?utf-8?B?dVB4aTdya2dyUVdSdzhUSlRqZ2l0YjNWU2FmTHVsQTRTR0lZUE5nTHRuaHV5?=
 =?utf-8?B?dGZhN0hVV1ZReUo0TFZIZ1ExNm0rb0Y0SVRiVGJqR050NTV0SFJRbUJuMlp3?=
 =?utf-8?B?dVBldGoxb0lUVGdWMGNWUG9uS0VMNWtJWGNXRGRNclR2b1c2cTFlSlFSd0t6?=
 =?utf-8?B?ZWhhZGxpenRXdjgxRUk3Z0NXeFZNRHNDK25WMVRsRnBhRjJkM1FsZjhsa2xq?=
 =?utf-8?B?SjI3UlMrTm90dGd1aXRsdkNISGhWYlhLTExzeGJvQTMvMkUvUSs0Y2Nac0NZ?=
 =?utf-8?B?NkhYK3JELy85SkhyM3ZvUVV0OG9UVmR2dEVCVzF3UXZVSlgwdkxWQlNFVENJ?=
 =?utf-8?B?ZmQ5eGtmQUxpc3BvS093U2JRc0RubEwza1c4TkFRWFVUdlJiNVdCcldIR2o2?=
 =?utf-8?Q?1L8XqqmSyApMMxI1cm1IlSHaS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c5728b-416f-4b2a-d980-08db44d01138
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:27:43.6877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1yN1/m88SQWCVdP66LAuomY/bz8vRD65vhqVdTpsXSbkZr1mrxvzN57pJOzBFtpz9INS//gYIjZnQzzKURA+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9059

On 24.04.2023 16:15, Volodymyr Babchuk wrote:
> 
> Hi Jan,
> 
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 21.04.2023 16:13, Volodymyr Babchuk wrote:
>>>
>>> Hi Roger,
>>>
>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>
>>>> On Fri, Apr 21, 2023 at 11:00:23AM +0000, Volodymyr Babchuk wrote:
>>>>>
>>>>> Hello Roger,
>>>>>
>>>>> Roger Pau Monné <roger.pau@citrix.com> writes:
>>>>>
>>>>>> On Mon, Apr 17, 2023 at 12:34:31PM +0200, Jan Beulich wrote:
>>>>>>> On 17.04.2023 12:17, Roger Pau Monné wrote:
>>>>>>>> On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
>>>>>>>>> Above I have proposed another view on this. I hope, it will work for
>>>>>>>>> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
>>>>>>>>> after returning from pci_remove_device(). By "harmless" I mean that
>>>>>>>>> owners of those refcounts will not try to access the physical PCI
>>>>>>>>> device if pci_remove_device() is already finished.
>>>>>>>>
>>>>>>>> I'm not strictly a maintainer of this piece code, albeit I have an
>>>>>>>> opinion.  I will like to also hear Jans opinion, since he is the
>>>>>>>> maintainer.
>>>>>>>
>>>>>>> I'm afraid I can't really appreciate the term "harmless refcounts". Whoever
>>>>>>> holds a ref is entitled to access the device. As stated before, I see only
>>>>>>> two ways of getting things consistent: Either pci_remove_device() is
>>>>>>> invoked upon dropping of the last ref,
>>>>>>
>>>>>> With this approach, what would be the implementation of
>>>>>> PHYSDEVOP_manage_pci_remove?  Would it just check whether the pdev
>>>>>> exist and either return 0 or -EBUSY?
>>>>>>
>>>>>
>>>>> Okay, I am preparing patches with the behavior you proposed. To test it,
>>>>> I artificially set refcount to 2 and indeed PHYSDEVOP_manage_pci_remove
>>>>> returned -EBUSY, which propagated to the linux driver. Problem is that
>>>>> Linux driver can't do anything with this. It just displayed an error
>>>>> message and removed device anyways. This is because Linux sends
>>>>> PHYSDEVOP_manage_pci_remove in device_remove() call path and there is no
>>>>> way to prevent the device removal. So, admin is not capable to try this
>>>>> again.
>>>>
>>>> Ideally Linux won't remove the device, and then the admin would get to
>>>> retry.  Maybe the way the Linux hook is placed is not the best one?
>>>> The hypervisor should be authoritative on whether a device can be
>>>> removed or not, and hence PHYSDEVOP_manage_pci_remove returning an
>>>> error (EBUSY or otherwise) shouldn't allow the device unplug in Linux
>>>> to continue.
>>>
>>> Yes, it would be ideally, but Linux driver/device model is written in a
>>> such way, that PCI subsystem tracks all the PCI device usage, so it can
>>> be certain that it can remove the device. Thus, functions in the device
>>> removal path either return void or 0. Of course, kernel does not know that
>>> hypervisor has additional uses for the device, so there is no mechanisms
>>> to prevent removal.
>>
>> Could pciback obtain a reference on behalf of the hypervisor, dropping it
>> when device removal is requested (i.e. much closer to the start of that
>> operation), and only if it finds that no guests use the device anymore?
> 
> Yes, it can, it this indeed will hold a reference to a pci device for a
> time, but there are some consideration that made this approach not
> feasible.
> 
> Basically, when an user writes to /sys/bus/pci/SBDF/remove, the
> following happens:
> 
> 1. /sys/bus/pci/SBFD/remove entry is removed - we can't retry the
> operation anymore

Looking at the comment ahead of pci_stop_and_remove_bus_device(),
isn't this too late already. The text there says "has been removed",
not e.g. "is about to be removed". (Of course chances are that it is
the comment which is wrong; I know too little about Linux'es hot-
unplug machinery.)

Jan

> [unimportant things]
> 
> N. pci_stop_dev() function is called. This function unloads a device
> driver. Any good behaving driver should drop all additional references
> to a device at this point.
> 
> [more unimportant things]
> 
> M. PCI subsystem drops own reference to a generic device object
> 
> So, as you can see, admin can't restart a "failed" attempt to remove a
> PCI device.
> 
> On other hand, remove() function can sleep. This allows us to pause
> removal process a bit and check if hypervisor had finished removing a
> PCI device on its side. But, as you pointed out, this can take weeks...
> 


