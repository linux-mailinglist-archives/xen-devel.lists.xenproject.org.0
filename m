Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF36A82647
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944040.1342615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUj-0001x7-D2; Wed, 09 Apr 2025 13:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944040.1342615; Wed, 09 Apr 2025 13:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2VUj-0001uF-8z; Wed, 09 Apr 2025 13:29:33 +0000
Received: by outflank-mailman (input) for mailman id 944040;
 Wed, 09 Apr 2025 13:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scqd=W3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u2VUh-0001T2-CH
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:29:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f403:2612::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aadb78b5-1546-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:29:30 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7468.eurprd03.prod.outlook.com
 (2603:10a6:10:22d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 13:29:26 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 13:29:26 +0000
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
X-Inumbo-ID: aadb78b5-1546-11f0-9eab-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hW2823s0nB34YwLf9Q7AwYOqe/qqbAaO2bD+8L656+iRy8mJjT3t+nW0p6gPTN7sNXYlQ3p/qhbza/SY18cZJXtVVZ0465AOolExAIYE2KAbmiwkgOBx223iSD1a7Wv3gGYAiQW97LlG1YWX6OsESWVbfhyf9LyoqWvuHic1B/CnHhumisWsv462WRwDCX36MATcZuhmf/T0akJk6xDR4HJHrX5zyQH1bnh1tyBmDvhT7hA1cmryVrcQxpuP1DKC9FTNR9dUDFP2QMzGQSnwF8+y9ROnczncErsI2xImMXfcamBnwOS+AWd72kPUOQt0hndaRKkP1TA9K9GgdMRlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMepC8pnWD8OQuV+xZsknYQYTt7UOkxyqcg97FY+E/4=;
 b=WuDNJ8H2peP9KU7w8L1zAZnhWqASqktYgQhFjWT+ppd4Nzw+sY7HuvtXzUU6hJQGyO/MgwoWqbZbQgS4A3jBpgU5JB8L7oPyoP1zJaYlD7Fc0C82J/8YeWyzSieEguySPVbrdOe2SluuaEeYB9EvwFk9Ajhc8xxhEe7+E1bjkCxzLGrft65J+V6fQ5QhN+IFiLJaL4D1ctVoDIs71ZyKoXUovmcapLTTaRBbS4nieri7n0sk+XDT0s3NOdHqiJ/7J47uZxHSjYPMZzMG2H+UsouR25SRpDXx28H1EF87jgArSUtJ/DC80UNCySgj45A2nncuWeDST/2UoZXX9Awc7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMepC8pnWD8OQuV+xZsknYQYTt7UOkxyqcg97FY+E/4=;
 b=SWefdWjZ5+Y0BQAfZgTxGdmaBF5bKhrp79xL4gub6J7os00Zi+rRbMBD42EOEAz8rc0UJPTlY8CbE+7BTWN8IH7UAH0A35PebIhxt3uMOcRuD9Pv+kGBcVWArx/QMRBaeva0M1YMoWkR2TaNZut4GE60lE8bgk+U7FKcY8KawSs8Mo2ynuSRjF8mV0KDl3RoPJlDJg2lXAw/9ye756Nx3mA/hbOxeljkgH9EKm0ig1mx5UCIkoqDREq2UzLHIXiuoLIKr1azrJd5LbPeFoGDAnpgt+ndKOpkFD16lo+9fBZrhGBUqau8kGgiGNDVGK/mHcPBz/rCHSozYDkJ4AfhBg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH v3 0/4] Add support for R-Car Gen4 PCI host controller
Thread-Index: AQHbqVNqEBy4/LD6y0SUojR9cX8nyw==
Date: Wed, 9 Apr 2025 13:29:26 +0000
Message-ID: <cover.1744203405.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7468:EE_
x-ms-office365-filtering-correlation-id: 42275c73-c631-44f1-ce50-08dd776a8cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/wqFGUIqpn/1R/99jbrudrz/qmqyN9OBqR0VJas9Naz/RlpsvT878v0EEy?=
 =?iso-8859-1?Q?t5tFwcuCEe/sjlKHyyEQsQvgx0nj/PFl2AwCo/Sc0x/bX0EOMSXPYiYnjT?=
 =?iso-8859-1?Q?HF73Hx3Hvj1GfCd/5y2srmc5pjto1O67HWy4BdAcc5fGNmnFDSCRQHuL/2?=
 =?iso-8859-1?Q?ml0u13yOA2ZnydGyyq2Al5heLYQKxX7Y0OqR+w4+LPLLoMsauwTMMFHU/I?=
 =?iso-8859-1?Q?UvT7fW5eSk85YL3I1ZdiOjg3cX4sAUczax2aB8WK86EjBu9Cwpy0UXdIqD?=
 =?iso-8859-1?Q?26yIRgdSswINzUMI07bd16OPCVopGpqye73OuLEcDDOO52aS5szEfky0gh?=
 =?iso-8859-1?Q?QfHsefOO2SHjRGUW3uX+mEBuLAlEAAW2h+NrUD32hEFd4a1xIIbNg7NpfK?=
 =?iso-8859-1?Q?8dlCeOw9xu+icgsDW2ibudHyrkDIIJX3AF4Gps6e3+u4/M8k16clAI34rE?=
 =?iso-8859-1?Q?48syv+PMLzbJQ13VgJcd64HptP1MFl3fAuRBgw7nQ2nz9TC2MkY+NtRmL9?=
 =?iso-8859-1?Q?rZ4c1Yzy3UBq9FPAsS/rUFcfBksL0IIaJeVFwEYnNqelC/EUUElilNl6MS?=
 =?iso-8859-1?Q?pYwIhqzzV3ftVVwAsxn4cq64hTU8LZe2gmH9qnAp76SB+kpCGao2yRfMFW?=
 =?iso-8859-1?Q?kmZfrC7qDodE2oxsRdTFkO7rA22RRhnXdXyyTPKvF5tPMASm4HZyRmBpCF?=
 =?iso-8859-1?Q?mDSoHNk2G8XRJ5HMJlQF3Q1RTWschqBiobhGG9fGyWMFpc68u6Yma6BSG1?=
 =?iso-8859-1?Q?vwdV8XygPLXrfQI2W+FeW52m5etOh0lf5hbX6r/I/R2ewkU4Ehw7IoZ6Va?=
 =?iso-8859-1?Q?VISrPxXvSIzNzqKI5RpT2ai2TXsiazoIUKfEwWkEaCpkpbmj8DI/T8S7Mq?=
 =?iso-8859-1?Q?Akr4vqG6SBbI9qvtlQ0DD3+WEZEU9DBXu7nAE0wZx7Zk/VEqIHkiECw/ih?=
 =?iso-8859-1?Q?1YdiPqKs/2ebABkxkybPajDpfNVehtkBXo4VQjzoZKdKKRtpVFMYhRkaKt?=
 =?iso-8859-1?Q?AemUv4XyIH4cQN1JEAAWiH4uTarF+2W1hmmEenhBzNe/dvD+L/JxZZVKSu?=
 =?iso-8859-1?Q?nxDPabQhpdKjwad9OTWPcXe3P/s5C9QxYTlLUpD5JkjoAvQ4HpLG7OVljT?=
 =?iso-8859-1?Q?Hn+hugy4Zmh5A61xT6DwBLsCcC4tOWt0/niZiYH1uH265nn9bxEPCu7V3a?=
 =?iso-8859-1?Q?Qx8rRaqWmnKAs4bn97rKhOQDZ8NHW6vHqprd1DF/5GRv8fs9e1HHoVsTN6?=
 =?iso-8859-1?Q?SBrVTUTYi304WFBtg/eby6NP/dTQlMoZmvkXYrI7rW7rlpit3eI+x33FvH?=
 =?iso-8859-1?Q?wAxsYfW2wSJqA1Arz1U5gwBzeMVq1ST62fqpdFkEHOB2MsG4UKRkULaBff?=
 =?iso-8859-1?Q?ddACZsJK5S8qztK07tFGCYxDYiWu/zZKRlZHPbex3/sMBNW/mZJheVmHer?=
 =?iso-8859-1?Q?GK3gRXym4UQIuARsIWADFRJah7uGGb3NVPvyuajxDyWm2GIey+92dyNHzh?=
 =?iso-8859-1?Q?NoXPh+QN4GdHUo7FFYI27I?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gERXLmgrnxsNQSO2kFvKQWPmoGlHqfiTFn9I+G1pm9yhM/T6tu8z2Z3+2S?=
 =?iso-8859-1?Q?dG8qG0LuEShmZpaL6KqViU4Uoa2fsz/OHOAiz4USy9bVr+lYRyhw6mZFJ4?=
 =?iso-8859-1?Q?tef8ainBmAbs2cbHFs5jXnBM8QAOXGCdH7BOh3V+YWWMQjirzhj7RRyCze?=
 =?iso-8859-1?Q?u/uY8PWZJ1AJ661JSSBhPnYumqOtrPOD0BR9pfbmZVKPBIqhHs3WT6t+l1?=
 =?iso-8859-1?Q?/1Hvw9Wq6X6ncH7SThCtnBo7SGOGOnc94VwacqvdHLFcvzdMhkCteYBl6i?=
 =?iso-8859-1?Q?WSWeIpygNVksmHhFkMuAS3Muny052d5WO/88WWHuV6sywXVimYiUd1sluo?=
 =?iso-8859-1?Q?OAg0P/GRW8tgigBB7ZJfjdhxn0xFJbK+R49w7i6b0NxUE22RZJnrQKcI6J?=
 =?iso-8859-1?Q?hionYibzVpZLJA4HnVz1PZy6SMqPdn5nUL0VyDMomejkEmA7zw5RNlntPp?=
 =?iso-8859-1?Q?Z+/PX7gQZ+c+E9GIwR4EOGc0/W2isM16Ua00SyIxKbqRuLpvsCK5+wIGOu?=
 =?iso-8859-1?Q?23sosz0nPbNnBgds5Z1uOftUcwO2lFb/sooCHtr2oe2g2DSLN3ZMjrqerX?=
 =?iso-8859-1?Q?BycBtZhIWj7fZhAi+estJ5qUkqpiiZC0KOrFqHDgcfMhPdc8JiF41k49eo?=
 =?iso-8859-1?Q?KFTDCiecjY0gY2ZlojKY2mcNska6jEMabAN0GkaGOTe1fV0KPIVvFDpO/i?=
 =?iso-8859-1?Q?dx47aeBAnWkAKhhYeEavw8P3Jc5dLcsYH/0V8pJM4tr7Urm24ylvjfYd4b?=
 =?iso-8859-1?Q?AQbio1gPcccQLRTyXhAvy53Y79BlDqDEv8qsXfctoNpGH5WoxFwAnF6iv2?=
 =?iso-8859-1?Q?IgIyf2DG10c42LKNj68NIbgIhbBydy/N1J/ZhGhtNAiAtbV/OerH4viPJ3?=
 =?iso-8859-1?Q?uXTyAixOKnJ4qhFPcQWO6Flf0flTUtYK1vL3V7nR4OilL6Je08QtAKvuHZ?=
 =?iso-8859-1?Q?/7nk3qJ3zX6O8iNU+9t2lGyoAU2iGc3ZJ87Yxg1zIUA64yXSAtKmIUPoOB?=
 =?iso-8859-1?Q?I26VJqruRjV4j2+KocW3dC/s0Vsx6lAoO8zdlgwyoJZ3LdePnZ6cQmjpPv?=
 =?iso-8859-1?Q?pNuC9i9yoyFmM0BCVcM1pbMMe1PyOIpfeGZIRonTCMKfNwG0DXgp4uQVGj?=
 =?iso-8859-1?Q?A+QcT11vQkOVMS/Tz4wDQRClL3+/K7XqBJfMpE561+6Qp3imw2xC+9mZb+?=
 =?iso-8859-1?Q?Y25xmZ/pbY65UaOVfKfIkEXMXjVfIrxx6KpC7RsqwU4TS1t6mGgi/Ykd5N?=
 =?iso-8859-1?Q?r8ocTixvS2CU5WiIcZQ6gN4edB3bjNQ2HZH0vISaBHLAGr4yUXCXY8y7/o?=
 =?iso-8859-1?Q?N+vQlqCp9PnP/Kr86fIloifFQ40CwVPcSD7A/Rcmbfcc7ZV75nvOj/sooc?=
 =?iso-8859-1?Q?XwUCK+RgvRjNjv0QXQLynfPvCoWWdruaB0OBH/AdQNl0MlXtMOdm09CS0h?=
 =?iso-8859-1?Q?qyqRkST5CNeA9dA/uC6q8/bcDN4T78s9qe2EwGpMRQ3wODoARmaLdtNQye?=
 =?iso-8859-1?Q?GlqOf0jVp2M/Rql3wHzFY3a/SGEpdD/VUKzl7/xBckaoecGLkpUVgYZOjx?=
 =?iso-8859-1?Q?gYbG9o8TMtBX5dNWX14DM5fUVrcB6Nm2oYZpbqtrJJBmML4ucopJkreD/r?=
 =?iso-8859-1?Q?nzrC9ByqK6hPC0FQ1RfDGBBiyrpJiLRqd9QIlOSl/K1oK7IWGpZZrFYQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42275c73-c631-44f1-ce50-08dd776a8cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 13:29:26.7517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKpla3nkJrM5Ip25P6xYEqJ1YevcutPaVAq0MoklC5Q81m1zGvcWo+O5l+13d9XblBtst1I+R69GkAqy8hGRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7468

This series adds support for R-Car Gen4 PCI host controller.

To fully support the controller, the following changes were made:
- Generic mechanism to support PCI child buses is added.
- Private data for PCI host bridge and means to access it are added.

The series was tested as a part of the pci-passthrough patches[1] and
build-tested standalone with enabled HAS_PCI and HAS_VPCI.

[1] https://github.com/Deedone/xen/tree/pci_passthrough_wip

v2->v3:
* dropped patches related to ATU programming delay
* improved formatting

v1->v2:
* see individual patches

Oleksandr Andrushchenko (4):
  xen/arm: allow PCI host bridge to have private data
  xen/arm: make pci_host_common_probe return the bridge
  xen/arm: add support for PCI child bus
  xen/arm: add support for R-Car Gen4 PCI host controller

 xen/arch/arm/include/asm/pci.h      |  14 +-
 xen/arch/arm/pci/Makefile           |   2 +
 xen/arch/arm/pci/ecam.c             |  17 +-
 xen/arch/arm/pci/pci-access.c       |  37 ++-
 xen/arch/arm/pci/pci-designware.c   | 403 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h   | 102 +++++++
 xen/arch/arm/pci/pci-host-common.c  |  92 +++++--
 xen/arch/arm/pci/pci-host-generic.c |   2 +-
 xen/arch/arm/pci/pci-host-rcar4.c   | 103 +++++++
 xen/arch/arm/pci/pci-host-zynqmp.c  |   2 +-
 xen/arch/arm/vpci.c                 |  83 ++++--
 11 files changed, 807 insertions(+), 50 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

--=20
2.34.1

