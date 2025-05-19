Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DBABC318
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989961.1373934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2le-0005ak-5o; Mon, 19 May 2025 15:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989961.1373934; Mon, 19 May 2025 15:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2le-0005YC-1T; Mon, 19 May 2025 15:51:06 +0000
Received: by outflank-mailman (input) for mailman id 989961;
 Mon, 19 May 2025 15:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2lc-00055d-3s
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f403:260e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ec3efc-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:51:02 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:55 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:55 +0000
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
X-Inumbo-ID: 10ec3efc-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVhH1F94F8WcCg02MnqypWYfjYA5Rs8TFx2DewgksMl9LrKTx4wRYIzVlOOKEx5NDGy28yVyhPuv2UsFl0larQMcMSqEYH+MLCeig5vkHiMjBVpcIMNTIp5NFay3lckXyBS0l8wqnpajB9Y0onabwggn1K00P0VQxpmtvnN8VYm9NLcYxYKA9gDBFzO5+OgpV1n5EPVpYP1FDoEbwzo4pKNngpHdhqVLh8F91YF4rTSwWAG6bp17BMDyJA00ybslqE574Om2OO5Jqqivf6BDEZk3o7/RUVLOKjWCD/uj+R8stWdlvRRsdAjD02A0MBy+dkUJiz6Yba2oLx1ak4iyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUkju2omIIym+Lx1lnHzTO4HLWdLui4dm1V50RKOGHc=;
 b=hvyOHLx3EAkfyatxnudy9BRmSBcKEiLxARmME1VQnSS6z5Oe/6KJUTN+LpdN0Lf3ne9aZMVVPdt/aZCHtfur1blC+r4fLJ3c2ZUfruiAGG6ftNVVnSiHoabEHTqHjaN0joYtMaRoLWAGDuZRQyOv7NaIqYguUUiZAQqecJqDklA/dUIT7Rr1ufdRs1mwTki+60b6r6DCHcBl949vQP3/PzSbHSbkK7OnUnC4MaI+ILk2hdbxZWc8DBeDYGncTB+8pOUhO+i7WrsI+HupSXr8RFbi2QPMiDk0v94kHe8PN3/rpI411Mp2GC4l/0bSLUtmqjZkvzTGvBRzgwRi6AzEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUkju2omIIym+Lx1lnHzTO4HLWdLui4dm1V50RKOGHc=;
 b=J0T976dK/8SbmsKIpaUbSDjbDr0ntAQ90q8gT3s0mTLSDSirzAphzVSKgiMdU5VZwtam6ohnPC8CC6NWnEsbmv8bOSjw1AM4brAAcBGV++i/cr4rgDkdv3J9qHIv5zu/0MHKoP1KN/T+lEzeeT582iZ/W6eiJWOrRWxmdCoLQUikb+VEbE09IQWuouTTlscTchAfbHWiemqWSYXypwfO8DBl0JOX/Fyi1gJag9sf/9JjVfdrxY1zx7qYIUNYMOTM/WTyrUtwVjs58gSqQ2h//ltujMYjKlPTuaBPvxuRuUN3fscrHz6XN8ezG3rNEpqYkfk+rLJ1fpszhJH0D2eLjg==
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
Subject: [RFC PATCH v4 0/8] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 support
Thread-Topic: [RFC PATCH v4 0/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent support
Thread-Index: AQHbyNXOhvC4eZK2DUaLACAnive8zg==
Date: Mon, 19 May 2025 15:50:55 +0000
Message-ID: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: 5f778934-43a9-4e45-2455-08dd96ecf10d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+766BHqIYySAICMsv+t+4FfJvkGjASdhDImmwJqRNlR6tp26UwpxWmbWww?=
 =?iso-8859-1?Q?uMmMnlXxrp3cXdZcyFqbgDgrZ/NThrwZ8QZvjDZUkIzAd0PhAcbBSN3XzW?=
 =?iso-8859-1?Q?CBlPB/gDR8zXHltgwPkiL0C03L44M7hhyYMOSIFiIaFAzF0sst4L7O2H86?=
 =?iso-8859-1?Q?dIAUUnD6gg/F0zMIxTwvEirQ3z+cV6hzVBaM3iX/YsniWCVPEUzXGYVnnw?=
 =?iso-8859-1?Q?FY4H636IBHYOZsuvOBkH1u+zLiCYnqquvMfSVVX7XCjd24JONlNSr+AJ8x?=
 =?iso-8859-1?Q?kvs3tDTB1y5yiLd9wlKAYRZeoBwnOVO8LZhLJbjrzzCdXESf1+amZRf3Ne?=
 =?iso-8859-1?Q?KECYBunB9gBfATj5tIMiGIukLircgbpPdSLmaqKIBtw8aeeEd6LQT3JsJD?=
 =?iso-8859-1?Q?UGy3spzizVPNfg0OrM433w66FS+oq41mRUBWw6ORxWTtszBCXFrSxYnXRj?=
 =?iso-8859-1?Q?IgYBLm4+jUo26vxhzDP40dzNTk1ejvXg+Ra8NQy1rNik82WeXiYapAcFDc?=
 =?iso-8859-1?Q?Pk/9KHSaCjpcVAl78A/aNvXvISXvhOdt2UX9uRkCMllKGSClOBLM0ihAvH?=
 =?iso-8859-1?Q?egZ59Zw8Wp25on605YIz59IlUfGnoDnW/TsfzlCSzat1l1I9V//pUbpFvd?=
 =?iso-8859-1?Q?RxGzrvV0AidsesdSSzlkoCdg+5JgwYMbb17XtWiYVY3RMoTeOb30DfZFiD?=
 =?iso-8859-1?Q?saCDtpQIU4HLiaUNDmJBKl2HIp1Wwh3kaeiNcRCyeDRhuZiKjs5CZrfqyT?=
 =?iso-8859-1?Q?L4gEAHPH9ZdMeTdN1MtmiueMaxIpjeCoVd58AkmtUgvogotyYMBFZhkz/f?=
 =?iso-8859-1?Q?Ya8sPgcZLqCFbcOYiH3MiVB5/QT37ixVghKlm4Kc0tPy87XPFnR3KCO+gP?=
 =?iso-8859-1?Q?+8lZ3aMeGMcYa50Lsl0Fr8vZ7XL70+bl++IDBMDoNT+Zd0FFrViKHIPp7Z?=
 =?iso-8859-1?Q?xxjZ2aBVJ+2o6gQxTcGhbsnE5KwXXGV/rbHVu1Ox1CJEjh2Mx3U61obiOK?=
 =?iso-8859-1?Q?OxvQ4+sDypiUkjymG+1IXwtTtOIBfn5xUqSKbLe/29GA3z/0Wcc44FRSDL?=
 =?iso-8859-1?Q?4X4jiyjshR435FXH+g0P34HuFsnHbStxCaL0QctWLdW7LCmmol2qO4BFXn?=
 =?iso-8859-1?Q?0p5i2d/DUHljeG8yIAv4ejnyqY9jt8uMPn2XQ0xyt8mi/bAPWZc2qiDATT?=
 =?iso-8859-1?Q?mAtyjVTjr3eO98IEO4tMU81O2YR/WlL7YfSWlNk90rKNa3omJCeBermEQO?=
 =?iso-8859-1?Q?xjp1H+GXmmVpAxb4Y6dK2PgQCfU/YpOwzHkH+NWXrfpGm2z97U16qxu45o?=
 =?iso-8859-1?Q?/oFsv2vR8uJuvbYTlOyAPmPIFf6CTmnSVl3C1AQIo8DI9abv0N7nObWL7r?=
 =?iso-8859-1?Q?IC75FMiNGTn5ruq/Dajtmfe7AC6QeIIz2evPmwQkulhfTJM2UOkqYNCC0K?=
 =?iso-8859-1?Q?tEH2h25zXqYyQJim4sfyGPSJ/YGWZSAIecKnnBXkSUZaOoVxl8q7gFoXDR?=
 =?iso-8859-1?Q?M+OHHo8rd0JC7p87LIQlcE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Z0sIDU2JxkSTuAvmA6Oe4DQpMhQtopuWGaJ04hMgAMidW9MCUZmuqyGWdk?=
 =?iso-8859-1?Q?VnODutzvfu+FoNuYeGMzx0O4TGn4Q1KuNENo740RFOcJGZWLj+s+MiYj82?=
 =?iso-8859-1?Q?bdYlE2rbgHwMSgRCpjW11j8RDGlko/FbRkEQKAnxTAE4GFlQA9XvYqfIQ4?=
 =?iso-8859-1?Q?K/VYY5yoY8ZHSyRp/fvAFjMHxDJ6IT3Pc2i/13Eivy7tzBi4WLbNvo4TsY?=
 =?iso-8859-1?Q?6DqUFPS+bpAZQTPWFNGyWHaSn4ny3R4bOuTOOYNUUoO4XOE62zEWtqoO53?=
 =?iso-8859-1?Q?t3XWee2pWfnklXxw0NOHGOcRdmCTVMNKYEXYH6giVDkKaF7nkiV14ZWbnE?=
 =?iso-8859-1?Q?0BlTXZBiwxQBH5A+evvI/j6J6vvSSIBpzrXvUvySJdZf266eBG9+r0wN+f?=
 =?iso-8859-1?Q?nekHaFjjocnllQUT7Q3IcOrTw+2rKJdSHgpF4ptggYGgo32+onwQqcKyoe?=
 =?iso-8859-1?Q?7x02lDqaL48bFZbEPeqfaMMUgc6dhV/QOQ7nqLD8ufeR+husxMaFi2xkX8?=
 =?iso-8859-1?Q?CYdH6/7yBVWYmPRDCjoFvfWYHkL2YM3zgYzVLRG0uy5/LrwsnJ2r23ETu9?=
 =?iso-8859-1?Q?fHx5xdM7HDQpQiXiVhJ7P69xAHwwRSYtHzM7T6Ecop6JnvjAb3/WlnSDy/?=
 =?iso-8859-1?Q?xofsnzBjzo01uSdgSJTjYAMTHYX+u33zA9QP9g7CndpXJh9TGRw82xQUW3?=
 =?iso-8859-1?Q?TpOrc0oSVbKJjvaWtJRxzNixrCTjkmsCZOEOZSkMb5mz61rELDpM8CHUDs?=
 =?iso-8859-1?Q?xQATi2SSiFJK9f7+rof/2VZveVseqpycMRsGuPD7NPH0F0AkUSz3eKyJYh?=
 =?iso-8859-1?Q?AFDGhWXO/V1wJ9yYpFgBJCKe9L2fBGdy1i0nYmyTHeDGoukxfHVVK4Ksj7?=
 =?iso-8859-1?Q?a0c3p8WHrkAjoCxkFVQlvW0Ztmbv46mWFdYGNpelhLQPq+nmJpxKs+SZfA?=
 =?iso-8859-1?Q?wLn467+ii2GiYD/jz5hvYdrH6m2YA3Y4/zoJKHGeqalGdVoT4id7N4lxDp?=
 =?iso-8859-1?Q?5mobM9NcO/UXTGxvW8UcEYcSib9+/HKi4IK9T+6r13rDix7rm/2z+xrovv?=
 =?iso-8859-1?Q?oDjdJAD/oZUJj+1aNd4tAWu2UoUc4a1s2/IpEOzWmUZPNx4r1QAsygWqzQ?=
 =?iso-8859-1?Q?6aGAblXHGW+37oqu+d3vUJZfIWWyCqlkwkLsHZTw6X6B1e/ek7ofGeSEUy?=
 =?iso-8859-1?Q?CIQzh6otHHhUF1esjgOny+K6QemyQ3CVk3sMFgSUwW1AQ7G2Ms0c3X3xLX?=
 =?iso-8859-1?Q?/8h04w4idusCu+U+APaS9ilWfex/qAACzNo4/Ee9cmqkHL+XqIkcaVX/4v?=
 =?iso-8859-1?Q?Hq3ZWC9Kp66JudNzglAzw7hZ3BD3P7tkxqxvy/UfKgdadbjTEatNPjQxE7?=
 =?iso-8859-1?Q?KO34CXID3fW7VY7J0II+RTAHAJJau/aOaehbwwf7brnGKBZ5ysuiey75kE?=
 =?iso-8859-1?Q?ZZSpDxN/nsKRsmkvDhn/dHiNqDOoaN755O4t90B0EMAOpRkx+BWkzw21Nv?=
 =?iso-8859-1?Q?87V6g00uhTHRgPvaUaHf3wKnew8ZDsrIK3Lgdc4q6HtrYVFesYestl7Gb0?=
 =?iso-8859-1?Q?Y6WfMYaKcqo589gOySND1RwYrCf3Tz9j7UflL2lAZ78m9EfyXixffshitS?=
 =?iso-8859-1?Q?UJA3yVFgkYd7vInXlxsKe8QE7BzQn1gGY+C6BWIOTrZNWkR38/27a77A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f778934-43a9-4e45-2455-08dd96ecf10d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:55.6950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0v5AhyOnMC56M9C2ps7S6n2l72R3QBH185HpyUGvrxPXw5WXNeuit5/xljiL3/04WN85KRlurJZhpWaMxBusp4te0oX3o6jFYBV4xnFlBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

Inroducing V4 RFC patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC multi-agent support.

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probin=
g
instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
dom0 code directly.
- RFC changes in XEN_DOMCTL_assign_device OP processing

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
- add documentation section for Simple Arm SCMI over SMC/HVC calls
forwarding driver.

Patch 5 - xen/domctl: extend XEN_DOMCTL_assign_device to handle not
only iommu
- add chainged handling of assigned DT devices to support
access-controller functionality through SCI framework.
Change was done in two parts:
 - update iommu_do_dt_domctl() to check for dt_device_is_protected()
 and not fail if DT device is not protected by IOMMU
 -add chained call to sci_do_domctl() to do_domctl()

Patch 6 - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
- added "xen,scmi-secondary-agents" property in "chosen" to inform SCI SCMI
multi-agent driver
  about available agents and their configuration. It defines <agent_id> to
<smc-id,scmi_shm> map.
  This option is Xen specific as Xen is the only one entry in the system wh=
ich
need to know
  about SCMI multi-agent support and configuration.
- each guest using SCMI should be configured with SCMI agent_id, so SCMI
  FW can implement Agent-specific permission policy.
  -- dom0: dom0_scmi_agent_id=3D<agent_id> in Xen command line option
  -- toolstack: arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D<agent_i=
d>"
  -- dom0less: "xen,sci_type", "xen,sci_agent_id" properties in
"xen,domain" nodes.
- factored out SCMI generic definitions (re-usable)
- factored out SCMI shmem code (re-usable)
- the SCMI passthrough configuration for guest domains is similar to any ot=
her
HW passthrough cfg.

Patch 7 - docs: arm: add SCI SCMI SMC multi-agent driver docs
- add SCI SCMI SMC multi-agent driver documentation.

Patch 8 - docs: arm: proposal to add separate SCMI node for Xen agent
- proposal to add separate SCMI DT node for Xen management agent under
chosen of xen-config node, lile Hyperlaunch "xen,config".

This proposal introduces a new approach to the Xen multi-domain
configuration, where all Xen-specific configuration has been moved
under the "/chosen" node. This requires less Dom0 device tree
manipulation and isolates Xen configuration from domain configuration.

This approach provides the following device tree (DT) parameters:

- "xen,scmi-secondary-agents": A Xen-specific parameter under the
  "/chosen" node, which describes the SCMI agent configuration for
  the domains.
- the SCMI configuration for Xen (privileged agent) and the shared
  memory configuration for all agents are provided under the "/chosen"
  node and are used strictly by Xen for its initial configuration.
- the scmi_shm and SCMI configuration for Dom0 are placed in the
  "/firmware/scmi" node so that they can be moved to Dom0 without
  any changes.

This configuration allows the use of Xen-specific nodes to provide
information strictly needed by Xen while using the default SCMI
configuration for Dom0 and other domains. As a result, no additional
bindings need to be introduced to the device tree.
This simplifies the Xen SCMI multi-agent configuration and utilizes
generic device tree bindings for the domains.

Code can be found at:
https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv4

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
- toolstack comments from Anthony PERARD
- added dom0less support
- added doc for "xen,scmi-secondary-agents"

Grygorii Strashko (6):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
  docs: arm: add docs for SCMI over SMC calls forwarding driver
  xen/domctl: extend XEN_DOMCTL_assign_device to handle not only iommu
  docs: arm: add SCI SCMI SMC multi-agent driver docs
  docs: arm: proposal to add separate SCMI node for Xen agent

Oleksii Moisieiev (2):
  xen/arm: add generic SCI subsystem
  xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver

 MAINTAINERS                                   |   6 +
 .../arm/firmware/arm-scmi-proposal.rst        | 224 +++++
 .../arm/firmware/arm-scmi.rst                 | 442 +++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 docs/man/xl.cfg.5.pod.in                      |  47 +
 docs/misc/arm/device-tree/booting.txt         |  75 ++
 docs/misc/xen-command-line.pandoc             |  18 +
 tools/include/libxl.h                         |   5 +
 tools/libs/light/libxl_arm.c                  |  18 +
 tools/libs/light/libxl_types.idl              |  12 +
 tools/xl/xl_parse.c                           |  48 +
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/dom0less-build.c                 |  49 +
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |  11 +-
 xen/arch/arm/firmware/Kconfig                 |  36 +-
 xen/arch/arm/firmware/Makefile                |   2 +
 xen/arch/arm/firmware/sci.c                   | 191 ++++
 xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c            | 173 ++++
 xen/arch/arm/firmware/scmi-shmem.h            |  45 +
 xen/arch/arm/firmware/scmi-smc-multiagent.c   | 860 ++++++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c              | 191 +++-
 xen/arch/arm/include/asm/domain.h             |   5 +
 xen/arch/arm/include/asm/firmware/sci.h       | 214 +++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 -
 xen/arch/arm/vsmc.c                           |   4 +-
 xen/common/domctl.c                           |  19 +
 xen/drivers/passthrough/device_tree.c         |   6 +
 xen/include/asm-generic/device.h              |   1 +
 xen/include/public/arch-arm.h                 |   8 +
 32 files changed, 2856 insertions(+), 86 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi-proposal.rs=
t
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h

--=20
2.34.1

