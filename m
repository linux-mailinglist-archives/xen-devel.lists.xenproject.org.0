Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800847CFC24
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 16:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619381.964332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTiL-0001NY-PA; Thu, 19 Oct 2023 14:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619381.964332; Thu, 19 Oct 2023 14:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtTiL-0001LU-MU; Thu, 19 Oct 2023 14:09:29 +0000
Received: by outflank-mailman (input) for mailman id 619381;
 Thu, 19 Oct 2023 14:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtTiK-0001LO-Te
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 14:09:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d3f317b-6e89-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 16:09:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8729.eurprd04.prod.outlook.com (2603:10a6:20b:43c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 14:08:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 14:08:58 +0000
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
X-Inumbo-ID: 1d3f317b-6e89-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRF6/EkvcLeNxtUj4Xq3q1dOYBlgMM/uAufi1gtF+1VGji8ejn8X2tw5p5XNdWHB1f2/nXjsmAAZ2Rg3bXTte0a7bu86HMZmfrOwLFY9Ba2FXR+b+Ufb8JsQ/pMPdrICbCbymGkZFMpZ0xHvgQDvoLyM6tOrbr38krvJQ+5GF7Pk2mGrU5gZjUBA7DS7AWvBIUNZWOMPNSwa+04m5CLzQ26tNLSRIYAtOD2Pq4sZQn7USyIWs4bQ9TuQ4XAuQ55U5sjwJNDkrJJAtrdpQ/7EkzwH5yjEyMo4RGHgAdczs73Ixi3aEPovrguznnPv1SwJ6BCYSzicBGs7SjZ7G5yi9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPup7S4KIZEraNfVdUvnWqiHO6xFnRZxMLFUrwwn6sE=;
 b=faH7eWZO9e3NVH0TWd3o7jTgPVq76k+PlFmCymdPlojGPoLkmV6k0bxWwK87NsMt49rCAIMtBbWh8YHis2OjJWKF55tCeFkllnZB8Ih3zxLcAQBzgpJJwpoV1ELUAKfK24Y8hPP3FgZKnrsCeGG89FOYDQ4EcRSnq3SSqVA2UAQZZEkoNXOmlEvsoENGbVp68Uf13WHwRz7epgjqMM6HC4lFWr/wCUxh7PbI+cq1UPWP7vVBJURHzIVvKrblUiTujjr9m2JThvpHgfbxInd5+YMFUUIJ4+aU+NCjE+czr7b5BSdEbAqNLOej4S3pPoAmv9qdjWPnXfH3+R/2D2Gc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPup7S4KIZEraNfVdUvnWqiHO6xFnRZxMLFUrwwn6sE=;
 b=FNDndr/oJlbp5Au681/PjBNfpVTUGIcetQm/gbMuAxdUFCnr1mqxfiaJhOPs8m0v7Becahv9BaYrA4BHuIV4iMNLKXkekfNcW5zHW7YGbFkr8tCwqK4zEtcFC41n9ZsbnEse0GEcUHTtBfyyFvWuDzaLX0v7J3LfDUCAP9X9xnJHplCtAtGhQmgDIchjtiNDgZOKE6xLNDbp8DKiKcpBvxBey7SRyEQKVZRvvNhKpvPGaQcoOwPjTRk4R5vxfnA/ob/5hT8wlc5HUf/9ZVJPWznvDtd7XtaDSrYOWkcGY+VWIRUbqHvhEGY4cT7IYgVyzRXyYNr2VOGTipP4aF3Pcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b60068bf-4afd-d650-62f5-b4ac1717ed3b@suse.com>
Date: Thu, 19 Oct 2023 16:08:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] EFI: reduce memory map logging level
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <16a32be2-6982-2463-3d71-383a21d7e074@suse.com>
 <514d207c-fc27-405e-a71a-6ac24bf4184e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <514d207c-fc27-405e-a71a-6ac24bf4184e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0303.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: cdaee596-5fe9-416f-20e2-08dbd0acf03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ny3ICUcoXks57hBflkHZmqSycHmhDj5f4SJ8YkIQQVesGYr1Wtxf2r27u9qqHznu/aaX2cOdaGbDIg0gm1eoRsDNBZzs6w0DBC/OUtzJFgfHBTAX6Py9ffyHjD7Mc7qy3hID7eedUBklJOsHQ4egegKrvqaojt0cpRusEjoZZQAR8NGNlpiTaYngi2mmIiJogOFyzdlqY66MX4eQgI8tcfs9cIA/fzJLp1eBpnHsxVWdFiD1opr5T4NpXfW2mDlRTy3CEhBs+ciFrkVZo8EWXjmQsnhflqGtBfUQCdivS57HxfmNepvZa/ajwAKLw7rRrxsBtALPVl0kX5Gnvt3UK8L+jj6B2EB3qkvcmT0+9wfoUlPKAeYV1A8LzFqEiATMlLZ5t2pFwoi86V5kS/fhGyw0xyE+3UtUihUzm6uqTY9pagXEtGwlfENIuxdFN2ShB1vtDa827S9eusjhBj8Ys9Inua6IKPt/1nA3Il7DQFE2SRAY4A1i1IQi9++HLc8KpyqJYin/DF6vTmD2GlfibYDArp8UHuhZoXl2SFsSNd8IQP8PaJ8/7QndyfSwrf2sMdLoLa6QiAbuMDNj2wV7eBFiklJBP7KmXRZc68yB31V9ZDum7fCi5fAahkwLVX545oAI3M9iAGFMWeHSOJisfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(66946007)(66556008)(66476007)(6916009)(54906003)(316002)(6486002)(478600001)(31696002)(2906002)(86362001)(5660300002)(36756003)(4744005)(4326008)(8936002)(8676002)(41300700001)(2616005)(38100700002)(31686004)(26005)(6506007)(53546011)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDRGRjdZa2JodVlJaVRoL3hXZUJNWDIzNHVueFoxMTE5dmgrSWRTQ2hzRGd1?=
 =?utf-8?B?UkRIOTFpT1hBUUdOU0k0VzRoVmV4TmR6c3BieHBITW9rTFc1b3BkNExKSjJu?=
 =?utf-8?B?UndROTVEQXNDeHdqMmEzd1B3Y2ZMVnZSL2J3WDJoRXZhNDVpRnMydkZrakJ0?=
 =?utf-8?B?NlZoK1EvckZILzdQM2hJMEMyc3RBYlZBdkdTV21zdXJmeHgzbFUxMHJQYU5j?=
 =?utf-8?B?OHppTU1mQk9MNXJ4VlJLU09wUEYrYnc5UWw2SlpkWTBjaDVHWWU0Y3F1VXRF?=
 =?utf-8?B?VC9mWW1pcHZkU0lvYlBJRk1rVWdKRUxEOHo2bE12azdYdDdqdk9XVjNCTWY1?=
 =?utf-8?B?TTF5SFhtUHZCZHdndVR1NGQyNEFsalQ5dlNjZ0NIM24ybE1WWmxTYzhRaXc4?=
 =?utf-8?B?L0ZPUWFRRjhaWVJCeFI5VWdaVW9Lb3RURUI4QncxRzFreEtWYWFWUzNyV2hK?=
 =?utf-8?B?WlpROEUxMlZNVGtkMUNzQWo2RXF6MGhIVWU3bFU4VXhjaTVvSTB2TEtVUWVZ?=
 =?utf-8?B?QlYzaGJMdENrZnBKSDlCQ0VCWk5Vb3ZyazN2ZFQ1MFUvakxWZ1crWmhCRDRz?=
 =?utf-8?B?ZWJESjFSUHE1Rkh6bUJjVHV1RjY1aklpQlg5czBGSVRUR1ZtTndLdkdmbGZ0?=
 =?utf-8?B?MjIwZzkwZ0dzc2ZzZWtXSlhCaVdNcnhuMXR5YlhRMmhEbFgyQk4wRW9BblZG?=
 =?utf-8?B?Y1Y2ZTBuUnVDTm5Fd01DL09wcWFhYVNtRGF5ZG5XOERwUU92Y1kwWkloUTAx?=
 =?utf-8?B?S0U5cnpkVmlEUWNCYnRubUx6LzJ2NkliL0F0cTBKaXhuajZxc3NsbkdYVyty?=
 =?utf-8?B?T1BYaWNUZ2dndG9PbWNjMi9MNFNCbmFEeDc5ak5Ta1FScG1FQ2IrSWlzYkc1?=
 =?utf-8?B?eVprczdFMm5hQzBmTHREVDRhVGRjQ2pHcFM4enMvcG1XMVNSY1VubFRUdGpj?=
 =?utf-8?B?S240UmdRSXRXNldxZi9vTC8rZHg3dndLWStQMUxtOTllY1pBQWk1RUY0ZmhS?=
 =?utf-8?B?NFpqMUFPQXpTT0F6YU1GK3ZhT0hneDQ4Tkw1UHJySUJCak5JNll2SFA2bmdy?=
 =?utf-8?B?cW9UYlNmblJlOFZPcGhuSFEyVEJJVXJ0dnlGQzdhcEhBYWExT21WTllFemlB?=
 =?utf-8?B?aE1ST2orYmVYdk1oTGpXT1dyb00wUnZTOFhlYU1QdmNCRkl4ZzJkMnBibnZw?=
 =?utf-8?B?bnJ4MUU1UUVGYUxCS0Z5L2VWNTRXeUlIUUlwdDFtMEFHNmFTOWNIK1JPT0U4?=
 =?utf-8?B?WERabERnNGphTU1sa2RkeENMa09qb3RyT1V5NFZaNjJqZkpLcHFHc3pZQ1RN?=
 =?utf-8?B?bk1FZklDL2hKR2hvcnRpUEFQTy9EWld6YkRtTkFsMEFtbkNvNXZITXpidEta?=
 =?utf-8?B?YnJBMGQwK2pScUVQdUg5eVNGaEo2Y0dISFV2WDUzMDFRTGNjbndYWlVmUGdq?=
 =?utf-8?B?cHcwaDE2SWxpTndyMTQxUGwyVzFYNE1ua3BKendaV2FDMFFvVGVibmk2em93?=
 =?utf-8?B?SVJpV2FZK0xpK3Y2MkprQStCdkpWQkVBd3QrOFQ4b29tY0FWQm1IT1hWTy93?=
 =?utf-8?B?UFpIejNvY3Foc2lmdVh4alpycnZaL0RCWnRJTU5TQ1NlVGVNUkNDTGJFU2gz?=
 =?utf-8?B?SG5oV1ZJRU9RcGV1aUhjakZicmx0UzVEcTBGcXlnd0lJRXNGVTQxWk51OUZm?=
 =?utf-8?B?K0VxRnhZd0haZEExaEZzYjA0UjdvUXEzeFhaSHpyYnhUQWdwODUxODVrRWhY?=
 =?utf-8?B?d3AwbE04d0lxaUtoYzRpSW5zOWpwZWorR3hNN0RTc3duSjBrZjR2SDRuYlNQ?=
 =?utf-8?B?T2pDWnVzNGZqWGJ5N1VUa0NoOGlZaG0vRy95OW1keTVvazUrV2lWNWVaSkdL?=
 =?utf-8?B?THRVSksxeEcyMVliMFY3MGZyZkpxK3AyYTFLMXB3a3ZZTkVXNlNFL0Flak1r?=
 =?utf-8?B?RHNkalVwWkN3alV1YUxtMTlWSEE0OUgyWjFNRjdDZVgzdmg1bUZseGpOTEcx?=
 =?utf-8?B?WTFuSmluZUdxT0l4VDhwOG90MDZKdll2ekQxQldMUDVCVFlmbGl5SWZ2TUpR?=
 =?utf-8?B?NjlUakVsRXFia3g0RUw3OHZwM2RsU3NIOHdSVDFaVm1mbXgrS2RBQ1o2eldB?=
 =?utf-8?Q?A4dQSJj8DOzL3ozFBNdjd0jtV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaee596-5fe9-416f-20e2-08dbd0acf03d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 14:08:58.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vg8Bo98xNAVi3DFZJCibEFrXlo12xgjH2AcigleaccJrtObag2oy+JZXMW3FCIJt6wnuL2FEwUYwjs6cHnr/RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8729

On 19.10.2023 14:15, Andrew Cooper wrote:
> On 19/10/2023 1:08 pm, Jan Beulich wrote:
>> With the release build default now being INFO, the typically long EFI
>> memory map will want logging at DEBUG level only.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> Honestly, we need more pruning because we end up printing this twice,
> but that's not a change suitable for 4.18 at this juncture.

Hmm, I've not seen us print this twice. Can you give a little more detail?
Maybe I simply misunderstand what you mean.

Jan

