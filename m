Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589933BC154
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150426.278129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R60-0001L4-C7; Mon, 05 Jul 2021 16:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150426.278129; Mon, 05 Jul 2021 16:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R60-0001Im-7k; Mon, 05 Jul 2021 16:05:20 +0000
Received: by outflank-mailman (input) for mailman id 150426;
 Mon, 05 Jul 2021 16:05:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R5y-0001IU-Du
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:05:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d7e6a89-a51e-4d2d-a419-9c800ad72d8e;
 Mon, 05 Jul 2021 16:05:17 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-6sElj5BnPXCaVgyhWg-Gxg-1; Mon, 05 Jul 2021 18:05:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 16:05:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:05:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:101:16::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:05:12 +0000
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
X-Inumbo-ID: 5d7e6a89-a51e-4d2d-a419-9c800ad72d8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F0A/ANLuNIw6k0OGXwTfU+Vgzp6qPAkINXzaLfPj+SI=;
	b=YKw6VL2XXp1vrd7ty6Z/oKq1SbIghON13LSbb4E499go0MudowJticfaR70aXuFqsxuspv
	Acisq369jsuvKUJMpDFKZQ8n4H77IzxEBG+tog6sXYRWPk1yKWHLvBUHo8yYE4chuFgawD
	mPy1SJweqorelJCifBizxWRsR7Rf4Wc=
X-MC-Unique: 6sElj5BnPXCaVgyhWg-Gxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ufuqa9mZovwBxG3PC5NdcZbICFE/eOGMucY7XPKLQbUMvsjY/v4vx9WuMVL9mEU1LNKLHz8aApZhc1uZX40bV7lRTnxtM4yHV+irzpTPJoB2+vgIJdVqnwaBJJdWyiJZO261QWirEVLPIDoRwC6aMbvGr3nm/N53vd3Cn4Erwwa/DIHIHh1cCMH9cIDUMDFdXJXf2WbxC+um3PWH/4FMjulQF0zVBdVg7Ot9ijzem9nsZyb2u+bxajsTbeyP+M3LbnBQkUPat5X4pgz0quGIXW25l7HxaEQgJWzaCfuBsvGdm7bJwSestZ/Fmue10HufXGX7b3U1rsEEepc3RSFITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0A/ANLuNIw6k0OGXwTfU+Vgzp6qPAkINXzaLfPj+SI=;
 b=LJD7gGJlHJYqGTFjqZH0uKqmF5WiX1nHImCRaJK/r0e4uXHCbjPaOh4hUXNu4gSO5EMia4ybG8HvcUHVSUI6xpAgU8qlzwZNVVaS3043zZrkskwB071NTfiibQok/jG4CXMkimXNkZ2UKOf4tkNh8DV4FeIyyjUHhqYWg5sJ4R6xoTPHlb8lBrlgfj+dTPdGXGbnEdTJFNygrVEX+nm63dolxDJZHk6qWeEjOcUwD0t/9aCgHrDmiKvB+dca3nBgIIy4wXINuPjH5g1gkDd8jWNSPB/jvrD4bu0/FQIqYz4sliYd3ICOISJj57RhD03OToCsfqXq0ysApBj7bwQWxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 00/16] x86/mm: large parts of P2M code and struct
 p2m_domain are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <4dc442a1-9533-3e77-131a-563af5246926@suse.com>
Date: Mon, 5 Jul 2021 18:05:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2PR09CA0011.eurprd09.prod.outlook.com
 (2603:10a6:101:16::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03275861-1a0c-41eb-17ff-08d93fceabfa
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861AA52472521AA7BF01605B31C9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	75l1cdbE9/cEvCOqscDyO4KjTxuiEjsldagQB59Aso+wa0b1vb4v+ozHzjHQfY9MAUP7SPJMWQkrs0P8s04E/xL0gndrfzaGMgSB97JmrXL98ao2L7sGZXZFxzMJkZ6agsPLEonCcZNALOUCm5RirmjNVBZRj56GWAlWpsmMC/X3W7xTvi20wuIjqM2R4YtSif+w3VfpD02c9g7Pz8kW3g7HRN7q5r6fVjUzYnmvGDQNSpkYukRzmdi0dDWsD3aNns5K/PPvgT9yo0Mb3Eb1LIZeRh/vW/SeCgksWbJa7XMsMgU3bGQdumtmynZHG/jEsXkytqlockFIA/VeuM6GdWJoXDJxlG8/22AwA95lkDI4bRS1zjy8/NL8StaJw3hqKC+KSRc8TS10235eXlUbRpwsXEopYAt0JR6xxTcHwKGl5zQ3fulgU/KZCHws4Q7wcZ29BnQvK3+XxRN2+7u6DXOE7tgQbWBnx7yQlz6DotwDHPDCG5vZcmw96or02JC7K1Gdc3166/Sthcl8tgHVyR65l/yyfrxGLrGIYBm3bfhJyL5nQUPiX7ddzm6Jvxb3mZ/Bniov3lsPP9xBJWxzZ/+ioXSOk3Wu87nY2SNIPr3ND+xVqbk2IOPK4izV5bu+OU+uxMPe2MMFZAblHjVWIlIg4TdDivVL0nZ/5stpw2XIUnknpvWFqBU7kHKnDG1n7wSzF1TA1yNOQDjW2RquJ1E+gPf2NuAH1L4uMLppueg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(136003)(346002)(396003)(66556008)(66476007)(86362001)(66946007)(5660300002)(16526019)(31696002)(31686004)(38100700002)(26005)(53546011)(36756003)(186003)(2616005)(83380400001)(54906003)(478600001)(6486002)(316002)(16576012)(956004)(4326008)(6916009)(2906002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG5YanFRS2FvbkorcTBKQ1liM1B1d0ZwUjlVR01oVGQ0SjdiR3lRYzQzaVJL?=
 =?utf-8?B?YlFmbjlLU01VNllmN25ZZHVDSXpkbDB1M2F0SDRWN2U2dHduOXZiRGkxOEdD?=
 =?utf-8?B?ZVVVNkgzRnU4MXRsa3B3eEd6cEZlQmNoU0NPTldtZlY1U3p6eTM0ZThSNTBo?=
 =?utf-8?B?bDROcERHUFM2Zkxxdk4xNSt2cENucEI4UmU2K1V5dXFTMUVYTjhzSkdNdDFB?=
 =?utf-8?B?T0twUUs5SythZlcyWXU3Q0hyRU1RWG1adG5WaHQ4Y0MwNWlJUDVzZW1ZM2kr?=
 =?utf-8?B?QVZpbjFHU3lBdkNJOGR2ZDM0OTdvVC9XZE1LZFJ2T1hPaWh1Rkg1Um5JQ0lQ?=
 =?utf-8?B?N2ZpcFUvZDV3clBiSDVuL0YzdW52Z2s5ZXJvRS96NTdXcnVlOHhwUk5DSVNs?=
 =?utf-8?B?YU1VWnowdDlPNGxaQnlIdmVvdjYwTzRrNzRpWWdqVGFraUUrODY4b1lkbDY3?=
 =?utf-8?B?Yms1Z0g3K2VKemRDSGp0dm8rdXM4T2NtVnZtUVVlY0lnRmszZG90ejgvYW14?=
 =?utf-8?B?SVdCdElkTnFJVk1lN3A1VWMrVFRRZmdTR1FzaTNpbzYrRHFPRTc1a2NVdEl6?=
 =?utf-8?B?ZHVEZ1FYRHBhbUUyOGV0QXNxZ0dRRXRuemc1SlNIdWplSnIzVVJqb0FSeTNE?=
 =?utf-8?B?c3dJTXpPQWc0d2pSdmpETDlWeTQ2V3dTOTBNZjFadXJyR3Niai9NZjFGUFJs?=
 =?utf-8?B?SDJJRk9zNEpvODM5M2dkVDhFQUdsYnlZV1F3MEQ0cm8wTXdzSEdOdjd1VXFa?=
 =?utf-8?B?QlR4Ync2VEhGS1htelVoWk1UU3RhLy9uRmxNWXhBTWpNUkoyY0ZIazYvdzFT?=
 =?utf-8?B?c01VVzU2V29sQkxKQm4wRFdIRXBJc1JLTmdueWcvclZ5ZlQ1SVo4anJ2UDVw?=
 =?utf-8?B?TGpzdlNEN0tSU2l3M2JockNQeGVYYU45dVZDSm8xN0ZGd1Jkck5jbXRhc0Zw?=
 =?utf-8?B?aHpENUlQZDhDSXp6ZTIvYm14OTIrYjlnWngrTHFXMm5zaC96cWVyQ2NmYi9E?=
 =?utf-8?B?YXJLMzVPK0ErVzlQcExQZTUwdlMxeU5MbC9QcHMvYVFwOWtsQ2xIVkpxeUhG?=
 =?utf-8?B?Y2VkZS9JcWI3T3pibVBzYlh0WklENUlpVDFzR3hlVXI0d3BtcExwdDdzRnc1?=
 =?utf-8?B?ZkJGNFArdk00a2cvT3hIanFnTDJTRUtYSlZSNmFDY3Y2ZzRtTkJvb09zOTdv?=
 =?utf-8?B?a1dOYlI0L0s5MWVWN3Q1OHN4cGdVY1FWdzVPSFpjQXl5WGdhNVdNaHN6MlU0?=
 =?utf-8?B?ME8xamQ4K2RNaFlOakxqZDRXejNSME1zbVRZYjZTcWZHUU1OUVp1MUlTazBT?=
 =?utf-8?B?RzlpZTk2M2cxY2RLMHQwRk1HMFdHc1dTUVNmL3ZHdmk0MlQ0b0VMYzI2d1Yr?=
 =?utf-8?B?YjdHVzNIV0RhUnRRMVpab0NoZHhTZ3NjcjNFMGJUeEorMHBKSkhSTVk2NE9Q?=
 =?utf-8?B?a21paDlQdkdLdWZLckEzbGUxWXJJL2ZaNms3aHpsWkQxVVZ6d1ZuMDViZ1g4?=
 =?utf-8?B?YXBHcGZWb2FOMDNNdlA0NGxzcWNJT1dRWlhZYnUyc1dOaFBYY1hDMXZQb1hi?=
 =?utf-8?B?M3JsVS9vaE5Idm8zM3JDODZZMytOdm5NUVVEZ1NBTmhjMjZQUVh0cFVDVmll?=
 =?utf-8?B?TTU5a3huZmFaZk5hYzhWQ3d5b1pPMlRVeEc0Z1d0bzJxRmFuZHZtZTExVFVR?=
 =?utf-8?B?YnF0TVZuTHA4c0JJRE1temNMVzBJKzh0TmtxZE9ON0ZhWHRyZDB0R1VRMW5t?=
 =?utf-8?Q?aauu3ecT+FoKvezliWrhULgmdiFEuMXf3p+n10c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03275861-1a0c-41eb-17ff-08d93fceabfa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:05:13.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHq9p9XsoVviW2++UpIR/Np/BJXyNxp6RwuNi/UWPiSk5riP4Wro6skDr0LmWZS6beL34GyrHLj34gt8FYD8nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 05.07.2021 18:03, Jan Beulich wrote:
> The primary goal of this series is to leave p2m.c with, as its leading
> comment suggests, just code for "physical-to-machine mappings for
> automatically-translated domains". This requires splitting a few
> functions, with their non-HVM parts moved elsewhere.

Forgot to spell out that this goes on top of "[PATCH 0/2] x86/mem-sharing:
a fix and some cleanup".

Jan

> 01: x86/P2M: rename p2m_remove_page()
> 02: x86/P2M: introduce p2m_{add,remove}_page()
> 03: x86/P2M: drop a few CONFIG_HVM
> 04: x86/P2M: move map_domain_gfn() (again)
> 05: x86/mm: move guest_physmap_{add,remove}_page()
> 06: x86/mm: split set_identity_p2m_entry() into PV and HVM parts
> 07: x86/P2M: p2m_{alloc,free}_ptp() and p2m_alloc_table() are HVM-only
> 08: x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
> 09: x86/P2M: split out init/teardown functions
> 10: x86/P2M: p2m_get_page_from_gfn() is HVM-only
> 11: x86/P2M: derive a HVM-only variant from __get_gfn_type_access()
> 12: x86/p2m: re-arrange {,__}put_gfn()
> 13: shr_pages field is MEM_SHARING-only
> 14: paged_pages field is MEM_PAGING-only
> 15: x86/P2M: p2m.c is HVM-only
> 16: x86/P2M: the majority for struct p2m_domain's fields are HVM-only
> 
> Jan
> 
> 


