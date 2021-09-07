Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61410402AA3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181115.328125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbyM-0006NN-6g; Tue, 07 Sep 2021 14:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181115.328125; Tue, 07 Sep 2021 14:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbyM-0006LR-3A; Tue, 07 Sep 2021 14:21:14 +0000
Received: by outflank-mailman (input) for mailman id 181115;
 Tue, 07 Sep 2021 14:21:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNbyK-0006LD-Mt
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:21:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d977dc7a-0fe6-11ec-b0fa-12813bfff9fa;
 Tue, 07 Sep 2021 14:21:11 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-o8JIptTZNTWFw-2IS7wz3Q-1; Tue, 07 Sep 2021 16:21:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 14:21:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 14:21:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 14:21:07 +0000
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
X-Inumbo-ID: d977dc7a-0fe6-11ec-b0fa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631024470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6mkUxjwYk+rRPjoLLQldea3GJY3g6bYT4edMm8ZTHk=;
	b=HmEthlFO9fAqdmLBBWlIMEgUJ0OvYjVpC9SGryDq9eDLbY8Fbyps8YnWgaTqDUl6D6Hbw8
	ygBmnkCo5JpcFc0k9odQHpd5v+POmcs7XObWC5yms+CJ7PgeddipeajHs/fzs4SP9tWCtn
	OAsTVNVf5ZRg19QR3wn+QxyfGLzJYnQ=
X-MC-Unique: o8JIptTZNTWFw-2IS7wz3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv87STg/suGEq/VSd+mw1aoRMgB1MsR7j8xQf/aEsaa4wkVX+Tu6E3+aS+1qzEop+F5OijtmNGu+DyMABjdctWjpzS4hZ7go5JqhQKzIYJbcOScHxf0hsUsrLOpQtVEEw9HDnukPQ9ODyicHxEU7ZKJGjT4lkivFUm1YS9Ixtlr/jMZpGd4U/7cUw+HOjHZ+k16l8BGb2ix40IfRXWRlMAS2V+NzK8oSrJOg9icHKIWoe8+6pxIOdyFlY4Z9L2E5i7RWqmESOzua+naTGX6k1JCEEc/sZNUzm5l2Zy/PGKOrPsU9qElIEXFqSQbp1AOwrSvwa8idA7o2mBuCcJswPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5P2vnTU15/bPw9O+/l2UDZyNPfbD2qOdV5IDyfmhzB0=;
 b=RXaLOf249NjrhE4i9FmD1QcV7EpsN/iFl+wgTEA52wFwQu9nrPqHpkwFvstUs5UgDVKI6DDmScHemMEhPyepcM5IGbPnJkQvlAw+q5k8H/XQXr3ja8QZWk557sFGsisgbQsfPG3505MhYVjx04NXOvlXKk3Ybpst+ACDhvpUfWyimEc6/xFW+qcvGYPGf858JNz93MAIGtY+2aRzV8r/i7Gcnn6yxNEl0uYtgTWZuaFKt1O2RLO/P26E8YUDpgOf0EYVfuMCqIFSFwtumguYzgazuixGSf9uRthVYpgz/bpzk+ary/QwX3n7fmrlDyTSY3wMuiwdtKnd0POH8D5RZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1 2/2] x86/cpuid: Detect null segment behaviour on Zen2
 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Pu Wen <puwen@hygon.cn>,
 Andy Lutomirski <luto@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jane Malalane <jane.malalane@citrix.com>
References: <cover.1630929059.git.jane.malalane@citrix.com>
 <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
 <26b88d5a-ae6f-0065-7c3f-5eeb6dd80078@suse.com>
 <2972c71a-5fed-0813-8ec0-d179eacff14d@citrix.com>
 <70f376c6-eef2-42ce-a8eb-67c1130a41e4@suse.com>
 <dcdce06f-4a19-49c7-2225-a8e38d524dd8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1076b12b-dbbd-f1cc-4d78-511122f02b99@suse.com>
Date: Tue, 7 Sep 2021 16:21:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <dcdce06f-4a19-49c7-2225-a8e38d524dd8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f31afb-8ae4-439e-2067-08d9720abbf2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5600466A1464C880FED76934B3D39@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kNEg1fcaAdxyWoNstaE4kHU27kb2AgLmx7yQFVOgj2Eqdxfck4ZgC9bpzpq42dACwkWohwzJcSj5InGc0nV0KOSXZHTp5FY3wnoeeDfJDkkteNrgLaDefMIvyaVuU2RSYX35FCQJk6UmpP6rzWZzas0I05AFpHGbP4zaulN8wIRE3vSM3wV2UNd0Ue2VHU1I3hh+uBRjJPfFAs9dP/udjviLvGtfqSeh4jr6z5nubbvOKMdi1TW7f/BQUJLXX8Ds4EGB627M9n4J0uX+KWObyZOUgxtiT8ohnqLcz3m5gsmVgPlKEYIFFvzmoIIqhzWOlrsAl2VKeXbO1XWtaKvFSS4dv6lXIBXCPva/FVJzOP7QUVuo11lZyUhsAwAOJRS4fkEvf/ur4Cb1He0H0bkmf6Svcnoi6ZxRYfXdHuRwbb2XKRjgrTPP80T1lWHXmiJ+JS20jDI5607DuasTbwyfWOGc8vmo8tECdZcK/oObe8S+lu0ixvelF4GqPf8qVCz/Ky+nml7XjJf2V2+jOOM3kw4N3HWYX1GgHUbGunrN/Ks2M4ZUp33tqX5gmWrp1i0C17/ZPrcayuinjDdxGAr4JForMTBonTQbY/TzdGaTIYjz2ZFANBQlhEBc7tml5BVCElhYhF/GSrsiv+QEj2JtSU2vjJfoZAIg/VZg4gLpI4IzfWUVQ4mNDMWIdObk0fKv/WZg/IexEF0XkniDsOxAfA0YiuPOz2hC3Q6vLmX52u/xiv+xZ4Mzy1Qn9c7XsAPU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(54906003)(316002)(8936002)(2616005)(16576012)(4326008)(53546011)(86362001)(66476007)(38100700002)(66556008)(31686004)(5660300002)(66946007)(26005)(6486002)(6916009)(186003)(8676002)(31696002)(83380400001)(36756003)(508600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lt0+ED7xobip3EtLHRqaIHZvtFbkefATb5/TGfMrNgTeFIRYj2nVY71y93qn?=
 =?us-ascii?Q?f9uS6LL5+N5d1GK624li3mhv7qGKt6ddb9IwEtSsyRfxVVtSZ37qcRuacRVB?=
 =?us-ascii?Q?eldBc4LMazq1+j8CQ5+puuiJ20awtHn7TqDV+ZFvTw6LFQA19Adj54TVPp3j?=
 =?us-ascii?Q?o+21J5Q61EqEs7n0Y4+UvrLCGLwq9JIcduJp8Sd1ujCoBr1wA9gBRWvx/B26?=
 =?us-ascii?Q?1hoOe/V9fsAF3wR5N40hyZCNA9laijSNejYTziME34/nyJSAsDNtAhjhKXfZ?=
 =?us-ascii?Q?ILtLp8L7XWnFXkRATy9bNmn7YCVcKCj0e7pyGWeQKk7TmwhntUBEGth9jRgx?=
 =?us-ascii?Q?H+CZWjx1GLjIibGAcc2W61p3j+MvO0a6JrvtbRyE4KMzbKoQHnxfS68cLF85?=
 =?us-ascii?Q?oODc++IckvK5A/pYxjjKWrDLrdczkJMz2jjWhibGWUbDXjAcaBytgT3kFZ8c?=
 =?us-ascii?Q?o0LVNeYLdVfeslqf6NXnh0ph7XOc/kO4GB7iZLvoE/l+ZScXhMUj3BtZ882u?=
 =?us-ascii?Q?DDg+UH31RVVg9yDvh+aO93ChtoTsmHN32NvIyOMls4rlS1F0oSlikNyenV5H?=
 =?us-ascii?Q?+1GvlMacXMcJIPjw9f6fRKaG7hQTC9Y7s0lahOqhHhd7yU+Ih7xuORB9voxh?=
 =?us-ascii?Q?MB6nzziUvlSNPNTK+AMCOGKL2ZB2hrKW0NR9uMUhkJerJxgQ6eTLJ3FjcWxK?=
 =?us-ascii?Q?pKiICT/urkeZAFY7s/NMMNMZEaNhug3RYN4oGffF9aFlu0ljFsDowfKSIl5p?=
 =?us-ascii?Q?huaPpfR1baiwTRtqTRjrfb83AbNxSqUPzV0iox7HaLTbHBMBWw1Y72E/pZUZ?=
 =?us-ascii?Q?6LigD56qdWDl78+UzDYTpJaMgqIkQAuodH49bCxFkeY01kc0r71bIcszGfit?=
 =?us-ascii?Q?7/GU3CeDNE/r1Okegwvf0wgDZ512IpCnWKmaYuVt7jCIFdpMHQT3uxdYXhGF?=
 =?us-ascii?Q?eCAJT8iXL07Wco1L9k8v1h+3QxHHoeyc58b6HiVsaotLr6KsKKGYJsGUQAvn?=
 =?us-ascii?Q?7L3m8oicMTlM21EuxY+JFm2GDGCmjj5oKu9lRUotD0l/YXWx1JbHQBNP9ed8?=
 =?us-ascii?Q?UR+cMTx72Ad2VVI1e4K48b/FxI72HETo6zn+yyFfXJbsT5Dr0yDrvasCGLb6?=
 =?us-ascii?Q?qdINQh9wvjSY96mtaATe0cYPtIn08GEcvyLMGlBoRCq274fOijDh7O/n1565?=
 =?us-ascii?Q?AWJMs3tX3ZHU02iu9RGvzvRexBHojKOQryQmkX3KDmj1Nkfg7MUXj8nWzbpA?=
 =?us-ascii?Q?ZM3B5SHU74KtCzc0jSqUDZTgRCoiwOAmltreFWaPIkrtfngYp8npD7+lqRbC?=
 =?us-ascii?Q?uSwDGr7Td8u2zkuBWyioeIhI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f31afb-8ae4-439e-2067-08d9720abbf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 14:21:07.9731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKQZTtM7zK6vRRgi0XH7IYsVJkmeDsz94TFoej2/yp2//XooVP4YoClJhYQ3p3uEKY3RQi08oCDohgzoSopQ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 07.09.2021 15:27, Andrew Cooper wrote:
> On 07/09/2021 07:09, Jan Beulich wrote:
>> On 06.09.2021 20:07, Andrew Cooper wrote:
>>> On 06/09/2021 16:17, Jan Beulich wrote:
>>>> On 06.09.2021 14:00, Jane Malalane wrote:
>>>>> --- a/xen/arch/x86/cpu/amd.c
>>>>> +++ b/xen/arch/x86/cpu/amd.c
>>>>> @@ -681,6 +681,19 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
>>>>>  			  c->x86_capability);
>>>>>  }
>>>>> =20
>>>>> +void detect_zen2_null_seg_behaviour(void)
>>>> This can in principle be marked __init.
>>>>
>>>>> +{
>>>>> +	uint64_t base;
>>>>> +
>>>>> +	wrmsrl(MSR_FS_BASE, 1);
>>>>> +	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
>>>> While I don't strictly mind the "m" part of the constraint to remain
>>>> there (in the hope for compilers actually to support this), iirc it's
>>>> not useful to have when the value is a constant: Last time I checked,
>>>> the compiler would not instantiate an anonymous (stack) variable to
>>>> fulfill this constraint (as can be seen when dropping the "r" part of
>>>> the constraint).
>>> This is "rm" because it is what we use elsewhere in Xen for selectors,
>>> and because it is the correct constraints based on the legal instructio=
n
>>> encodings.
>> grep-ing for "%%[defgs]s" reveals:
>>
>> efi_arch_post_exit_boot(), svm_ctxt_switch_to(),
>=20
> These are writing multiple selectors in one go, and a register
> constraint is the only sane option.
>=20
>> and do_set_segment_base() all use just "r".
>=20
> I had missed this one.
>=20
>>  This grep has not produced
>> any use of "rm". What are you talking about?
>=20
> TRY_LOAD_SEG(), pv_emul_read_descriptor() for both lar and lsl,
> do_double_fault() for another lsl, lldt(), ltr().

TRY_LOAD_SEG() and pv_emul_read_descriptor() don't pass constants
as asm() argument values. do_double_fault()'s use of lsl is indeed
an example matching the pattern here. lldt() and ltr() are generic
inline helpers, so validly allow for both because they should not
make assumptions on what the caller passes. Plus "m" there is okay,
because if the caller passes a constant there will be a named
variable (the function parameter), i.e. the compiler does not need
to instantiate any anonymous one.

> So ok - not everything, but most.
>=20
>>
>>> If you want to work around what you perceive to be bugs in compilers
>>> then submit a independent change yourself.
>> I don't perceive this as a bug; perhaps a desirable feature. I also
>> did start my response with "While I don't strictly mind the "m"
>> part ..." - was this not careful enough to indicate I'm not going
>> to insist on the change, but I'd prefer it to be made?
>=20
> No, because a maintainer saying "I'd prefer this to be changed" is still
> an instruction to the submitter to make the change.

It was a request to _consider_ dropping the m part, yes. But (see
below) now that you've forced me to re-check (I presume you didn't
check yourself, or else I would expect you would have drawn the same
conclusion as I did), I actually feel stronger about this needing
adjustment.

> But the request is inappropriate.=C2=A0 "Last time I checked, the compile=
r
> would" presumably means you've checked GCC and not Clang, and therefore
> any conclusions about the behaviour are incomplete.

Not really, no. IIRC I did check the version of clang that I have easy
access to. (For gcc I've just now re-checked with 10.x and 11.x.)

> Unless there is a real concrete compiler bug to work around, "rm" is the
> appropriate constraint to use, all other things being equal.=C2=A0 If the
> complier is merely doing something dumb with the flexibility it has been
> permitted, then fix the compiler and the problem will resolve itself the
> proper way.

I disagree. When an asm() constraint permits multiple kinds of values,
dropping one or more of the alternatives should IMO still yield valid
(perhaps sub-optimal) code (IOW every one of the supplied kinds should
be valid). The issue here is that it is not spelled out clearly
whether something like "m" (0) is actually legal. The error messages,
however, suggest this is intended to be illegal: gcc says "memory
input ... is not directly addressable", whereas clang says "invalid
lvalue in asm input for constraint 'm'".

IOW I do think the one case of LSL in do_double_fault() does need
adjusting.

Jan


