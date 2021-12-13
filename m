Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED000472765
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 11:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245918.424203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwi8G-0008GG-So; Mon, 13 Dec 2021 10:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245918.424203; Mon, 13 Dec 2021 10:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwi8G-0008EV-Pi; Mon, 13 Dec 2021 10:00:32 +0000
Received: by outflank-mailman (input) for mailman id 245918;
 Mon, 13 Dec 2021 10:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwi8F-0008EP-8G
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 10:00:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e83307-5bfb-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 11:00:30 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-pB12RiAaOwutK9JNJGSg6w-1; Mon, 13 Dec 2021 11:00:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Mon, 13 Dec
 2021 10:00:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 10:00:25 +0000
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
X-Inumbo-ID: 80e83307-5bfb-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639389629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iNKq8iaWxI3vMYsCQThMcoHbLzsqbieUcAs4lwiZDs=;
	b=cQdjKUvapibaFMUb/UVU/VAgH0JtP++hQzvfVjKlBqk6ebXXttaebLWSlugfDjFOL0sPVE
	zNrGvO8qV2b46yWnyBE+/2YtAiH8GrG892Tnv4Tif/fLXYK+kTFmhaFxbBOCsopuMNJcvB
	QhlWvKz/tps0+xiQIC7GvOrvQF+0MHI=
X-MC-Unique: pB12RiAaOwutK9JNJGSg6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwj+sRt3t/HrrDBj+QhwGAcqcQZr1rr1dFDi3Jnqw1kwlUqytwJ24OY1/GEMDd16C32sHrunYhrmGjsOwTmbiGeEaUEnEQ3N7dqPb8CTwqgwP8MwTL/Mose9IQfD6X8qPFbaqaNxARexvUt2DC6U2Wiz5trZOjL/qFz4W2rCvY/BCDeBib+EoMTWw4yMUWcE9oYS2SPDJS0WPYaVm4eTyiHhS9q9tmXJNiP6bxaHonjbwfrH1ceKwxsSo0u8pYHtgU8orbPlwQMSl+L2YR3ZWdnVeB51cUnzz+DyUHjgJkrFdSD//VE0GIiRzuQ6FrBw4TPckarSTox8+rqPGa3arg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CLfSQg9QbXlvONNL9Vd6HtsIxJegeM+xe1hhehoLuQ=;
 b=isYoFkvI3Khrmqz4jRQY+nt7Bz8wtANbvAFHmTsK2pg4lZye2dRs0Pcy27t6ezsZqieq8JX/ZFGq/uT3eNrHaNYuhPlw3iWXSILiek+UqRqMbBPBPsZZf7seN2iqYlXjQC5SKH4XLb4oSafYjhvytoPPU1REoiwDiM/ZZHqhiEjvVxrmdaWkDoluDb7One7WAoqV1ymukN9/1bey9SX//iBSZT9jAOnoTyRj64xmYuBBUT2QjVKLmPUJ6eSRtcQDC0Zrl7sXxEbt2Klig4dafGP4HiNHYu/NSWRoHUWLQP5eqzD0nTfaXIj8WXvb3kwsLS6FJfnvDmWc64UXq+bD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b766e6a4-3a28-7cd1-b35d-7bd36e80a552@suse.com>
Date: Mon, 13 Dec 2021 11:00:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 12/18] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc93398d-982a-edbc-4ddd-b5459cef8f9a@suse.com>
 <YbNtBPv1M1lIyEOd@Air-de-Roger>
 <d472fbb5-95f3-dc6b-8103-e7d76e71290a@suse.com>
 <YbcWVRFFXerNqBPy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YbcWVRFFXerNqBPy@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0043.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7598954-e10d-4ae5-9193-08d9be1f628b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191208647FB78D4F67D3CE4B3749@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xAgHfTfGY7DKc3SmW8FuHYrZSxtzUa5jI7RZ5t4Vvs/bD35pf4fQCMIpzb7Vh/3nyCBNQabn0p17qrOCGt2M58V8jJ2hoO1B1IQO/WJzf7eYuMnEQw99kIYWurJjcMDYp70tHNaSIczYTogUX8fafUldVUSj9FSMTLm66U5a4pfx/FLvNrrY7eOhYeHlKSlvaeDhpTRM9j852tkhl3MxpIuFG38mGsAbL8/MVqytqoNJl5UnS9CvVt/Sn9C/QzIIGWu3dNtDayaNtVzHt0F/6BlGx4Lropc+X0q2yeuEIn3jpR12b6kAYsXg+rjYHGzoDUxKFYAJS5UMOTYTSnjA8cHsT5n/g3fB90Pbg8FOD9d4eIW4JS19TCJ+s/pjBmqid3w+i30M7W7oP5YXRQlhbxdOKf/8ciFuFGA6exJ1jMUk1jOPPTnEDUTDhHy24kERbIoqFpAP1a4CVl+cMXFo4wtAcceQ6eXkvaavRBUVwLTFPL+pFNy18u6U881O7HGsk9FJVyLLO3QmL7bYP0Pb9NQK9Fwe6esdbfJmnRPnvSR9hp2dw7sENcdgzdrUm1jk3TaSsHSWIJMGHmnpcDFF4fvd0HWeaSwBPjVm1FXKQqxQxwxlgHV2PwhcBPzGCF9OpEVVllf3p8hJ0Sm4vTt4bcvsGvSyEANLTowEo0y+pDj3kQtyDkMB51QIxOhmZR5jC7zMXXewlmNGG8+cJStqnn+NbvtYEwA+YeCJ4HwiuCQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(31686004)(86362001)(53546011)(38100700002)(508600001)(5660300002)(66476007)(66556008)(6486002)(8936002)(26005)(6506007)(66946007)(2906002)(36756003)(4326008)(2616005)(316002)(31696002)(54906003)(6916009)(83380400001)(8676002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q09PmuMQceIgus2quzTA4xqOR8nlr5tSRU5fI2KFX29a+tmmqNfWQKVXaLxs?=
 =?us-ascii?Q?8f84rGHSeRocbpsy3+97R2pH1uYehsHTu9AucMPjmRi6tuqAv+O9V53YB3SM?=
 =?us-ascii?Q?iYchb3hYsltubxxymngbT8EO2UYCXUoyy2WpBjeIX3TdtEqpKjNi50L4ad6H?=
 =?us-ascii?Q?ozSm9n439fR4bIDfHHWEJmLX/E1M6pDA+IT77IBOXy1BYFF/eA0gALuvuStH?=
 =?us-ascii?Q?19h3e/aHEGFtNao0FZYnpbHUeQ47xKAhryH5byo+XWycsgzcgUMpNN2CkC45?=
 =?us-ascii?Q?sRn98fTgCckJS5atYAS0Y6hHywZJMzNSzQDSUABlm2SzLGkjXU7iTeRIpwDU?=
 =?us-ascii?Q?RTAyiAnucvd7Q7C0rHvEHzSHcgld6S0CaIYb+PnNNQyCm5bPs5p2EXzMfgjL?=
 =?us-ascii?Q?1Yqt3VqTvj9kf6SxYcTOfdnWtI/vNUeA9c9nJnH5/YuGJJjqQYxyODsodG5U?=
 =?us-ascii?Q?/TxOWJzT/A0YPAz5H/a1LztHMkDmAhgA9Pnle/VXP9GOLFDBd/q4ficdDyqw?=
 =?us-ascii?Q?c3gtchy25D4ZW7KUOaby8jpgefPyVxtAqIf83lR4k8EF3uACY6pI7soVRG6I?=
 =?us-ascii?Q?mtT9BJD8NC20mk2jvXzxvgU6lejmaCf4SKhX0/Z5JV83YNvrEXMEw2606BVu?=
 =?us-ascii?Q?1nIf3nxCb2vYPqxFJ0xMRo9eyEeoWWYTyY+0pr/O7vdwk3eOfO/dtQy5KUKh?=
 =?us-ascii?Q?Jdla/N5yMYHUvotGKDdwrAjF1N7hKzE9Y4d14BVm4AiIic3FtKx6fn6RJ529?=
 =?us-ascii?Q?+9VpFl6sWdLO2zFsU4RQ0cucdRpmXi+gP0RTyq6G+dvgCW5uEeTH7gom9C8h?=
 =?us-ascii?Q?ZffjFmIZ0qwvMgPD725J7dl9Sc5rbrNtytVemMOMINwJ/D1H3fNnLcSzUajZ?=
 =?us-ascii?Q?VEWmz7qm82r0ldOu4NSWhH6vLmulQA046qdJt1YcLM9iJDJIi7KgmjT/hBKj?=
 =?us-ascii?Q?er4Y14lnu9hDdAKROdWKo5OsE+hSpKhuvptaLSTOZNAHOaBdfP7T13iBTDeb?=
 =?us-ascii?Q?ut+MPxLLYIECw8El69LI6TrOuRRToPqmy6XRnr8A6urVe2/r71HHG4W54cd1?=
 =?us-ascii?Q?zksA1J8QrTDk6Mhfeg1vVujVC8YZm6amWgynGJEysEuLtQRgqBMR8g1HQ6oy?=
 =?us-ascii?Q?1PQLZbj/gHlF4RX6wwOX9PLLfiVTS0czE/V0zmO2Kj+tk+k0I1Fc9s2mWG8q?=
 =?us-ascii?Q?0WG4v4qlHfPfUWUz5sQuLaesclDgeBWJvSAhwEZ/cWGSqbQ6yQYQ0uygG1QC?=
 =?us-ascii?Q?/I3mLcCoU7CsYZGFN8WjZsD7dNZ9NdEtCzI02xUMiG98YubtxoYutjKk43Zg?=
 =?us-ascii?Q?rFngU4WIwCvZlBmoNqCAwZpXocJ6N/ncLfnxw9ZRcALITdZFYcd1nshL/nyu?=
 =?us-ascii?Q?SMwjtqU28v2b0HB6lAZAZ4rCnei2J46qLWkA31s6tVcPuLJoyVzCWUaCMYZo?=
 =?us-ascii?Q?lK2H1sEfgUZALkGL6XBBMhexcFOBL3+taecOa97RJLYLN6RHx73o+bY/Pdvl?=
 =?us-ascii?Q?KGbj3sZ4fJoWEDueS+usZ/9sfk6hpy+ZK+aEAHyFJ/Fa0GoXpLn5EnhKebi1?=
 =?us-ascii?Q?/CMEQUXWlbELQ/po9MaFC/RfaB03wN7pc1YOAj44fzjZ3ZbIB4jqbR1tX8wh?=
 =?us-ascii?Q?zGrDDFIXfj8RpZoge+t94S8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7598954-e10d-4ae5-9193-08d9be1f628b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 10:00:25.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwbSGk/er7crJo2VDgI41F6ls3WCPcYZnB51N1U+kOf7thpAhpFCfdQNO1DfMs59ke41hqLJ79cZq6TkwLvQ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 13.12.2021 10:45, Roger Pau Monn=C3=A9 wrote:
> On Mon, Dec 13, 2021 at 09:49:50AM +0100, Jan Beulich wrote:
>> On 10.12.2021 16:06, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Sep 24, 2021 at 11:52:14AM +0200, Jan Beulich wrote:
>>>> ---
>>>> I'm not fully sure about allowing 512G mappings: The scheduling-for-
>>>> freeing of intermediate page tables can take quite a while when
>>>> replacing a tree of 4k mappings by a single 512G one. Plus (or otoh)
>>>> there's no present code path via which 512G chunks of memory could be
>>>> allocated (and hence mapped) anyway.
>>>
>>> I would limit to 1G, which is what we support for CPU page tables
>>> also.
>>
>> I'm not sure I buy comparing with CPU side support when not sharing
>> page tables. Not the least with PV in mind.
>=20
> Hm, my thinking was that similar reasons that don't allow us to do
> 512G mappings for the CPU side would also apply to IOMMU. Regardless
> of that, given the current way in which replaced page table entries
> are freed, I'm not sure it's fine to allow 512G mappings as the
> freeing of the possible huge amount of 4K entries could allow guests
> to hog a CPU for a long time.

This huge amount can occur only when replacing a hierarchy with
sufficiently many 4k leaves by a single 512G page. Yet there's no
way - afaics - that such an operation can be initiated right now.
That's, as said in the remark, because there's no way to allocate
a 512G chunk of memory in one go. When re-coalescing, the worst
that can happen is one L1 table worth of 4k mappings, one L2
table worth of 2M mappings, and one L3 table worth of 1G mappings.
All other mappings already need to have been superpage ones at the
time of the checking. Hence the total upper bound (for the
enclosing map / unmap) is again primarily determined by there not
being any way to establish 512G mappings.

Actually, thinking about it, there's one path where 512G mappings
could be established, but that's Dom0-reachable only
(XEN_DOMCTL_memory_mapping) and would assume gigantic BARs in a
PCI device. Even if such a device existed, I think we're fine to
assume that Dom0 won't establish such mappings to replace
existing ones, but only ever put them in place when nothing was
mapped in that range yet.

> It would be better if we could somehow account this in a per-vCPU way,
> kind of similar to what we do with vPCI BAR mappings.

But recording them per-vCPU wouldn't make any difference to the
number of pages that could accumulate in a single run. Maybe I'm
missing something in what you're thinking about here ...

Jan


