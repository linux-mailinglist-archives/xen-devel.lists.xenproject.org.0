Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011EE4B86EA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 12:43:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274032.469362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIhz-0003P0-SO; Wed, 16 Feb 2022 11:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274032.469362; Wed, 16 Feb 2022 11:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKIhz-0003Mh-Oh; Wed, 16 Feb 2022 11:42:55 +0000
Received: by outflank-mailman (input) for mailman id 274032;
 Wed, 16 Feb 2022 11:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKIhx-0003Mb-P6
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 11:42:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92cd497b-8f1d-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 12:42:52 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-j3hCXq8KPpmNDlRTdBzHKg-1; Wed, 16 Feb 2022 12:42:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB9024.eurprd04.prod.outlook.com (2603:10a6:102:20f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 11:42:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 11:42:48 +0000
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
X-Inumbo-ID: 92cd497b-8f1d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645011772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=paM1O+oFH4o8DIi1l7sLnizyNmttJIjGyTJyQ4gN3vE=;
	b=JAvMwrmJQhHO2WkAhmJwRNZ5eB6vc5EAqo06+JJTwLTtN/aYBsartSqBQNCZXkrCMwIdLT
	IntOdT32tLNlPVHylp6OGGlc0Muypw1qcb5hqGFmPAYPn2cQ5vJ23fkD0Sk6jW6fPyK136
	4ytydU+qAGMB2KNmyvaOXeUnKgTu3TM=
X-MC-Unique: j3hCXq8KPpmNDlRTdBzHKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HICFJDiQmKzrOZF3k4z0x6n8Q6qg9MgNDoUWpMEax6pekU9gcmbiNUhEaj7d4dwfV1dvvO6xP7Y2T01vrvadB7muRiAc8g6JX89JrMGYblXgbFNBR61nYnwvSh3q2evJ83hTPwQ0R/GV4a7QPdRhHNiEJ4iXk+PvExZa1A3hb9hS4rEMlyl26KoMoPtOtBJuQZFexaaGF1RRxi8hzqsuOwBN5cnOemxviDJB3Sei3godu8b9pjf/VXKu7xy9vrlMtqvYNK/6AJQbalBbHHK0XXs9J4+5d7QX2QqASScBQ4bQ4sbKEAT2fx++w/OOBP78ZQ6weRhzx9mrWnPIwaZr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyqF8PMq7Q7m6HjUTswowbWrBd6wMsRN8YiSyq/GMbM=;
 b=PrI7s0ZwJQk24i+NHqiZYslVYZ//m/3F/chVpsQjaqkm/QyjlFc6jOjCQ0PnwGSO0xNYwbIE6ql+HTu1jMaluz82QDBOmZyMaYfybZ9aC+YB54tk74jPiUrPwgDf94q0kX9BXjuZJ1JiR4ywbvf1gQHXBpwDzJSpd7iAEh+bJMXQed5w3AbMYRiTQVgMUVKhiawlG07qz/P7lMb/F/m0cyuXrcwcbgQ5lfsCZ12FIw/Y7rGMa9sUcJib4XmpqPS/+EuluPPGwdVoWcWHXCIXcU4KLJQsOmUKhRt9cj0lkOlvlfrnNrB2qvfLAVBq193+w13xx/7MZKD2jR1DGCnrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
Date: Wed, 16 Feb 2022 12:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] lib: extend ASSERT()
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0071.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc494861-6116-4715-1a69-08d9f141743d
X-MS-TrafficTypeDiagnostic: PAXPR04MB9024:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB90243002FE14F706D8D1E2F1B3359@PAXPR04MB9024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eJexgEAbGFca6vC7oX77STABPR1mhoNagKuu0hnAE7LyDrCsZ/51gxN3KcaZYqXfTVxrpkbHcah1p/KaMVULdf4PFt9Yh/aWmkw5z4ezl+kfHkfjb3rRzn47Fikl7RVGrJ+Ux7xkkIuQliB7a52z5nrvvlQ+mU76aUI/txnqtjKq+TLT8Ry66zrsTtB+KlhQaMRSaDusibh0zE3Ji9mEY4xkEu2v6NNEqcGIZXPpcNiHX2mbD3BsTSOKL0uBEVuWZ33q/5dnrwvZfe0JzFmVo67yUoXWIObvjjgwY7yB52GJ0pysP/LfT6RduDIRdGJQX3UomFbNiEXqnDaiFhB9/CqeHBTQkDXFcJQUXRRSVW044F7oPxBwg0E80H96RPK1YomHc7NqzjsPaEhsg2hB797E48/se7KidMa1Yc7Z9WnPTvE5uGe4kmXUyclJnO0Cr7CHBOPs54mFLdoidXYHH3eF9NDmgvWiYyhxAuBgVqegMScP+csiKEIFFn1lrbCkAnxzSSaDRfu+ZOjeN0QFH55Fv9WPiDxnIazfpWRwVFttAwpdxPDMHpuL0/LWjrWKHlPMOej72w8nsh6rXd5uINDAWTnH0GKuftXbLxDcY0Q6mW4lgQycy/bzb/bsUKd9NOpCbwPl4mxJrwbRRHB7zcXPnrM6celMaHzxNhKWe2IzLaLutrjOtw0cO2L9N5tpC7wceoIcDBv7qcnPR35DDBp4A8XjHe4EKNNdwavvbI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(26005)(38100700002)(186003)(36756003)(2906002)(31686004)(5660300002)(54906003)(8936002)(6506007)(316002)(66946007)(6666004)(66556008)(66476007)(6916009)(86362001)(31696002)(2616005)(8676002)(6512007)(4326008)(508600001)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8QSw07O0sX+rN+OUTcl08Xnxvfc8ck0i/UFz72ge6jaeJmWEXVt3/CXB57ZK?=
 =?us-ascii?Q?J5+jYtZ7Q8nijTo8+9jn1yjrQtlkbMlNf4SVCm26nmWILHhhiJO2qJTArri1?=
 =?us-ascii?Q?ivKcKRim5yYamveM/5rb4v6shqzQzXDXKw1f583quDEMd64vrVJNWtCeWgpo?=
 =?us-ascii?Q?qQSk+04OPzPWI+ia+MskmAYp+T8IvM8a9wLJkmIsj9No6STegQKbFR2f2wJd?=
 =?us-ascii?Q?GcvUmk5aZfGmKzISex4MaIa0hgOfQ+MLFaxcIu+Mwvg4bfTs5VpM5hc3EG+m?=
 =?us-ascii?Q?d8q3U7+FOPor8cLxVUrwiSS2uNb5R3D6UVpuu4QF6S2x0vTJPdk8EdctfXiv?=
 =?us-ascii?Q?L+kzQi99c6hMvcPQrAorP/100MPJkfhf1hmYt0G02PR7vAMUX5GWyhabdi4N?=
 =?us-ascii?Q?1jdJS8L5U/MBAvXroS81HzXSeEOC63okAEWxGuvA4xAyXNPudVcnxOr3+J7n?=
 =?us-ascii?Q?tDSTJ8mFbQFjLN9SqX4Y5rVkpe5ztNPM9tXPMivMD5rc1qqTiGFROpxZl6FK?=
 =?us-ascii?Q?3G2LZKlBfB3/HtbDmvl96KY4WY1EpamOj03lSddJOj7dhAvfSmnyRW/kyRBq?=
 =?us-ascii?Q?x7h0QrqOEp6E4I8bd+RLitq2pG4JefgwSgyq9AG8Db84aZYYp8asL0+nBIBn?=
 =?us-ascii?Q?piM4uMTWJtheOms55/MkJgsJQmN7m7TqWLzbF1+Ya9o0/PUv8rzBjDqiMhxp?=
 =?us-ascii?Q?q49L5DSrlXalOoba7d+cVFWYvbBrcRQ3peI6y5Yph6jbvA6sy9NCNdu1pwaW?=
 =?us-ascii?Q?dhHHbfFo8/eIZqpK5BdpbLVRjKc0LuhSWP+RGYUvIyl3OBR4jHCFx3EYSPvc?=
 =?us-ascii?Q?gbDAd353LcftrydbJmVUcA3QMm/OIvKd6GXhDoU9qiH1/B9JsRLfBV3B5j4V?=
 =?us-ascii?Q?KyjceGDbKMtbfIeVx5ARoJ9YqZKB4Vlyzsp/ufqsr6z4wnYhWENUBtHnQQVw?=
 =?us-ascii?Q?75hqb37DJoHu0yObv8fdxt1SgWMFm+nWPUlD1h864leRuzOUCZetUrNGH8vs?=
 =?us-ascii?Q?ll2Hfj5886WzCCWn4wpZWSMpnnRXtodFWPNr4EDhCWqnodDETiV2t8xMlqwA?=
 =?us-ascii?Q?JIbOAb/BDEnu+GJO9Wgjjqk7Y6wWv8UHHD//6RIfqWw4wi8Vx3o3d87jqGMW?=
 =?us-ascii?Q?CUBh5Aj84bg3WJ/dnEwXMc2uQrsIp4n42uwRRkmUl5H9uH7znwPBT6OFLoh7?=
 =?us-ascii?Q?i10WXjrgVIHtLbver76wQdkGsYp5CgBeTgkXK0YdEXkGRnzRfDZpeTMtNWhC?=
 =?us-ascii?Q?gSNGh5eGV5+K+T/ohu7YTZ3C6ibfEXJqKx48U7Rn/0tzg7h4gMBv77Y9ME5/?=
 =?us-ascii?Q?M32bafnIdyS8GaEVFVvMW5h9F+hPlK4mYzDG7q0193rJGtMAOqcBi3mZ7HdV?=
 =?us-ascii?Q?67YCB/+VP7ekU8t3N6QriWDaHRfgOstUKrNxNzew+pSc+wAsKoo43zIwKFzu?=
 =?us-ascii?Q?OuHKMlz8uhtoWGce9V6wy6IFkUp8MPwI5a+xHXYEvqsmZOhug5TkfrGxOXv+?=
 =?us-ascii?Q?pB4BA76QO2WrZpPLJDUkMLJX+HxXxMbACsZRqUCDXRPRL11ht/1s394YP0aU?=
 =?us-ascii?Q?t+y0vtTNmKpHBoRJ1qIjsyPKBDt69HoG6IpQj1XQltjWnCPkaywXK1vJvLwF?=
 =?us-ascii?Q?vBoZzC9/3GAGT7d6hCT2+ts=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc494861-6116-4715-1a69-08d9f141743d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:42:47.7777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/lPmSyQX8b9EDbXORREIr0bjq/vbzFJE0OqCgv/pN/NyaShAMqJr4fUOSgtnFX2dYyM/a3IfMqqv3L3nroFPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9024

On 16.02.2022 12:34, George Dunlap wrote:
>> On Feb 16, 2022, at 9:31 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 16.02.2022 10:25, Bertrand Marquis wrote:
>>>> On 15 Feb 2022, at 21:00, Julien Grall <julien@xen.org> wrote:
>>>> On 27/01/2022 14:34, Jan Beulich wrote:
>>>>> The increasing amount of constructs along the lines of
>>>>>    if ( !condition )
>>>>>    {
>>>>>        ASSERT_UNREACHABLE();
>>>>>        return;
>>>>>    }
>>>>> is not only longer than necessary, but also doesn't produce incident
>>>>> specific console output (except for file name and line number).
>>>>
>>>> So I agree that this construct will always result to a minimum 5 lines=
. Which is not nice. But the proposed change is...
>>>>
>>>>> Allow
>>>>> the intended effect to be achieved with ASSERT(), by giving it a seco=
nd
>>>>> parameter allowing specification of the action to take in release bui=
lds
>>>>> in case an assertion would have triggered in a debug one. The example
>>>>> above then becomes
>>>>>    ASSERT(condition, return);
>>>>> Make sure the condition will continue to not get evaluated when just =
a
>>>>> single argument gets passed to ASSERT().
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> v2: Rename new macro parameter.
>>>>> ---
>>>>> RFC: The use of a control flow construct as a macro argument may be
>>>>>     controversial.
>>>>
>>>> indeed controversial. I find this quite confusing and not something I =
would request a user to switch to if they use the longer version.
>>>>
>>>> That said, this is mainly a matter of taste. So I am interested to hea=
r others view.
>>>>
>>>> I have also CCed Bertrand to have an opinions from the Fusa Group (I s=
uspect this will go backward for them).
>>>
>>> Thanks and here is my feedback in regards to Fusa here.
>>>
>>> Most certification standards are forbidding completely macros including
>>> conditions (and quite a number are forbidding static inline with condit=
ions).
>>> The main reason for that is MCDC coverage (condition/decisions and not =
only
>>> code line) is not possible to do anymore down to the source code and ha=
s to be
>>> done down to the pre-processed code.
>>>
>>> Out of Fusa considerations, one thing I do not like in this solution is=
 the fact that
>>> you put some code as parameter of the macro (the return).
>>>
>>> To make this a bit better you could put the return code as parameter
>>> instead of having =E2=80=9Creturn CODE=E2=80=9D as parameter.
>>
>> Except that it's not always "return" what you want, and hence it
>> can't be made implicit.
>>
>>> An other thing is that Xen ASSERT after this change will be quite diffe=
rent from
>>> any ASSERT found in other projects which could make it misleading for d=
evelopers.
>>> Maybe we could introduce an ASSERT_RETURN macros instead of modifying t=
he
>>> behaviour of the standard ASSERT ?
>>
>> Along the lines of the above, this would then mean a multitude of
>> new macros.
>=20
> Out of curiosity, what kinds of other actions?

continue, break, assignments of e.g. error codes, just to name a
few immediately obvious ones.

> I am opposed to overloading =E2=80=9CASSERT=E2=80=9D for this new kind of=
 macro; I think it would not only be unnecessarily confusing to people not =
familiar with our codebase, but it would be too easy for people to fail to =
notice which macro was being used.
>=20
> ASSERT_ACTION(condition, code) (or even ASSERT_OR_ACTION()) would be a ba=
re minimum for me.
>=20
> But I can=E2=80=99t imagine that there are more than a handful of actions=
 we might want to take, so defining a macro for each one shouldn=E2=80=99t =
be too burdensome.
>=20
> Furthermore, the very flexibility seems dangerous; you=E2=80=99re not see=
ing what actual code is generated, so it=E2=80=99s to easy to be =E2=80=9Cc=
lever=E2=80=9D, and/or write code that ends up doing something different th=
an you expect.
>=20
> At the moment I think ASSERT_OR_RETURN(condition, code), plus other new m=
acros for the other behavior is needed, would be better.

Hmm, while I see your point of things possibly looking confusing or
unexpected, something like ASSERT_OR_RETURN() (shouldn't it be
ASSERT_AND_RETURN()?) is imo less readable. In particular I dislike
the larger amount of uppercase text. But yes, I could accept this
as a compromise as it still seems better to me than the multi-line
constructs we currently use.

Jan


