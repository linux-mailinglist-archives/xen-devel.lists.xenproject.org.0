Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062C2679E86
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 17:23:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483631.749899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKM4J-0004Ue-IV; Tue, 24 Jan 2023 16:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483631.749899; Tue, 24 Jan 2023 16:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKM4J-0004Rp-Er; Tue, 24 Jan 2023 16:22:43 +0000
Received: by outflank-mailman (input) for mailman id 483631;
 Tue, 24 Jan 2023 16:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKM4H-0004Rj-LK
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 16:22:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 515abc4c-9c03-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 17:22:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9245.eurprd04.prod.outlook.com (2603:10a6:102:2a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Tue, 24 Jan
 2023 16:22:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:22:37 +0000
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
X-Inumbo-ID: 515abc4c-9c03-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkFp+3iyWi8jmYyqAr1Cue+7KTxoPL6/DRRrK8vB1x/zbUb1Dwiars0PelzKHiInzszuQ8i23zjyJfDlxJCSujetz2BNmxxILRSm/+LPZiuKt9yJQhLZmvIlUOoeQFUYKxrJTuwkeLOeD5MSWKYaLauy5loiH9zaKaQVbm8ddHPzkAkDsLhKL8iopx7p36yxb9JKPVih2L7H8Zl+mKiDYhtdhPsbFZyKaiuuj83cv/uMRUr1wMroojXygXMotH8lHCxDgyAIUe8bAgyK6CB5crV+06KWEtw2BmXI7Wk5AcvjoRU2UZHAVoJduKg/3JoRwCmUpr/1bDVAmz+0lJt/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDsn2I1YqpMu1j10i9ClhnhS1OWA7edRBW7WPl8YX0g=;
 b=kmXBCq6g5zOX9p444QB0V/Vhy0Q4seZQ7MOIIrZipSBMzsM1sBsVEVavu1gYcEQzwa1bprvysDg9KtmsHbz/TIzAkPhsk+ZGrEpjEzVYziVabdQW9F/22x638DVdprf2VAxlc9e6f80ZqSuZPM3ADrXA5cXw1W3M+Zl+B3TWt+Wp/H0M9wRR93M1HPxvv940XEjWmT1mcTz1MNP3oEWS8Hzc9BpF+rowd0jiOPVYP77g/v0EZvtVoG+fXd+t5IspeAr4BAwKSdod3r+dBIp4/0ZD8iaWq2o3bxLu6Xwnnk4dbAb2LhtZ1bQTeBNk4OYlX1jUiYLYDEmCApYsGODphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDsn2I1YqpMu1j10i9ClhnhS1OWA7edRBW7WPl8YX0g=;
 b=qu4x0Uwj9c9yg0BEU+Z1UNmUd2ldodnaAK0KsKf2N4xws3l9sA1RBy8O+TAYVkxGXAHPUbhIlA0X2nJEd2pjjjvxNawYURjJk3OPeqUHFcBBefHimi9M8Q9v2pY1sxpzAJ3aBvCluiVe/zjgP4a0GU2fEhaBQ331an8WbIzN65CxHfEhq+gSBl0+Or8+qiBT9iyFi403/OaMseZxuFc8r6lvSC8Ckpm+jFgAMbyGWG7XBzvEbSgscsdXYnyHfbiHc69eed6AJe4m3/RU/zdUNOMuOpk3FE3lZ6vBlZSURnHLszwz4SIxITbQxkAKE6duvJMxyk657vutD51BEERkBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96d6da16-5708-bae4-56a8-9efd4137eff4@suse.com>
Date: Tue, 24 Jan 2023 17:20:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 02/11] xen/arm: add cache coloring initialization
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-3-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230123154735.74832-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d90ed3-12de-45ab-5f10-08dafe2734c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WE5FDBqXoqywhNeQUc4pdU8j9y/8FYFqqAKHuOWiffygngukS9nY3E+639Hw/GGIBWb6PhkuoA1+e1gZtkRN5FKA/Jtneum3RuBhQMts/AkQrc3FkgAepdw9cPRmrQYj0VBaK02kM6rF0dh/3X+q5xX76PoQTq7VO3ethiG0iJIlUcE0umd+fMsJQcM2r09G24ZrpiOMzv0eAzgYfQQBHDNaHfi1oXHH4eVGYeG9XcOV6N4c2dKi5f3vsxNAEeK/tk8/hxyRlPO/p+5PoVNyG1Pb59c61WLvAFUDyRunuuStR+S52Z9zfXidQJpW9U+e8h802HG7j7adZd3ukD2JC/swl0Hdwy5qYQV6KzPcMo8Yr5qpARffpAU7vrTERdBF9VNoyIUAFeGbGiCAh0jUHAtSNef1BEbPXLjJckRH9KW0LrkWRgPAbbynU4vmnHpUefRf32aKwCEPZMBaZXIXGnqJsouida+uFaVaDiRj9P6R8TPdSYP+UGKJw9vnmk7g9F4yrRYHvDJpZuBbCbjTuZkujsUrpwGWb0HB4qVtp0sFjJVAd/rNp+39rUyI/+pVvhgynR6pTaNOnuX1Ng2oL5p5bBpAebbzy0zraCR4o1rkeMfoMqFHE/5+kPpgZFJuQhqY2xuOBnF8HoPsYPVp3+8J6GWRiahSMcXQON2cOkTUncMAA0jgTgemR9gEXxSKj+UE2oOPr5//SEApGv1PwN1+9kF+IoTGTv1h/LFzGtQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199015)(38100700002)(86362001)(36756003)(31696002)(31686004)(2616005)(54906003)(316002)(186003)(6512007)(6666004)(26005)(53546011)(6506007)(478600001)(6486002)(2906002)(4326008)(5660300002)(4744005)(7416002)(8936002)(41300700001)(66556008)(8676002)(6916009)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tzd2R0huc0F6QVhxM1FQbUlLSngwR1NFQjB6NnhLTHlMY3kydzBGNFNDUHlw?=
 =?utf-8?B?OFB3ZUtacVd1R2NCQ0NZa3I4dGlHcGlrSlVNd2k1THBUVktOTUVHM29JRUJ0?=
 =?utf-8?B?N05LS3E2U2YxMDJnT2kwaHR1bFFuYlk2M2l2aDFzbkYwTm1ZbFFhMmJiOFo0?=
 =?utf-8?B?M3NrZUZJRzdWSzZQS01DeER6bm4zY1lWODkxeHpPTGV5a25vMktsRUlSZjJv?=
 =?utf-8?B?cy9JQ2kxRHVRNXlDczhZaXUzUTFWbjBKRnRUUWwxWGNSVU51cDVvY3hIRG91?=
 =?utf-8?B?QTRURnhVVjk4K1RxRmg0OThkN1g2YmNqYnlkbHhGK010RURFQW50bzVUd1l4?=
 =?utf-8?B?NGllcjhGQSthajNEamNEVnA4Si9mQjBoN1NlM3lmUE91aVdyMk9FTkdWU2xs?=
 =?utf-8?B?SERYc2xpUy9oYUE4K0ZSTm5ldWg0Q0cxRGRYMXRLTm5PMWl3N0hndDFWVVM1?=
 =?utf-8?B?QjV1V2l0aUFndHBrVWJ5TzJLY25JVkp1VVYrOWpPd2NsYnIrbnZxM0lRYnNS?=
 =?utf-8?B?d2JYSldIQithdWVHMTFvbmJvQWRGVHpha05PTWZVY3BvenJiZit2S1pEUFdh?=
 =?utf-8?B?RE9WWGJxOVFHdVYxK2RUUTZlSUtraG16N2V4Zlg0SWFlV3pRZmJJY3l0UU1h?=
 =?utf-8?B?bGQ1RmJiUnh2UjZwMmxXWE5JUVpLWXplcldQQzdPeGU0azhmRGtGTDJBVEZ3?=
 =?utf-8?B?c3BmVURIN3dlVXJhYktzQUhRUFRGY1FXZHZSM2RndStBUUFndVJTWGx4Vk5s?=
 =?utf-8?B?Q1NtQzVKMXg1c3RPdXpLSmdqZE15OHZSL0UxWCtQdUUzVndhVEE0RnJ3dFZm?=
 =?utf-8?B?R2xqREFSS1J3VUFqY3lLRjJlbEJURlZ6VWpxVXRHS1hLOW9ZV0hVQldtbUNU?=
 =?utf-8?B?RUlVaWNvYjJMMXorL1RWYkJ1dU5zWWJYR0xvMWpSWjArY1JZMVNxUy9icnhq?=
 =?utf-8?B?YmwyMTJVWi9uOVZmU284OGVPenFRTFBhZm1KdUpqWGE2S05TL1l3aWpXb1pQ?=
 =?utf-8?B?UmsxYStyTCtwRGIzb1BTUVMzbk5wR3RVMWZFUWE5aFBTL2s2UnZaY0lOeXlh?=
 =?utf-8?B?N3JWcTZTamdOaGNOY2tmcFczbFBnMUFmU3VFUWcwc0NtQnJ6ejVLdng3TmtW?=
 =?utf-8?B?dFZXeTM4SXdqaUVsV0FvSkZnb0F4c3NvZXd0NmRiWDdSTlMwMGh1N0NaQ3lX?=
 =?utf-8?B?UDVueW1NTmUrYmdFbnFDbkg4ajkxeUxHWGpyc0VSUUtWM3hvTHlNM0NmbmM2?=
 =?utf-8?B?T0JwSEhpL2JOakhIWTU0MGpPV0E5NVdpNElJZndMYXBLMThobEE3Vk5JUEVq?=
 =?utf-8?B?RFlnR3FyTWJFa2hCNGRxNFEwYk9tM3d6Y05VRXpnazJ3VnpSbkFxZUtkYnEw?=
 =?utf-8?B?YVNQbUNRTGwyZldOb2t1QXdoTmdnVEFtSFZTQ0ovSU56N3lvY1MyQURSaER3?=
 =?utf-8?B?eXVhQjNERTFlRlR2Y0k5VEg4ZTRIazJBYmRpV0JJenNCbUpMWWIrU2xQQTZY?=
 =?utf-8?B?ZnBINDlLclJiRmM5SURuVkpFUUM0aDMwOC9XQkZ1V2dRSUs2K0M0My9jUktt?=
 =?utf-8?B?NlRiMXhwbVcweFhjQXZvYTV0eWFFY09SRXN1RVVIS2FrVVp2RTFWd1VvdU14?=
 =?utf-8?B?YWpHUVNKNlh1NlFoaGcxKzA4OElxNWh4QXFubkJQS2lNc2dCOXZOcmQyYVBy?=
 =?utf-8?B?YzBZYUpZYjRIQkdTTDNmUFpCSittRHJlRG1OaWZ1dm4zZ2lBYTlPTTdTTjZ4?=
 =?utf-8?B?aGF1aFU1T3VDNXl6THNHZ1VTRW5qZXBIekREdkN3SlFPb3dZdEFQT3QwUEFG?=
 =?utf-8?B?eDBwWG5HejJuRHZnVU1tZDhlSHZCWWkxQXE2bnU5b2hnSFp5N2xyTFJFeU9B?=
 =?utf-8?B?d01YQmZlNUZMTWVIVHJQVDhMeDgzaHhvMHdBSkpFQ0wrK1pibTEvQUZaejgx?=
 =?utf-8?B?emVVL3pnM21lNnk0cFBJbWgvcnBLMnBCVG5uZ2hLZlZsSjV2RWcrZm12WUlz?=
 =?utf-8?B?Ylp5UDc0TXlBWHQ0d0hnakJDOWhIWmROZzEwT2NoYytQRmx3cTZ1TjgwRHR2?=
 =?utf-8?B?eDZ4YWVNYnA5U0ZxaGcwMHJOVEJzZHhiOFZjSWJBcGRLMElpQVRxeElaYzB6?=
 =?utf-8?Q?7H2fYJTBCIJ1HltQM0muNSKfD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d90ed3-12de-45ab-5f10-08dafe2734c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:22:37.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VW+8UEVP836vm619z1SKAVKSmba1f8mYPPmnzqPDGNqhRRU74RUQO9ORbLySnWOOgxWfuIflPSZrHkmJXFKu3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9245

On 23.01.2023 16:47, Carlo Nonato wrote:
> +static unsigned int *alloc_colors(unsigned int num_colors)
> +{
> +    unsigned int *colors = xmalloc_array(unsigned int, num_colors);
> +
> +    if ( !colors )
> +        panic("Unable to allocate LLC colors\n");

Already for Dom0 creation I view this as an unacceptable form of error
"handling". Later you even hook this up to a domctl for DomU creation,
at which point panic()ing is entirely unacceptable.

Jan

