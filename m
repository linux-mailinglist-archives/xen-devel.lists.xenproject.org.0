Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE40C4610FF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234382.406774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcqz-00049F-6B; Mon, 29 Nov 2021 09:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234382.406774; Mon, 29 Nov 2021 09:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrcqz-00046m-33; Mon, 29 Nov 2021 09:21:41 +0000
Received: by outflank-mailman (input) for mailman id 234382;
 Mon, 29 Nov 2021 09:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrcqx-00046g-Kf
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:21:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b727d824-50f5-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 10:21:21 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-ogU_VbDTMsqu_dW44pXJEA-1; Mon, 29 Nov 2021 10:21:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 09:21:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:21:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0096.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 09:21:23 +0000
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
X-Inumbo-ID: b727d824-50f5-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638177686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXdp9ZbadeiHp47jhbONsSuZCUgJ0dAv/VoBkInPNoM=;
	b=HpSbqmztaewQzmj2g9E/wWmEOAfstuVCm+u+7+WrMluPHkYQKP4KeG1yY18alDBiBaviJ5
	075t6Qoq+DzfiHfRJ0w6WUIJskQHpEJ21T+egmJfu0f1360k3GV02ymRRiO/Im/u1J2eOl
	ABOJkDaOUNIkag0FyICLCnEumG0wMJg=
X-MC-Unique: ogU_VbDTMsqu_dW44pXJEA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCct9lW/M3qVM02rhpx1FyublysCxzEHsHYvptBSQP2dY/6T+6ewtr4Yo5L4zMIogeEfNDm/dxDamboLD7nVkWSkdGK9/gyFwMQ+pgtPAbc+QQVlF1OnNA8awfuHTa2f9r1iG5BaUj7aJUlvIQzlzI6SLM3+0E/LZvg4iH5jjv4gjkSBQ9w95Wmq9yPbUTYn0M0u8p7cLNQ9sGDZX8ni4KkJbdEbdT5J425todKlOAhWu0eOOgMPhP5wGAcFW+9xJ4pEP3InLp/wcgVpHAer68hIMxs/O5hsHNko7YsXhDYnlNoyNsYGyj6r+noImpMVyzpddDuLt1+efpcA416mOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cEs2/M3jieIQEYwYwHNJ+hh85DhRLGO3M18TCSvnN8=;
 b=bnS9xwa02k/VpNjpc5CyvlxKtfjB/h3a2yYMhfDF5/cpy/Ac/Fo4v/TQM7RxArd998Tdq5gTTly7dDcoll7TZoRlD4zFFPJD1ja14aDTg3Qhcl7+f67muvmspKtoLfmKP9oLZe9Lls/C2rdvGaFZ5UaQObLxH9deAxiMsGdo0Cvw+KbhdziEezO128o9vptieMfwJ+6c2uQbE68X2XAySapRVeI71V8d9HnYQvNpbIa42PCievJ2XGuyr+kj2T2E1kcYksP5j5/SK1MFQasMJ2M1QhyuIxV4pEB0+Awcm9yhxfGpCngJrCd93aQXU2c5e2jApXCdTR5q3YqCnx258Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <566dbf20-2881-80ac-eafd-57ac4b217f0f@suse.com>
Date: Mon, 29 Nov 2021 10:21:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 01/65] x86: Introduce support for CET-IBT
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-2-andrew.cooper3@citrix.com>
 <69d1b4a3-a042-c2c4-2f59-ea897886ae1d@suse.com>
 <e7f8a52a-5761-88dc-97ff-6c2feca2effb@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e7f8a52a-5761-88dc-97ff-6c2feca2effb@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0096.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0f62e6d-6848-4bb2-b95c-08d9b3199cbf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702F84E908A9C259AF5C121B3669@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/9QNyDUKA+MUc+NwrKZMm+MlpeZr5eTTiZPVmupoR9SQOYvMgsjawADaPTTfKtv3oBE3LKcxxxBj0jrr9Fu1IxglIsgaiiwZI8vMWljelXP8Ollkm6RamNCRhHMnqy3oPD7eJXtADiuEwZgkuQdqWHaXY2S8McVoQeug4hso3fDUFZlTvOuaDyGo6Fo7PoUGcIsWGy5/42NmEOgtEizk58U4hAqptO8o2jIoYq1Mt4fsLgyu0IJgT/yaEsCsP04uAkZFwbq9unoLszlhU023loj+4ZRgUFgKRyEuUPjdjRtwQCmrFCdvUspVGY+p8TmgcbXAEwLTIOTgdRlbLqwLJdsxrx2vEDfaZn+il+sMkRo0dv/awHw284KxaOXWAm5N6iDFwb6jYIgxE93jDq1+q/IwhFZlgUMwQJrcU8xMxoHGDm52Pd56m5OzDyE2KU/SMOz7nF0HKKZ5ze2BWUf7vKhQiAVKx+WS9WYYFRhdjGj51PoApBEQNHF+8v8X5OdzA7pOFiBPnicAQgSFJzUnmvKeSVxflA9/oVYRr6gPoojZsKRFWWjr/GSiFVEwFh9S92TCVUZytzO1G/n2yZMR/HaMV/bammLPHsqEcenHYle1cMyh8p5KuU4XXi928iIxAQsxKS3/GJqlyDDlaDy5IKxA08F3U+ouvba6TNk/5zKPv3o6bRFlcIfIo3c4JSmBV+Xf4b9BGSNTAI0GHyvEHiCECxEiGGtb3+nn3Z6oDCBn+REsIi6KEHEYu3zbNTrO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(31686004)(26005)(54906003)(53546011)(110136005)(186003)(6486002)(316002)(16576012)(86362001)(36756003)(8936002)(2906002)(956004)(66556008)(4326008)(66476007)(508600001)(8676002)(31696002)(66946007)(5660300002)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DU33zWBaUaIBOdQff/b9q9fhrfqakQaKHaKZOfk89FVQ7JZ1n6w0x9ENYfqY?=
 =?us-ascii?Q?bMrnQCzpiN4riYmBcP60HV8/bArWB3znO0zp6Q/glnOZs1HCWAZTBRqRzZIl?=
 =?us-ascii?Q?QvBlVVrXDt2eXID4At+iAtb2esyyDLk8QT8+5qjdO+bDACj+iMnY6c1+L6uS?=
 =?us-ascii?Q?Wy1KolUeTRzj3FPFgdvTHrNib6aGOpVzEhwkQAKNLSMZY1r8P2H9Bh1zOm8J?=
 =?us-ascii?Q?YPNWAMJWFouhmUiLdgVpFmUCEo1Qxmj3OXGlyrCvvxyXjvIwtTes4z36ZuNg?=
 =?us-ascii?Q?Y6I2FASzri0BOiQ6T/9oHOt8n7RbBAO4igiaGNVRZNEb9e2Mb+vh24iUDfEe?=
 =?us-ascii?Q?jVyh4qDPT/Pubgv1rpUgx/4fuqHGkkkigeSumiuJv7phzwRjZtEp9RBNDSDo?=
 =?us-ascii?Q?q8lAYMHyeDcqKVyOlUzh7N19PXGm+akwWnLG7YneOHdZIzbmEHotfUdrHi71?=
 =?us-ascii?Q?ShYZjUHRbL9vf4a4r6adp6Q8VpxsFFpoL4jijA5kKKTC9iPnmphX6MopNVxA?=
 =?us-ascii?Q?th1k5VQxxTEdbYbaB4SdcqoMA3eRTOHY+03CnVtLUk2r4i7pUcenW3ZeTj0x?=
 =?us-ascii?Q?esvNpdoiOXPEawRBGuBdDDh+JVPwlILfHZpcMkFL7qRNJE2yzcwvPb0IqwnS?=
 =?us-ascii?Q?KofnTfeHqHyVplbPlDuIrVaPW8t1Im1ERSAshPt69OEYGnqPasI3dhgwwW8V?=
 =?us-ascii?Q?hbl2qzV42oHm8zIwww9hPBtbodJ1IS7U+RM/OjqlQE74k2plTtuyc9ZfGn05?=
 =?us-ascii?Q?rTOdbGYr9pMEIK7fJ2iX4n6VQ1Y/6ubeFSAnYepiRShxNH9KriHwuBHDhepI?=
 =?us-ascii?Q?gnfQfjZuBINpdS0/7IhRFdIRoJh2V4JLNxVTZUxaNTg3B2XlTCr+r4sj+VsN?=
 =?us-ascii?Q?KQtJubEgaHBopxirnW25FL1Wa2Zs8y4tz183HggJC4WCujBHvJFz+8fa8Uxs?=
 =?us-ascii?Q?IlOvNmtrhNH8muvb2ezqXLZHfD4JL3eLkSSXtjm2vwHRjeOXqIWDDQEpK4tf?=
 =?us-ascii?Q?E0BHFJ8HE8UTjQVBKN8HevcPONIwKd4OVY35QS+hfPBCTwRWHC/9S5C98IMf?=
 =?us-ascii?Q?nDZqAK93z9aaxJDt4ATo975lfG5tYa4pcGD8vhzYIbkPC6sA/AQ5Os2vnUQc?=
 =?us-ascii?Q?GJQjZXbUvlnMNfLWRtVknL0h0ShGFzovQYmhFGih7tuM8PiXJ0kZ/ehq4Yle?=
 =?us-ascii?Q?jLVyA6yY1Eq08HiAijs3SddAk0/YaVuQD7riX4fW5iliMfcAiDpP6YhKzvoZ?=
 =?us-ascii?Q?cjc9HZSjKCzfRMuWVNM9TllB8Ioxlb2bZkoh6+a92qMDtpvphs8zOi9feTiw?=
 =?us-ascii?Q?/5RHVgtI0aGaAFZyu4qVXCAm5Cu8DMh/LPOs6XjUUTLhxPpt42PulHvdsb3H?=
 =?us-ascii?Q?ugrccrred6BKV65xzumgYBz7UQf+A09tcRvjyVVrhjATM5Oedt0zfbrqHZGc?=
 =?us-ascii?Q?2W2OT5U184UhuydlzIjYdIAbuk3eblp/j4iWpn1m3a6CVbs4Q8DRAaqPA+jv?=
 =?us-ascii?Q?ROm0zTgDOSQWMABhw1TOoL7eEDb1ED5iESUQ9ndG65O1xyuuLbWM4+ejaS/s?=
 =?us-ascii?Q?vc8X3zZVOAS6PUX14RDq8NZe+HgijxOo/rv8C2F6I0lklieSNyrP1BCuUUTA?=
 =?us-ascii?Q?GgAc7YMTTvT032bvUrb3+6I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f62e6d-6848-4bb2-b95c-08d9b3199cbf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 09:21:23.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgCmr3KsF6WVstZumMI8T1e7PwTKnAE5ybJYraeu3ef06vc14d4gzmv7Jep2ivLdShv1zm3UgZ127qrdrbpW9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 26.11.2021 16:21, Andrew Cooper wrote:
> On 26/11/2021 14:10, Jan Beulich wrote:
>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>> @@ -124,6 +129,18 @@ config XEN_SHSTK
>>>  	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
>>>  	  compatiblity can be provided via the PV Shim mechanism.
>>> =20
>>> +config XEN_IBT
>>> +	bool "Supervisor Indirect Branch Tracking"
>>> +	depends on HAS_CC_CET_IBT
>>> +	default y
>>> +	help
>>> +	  Control-flow Enforcement Technology (CET) is a set of features in
>>> +	  hardware designed to combat Return-oriented Programming (ROP, also
>>> +	  call/jump COP/JOP) attacks.  Indirect Branch Tracking is one CET
>>> +	  feature designed to provide function pointer protection.
>>> +
>>> +	  This option arranges for Xen to use CET-IBT for its own protection.
>> Shouldn't this depend on BROKEN until it's actually functional?
>=20
> It compiles fine right from now, and making it BROKEN would inhibit
> bisection through the series.
>=20
> Nothing actually matters until patch 65 turns on MSR_S_CET.ENDBR_EN.

"Nothing" except that until then the promised extra security isn't
there.

>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>>> @@ -35,6 +35,11 @@
>>>  # error Unknown compilation width
>>>  #endif
>>> =20
>>> +#ifndef cf_check
>>> +/* Cope with userspace build not knowing about CET-IBT */
>>> +#define cf_check
>>> +#endif
>> Imo this shouldn't go here, but in tools/tests/x86_emulator/x86-emulate.=
h,
>> and then presumably without #ifdef.
>=20
> I considered that, but the test harness isn't the only userspace
> harness.=C2=A0 There is the fuzzing harness too, and I'm not sure we want=
 to
> force every userspace harness to provide the same workaround.

But that's the idea of putting it where I suggested: This header gets
re-used by the fuzzing harness:

x86-emulate.c x86-emulate.h wrappers.c: %:
	[ -L $* ] || ln -sf $(XEN_ROOT)/tools/tests/x86_emulator/$*

Jan


