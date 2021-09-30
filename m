Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A741DA5D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199925.354267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvcZ-0001Yz-Uw; Thu, 30 Sep 2021 12:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199925.354267; Thu, 30 Sep 2021 12:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvcZ-0001VW-RH; Thu, 30 Sep 2021 12:57:07 +0000
Received: by outflank-mailman (input) for mailman id 199925;
 Thu, 30 Sep 2021 12:57:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVvcY-0001VQ-Jx
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:57:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff7a9e87-ad82-486d-b78a-62d26d647916;
 Thu, 30 Sep 2021 12:57:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-VQDCdMeePb2Ef9ThNPZJPw-1; Thu, 30 Sep 2021 14:57:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 12:57:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 12:57:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0345.eurprd06.prod.outlook.com (2603:10a6:20b:466::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 12:57:00 +0000
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
X-Inumbo-ID: ff7a9e87-ad82-486d-b78a-62d26d647916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633006624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxCuf0pT2Zfq6oHeAx77qfUtNUjzCLWnMNKHXtce4V4=;
	b=IWHCmb4u+KxbAIFfyDBPogNld+5f6IepS9s3zxK261Y5M8f2CmVJbc42IAviM0WzjLdkhr
	nH8RRSdo4R89LhMOoLxoghoS8AVRhmQwjvEO55iHNocrY0p/8Eaa+J5FMWSEZTraQ8ETVa
	D0OLbk1qKMSSt1WsYvUJyuzQjYZI/44=
X-MC-Unique: VQDCdMeePb2Ef9ThNPZJPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWHQhGwzj4KoMT06lwzAh5XzsIM9TNlDFbAA8DhaB6un+/NRB/OJN4Dg3vMF/OjWW0pwHJVynlkvaPDyQ1aYELCkbhDxBi6YonIt3a2mvr5YNZl7LBQ2WmTU+cz7XTAHD+FXeQhBS/cIX/P4Im1LBfUF/0P0faOtdYbVthVLZGu0xr/cYWJKHezJ+cU0luCqkS/0Noj77OYF0hP4m/gaEKfTEUjzDXEOvzIx18iN8bUs3ADnTJb3NessQz2H/ceLiCbDvsGbapEcmGYSPO6ihwR51+2Ga1/a6l3s6JTr4wxGvhn2TTdbYHYnOflBoPRZEk/PAeYnOLG59SQLfdqVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IxCuf0pT2Zfq6oHeAx77qfUtNUjzCLWnMNKHXtce4V4=;
 b=epGxvGpR1V4tuog3gXOwbHOzUb23FKjEXXCpvCYrWqiry3yODshrhkSY4hpTkmGEc9Nz5lJI9m16+EBJZa1s4cVnEeQ6g7WYx8s0UcTKa9DhuFSugKyUr57/q1v5Qynbz4Wdd8qK8G9+tpc9jNW0UauVfakwm8dyTJVbvcsTn0tpOpktnsChSVINlbdTmX2AqC/U827p79F9Uv1JUxgRYHvv5mYA7wGLEY/ecZu+d1r86PzyMpQsc+ALENMDWt/8VM5mrRfSYo2sUGykbn4tjJqTNY60bKdSfepyVktvUkZKdcgOyIyvzo04HtBdtWQbdKEMzQibLeAKyTXNfQ1Q+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: Xen 4.16 development update; request for regression bug reports
To: iwj@xenproject.org
Cc: committers@xenproject.org, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <24913.54299.590779.955301@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70fe8be0-e3d6-c88a-bb32-d6289dd27ff3@suse.com>
Date: Thu, 30 Sep 2021 14:56:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24913.54299.590779.955301@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0345.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a87e3247-1e3c-4bb8-5a1f-08d98411cb0b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43494CB79AD7F0CDBF9F4B4BB3AA9@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z9ulkqLGXHjDcDi+lCktnXUg3V/fJRA6tQq+h2NXIvzKbFs//FMEqdJKO24tA8kg4vX5/pZPGlRcl//NCqlXWmJfZMCxr2Iua/EQU5gi1Nt9ASNqJ1kh0MlFzcMtkG4bzRxu8w6tPRDlb9FNMT0Gca5/oujWa3HMdaqFopqXtK6qP3MvYzvMkaGctB58whgMenXUr0UfJbzNc/ivpNTk9lWZLObtBeILNReIDhmbvggtpFDhsnrC2KscJMU4+DKP1ZGgvF7LYH3S8yJnH+VbMXMwZbQvuA1bngAStC9GEeTxYmlMDvXeLEq+9clBY5PGd9h5k47MA6LCx+tJ1ke3+wTN7Dwcs4Ylmpeh+r28inW5PMFZoLPT5QUvBbaIaPBZ8s+WxeVVffmsTwTTn/qzf1T8sqRTQaOakmomQ5QH9JVWS1ld7RJfjDm6arCkuTYAOVJm04zlh9P3L7eoz56jKgEh4ebnx1lfynHzT5inYP/8dHOvFXJYxCbYoum0G29DA1T+7pDKMC0oyXQEe6nOdS1xWLa4eHjYrLNE7YbW+dUG9rzD4oqaow0aOm975yLXBnk6eHrN6QGwNfX+OT/nj/wzwYYTHFAP4uCW1I6psiutnRqr1ng9iJ6RJcnVgko/BJkS+K6nSqo3enZ8MsmAb48RHCsOVbWuppiT1iorrBi7Jy2igFgeWaLILyQtUVvQvtTuKtpD9d+5ZVRTO2Byt+CB8y/+jsKE+pEZIHrLnvE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(4326008)(86362001)(31696002)(6916009)(53546011)(8936002)(31686004)(2616005)(15650500001)(36756003)(54906003)(508600001)(66556008)(8676002)(66476007)(6486002)(16576012)(26005)(83380400001)(66946007)(316002)(5660300002)(956004)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFhDTUppOWduNVJiMGRzNUFzM3phVndKTjdYaWthY2ZjZU5pcTJOaDV2UXpD?=
 =?utf-8?B?bGREYkd6eWprMERvd0lUeFZIN1pnbnM1bDNKcHZIVVZSNVlnU0dxSHg2NVpF?=
 =?utf-8?B?Wmlib0JJS2tlYkVWMTR2R1B3SHk1eWorOWpFUHVEYi9CVzVXZGdpNkNMeGFz?=
 =?utf-8?B?eXVtUEFIU3NTeVV6akQvZDY5aFo5UzdBeVpGd3Z3UEtRcm5naUNtVzBJb1pm?=
 =?utf-8?B?WitHanl5QWswUmJWRnIyL1lWaWNZdFgrdmpaVElYR1RqRWV3QVpzWmhzTEM5?=
 =?utf-8?B?N3NsdTlGUnlPb0lzc3IrZWt1Z1FtWXZXM2pLb0RlcVNsa3ZNRXEzUzRjTWx3?=
 =?utf-8?B?bkNudWMwOWg3eHhDbDYvazMvR1VuR3dvN1hQS3FkT2tmUlozWEtYYVhiSmJx?=
 =?utf-8?B?V2dDZituTEhFd1h2d0puS1l3d0dIV1gxOGN0d2Vnck5malpyME5HMlhUZGNM?=
 =?utf-8?B?TitYOUZIS3Y1Y3ZndVRVYTNTei81OTlnYzlNemdJWjNBTFNiUiswMFp5NG5E?=
 =?utf-8?B?dDFqMUpYYksxZCtINE9uQlZTSEZ3Q2NrMHpoeWt1Y29MVlJzY3RpSnVDek14?=
 =?utf-8?B?b2Ivb016c0FrTVFHUGQzNUVYQkc0VVBCSDQwVDh1NnZuT3U3clRtOTJVbTI0?=
 =?utf-8?B?UDFKcHhseStCQ0UyVHp5aWk5UHVQSG5qSDRFMEEyNzlZaHh3M1FiVGpEL3pL?=
 =?utf-8?B?S1gwaWFkOWNXOEdyYkZTQU9QRk10TGwyS0YwQlMraytnbVZZQXlheXJMTW9z?=
 =?utf-8?B?eDBuOGpwSUxFMWtwNEtSRWR1Q3JBMEJmUERaNlJHWjBtL2ZteVlJVGd3Sk54?=
 =?utf-8?B?ekNDSVFXOHRPOGpQRUsxd3dySGhLNEQwT3JFQmhuSXRaTjFISFlheWZBb1dQ?=
 =?utf-8?B?UTlQOGtxVm5jZEhJN2dHMU8zVW5ka0w4UU9jc0FadHc1emhvZjkrZG03UWdC?=
 =?utf-8?B?dGw2TnFzS1hKcmg2REVpU0JFaTY0bzRYQmRnVjBQSDBuQUxFRlo0NGN3WWNl?=
 =?utf-8?B?ZnozaTVKYzVxTDlYZGxhUGdyK1dRQVFYQllOaHl0UjVvVFJuYXFXaGFheHU1?=
 =?utf-8?B?b2ZkQy9vL3pEWnRvNHEveWNyYnZTVUE5azVzNTJSTVF1cytjelAxVUJNVkNB?=
 =?utf-8?B?b1k5TGZ5ODk4U2F2WWk0ajlUY1c0Q3pPQzl6K0lCLzR5TThncjBoODlxUmxx?=
 =?utf-8?B?S2JuOU9CTjZ5MXJRMG4rdC9uTngvVUExUVpBdHRWYTAxSEpuUFl2cEVVRkFy?=
 =?utf-8?B?aXgyb1JvbEV4eUcwVDFrOFJEOGowZ1VsRmlUeWIwdVo3UHRoWndCdi9GWmcr?=
 =?utf-8?B?REt0QkU4ODNvM0lUUldNSEFITnhxRXBTOFJaZDlyQjBVNWllSVozVGEyZU5a?=
 =?utf-8?B?UjBhM1Y2Q1FwakdhWkFvNHBnM2lGTUcrdVFnd0NON3pGdTczazVoaDJNRnp4?=
 =?utf-8?B?b051c20wMzl2R1hKZTcweThXMmR4T3BqdjhDd3hrQS9RYXV0cWpRZ3Bjczc5?=
 =?utf-8?B?alp0RUxZOVB0TmxjZ0Fwc281YkE4Nk80T1ZRMDJDcFRYRVlvYkpKREZXRFZH?=
 =?utf-8?B?dlhiN3h5Mkw3anlFLzJISXBsSjBxam5vakQ2NGJVbU1wenJzUHNZa2tMd1U5?=
 =?utf-8?B?V1dSSGo0MURDeFpDZnVTaWVrSXZkNHhDd2owMXlzd0JHQ1RsVW1SbmpDZG5I?=
 =?utf-8?B?eUNEUWRsRENiWUVHNTd0NTBrbVlidUd1MUFiVGtsa3VraXJFMVd1NmxXeFRv?=
 =?utf-8?Q?ijj2qt6nPBlyyFGdy8fWZHhSOUTr0UPNVprHP7K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87e3247-1e3c-4bb8-5a1f-08d98411cb0b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 12:57:00.7304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4rrTa7vi7vpG+EZ88YYwFCCJDoHDu9jqCOIDIiu2UX0/GHh1AoP1dJ061+WC06H8Rx5eBx786Pmgcmn9IBZcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 27.09.2021 16:24, Ian Jackson wrote:
> The mainline development branch of Xen is has taken the first step
> towards stabilisation for 4.16: new features not yet submitted, at
> least in draft form, will now be deferred to the following release.
> 
> We aim to make each Xen release as good as possible, and that includes
> high quality and particularly an absence of serious regressions.
> To help deliver this as Release Manager for Xen 4.16, I need the help
> of the Xen developer and user community
> 
> In particular, please would users and developers make sure that I know
> about:
> 
>  * Regressions in the current development branch (xen-unstable)
>    compared to Xen 4.15;
> 
>  * Major or important work which is targeted for 4.16, but at risk
>    of missing the deadlines.

Effectively all of the series that have been stuck for a more or less
long periods of time were originally intended for 4.16:

- xvmalloc() / x86 xstate area / x86 CPUID / AMX+XFD
- x86: memcpy() / memset() (non-)ERMS flavors plus fallout
- x86/mm: large parts of P2M code and struct p2m_domain are HVM-only
- x86emul: a few small steps towards disintegration
- x86: more or less log-dirty related improvements
- IOMMU: superpage support when not sharing pagetables
- AMD/IOMMU: further work split from XSA-378
- gnttab: further work from XSA-380 / -382 context
- x86/mwait-idle: updates from Linux
- x86/boot: (mostly) video mode handling adjustments

There are further individual patches, which I've omitted. The only one
that I think (or should I say hope) is on track is "x86/PVH: Dom0
building adjustments".

It would of course also be nice for Anthony's "xen: Build system
improvements, now with out-of-tree build!" to go in, but it's hard to
predict whether the remaining almost 40 patches can get reviewed in
time. I've been meaning to get through with this (and others), but
other stuff keeps popping up.

Additionally there is Marek's "x86/xstate: reset cached register values
on resume", which Andrew has been meaning to supply a superset patch for.
He has hence been objecting to this patch going in, but seeing that 1.5
months have passed now I think this wants reconsidering.

Similarly there is Roger's even older "x86/viridian: EOI MSR should
always happen in affected vCPU context".

Jan


