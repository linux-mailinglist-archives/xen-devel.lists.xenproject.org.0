Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60CF52EA68
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 13:00:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333802.557705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0MW-0000vB-TH; Fri, 20 May 2022 11:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333802.557705; Fri, 20 May 2022 11:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0MW-0000rI-Mq; Fri, 20 May 2022 11:00:04 +0000
Received: by outflank-mailman (input) for mailman id 333802;
 Fri, 20 May 2022 11:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns0MV-0000i7-MZ
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 11:00:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff461a37-d82b-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 13:00:02 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-KC4pYEg9NF-9S-lu0lS1Qw-1; Fri, 20 May 2022 13:00:00 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2922.eurprd04.prod.outlook.com (2603:10a6:3:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 10:59:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 10:59:58 +0000
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
X-Inumbo-ID: ff461a37-d82b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653044401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFv3dkRCmDgbv3vPr0emUEmHt833Gm/SkUyB9U7gUVM=;
	b=KkxwdwsMQpdB6Qjb87N/CdPtWcG4gOLT0Vysh+LkmGm30tKHV+dfZtL3krWDpiQuFbQBrZ
	3PnuiDit3avSSkAhwnV0cisgWwoprHtdoFEn0jAsKGopvhEEqEpKC+TExKdoxyt48+muz3
	MjN9yMJb6/dkXN/5zc68PB4wdvbupeE=
X-MC-Unique: KC4pYEg9NF-9S-lu0lS1Qw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYcAUJOHRD+vE39qysGMJufUqohn1KgPzFLGmYk47Kwn7LyF4vfRl2iveMthjonFHycUmfPv6PXBCF6oCp++ADwmAJ9RHcbW/EJIAxqThhBPdOrtyrS+U5kbp3+P++Ksc46nwAiGAA8X6wFk/8oCxCCVMWgb4PvvC3mxncEI8FdP9hvWZF39hFvAqTIjlLNS02D8AIc82BllMp34wWiizgljPAdbwvrKvRfl1f6NJ4CLi9KzVF35To33QCJR3Xvux0jEeczbRllynjhBnF9Ict9jzzDH2gJJpbd8UYO9oYx6RQQUvUPjUiMtTRBA2PHw0kUp+ELKb63BUvl5F8dQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBPen8ehI1NWnb+H18VZAfUdshQa698HDFzQAHBLScM=;
 b=WZAr3qvccuzT8WrkCN/iRoTtXxcC9oGg+qduZ/U3X/BvITaMY1sf4w3RcVODvEtzq6MO00ovFVk9sEpZ85lH3bFRbeawb5yBY8qSiK7Dr5sQiZQSLnpog2f1dbXUVGwCOJAIWebUuZE4bLO3bcbLmHQHH1646/SgwF4NSDKvW0F+Wqc7UKYJ9DDVi5oGIqKFj/9yqqU09vrD/JaH8yjkuEMVKqGfdGh2g9QZftfB0rmsu7bwLo82t4vk5Ns+vfYdTTc0xo+kLG9DjcEx7Z6ioI2kt9j8L7LcVjFK2ZHuRxOsCz1Zczei1LK6a6zSux/vQSAzL+CxW3q7HI9UzNn8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b35a82b4-36ef-6337-fb6b-a0ebb6c68841@suse.com>
Date: Fri, 20 May 2022 12:59:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 14/21] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <fedf7224-8023-275a-843c-1a5753c20ded@suse.com>
 <YnUh4ZbDMZZdCw9w@Air-de-Roger>
 <80487976-5d72-5388-139c-422210bca73b@suse.com>
 <Yodr+fnu2AxmNdO/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yodr+fnu2AxmNdO/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0028.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc5b9e64-fdbe-4e94-223b-08da3a4fe0fd
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2922:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB292292E628A646606D9B0D54B3D39@HE1PR0402MB2922.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZgQYree/D5ndPIYI2LWfvLL7XA4k7c6eYH8f0EkFSRm9Yp8cdTPIxF2dJpFRl1gCFa1Ufy3VZU+l/TkRRC93jEArnGlmtrCTL34zfeytn0/ySNRNVJx0eRikOoV8uuAMyB4bLl4u0mlAwX0iNTetlc3dSc0Pxek+0Q7XG7SDZkbgnEd13qgaJaNFLOHpeIMfCowtD+TfEd+8a6TWbtDqen0RDt23BzwBh5l+ud4nhKRBhjWocDl042kTjkTPzQNKFiSgZYDFMuMtw8ZlVnsstzMC3D/6nCehFyT/r5HjwN6X7yZGwMSSX2Ebec1usHmu4q948qEM+nnCcY81FAuokerQztr27lKjAUuCguShYajKUkJD516jZxC+1qJHJ3O/HiawzTTG1LfGsnyAGVtNgdEZhHF0P0ZLHyz4dnT/afygSSJ1d8+Rn7XsgzcbW+eu3WeeTNeYrBWRgymvZKMjtzES96gF3W6xkxVwkXJYx/UQwM4q9GFGELd1e4DXeE9jN0Xb740jRirZf+M7K6AsNWn6brLsNRDm26XLKQjD5VEFGXNDQS/aCez/6s7JNZMP69fCmbmwic4UVqRmjJ4e7qEqJQKI83TclEanlnHQRaQ82WY5mbmIn5bp6HPN36BaUYYmp430rg7Xnn2hcXNn3EpkhUrxKaNRRAQgFwSR7dTr3AL49ILRM04hCh54r9TsKU+Sm767URtGtUGSmb6rYc7N8gw6aiTqo1oA9QBLtdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(4326008)(2906002)(5660300002)(66556008)(66476007)(8676002)(83380400001)(316002)(6916009)(54906003)(36756003)(66946007)(31686004)(6506007)(6666004)(6512007)(53546011)(26005)(6486002)(186003)(508600001)(2616005)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B6L6PHMd7uFSDEVkQ/rMWVCDxy2aCr4j/QDcBK1TWdt0ZC1GWkvTOomFYvqE?=
 =?us-ascii?Q?3s7XUtJWBXd58mj1C6+7FhFxX5IbTTKu5orMjgFaKR2kvOFyJ3jsgtupFbJL?=
 =?us-ascii?Q?1kKI00pFIjvYH3ENN+x6YLk7Ki70c8SRyqzWwKPC0S02VRC1b8/mde+br72d?=
 =?us-ascii?Q?SGubcWNn5rQ1GR81ijJtREbyKMcNX1TrQb4oY9ngOkLnf7Df1yWVwoN9AkkQ?=
 =?us-ascii?Q?bSKfEp4rdSYU/+Y2/suDXf6QcPv33wNdGj+JDYjNCFACvQG9wlEt1YFqzWSW?=
 =?us-ascii?Q?MYTbgT2oXpDRQM9Sja5TJ/lG5Hf3MjWRcVbzht4Yr55qIgagcX6C7uBe7t1Y?=
 =?us-ascii?Q?x9xI6A11PHLCYNfccDiKFFQE8Rtxa9TkJStsqFxjTCpSCBzChRCIn02AwugW?=
 =?us-ascii?Q?DiOiGCP1QFsxoXQ8B0QAX8DCWvDqAUI676bRlHeSH9+7+zsF27ty/v67QbOi?=
 =?us-ascii?Q?Ob47Nlf6ErGR+iQBB71EgIeIJDi6PqTQAOkiEAU/zpWJlqhDEp/urRMJ+Lrj?=
 =?us-ascii?Q?lDKxWAW9I9LFt+Vz/TKi/WJ+kQA/HLY6omWoWETYGE7RHkilENU8EBxXXdIo?=
 =?us-ascii?Q?44TfkOYGo2yaLguXPqlXiE5UcLoBHW+vK7gwRHvQpQHpoq9Cs5ud1KDz9Q09?=
 =?us-ascii?Q?QZGn+BH88O6tGlII0D/idhK/VlhfKosVOXqBOn50bpMAbKVQE5qgGolDgDKC?=
 =?us-ascii?Q?2Ame7u7chnUQ/apQCFtGxruxnqngesc8R1NYIujYDgEvnda0GrW1r7cgZviz?=
 =?us-ascii?Q?6fEIUIToDJ/UOo0szhOKb/P6H/wq5tPgaFRf2MTLQd25brqLHGuBFwW7TFuK?=
 =?us-ascii?Q?2mgqPeHtQ9YO8+PKy+Z3++AnllKHEO7iHviSCUyROGy6N7bTDOEiHAh+dBdB?=
 =?us-ascii?Q?AuKNIXupyYx/aMisOjN0N/fwXUqjZqZcpBaKEl3ftbOMhUkDpUfs/sakMxeY?=
 =?us-ascii?Q?1uNlWgemZCYIxeR6BYqu+uxNlV3UZFttnH4MrX1hfycJlxouKnbM4CuXb9q3?=
 =?us-ascii?Q?7tXN56WR1gjMwFJUlhq/GZUkn/gRCtsjJzxmANjuZz6FfzEB+pWeqiCsEK9N?=
 =?us-ascii?Q?8BEZRYtsU7oSVshNZ604UeUxFgcwfWF2GxHsTzRA0poQ2xyi6Keavxubk3WC?=
 =?us-ascii?Q?vRvEWxfIwS0Wroz0yIr5aYPtyoVe8suXDXhAN1NqqYpp1agaHkv9EtM8VA2f?=
 =?us-ascii?Q?bNYiFfL04cx9lVTIL2S5MTvfdgOQXgAyqBm5sRVg1oUXbNs5OBqomJyRQru6?=
 =?us-ascii?Q?AKq4HEJg1V6hQ33MWuc79R8q4/Uvwrtca1DITq2lyO4jUv3Y36ZSRHU7LmII?=
 =?us-ascii?Q?M+uhSa0RNJxp3eYBOIxkvLV7URd3iynj64z+tzaOtTHDEq1fxaQJ5qmnQls8?=
 =?us-ascii?Q?eJn+tEX8msCVdTa7hGTf/FCGHGd0r6MkjYpXyBOoGNGw3wDBkHjSulNQVbH8?=
 =?us-ascii?Q?9D7GakWjScrLP/CFBBDXmix2ijurxMjPQLBd7KqRRe323f20RVe0Y4ImN2UM?=
 =?us-ascii?Q?IdU++lOs7a1VQd6k8RQIEbZ64GVQPTi8UPQIXx7rS2LbEdFwm6x9sGdHrTva?=
 =?us-ascii?Q?uOW9pfpyIBqtdM56tZbGgDl5RDjaRtkpMLHK82kTUHVPULSNDelyiisnNpQU?=
 =?us-ascii?Q?JJr+53Lbm0aRj02KqQlQndOgfZORsc8PtaQQ1jvJGc1JQI7zu//JiHz3zd4Z?=
 =?us-ascii?Q?KLmaSflMV9U0SNUbJ8qhW1+/upUZVHMYuFYf39lIiQ4cabffvPh/M/c4vK20?=
 =?us-ascii?Q?oFlYL5B6jg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5b9e64-fdbe-4e94-223b-08da3a4fe0fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:59:57.9422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDnn/Apvcw0tfRXD9+IxsxW7B+iz6LLS7aY1bk/8Ohv3F8S+Q6DjPtJzAg2E+LwRTdypwkyTiomT8evOuDRz/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2922

On 20.05.2022 12:22, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 18, 2022 at 12:06:29PM +0200, Jan Beulich wrote:
>> On 06.05.2022 15:25, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Apr 25, 2022 at 10:41:23AM +0200, Jan Beulich wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
>>>> @@ -0,0 +1,105 @@
>>>> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
>>>> +#define __ASM_X86_PT_CONTIG_MARKERS_H
>>>> +
>>>> +/*
>>>> + * Short of having function templates in C, the function defined belo=
w is
>>>> + * intended to be used by multiple parties interested in recording th=
e
>>>> + * degree of contiguity in mappings by a single page table.
>>>> + *
>>>> + * Scheme: Every entry records the order of contiguous successive ent=
ries,
>>>> + * up to the maximum order covered by that entry (which is the number=
 of
>>>> + * clear low bits in its index, with entry 0 being the exception usin=
g
>>>> + * the base-2 logarithm of the number of entries in a single page tab=
le).
>>>> + * While a few entries need touching upon update, knowing whether the
>>>> + * table is fully contiguous (and can hence be replaced by a higher l=
evel
>>>> + * leaf entry) is then possible by simply looking at entry 0's marker=
.
>>>> + *
>>>> + * Prereqs:
>>>> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
>>>> + *   contiguous bits (ignored by hardware), before including this fil=
e,
>>>> + * - page tables to be passed here need to be initialized with correc=
t
>>>> + *   markers.
>>>
>>> Not sure it's very relevant, but might we worth adding that:
>>>
>>> - Null entries must have the PTE zeroed except for the CONTIG_MASK
>>>   region in order to be considered as inactive.
>>
>> NP, I've added an item along these lines.
>>
>>>> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
>>>> +                                     unsigned int level, enum PTE_kin=
d kind)
>>>> +{
>>>> +    unsigned int b, i =3D idx;
>>>> +    unsigned int shift =3D (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SH=
IFT;
>>>> +
>>>> +    ASSERT(idx < CONTIG_NR);
>>>> +    ASSERT(!(pt[idx] & CONTIG_MASK));
>>>> +
>>>> +    /* Step 1: Reduce markers in lower numbered entries. */
>>>> +    while ( i )
>>>> +    {
>>>> +        b =3D find_first_set_bit(i);
>>>> +        i &=3D ~(1U << b);
>>>> +        if ( GET_MARKER(pt[i]) > b )
>>>> +            SET_MARKER(pt[i], b);
>>>
>>> Can't you exit early when you find an entry that already has the
>>> to-be-set contiguous marker <=3D b, as lower numbered entries will then
>>> also be <=3D b'?
>>>
>>> Ie:
>>>
>>> if ( GET_MARKER(pt[i]) <=3D b )
>>>     break;
>>> else
>>>     SET_MARKER(pt[i], b);
>>
>> Almost - I think it would need to be=20
>>
>>         if ( GET_MARKER(pt[i]) < b )
>>             break;
>>         if ( GET_MARKER(pt[i]) > b )
>>             SET_MARKER(pt[i], b);
>=20
> I guess I'm slightly confused, but if marker at i is <=3D b, then all
> following markers will also be <=3D, and hence could be skipped?

Your use of "following" is ambiguous here, because the iteration
moves downwards as far as PTEs inspected are concerned (and it's
b which grows from one iteration to the next). But yes, I think I
agree now that ...

> Not sure why we need to keep iterating if GET_MARKER(pt[i]) =3D=3D b.

... this isn't needed. At which point ...

> FWIW, you could even do:
>=20
> if ( GET_MARKER(pt[i]) <=3D b )
>     break;
> SET_MARKER(pt[i], b);
>=20
> Which would keep the conditionals to 1 like it currently is.
>=20
>>
>> or, accepting redundant updates,=20
>>
>>         if ( GET_MARKER(pt[i]) < b )
>>             break;
>>         SET_MARKER(pt[i], b);
>>
>> . Neither the redundant updates nor the extra (easily mis-predicted)
>> conditional looked very appealing to me, but I guess I could change
>> this if you are convinced that's better than continuing a loop with
>> at most 9 (typically less) iterations.
>=20
> Well, I think I at least partly understood the logic.  Not sure
> whether it's worth adding the conditional or just assuming that
> continuing the loop is going to be cheaper.  Might be worth adding a
> comment that we choose to explicitly not add an extra conditional to
> check for early exit, because we assume that to be more expensive than
> just continuing.

... this resolves without further action.

Jan


