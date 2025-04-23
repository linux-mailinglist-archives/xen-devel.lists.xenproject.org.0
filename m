Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDCAA98821
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964357.1355203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxf-0002nq-LI; Wed, 23 Apr 2025 11:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964357.1355203; Wed, 23 Apr 2025 11:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Xxf-0002jm-H3; Wed, 23 Apr 2025 11:08:15 +0000
Received: by outflank-mailman (input) for mailman id 964357;
 Wed, 23 Apr 2025 11:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hoPD=XJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u7Xxd-0001zZ-VZ
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:08:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2612::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ea34c55-2033-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:08:11 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBAPR03MB6677.eurprd03.prod.outlook.com
 (2603:10a6:10:197::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 11:08:08 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 11:08:08 +0000
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
X-Inumbo-ID: 3ea34c55-2033-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuR+C2UobfpbSP20Y9hiPTtvMU6N7w7NmZ7ksr2O2y5VHtdyggAh0gVdtY2lSEGpsQvy7qWTTV+TIeZeSKOJThaxew/v0rdtmt33dkSx5KMZF672BUwxtSj9BHnGmffaH1pqaUz86dk0YxPq5NoOaHQQNm0+wd4ppZi5jFA3ONsAZDmwLxVlKLML9EgBnys7+vfyI/F1AMBBM1sawc9HnHmen4hmy9vaGPoZKecjkK8PswYnFAu59gB4rfSNFsq7gaqMKTPYFl3nV5GCiqeyJRz43UBPkD5L2kutpLTr/y1zeHk5j+cGJZw8U20cquFVxOWXufAuZ8pMskXLhTQ9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZGtLr8LWXtAF2lz4iZ5bGQb6aV1h7oDsguvzkpx0co=;
 b=hEC009c+A37zDz+8uCvY7WLd1zfuE4santNQXqXSgvAkHSiDPk/ALz9wSF0ojSPZ/m9CPg7/J4BB4UyFz2tD4dVR/U//hw77VhCQB9fm9KXKXy8CVocxBGV/brVv7QIQF7dRL6ZpF0beIzgp6mpEeK9wfAp2vkK3QNJwKjx3G+fXVomakDHxjW4PJKN8WW4pffhksobICM1OWboSjB8z7Y/WvOt/k9+ak51yD5sjJ6A+xVMCP8k5zUQ/tjQugV7u9ngKSoaRM5Dd7vTnFjhNzk1dsH/noOXxB5zpSeig4GgO5EYRBdfe55+FN/dqG8ek7c6qSA+2SNTFemJA0Oi49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZGtLr8LWXtAF2lz4iZ5bGQb6aV1h7oDsguvzkpx0co=;
 b=ruuqij5xgiFBROUKx2QAV0zWsPYc8o77AD6jzv6tO0H4V+kWt+r5YuNaM15GtPOLmAfyeus8i1S+h6O4B8gNytrhSfBoNiXe0b0pel4/4zN7i3YNQJ4F2lJVJlx+FHJME1IUYO6tMDxtfPjeTCugfXxM7pfz2UAnsfoEm1lRX4S4+RbE/bHByH8JFh0ku9eMa0dVYXeeDCB286GGvK86LyORJ3sfqpKY3BpC6OwKpnXlT8h0XE2kA7y4p/Ng41zY/7scguSNtKZu8geFvSKm9o1qFj+JXr24LhLNZAcrD5oLeLvb4nxVflj7MlWkM8Qk2tucrquUgCOtTyHrAw8MaA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v4 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Topic: [PATCH v4 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHbtD/+f1IljlTzAkG+gkmGFEbJEA==
Date: Wed, 23 Apr 2025 11:08:08 +0000
Message-ID:
 <98c8e00a77800e8b1163ab1efa9a60f1bced0fb9.1745402473.git.mykyta_poturai@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745402473.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBAPR03MB6677:EE_
x-ms-office365-filtering-correlation-id: adadf5c7-0ad0-4b2e-e21b-08dd825720f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?v/7bzN3xb4p+BxUeRNYZ8+RT9lWP2Yy6lhTD9cmyjRxHfefuF43JdZ64GF?=
 =?iso-8859-1?Q?lS01Hj4I+3OF9jonGpsqKfeSPhhgiYZiR8M3ZFtIQ0usbIRpeW+YpxlyV2?=
 =?iso-8859-1?Q?6slDdI+43sCccODmwjgx7uPGlfhp/0BcPz+N3vLlTjzK9a0WGQdUKPYnUW?=
 =?iso-8859-1?Q?AVpIW7EdiriVw5xUkc3Ysn5CJZVXC8iddqFojefiXUX+0BqKX1L4N5BTdz?=
 =?iso-8859-1?Q?G8bWFo7GyYw4cZv3x/IK6+0vVDmWX+nxel6DBNyh0Ia1PdAZHWBMMcaSe1?=
 =?iso-8859-1?Q?h4swJtL3xky5rfqqQmI5v9p54Kq8xjEkeW+8zwDwuRVASPXZ4b6gnbxSCu?=
 =?iso-8859-1?Q?2KudQIZJ/AF8S8poAWrrUxEZCW2nu/WB/yrSmv2Zvuhqn3KR3jKGs2lwXn?=
 =?iso-8859-1?Q?i0cthTBCZV4ig+ecOg4MK1KFLkPVtLWUo7BAvmv155iTS9alyQABWE4FJr?=
 =?iso-8859-1?Q?NPoWP9uLVpyo7HeyrmBzTEuVuhYYXLx6kXk5Huh38x2uvQI1aPWlP2EW3p?=
 =?iso-8859-1?Q?zsBKSKKFBsxW2QBhA5cW+dbfgby3EHGSNyrtu4MyROvhv30QLznf3rhMK8?=
 =?iso-8859-1?Q?4B0AhZeuXhLM6lUBigRWV2AgJ4O+CttvjbZyemOLBx3u7ENQRX7DtIEJuC?=
 =?iso-8859-1?Q?Ekkj3cMBUhYUD383CJRf0Ixn6cvf8eDQhk6E0gJ6/6eBm8S5IfuLHomDFE?=
 =?iso-8859-1?Q?lini5Lrhj+RYulDrthwgV8uUU8/q13b5fmsA1+CPF+GCpUln9V9DQSTsjt?=
 =?iso-8859-1?Q?HxeINwr9PyndiE3xaZifL6hNrJaChV+8y2wIY55+EH+Cz6yGyndvY8Ofzt?=
 =?iso-8859-1?Q?6OrSXjHuV4zeZOe3YY90zNKnDYl1S5szwcZWBeoYEKD6bxS3P++G8or2CQ?=
 =?iso-8859-1?Q?dGzrMZZ+7UNfQv1M+n20YfLFfXGkKhVgGmB50vDARmH2XOlWXT408PCjPC?=
 =?iso-8859-1?Q?OzbZjuqwW/7t34nHR8qXQNQUW+7Wo8Ov29YgbDmE4SshEn7eWfg0CokUvg?=
 =?iso-8859-1?Q?mlbZv6p/pgDUvy6tuht3SDjsn18MzOtDcZ6lJ/7MHang5SLNel28bErl1i?=
 =?iso-8859-1?Q?93rrQPjLN2zFFkFcwjLNGn7dS4lnSkLndKQFdUt553jI2VD0Gh876djYa8?=
 =?iso-8859-1?Q?BXNf33KsCmuJnnoVqBfVgwHXooI4wy8+9nqTlzzZPdPjOV9lea2e7WOwAi?=
 =?iso-8859-1?Q?+SfA0+rKugtumgW/TA9Wb2vQT1GycLPJxt4UK68e1YeFvc3hIh0mvc8FL1?=
 =?iso-8859-1?Q?Zcan3MpRfupQ/wb9QdQjCy+Jq7O7I8pa+Dq2+03HPrGD0oc1Z7BH+k/W4d?=
 =?iso-8859-1?Q?PbbUb8moa364/hphmXmh7l+B+bqrU0NaU+rX+46/zMZ487Br3WEmSIVIH4?=
 =?iso-8859-1?Q?p4+iSifhIS87yz9GAIc1oFUnUVLRybMe15TdmcRw1PX6RyMHxQP/gOZA5s?=
 =?iso-8859-1?Q?/pX6N7ujA5ilW1OIP5PZRq8M6QSphsQuSWFGmJncQ+0zLfpxK6dQyMlPC4?=
 =?iso-8859-1?Q?y51D/GII0wUqMesD+ZQ2qrK0IZDH+ALPfcy8t2Ii5pz0sv0U7WEmVUHkPV?=
 =?iso-8859-1?Q?lP41RiM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BxXja2pZrWh+hHJ17Qrx9vSDjBL+evBYECLhAJRQSgnZMycZW57LJ5Gbj4?=
 =?iso-8859-1?Q?EQGuI+dIOygppm9z3OORPm2OwgguBiTf88frnM8LrQcSARAxQ1+zaTgUQY?=
 =?iso-8859-1?Q?ka5yJDGXcU1cHSOOoOBnsfLh2lgBCVFxJzypc1TNVS5NLW88IJ106Hy+ay?=
 =?iso-8859-1?Q?GrcMZwSGdDp3sVgDj2QcADTRYfq+/eZrLinMYCD94HlswFy/+N2uMaY8QA?=
 =?iso-8859-1?Q?44F3BabYhfSZOEbLvo4I9UHeCqCfFdNHjwSptngFRHPq3jov/1dNo03Y8s?=
 =?iso-8859-1?Q?jwGgdy2ro2Ohh5h4PYmMdF5RmApC3Doa3k9yyRjIog8VJN3xOcGHOW+5En?=
 =?iso-8859-1?Q?WdwQ8wcKuGNiY8hLfZgtM86p6Pn/EQY1+HZblDl4nlwxmbBN9Df3TFEPev?=
 =?iso-8859-1?Q?u81KRG/l1GnRGFwbiPEOu8FSndkKAR/v/3FRedUT8XiWlRxtgAtEnjrw72?=
 =?iso-8859-1?Q?at7akEORqfYcqkPp7UtlN88xeO7i0i0a9w+Vb4nKgb26VUmCkpBaigUOmL?=
 =?iso-8859-1?Q?7tUXBevYfev7tZfziCSKgSt77KSUIrnapIQ1VB9840D+v2cisvFUN/5k2W?=
 =?iso-8859-1?Q?WdxtXAxNq8mTJvZtvXKatyIzGgyGi5M4mKbBK2LAYaAkUH68vksDkbwQNr?=
 =?iso-8859-1?Q?yF84OYfuZWiymIhGYqeEFPnGIdz1uGJnqBPpyL8jiHRGKezejI+OnP7Ih1?=
 =?iso-8859-1?Q?2RsyEwNDKD4zxYgSxtlin1p/9UwiaKk58KkF0ss9NpbPiBMu2wq2YsXPKx?=
 =?iso-8859-1?Q?L/a7HxVdmyWBe0v5BG6hpeHhJdhViz1QmAPXKfR/M5IpNK3emWQbNgv9A5?=
 =?iso-8859-1?Q?z1Bwi0s29T8sDDR1nNt7vX0ANN+nL+XLSq4St2svAWcOs+vMaRlBsSIxUv?=
 =?iso-8859-1?Q?wCYm9KJjp9h/ZGk8/f8I9fQj1K1Bp/NqzLOeSMLXk71RzdqJ1z4umYUMCq?=
 =?iso-8859-1?Q?5kxGgX9Hc29AmjUPuTeIGmDpbnfjCGWBbub3qNFwYZJhPznx3NZmihru9X?=
 =?iso-8859-1?Q?EhHveQ3EUbfU7izqjExsgsOtYYPnbc4N75sz9gfVWrL1UYQDd0CEGPOTdD?=
 =?iso-8859-1?Q?5ismYv3Y6IgGV+LKNDsFTE6VUlTvBPnjPGP9anqLuuMLXxeEJRR87tHkhe?=
 =?iso-8859-1?Q?CU/tgiMAc0wwl0mvXXcW93xNQZ074P28agpVvTPLyuxSXwNZIQzoWT6CnE?=
 =?iso-8859-1?Q?I2rFlPSKpb2Z7Bne+T9I2O1BGMMVfqXQlLYgqFgZI/AAWDTwAeOFEVahWt?=
 =?iso-8859-1?Q?dTk0wRMJ1bxd0os1tkhhwInNqoU4MnB0ISPsoL9SE/FwaPqdG/8rj3qJ4Z?=
 =?iso-8859-1?Q?Vj9i9zauw50P/WUa/EyD75hJF7j1jfACRJXNYUbvzK554NcAOr4WLrFrjI?=
 =?iso-8859-1?Q?kGtFfjcWcKMD1IM/Ca3ifvVSUVspARPLNpX5Pp8SMqecpMzrRsZhuVQrQr?=
 =?iso-8859-1?Q?8DurYTr0YKOHzLa7NSgu1oDZbNnJyeBUey4kclT/Jrg1YbyhJXpToJYnAi?=
 =?iso-8859-1?Q?HzCyY4RPEDhG6kUUIuUzz727ZMRcd25dvOQ4LiK/nVSz8FIWF05EtGR5xG?=
 =?iso-8859-1?Q?FU1oSQCGrau3NNlKclnT4tV1MfpS2qR3q9ONhvVq2EkDuwxxYjLs9X/Jst?=
 =?iso-8859-1?Q?22D2vju/UZb4iaNu6WDF0Svqp7fP1HqQEYv4vnpT3yD65Aw3LmVy214Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adadf5c7-0ad0-4b2e-e21b-08dd825720f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 11:08:08.1463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5qGFKG6iY45YNB9AaNvQE7496yGDm52k5LAvqlqJFlksRRwDCOo9Lv3cPKBYqogEGRDV/S0Siiyn0CQzV/AO5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6677

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add support for Renesas R-Car Gen4 PCI host controller, specifically
targeting the S4 and V4H SoCs. The implementation includes configuration
read/write operations for both root and child buses. For accessing the
child bus, iATU is used for address translation.

Code common to all DesignWare PCI host controllers is located in a
separate file to allow for easy reuse in other DesignWare-based PCI
host controllers.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v3->v4:
* no changes

v2->v3:
* move priv allocation to dw_pcie_host_probe

v1->v2:
* move designware code in a separate file
---
 xen/arch/arm/pci/Makefile         |   2 +
 xen/arch/arm/pci/pci-designware.c | 403 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-designware.h | 102 ++++++++
 xen/arch/arm/pci/pci-host-rcar4.c | 103 ++++++++
 4 files changed, 610 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-designware.c
 create mode 100644 xen/arch/arm/pci/pci-designware.h
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

diff --git a/xen/arch/arm/pci/Makefile b/xen/arch/arm/pci/Makefile
index 1d045ade01..ca6135e282 100644
--- a/xen/arch/arm/pci/Makefile
+++ b/xen/arch/arm/pci/Makefile
@@ -4,3 +4,5 @@ obj-y +=3D pci-host-generic.o
 obj-y +=3D pci-host-common.o
 obj-y +=3D ecam.o
 obj-y +=3D pci-host-zynqmp.o
+obj-y +=3D pci-designware.o
+obj-y +=3D pci-host-rcar4.o
diff --git a/xen/arch/arm/pci/pci-designware.c b/xen/arch/arm/pci/pci-desig=
nware.c
new file mode 100644
index 0000000000..dcbd07ced3
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.c
@@ -0,0 +1,403 @@
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
+#include <asm/io.h>
+
+#include "pci-designware.h"
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
+static int dw_pcie_read(void __iomem *addr, int size, uint32_t *val)
+{
+    if ( !IS_ALIGNED((uintptr_t)addr, size) )
+    {
+        *val =3D 0;
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+    }
+
+    if ( size =3D=3D 4 )
+        *val =3D readl(addr);
+    else if ( size =3D=3D 2 )
+        *val =3D readw(addr);
+    else if ( size =3D=3D 1 )
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
+    if ( size =3D=3D 4 )
+        writel(val, addr);
+    else if ( size =3D=3D 2 )
+        writew(val, addr);
+    else if ( size =3D=3D 1 )
+        writeb(val, addr);
+    else
+        return PCIBIOS_BAD_REGISTER_NUMBER;
+
+    return PCIBIOS_SUCCESSFUL;
+}
+
+static uint32_t dw_pcie_read_dbi(struct pci_host_bridge *bridge, uint32_t =
reg,
+                                 size_t size)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+    uint32_t val;
+
+    dw_pcie_read(addr, size, &val);
+    return val;
+}
+
+static void dw_pcie_write_dbi(struct pci_host_bridge *bridge, uint32_t reg=
,
+                              size_t size, uint32_t val)
+{
+    void __iomem *addr =3D bridge->cfg->win + reg;
+
+    dw_pcie_write(addr, size, val);
+}
+
+static uint32_t dw_pcie_readl_dbi(struct pci_host_bridge *bridge, uint32_t=
 reg)
+{
+    return dw_pcie_read_dbi(bridge, reg, sizeof(uint32_t));
+}
+
+static void dw_pcie_writel_dbi(struct pci_host_bridge *pci, uint32_t reg,
+                               uint32_t val)
+{
+    dw_pcie_write_dbi(pci, reg, sizeof(uint32_t), val);
+}
+
+static void dw_pcie_read_iatu_unroll_enabled(struct pci_host_bridge *bridg=
e)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    uint32_t val;
+
+    val =3D dw_pcie_readl_dbi(bridge, PCIE_ATU_VIEWPORT);
+    if ( val =3D=3D 0xffffffff )
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
+    struct dw_pcie_priv *priv =3D pci->priv;
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
+    struct dw_pcie_priv *priv =3D pci->priv;
+    int ret;
+
+    ret =3D dw_pcie_write(priv->atu_base + reg, 4, val);
+    if ( ret )
+        printk(XENLOG_ERR "Write ATU address failed\n");
+}
+
+static uint32_t dw_pcie_readl_ob_unroll(struct pci_host_bridge *pci,
+                                        uint32_t index, uint32_t reg)
+{
+    uint32_t offset =3D PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
+
+    return dw_pcie_readl_atu(pci, offset + reg);
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
+    struct dw_pcie_priv *priv =3D pci->priv;
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
+    if ( priv->version =3D=3D 0x490A )
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, val);
+    dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
+                             PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for ( retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
+    {
+        val =3D dw_pcie_readl_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CT=
RL2);
+        if ( val & PCIE_ATU_ENABLE )
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
+    struct dw_pcie_priv *priv =3D pci->priv;
+    uint32_t retries, val;
+
+    if ( priv->iatu_unroll_enabled )
+    {
+        dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type, cpu_ad=
dr,
+                                         pci_addr, size);
+        return;
+    }
+
+    dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT,
+                       PCIE_ATU_REGION_OUTBOUND | index);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_BASE, lower_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_BASE, upper_32_bits(cpu_addr));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LIMIT, lower_32_bits(cpu_addr + size =
- 1));
+    if ( priv->version >=3D 0x460A )
+        dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_LIMIT,
+                           upper_32_bits(cpu_addr + size - 1));
+    dw_pcie_writel_dbi(pci, PCIE_ATU_LOWER_TARGET, lower_32_bits(pci_addr)=
);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET, upper_32_bits(pci_addr)=
);
+    val =3D type | PCIE_ATU_FUNC_NUM(func_no);
+    val =3D ((upper_32_bits(size - 1)) && (priv->version >=3D 0x460A))
+              ? val | PCIE_ATU_INCREASE_REGION_SIZE
+              : val;
+    if ( priv->version =3D=3D 0x490A )
+        val =3D dw_pcie_enable_ecrc(val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, val);
+    dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
+
+    /*
+     * Make sure ATU enable takes effect before any subsequent config
+     * and I/O accesses.
+     */
+    for ( retries =3D 0; retries < LINK_WAIT_MAX_IATU_RETRIES; retries++ )
+    {
+        val =3D dw_pcie_readl_dbi(pci, PCIE_ATU_CR2);
+        if ( val & PCIE_ATU_ENABLE )
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
+    __dw_pcie_prog_outbound_atu(pci, 0, index, type, cpu_addr, pci_addr, s=
ize);
+}
+
+void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int vers=
ion)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+
+    priv->version =3D version;
+}
+
+void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t where)
+{
+    uint32_t busdev;
+
+    busdev =3D PCIE_ATU_BUS(sbdf.bus) | PCIE_ATU_DEV(PCI_SLOT(sbdf.devfn))=
 |
+             PCIE_ATU_FUNC(PCI_FUNC(sbdf.devfn));
+
+    /* FIXME: Parent is the root bus, so use PCIE_ATU_TYPE_CFG0. */
+    dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                              PCIE_ATU_TYPE_CFG0, bridge->child_cfg->phys_=
addr,
+                              busdev, bridge->child_cfg->size);
+
+    return bridge->child_cfg->win + where;
+}
+
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
+                              uint32_t reg, uint32_t len, uint32_t *value)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
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
+        dw_pcie_read_iatu_unroll_enabled(bridge);
+        priv->iatu_unroll_initilized =3D true;
+    }
+
+    ret =3D pci_generic_config_read(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr, 0,
+                                  bridge->child_cfg->size);
+
+    return ret;
+}
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t =
sbdf,
+                               uint32_t reg, uint32_t len, uint32_t value)
+{
+    struct dw_pcie_priv *priv =3D bridge->priv;
+    int ret;
+
+    ret =3D pci_generic_config_write(bridge, sbdf, reg, len, value);
+    if ( !ret && (priv->num_viewport <=3D 2) )
+        dw_pcie_prog_outbound_atu(bridge, PCIE_ATU_REGION_INDEX1,
+                                  PCIE_ATU_TYPE_IO,
+                                  bridge->child_cfg->phys_addr, 0,
+                                  bridge->child_cfg->size);
+    return ret;
+}
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                                 struct pci_host_bridge *b=
ridge,
+                                                 uint64_t addr)
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
+struct pci_host_bridge *__init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops)
+{
+    struct pci_host_bridge *bridge;
+    struct dw_pcie_priv *priv;
+
+    paddr_t atu_phys_addr;
+    paddr_t atu_size;
+    int atu_idx, ret;
+
+    bridge =3D pci_host_common_probe(dev, ops, child_ops);
+    if ( IS_ERR(bridge) )
+        return bridge;
+
+    priv =3D xzalloc_bytes(sizeof(struct dw_pcie_priv));
+    if ( !priv )
+        return ERR_PTR(-ENOMEM);
+
+    bridge->priv =3D priv;
+
+    atu_idx =3D dt_property_match_string(dev, "reg-names", "atu");
+    if ( atu_idx < 0 )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range index in device tree\=
n");
+        return ERR_PTR(atu_idx);
+    }
+    ret =3D dt_device_get_address(dev, atu_idx, &atu_phys_addr, &atu_size)=
;
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Cannot find \"atu\" range in device tree\n");
+        return ERR_PTR(ret);
+    }
+    printk("iATU at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", atu_phys_add=
r,
+           atu_phys_addr + atu_size - 1);
+    priv->atu_base =3D ioremap_nocache(atu_phys_addr, atu_size);
+    if ( !priv->atu_base )
+    {
+        printk(XENLOG_ERR "iATU ioremap failed\n");
+        return ERR_PTR(ENXIO);
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
+    return bridge;
+}
diff --git a/xen/arch/arm/pci/pci-designware.h b/xen/arch/arm/pci/pci-desig=
nware.h
new file mode 100644
index 0000000000..a15ba9a329
--- /dev/null
+++ b/xen/arch/arm/pci/pci-designware.h
@@ -0,0 +1,102 @@
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
+#include <xen/pci.h>
+#include <xen/init.h>
+
+#ifndef __PCI_DESIGNWARE_H__
+#define __PCI_DESIGNWARE_H__
+
+#define PCIBIOS_SUCCESSFUL              0x00
+#define PCIBIOS_BAD_REGISTER_NUMBER     0x87
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
+#define FIELD_PREP(_mask, _val) \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
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
+struct dw_pcie_priv {
+    uint32_t num_viewport;
+    bool iatu_unroll_initilized;
+    bool iatu_unroll_enabled;
+    void __iomem *atu_base;
+    unsigned int version;
+};
+
+void dw_pcie_set_version(struct pci_host_bridge *bridge, unsigned int vers=
ion);
+
+void __iomem *dw_pcie_child_map_bus(struct pci_host_bridge *bridge,
+                                    pci_sbdf_t sbdf, uint32_t where);
+
+int dw_pcie_child_config_read(struct pci_host_bridge *bridge, pci_sbdf_t s=
bdf,
+                              uint32_t reg, uint32_t len, uint32_t *value)=
;
+
+int dw_pcie_child_config_write(struct pci_host_bridge *bridge, pci_sbdf_t =
sbdf,
+                               uint32_t reg, uint32_t len, uint32_t value)=
;
+
+bool __init dw_pcie_child_need_p2m_hwdom_mapping(struct domain *d,
+                                                 struct pci_host_bridge *b=
ridge,
+                                                 uint64_t addr);
+
+struct pci_host_bridge *__init
+dw_pcie_host_probe(struct dt_device_node *dev, const void *data,
+                   const struct pci_ecam_ops *ops,
+                   const struct pci_ecam_ops *child_ops);
+#endif /* __PCI_DESIGNWARE_H__ */
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
new file mode 100644
index 0000000000..cae1b4254d
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -0,0 +1,103 @@
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
+#include <xen/init.h>
+#include <xen/pci.h>
+
+#include <asm/device.h>
+#include <asm/io.h>
+#include <asm/pci.h>
+
+#include "pci-designware.h"
+
+#define RCAR4_DWC_VERSION       0x520A
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
+const struct pci_ecam_ops rcar4_pcie_child_ops =3D {
+    .bus_shift  =3D 20,
+    .cfg_reg_index =3D rcar4_child_cfg_reg_index,
+    .pci_ops    =3D {
+        .map_bus                =3D dw_pcie_child_map_bus,
+        .read                   =3D dw_pcie_child_config_read,
+        .write                  =3D dw_pcie_child_config_write,
+        .need_p2m_hwdom_mapping =3D dw_pcie_child_need_p2m_hwdom_mapping,
+    }
+};
+
+static const struct dt_device_match __initconstrel rcar4_pcie_dt_match[] =
=3D {
+    { .compatible =3D "renesas,r8a779f0-pcie" },
+    { .compatible =3D "renesas,r8a779g0-pcie" },
+    {},
+};
+
+static int __init pci_host_generic_probe(struct dt_device_node *dev,
+                                         const void *data)
+{
+    struct pci_host_bridge *bridge;
+
+    bridge =3D dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
+                                &rcar4_pcie_child_ops);
+
+    dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
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

