Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D8A87C5A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 11:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949486.1346018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GTK-0006U8-V5; Mon, 14 Apr 2025 09:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949486.1346018; Mon, 14 Apr 2025 09:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GTK-0006P1-RT; Mon, 14 Apr 2025 09:51:22 +0000
Received: by outflank-mailman (input) for mailman id 949486;
 Mon, 14 Apr 2025 09:51:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHXw=XA=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u4GTJ-0006C8-Kc
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 09:51:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061a.outbound.protection.outlook.com
 [2a01:111:f403:260e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04410c13-1916-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 11:51:20 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB6872.eurprd03.prod.outlook.com
 (2603:10a6:20b:294::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 09:51:16 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 09:51:16 +0000
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
X-Inumbo-ID: 04410c13-1916-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFQ5dgZrv0fkg1sFb4wfi/0HGvOyl9P5UkdgddWG4iQlO2ULIOTwKnP1h+2RpoI5SmQF11F/xpUw/6ep8LywMzzYyIpaTvEweNf1iV7+ArYsewkEHayKX01F3uLgMtPvc6DOvHXNvCZvolNEfaHNmPhZm7TLuKRtY1S6VDLhSQaBFWSS6SYAgpdDiU54E3D77gn6PCA3OlXWpj35RfaKWQMxyy/f5N6/Suz+PfOfM47NRrGXsqRDzPiRCv89yoB3hCOc8/+j3HTYT1zIVDuVDS4U5Aihu7bvoSDZ+NhwZ/DzOi0MrsOEYvBIqH9rfYxMzfM3OOLusQnXzHG32ZgbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCUrpCPZhHZRdV45SQAWMseE8AkytIb8kJ3NzO6GCss=;
 b=VlvEjAmwuwxM1DE6D1XxCSusxMZkHGkqOm7oRzD8x0L3yzz2xLuvSa+0GXSmkmAQaBMG8ESLbrY2/vh0lLgOFcim3GPMJIHPRps3xH4ngWeqgfgWwW6nf4kZdC+WQ8J10mmAprmw6xcGoxlCrjO0NuIBiPRTx3rpzG9/5iZdYtf9+D11WbrXX1xTPWruh/TzbwnDHGpi/SBR34cfmrnROo3qU2jHQWLmk2gYjiNLgnuZX77/Zi1P7fTp9dWAPFZlFo7AyDl4MtLR+oE/JOLrvh+EWlvlV9G+ySu/qqY1TI4g4CQs1BzFxWbhsy3zKeurEi3KGGw15+lX5m5kU3PAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCUrpCPZhHZRdV45SQAWMseE8AkytIb8kJ3NzO6GCss=;
 b=nUoWioedMYBYmsLu7u24mjZXYi8H7QZgsIMEIbUAbyCVG+Cp1efyMd6/in3XtkCgCzOY66XSa+Wr4F8DMX22RSWIsugk4+YixCU4yn8M0B3tHS8eBnhmMIb1loeT17t+T9JHgSZd0OYLMMIIufon3wvvNRZsnYVlnNPITgG2Ax1fqYc2Y3UqLqHA7mh6iPUZyrQ2Ouh/iri0BBuH272kkNfUPzf9dR8qaCkuHkxhKvCxHGXpMk+FB3ugrBV2Eo+4SGP5kERzZynXk6vN6HPLbQUhceDUQCzZxLMYl6lGfiSS/mI/x1rvrBmNcZzesAXmvIXJ0traow1ZAkoGVKMZBw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v2 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Topic: [PATCH v2 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Index: AQHbrSLDkG1zT9bAeU6MKrLu8tJrtQ==
Date: Mon, 14 Apr 2025 09:51:16 +0000
Message-ID:
 <e9e7d722eeac100048ddd5a4032e3d7af39f8c3f.1744621166.git.mykyta_poturai@epam.com>
References: <cover.1744621166.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1744621166.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB6872:EE_
x-ms-office365-filtering-correlation-id: 00afb2a2-3706-48c0-36be-08dd7b39e640
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HatIaZQtJ7x7qAQ9R/od3DDTYomVlrt9+1mhL5nf4KJnFZDMkuYjZ961L6?=
 =?iso-8859-1?Q?lhU2B6s3FIsA51eM/i44PkauREwOlAXBw1mz00DtsaEfioMCRThJ+nPnY6?=
 =?iso-8859-1?Q?+QR9OIgb0F7AZ7Jgkx1lBike9GO/udJSAIfkSiuwebsb9rCTVX2RWOpmH8?=
 =?iso-8859-1?Q?OfYA4B1bwXWNQffsmnVZKJV15CCsbeVjKlfph9bUJ41X5ec5rdkzL8olZJ?=
 =?iso-8859-1?Q?zM/ymuiWZFTRlL7n4HP3V6/AZ71nWBnObdqLRydPvxXr7QZOZ/GYwjd1Tr?=
 =?iso-8859-1?Q?8/Gw/j0Cihdpus1EIS3Mp0dVBs8EqhD36w4YCkoeOA/t16YdbpGSOduBOs?=
 =?iso-8859-1?Q?QhqWsoLk1Y5Rpxts6U0YhiyWRvCY0aHCSiPuYnc1Hfix5v2bygHFC9mlCh?=
 =?iso-8859-1?Q?uCjVLVMokuWGZeiO0Ejc+sCYRqb6vqOsQep/vx7OedNWQS1rxGmWKB5Zhz?=
 =?iso-8859-1?Q?2nUk7PfzWFDBwF/gkhXzee0TVlIKm6zOetdM/M/ib6XSIA0GhvGSkF47iX?=
 =?iso-8859-1?Q?7szJwUadYjohEbtqQuDOpetZNjPLRrzytLIkeVJe3tgH1uuub4WYNQXyW/?=
 =?iso-8859-1?Q?gPl/nzFQLyk5yto0FSJk/UvXsnxRa29kW+MtuRNg72jpvDgKZZPO4qAKKo?=
 =?iso-8859-1?Q?eTSK+gl+ee32v5eTEnIMtUtSMxpHEk561o3VadjJyPTOcwQOLKYgobUHVd?=
 =?iso-8859-1?Q?9SA9COTzHpdLD2IpN4Qvp4v1MWBAqHWpBBIvyDppIm0WLx29H+lEKSaHgu?=
 =?iso-8859-1?Q?P5UH7bHbCQwIqiPahUQ2PK+ZEyXCdb/wb5MuwvFrBlkdBurHsy4sl4eeAF?=
 =?iso-8859-1?Q?MWGEVR0yqr3RaFZZOqcS2GeL/F5DKPhgLav2LaKJSTE2Txc9YyoQifYLGo?=
 =?iso-8859-1?Q?ULGBny9HpOFKtH4KVebXYAJK86JU4GHueD9EGpferWJWSoQYhdkQJaCF0L?=
 =?iso-8859-1?Q?nifMfc/mxuN3M/7YBqOaVRBfyuNJurWxo3rHhW/wmN/sZ4jJ7/gTyrW3Ix?=
 =?iso-8859-1?Q?9HjJ3t/GVa+qdi0Z/98NrV5RhCmaZ+c7OTxTNwA5m3QT14T98gzjAw/em7?=
 =?iso-8859-1?Q?/IQ67RqYr8aOj8gb6XzPPtILy7ogLFrL7LCfCJmKhEVdCFpWcCh8j7NVVd?=
 =?iso-8859-1?Q?ctwyaZEPb85LdTrS38ph8cnz+GoNQBtgku7AuFdYhz4EDwS/ku/8IzR3eX?=
 =?iso-8859-1?Q?yQKQ1zdcY4dVlHt8UViSgUVAEn1MjAXvxukRLVmFiaOgyMDCBIWZjWv7BX?=
 =?iso-8859-1?Q?uLSSyx1u/x/AzeCgHsMamvdH7cDo4VlSHXmbiH+c9jp5qIIKulTN2O2Gzz?=
 =?iso-8859-1?Q?ZKKICyntRZdJD9FSPrb3TsItts+4HwVANfZxI5c3CDxmDH4shGaGmNyG7z?=
 =?iso-8859-1?Q?SWPXGL+yh6y3gsXgNisilYlwXYu1vxboef/J3+9xhzRXjwAE0S5tyj1LvB?=
 =?iso-8859-1?Q?DDtuIevO8pDpxfPkaNQd60R3UVE6lcP3+XZR8PS4QU3TbSkylQsJVOdtsH?=
 =?iso-8859-1?Q?d2DHmvoltztxh0LKCWaPLJvu1bdrEb5gG+PxhsaSLlsw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gZD94UDwIR0+ybymvK9cOSBnivzBqiLEtUHrYAryWeFiUQNcWZ5CbG8cGB?=
 =?iso-8859-1?Q?WgiRGJKvx1ZENprZTbx8icSOZZ+H0ILmxKnawhGugdHAUArP42/sxadQOl?=
 =?iso-8859-1?Q?LMu6aOodWiNo0asE9Qeyr0woq9Upsz8kzZpMCo5ZGvZUc1aJru4X1R7UoW?=
 =?iso-8859-1?Q?ehzbJuP6KWTEY10n770IoYHJ/uYIMRYRXPV4XS9BZx+SQN/Vc31JG7ccOK?=
 =?iso-8859-1?Q?ipSllhOdNFgOs91SH5ywDe/t8ecm02DSdCxR/FFnxJeHnQ5sSHu1DztLvM?=
 =?iso-8859-1?Q?t4MyyHw6ZZ0ojqqEwRpk6zOdUGRSfp8Rj+Z2Rd+Y5gqBQv/x7H32d43OcM?=
 =?iso-8859-1?Q?Hxn4Rqrz8a7guZZ/WeVkv0ojdRJuNMkjPu0FfZb5gq3dIx1XdrH2aAC9Rc?=
 =?iso-8859-1?Q?lapktyBiYjhNqtA6wYWvq+c+/fRMtBlDG2VyCLSh/g+0Je2FPjxrxgRMDU?=
 =?iso-8859-1?Q?91686uy5yafs9Hu12O1Vo8RbfVGv2BHchcQokozlyk9jiDpVl8cy4vU6zE?=
 =?iso-8859-1?Q?s8jEDkjQkBA2l0K5P/TwegOrKUDzwxh5lnlZ5pcVS8g4IwUwSVPgoJyc4G?=
 =?iso-8859-1?Q?B3cNC7HMpxa9+ZfIIFY9ahryaMdmPotN26E9drtI406DCiRnrro9QZN6e+?=
 =?iso-8859-1?Q?mYNxkt2oOgAVNkenj7ibzQLDjNn7d1geg9SodbYJF0orQmn81VuXVSMTSz?=
 =?iso-8859-1?Q?ccLTVj3ZqRMi+pHLeOLJ8H07Dn2/oXwV6A7SzNWl/G3uIIVE9GAzBeliXB?=
 =?iso-8859-1?Q?MZ3gGSo/TiGbJivZep/XJmR5iXL2NLBWOMAGlYGnSJ1wLa0xcjJWYqGmS0?=
 =?iso-8859-1?Q?cwJmMkMKHgS77CdgEKpOea8kUINMigzrXiaipTsGwh8i+XlRVK3T/DXABm?=
 =?iso-8859-1?Q?wQUGYoFUVU1ZBrxTJuhZyVARUzD9D8BTku017gX69kZ2cRop09DjP0SuDb?=
 =?iso-8859-1?Q?502tXnuG5FZxA0Q9tiPdJsYJx2thBE/cGZ2IXrbbk9fHD1Guuei7RgVTfH?=
 =?iso-8859-1?Q?q1obm7T8FcVQEXdpQUF2Ld7g78Eah+HyI09zWgoeAhLIpBTjsujAqo8aVH?=
 =?iso-8859-1?Q?lDGFbhAtshftNGvjNQrTC6BFU9srBhtW+DqaAOlB61raJw57s0+dvx9Hbi?=
 =?iso-8859-1?Q?6c5st3RWdgX2HVNn8eNKF1xrv6Z1Jc3ZEvnDx8daK45PQdJ3zZoz3gKrHr?=
 =?iso-8859-1?Q?wvLTDY9iKSF11+1ACA03bsXlD18G9B8TfN3WES144viRw/jOZI0VPtkoJB?=
 =?iso-8859-1?Q?7TksGX01QcF09D0Zz+9Ier/F23qJLgByttb7nOdgL/GTEZfXg0vQ8lHyp3?=
 =?iso-8859-1?Q?rcz/iJO+il8LxyDufMbfYlg3r5mZsTzuV4W78a4fPLrMNZa900/USkqr88?=
 =?iso-8859-1?Q?qCQAjCDsHSrRbTtF5E1V7IfhaQBjh/jNYMiYPujqx1p+FYNuqnNPyLEDYV?=
 =?iso-8859-1?Q?fNaUh/5Nid1e4FsIHO8osb1qREJBANkX/sD0y+vrZlXu+eQ/Uae1XvjKZ4?=
 =?iso-8859-1?Q?1gsfqeOn1dCn1FaZsLhb89QPzmsrixJq7XH9x4cf/uAANmz7uG1lI65HDs?=
 =?iso-8859-1?Q?OVPRblpXDXo3q+U8HQlG/qe3qcooyPdO5OPHz5eNgEnD1KcY0zaThSfigF?=
 =?iso-8859-1?Q?JkxXc+GukD5ubHWgjGhU5IkwxFPEVyDZ94ss6Ab83VJg/VxJILg8ObOg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00afb2a2-3706-48c0-36be-08dd7b39e640
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 09:51:16.2252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypg7E5VFDg85D3v9NetfqsiB3SU+P2vVTQrWtyfqQE74snVUTJnM+mqPYY7A+natRp0935CY2QNrr5sjYKFv7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6872

From: Mykyta Poturai <Mykyta_Poturai@epam.com>

Add the second version of inject_msi DM op, which allows to specify
the source_id of an MSI interrupt. This is needed for correct MSI
injection on ARM.

It would not be safe to include the source_id in the original inject_msi
in the pad field, because we have no way to know if it is set or not.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* fix warning for ignored source_id
* rework xen_dm_op_inject_msi2 struct
* rework xendevicemodel_inject_msi2 params
---
 tools/include/xendevicemodel.h               | 14 ++++++++++++++
 tools/libs/devicemodel/core.c                | 20 ++++++++++++++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  5 +++++
 xen/arch/arm/dm.c                            | 17 +++++++++++++++++
 xen/arch/x86/hvm/dm.c                        | 18 ++++++++++++++++++
 xen/include/public/hvm/dm_op.h               | 18 ++++++++++++++++++
 6 files changed, 92 insertions(+)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.=
h
index 227e7fd810..d0847dfdc8 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -236,6 +236,20 @@ int xendevicemodel_inject_msi(
     xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr,
     uint32_t msi_data);
=20
+/**
+ * This function injects an MSI into a guest.
+ *
+ * @parm dmod a handle to an open devicemodel interface.
+ * @parm domid the domain id to be serviced
+ * @parm msi_addr the MSI address
+ * @parm source_id the PCI SBDF of the source device
+ * @parm msi_data the MSI data
+ * @return 0 on success, -1 on failure.
+*/
+int xendevicemodel_inject_msi2(
+    xendevicemodel_handle *dmod, domid_t domid, uint64_t addr, uint32_t so=
urce_id,
+    uint32_t data);
+
 /**
  * This function enables tracking of changes in the VRAM area.
  *
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 8e619eeb0a..92db92e89b 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -448,6 +448,26 @@ int xendevicemodel_set_irq_level(
     return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
 }
=20
+int xendevicemodel_inject_msi2(
+    xendevicemodel_handle *dmod, domid_t domid, uint64_t addr, uint32_t so=
urce_id,
+    uint32_t data)
+{
+    uint16_t segment =3D source_id >> 16;
+    uint16_t bdf =3D source_id & 0xffff;
+    struct xen_dm_op op =3D {
+        .op =3D XEN_DMOP_inject_msi2,
+        .u.inject_msi2 =3D {
+            .addr =3D addr,
+            .data =3D data,
+            .segment =3D segment,
+            .source_id =3D bdf,
+            .flags =3D XEN_DMOP_MSI_SOURCE_ID_VALID,
+        },
+    };
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_set_pci_link_route(
     xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
 {
diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devi=
cemodel/libxendevicemodel.map
index f7f9e3d932..aa05768642 100644
--- a/tools/libs/devicemodel/libxendevicemodel.map
+++ b/tools/libs/devicemodel/libxendevicemodel.map
@@ -44,3 +44,8 @@ VERS_1.4 {
 		xendevicemodel_set_irq_level;
 		xendevicemodel_nr_vcpus;
 } VERS_1.3;
+
+VERS_1.5 {
+	global:
+		xendevicemodel_inject_msi2;
+} VERS_1.4;
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 773a0a2592..a1340b45a3 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -27,6 +27,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_set_ioreq_server_state]           =3D sizeof(struct xen_=
dm_op_set_ioreq_server_state),
         [XEN_DMOP_destroy_ioreq_server]             =3D sizeof(struct xen_=
dm_op_destroy_ioreq_server),
         [XEN_DMOP_set_irq_level]                    =3D sizeof(struct xen_=
dm_op_set_irq_level),
+        [XEN_DMOP_inject_msi2]                      =3D sizeof(struct xen_=
dm_op_inject_msi2),
         [XEN_DMOP_nr_vcpus]                         =3D sizeof(struct xen_=
dm_op_nr_vcpus),
     };
=20
@@ -112,6 +113,22 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
=20
+    case XEN_DMOP_inject_msi2:
+    {
+        const struct xen_dm_op_inject_msi2 *data =3D &op.u.inject_msi2;
+        uint32_t pci_sbdf =3D data->segment << 16 | data->source_id;
+
+        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) || data->pad ||=
=20
+             data->flags & ~XEN_DMOP_MSI_SOURCE_ID_VALID )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+
+        rc =3D vgic_its_trigger_msi(d, data->addr, pci_sbdf, data->data);
+        break;
+
+    }
     case XEN_DMOP_nr_vcpus:
     {
         struct xen_dm_op_nr_vcpus *data =3D &op.u.nr_vcpus;
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 462691f91d..da0a00844b 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -344,6 +344,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_set_mem_type]                     =3D sizeof(struct xen_=
dm_op_set_mem_type),
         [XEN_DMOP_inject_event]                     =3D sizeof(struct xen_=
dm_op_inject_event),
         [XEN_DMOP_inject_msi]                       =3D sizeof(struct xen_=
dm_op_inject_msi),
+        [XEN_DMOP_inject_msi2]                      =3D sizeof(struct xen_=
dm_op_inject_msi2),
         [XEN_DMOP_map_mem_type_to_ioreq_server]     =3D sizeof(struct xen_=
dm_op_map_mem_type_to_ioreq_server),
         [XEN_DMOP_remote_shutdown]                  =3D sizeof(struct xen_=
dm_op_remote_shutdown),
         [XEN_DMOP_relocate_memory]                  =3D sizeof(struct xen_=
dm_op_relocate_memory),
@@ -539,6 +540,23 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
=20
+    case XEN_DMOP_inject_msi2:
+    {
+        const struct xen_dm_op_inject_msi2 *data =3D &op.u.inject_msi2;
+
+        if ( data->pad || data->flags & ~XEN_DMOP_MSI_SOURCE_ID_VALID )
+        {
+            rc =3D -EINVAL;
+            break;
+        }
+
+        if ( data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID )
+            gprintk(XENLOG_WARNING "XEN_DMOP_inject_msi2: source_id is ign=
ored\n");
+
+        rc =3D hvm_inject_msi(d, data->addr, data->data);
+        break;
+    }
+
     case XEN_DMOP_remote_shutdown:
     {
         const struct xen_dm_op_remote_shutdown *data =3D
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.=
h
index 2bf0fdc1ae..4141af4300 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -444,6 +444,23 @@ struct xen_dm_op_nr_vcpus {
 };
 typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
=20
+#define XEN_DMOP_inject_msi2 21
+
+struct xen_dm_op_inject_msi2 {
+      /* IN - MSI data */
+      uint32_t data;
+      /* IN - next two fields form an ID of the device triggering the MSI =
*/
+      uint16_t segment; /* The segment number */
+      uint16_t source_id; /* The source ID that is local to segment (PCI B=
DF) */
+      /* IN - types of source ID */
+      uint32_t flags;
+#define XEN_DMOP_MSI_SOURCE_ID_VALID (1u << 0)
+      uint32_t pad;
+      /* IN - MSI address */
+      uint64_aligned_t addr;
+};
+typedef struct xen_dm_op_inject_msi2 xen_dm_op_inject_msi2_t;
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -463,6 +480,7 @@ struct xen_dm_op {
         xen_dm_op_set_mem_type_t set_mem_type;
         xen_dm_op_inject_event_t inject_event;
         xen_dm_op_inject_msi_t inject_msi;
+        xen_dm_op_inject_msi2_t inject_msi2;
         xen_dm_op_map_mem_type_to_ioreq_server_t map_mem_type_to_ioreq_ser=
ver;
         xen_dm_op_remote_shutdown_t remote_shutdown;
         xen_dm_op_relocate_memory_t relocate_memory;
--=20
2.34.1

