Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C942377F605
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585355.916435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWblW-0003kv-Jt; Thu, 17 Aug 2023 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585355.916435; Thu, 17 Aug 2023 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWblW-0003ic-Gm; Thu, 17 Aug 2023 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 585355;
 Thu, 17 Aug 2023 12:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWblU-0003iW-IN
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:06:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7477a833-3cf6-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 14:06:11 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:06:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 12:06:08 +0000
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
X-Inumbo-ID: 7477a833-3cf6-11ee-877b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnKF0xnDoYxOObnccClGZ5Pzvm6dbh3nxj1eq/7Lzme6gFR6TDjUSyt9y1+gFI4oRdK81JXetH6aNIpnB9MsjL57tXnsG6sQZMhHoHKn1jC0eTt5aZg4O2+RCUSNgAWgQ7HeJaNcfPX5IYyTpDhpCrkW5m9/RmFtRJ2/zLQ3H49vnzS1OixJrvZZhDXP+G6zRjG52InnwBOWW8HKpEfLql5iO8rx1UCa0lLYQGhmcyzrgTdKgOwA8HwtDmBqx5MycNEu5K0UAhkvhKJv1sStsTCOOK3VjS0wYm+3qbAUk6lFUJnNhB/JrRYrqqQa2Egwwf0RSTEI1nkSIejNWAjYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mPtjayPNCJ8hjLQ4QXzKVfpGJcoAG3WNasPcDQcPaE=;
 b=Vv4Mtrmkxs8NeMNvjxaRB8XLHLlFcYUAk+RytlZ51MmlMWSJ1XTVBIjOKXO/ws2WnMayB64yrSm2nWHGdZfnMHxf5vGGjJwiR0hRJ9s1OZnW1jd2db8hGg6rX4GSad8iHU1Ed8H2MWCfu5KhGzrlWOlChl25eFwff+X2R5BCBmieIUfw3jjsFx/6/j2VO/kTNtm0pRZqwNw3D4Ie4GU/WCdjqWbOzy2JZYy3TH/+B8z5cVECzaJNrnyIBFjok4Ha1vhLjRvDrTDW1BvNvd3yqRGlLTF43Rq/iBXDXiCXj+YkPanbvD/u/tiIDJEvPiWTn2iombFjDpVSVwgvTo6tbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mPtjayPNCJ8hjLQ4QXzKVfpGJcoAG3WNasPcDQcPaE=;
 b=D7CYHB8DeD0Hr711e3GYxOn/wJ2fUUCEg+sF5tbR0x9CPyLf3nuVG0iRAYaMOfl8DOds7GUvpg3DOchlppUcvuAgzXkrCJ/H4fZPAPUvh3H8cdkNXtNiwIg6Pl6tJXWl0SF117SzulcumBJbvdaBuWaRTAoWlL8kzZ5W3wQaS6BE7ncPgeJScJRSNyLx/5r9+Abbd8RG2P29e5bEv0eMU2GYSrATZqVyCJLlBGE+xoGqgjXWtkSkRwopOJMvxuZN1D8OQSLzXhYFncrmv/aMfxOxGg2FVpkJhxPQPHu8t6I0zCeI2rFFB19DoRsh7Hq09jRmH3qdV7TIepTZ5m9w5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9b17fe9-f25e-ae88-a00d-68e404968704@suse.com>
Date: Thu, 17 Aug 2023 14:06:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] ns16550: add support for polling mode when device tree is
 used
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <88bd54876c745ef45eb740274fd36d747c7db471.1691767729.git.oleksii.kurochko@gmail.com>
 <aa19cb1c-a437-7eeb-d727-3cc9867ac307@suse.com>
 <435d10e37bc86f50292e29c99ae1c6b6d9cf1a1f.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <435d10e37bc86f50292e29c99ae1c6b6d9cf1a1f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e9f7a2-e739-4068-0956-08db9f1a5748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BaiLLfA6BOvuaKZWXHi/jrOCSxtHMcrZ5cqDGf27vNgIK5qhWuLhj2zX7ZKARdAGmDbu545JfyioXUKVWcHLOiiNHD/CqImcZDXEBZiVQMIk0DreW/Mb+1KY4UrrAx/qA1Uj4tieOdzaVfh3t9UJG9aQhIktS2fT+dc91TZoxMCkx9XMbcmqr1My4HfkveO2axp0mXjJijS0nLi7H+y/0pnzhnVOLQGBINFwKo49GaVaMPFARthBGyd1zd6u1tZgEqolSuTIp3ywz8fMt/NyWHYD8O7VgT5qNkLJdrIeCiFma5TtPE3COjQik3L/F86CNcqNt46t/5bNLhrhurwUZpZGavlFB+EmvA8KYedQcyL6jFuvlqVRY/+4GHpj8ePfoxatt5kgOmfDxkE9R7zjLpLoF156wEVCRBC79+pIhVzWqFrYf0TInvxl3qsfra8TCt0McsoGNk0bni+qweZxV2v/wFOPzWJcr+cL4ELvSsERENO6KxF5yCMDzoFXS7YG+yqm4PNE8ge6pfU08/mrTdxeF3a63sO/8ZiPVClR+lSep7Q5bvqQ8IYaEdAtcB2BDn1/TSATmm9r0+Cq18jQ9i8Badt6aiFWAt+reBMF4dIS7rRb/Bb1eOzw/d6qYvUMkXsIcBOieAFk7/DfJg0hog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(83380400001)(2906002)(66946007)(478600001)(66556008)(66476007)(6666004)(6506007)(54906003)(6486002)(53546011)(6916009)(316002)(5660300002)(2616005)(26005)(6512007)(4326008)(8936002)(8676002)(41300700001)(36756003)(31696002)(86362001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V28xeHdQZUhxZWdRMU84bXJKbFJIUXB0OFlHZm9ZKy80NHNadHBGSm8yYVlT?=
 =?utf-8?B?ZFBnZWQzVkI1SEdFRXFUMHJ4VmhWZFljWnJUdGZLZjMwUGNrYlViVklvQUl3?=
 =?utf-8?B?VG9CN2lHQnNaM1p3VmhpRkMzN0ZteFE1VHQ5SVVWenBYejJ6Z01PZnl1QXFS?=
 =?utf-8?B?RWdEQXdUQWF5TGlXTnJrbWxsYXFzOUZoengwWDU1M3ZlbWdXVlhnNXdwekV4?=
 =?utf-8?B?K2lSVGZWMXZDSlNsRDZVa0FNQ1dZajlzVVY1M3NRNTRndHo0K2VIeUZCWUV5?=
 =?utf-8?B?QkdQMDBSWjR2R053REJLcVZjMVlVUzZmMUsrQVM2dE5taVN0QWFmRG0yMGp4?=
 =?utf-8?B?dk1ValNLdW5xbXZBRlVOa2JtZUhoVldkK2wwdDhXZ3Z2cnJjOVNqUUd6a1Zq?=
 =?utf-8?B?Yzc3QjR0WlFBUzJQMEJOcXI2SEtCR1A0QTh4dk9ITDdFNlRpMFU5WVY2VWdq?=
 =?utf-8?B?R0hzcUxCL2ppdkhFaDZWV09YRGd0YUpzaEJiL0JNc2N1bnNHaWFQUzh1WHJz?=
 =?utf-8?B?TzNVMDcyVWRncVJYZHo4V0xXS3duSWFpbXRiV0NvelJ3dUpQYnJySmhFQThW?=
 =?utf-8?B?Q2tFNGlVa2pZRUFyMWM4ai9GL0ZQV3NLVUQ5N2RnbDlma0dsRzVza3dCZGtm?=
 =?utf-8?B?R2tSY0Y0a01ycHVySHY5RWZjSGxnTjd0VXBNWC9uejZYYVBFVUE2dXpCOWtX?=
 =?utf-8?B?Qmo4Ri9Tcm02UVk4S3dOaW1RMDkvelozQzdBQ3BmK01SUnBJM0hXSyt5eGhL?=
 =?utf-8?B?VERsTU9YY2NNOVhSaytFTUppQXh4NkJvb3BLV0FIZytURkZOUGxNS2xTK3RQ?=
 =?utf-8?B?bXg4ektSOXI0SUpKcnpQZVdITk1aNWZoblRKQzd4a09UYUJyVWc5bFFwVVN3?=
 =?utf-8?B?ZnlXVVhzcm1TTjNLTGpoWllxOU96MzNoK01rMGJSdUYxaXFmYktTV1Y2c0dV?=
 =?utf-8?B?ZkhOMkJId29zZitjcE5PK29wL1A3UHR4VnpQbkVQbGNuUXRPSlZXVWQzVUEz?=
 =?utf-8?B?TjB6dW1XQlQ4UVNNeHBFUXJvbE1iNWpXTXIyQXV0V0ZCMkZkbmdxZkZVZ1hx?=
 =?utf-8?B?RW9EOTAxdEpRTzdUSGp4QlY4aS81RmFxUWhFTHdwSkk0MFIzaXVRZGlKQmFr?=
 =?utf-8?B?cjBwSFNmdDgwMnV5ZCtDMEJCaHQ4MVUzVG9KM2VhUzJWOXdWUmZhY1l1OElE?=
 =?utf-8?B?a2tMM1NYNmYvVlc2TThmOVJCNjhLUU1jbG4yYXpvNWxjbU9kQTNEQzRVdktz?=
 =?utf-8?B?R3h2NWpFTHdORGZ5SWZCQnpTbWZRZWV5T2c4bEg2TFF3NWtlNEFYYUZZbVpL?=
 =?utf-8?B?WW03VFlBVjU5R29RNXd4OGQvVkpwUU02dU5PNHBJTHk2ZFlKYzhzb2dMUFNO?=
 =?utf-8?B?M3piZlo4NHY5RjlnQzh1ZXpIV2pBQjBTdFJMbTlPYjdxRkxCUmlXZ2x2V1Bm?=
 =?utf-8?B?eVJCdEFBc1Y5b0dCRGg0V2I3dnNrd2JUbDhnTGxjL1ZLMDIxWkZKYldrRnZv?=
 =?utf-8?B?a1NLYjV1MDBBdHlKc1M4c2NvUXlmZXhTNiszMlo0SUM2SkZjdWVNa0U4U096?=
 =?utf-8?B?eWF6dUJpUDluZHVJQmFYYmFTbDVrYmRScHJqK2xNcmZYd2FoMjFiNWlJbE5Z?=
 =?utf-8?B?b25PZVJDR2tHSmtkWDEvVm55SkMzdVh4K0FMQmlxM3l3b0Y0cmg0SWovRFYr?=
 =?utf-8?B?b2NuZnhCZTZnNExSdWtna1BsOVVtMDU5Y2N3VGlhL2MwOVZDWEJPWHhHOXJF?=
 =?utf-8?B?S1g4dnVlVDYwODhKMU9UZ3FyL3R6TU1wOEFtaXlESjQ3U3BoVEs1Y29WeHdw?=
 =?utf-8?B?NEwraDFpMkZJZkZzL0RsdTF4MVZFY1lMSnplNWJQQWdjRXZLSDF0TmtlSVJV?=
 =?utf-8?B?aTNkVE8rcXRkMnBXaU9PSnZtUkFGZGpJd29hK3lUS1BIRG1LTWlPUG9WSUpx?=
 =?utf-8?B?V1VJaFRab2xWUDBUc3VOS1NYa28xSnBKZ2RISFBRZVN5SUZGenlZRFM1SGlN?=
 =?utf-8?B?RGVkQU42ci91ZW5MWFRwYk9mTitDbnArcnJ4NXpRN0Rvb0F5RWhZL0ZvVjV4?=
 =?utf-8?B?dnVPUXFSL3N2cDJZWTV1QkpPWnd4OGhONUZTWG9pWGM2azN5aXlXQlh5MnY4?=
 =?utf-8?Q?LdLjhJBks2fnAqbj3phSfH/VI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e9f7a2-e739-4068-0956-08db9f1a5748
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:06:08.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Q8u9L8oY2KIcz9UX5PPCjr5zkpeQY6cvLG+gSHa5viv6E/joMg2hhRlzbo44VL7WfDtxU+NX/Jn2cKQQ4Cg7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

On 17.08.2023 12:32, Oleksii wrote:
> On Wed, 2023-08-16 at 15:39 +0200, Jan Beulich wrote:
>> Plus the question remains of it necessarily being com1: Is there no
>> way with DT to have multiple serial ports (e.g. one for the console
>> and one for a debugger)? If there indeed isn't, then unconditionally
>> using opt_com1[] here is of course okay, but then opt_com2[]
>> is effectively a dead variable and recognizing "com2" on the command
>> line (rather than spitting out an error) is then also a mistake. IOW
>> in that case both would want keeping x86-only (with a new #ifdef, as
>> we certainly don't want to have com1 and com2 stuff in separate
>> places).
> Actually it can be even more serial ports. For example, I have a board
> with 3 UARTs ( serial ports ). 
> In this case, it looks that I should have 3 variable of opt_com{1-3}[]?

Well, this suggests there's a general shortcoming of the DT part of the
code here. I'm afraid I have to refer you to the Arm folks for guidance.

Jan

> Taking into account that opt_com{1-2} variables are needed only for
> configuration of serial ports in X86 ( in DT-based architectures all
> configuration info is inside a node of UART ) then we can check only
> opt_com1[].
> 
> ~ Oleksii


