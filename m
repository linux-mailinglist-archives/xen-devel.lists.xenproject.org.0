Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FFC4F92DC
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 12:25:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301329.514234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclnR-00064X-2D; Fri, 08 Apr 2022 10:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301329.514234; Fri, 08 Apr 2022 10:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nclnQ-00061a-VS; Fri, 08 Apr 2022 10:24:52 +0000
Received: by outflank-mailman (input) for mailman id 301329;
 Fri, 08 Apr 2022 10:24:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nclnP-00061U-D7
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 10:24:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f053029-b726-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 12:24:50 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-aMzqQ5UnNfKd8iRNKvdyEw-1; Fri, 08 Apr 2022 12:24:47 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AM6PR04MB5063.eurprd04.prod.outlook.com (2603:10a6:20b:a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:24:45 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 10:24:45 +0000
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
X-Inumbo-ID: 1f053029-b726-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649413489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lYzuMb+9wSwpn3pznb/WDLsP30N1pRhxT9lvfxHm5kI=;
	b=E6oTxae4ooq4xHopIoL8zQzE+2LNNOmDz01XQLeURZ05A9SbjseKurqq/rgbyIqICpcIdY
	0qHe/7a1BY4KYq0uV0zxBJ1FdeLPrT7vvJIgDxIYMGXu//2CYl3IcDgCWIeXpzMxVfGiab
	q2tr+6b+ygjtv44skx0QwYVIXXKYLO0=
X-MC-Unique: aMzqQ5UnNfKd8iRNKvdyEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FznU9IKrFpyHARVP8ItGWmZneLQdAlKQJgTOABJiuSF9hkRrpkk80vwkNfYnmkGsfUBwpuyMiVqSyelp9iApxnYSdWDCQadZMOcKrbPEp59g0yGnup4FxVvqelkoc2J2wNqig18ZIxotfY88bYOeUy2QqG75No0oMiySx4Arqr8/sT7+9m1KneBd7AaQfK47n5kvFb53DrQFwIb2zqiwqqe+ay9/qOhjESKXe1zEHiqoyjNOjbTsMAIfuyJGFFid/mniLzskE5F8YMaSAVhM6BLT6++KY75Ef/suECfzKtet60oFV54fbB7T6johgfEGx3mYUL93W4EdSzd29SnYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8ORu/hmTr7dlvtRyRsBP40DOzjbltA4Il3DUI1S7jg=;
 b=mvRoR1H/f4g/XFEfWju3FSzHNNX82zMdvRfL7Ds9DG0GjhDu+WHLLgsoDNuCt7krByjXseMzHxx3VKQMdcQYe55Kn623ScAoG53wasD01QDNJB9iJyCr232HSJGGXOUOBBNxBBW0z9Dh7ZI1f5Giu1SBr951IHA75VmElPxAf+3ZhcGhiLqM/4vqmKw1zUNFVLMX64fmqyDCghMmMDvmZ73H2F89uQmPfKNzXimRYzuij+xGS4bFhAHA7leSWYmoKL2uBnUf7CTmcp4U5iSAqjSOkeko/GAw7foEIF0Ap1haHrnkEmKA3BnVGDScDNjz0AoQKj7aaZFOYCuJ/dN4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
Date: Fri, 8 Apr 2022 12:24:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Juergen Gross <jgross@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
 <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::30) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe3b42f5-13c2-462e-6fe6-08da194a00b4
X-MS-TrafficTypeDiagnostic: AM6PR04MB5063:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5063FF8E151B063F1A384120B3E99@AM6PR04MB5063.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ul0stOIqjFzNaE6vkdOklvQ472jUFmukqx8T/RhillVwdHTDsAJ4letlcuxSBmjnBI4eWKDAPTH3CfKXxFz4Wq29AHEuaM3/mEkx7TxAbWrYkYAnLeN07jydXkZbMrIFZPW/xP0RNVnFbmrRCUmWxlmyOK/hzsdiAiHVl7gHcON8UTWoE32AfYoGOMmlh0rigVt57UJIhvSUFPpqyvNlIJahM6yTVaq1oIjoREnzB5hNUX8/m5ZNiJrMrv/9j0Txixa8Fib9BwKDPeRqXQ8uvLTm04htAF2qKtx9l8VlsX2qu0o/1Vg0aBMIbb1IGN3wKL12FASf08+fCixtFajBJa1tn1VCIyfWnapbYzv+DEwZageCePNqI1W8RsYrsgpgat2J+QsyhDeyDRmGEyLlZEARzpRPLEbTyz/ceLq23/YCCauTGGhY5KlvHb6EdIDrmiStajbuaN8ZaXHNJotPewOBpXpOGpWYEpY1g5FAygSvJ65sBJBqJoaTYMp/p4Uy5Ne9CkZvYfQNjOsFFZSchu2HpycsfsXP4AzucI+MhraqG/g+vMCt8aWGQEbi1JlU+mBPMoZX5w73BWYfftJm3DdQ+5bfVLxI71FBMeqPCbcQwP9+0Mw+bfFKMtKPvn2MgsEYIPZUvxv7Bn2E3FqeEicWQvjLdvnaCaFWJa1waypJ/ioS5c/HHSLItIGBaB8pSQ09xcbKZci6+n116FfORo3V90GANSMovs2CRsg/aCMisGcg42stdxdyLLvtP0v9RyOvgZENMUH+V0n2OKF/qQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(66946007)(316002)(31696002)(8936002)(31686004)(86362001)(6486002)(508600001)(36756003)(54906003)(4326008)(8676002)(6916009)(66476007)(66556008)(186003)(26005)(66574015)(6512007)(53546011)(83380400001)(6506007)(2616005)(5660300002)(38100700002)(2906002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NfSlyUOahPMi77AaiydoVOPK0Fk/abg/uLWhU5T5Y7PMHFqNq9su9akCBmO9?=
 =?us-ascii?Q?VISFGCOKo5s9uqq2D2CNJkrZVI08MLiywAhmylqEKukMJI4yA+jIT+LGdKC+?=
 =?us-ascii?Q?Aw5AvS6YKQ7Xlh6CuiWbzmhxnMKqe1rNmDA0DBQ70uXy3jtToQ+LWUJz9gQg?=
 =?us-ascii?Q?PxHINGDqwyPYXkGR2KUsErJzKakErOPMnOPQzHrSGI1Pn6MMTwc0pZC54a6g?=
 =?us-ascii?Q?0gWqod4meyFNGHriV+w1MdCY9s0nCHIkE9yAJKF0gGG6RJnI2D7j7GpAJPwd?=
 =?us-ascii?Q?LKMcJuGhB4fqRMxBPJomty3x3R0M0arm2etk77gwMunfrVl1dNo2OlUJgMb1?=
 =?us-ascii?Q?oQ+wP5nMvn0Klo2xxLdk9+Cg9kBK6H2FyeHQgfeAFCBj+Bu6Q9DK3mBAeYSw?=
 =?us-ascii?Q?OIqMkXfN5rvFpfRQbpTxtqsRsP0Qziwst8fe6hVJZh4NOVuRi8KkDpwVecuU?=
 =?us-ascii?Q?8RLdFDB+nNUF72oKj1cH0R5pGc7ioLRjox6bSgwP8oxoFt9nfkZZEQezGC1m?=
 =?us-ascii?Q?TBfMoCK21d/vdO3MDbfZ4PSBMp6Nc6llQOVmQqCJPvcmqhaB41KGAP5CF+z3?=
 =?us-ascii?Q?w5Ql6AgcJLoqZ4tSDqVn5lwhRtXtbXEqKjVXiBINLuFE9Hb4ZErbwn5AjdVf?=
 =?us-ascii?Q?r1NTxLxLX5WM7Gn5y9QtIiU84F4Ot2HiC0Vm5nNEtkYTT07nVfPu5IjFMpqp?=
 =?us-ascii?Q?jf+fgG6bsi2mr6INaYDuEA6R9o8iyxClH6JbTNONs2X/735bupqbukJ1idil?=
 =?us-ascii?Q?/a2dvav3WN2wwEdye4cb9SulPOOZhROOpHidqLAGsPs14HgTiIsYZ4wVFVuL?=
 =?us-ascii?Q?9WMuggQpn8wuBRl1vIfI27zx9w4OikOCc6T8wKkW+aYEJFew9jEdqSqkVOXo?=
 =?us-ascii?Q?y+4C+9kFbkli39BwCVohuxFYlyz5BrvM/qrs4lj73zJf4S/W0Q4w/JdPuC0P?=
 =?us-ascii?Q?kkY5QkbMKLiSy1c3CbuhRvZrK29qr6jRvm+Y0F7orZQrGtzD1aNB7L3eZ5Fi?=
 =?us-ascii?Q?NxnU0wjIc1fMlKf5qwBbHhStkT+kcEgQJzgxsQ35WYNR7oZ7i/gfMnkt8dps?=
 =?us-ascii?Q?tzqw3BljWe1EQuyb3sG77NMWuh1R4oSsGu7RK32xV59whzEVVuitumS+LSy2?=
 =?us-ascii?Q?SaQL49NLtXB0gnPw3j9sbY9nAA1aa9K71W0JzSQRAMacWqUZ1N2v7r5YHGwt?=
 =?us-ascii?Q?a5PjtsuHoAeuJSYudm9Ve/fbayIGmn/QOBKJ3FW8He4lR24jRkyzTyEjwInF?=
 =?us-ascii?Q?eBd4LWashXlaJjkxlqOXIVX/39rEB7E7tXjSlTrwss7uLWC16rRfRsvSMaYT?=
 =?us-ascii?Q?XnW9SXt4MFtW905fBXUlH2bM/fs6hy08CUYygbZBxkrDgx8Sii6Jk0ngjzYG?=
 =?us-ascii?Q?MB37iaPVAbixr0RyJhklez2nqMY+KXOw8kNluQiJ/F9GyN/LqKeiQL0o9muN?=
 =?us-ascii?Q?3JVK+yC6B/mts1jTKNk+2xqQoS3k1UrM4l1e/9Z29yP88d0CdP0BYEyag2ch?=
 =?us-ascii?Q?ZQVGVjLtWMoqiFPgs6DuwSyloMixUnQnSrS6A1nBBvPmpSGF5xF+Gk7iub0E?=
 =?us-ascii?Q?11bqa54R6EruSWbnrURr+eGDXaLxeUP/iYSflC1MxkRhhuxL1vq9094vq72U?=
 =?us-ascii?Q?v9JSs/m6bSr+yjXTu1IocB8AO3oI8vHAGg8pNIEpUUeB3groezsjZlr8+RhB?=
 =?us-ascii?Q?3hMrtB9I42o35866ujCJcwXDF+TehoSJKSXO+bHf8uVAAcn88bam1lo2WHzJ?=
 =?us-ascii?Q?M05ciQgMMw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3b42f5-13c2-462e-6fe6-08da194a00b4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:24:45.7539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki7tjG8TKok9o1q+EHR30AYKO8Y8HdSb4xrn9zC1V/XN2JElMv2sBbzoan+vVvfjyBOgc5Umf6VMfDL4GzOZ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5063

On 08.04.2022 11:39, Luca Fancellu wrote:
>=20
>=20
>> On 8 Apr 2022, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.04.2022 10:45, Luca Fancellu wrote:
>>> @@ -106,6 +106,8 @@ struct xen_domctl_createdomain {
>>>     /* Per-vCPU buffer size in bytes.  0 to disable. */
>>>     uint32_t vmtrace_size;
>>>
>>> +    uint32_t cpupool_id;
>>
>> This could do with a comment explaining default behavior. In particular
>> I wonder what 0 means: Looking at cpupool_destroy() I can't see that it
>> would be impossible to delete pool 0 (but there may of course be
>> reasons elsewhere, e.g. preventing pool 0 to ever go empty) - J=C3=BCrge=
n?
>> Yet if pool 0 can be removed, zero being passed in here should imo not
>> lead to failure of VM creation. Otoh I understand that this would
>> already happen ahead of your change, preventing of which would
>> apparently possible only via passing CPUPOOLID_NONE here.
>=20
> Pool-0 can=E2=80=99t be emptied because Dom0 is sitting there (the patch =
is modifying
> cpupool_id only for DomUs).

But we're talking about dom0less as per the subject of the patch here.

> I thought the name was self explanatory, but if I have to put a comment, =
would
> It work something like that:
>=20
> /* Cpupool id where the domain will be assigned on creation */

I don't view this kind of comment as necessary. I was really after
calling out default behavior, along the lines of "0 to disable" that
you can see in patch context.

Jan


