Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A6A418A0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894980.1303621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbh-0004on-2D; Mon, 24 Feb 2025 09:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894980.1303621; Mon, 24 Feb 2025 09:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbg-0004lN-TO; Mon, 24 Feb 2025 09:18:32 +0000
Received: by outflank-mailman (input) for mailman id 894980;
 Mon, 24 Feb 2025 09:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbf-0003pb-09
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f984d22-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:29 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:25 +0000
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
X-Inumbo-ID: 4f984d22-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7fMnZzFVK7HilAfS10fEgD8N4cV/jNKZu1DR63ODdGqNvhszOYYOlCWaz2SZulBWT5qvl6FAiHmF6r+LslZdzp0zYMPq6Y/+hTzjNtNqO7PbbiTXtjnfFbCa+ujFG49Bdpzx25X7bNH/Con9cLJTFlEADZksvYt97/ZicYMKoSI9mdDuoiVAnrl8jw8wcltytDrjPrvUtgSR5ZZcKGKaVVW47nxJS5K5FHVC83GXAzyAqRJcSZ6LqKKlq6oj1sPSplL3+dqcSbgpl2hGU08UBxFkMTxiSp+tWG3CgrPLUrBfBvSdLtNYieNjIJA8AA/2jjdNbzqCYvp103SuLHoXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFD8EL417kBsRTr2esgxWJnqnirmd77/F9gJ5bh9ez4=;
 b=cj4SNoFwM3EXkIl06gbl9O9leIR7fk7HwHvQEWarKv6nsPoNIbRQA2+YHUUBvc+gI4aBYvnVTshJTnitacQZMZUOmYTcIyoYMZxSCzsc7KxD00dswPwuxccl34N0kmcOgEMjb9coO1XrGUsBbt3wHZY3AulrZ3Groi5t5QxVWQjE8tqeuFIgcPaqw1exjD/QJmeJ5yoKa6etsbtnurhzciew7uyRSICv2vTfLyUvsTjJh4tk5eY+JUh5N0CgI/8XlfJKYmZVulcFwNbidKMpkhwhZfL3CQPFiG7rGgs7bz/u0ySj/4iJkkQh5m5I+FiXkTv46ZE7u5EfV7BijK+EpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFD8EL417kBsRTr2esgxWJnqnirmd77/F9gJ5bh9ez4=;
 b=huqgC6BA4VZtYy3eJGZLD9a2yHEAGdLcUWKUgjB78Fk2mAKdb4rJJUmMvl56xQRw8oNs82kDq0r9rb7kbQtA+AThZGdAOoR56Ur/8EFcBUFrSwFJdPk1UrWvFBn2HP7SGNOP9XdHhwNDI8WggL023wEJ0PlY9Ay5AEmKL7aE54wGgs2/wa0FD6gfJuCJqCvt/G8ZyT192fJgKVggONV/5rDYvtOCVch3hZGbgNN5kBUV6pbmP05+yKzIsd6PWZuNDjf9iEb5UHNRdF/V5KOuOI6L/OH6Gvc2xKp1/weJBO+ZFnq9RlRqfof+EtXJWv7D4XrniVv0QkM4yYuOotYu5Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 4/7] xen/arm: add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH 4/7] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHbhp0OJEwwd7KbIUWidoI1k6AKJw==
Date: Mon, 24 Feb 2025 09:18:25 +0000
Message-ID:
 <8e567e7db48ba6d268c5e3a3481d53d891524d68.1740382735.git.mykyta_poturai@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1740382735.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8859:EE_
x-ms-office365-filtering-correlation-id: d9814b2f-3d43-4f68-9c33-08dd54b43155
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lk7ri5yYUStex+Gw5e6B8Za03tHRIS5ZkaeOTTxxkwtB4MPfVo1vTnsHKx?=
 =?iso-8859-1?Q?HN33q+5/aQKbN4GdgyoFxNAklLLOtBmJZQyOxJ+TqvyvIvzrHtBezJDd/E?=
 =?iso-8859-1?Q?mgQIJMMmgtrboAV8+A1TN0UzGti/9cn3RfCcr9ah7UK3leYvSD4nEXvG/H?=
 =?iso-8859-1?Q?/vt2zDdzjT/DweEZABdVIqfn48cpiU80vp4kewjnHjKsmMJIH6tVJpP82u?=
 =?iso-8859-1?Q?p9+98dxibIpPkWmEINJl2ocmXhaVmYeaN2GbEN3wjB/0ePTO5TVc0pKk0z?=
 =?iso-8859-1?Q?qLWtijnMq9PBQhowJP2RhLTKPzqthuSWo+H4Z95FsY+l4hk9oClJ0RytF+?=
 =?iso-8859-1?Q?1KxX/zbsy9PfzwvS0waLJxSZg/EgdhGBKjMxmXyAzssPMgqX+6pBUaonGA?=
 =?iso-8859-1?Q?eOKsxsNYiAJYOANe6Ahd68dMIT2+zX4EDbm+GH2aqgI2W1xbn8A13FWGV/?=
 =?iso-8859-1?Q?5LMUYMygAheZZSaJq/TgfR9H4Lwpbv8CbNADn3DN0KYKmbmVTS6RlaYEix?=
 =?iso-8859-1?Q?6u01fiiss0U+73goKgJ1jGVCWShf995CEO00t6nMrXUlfrCzTLgY/xdWCP?=
 =?iso-8859-1?Q?pc9dwXSnqcoBc44D74Pmf8ulUxJA2xk1u3xb9N/cH8Tq+qWz623TQjC/R6?=
 =?iso-8859-1?Q?N9BymhNm/Ij/YBuYoLJ7oR4TPE78KRWT1Uh8Ht5E1AVkF4cja4pUpLK94B?=
 =?iso-8859-1?Q?iNebZkE/aJDFmM81+nH0R1HIOSvxb4s83Wwm6YUOF9LbvEiaXL8964/yBF?=
 =?iso-8859-1?Q?QWH+tj22YARtvi8Z/b3ikVXvvJBH9YswwLT7WvCqTIDlZ9TTy8ruv9CIT6?=
 =?iso-8859-1?Q?0q5WxbBNoUtc03Z/hxib2LjujMD09hA3dHIysbGMmrdGq0E9DLylV0eBpL?=
 =?iso-8859-1?Q?P80JOQO9lk3eG5s55LF0CCgVAw3T5OquyYeS5D9XH+M4igbW4lnNCTbWr6?=
 =?iso-8859-1?Q?Z5qSWJxfldtNHvGpSyPaGrn2/HmBVGyRYNE3E46g2tc5e3JYCLhGJSyOfy?=
 =?iso-8859-1?Q?swewOl0uFJlMWf8SZY+tFSlmxHV33RyXqEeeMlMuIqSEJCi5Zcv0Gql5Yq?=
 =?iso-8859-1?Q?7GCccs8AFL3wMI6Psh/UpD2x4xC3CiJ3V3TD85wfVF3MSEXWYLOjIXwVh9?=
 =?iso-8859-1?Q?Q2vjDbK6ogNKTwCXJYp+8rej20Xtwv3GeGVo64x8xoJZ+/1WVDL3Ns5uBP?=
 =?iso-8859-1?Q?Gw9yFMQKwnF3qPKOw8w0zo/MZotUcjYpu8aTfseqh0dq2q3Nj0O294ccsn?=
 =?iso-8859-1?Q?ANxZx20bRGdwwIcOlMXtBfJTVHAuXddd5VslhcrjiHDq09LxGsq01Vt/BS?=
 =?iso-8859-1?Q?R3ib5FrvhSHz/ldMX1ilJYfbVFzl364LyiSXh3SSmrHZHyS+Ny9MIfv3hC?=
 =?iso-8859-1?Q?AEg699O4GImHvSSahF9sFrmkkqy7fZzmLC4VssypliDWuaObKNsRpXIYIj?=
 =?iso-8859-1?Q?d+F06JTw8D1MeM8PZyTdxK2OL7UbOBO0WFAfLg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Bs9JMOVlvrCR1BwUlim0XbQof7StXdZZrj/33PVZtoW1ZQg/cGqLok62JY?=
 =?iso-8859-1?Q?P7seCxh8+xJs3XJgythZ6xU8HFK3yHgMT01KCU2Kp42FbnkZtnv77mQbLQ?=
 =?iso-8859-1?Q?pTo/mbrWjVytU0Mg8+PAngZ0ms9xxAIe9iXpCjOQZslKv1on0iOVNZq+e7?=
 =?iso-8859-1?Q?BCoEuUH/Zjh6f2oTIQ4kTB2Ng1eEWeK+nWjhMew6osTUpinigX9kcy6aXk?=
 =?iso-8859-1?Q?qNvXimxn5bOQrOn7a4D/wqQmnXqhUg7w7zsIqrDAKUY1d5gBrcg/UOeBtu?=
 =?iso-8859-1?Q?GdNYdJWljG7y1HGYZ8l8e1kxHdz0BI03IHZnGWgT12KOV4Vx+aKTrP9NsE?=
 =?iso-8859-1?Q?jg9MvAdP4O0x0v1bocMLaLCo9CU9TEwXeyG9hr688sAv2jjFTFETQywMij?=
 =?iso-8859-1?Q?OEoi7ABlG8AxQyU9bbG5W4t7b0L4TTZMVC/JsS2nM8RJWX85WI2PuvU84Z?=
 =?iso-8859-1?Q?iVwf/kT1AyapTyluSSPAgYisfFkY8Poh/Hb+ZLrfs8nHoKYoGYyfkqV0L4?=
 =?iso-8859-1?Q?aH3U+OikP7949Z8M0vKgj5FJc5OaiV2MK+P6RCFT85BBuQBJpQ83sv0vkq?=
 =?iso-8859-1?Q?OsG6uI57Zi+UZwCFXSnFIvY9HO7795cFiGewu+ay/e9GMUfQ1oC28cV8mi?=
 =?iso-8859-1?Q?VvQra+3rUvsrOHABPs8V3ntjIZZsIqaqCPWSeTFHAivjoxf1zf7J1wev5E?=
 =?iso-8859-1?Q?efgP2/yIGvc6fwIdak8v6tQB1nRCoFyM9DNqDgvF+4/nbL5fEj8FJzsHOM?=
 =?iso-8859-1?Q?z5o+a4d6FJZuab4O63wpmGtFT1HsQBCPVTkQE4W2VhE51/f1gcUTYapg4S?=
 =?iso-8859-1?Q?gsmZBLvfbi5kPKA33WO04t1jDf7mAOgUJtgFSyHBl3JLyNrGYnnRR4GqDS?=
 =?iso-8859-1?Q?UyuAek6/zyP+HgXsVjoMq2OpcMDmbLqeR/i2xANK9xKO2jYZ8uDE0SGgbs?=
 =?iso-8859-1?Q?Vre++Q+5FfAPOpo6O+O3bPFQsh6u/Abh+yeXdxZ4Ic4wsC6ROXcUaEKEJb?=
 =?iso-8859-1?Q?6CeeZPhozxaJ75rZAIBqCvtJsxMWj3/JBqHUBLCFCHfSeAA8BdwG2X3n6R?=
 =?iso-8859-1?Q?Q93X7CdJKsLxddmGog2D8Cw17u+qh/ABehPZWiUjFBuCcO7xeXGWoclAew?=
 =?iso-8859-1?Q?RBpsVrPIpJysGroV48qeiVLid01ThG8682cUE/ykkib7B/ALipflqsjdTY?=
 =?iso-8859-1?Q?wH6Iz3euZit7w7CBAdSmzIvyQ12AqufBU0/DCJBxbomfk7ooCg2UvGI+tD?=
 =?iso-8859-1?Q?t6Xa3YYp1yxhYi7WMN1Pumu/PjIpNeoZRv+FLk9gOVGYPDK71eMBeewffO?=
 =?iso-8859-1?Q?YKJKnqID2frPyo7Jiu5kyD4P/FKpIs01hIut3Foh0Ftdzp+7hfODG79Jwq?=
 =?iso-8859-1?Q?QrAbJDWquup+W9rnfLddFSX4jgKqbqF5M7EPIQDqcnwNmMx/hPu0nEbT1y?=
 =?iso-8859-1?Q?sbIw+WdMLcJ5LXzv5RxVx2eCOrocOgCzQSaEr0OOtcP5bRd10vzWUWDaJc?=
 =?iso-8859-1?Q?HmIPndtJmfYcOgeUwiZTIJi1/uaY/gOnqCCjdWR4TkiUzmpkOJIfg+c+oC?=
 =?iso-8859-1?Q?U/6UAeWlKjCEEayxqpQhQhNfMmQhC56gtN/W+c8GlUkJvQZK2qM1nSEA1e?=
 =?iso-8859-1?Q?tBRRMS2awJnxsbeR1Z2FYHoykX6rPhgS3AcejO6JRbTvYiNecnyOGDGQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9814b2f-3d43-4f68-9c33-08dd54b43155
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:25.4453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTxDsPNcwEfGaNasMdXIq+7JdCFEGjj3yLLnroRNEFoQ8DN8QNsb9hHgfS9DeY9APTdi+fX4YRpGJyfQ6MjenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Renesas R-Car Gen4 PCI host controller.
S4 and V4H SoCs are supported.
Implement config read/write operations for both root and child buses.
For accessing the child bus, iATU is used for address translation.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/Makefile         |   1 +
 xen/arch/arm/pci/pci-host-rcar4.c | 529 ++++++++++++++++++++++++++++++
 2 files changed, 530 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
index 1d045ade01..63ea86d9fa 100644
--- a/xen/arch/arm/pci/Makefile
+++ b/xen/arch/arm/pci/Makefile
@@ -4,3 +4,4 @@ obj-y +=3D pci-host-generic.o
 obj-y +=3D pci-host-common.o
 obj-y +=3D ecam.o
 obj-y +=3D pci-host-zynqmp.o
+obj-y +=3D pci-host-rcar4.o
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
new file mode 100644
index 0000000000..df337e3159
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -0,0 +1,529 @@
+/*
+ * Based on Linux drivers/pci/controller/pci-host-common.c
+ * Based on Linux drivers/pci/controller/pci-host-generic.c
+ * Based on xen/arch/arm/pci/pci-host-generic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/delay.h>
+#include <xen/init.h>
+#include <xen/pci.h>
+
+#include <asm/device.h>
+#include <asm/io.h>
+#include <asm/pci.h>
+
+#define RCAR4_DWC_VERSION       0x520A
+
+struct rcar4_priv
+{
+    uint32_t num_viewport;
+    bool iatu_unroll_initilized;
+    bool iatu_unroll_enabled;
+    void __iomem *atu_base;
+    unsigned int version;
+};
+
+/*
+ * PCI host bridges often have different ways to access the root and child
+ * bus config spaces:
+ *   "dbi"   : the aperture where root port's own configuration registers
+ *             are available.
+ *   "config": child's configuration space
+ *   "atu"   : iATU registers for DWC version 4.80 or later
+ */
+static int __init rcar4_cfg_reg_index(struct dt_device_node *np)
+{
+    return dt_property_match_string(np, "reg-names", "dbi");
+}
+
+static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
+{
+    return dt_property_match_string(np, "reg-names", "config");
+}
+
+/* ECAM ops */
+const struct pci_ecam_ops rcar4_pcie_ops =3D {
+    .bus_shift  =3D 20,
+    .cfg_reg_index =3D rcar4_cfg_reg_index,
+    .pci_ops    =3D {
+        .map_bus                =3D pci_ecam_map_bus,
+        .read                   =3D pci_generic_config_read,
+        .write                  =3D pci_generic_config_write,
+        .need_p2m_hwdom_mapping =3D pci_ecam_need_p2m_hwdom_mapping,
+    }
+};
+
+#define PCIBIOS_SUCCESSFUL              0x00
+#define PCIBIOS_BAD_REGISTER_NUMBER     0x87
+
+#define FIELD_PREP(_mask, _val) \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+/**
+ * upper_32_bits - return bits 32-63 of a number
+ * @n: the number we're accessing
+ *
+ * A basic shift-right of a 64- or 32-bit quantity.  Use this to suppress
+ * the "right shift count >=3D width of type" warning when that quantity i=
s
+ * 32-bits.
+ */
+#define upper_32_bits(n) ((uint32_t)(((n) >> 16) >> 16))
+
+/**
+ * lower_32_bits - return bits 0-31 of a number
+ * @n: the number we're accessing
+ */
+#define lower_32_bits(n) ((uint32_t)((n) & 0xffffffff))
+
+#define PCIE_ATU_VIEWPORT               0x900
+#define PCIE_ATU_REGION_OUTBOUND        0
+#define PCIE_ATU_CR1                    0x904
+#define PCIE_ATU_INCREASE_REGION_SIZE   BIT(13, UL)
+#define PCIE_ATU_CR2                    0x908
+#define PCIE_ATU_ENABLE                 BIT(31, UL)
+#define PCIE_ATU_LOWER_BASE             0x90C
+#define PCIE_ATU_UPPER_BASE             0x910
+#define PCIE_ATU_LIMIT                  0x914
+#define PCIE_ATU_LOWER_TARGET           0x918
+#define PCIE_ATU_UPPER_TARGET           0x91C
+#define PCIE_ATU_UPPER_LIMIT            0x924
+
+#define PCIE_ATU_REGION_INDEX1  0x1
+#define PCIE_ATU_TYPE_IO        0x2
+#define PCIE_ATU_TYPE_CFG0      0x4
+
+#define PCIE_ATU_BUS(x)         FIELD_PREP(GENMASK(31, 24), x)
+#define PCIE_ATU_DEV(x)         FIELD_PREP(GENMASK(23, 19), x)
+#define PCIE_ATU_FUNC(x)        FIELD_PREP(GENMASK(18, 16), x)
+
+/* Register address builder */
+#define PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(region) \
+    ((region) << 9)
+
+/*
+ * iATU Unroll-specific register definitions
+ * From 4.80 core version the address translation will be made by unroll
+ */
+#define PCIE_ATU_UNR_REGION_CTRL1       0x00
+#define PCIE_ATU_UNR_REGION_CTRL2       0x04
+#define PCIE_ATU_UNR_LOWER_BASE         0x08
+#define PCIE_ATU_UNR_UPPER_BASE         0x0C
+#define PCIE_ATU_UNR_LOWER_LIMIT        0x10
+#define PCIE_ATU_UNR_LOWER_TARGET       0x14
+#define PCIE_ATU_UNR_UPPER_TARGET       0x18
+#define PCIE_ATU_UNR_UPPER_LIMIT        0x20
+
+#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
+
+/* Parameters for the waiting for iATU enabled routine */
+#define LINK_WAIT_MAX_IATU_RETRIES      5
+#define LINK_WAIT_IATU                  9
+
+static int dw_pcie_read(void __iomem *addr, int size, uint32_t *val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, size) )
+    {
+        *val =3D 0;
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+    }
+
+    if (size =3D=3D 4)
+        *val =3D readl(addr);
+    else if (size =3D=3D 2)
+        *val =3D readw(addr);
+    else if (size =3D=3D 1)
+        *val =3D readb(addr);
+    else
+    {
+        *val =3D 0;
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+    }
+
+    return PCIBIOS_SUCCESSFUL;
+}
+
+static int dw_pcie_write(void __iomem *addr, int size, uint32_t val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, size) )
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+
+    if (size =3D=3D 4)
+        writel(val, addr);
+    else if (size =3D=3D 2)
+        writew(val, addr);
+    else if (size =3D=3D 1)
+        writeb(val, addr);
+    else
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+
+    return PCIBIOS_SUCCESSFUL;
+}
+
+static uint32_t rcar4_read_dbi(struct pci_host_bridge *bridge,
+                               uint32_t reg, size_t size)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    uint32_t val;
+
+    dw_pcie_read(addr, size, &val);
+    return val;
+}
+
+static void rcar4_write_dbi(struct pci_host_bridge *bridge,
+                            uint32_t reg, size_t size, uint32_t val)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+
+    dw_pcie_write(addr, size, val);
+}
+
+static uint32_t rcar4_readl_dbi(struct pci_host_bridge *bridge, uint32_t r=
eg)
+{
+    return rcar4_read_dbi(bridge, reg, sizeof(uint32_t));
+}
+
+static void dw_pcie_writel_dbi(struct pci_host_bridge *pci, uint32_t reg,
+                               uint32_t val)
+{
+    rcar4_write_dbi(pci, reg, sizeof(uint32_t), val);
+}
+
+static void rcar4_read_iatu_unroll_enabled(struct pci_host_bridge *bridge)
+{
+    struct rcar4_priv *priv =3D bridge->priv;
+    uint32_t val;
+
+    val =3D rcar4_readl_dbi(bridge, PCIE_ATU_VIEWPORT);
+    if (val =3D=3D 0xffffffff)
+        priv->iatu_unroll_enabled =3D true;
+
+    printk(XENLOG_DEBUG "%s iATU unroll: %sabled\n",
+           dt_node_full_name(bridge->dt_node),
+           priv->iatu_unroll_enabled ? "en" : "dis");
+}
+
+static uint32_t dw_pcie_readl_atu(struct pci_host_bridge *pci, uint32_t re=
g)
+{
+    struct rcar4_priv *priv =3D pci->priv;
+    int ret;
+    uint32_t val;
+
+    ret =3D dw_pcie_read(priv->atu_base + reg, 4, &val);
+    if ( ret )
+        printk(XENLOG_ERR "Read ATU address failed\n");
+
+    return val;
+}
+
+static void dw_pcie_writel_atu(struct pci_host_bridge *pci, uint32_t reg,
+                               uint32_t val)
+{
+    struct rcar4_priv *priv =3D pci->priv;
+    int ret;
+
+    ret =3D dw_pcie_write(priv->atu_base + reg, 4, val);
+    if (ret)
+        printk(XENLOG_ERR "Write ATU address failed\n");
+}
+
+static uint32_t dw_pcie_readl_ob_unroll(struct pci_host_bridge *pci,
+                                        uint32_t index, uint32_t reg)
+{
+	uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+	return dw_pcie_readl_atu(pci, offset + reg);
+}
+
+static void dw_pcie_writel_ob_unroll(struct pci_host_bridge *pci,
+                                     uint32_t index, uint32_t reg, uint32_=
t val)
+{
+    uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+    dw_pcie_writel_atu(pci, offset + reg, val);
+}
+
+static uint32_t dw_pcie_enable_ecrc(uint32_t val)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+
+static void dw_pcie_prog_outbound_atu_unroll(struct pci_host_bridge *pci,
+                                             uint8_t func_no, int index,
+                                             int type, uint64_t cpu_addr,
+                                             uint64_t pci_addr, uint64_t s=
ize)
+{
+    struct rcar4_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+    uint64_t limit_addr =3D cpu_addr + size - 1;
+
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_BASE,
+                             lower_32_bits(cpu_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_BASE,
+                             upper_32_bits(cpu_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_LIMIT,
+                             lower_32_bits(limit_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_LIMIT,
+                             upper_32_bits(limit_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_LOWER_TARGET,
+                             lower_32_bits(pci_addr));
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
+                             upper_32_bits(pci_addr));
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D upper_32_bits(size - 1) ? val | PCIE_ATU_INCREASE_REGION_SIZE =
: val;
+    if (priv->version =3D=3D 0x490A)
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
+                             PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for (retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++)
+    {
+        val =3D dw_pcie_readl_ob_unroll(pci, index,
+                                      PCIE_ATU_UNR_REGION_CTRL2);
+        if (val & PCIE_ATU_ENABLE)
+            return;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
+}
+
+static void __dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci,
+                                        uint8_t func_no, int index, int ty=
pe,
+                                        uint64_t cpu_addr, uint64_t pci_ad=
dr,
+                                        uint64_t size)
+{
+    struct rcar4_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+
+    if (priv->iatu_unroll_enabled)
+    {
+        dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
+                                         cpu_addr, pci_addr, size);
+        return;
+    }
+
+    dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
+                       PCIE_ATU_REGION_OUTBOUND | index);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE,
+                       lower_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE,
+                       upper_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT,
+                       lower_32_bits(cpu_addr + size - 1));
+    if (priv->version >=3D 0x460A)
+        dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_LIMIT,
+                           upper_32_bits(cpu_addr + size - 1));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET,
+                       lower_32_bits(pci_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
+                       upper_32_bits(pci_addr));
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D ((upper_32_bits(size - 1)) && (priv->version >=3D 0x460A)) ?
+        val | PCIE_ATU_INCREASE_REGION_SIZE : val;
+    if (priv->version =3D=3D 0x490A)
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for (retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++)
+    {
+        val =3D rcar4_readl_dbi(pci, PCIE_ATU_CR2);
+        if (val & PCIE_ATU_ENABLE)
+            return;
+
+        mdelay(LINK_WAIT_IATU);
+    }
+    printk(XENLOG_ERR "Outbound iATU is not being enabled\n");
+}
+
+static void dw_pcie_prog_outbound_atu(struct pci_host_bridge *pci, int ind=
ex,
+                                      int type, uint64_t cpu_addr,
+                                      uint64_t pci_addr, uint64_t size)
+{
+    __dw_pcie_prog_outbound_atu(pci, 0, index, type,
+                                cpu_addr, pci_addr, size);
+}
+
+static void __iomem *rcar4_child_map_bus(struct pci_host_bridge *bridge,
+                                         pci_sbdf_t sbdf, uint32_t where)
+{
+    uint32_t busdev;
+
+    busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
+        PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+
+    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
+    dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                              PCIE_ATU_TYPE_CFG0,
+                              bridge->child_cfg->phys_addr,
+                              busdev, bridge->child_cfg->size);
+
+    return bridge->child_cfg->win + where;
+}
+
+static int rcar4_child_config_read(struct pci_host_bridge *bridge,
+                                   pci_sbdf_t sbdf, uint32_t reg,
+                                   uint32_t len, uint32_t *value)
+{
+    struct rcar4_priv *priv =3D bridge->priv;
+    int ret;
+
+    /*
+     * FIXME: we cannot read iATU settings at the early initialization
+     * (probe) as the host's HW is not yet initialized at that phase.
+     * This read operation is the very first thing Domain-0 will do
+     * during its initialization, so take this opportunity and read
+     * iATU setting now.
+     */
+    if ( unlikely(!priv->iatu_unroll_initilized) )
+    {
+        rcar4_read_iatu_unroll_enabled(bridge);
+        priv->iatu_unroll_initilized =3D true;
+    }
+
+    ret =3D pci_generic_config_read(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr,
+                                  0, bridge->child_cfg->size);
+
+    return ret;
+}
+
+static int rcar4_child_config_write(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t reg,
+                                    uint32_t len, uint32_t value)
+{
+    struct rcar4_priv *priv =3D bridge->priv;
+    int ret;
+
+    ret =3D pci_generic_config_write(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr,
+                                  0, bridge->child_cfg->size);
+    return ret;
+}
+
+bool __init rcar4_child_need_p2m_hwdom_mapping(struct domain *d,
+                                               struct pci_host_bridge *bri=
dge,
+                                               uint64_t addr)
+{
+    struct pci_config_window *cfg =3D bridge->child_cfg;
+
+    /*
+     * We do not want ECAM address space to be mapped in Domain-0's p2m,
+     * so we can trap access to it.
+     */
+    return cfg->phys_addr !=3D addr;
+}
+
+const struct pci_ecam_ops rcar4_pcie_child_ops =3D {
+    .bus_shift  =3D 20,
+    .cfg_reg_index =3D rcar4_child_cfg_reg_index,
+    .pci_ops    =3D {
+        .map_bus                =3D rcar4_child_map_bus,
+        .read                   =3D rcar4_child_config_read,
+        .write                  =3D rcar4_child_config_write,
+        .need_p2m_hwdom_mapping =3D rcar4_child_need_p2m_hwdom_mapping,
+    }
+};
+
+static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] =
=3D
+{
+    { .compatible =3D "renesas,r8a779f0-pcie" },
+    { .compatible =3D "renesas,r8a779g0-pcie" },
+    { },
+};
+
+static int __init pci_host_generic_probe(struct dt_device_node *dev,
+                                         const void *data)
+{
+    struct pci_host_bridge *bridge;
+    struct rcar4_priv *priv;
+    paddr_t atu_phys_addr;
+    paddr_t atu_size;
+    int atu_idx, ret;
+
+    bridge =3D pci_host_common_probe(dev, &rcar4_pcie_ops, &rcar4_pcie_chi=
ld_ops,
+                                   sizeof(*priv));
+    if ( IS_ERR(bridge) )
+        return PTR_ERR(bridge);
+
+    priv =3D bridge->priv;
+
+    atu_idx =3D dt_property_match_string(dev, "reg-names", "atu");
+    if ( atu_idx < 0 )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range index in device tree\=
n");
+        return atu_idx;
+    }
+    ret =3D dt_device_get_address(dev, atu_idx, &atu_phys_addr, &atu_size)=
;
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range in device tree\n");
+        return ret;
+    }
+    printk("iATU at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n",
+           atu_phys_addr, atu_phys_addr + atu_size - 1);
+    priv->atu_base =3D ioremap_nocache(atu_phys_addr, atu_size);
+    if ( !priv->atu_base )
+    {
+        printk(XENLOG_ERR "iATU ioremap failed\n");
+        return ENXIO;
+    }
+
+    if ( !dt_property_read_u32(dev, "num-viewport", &priv->num_viewport) )
+        priv->num_viewport =3D 2;
+
+    /*
+     * FIXME: we cannot read iATU unroll enable now as the host bridge's
+     * HW is not yet initialized by Domain-0: leave it for later.
+     */
+
+    printk(XENLOG_INFO "%s number of view ports: %d\n", dt_node_full_name(=
dev),
+           priv->num_viewport);
+
+    priv->version =3D RCAR4_DWC_VERSION;
+
+    return 0;
+}
+
+DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
+.dt_match =3D rcar4_pcie_dt_match,
+.init =3D pci_host_generic_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.34.1

