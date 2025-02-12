Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA724A31FAF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 08:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886147.1295831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti6uL-0008Fu-NI; Wed, 12 Feb 2025 07:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886147.1295831; Wed, 12 Feb 2025 07:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti6uL-0008Do-Jp; Wed, 12 Feb 2025 07:11:41 +0000
Received: by outflank-mailman (input) for mailman id 886147;
 Wed, 12 Feb 2025 07:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=izbI=VD=cyient.com=Suryaprakash.Shukla@srs-se1.protection.inumbo.net>)
 id 1ti6po-0007A2-3U
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 07:07:00 +0000
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060b.outbound.protection.outlook.com
 [2a01:111:f403:200e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edc36c5c-e90f-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 08:06:51 +0100 (CET)
Received: from TY0PR03MB6428.apcprd03.prod.outlook.com (2603:1096:400:1ac::10)
 by SEZPR03MB8486.apcprd03.prod.outlook.com (2603:1096:101:220::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 07:06:42 +0000
Received: from TY0PR03MB6428.apcprd03.prod.outlook.com
 ([fe80::ec07:9ccb:1772:102a]) by TY0PR03MB6428.apcprd03.prod.outlook.com
 ([fe80::ec07:9ccb:1772:102a%4]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 07:06:42 +0000
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
X-Inumbo-ID: edc36c5c-e90f-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIivQKxm55KUSotR4kPOhcPVTm4muLTK6ebjW0Osb1ZlPqHhIjaZmc0LDOO56nm4lz1TVPsEFNXSGBaJzDiK7Ytkj3p5F/p2Wzuwre7FsclaFFTx/KZHuhXL2TkJpnH+Jg3vDAm73w0PQtEYvilf26cvxNnm10VSz0XtZwu0v2n4FigIsLB7tXnQDOkSqHbICUnCmC2M0Q2pcZOFaEz1C72a6w4K39I/o7vEhYHfJmjtwavzukb4qEk7xS84kd/v8kb6lwvyVfqK/DTXsfr5/XEjDBGnGi2TAGoiqsklHBoyg+nVLOG2bq7P9ioVYS1mS0dPHGQ5o3H6jEdISoRKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCE4+/WS/IPjOmONO0UvygehZJuAMOxZ5RIwkdaeYh8=;
 b=i6ZLuFpI+wpIuDCuqFZvY4PIKLwqtAWvv/sU9tS/XT0MH9BYOzIYYhWiOA82k1kxXaMZfLWfe9oOqpqAi24p9NwrtJJFbUJ6udn4JNwa9HYqmII0QpLb+hLM8gFtFxpB6+bAzyXuZf5PYOsDcLv1xRKAcv9pcPr2fu0nL1e/53Tx8445agL/x/aZY/NXRAG7Dy2cJZSZPmdZWQuv5dzutcdVSW9fNZLEsPXnWbM5A7UaywSX6pEsquDc5xPQXtWqMM37rC/8Q3loHKNBDczp2eTQ7cgBORh1RbFrvdo/+CZd0tOby4vI7qO/frFcC8PKFQBB5fkbMCVgB573DNnHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cyient.com; dmarc=pass action=none header.from=cyient.com;
 dkim=pass header.d=cyient.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyient.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCE4+/WS/IPjOmONO0UvygehZJuAMOxZ5RIwkdaeYh8=;
 b=dYNIQwYrB+jlW8Q647UgPGCS7CtM482arjWGH2TXYFD0zKxVX5zMYvRQWO1gffgUFnAIEkHgKNsWWnvgS/fWdF6o5prOIWTKKxCr3sUhFP8oPkiLUuQnvE4CoUMjEyAMg89pGlzn052D2tuZ37xGDkcC/z6d6vNcmkb/tqDJkeqzGYu+3IyAFgCW2jYg53bFcmHuQUkVWVENrLhRmTqSqxA51KudRtxPAqAZbGRQrvgK8FaTMtM2RelyndB/kXZ8QRTcFH2yRD3iA8+xkytN9uPmzZHEqc6bL/qxUNGuemdHms1QClzrJJjxpfwG/L2rzJQJiRSGHPt6agrnMrBwlg==
From: Surya prakash Shukla <Suryaprakash.Shukla@cyient.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Collaboration on Android Trout Development with Xen Hypervisor
Thread-Topic: Collaboration on Android Trout Development with Xen Hypervisor
Thread-Index: AQHbfRx77LX00vjSEEe5N3vp1E6OQA==
Date: Wed, 12 Feb 2025 07:06:42 +0000
Message-ID:
 <TY0PR03MB6428732CFA2292AE5411838481FC2@TY0PR03MB6428.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0cb49050-d2ca-4b82-83d8-3fed8b20fa0b_Enabled=True;MSIP_Label_0cb49050-d2ca-4b82-83d8-3fed8b20fa0b_SiteId=2d6b0cf3-57fa-4619-abf9-d13e1ef2352a;MSIP_Label_0cb49050-d2ca-4b82-83d8-3fed8b20fa0b_SetDate=2025-02-12T07:06:42.023Z;MSIP_Label_0cb49050-d2ca-4b82-83d8-3fed8b20fa0b_Name=Public
 Unrestricted;MSIP_Label_0cb49050-d2ca-4b82-83d8-3fed8b20fa0b_ContentBits=0;MSIP_Label_0cb49050-d2ca-4b82-83d8-3fed8b20fa0b_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cyient.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6428:EE_|SEZPR03MB8486:EE_
x-ms-office365-filtering-correlation-id: 748a91f8-a9a8-40c7-774b-08dd4b33cd8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d04RpFBzrJiSX5v2XmS4C8ZB/ePldnUslygxOh6vofKuEhD+k73w9jFBi2?=
 =?iso-8859-1?Q?wbYd52z7a3V7Xx24XH0Gb1RKB6xnRlrFbyt6yS+/uWYn2k/17NPsslsS7z?=
 =?iso-8859-1?Q?DvaLZkallg0Wz9XCldwHOmToYsnmh007dmNzd5d0lbaKglIYidlB1AbBPj?=
 =?iso-8859-1?Q?lYRCKfyfDx069IQ8pMeo3x0kjCtpnRbcqZhVMzOWjKj1iBNgOQ5enrzLOF?=
 =?iso-8859-1?Q?Hw8jlYfzTK8qa7+angim+BArk0RYmYIRo05kqRuJYotzJPgtyHngpBgPdE?=
 =?iso-8859-1?Q?e+zJsS/MZQngRpqfuLwm9K+C7FSYbv7WqsVFx8dvAlRKKj4WAG11vyVs7L?=
 =?iso-8859-1?Q?yoO06OQYKyoMa/RMkzVxg7uKiT0Oouj+Ld0lpCvIIG65eoxLNtJLNkx5Iw?=
 =?iso-8859-1?Q?J/Fr+lBka8+LxbeNs2+F4UITrnxqMn2PP0R4VJugHpteJPdpW+mmOQ2EmI?=
 =?iso-8859-1?Q?zItJ4BAyloomwWHCiyU4iucVs2M9+b3uE+kt1w5qMQZZzLWbPZKp+CzxyN?=
 =?iso-8859-1?Q?Zc09pOhJmNJjLYFKVJ8B8fbvHGbgM0wUr9cWGG7etBeO9+YNjq0irfom7t?=
 =?iso-8859-1?Q?JylNnSmt4sh6MlNn9dZOXlRYPwMbTQ0F9Ws8dtjOnE1h2iU0wqsdchlqvG?=
 =?iso-8859-1?Q?iJcwS+QlOkXJNjnop7xfRQ+Nbi94CAxmc1zgfBSjq7A9vcKdkWRz6qMJrU?=
 =?iso-8859-1?Q?dTr96l6UvCimn2iNJ+SMFZBJ5MTaXmex39Co7YqpyXHw0cTaRkoBNQBJGF?=
 =?iso-8859-1?Q?hlPfped/bIGV+tbQ+/XTK7DtZ5r+4818NsJ4uEtyU19n1uOz5oX8u6to4s?=
 =?iso-8859-1?Q?qP1GaoBbYFW9i8nVroNGaUc951aEHVPEip5XHOpwEkcP9pSkPFpx1cCvmh?=
 =?iso-8859-1?Q?s2Liht+jUYKCPfGzcMcTSwThagbTz20DCLmhEvlDPQeojjH3BqXlNZT5L2?=
 =?iso-8859-1?Q?hsH8uRBoYTyJCXVkMMCszdABjSeHwsRSuq1yz9YuTwSjMEU4oUOMQ4N8MZ?=
 =?iso-8859-1?Q?UULQZsnU6DtMilvZztNh3lcf86lfiVNUkV8iMFWisSJY9KEjAurmwpGKGW?=
 =?iso-8859-1?Q?6/MDBdqeabGo7bH8WTMQZtiTRfMwekf+wJ3KbK79fk/YIrCSUNJhpbNecQ?=
 =?iso-8859-1?Q?RerCuKHd2qsy3q+zJPYY0m6zqLGL1h0rOjwOU+hp0NMnI/qMTVim3rK5j/?=
 =?iso-8859-1?Q?wUlpY3wDZ6QwOjIOSHHyOPvXut/ilH0r2N/AQF02cUBj5JvEVwz7IrG/mF?=
 =?iso-8859-1?Q?cxJg15AXRrNiM/UQiXwlcg9hOzAB4iVtE//A7ot//Ku794L++n5HcyRoUl?=
 =?iso-8859-1?Q?RGqnRvj6cMOu7CgQarkTxP69UQ41gh1AScDHSIDOF/tnwqDhRKv9eCs3uh?=
 =?iso-8859-1?Q?lIPt9zGA+Gpp0iJSJguuAe6xw4FE23xn/6IskroQSBAfyg6L3gFS9ARn40?=
 =?iso-8859-1?Q?geDnQ5XmvPz1Q9pv2Z1p1EP07FFYdAuu9/LaR01UepPSNaOvWVhvPYpmSk?=
 =?iso-8859-1?Q?xdT+sRozpOwKw/ZPMTCYhO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6428.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c0yFaaDUMptsTpSdWcXBBceytfPERz3OAR3znK1fJHyMSYD8XiaS4ja3Bf?=
 =?iso-8859-1?Q?ST/S2nb7J/uvbRFnwd9BUleGpgb5EEN4f08UmvEGx5r9IWGylowb9k/qRN?=
 =?iso-8859-1?Q?Qg2HQBZmTqCvtb1HU2onCfP4ZWfj6OMS0eSS9Lx9eXkV4c3FOKrI+SGUu+?=
 =?iso-8859-1?Q?JE5No5n/To2Vyl+qE0wQ3rAP/fiFk5lvsqYzLkSx3GPZ8VNXva3flGB0HO?=
 =?iso-8859-1?Q?gt0pFT1j7jw+ZMI01tfeP1oXAUFaJvLwrxBGOjaoNsLHLnD/0ezYM2D428?=
 =?iso-8859-1?Q?4XyKj72F+Aj6ZuqcfDnGe/y0AMmQ1IE+GUoWzOVbwlbC8jKbXOeJvlOulu?=
 =?iso-8859-1?Q?R1p0Vm0TUa2Hy4A8ZmSFdHIb7k1bF5X54i39YLTec4EpmIYF0+8CzyEcUr?=
 =?iso-8859-1?Q?QquNateJERv3ivl40rHnr3anGAx19HSYkHc6vZTGHcBhkyUso1nbQvmHOK?=
 =?iso-8859-1?Q?CkV+5hFr1T/bBFMoeJqgC+nRuQhpCvNI0hC3WVJtXzuHNGHI5TRthlTW7h?=
 =?iso-8859-1?Q?pIDRsIfgYBcvn22eEdsAOFUKw5lSzR6wNOfaXeRLxmpTXJzVvq1EPY8ecN?=
 =?iso-8859-1?Q?ddFNrJ5CmMhhYlfjvOqc5/y5+mRlqfHkCVTU3DiSegat2xLGc1yxWHb0v6?=
 =?iso-8859-1?Q?adR9FYL/mlI0dXEYsmbknlC+4VBhcfVbx43cm8jC8Wuam/XAdBfXiCNfbv?=
 =?iso-8859-1?Q?1b29cVXIaCWg/ZAF12K6ii7qtY+vHT8E6ai2QU9Zx2+vMgFvqmtvTWsxuO?=
 =?iso-8859-1?Q?ZQJdXkV1QhWNlhuacIGwDDqvjlQg24ejnYsfM9HgBDGyNfmwirYyJA4AVM?=
 =?iso-8859-1?Q?NEc9Q/FGs0MhNsOWAe2xSENAB7Yp8dVhjl7YITpW0ogYSeEfHzXrUlvTvv?=
 =?iso-8859-1?Q?V45qK3DhKkCmdoeOReKDCYDVtnCFq41D4m4DanS3kVkNul8AO0n0bEQKuf?=
 =?iso-8859-1?Q?x8o5T3En81kjogAX+SbdlGoLXYhYL4mgCx4Q1+K/KAlk33otOnWClQ+9IJ?=
 =?iso-8859-1?Q?WIFt3TA1XtaqW6H+1RkqxR4SUS24G3TF056UvCJ7D64sDen0MRdwxiFZsK?=
 =?iso-8859-1?Q?CdPgHoXKrP6559VmELoGo+ZPfEW/dlb4oXQPVoNGnYbM8GFF/wxgpyg1fc?=
 =?iso-8859-1?Q?HMHWpnux4zbp8JSrHCelIE/N7UtzV9zTuTRJtH2O2jy9QCGKGWZzOIqwm6?=
 =?iso-8859-1?Q?roq5iK8Bm/xl4jR20dMWoj+hr7/id++rx923I5F63eB9tBJVlfw/pncTd/?=
 =?iso-8859-1?Q?hVScPFrgTPZpLiFmCOmTB/K8m4tKayPFhf9XDpPiyCxf7JOjvQ7LbJW2BG?=
 =?iso-8859-1?Q?mNXjyIm/Mt+c0JXw6R6tRhAxp2engxQZzYpP56DG2O7wEo9feS3Kh9QKbx?=
 =?iso-8859-1?Q?jYs1/Oc91UguC6V+znSutchFktJKrj+1qjip2kbMy26awJHZMukO6HdTac?=
 =?iso-8859-1?Q?7fisEF2osiMdO9pu4OS46Ayc5rCw5d0cMyAfFfSWPWt75cdvxoSbU/WHZ7?=
 =?iso-8859-1?Q?2e8DTnDeZroeNb3y4ABZs8fTfNfmQxOhln+qU1FqUT29jcLWb0Oz3lq3oQ?=
 =?iso-8859-1?Q?B9OUa+Xjetg+2egbDDPP3r1zCkzewaPc1+M8KPKZjoBEUG1VKhqCukn+tM?=
 =?iso-8859-1?Q?lYW04z1EO4aWR7MrTM79w2spgMlO8AHXHPkzW0/4/IQpW9LBWadtDcGQYn?=
 =?iso-8859-1?Q?hl4h98CTuPUPZpEt3CITudKAFWtoTvqAvtZPoTcK+w9NNGIca0SFjdvc/W?=
 =?iso-8859-1?Q?GpFA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_TY0PR03MB6428732CFA2292AE5411838481FC2TY0PR03MB6428apcp_"
MIME-Version: 1.0
X-OriginatorOrg: cyient.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6428.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748a91f8-a9a8-40c7-774b-08dd4b33cd8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 07:06:42.0306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2d6b0cf3-57fa-4619-abf9-d13e1ef2352a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VtUMSDWlkvAuR+u9469VubRsOWYpTvtYgFfNVBetKHJF1VKTOkv5eA4uiafnjQVaVnzhWVnASLM7Bvmg5gzvpvIKIs+pOKaLcz3pqkCL6ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8486

--_000_TY0PR03MB6428732CFA2292AE5411838481FC2TY0PR03MB6428apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I hope this email finds you well.

My name is Surya Prakash Shukla, and I am currently working on a project in=
volving the development of Android Trout on the Xen Hypervisor. I have been=
 exploring various aspects of virtualization and have found the Xen Project=
 to be an invaluable resource in my endeavors.

Given the complexity and potential of this project, I am seeking guidance a=
nd collaboration opportunities with the Xen Project community. Specifically=
, I am interested in understanding the best practices for integrating Andro=
id Trout with the Xen Hypervisor, as well as any existing tools, documentat=
ion, or support channels that could assist in this process.


Best regards,
Surya Prakash Shukla


--_000_TY0PR03MB6428732CFA2292AE5411838481FC2TY0PR03MB6428apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
I hope this email finds you well.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;"=
>
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
My name is Surya Prakash Shukla, and I am currently working on a project in=
volving the development of Android Trout on the Xen Hypervisor. I have been=
 exploring various aspects of virtualization and have found the Xen Project=
 to be an invaluable resource&nbsp;in
 my endeavors.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;"=
>
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;"=
>
Given the complexity and potential of this project, I am seeking guidance a=
nd collaboration opportunities with the Xen Project community. Specifically=
, I am interested in understanding the best practices for integrating Andro=
id Trout with the Xen Hypervisor,
 as well as any existing tools, documentation, or support channels that cou=
ld assist in this process.</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;"=
>
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;"=
>
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Best regards,</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;"=
>
Surya Prakash Shukla</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_TY0PR03MB6428732CFA2292AE5411838481FC2TY0PR03MB6428apcp_--

