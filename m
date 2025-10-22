Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0148BFC520
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148081.1480250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKG-0006gO-TJ; Wed, 22 Oct 2025 13:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148081.1480250; Wed, 22 Oct 2025 13:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKG-0006dx-Q9; Wed, 22 Oct 2025 13:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1148081;
 Wed, 22 Oct 2025 13:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKE-0006dh-RU
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:26 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e32710cf-af4e-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 15:56:20 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB9PR03MB7644.eurprd03.prod.outlook.com
 (2603:10a6:10:2c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:56:18 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:17 +0000
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
X-Inumbo-ID: e32710cf-af4e-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4pXiP18pRuIONgjSzUca9lBu5Lnx8SV5OC7va5VK2EjzF5YRapp7lcANmqFUFYyybnB4DskIAfDtoHxBSI2Y2iIUXDJEogXpBIXXhN3mJI3WsNBzhsKqQkf+aKhKnc7fxljUIu0hbTMx9HwiidVbHDDVZYm+L99in82H69TNHty+fzNe8pj/T+qTE9uOZJBpOUNsTkprJRXb98nVTTAzUsrOZwcV08hpJgRUxBn8mUBY7Z5AvjA3rYcrGKliXwj5Dn7PVM8GB4h2ifTntMGSX8FZrNQ/CTZR0MAdLSS8Nwxfjn2WUXHbDkm+BKoT/1lxTM7+3k5eojbT1cdZgfR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhasN+xkNZWH6EeNo1u/Dqg3Log2UsAz+BS6llV8g1g=;
 b=td/uqdsSW4iy1jCsm8zUWYFCT+d86OROhPfgAH2ReJQyh84u0Tk6M9AA2cdBDT64buj+thYiyYdZIMnpeJggR+BnnKeEZyEAiPmA3wIVh0tw+so6bBHFg8A7+yjggBz1cxsArwS/ZIRKiVPXFTfDH/CtpO9LLo2uJiIiewN9tpYsXUVemqv5hL+pokkHEmajzr8Zw4H2CswKTlPUiqiZI8DQ9tBi0K/+HAePsxsrEm0xFNRWSaoak8PTqiQqrW6JERM69ClfS8KtutAeOQlOEeOmh6CFflFXj/HBLvCkhfUuHtsIk4pc0t2o07Nm+hesv1YgS5ScCgbhX44SwEComA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhasN+xkNZWH6EeNo1u/Dqg3Log2UsAz+BS6llV8g1g=;
 b=B2Hr+otRRZ7L17yi1aB/VjFrE5KtAQVUHGU8Y22916Nt0Rgy9MxUA0xtOrU6NdI6NND3uXiTgozp0lLpJije7q7TxbEfJ+Fa/Dymzu74xXLFCrBL9OWjH0DVXfydVGbMu1WNyj298znG2HL7QFIcWF7BSJ8e1x6sWld2SvB+pdp+OUUASZ0e0oHWKPWCkAuWk1YxAZIQASJQPEccdSUCZJl8EiCGTJqf0i+RM+PLrFKyyOZRXhU57dq8YpQkoV/cLXGB0bM4/z+PjCPLfsjRyTEkBMSqC//55SZxbSWolcHXodb1iCcLlkXMbSjhWs2nDCq3OEujVcFYMpbJAmFAVg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v2 0/7] Implement PCI device enumeration on Arm
Thread-Topic: [PATCH v2 0/7] Implement PCI device enumeration on Arm
Thread-Index: AQHcQ1uj/RZMssOFqEGEU57P0Hacnw==
Date: Wed, 22 Oct 2025 13:56:17 +0000
Message-ID: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB9PR03MB7644:EE_
x-ms-office365-filtering-correlation-id: 131552c2-78eb-4703-4ee2-08de1172c5fb
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XQzvIAg/NftGvMSagF3yghW9t5qOBiBAJhPhjyh+gxO6O3byMCeegh0lZo?=
 =?iso-8859-1?Q?rbDXf0ecK5ecdy/HxglvrdewUVuV5N6Ldzb6/NkEXQATKjMMG7vebi2nLu?=
 =?iso-8859-1?Q?18cjBU2Bgi5Pm0xcdDgKhrjJENubRjJnf81za7NGG835TJW2A8lrc3jXFN?=
 =?iso-8859-1?Q?wtXyhlfffj4UjkmqXy8U9tYDyXYPrbhvzMyZ9BL/Wugf0slb/lD4fvox1o?=
 =?iso-8859-1?Q?Rc+i0Vvei0DeXQ6VOza+5+IBNGHt35VWw5XxCJdGfkeGvyGrxspEBkk1/J?=
 =?iso-8859-1?Q?qLMZE6CHSUSwiMenK5haUmkDH3aYuP7alioz+gBwukNiK8pE6jxmNPNHZJ?=
 =?iso-8859-1?Q?sVDYlQ0KyU3nw7z/RfTod7wtBNgA3FEpNnrKhmJQfiHYgGLEyYV8on283B?=
 =?iso-8859-1?Q?xSuyjG/gRVnebkbHWl4bh245jTHPp8oTVQBNsrAUQ8OS/sQZ5G8a4q65fg?=
 =?iso-8859-1?Q?Ty+Vv0wmxQ6k7UntoxehNI0DkMWhcBrXN5W/KX8scwbNFWv7JBUiN2gNdh?=
 =?iso-8859-1?Q?xPOYfj1ExIfWotisr1JmE5J076HQCCJtF1ZHdUaZpkwqhWoEMeS7sAUkwC?=
 =?iso-8859-1?Q?NuUEpKpLM77CdaH2CtnKYAlF3OUJC18ngwvyhBTAuh2XfwpVsgKOEQBUd9?=
 =?iso-8859-1?Q?YetWXj3/Yc49kEE9/MWwJYTZBn5fjeSgGoNGI7HJF+xB0Get5uxE1NZbRL?=
 =?iso-8859-1?Q?zE1vM+3khIWIT/U+2bYTsK8D5k18PA994fE1PxHf9NsusMdm3heqL72GJj?=
 =?iso-8859-1?Q?rm9qFHo42Ppza7+xH+QWA6uvjH35x3tBpFjiM+wTwObcI8NFfK4KnJ9dWF?=
 =?iso-8859-1?Q?hyg+ZTUZl5zQpDLnojx4USGBFxWcRbfU31raeZkyei8BTOozikxs9/XUCV?=
 =?iso-8859-1?Q?aCkpkNim0Fp2DhmZMA36XgOe1BD737bGv6TQA4hqL9azR4mcJQZupBLlqm?=
 =?iso-8859-1?Q?qY8Puyp/BrXYTthI0HO6lfXBhCHc2yf4kWBOgZkjfzHh/g/VJPUDE0Xp/m?=
 =?iso-8859-1?Q?UMnZ73BtXkqhpvJ6DOL3YRnr8NN6jcvkja0GX7qpeGFQoMFHEztne2L205?=
 =?iso-8859-1?Q?QhpffaS1WMsw0LGmgWE8vCE66YWjtdeiETd8FoSz7kXdKJIXk8sHxSNqfL?=
 =?iso-8859-1?Q?ocehYAG5DYZVDkfmtnHF00PJerMvY4BYtR9NTYoqzN9hHxDbCgCZRPomsV?=
 =?iso-8859-1?Q?xEiUygM5AplzcyIrN5m7XCbwI1LoxaQR0MAIfCBYMdilN3z8CbTYgZN/iM?=
 =?iso-8859-1?Q?HdiiKu9i8lFRmx8b0f1EtFnybwm/RZ9urc6MN8K7g09QGnH+y+Pgg3U1vc?=
 =?iso-8859-1?Q?DA8QujEaOTGVda1v3F22AADN1smgbJcjUh/fxoNfdM6KnYgFAIMwzBMzvJ?=
 =?iso-8859-1?Q?wkKU/uSRwlFTgRlmdNHBMRwDNktd6IL1fc5LJIBXhSNOhw2rHm4tG+ifWl?=
 =?iso-8859-1?Q?vmQTW83DDV829Guf/XHWpLGX9CZWklQB+KjEdWlZi+UhRgffnfTKxrskOq?=
 =?iso-8859-1?Q?qqJiay87DPmvG6lFA8AtFQO7CkJqt8Mry/f4riWkTGzS+7NT4DNbYz4C8j?=
 =?iso-8859-1?Q?fNhCasPWI2P/rxBBGDF7+7lGPG1K?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?r9vnq0eOuSeLLN+zHuFxE7il2GAOv1unjBxZwXyF6eQam9guJKo5QsUsSV?=
 =?iso-8859-1?Q?FghSpG2s4rcJH3EOmgAG4yb0hwMfG4KIOwS5+7iSZZ/58T62OgpKk1ZMaY?=
 =?iso-8859-1?Q?3gj7SdATx7SVKjraHWcTeAbxEWynzgeXKSydbU4LLRTuFx6Uzn+6VeH+NZ?=
 =?iso-8859-1?Q?1lw/v+p0UA/D29yIYdlIvDCN/41kKbHNbrPZxnnFj7DZKy7g29LsyUd0HY?=
 =?iso-8859-1?Q?fqtSIkqlwxCkhO7ilWWbyilybXeLJsQ/nCoA1S/SLiJmELWZhD9iGYiKgc?=
 =?iso-8859-1?Q?YqEzIcwsJ3329I7To49DGOEgxzvXlZVRboG3KhkgOk2xcdYR6f2/ZjvWmE?=
 =?iso-8859-1?Q?kyPDsbfTYONlA0YhJYz1N6r72k85o7vmSuy36SNRsd/3gy4ik27UlfhrMR?=
 =?iso-8859-1?Q?AdIHzjkztuldrh6o0CkOHSIDXBC/iH0y2AcOYUEiCXXIhDzegSD4jje6Sz?=
 =?iso-8859-1?Q?LTft9wPJfSZWdNVoBLWFGIeRpFtQPRV+v+TOZXOfi7Jf5mCjBtAsxy18z/?=
 =?iso-8859-1?Q?mRw1UayLBqeWY7XW17GOQm1iq3C/G6yo9RDZx+kGO7LvpIDgXtQdi5PjSn?=
 =?iso-8859-1?Q?A+EJH/B99IGl9EkdX6oILi17mVZAnzR4xYtr4OvUKzk/DoijCwdxDqxoI8?=
 =?iso-8859-1?Q?4ftzcaJI2pE6Tez9faj2hp0+fyZv/LAo0oNZx1d1YF7U4avyw9KwtquEEx?=
 =?iso-8859-1?Q?MvGVBarpzWWGNVYeJ0zmRy6VZ+n7fmupFqKiKEOY+XtfC35AOE37f/fPSX?=
 =?iso-8859-1?Q?npHn2GW80yuQUn1McIFLjX6VHDHO+J+xA+mq/I3P/MfUzaa3Ei3du3jrtA?=
 =?iso-8859-1?Q?VeAJ4Z8pKkQssWOav5EzmLaTmnQJQBhWinxKa4EJTyF7i5sMlJaE/5AYjc?=
 =?iso-8859-1?Q?XhiOV/UfyicArQcbfGQfvcDk66NvoQLblvFKWKozncCxHKXctUopomYmia?=
 =?iso-8859-1?Q?+SP5A7ENusewGl7FMjHbKKYOyFDbS761+bd/HUICCPzI09MNvMuQR+478s?=
 =?iso-8859-1?Q?sqOrRNViIovlzIFVx855K1cAVpLA49wdTbVaABBQQDdQ31dLH3yBQEd0hL?=
 =?iso-8859-1?Q?AqpXZaWoPe3fUuXbj6QUM/YqTyX9+WVI5iPD5Zc+jU8agNML74BWVUGGLM?=
 =?iso-8859-1?Q?54RTurz7/IN21dYtYd4DYwx87eUCKUn2Xse74X5dB+XqnQrXSAIedKXzp8?=
 =?iso-8859-1?Q?QJysHOmEdOEM+A+UuQGk8LXmvqyHoJPLaG4IFkIRqgp+CfJDAnm+zrrjui?=
 =?iso-8859-1?Q?5nsJwtY48VXRA4W8Io8453goCKMNc7Y34GEOPtzMilAGO3I0YiwktFLWgk?=
 =?iso-8859-1?Q?3yKJLyJC3u4PTy92WkoD3Gjs4bSm6uMICQUsZrSzCmrKGcT2gT0VlubKTL?=
 =?iso-8859-1?Q?rPUVKKuq5iE4QVbRKz63sISdrEQm6IlrCer1nlbfA8SpfLkx2dKLcwasXI?=
 =?iso-8859-1?Q?U/F9Bc63iPPLE/iR1E382L1QRDcR8dCBddKP20XCNpMT9m8MvkQXX5L3NL?=
 =?iso-8859-1?Q?aTZm9N/ALHLGQ/mY+42ozKeac1alw90Nh0FyhvyBPWe5fkp9IwudAN568W?=
 =?iso-8859-1?Q?kq61pGsZlI1nIA+1OsK7Hx71ncZqmue9/cyQ+8wdQNiBODkC+qFLJ2HPI2?=
 =?iso-8859-1?Q?L3wnUNjiguykeWiV9WXbh2K3jjMaHjy8nQOZuqKadhHe/HnBs9dqE7xw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 131552c2-78eb-4703-4ee2-08de1172c5fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:17.8400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JCeRcTKPJNAgCmZ/4MfKeM2hhAlydKDkun9DlWfczJNXDcN1RZf6/4iYMs8B9m8CbsTG+A8ej6UrUNhaHdmfGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7644

This series adds basic PCI device enumeration in Xen on Arm. This will allo=
w us
to not rely on Dom0 enumeration for supported controllers, which will enabl=
e PCI
passthrough for dom0less setups.

Enumeration is disabled by default and can be enabled with "pci-scan" cmdli=
ne
option.

For now the discovered devices are only assigned to HW domain. To achieve t=
his,
several things need to be done:
1. A VPCI node is created for HW domain device tree, and the real PCI nodes=
 are
hidden from it.
2. Discovered devices BARs are initialized.
3. Register handles for VPCI are updated to change behaviour depending on
whether or not the calling domain uses VPCI or HW PCI, instead of relying o=
n
is_hardware_domain()

Tested on QEMU.
Arm:
* pci-scan=3Dyes pci-passthrough=3Dyes
* pci-scan=3Dno pci-passthrough=3Dyes
* pci-scan=3Dno pci-passthrough=3Dno
X86:
* no special options

v1->v2:
* drop xen/pci: disable pci_device_{add,remove} when hwdom uses vpci on arm
* see individual patches


Edward Pickup (1):
  arm/pci: Add pci-scan boot argument

Luca Fancellu (2):
  xen/pci: update DT for hwdom when it uses vpci
  xen/pci: assign discovered devices to hwdom

Mykyta Poturai (1):
  arm/pci: enable vpci for hwdom when pci-scan is enabled

Stefano Stabellini (1):
  xen/pci: introduce has_vpci_bridge

Stewart Hildebrand (2):
  xen/dt: pass flags to callback in dt_for_each_range()
  xen/pci: initialize BARs

 docs/misc/xen-command-line.pandoc    |   9 ++
 xen/arch/arm/device.c                |   4 +-
 xen/arch/arm/domain_build.c          | 154 ++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h    |   3 +-
 xen/arch/arm/include/asm/pci.h       |  23 ++++
 xen/arch/arm/include/asm/setup.h     |   2 +-
 xen/arch/arm/pci/pci-host-common.c   |  81 +++++++++++++-
 xen/arch/arm/pci/pci.c               |  30 +++++-
 xen/arch/x86/include/asm/pci.h       |  20 ++++
 xen/common/device-tree/device-tree.c |   5 +-
 xen/common/rangeset.c                |  35 ++++++
 xen/drivers/passthrough/arm/iommu.c  |  13 +++
 xen/drivers/passthrough/pci.c        | 120 ++++++++++++++++++++-
 xen/drivers/vpci/header.c            |  14 +--
 xen/drivers/vpci/vpci.c              |   4 +-
 xen/include/xen/device_tree.h        |   2 +-
 xen/include/xen/rangeset.h           |   6 +-
 xen/include/xen/vpci.h               |   8 ++
 18 files changed, 508 insertions(+), 25 deletions(-)

--=20
2.34.1

