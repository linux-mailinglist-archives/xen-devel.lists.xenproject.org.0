Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EE76FEE98
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 11:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533183.829607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px2UA-0002hM-Es; Thu, 11 May 2023 09:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533183.829607; Thu, 11 May 2023 09:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px2UA-0002f0-Bq; Thu, 11 May 2023 09:21:18 +0000
Received: by outflank-mailman (input) for mailman id 533183;
 Thu, 11 May 2023 09:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px2U8-0002ec-My
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 09:21:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b533834-efdd-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 11:21:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8979.eurprd04.prod.outlook.com (2603:10a6:20b:42e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 09:21:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 09:21:09 +0000
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
X-Inumbo-ID: 2b533834-efdd-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTUKtgGV2RV7tKZxj/riMk5gC+KJiA7Oc7EbhZ9iINtujobNr2HB+aA/291H+aObW59UM5xXj54xjITqF3QvQViSwsr45lmEjlxxonuoTMzDvWrA9a/0c4gBBlvJ6yRsRUlOcBMb+4hKhAt+ISd9aDJ59UURDz7CvjpNlZbKLr5w0Fli2dbghABt4ztxqYyNy/oKITMqkmQPQi+ROv55Cqoe+f1Z6ePmwwz6uXYqjoIZK4gdLtxSLt8b/sg6wISwTSucSsSibKMTAt5f9MLSKDhRl7O9BfzgRD0LdyxtIezEnCT33m53EMWdybS6bT1omWH8IMsItl84SGEOandh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBY1Gs29LACMSjd3zFO4liO1LG+k66su+TGcjyEQdNA=;
 b=BQ84eOKwUsSb2tDq8Jg+pvRVXn1u6MOrVxVZiFm4i5lpIDvnb70an0XhkmTN/KkDZydGWrfhfUUofbQMc2jYu8JnbfwgfrkrNYGYuuMlmeTkvDyfDVq8671jRO/mLmoFW8e/qn5dLYr4F3djXN62DPMmdNDgYL2XAZI8D0iqs3b75BWjRibphhZdDNF/S/bD4yVDPcWHV/m4LOjLnIunjiglwhrNmWm5nb7NfBu2OoXRdHXmMGIACidCWxo/U2TXEvVKsxNpBWNnGjRYFMV+xWw/6XIs/GsF7In07C6dOEVGqv9cu1XMa6+EdW+N93G/U/vb0HOlOw4oWO8XMfeFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBY1Gs29LACMSjd3zFO4liO1LG+k66su+TGcjyEQdNA=;
 b=Uz5ZlAnjN7wiZzXbMC+cYjb7HhyD9zBevdW+pOmZLB2Ychij5D+SNZdJ//rgtwpU/Gf8Y/qhkUSlbECsWy+z4AqXecsrymx6n9qrEMkFkdRmeETxLip1pe6yFTg57wUfdKCZ0od7kbVgSIjwEa7sIvZD26GbgOGtPXay2+0hMFY3QuOPA/bVkAOMuL+TksVoe7syH+TNKyk8B2i5S02SqspF1pjxDq4DPPKpfItP8YN1gIZ7RdZWEY/JIP2qF6VVcUQXsxShUeWc4TPk4QqmEBxtFNZFXGDTHBqsbGCW7vEokjnQPBBrWTcbZq3W9HL15s+Rb08uV5IRhXGhfzbrZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb215c55-5064-7f48-820c-bf41d01529bd@suse.com>
Date: Thu, 11 May 2023 11:21:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] docs: document ~/control/feature-balloon
Content-Language: en-US
To: Yann Dirson <yann.dirson@vates.fr>, xen-devel@lists.xenproject.org
Cc: xihuan.yang@citrix.com, min.li1@citrix.com
References: <20230510142011.1120417-1-yann.dirson@vates.fr>
 <20230510142011.1120417-3-yann.dirson@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230510142011.1120417-3-yann.dirson@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f771f2-9a48-4c55-799d-08db52010e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oXBxQMS8366YkINTn8Yt5Ma4NEvtI5Mm6uHO602sfTv1IM0X7wSIjA9Z6/ePSu/SLyrkAkLU6KObGoFUM5LFuangyBD4t8BgNzCdCCbWh9OeqXI/IueQZAaStdocSP8BFK4/SW+/grX8B+BnT70rNcjAcUlYAhWlNjtpbX+9k+qfa5aEhKky2oodHYf8AqMkCghMBrY0m01u6RySjcmp9Wuk17K7IaiEmQjJmq15SU4gN5fDqC9lQ0sWo3YGRgWj2rl96bHYQhaDeV4L/zqNEnRshCaY1xlmCpNJeOYA1bAb4WzmN0T23bQpmk3NdeKTyEfu2DMB46qk+5TMMQZ6Eip/pKzjcWgHrYlOVU2xNSedNUTnXb9IhAdC0DsJ4SjKeBePy0LmnxalrgOdUoh6fgAPjaoBQ2Ugg1l2Oa1wk6QY+hN5xGf9VuGlcS9WO26MpH24NznxaQfS6qXTu1xDWeDOlzQhopBYPv5Kcwtoe9sB1spZqxu5CVvKnojBhjtSMp/tk7gPthO34WWBjVqC6NLWNiiJvDyNEFvXn7102D83loqLlY7XNCU1JbRSWz1fEr68R5NpwSsudNsDCCOVQke2i+wFn5zNI/1pDr6LYgeCgSzd4KLslnHb1MjlvGh0wCg8XcKPIErgfP6cbkrDOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(2616005)(86362001)(2906002)(83380400001)(186003)(26005)(36756003)(4326008)(66556008)(66946007)(66476007)(6506007)(6512007)(53546011)(31696002)(31686004)(5660300002)(41300700001)(6486002)(478600001)(38100700002)(316002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0doZ2V3SllmdVpUdTVWajBRenlnaHRiTENIUmZXZWNKandUTExZRFBmNHVH?=
 =?utf-8?B?R210QTl0cVNCTk9VRDJjNGdhMFZPTUxUeEpQRlkweXpPNkIvTEY5cFFhb09y?=
 =?utf-8?B?V2J0M29sN1ZreWh3VUR2ZkQvSUorUkpXZVQrMm9vY0FsamxLT1F3c3hLdTBS?=
 =?utf-8?B?ckUrTEQvbDJZZmh5a29aWk5POFlwdjQ0ekl3R3luZWpxN2RkTnFHc2pRK3g1?=
 =?utf-8?B?ck9QT2dtdlVRZ1lsdW1SbUdrRVlucVZhMWhWenFKR0wyUGtBeDVMbERuc1pN?=
 =?utf-8?B?cGtJYW15TDB6RkhvZzRGQjN4RFMvNmIzanl4MzNsTExNMG0wNjBVbVdqS2pC?=
 =?utf-8?B?S3JRQkNydkliWC9TbDYrTnVhenJCeHNiLzdtTXNXTVlKc1VSbGhRRDZlbXJq?=
 =?utf-8?B?MjNqdm5sc0d3cURiVnVDWDM2UUpXZHA4cVllQlBiK2JpakJxRkNuNS9YVWNi?=
 =?utf-8?B?VDNPMkJmT2VhNWh6RmhmdHFNZEdkeGtYb093OXhhQUl1UUNiSzJpMVZidzJM?=
 =?utf-8?B?Vkxkck51QVBRYytnUFAwcWhJUktaSFptWmFKcXlGbGExNm9aSVEwSml6Zzh3?=
 =?utf-8?B?Yk91eTBTLzNHOXg0eHI2UHJ6YUoyR3M4NmpTUmJJWm55VG80Q0I5UDk3TENm?=
 =?utf-8?B?SnZFc2pLcDVkZTF4TllnSVFjRkFlUENwVnc2S0dSZDFWN2ZldWk4MERqRDRa?=
 =?utf-8?B?UGZVSzV5ZU82OVlvMkx6eHdNQ0lNdWdHZzg0cUl4UWNJVHhnd21SRG9Ka2Fo?=
 =?utf-8?B?NWgwRGxpZFV2TW95QW1haEFmWDhIWGh4cThjMngwck9zSzR2b2R6c0VBNFA0?=
 =?utf-8?B?YjhRVUU5bU5jdU0xSXhaanRVNVhnbVF4OUU2aFhKOXhGVWxUUCtJT1htNCto?=
 =?utf-8?B?bXk0MWlDMjZqSWFRemRjUDk5N0RTS0ZNTVF5MmwxVUJNRFJrbG1lOXFobExH?=
 =?utf-8?B?bjdxVjZYNTIzaUdrWnlMK0JOanlUdXE5OHcwN0JPRDdTa3ovNlhxamEyVXBi?=
 =?utf-8?B?TUdiMElvSnNOVVN4dDBqS2dlSDNwKzlkcHovVjBFYTEwRzVPT1RjTU05blQ3?=
 =?utf-8?B?cVVIY2pRc0pYVmJ2U1I2N1U0Wk9ZWnVGSFllTGVWM2ZxMkFMZHVGWkRCZFFk?=
 =?utf-8?B?NVN5aSt5RFpyWVJzMXZVNEM4dUNZcG92bVdZRlJJeFV6WlJFTHFYYVpTbFcw?=
 =?utf-8?B?Vnlycm9FV3YvZk5hYm14WkZub3hHS2g2cnFMZytPOUxpbmY3TC9zQUI5Y2VD?=
 =?utf-8?B?OElOUnFrQ3BOWUxhcXV6V1hhN0loTDMwOWdzdFdzdzZ0U0VYRlowSHNUOHZB?=
 =?utf-8?B?Q0gzNjhXbEdrdFhzTXVOejIzQWpWMDdYaUdnK1JDQ3J2VzhGaDVTNUVGd1BT?=
 =?utf-8?B?TzhiS3RCcnYvS1AxVjNuODdzQ1Q3Nm5pYXRGQkZmWTZ3SGFMMll2b3lOY2JH?=
 =?utf-8?B?OHBYc2x5cUtObllZM3dveGl1NjZERkVGRVpvRW53YU55ZWcyTVlYeVNVeHln?=
 =?utf-8?B?Y1ZmUEhFVlZpOEo3QmJYMCs2ckhqQ04yOWJGM2VmR1h6bms5YlAxMHdKdWFM?=
 =?utf-8?B?SnQvUHVJblpsQ1N0cGY4dGFRWi9GVXZiMnRkYjJXcVZIMnhuQndBbnR1NFlm?=
 =?utf-8?B?Q3YwdldUKzRLN29pOUFHSUVMaG5XUGVnY0N6YUg1cGVYQVNCL29NRG1zam1h?=
 =?utf-8?B?S1JLZjNvcnUyWlkrWVlTajNoNURNbDVwVWlrUjNUSzFUTWVoSnE4TkV0ajdh?=
 =?utf-8?B?cnNDY25IRnp6RWNBbWhubVRYaHpiOHhlWW1yQVhMdlpNWFBEVkRDRjBrWEdT?=
 =?utf-8?B?VzdwRHNDRGZ2aWpCSE8vL3Z2dFlBNWM2RFZjRG9SK1lwZitFd2FRZUlBSGN3?=
 =?utf-8?B?c1krR1EvbFpYc0t1ZkZVSitzWVpSbllMNGUwR0xQSW9ReTI5MDRSU2lNRGRW?=
 =?utf-8?B?dGpXQ09xSVduRFM2OXdEWUswZVpCenEzdE9ncDNWUkM1bFNaeDVrVmQ1cGwy?=
 =?utf-8?B?TUFFK3pqV25LSEc5b3BTdFdBWEM3Mm9uZ2p4Rk5Zc3VCUzA5V1psTWp6MWUr?=
 =?utf-8?B?WkppMGZnRk9uelJJTEZJMmJWWFl5RTVGRUx2ekRqY0JiRkdIQWxzLzZhdVVi?=
 =?utf-8?Q?pGoFchozbvNMAKAQo7W7AkRSf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f771f2-9a48-4c55-799d-08db52010e82
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 09:21:09.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpIx0xMX7x385JaDJIKRGnmqC7eRnYJUg1SuK9NMH3DI1wBOFNBHighSxvHzn1wkvmg5XOQYd4lGBE2lSAya3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8979

On 10.05.2023 16:20, Yann Dirson wrote:
> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -509,6 +509,12 @@ This may be initialized to "" by the toolstack and may then be set
>  to 0 or 1 by a guest to indicate whether it is capable of responding
>  to a mode value written to ~/control/laptop-slate-mode.
>  
> +#### ~/control/feature-balloon
> +
> +This may be initialized to "" by the toolstack and may then be set to
> +0 or 1 by a guest to indicate whether it is capable of memory
> +ballooning, and responds to values written to ~/memory/target.

Besides correctly saying "may", I guess this wants to go further and also
clarify what the (intended) behavior is when the node is absent. Aiui PV
guests are always expected to have a balloon driver, so the assumed
value likely needs to be "1" there. Furthermore I'm afraid it doesn't
really become clear what value this node is if it's only optionally
present, while its absence doesn't really allow uniform assumptions
towards a default value.

Jan

