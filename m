Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A604DCB6B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291677.495236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUszU-0002WA-81; Thu, 17 Mar 2022 16:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291677.495236; Thu, 17 Mar 2022 16:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUszU-0002UI-4v; Thu, 17 Mar 2022 16:28:44 +0000
Received: by outflank-mailman (input) for mailman id 291677;
 Thu, 17 Mar 2022 16:28:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUszR-0002UC-VY
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:28:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dd8d569-a60f-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 17:28:40 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-zdCBdMrANUq41GkRspgoAA-1; Thu, 17 Mar 2022 17:28:39 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4822.eurprd04.prod.outlook.com (2603:10a6:20b:a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Thu, 17 Mar
 2022 16:28:38 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 16:28:38 +0000
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
X-Inumbo-ID: 4dd8d569-a60f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647534520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeIS3cCj74E5IhqDXde3m7dOi3ToTkToqd1QVNmiVwI=;
	b=XbbbJQP1MP3DZhij6/G/7bgIlAQSQYaOiEAzRbC3IpDmlDoPfwppT6UzYKhvsmjLZt+kuq
	WL7F2lSKs/Jj0ZIOfaTy5gaqf2ulfSb1v10qf+LK4ORJCMD3BZ6GwEpZVsVNLQDXhgGUmg
	XynUKowFQiBcrvJtk56EpzYkMJUp84M=
X-MC-Unique: zdCBdMrANUq41GkRspgoAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OO+Dv9W/WUXMynpEu+4ziQUe7yZG+eK9+9sj5rHqzLfAjPMB7fIdNeI5k8ym4IMR+G0h2W0622FYMmO29OmugUcwTmWWWVR4KQlBHoK7BqTFwk/6yt1NB0e+lGBUub33pppedjdpZip8PjhXnXgs9SD4B2Q72AdqIqVwFFcPj/IxjvmEtrgeiDURX+LtTuRlL2FenvI51L3hgHG4nSCsiqi9xjXW7UBn5BgKLEqzWEDQSWT5u4UcSGeXVyxRwKwN5Dyc59x9vIXjmeHpDLeuzD3QkAKric/N6s5QIRgiCL8Fx/OeUPKlPvN3nXMO6hiPY/ZSQ0Igx+LuLgmO/VxlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itbTXqyxuqZ9ejPmWMyfc13oyKszIbVVID102UNFa+s=;
 b=BN1tk7b+f7MxFAhe6D6Sh5DFH0odziPJhXiCCh7NNENIC5NPdto3NFy0G4/aAEDT19FiA8+Vk9bUBnt146NqHrqtrmiYQIDXd5CbeTeJ611qmnGGxHibQXueNxCxpK7qTYlyBR/cy17VeYWEi68UeWpPdQLkH2a91RCSz+nO2V9ZSUz88BydMhSiYRWLVIase7KlL5K6cUHcz05VZabaEkZA/9s/UeQ7s8DVQ3cyVk27tGHLNXCemECfAup7DYmgkmvgWvTSlqfTjGYGz4EGnRTuQUDJC3DB6bj7tlxlQTEcFcLuy/dHzOZQgoR6HdG15zrSRQQ6ZGJFaWGtyasuFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34d1acf6-5d37-6be9-cf1d-33b1fcd504bc@suse.com>
Date: Thu, 17 Mar 2022 17:28:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220315165340.32144-1-andrew.cooper3@citrix.com>
 <345b2f17-5fba-5dba-f7f5-c1634fc69a6e@suse.com>
 <101d1e70-51c7-036d-c5e2-fd382a2be7a8@citrix.com>
 <2adbd1dc-38f9-21b2-b38a-06835aa164d0@suse.com>
 <f6d2ce09-5a02-5e73-7232-5f0f79e8b39f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f6d2ce09-5a02-5e73-7232-5f0f79e8b39f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0065.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::42) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddec2623-b506-43a9-b6b3-08da083330ad
X-MS-TrafficTypeDiagnostic: AM6PR04MB4822:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4822A48E46B9A2689822FA23B3129@AM6PR04MB4822.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E3N42spw1kSvnqwpSe4eIk3EwRH/ZzGA+UhduU7MqB4fatXEswY/K4IN5TU86F9Sf2EWwRw/wvZ2K8/f91n3AsyKSExcu21Sgn3AmZn2p+C2lPLePhvi3zxb6hFIukr77Jyo8RETWutn520EbcJK3U5kZmX9sHOfoOs7pnTNnmvwHbKbnbqDuGkXR5D9yNeYKNRenGBjo6hLohZjGa2cCnRMonqbV0BPQvjhQ6C44uDfqov8hiwHxkpOhfLoScj3qITrt2Dro0hzc6bMDi690/BYRQGNxZuzW08sSRW6AXbNlO/rCEIm9fd/NOFAVZxAU3cPmSiQFB3d5PPt8mpvHAynwq/IgsxP4JZQyUSq1RpJGPGwWdUqnIsv04juIQRtcTBb4H0O9GuTE74KS8Ej+byqrAX5EaNIreLowz5MRNPnB5FVeBcS9zVuPSqqWcR2kWZnf6lSHzk/a5B9rTNpfHRwVVk5rkrQHCNHeXpwGJsCWTTMqGaYKp7Mqc+g8GmA543cU4hs6gXWc36wsy/fQM8jnTdJxyViWWWOnHZ9p9v+IdHxwVF6nCDt4X+4+Zi/lrT1gt859OcjgRo3vCnxwAKaW1zgTL1O1gi2UWfaiZgl+6KYUALTk1DD0PLVlNQpKUUy92Ro9pg4teIQBSeeyLcGe1FcUNvPY2FsTHODrqAS2Ohy6v9yIxGA7gQiMKbbBUnJbOmhN/2Hppbk0iblAfDDYWCyKcK/BTBF9ff9fmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(316002)(2906002)(36756003)(66946007)(508600001)(66476007)(6486002)(5660300002)(8936002)(38100700002)(4326008)(8676002)(31696002)(66556008)(86362001)(31686004)(6512007)(2616005)(6666004)(6506007)(83380400001)(53546011)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tey8qUuqBsc4dgfj1EWzAIcPckF6fV8WK4KhnVPLjf7ZpcBPUMg/B7p9YZbt?=
 =?us-ascii?Q?mRrh7xOA8jMPFfSiDAoKdy7E1WpJpSxo+xhReFAdFbZPy66F5rUA5ijCUzAx?=
 =?us-ascii?Q?+ia5758pe8UnZoyOJn4nHSxPVM4ClhcfTqejkDUaKlTtTltQjB4U2GnOSXsn?=
 =?us-ascii?Q?nLtSGv4SterDcL8NByB++veg2g+GUe3UNsq/QkYYtqQ/q4cOROAw2SzLYoO8?=
 =?us-ascii?Q?o45LoYUYOBKwOoVG6Orsb9RxGS7YUeUy2AqYOqyhRRrMl9C71zPV7g9R4frF?=
 =?us-ascii?Q?iqBcENY7Zw5co4w9YIcbxP4ByyRdaBv7181kwH0RhcAfMqweUB+Znf66VFjR?=
 =?us-ascii?Q?9rUD1fHPvEwoLRv4XnrL+8q3jvj9UoZgDB9HZ3o8OWgH4EVJ3GjisSQj8GeS?=
 =?us-ascii?Q?Oi/c+/ESRQq6PTLTczFzNtta6oqgsqg0g3r09rl6dEJz38o3B4JRQpbGq+B2?=
 =?us-ascii?Q?JjLAncTrGbbY2uyBdkoWJ3hvQFyYKIfL75+pXgBPxMu8BE13NtZSM6jtfXSH?=
 =?us-ascii?Q?5dGpVywDIVNWMHpCAQYx0EIV9UEvW9Gsiz9AFuSQB2nvUUWsgiHs73NdKVuc?=
 =?us-ascii?Q?Hp+vcBuvPKIARZ2WoRLGlbDhmAoCxqIC4YUtTIorx67nPjhNDwQxjMIPGdnY?=
 =?us-ascii?Q?iSHpX150RjQUeag7GRh1fivgO1VcbxyylyMm5ZzI9mUvZLLiBW4vgOJxvr2r?=
 =?us-ascii?Q?5uPzHEJIWzmOHfMC6Z+czlOHrM62hyphNb8tdHv1t3WJZo5s6G0cuaFb7nqt?=
 =?us-ascii?Q?4uz9XeuEjZJb2U/9Jd1P3myFAtUu32tQVFLb3RTbgzJ1i3rsjSCRSrDUicNr?=
 =?us-ascii?Q?t/QdqerPVMYlvWxgK0sujIL+NisMs8ShlcHUYJkyRAbZYc7O4I/j4p7XhLG0?=
 =?us-ascii?Q?XIZYA5nos9Jywhy1XQSv689gJIBxuN0wG7emStDiAgFEj36N3oQw5sMex9yn?=
 =?us-ascii?Q?4UvVB3Wc8o93Zp6/FpkLta/KUZ2jextnNdPab4LJxB6PsceKiqwaXfUlp3m3?=
 =?us-ascii?Q?DgIqLQ9gVwTbqyss6b+tpqKpZBpaWHWQF7+QG4WIQvSm1HROj2auINTtvOqe?=
 =?us-ascii?Q?9+IfqPgxnWTN75UAchvfewjOa7OaOkEeb4r7cEkWCT6+/DZ+HUAwK1zjM87s?=
 =?us-ascii?Q?yYHR9Au5u+hiSyo1AgktW8hYB1bI7vkyBUxXi5nCYCSF0smyZMUc5a21W8pC?=
 =?us-ascii?Q?Lor76YbgfH5XND/jhw8Km4XmwK5M9dRGAlFTq4icPCGrO611XqHFjEIT//C0?=
 =?us-ascii?Q?2jhtnV1/l4F9A7zRVwOt/9TgoaxnmHdbKLF0PTiTElCnxRvrHg5QWMgBMzMi?=
 =?us-ascii?Q?Ds9qA3VoZbUJPz5LF3elwVXz3KJGPJFmJrGKZRp4+gxP4vQPgatcgPGc0DSC?=
 =?us-ascii?Q?6k1cn+L94jHQB63ujC4cK9VCMN3pjstIKeKQMyuo090xargDU0t1iysjV0YJ?=
 =?us-ascii?Q?6l0NQGi06KfjiumkHQg/BKAN+/azEC9p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddec2623-b506-43a9-b6b3-08da083330ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 16:28:38.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mISgaAUNQeky0d7qWp/fU1LY60FydBuarHV3co8tnWoTiFIQfOFstFLQnOtOemJcO0RE/7HmXK9Pm75wo1zv1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4822

On 17.03.2022 17:19, Andrew Cooper wrote:
> On 17/03/2022 09:17, Jan Beulich wrote:
>> On 16.03.2022 20:23, Andrew Cooper wrote:
>>> On 16/03/2022 08:33, Jan Beulich wrote:
>>>> On 15.03.2022 17:53, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>> @@ -215,8 +215,9 @@ SECTIONS
>>>>>    } PHDR(text)
>>>>>    DECL_SECTION(.init.data) {
>>>>>  #endif
>>>>> +       . =3D ALIGN(STACK_SIZE);
>>>>> +       *(.init.bss.stack_aligned)
>>>> No real need for the ALIGN() here - it's the contributions to the
>>>> section which ought to come with proper alignment. Imo ALIGN()
>>>> should only ever be there ahead of a symbol definition, as otherwise
>>>> the symbol might not mark what it is intended to mark due to padding
>>>> which might be inserted. See also 01fe4da6243b ("x86: force suitable
>>>> alignment in sources rather than in linker script").
>>>>
>>>> Really we should consider using
>>>>
>>>>     *(SORT_BY_ALIGNMENT(.init.data .init.data.* .init.bss.*))
>>>>
>>>> While I can see your point against forcing sorting by alignment
>>>> globally, this very argument doesn't apply here (at least until
>>>> there appeared a way for the section attribute and -fdata-sections
>>>> to actually interact, such that .init.* could also become per-
>>>> function/object).
>>>>
>>>> Then again - this block of zeroes doesn't need to occupy space in
>>>> the binary.
>>> It already occupies space, because of mkelf32.
>> Hmm, yes, and not just because of mkelf32: Since we munge everything
>> in a single PT_LOAD segment in the linker script, all of .init.*
>> necessarily has space allocated.
>>
>>>>  It could very well live in a @nobits .init.bss in the
>>>> final ELF binary. But sadly the section isn't @nobits in the object
>>>> file, and with that there would need to be a way to make the linker
>>>> convert it to @nobits (and I'm unaware of such). What would work is
>>>> naming the section .bss.init.stack_aligned (or e.g.
>>>> .bss..init.stack_aligned to make it easier to separate it from
>>>> .bss.* in the linker script) - that'll make gcc mark it @nobits.
>>> Living in .bss would prevent it from being reclaimed.=C2=A0 We've got s=
everal
>>> nasty bugs from shooting holes in the Xen image, and too many special
>>> cases already.
>> I didn't suggest to put it in .bss; the suggested name was merely so
>> that gcc would mark the section @nobits and we could exclude the
>> section from what makes in into .bss in the final image independent
>> of .init.* vs .bss.* ordering in the linker script. But anyway - with
>> the above this aspect is now moot anyway.
>=20
> So can I take this as an ack with the .init typo fixed?

R-b, yes, as long as the ALIGN(STACK_SIZE) is also dropped and the
other ALIGN() is retained (the latter you did already indicate you
would do).

Jan


