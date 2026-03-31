Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCByMbHry2l6MgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:43:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C70D36BF66
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 17:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269116.1558242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bFM-00068J-JP; Tue, 31 Mar 2026 15:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269116.1558242; Tue, 31 Mar 2026 15:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bFM-00066T-GP; Tue, 31 Mar 2026 15:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1269116;
 Tue, 31 Mar 2026 15:43:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w7bFL-00066N-Bb
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 15:43:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7bFK-00FtVe-Lx
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 17:43:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69cbeb92-5cb7-0a2a0a5109dd-0a2a450cae04-0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:43:14 +0200
Received: from [40.107.162.75]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69cbeb91-f93d-0a2a450c0019-286ba24b0865-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 17:43:14 +0200
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by PAVPR03MB9139.eurprd03.prod.outlook.com
 (2603:10a6:102:326::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 15:43:12 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 15:43:10 +0000
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
 b=eyVvV+O6BxRgJ0wAmIONJH2Y/t3okqrDee3NFyMHRGaQPICdNCzLdmaPrf7fmsPkIlsTWGDkvgz7EIOAFf/gwk63XNVO+8+W8wJKklc7ZAmCunRmWO0jLZw+PWdUBMeUBshhvctVB8Lfhk7Y55iovI3NVdO3X8D0gtaA/PB8XphpcdQrEKDlmZqlWWRCQfgED0w4F3iIlvgOhR8aAKbGJWOJGVGkblavDpP9Fj+bO5RvgifFeLf4fgMlxgCfITzlFi3aBZW46VGpck7Qg78BhE2qgALQs0ZvlBfPjDe33W654XCXOIKPyyjDoUsY28s4NfV6fsCaXmrOOfx6Qy4gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhGP5Po/5+j289yQqaXcApoqaMGwV/q/N5BbRPfqwrY=;
 b=tX2XTPo1c3cWHJr+thd0q3girU6U2hlh7MeGi3cPMGXjHhAIam528I5+t2S5raXPGmwij7ZOaj0cSn8hvzRDpVnOZibNslGvu/FxelA9iiikSUtNzIXZtbu3ADggzJUt0i76p89GevJ9VGSb8tByi3TSDT5R8nB4sfyVS44IuAGhlC4UytCZO/nRgvq59BT2t1c/VjUSej3l4q6nMKyM3yH/RwiBleKYDuhd4xcIOTISDlShApM3/h1xfHqrGkddeOjCByCNH8uJ6Ni6tOPCXqNwM/0V9oAU5WjHDTaEbjNtLRQqElTD3rvruWe93+dvyoT7fwQ9+zKTLulxeI1sGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhGP5Po/5+j289yQqaXcApoqaMGwV/q/N5BbRPfqwrY=;
 b=qU8JB7+r7fHiTJqArNdIY+mF/DHSX3gEWnbeEDvP3Nt45FFACThPeBw260tifz0gll1pMpkPUPY9izywJwyKLd+nYmWAlTENtd+aCiz/2nbgX9SiOo/2UssgkY1W4ATqGbR6nLGL9nVcu9xg8BOlfZJ1mhfTsT4dIqC5qdXMX0Vzclfsv9MSp2nTTNVT+TAZxWphn9wncnTMVUKB/22fzq5UXNgb71dNDvVPMCeX5Yuzohnu5P3vB+2yK2MWHvCkoC+Z5lg08p5QwHF1Ibw/r3ESLFUqHUqzkceYGWXjsUwX0m64yXQUbPU2Rs/yN6kwTH7+raGI9LKhTpBmRJMLNw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V2] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
Thread-Topic: [PATCH V2] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
Thread-Index: AQHcwSUT7254zXLHwUG/lf9z0n/ajQ==
Date: Tue, 31 Mar 2026 15:43:10 +0000
Message-ID: <20260331154309.2921483-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|PAVPR03MB9139:EE_
x-ms-office365-filtering-correlation-id: f09ee9e6-6e26-40d9-b65e-08de8f3c3670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NN2+7v4vLpImDkcBTU5yqx806mcGK/LXIySJ3HYEAqamSc7/zmQ780yuy2?=
 =?iso-8859-1?Q?x+sOXg4LNxANajDUslvh4DczMGXk78FdbF/kqgobAB/4CWkDwNcI/tNS1y?=
 =?iso-8859-1?Q?uo1Li0rEs0X4FBw5H5F4YmIt7e+SeK9AWV3axwzYYUxWRCVqAoRwliwDzo?=
 =?iso-8859-1?Q?dgy9FihfRidxzJnjx7csyAwfeBnZSKA9t4liteXCRGvnyAIGi+NLQocY1R?=
 =?iso-8859-1?Q?ZjAUCOoPxTQoCBeYYbkqgvho+5fgzUxDN1ZNyLZ+TadT6ZUeFZyGOfzfR+?=
 =?iso-8859-1?Q?DiZydhQIMK8cHQ2eKo5rRD8u9gNVmvSTJ2xlyV0F3wEGUhZHytCEwjdnlx?=
 =?iso-8859-1?Q?ZgrOBUrplSPEaai49obzzTljw4fQSHuoEJ/e06WtB03v+OJdjQcK8o7cA2?=
 =?iso-8859-1?Q?f14TUw2QVMvhhgokLselN1omGEW0h6g/fE/jUYVGyDsthPdFOW+a2brA8l?=
 =?iso-8859-1?Q?T49RRqKs0i4BLA/L2lOO/k/iwYHg6E8sHiRSddvfS75C12htWVq8d5D7Iv?=
 =?iso-8859-1?Q?3F5UySbhzIYAk3dU435uAJHNaNpjvqRD6dL06mcnbvpdj8QMQB+MADbSna?=
 =?iso-8859-1?Q?Gk2asNjMVJ+Gznq+irHzA8G9FWEBWwqOHCHst2i9luk2ihIqpo/Ig4B8kk?=
 =?iso-8859-1?Q?JApg4RqTDNF6Tb/qKFUqjTlZVzA5uPBZs1yFZSVI7QXffY69/XKhS8KRUd?=
 =?iso-8859-1?Q?uDdkGGFKYk+0xsovMmrcddKOPIUZFpHCPQ/8KziHzUiU6XR5gF/K3O6/Jk?=
 =?iso-8859-1?Q?ksGuCP7JLUUE48kduc5bO20Yd3IXerp5Jj7eHK1xtlFkfZYl8jKq5HdheF?=
 =?iso-8859-1?Q?88QAagfmljRcMXG510jFcSTBebha2DRdEolBAksxa0L0dFaWWJfKrFyjtW?=
 =?iso-8859-1?Q?Ku5Fc86jC8m0DtAgEkW3aVP8u8oVUoQTFplgVxHqsE+gUeaq7aPPP77ep8?=
 =?iso-8859-1?Q?GWpRJCIRdxtgo5Vu5oD0pv75FRe9sgNyeIKotKpO8RxYSIL085lL36JWAN?=
 =?iso-8859-1?Q?ygG3+s+aMVHN3iPN8DY0mhijlvvM3432fowwpKOS/XrZPwmDJVQs0NmSTp?=
 =?iso-8859-1?Q?Ytql1d8PKQAd6MTVOyNmlnyRF1E5qCURqb2SviUSaI2OHkcTTgaRqQzNg0?=
 =?iso-8859-1?Q?WgXAnvwA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8sTPrIrJBMji9jIhdHQI9cIqxuPKfJhpi/5ep9qetgB2MB/95rLBSa+Drr?=
 =?iso-8859-1?Q?5GFTmLiaE1ypJ7QQvzFG99lK1EcBwH9xFBVg3eBGhBJKNDHfq4si55DxY+?=
 =?iso-8859-1?Q?NFvanYkWfrjSWXeTwMZTedjNRGvK9grvyj8oTdyoH8HUGxRNZAZLqgmZGj?=
 =?iso-8859-1?Q?7eGDhgsp1DYfOhfe+EgG4oyrVUwYXhOg7wGTl2BDJzwO5jP7w+8yETzGAh?=
 =?iso-8859-1?Q?GX/BnOsdHDhKokgxYWbaZfoKwSXWX1wAf5eaTuHaVNq86DzVZcgHl21xy/?=
 =?iso-8859-1?Q?dU7NBnGNnyrPG/xkSChNii8EujWLPGhv3YThhhzVlBO6ZTej+CH5Z9fuJd?=
 =?iso-8859-1?Q?d5QIdUVTUfmPBE2VmEFAA7iFG+fS6hIzqN2HOFfLqJaYSSJy43F8s3xi3O?=
 =?iso-8859-1?Q?DLCd21F0Hx6rt/vLiz8Gaby3Xw1fm0aC2EFnqqJHIR7ZjWbSF1PDHQW+IE?=
 =?iso-8859-1?Q?gGu9XuNzCf8PBOa2fHvzFqK8O39dhLCY6Nc1ee22teA2wtkpQp9+q9RNeq?=
 =?iso-8859-1?Q?o28Jr4MEi6lb3Cd/7g1Y1xUljjRA9q1VKP/B1HLak0LlZg4yRmhwoMNEpJ?=
 =?iso-8859-1?Q?QRJuZG0rqqBSbh40tTaPl6pmPxTbZ9J5rzSw31Sguh18kI1I7Gw1TJLUv4?=
 =?iso-8859-1?Q?zxH5yyVapNhf8dA/2NqNZPtI5Rt94Dm5kuhcHkkxiByklRtd/5U5GC/Yuv?=
 =?iso-8859-1?Q?2b8TBTAyRw4/uVZQ1EU6TkSpKmlNuO/tLcKGNiHtx5i32q3JaYZ92T62uP?=
 =?iso-8859-1?Q?DVirbnDixGjkWmZUWQMOHtOOpgm/TsER4z+piq1N349LNm5ewXnEaTtROv?=
 =?iso-8859-1?Q?niaFSOXkXaW/GD5RMc/cwl7euYJNMDj7WSCAgV/SPv0FE0SL6ZEHhtLBjH?=
 =?iso-8859-1?Q?4RVN28w/7Q3Cf9R58UwXBTThJZ9jIusLec5sJmx66YHnS7YjzQ+KcaH4u2?=
 =?iso-8859-1?Q?bYYv4ZeK14+hjPi/X/ztF8lGWvUsYnMD58+2xUs8h+OTpuhsxHzIdJI8cY?=
 =?iso-8859-1?Q?7KIeN58dPoHf9Ikun2WZKcg1hHlFUx4185bIZRuIhqBScZVFCZZ7JDgo7h?=
 =?iso-8859-1?Q?55tbKAm3iG0DLTb2ecDShj7/efjZedV6qo0BeoVwyuUg5lADqfJIx5kNyx?=
 =?iso-8859-1?Q?o9putNNoUvDxvR0d0dNUQ9hD/iVUAJK9vrj1ZNtyWH09E6u3P4jv9enDaG?=
 =?iso-8859-1?Q?H7c7UEeDx23NqEprKRs+PUM3ESklr9pfonp5Vt6avtVfg5EAvhH5k5V3aa?=
 =?iso-8859-1?Q?iapy6F6qkmag5PEfqv3viyMosAo0pUSSsy0sGu/dqo4yEGrTObrm6pDpL2?=
 =?iso-8859-1?Q?nbBrpyh4RZ/QL5jILIV+0fezadGm2+MAhgy1w6uB3whOHouLKJgHabRDck?=
 =?iso-8859-1?Q?G7fy1egOjGZRWcUoNVv1KxU6pB8z2AS8Q0hpg/7mweMulfGsUQ/LD68CZ9?=
 =?iso-8859-1?Q?6F0LzyQYdJfA/07XIQxKf2fmyjH6Md21pn+J84yamrDwvMzbRRYd6RW7Sd?=
 =?iso-8859-1?Q?eo0aInIf8mgYR0bq3ZQ6kdvo3QPS2mlr4jP4chI4i8zxBvhr9m+Xz8j4Ku?=
 =?iso-8859-1?Q?uZMN6CeJpiJmYPb+SFbfenlCKX452ym25Ji/lnSnBQgTO5/5FbIo2lGt5p?=
 =?iso-8859-1?Q?iiUxaivXb8tb0ngcnMwAMGH8EVuR0gRAPVa3vOevrF1AolZbS29eVvCpxM?=
 =?iso-8859-1?Q?OmKydNst5PsHl68Hw50P7RZk8ifbs4JxlVkm5FfOQttEo2zQ1bJ5l5v6in?=
 =?iso-8859-1?Q?LbxBtWJ8xIxyALoMT6Xum9kE6C1CLolmk3dv2bUCK3zdUyIs7SyIRplO64?=
 =?iso-8859-1?Q?Ypgy8EhJvUGTsZlIL7X7efZjarwsAf/e625fxsZ24nydi7X9E3Di?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09ee9e6-6e26-40d9-b65e-08de8f3c3670
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 15:43:10.6719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 50YYkv4DD8u5GGXzbtWI7L/x1ZSEeq/sZ4roJOT/Fq+UdfCyQetFXbj4guXw948vn9ihPCuD66gx4jM+zioRKXP5MRtAf6hpP/88Z49JTNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9139
X-purgate-ID: tlsNG-d25034/1774971794-F5AB5734-E207E649/0/0
X-purgate-type: clean
X-purgate-size: 3340
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Oleksandr_Tyshchenko@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5C70D36BF66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>

Xen fails to construct the hardware domain's device tree with
FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
(e.g., numerous reserved memory regions) and the host DTB represents
RAM compactly (e.g., a single reg pair or just a few).

This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
required for an extra /memory node. While the host DTB might
represent RAM compactly, make_memory_node() aggregates all
reserved regions into a single reg property. With NR_MEM_BANKS (256)
and 64-bit address/size cells, this property can grow up to
4KB (256 * 16), easily exceeding the space originally occupied by
the host DTB's nodes plus the current padding, thereby overflowing
the allocated buffer.

Additionally, the SHM regions require space for discrete sub-nodes
under /reserved-memory node, as well as an appendage to the
main /memory node. Each of the up to NR_SHMEM_BANKS (32) regions
triggers the creation of a sub-node with properties (compatible,
reg, xen,id, and xen,offset). These runtime-generated sub-nodes
require approximately 142 bytes each, while the appendage consumes
an additional 16 bytes per region.

Fix this by increasing DOM0_FDT_EXTRA_SIZE to account for fragmented
reg properties (NR_MEM_BANKS * 16), the discrete SHM sub-nodes, and
the SHM appendage to the /memory node (NR_SHMEM_BANKS * (160 + 16)).
The SHM overhead is conditionally evaluated to avoid over-allocating
memory when CONFIG_STATIC_SHM=3Dn.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
  V2:
   - update commit description
   - update in-code comment
   - update macro
---
---
 xen/arch/arm/domain_build.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3cd251beed..07f331eac8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -98,11 +98,21 @@ int __init parse_arch_dom0_param(const char *s, const c=
har *e)
 #endif
=20
 /*
- * Amount of extra space required to dom0's device tree.  No new nodes
- * are added (yet) but one terminating reserve map entry (16 bytes) is
- * added.
+ * Amount of extra space required to dom0's device tree. This covers
+ * nodes generated by Xen, which are not directly copied from the host DTB=
.
+ * It is calculated as:
+ *  - Space for /hypervisor node (128 bytes).
+ *  - The reserve map terminator (16 bytes).
+ *  - Space for a generated /memory node covering all possible reserved
+ *    memory regions (NR_MEM_BANKS * 16).
+ *  - Space for a generated /reserved-memory node with discrete SHM sub-no=
des,
+ *    plus the appendage to the main /memory node (NR_SHMEM_BANKS * (160 +=
 16)
+ *    bytes). This overhead is dropped when CONFIG_STATIC_SHM is disabled.
  */
-#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
+#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
+                             (NR_MEM_BANKS * 16) +                    \
+                             (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
+                              (NR_SHMEM_BANKS * (160 + 16)) : 0))
=20
 unsigned int __init dom0_max_vcpus(void)
 {
--=20
2.34.1

