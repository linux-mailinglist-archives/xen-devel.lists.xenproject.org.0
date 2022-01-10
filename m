Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FED48973D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 12:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255286.437427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6siQ-0005h3-40; Mon, 10 Jan 2022 11:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255286.437427; Mon, 10 Jan 2022 11:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6siQ-0005dz-01; Mon, 10 Jan 2022 11:19:54 +0000
Received: by outflank-mailman (input) for mailman id 255286;
 Mon, 10 Jan 2022 11:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6siP-0005dd-1d
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 11:19:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39b2b7b0-7207-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 12:19:50 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-IfK7Gq-cNOiqe49fwLu2FQ-1; Mon, 10 Jan 2022 12:19:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 11:19:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 11:19:47 +0000
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
X-Inumbo-ID: 39b2b7b0-7207-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641813590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fag3kek63Obol2rI4msvwP0r/JLboDNoNKG8axtarDs=;
	b=U2MjfyiFt/2AczLC5rcERgJTtviTzIY9229gCI11dCk5yt9shxsXYynkPd3RGIzfsYf6wt
	NFFa+w7+ycmaVanboiascterXiPY+H2hA7MoGOZTmRvhXP2hC5Ppi1OCVR1dcHY2ARF/yx
	h6kKkwHMzRsCuBX1MimWVoV52uD0YSw=
X-MC-Unique: IfK7Gq-cNOiqe49fwLu2FQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6qSgYZJKZ/VNpXGvQ1+rsi2nh+EQV6N/Hqb4lhufsm30WiW9pgqpgK+5N7HVRAOv6kDGnRm1DMDC5wPK1L437ql+aNvR6aNUurrgqY0cATABcc0rHlPHDigtcMtT+0KTNpmqnN6JdQN8Sp34AxPWWug87CP2FpTa/hqJ06B+S1ZwoFlkSUCLIzqlxg7Kr1GG1glQy4F1ZTNDS982mky4fVXnsoeqO1FdVmBt7Rfb+z8wdR0tZSqNrpiaYBKjV+LyC62T8JcwFD+PD8i6E/P60Gpt5e3dQdSUsAtk2KImLJ8RgEn5olnoFooj3DXjoR3Lmf64cyqAwXnCgwKJD1g6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fag3kek63Obol2rI4msvwP0r/JLboDNoNKG8axtarDs=;
 b=DLLOefHtLiw3k/yArTfbwCXoWmVS/aOCJ1Hdy7eTlKDSO9Bsof0mWoOEbJgX9xLhNyI2Gu8O2RLnORcSot6pPcDllom8fYj1t788VVS144+UX5pF+5ldwiyHVet3YD3QX5xySGRz2o82gRhVDTemOLvg0FcryE5D67YK9dZ7ETFqhc0cr2S6xk63Hz/55wclQTdZvJvbpt7WiiAJt25gVP1iFSYkFw93qWtGmx8z9jkKuCIIwWD7wQW96ui0uNQwodQcmxpEiuV/D8OLHWy9xEWxKtTA5Hhq5bFmvZJ7Xuy3zCjgVoULiD7XQRlT+sdqrlO44hC3sidn9Fehtr6wwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b70fee5c-f58a-435f-cb77-6600f699aaae@suse.com>
Date: Mon, 10 Jan 2022 12:19:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH v8 00/47] xen: Build system improvements, now with
 out-of-tree build!
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Kevin Tian <kevin.tian@intel.com>, Connor Davis <connojdavis@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Paul Durrant <paul@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <f8cde73b-0e5f-1b3d-c51a-9fef6092dabf@suse.com>
In-Reply-To: <f8cde73b-0e5f-1b3d-c51a-9fef6092dabf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0055.eurprd07.prod.outlook.com
 (2603:10a6:203:2::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91e3ab85-b5bd-46fb-b657-08d9d42b1c35
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516650978D7E8FB917F4F00AB3509@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HlvIAemmYMpHCRB2LslJvMA8aEZlk1lQXW66BE3BVV3fJEf+1aU8ftbAokpPomMh8+oulJHHMQFdQvoF56L0ACLppLjDmAwcKp7aMbOWyjcyqgZfM7s9Xe9kd569BcDlsbHpROaIssSMiy0nvWLWRJ9G03qwQKjDYZmwxlMPLEwW2HWKkTmwkJnom8sF7lYFdnftqeLehRZhB4Z6OirWUpaGd+SFwNhX8dZzBMa3/lsILSTooQozaVwD7OR7tKr23QCWzl3QfUZQJbkFcstNuB6Zk2USnyhEjcecLRtMCzTC/H/KoeanVLd2uQwRsr6wan8Ffjlz9L8mn3q5C7/38n+bCag4czCmvQx53rXKhyjoOHRGH6s6KOcLmeEQoGfSv8Zc2wBSTMZVe7rZyHxaLjXCvCLObbDzn6M6vmv9czvO7YoxhKBPxJIYdNMUb36SXjom7ooWh5vPXgxx3MnsMvgbKhgRSdCwhgamJO5vgekJGbLESxheu9K8czqfJTnut+BT/h0qoZQAgJATi3GkCWGHfWzlw8Q3Wij3DrC13XbL3wSLpp/F1wkifzOp4NmvwGZirT5uFXrDTTCy+wFRQEiojsDVPLM44AxtaMzLI2BujkeXJRR/3LK8snHd0PDLTQovRZxSkvkU3gLnk0ZY9nyvuNArmY5173K1JD/y1pY9HOl/Fr3w9BWJLci17+amFDAukTPjeILXPRu8ZItBCkpJhGgFTSnWBt4ITPFN/HJGHA5oQ3BW2RgPOZvXgUxGb5lDdOVfmLtrG1EFyDUy6x/MlnPwm+cSXCSqvLNwteT7s8Gi1wX+LdSBQ7e2gpDcnSPjdcSILvKcrxp+LEOUyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(53546011)(5660300002)(7416002)(36756003)(6916009)(66476007)(83380400001)(8936002)(31686004)(8676002)(6666004)(26005)(316002)(6486002)(86362001)(4326008)(966005)(508600001)(2616005)(66946007)(186003)(54906003)(2906002)(38100700002)(31696002)(66556008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QiszRlNHdUpmSEdHNE5VOHRrWmNTR281NHNxSjRmM2xGL3FINjVGdVBrUFJU?=
 =?utf-8?B?aXlkZXB6YTRPMVlCaHN3aUZxZEEvV1RrZFo5Tk8vZnlodTJ6MFlnU3RvZTNm?=
 =?utf-8?B?ZFpXeWZvOVN0eE5oTDFhajlHSGM5cEZ2ZVkwVnRRQVJSQ0p5RkJpemVoalJ3?=
 =?utf-8?B?RW5BTXlpTC9nNHpiOGpYUGJXbEl4U2g4QjVXSXVWdHRBaHRPcHIzWWNUNUQw?=
 =?utf-8?B?WE5kblBBdUV0aysxUHkzN3dGekJ1b2ZHMmJzQW1vYkJoMmUydDQ3Q1hha3Vh?=
 =?utf-8?B?RU9xSXlLVTNZUm9mZllRTVNPLy94ZzRWOWc1cGNMWi81ZmlRSndSOXl1WWRv?=
 =?utf-8?B?M1Jkc2ZlTXViSDF6T3I4N3RHREY5K3lwM1dvR1d4TGVUOUhQMCtnRUhRWjFv?=
 =?utf-8?B?S2hsSmk1MFJFeFpRejdoa1pYNDJPZDlNanptc0hzSFYvNkRORk96d04vL1Bu?=
 =?utf-8?B?UHhRNHNqRmRXT1dBQ3BTQWgwZlBtMllzek1kcjIwanNCYmlzdGFOZU9xUTFC?=
 =?utf-8?B?UzdZSU9OMmxlMkhOZVNUdmo5eDBlYmVPMHpxbGZqZzhsaThEckpCUFY0b1RE?=
 =?utf-8?B?aFJBeEFaTWROdUdIbUdrVE5Lek44MzF4Nk1hVVBMblZXdFNmYXF3MklCRVpr?=
 =?utf-8?B?Q3owb1pQUFQxQzl0NVpUK1IwOWp0YWt1cVBvOFFoekVCT0EyRk5NWU5pdUJJ?=
 =?utf-8?B?dmFwL2pWczlWWG5mYXB0Q2h3b1EzSzFwZmUxWDNxSWM2T3FwQWIya2hXUG5L?=
 =?utf-8?B?dGRNbFh6RjF0VXJiK2pOUnRNL1lDekJpOEJqemt4WjNxN0VJQyswTUFuU3hr?=
 =?utf-8?B?aGc4bElvbHl2eWZUYlNXRHJGUEV5SDkvWW44Sll5SDFtWDBMTW1kRldCQnlX?=
 =?utf-8?B?bjRYU2ZGdE9RbEFUcFR5aFNrbkFkdFFXYkpzSm9nK3U2Q1hib2FuUkVjN2w1?=
 =?utf-8?B?M1pxSGttT2NuUmpQeGJPS1hydUpnSnpET1U1dTExcEZERUJQamJ1dVFQUSs0?=
 =?utf-8?B?Q1orZStETGNwVlE2dU9iRzFBZWtseHgrRG1ReWpJL0lkU3JzRWt1UG1xaDR2?=
 =?utf-8?B?amVRbXp1eEZyKzM5d2YzdmhoN1BpMTFyNzhtWjJoU2RJZFArUXVGbTVORURu?=
 =?utf-8?B?VnNiZFV3RElMeDBkL1FhYkhRTm9tNzdnSUdzc1AvdTUxZUZhbFBQQzMvczJw?=
 =?utf-8?B?djZDK08yT0Nkb29rcGlVRVYreHpGOXBid1J2WStZUHF3Z25DYm11QlZYVjVY?=
 =?utf-8?B?eXVIT2FWVmZLU3B0OERkc3RQUFdCZG5rY3RoSWJRcGZpaWpLODZtNlF3ZVho?=
 =?utf-8?B?UnF6YXV6N1k1ZGtvclJWMml1Yy9rdjRYanVXMUptRjBuQnF6QWVkVk5mLzVW?=
 =?utf-8?B?dVllcEw4K2hINWVoM01GTDNYZklOUTRETWg5bVlyQ1FDNG1TenJJeDlIQVho?=
 =?utf-8?B?WW9KZWUydW9IbGpQZjcrMUxKTDlNeXExdy9sTWZEN25zZ2lvYnZvNk9WOEF0?=
 =?utf-8?B?MlpadDd3Mk9NNUtNV2l1dzMrK3FySHVBVFN1R3JDSkFPSXBXRWJ2RVV5Mzht?=
 =?utf-8?B?SmtxWGo0WTU1cVZydExDdDREV1dyWnhzRzZNcmEwUHNMd1pCa3hyZkplYlJ0?=
 =?utf-8?B?YXMvRSt1eldNOE85N3d3QW1nRnlkalJoQ2w1NGdGUVlRSWNyTXpGSFNCTnk3?=
 =?utf-8?B?cHRHNVU2TjVFL3NQVzFqNHBUN1M0cmNyOHRNalRXQk4xLzV5cFVQWWhSWW5h?=
 =?utf-8?B?UmQ5Q2pvNGJ0S0JYMEhkRFFjNEdDRmF4aVNQNmR6YlVPY2JpR0xXTmxUcDlL?=
 =?utf-8?B?N0ljdEJRVnh0QjdkUXBLRjFDbVhLeDVSTjJPc1o4VlRDL3ZEdTgvem94RG51?=
 =?utf-8?B?bU8zQU9PZ2VsUGtWOThyd00wTkxKNFNVaGZVUUtZaGh0b1FhaHZaeVRpaWFz?=
 =?utf-8?B?cUJROEVJaEUrZWZ4dkpPQkc5clFuLzlOZEN0WWorWWRkU3k3aHlIb2t5M0pk?=
 =?utf-8?B?eC9yMzRsRDVNT2c3NjhodU9iWEpNNml5aVFQZlY5N3JQUDdyQzl3dmJrb1F3?=
 =?utf-8?B?eU0vdzRiMVRTWWhRM2cvcW9pbUhzY014TUN4Z2tUbzZmZ1dLRE5HU0NaSUMx?=
 =?utf-8?B?NW9Qa2FPWHpIRkdVRHFBMzNHdnRWZUlqckhDS0NITXN5d3VmNXNlVlpFYy9U?=
 =?utf-8?Q?m30POHfjyClFNLjtP7Wuu2k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e3ab85-b5bd-46fb-b657-08d9d42b1c35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 11:19:47.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKH7cLFPG1dCZTKTqv8UG+gE51FL/ceo5v3R0+glgsd5VAP4qs2X9o4YVXvU7tr/WGoOpTKIn1oSqsWn7wtyag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 21.12.2021 16:26, Jan Beulich wrote:
> On 25.11.2021 14:39, Anthony PERARD wrote:
>> Patch series available in this git branch:
>> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-v8
>>
>> v8:
>>     Mostly rework of v7. With many patch already applied.
>>     Some detail changes that are spread through many patches:
>>     - `make cloc` recipe should now work throughout the series, update of it is
>>       done in 3 patches.
>>     - new patch "build: fix enforce unique symbols for recent clang version"
>>       to fix an issue with clang.
>>     - introducing $(srctree) and $(objtree) earlier
>>     - introducing $(srcdir) as shortcut for $(srctree)/$(src)
>>     - introduce usage of -iquote instead of -I in some cases
>>     More detail change log can be found in patches notes.
>>
>>     Also this v8 present a work-in-progress of the ability to do out-of-tree
>>     build without setting VPATH. This is presented as an alternative to force
>>     use of out-of-tree build. As the last patch show, it allows to build the
>>     xen-shim without the linkfarm and we don't need to make any other changes
>>     to any thing that build xen (osstest, distribution packages, xen.git, ...,
>>     and developers finger macros). The patches are only there as WIP / RFC as
>>     they were some concern about the usefulness and extra changes needed.
>>     We can decide whether those changes are good or if this is too much and we
>>     should force out-of-tree build for the hypervisor.
> 
> I'm afraid I'm of two minds here. I don't think we want to force people to
> do out-of-tree builds, but I also dislike the idea of mixing in-tree and
> out-of-tree builds. Yet reading the above I understand that the shim build
> would conflict with an in-tree build because certain files would be picked
> (the shim build being an out-of-tree one) from the (dirtied) source tree,
> rather than the shim's build tree. Perhaps the extra path prefixes that I
> commented upon in an individual patch are then indeed the least bad route
> to take.

Having looked at the RFC patches near the end of the series, I find the
need to convert from '#include "..."' to '#include <...>' particularly
problematic: Using "" for "local" files is common practice, and hence
even if you take care of the existing cases I'm afraid we'll be at
constant risk of re-introducing such an issue somewhere. And someone
hitting this issue may have a hard time figuring that it's simply the
wrong file which gets included somewhere. IOW I guess I'm now favoring
the "require clean source tree for out-of-tree builds" model.

Jan


