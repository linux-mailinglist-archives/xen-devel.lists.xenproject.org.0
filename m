Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A94791A73
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 17:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595313.928840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBNw-0005vb-CJ; Mon, 04 Sep 2023 15:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595313.928840; Mon, 04 Sep 2023 15:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBNw-0005tY-8z; Mon, 04 Sep 2023 15:21:04 +0000
Received: by outflank-mailman (input) for mailman id 595313;
 Mon, 04 Sep 2023 15:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdBNu-0005op-EN
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 15:21:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a70f8b87-4b36-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 17:21:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8514.eurprd04.prod.outlook.com (2603:10a6:20b:341::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 15:20:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 15:20:57 +0000
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
X-Inumbo-ID: a70f8b87-4b36-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkZ7r0g33PQ8W5jh1fvHrk5ytN7jv3PxrwI2MkGWqtbzj6ZId3bcT4USlql+1jYKdZgRkjcDri/Wk2Re7E1aUoXWtVf3SI/5veKEfAwfJJr/9etUvJ6t778NWXsNSx55frWiKQRl/Q+FydijF4ISDvNYEx5e0t10dmuX8zEHRgc9WleSKjIlP+JRG0/+8a9cvNMmCChi3iD3wM2wXJS9+6444M7qyN0AAIYUYaJH9znuLAzoNFiLYasX5PaO04hheYKV6JA+wqfJsbY+z4ebs7IqySMs5hBW1pNOT54eZmw+T1Iw94bmhn3RWGndb+QVYvg5fgASDrh4KEeVZUeCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5L3DdFqJw8W9Tau/gdHrdHUTDkdsPDX3o4JeRi6i3g=;
 b=L1XalDwsVKk1DYxQLQql4Yc4dylg45dAuavs2818KijcJQR2+gFr41RAqAEQUdR5sUVa/yArMl+rRJmBXGYaIH71j047edeG7nMTjhWx7uETjV7oQL0+os9f6QYRhixuA8+OTUjoiXB9+LwFw0MHgE+2wjJAYG+sGNSrLtAq+ALh4AFEd6FikvXB3D25oztsEeRkbQinNavW+OQloo+HaV0JX+XPSi4mbZD7td66E399h3s9uGEOI1J+pCxE6FfwxaCOCk7YqZTdeR63OlMx83ep4G1QjuvrPmzxGD5i0O/XzG9Ciymnom4SMPlW9vWffR1VzSiHRQqa6odBwQgV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5L3DdFqJw8W9Tau/gdHrdHUTDkdsPDX3o4JeRi6i3g=;
 b=exMuiZWflIqJFvHr+9QgWZbJ1zcT/eHH3txVv/JHYfE2hbikcAuiZF3IYZPl8EbglsKYCp2I4kZPV51BkK0i+ZA01fha3Dh1X0A1Sd4glfNoW74szcvz89TiHGg2r+ppCGGKbl1fCv9CRTq8JMMRlb7EPCvM+7LZrI8uDHfEYkI8MpIBhdJ4tmD/yvN8RKFgM47wi7HeAGEuXP2HZPwP5fS7hudBYoMSiVdEiDu7xNvhDAoY7uJcrvC+jqFW+1wkHT2I0rtkEvJc+JPXfRwU2nK4KnUTzmJ5W6NVxM36tnHQcxD217Z8KFPY2TET6oEMaPF2sdcQd92+vBFpzP/3uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e955227e-c791-3a01-8efe-78a8cfb85267@suse.com>
Date: Mon, 4 Sep 2023 17:20:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
 <7D7DA9F4-8B0B-447C-B35F-6BF53E5D0E52@arm.com>
 <03a6847c-95df-696c-5df9-53af425795e2@suse.com>
 <F05B7AF7-94CC-4AEC-9633-20F34F2BB458@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <F05B7AF7-94CC-4AEC-9633-20F34F2BB458@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 54686001-83df-47dd-a61e-08dbad5a89cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EJjiRekJamKDZGYfQRUN6tPKypY+amBvEYPMXBgbhJkDf1CtIePMJ+7viXeKGgoi+NV6cM89NQyxR0Gbu5j5l84Hc2B2m+awZqG0quIxHyz21FtE6Q17oDOnf7ekVEvcWTSxMpQp1J2d5g/XtvrC+MVGqSICuI6YspKQMer/2pcgsjkRTpG0TXb0loMFs8+2sy56RBI40pRMaJlAdthRlY2VBFbH8HFolSpvqXGJv246ZRYFBNQowTGhGY3nw96+Lj9ZJYa02bF1xD72h+yrvqV/8hAXeBAkceu3vbdlpfatUfc1nA3CQWrLQ2THYoO879/qPCRCxm9aU1fTeK0saCSgb9L6Nf0sxl9R/q+MNjvoXYiyOuOlW4RIJcyK6zIxCqrin6POkTkhIdq3VKiOuNQINNHI90Q2AJ/v3ptZ9DEiOt43rfLJ1xboP64vjRhQEisrVueNs/ojaSe6G/FcwbVEJZy9g5xbbXFwymFd81v+rDT5gL5rjDHuDRIg0ILpoZWPXlI1PS8Ji+xkFA0brQ31YYIkdRTgI/4YBqxmRajE8/5D9g2DawfrbHGcxmVzD1Zl2XhEP2RHJeITdzzNsj94cuypFouEndxQKYeuazLYQUtp8VmHHInf80zjYFX2gVd89CXFDMlMZMtwe8nlVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(136003)(346002)(186009)(1800799009)(451199024)(41300700001)(53546011)(6486002)(6506007)(478600001)(2616005)(26005)(6512007)(38100700002)(66946007)(6916009)(2906002)(36756003)(66476007)(316002)(86362001)(31696002)(54906003)(66556008)(31686004)(5660300002)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU9oaUcxNTRnK1FOVzhIbnBPK2xzajlSL0dxMExIR1ZBUGxwbDk5OTZobW52?=
 =?utf-8?B?bzgvd3JtQ1Rvc2t4dnp4azB2TUh4c3NTenZZRVNKd3l2TzVFNjJUY2ZjazNI?=
 =?utf-8?B?ZFNRL2xiSXBmdHRKY1dML211L3gwZHNXbFhidWZ4dnpzYlR2UWN5V3ozNUlK?=
 =?utf-8?B?aG5TMytheFBtS290NmNmQUpuT3VJc3FUK0tITnIwa0ovQ2lrNkhPeHRPREtx?=
 =?utf-8?B?UTIxeVNlQkgxbCtoaXVDbTd4R2pwVlJCa2toa01nVFdldmZnWWZIeGVPNFA3?=
 =?utf-8?B?NUxURDhyMkJlNjVTM2Z5NlhaUGhKNDdNcWkvSzlUaVVTR3gxdjZHbVM3bGJT?=
 =?utf-8?B?aDg1V3UwcjluNGN5NFlPVzVsdWpLcFFLa1EzWTdYMTNjUmhKd1FmMzhUN2tL?=
 =?utf-8?B?RnRTeWZMaUMxUFlVOEo2Sk9NbnNUMUovOU5KblFPY1FiYTBoUURING5LbDda?=
 =?utf-8?B?MHYvTzkwc3dJSXpqbmZ0dlRwZEN1azVYYWFZWVNMTGtybVJza3p3N2FpWE5J?=
 =?utf-8?B?N1ovZTdobEpsMTcyMFRmZzkzRkFpRGxMRjdIVUtJa3VMN0o0V0phM1B6Vk42?=
 =?utf-8?B?NnhxK2g5S1RQVmNyd2VQUlhHaVY5VnZsdCttTU4xcWRqaHlyNGdGdUF0K2Vx?=
 =?utf-8?B?OGNWNElZQVBrUkhvNU93Nml2UkJsT1NKWG1IM1pkRThaRnEvblRIdUo3Zlha?=
 =?utf-8?B?L05lOEovRUZ4Mkh4cU91alBlRkZmRE1VenVKNjZrSmhYa0tPOHZHVUg4Y0xD?=
 =?utf-8?B?SE15V3BOQnVnOGptc0wrNFloUHp0dGU3S0ZjWWRSMW93SThkQm1yTXpPZk5l?=
 =?utf-8?B?NUJnL21jMmE5Z0Z4VUZUczBzQTdTWml6QkRlWlRPRVlubWtmMTM1RkUzQjIr?=
 =?utf-8?B?RWMreGV4d3N0Z3JtV3plZDFXd1FyNXlSK3VxVWVnenBQMjhJRjNLc081dlhs?=
 =?utf-8?B?TU02bDdrbWVobVgySmtOYk5xVnFrT2ZGOG5VQ0ZQRGphbFQ2MjR1dHB6am9y?=
 =?utf-8?B?NERxdXkrQ2RiNlUzOGRFZE1FaGtjNGFiM2tkR095WEFKZUpvTHRoQVI3dXg3?=
 =?utf-8?B?bE8xcHNqays5WnhPSzVCa09QT2QwYmcvZDdSaWY2a0RuejhHU1IzWmV0WkNk?=
 =?utf-8?B?clZTOExnK0xhRHAyRmJ3cWp5bkJ3Ung2OXZVSGZhRGJDRFp5Ni93UE90dWwx?=
 =?utf-8?B?b0U3VnIxZXVXY3ByWFNGd1pjQ1lVeUMrTE1NMS8rT0JwazY4ajdLTFlQeFZn?=
 =?utf-8?B?OVk5aE41MEg4VmZnRWIvb1pLS3dDOUpsOUtZb3JWejhFOXRwWlNVSTV0VDZl?=
 =?utf-8?B?NzZNaUo0S2VTZ1JYUEtQQVNiZVFIR2tHZ0RwYWtzVEViYjNXZFZTTkt3M3Vj?=
 =?utf-8?B?djUvTHZ2ZktZclFJc1EvRG55UTMzdXJMV1F0Ty9oMWxYUXZjM0dkZkNsZ2l2?=
 =?utf-8?B?UzdaR1RaSmdrSmozdHUvZnByWjNjNVVmZDJReEJFRDBtWHFBZzR3ek5Pdk9x?=
 =?utf-8?B?V3hiSEtWQnQ0c0xiaEpIcno2SDg0MHp2cDlaanRDUGQzbmp0WnVEWDNZbHQ4?=
 =?utf-8?B?Q1pmc3h6N3pxUDdDbTFSU3VYZmJzVllRVFhjMkFid20yNUUva1RaRHk3UG42?=
 =?utf-8?B?eTlFQ0ttU1VlV2RQMGJYTzA2TGhWOHE4Sk5mdVRRYXYyLzJZenJkNUxnenM1?=
 =?utf-8?B?QjV6VlFTa0FmNWwzdUdvTTJEUzR6bWZHTVFRemJqL2cwQmJXZ0RHLzF2STEz?=
 =?utf-8?B?dXVMSldNWVRqL0VVbW5pTUM3SmN1TVBOSWRRcHpZazdYa2xSbFpoMXlBY21V?=
 =?utf-8?B?bzlnSStUbzN3Vk5UTTB2V0c0Y3h0Q21uYlVSS1RVK1VPdzZ6NjA2aVRNd00w?=
 =?utf-8?B?V3IxQ1dxK3E2T04zamFpTkc0OHcxNTdYL1BvVzFlTjVXQ0RwWXJZWDdDMVZT?=
 =?utf-8?B?Tm4zMFAzbnJHM001Q0NVY0NUQVJhMTU0NTVNOXR4SEtwWGN0VXRlL21oN016?=
 =?utf-8?B?YU0xMnJQd1dtVTVJRlJTRS9NYTFJdlVRS0ZVSHJTWS84QWlMYVFEN0Nvc2cr?=
 =?utf-8?B?dXZ4R0JwSFIxOUVQTDd5M2pscnFhMDNYQzE4aS9SU3JkaEVYMjZnTWhMTk9W?=
 =?utf-8?Q?MxUSD4o3f//0yeBPvH6mFTwRb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54686001-83df-47dd-a61e-08dbad5a89cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 15:20:57.5319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlITppTRw/MDjuvEEaZRmK7QQURdSWH4KOiwKnBZIrgpwZKCEhdGQ+bB051ES6E2HQepIjDGNSFGwANkWUXhDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8514

On 04.09.2023 16:05, Bertrand Marquis wrote:
>> On 4 Sep 2023, at 16:01, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.09.2023 15:42, Bertrand Marquis wrote:
>>>> On 1 Sep 2023, at 09:26, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> This using a GNU extension, it may not be exposed in general, just like
>>>
>>> Nit: Missing "is"
>>
>> I would guess you would want it added as the 2nd word of the sentence. If
>> not, please clarify where you think it is missing. If so, then I'm afraid
>> I can't parse the sentence anymore with it added (i.e. there would need
>> to be further modifications, e.g. at the very least "so" after the first
>> comma).
> 
> Sorry yes, it should be "This is using a GNU".

So as I inferred, yet as said - according to my reading the sentence then
ends up broken. If you continue to think the sentence is wrong as is, would
it help if I replaced "This" by "For"?

Jan

>>>> is done on x86. External consumers need to make this type available up
>>>> front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
>>>> the type is actually needed outside of tools-only interfaces, because
>>>> guest handle definitions use it.
>>>>
>>>> While there also add underscores around "aligned".
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> With the Nit fixed (can be done on commit):
>>>
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> Thanks, but I'm afraid I can't take it before the above is clarified.
> 
> Please see above.
> 
> Bertrand
> 
>>
>> Jan
> 


