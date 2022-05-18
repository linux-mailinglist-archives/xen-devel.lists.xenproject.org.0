Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C552BB3D
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 14:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332081.555717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJ8b-0006g3-Js; Wed, 18 May 2022 12:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332081.555717; Wed, 18 May 2022 12:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJ8b-0006eF-Gq; Wed, 18 May 2022 12:50:49 +0000
Received: by outflank-mailman (input) for mailman id 332081;
 Wed, 18 May 2022 12:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrJ8a-0006e9-5z
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 12:50:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22964def-d6a9-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 14:50:46 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-7jHIjs0mOpmpv1gRDrWnaQ-1; Wed, 18 May 2022 14:50:44 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5586.eurprd04.prod.outlook.com (2603:10a6:208:130::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 12:50:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 12:50:40 +0000
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
X-Inumbo-ID: 22964def-d6a9-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652878245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic6/eTvCTW/0g/PAsNimNgU6P/eHxUeDUpX/a4wa9MQ=;
	b=Qrr3m3M184+iSYLRDXGNOtNwR75PWKRAOFJYD2M6+TMa8EvXP8saP8ZhA4fsCD19zKGhUt
	s6AljP7ewcTJNnrkjGDNByUx3fgnIDyQu38gkvI9hjqg+ikOC30YFKfgRtBivrZVopu73z
	asaE+0fOGBDg658WJ734w9XY2iQUpus=
X-MC-Unique: 7jHIjs0mOpmpv1gRDrWnaQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfE+XKqoce/4hU0AFtvpGPdqyDenEqlMP23tERllAb8btlxuGjS0ns+low1p20sh6q2tDVWhsV68EDqvOly5bvoinplLd6YItWl8LG4hJJGGgNDM9gI4psIJ44dyb0Uio1GhNlmMDP7ZKN210C3J8jm1owM/OgAGVJNJBf3+UIPQzeSbrDnlEdTqLvJUgkXqlVXKlbT6ZfXNP38g6P87LWdbAyVT3DxIEmshVcVdcx7gQKVPvigZVQ8GjNQvizrMiYVl6Y9tqR8YSGQcCN9KYS1VXea7pCvgtAXcfvq3SBNXUJGoq4ItxmNhAXeo4Ye/QbJ1WOL4H4muDmqGhwdVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ic6/eTvCTW/0g/PAsNimNgU6P/eHxUeDUpX/a4wa9MQ=;
 b=fonSPmuXWTsAyc2US3HBKihup8rKqWSaeEZ46W6ptAHRdhieXCDGXagRCSvePwjYkzROXo8A0rbL5Rmed4BJlq102JT+azRkNjNmy7SGTey7SBh/9tQsZdxfmzjyYgsyx1I979oVfzzSaTpyZADfYrW2kInS7J4vfkzcres6DbPZ5yJZ/TQzGeAouuUtnks0biM+euWB3x9ETguZhzCiXJtZW+I79DljLC74PknvS7qZnRczdTVFEfSMBAfxb8tLJZJC8aLaXMPMvTeFhC309lRycj3/NgPfN0F/MSPO26rijwCzsu9kZNRChtw3qfxMne0C8AeBz0BE/hwXxIEk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0d5c0bc-cd22-d380-aff1-d54f35764859@suse.com>
Date: Wed, 18 May 2022 14:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 00/21] IOMMU: superpage support when not sharing
 pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26242a17-d2e5-4cdd-1a72-08da38cd037f
X-MS-TrafficTypeDiagnostic: AM0PR04MB5586:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB55869CF0EF445CE68F06BB75B3D19@AM0PR04MB5586.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dM+SqGMFyGNJ/o6VS112Egsonvu3Jtvzq2bR5cLQu7B/eAjMR545vzJzXY3ofvt5GPKMTJ+vUrv0WbduIN1C5cyi/0RV8ll6r67VOfSCMDmES8tXml7XM5vkXlz2DX7J/ju0I2Atq+57lvh1tVSK9KMr5utoOEXoOQxOXdNkDsBkltdG+GbboP06K8eo+XRiqmET0/PIiOayvARyKQYy+YcIz+KDmPg+snJ/hyDyi29y69Ua49JrM0o7+bgZcEVyj5S+W3ow3gbWOtghlpvxKhZ5lNw0UvZ40nW8WTMBw/GLuJ5Q+VlUS1NOaUXrKjH5Or+ViFMwzlK7wfyqNaeiioDHdiq5s6aE9KHHw7ypZ08asVmHD5QwEWVnCHrIerFtQ+2lOgpcEhFOA33YXkFvw2gfWZHcSFhd0VvTkqfxMX9CBYjA9qACDxjY9LRmGwLHIvM4O25dymJITvKacITY5hi8h/5Bi7wLkR2OiHklfe/aD4Lpb7kHtIyfe4COK3h582L83aiSd3xJ4+dR2zLdHmaN67aEeutPmXk1kwqBA6J0PsyE/AHikI8rEy4qDb5lEH0WUf57yjTtE8fvAb+UR5VKSUDPTdbxM0EUlLlGaYIH7nj1KZIYYwUaVhSM1hDwXNQ3InpIUVDQaED4qTSNmDF7Ca7rdMUom2Q2bLlJPSPDPUNpONL0gNKFfGW+AGS2MAyi6k37gds9uXftYmbtTMHr2hmkiV6irGJNCdMywhyZvgH1fQ4Yens3ygqUCb7XruT4aW0XH5MOPea+5+iudOUik+bbnglRCXinwY/beM7aZsjRVN8NErJbWc3BfFLvznl1t2ZfNKRi0CbkL+pK4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(83380400001)(5660300002)(316002)(4326008)(54906003)(6916009)(66946007)(66556008)(66476007)(31696002)(31686004)(8676002)(36756003)(6486002)(966005)(508600001)(8936002)(6512007)(2906002)(186003)(26005)(53546011)(6506007)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXhqeGVDNXVNeklTaHUrZkVPV0lEbmJkMnUzMVdWRXcxTUNFa1hJTVU4dVB5?=
 =?utf-8?B?T29OM3ZNakxxZG1tanN5MDI1eVdnYkhybEM1WTAyUHhubVo4SFY2aXBzT0ZK?=
 =?utf-8?B?ekpROWRvWFltK1dWYkMxUEhVQlkvTllQTE43U3F2eXUwalkxMURwby9pMUE5?=
 =?utf-8?B?UTNlRm04RndFcHoyOHlFSzFVbURQZ0xJR3JBdSt4b1kzNUZPeE4rZnJRQ0NV?=
 =?utf-8?B?cEtYUnRyUGI4K2ViYnphK1RHN2FjYWRjQldxVlJwUEhJZFcybkkrbmhVVEV0?=
 =?utf-8?B?VDZsd2kxOS90ZXMzckRjdTNOSTR5U2lRQW5JU091K0JnUDFERWg1NlM4OHFU?=
 =?utf-8?B?V2J1U3ZKaEZvM21tQ2FBRVhZeDFpRWNnWDNUMU85dUFZY0Q0KzJjOC9vY0Fv?=
 =?utf-8?B?VWI2OUhBTmlPUFpQU1pVMzZsSG5JaUozNzlrY2E2VVprN1JOU05hT3A4SmUz?=
 =?utf-8?B?K25uYnB2YSsxRWRqVkY2RHNOMXZjSmQ0RnNkem02WktNUVVZaHkyTVRVc2dK?=
 =?utf-8?B?aFhRcGFqVjNHY2FzbzlkUnNkbzAyZlBvNEJrdHR6bmg5SkZKRHQyT2pFd3Rx?=
 =?utf-8?B?RnFUZEhEUnFiRnpUMCtLa2pCcHdlTEZ2eHZPTTkxVHVBSG0ya3pKd0NHUkw1?=
 =?utf-8?B?YkZrUWlQOEpHMXpmMVFhMVhKUVJDUU15TGc1UXduSVNtVjhVUTloMGMyNUxh?=
 =?utf-8?B?c2xwaGlWdStNak1DQVJTUjdSc3k4V1FPVnBiWWJPK1QrNG4xbXdySUVISVZi?=
 =?utf-8?B?UVFQVVdkcW9yRFZKNXhoUzJSNTF4aUNTMFU1RVRrN1VKcWFOZ3g5K1hIMWxH?=
 =?utf-8?B?bzl6aFk3NkJCbXNyRFFINldCOHdKcUlUYXhvdlVpZW9yQ2I5ZG1zdnUyZEl6?=
 =?utf-8?B?Y3p1NldtU0hZZVVaMTBsYW5OeFpxRnkwY01GNlI0SjQ4VGZCUDF0ZTQvbnly?=
 =?utf-8?B?MWdXNWFDSndGTTEzejFwUVY0czl1Tkl3VStnVVVqNWQvYnA5RmNGUVpCTlo2?=
 =?utf-8?B?WXZYejkxTitRNkp5N21RWVAvdldleU1DV3RpbnM3aHRzZ0wwT0ZoZFBmRjFn?=
 =?utf-8?B?WkZrTWw3SVk0T1I0MEQ4N3ZOTnVMUmNpL3Q3S0picEhyMG4yY1ZxUXhBbExE?=
 =?utf-8?B?MWpnMzN6ZWJubnppMjgxRGV2ZUZOR3RaWVFHL2wxUkU3M0Z4OCtYdUNwWFJs?=
 =?utf-8?B?MGRIZmpZT1MzOFk5Q2o0bGw0OXpMR3J0S1dENDJYSzJDQVU2K2dXUEpWTUlv?=
 =?utf-8?B?TnRDVkNYcHNySGx3eHhxbEUvWDdFeHoxMWVZM0YwK2tsMXVFMWgwaEhrckpv?=
 =?utf-8?B?ektrWTdkNHpJRXpnSWR2ZXF3SHNrV2FXVHUwRW5YMU1nRHU2RXBYTHpiMGVy?=
 =?utf-8?B?cTU2blVZSDdjMzNRWVlUY0I3K1ZwSGRLZnpYM3Z2MS9ZQWpKL01DYVhvNXJK?=
 =?utf-8?B?cU5hakc0STJQU2NZUGRFQVNiRFIyZlB1THVKWTRYaWlLK3QvMFp3SkMreFkz?=
 =?utf-8?B?M1pLOUt2THVYc1lpNzZkSzZHeW9WT0hlbkYyQzl0UnkxTnIxVWZrNjlVeTd2?=
 =?utf-8?B?OWVYSnFlNWNqbnF1Y1gyTUZaaGJjaE5MQktmRGo0U0FFT0JWUGF5WFFzaVlU?=
 =?utf-8?B?VldDVDlwdkNpYU9Rb2FWZnluTGc4d0lkQVlIOVRkZWFKNlZUVjFsRStkeWRv?=
 =?utf-8?B?VnNGbTJTdW52ZlBmQXFUYVAwTTBhc1BWWmpUUktXOWxkRVQxUytJZ1ZaeXBl?=
 =?utf-8?B?VHRaRWVUSzVUdVl5VUsvSmVnbVdTWlRhazR1T0hKcnpRMVRHRi92YVludVpt?=
 =?utf-8?B?SndXWjlsVHNiTU1wUVloYkZ4MkZoMXNFaVdXSzIxQ0dJTWppTWZqajZTV0J0?=
 =?utf-8?B?Mm9vZ05vZTNxcnZNWGF5a0hvTFZNdXVQNVc2dUluekpzdEkzdmxiR3NwR1dK?=
 =?utf-8?B?Rm1uR1Zxcm9ZUFlhemFtSHN2Wll1OVpLSWl5ZXp6THhFOXFYSjluQVlFUjlG?=
 =?utf-8?B?WW1ESHF1YU0yc3VMTGhkTTRqNnNsMCtsYkg0NUZzR2hNaUhheWErYTVXOEQ1?=
 =?utf-8?B?eFpvTXBJdHFHVldTN0ZiaXNmTWJXcDZ1Vk9vaW1HVldPNlpDMG5IMVBCSkxE?=
 =?utf-8?B?cC9hek5PbG5EWjBKcmdjRDVhNzk2ME80ckdhbkpKMVkwaUlaSXNwNVdpc2cr?=
 =?utf-8?B?aHpJR0RpODZLWmx4MmtiVG1Eb0M4Z0pZb0k4eG8rVmEvMURKaDZRMWZvY2JX?=
 =?utf-8?B?bTZ6R01jVS9zMFFpbUFTVVA1SXlHZXo2N2dXeXdadmd6cUhpbEtscm9oZmpD?=
 =?utf-8?B?NFN0eHgwd1M2TUxjcDNLS0t3UFZub2hUSlllc1g5NUdJWDV1YlRFUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26242a17-d2e5-4cdd-1a72-08da38cd037f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 12:50:40.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yd67aHjrzlcYtVWC5Dlwjcz0KfNDownACAdidfz0kAqe0XN+Yy5I+y2DoXkLlNoY0YnGpEh2wokR6jaj4Poi3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5586

On 25.04.2022 10:29, Jan Beulich wrote:
> For a long time we've been rather inefficient with IOMMU page table
> management when not sharing page tables, i.e. in particular for PV (and
> further specifically also for PV Dom0) and AMD (where nowadays we never
> share page tables). While up to about 2.5 years ago AMD code had logic
> to un-shatter page mappings, that logic was ripped out for being buggy
> (XSA-275 plus follow-on).
> 
> This series enables use of large pages in AMD and Intel (VT-d) code;
> Arm is presently not in need of any enabling as pagetables are always
> shared there. It also augments PV Dom0 creation with suitable explicit
> IOMMU mapping calls to facilitate use of large pages there. Depending
> on the amount of memory handed to Dom0 this improves booting time
> (latency until Dom0 actually starts) quite a bit; subsequent shattering
> of some of the large pages may of course consume some of the saved time.
> 
> Known fallout has been spelled out here:
> https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html
> 
> There's a dependency on 'PCI: replace "secondary" flavors of
> PCI_{DEVFN,BDF,SBDF}()', in particular by patch 8. Its prereq patch
> still lacks an Arm ack, so it couldn't go in yet.
> 
> I'm inclined to say "of course" there are also a few seemingly unrelated
> changes included here, which I just came to consider necessary or at
> least desirable (in part for having been in need of adjustment for a
> long time) along the way. Some of these changes are likely independent
> of the bulk of the work here, and hence may be fine to go in ahead of
> earlier patches.
> 
> See individual patches for details on the v4 changes.
> 
> 01: AMD/IOMMU: correct potentially-UB shifts
> 02: IOMMU: simplify unmap-on-error in iommu_map()
> 03: IOMMU: add order parameter to ->{,un}map_page() hooks
> 04: IOMMU: have iommu_{,un}map() split requests into largest possible chunks

These first 4 patches are in principle ready to go in. If only there
wasn't (sadly once again) the unclear state with comments on the
first 2 that you had given on Apr 27. I did reply verbally, and hence
I'm intending to commit these 4 by the end of the week - on the
assumption that no response to my replies means I've sufficiently
addressed the concerns - unless I hear back otherwise.

Thanks for you understanding, Jan


