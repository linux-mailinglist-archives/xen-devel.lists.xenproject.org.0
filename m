Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eODPMTqhzmlZpAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 19:02:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CD38C4E2
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 19:02:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272261.1560043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8LRA-0006iI-Tc; Thu, 02 Apr 2026 17:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272261.1560043; Thu, 02 Apr 2026 17:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8LRA-0006gr-Qo; Thu, 02 Apr 2026 17:02:32 +0000
Received: by outflank-mailman (input) for mailman id 1272261;
 Thu, 02 Apr 2026 17:02:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1w8LR9-0006gl-Qy
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 17:02:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8LR9-0077q3-7J
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 19:02:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69cea0fd-2eae-0a2a0a5409dd-0a2a45048162-38
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 19:02:31 +0200
Received: from [40.107.162.138]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69cea126-bb33-0a2a45040019-286ba28ae5eb-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 19:02:31 +0200
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by VI1PR0301MB6670.eurprd03.prod.outlook.com (2603:10a6:800:17c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 2 Apr
 2026 17:02:28 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::de05:9ff1:c370:ecc9]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::de05:9ff1:c370:ecc9%4]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 17:02:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZmh/NKY1ZHm3wIhXJSXGKrW7XEdUZqD6/Yb1jVy8jXpEtS6Da1RmPeoqEgfd6+1DErL+oZuYA03HvQ4Gsub4a3ISBB4HX9N9LfDzYyNkpIWyCxDGwZyraPEofNdZ629/deKW0eHpp4OURwmKPNivTIVedf0qQ1iwkj2r7G2KIi4kukHmtlZMdC9c3AEngcR+ih7QBakuc+xwsizyLWu0hpYXSbBGrpdrGX1fcYKkNXP/RJCYKl+fuGAZ+cl9B5Z68FHZpuzfuNz+yQbhGokovtg5mX77725YT7WTfw03a6jS8KR/j2+pT5Z9X82ZmmdtnJiATNEAYnEX6K47oXe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDlZg/NiG5Fe7uEXhyxORDB5ECosDw8AtFyvtmG3f3k=;
 b=BxCE3x4fwJnHi/eE6iKYLTg0YUF/jIf6YMQib0AHd+7mXlHdkQnnBJl9tUZlX/l2c7N248DSNTIh/3ABdHgJSXQKZg8ESLvwxaQB/lDEts5l3zD3AKf1U0roqiParMFeGoBnmCrnKk8zyTUh5q4bCNS+g7hAc4GrRPgwTgk+K+T7DP7KoX1hkkRk562Zcj2EtE+lcvP1NvYCzHC6CMeSlKeLYDRVRuii26uA+F3ueNKMngW6gKb3AF8GjoVKw4GDf055vOgIvzipaUxePxEI0dVj2UY5VysCRSXEEj3MnLuNYctwHwYwoYNW/ZF22Bok8qLcIHVDu1etbuopPjfJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDlZg/NiG5Fe7uEXhyxORDB5ECosDw8AtFyvtmG3f3k=;
 b=otAbQHMCd2XCp6gI3vakfNOCplAruUhpRsEnPt2nBwQjZaqW22uhSw4WuDAheQkDrZuOVp/s0xXtzNmQ7iM+sKgz8rDCfapeVphsaLKhpuG8JgNu3vZpHdNtpKuXGes/Vxgy9rhBnrdrs/MnWuzjqSOeNQ7etv6j/mIEAr+JiiH+AOlkK6LfzChJAUFQRFIwbocd7rLhUz//WyYJdWYJeWQ5nxcExaq2irNAiJHqYPDH1/AGbJKm3vhQ6uJGDDucpO74+7TnLxsDLCs3m/rMy5cozvPAlFNNfMQheFfzgV9kGMEHI6xXu0ajhEFQpbLRXfvWz2azpf9JlRB/X8cqRw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 4/4] xen/arm: its: pre-initialize ITS quirks before LPI
 setup
Thread-Topic: [PATCH 4/4] xen/arm: its: pre-initialize ITS quirks before LPI
 setup
Thread-Index: AQHcvEPnDsMTi8ib6UWvK8EWGL+9fw==
Date: Thu, 2 Apr 2026 17:02:28 +0000
Message-ID: <87341dthwc.fsf@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
	<a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola_kvach@epam.com>
In-Reply-To:
 <a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Wed, 25 Mar 2026 12:38:33 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|VI1PR0301MB6670:EE_
x-ms-office365-filtering-correlation-id: 1df2077f-3790-485c-f12e-08de90d99ee2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 LzaO6ryevKfHKaZGnlrNeUWCa9MGklQq7Cc5BK8Ek3cTKJBj9S/YLMxFpudbM5ux0MqBJxwCOQ0AxHyiwPXH/zqxpUKUHyg0XES86H36ovboYGu7CInCe98XnTPBod8aSEfJVaLJU+B62cgr3ha/sfhQW7ohsTmxuFW+KsiKO1qiO2buQV+Z14gEuCClVZE5Iby4n9L1LEkRwMpFgerzl1Dgs5GlCpvuznvEBswiKrzQeDHfaRcEeYOPutBWGNbKXmfzSMYESdUQlE3hjAVYq/Ne+nA0e11VV2vvtcsWGlr6Sp7sg9j+9eBnGpwLhhKRsUg/Vla4MPau3fj4FHW4hYiw2BpvBI3UhBPuOSFLuvkkF7FQ1UXUg9UxP5D/j939QIbI/h9ZHgVR8KiA2AAUXQuLgVru3QcZ+ar9sua4BNhlStA7zGuOAW0IHsTOxbcl1VCpGtHvqcTQgZTCxsGUc8YkHKZYDVlNJ6a8C9HUfCrIgMDOGVrP3OlJFUf9ifLrusZ9FwjPhFsiC38no6XY+2cfV0nhjfxjrKh6xeBC82SF7pAStKu4smv1dZJKKWTwwS90JEaElhqj09f739DP6RIIh7gCi5DqO4nQGVNdz1hU2NRwsoA4wZcdtzwKcSpFYjhkOk/VoUOZiASwH2bS7NOLTqcmfM0i4qrfxXrSL1bY0pxnszwcei19sHpyyW86kZXuGltsqVaPpHmx+fvX5LFNi01kq1BlpfC4i+bbxt46nCN1O4PRgFWWI0XfDmgbh1xCzjbuKgoO31t73WlzE61mqQPrzmXSfdUFxPZ2MKE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Boj6dahQ4982XwVuOmvmj2CW5f0CUhnSet5Xgodc52m0fwF8mIZpbzvtyf?=
 =?iso-8859-1?Q?QP4+DeGkPaWH/vs3JX0C7s9kF5M772aikpSsRVFe7TEqZEVhZIXKT/SLVe?=
 =?iso-8859-1?Q?70Xpvz/Q3h+5U+2MyDuk7e7VtVavauOGEArgGlR76M9PCJGoGYD9chyUVP?=
 =?iso-8859-1?Q?WiwF+V/DuSrR0HC6tIb6WZvzJtUVvdEC+U9/FZI8iCowH63/zTdmv5esn2?=
 =?iso-8859-1?Q?QA8ApNSSGOZsgPJ6h+QsChkrIurniLoorvpQ0gCVQEkzz2QzmOMB7Enl8B?=
 =?iso-8859-1?Q?BWneeFVn5Iov88V4Hs/7xUr1JKfiFDlKNAU+BHio7av8IdqU0fqUAWuOxM?=
 =?iso-8859-1?Q?pVWJbUeSThvywBLIYOvO4qSk1hGCtGjj2w8GROL5PEmH+1MDDbpswju2fV?=
 =?iso-8859-1?Q?8m8eOmF5O7yvYC0yS+Tvo03XbvGaE4ITcocic1Ytbqk7eJ0qrJzDS/dnlQ?=
 =?iso-8859-1?Q?r3d9e5I2Ru42BLArGyibjqqfE53vVbcwsnfytgPwaVT7RoK+l15n3AtgPK?=
 =?iso-8859-1?Q?UNup2JAcdKl6bz7xsi+nNT/iCshvqVOjx6DrzY9YhN26vqTtA3VkAbLNyc?=
 =?iso-8859-1?Q?4I5+/jvi9qil4miBtyDo6ppnC4vlzKpRPIiZqZF4caabmRq/gErKRawc+p?=
 =?iso-8859-1?Q?kT07P/qxZbSGp/5puceqqfIC9Wqe/hL3R68/7+LoFOApX5jYsaTbVR1f8+?=
 =?iso-8859-1?Q?qJv1N5j3jsutNPXZvpl9LtG1l982W3/Xkm5ZHu/CxvXnwY8hvIUArrueiN?=
 =?iso-8859-1?Q?74xUko+IujUFmgSCP9X2AVAt/eJ0IkWbXDsj6ZIl0YNRsdUcA5Fs7JgQTG?=
 =?iso-8859-1?Q?xAVrn/eRdg3dDHRlnoeVP/doSQ1NN0eylIavPXTonCdv3CiqXs7lW//wI0?=
 =?iso-8859-1?Q?I1t5rFsoFnj2CxlUL5meVbqgCI4mB1ozuKHZHCMUUJde04Z2J+wmeLy9L1?=
 =?iso-8859-1?Q?OFJnGYg5VxYn6S4ReR8EM648uPy9dABo9i+K+QJvn8idRJLWeqakV8A1Sg?=
 =?iso-8859-1?Q?/qqjkiKlv8Cw3RbNIDNcwEEmLrSdNlTr0YCRsDhbHPo7vlAGZc6BissHXa?=
 =?iso-8859-1?Q?dHM9uGeSImqDeXNZrqP2lmCkBcfEzNnq5rnxYsILy25+kCYE9ttzwa/0YI?=
 =?iso-8859-1?Q?xdvL/4KV9RHJvj6OpF64pQyU6X7ht4yDhDDl/Mph4J1v5Bu4GE1a7zb6BD?=
 =?iso-8859-1?Q?i5F471qb2I7YwRwtS9LXPxR3FQ5TW5uLA/sAoE5QAkY3kbsO4HpLKSykqs?=
 =?iso-8859-1?Q?UaULAnAVb3cDCg/4FRWv9/ZylfsiMqIZ2hFNnFYynoYPN9KCtEbTmVgUUb?=
 =?iso-8859-1?Q?ovV7mtK737DLgb3PASqR6b9Bda6+yQ1s3v6Yar841X8C2SzxvF9qt+R/io?=
 =?iso-8859-1?Q?Cx+orCLNtrdOtK8tf7wbDUTvOIcHRPjeYWP8T6WvQMhozwVo1miIIznDys?=
 =?iso-8859-1?Q?UVbQrmdztGXTvTIOIKtn3Tk6QVtCld+JRowNFlpurV5QFqbmGnSmuccNf2?=
 =?iso-8859-1?Q?cme9ojrohRwm7sEJKmZyB7vmm49+LY4ZHY/14YJbAHWm0Dlixg3eLYMLLh?=
 =?iso-8859-1?Q?1NxXaOJHo9PLneGBY8ppY/FIOzgPPFRrXeUuZY0X5FHSxfxGNCLIR04cji?=
 =?iso-8859-1?Q?aR9olxV+3wiQ3G5Sbcu5ueaU3eBWSYL5qabo57s7f/VgughR7g4akmq4tq?=
 =?iso-8859-1?Q?bxLJ/pOhb/ilBmh2i7b2LIpaG8o6YRaq9Pd+Vpnvz3jTIhdVfMQUrzCbLv?=
 =?iso-8859-1?Q?AHmSFRtT5R/6jAfZHAK2CD5xmvnlQEdvOS26ReEQt3IJzdMjqjdiSsrRpD?=
 =?iso-8859-1?Q?7vKTLTQFDk2audh2yEcvolkoygq8n9A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df2077f-3790-485c-f12e-08de90d99ee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 17:02:28.1109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Has+XzRvg8J0WDvKqmNyqoEpmY0I0tSXLLDf3hwSndm0kfa9U71/YG5U6q+bKi/e30F04CRt9jl5E2oljLJtvH83xH7ZQd4IRH9J9+62g4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6670
X-purgate-ID: tlsNG-ebf023/1775149351-B031451B-6E1DB5E0/0/0
X-purgate-type: clean
X-purgate-size: 6190
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1B3CD38C4E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> In the current initialization flow, gicv3_init() calls gicv3_dist_init()
> before gicv3_its_init().
>
> When LPIs are supported, gicv3_dist_init() calls
> gicv3_lpi_init_host_lpis(), which initializes host LPI state and allocate=
s
> the boot CPU pending table before ITS quirk flags are computed. Non-boot
> CPUs allocate their pending tables later from the CPU_UP_PREPARE notifier=
,
> while redistributor LPI programming happens separately in
> gicv3_lpi_init_rdist().
>
> This means the boot CPU LPI setup can observe default ITS memory attribut=
es
> before dma-noncoherent and other ITS quirks are applied.
>
> Introduce gicv3_its_preinit() and call it before gicv3_dist_init(). This
> keeps the actual ITS hardware initialization in gicv3_its_init(), but mov=
es
> ITS discovery, quirk validation and quirk flag setup early enough for the
> subsequent LPI initialization to use the correct attributes.

I must say that it was hard to review this patch, because it does more
description says.

>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> TODO: Think about separating Redistributor/LPI attributes from ITS.
> ---
>  xen/arch/arm/gic-v3-its.c             | 36 +++++++++++++++++----------
>  xen/arch/arm/gic-v3.c                 |  7 ++++++
>  xen/arch/arm/include/asm/gic_v3_its.h |  5 ++++
>  3 files changed, 35 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index ee432088cd..0251d91630 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -63,6 +63,7 @@ struct its_quirk {
>      uint32_t flags;
>  };
> =20
> +/* TODO: Separate Redistributor/LPI attributes from ITS quirks. */
>  static uint32_t __ro_after_init its_quirk_flags;
> =20
>  static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
> @@ -148,9 +149,15 @@ static uint32_t gicv3_its_collect_quirks(const struc=
t host_its *hw_its,
>      return flags;
>  }
> =20
> -static void gicv3_its_enable_quirks(struct host_its *hw_its)
> +static void gicv3_its_enable_quirks(void)
>  {
>      const struct its_quirk *quirk;
> +    const struct host_its *hw_its;
> +
> +    if ( list_empty(&host_its_list) )
> +        return;
> +
> +    hw_its =3D list_first_entry(&host_its_list, struct host_its, entry);
> =20
>      its_quirk_flags =3D gicv3_its_collect_quirks(hw_its, &quirk);
> =20
> @@ -603,16 +610,10 @@ static int gicv3_its_init_single_its(struct host_it=
s *hw_its)
>      uint64_t reg;
>      int i, ret;
> =20
> -    hw_its->its_base =3D ioremap_nocache(hw_its->addr, hw_its->size);
> -    if ( !hw_its->its_base )
> -        return -ENOMEM;
> -
>      ret =3D gicv3_disable_its(hw_its);
>      if ( ret )
>          return ret;
> =20
> -    gicv3_its_enable_quirks(hw_its);
> -
>      reg =3D readq_relaxed(hw_its->its_base + GITS_TYPER);
>      hw_its->devid_bits =3D GITS_TYPER_DEVICE_ID_BITS(reg);
>      hw_its->evid_bits =3D GITS_TYPER_EVENT_ID_BITS(reg);
> @@ -1161,6 +1162,11 @@ static void add_to_host_its_list(paddr_t addr, pad=
dr_t size,
>      its_data->size =3D size;
>      its_data->dt_node =3D node;
> =20
> +    its_data->its_base =3D ioremap_nocache(its_data->addr, its_data->siz=
e);

It is very confusing that add_to_host_its_list() function ioremaps
ITS. It should not do this. Or at least renamed it to
map_and_add_to_host_its_list() or consider moving this to
gicv3_its_preinit(), maybe?

> +    if ( !its_data->its_base )
> +        panic("GICv3: Cannot map ITS frame: 0x%lx, 0x%lx\n",
> +            its_data->addr, its_data->size);
> +
>      printk("GICv3: Found ITS @0x%lx\n", addr);
> =20
>      list_add_tail(&its_data->entry, &host_its_list);
> @@ -1238,16 +1244,22 @@ static void gicv3_its_acpi_init(void)
> =20
>  #endif
> =20
> -int gicv3_its_init(void)
> +void __init gicv3_its_preinit(void)
>  {
> -    struct host_its *hw_its;
> -    int ret;
> -
>      if ( acpi_disabled )
>          gicv3_its_dt_init(dt_interrupt_controller);
>      else
>          gicv3_its_acpi_init();
> =20
> +    gicv3_its_validate_quirks();
> +    gicv3_its_enable_quirks();
> +}
> +
> +int gicv3_its_init(void)
> +{
> +    struct host_its *hw_its;
> +    int ret;
> +
>      list_for_each_entry(hw_its, &host_its_list, entry)
>      {
>          ret =3D gicv3_its_init_single_its(hw_its);
> @@ -1255,8 +1267,6 @@ int gicv3_its_init(void)
>              return ret;
>      }
> =20
> -    gicv3_its_validate_quirks();
> -
>      return 0;
>  }
> =20
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16..6e44d23d64 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1974,6 +1974,13 @@ static int __init gicv3_init(void)
> =20
>      spin_lock(&gicv3.lock);
> =20
> +    if ( gic_dist_supports_lpis() )
> +        /*
> +         * Apply ITS quirks before gicv3_dist_init() sets up host LPIs,
> +         * so pending tables use the correct ITS memory attributes.
> +         */
> +        gicv3_its_preinit();
> +
>      gicv3_dist_init();
> =20
>      if ( gic_dist_supports_lpis() )
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index fc5a84892c..e1d7522ea5 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -156,6 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
> =20
>  /* Initialize the host structures for LPIs and the host ITSes. */
>  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
> +void gicv3_its_preinit(void);
>  int gicv3_its_init(void);
> =20
>  /* Store the physical address and ID for each redistributor as read from=
 DT. */
> @@ -219,6 +220,10 @@ static inline int gicv3_its_deny_access(struct domai=
n *d)
>      return 0;
>  }
> =20
> +static inline void gicv3_its_preinit(void)
> +{
> +}
> +
>  static inline bool gicv3_its_host_has_its(void)
>  {
>      return false;

--=20
WBR, Volodymyr=

