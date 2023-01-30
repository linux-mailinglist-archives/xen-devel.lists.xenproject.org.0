Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD60D68075B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 09:25:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486638.754040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPTt-0003nQ-Ke; Mon, 30 Jan 2023 08:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486638.754040; Mon, 30 Jan 2023 08:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMPTt-0003kY-HS; Mon, 30 Jan 2023 08:25:37 +0000
Received: by outflank-mailman (input) for mailman id 486638;
 Mon, 30 Jan 2023 08:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMPTr-0003kS-K1
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 08:25:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aabfe6d4-a077-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 09:25:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6792.eurprd04.prod.outlook.com (2603:10a6:20b:dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 08:25:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 08:25:33 +0000
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
X-Inumbo-ID: aabfe6d4-a077-11ed-9ec0-891035b88211
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfTxDWwCEb1zp2TWGJL9MJYQaydzCBuTOVewRJodPnjvrp+DtFrWS4cQ4In/ak+BmQXhFGzVJJ/KFsW1s66osjb6pq/ZMVuS2xJiF+tpCHxmHk5JugS43ljW5ONn7l/RBKMKRkM3vjJ0ZNTxVfZz7HP8ereTSdKRlVB0zedwemNDtGILzTsclKrACtAwrmRj+kL1wdbnQul89jRNcMNIWlB9sfR7AsHpnM3tHx/0vxIKp0jM/IokAkURf3IHZhmObFOL7xlzF8Og4lFtVC0y2nw9cpSQNtx0FzV7BuWmFj+rGDGuo9ewasA9rnUwcL4F5GepI0aeNfx3RUHHWdqI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFoXzVzz/M7PtTy9u/nPOOEsljAJTh0FZA4dxVTGQZ8=;
 b=Iia+uP3O66JEC7uS6C5LZRflop8nxHl5GZVSNR/lXAgPGvstEqbwe5TFLw5+BzrTiA8mtjxcSzbHyLIHa5ws1xP3VJYhY5DK8mqwy3bzDwBMx8TXA59d4gtESx2NSR0yRflCREetVJ0PfzSaf/9yaPMgTUMq4YCxhaGqFVjU7cQu5kYDRZ8Ie439VITy0BjZosQL7/YuIfTEPR+WIo52xyoIoHzG8mNwkrRr/zJRNMoRRJSGf+kxiVT0Hi5JgNJJnAOc+Ll52yELZC829so1u1afOPyZRrfK5KJMja6AtmL2UOSiBm2Sh6MbiUnf2+fT6LxyXufIvJCp4OM/aRvPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFoXzVzz/M7PtTy9u/nPOOEsljAJTh0FZA4dxVTGQZ8=;
 b=yV20YHpNJR6sn4eFOQbrXR8cpYOr1u2j5+ViPC2zCRQZVUWoqtxa6yhflNc+Gwy/M4v04YZniUjWkXnIZtdItlZk0MiZ9IXDI4yC52zB2LFib6NkjIYJ3HfQdzKtjuZToNn7sKx20nwvbo/K0CzfJhmwUYohJK9ZG11CV63/vYXoTwn0MDPVfRDF3xKnizJxDw5E9M5Couh89g2969KxAbufHov+svciUe2oPYALIJcnzERA4GysfrnT5L6YPV8iUUkXftMkxQDkTEiK3Fg+w6QqZhocq4LRrUXahDhdEHBJr93d/13bByx0dD/p09WhhvxaV1n921Jxb09/ykAzjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb813a16-a1be-bfeb-60c0-02197c98adf7@suse.com>
Date: Mon, 30 Jan 2023 09:25:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] Add more rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Bertrand.Marquis@arm.com, julien@xen.org,
 stefano.stabellini@amd.com, xen-devel@lists.xenproject.org
References: <20230127183541.3013908-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230127183541.3013908-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f5090b-c461-4cd8-8ccd-08db029b8df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6vFwcUUUSBpOVODJQvtYGvGC6EhDOevaogywW1uZx/UaukwkWSEc4McLqFUsU7gLcVcdpr8t7VfO4j63GBwtAKeqi/cY9HH52rkQZpBie9XisLXydRz8MLZGW7HWeTMqDjhlOSMABuCLtW0LXizsV9TsvPcNzt6gv4i0U4h/hOnAFqaA7pZqSFeNMyLUtBWmqY54De3zs06NfU2PHiE0LW2FPghNsCd/b200kVndaK+81jj3ldQrV12+kraHskkUucC+3QdM3bl01XXgWFK65u79IS+jw5ozF2uyGDqUsT5k/IEpAclQ0Evc44lWDh7+9ERAML04QDd4B3kDRyrDZUw/X56Vz30gHUcssqqHi1AoBBhQ8vi3T9dXZExKtby3mGF3N1Avh1D9/SLZFpHbr8zJKecHL+2k5k8hiQH2Jrd2fj/3tjkbk7Sy1d7AUfTcsB4qqbozEucfEx4ihll50pcsT7FULPgxlxu9wT54GYBPXfFeuMJwYe4+x65j8V9yGnLj0NT0KMejiQdEIuXJjq8WMaurCw5K8RN+S5E+UPAYc42HFFrvk6MMeaqIai/4PJmgIlwFYwWh9aFH7bA/RSFXtSxpBIdqexp89h9wj8I52/EoQBBXoRoPkl4phF5DGPQlH63V62EVlFIZ13wF9OvuSXHzYviVdL6mo+Sical/ZUd+A7E9dQ9Dy8lbnC+a6NKuw9dQ0bupsOvRXE93KwRsSp9Ad2upMYZEkjYloM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(39850400004)(396003)(346002)(136003)(451199018)(316002)(41300700001)(8936002)(66476007)(6916009)(66556008)(66946007)(4326008)(8676002)(6506007)(186003)(6512007)(53546011)(26005)(2616005)(6486002)(478600001)(36756003)(31696002)(5660300002)(4744005)(38100700002)(2906002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU5tT0pGYzNFK1RidVJZK1hTc25TVjF4c2p3Rk1aNmlWNUFZZjh2dXFDMTNZ?=
 =?utf-8?B?SjBuUmM1RUdKSEtXZ1h6UFNBbERHNHp5SE1uUk9QaU44OVJacy9JMEJoV2xr?=
 =?utf-8?B?R0UyU0VveTVkNDJSemFmM1o1YVVXZUpRZ0NZd0lrdmh4aWtVS1BIQ051S2Ru?=
 =?utf-8?B?R3hNVFZvazFsdmVqbGx2d0svMWR0alRBdzRORmgyNmFQUFU2NS9Ba0N4YlQ4?=
 =?utf-8?B?ZUJ4WHR5ZjZpMHVGc3h0NDdCWEVWd0tEcFd1cjhHWHczYUdWQnBDSSszVmdv?=
 =?utf-8?B?RXdiamk0UkhFNGxkUFl2UVh4TElyUkQ4TG9mVUFJTzBaZEZCZXlXVmc0c0xS?=
 =?utf-8?B?YmozT0ZkR3RiWXVrWTRZU3JZTXZFQkZWdUFMbGo0WnYrZkQwMC9iOTJWNldT?=
 =?utf-8?B?MjhnOXhUQmxSdFN1VEhDWFhYL1JXbk9PQ1BqTy9RSGRkNVBrd213NEhqcUxw?=
 =?utf-8?B?cjk1YXNjais3cEdqVHYyVTFSTGd1VWZQZENicW4zRHNEVTd0OXVqZFllTldl?=
 =?utf-8?B?N1hGRkk0eGZDSkprZjMxZ054Ym1DbTlzaDZBUHhGYW0rekdvN1NOVzhqN3kr?=
 =?utf-8?B?bnBJTmFsVXdOUy8wN2I1YXF6TFQxN01hZGl5aHlvSmVUMzRERXhHZWtQVjFS?=
 =?utf-8?B?ZUVBaWNuNmRFZjE0YTVRa3FySXJvRGZuK2gwNUZyMnRmSS9LVk1vWVBCc0dN?=
 =?utf-8?B?MW9HcE1mMkRuT01mZjRoeEdFM0puZWg2R3o4Z09hMkdSU1RBOXA1VFdIUjlK?=
 =?utf-8?B?Zm5IL1NLQjk3Q21KVUx6MkNueDdaODNwQ2xqT0dldkFxY2sreTVVUG4xYjNT?=
 =?utf-8?B?bDJxQjI0eWEzcy9FUFg1NTFwTHRJSllocUFTUHIyc0ZoR21JekhCZHFidDZy?=
 =?utf-8?B?TzhuU25IdkJUVk1sUXhTN2VIb3ZrRnRCOHV3c3JQb200ZllRZ3JTVHF4R2tt?=
 =?utf-8?B?TURrOW10WS9MSWV0SGY2b3dHOXdVOGVUZ0p5Ykx3dHo0KzVIQmMyY3E1NlZJ?=
 =?utf-8?B?cU5aZlpRc2FTM0wwVU15RFRwK0lsNUxXZ0ZMamNvYUVJMDhZcDl5V2lORTRj?=
 =?utf-8?B?N0hyQWZ0V1FwMGJNOXp6K3oyTFo2MlAvZkhnY0pPaHlySUF2SnFIOURxaUNL?=
 =?utf-8?B?V1V6c3N0UEdRUjNyd1J1WkJRR3JOMUxoSEsxUFpWeUJIL3pFQlk3SjlsZllL?=
 =?utf-8?B?ejJpT3h0WGZsRzNMZHQ2REpjM0trZTM0NnlnbUV0S3VaaUc3Z0x3Sm5JdWNI?=
 =?utf-8?B?cmtnVUEvZk1QM0dGQ1hoNVZRYWxySFNZT3Z4R0V5SmY4TDFUWEVrOFRyaXJI?=
 =?utf-8?B?cTRoOXJMOVMyMzlBbU40T1hMQzJCeHdRdCtJYk1lNGVCM3lxdWErMFdWTlNi?=
 =?utf-8?B?MjFQVzdtYlAyUWR0MytJWWdaUnZRSi9rQ2RUTDlQOEd0Q1ZiUmUzZkE1Rkx6?=
 =?utf-8?B?bTYxUFNBU1BWY2NBM29oZ1dEb1VtY3lyU2FtQU5vNFhuR1htUFNIN0VFdGJp?=
 =?utf-8?B?MWVQdUFFYU9ycklhUWdxT2xac1YxdzVDQU9lblNWUkVCNko5VE9ia1BiNjh1?=
 =?utf-8?B?RjM1ek80VjVvSmxhMkZ2ZnAxWGQ3VkZXQXhiY1pFcWFCd05oY3FhaHp2Rysv?=
 =?utf-8?B?dURXbjVyYld4OFNRTjZ6THhLZHJXRHN5QXhMSUtVd2hGbjJkMjNUV1YzNVN0?=
 =?utf-8?B?TDlFWXdrSXNlOUtuelFsQVE4UHpiK2NibnU4OXVrNVdCQmFyeHg4NDZTR1Q4?=
 =?utf-8?B?S2IwQU9FNDVnT3NqOXZBRWJxRWZ2SUpsa1hweFNyd3B5MmJkY1VYeUc4Sk1K?=
 =?utf-8?B?cnBYQ3lEZHFDbktWL1FGU2RqNktVWkFKY2VoNU0vRi93L1djZGFNM0F5Mk14?=
 =?utf-8?B?YitBMVhLT0hwbXBiNHRoZzNLWnNMeWtsU0pEdHY2UVIzT1lqMS9NYnU2YlNV?=
 =?utf-8?B?YWVtbDVvZUpjR3lBVnFtTXlYNDlYR01ZM1RPUFpPcy9FeVRqci8rbGR3T01q?=
 =?utf-8?B?cUdZKzNpRFBzcUR5OG5SR2tJU3l1MVhEeG03VWRWTFVkbUJ5VERNcWRkTWov?=
 =?utf-8?B?b3FvbTdrS2dWYlhYU1JFRzVUeUFwSVhRcmZDVU1MZXBhV0o3VVRhcTJQclg4?=
 =?utf-8?Q?TRgI7ugOvCPYAqf5bfqhIrjLm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f5090b-c461-4cd8-8ccd-08db029b8df3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 08:25:33.2167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ/ar+soHxPrTyjgDkOtlayyxH5I1XkMSXs76yV6sfMjGBxNuf8t6E3jF6bwf7MpXjJnnGUekvoTvyvjW4qP8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6792

On 27.01.2023 19:35, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> As agreed during the last MISRA C discussion, I am adding the following
> MISRA C rules: 7.1, 7.3, 18.3.
> 
> I am also adding 13.1 that was "agreed pending an analysis on the amount
> of violations". There are zero violations reported by cppcheck.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



