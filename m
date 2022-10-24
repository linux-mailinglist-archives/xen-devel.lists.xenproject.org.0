Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E693609A97
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 08:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428729.679174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omr34-0002cF-Ix; Mon, 24 Oct 2022 06:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428729.679174; Mon, 24 Oct 2022 06:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omr34-0002Zn-Fx; Mon, 24 Oct 2022 06:34:58 +0000
Received: by outflank-mailman (input) for mailman id 428729;
 Mon, 24 Oct 2022 06:34:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omr33-0002Zh-7g
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 06:34:57 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2058.outbound.protection.outlook.com [40.107.103.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f953e4fc-5365-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 08:34:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7881.eurprd04.prod.outlook.com (2603:10a6:10:1ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 06:34:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 06:34:53 +0000
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
X-Inumbo-ID: f953e4fc-5365-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZo4Ub7RDZBXMWppqGMH+PWjiQcOiv50HuWLRca93e6RREKOTJExIty290tv6TwuhYdYCevPs33FhddIWMRRmjsCvSeAycBUYqpzOGvkDqhBtxXIcL+Xt5m860O+I1rayaFkErS16+IYoGUl1CYaKYeoLlSIGib9DkbrgoaK91tbCqhIvaj9TSYz7qAlaLUe7OCfKXr+erEK4ng03lvLQiFO+G3kD1MyIFV7FhLsxlfxb5fug8LfucfWA2nglaQcYJRrKQ+cvxusShd9FlOTVXeUhdkt3CVybLupj3QiRir1D02Hsf6GNQUybSNX0I3gYGzng7sDyMcJyA08kgEbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMFVx3NCTtS9VNeZ7Tqh/Nhwxwj5zHe6sTNS/yqPdew=;
 b=Uo2Wb0vKD4bVBo9rR9EVUDf6SW70kFLPc2EmPJLd7tZdGOfZfv4pGyvvAVt8tx6dToFuTr0u8zBSvB5WnHNOa4JuaY1zf/S0d69oWz+VevT3I3QZeFYjgPk6A7gicuzmj3EeZ3BfxJcHs8e5bN6StC+saH0LfqxBkyU9tMsRRUrZx9myhiNXJXlZIjilO3Vy41MYaZv9ONJtn3VWdkXwu91qTr2soGa3jFwMTguBv1RwJI6KfU+WXGrZzRrX0nNpn9se+zKo4ge6l1riFgFdV467qz7/g0bT9+DXzsfjIUbIvg1GUFzW5HTOAX1AU35iER49RTsF73UfmNDR+qF0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMFVx3NCTtS9VNeZ7Tqh/Nhwxwj5zHe6sTNS/yqPdew=;
 b=jh8zAXwyIpTsl+dv6VapY62BIM5hDykMJwX3V0pAw4ju87D2oPN/rAaptuM+dEk52LMsACl/NQwegGT47+5k3DFaRLnmfhMPFkYUJbmXdj8XxdkHf4kVT23OXnnSfYuFTZxKetcxoFDCwk7qkbR4R8Q2pd9qIlKXIcLU74cEskJ1AB4TaZOOhTYNXbx4le+UTM5fqO0c7wHc80xM0mZBtbLOBji7Fd4Yetf5SvAX5qnWxcugbnXGBhMuft9Y8YWJpmBpBhRDdsyu0iKocupToIC+4QGfOpwzJIACWtchHneGt49F4W6ucNv8xpFOo8xlE6Q5a+Lip1CwfOtKvOJM4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <917becba-92fe-7f4e-380c-cfcf182a5b38@suse.com>
Date: Mon, 24 Oct 2022 08:34:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
 <julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
 <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com> <87ilntgzpj.fsf@epam.com>
 <3aa941de-3dab-0265-02af-38ad1cc3a4f3@suse.com>
 <e9120354-e72e-2774-c382-45ab0cb76220@gmail.com>
 <AS8PR08MB7991C3933F253BE49BA61B76922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <0F295AC7-1D2C-4F5D-A421-9440CEB2B5FA@arm.com>
 <AS8PR08MB7991E3C3897AF89E969F6412922C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991E3C3897AF89E969F6412922C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3cebd4-2e7f-49f1-2cf8-08dab589dc2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tnze5/UNgrnWbIdalgAN5W2RvGf+jBfXuw3tRAoZvd77cStuwRN5YVE99yqjXPdI8hK+nFHIR7o/aj9rioVVy/jv4eA3WgSlYamK+n4SGzgCWzzGly4vjyuujLONS9KnIx5+2tSE6gWzu/CMNVn1ROkS1v09uZyp76OZjXmUoCpS7paskQtnNOtaXfu5VfLnmlqlsCIBWPwR6okSy/Gjlm+5O7iMPtgj4bY+sl67eBhURMbjHouFr7J0muFlT2x9hjiJjBWCntUwTMiP4uI6rt3S0xFIbt6tn3TWK9cmOpu98tkq+5c3PnTU1MVlsGvThsg7w5UKeTzD6SWqsY22uz2PkEpxqQm0Zob6S67gJJpJhR7TXbBsSgYkc0nAWIsUMqEQj1WZC2HsyTb5Spz1/aW9Sh+OXSxC2f7MicA6PrS81S4evh1vn3S2Jo2ENOjrBEV+KKvFH4mvV0L1SbrApSkRybwuxaxvTzsYnfy+o7CF+GYMpYhE1tLkiKn52eSRMD/q7uecp6/tHtmZRx8SsE1/3qIVnRQ3vfGzm/V+7GWm7gbH3aSiINtyDHbmjda7UYVlZHSor0JDvPBdwg8J3p3LEQ1fHDRPeFzXZxtp62PBzmF0jKt6Atc7STAK21wYlxrDwLS90lkWjzw5hG9jwV65lDgYFxk4YlaKVXHKCnh60eN1AO2l8IFf16abS7VhUiR+kFUL1BT4ItlCFfQLTbmTqWqbK18hwt3WPXBkCOhQBOenUdONQgH7P93qtBMkpdhe7O1kMc6Fpzd/wUCyCT54GqqquUZ3u25qOW2yFBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(31686004)(36756003)(4326008)(38100700002)(6486002)(66556008)(41300700001)(83380400001)(86362001)(31696002)(186003)(53546011)(6512007)(8936002)(2616005)(2906002)(316002)(6506007)(5660300002)(8676002)(478600001)(66946007)(110136005)(26005)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzRvVVVIdUpZa1VnbE9WOEtxR2hSVmg0Z09hSVlyeU9FeGRmbHVMUGtBNktP?=
 =?utf-8?B?ald6RUN0cThjRHUzV2lHeTVGMU5kYVRNWndZQk42STVJWndzYU9Uc212UzNB?=
 =?utf-8?B?MzdzclRmRkdROTZ1dHFjVE44MmNtaUJSOWVBMnFpdWM5TjNuYk1JZFR2ZVNN?=
 =?utf-8?B?THQxQ2g1Z1pPWWl6RmxhTSt2ckxOMDE5OGdMczh4cnJDdUVLek9WT0QxaHpm?=
 =?utf-8?B?N0hUbGh4bFNNV0FwWEo0ZzhCWmdRV216aGdwcDlGVld5NEZuakpsamNLc2RF?=
 =?utf-8?B?NWdTSVlXTGJKS1NKWHlnUk8yQmpUVzNvZkR5QVRjSHlFR3RvR1ZnN0hkcmQw?=
 =?utf-8?B?cG1zSWZvTW5hcU50eVorekkwaGxTbklTY3RtMHdXdDJTeEJEaU1iWmZPZHp2?=
 =?utf-8?B?ZzExMFdCT1l1cFVQcU1NaUFmVHRtVkwrUEpRMUtycHpGTzgwSVZqRDV0UExR?=
 =?utf-8?B?ZHd0bXNjdGZNZEFsQXkzdmlNRlFjSnpScHlPaHVjQy9ONzNiQmQydDBoL3Zp?=
 =?utf-8?B?OUVXbnZOam1yOUxVMzlCK0IzWVhRL0gwTWIwNUJzZUorcXp3ZjZ1OGR6WVhr?=
 =?utf-8?B?LzVZeWJ6bjJ5ZEpUVHNMTG5nUFNoZXZKV25DTUovdkg0NzdsSG9aaDdnazZG?=
 =?utf-8?B?VlR3RHZvZXhyUVJxaGQwaGE2ZWVyVGJKcFJ0aFRuWk1vVXpmREk5REsvZ2R3?=
 =?utf-8?B?WUdSS0NjWVg0eXo0YURuQVE5TllYUTFIZDF1TktJZ1ZEdWpWWVFzaTFyb080?=
 =?utf-8?B?WldBTnQ2YkgrUUFXNWpqTHFMVTVheEJDZStrdTQxaXBneUdsbzZMWkQ5TzJa?=
 =?utf-8?B?ait5emZDV3FCMW5zaVdsMG10V3E4bldSQWR2bDZOeDRhcTNTZzhZK1JCT25C?=
 =?utf-8?B?OU9Sd2sxeGFwVnA2cWNUNHZEU2IzZjU5ekR2Z3g4eGRUMmVRK01Hb2FhWFFq?=
 =?utf-8?B?WlVjbXVZZ0JheGxMSGZkRGNCUUZPRmlDR1k1ZGRLUG4xeEtoY2U0a1BSb3BI?=
 =?utf-8?B?eVF2TjdWMGl3VlYrb2s4SjBFWk1NTng5OVhkeXkzRUl2NUpvYlcrai80enY0?=
 =?utf-8?B?SEJWZEpDUnVNRFAzY2JBbHMxaEpxRnRxNmpQWmhOeXMwLzFHMlUyeWpqNWVu?=
 =?utf-8?B?N2dxZDJRQkpTOW9ZTHVYUXhaaUFTL1VBR1lCdDFGSE9MN1IwTEIya1l1RHpT?=
 =?utf-8?B?U09iVnVXV0Q3dnV4NlNhRm5mMTU2clBJdFVpbGd3QTV5OEFmYTJaR2UwdnZk?=
 =?utf-8?B?aDQ1WVo5RklkMnpDRkhncFkvRW1UTURCK3YzVkQ5WjZCWXlrQVlMNjZCNDhC?=
 =?utf-8?B?SnlRUTE3T1BGNWxkNmEwLzZtbXplcXcwbFpLQU9mMmU0QXd1cWlYd0hPMll6?=
 =?utf-8?B?aHhlTXR4c1pUK1NnTlN0bjlIZS9HTW5ydXhQVXRsTVdJUnhkZlM4ellscmFH?=
 =?utf-8?B?SU9xU2tXUUI4cWJ3NXpGNndvSkt2Y0ZQYTlRak5FWmpMT3NreUJ6R0czRG1T?=
 =?utf-8?B?V1hZUzNiODJ1c24ydFEzUGd5KzdRMm4wdm9CdzBMUjh5VXpnY1VGcUk1RnpG?=
 =?utf-8?B?d3FiVDNLSGtxSXpHU3hUZWtVRWI0amZhS0R4eGZGODdoeXZ2ZUlCM3JGUGZR?=
 =?utf-8?B?VDB6QlB2VU15QVFZUEhXOFRiYXdWc0NjekUrbkNtUDljcnhMRDFhazZFaHdm?=
 =?utf-8?B?Qk55UGxtYm5DWTF3VDdwN2gxODk1WUJhVk9sQVcwNmlYbVhlenJVR2kyRWl6?=
 =?utf-8?B?bXFHRWFLYVJxY005d0xxb1IvVHl0aEZHV2RwdTdVNStnWGZRS2dQa0t0VVVu?=
 =?utf-8?B?dE1vd1V5dVl1UWNqSDFlQ0JXT3k3Mys2d3dLZXRGSUtzZUJ6bzJnYXlaT0g1?=
 =?utf-8?B?RXkrMktvZ3Nxeml5S3hUYTRjYlFsQXVWOVEwMDlzUWpYYUp6NE13VEFINHJF?=
 =?utf-8?B?b2dvNWVvM1VYVFowR0RxR0NlKzgraEtuQkxSSWNyY1ZJMXZXdFNJUzBoTnJU?=
 =?utf-8?B?ZVlHT2JDaUxyWE5TdDgvSDMwNHVTR0l1UkVUQlorSHdmSVN3Nk5qZm1rWWFk?=
 =?utf-8?B?YXJVTkREQkRiL2lvWmZ4SEk2eWlBd2NpcEorbXZ1N0NQK0FuamtCZm4yZzVp?=
 =?utf-8?Q?hpWN2LJebFB2JoPsYA4NGKTRr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3cebd4-2e7f-49f1-2cf8-08dab589dc2d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 06:34:53.6691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gnadk6YTc6tljVB6BAQ1rvYFJ0EnV3LNSj4eagsi+6pszgvOP3PSWZmgM6rmMCvfTxv18nNagn02zXxiHZFMbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7881

On 22.10.2022 02:50, Henry Wang wrote:
>> -----Original Message-----
>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
>>
>>> On 21 Oct 2022, at 15:40, Henry Wang <Henry.Wang@arm.com> wrote:
>>>
>>> (+ Arm maintainers)
>>>
>>>> -----Original Message-----
>>>> From: Oleksandr <olekstysh@gmail.com>
>>>> Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
>>>> On 19.07.22 13:40, Jan Beulich wrote:
>>>>> On 19.07.2022 12:32, Volodymyr Babchuk wrote:
>>>>>> Jan Beulich <jbeulich@suse.com> writes:
>>>>>>
>>>>>>> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
>>>>>>>> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call to
>>>>>>>> iounmap(), but not added corresponding include.
>>>>>>>>
>>>>>>>> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
>>>>>>> I don't think there's any active issue with the "missing" include:
>>>>>>> That's only a problem once Arm has vPCI code enabled? In which
>>>>>>> case I don't think a Fixes: tag is warranted.
>>>>>> Fair enough. May I ask committer to drop this tag?
>>>>> I had taken respective note already, in case I end up committing this.
>>>>> But this is the last patch of the series, so I can only guess whether
>>>>> it might be okay to go in ahead of the other three patches.
>>>>>
>>>>> Jan
>>>>
>>>>
>>>> I am wondering, where this patch could be 4.17 material?
>>>>
>>>> The patch series seem to get stuck, but the current patch just adds a
>>>> missing include to fix a build on Arm, so it is completely independent.
>>>> I agree, there is no issue with the current code base as vPCI is
>>>> disabled on Arm, so nothing to fix right now. But as PCI
>>>> passthrough/vPCI on Arm is in the development stage, the developers
>>>> enable that support in their builds. I think the risk is rather low than
>>>> high.
>>>
>>> It seems reasonable to me, but I am curious about what Arm maintainers
>>> and PCI maintainers think. From the history discussion in this thread I
>>> think it is pretty safe to include this in 4.17. Thanks for the ping.
>>
>> I think this can safely go in for 4.17.
>>
>> Cheers
>> Bertrand
> 
> Thanks for the feedback :) Feel free to add my:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Okay, recorded, but first of all this patch needs Roger's ack.

Jan

