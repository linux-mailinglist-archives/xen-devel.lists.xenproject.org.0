Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C535E500FDE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 16:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304798.519562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf0Ft-0002sz-Ib; Thu, 14 Apr 2022 14:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304798.519562; Thu, 14 Apr 2022 14:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf0Ft-0002pt-FJ; Thu, 14 Apr 2022 14:15:29 +0000
Received: by outflank-mailman (input) for mailman id 304798;
 Thu, 14 Apr 2022 14:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nf0Fs-0002pm-6o
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 14:15:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f2a66a-bbfd-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 16:15:27 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-Q7WiMJCXNDqnxe8KKgm1GA-1; Thu, 14 Apr 2022 16:15:25 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6924.eurprd04.prod.outlook.com (2603:10a6:10:11e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 14:15:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 14:15:24 +0000
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
X-Inumbo-ID: 54f2a66a-bbfd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649945726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ioIB61VLktne7zybMsZf3ZCjOKaJEfvsJeptYiD/+/s=;
	b=gLJllP3ExGZjGh0ZJi7bQbiF/cOLJdpYLMsV/sHhAPEp2uQhSBE5AcZcmCh6JXTYCYxV8A
	tOPlNaBO4Ibp6zUp03Sfpiqeby530UlmQHidQwt2vKr5Tj7aI6pl/Xw6yfi1PvKGzdkUgl
	QXN6lWrBd0pXlsK88h1JMagiNtb1ATk=
X-MC-Unique: Q7WiMJCXNDqnxe8KKgm1GA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGM00sAB1ltmfqyNeib5KquuzE+GQuiuX1kQhZrhKsl1vaE56x5mdBTn/v8t7b11ohIVfyoH8p3/Dqv/ofTlKKFUt55h/yZ9L8eoTr0Hj2QIelkqoZlFuu3pqnoRfmO2nm1dIH7TCm4H8XhAUX2q3+V4oKvNQbCmrilvjOYe5pq1O+EPvwJeTX9epD35KsBNhhonAb23QeZIdscbpP9am0b2XEySl6aKNYJk1TQhiWY86m4s6E5/j6kxUkH0ywIyESwip5ZT1rZJxXBARWxaVOKRdxuz6O/IsOVhuDsGE4vu6omXHRApil180MynpBNBMMS9beGbQLodia34xZIPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQr/41KWdn2hJYPYsmmgn9bYBJrMQ/0y2hDsszhW8Gk=;
 b=SyeARUEX7QY6PnFIM7KXh8R1riTkX4IX3GBx9sobeEIDQXEQRplH+Z5arSdghBgi7h0Q+6MqBRT38Z3WVVs6LDEB/0HZElVekwoIMtYDnYmcQ6HMqUv6BnLghkecSGeTmKvbAVFKP/bFTeLzN9ZfdJTOnBKb+tPiHUb3PnamZ0k/c9crJ9r1Jl1wF7pLD7Bsa5CJpoilNWbHZrOZa0my5KVwr0iZCoTyr421Mz6Xqah6i4lMdGCAdryNrBkjX3L6D/QUkWtT7GeBcRxW3FQ2vWDI/a5Z469BCjI0aNmHTHiYfJ3k82F7aKKilsG78QMvou2WhS2qjiNMB+lBFhS9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2eab851f-0fe3-8462-cdbf-b438dc01ade1@suse.com>
Date: Thu, 14 Apr 2022 16:15:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
 <YlgWKGmR+u41zSsw@Air-de-Roger>
 <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
 <YlgiLhvsKVYKKvrr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlgiLhvsKVYKKvrr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0547.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec848aa2-9c77-4497-38e6-08da1e2137a8
X-MS-TrafficTypeDiagnostic: DB8PR04MB6924:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB69248CE354EF5784F47017A3B3EF9@DB8PR04MB6924.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRer3x4jPaFpW8xdHuJdkXFWnaZcguW7aaQjn3T3pK51M2xWSAoQBl72WcJhmYzXPRjmeuQe0v64XGLicjmOrZC2mhVd79LbmVzUQFS4fYY0qe2DaIRx7mfVdXznQfLnnWA7EL7DSjOICAz1dz8w/8XTZzb13KfxyBQPvL5fvNLg+M0dt4RA1/DS7i5sqcewQaCwcSee3GKhzRiMCkrRc8XM2LE3tTBOcXJGF6jSYA82ncPT+A/OewGKL35o2IU4QPixgXzkQtc/LgoPhZ3sRQcnUvBwRXB0/x/yX8muaYz5VP8Hsmo1XpDw+XKLEQo6bxosWx0Sfoty4PLxw8/EKA+yYn1FL03au09UZti7fvoYK+6yodLvUzBqAsCE1jNmh9vPCxXZHJCHKB+4VOal/o51HlHkaUZ20A0f9AZCOGbXW6hPUSReFmrYAWBPnCCCjx0oWtkvkzqSI+50ukmz3/Ur7Oer3avODCPiMj0vaEbRLgcy+0V+kvYcUxUQxF2fThnCHnr7DSNsua5ksiGzNeIhqDiPeYQjD/6id/EpgRIrrOuvPw1M3E1hT6azCT5VCFBv+08qmhTk6hcJF5PxPI2tXJr5skf9I66fi0NxqSUoWlf9bB3kefBsHBipXVdNCHZOJOUILLdc9VUJPDUbowflo63eYqAqk9IgeLR3a8tGV8wZNTQvsa00cp7p0koyxu0Ah8Ji07h8yDsjpJCmDylEvPIbvz1RiNozVw+QD1DBB9qiH6Zwbd9C1f/YZlm7n9LZfZeg02DJmZi3BCqwW/RO5Y0T61K9kkoikJ9//PDAsepR5VIzqIl/6S6mQFtjcalGccLHP4wuvB4jRRqM/UvnZNILPR4bn/hWtaqnOmW874/XhE0fz//9Z3Mr1T4zwKTRCZZkxBoLamZWySAUFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(316002)(31686004)(5660300002)(36756003)(38100700002)(26005)(6916009)(54906003)(6486002)(53546011)(6512007)(186003)(31696002)(8676002)(83380400001)(66476007)(66946007)(66556008)(86362001)(2906002)(2616005)(966005)(508600001)(8936002)(4326008)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pl6d2n2vodof9xe0X/N09LTAHUB6iq4Hgwc8Yc4OLPU4ahoxQYlOoNOe/OEr?=
 =?us-ascii?Q?tV0yhtPapfCG6298weKNWVB9mqh9PGhSYKtz4XQo+/B2xHyKNpJKVKUzqCo7?=
 =?us-ascii?Q?Tp7D8DulOe4nn7iRJsk8xjy9Tj+eDzfEkzeNhFhWyRzZ3xEXKKHftp5hBkdt?=
 =?us-ascii?Q?RxZ+WDjGlWSuwZkLe3K2Xdi+6JhTDmBYtkPu9zjXBkfIopKoNpQeltcUoMHf?=
 =?us-ascii?Q?DX3M0sZFTywPhVm8w7WNZiatANr5SouTxLSYzIEcC0sycHMvIPVaaZFtShNU?=
 =?us-ascii?Q?zk7fmDEKnxP+kWuUZByxi06pIS6a8+V33ADEivztQEvLaC/0AxMoWLGgpt/u?=
 =?us-ascii?Q?LukKljjVyqZjuUmn48FFVOiAQzERjH69qnCFxwm+ZgiRSoSQ9cnUvtzZu5ED?=
 =?us-ascii?Q?LT86jEFHdx+qXVoWsHGvTpxaX9uUVvTxggcOq+YyW9yO4ATQPZYtBTv2iViI?=
 =?us-ascii?Q?urH6bR401XjoCKtW7XuNyYf1oPLE1Arqghwo6QZiONjpzKvcG4R52mywUh1H?=
 =?us-ascii?Q?cEpZP4j46us+1JPsYgUa9mhWexOYxWKCNbjDKESvQpc9EYg8yQEYsjB38sl7?=
 =?us-ascii?Q?p59WKz6wEBXNtClyrSqOh+kqvsK/CAh7S2zlrjvcZrSaNCJEDikay0D6e9BU?=
 =?us-ascii?Q?MoebhUtsX4XgqRh5CLjVg6OzhKfJXer7hMplqIfrh2NUWq1vO/ktzZwzsMUB?=
 =?us-ascii?Q?l4xqpunCLk8BcI6/S6M0x/dQ72ru8leN9thu9y/A7wQ4kns/ciIxacJihDXV?=
 =?us-ascii?Q?Z7uYfSRPXwQSSjC5VUzuL27jfWn8iNSqWsYZeFsFmk7xpdG/yQj7aEwa/k2b?=
 =?us-ascii?Q?QFP0yT+k2jFhAZXt+hHaZzfTE6p6fikNjKt3hgfGYjM4OranYnzskqeswGgk?=
 =?us-ascii?Q?RbUZILCIwq9ZLoV7YXoR9j4D+FDgG7Mu2k9o99GyZlo++SREFUPtsf9stF10?=
 =?us-ascii?Q?HKVUIVd59FCQS3c+/7edHvslOSJtyVuRLRpzr4rn8M+mQ1UQuv0h8Qq0qSmb?=
 =?us-ascii?Q?xP3oAycdyO1qEc9VhlQHtdjVxLWRrLuhuVrSwplKKyHn4DH6E1jnHXkT525O?=
 =?us-ascii?Q?MpDZUKv2n7LJ+qTNw8bNO6ld+Z1hBEOJrNRpQYjdLrRKMjFiEceI/uRBmUp1?=
 =?us-ascii?Q?mHWV3IMmXG8rbSY1/C293m6eg+m1XXi8wEDJaEIzS6+B3oSsRPPkkxdVAVKT?=
 =?us-ascii?Q?8F0vojZ1yPJ7dxzCUOEnTkUZY8yp3pr9wQfOeOKMiidiK3m4eazQ2bwSrDdn?=
 =?us-ascii?Q?WcVSy1sGY47wxS52MPFjexy/NJUNk219Ykkd24epSd7VCpqticVE05uYrHwY?=
 =?us-ascii?Q?kTUoaQDaXvh7H6w7+/wxdgwnAHLpg3JnsQhsvWU3/fhoyaw5mTIIxTGL+IDM?=
 =?us-ascii?Q?WopiIBdXJoHNsPgxLrNFN+y4lTSntX6zSvQb6Q4GHiOhm3S+Otcs2d0hGLUi?=
 =?us-ascii?Q?HgJcn/uUXcrHztGHDAe4Un9+ZaPw7ulNexQ8j2l4VZ1hyIsfeQs6XRmdW3cr?=
 =?us-ascii?Q?s1rKLa1qlw5nnIWqAG+mPk9MufluvxN5Z7Yqkwb+89xYazN84zFtkfM+qaz6?=
 =?us-ascii?Q?LcxWuDfaSFgo85SlGMVNoUy9HJ9252u7MBDlJRfmwEAdy3gqXdEB4Nv4zS12?=
 =?us-ascii?Q?wCuqzAzoirZ2hpY43ahk+2T8goGZIIi8ZI5Vdwv+EGqh2ERFx+vuwC9bRKxp?=
 =?us-ascii?Q?hrP3D+mBrHCyMctmtBemZS0KkW5yWFxIHXBJDIH90cuTJ62TWZL6KuKzYz1e?=
 =?us-ascii?Q?/89Ul5NzLg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec848aa2-9c77-4497-38e6-08da1e2137a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 14:15:24.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cT/KXfk+PD+dD+pOZ/Qtcf/lhIrfUA2UGNqf38vpxdU3i62xO/ndXXaj60mtyGyu+Sj96NxiULhunCffMmcZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6924

On 14.04.2022 15:31, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 14, 2022 at 02:52:47PM +0200, Jan Beulich wrote:
>> On 14.04.2022 14:40, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
>>>> While future gas versions will allow line number information to be
>>>> generated for all instances of .irp and alike [1][2], the same isn't
>>>> true (nor immediately intended) for .macro [3]. Hence macros, when the=
y
>>>> do more than just invoke another macro or issue an individual insn, wa=
nt
>>>> to have .line directives (in header files also .file ones) in place.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> [1] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D7992631e8c0b0e711fbaba991348ef6f6e583725
>>>> [2] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D2ee1792bec225ea19c71095cee5a3a9ae6df7c59
>>>> [3] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3D6d1ace6861e999361b30d1bc27459ab8094e0d4a
>>>> ---
>>>> Using .file has the perhaps undesirable side effect of generating a fa=
ir
>>>> amount of (all identical) STT_FILE entries in the symbol table. We als=
o
>>>> can't use the supposedly assembler-internal (and hence undocumented)
>>>> .appfile anymore, as it was removed [4]. Note that .linefile (also
>>>> internal/undocumented) as well as the "# <line> <file>" constructs the
>>>> compiler emits, leading to .linefile insertion by the assembler, aren'=
t
>>>> of use anyway as these are processed and purged when processing .macro
>>>> [3].
>>>>
>>>> [4] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=
=3Dc39e89c3aaa3a6790f85e80f2da5022bc4bce38b
>>>>
>>>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>>>> @@ -24,6 +24,8 @@
>>>>  #include <asm/msr-index.h>
>>>>  #include <asm/spec_ctrl.h>
>>>> =20
>>>> +#define FILE_AND_LINE .file __FILE__; .line __LINE__
>>>
>>> Seeing as this seems to get added to all macros below, I guess you did
>>> consider (and discarded) introducing a preprocessor macro do to the
>>> asm macro definitons:
>>>
>>> #define DECLARE_MACRO(n, ...) \
>>> .macro n __VA_ARGS__ \
>>>     .file __FILE__; .line __LINE__
>>
>> No, I didn't even consider that. I view such as too obfuscating - there'=
s
>> then e.g. no visual match with the .endm. Furthermore, as outlined in th=
e
>> description, I don't think this wants applying uniformly. There are
>> macros which better don't have this added. Yet I also would prefer to no=
t
>> end up with a mix of .macro and DECLARE_MACRO().
>=20
> I think it's a dummy question, but why would we want to add this to
> some macros?
>=20
> Isn't it better to always have the file and line reference where the
> macro gets used?

Like said in the description, a macro simply invoking another macro,
or a macro simply wrapping a single insn, is likely better to have
its generated code associated with the original line number. Complex
macros, otoh, are imo often better to have line numbers associated
with actual macro contents. IOW to some degree I support the cited
workaround in binutils (which has been there for many years).

Jan


