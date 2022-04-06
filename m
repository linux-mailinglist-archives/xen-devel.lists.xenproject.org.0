Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C74F618C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299919.511254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6ZF-0004G6-04; Wed, 06 Apr 2022 14:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299919.511254; Wed, 06 Apr 2022 14:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6ZE-0004Cn-TM; Wed, 06 Apr 2022 14:23:28 +0000
Received: by outflank-mailman (input) for mailman id 299919;
 Wed, 06 Apr 2022 14:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc6ZD-0004Ch-CD
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:23:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2d88af-b5b5-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 16:23:26 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-yOgDzY2NOCyixjxIq60_2g-1; Wed, 06 Apr 2022 16:23:24 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6614.eurprd04.prod.outlook.com (2603:10a6:20b:fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 14:23:22 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:23:22 +0000
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
X-Inumbo-ID: 1f2d88af-b5b5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649255005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zpJ/CKXcSgGMt9+JgYKICAGQutCWHilkC8imYjya/4k=;
	b=MSspE0rU5YUHpmb8qDw6IzFoHP0kPl/9Rr9hurF/w68O6OrRIb3tnm0aiSsHas8hcepXCV
	sch+Jnqf/jY2VJMUMEV+mnUh5ajmdcei8jjkqi3G+8rKbQl4cxb34uNUvMewTOg1+kzFiT
	HQSDQX9zjx4a+QWTj27yO0MFlXjjdRQ=
X-MC-Unique: yOgDzY2NOCyixjxIq60_2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Th9K/00cxxjHY3g6TPa8uKx420tcll01N2yjFeB2O+3uHbNaB3GhMC3a6sFXRKDlel2UpaYijCxjiNXl6MhfXnCvLIS1OCVnZp2l/bJRpxeyHQSOGBtpP0RKh14atXL/fCH1z/ApSWtqFKfLdl5xTFJbvZyL6NeLzx9FNWMaXJ7CCaEa6DTObbrL8d/uImLZgQphYE3ZXN08AZLcYYmT/9Hyal6At0mpEO5oYkSQnPJDbt+J8WCZ3vCQOV/83gVFRw1L+lU2Uvx84IMrO8Dqz0lfyILys+MP8gb/Ee/ASc/sdioDZd29EJO3O3TenojywryQ34pEyHtMO8M0JJlzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZvBxKd/T0TRkdNeYmow/rSTQy+MbsbZVDbAn7hfI9Q=;
 b=aF3NdFfpbv6+flOpkjL0hSb7ZhPsEBaq352/5/wJ4Ly8FJZNCxuSxElfJvi9H9x+vaiC9ki48yKXbqpZjzrUB2MQR9vd0YnxS9suDLgnbFxNjf7IEQh/Yb10NGb7G/xK1J05+G6Zfqh5p97RvOGgKdpcQurpQg8lCveX+0cnyejLlOoIkt0mfHUBj/tGuOWYnTqjossfhWbOH1aqor+U30KZ4tBPtd8E2vgAhz2tGhrUDu8HHGN94WoRd3xa9c2RtAXPmINczjPvunRySwZLR4Lxm9IxgHetH54WHDfbFSXP1hImffzpOh++zQ1MmGf5MWWDJ6plpLVW7IUllyv+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65d3068b-fde5-951b-9a60-4ba1dcd89a49@suse.com>
Date: Wed, 6 Apr 2022 16:23:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/8] x86/boot: make "vga=current" work with graphics
 modes
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
 <YkwBpKcyrnuXyNPa@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkwBpKcyrnuXyNPa@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0003.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 599d89c4-d4bf-406f-cc09-08da17d90167
X-MS-TrafficTypeDiagnostic: AM6PR04MB6614:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6614B4FDC474C5B50BC58602B3E79@AM6PR04MB6614.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5whQ9m/aazbp0S8qBzVsqLbbMVLbnROr1LSnEMrHllBAWWUJJsJxN0GvpW394+ZlPYnfvzhZXjtIiaCawh7Y2EfzfSnwYaFmas3R65r+dvn90etSTOsalJ6i/dZDEnFzov32+IQhwXjirc41MThJSiUkXb3NNMMGuqkPvucr9N1QAayE8zJ6ZmAC83NLNdh3wIOKIPEl1Ptsn2ovHnbkMrCvLlQdASK8UbUGXBb/sQXXiB+okKwvbzgGayIfyMbR63Ea2PmEmhFTNV1FONYreIz5adt0DixxVjDLBITR7RgJN4oyyNJ50dO1jRZKgZlIjG4e4dUqPE5Mn0Qa0A9rNwkjn0YD4vkKMeHGGURp8A17pc+XVbAi6N1XJFCMlEssvS47a3CDjaYVSCtdB0/s/nYeYGlAebfjebczOt5iDRsGC5v7VuWZGFbbCXrYoFPVgSC0i2+NJ0BIUuyU8rCZUvDv8KwBw1G9Mh33tnlZjnjLKR2utI1t9IZvB26xuF0CQK3JebqTdGBg/2bL/31pgXKSFeQWX6VlInN1l+N0aatHT5zWbSA1rhs4RVf5eNC6wEpoAAzF/fP+pEcsv6n5IRKTUX6BD5jrgfcwcOAB3ExWkbHHxrUhxrgP0XHu1iKXWuuydkId+4c/ymad8IewGM+yv9GTdhRo09SzuV9ZFhaCaCFy3LqTZ0f6o6XNKMbn3P2ApgggkI63mUoI+GzDxv2TXrYfCrG73B7ejGdzXUdg6lTVTxvOfpKsLs68Pe8p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(38100700002)(31696002)(54906003)(6916009)(8676002)(66476007)(86362001)(66556008)(66946007)(4326008)(36756003)(316002)(5660300002)(2906002)(8936002)(6506007)(26005)(53546011)(186003)(2616005)(31686004)(508600001)(6486002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0dbc/Dk+56usmvv4eejIP0+hPVQN2XPmnqCyLN46+uam6rXv2X2I+wbB9HhB?=
 =?us-ascii?Q?UPP6Kmu3xjAeQ91YZcN+8XkTbkMGWxppQCkjDWs1OXHx2jR+KYUzAGka2S9w?=
 =?us-ascii?Q?khcuT9nxjEvEw1qmScfRSm73gtw+ZYACuD56KPRYTMC0kxpsxt5fp4gg74Hq?=
 =?us-ascii?Q?E3d0PBnlYq9FZocVfi3OhBIzykEqeJTLLG3krUTUqtEEx4wM8M6EaIpnO8qb?=
 =?us-ascii?Q?t+brIkKLEELEvo3ab3Xr1k++dwFPLIkPvhP9WkEt5zeWMHR/pv09ftIuJYIw?=
 =?us-ascii?Q?m6nvSPObIPaD+S64SNCffTtQZLPjSwdVttRckZmtMLNZRoAx6ujMGxb9tjeN?=
 =?us-ascii?Q?7tx7cQe7EaJfNUC05J0hu5ZLxIR3oUcS1Mpfry5QVl5hS5iGEH5iTqKzgF/3?=
 =?us-ascii?Q?AZBuLxtG1pgdk+HHWbx2nCQYFKMXSJQBq+IhN4tX8i8FpWjK674DVvMN/g7J?=
 =?us-ascii?Q?ftMP59wKexUzlK61EzxyWB/ujGBZFWitpBWba8LBQ2RUCU6Br3axANk/iRKu?=
 =?us-ascii?Q?rzZjQBNHqmmNsTl6qnLwbIqvdSK8bXxhKzzP4DxQyFLjOiVZlTDEvA+e/U9r?=
 =?us-ascii?Q?s6a3FCqRmOXyhJs+OeRtpvg+UMo+HJLDDtcHwPc2yx+nW1M9YE/8Q8C5PI97?=
 =?us-ascii?Q?AgvAJHk10TO+dfVlmldiD9qKslOTcELVXUF66pwb7tulDvp1XxeI9080mUWS?=
 =?us-ascii?Q?a5Wgto2wgP2q6juQJP0IPiiKmKgF1ZN+v0crzn01UCGVhrW5NDY1dCZeWh47?=
 =?us-ascii?Q?GkZ1k167/8P0tj+/Efmrpfv8IZ6YvvDJL9ygCGfd7zFL6quR7rcOJSAlfGQr?=
 =?us-ascii?Q?iitguDcEp8NkH9wxZJlEXCOEAeefZ2rThQF0UWMAzAXI3YMvzkXV3EArIxQE?=
 =?us-ascii?Q?B+t/LXPrxNgHLDLYEYLFvRiwTGqdbFX0brUCOvo4dx7H/YGP/fPKiwKDuZIm?=
 =?us-ascii?Q?LYvdisAn4lBAJlGB0i9OUE4SR4J4wxmLh1xzA9OjKFaXSmLVv0Vdq0pD3twu?=
 =?us-ascii?Q?Qp77anDpE9uGKgAlFaTfykiSUp4CdyZlWCFagfHbkYtUWTwO9NCvmLeZzOpC?=
 =?us-ascii?Q?jnHOF14dglkbPdsbxy54d6IJdf9L+ZcIlxfQBM2d3PLiTStC1RQjzU2s5OTA?=
 =?us-ascii?Q?6eDxTs3NF/gVoCq0A7FuMgQA7ZK6SjMVTOA80tFZ9oXuJV0fkbyH0K2C12gL?=
 =?us-ascii?Q?qmKygnh38x3TJuDv2ZjNKeFSvF58LpopF0r4B49YuQ8jgEG+XaUkt7lS67/3?=
 =?us-ascii?Q?MBY3KD8lfL3l6VHsRfGasoeVExQJI8GZhefaF79t30QM0Ykb5GVxcue/lWwH?=
 =?us-ascii?Q?R0fEGfm9aEigsrvybTJ6vaVNjCIhSxt3HnCzqTZbOqZ0vO9cBq54ZjFgE63p?=
 =?us-ascii?Q?JssZ1SJaEOWDgGTL1vv7OqW/rULP0h0EhCHs/bfYf5rE2e2sh4zcEAgaLbkw?=
 =?us-ascii?Q?EyB5hkQ7Qanq+/dnaf28VmXdNEvovWIX+ZNIf5uR616zcWzTpF9rlrlr/xTD?=
 =?us-ascii?Q?AbyOMKu4FlawP4rpzzzYsVoAk2XliGGYNzSqwjoOXwAPbZJLeND6es1Zvrps?=
 =?us-ascii?Q?L2B5SFkFHGTmfQeRJU2RHhtjFABJ/7pjWewcvhjBiqa5ULP7e1L3U3uNnuw6?=
 =?us-ascii?Q?bZ0VblYYIx83RB7fmxsBgu/ZtAhr3PrZu7zlLZGlQ83F+JwsqshWhcGnxbGq?=
 =?us-ascii?Q?0vq7tn4aIWailBKUs3Uym6POXX8nFBOPwfw9MzypI80Xw5RWEqKF5rATEnT0?=
 =?us-ascii?Q?8B79u5W6bg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 599d89c4-d4bf-406f-cc09-08da17d90167
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:23:22.6674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZHCVhHLtbf5iP3NvmW47d4hcsC78EcBsGqHSWioxdUfSY50hmi8sMeG5NS30o49z3TiWqrD96hGadTYngB/+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6614

On 05.04.2022 10:45, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 11:44:10AM +0200, Jan Beulich wrote:
>> GrUB2 can be told to leave the screen in the graphics mode it has been
>> using (or any other one), via "set gfxpayload=3Dkeep" (or suitable
>> variants thereof). In this case we can avoid doing another mode switch
>> ourselves. This in particular avoids possibly setting the screen to a
>> less desirable mode: On one of my test systems the set of modes
>> reported available by the VESA BIOS depends on whether the interposed
>> KVM switch has that machine set as the active one. If it's not active,
>> only modes up to 1024x768 get reported, while when active 1280x1024
>> modes are also included. For things to always work with an explicitly
>> specified mode (via the "vga=3D" option), that mode therefore needs be a
>> 1024x768 one.
>>
>> For some reason this only works for me with "multiboot2" (and
>> "module2"); "multiboot" (and "module") still forces the screen into text
>> mode, despite my reading of the sources suggesting otherwise.
>>
>> For starters I'm limiting this to graphics modes; I do think this ought
>> to also work for text modes, but
>> - I can't tell whether GrUB2 can set any text mode other than 80x25
>>   (I've only found plain "text" to be valid as a "gfxpayload" setting),
>> - I'm uncertain whether supporting that is worth it, since I'm uncertain
>>   how many people would be running their systems/screens in text mode,
>> - I'd like to limit the amount of code added to the realmode trampoline.
>>
>> For starters I'm also limiting mode information retrieval to raw BIOS
>> accesses. This will allow things to work (in principle) also with other
>> boot environments where a graphics mode can be left in place. The
>> downside is that this then still is dependent upon switching back to
>> real mode, so retrieving the needed information from multiboot info is
>> likely going to be desirable down the road.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

May I ask for an ack or otherwise for the changelog entry, please?

Thanks, Jan


