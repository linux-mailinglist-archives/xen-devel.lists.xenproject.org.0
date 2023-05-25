Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7D710806
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539408.840241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26ll-0002ZY-8y; Thu, 25 May 2023 08:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539408.840241; Thu, 25 May 2023 08:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26ll-0002Xh-4h; Thu, 25 May 2023 08:56:25 +0000
Received: by outflank-mailman (input) for mailman id 539408;
 Thu, 25 May 2023 08:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q26lj-0002XS-SD
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:56:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 058a5f37-fada-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 10:56:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8369.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 08:56:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 08:56:19 +0000
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
X-Inumbo-ID: 058a5f37-fada-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PER1QlZsZ59YvVeSJgHMkWjWaGlBqIU0JctjpeWojm9edanvG/CJkiV4U4iCCh1c+Ps/jOedzdqlOjzXdnjsuk6QYhb8mxo/YGD9GIXJ3BxdIxyxoni9mZCiNyg9Axp2UdHo5UR5W+kuWTcDXy7lb8D5OONNzevlXkTgf2MSHfGWsv0tWMQ3CwMqpEbSd4VZOOPiuT17UKQX/Hqi+ZteZ93bGZnM67e4evzTdlYIE1tjYnB52w7mrJvT3oMRiryaK/SkSoM9oPgRmu4Y2zcz6ealXyRgYy/SWlUOfF2QITR+G2etSxRqlS+Qn2k1+bUWnkuAIkcgqTSctmkhDBS57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6fLJWvGDfGn+BhrKUr7jiiyU/8I0tYuAGp9pCjZmKw=;
 b=dSe6hK+6r+d6I5RXTF27IE+Cv9ghhDbsmysgLjnI+netHVxze7Hmj7pA2TSQVS6zRGanKNF7aqXPPlvDhG56iIy4j1jw6o9oIknagcCPiTry9nmuliTJKbyVyNioKfyfuIeMERFrHr9dnG+/7iia/FIKqj7zesMAmFYmNCahOiutSIMH9T3llOWznxzVYhpZPwGgEIkP7Z7M+1HjZ08SyZI3PD3qrK2gbIK8RtF5m+vp4yLAZmds1rKLHxDDRSz1DtBTZUmtue29DaIqCAIN1L1PJmqsc8zYNS1qxl9ECpGWM5NlL9bKtaOj50rzsKCQU3oYcj8qyjT8hkDz6sHIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6fLJWvGDfGn+BhrKUr7jiiyU/8I0tYuAGp9pCjZmKw=;
 b=H+vS+Mf+gJrr4z38VrHE/bZJoNOa+LlZFDnPw9nehgYYybusBa2+VWYwnOF0Ya2UGs7sNPnQQBUFJ7HRw0eJW/q5fpODP+hJA9AdHuO5KTqEF2vknBJV0tXG7DB8ydwh6ZmqVFKH9sgZSZo/nOJmR95mYgcbc/W6Q6JFTaOpvE0wGhFqwFn9qjz+gc+BmwjqZ8XnTzMgk2rVyjts3enMLA5df2asuluNsf/6cV9sTeWfir8dkkL6KYKafJLP6k2OBmB1n9lbpZMVMc6ZpIDybpqsR09P42cWSwZo7+hUUo498pDE1rTO02m3sWCBIlhDgWg70eh7Z4DnnveDljsyjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac51e967-c0e1-d5a2-5454-6725f1758c49@suse.com>
Date: Thu, 25 May 2023 10:56:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] iommu/vtd: fix address translation for leaf entries
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230525080859.29859-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230525080859.29859-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b75b192-0d41-4b37-6d7b-08db5cfde7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tL2lHp64bEsnXS7IyCNbK9ZTcXakgHczRhRP4749qhFF3Mx0xoU3cGw6zZYZ7AcwPbl4NuaZ5tSmlm6ZX0K7+Fr6fXkiVoG/joVD8u+IHq8dyUt6P7HrEDP57WyBQqV1z4e7stxnjBjERkyl0Q2Of+InDHAnlPe1hq58eUgxzvNHY4Zl1Gs5qhKyWpDD9rmg7hTvIu0vKntTNqL+3N4vUYHIO/AiLGTOm9B/+qFOFmabAx7/CaCGpBRp2tae529Lqi0ES8QhVvkX2s6a8qZN7yS5GFDLCWhjuuMACzjrvH8H/if0UjICwkhTncEYzFBcbTKelJRB9yAlrt/lQUZC0GZkZf6bKMcK3UjtwbAn0T5CNpIlJ4EuH77uzlw3U3feBvgJv62eK8mQv+FEGvFm4A6l3ZKoUosEfuR6SUVsCXWmtu3pEQ6a8DT5H2KupitT/HlSe0DdpCwj2BoQOlhXBLi4hspZu8P/dd0HO6QOkPad84oGUd+28ZNkuMPaBKQnhcKuzlu2mXTpglSS6yjdFzslxGFt6Nn5C9sxstS085uRiQgwYXqriXZ8kYE2a/Ira6910LYxbeQGWn6gVnsb1TY62YHMtyhLEdi4n7d6VTq6/PDwOyq+/GBsLukKj4x2B959b5Xp2G+oAdWc+vey2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(41300700001)(66476007)(66946007)(66556008)(2906002)(4744005)(31686004)(186003)(478600001)(6486002)(4326008)(26005)(316002)(6916009)(5660300002)(8936002)(8676002)(53546011)(2616005)(6512007)(36756003)(6506007)(83380400001)(86362001)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VndUUksyaXM5akRMSldYV3ZRWStISUxCRUJiUmJKZTVWM3FFdkhaaTkzK1ZK?=
 =?utf-8?B?MGxDMUVicStkMUdkN0NXTXF2bnpWRldrZ0ZEeEJycDhUb2hKODhBTHBnbVFh?=
 =?utf-8?B?UWJWVVR5eTJFa0RQcVQrcTMxQ2tFM3RuVmZjYm5Ub1FGVitIZW41dE5mcHdP?=
 =?utf-8?B?N0paNVhzMExXcS96VTJmcUVDSm9QbU9uQlRMeWkyU2VPUm81RDhEVnoyOHNp?=
 =?utf-8?B?cHBweVdmdUs3dFBuYjMxTUJtMUFDOS93SnlMRVJTL092Q0tBaDRDeHVvQVJT?=
 =?utf-8?B?bFQwNjltNStXcGlzK3pEY3cyNlpNTlo5Sjl1MEpRRzd1WU1SK1gwNjF3SEZt?=
 =?utf-8?B?OGRXcUNFQ0tTdFV6U2RXclplb2NwREZzc3ZjYnI4RDhaTmFEWTczZDRRdzBZ?=
 =?utf-8?B?UlU0Uy9qSVJ3VjBERXlkSmkzNkVORmhITXMyRUttSEFJVFNBQmtpSmY3VG9s?=
 =?utf-8?B?ejNMS2VlUFJENmZLcld0R0ZPZEFLSWVjWFhla0dsK00ya25qN3hWcFVTOVli?=
 =?utf-8?B?aDNVMGZzOCt0TithOVB1R3RIUDZaTEtXSGw0Q3ZDRnlLK1F2aVViVlV3UHBM?=
 =?utf-8?B?WlluTERoL0s0SFlzTmZFYSs4ZzIzYWc2ZFIrNlF4SDJVOWM1YjBPaC84MG80?=
 =?utf-8?B?KzhFa0tScnk3TnRPcy9sR1I2U1hVK1htYkhYQW5oQW1DR3RnTGJLaGtNN2ha?=
 =?utf-8?B?TE5nVnZ6NSthSVBLV2x4eVZzN3VMSDU3WGtqRmUyWkRrUzRaZGhjNk8zRGp6?=
 =?utf-8?B?dUR4UUZ5VCtBQ0c0V0JrMmgyL1lFalhHNUlMNGtkd2Y4ZEhLTjlwbXJxWGNk?=
 =?utf-8?B?L0daK3hhRXFKU1pBenVKeGh2b2phaVNieEJ3dkc0TjdjQSsxRStQRWduQUhl?=
 =?utf-8?B?QTlRMVJEY1JLY1dHYnp2c3FIZ2VsRUtSK0dXUFBETElYT0RuZWVpb2QzdkU0?=
 =?utf-8?B?bnd3SjRYL3VHMldnL2ZSYU9QdGVPR25JRkwzYVpZVVNtSXVWR3V3SkQ2VU5j?=
 =?utf-8?B?MEt4MmxPUnJkeVFrMEtpS0ZTbTNQS1ZZQUVZN0x4L01UR21nbC9NL3NyRis2?=
 =?utf-8?B?aXkwNjd1N28wREFFbnVUKzYrazdTRDBSdnd6bjdqLzBMZlhMUE9FaVdKVkVV?=
 =?utf-8?B?OGN5QmxjUDFYODVnRFo5cmNwYTE5MHgxcjQxN1FIV0J1bTJxTUh4Wm9nR2tB?=
 =?utf-8?B?MFVJaTNzY0NlY294ejBXTGZFbHR6aVR6NHRQZFUzUkpsN3prSzZLcno3bVBJ?=
 =?utf-8?B?c3dPL3dhMnl0Q2VmTEJHd1UvYUQrTzFNUGtkRDl6WDBNd2l1dUNERnI2L3Vy?=
 =?utf-8?B?S3o0OWRTWkRvZnVGRVJwQkNMdFB5bWxhZUw1VnhUeXNvTVhYamErOVZLT3Zt?=
 =?utf-8?B?YkNzQ05SYWx5dW5uTnh4SUFUM3YwNTQ2TWRCcUo3MlExVlFJL3Q3R1RvSmZ5?=
 =?utf-8?B?ZXhyT0ljcjh4NVA0KytDS1lIaUxTWmZJZXFhcnIzVFlTNE1Ud2g5SlB4UmNm?=
 =?utf-8?B?WDhBN3N4QXJuRHdXK1JUVFUwNVlVNmRhK3Zsckgxb0VIb0NYU0dZUElGVTZW?=
 =?utf-8?B?YVJ5dVRHNlVCbzRmd0E3VUNsMSsvZ3NiOXIwK05sUGR2S09tZXA3NUswSW5z?=
 =?utf-8?B?Z0VGSFU5Uk1yN0lKS2wraXNqRlRxUkV0YjNVQm05L1lJUE5NblZyY2cyWVk4?=
 =?utf-8?B?Sm1vTkx1YmxMZ1lHbW4xUDU0R2hTcFNXUjZlZFNLOGRjSFdqcDFYVEdxQncx?=
 =?utf-8?B?M3pHaVpWNGowcU4zSE9veURUcUU2Q2owTklYSTliR1FJVDVudGlRMzlka3pj?=
 =?utf-8?B?bzh2V3JWMHlZSHN0dGpSS3JodmlFeXVGaFhkamw3dlJqejQ5S0JFUmJGM05H?=
 =?utf-8?B?T2ZxL21OZTR5TGhKaTdqVW1DK3E0S2VpSC9kRnQrQnRZV3BZaktVVUY2QmF3?=
 =?utf-8?B?bTZYdHRaUGRGTURGQzdKTE5USmxaUnJPdlYvbEY3akUvSWZsakczNWRkZmlG?=
 =?utf-8?B?dDFYeURTaUhvaUJQK2lDYi9vQUZSNUlMUlFPZmgvWHJoTnZHR2NjSHkzZXNZ?=
 =?utf-8?B?aWU3VXgvM3E3NEsxNE9kc0tJKzIrckFwTm81RS9mREhxRzhYc3BNdTdvK2Qv?=
 =?utf-8?Q?8tjksdNpxf0dO2cnGrH/dRVBw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b75b192-0d41-4b37-6d7b-08db5cfde7f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:56:19.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ3UXI313+aI22DTnXpsniAxkJegaT6SPhEYzXxpQom4MXB+75pA1nftTB8MVO2oNSsc2d4wBxBx0XWMuO7iRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8369

On 25.05.2023 10:08, Roger Pau Monne wrote:
> Fix two issues related to leaf address lookups in VT-d:
> 
> * When translating an address that falls inside of a superpage in the
>   IOMMU page tables the fetching of the PTE value wasn't masking of the
>   contiguous related data, which caused the returned data to be
>   corrupt as it would contain bits that the caller would interpret as
>   part of the address.
> 
> * When the requested leaf address wasn't mapped by a superpage the
>   returned value wouldn't have any of the low 12 bits set, thus missing
>   the permission bits expected by the caller.
> 
> Take the opportunity to also adjust the function comment to note that
> when returning the full PTE the bits above PADDR_BITS are removed.
> 
> Fixes: c71e55501a61 ('VT-d: have callers specify the target level for page table walks')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



