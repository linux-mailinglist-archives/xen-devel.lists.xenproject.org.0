Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD787CBBC4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 08:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618064.961308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdvU-00089n-Gq; Tue, 17 Oct 2023 06:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618064.961308; Tue, 17 Oct 2023 06:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsdvU-00087E-Ds; Tue, 17 Oct 2023 06:51:36 +0000
Received: by outflank-mailman (input) for mailman id 618064;
 Tue, 17 Oct 2023 06:51:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsdvS-000878-SN
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 06:51:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b53826e-6cb9-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 08:51:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 06:51:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 06:51:30 +0000
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
X-Inumbo-ID: 9b53826e-6cb9-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cESuwN5Yw4ZlFZdaED9+EvMNn2JAYK8A4mnhC8yrKYYQ+PJoOu2spupe02I7jcPuLHZ1adHyXsRMPpdw7KA6KxjcchxPfuPY9pWxPlxyHDUvKTFpP5pe46ECvHevKFOJIPeItShoJ5K9oAE2K3ozy/8fs+zO9joYgMto0Ptgio8dBbOyzqJ8B3iso3Wg83MIQPS57pVdFYaCsCsiU5Vi9OSgJJyOs4cFZCitS5UpgG7pGUTMvgm0SAp5v1ETHQhL0y1WbP0DKUnK6kdN1xAKGWquOuljk3wS5eI/L7i0QBw1R06NalXxDhffDJy9bFCATJsRLq26wPR/DqecdPZDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry6UbNeoxsnonY9lAwDQb65Wy4a9o21j6VWdkv7ewyA=;
 b=E2vmo78k+NkjS4oY0FThVQ/j9CI560lKkuzvsmmVnhB1SfjakgNSh4Tq5XspDwhxI/P1XPaMK2P/p+LaQZfHfV6CnwqAI97qb87VOC/gMrLS47MFNOCzOoUY/hm+tQGAAtI1EldQFIArD/94fuwVImjNvA+zLQ8+HuBZoPajYKf9T6KtTXTab81KYyr31Jr8cOJebbhxAZEBKhNRSIYQaDTSMYg0OSznUOpN62NJ6ep512WbMtJ7Cx4VWwIRfwUjGqPgAKmZWJsqTsEF1VEA7UGOnOqbLu1XKNjf1760jopa+10VLxmtFrHz3pSKyvlfYVKd3r+Rxir6oedKSe3mew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ry6UbNeoxsnonY9lAwDQb65Wy4a9o21j6VWdkv7ewyA=;
 b=AQ7+PeBSRGf1gtyNwsripWeYNil9L1zjScaEftA5aQZreuijzRXUIaN3pk3+UNpiWRRLhCN2RkO3aVkJFb106vnRNujd/K4nwo7O6StOrST98WmOuuKRSO9ztJwp6zM84qe6DSFkiJEWP5imaM9jvxYpMBmMrdacMUiVTAcEJiiPNqpdGxWXVJguwdfLjUiPXDX2019tNK66QiYLQtHAYX/jWH6oe1EJUyF2B0QuUfkI81lGK203TXNFUdrzIHgSHjWVLRIEe4ZbLYj0cODl/kcC7zMLg4NJWjqW9gX1UiRmNNrzWmHAJSazNm3v7OB1gOhEyPvazSvVDXjgqpBweg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2048df4-ec76-f91f-1f17-fcd45f295281@suse.com>
Date: Tue, 17 Oct 2023 08:51:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule
 11.9
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1696948320.git.nicola.vetrini@bugseng.com>
 <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
 <7be93272-dc82-06e0-726d-030d33aee5e1@suse.com>
 <66e27d108e856fcf69f78652daae6447@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <66e27d108e856fcf69f78652daae6447@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9faec4-d9ba-4cd0-ba6a-08dbcedd7de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IOa9NdnF5JTh6i2/ejvsewkipCyqEGmf92cz/KdtbKxmEtoZT4dtr8QWCvhXCaOa4xg3z9njDtl8hL1+P9bTRJ6dhD81NiufNxgloOyuv+ps0QeBckkEu0ffwV7CFshqp+Af+IBT2lAtBQySmN+MN2I2nftILPnjzsqz5rUiqI4p3K3u2Y5yktxXiBTFj9q9gQJR+JriivfoF1IxZXr8d+sH4mH2c+NtOtXlgHyv0Xb9jdNw4LAOgf87LGkhPa3YuNsUmb26yDKEt2YtW3j3oU+oJM6j9r917IA/aaNcPVpoX7XlD3a0ILufpQ/DQfLBT5OMOEkOVhn3003AmHgTERBWWLfOQtXSH/TECIKMP/ojdoLIj/6ZeG678kwDs6OMk1dHp9JBU8SdpjTTK6jqUl1lnlgxfi90Auff1K5B9ymNJ8/XW89YcWsQDEiglzLB/D6rYXccUU7TgHlQU4Gzb5gz6xckbovn21WHoeGVJuHkpETLzdFygWKbnJkiUTgn9MzzVeRkeRlv/ZENjYR55ppTIGq7bsvUfxA1T8Nbq50Pm+ej+9QnfPPGtNgPiDhda8zbr0ROYq7eFLCu52p2jesspK3PjK2xLqTHVKdVSLzKZrOCHcyq8mnUUYFwiYK2WtnyZ6PwFjxwHsUm73Rj+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(83380400001)(6666004)(6506007)(53546011)(38100700002)(6512007)(2616005)(26005)(6486002)(478600001)(31686004)(66476007)(54906003)(66556008)(316002)(66946007)(8936002)(6916009)(41300700001)(4326008)(8676002)(7416002)(2906002)(86362001)(31696002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkw4cXRNM2JZdXN3a3dHRXZhaGJHTXFyMUlPSU9jUm40clk3U0hGTURZdUtI?=
 =?utf-8?B?TkxrWWN5K014SFl2MTFXQm9vaXZjMzdNU2lPL2tHQ29ITCtaanNtdTgxc05Z?=
 =?utf-8?B?akVRd01KK0tBNlBSRCthVFRIL3o2WlVjTFB1NEhSZmdUbFVuaUxZN1NjTzk3?=
 =?utf-8?B?Qjh4M3YrNVlRcU9MS3BOaDhveEJpT1hoV2x4Wit3NkYwOWZweEtZakNNNmM1?=
 =?utf-8?B?T0trNEQvdXB5SWFsb1p1cTU3eTRTU2lYcExZT1puVDMveFczK0dONWkxb0lp?=
 =?utf-8?B?QjJvT01uTUJBUDNJZHpnVWJFQ09PaFJwbXdVL2JOaXJkWW5UTFRpbU9NcnpM?=
 =?utf-8?B?QzJLUFplSSs5NGx3d2Z6UFZmektFTlZraEx6T0lWV2M3SEhhSlBGcTFPTDFx?=
 =?utf-8?B?b2FyUEx4NG94c3RlOXZ6T1JSWWJpNERGbkRTZ3V6NlB2T3BJMC9oZnFISDYy?=
 =?utf-8?B?cCtVa1JRdm1rMlUxNUdqbGc1ZGNTTDladHVrQjBLMlVZbGxxeU1FQUtwb1ds?=
 =?utf-8?B?RU9qRjhXS3gyaWljMGsxVGR1MUk5R0trS0x4WGJEMXZpTFVJenhTWkFnMHVX?=
 =?utf-8?B?SmVZanV5SGZqWnJyaDZsbEpCRENMTXVsdlBLbjhBNmZNbitqMzlaRUZ2bzVw?=
 =?utf-8?B?cGpBajhiaTI3ZkZoRFREanV1ZGZZY2tDdXQzQW5PbEsrdDFja09Id3hWa0k1?=
 =?utf-8?B?M040My8rN2RIOUc5TURkRGloT0R2ZVYzT2lyK3lJbkxoZmVNbHhnV0RXeVFw?=
 =?utf-8?B?SE1ybko4czdRVW1YenNUSHdvUVdTTDN3OGFrRW41QW9FdytSSjlqWXFkMVVJ?=
 =?utf-8?B?V3VJRUEyNHhRZTBoSUlEaVRuMnRtMFdmOWlaNXlpdGpkKzg2dmpBeVdGTFN6?=
 =?utf-8?B?Qnk0bUJ3TEpjZDFPT2srUTFlV1ZzK3dVUlUyS3NsYUZyR21RQVRnY3ZKYkdW?=
 =?utf-8?B?UFdrN1hENDE1bnhYRU80dkxTSDNCdytYK1lhUDFldG1kWU5IUTJxN0g5Lys4?=
 =?utf-8?B?cnhPK3hJVER1TWloV0ZpbWVreE0vQmYwbDk3YWRDTmdTVkNGU1hheEJQajZ6?=
 =?utf-8?B?Z0ZjM0JvZGppMHlDbGE1Yi9uaHRVMk9CUDc0N3U3dnF0YVQ5YllHa1I5NXo0?=
 =?utf-8?B?cnpOb2xZVm5UUlk3b2lROFNFRHJLaHluOVdQa1k3MmU2RG4wbGRWYlRlcHYz?=
 =?utf-8?B?OXN3UW5mbHRFa084NWxZSVI2dnFmUjM5TkhidDRXYUxBODlWUHQwYklITzFB?=
 =?utf-8?B?azlpR2RmVFB6WGxIbTVGMktTVHNkdy9jRVNRWlozclpWdW00bDM0czRvSmRD?=
 =?utf-8?B?TGt3SHd2VERwcys2RHVKY1QwWlFYU0hKK3dKK1JXVm8zaFFBd2owN2hiVFg5?=
 =?utf-8?B?U21JWVlORmdZd29mL1ZNeE9HK2x5bTlNNnBpeVl0Y0RkRnVvSzM2RitMVmVG?=
 =?utf-8?B?Ri9nS0hxbGR1dkxzcDZYSmoyMmdoUlB6bE5wd1pGME1MZ2hRSXlVYXdYbE8z?=
 =?utf-8?B?U2M3T0orV3orRm5lYmh2SkR4dlNpS0JpK2lyNE93VXRpTE1iR3g1L1ZlWjN1?=
 =?utf-8?B?Y3d5ZEltRG5hTXQyZmRMNHgvODd5SkxJVmVGd0czc2ZPZndjWWdoL25yUGJB?=
 =?utf-8?B?R01OalNMdXRYVm9JclJISnU5VXRsVk1mQnJEMUsxYkVXbWVjOWdINDJuMGJW?=
 =?utf-8?B?TVdvUVRRU1NYUmx2bVA0OHEvTHJRMmNGUkZGbHFYeXZjWTNZNkpiemw5V1U1?=
 =?utf-8?B?SElsWmdJRkl0ZHZXaDRhemluZlNwazQrT093VkIvRGJGdHkycmxnaXUxSG1w?=
 =?utf-8?B?RGMvc3dGT1pyNFFPK1BjMnZ0Y3JoUXhxTGNkUzdYSHozTkZUY2xuN0VlK09E?=
 =?utf-8?B?MzY4blBzTGFkdEJRNjlRd0NUM1dxelpJV0FwUHlWMWducDhrZmcwejZqRmgv?=
 =?utf-8?B?OEYvMzVNZXJ6a3kxN2d2UzBsaEFBeGppSXJYK053NndFQktCdXd2REM0QjQ4?=
 =?utf-8?B?QURHT3BoRTVRNlV1dW1HTVFvSHRLVEVYTjFmdENvckdib0ZHcXpyM2R5dEhk?=
 =?utf-8?B?cDdaUm1GYk9wSVd0SXlQL2JyWjVMVXpBb0tqZUR0aGlwcy8ram1KOHRZek1h?=
 =?utf-8?Q?tq3JnpOdqm4SsEyOZirbbrMS7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9faec4-d9ba-4cd0-ba6a-08dbcedd7de2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:51:29.9426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zK76MtahBBYBdUaNf3veTGfO07mme+Esy271CQ6qQHGHw42xi9VXbD1jb+0XcSEiVszTohVszXF6XIXpKBTOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6795

On 16.10.2023 18:49, Nicola Vetrini wrote:
> On 16/10/2023 15:43, Jan Beulich wrote:
>> On 11.10.2023 14:46, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -109,13 +109,16 @@
>>>
>>>  #define offsetof(a,b) __builtin_offsetof(a,b)
>>>
>>> +/* Access the field of structure type, without defining a local 
>>> variable */
>>> +#define access_field(type, member) (((type *)NULL)->member)
>>
>> This is not a field access, so I consider the macro misnamed. Question 
>> is
>> whether such a helper macro is needed in the first place.
>>
>>> +#define typeof_field(type, member) typeof(access_field(type, member))
>>
>> If this needs adding, it wants to come ...
>>
>>>  /**
>>>   * sizeof_field(TYPE, MEMBER)
>>>   *
>>>   * @TYPE: The structure containing the field of interest
>>>   * @MEMBER: The field to return the size of
>>>   */
>>> -#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
>>> +#define sizeof_field(TYPE, MEMBER) sizeof(access_field(TYPE, MEMBER))
>>
>> ... with a commend similar as this one has. (Or the commend could be
>> slightly altered to cover both).
>>
> 
> I added access_field since it's possibly useful on its own in the 
> future,
> but that may not be the case. Not a real field access, perhaps a 
> fake_access_field?

I don't like this either, I'm afraid: This isn't a fake access. Maybe
field_of() or field_of_type()? Yet at this point I'd still prefer for
this to not be a separate macro in the first place.

Jan

