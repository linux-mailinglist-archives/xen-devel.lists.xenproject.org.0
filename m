Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2BB1A8AF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 19:34:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069744.1433498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiz3v-0001VI-JD; Mon, 04 Aug 2025 17:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069744.1433498; Mon, 04 Aug 2025 17:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiz3v-0001Td-GD; Mon, 04 Aug 2025 17:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1069744;
 Mon, 04 Aug 2025 17:33:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PTKV=2Q=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uiz3t-0001TV-Cp
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 17:33:25 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f2e8a39-7159-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 19:33:23 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB9510.eurprd03.prod.outlook.com (2603:10a6:20b:5a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 17:33:21 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 17:33:21 +0000
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
X-Inumbo-ID: 1f2e8a39-7159-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhZ5d4/tGhZmAOyqjNnkSvO3bmQX8Lmcg7dL0PLb+8f4EItzHnC8XHH5CnHweeg2jFVjebQZvIX5DFgzJo6a/qhm63z/7wTuVp1V/EF9W3UULnOKNowkNEpVqhLthsbMgiI58XfurP4nSUCrXDE1qOSVItdKNBQe7zBcaaz0EMQh+jJmKHwV5QqtQv4Z+YaUOnK4ZJ8nbmc8NjFuJ3noM/v6EuwxgE5I6qbYJiDYp8k0EI7TXO/tYEzR0WLtZbrZhLUisNE0DFUqxNFMhFUU6kE+zsCnZ6pucxiP4xdqYOd73zg3qbb155wb2SueztYBi1XVzlWt2RFt6jsJihVq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCZPBd82sPIbHgVPuRFNmG/aDYd22ULzwkmFP5Qxuis=;
 b=MAEd4x5h9o0CnUpSATy7gBDH/JnDsqUYrT1Js+AHpdIT9HYQSnojeeBOb0S1ZvYCyquM5jmxvMSe0F532oYWmcBfdLBjEbTEsKzj/gfjd8EWq1oYFfQK6687FBEt3W5jmk8EPP8AHeH0Sy5uR1gThdu+KLEKllmtBWteOCPZWQfpRZbUPi7CcaAgqQfRfQ0NWZH66DlL7lUEuprZbggkxF/bcLDWPP4d2vr3w8tBvesiR6iS2AgQbNISwmXkwTWAyeND6g6sZYS5hV+2MjVB/jzJUbobmf+Pav4GxEYlv4587p0cgp/5VNlW5haR02H7REMQzReZhgVwpLIhencV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCZPBd82sPIbHgVPuRFNmG/aDYd22ULzwkmFP5Qxuis=;
 b=gWF+co/TmfIJtA6erq+ztnwLOVtPsVlO5foowUITdLIGwlWy/VnFCjvt5Hgd+jX/SiFlkGtEmYIoCKlPhlprLBiYcRSheeEKz6LTfXZruRLg6Gzr3PUMFcZKUvG2bKm/yEfd5ufSZ+Ge+PL69IiIGg5zyhiZ0JT+z3wDKVRr6E9gG2h2CH1OSJ31OiN3qB2OdLcBCHXc202kn7pvDvYBr4CRZIR/CDrXZzuXTHnzWvoXvso7gkeOOLzwZ/uHDyY5j4JiWyPEM5P654aw5GQndRE56jyuCLGu/CFpxgXmnNQX4V8tv4Az6r9DYamwrA3wRs989gxQWh2zkjXIeVdASQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] misra: remove default case in single-clause switch
Thread-Topic: [PATCH] misra: remove default case in single-clause switch
Thread-Index: AQHcBWXfPSyq9APrf0Os3CWQrCUztQ==
Date: Mon, 4 Aug 2025 17:33:21 +0000
Message-ID:
 <725ec86ac1aa883c35fb30b8f226c95cbe0934e9.1754322299.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB9510:EE_
x-ms-office365-filtering-correlation-id: d9f165e6-0890-4e41-3275-08ddd37d01df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xvNe53eZqnK4i61QnY7F9NBOZIPeUPvxDFeJLXjjgrNibt+fQzyvK4TR0b?=
 =?iso-8859-1?Q?W+EN0N7RF3AWBXPetNpEy8gCLvlOE8MRR1tl1SOgbzOGPIxf/B4+ZrSXTu?=
 =?iso-8859-1?Q?qbAn8Js79mRyqDZ2sESPXIMB4T0bqznnII4+1BOWyR1IividLHIUaSycYF?=
 =?iso-8859-1?Q?7xy/7qkzjsFC0PK0a/QwZ14AQHg+s5dwTBg+7Fy2p1y3e/O0j03Y7QBDek?=
 =?iso-8859-1?Q?w1GnXtlXRIlhcCimfThO0YpP8HcdT5QFPcz/5AfJOh9gcclgncFbhcyOj1?=
 =?iso-8859-1?Q?oJ9Q8UePBSOar7mVs0LQHDsrx1sA2vJ/jB5HCrSloKOEE75zFP47cicRXD?=
 =?iso-8859-1?Q?jtMK1aKP+KzxntSTXGywBUQun0ypOwCI5bnK0/OL79a6OdF6fNQVnZV5Gi?=
 =?iso-8859-1?Q?iLGJrqOs+cS81r7LgGTEIAxr85d8DnXqHPdYkUx/Y6WyGNBaLpT2sYVhtK?=
 =?iso-8859-1?Q?hTn/eJCsxtUJSqzi6wtmUIglZox2rdNc+oc076w0Dadnut1D7m2m2KLdfX?=
 =?iso-8859-1?Q?qULRJTg0AI7IShpSMSdu6xlxpzrirOWfnivan/tclN2axD3aZnOadshNta?=
 =?iso-8859-1?Q?neoB6UL3aChg8PHSExWtPd8U/RS3CIuj1Qnkm4ZWvlZhPG+6kqI/4dzNmx?=
 =?iso-8859-1?Q?40MP91I4q6vKvORgbV8q5Sottkq0isfrn/DtRM1UhNVoKM9H6xFYF55X91?=
 =?iso-8859-1?Q?Nho48JGV0enZx9IrAa+0/QZSHTnjKx1kjG43WpDSGRRX6ASvy4GjBMc5zt?=
 =?iso-8859-1?Q?R4bhRgQyeZVAuUsXPvPRINn410mTFpnj2/Kv0MBWWyUHKAOyxUipNAhdBN?=
 =?iso-8859-1?Q?9vEYT3ku6Pd5gQzRc1VQV3yqFhWubqBlFhRxrP5XigcPNFndKhZVNogFM6?=
 =?iso-8859-1?Q?U5VQYrzjyCLeniEqI8lJe1BgILxQYvqi6Rmlz1w7zdTt4a47rJUJU81Cfh?=
 =?iso-8859-1?Q?axQ5Zyzi01qyGTVO4KD/VlmbcdYZml3EiP06mEXv5xJufrtqmHpxMmBUBh?=
 =?iso-8859-1?Q?Y/8ci/0bKJE63vpVNSmlctNbIsPbeMMYcbjY1CTVRRc6uV7pyEB/T0GRGv?=
 =?iso-8859-1?Q?nvbdqL2bF4/r5xHwv5En4313drK2GdRmU0uwgf84T10pkAWZ3JjfxJcfPD?=
 =?iso-8859-1?Q?tzCzccFM2eFlXwtduxAEjPWVPrcaNvjGKDgUTpcT259fXu7n0Zv+O+791e?=
 =?iso-8859-1?Q?sWu7LQA2GGJMsYQ4a2Tfuqh97UJcQMmpc/Xq4LOAUo66iqZ5GEF0C8AX/z?=
 =?iso-8859-1?Q?NSMLNy1+US7Hv+45uCbbOw1867654e73GqP/xcdjSEhAKvKNttvFeVEfhb?=
 =?iso-8859-1?Q?NlXuhvIOgaJ0XeVcxu0PNq2qSa9f4Ktx6Zl5JDiSxgAy9BJVTChfInjAz/?=
 =?iso-8859-1?Q?K0gvWosJ21REWNsgZJ4sw2f9DRLIxC8JV/uXitjYUVXDCMvWduYKyCOZoo?=
 =?iso-8859-1?Q?PcC70LWuyAbZg18aX9NieSOGqEBweE7wzN83hyU70wt+a9vcwUswI85bVi?=
 =?iso-8859-1?Q?nqRhzlrH6513VO02LsVkbFDFc84Nqz9FnvAxAOfH/1RrY4crIVfuYD3fuv?=
 =?iso-8859-1?Q?GB+UXoA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vA6UJEcU7Ld0ph9GIcB/Jf8d+cvXjeJTHAdG2yTdu/IeICcJwQxf18lPmK?=
 =?iso-8859-1?Q?lA5B2ogBGg5qtVG+DeAikFxSxhq0xWYNegfPZFvAtKkzA9Q2+JDV4Va9A6?=
 =?iso-8859-1?Q?UD6/SIudtqt/IqcZj2mluIAl/ZJ/Ep6zOHiP9MDRTFjPe7XsqYwDbEJXQd?=
 =?iso-8859-1?Q?OehFJz491BOxIf5swlt0iNGQ4tvLd4w/ihIAM91ntYgbX/iFn+mS7TQFf3?=
 =?iso-8859-1?Q?yQK1k7Ui7/sSStKhFUAAOX5zFLOdjRJZJezq/gXSF4XgXuT6Hp2MSgZTPj?=
 =?iso-8859-1?Q?/qLUf2l64Yk/dwB5d1oXiB0AO1AZ14LnqmsAo9GqPUym4XMxl9cJlsh2tC?=
 =?iso-8859-1?Q?Vr+ZCk/aF2SWuwZc7VZFfT/FR7Tm1a9P0cqJUQKxS0//A8/xbgOTaG7qJl?=
 =?iso-8859-1?Q?l3EP9z7A3n74RwWgM/4PUIOgNqkxoKySj8M6SMgFU1iee5ykmt9BssNajZ?=
 =?iso-8859-1?Q?LDmAP4fh39KjPIDxj9vzLvfafaYclNvBGn4V9CUcKBhomx1FvH+O0rGwFh?=
 =?iso-8859-1?Q?s7mogE9KpS8nIa9crNrjX7asnpNrhikVkZuaPu9G3uUVsaN/NSXiDrz9FD?=
 =?iso-8859-1?Q?F5d09FHOFKK+F13y+3WRZI+3CLnE9F6NwaqhMJfzuMsnr1/5KsdXFm8cK3?=
 =?iso-8859-1?Q?nmc43bvf17gC+gr7MTVzfsChqD2tXJHEz26N/wbobsK1xlgtXki+e+G4fF?=
 =?iso-8859-1?Q?g3AtIVAwJAThFmY6W9yYh4xPvcMpiJHp+CBv/Xc1q6obRKpfVw8jxyHzh1?=
 =?iso-8859-1?Q?SCwvdZbkGSO6Dapuu6QoBxLgKkP1Gpfac80TXFo8NkKRQ4VwgERIGo2558?=
 =?iso-8859-1?Q?cyh9oie2uL+nd7ryM6EZTKuBmqSyC9KhWAvF7ijObW1jTpo1ZECg+73I38?=
 =?iso-8859-1?Q?ZTfJQYAz6hTvsWu5Q2KVrpX0BRw2Yc1zeQ8hxm3gkk+ss7lFOZvXFy3HEW?=
 =?iso-8859-1?Q?nBbikKZgNljJoWRL0GqrZMvhia0buzxmwhcWlbfY+5uiQyDXST2hiqFgnw?=
 =?iso-8859-1?Q?ue7X1KX3tnALr+Gj7Kvw8MiU6duVoc3aVizv8nEdKXSf3uUlrvvtLTRpZL?=
 =?iso-8859-1?Q?Lx9SjK2Gj4WEJCv+gkVfe57/Br7esEgrZLHRysEc8nP5ifEScPnaH6cEA8?=
 =?iso-8859-1?Q?IyI/YgzaxuFGSGt3w5qrJuR9rZpaefAWLZJlk6KvfUQmzpQA4N3QEFu/Oq?=
 =?iso-8859-1?Q?sNvVtFcXUVv6cIOg1fHKrZWS21cFtFUkDEttWay6GNv4TRQTGcvhEDoexS?=
 =?iso-8859-1?Q?sahkowHCiqJPGZpEmVpVWEA2kQMA0Xe3AJ1JlsKLU/hBodejTJ0aW7m51T?=
 =?iso-8859-1?Q?d3caTcUBf2yXsTG/YUN0HxuocoOiNTRgqB9n5B8AGXqDXvpgm4lgKuriN5?=
 =?iso-8859-1?Q?rgs8tg710JE7xeti2IrAMxuAWJ0Vu7qZTUNY+Evj5wcvivFebNREcDg284?=
 =?iso-8859-1?Q?+kqAOu4QCBiMDtAPex6kM6Rs9XfFtDqgY7bMthhbaY3alzj031TcCEaT3O?=
 =?iso-8859-1?Q?aCD4af800nphrBRda90iu4dsjZyjos7+Fbe5EA7K5BRvnVKywZ0pv8vCDB?=
 =?iso-8859-1?Q?6wR1BdsGlEAWae1p3nusDMMZBMocalk06j1aDxGCZRcwL6zFUVG6K4LpVI?=
 =?iso-8859-1?Q?wiZ3E2H7lDPol7YG95moAodrh6cxm5vXnHRSEAKJVgZEY2dI9gst5i2w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f165e6-0890-4e41-3275-08ddd37d01df
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 17:33:21.1837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQRBnUNWtXaRPWEhBlwkcETJto30R3olD9Y09FJ7fm/EiCG+m2KPdt3WNsHYxeAVvL9rIbsrvxTZCHxv4yBN5I2f2wbEzVTpx5cRoVwzWYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9510

MISRA Rule 16.4: Every switch statement shall have a default label.
The default clause must contain either a statement or a comment
prior to its terminating break statement.

However, there is a documented deviation for this rule in Xen:
'docs/misra/deviations.rst':
* - R16.4
  - A switch statement with a single clause and no default label
    may replace an equivalent if statement to improve readability.
  - Tagged as `deliberate` for ECLAIR.

This change removes empty default cases in single-clause switches
to avoid violations of the rule where the `default` clause lacks
a suitable comment or statement.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1965255558
---
 xen/arch/arm/cpuerrata.c | 2 --
 xen/arch/arm/gic.c       | 2 --
 xen/arch/arm/mmu/p2m.c   | 2 --
 xen/arch/arm/time.c      | 2 --
 xen/common/kexec.c       | 2 --
 5 files changed, 10 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 17cf134f1b..4e84bc66fc 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -734,8 +734,6 @@ static int cpu_errata_callback(struct notifier_block *n=
fb,
         ASSERT(system_state !=3D SYS_STATE_boot);
         rc =3D enable_nonboot_cpu_caps(arm_errata);
         break;
-    default:
-        break;
     }
=20
     return notifier_from_errno(rc);
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..4f06ab9f0f 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -435,8 +435,6 @@ static int cpu_gic_callback(struct notifier_block *nfb,
         /* This is reverting the work done in init_maintenance_interrupt *=
/
         release_irq(gic_hw_ops->info->maintenance_irq, NULL);
         break;
-    default:
-        break;
     }
=20
     return NOTIFY_DONE;
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504f..f53b93847a 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1827,8 +1827,6 @@ static int cpu_virt_paging_callback(struct notifier_b=
lock *nfb,
         ASSERT(system_state !=3D SYS_STATE_boot);
         setup_virt_paging_one(NULL);
         break;
-    default:
-        break;
     }
=20
     return NOTIFY_DONE;
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index e74d30d258..0ccfd3b12d 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -381,8 +381,6 @@ static int cpu_time_callback(struct notifier_block *nfb=
,
     case CPU_DYING:
         deinit_timer_interrupt();
         break;
-    default:
-        break;
     }
=20
     return NOTIFY_DONE;
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 84fe8c3597..bb669da833 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -548,8 +548,6 @@ static int cf_check cpu_callback(
          * fail the CPU_UP_PREPARE */
         kexec_init_cpu_notes(cpu);
         break;
-    default:
-        break;
     }
     return NOTIFY_DONE;
 }
--=20
2.43.0

