Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9063574D2F5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 12:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561170.877548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInqX-0004qX-FA; Mon, 10 Jul 2023 10:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561170.877548; Mon, 10 Jul 2023 10:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInqX-0004op-Bs; Mon, 10 Jul 2023 10:10:21 +0000
Received: by outflank-mailman (input) for mailman id 561170;
 Mon, 10 Jul 2023 10:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qInqW-0003v7-5a
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 10:10:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe12::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9330990-1f09-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 12:10:19 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9575.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:10:17 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 10:10:17 +0000
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
X-Inumbo-ID: f9330990-1f09-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YktbkkMuyqsPIbRdW5nCdERkP8+jf2bP2/gPvQ5FZAd1cND1dDeZ0zeMNGBGJ7GANfSkuymu+XfCx+3kE9HhITgtmS9bcazN9lE+QTzexIkobruS+I6whiz4Lvz2DnAHlBTiSHpLOQt8HWIOmBYQHE3Q2edIplAuN5eJWSpirywbBezM2LdJwXEB3bZRuoSop16vgUv5XlmbmkWSw5o99r7Hl386oddrQxn41YUvbBDLmdPv+ZonLJIoMAUXJaKqEyuMmasN5odYJZZSpvRwII87akl5qHF2b8UaS8AHHEwiGKd8ELxy6+rblsfGGuwQS1b4p+HY/h7FrAagtrtl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYSTzTrbpZqImYfCCDAkUt1tf5uvXuFJAcsU0uWsR5E=;
 b=b+8nebXFtag4VRKfk9qA8ZFW+wxb3BNqcX2bWI4o7SELQr+fAGIcPrenYTHvFmUGSll616sxUS1drLNI2WDvuWucZoQNygWGS7OxARUOmdBa4lQvJp6ysQCsYRnA7BpFzqUpC+GXo3i1dAbmX2BAe9Nv3WNsq7wFzO5vb6ny7eGXKfcGCfZQHw8eN1BSlJtqtF1FRwjzrZ3lgyzzjY28n1nI9ekiuLvlVzvPc64t5SUXiShsaS5uaRM04gUGY80Mq3q3Qw9fS5Jzcic6tftRUTrOcfg/bsSxbVPwUKP71Cir+RGdaKtcATk8rWXDJg3U8bUoLs177/2r5Qgc5OKNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYSTzTrbpZqImYfCCDAkUt1tf5uvXuFJAcsU0uWsR5E=;
 b=iwfz+cWZ1iqw3QDsaXk/1DcZBjD7S14XEPVpq5vd0bzxkzDpTt9y8dZUpqQotW1bC8xjyOEI3LWkyT/11cyuMRUCsT64wvEPlcZmNi2e+QabyEsWrIE88wY3EqHASMJ4GsgypI/RmWrFq0d5KOoGPhua2gohfQVWt80L+WoG/7tdF3TzhMd5+oEHhFZNqmICgEjNknhHkhMxGdUrDBTmPQnCYtcxFoTue8N7Um2UGFJrkW9DkSdSRFk+MPRUYI5bZ9AVLiVg2HF2sSFLmOcjGrDjseMD4x/xx4uSpqBOq+/oZvbKJhE8w4Lm1BHLuuDT1Igl/pUqnBSQKgnJbKyaGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8457afbf-8161-32fe-27b3-c46c0302b22e@suse.com>
Date: Mon, 10 Jul 2023 12:10:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] iommu/amd-vi: avoid pointless flushes in
 invalidate_all_domain_pages()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230707135915.47359-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230707135915.47359-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::25) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a81f955-cbaf-4bff-5603-08db812ddc1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yyNPUlY+8H3fZLd4RuKaM7OF/Ib0el154VtvRKjDor+Pfsp9yw7QXpCUhi++JqYuvbdjHPA8FeBtrVQakE+q3wQBe/y0pon5uPd4xSb9GptgDSWOaMsKP3Ao6c9nx8HERSdM7c+QPQmO8opMXs/wE6zjYDvAveTBlo2RRmQDSNQNgyz74aklSeSVCbZbh3AWj7Ph7/cmRDNcIrhVOa9IaFmWcjkTlerP4+w3/ihRuufWzZTGjRB/3XNFPZsUERCXS7mOwokvCO0BQN1u85XcJyKKFsolUJZ4Gxi7LLKTqgn1NkmWOYm7RWtOKqQapgJgO4/RELMGbH1CWsf5lYtXEZh+xFTVEyx82xvFOeEdU6oXO8CYiI+dWpSxIRgRMhz+B7FLN5jcjqz2xqwdoSNLNY3MFwrRSJbMVqEX38u8UwB81RwpMRdGJ5WEHpKvgAcNeNKwK/VP5I4cxcodauxMZ4HOftm5v4jgPwSEvQ8cTqTUQ5Hjq8Qkzr4vRuEX4VH7Ztegz/pHFWrQESHku9NpxiuCJbz1f4WG7fGjBBoLjNgH+Q8niu25z9blipaToJuvpJW3iZDLtRwqIH2bVwZqNxat24krG7rg4N0fA8eE+BTC36Kc4akvdd/3uzJNWKqkVJk2Pd2N4CJbzzH5EtBchw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(31686004)(6486002)(478600001)(83380400001)(36756003)(31696002)(86362001)(558084003)(2616005)(2906002)(66946007)(26005)(53546011)(6506007)(186003)(6512007)(38100700002)(8676002)(4326008)(5660300002)(316002)(6916009)(66556008)(66476007)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vm9ONHUrRC9tcG4xN3MzVTVzM3EwSCtxbGc5ZEw1TE9YUStzeW5sdml5aDhD?=
 =?utf-8?B?YnQxK2UwdFlERGFzeVZPTm1QTVVmMnNDdkZMUmovejhYd0J0ZEVyN2ZmckFq?=
 =?utf-8?B?emxGU3hHRnFHaXRrK1FKZmFsVXBXbGszaXJ3WldGZ1YwK29pU2NKbGxHWWpT?=
 =?utf-8?B?UWdiSWloK3ZNZkJyNzJCK2VxSllMaTRDVFRNRFdrY0oybkRCQlZEL0lENkt1?=
 =?utf-8?B?Z29LdldseGZlemQxbS9vUzB3azc4ODllek9HSktLdlpUMXRQdTF5ODZwZjhJ?=
 =?utf-8?B?Mm5CMUtuV2UvV2VzclNvNzl1a3B4anQ3eHZqQTR3RGpWdlpiaWFlVml4SUwz?=
 =?utf-8?B?OCtnbDBHM0ZDdHR5eGkwWGtBb3RqYTVZWVhVS3hpWEN4bEw2RElHemZNb2ZI?=
 =?utf-8?B?elhDUW0zYkVEYTgxSzJ6T1N4TW9LTmwxRW51aTIxdHBuMmkwM2UzQktuWG5w?=
 =?utf-8?B?R09hd2lqMkw4bzI2dTBXeGRVVkxXWWZadmVSbDlQT0Q3enk4TjZyaUcrQUdr?=
 =?utf-8?B?NjM0b0NGVENIaWwrWm90ZTJhK0Q2Y0xUSURFc20vSzE4b0dmWDZIOE9EbWhP?=
 =?utf-8?B?dlFrK2ExY2o4bTZKMmJIejRPeDNQQncwelRYYXRQeHhROWZqWithNlRyaHZI?=
 =?utf-8?B?a1FWbVZBZlA4WnArTUE3S28wak1zeXhSaEIwTjNxVmY3NjZvMjFkYlo3a2d0?=
 =?utf-8?B?bUYwQ0VFYWhPZkhXMFhYTWhDbC9OTU50YmpNWVFIaU91OVg1bUVPaDVWTHp0?=
 =?utf-8?B?d3NCelRGOUl1NzU5NkM0dnZ5L0tCSTI0ekxtTmZ1dWFnZlJnVHBLWnNsNkdx?=
 =?utf-8?B?ZS9vbVdtWHoxRTRPNzdVZ0tQRVU3V2EzMm1kYmw2QXlyRytXVEdCOHVXTUVI?=
 =?utf-8?B?UnVXQVBLTTJmdjM0ZE8wbFRXNW51bDdzb3ZIVTZzOXkyeEN3WHZmWGpwSVh5?=
 =?utf-8?B?ZmlNN25ZUkUzenJhdSsrbTZGVUhmSEswM0ZZeW4wcVdFMWt2OG1PV1ZHUWdY?=
 =?utf-8?B?RHNlTVlHZndKdU9GZGdqVGt5QmFTNFBRYnQ1eUc1ZUpVWTJJT1cvMHpucmJt?=
 =?utf-8?B?ZUlZd1A0ZnA1QmtuZ0JGY3pEOENNSVlLV0hVcVcxR3J2Wk5jbUkzbjYzNHJC?=
 =?utf-8?B?bTVFQWJzVWY0QmVKTERpQ0NqVm43Ny9NZ3p6dVAvb1lxcHBzeXNFYjFvaVdv?=
 =?utf-8?B?Si9hejFsY0ozMkF2TVc4SWlGa083Z0djSU9ESlpSQ0FhcmJjV3pFNCtPcitS?=
 =?utf-8?B?TlZuM3RycFJvcmRDTjdveFZjVmpldjYwSHlrQk5qVGJCNkIrWUFydzZicmlW?=
 =?utf-8?B?M1lwWDVxKzAwVm1HQVdNeFY4bnpabW9Zcm1KZ1ovTUg2TkFqSWpRaEZwc1FC?=
 =?utf-8?B?VVFQWnl1eEtucGZTSU9tbUE4ckRUdXBWTTdNb09rTTNsRng1WWVBU1dlckFq?=
 =?utf-8?B?Y0sxUmdNUURjNld2RHF2ZldxeWJXYXZaSEtqZm81L1BDZ2UrVnNreUVjRFY1?=
 =?utf-8?B?RkJ1azI0cXYvdjBBcWNmVU0wR0lQanVZU3hueFZSYjFmMTgyTTNlT3BoNTVV?=
 =?utf-8?B?UUVBT3c1NDRSWG5FbGlidlZqZjZIVUhOT0ZSRktHVHh0NTE2QzJRanVNQ3lp?=
 =?utf-8?B?TXd1aVIvU0lHc21NQXdlU1d3YS9GKzN3Ylg5Q2dzT29TY1FVMVdndk9hT3c2?=
 =?utf-8?B?MkxPUnYzb1Mrc05TczdBQjJCZXpMdnB6cVI3eFVLai93ZHdYSVVhbk4vbnpo?=
 =?utf-8?B?eHdKR0FwUDNlZjdZNlR0d21OTmIxcWp5Y0FvaHF6ajRJSFZPeHZqUlRjQUha?=
 =?utf-8?B?ODRyZzBkckdxcmdLWnNUTEdPeDZMSDd5eFRvT1RJLzRtV0xOWVpyZjBlUWxV?=
 =?utf-8?B?U0pIdmI2aDJTZGgwRUQrTUw0M1duM21vd25weVNxVFBMV2tlU2NpaWVFMXZU?=
 =?utf-8?B?Rml3NCtMOGRYK2MwcXA5RG5VZW83TEtqSXBNVVFHU2VsUFdqbVp5R0syNWF5?=
 =?utf-8?B?RVZRUWhmKzRqaHBsZ1ZDNlNrTFk2clg3R2V4ajVzbm5wOHZDZk1paGpubmRz?=
 =?utf-8?B?ZXA2dktSTm5zMGMvZlozL3prT3hpWWNTdGFpL3lpWTFvMlVUdUlhY0RDYzRj?=
 =?utf-8?Q?lQZDl5pI0DzJM6E9l0MrpE9Mk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a81f955-cbaf-4bff-5603-08db812ddc1e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 10:10:17.0502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ2Rlg0NqZFFVy3KsBjZenT9H+ZbANFyz65Z6M5vRFN2xVNE6pL4kOUwNrYRX1f2u+lQABprACNC1VY5mKm0Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9575

On 07.07.2023 15:59, Roger Pau Monne wrote:
> Fix invalidate_all_domain_pages() to only attempt to flush the domains
> that have IOMMU enabled, otherwise the flush is pointless.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


