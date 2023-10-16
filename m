Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ACF7CACC1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:01:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617707.960577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP5H-0007i7-Pc; Mon, 16 Oct 2023 15:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617707.960577; Mon, 16 Oct 2023 15:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsP5H-0007ft-Mv; Mon, 16 Oct 2023 15:00:43 +0000
Received: by outflank-mailman (input) for mailman id 617707;
 Mon, 16 Oct 2023 15:00:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsP5G-0007fl-MJ
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:00:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c655b970-6c34-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:00:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7291.eurprd04.prod.outlook.com (2603:10a6:102:8c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 15:00:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:00:39 +0000
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
X-Inumbo-ID: c655b970-6c34-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxz5dPWM3mm/vlQlUKWo7YskWR6o4PN58mrlakFeQu9E9QUKyxQGke4By5h192uLpnR2QWXGEA32N43EVr8KJHyopndst/o6CEfFCIQzlmH6L19bFzoqhPapeq/y01JviYrwh/cuoSO0+GaqEx6f7HBy8Zppdn9fT3frV+AdCf37Kb0AuhxmUFADk9wDQkcDmh8kmvR04ZN5qp/AXgQSj+4goXOV4krLpiPvytLRvceJ0pmgXRX9yHlpBtLfUoabjAlUDMFbmR9pmO4oKUv0B2wF7dPAPgYhz0jiz5aUaw6ZiuE0bEcdhK9H/7QxJC7zLQhPtlxxqvIm6+vjMkkV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg9/GFYyGyUVGOQjMU63LgqXeYDpBC2GMuNdmMdhzZg=;
 b=cmBqqOaTGEwBZ6bRCvi6EP+opPpiQUda8cMWGaIkLMHoW7WE8IPsPjF/WbqwEJjDiu6Do4B9dAY8VIN0W3lFPF0zt7LuG0w2Z9YAep2v4KK9U4+cj4OhN4PGy0XEuLh6BxS7pVw23g6Emiq23knUahf0zIHsXMApoo21zjnd1SuRWs4hosmRI8XLJCXSG7EQ5wb8R2ZqkHUntPUbZyu4w+1HhqLuuuHaX+d1LaDPX15GG8S6YXKdNyt7tIFqDdnmiBdRhli9whQXgMWSWej2BStthfOCj38MzIOWRtdqE/MNKqF98kGOOCBPKHfnEwIRfADtC7I3OyYDqnCyKKqdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg9/GFYyGyUVGOQjMU63LgqXeYDpBC2GMuNdmMdhzZg=;
 b=eR1tTsCHuhuzNAJgjMCQXxXW59Gr+aj8wyednMEMgaMMOuVd+xZEto+Q/96BLbiIz4UFBO07Pbh9c3xR+1LUAIVBT/Expo7GBIp8MT4TPR1yMhIOkKbOM6wqJdY+oN0QZ3wqslfF5PPNRZ7MB/IjueJWqNjf4EeutY5qqUorvWDDSWkL4nTJNtBIoxV9aVOjeOTLD3U7s5do83O9g0BgdE5p7nbgedTWPCgq1z6rTLsL4MWqBscW1CfChwYXPtgBoOQlRuVSQBMO9tE9kzxu0jvj7WWOZBYGpoZh5VPcJeRIkiK7WL390D8j6n06o9ywddgIKGjn3FF8ZXqfx9bqLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <741e81bc-050c-a773-e622-997b6c0b8335@suse.com>
Date: Mon, 16 Oct 2023 17:00:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 3/7] x86: add deviation comments for asm-only
 functions
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6476706490cc15406bcf3377a57b7c4a303c4901.1696833629.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b6fba0-0127-442e-8289-08dbce58a922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M19eZtq5b2M6I6DUMLAgtRBMLDusspg9sBIIhmrMTArlKZdhHiMp7Gco2khpC2udbIjz+UszrMj94sE2scJBpIsNIwOp30OEBNXJ5tJU+ec2k5gJUEC6f3Sbl4BoOMHCOeHblK+lY3qav2iRbfEH+zaeAjcuE8c/kOi9dwAWlTgPHTcDmf+N+SrSMRDKEpdOvoBcfJNNJiHAHs5awZBwN5oo5WsoARJC/B/Q7QMXj4YDE4ZhLmEbJ8N/1zb8/xtT/u/5QO6jxGWPfV2Kqrhdf1I5XegDW+k+oBR81VoHs7AAIJymjeWx2i0RUDgR3O+GfZ8SPfodbH0TwSrm7KSMjrRa4TE2dl8fYRRu9XhE3pkZ2MH6A0FCTnYfE6ncIEyU7CDPlsdMFP4gDxoRmAF4Cabj9HiwHsLNl2GthQN7nUOyTYMcga9gboQMhCoTi2OTZzBLn5t9BkPcGl2p0CBQ+aTDsQ8CXRutm5/bhDGWvKmrPMescsgG+YWy4L+sREjJ+F7pArzWTYe86eZdlioG25HybpflPjaA6vmo8k0g3HhxGXOddz4h++usL0LFJxaymDfCOCCOFDvTG1PUEOtnElg16N4hEfP8zYPvw6v34in/Bs2E1clswcbcSaTpK6zdsdSxlXAdTotiX3OYmOg8lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(478600001)(6486002)(66476007)(66556008)(66946007)(316002)(6916009)(86362001)(31696002)(38100700002)(6512007)(26005)(53546011)(2616005)(6506007)(36756003)(41300700001)(4744005)(5660300002)(4326008)(8936002)(8676002)(2906002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTFZbG1VNS9reWIzZUltMUFpOWFmcUtYYzFqMnJhVlBCMWNpemxjTUhVenh1?=
 =?utf-8?B?U05VUWRCMDZjVkZvcitkOXJHRjRUYjlrTFNyN2JIWWhtUTBWYTBPN0pZZ1pD?=
 =?utf-8?B?OEZTWG5GUElFVTFhRERMUS9hYlo2ZUtrNlMvNGwzamtUdnAzbVdxQjRERmdO?=
 =?utf-8?B?VXc1YjNGbVNsT1RjbUNUWDJqN0t1TXROL0dVdEY3RWRMVTBhUGhYQmp6eG96?=
 =?utf-8?B?QktSNTU3SSsxb3M3dUNJVUdXOGU4aE1MaGhqeldNVzNEQTBHb3JZSVBUWWpQ?=
 =?utf-8?B?QjVieGozRUxzYTI3MFcvdm4wZ3ljVkk4bCtaTWFhakswZER0V05DOEtoSHpl?=
 =?utf-8?B?VGJENEZnNXkxMmhLRFE2RDE0dzRIbVNDcWxUQTltUCtWL2E4amZRUFF3cmZ5?=
 =?utf-8?B?RDFWMVpXTUpLZjMyNTNkZ1VRS3ZMWFg4aHYycndsTVA4azd0TDJJK1gyb2No?=
 =?utf-8?B?WTlHOUNUQjNGdHBGUDFUUi9SYVh6YTFReTYxaFYwR2FYbmloYnB4OHFIWU9o?=
 =?utf-8?B?NFhGT3dxOTdDQjFxUXh4TDFHekVwc1NSYVJPaHNaSzFGamUxZVFHUld5a0Va?=
 =?utf-8?B?d3ZYWnM2ZnkxcGU5YWNKWXpSU2JaajFqL2JxUEYzTC81aEtmWU9Wam1VT0RF?=
 =?utf-8?B?d2lyd2JNaUx2T25WTFJQK296SmdVL1hmc3o0eVRPMkhUd1Y3anpqOXJPUm5P?=
 =?utf-8?B?Wnh6VU00dXlTL2wrZGcyWWFZa0JsVWVrRlZzRG1QZGcrYnFGaExWb3lzYW0w?=
 =?utf-8?B?UUhBcmdIVCswVHpkdUNXY0FNcEJwdDBLN1hZZWF3V05NeTE3UlEvaU9tdDhO?=
 =?utf-8?B?NDRwTnAzU25mRjBTWGYrdGIvZTdwTDlnaE00WWl0eFhVWVZhWWUyaEFoTkhD?=
 =?utf-8?B?SFpscjdXa2xNbTl1VjNHby9oTXM1c0ZNb1ZYSmw3NjZXREVZSWVzeWFtTmpW?=
 =?utf-8?B?ZGVTU21oSmhtYkE4QzM5TGt2VE1oTGdhZnN5UTExVGJqNGJQb0puRnN2bFJn?=
 =?utf-8?B?MFlWSWE1SThCQjVPT1preitVVnlyUkliWVJubDVqM2IwbUljWHgzYzBIMGxu?=
 =?utf-8?B?ZWpFeUp2bGZVa3NJRWR2NU00RTF5WW05UU1SQXdCY1hVZHh5OWphZmJNem8x?=
 =?utf-8?B?Z1VCb0lCOHpDWFN0dVNFVUdFOFB5QlFzMG1VbEpzcmJsN0x4c0l3UTczdEtS?=
 =?utf-8?B?aDZKRDFSUVNyYUhHNjFKM0tsbUdtT04zZUl3NHRRUGE2MzVwOG4zZWxZcGdT?=
 =?utf-8?B?N2VYbTN6angxN2Q5REhBQWVMYkZtR3hNR3NLM2JlWm5sUnczRDBjbjIwcE1F?=
 =?utf-8?B?Q2lPODNpTk5FWTFHYmR4NTZKM3R4Ukx3bFhoSGtsNi9MUjNEUkQrZjMwR3ls?=
 =?utf-8?B?bzkzd2JaZk12Y09IRk1iT3dBZUlHa3FVUXJEeElqQlM5cldrRkY5a2ZIQVBQ?=
 =?utf-8?B?dUhwU2szMmY1NTVVSVhPOVN5OXlGWnZXZ1R0TXpDeXhaZXhJeVNqR2JOMWZR?=
 =?utf-8?B?WnhyV1VqaktVN2lQU08wTXpQK29peFlFNm9NaXVBNGs4eFRjb3lGZGVpMTE3?=
 =?utf-8?B?eHFPL3VuOXpNY0FpWUEvVFQzUXlCL2xIRmhjR3YxZUUxM2RQdTFvNnlVWGx3?=
 =?utf-8?B?czdkV1pOUk1aUWNpTXQvTTRSTlVKN2c3endYZTVWSzRvN0dyZCtXNkh5Kyt5?=
 =?utf-8?B?cEFkUUV5SlFqRU5vcW1BWFZpMk5wbzZzakJESVJPUk15c0RaRWFFblZYRGx0?=
 =?utf-8?B?Zk1NVWpDTHc3T1JJdTBBNmlxOFAzWmZWM3cvdVdnYURzSHozU0tXRUlYZ3Bi?=
 =?utf-8?B?dkpFL1Y5TDl2ek82L0Mvalgyekl2L255UkZYTjhZQkRWTVMzd0NuY3RBaDcx?=
 =?utf-8?B?WUMxUENMWVB4ciszVGRpZXNIME4wRFhxTDl6VUUvc3Awa1Y3UzhmdllOQkZ4?=
 =?utf-8?B?bE0wUnJKZDZNSHhuTEJvMkZIZjdZZ0tMZGc3NWh5VkIyKzVPSm41c1U4dG9R?=
 =?utf-8?B?RjRYYzBSeWdQMWt3UG5YK1lGYldTQ20wa1k0OEhPZDBrazdHaDI0RGtMb1JP?=
 =?utf-8?B?MFdWZXphRTRiRjdFL2FXS1BXTlVGRjZGUnZ4SVdmamxPZ1dyeWVvbm1EN2lF?=
 =?utf-8?Q?wTRZp5ftvXMtdKsn6RrrOvko5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b6fba0-0127-442e-8289-08dbce58a922
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:00:39.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6rOLcP5i8bJVGkk0/Smi+Mr6fOOO4hkXh09rXhBKOAJtvh74i7d1Oq4N+TUpnFCQA8tCk+bCrcHY9EPXw9y0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7291

On 09.10.2023 08:54, Nicola Vetrini wrote:
> As stated in rules.rst, functions used only in asm code
> are allowed to have no prior declaration visible when being
> defined, hence these functions are deviated.
> This also fixes violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/arch/x86/hvm/svm/intr.c      | 1 +
>  xen/arch/x86/hvm/svm/nestedsvm.c | 1 +
>  xen/arch/x86/hvm/svm/svm.c       | 2 ++

Once again - why are you not also adjusting the respective VMX code?
Iirc it was agreed long ago that scans should be extended to cover as
much of the code base as possible.

Jan

