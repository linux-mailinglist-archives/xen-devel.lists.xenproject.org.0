Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43778ECA6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 13:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593823.926927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgJw-0007xM-TD; Thu, 31 Aug 2023 11:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593823.926927; Thu, 31 Aug 2023 11:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgJw-0007ue-Pf; Thu, 31 Aug 2023 11:58:44 +0000
Received: by outflank-mailman (input) for mailman id 593823;
 Thu, 31 Aug 2023 11:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbgJv-0007uY-Ev
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 11:58:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b955b3cc-47f5-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 13:58:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7691.eurprd04.prod.outlook.com (2603:10a6:10:201::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 11:58:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 11:58:38 +0000
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
X-Inumbo-ID: b955b3cc-47f5-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEI9gJBT2nXU3BT9Rodq8eBv2KdYm6X82iLH4ru+v9qPEc/+kHZQo93+WI7Ct1jRwFMBMQf0G7ITCKcbDXfqIGavcGqiWr+stH5TDW4kFA6eTRpp4iQBOy91x6VT2PuVie3JilAjDNrc68SA7FR0VqhHblOGAuy8mDgginlYadMugMBDJH0BQrkwUMQ/eMLVP0kMyueEuIyUvR7T1scDzCvADWpncjWG+FRlNYpQ6hVHJmT4bPvOcZpnb6Q6kCXpSpeowbVlUouGvKpKhfKlKV4rgIpNHSEMgQcZDY+/vPkF3U2EgBwGxYHFGon4mLI3U+m/xLRMdiaHEVtRrm/Zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blwhiB6YHT2OIUW5VwCY2Gkuf2PyeRE4rYDNNgZihUY=;
 b=ZDRiKHi4nSkWrIVA6GlH83FheT6HTGS3fyo09zyYOKiJ+3uwJbrwL1mV2CrJo+j+4MlCrlvCAlbKDyxzTHSxi2kOBhFqWLBGshKNEZ8g3fh0kQaHiG7x+f1wh/Sv3FMKh1yoocefuaP7Y3QAa9NHcDuO3vrpTN80UWSwWoYr4w4w0V1F59Aw5aHO/aiMX9Upcl+xomvvkyaAHVNVPTjxatMjzmIbI6bVU4vh1nxFaLfMsgLDQil6yzidwc5p2T2G1ziGFh5FMZK66e/L65VoqXc2iE9P7+lE/upRFzfsHTM3dGKAQlL63FLyIvCEMb/JqSb5b0OyN0HcGgUj+GLfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blwhiB6YHT2OIUW5VwCY2Gkuf2PyeRE4rYDNNgZihUY=;
 b=SFPYI9gJqdfkCkFvipRCcpcMoLM0hkrsOzu/FOe4VKv1QYNeRGVV5RarWDM1xan2r248Ei3WVJFN6WGcpog3hNtqAFSc4nRntqaNueEFB9n3+B0a/bIr3WObvaB4onRsS2xz2ZKiWI4kzcmEyZmruJfBNvALCpUvOtxZBJWE48AV9lSph1lbbIi56INWtpm1yRHQ5F+vtjN4vnQ4XB8Co8Ttl7hGO8YjvfTGG8Jrmu54BKX77tPVabl2ZEg2wFr+/p6N3pSWwADosNZ/aRClXnh3OltxfyLoRBtSsdoYhglebTw+Ui57yxROf2X1X6SjIfBdEfRNebpOAIZpRXHHiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83d5a136-152f-8ef4-daac-66574f9d0f8e@suse.com>
Date: Thu, 31 Aug 2023 13:58:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v4 5/6] xen/vpci: support ro mask
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
 <20230828175858.30780-6-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230828175858.30780-6-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e45847-352e-49cc-296d-08dbaa199c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tM6gIe1Bp+qGJCqFkTkdHxY+zUTQ9Fwt1Uem/RUbooY8HD7LrANZz+ArYJThoi1Ze1V5pGOpy8zzOUXTOOh4vs05MO/s3zq1zxWt5Ychp/WNaHBbM3QpAxHCTfT3kOyhm9shKE4kW9yTfffxUc7S+7TpixSHy3KaCE4DPjy2RXfj6tcA8yT7MCpgdPaBrXiLihsgNzQkKgq6QyTCI8qlSu7G6Fu5EN04VGlkRuY7ULmLeUTOpJihu9Eob8gSYlCQ66CL/RoxfGH8q6v9V4nBa2AakoGOxFf7/ic3dPlD11ZCpeil4TJ39VUgJ+YOzj0gxqPPVBriD0ofKFMpWiAdA4YrPlqGkS6CSK+f2sb/UlVzX8tVo3LPsNQ6skAcitI8IFjjFYHYjz+Cajew6pQS3BsWPfQ6J0756FOrFlr7hIElSQzTrnNgwv5rP6hrls2Y4YnwRqQ241BkmvFESTN5Z65F9XpjJFXm7lg/feIW13jY0740ZmqXIe9RZLajKrZD7HhZsw/YaZdFo1tWX/43C3X/JnS8Nu2DW/YhCOLIhJp/TVrzJ7mJPOn+caryg9FJLdhd9Flj51XA9B75f1JY/P/iehPVO9A0JDRcrwsDa6EQ1Draqo2J11RwpsAE3vj3R40jDzuXTFtxSY5XNjslYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(1800799009)(186009)(451199024)(6666004)(31686004)(6512007)(2616005)(6486002)(8676002)(4326008)(8936002)(6506007)(5660300002)(53546011)(478600001)(38100700002)(86362001)(31696002)(36756003)(66946007)(66476007)(6916009)(66556008)(2906002)(316002)(26005)(41300700001)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emdEK2xHRWFKcjVLdHpGcUJnZlpadWxpMnFsdlc3ZzZ4S1BWRkdnek9SbDNW?=
 =?utf-8?B?dkY1eVExR0ZzZFBnVmdSbm5zZU5odzAveVR3emp1alhhZlpZU0FRRGpMTXky?=
 =?utf-8?B?bHJ4dVgwWUNaRkdhNS95d1d6cUk3UndJdHNQRlc3ZjZFZ2l0L2dwdmd1L2xK?=
 =?utf-8?B?OTU4S2dlSHc5eEdhNkZydVFmOUNGK3ZENUlOeXpGaVhwck9taXdSM3pwY0hO?=
 =?utf-8?B?VkhWQjJaWGdBbUwvTnlGUHlOSFhqV0xHcDNjQWQxbFJsSEs3N0IreTd1R3o5?=
 =?utf-8?B?R1JrRUNWVy9IekdzbGtrTnlYZGdVUEtkOXVSWFF5Y1dkdVZTVWtUZDVpeTMv?=
 =?utf-8?B?dmFWakoycVNOOTN3K3hYeG93NzNFbE1PcXJWMEFUQm95ZzJxNXZOdzlCczZv?=
 =?utf-8?B?RGExaW5ZTVdCYnliSUNIc0pUb0dkYUJuVmdEdUNXeitNZnArSVg3ejA4K0hY?=
 =?utf-8?B?ZVBaUDlSVnZ4QjUyN1hiR0dpSzA1RjhFMGNGRHVRVXc0U1F6REF4RnJ4RTBh?=
 =?utf-8?B?UDBtTjJiN0g3U0M5aDlMMEY1U0dyVmNoYTNSRHFnTlI0Mm02NGpzOGR1VW50?=
 =?utf-8?B?OXhnYUEyK2ZNbjlQL25Zc2V4RlRuelZvWEo5bnpIZ2pVcFpRZmZsNmlKcEhB?=
 =?utf-8?B?dVR4eDBKdzFRUE5xNVZsZ2hKZUJsMG8xUTFuUTg4YWR5TDFremo5a2tLMHFN?=
 =?utf-8?B?VU9Mb1JUWkxZMmE4TUJ3bjlhZWdBSkM4R1ZMZ3MrRksyQkRhV0I0Z2EySU1i?=
 =?utf-8?B?eWF0eUQxbVozMnduLzRQUWNQVXJOcU8xek1DcUJoRXVzTkQ4UnpGemNXUHNU?=
 =?utf-8?B?dEhKTDRQWXpzTndUNmRHZklrcytiTmR1Q3RoejRZTGo4cVJBdG53U25scytB?=
 =?utf-8?B?TFJwOWpKejNud0F6aHlSSktYMmY3RUZ5Q3hGN2hndmh1WHBDQnptbWV0MFAx?=
 =?utf-8?B?NzVtQ2VRL3NJMnVLdkxObXU2YW9GbnNQY09kbXMvWHN4aGl5SlQ4S2s4dDd0?=
 =?utf-8?B?RkhMMk53UkxwQUE4Szg3MzNncFAvNVMyRHk2T3hieVFSeEFQWHFmRGZFZUdB?=
 =?utf-8?B?MzJFQkZvUlRjSnlqTE1yUGdmdnJYa3c1YzdzaHBHMng1d3RQdDU0cGhYVHFa?=
 =?utf-8?B?dWV6SzRBVTdQOEk5MDFlRVJkRmlUVlZPaXdnZS8rQW9xUHM2dlZWaVJqdzVo?=
 =?utf-8?B?aXhBcStQcmROSzYvOUlOQzhQN1J0MVVGV3ovSHlUQ29mV3VYUnR1bmR5aGhE?=
 =?utf-8?B?c3hMYlNGQklaUXRaR3FQcDhvS1l3T2cyRG1oUHBITUVNdVJyWEVxMnNnWGZy?=
 =?utf-8?B?WUxWZ3JSZU4yd2R4ZFNmWS9RemtVVGZ3RlFHcWhEam1vYmJGc3FMcTJGVUZk?=
 =?utf-8?B?NC9CVWsyUFZ0SWN6MEZXTjlNWjRVNHpJaDZhOUtCcWNYYVFnejNoSnp6OWhK?=
 =?utf-8?B?NTFFQzFCRFh4TTV0OTlybzZETkZ6ZXhSb21EOFF4K0dVTjI0NG95Q05GeHpv?=
 =?utf-8?B?SVNGdE0vNWgxNldXcGc3Y0Y2K3ZjL1ZhakZibitRYVFtdFV6YXlDZ0VvdXpN?=
 =?utf-8?B?VWhnOXg4U0F2aTVKaXlUN1d5V1EvWjMxTUszZ1JrZERFTXlCcStBcVJ6czh5?=
 =?utf-8?B?bkVYb3orWmI0Q215ZzN2V1ZicVZCOFlWK3V4M081dENzUFNPTjFrcnU1WW1P?=
 =?utf-8?B?d0x1UCtGdjh0THpHdjl4Q2lCamNSTVFzaVRFbHZSdHdwOXFnUktrUzhuYWVY?=
 =?utf-8?B?bTZodkVtSjVFblU4elhtUlpVb29NWjh2c1dNYis2cFN4enI0cUs0Q0dNb3E5?=
 =?utf-8?B?TTRzOXI4WDdtNFBsWXpaQzJwMkxnVytBMDF4WGtuaDYzZ3Y4UTYveWF5M2dW?=
 =?utf-8?B?YnhlMjhBa1hBRlByVERVcVE5T09XeG55T25oRjJ0amJrTVdBM3dTRjNmcFZp?=
 =?utf-8?B?QzhUVWxIQ095citFWVgrZlVKSlBBaGJTbXc4OVI1U3RuOWd0ME1ESUMyMHhS?=
 =?utf-8?B?STYvSlRVMnRiRTFSRVJkOThmODlib2VsZWVCU0ZmVHVuSzlNbEZ1MU94dFhS?=
 =?utf-8?B?SVh4SnUzZm55RlZmazVDRzRPVzl3Q3F2Vmo4TWRybjNLWTZsSENLS2J3Y2F4?=
 =?utf-8?Q?1aIa28wRKazcI/vK02t8WzLG6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e45847-352e-49cc-296d-08dbaa199c65
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 11:58:38.0186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCbkk7OOI823SLG1GJepGPLCrSFmbWmhjE4zEypun4NvOxuoZSobwiNuM6Qhdly0iHKAV69ChbB9y7vDbUO0Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7691

On 28.08.2023 19:56, Stewart Hildebrand wrote:
> Add support for a read-only bit mask for vPCI register handlers.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v3->v4:
> * new patch
> 
> RFC: It seemed like a low-hanging fruit to add support for ro mask. Let me know
>      what you think, and I could squash it into the status handler patch for the
>      next version of the series.

I'd be fine having both in one go, fwiw.

Jan

