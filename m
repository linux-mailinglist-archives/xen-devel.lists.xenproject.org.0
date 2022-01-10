Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34A489BC2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 16:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255379.437584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6wDY-000177-DH; Mon, 10 Jan 2022 15:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255379.437584; Mon, 10 Jan 2022 15:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6wDY-00014v-AM; Mon, 10 Jan 2022 15:04:16 +0000
Received: by outflank-mailman (input) for mailman id 255379;
 Mon, 10 Jan 2022 15:04:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6wDW-00014p-MS
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 15:04:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9247a8d0-7226-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 16:04:13 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-RWsbwLO9OxWAR1wFFEsJTA-1; Mon, 10 Jan 2022 16:04:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5470.eurprd04.prod.outlook.com (2603:10a6:803:d6::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 15:04:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 15:04:10 +0000
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
X-Inumbo-ID: 9247a8d0-7226-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641827052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pwJW5A2PA5/e8Is8ONQea3sOsE6GtuT+V0L6fhvDhw=;
	b=k0yZ/XkMr0+4nzCvPX76LEB456hjzspGLMlGXU1uoylM2hiIvDV9vbld1ISiJZkBl51Wv1
	u8yStLRJm60ZdLtDYBMTkjGpan3kgksodc4dPYfrxrMGFNn5jU7QkSMGQkvu757KDxAjMy
	+gZaX6PEHln2FT8t6CQNJYHJq18DfK4=
X-MC-Unique: RWsbwLO9OxWAR1wFFEsJTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZHH63PGfL2vv36zcpXfKYhQqW/OQvtOqzVCAkK2DG6FIL+cP3W3LtHQNV4Ygo6f/Kr4c2ZRgiwVnr5NGLYjd9aL0gFPLD2SwnFGdr6lYARTk+hMtTGRzjzY8XHI7VTodhtaRUa/ziPaMCLxROc9QRpTViI4TAVaGu7HoSq0fvdAeWUeemhDmpCNBU2FvD8ldSnWctZymYbAFbix2CU5nkLSIJOlXmfRHRbA/Fw0UOFuUe6LF1nfWgb+GGanL1MW+naevyIs0ZG+Z7MfUFEQQGSIAJCm+duXQTjmbYyZx/3K4XkQp862he0PzDF/U0mYCGxibpQ9plOPIcgTBhs5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRvEJKiEpbzRxj6z+eZ4Dd4iXqVr1P9vFd67L4GQnYM=;
 b=grDCboWQcMgwguuLYa7Nkxxmn/4MflKe/hlVHUFJATdl1TGNt0jeDgnZXRYi2uFNmflu6uwiddNyFoOuEdo8KBRuVQYYl+t/C6QAQefvWAmVWmLK23npwz4sE/w0RPHBBpawRvAJnISwDkbLm7HlO+bcNetxVq5AAebviXXR0iFs2jmmklR2SJFNvwZ0Sg/tlkciL9p2Vw8J7D7MC/X4RQ6hVagjAsFtyKQAs/bd32Uktm+wvhxVCYDye56qcHHRT5REAxINJYn4zsIlfNvQ1hKOrx+HoOsiZFwq9YFyXBH8pRWeW2R39CrHyvEHkK2ucHtDtmZtpP6kikMeFUKigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a6581a1-eb9f-adc8-479e-0389ecda00fe@suse.com>
Date: Mon, 10 Jan 2022 16:04:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <c3b5ada4-a396-719d-79e9-6cae44b949e0@suse.com>
 <YdxHXqVUpUE+AAsx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YdxHXqVUpUE+AAsx@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0008.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40887d39-57c5-4ad0-cba0-08d9d44a747f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5470:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5470DF2468A56B08AE6CEF34B3509@VI1PR04MB5470.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h+o68PYVVZSkjHGanCqiEr3pTWpKeqBCiUHlxFdywLiAnbJGWPUS8NSwBT15aeO1e0WwiPC5dKMjWxNiDPr9gFkfP2gik2wnDjDsaXl8euTtm/Dl14rqWHizdKv4w3CXAon/V+Z8am95PtGNUNixF+Xsfj1Pqk6866CqepMxe+k54Xf55bZOBo4c7pwad9tXYns+BC3D4Q/aYVXJ4eL3UXNkqZoNti32mlKoUFvc84SbuvJjXurtQx/Dy5OHwyvENwBjnMSX6CSv4KbNh4imgIa7nD63oQL/tOya727uMscGOnj/2fC9ozFK36OUpxILFcx7tDtTdp7wRxpZSWwl10ClO1hy1109KgpbyP+bzOSF/+Jqt6xmNtkedOKu2HTWtMZl2s20LCbcs842AyxW1lEgz98bKbl4ogj/Oe0KsyCp0LHXcnYrQfhQDRXsYhYI9d1V1r0D0wYROZipxNVw/yGAM0wb8U+YKo/AZud3Igf3WeIHJyG1LOMdxNaP2QlrBIMuE3FmiGKqPTsfTPlr/kCC2FImXBCi18A6IdlizCOEWLn971VsrTJL/Qc2+9bS70YtwVcl0EcaSoTmyiQUPAf5D6lITtFcLEd3McOCmNjibLmyr7vlMnQTDJ23x0fU9EQx89FTcQnPw3zSr6S4y5A0WNppa4CuMOQegI9/1jTJvTLxr6IxejzSLUm+iS62z70HErKf04N+6SNdsQSKlE60EhdY4V2xYg37lJa4tPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2906002)(6506007)(66556008)(53546011)(66476007)(31696002)(6916009)(316002)(8676002)(186003)(26005)(2616005)(5660300002)(54906003)(31686004)(6666004)(4326008)(66946007)(38100700002)(36756003)(8936002)(83380400001)(6512007)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h08TVPJd3mc3J1vdgyocL3mNBWyckj+VwdjGs9sh//vh2rKex6RIX7CkJNCJ?=
 =?us-ascii?Q?N28v/itEOTym/LKNMhp7As36tMsF/KCOWzM6e0no/K6WTEGi/7B+78kqAsrs?=
 =?us-ascii?Q?19CI5OJ7Q+saxv4Ms7J9bCCoET8jEbnCBBFRG9TnNuM/hkV9oMRvgdDdHvPL?=
 =?us-ascii?Q?Vzku9PTY0k8/3JzUbgldFuw4aqgWnIGQsjFkWOkF3xTuOQgBW9C3BdskdBi3?=
 =?us-ascii?Q?4Ys7tJ/2kD/cgfUIFxCnPexc27GGIAb9mk2HnnCEPqr6VIIxKKBHgpSQa3sd?=
 =?us-ascii?Q?Te16DnLR3Gsk6gX7haEF6QqSofDhN0q6Ox+XIbp57Y+F3PqFP2z+VxBmVxID?=
 =?us-ascii?Q?chNe6Yi8Ei8ayYSL/s84P0Kc1jV0TPMca+Xg+DN1Z+bAM7wttk4LYEB1ewHK?=
 =?us-ascii?Q?YZ1V3uTaTlF350On/rDWxDXVFNNtmVfo6ohsCFZj8dEhfGXwgq8q5R/u5Uch?=
 =?us-ascii?Q?Nnr66X/aQTGOIooZwupl5UMGjJvoeFvGwljJ1mYty5DYHSbm50gDIDl/iNEL?=
 =?us-ascii?Q?bx4mU9vOiMYCWpdMtJKCbqR0l6YH3jqO8ouuQ6KbyvIU0dQLMWCV++O+8Zcg?=
 =?us-ascii?Q?MUcqFwE5KEZLu5ZOpUIuMM6TSpHsttjDB48/NPZhbzEYKC1U3GSxaIb1lgkK?=
 =?us-ascii?Q?IwESUVZu/pQN1U8xZwNlpA9uzUq5ZgBQs6ISOBXf0g7cYObz2QDkSH8tYVVg?=
 =?us-ascii?Q?TbNQeE/oNO9TgHKoPraKON/Pr3Pn6DqLFnbLeIZuop1kd/e8hm/bxmGEdl1A?=
 =?us-ascii?Q?dTE1VcNOQ9WyN3mvZ60FrETGvXM22cJ5XOWk0ELSXlkjHhbai3sheAzyzYA+?=
 =?us-ascii?Q?b3RpveVX/YoqptsxSDlKFPZd9vdY5EjStq2gXZseJ5gkXC9t8R28RtgIC/zH?=
 =?us-ascii?Q?UMtzsH4AFyjW5v83ad6l9tBkNMrdkSRg+/GLJeYX7w5jiTyhU4hf+JcWQS7h?=
 =?us-ascii?Q?Z1Aamo8h606dQSTyUgsHbGPn1XgcRvhDUQ4QRCzePmVOZumHG7OsqsNsZ1rr?=
 =?us-ascii?Q?2/9uabMbM/TbYsCry+ANClLRlgypIRo166YFkivbL2j7X79wr9d2kpB5qq01?=
 =?us-ascii?Q?V/9CUhCM0pztt8oGs1JjqBWZpren9TyXNs/Itfz16nQ6OCeI3wjl231FgeoN?=
 =?us-ascii?Q?C1wmXpUEd8wVIbXW3bJDFnZ2f05BEd3l6WHV4I2R7OIZMdvqJTcreMoCAze5?=
 =?us-ascii?Q?ItUng4DxNR0fQqgVm7UiXDlkr+nxGt+PNn6rVr4EmKGMC+kHeGShqpjJ2/Zy?=
 =?us-ascii?Q?zdJB7GkrNaAT0KxAGPINflrQ3ehmYR2DJzJphSlnRSFjFWkulcE2Lyxe7578?=
 =?us-ascii?Q?i1KE4g8EnCkU6ZarreJi9t6xIaSpLFsB3CtpgQ1zEc0Sqn68KK/Mn3lEAjiY?=
 =?us-ascii?Q?l71bmGPbiZxzH7C6XS33G9nTIDzeE16flDrmXtbWl6EdK4xJ/J0tz2VJgdPS?=
 =?us-ascii?Q?1v8FiVKRg699qgvMhAGSM8mxwaqyvYwwdBvaj5AVFWh6KyUL3p7ZHE49te2+?=
 =?us-ascii?Q?vwWM1W5RxRlEE4OJ89XsiTIufX4gF5eO0sRCFjavEw62pNJtS/4dhhLQMjVV?=
 =?us-ascii?Q?lEhBitoQ3yTEik/8IkNKAQoNWmz9Vkx/F7S6XepEI2pvD+JfJuu66YkT8Doc?=
 =?us-ascii?Q?OQrkbaLFgwmenJpwi6qRuZM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40887d39-57c5-4ad0-cba0-08d9d44a747f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 15:04:09.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvFJQ7G1dR+KhGxOmzlAjDFW75Its8t0JwgJ+F2QxZGnZbV9pqMSJD7vG5NNfuJ2IpgvNF7cYzgGmzYa/j4TQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5470

On 10.01.2022 15:49, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jan 10, 2022 at 08:52:55AM +0100, Jan Beulich wrote:
>> On 07.01.2022 12:39, Jan Beulich wrote:
>>> --- a/xen/arch/x86/time.c
>>> +++ b/xen/arch/x86/time.c
>>> @@ -378,8 +378,9 @@ static u64 read_hpet_count(void)
>>> =20
>>>  static int64_t __init init_hpet(struct platform_timesource *pts)
>>>  {
>>> -    uint64_t hpet_rate, start;
>>> +    uint64_t hpet_rate, start, expired;
>>>      uint32_t count, target;
>>> +unsigned int i;//temp
>>> =20
>>>      if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
>>>           cpuidle_using_deep_cstate() )
>>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>>> =20
>>>      pts->frequency =3D hpet_rate;
>>> =20
>>> +for(i =3D 0; i < 16; ++i) {//temp
>>>      count =3D hpet_read32(HPET_COUNTER);
>>>      start =3D rdtsc_ordered();
>>>      target =3D count + CALIBRATE_VALUE(hpet_rate);
>>>      if ( target < count )
>>>          while ( hpet_read32(HPET_COUNTER) >=3D count )
>>>              continue;
>>> -    while ( hpet_read32(HPET_COUNTER) < target )
>>> +    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
>>>          continue;
>>
>> Unlike I first thought but matching my earlier reply, this only reduces
>> the likelihood of encountering an issue. In particular, a long-duration
>> event ahead of the final HPET read above would be covered, but ...
>>
>>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>>> +    expired =3D rdtsc_ordered() - start;
>>
>> ... such an event occurring between the final HPET read and the TSC
>> read would still be an issue. So far I've only been able to think of an
>> ugly way to further reduce likelihood for this window, but besides that
>> neither being neat nor excluding the possibility altogether, I have to
>> point out that we have the same issue in a number of other places:
>> Back-to-back reads of platform timer and TSC are assumed to happen
>> close together elsewhere as well.
>=20
> Right, sorry replied to the patch first without reading this.

No problem at all.

>> Cc-ing other x86 maintainers to see whether they have any helpful
>> thoughts ...
>=20
> I'm not sure there's much we can do, we could maybe count NMIs and
> retry if we detect an NMI has happened during calibration, but we
> can't do this for SMIs, as I don't think there's a way to get this
> information on all hardware we support. The MSR_SMI_COUNT (0x34) is
> Intel-only and requires Nehalem or later.

Yeah, no, I wouldn't want to make ourselves depend on such counting
anyway. There can always be yet another reason for long enough a
delay. The rough plan I have for further reducing the likelihood is
building on the assumption that there hopefully wouldn't be many
such events in close succession. I would read both counters perhaps
3 times, calculating (from the TSC alone) and recording the shortest
of the sequences. Then I'd continue reading both counters for as
long as the duration further shrinks (which will necessarily be a
finite process). For calculation I'd then use the tuple from the
fastest of the (4 or more) read sequences.

Thinking about it, maybe I should make this a separate patch rather
than folding that extra complexity into here (the patch intended
for staging now looks quite different anyway, partly thanks to the
fix for the issue you did point out).

Jan


