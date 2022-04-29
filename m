Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D951444A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 10:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317042.536179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkM2y-0006C9-S9; Fri, 29 Apr 2022 08:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317042.536179; Fri, 29 Apr 2022 08:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkM2y-00069v-PA; Fri, 29 Apr 2022 08:32:16 +0000
Received: by outflank-mailman (input) for mailman id 317042;
 Fri, 29 Apr 2022 08:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkM2x-00069p-5E
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 08:32:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da3b2a82-c796-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 10:32:06 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-6yQ6SPMjOmKM0ZmSHdLBtQ-1; Fri, 29 Apr 2022 10:32:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB7490.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 08:32:10 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 08:32:10 +0000
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
X-Inumbo-ID: da3b2a82-c796-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651221133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1yXW5zzYWgNz6U0A1mmEp8lCC+DKM7KUC4Dxh/boSo=;
	b=VBSSP8fAfYM8lpYh+L0TKRJGcvNq3BuWZVxIngn/jFKS2HK3JDhV75uzue1KCFqIJni4tT
	eDTyx5cpGK1apZGoCiai7+ZVLw8jwkZl/bf9ikJI6e0uRSBT1R0ohmYYWxLXVyNYUDr7/s
	+7s/hc0vsm8ta7c1vn82umJYivOignU=
X-MC-Unique: 6yQ6SPMjOmKM0ZmSHdLBtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5+KsQqvCInDP88FVkkf1gOxeFt8oMq55Qo3oqEwdosT2ccm9YijNMyWoUkrOnmSe9oNibPsTVXqaC/3Jujdg2VspAa4P2NoAh5KeCYZ8XEq2fLvjQattyyTVOiOEdazrTiRzgWzY+7xAseEXMoBmGfYBkRUmA+aO4Ec7OkgHHGbpajzmRfY7sAA9OZFt+kTRlPOJ68Wm18EqavKXapxf6Mzs0QM4J1tO1kp9S8wDzJdXekW0WYOKpPytj7ZxkQWl17g//gUEAbCi/meXx/TdpmLoA0TaGvzL/Y2gZtAokiPuXpMYCeQ14Ji8OxCsYWgR8lL/q6GayAqEqzLj6mZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlbk9ut8eUH5gWtSNYWolKdxyBzeQNPSWCWCG7iRPEk=;
 b=J73Gd/JJkHWa92Bupb+C3giLKd4a65gIUoGDByqYKfDsQ3kQSEprao4Sp6drEQJ2LKns/5vqnG997vc5h4YekoSpSUFh9pmfGuvR9Dm+glmJRlVD52Ime4sCoBlkuappILh8DXOUduBdeUWXsL1Vrj54qLgcL2uHia1y4uIVMv2uN9YAqHz5pbCS2Q0Nc2dPq4BXN916+S79HsrXZyD/5E9RByT3/zKFcZKlOQ21ozV/o3LnwXZQoLHcuqd2lwFNtLrmAqh/qeC/XAceSurzAsb5rGutzeAszM/5c0qgjBNWZRp3Llg8iLuZEFaG6jvRM6PKY4doi0tmGHdRMK1tog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67e02fac-a382-0cb1-e2ca-dadef36718c1@suse.com>
Date: Fri, 29 Apr 2022 10:32:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
 <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
 <YmudX/vwbBTxNhMw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmudX/vwbBTxNhMw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0314.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1094e9a-21ba-47ad-d474-08da29bac09f
X-MS-TrafficTypeDiagnostic: AM9PR04MB7490:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7490D5148361156A035E255DB3FC9@AM9PR04MB7490.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fClMqBU0LXoXXvEJOZTPCGKT1YzzGUx43fehHnlG78Ig6RJq2e84Xll1gzO6eXxBMrjEdwJV6XUVQD88Ko8ZoSy0mr8Nw6dBHcMZwuyh2h0wzwGo94YFWecaSKV4sNynv3a0eySL7SqGH8EEr+TK+3jhR/a6J9xoW/8wNtBeb1BH8V0Hta7vt2OCDyUkax74AyUpUbeKfPmFUvqrvCZzSYJWdI7rRG8ZqSExKM9ZCxsFE3raZ5DcrkDPpjSbOgx/nu6kmhjiv+yBMPz+5GlmNhxxQ5UxkdciYNZcKAvE4KmLDLjlYcmpb8odqaoMRy+qlH6DwQdtPwKADrauzoIwESHhzLOG9bE/xs2itNWyv6gMZZhGCbK0V08ve41AnGSEs8RRbRorK2a1PMuSaPzcpl7dQ3ldLQ89e7tkqqgh+v6Y+l59j7NU3VfMWI34BxhkaQ/29ttKGaCCBWHpB6xP1YBLflD3KdxFek8TQAmEhUqrW0ACjrhbscYO9xm2+Buqkt/VAnfILljVi/c1UO4hOzoF2t8uCUWhp9mJEt6BzBCcyLuX33v3tpIf34Y4HAcEOsJArk9etvwjRnlUx38kwS69VFwPteXImOfLHKB97ttrxYpc7qfb+z2LN93utafemJquDE0zg4n083/1NPtdsXzRep8XozvTtp6fukO3A/FJrUwJLxdHcOzztJwQ4OaThvW07FTpmNFha/WL/ophzPSbnuVHa7v9+s6TgjX4AxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(36756003)(8676002)(66476007)(83380400001)(2906002)(66946007)(66556008)(186003)(31696002)(6512007)(31686004)(2616005)(86362001)(316002)(26005)(38100700002)(8936002)(6486002)(6916009)(54906003)(508600001)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UWt5sjo6W1QCL4uSzdv5rkSXf8TRAkyR64VxYwIlzqaP2pumtm95JwEriVX1?=
 =?us-ascii?Q?3YxHQggvuc/WawOv4suqiOeaCEdVuxX8gIw7k5Sc0iSDWZOn9rwEoc5UL4hp?=
 =?us-ascii?Q?rvkO5oxRyNWIeqhi84hvScC4YPGY3INrAeLxXDnG8Ipv1tweOkgEMg/rLOBu?=
 =?us-ascii?Q?3+tFzds0sQtkV26JXl22aucQJw3EqHBNPpUeAGlSch0Rv5AmSQTy4opcY9AW?=
 =?us-ascii?Q?4mXuO6IjvAYYWKsbreyqpBBeDEGFBu9HJXIs4j8zZU98R6cbeSBe8/WVH1aI?=
 =?us-ascii?Q?BimBbCM3Dtg4r3SOE5mmOurDdo6G9XPyZ8EIiVUSRGJy9xHeQb5528VCraqP?=
 =?us-ascii?Q?GB+819YFMK+7197I+WFdF9EBZqokUtRrPNP3Jd2trugCGKM8ito6+0dgJDij?=
 =?us-ascii?Q?0o2OD4OXlfJXA5YDZHncxyYIlS8XrxlHdAxionSlzK8koZGMcpce7PdPgvhZ?=
 =?us-ascii?Q?m2umjfcPNwt4VSbNw3RJ3Qe3O4e+UzYSsMs6peRd0ALL6IxlFlq4xoru2hsx?=
 =?us-ascii?Q?PGv5s8xW3JrfGG13LScFeaaInUAuVD5+PZb86Ca44PiQqnfyFoWFSWXxYvQI?=
 =?us-ascii?Q?QoFBPrMR5S6q9QwZqrXZK6teFY5+J7X99MpuV33A21N/iwCegYnitArslwat?=
 =?us-ascii?Q?xEbuW/OdoI1QxAQT12xE6dvQYElWeWGJmXfy93qeahohdB6iZXs0zsk3UvKn?=
 =?us-ascii?Q?QI/1dcdZ7HSWJTlZP9T9qa8MZ/cj495JFJpboV1yTTRq6iP2wYnf8lDEJNIp?=
 =?us-ascii?Q?G0S+oRiyzgrtZMnpTvApu+ri3W6avDLeE2hXVfjF0H71QU5Vq1mLUzRMbdcX?=
 =?us-ascii?Q?jUh1h5QJPLnU1/lhZaLLqSxmv8FwZO2C/H6LjIGOD7E4d+XLolVbNyNsGF5V?=
 =?us-ascii?Q?krHObbMplHWD00e4n90H/Ukl9qt33Q0VOeCVj0jwPxso6Mr3SMAhmKFx3+bY?=
 =?us-ascii?Q?ZeHKVz2vZl7H0lHUi1C4pK6TpkWBIhg3VV8srCpplueLo9YGN9FUoVm9ifIZ?=
 =?us-ascii?Q?I+z+LP4hyFFWwrQtviHUN8DrzVI3WsbZHPIVU3oiJ0vj7ENLRnepDWJ01qA3?=
 =?us-ascii?Q?t4FNvqSgVK44sDUaS3u3XHsf3U6SKw3FSDIXvGQGdGQJwpNf/IJshXr2pI8o?=
 =?us-ascii?Q?vakiU5DptHBlf6yV4R+/h95BFg8SADSnPFwec6gbQCuY+Rj5FSS2ZR8pGPu1?=
 =?us-ascii?Q?9BRU7scQvs74dpVcZe2vOitxRGdE+aNeji8ZDCzbIHqNRE+p9VARYRF5vV5a?=
 =?us-ascii?Q?zH86Vs5iXasGBxIcAzO5H7b+bieXCF2++63mzBWSvsFbvOBTjNztYtSJ3Pvc?=
 =?us-ascii?Q?Va3L9WcEC7WsyDVGAhNGXRMvaT/BbOav/ndqYi+qbGkw2q/cIb9bfw4oZi/K?=
 =?us-ascii?Q?COVFjbZ4B1FAiCB3tHlvYTFfB29wtw5seFOMtknASpdEx5juJlB4tapd6n5P?=
 =?us-ascii?Q?mlT6zqWad9jD/Z+SpWiovWE5ImQvYiKXutmEvYMbcheLro5emX8jIMO46eZR?=
 =?us-ascii?Q?jcCOjKTTKstKLAEXwL5M3rlGGSnsRohTHw4e/pojlgkfAiivKfJ2CSHtx1zG?=
 =?us-ascii?Q?GRiiWM1Jkr5b3bnA3NG0UmtSi/aLAIt8IUs/l5JmPs21Xmlu1SdFFJWWdiZl?=
 =?us-ascii?Q?pKDBKhoyJFTW3Rg4CvU+4YpZvAOxWiw7SjD6MVVX31LydhgPZMh0U217kIhy?=
 =?us-ascii?Q?4Os3RLWBvw2r0h6Mu0+JoIboBHOfuMAaR0+QAsDBID3qtK30gQ8uiFIvrBoB?=
 =?us-ascii?Q?EreYjLodwg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1094e9a-21ba-47ad-d474-08da29bac09f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 08:32:10.0889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuuJApDHfPtTV41QQqf317DNfOJFTdzGw4phvOSuc75GUOo+URXLRDfF5TR1pbq0ysDNodOAdlFJuTxRO2/STg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7490

On 29.04.2022 10:10, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 28, 2022 at 12:13:31PM +0200, Jan Beulich wrote:
>> On 28.04.2022 10:52, Andrew Cooper wrote:
>>> @@ -283,6 +283,8 @@ CET is incompatible with 32bit PV guests.  If any C=
ET sub-options are active,
>>>  they will override the `pv=3D32` boolean to `false`.  Backwards compat=
ibility
>>>  can be maintained with the pv-shim mechanism.
>>> =20
>>> +*   An unqualified boolean is shorthand for setting all suboptions at =
once.
>>
>> You're the native speaker, but I wonder whether there an "a" missing
>> before "shorthand".
>>
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -117,7 +117,20 @@ static int __init cf_check parse_cet(const char *s=
)
>>>          if ( !ss )
>>>              ss =3D strchr(s, '\0');
>>> =20
>>> -        if ( (val =3D parse_boolean("shstk", s, ss)) >=3D 0 )
>>> +        if ( (val =3D parse_bool(s, ss)) >=3D 0 )
>>> +        {
>>> +#ifdef CONFIG_XEN_SHSTK
>>> +            opt_xen_shstk =3D val;
>>> +#else
>>> +            no_config_param("XEN_SHSTK", "cet", s, ss);
>>> +#endif
>>> +#ifdef CONFIG_XEN_IBT
>>> +            opt_xen_ibt =3D val;
>>> +#else
>>> +            no_config_param("XEN_IBT", "cet", s, ss);
>>> +#endif
>>
>> There shouldn't be two invocations of no_config_param() here; imo if
>> either CONFIG_* is defined, use of the option shouldn't produce any
>> warning at all.
>=20
> Hm, I think we would want to warn if someone sets cet=3D1 but some of
> the options have not been built in?  Or else a not very conscious
> administrator might believe that all CET options are enabled when some
> might not be present in the build.  This would also assume that all
> options are positive.

But the positive options aren't really the interesting ones here, as
things are enabled by default anyway. I would expect "cet=3D0" to be
silent unless neither CONFIG_* is enabled in the build - it simply
means "disable whatever CET support there is".

I can agree that "cet=3D1" may indeed be useful to warn, though, but I
wonder whether the logic here then wouldn't become unduly complicated.

> IMO the current approach doesn't seem bad to me, I think it's always
> better to error on the side of printing too verbose information rather
> than omitting it, specially when it's related to user input on the
> command line and security sensitive options.

While fundamentally I agree, too verbose output can also raise
unnecessary questions or induce unnecessary investigations.

Jan


