Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D8B420EF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 15:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108271.1458444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOD-0001fV-1V; Wed, 03 Sep 2025 13:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108271.1458444; Wed, 03 Sep 2025 13:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utnOC-0001dn-Ri; Wed, 03 Sep 2025 13:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1108271;
 Wed, 03 Sep 2025 13:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wznA=3O=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1utnOA-0001dW-Hq
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 13:19:02 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e0d90a4-88c8-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 15:19:01 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7571.eurprd03.prod.outlook.com (2603:10a6:20b:34a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 13:18:54 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Wed, 3 Sep 2025
 13:18:54 +0000
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
X-Inumbo-ID: 8e0d90a4-88c8-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hf/3nRkSHubX7dVzznCaV1UWhxxRrmUQ/7YKNHafZGtjMVO0mb+D2ltjnYlcJcN4rOhRr8rLEsKykwSwKOD3jD9ItLkpTzA9su6mRkY65O0S5wZTzejkzBIiZIqos3I11nbWev+aHUvw7H6eFjdaIxMCSULXWrqlxie6YNUOBXJ2qW8VHN8uvGYezt4+T6lnTlgrNG0b6EX05uh1wXYejcaO+MMooYfgL7V0a6X6w43MH1tl/fCI/RSj4+hZrr7Nm+4wn3hqlohdKehw37cKOGEQZXeLl0xeYNzhp+Ihlc/NrHMETt5d/OKDNhiTvKcsT9Xj1zkrhsyDkwvX6CgBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANcx1s4SQzXjrDQlB+kjY7oqnp1S/ElTbvfce69YMxA=;
 b=B8u8M4N+H2ODiN5MI3nEkk5Kc1NO671OXRurJH+CuaD2uU71C4Ma4XxTyIMag6O+syQ3uvS3ohQTFkUlF8jpA0KBMi9QA2vSWhracgcYiAUz/jpvkwoMfAIcd9860PaHWr0t6SWIroYihC7SjFp6ZFbwGyjvbx67dmORiusDLwgcemqEZHpOLUl3cWW8dhyXeH8M1cjpAmSoabY55+qssZkFGwj6tkWv0wwPF2IQ7whcbKlF7WgSVZhbw4rlR1N4D+cHsMqYkrfCiBIwJcDVS4786rrMW0KZftwvq0v87rorEqe6y71AIWR0uGB3Q3lx7A23iLPF+QaRTvUPJYBTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANcx1s4SQzXjrDQlB+kjY7oqnp1S/ElTbvfce69YMxA=;
 b=T5vrmCSbfMqD0nXu1SKvsCbTFDQwsPBFTU2aDKs86LMjCYM0/Sz4Z6Om7ui2nzpEZSY1uLw9WLRIUcjCCnYttCEdu2FwCU5DoN6+cR0rLfupPZJeOHfm0Q4PaGGIz/TxLR1ncIZaTRE/rHC4aDRnGy20KsEWuW7gwPYDP7MWiIIx9yNF8/Np5hTcejLaANE0DP+HcCyt7z5osuYiMSYs/EE08QkpBCt4ep7Klor4N6mEt4zy9dUaDFafTOihGeKzxGVOX2Ys1MwcQ3MVlsnbAQRNKAxqDid5aLb/M6ldTuiW9I8aYo2Wa6xQ+0cChmYob5HNZ/mM3rZwtJii9MQOag==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v8 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
Thread-Topic: [PATCH v8 0/4] xen/arm: scmi: introduce SCI SCMI SMC
 single-agent support
Thread-Index: AQHcHNVLdhHlv1cXk0a1m6gBYsABvg==
Date: Wed, 3 Sep 2025 13:18:53 +0000
Message-ID: <cover.1756905487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7571:EE_
x-ms-office365-filtering-correlation-id: 69efd87f-3a3b-4a5c-2ee4-08ddeaec6e4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+l+RM+Q+UMmhZMPPh73DMnL8zEhr+aKPXNeFiImYXzQ36YAgpSTEfe4tce?=
 =?iso-8859-1?Q?pdOiWJeFoby4T9+1/YikclI1A1Z5jl2uvBGKKNEg1pJHqQkaSZwat1X01Z?=
 =?iso-8859-1?Q?qZiekFqWJh2+b0HWExLAaBrooo8mkU3Pf2mT8s4O73kS4PyM7e3aY1Vj8O?=
 =?iso-8859-1?Q?H+OwLXvpZbSIhq2brk3cukDbSbwsmr8ZEIowxLnLikvi17nhji3TJODsG+?=
 =?iso-8859-1?Q?It63+30jv/QYO5iaCWfxOw6XB/HsvfVZv1JD+qNbIfbv13fO0CIMsSYibE?=
 =?iso-8859-1?Q?7TDyKp21jvSYF8u/cQU4GmfHiIDAng7S3CvI1W/rtvKMuJpvEkWwNx3bz0?=
 =?iso-8859-1?Q?QsJ6LCO/lsHyVUfvvjGAFQgdZbMsztwFFGGI5VikrXuBzlXPMZph8zjFjk?=
 =?iso-8859-1?Q?yZ0RPqCFx19WcxPWf4mjViBXYR9uJ6fsihiq1jcd9kPyUCvqid96xrUNHF?=
 =?iso-8859-1?Q?TnKQuiQD9uejPARHWXK6SUceH0ntN/mudhe4oaB+wbhDVAqaxFyTKxGVqp?=
 =?iso-8859-1?Q?9dpCKLCf/F/rQ3ldngbVfbJfQ19iRBLmQMLgU9VaQsUtDP39YsyvQYTcZk?=
 =?iso-8859-1?Q?bqmEUwG6a09OW8MwSxlQrXOh9APpcghi3KnSZ7XzsHzCQtWL3CC8iqpg0d?=
 =?iso-8859-1?Q?OstofxhAve8Xzw2pFm1QhSTOBm2RS48KznAH3DHTQDq3+IE49zw8s25iyZ?=
 =?iso-8859-1?Q?VKPwp39soKgoHhFxqgu8gP/I6SElgTAjqKtyNzfYNh97zJfe4GrrR0iH4U?=
 =?iso-8859-1?Q?PHf4p94A9f4vu33BzQ+x8XfS3QvUypVEz50q+zkQ3kqmS9Pgf8EH6BSmNY?=
 =?iso-8859-1?Q?sGK2vuvjbkIqx2DAbC5kx4YQvh3A80TZEbagKCvyJ9f4L3VlReSNLJ5rV+?=
 =?iso-8859-1?Q?eDTBC+PoQYdUw8NnBG55IWOm36FBHfeoo6AEgP7aXwG00vnDfH0RzWvCkJ?=
 =?iso-8859-1?Q?Kzi2RG8ImFmEeq/gqdBmfU1G8ExminFeKkPHbcakyMZKxwgPRk10YDeX16?=
 =?iso-8859-1?Q?1MXaH8otEWnvR6yN5W4igBsHnmjYFvNS8Z3c4dHE0u2DAUSeKYw4XYTPLe?=
 =?iso-8859-1?Q?o6MVlES4Tcyckc9z/08Q5dlrAjLYqq6N6lKklx2PlO0DQlzRErqSFeTLOj?=
 =?iso-8859-1?Q?IJtWJqcgIBcdWdCOKoDMGW6+zM2G76F8bj+X/UHiKCtHdlKkv7N9DT4OMH?=
 =?iso-8859-1?Q?mV+l6bcb6jsYJvFTjJPkPV5FDM+JEdzmkyxXq46dMfkvHgKMujtsfeDytA?=
 =?iso-8859-1?Q?SEOxwexx5QnWQFfkkpPCjqXZhhsuJaM24bHnjhBcDuWO2KllEM6BKIzm3S?=
 =?iso-8859-1?Q?lpRTmnSw61M/YZ5Gm6LNUlLtLstLJ1NwiXUFzYBenKTjbSG0aM5p6SIvRS?=
 =?iso-8859-1?Q?dby3P7bkNCUGO0bkgs/mw88WWeF39F56Sv05t9JWxVi5QLFlD/vXiP7+89?=
 =?iso-8859-1?Q?1kmN1NEQHbobqv0fGsgtSfLnZiOAq0zakhkOqR1K68tJuqPVvlGxLz0SRh?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gv/KE9VV8bEYJAaD5/ZLzSLwj7j6FAQ6w4gzvKFcegSp/9RsapnBi7thFf?=
 =?iso-8859-1?Q?d+XFvRrKjyn/QA8uNwobK5Eg357E5udFQDL8/fypVy8X565Y+Kt9ozsSkV?=
 =?iso-8859-1?Q?eLEqEiXLOwN0PXySBkMIavnoFMh/ASWlc8B1zeqqUSRl/gzCM3XXyvtqvl?=
 =?iso-8859-1?Q?jmVERXN5c2QF7iRhZkpwo4UfUxBhxyFk0l4pvuv1u2TkIHUzV6p8ZEqOxB?=
 =?iso-8859-1?Q?1yieER8vUmOIci9dAI73tYb1lZ5blQuCsDSEyo2GH+gtT2e7PHvZO+Zfd4?=
 =?iso-8859-1?Q?We79KKK35D00Tz0pM2yF48zM0Da/gGvUyZ5x42RH2BOzxQiIw3TvLSR3w/?=
 =?iso-8859-1?Q?rbMy5diqJIdjgfwjYdQKACi7cas8dVjLN+6t400Q7/NmXXhfATm1e2CHVi?=
 =?iso-8859-1?Q?HWGectbEURKwBw1sf4xMM+ZyxCiRMyfM55tvYiNSgccYugVjiFkuFxybb+?=
 =?iso-8859-1?Q?lMV605YwqsAdQNEvmdreEqVZLlXsna9elPxff2lyGEaqOauu8D921dnnoo?=
 =?iso-8859-1?Q?w/u8+iIGanPi3oMA/IKhgBaR855XzbJ7/VBguPXyEkoed9lUxOX26dbXYS?=
 =?iso-8859-1?Q?txZyNZ+K2iz72vAawP2X4Wl5yPI+aDfxptG//BLm39MTvZ07E0ZfdWDKhK?=
 =?iso-8859-1?Q?qLfQyW/VR1b87/LVOlUmp0feCALEyR4/jv2+VkL//bkziHWOKAuBPTwEOe?=
 =?iso-8859-1?Q?hVWLUGySdVOxCCkz+6uoFv1uJ7bT+Z+tSPUT/Q/WZfVHClUIBxCsXQtLF5?=
 =?iso-8859-1?Q?mMCv/Pwjq2h6WDAM4Fps4z/Uq21wtgL9oJxAVIqEcZC7yhCB1oz7c6fvWS?=
 =?iso-8859-1?Q?F7z5ducEiYeSWsD/YfCHbO2HjH2LvvVPSEfUV8KYQjf08SIhkrTgSwpeGR?=
 =?iso-8859-1?Q?JveB/6UD5Ac+GO9GdTtV00C1saGr+CsAhZF2U9BDsEbiJITME/aV4/py5R?=
 =?iso-8859-1?Q?fsH1343SapSiGUlBV6YmN+Ip9w3EVPeoio00wn7cnIK2TtNrQSHxr54IS/?=
 =?iso-8859-1?Q?o70OO3CgMm565Yd4o0UDOqz4zqd4RpmTdeUTOO6OS9dWMjOg6Nj84MUX8p?=
 =?iso-8859-1?Q?5e/5DOA9mMq9/zXRMX7LB78+xWKVnJpuMmD2ZYZmnND/dI0THLoINXIKLv?=
 =?iso-8859-1?Q?UaIU9oJgxG7bsC5K/KYNkPhF//XGUws9f732cGZUhDdzOgbxiJL2M4o/k9?=
 =?iso-8859-1?Q?w2KhH/EzqT7YHWHXnflGYWC2jQeT16kkHRRGL8qcpUiNqZni8+OmsfrfcB?=
 =?iso-8859-1?Q?bhI7rDVt0lBFozdtStsfvBPzsvTBBbx2oCyV0BnPOJgNknyHVglY422mh6?=
 =?iso-8859-1?Q?78ugYFMLtCchJmmgwpYfYfWTXDRyj6Qgmw9atv4U+WUQf+qkzabUGpkQET?=
 =?iso-8859-1?Q?aKdJqkK0syNFSpZGVk95azjN1OtYSTObrw70FdV+JR459DvtEgXznzBCm9?=
 =?iso-8859-1?Q?5U0SJRqgz5YpF/hjo119REeQKHzXfx1xLA2cz6dWbFzJFj6NWyMI6gS1no?=
 =?iso-8859-1?Q?XjvI8B7gKsbxhuiKQZh3BIDegyKqWoWTepe48lytOCF4oP/5EXZgBdLpoD?=
 =?iso-8859-1?Q?eKHCkmPJaKcIjJIYBpc6QGJhvK8uPyNH4RIKGqymkdl/UBf7FnX/mgq0q5?=
 =?iso-8859-1?Q?w7Ifhsfjl2Rd8OupSrHmi1rhL39NFkYQjw6fhJ6NqJuVhS2iwgM7SFEA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69efd87f-3a3b-4a5c-2ee4-08ddeaec6e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 13:18:53.9974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HVjFzy3u8okJAlBVHLzLaPsDVnHpr9K63t58U66J9v5sSAwoh6d/yerV74XXW+JSgFeNWpiqZaH923OYgEjIpJ/YyIaFXXx78QEiztXCkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7571


Inroducing V8 patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC single-agent support.

This patch series is the first chunk of the
"xen/arm: scmi: introduce SCI SCMI SMC multi-agent support" which can
be found at [0]

SCMI-multiagent support will be provided as the followup patch series.

[0] https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieie=
v@epam.com/

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probin=
g
instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
dom0 code directly.
- RFC changes in XEN_DOMCTL_assign_device OP processing
- Introduce arch_handle_passthrough_prop call to handle arm specific
nodes

Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
- update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add =
SCMI
over SMC calls
handling layer") be used under sci subsystem.
- no functional changes in general

Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
This is new change which allows passthrough SCMI SMC, single agent interfac=
e to
guest domain
cover use case "thin Dom0 with guest domain, which serves as Driver domain"=
.
See patch commit message for full description.

Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
driver
- add documentation section for Simple Arm SCMI over SMC calls
forwarding driver.

Code can be found at:
https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5

[1] RFC v2:
http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.ol=
eksii_moisieiev@epam.com/
[2] RFC v3:
https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927=
-1-grygorii_strashko@epam.com
SCMI spec:
https://developer.arm.com/documentation/den0056/e/?lang=3Den

SCMI bindings:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/access-controllers/access-controllers.ya=
ml

Reference EL3 FW:
RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
Renesas v4h:
https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4=
x-scmi_upd/

base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)

Changes in v8:
- reneregated {helpers/types}.gen.go, dropped unneeded parameters

Changes in v7:
- fix sci_handl_call to make changes more readable
- fix build error when DOM0LESS_BUILD is disabled (removed
 arch_handle_passthrough_prop from the header)
- sort headers in alphabetical order in sci.h
- sort headers in scmi-smc.c file
- Fix commit description.
- Move scmi-smc-passthrough definition to match alphaberical order
- remove unneeded initialization with NULL
- changed u64 to uint64_t
- Send warning if iomem permit access was failed
- fixed typos

Changes in v6:
- rebase on top of the latest master
- fix return value of sci_dt_finalize() call
- add R-b tag
- added generated helpers and types go files
- rename cmdline parameter to scmi-smc-passthrough
- fix goto tag in parse_arm_sci_config
- add link to the scmi bindings used in the doc
- remove mentions about HVC calls from doc
- rename cmdline parameter to scmi-smc-passthrough

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
- rename dom0_scmi_smc_passthrough in documentation

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case

Grygorii Strashko (3):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
  docs: arm: add docs for SCMI over SMC calls forwarding driver

Oleksii Moisieiev (1):
  xen/arm: add generic SCI subsystem

 MAINTAINERS                                   |   6 +
 .../arm/firmware/arm-scmi.rst                 | 180 ++++++++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 docs/man/xl.cfg.5.pod.in                      |  34 +++
 docs/misc/arm/device-tree/booting.txt         |  15 ++
 docs/misc/xen-command-line.pandoc             |   9 +
 tools/golang/xenlight/helpers.gen.go          |  35 +++
 tools/golang/xenlight/types.gen.go            |  11 +
 tools/include/libxl.h                         |   5 +
 tools/libs/light/libxl_arm.c                  |  14 ++
 tools/libs/light/libxl_types.idl              |  10 +
 tools/xl/xl_parse.c                           |  36 ++++
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/dom0less-build.c                 |  40 ++++
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |   8 +
 xen/arch/arm/firmware/Kconfig                 |  25 ++-
 xen/arch/arm/firmware/Makefile                |   1 +
 xen/arch/arm/firmware/sci.c                   | 154 ++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c              | 194 +++++++++++++----
 xen/arch/arm/include/asm/domain.h             |   5 +
 xen/arch/arm/include/asm/firmware/sci.h       | 200 ++++++++++++++++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 ----
 xen/arch/arm/vsmc.c                           |   4 +-
 xen/common/device-tree/dom0less-build.c       |   4 +
 xen/include/asm-generic/device.h              |   1 +
 xen/include/public/arch-arm.h                 |   5 +
 xen/include/xen/dom0less-build.h              |   3 +
 29 files changed, 982 insertions(+), 85 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

--=20
2.34.1

