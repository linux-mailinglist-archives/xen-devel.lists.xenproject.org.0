Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E8AB039E6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 10:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042709.1412774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEuh-0008C5-4K; Mon, 14 Jul 2025 08:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042709.1412774; Mon, 14 Jul 2025 08:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEuh-00089l-0K; Mon, 14 Jul 2025 08:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1042709;
 Mon, 14 Jul 2025 08:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryw7=Z3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ubEuf-00089a-B4
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 08:51:53 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8aaa58e-608f-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 10:51:51 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8854.eurprd03.prod.outlook.com
 (2603:10a6:10:40e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 08:51:48 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 14 Jul 2025
 08:51:48 +0000
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
X-Inumbo-ID: c8aaa58e-608f-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3E7FqXdExf0xfAw12GCthyVZ9s1VgcWh3cIcHAQVuF6v8f7voJIzkG1cFf2fXHBnq0PkvzR7k4w7jklzS8XylDIYpTEVdm9ILvc36+PEnrIQ5di7hQpft8ZSPZ5xuXYUpoKB2dIASc7Iqg3c/aKOvVml/4+OLpvUXg/ouguWotityeZ9L7E2aeGaJjRTh9DzjeqEWUct2ZnMEB9EyXQtNeYQYGUL13Uq3vLN4XQMjLPPjwx1fSeIAH9d67/ilKYWXveX+zj8laoHBMP8JAolkiMmkrRqgm+eggH0S+vry96cO6UhScmlRnASRhtDgfVk0VFS15ev/Km6+Oq1nLFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfZ9vreC4o3IpqHEpjsKOEq3MGbVNmsgUrvpIG9RhP4=;
 b=ZLyygSswJmfqmxnfaaTqRCeMGZovkh9+gadAshFyY/mp7keynsXnoIcHQYmOLNDMxyzGWDUCFF5B+CFych7HSHotvPyqjFpiW0S0naVDUwxbIrE6MSzGVGV66VnWF0GmqLvEfUdn58hndli4bd1MZp/R5wHyT73CtIdyGAFNub64doX2zb8NjVAx1txdNBj2ZszqoD8UsalkxDVB+yxpbGqz193FwvJiWKVaWW2qFR9K+dd26frTsgFGbYo54cB2NPN5bKgkSYq6GoKR54K3RT2Hc5OvgBAbZxF/Vj7QnbnVZrBPdVzPn+dVgV39ZmEntdhLKo7W/inXTIBiccnVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfZ9vreC4o3IpqHEpjsKOEq3MGbVNmsgUrvpIG9RhP4=;
 b=KzM+rq5O50fEK2xOADWj8f3h+EvbG6jT+giPSqILCQoiWE/skQikd02KoCTyu5GvjkHIwK3+QqwIscV2UiU7vivf+5uxJ+Pp+lXOiKSR+HpR8zQl9rqjr6wsMTNVfG7YKTOiVADjABMl24rXCg+eMlabMburDTfYFsDuLDHkxcHPIbwcnon0jD5rR1c7QY5OnH+QH2j+LwkJBHmLEpT46ml6KWwCa659cUUreVspWldIcDMwbsGEcSknEAiY1sUqUyacIcB5ktgZBjn1tK9uA6kIqd95bMz/VnugSaPqYtSyZid+USQPCZ2XXWe+pQbLucaEuZAFVr7LlKrTcP4rlw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/3] IPMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v2 0/3] IPMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHb9JyIN/pSoep2FUK7yKGWaCxbxg==
Date: Mon, 14 Jul 2025 08:51:47 +0000
Message-ID: <cover.1752482857.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8854:EE_
x-ms-office365-filtering-correlation-id: 7d57f6e9-6875-40a0-d859-08ddc2b3ab05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JW+yKi2/DV79/BiEcTOTSw4fngksBXAUO5y93zplZEFUdOYbKQcV8C+g5U?=
 =?iso-8859-1?Q?x53LN5VLgd/vGtJoPkpvADWfutNuxJBt+FfpYSPAOhwpJQZ4RN8SbbMrmJ?=
 =?iso-8859-1?Q?Xl7MX9unbxtywl4toNDXaY5L3f22IqukuUXC5TAj4NCfq0S+kYpxYAJZZf?=
 =?iso-8859-1?Q?oUYSzrXEau+uFMBbrzM8dYH5ihNDKEL6Go2RJv4mhqjp6tYW7JOK33E/Ip?=
 =?iso-8859-1?Q?9p5iLHK1o/SmtHepDyfdR2dQ74Ptdb/emXR4XR8izo0uXZ3er2NiVcTC3J?=
 =?iso-8859-1?Q?QslzUR2TnMbFuBimyDij7+FczEV2TPqlzPzx1oGVZNhJqtfTB4aFt1gRnY?=
 =?iso-8859-1?Q?6xZCIKsyb7DYJ9Q6OwymE7WdKWrCz9FoGv+cIPf9oqkFWIGIpBND0yLdET?=
 =?iso-8859-1?Q?mmblNKKuHnTraOvNa8m93kgaomRX9sjygJKGs1+PeNQHWE8F/6a+mPmcAX?=
 =?iso-8859-1?Q?PYp2B2mNoftxpi0rzuo4Dt4hwLziLhc4yJ56ijkhijrpLpR0/Fj4q3rUXb?=
 =?iso-8859-1?Q?xImfX7sPMpcyojz58e+tY7fzARAo8fN6NvYmKLmmETEXg81H/14Brd9RWt?=
 =?iso-8859-1?Q?31IrYPb6aPrllx3Q6Vw9WD+GKoCZ/2snOa3J/asimMvFm+c+dh9CQVrThl?=
 =?iso-8859-1?Q?twy+Nm7g721pt5nenVdcPN7/9XxGyNXZRr54dgmg4TJQBxOUs/ddFjhVkj?=
 =?iso-8859-1?Q?Xbtta58ls8w0b+KeZnvpDEdZ4Tk30YytAxCwWJFb6sefuT3jdIxhzpft9e?=
 =?iso-8859-1?Q?Owu723iUYrVCLMMuqEA4vePFI0LXX3hI+3mULoa/BGqDiuI4g34mgOlkXK?=
 =?iso-8859-1?Q?H79xEHSVi3MGmeCbdQRv2rZX1WnyLKPd0sDrFUVrcmUTt8GRWXrPT56Hji?=
 =?iso-8859-1?Q?zXEnhVY0SPEWH8l7cIWM+uksZiHBEft+jlIZEjxH+kbknVtJCIH/lncj8X?=
 =?iso-8859-1?Q?kIYhIPgjeBExc6oWQKgCsMxr5h6XkKRkkkqDvs6UOd2wTTmeFRwty5ixGt?=
 =?iso-8859-1?Q?HkcJczsQaXVV8icZeL2ptecGqlv8FdamU+jSN3ruRVpB0i05lxc+q9nza/?=
 =?iso-8859-1?Q?u+yJEaq6FmRiQlmiYApfnL6U5dy80J+rvJ4j0ucYhIyCpxU6jJbL+POZ5/?=
 =?iso-8859-1?Q?KSrQcrgLEt9gUZ8UPiYy/WmS3zQk7USfeVq4tawMzwI01Oc9ZlexLTK72C?=
 =?iso-8859-1?Q?4/Y3vdibAqNb0JR9eS8+uHR7GVkIjcXoFllT/8OFOBrjYME6rRlSTW1q1Z?=
 =?iso-8859-1?Q?+vH7fzX3mly/Vyqhig0UC/KQmeD1s5Ic6yHLBtDoC4rRgwMi/nyWx4HS/r?=
 =?iso-8859-1?Q?BHtL8EbSKVvjPAlyA4As6hGYB0c6Fh8zQBB+xPLB3pF6fSeo7DTra+AqCZ?=
 =?iso-8859-1?Q?yJ4qNiH52Ra0fLun4OojQRfYWhoD5+fxRptB6XxtmcBmT07MWhLQRIZfL/?=
 =?iso-8859-1?Q?cWDrg2Tbl1SVZW/4n4H4U3yfq92IxfxaX5thIM4jFM+Ovg3YdZGmenmJw2?=
 =?iso-8859-1?Q?m6hvuq6/oRIwWND+W2/AvgvNot5eECUseStpB1w+VM1Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?P2Lp696hokpACfHaAbJzcouXku7kXDG84DIUicwjj7gbt2nSuL0uwc0B2Z?=
 =?iso-8859-1?Q?FKHeTDfcku+vwb0227i+0ZvvAZvydG6ESwe8ihPIcPY8MPQi5APodgewZR?=
 =?iso-8859-1?Q?t/DixE+O70k+V3EAwgJ+wmD0VTHBM//wNdOfkwD8yEFjwy6X/DV6Rj3xrq?=
 =?iso-8859-1?Q?EFg10CGrILTru3m6ZTZ0MJgyuaGSd2qv6YGGgnfdLu/bg1J7c8SdO1gbVT?=
 =?iso-8859-1?Q?7qeyTLDOtvCk34nDcqpKrQD52nJdkpGmMAE+HRTuFlnYFuRaIg+Hg+iY+Z?=
 =?iso-8859-1?Q?TV1KA59tp/v4+f3aysdtfN35rZiTnoBUvD/c0CsTj1xOA8pEiVD1v9CjaA?=
 =?iso-8859-1?Q?wDGYPwmG2tBZRES4PInMgLcuLYij39+yLTN70ap8sOELQzBT8Y2jt/NMSr?=
 =?iso-8859-1?Q?W2SNffnX/AAc2x2ttSyY24jg5fzayUw2g9C58oExIyN+LtWMoqaWPfvE3w?=
 =?iso-8859-1?Q?xlJLwfp8TI07DXj4NOlneoHmONEzOa8otY1rzBmtq3OOsM+Ea+sUAbgumP?=
 =?iso-8859-1?Q?z4L+mxhe28jwrNuG627GHZMjrmWJDNhMdw4wxJQMoeMBxF2mUtqyiuuaAS?=
 =?iso-8859-1?Q?TMykjkBxzcsgKuGGwdxdKVlNqDiOoPiEjVhWUYvyxGxu22Y6gvLzRZsIAZ?=
 =?iso-8859-1?Q?AtpTWpYIRD1RKnj20SQt5ObZeOsx09mw6IX0dMjMpOw64yUVr3w5ICCkVM?=
 =?iso-8859-1?Q?WdTxMOSAgZxRjHyBaDzggTzk+qv8HKTuWxIm3/N5JYoaKWeYmVztmsNXfh?=
 =?iso-8859-1?Q?qvAx5s8+0GtYDi1XPLGgMeVIPZMPgZcHA9MINhFogm6XQpzYX23FeoKI11?=
 =?iso-8859-1?Q?vDXjUCbFmiJDt47kGxuAb+H8m1bLe/KvXGxkfqKsn77mY9gFFXSdaqB4lx?=
 =?iso-8859-1?Q?iFP9UCWfkd+jRzmY31uZJtnTEh5yr3YawaKTZsqNwNdEUwzxs7VoEn13jY?=
 =?iso-8859-1?Q?Bi6Epo92K78mmJtWbYqdCPvsPloKqcK6AdzzHIuXQtJndkPk6EBSGQLc7p?=
 =?iso-8859-1?Q?tatJkUVxDDHfG9VR3hOr7oixkEQ1+6pnQlP76VkuHem51VsUOtHXaiPo7Z?=
 =?iso-8859-1?Q?+9vwy8Y0+IXnKFvMApURJ4grdkAjZIbTqp7dsbYpjd7b4QCszjdOhcrNGc?=
 =?iso-8859-1?Q?qGQpEHL/g/F2/1LRTZOOugrgbKh8xnNqJ9Atmik1HGC4rlhF1kILrWC+kE?=
 =?iso-8859-1?Q?4zSUCxIzbCrxOF0FZ8RMlcUaX44Wk67S+OHXLvIyodzQqI6KEZg/gJyBn1?=
 =?iso-8859-1?Q?q4jOfWssRyUlBXRmZcQTZK2TAhU/mPd9NxL4lDAaBvH9XbPpP+HD9pd8Ly?=
 =?iso-8859-1?Q?Y9mM0qfawrgO8jaqqOqOluBDj2q0ok4ep6446cuaNfd1IWuw/PiKC/fHg+?=
 =?iso-8859-1?Q?GLZE+y4SjMIsz4OiXg6gSLybh0SkiUp008dzlRarInAqosf2UhOdHeNkZN?=
 =?iso-8859-1?Q?z47cTPORwH6VvNQWcwhkFOL1CHUoWTzbpoRyytqTIDvNvgYV7V8uglNDoZ?=
 =?iso-8859-1?Q?E9EcXb1PSJIegddM6mwqb217zwm9r7rarvTKfXf9ebvd+odKak2E9lQ5YM?=
 =?iso-8859-1?Q?AfSIedsAG4eKzniQGt3pqfmvgDXbROBC0fNcWkcfZmnw5L4hH33RMaPWm5?=
 =?iso-8859-1?Q?gsk+a9tNqLxY8STxN2/5B5qVd+Cbgy6fd3aLTtiYWpaVAMMBjssJDNXg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d57f6e9-6875-40a0-d859-08ddc2b3ab05
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 08:51:47.9796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1doSrq9PO63MyM0eCWQHbF56ZnEB8XIMi/cs4gjaNNQekXy4v050TKx9qmY/2+57RTgj+eno+mknkZ81tJ74Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8854

This series introduces IPMMU handling for PCIe passthrough on ARM. It inclu=
des
changes to pci-designware, pci-host-rcar and ipmmu-vmsa drivers to enable
configuring BDF->OSID->uTLB translation chain needed to pass different PCIe
devices to different domains.

Tested on RCar S4 Spider board.

v1->v2:
* see individual patches

Mykyta Poturai (2):
  arm/pci: allow designware-based hosts to have private data
  pci/rcar: implement OSID configuration for Renesas RCar Gen4 PCIe host

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID support

 xen/arch/arm/pci/pci-designware.c        |  12 ++
 xen/arch/arm/pci/pci-designware.h        |   4 +
 xen/arch/arm/pci/pci-host-rcar4.c        | 148 +++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-rcar4.h        |  18 +++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 136 +++++++++++++++++++--
 5 files changed, 310 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.h

--=20
2.34.1

