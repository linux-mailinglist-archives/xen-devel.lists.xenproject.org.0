Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88CB5BC4B5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 10:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408562.651305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCTK-0003VW-GF; Mon, 19 Sep 2022 08:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408562.651305; Mon, 19 Sep 2022 08:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCTK-0003Sd-DK; Mon, 19 Sep 2022 08:49:46 +0000
Received: by outflank-mailman (input) for mailman id 408562;
 Mon, 19 Sep 2022 08:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaCTI-0003SX-KW
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 08:49:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00e372ab-37f8-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 10:49:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 08:49:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 08:49:41 +0000
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
X-Inumbo-ID: 00e372ab-37f8-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMF/pfgPk8YYFDRVRevRD0YeAHd1nJOnthdIEkcGy/WgNmVvEbNlHy1B62pZTAM9fyLxjENoQ77xb17XULf4f1542DubFrZWKFbiFTZUF2ECUboJ8XnWVPpfIIuiywuNwDCjDxMdua+ByGHtKFCuPeTkvT6lMl7cunSrMV2Dv1QcZEumQnsP8SrouHRIIX0VaB0bV9qaVx3WxjrDazNMIZEF6gXeLkohYssX6kOAzi93/HKWN1VUinQ9p1ILZuHzhtTu4mRAiiDOz7PKZIjIPhsWwdF+FxRp4a1nDMVEga+eYowv5DSP1zxSI1YSujoEdm+kHCglfqgBDa97kIqEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DoyiVSSKTAaGbNGdLpExynzIhvjdm0im6annt1PcpDA=;
 b=YIH6YVTrxs0KxKA4KwN5Mo/m3CAOLCDRF+LGWfzeuvnf/fgwrC3ZwFl0ZDcA7s7dMqJuGT48zRcugC0S2W8dIBzKSxQ+c0PDXa+t1b9UxmJ82FGPR6vWaCADkvextvS4CGejEC/2THt6Os0U2OKq91aPxLBJ7N/xRvJrchdWKxRgc8fe8/Q7oEjzUu/XLODd6uYFsi+9HTxWldMOX3Ziloe3cjNui0w0n9twdCzMKcgmtXwn5vlZ+z+x5rpKvttc//xTo6h4zhl/shpHsLM2CsStn+kLgd2ACalqi3FnUiHD9oh094Z4XuynuTwrAjMCjEY/5bL9Fe1K8+0SwxAk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoyiVSSKTAaGbNGdLpExynzIhvjdm0im6annt1PcpDA=;
 b=emVJ6TQzgnSQvW00dzDSM652BzH5aJmAS84O9HZFuJvib11rpQFIH0xnxKvkJv0ux2jERG8cvbaBZKD2ELmZV+6b11uZ5ek0PxDmLC8LRg2wfho6emgoVcyxjCsPQtu0pgcWnGR08zJ90CVHshFGBb1yZyAlzeNTW0ryESXmNU1m6RYuDrs8VtGG43539JHaQKnrUUtG/wpCx6KmADeCHXjC/uc1fFheqz6/CHUBMY+Gn/+kT0Aq/UM9jDowqx8+WJfx+/XEqvLOn8SHgE/troqSIcawY+pLd5oZ/tFIjpE7m/AFgJJ5CIx63LXTzHBaZFZHwwK8tNdraXBlcIhynA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <146598b5-2b98-3dc0-e9de-d23e7d83481e@suse.com>
Date: Mon, 19 Sep 2022 10:49:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 11/11] drivers/char: add console=ehci as an alias for
 console=dbgp
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
 <6832b5dd97a1cd09ea8060e64fe1e8c8310e4974.1663383053.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6832b5dd97a1cd09ea8060e64fe1e8c8310e4974.1663383053.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd96145-c262-4e0e-4765-08da9a1be446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7cwUuWhf3kBdIxg2OCfFXGw9xgaxMLtfpf1F7yOAqQhQqfo43bp8C8t3N20UjdSQyHmrOoCH+dzeKuM7TmJWJhKDn/H1NxSdfZ2zOX8WHFJDy3MN79y4IkSSRrUlh/d0YMbGep/BRR41BNd6hVhXfB6njSH4YZk+TbdQsqvhaaydI1bYowjtcX7oq7B5XuDrnHW8QN20teLXQa0GkeM9xcgZO0c2L+470X/fOKOzLWs1okQZz9F7bxMbkZsP9DJOXPruF5b29YYVIzLFgcEarrMASBS+HGjBDRskMHU77Nhgfgf1slMP9vauUbxkJV+ZGPScYbxK6bQGFXqTb5Fxw+ACi5+PIdi06eIrQ6PGkgTb96CF5nl6Tu/71k5vt5xmQ3q/6+ofqL5QCoq31i9yE0Tr/FoC1kYSOh52O2KJJ+ubBee3ocP4gSc/W8luRE/7BcT1qOCdUuM2O50vP2q65sqO+3UUeq/nO9E5kpjXZoBUQskpdWbyHHgufwrrSpnyobGa2oVlrwMKPCci2TowBYoSKWrZVZlWrjFNajKhSxbUE0aqWd93Bytagxfoi2532pFnXLmpemIU5AecL06E2aiEzBK4YkvMcTtX/Od8KT67gIBz2uAHyVwtkZ8s6g4n08DpOCHWwToPITwJjgAQ3xYe46vCq7fw1VeUTETIMJxC78gHhDBOLvXIOfwPvwt69bgdkv06dQqc3EIaToR7Lo36ZT/lv8VMDe4Ak2BOm5Af+4g6k80f3Uz6ojvzyzfjgVLO/+xHSLOSUS01RDQrnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199015)(31686004)(38100700002)(6512007)(26005)(6506007)(8676002)(4326008)(2906002)(2616005)(54906003)(41300700001)(53546011)(31696002)(186003)(5660300002)(36756003)(478600001)(86362001)(8936002)(316002)(66946007)(66556008)(66476007)(558084003)(6916009)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTVtYTZZdTNtb0VKaERveHdpdElGMGhvR0xDaVdJUWY5Z0VlOWtmUWNCWHVk?=
 =?utf-8?B?Ykt3bUtRTG5Ybm02MzNkK1psKzV0anZIeVo3N3VZdDVPMFdncEE0RnJ3ODVo?=
 =?utf-8?B?ODdLQkNYVy9GZkhOTjdvdFM3UTF4MEFvWFowZVMyd3JDdTBsMFVIeWpuVnFY?=
 =?utf-8?B?VW1mU0hJdFp5MXRZdnBlblgyOWhiOEhFemR2QjNIVytJekg4M2drVnBuMm5Z?=
 =?utf-8?B?ek94STFKL3A2OGdzSHFCcGhXSnpCTXoxVjE3MVY1Tm1FTVRhb282cE9zOHhO?=
 =?utf-8?B?REIwMTZQdCs4bUcybkdtSXF0Z2RwRC9LKzVRMHd2Q3plREw2MWlrVkVKY1h3?=
 =?utf-8?B?V1J4Tnd0SDJuWUJVNW91aCtvL2t0UFlRdWU3dG53M1J5Yy8yNG1BN3pQUEJj?=
 =?utf-8?B?MDE5d0JmNllMNS91SnRXOEgwSXhJU1pSNEZyaUM3WmlWSnZZcHFyUUE1eGcy?=
 =?utf-8?B?TmkwM0xHMnVvc0dGenpjZ0p4QXErWTJrdUNCVkQ2alloajBPU2FIQXY1Skhr?=
 =?utf-8?B?V0tESFBQazZhbG9xZ01nUGZlRmZNaXhjWWpJSEZxdkQxZkZNQ3MwYmtiTHU5?=
 =?utf-8?B?MWV1R0ZkeFhQcFN5T1NHOTM2UDgyMlpaTnQyMTJPV3IwNFRndTV1dytjeW5B?=
 =?utf-8?B?b3o3elBrT1ovUmZEdEJjTGJxOU1DNnk0VkM2bFhSbFc3Sm1IcGtGQkFSVERp?=
 =?utf-8?B?ZEZCS1J3S0paRVBrLzQ2alFGVjdRTnoyVWVGY3d6djhRVHBnZklwelU4RDkz?=
 =?utf-8?B?NWI2a2VidFNxUXJvSkdxdDg4MTNoWHFwVXlaWDFWNGQ3WThFQmprVDVGMWFL?=
 =?utf-8?B?c1NyMlhZb1ZRS3dXR053SGI4UGs4dXFFaCtHL2ZNK2dtZGZBTXk4UzMwVVNR?=
 =?utf-8?B?ZkMyWHdtbUtLYTc2elZBVUhFQ1FOWjNGcE1MZHVmYjhYZGVUY25TSC9SMTNU?=
 =?utf-8?B?eUtHSjJIZGk1bld6b3ZWcWRBdzVjcWoxdm9iUzd6cXBzZnJvbTBkcWk4VmJm?=
 =?utf-8?B?UStNOU1wN3R1Q1N3NEFJbVNHdjc3WGd1MDVXMWlKYWVZeG5BcVBlT2FJN213?=
 =?utf-8?B?TWM1SExlU3NnTWdlTWdJa0xOM0NtOW12VDcySWVNcEFZTG0xYmo5R0Q0OGp5?=
 =?utf-8?B?NTFBVHprUXdoS2xjQytyNTlTTHd0Y0hDZ2U2bmVrVktNTG51SVRwTnR6NXdx?=
 =?utf-8?B?TWkzN3o1WGc3am91UFdNeGdJYVQrdHVxK2JEaHBCanNtV1BBS3kxL1oweGR0?=
 =?utf-8?B?dmdLZjEzaGErQVpmT1BaaWxSMGxzMTNyOXQxU0xDU1dGZk1yTlhFbFdLVW9U?=
 =?utf-8?B?bXM5R3RkSlRNWk5SSkQzVGJ6OXVFa2dtOVk3WERQVzVqdys0Q215U2xBRy9W?=
 =?utf-8?B?Uk0vOFdqclhvd0k1N1JxWWp2Z3d1NnhzaHNGak5XeUZxSEN0M1hGaUFUbzJk?=
 =?utf-8?B?Q0RXamZZRW5DWU1nYzhBM1VBRUhXWUNwZTcwQkd1dkRlRnhYUEwzMHFNQ3ZB?=
 =?utf-8?B?T2ZicktJV1NKR2l2VlY1aTJ6QXRWRXFMelorc3p4TUtZYzJNeXpBeXNKNGNJ?=
 =?utf-8?B?Y3RPZ0xxSXRkdzRLcTBNNXU1TGI0aE9IaVp3M2ppYlFCS3JQamc0Yld6cFoy?=
 =?utf-8?B?cXVPTzJvMnIrMW81Vmc5L2dvRmZlSHpGWWUrVkNiYkdWcUREQ3RNY2pWWk1Y?=
 =?utf-8?B?TEx5VTNQYVQvdk5RRm5XMXZHOFpJN0lWYXU3YUw2d1lFbXgyYTJIbnc5cWJX?=
 =?utf-8?B?OGN5NEpZYjYzc05WbFp5eHhtWGZKNzVIamFTazRHMWVpZ2ZMSEtFZ0xiTTZz?=
 =?utf-8?B?aEV4WWc5T0xlaDZpMGpBbUxDa1AyRjErbTU0c2FEREZGYmZ5a3pXaUg4UWpX?=
 =?utf-8?B?ZEFiVWF3US9VUVFHVHVTMTg3Qit5Y204TlJiSWdPMGVZMmcwak9VZzl3SDlZ?=
 =?utf-8?B?MEUwYnRrK2haYVhwRzhSVlNTdm5vbUxidVJ6NkV0aDJWRkxyelhUdy8rYlZz?=
 =?utf-8?B?L093OFkvZXdyL2tuU0lWMHFlUVEwQnF1MHNoMDRXWlh3ZlRITXpzWmtnUDFw?=
 =?utf-8?B?RVlGOXN5QTQxTTZPMGhSS0EzVEc2UmlOSkxBRWNkRlJjSDFxWkFIOVU3L3lE?=
 =?utf-8?Q?F//++nxO2GkClAFlSudgoj44a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd96145-c262-4e0e-4765-08da9a1be446
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 08:49:41.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvOXW0IRtvBniLViR034UjwG4EyQoECTp/+ID4F64RDwzEqn4Cvqiz9pg8keWGzCSBn4FRWi14KjrzkMKvrewg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

On 17.09.2022 04:51, Marek Marczykowski-Górecki wrote:
> Make it consistent with console=xhci.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


