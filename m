Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B95870FB74
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 18:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539178.839809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1r51-00084k-FD; Wed, 24 May 2023 16:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539178.839809; Wed, 24 May 2023 16:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1r51-00082D-By; Wed, 24 May 2023 16:11:15 +0000
Received: by outflank-mailman (input) for mailman id 539178;
 Wed, 24 May 2023 16:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1r50-000827-Eu
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 16:11:14 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe12::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9710cfd3-fa4d-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 18:11:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 16:11:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 16:11:05 +0000
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
X-Inumbo-ID: 9710cfd3-fa4d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZiWlxdS7FO5sQT/6Ne0RIcxcs3a2rr58GOG2GWdoP+b4khxw7idDsXqfJM0adJPR8Hu7d3os2KOuaGcuHvaMNQFxbS1DfPaTwBstNSQ6x0p3aaw5TyisbmCRxpm+CzfxNRBd3tt0z4Qd5+GEXq3GYoFhqqT0X0mfA16gUvzZcfPsL4uH+C2Sk4WHj37qLyeM9qc3tLd4whA81iReTOaAtp9ij0kxKP78wLM1og0jSgWPSBGgh90y/EiKBFEEddWKronOW5a46gUQSAZbkBNaAHIaH9lG3US/dG6obbvzNxeiJxUjkE/aB63UIuVwclxJLX6tSeQj2bx7Obzw0YIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKlbmUGuOtAnnhs3muv7wdY4OoUhyDfht/b6x81YJCc=;
 b=XBPvs5u4AkW/MzLqsB6TYFYtdlzMGxWdNHwTeLxtlbphS6njOYuNiGLTiNknMzIYGYyj1KseodkQN3t5s/zFny45zhgq+LGuI9uIVcnFksyfEi9jfARuEsKcfOOUKxqHB98P2gpQUbDBU/ZgrT+7kzFL6EZHk8wEAVg19smz4mHrdh6FiJZSyfxIK90SUNee99CrMjEoJMwPllAQ10C2f1lX2w2Et6YiL/y30g/rTDs9WZpT6fKoLntsMlxiBkbJHruRVLxXxAzlG1g2+yAmUaRnCyx9u7kwnBQ7nVcsrIjhpr0Ry3bFg/JCeJalh6ntKIkNvuP1QC9CuJ3YhHuPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKlbmUGuOtAnnhs3muv7wdY4OoUhyDfht/b6x81YJCc=;
 b=ImErJo9MsZ+Ze/CBxu/4ckAfGbT7t0xrKXEVPpg/05jrirvYg5cWLjPx+YSgIGlRuKpPQjWKDh1i5A1JXzUOA64tCIRqkYE3g57/IGicESiOupaw5Dq1tQpwviRRy+zESLa79XjRfw7g/w99Tp8Hf6ohlWs7o6WhtNPHF2qqBWd4zNMEzCh6TrQP8EMRfCNlyqKbbMLbpBfwfTGu/gjAxj1L/RH47HcOQX8seOd10kNBzeCNe02lXLyh1WKOvXITirxjozkWR6x98YDn/Yr4ldSYZL7iMBBDueeuUD1b2jFt5mM9H4P4qXyIi6bDf4uFoKYJrDNaufwAnDj4ouSGCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2099b1b9-e3c3-aae2-351e-cbf067dc6ecc@suse.com>
Date: Wed, 24 May 2023 18:11:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] iommu/vtd: fix address translation for superpages
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230524152208.18302-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230524152208.18302-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc8fac5-736e-4274-cde3-08db5c717a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a7P3jczRbzivb6yT4iDIg81W6mj9aIzoxFlYuwuWe8JeAHZ+O0W8LUK0Y2Qa6oKbrZLyLYgf8OH0NcUgQiL0IOb//pojHkAclhNqe34uFZcLY4YAMHH98nqlslgPiRQdbGDRtoz3ORp7O19HCz9nUlc6dLlM7HgwNPJma7+zN8cU3PA18lS3mzIqnJlhFusZzTk8rW3hlkS/sVH/tUHh4jbQ2J/nLYNORQ+P/JgiNVgcuyXMRC0MtKA7MVhSF5Mqq/4dlB+TODFQLjHUP/P6Gz/PJ91XRxRQwU1bKCzdnZaOcTsiNMhgKbuPjjZdPg7Z/PR0U5HffYmEYuwbvupq8sK5oaN68vfU7iqAqJxy+kChSsYxQBVRJ53b1uNBASiOBv3VyhqRPjcw7gTxlrfeJAea6HhQJTue6OWzMFZLdAnZ4xHQ8FBgmzZylZEVigo6cecoxNp2O1zB8lCzfLHNcDmzmRTWcafrdHd+l3zT3CQ+HqsjI7Nl9wgtxw7Yr4rVBS2tIkP6b1kPEiel8oS3xneZJ62bF90Q6TWSB114atTlva6NmUIaBIaJPUc4KtCvICi0Wh2knBNcYF4bThslgC4vt0CRFUaaCaBKkIMGJ/zHdJf9OVGpVioqEhx2BWB+ueXXzZlBAqqPDbMGApSb8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199021)(6486002)(478600001)(83380400001)(2616005)(31696002)(86362001)(38100700002)(26005)(6506007)(6512007)(36756003)(186003)(53546011)(41300700001)(8936002)(316002)(31686004)(8676002)(5660300002)(2906002)(66946007)(66556008)(66476007)(6916009)(4326008)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjUva3FkaldWQTlNdmFNZWlRYVZzVXMvMkJQVXluTmVGQzdwc0hJamw2TmQr?=
 =?utf-8?B?YzNrSi9tTjhaYzdkR012T3A3RlVDSkVPeUU1YnRnQ2dHTEh5eDJENTh1aG1u?=
 =?utf-8?B?NFk2RjJjYXB1ak1uWlVPcVdTaHk0SkFmaHpLTnVKMkZhYS8weUJ4NUQ4YlhB?=
 =?utf-8?B?ZExIOWJoWG5PMnBGa2NDSXRBdHJyRG02S3RWc1NyMHJMOW5QOHl1MkNvMlRh?=
 =?utf-8?B?RUR2c280bFRkd25PYWppdkoreGpCcmhDY2ptMHFuTXNEczVpVlVJY0lSNTJC?=
 =?utf-8?B?Y0NncDlTMUlsdkRGWGlkaS95M2xDbmhzd1N2Mjd0YUtsSWdoMEltL212Tlly?=
 =?utf-8?B?ZGp0UFhFVkNTZ1NpV08yK2hqd2tNdTZrdGdXQzNJcitVQnV6aDl0MWcxdnUw?=
 =?utf-8?B?Z2NxSXFzeDdvRThnbGNYcWg4R21uOXZFb21lTk1SOFh5NWFxZUY3ZnF0cDkw?=
 =?utf-8?B?bjhnNGZnT3hiNWZPTmhGQ1RlQnVXRTBHblpSSkRob2JNdTBGZm1pYVJVckRW?=
 =?utf-8?B?bm1oc05nOXJuZHdvUHgrVkN3ZHBKQXQxbDJVYlNkQjBKVWtRQ3V3Z1pxTWt4?=
 =?utf-8?B?VDVNSmpTbnpaVjN6YUt5anRoYk9OMXpDRHIzQnJIWldYNGZHTVlCQWpHY3Uv?=
 =?utf-8?B?S1ljYnlYcWNXV21mNi9ZUC8yWjlEaGNSVDR1YVV3SE1oQy9qRFdKVmRRN2JO?=
 =?utf-8?B?ZCsxdlR2Vm5jOVRiV2xBcTFRK1N6SHdGbitBL3laNmoxeXM5NUplS3o3b1pI?=
 =?utf-8?B?WkR0cFZEdjFheTlNbjdaZVVZbTZ6K1kzTUNONUEvUHdMTCt1RkxhVUUvOGh1?=
 =?utf-8?B?YVVOSUh3UDRJbE8yRm1HMkpQMkdpbHR2aU9McEhJWDFUeE5uM2NYUGpFQTRw?=
 =?utf-8?B?V0tpV2VZaHJFd0lqYk8vNmw4WWU2U1NtaVdkU1ZWM2NUSnY4UTE3M3hEMTM4?=
 =?utf-8?B?SjRLbW1UdFhISTdmTE9HczhWeDlHZ3N5MjVmT1RjTC9lRzY2MjRWK01vV0NI?=
 =?utf-8?B?UGlocEEwdWRuWlgwTmQreFRrRXZ6eWc1bWpLdW5URzU2OW1yOXhBa1o2Y3hu?=
 =?utf-8?B?M0xiWkpONHVGSElldmNBajVLWUlMVDNjM0JmeitRTGhSR09xd2pRTTFyTFp6?=
 =?utf-8?B?RXBwWGFiNnk3V2I3ZWhZR1Z2WWhhR1FLbUVURjJEMnlXL2tsWkt2OUNXOU5l?=
 =?utf-8?B?YXhDMVhiU3FJaWVmZndhV0s1Q2JBSXN0QkpvS1g0SDBraFlWbnF3N3AvR3Fw?=
 =?utf-8?B?L2tWdjhIMFBGSUtvcUh4SmlrQ1hQSmZoUHZPTEJtdVVlRy9EQUlwTURnSzdX?=
 =?utf-8?B?S2pDM0Zmc1hxSHZjbitNWXpNYTF5V1dzK0xyblJEcFJ6MjBMUk82N1hXL1Bq?=
 =?utf-8?B?RUtFQmR0ZWZ0TDlDLzNnQ3JDNS9MTGlIS0xXZjJ3bHF4cVZCS2xXSThnTjZQ?=
 =?utf-8?B?a0xBbFc4YTlVUFJYZndGaE5UL0FST1VMUDRaK2dYcXZ1d0s1U2d6TWZnekh4?=
 =?utf-8?B?L3c0TjcyK0pGU05ZQzk2Ky9zZGZRVG1IZHBKWUp0UjBibTFTL1cyVGlTcHN2?=
 =?utf-8?B?K1VvNWJ2QUNjVUtldUY0Sy9nbzI4RkJlOHFMb2xRV0xLejBFZENoR1V6QVB6?=
 =?utf-8?B?L1VlZHFPRSt2MWtOaHVhY2hOeS9FTGJweXJoWDVYZGZjVVhISzhYN3hORHZl?=
 =?utf-8?B?S2kyOVpqZDZyY2pVMTVnMEFnTGNILzVoeDlCczVWZTE1cENoaFBVOFdqUUVC?=
 =?utf-8?B?Z2dBUzRCdDZiVzIxcE43akJMQXJTclFqNVZ3ZWRiUFJVMUg5NUV1OG4zZm1r?=
 =?utf-8?B?dCszWmhzNnZEZGtJVy9kRUtqb1BIZzUyQzlETWJNWU9DUjh6VXREUHE1b2dK?=
 =?utf-8?B?YWxTOGpwdnhDOVpGVFRDY2s5c1E2R2hHOFNMU1kvMHp6bkpLN3ZTdFQ3ay84?=
 =?utf-8?B?anM5VEhmTHhPUFl5Q2NkbElPTlowY1d2SGFqT0dUZTRYT1dXNDJ3dWZQQTdq?=
 =?utf-8?B?QkdlWWZEaTAva2N4cWMxVTBSMmkxZjA0djRGUDFLd0ZTYml5bUhBV3VGMWZS?=
 =?utf-8?B?Umptd1JGM1c4b2ZuY2kxME5tM1p5VjZqNm9lSTdZV3NOVGNaRXVRanN4aGxV?=
 =?utf-8?Q?C4Ral6NmlES7oTmhjuL2PvMkD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc8fac5-736e-4274-cde3-08db5c717a35
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 16:11:05.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPPeLZs4pitRaNbiALoMNYPBXEgR5WZcvoJkp7ik5S4YjXGJrb5Za7Yyx12Yn65wsqjkbN2m5QtDkUERXmQSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

On 24.05.2023 17:22, Roger Pau Monne wrote:
> When translating an address that falls inside of a superpage in the
> IOMMU page tables the fetching of the PTE value wasn't masking of the
> contiguous related data, which caused the returned data to be
> corrupt as it would contain bits that the caller would interpret as
> part of the address.
> 
> Fix this by masking off the contiguous bits.
> 
> Fixes: c71e55501a61 ('VT-d: have callers specify the target level for page table walks')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Just to clarify: The title says superpages and you also only deal with
superpages. Yet in the earlier discussion I pointed out that the 4k-page
case looks to also be flawed (I don't think anymore we iterate one too
many times, but I'm pretty sure the r/w flags are missing in what we
return to intel_iommu_lookup_page()). Did you convince yourself
otherwise in the meantime? Or is that going to be a separate change
(whether by you or someone else, like me)?

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -368,7 +368,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
>                   * with the address adjusted to account for the residual of
>                   * the walk.
>                   */
> -                pte_maddr = pte->val +
> +                pte_maddr = (pte->val & ~DMA_PTE_CONTIG_MASK) +

While this addresses the problem at hand, wouldn't masking by PADDR_MASK
be more forward compatible (for whenever another of the high bits gets
used)?

Jan

>                      (addr & ((1UL << level_to_offset_bits(level)) - 1) &
>                       PAGE_MASK);
>                  if ( !target )


