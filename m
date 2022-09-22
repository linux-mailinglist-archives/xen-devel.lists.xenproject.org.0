Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B55E6B2E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 20:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410437.653420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obRAp-0008SA-UV; Thu, 22 Sep 2022 18:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410437.653420; Thu, 22 Sep 2022 18:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obRAp-0008QD-Ro; Thu, 22 Sep 2022 18:43:47 +0000
Received: by outflank-mailman (input) for mailman id 410437;
 Thu, 22 Sep 2022 18:43:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1obRAo-0008Q6-J5
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 18:43:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c80a05b-3aa6-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 20:43:44 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7106.eurprd04.prod.outlook.com (2603:10a6:208:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Thu, 22 Sep
 2022 18:43:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Thu, 22 Sep 2022
 18:43:42 +0000
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
X-Inumbo-ID: 7c80a05b-3aa6-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsDb2jZArLOM3KzVZNnl4lX2/pVmOJg+3WR1R2TVZsT1rZp8mpkDe0y2g2CYUlMLfNYau4jy/oqIfslWkOKo+XZgxIbU//ImSYnNE71H2ka/g5HDHwEdlWYX+gJX8WD01JR5a+BRtpU4OcM5TJSb2ElFfMkfTE0c7riuw7GB8qrE6ftAFtPl1I04+0PCZcLqjS1Q/rnZMq8AF1m6p7zyDZ9JALoYNiNtYCFvXq+mbLjmp65bNaU2fsMUpUumAPlKcUxqWLWAtQiLYsVIvLJK0T/+a6Crql2Ry0VzdjzSM8M82gohgLMEmOSdn9d5D+KkfJhcGevfl3rbjTUi/9TSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AC7OTum4+IlzTQHZ8yDfylRjVI1NYmALQgd1LJyReo=;
 b=WkAzDxwYzz/wEKvUCg3WM2qKfP13xv99ANDH6xzGXustTULB2vCSRaYFtLA1A506fupPEPrVUgnqXrbJZr4CLCgdZgoH6Lpg9rW3k36k/LcPQdC9P7tNp0n/pK1G7xSxi7ospoR4Uh/rU2RJVoY0axNHtezmXQt0cmsrwQcwfCmvepVUttt38kqItgSWbzsRa2LbpFqIcOGyji3FJHOg/FpNcN23bQmfOPULoyclCJ+vkjFdF4THQtZSb35DoqGrgsefJjFgRpqU/rGVIp4erp4P9s1CUG1TYEUUNuDmcyVoM63VMpE8x9fl83tBxocMnzLzZoEPy62TnXQsxCAGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AC7OTum4+IlzTQHZ8yDfylRjVI1NYmALQgd1LJyReo=;
 b=opkZF9Ksde+XpJnkyq8CV0IGIeO0FBtUhGAgV/D/EwdrvotznERHl/zTm6zJeIa4QzJPKfn8aNxmBXTxMlOU9wM9pn7O2bBkrHKWwMYs44bx6Fg3P7/xk8jbcR7pYksAivLWkfVxM6ZbORnd3vJ5be/u+RBnsAHTB75eyHYsgY4bZwWnLNOr5Wis9RtVk5A6cctaRrR55rLnuCgeUI+EgFrbYUZBWTUWqRu7bwbZ+xBKomBJJH99R7e4E2sFc+Np1UvOSoELyDNLK+C6CVejL1zNSc6MpK7qSRxnES+citfEWF5Zkih9EKCKtZx5sSx5k1aWTdg673bPPqUUdtzjDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
Date: Thu, 22 Sep 2022 20:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Design session "grant v3"
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <YyxmQf+q0BqsX8Nb@mail-itl>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyxmQf+q0BqsX8Nb@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0111.eurprd07.prod.outlook.com
 (2603:10a6:207:7::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: d9193c85-1efc-4cc8-6f12-08da9cca5f6f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XLyQi+C+VDNn2sFt1DhLS+b3NAIFMVol5GcptQXYTsj9YiMPYC1CX6+lRn3FGoN1dJyM9rwcTrZdfHPcWqk3PvUdAWMVlUflCRzxgt9dVj3V+4DtSydln6yLslaDVCj5n2XzLP/BFVadcEJ33/HxL9qLzvwgXpoKYDR1hhUVJOOPaFV34+iHWj7ysmRZ73/wiqabaiw8/6saPUBRqbMO+LYlNYV9JGXecjcSzEiS2yf3FZaCXOPErT6o0FgsnqjjwYsTygBL2g0jurBQ/8sd/klHsZe+ixxVHZMIBoNnXr8/MUdqPHC93RechUdg6k/C/3TUxgqiQLR5eTWmQWkO0+ywlIviChaiPl1XslBXSXZUbKizjnGpqWQPVKjZegli+JrfNGK50Z5K2g9h1q0G6nghOVT/bZxtwke+NrgiThu3FQPh82KFTezgfhxAppLE5I7Fcg7RHEOEtBMcs0CPv2NJcvMz5EeR5BKjwFICeb4YbMAXtYZFQrLEMXNvuy4kaZJYsgv9aYVj508P2JvX7RBSMsAjto5YbUtRftygVCjTXUO0uG5ygR0v6u0KRsYDK6fFOgdiGwbFy3SoriCIlkttmBls+9VhFwjY9c+4HFsPxRpZaH73ftWzv3qt+EU2mbIPr0Uqn7z2eE2BfVO7VP6uAw1IQz3GWSDCwCvfLoRiJMWGMm3gZ6zQMY4V6NgHWKeMhIYFCijtI6OkkwIcO4PVZ0ZL9d2q2X1vhKO3AwaHm6UWBMgUtt0w3LGg1YKepvtIhnGOQxQ9kBoscp+Dej0VOX9o9ACocJNGZ+K+oWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199015)(478600001)(41300700001)(36756003)(6486002)(31696002)(4326008)(316002)(5660300002)(6862004)(66946007)(8936002)(6636002)(37006003)(66556008)(66476007)(8676002)(54906003)(38100700002)(26005)(6512007)(186003)(2616005)(53546011)(6506007)(83380400001)(66574015)(2906002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGM4bnRUQlYyckNnQVduYklXK0wwS3FaakJtbU9Oc3kzVFJhYldGYmNFZVRB?=
 =?utf-8?B?dU1ZeTFTSjZab0xUbVNNbmduSFVjL0dhbWZYNkZvbGtGNVNVNFE2b095YmNm?=
 =?utf-8?B?cWZRVDdPNU54UmNlY0t5RkdLYko4RlNud1BJOUk0NWU1SytjK21WOU85MW1p?=
 =?utf-8?B?KzhLWkhYZzYzQ1YxTlYwOENvYmFBQ1VyWXlhR0k4SmljRjBRRHJSN2N5MjQw?=
 =?utf-8?B?MHkzYWlPdmk3YmFZaE9SZlpQeTk4YlhYYlZkVlBvUlp6V0dOOFIydmxGUi9h?=
 =?utf-8?B?ZnNWRzFCZURJVEJ6MHF4TVRHOFdqT0ErL2liSlBMVGNmRXprY2NVYk13d0Uy?=
 =?utf-8?B?TGI4NzFoNGJmTTNJQjZPakI1V1ZpZ0xNdVNzSWlOMGR0U0NTUFNmb09TNHFI?=
 =?utf-8?B?T0RIcXFHaEhMeGl0bjlPc0kzaHg0eXJaSkJYcW9QR1ZxMmxrYWUyN2cvaEhh?=
 =?utf-8?B?WGhncjJRdVNkTzZ0KzdkQTBmbVdEVzBWSVQ1TmVaNm1IVmsrTmZRdGlXbFU1?=
 =?utf-8?B?KzkrcjZYL2ptenRmZ3owZ3B0VjI1c01kNnUzV2lmMVpmM29La2I5RVZMdExk?=
 =?utf-8?B?RWM0Sm1SODNXTWloZDRVMEV0S21sWWd6Z1MwRWFWOWVVNGVvWm1SV3VqOFl5?=
 =?utf-8?B?Qkg2eWJFR3ZPWkFoaEk1WkxCa0pqcGFGZXdlNTlOZWgzeWJUR1RDS3Iwb2Uy?=
 =?utf-8?B?T1puektjMWxoYWMvL1NMY1gvUEVKSm1QcmtWaCttOTY4YktBQVA1ZVc5d1VO?=
 =?utf-8?B?WHR3cVExYzdXdlZDL044b2pIWXRTSGdhWUphYTUzK3VFTlNSbnRGbVoyRjRX?=
 =?utf-8?B?QndSUXpsbzM5ckx6ekZwakR3VFNZM2tNRU1ucG1PdmhGbFdNWDNRQTZsT2l2?=
 =?utf-8?B?OHZtNml0NWE1dG1LMk1sZ3BkNWREQ0lBdHZ5OTREOUJaV2NFM1BPVldNcHMr?=
 =?utf-8?B?NnpmOG85aTgrK3U1WWNPc1VCWE5oNmtSRXNJMThXMmx6OXlzRTR0WDZiSGlL?=
 =?utf-8?B?UXppR1M1dkVsUGFwcHdtOW1Mbmh5RFdybmtEcUZQMUNOYzZhc2RGT1BYcG5j?=
 =?utf-8?B?cVEwT1pTaVZueUZsRFk4Nm4xVjNhcmxCMXRWVGphRm9nTGcxbWYyVnYyUFhl?=
 =?utf-8?B?dzZRZmxvNUw3SHRrOTlxbUZCTmpLSUJnLzdSK1VQSm04ckxVMktpNXVwOUV0?=
 =?utf-8?B?RFNwTDkzS0VnQlkzMHVndUlrQ3greStGMlY0c1c3VzlNZ0p3NnBrYWJWWDBp?=
 =?utf-8?B?VzlIT0JObFRSVG5CcXFXUkJreGRXYUVva2NnUjBodzg0U004K3lNT1NPUUxQ?=
 =?utf-8?B?d25HSkpSOXNLU2wzQVlNKzV6Qng3SDJ3VHNQbDZjT2lzOVA5YldtL2dYYldm?=
 =?utf-8?B?NG4rbXE5b2ZjRDM1OC94ZmpjaEdrTFh0aWxtRGdQNUNWWDhBdGdmQUlVQ0hr?=
 =?utf-8?B?VVdQOW9rMVdGcG13ZVpCTkxBQmxrdHpDV0ZSZHpUQk5FTzEwS3BzQjlMMkhT?=
 =?utf-8?B?bm5GVUVGQVhsWTJOaWRMTVNrdmpSaEhjbU5KTWtJZklBcVpFTnlRNGZiSnRp?=
 =?utf-8?B?RUFtYnVFMEVaQ0pyTmN5YklrakxmYkZLTmJLS2FKajAzOEYrczdpWTZmK2xM?=
 =?utf-8?B?L2xiZ3dkbWdQcTlUaXdKWG9rRzhjekZjWGp0dktSTUhuN3l4UkFyekQweGx1?=
 =?utf-8?B?VzYreXN5VG5MbHhUbEFwaUNTSFVMcXdFVElNOXJDek5CeS9IMXZpT2VoUHlo?=
 =?utf-8?B?SDhFcERaY0c0LzAzQXdvRUQ1OGFDUC8vS0RlQWZXQjQ2WGlTV0RIYUZTLzB5?=
 =?utf-8?B?QllMeXJmRHFoemV1Q2ZxY2FMNUtaeDFucXVHMDVVay9UVEpiWDFvV3NlVXNE?=
 =?utf-8?B?UkRPNUdYVEN2S2paeXlLTTNyNDZDeG5QUzY2eUI0RVJ6YkQwN2VWSTNPZWIw?=
 =?utf-8?B?Zi9vK2lUdGM1VVROdnM3OVB0aXpjZEVCdFpHRGl2L0xMWjI0Z25ZdkVCZ0Vy?=
 =?utf-8?B?cU8wbHcrVENBUGJ5N1cxNkZIbUt4Q2NCb0JDdzNyZ0pQZ1hzVFNqNXVFelRt?=
 =?utf-8?B?dEorVWJhb0RYYjBMaXlHV2hSeFdpeGtBZ1VaL2hGZUp3V2c3Wnd5ZUp6bzI2?=
 =?utf-8?Q?k1FZMtkIZcurTOn22lbNpMBfM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9193c85-1efc-4cc8-6f12-08da9cca5f6f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 18:43:42.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy5CmuIP2mNI0+xFVGUMPe9oleMTrdLLgIEGBOPp7AiqcAZsIwCAN5cD02fYys5fD9l9G0pr1XD4Lnfr/DVqNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106

On 22.09.2022 15:42, Marek Marczykowski-Górecki wrote:
> Jürgen: today two grants formats, v1 supports only up to 16TB addresses
>         v2 solves 16TB issue, introduces several more features^Wbugs
>         v2 is 16 bytes per entry, v1 is 8 bytes per entry, v2 more complicated interface to the hypervisor
>         virtio could use per-device grant table, currently virtio iommu device, slow interface
>         v3 could be a grants tree (like iommu page tables), not flat array, separate trees for each grantee
>         could support sharing large pages too
>         easier to have more grants, continuous grant numbers etc
>         two options to distingush trees (from HV PoV):
>         - sharing guest ensure distinct grant ids between (multiple) trees
>         - hv tells guest index under tree got registered
>         v3 can be addition to v1/v2, old used for simpler cases where tree is an overkill
>         hypervisor needs extra memory to keep refcounts - resource allocation discussion

How would refcounts be different from today? Perhaps I don't have a clear
enough picture yet how you envision the tree-like structure(s) to be used.

>         hv could have TLB to speedup mapping
>         issue with v1/v2 - granter cannot revoke pages from uncooperating backend
>         tree could have special page for revoking grants (redirect to that page)
>         special domids, local to the guest, toolstack restaring backend could request to keep the same virtual domid
> Marek:  that requires stateless (or recoverable) protocol, reusing domid currently causes issues
> Andrei: how revoking could work
> Jürgen: there needs to be hypercall, replacing and invalidating mapping (scan page tables?), possibly adjusting IOMMU etc; may fail, problematic for PV

Why would this be problematic for PV only? In principle any
number of mappings of a grant are possible also for PVH/HVM. So
all of them would need finding and replacing. Because of the
multiple mappings, the M2P is of no use here.

While thinking about this I started wondering in how far things
are actually working correctly right now for backends in PVH/HVM:
Any mapping of a grant is handed to p2m_add_page(), which insists
on there being exactly one mapping of any particular MFN, unless
the page is a foreign one. But how does that allow a domain to
map its own grants, e.g. when block-attaching a device locally in
Dom0? Afaict the grant-map would succeed, but the page would be
unmapped from its original GFN.

> Yann:   can backend refuse revoking?
> Jürgen: it shouldn't be this way, but revoke could be controlled by feature flag; revoke could pass scratch page per revoke call (more flexible control)

A single scratch page comes with the risk of data corruption, as all
I/O would be directed there. A sink page (for memory writes) would
likely be okay, but device writes (memory reads) can't be done from
a surrogate page.

> Marek:  what about unmap notification?
> Jürgen: revoke could even be async; ring page for unmap notifications
> 
> Marek:  downgrading mappings (rw -> ro)
> Jürgen: must be careful, to not allow crashing backend
> 
> Jürgen: we should consider interface to mapping large pages ("map this area as a large page if backend shared it as large page")

s/backend/frontend/ I guess?

> Edwin:  what happens when shattering that large page?
> Jürgen: on live migration pages are rebuilt anyway, can reconstruct large pages

If only we did already rebuild large pages ...

Jan

