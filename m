Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E644096C4
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 17:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185761.334484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnYw-000660-5q; Mon, 13 Sep 2021 15:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185761.334484; Mon, 13 Sep 2021 15:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnYw-000635-1e; Mon, 13 Sep 2021 15:08:02 +0000
Received: by outflank-mailman (input) for mailman id 185761;
 Mon, 13 Sep 2021 15:08:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPnYu-00062z-Hd
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 15:08:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61acc80a-14a4-11ec-b3b9-12813bfff9fa;
 Mon, 13 Sep 2021 15:07:59 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-4MxS4ACeOqKJmFRT-yI_rg-1; Mon, 13 Sep 2021 17:07:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 15:07:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 15:07:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 15:07:55 +0000
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
X-Inumbo-ID: 61acc80a-14a4-11ec-b3b9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631545678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvBaG6x2aZGACj1zGyUtNmCWIdmB40LsCt+NsRj9sVw=;
	b=iq59B2fBGX+VHrb5g1RabLxrQVs3Pm4raJh3NXJRX/UIymmoO7L89XoRHXhtp3nXbcNH6+
	Ua2LRhqmuPuhlbDVubUT3iP6TXaQwC1GIpZPB2z1aYK+Y+2XGlG0wHltOT5ZwiRqUPqXSr
	OKDkN2Y4IJ6ag6I66KtnHP2+EjxXwPQ=
X-MC-Unique: 4MxS4ACeOqKJmFRT-yI_rg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwqD6sgUMvO8BMjIuSiaYlECZAM1S+it9IzMCfVfLQPkYo8pr13ZI1UVT6g2Mnb2BcdgBbiFkSM4WI9oRxcJgr4kqGIH923WlSFNJs2RG9w0SgGaIUi+OGfTCqFpdYVk2HsJQ4RVTcRqYcCO/AyDl8tYxB/YeY82DObx0+bFFsoEo/dZid8OqT+bn25mQJB2oOPdxF7yGTtWawBXoFAbEEl2aKOVxwUt1eX9FIwNlRWI1u5vUVq4vdL8HmOUwXyYXUvgBm8dNZFchQ2cbMmFyeQjg9WDNojMyx1Zr/QYRG4us9RBcQnHVOiifoWDOIiGvv/lhWVai3NAHpB6Jwo8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tDe0mJCFga/oCmqWClD56ZdtWxHgiXlSThWmhIwVMYQ=;
 b=BOGGsbuorCQq5WJKWUOu9h03qFGhft+vpMIyV4j1KU6sHi8Mmm5+wl9KO3DMCliLPmjLRfcZDdCi51ztDtQJ8Zz2+zQJpfTJtEfjN/ZVzlsvyF8cwNRp4xd/WTkdfulUbYa4ugWYZspqslm4bUSEjbvbiKoq0Xfe/6SSMFQqKpza6hTg7KwajAxqpJgGhCwVpfOryGHDHT/WaaFOfWbJKHsmfwEd//fJgxjPLOmdLx07wl7O7lqOE1iyTCAnJBujy8BaEJuEp/79OQyokXFzRFXGAKmU6JdTVZwcas2/iR3N+C94n1OHQeA0eaXQK0x16WL1Xu1DhkW71EsUKA5F1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86: conditionalize workaround for build issue with GNU
 ld 2.37
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4efe38f8-16a7-ad66-04dd-d55aadd57166@suse.com>
 <YT9UADtkz00JJkuB@MacBook-Air-de-Roger.local>
 <7c97de87-9687-a088-406b-33faf037244a@suse.com>
 <YT9hHPpt+SRU/Cv0@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c8ddad3-e01f-06b0-1544-cffb477641b5@suse.com>
Date: Mon, 13 Sep 2021 17:07:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YT9hHPpt+SRU/Cv0@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa81cb86-25b9-457d-a77c-08d976c843fd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24460D319A6EBEDE40EFDE89B3D99@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ez5bliPYkNYLPwjPBsTBjDWrjkQ+HNMM3kigdHXsKObWHGbV9iS6iO8pHMNjiamXFXVhDEGtXcPfjTDYtB6L3T1qzFxLKYkIlsRdqpqFeTzOxdMZQ4/GEn+b7DwTLLu01YyGZ7PBj0iGHqN1UUy3/usu3HSEBRdKqeszuMqprNfDOzDFVent7W4EAH3NajZGse6wb/zt/c+cQwTdQcMGWxB3NTm4qIyUxPvBXMNDy7/bb9fbkdpQE9fILL0Xx59LU9EFJ1/H7DYbxQjiCNmX2nFxXk+XGkrz8kyRFEbiGdql9VZdsxoaxWyRJOj7PhurBurCOy1VdzmDPkI3YEW3Ng43iel9g+dXmJBSjO4hWghRKKAhvYurHpi7+LufUj8xw/C0l7uRTQr7QiNnpolFW3jPFjvHLPtF6leathzA2l1ggR/rmHqTtR/bI5PDQbhSG+grUJ2k3ppxhSimJb9SE/I/tHqNGLsYCeTqhcSHHAEV1I62NPHC7X6bUB22Tq8ZYski9nez7fOKcvkZFuMBaq16uqwyRy7pZXXWrG+rrZ+cxsT8BXY/DXu/pLjTQayltFs16R24gLNinBLp8e5IipeE6aLVHLR3hFO2iVJhJ27ZtFh7e2HJ4G7wKfQxa2J5Al0chcJcARKlcPwGh4qRyPQDugMo9SC/aRv1ZWpXHlP2GL/AzpQ1TcsXVC+YDuB4pXP8DPXUAzdb/ZL0OtexU+3Xhp93wpvGWQ9hZOHLLLaFjsjl2Z+PkrWC0TzspjhG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(39860400002)(136003)(396003)(16576012)(8936002)(26005)(186003)(66946007)(53546011)(316002)(6916009)(38100700002)(36756003)(54906003)(66556008)(66476007)(2616005)(8676002)(31686004)(2906002)(5660300002)(83380400001)(31696002)(86362001)(6486002)(4326008)(478600001)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JDWOMlMPFQZPwGF7fWJ7yiKnXUnZe/8ZoRfpr2DLm81Tf3yh5SRLJjlifZ1T?=
 =?us-ascii?Q?2zvlIwEMNNBGMY/5p1donJJFuIr2bXdMddcc7FbFTPQEcH8wZ7KQ7+nxaYKD?=
 =?us-ascii?Q?8R5NvxmjeLq1yKbpi3mlR3DzsR/OgBWMbJYrX1Ucxn9v9vlcRcVU2meF5UXc?=
 =?us-ascii?Q?0edFG3bEZPhoQGvN1vR1y8V9fDtVxs5RKcWicAX4ntIndzbxtDikPMrUPy1m?=
 =?us-ascii?Q?czBysaTk8rQXnZm5OiC6BGxwLzFsRSnTF0Fzx921ukEVlGF34zTKFF+IvIz2?=
 =?us-ascii?Q?9XSirnMAa18VZr23MlKODIWNvwcOvi0H3m+yybjMbqkK8mTO/wCMTy/HMuEw?=
 =?us-ascii?Q?TQ4+DPEfpc230M5SI9YV+F5Xnymix1MyRrrOf1PtJH/mKKt4SpvfTYVggGg8?=
 =?us-ascii?Q?2fJ5kwugJ15lcKXzK9f5Xwdz/d7dqnpLWcB5p7lPJaBL8z7/HMvGbwqbdfzU?=
 =?us-ascii?Q?VMcfzqTGyw7S2qrHy2Inrvy91Gut5+RDMnBUL482/Vuh/a1JtOaCSSFZc5jL?=
 =?us-ascii?Q?96zDjMQmjU4eCoSMFZVLHprMhGTyG8G3tTuVl6JVJsgKzRcboqkEpNONsPJ6?=
 =?us-ascii?Q?sH/HvFfNWRqDK1z7avbINWq4lNsNBHNOP9DRjoxHybodgNr0Pt/t/V3biVaw?=
 =?us-ascii?Q?PwrughehXjiGCCnRlA8sD0WrPfaw4nkBn+ZeoBvVbSX8mPHY8X1YMSf9omYR?=
 =?us-ascii?Q?kOHr2fdOYD1XERBJRLCa2V7fRp8FcNkwMoQPPyFn4U5aoQSC7UljMoWw/9bs?=
 =?us-ascii?Q?c1RAGN225oxe1LkKyh/EykLEfuGOWwNM6MmtR9peHJzGM2X6CnjlXodsUSo5?=
 =?us-ascii?Q?lhQAi4/HvPkYZBft6HLeMdtL4Uizrtg/ou5+rFv/HvIqGEI0KcgUm519+UYd?=
 =?us-ascii?Q?FFmjBN3NL4uP9aECSPhMpH5mkeEC4avME+67saRFHTJudDjAjDNM69f2GdmB?=
 =?us-ascii?Q?88q19KJk8X096K30FiHKj+aXLN6ZVLvQNYsUWtWRlgUi0BLxs1Bv4BEglRzu?=
 =?us-ascii?Q?U3HNCxGN3hXfYTVISnhPgfMTGyHPhyCgBGwVETqZIf0DnT+5/9e2yIKsGneK?=
 =?us-ascii?Q?3NeM15//RsQjNdQMgwxm3ooqZsPa+mnj4oIkPo7b8gP67Q+JOQGPo4cdFEYM?=
 =?us-ascii?Q?vysgCDmRjx16UFH+ZVlo8FeFqGMggiK/h3aD61fNK4T4Cu2DZCziya2kCPQe?=
 =?us-ascii?Q?8zla8HVY3hTpi64PM8gb/BGO3R70Jl1Q3osSeu+ZYW9flGzz0OZGD9P6gNLh?=
 =?us-ascii?Q?SinvjCPeMUA0LTqa43ZmSZR85YpDk5JMgPiGZXSFCyBWi7JUFeDupquFSlEU?=
 =?us-ascii?Q?pp8fNaBj9p1cvNBuONiQnnVC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa81cb86-25b9-457d-a77c-08d976c843fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 15:07:55.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgyDwAexdoKk1YqHAFAdrjqkzuIhbmGZKzyN16tMTXhGK5rnytZwH8L3KwOAyfvrWci9C3jOssQIlBxnjJqtRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 13.09.2021 16:33, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 13, 2021 at 04:05:15PM +0200, Jan Beulich wrote:
>> On 13.09.2021 15:37, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Sep 09, 2021 at 04:35:49PM +0200, Jan Beulich wrote:
>>>> I haven't been able to find an environment where I could actually try
>>>> with lld (ld.lld); all testing was with GNU ld (ld.bfd).
>>>
>>> Thanks for fixing this. I've been able to test with LLVM ld and the
>>> workaround is fine.
>>
>> Oh, good, thanks for trying this out.
>>
>>>> --- a/xen/arch/x86/Makefile
>>>> +++ b/xen/arch/x86/Makefile
>>>> @@ -92,10 +92,16 @@ efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=3D
>>>> =20
>>>>  ifneq ($(build_id_linker),)
>>>>  notes_phdrs =3D --notes
>>>> +# Determine whether to engage a workaround for GNU ld 2.37.
>>>> +build-id-ld-good =3D $(shell echo 'void test(void) {}' \
>>>> +                           | $(CC) $(XEN_CFLAGS) -o .check.o -c -x c =
- 2>.check.err \
>>>> +                           && $(LD) -T check.lds -o .check.elf .check=
.o 2>>.check.err \
>>>> +                           && echo y)
>>>
>>> Do we want to make this a Kconfig option (ie: LD_UNQUOTED_DASH) and
>>> then use is here?
>>>
>>> We already have compiler and assembler checks in x86/Kconfig, so it
>>> would seem more natural to place it there.
>>
>> The question of whether to record tool chain capabilities in .config
>> is still pending. I'm not convinced this is a good idea, Andrew keeps
>> shouting me out for that, and an actual discussion doesn't really
>> happen. Yet unlike back at the time when I first raised my concern,
>> Anthony meanwhile supports me in at least the question (to Andrew) of
>> when such a discussion would have happened: Neither of us is aware,
>> yet Andrew claims it did happen, but so far didn't point out where
>> one could read about what was discussed and decided there.
>>
>> For the few uses we've accumulated I gave (if at all) an ack for
>> things happening under some sort of pressure, with the request that
>> aformentioned discussion would happen subsequently (and, depending on
>> outcome, these would be converted to another approach if need be). I
>> have meanwhile realized that it was a mistake to allow such things in
>> on this basis - the more of them we gain, the more I'm hearing "we've
>> already got some".
>=20
> I see, that's not an ideal situation from a review PoV, as we don't
> have a clear placement for those and that will just cause confusion
> (and more work since there are potentially two places to check).
>=20
> What's the benefit of placing the checks in Kconfig instead of the
> Makefiles?
>=20
> As I understand Kconfig is run only once, while the Makefile could run
> the check multiple times.

Right - as many times as a directory would be entered for building,
times the number of evaluations of a respective variable.

> The downfall of having them in .config is that .config could suddenly
> change as tools are updated or as it's moved around different systems
> (yet .config already contains specific compiler version information).

Correct: Tool chain specific information may get updated, but then
further options may get silently turned off. Plus to update tool
chain specific information there needs to be a trigger to invoke
kconfig in the first place. Merely relying on make dependencies is
not enough there. Iirc we don't have any means in place yet to
actually enforce this even when there's no other reason to run
kconfig in the course of re-building a previously built tree.

Jan


