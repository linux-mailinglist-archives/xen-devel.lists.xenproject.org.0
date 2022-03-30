Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA04EBF07
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:42:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296235.504211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVmL-00071f-2K; Wed, 30 Mar 2022 10:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296235.504211; Wed, 30 Mar 2022 10:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVmK-0006yP-VS; Wed, 30 Mar 2022 10:42:16 +0000
Received: by outflank-mailman (input) for mailman id 296235;
 Wed, 30 Mar 2022 10:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZVmK-0006yJ-0P
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:42:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fdc224c-b016-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 12:42:14 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-XI5uknbNML2tVXXHycHgVw-1; Wed, 30 Mar 2022 12:42:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 10:42:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 10:42:10 +0000
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
X-Inumbo-ID: 0fdc224c-b016-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648636934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ji6hcvEB5HbNHtq1W4jnpZLzgeyGzXJE3Nh2CmjJL7U=;
	b=cSyCHUvESsIpyoUk2IKMf2A144n1U0fht8/qAh3ds8tepJx/fwG/Dio3Eweb0osNwCYD+h
	KxStNq1NDuUZ8NpzOsjM2Ly3yRN+p7WWmgqIHMz7zN3/+98tsRIKEIIWaefz7aeHICgVLA
	rxlJQMFRjryszcrmDWvbg5NgvdCqwFo=
X-MC-Unique: XI5uknbNML2tVXXHycHgVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4rJWjs5CpCwHkaJ2Q/IjO+yX10yHZ5k5H9bfaFlDottrskFwStvO6quE8mVZQTnTw9LA4mVtGUkmpZn/+M5dY4HpVQJ4tokuCJoVDGadnbhiOG2k/X5/WHTTLtWhkgKfYMG+cpwn8DO0TXQz/W2/2EH6oqXzGMtKr7+2p4eDRB7O0/4i1SE9NmLLizvBctgpaflyXamxvm313z8HAGzPPAx/a0hddObbh3fnbFqjbMruDginahgp783v7BdXrY9A4f1rtdJ3OXzJC/ilHZC04Gggs7ja0V1iaAlZFnrw4PZNyDwuzjzNOKWBZh/WeGfG0OYenXN+5oJbGXN3w5n8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQAV2DtwZXCxg76FUOIWzKCpHtFyPJIgRiqVtRiMs5I=;
 b=eiMAyj3NXES15o512aFxEydH4h+FLvt7YELzR20e3j4z4hku1r5WOULWJAypOQEd0q+3xReCvy0AXJQ6uPS1Cd75ApTN2zeEGzHBI9uAnNAtp2XTeFMsEo96k0C8mSPzNaA2TsD37wexLRp+rbxnkX5bqfj5LJObuiJbELCSevh0T75thtKlTEzzmRrKYOPpUeDEctn8PdDt9WFuDW4bQsQlcPWiW1hGtMWZh7LxkDKwZYD7jDYITvCaaSVy+Atoo4ru0uDHE+SczH5bbaiP7StvaHVmIr5Mf1nER1QVsaG2ABKLlZsvXobowbIn2ia9FJwgK77xKyQ/CRNVwOLtsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
Date: Wed, 30 Mar 2022 12:42:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
 <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::17) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99cf04fc-381b-4e10-7356-08da1239f175
X-MS-TrafficTypeDiagnostic: AS1PR04MB9480:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB9480ECD1CAEE0BF328E2F087B31F9@AS1PR04MB9480.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x0YQQT+saIbbJV0b+YTI0lxkTsNg9F86ttOlQJotsn0kCPAnQju45JgvBbVlJQxfLDxbcBqcmaZqne0jKcHc/9hk0LSV6jmXDciu1ujIfmm0rmp81gehhDdsmrGpP20ydlIX9WilW8H7ftFDUamGV6tT6hfbbw1LKUpoOuAYjcCgYmF1TIIMTDDeKJmpc/8RvAg4ESTtG4VSSDzXcyp899+EwB8HRXXx+cGXmaLaTdf5/Dn0nX1j/tXEQjl+sReoxJA4NFOUqZys5mrtwiNDiEnz3HYQJcVFQpZRWcjPXt1/2+Yjd27Gq8LdnKx+oZHXu87WIaNjK4CcMXjic+RBV9nnpJt+X0Tol59h5hCTpvzK/CPCk/xzIZudx9lluR3OTmKAb0m4alUexC6w9tQimfZyeiOKOVWGV73vC4XFPztvXxWIX5u7e0vtiVXn4RZUHWYM5ww98jW4VZFy7nEBTRY7pGjK3ZaA35FsFChWj6sSGria0rHOssDQ5Ik6of+8rIJDTDdJbTzY/94jdxsx0zjltsA8kIw61h3ZbPaqJ4lQ/3SISqYPPOWOaKBCD8KQn662xo2ozvs55DiLISJERQRT1toqTYh83DBxEBxr0lw8YqGjnwglVq18WyKgclReSldZ0XoKLgRkqyJkuV6jnpzImS1zAjzfA0xHOMhphmmS6Pn1uKaTD4OpdIcxaztNbZyxAwRyjT+x0trJ1p2WZZkUNxADYUevkUe8kM9SFDXsS8zKxy3WGZuQw0LPRSLt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6506007)(508600001)(31686004)(316002)(4326008)(66476007)(6512007)(8676002)(66946007)(31696002)(53546011)(6916009)(6486002)(66556008)(2906002)(38100700002)(86362001)(8936002)(2616005)(7416002)(5660300002)(186003)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IqXxVbsKtOrIjZnoUlVjWndf7YOFz8PoizbH+ysgRI+cYLj+GGD9kEA8H71h?=
 =?us-ascii?Q?B3cBpc7F9teS5WZCij8aU8eYrmGoZ10dNWlftFmnBB2DiiaKaovMKoiqnFVW?=
 =?us-ascii?Q?Gz/XY4D+Tdw6yp+x24Rqlje8jY6QLeHtQt34SF4dOHB6XpzugYk+bbTyADyF?=
 =?us-ascii?Q?cZRQKNx1i7fvke50xLKq0zGOV7yaywrqSrUaGZ7tlCBfK6OlKOx9jU965Zzs?=
 =?us-ascii?Q?uj8kL/3p/4boe2aAG66UOwaicLwONQDwmOY8xQ/SOnn4Lj2s4VUc6t7szn/8?=
 =?us-ascii?Q?NCnWUn5o5N4MLPqYfu3x2Dew6IdztwgLLT0aT368pbxj2S9Ow8FH06BFAk0F?=
 =?us-ascii?Q?jD/92+ds/NVB6u+lqf9d7i4b9zrN87DypxXN8g6gPxHQq+G9Maa8eBSwUund?=
 =?us-ascii?Q?7IqBHMuJ6e0Fr0Jk7ZlImrnaqTKGnfzioo4y2m/382d3IvjExX/KB3N8g49H?=
 =?us-ascii?Q?R64MrknYGinZAqkSGcsiChAW8Gf4lgG2a0i/Hb9keAh76LroE7qHjKV5eXC/?=
 =?us-ascii?Q?l4H+sESWOxz3LbIXADmaDi0Wos3hXMoqc/wcj2ysf8fLIBow3dNp3KaaYPsP?=
 =?us-ascii?Q?P2Djf9KZF3QtGQLns6XKZkkGjo8YKmw2gO1cPLkzpvkncSNPLDriDBHThTyo?=
 =?us-ascii?Q?w/4ZeH6p8fIMzHUqGgdCr7XHhtpsaRZu9K+FEEyALTXXp3VKfEigCBbfoVn9?=
 =?us-ascii?Q?LmdgVBnJK+BCZoNdTVTtarKaQXKVq8Dh8MYPtdj9QaBnlcXSaLrr+YaQ9rwh?=
 =?us-ascii?Q?JTHn8D3UKZPj7fkKIqRXpb4/nJgJkzgUNjO9zzdcs2b/48Js9sc7YgpFF4cl?=
 =?us-ascii?Q?dRQsEa5Ynn5M/pPTnG8JdAiE1bYTRjZX3ENqUsghiQd21fyvuqWtWlT7TpL8?=
 =?us-ascii?Q?OScPb2KyH/lesxPKiu8jXCshH8pJrBxHLgHbD1fKM2qvl83yDuz4Onm+l119?=
 =?us-ascii?Q?FxFepwPtwzUMCQ9GeSL/lLTQdNgjCIoEwsv6daLO5xElxxhQHPU+xxhCzpbL?=
 =?us-ascii?Q?TbQ530sA+Dk3qTLPEmkTNaPTPuu+X/n7VR0+TL2Ec5l3GHZyLs1K/8XRBxOH?=
 =?us-ascii?Q?PpC7PlBn4N7v9i99bjrUo1j3LakoXs0mE9iqsVVlrI6G1RMTTh+pQadZND51?=
 =?us-ascii?Q?S0Li+iYeeSvm1P5I7N1/knJVYQBMnrUEcwy7u40DvcxTBG73uaSar6znjjoY?=
 =?us-ascii?Q?3ryJkv2PRFX/m8Mfh17BvM1nxSGg0nsOiQjm9aWsi7thVluNOLD0yskt1hpk?=
 =?us-ascii?Q?fI7HEBAPK0VDBCRfZlnJ8wLCpfbXCOP3S7cO0Ino5Pkgm5kPLG1UajYpFksU?=
 =?us-ascii?Q?Iqc8I1jtfe9wWWj8ylE2qDpWvvxiejBd++SSZ2G4eMz3ATnHacEB5Vdz98qI?=
 =?us-ascii?Q?BY7fo6QN+AuEoRTkH+O/W39INSw3VFroihVkY8Amk1NIskcoAo4IhylP4yyN?=
 =?us-ascii?Q?9FAn/TOjWtlMXNOLU4CEvSmZx5GViyoHFiJHf3+9xSnZkuHhVPabuAZLF8/R?=
 =?us-ascii?Q?RaOY3YNn6T3pto0CqafIn6EB0CCM5Zx/x5a2iB3QSg/q4meT6V0eCODbeu09?=
 =?us-ascii?Q?Sg0FJdTFfGOZHQ7hwXhoM7h95iPJT5w6/Yhw2WQxzJ6KCmRjcRYfAvmFaviB?=
 =?us-ascii?Q?nnCr9CjAowiv+X2Rx/OrYKjVrOjEfTQ/2iypk9ikgD1iJ5nozAGUn4dwb6yF?=
 =?us-ascii?Q?eJFX+ErcPxNAM+jzaOo0cuZBsrvmhha5pzFf1+eiwT5MK2H5DMjXihWu+bCA?=
 =?us-ascii?Q?wLoxVxlaew=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cf04fc-381b-4e10-7356-08da1239f175
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:42:10.0882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLrcZdjMROnkH1OdcmRJw567Jxs+Ke66mvAJzSzC8/ScilEdySsgk9X/uVWjp8SRx+sQ1fghL4wyptmqWYpYXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

On 30.03.2022 12:32, Julien Grall wrote:
> On 29/03/2022 12:42, Jan Beulich wrote:
>> On 29.03.2022 12:54, Julien Grall wrote:
>>> On 29/03/2022 11:12, Michal Orzel wrote:
>>>> On 29.03.2022 11:54, Julien Grall wrote:
>>>>> On 22/03/2022 08:02, Michal Orzel wrote:
>>>>>> --- a/xen/include/xen/xen.lds.h
>>>>>> +++ b/xen/include/xen/xen.lds.h
>>>>>> @@ -5,4 +5,104 @@
>>>>>>   =C2=A0=C2=A0 * Common macros to be used in architecture specific l=
inker scripts.
>>>>>>   =C2=A0=C2=A0 */
>>>>>>   =C2=A0 +/* Macros to declare debug sections. */
>>>>>> +#ifdef EFI
>>>>>
>>>>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do suppor=
t EFI on arm64.
>>>>>
>>>>> As this #ifdef is now in generic code, can you explain how this is me=
ant to be used?
>>>>>
>>>> As we do not define EFI on arm, all the stuff protected by #ifdef EFI =
is x86 specific.
>>>
>>> I find the name "EFI" too generic to figure out that this code can only
>>> be used by x86.
>>>
>>> But, from my understanding, this header is meant to contain generic
>>> code. It feels a bit odd that we are moving arch specific code.
>>>
>>> To be honest, I don't quite understand why we need to make the
>>> diffferentiation on x86. So I guess the first question is how this is
>>> meant to be used on x86?
>>
>> We produce two linker scripts from the single source file: One (with EFI
>> undefined) to link the ELF binary, and another (with EFI defined) to lin=
k
>> the PE/COFF output. If "EFI" is too imprecise as a name for the identifi=
er,
>> I wouldn't mind renaming it (to PE_COFF?), but at the same time I'm not
>> convinced this is really necessary.
>=20
> Thank for the explanation (and the other ones in this thread). You are=20
> right the confusion arised from "generating" vs "linking".
>=20
> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI.=20
> That said, it would possibly make more difficult to associate the flag=20
> with "linking an EFI binary".

Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.

> I think some documentaion about the define EFI would be help so there=20
> are no more confusion between CONFIG_EFI/EFI. But I am not sure where to=
=20
> put it. Maybe at the top of the header?

That's perhaps the best place, yes.

Jan


