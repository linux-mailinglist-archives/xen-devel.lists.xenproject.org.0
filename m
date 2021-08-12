Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D736D3EA79C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 17:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166515.303910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEChe-0006QB-Gr; Thu, 12 Aug 2021 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166515.303910; Thu, 12 Aug 2021 15:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEChe-0006Nx-DI; Thu, 12 Aug 2021 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 166515;
 Thu, 12 Aug 2021 15:33:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QHFb=ND=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mEChd-0006Nr-0c
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 15:33:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 828995e6-1ed2-4f07-b5e9-9b8ff4b0b052;
 Thu, 12 Aug 2021 15:33:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-qqJ2jD8mNSOwkGUbo8AYcQ-1; Thu, 12 Aug 2021 17:33:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 12 Aug
 2021 15:32:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 15:32:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P190CA0019.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Thu, 12 Aug 2021 15:32:58 +0000
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
X-Inumbo-ID: 828995e6-1ed2-4f07-b5e9-9b8ff4b0b052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628782383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+eK3KoTdo7kEAFGExDlCPWWKIpE75nvxUk259FvVhE=;
	b=bXKeoJSHGfVHqY2KxqwidGZQXJ+c2gkTmhZSFHbmahORz2nEQwnfLf2IOWiq0wGVep1CXN
	q/t7lBdNgnHyS7LRb/5wU/ptpY1AuSIJ2dhsHUxXok1BXh4z3K2VsgzrWLQJZERMW5YkJd
	908TdyLsr5XCX6r/3JkMOpGpAmHMH+Q=
X-MC-Unique: qqJ2jD8mNSOwkGUbo8AYcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcslH116eTT+hcLYgPHpxP0LB2ywGij8KgO1fklKdNN/+EIi6eR8w6h9DCUV7vDFyr1rZ1lAwPe5vbhXfADR1NLAKkVUcO+IC1rj/aerDbYYDYD7fcq0WQbRS11R2+NilOfGcJdUFwA/uq1L/ucGAzaEVyC9xqeHvNOY/4cXsFSsqM7sCHRpKCqAn/WPHYf2yZFf/GlUu5H4XmxU43v1gvlJU4uWD/5d/30uJHb235uwj5zS9eVykhtZpXqOHin2Ue1o7pA1+pOc1Jvd4mn242RCZI2NjYOiuueUlK1uAhP6nuTDcM+kdThVg4MSubKC9KN9yVGVC9cSif04C08z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+eK3KoTdo7kEAFGExDlCPWWKIpE75nvxUk259FvVhE=;
 b=BAI2DWGA5la88lMrmO+x9nvat7LOQTCulOXUi8m/r+LvvMkHV/CTqv1MQ+EXsr6gdnduMLG52MtyKHtIXCG75f0AB5w4ihyNrX/D4AM/2btkyUWAumJd/46OKghdJnVrftp9lzTm5KT6NN2ZpVcqxfEiUofuT4KAWLoQKh9MwlkdMSDkutZk61Y528BpuSHBWXTb25rjtqWKFKxoCNONSOk78X9n/MVkURvE2jk9ac1Z4ZEAp+nLy914403eS5XR5PCKdJKyBnti0xMRS+eUkYi6hZqU9BEJoerUBrH3ACA/5pzQW+J/tBy/c+1LvOsHKhW3dA2jYZEomr8BeQ/NnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 03/40] xen/x86: Initialize memnodemapsize while
 faking NUMA node
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-4-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <106dff13-e997-db8d-babf-0d6a73146ca3@suse.com>
Date: Thu, 12 Aug 2021 17:32:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210811102423.28908-4-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a73c2cd-37fa-469d-e0dd-08d95da676fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304DE2B2EF86AA9CE4B29B2B3F99@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	93km1pkx27FUpmEDWpCQt0EwUscqIgUa8/jlS5r0ORY5sdRVrGGcqiw3pP4mKbFcSptWW7sBqNOsyKVpQQQnYuEjS1X/Ac7l0tu1cOrWomZJjkAuWTxpyfvC+8T2/aimhTe4fHMuU2N6686MSLzYsyCc9Eswy6/vD09c0iL8JASSbcIDVAhUvhT65nhgnNkc0pnyqR7aUvMH9n9ePyWU106WyL0Gx0ybB4/aGSueWx5VTPz5F2+J3Eso8DlgSjXzaKGunNoSHp29d10SIACKVSi89eHJw3i8cA3iAwAFcgvsxfWo+6E5ClyF8EYhStw3l7fd/P08mNwGqGcN+BEIsBoG2vaodjlSHuDTSlq3UyKFw44ax2O7lnvMczV3Tx3RJZ89h5uoEoh8Q+1i5J/4iZT6sayWKqku+rwxUPTchPn6NB4yPY6zKS20izjqtfqi+lhfn+YKCfxns3XoVSpSe2rX4Hnq9+AuJe7lKTUTn9LXe86swJqKXQUz61Y/9RqJKAhupCXeLH3aVuwhiFpTr0+XVX5iOe45B3RHl9fiT2n9MUc8MnEwosa/pgL88JEebKgaQu7Sfxp/g51I/0icmPRlxAFbkkKDjSng7SaTMR4i5rkuxVw8PgI2v2zYgMUz+R3hYOS/weyURh8zNe91B5vqgabdE6EI1yuDcOOtPQrPiXEQsu2s8EYspNie7Tfk+neY1gI4Gi/EbVzB8jPR3pGHJiGoQhnUDEpv0ktFNCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(4326008)(53546011)(5660300002)(26005)(4744005)(478600001)(6916009)(8936002)(16576012)(6486002)(316002)(66946007)(2616005)(31686004)(66556008)(66476007)(186003)(8676002)(956004)(2906002)(36756003)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjN4VldEVHZqVUlFbGFFSysvWkpWRm1XWGYyRXh1Zk5SQ2dBay9vejdZVFhk?=
 =?utf-8?B?YVBwTGZvczlPaFBTcXR5T1E4WVVtM1Q0dXJUYU4ycnpCK1NpMjBUd3ZqTTMx?=
 =?utf-8?B?bjh3Z05zQ2tzamtpRER2dG84UW03Vnp0a1gyYzdTSk5GWmJMVmdMaXlFRHlr?=
 =?utf-8?B?OGtuOWJnMEdxWlBNQ2lYZVFIMGNJSHp4djdjUjNoaFVvdkxnUU02WWE0V1hz?=
 =?utf-8?B?Uk5rRkxPVWlpZnBFQ1ZPQVprNzFPUnp1R3FxSFd1MWx1Z0V6M0l2b0FGWG9p?=
 =?utf-8?B?anRUNGVpTU10dDArcjVQYklLZmlBV3ZwNVJweS8zc0N3Z241VDU3S2JtMndS?=
 =?utf-8?B?YTZ6SE4yUjhSeDFqLzhNRVlEOU13aGdXTzRBdnpaN3kzbzJsUWtJT29MRkZ3?=
 =?utf-8?B?MzBCN0hlQTl1M3BnYkNxWmZ2ZndJanJYdUkxRkQ1MncyVXhUc2plb0Z2OUFo?=
 =?utf-8?B?K3pBdHNGbU5tcFZ6UFZkZmxYeHJtdU4rVUFOWlo2dHoxRitzOHJTUHAzSTRL?=
 =?utf-8?B?TmpFdFRGU3JiL2Z3T3hsc2YzQXZUREQ5aFNCZFRTQ0lkeDFKakFLbGI0dzc5?=
 =?utf-8?B?T05BakY5R2x3d1l1YXVHNW1DS05aSHp6Q2o2NllKVndqYjM1Ynl3ZG9GYVFQ?=
 =?utf-8?B?VDhkNy9MUFFFYWpHNHJ3T3I0T01RODJ1UjhCWmV4RHhoQzJNLzdRUEtmM3do?=
 =?utf-8?B?K01wbWxERmJ0ZUFyMmhiNTdLd082QXZqclBFb2s1dHVBcURnK1d3SEp3YjNG?=
 =?utf-8?B?S0hHdnZaNzBMZm9nMGFDaFd6SDNXNEhod2ZFb3p1dXUwb2pkempCRnA4YTVQ?=
 =?utf-8?B?eHZ3YXdJZVlSbTFVcngvcUp0cU13eUdYaTVrczNCMnhITnhJOGZzL3p0ZU9t?=
 =?utf-8?B?eUZ5WlRYSFdnWGttVjZzeEpLMlJIb3FYOFVqTDNjSjRZRTI5L0FFSUU5NlBk?=
 =?utf-8?B?SWhFdENiSk5LYjNmUDVMcjdTNTJHQkhjbk5yank4S01KVG5FYmRYclFoWFMw?=
 =?utf-8?B?VjgxN1pNV2QvdGxtdzBNUUM3NE9ER3hmK2ZQMEh3SXRGT2FWNWtuVjBTdHdO?=
 =?utf-8?B?NkRTMkVzR0JTOXBsSy83dURKdXlsQjJjZVZvM0hDQW90YUcvOWNnUkpod3hh?=
 =?utf-8?B?ZXdRNnlmY2U4REdpc2Q1Y3JvN0VFWmk3NzBFRExRbmpYa3NUanBOUll5VHpD?=
 =?utf-8?B?ektGTHdqemRwYVd6bkFwVEZPOVgxUWJhbExOUVRCUlhNL3dyVUQwL0JqTTF3?=
 =?utf-8?B?ZS9Fa3hmOUlIZWxUY0U5eFl6dGJMVzVxdnZqaVlvVlVodkhoQ1o0dHJqVVFV?=
 =?utf-8?B?b3R2NFB4TWNtTC9COEtvR2RFZXl2cFVlQlVIaWl4czZPcUpiUXV6VVV3ZjA4?=
 =?utf-8?B?S2FrVVpPdnhNRTd1Y0Y2eTJwMGsybVBiWEs2MEZ0RlZwamhjcnRzeEhJQ1RG?=
 =?utf-8?B?azkvS0FmQ25uWkMrNHpqcmVaSmVYYVY0M00wQzI3NW9MbWxMRlJaRDNoR3hJ?=
 =?utf-8?B?WmZKUkQrSEs0WWY0eEpYVjVpb1REeStBRUd0TmpSWWRIcTNySmNwckxsWVVt?=
 =?utf-8?B?cnpVZVdDY3BYZjFOMVNLa21HRFMweG51dVNiUUgrQVA2MVRZTUVKeHlsMkxE?=
 =?utf-8?B?TVROV0tCTHI3aXZZRm9oMGVkNFpFQnlxUGlFUi81S1RqNEEyU0hqTS92T0xP?=
 =?utf-8?B?cmd0aDhaV3FEWG9SekNVbE9IRnE0N1lsQUpEZ211RXJhL1I0Z2F3TzZRL0U1?=
 =?utf-8?Q?y61I4s+U8if3a/Bqr9ITilsIgv6duKULO1zVlZY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a73c2cd-37fa-469d-e0dd-08d95da676fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 15:32:59.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ/k/g/K3hYa9GEUjDOlNOHJyzUsuS9M/V3zH6WnSUYIv5Yo0P8Bep8COPUhuSIh6oP8jT4KXDoMtRU8Q9UVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 11.08.2021 12:23, Wei Chen wrote:
> When system turns NUMA off or system lacks of NUMA support,
> Xen will fake a NUMA node to make system works as a single
> node NUMA system.
> 
> In this case the memory node map doesn't need to be allocated
> from boot pages. But we should set the memnodemapsize to the
> array size of _memnodemap. Xen hadn't done it, and Xen should
> assert in phys_to_nid. But because x86 was using an empty
> macro "VIRTUAL_BUG_ON" to replace ASSERT, this bug will not
> be triggered.

How about we promote VIRTUAL_BUG_ON() to expand to at least ASSERT()?

> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -270,6 +270,8 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>      /* setup dummy node covering all memory */
>      memnode_shift = BITS_PER_LONG - 1;
>      memnodemap = _memnodemap;
> +    memnodemapsize = ARRAY_SIZE(_memnodemap);

But this doesn't reflect reality then, does it? We'd rather want to
set the size to 1, I would think.

Jan


