Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CA4A4189B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894976.1303582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbc-0003rF-Na; Mon, 24 Feb 2025 09:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894976.1303582; Mon, 24 Feb 2025 09:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbc-0003pl-Jg; Mon, 24 Feb 2025 09:18:28 +0000
Received: by outflank-mailman (input) for mailman id 894976;
 Mon, 24 Feb 2025 09:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbb-0003pb-KB
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f403:2612::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d565f4b-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:26 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:23 +0000
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
X-Inumbo-ID: 4d565f4b-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSW2mV/Xw4cMp/P8JHAp1rl4y5WTotwRZpnjIrAXW/pJLPMIJandLGrbd7kXBTneRV/v5TnRcP0uB+aDtHFzmXXfjYf4gC5wqJPOsIMCHP8emDtDFqpewI4DTI+/LG+s1WXxDIN+PWnJ2FNb1O8LAZQrmVuRRS2K2CGYjyzJzbyATMXbWclhmwznNRIoKX10mXnckPhUg/5JCvmXQc5Ks1cSvDCRlU99RA36PXSiJGTOK4bt6ybk0snahN2v+vNrFcU6l3GoRXZUlOAHdslHlRPWkljzQaSdPKeBuPWy/iSJOVC7ouK0QqESX63R/GzOn2rxrM/FkPmOyz2wRaO+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG/AzRlNEE5meDJALtWRpixPxZ61I2XWF7TZt1xcgpY=;
 b=MZ25m5mrdw4iYWoTI63xt6v4WEmXOwtJY/IztucN5io5cRHWYHHxIaH8UF2WLV+iHi/zEtcna7BtmQ8LQN0yQrHiOOuJgpwy883SyWs40rHlujN2gm8sF7bY9DHqiFarnydr+84D1+uu+dANGhMz69DnWQAfDCEUwxvG/Mglg3n6OZUD4ipC8J9SxRhVf9DZq6fZfErG/U/rwjwSGMEJ3uwNM288A2qkRpOkPC6iHRNATkqYiJxjRzxqyAfSFgsU6h0FeOB3SY4RCovHdE+DxE51uC3rICh01iwy99U/x34sMXkIgqYDJyZUpbH9qxJZRCF/kVFZbIVnj7GQkWHIBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG/AzRlNEE5meDJALtWRpixPxZ61I2XWF7TZt1xcgpY=;
 b=WwfM0hFr9hAHZq1nI4yL5Oe2L61Q+oMF9zQwpsZUGLlJgiuQaSjBF8HcC2Zq+0r5JqvjArwiwtn/DF3QfGSltkCbJe4oE2MtZt/PmdsTnD11j61cXdS9ETMA1xWBTBjOTloL/YnLI7wwCVORWoMEx3if3UsnFCHUvcBZJFWF4wnzvP25vfDz4kL6LBtB+SITzUKGCuB/PqbxSkePU++R7oS9Gej6JeJD+5CJIMdstRcVSz69Dh/qYPKYpmxKqTdtwwItwHbH9UwD7TMaImuFFWy4gTog5RCx2vgiF4C7IFc+kbnnDvspaEkLp/nkmYjMOQA2C7fZPIouKaOf7t532g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/7] Add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH 0/7] Add support for R-Car Gen4 PCI host controller
Thread-Index: AQHbhp0NQBdW76R7SUWOEr9t9KgJjA==
Date: Mon, 24 Feb 2025 09:18:23 +0000
Message-ID: <cover.1740382735.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8859:EE_
x-ms-office365-filtering-correlation-id: 65185172-698d-445b-10e5-08dd54b43041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ScaTRPMurRL/whvHr/jxJ6pdxw4weJnsBImDrlXvM+38iiGVESEqHgXKhB?=
 =?iso-8859-1?Q?HKKpp4lZs+qfwBbmFeouWBtBxw7I59YgG4qW9CRD1DHpkXSRvFTPGtfL8G?=
 =?iso-8859-1?Q?wVM2mSjeA9TnG6h7+alfuWdRop0dlxF6OOJuHeNSpmGWNLsL17R97jPGYD?=
 =?iso-8859-1?Q?E1Kkt1kAgC26rtTULurfFNklP+zKhCjAd7GWhzq2905yMHU8MVCsflI1jE?=
 =?iso-8859-1?Q?EEh+qYfn1ugBdiAx3RBmODCBxl78EM8LqM2NXq7paGqmy9LRPvgEF8OqJT?=
 =?iso-8859-1?Q?A0V031oseFM/TDepDuVWksKngUno6yCa2h24R0IlFawNcgJrzli2Xd+bkg?=
 =?iso-8859-1?Q?nlOT+jMsOaHwKr8+JIY7G1i8CfmZ1fm+F9F1js/QFV/HnXv5pfgHWzfA0/?=
 =?iso-8859-1?Q?n7Fj00ihQQX0Hqec5cKAeHvj80pjcKCMx5FEiP4sRTXb3qZH/2MXbLBhOy?=
 =?iso-8859-1?Q?i/Cso0ZmA0ImtSYLOwFWyvP247NLO6aR4U+VkoJz9kRDIYpcIP77V2W6wk?=
 =?iso-8859-1?Q?lHTC0ixZqK1Qz/dnpArp/fEmRW6GDym1WthUnNXoMoljdyKFaeWImGVLbR?=
 =?iso-8859-1?Q?mGl9eTxRcgageTfqZ9AKOmuSmP8IGEoFEU2CorznPYvjQGJMbuhB3AEjJH?=
 =?iso-8859-1?Q?JFUVwmV5Q4zSFI2dzvMaQr45PuV9cKJVU4jmy6fB3ou9wuRTUg2UR9oTUz?=
 =?iso-8859-1?Q?g/vH1scWalXcHSeTPQMIxwnKmiCh9ygqPiSfyNuRqwV3PZPYXhsejJgz6c?=
 =?iso-8859-1?Q?mso8nFd1o6wyTHcN8gXXMCpCjIkkfWMmiVZ2Vtv12zqtaFenRe69FjQWb3?=
 =?iso-8859-1?Q?CDdnliA+8xyNr9Meb800qqgbMBBej5o97hPjbG9hMVui+cw0cB7YbciQgu?=
 =?iso-8859-1?Q?liYbpLUnQjvcjLBj25p7vY+1k82h8lPhhILhk5FijPFb6tDSXt+vthq8Yy?=
 =?iso-8859-1?Q?2eUuJ6+NrtAdvuJmxY/d0fB+z/LF2Bq9EI26AuKNPqTB24Wx7XpXhJVIEK?=
 =?iso-8859-1?Q?8F67LlZilHPNBQugtHTOYzkB8ZkELqQN92V/Yyju1bpQS+GeD+acd3D7hm?=
 =?iso-8859-1?Q?JVKX4afm8eE4sr/NijyNg0evfKDSz2f7RfJU2rJRspAoqKZL9E8otyZtJy?=
 =?iso-8859-1?Q?5dn/5qov6saMjB6YOGOw2KmxxVJ4xWmcg+CyBaxIstqnaCbXYIDXmTyPlt?=
 =?iso-8859-1?Q?xLdPgMzrhOz39CF7iQZupko6veU8iVzlV8yRJp+492rmKQzxc85XPnjRJv?=
 =?iso-8859-1?Q?Aveg+CMW3qVUQpiIXD7tVnW9QcE37qwUyIY9teGipIAqMydzLj0f6DR+XB?=
 =?iso-8859-1?Q?fGBu96U1hIEEgjdsUQjD2IMjacGsOz6SgrYVSqAXCW0UbK3tU5XQK7yDEJ?=
 =?iso-8859-1?Q?ErGvtIjeAG1ripRS/j7VNpsoUp/H58VfuNCW5KexcqcIyLOBo5OQcOtQ6k?=
 =?iso-8859-1?Q?dSlXrg79RxurZ1vaefSiv+7dAGV6ePygsL5tqTTS9qmNZCj1NLM/+4icue?=
 =?iso-8859-1?Q?ZC2OJ+VBgzlNJpI5elvBVr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nN+J8fWY/T6tJ2ptja5ThMKjhy3MNGu8RJ3e2nnaNswyHhUm8ojXKxv01M?=
 =?iso-8859-1?Q?Fc2jfPjFPeBG4Bp19r/oC0xCDZS3TVNbKxD7H//tbuknF7y/Ml3Up5UsWS?=
 =?iso-8859-1?Q?bwh3DHrH+vfaUUhDan/4o4U274R1uB8Ctfhf52GJsng+b8x03xn8OB9x4W?=
 =?iso-8859-1?Q?1VSF/lL9cSSBdLGF1H8q2tiMKiFqo50ipG/4p3eJAeRJizYQKlN9pT0jNL?=
 =?iso-8859-1?Q?veitML8KHT0SLYdPuBKznQbaQ4rFObt1X8xsKiAD2p4/NPC97u2FzTGgKV?=
 =?iso-8859-1?Q?Z46yD/jxGjPoMRRyspuL++uqqhjrWLT+BhFLTUyNEOWdkBTiBpnHD+T2Fj?=
 =?iso-8859-1?Q?/eyUSXZC0EOIUrqxahBU/NKoUmLX8/VebH/1xWUAIGwKPSJlqhW0vlwDXB?=
 =?iso-8859-1?Q?Jm7mOaoiKIy1/uVXOiyySiORIwLDGgFnOo64jxjmMYCv+zEl2pzleevXPr?=
 =?iso-8859-1?Q?rXX9BiP01uO68xbDCFpYDEGWWxgfjUmclpladfPwEng04Llp9fpX8M1mpN?=
 =?iso-8859-1?Q?ztTUdN9gZPgDjfhxbsnav4rS/gEZr5VSPnrM7iUZ7DNas/0G5ZkYKpROc3?=
 =?iso-8859-1?Q?VTTaXaA0E1ZaOySpuDLxfgzW6qvVFuni+w0snh0qaNRPPx2fyH1qZEWrP4?=
 =?iso-8859-1?Q?Jh1h/iV26WqEZcheRb4uGyasDag2iqn4aSgYxtHZrwBHYlnvLn83eL+lAp?=
 =?iso-8859-1?Q?myV/AKmKOZtRaXTUmAtozCZZB1JfuTByaQENfEunCxgHQIPAjoV3B+PTbL?=
 =?iso-8859-1?Q?69PvxEVxVEYeRyj7xJU/LYIB11gcm5N2hj/LeHhArVCCb7oaYXKyai/2s0?=
 =?iso-8859-1?Q?BKuIeEvfRF8QCi8eEkSGlAPUsLMpQdmZxTGe8u9zE6kFk6t7PRRehehxec?=
 =?iso-8859-1?Q?93OakXI8NAfaCx4HJWitxKdAzevsmJ8nwByQrht4m/ZfXWf/li1KHOpKL6?=
 =?iso-8859-1?Q?mTfZ0V5sf3Kdw4mRGdNt2PHvNwzpU1sIMcwUPAvTcU6gsIL432NrRzg4Aq?=
 =?iso-8859-1?Q?jOiFsNrA0dqXpZ/hHjQO06COIdKaBqVQmVRjEiwP40ELSVpgYhZd4Mr73l?=
 =?iso-8859-1?Q?IhiTTt8EY1L6HfP+BsPeF+TR7xzjN12TWMdT8OdFhU+TuR2YF1wXDAa+g2?=
 =?iso-8859-1?Q?/EBXCJivwCAbhibI/pmWqPtBxlix7H9iiyccyg6PjJgylm51T2AzhR4Lux?=
 =?iso-8859-1?Q?SCJJNAZAMjMGaBBBlLgvjKxBceIO9J6qYu86YAhdBxzkES1h95z2kXTf4g?=
 =?iso-8859-1?Q?6cRs9lBlxqEHtmDCvlEtGFE68d7f8J/Gk0YHFMAFyzaGYy4hRvFMUBqsrf?=
 =?iso-8859-1?Q?rcfKKkyRDdYL+n0Ere1JQFYZ9N7f5TO3E2gZ22RZl97cig7zmbe62/+EF5?=
 =?iso-8859-1?Q?BVU/Qls/h/GmVFsMKbjaV7mEaOXhTIOIgnIzRfDiIX+9m4b7EANkXt9hx1?=
 =?iso-8859-1?Q?nBa+thj31vbbVzVoVrwiGiXW0AfXG2Zdv63e5bIvGXHZSnUt9OAP77fE/p?=
 =?iso-8859-1?Q?aTDoiSXdkKvYMJMBaHvYGE3zlEwzGvD4aKWRqYafKDs3Bc2eCWixAXqHjP?=
 =?iso-8859-1?Q?Sty2O/64KPTI/0Z/R6DdBl2af/x6T1JL3+NvbnGvom3E7n1M/rugundCNq?=
 =?iso-8859-1?Q?6o3VFpEqut4AdM52SiviaEnNb88N4hsiDDSjNqB3/P3UCevoNK1aEltw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65185172-698d-445b-10e5-08dd54b43041
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:23.6630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fesgdNgEynk3wkRiphkU9ndI07Ovn5nKLuMHBGygPBkRexNpGGsIMdBYVhvllIKMwxeoXTP6Kh7TfN+5S+H6MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

This series adds support for R-Car Gen4 PCI host controller.

To fully support the controller, the following changes were made:
- Generic mechanism to support PCI child buses is added.
- Private data for PCI host bridge and means to access it are added.

The series also includes a workaround for proper ATU propramming and
optimizations to lessen the performance impact of that workaround.

The series was tested both as a part of the pci-passthrough patches[1] and
standalone on S4 and V4H boards.

[1] https://github.com/Deedone/xen/tree/pci_passthrough_wip

Oleksandr Andrushchenko (4):
  xen/arm: allow PCI host bridge to have private data
  xen/arm: make pci_host_common_probe return the bridge
  xen/arm: add support for PCI child bus
  xen/arm: add support for R-Car Gen4 PCI host controller

Volodymyr Babchuk (3):
  xen/arm: rcar4: add delay after programming ATU
  xen/arm: rcar4: add simple optimization to avoid ATU reprogramming
  xen/arm: rcar4: program ATU to accesses to all functions

 xen/arch/arm/include/asm/pci.h      |  16 +-
 xen/arch/arm/pci/Makefile           |   1 +
 xen/arch/arm/pci/ecam.c             |  17 +-
 xen/arch/arm/pci/pci-access.c       |  37 +-
 xen/arch/arm/pci/pci-host-common.c  | 106 +++++-
 xen/arch/arm/pci/pci-host-generic.c |   2 +-
 xen/arch/arm/pci/pci-host-rcar4.c   | 542 ++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-zynqmp.c  |   2 +-
 xen/arch/arm/vpci.c                 |  91 ++++-
 9 files changed, 764 insertions(+), 50 deletions(-)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c

--=20
2.34.1

