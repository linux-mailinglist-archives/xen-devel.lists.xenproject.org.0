Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1642B10E35
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056237.1424467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRg-0005OP-CB; Thu, 24 Jul 2025 15:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056237.1424467; Thu, 24 Jul 2025 15:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRg-00059D-2B; Thu, 24 Jul 2025 15:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1056237;
 Thu, 24 Jul 2025 14:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexO1-0003AJ-4l
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:33 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 868296be-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:32 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8370.eurprd03.prod.outlook.com (2603:10a6:20b:50a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 24 Jul
 2025 14:57:27 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:27 +0000
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
X-Inumbo-ID: 868296be-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJRP6EFh8OVcHlRe/QLoofA48RfVOp7nUL8lAdvqE/kMMD0q+Qh/ZaZAkwe77faL3kXHq9qhMx0OO8Y6vK4aK7LQayPIh8ncgjh0xy6MtGUXX6v1tgwd++O2fZLiY3nJhhcbyVMdvW++GLW2ADEVgCQ3u68uUpR9QX/KUBTBN35211EARAiakzgOeLH0PcPpFsGECM+NYDyRfbYE9kIQuoGBUmh5S5ktiy7a7/EYqBQe02meVE9wHV//IF9Ey+ztpcJ0yxwvSl1z7nRiuHI8HMgzrx4iGGBZeZHqYRYjdXkB/cvp/NU7xeuQOCj74UIjF9FSweZhzWRpmaBq6HcqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13xW6NAu/Hl54Leov1ZDjFZO+2j6m3T/RL0iSeRSjvw=;
 b=q/A9pXzZdjaKqTj7r5ZjWEPDjiqmFnqDR0FtCsjt9ojJ0eK99LBmms3SUpshEwKk/dnrFnPRvIpQjgQWrNJ6rz6TBHSf4vcMyGneCE4/eHDjaUxi8DBiIJ8Ef17Mz9qaFB+o7WrSF0wB3ikak/vE2sraZto9xE9aFFK/af9vVdSP1jsGYoVoQR+jmis6FwBtC0FnxKDbaoe9YTs7sHHEr+DJn3mYlW+WYcHPER24bj8Kaxysaw651HoRQpGKxYof4MSq9eyd4smvXLhXGT0FC6/eaCBTk1UKBazvW6BiMbjDaPU8popjOimIwtliarcH640yhSDgrXay7UbThCgZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13xW6NAu/Hl54Leov1ZDjFZO+2j6m3T/RL0iSeRSjvw=;
 b=oKXZPZ3t4hWx7JpeSaOzu81SxapKV+5uMgHnnaQoMJFOEvbN+U3CaAmlL9BdV8naqbQMPq1hr0DOHbsVXVxA8ZkyVzrxlENGhFtEym10C6sxJuhvLLuUH0/gxDwdP4MuIXdAYDvUUD4RL25/rtFBvSep8fBXDBcZ/vjL+sQiudZYUfaaTXqVyrpgMkZDeWxkqN84mbnvuApf4HthrhVxmmPdERql9+EcnCpnf5l1LoV+6sBJs+nRwzzGXOPc5rH0erTBnkKlDLY75qQS9ROJJZgS22so6ujPhT7Kfp7CQe6bEK8kRHy6O+HY0JxcxfIuSvfnrzqvuug3pFVfCXy/SQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH 07/10] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHb/KtFY8EybXSU60Sb7upXwd5tVQ==
Date: Thu, 24 Jul 2025 14:57:27 +0000
Message-ID:
 <47d77527dfb720723a83daa285aca9e72819dfc4.1753367178.git.leonid_komarianskyi@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8370:EE_
x-ms-office365-filtering-correlation-id: f709e853-c660-4e9d-315f-08ddcac26843
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ycAztqJ9R+GDgeeZ41kgkKxZ7A+Br8A7460XR/mBswOc2viv6HT6bD99XG?=
 =?iso-8859-1?Q?vRnyWkV4Rksoit+bLofKqmdH4ZnpICswTWmKBcy/X8CqMH239hOE0abFwn?=
 =?iso-8859-1?Q?DhoJchnheD7KJLhVb/5h7u9rKPVJBI5N8T7EWDr2IRROCWr3teopRbJOkp?=
 =?iso-8859-1?Q?Sy5zWRxVum21EWWtZ5QN8Q0pyP5RqiuJuEYy/mhYcYx/VxEZ8SlNwxzOlb?=
 =?iso-8859-1?Q?Rbm2H+Kw7pdKJDWLN0+wn6jeCQtLL999fOprsSftfJxiomXEPbRac5RUtH?=
 =?iso-8859-1?Q?UkPPX4GCSUFpGQxVQOexvzdly6lEKh8foQ5HKd6EI+YQ9CBeI3q8ndKntP?=
 =?iso-8859-1?Q?9iUqTz2/XtqRsBm1/EL2JDQDJTXS7uw6yhPQXDcPUb3m4WQW+fvmQjmw5r?=
 =?iso-8859-1?Q?xl3JdOyTOY7dB7ma7SNg09cB8JFkXyi2ZSWWCnzd2lmLXpZWJEEgs4Drs0?=
 =?iso-8859-1?Q?4/RJEbhb8v9WukFfsQgcKOFBKVMfjq1GeWdffXwGOu2U/nFS9b77BjAlqM?=
 =?iso-8859-1?Q?FIx+tQzwi1YI3BASXZf5z6pId96megRO0WvbdXvxgeh4ryKug7OKBkOwL0?=
 =?iso-8859-1?Q?QQNgStJk9l1THNyg11D9cyRc+9i/uvtcLTL6PKCCalnKTa7Sv2Np9x5ugH?=
 =?iso-8859-1?Q?iPdH3ToO0ZehDic4VH76Z+tiyC1xHLjWIjihSfqazD274y/eawLfdg8gOO?=
 =?iso-8859-1?Q?XO1QtsTVASK63So1QKYry2/JHdgGdnJnmCZWOSMQVQC+ILBSzBTVQEnJXW?=
 =?iso-8859-1?Q?3W9lsBDVn//870WY+NnW5kzSto/j4PfAKedZHIFg4NOX0zLrD2SQ2+AOyN?=
 =?iso-8859-1?Q?UE+AAoKOJhh39TwLNCYtubNgaTs5S+TteCgRyjvpU3p/1pjg49UR4hJah3?=
 =?iso-8859-1?Q?TfTs88yLrFjUflsh8q1fTk0JZoYHmlcDSvVZ+G5HJbktKCUla5Ii5qQo1v?=
 =?iso-8859-1?Q?1KnUoctQ10DWOqy/lQrbsN8lTAudvtU0ntgMnqZn88pfJVgXFAGjCdYUV5?=
 =?iso-8859-1?Q?m+h1LbvDqb88OicuPUfkmOff2tuUWbx4ba2nz2Vd7a4X+6rLYqSl6F7V8y?=
 =?iso-8859-1?Q?YPgb05mnyX8ChYfuQ3TPXHgvZJzkcFFVbz4DJwRVaGyNY6A/+/qcBhRTFg?=
 =?iso-8859-1?Q?xgrow2ql/ZWlQ+53ntiRk7Yt/OMF4eIMdqhSm2uwklpsMLvsACgHZe23gu?=
 =?iso-8859-1?Q?yt/6Mc2Rfz9SVrwXwHV/BSaouiTVl2IBCv13v+w3n2onGliGpJot4kXYrt?=
 =?iso-8859-1?Q?QTpryaM3DniNV4MMIwYLLUpTUQqaDMBenPmD++8R7iqUYVI/tSqbQcD2UK?=
 =?iso-8859-1?Q?XmQAq5mlYhoHLGFCagRwv8xW59W4N2y61vc6dCzmojJPdz0kp/MpP230qU?=
 =?iso-8859-1?Q?2j59Ij3mSPHt3r1fmaKRCfFbO1qQXpwz+2xLvlksmZv66p+stQ6F9vlxci?=
 =?iso-8859-1?Q?duI5+dpwSQWKYIWCIcM276h0UHfS30xIWCIKYJLRe4m6m6zayv0BKF6AaK?=
 =?iso-8859-1?Q?MbXMGEUxDrGUQgRAtI8TFSs0vcLOa5cOy1D7227nJhiw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?w9+cUeGR1iIQfu1Qq53JZlvnIjECcZNwAmVmF9nr5qRUQ65+H1jm1gRHmu?=
 =?iso-8859-1?Q?5OmUqSlWtzYxG53U5g/Vsyb6ske+0greV+8OpFIpAF8J6EKDo8slDGs2oJ?=
 =?iso-8859-1?Q?tJ5gzSFBE9fD+URC/IGDGVoSlghQRxP2S5rF3UxNAGsGT0AfrWrWQC6OMR?=
 =?iso-8859-1?Q?RqWhCe1bfW05xjyym+9bKnitSkQOfcC5/Y4RJtFGMrW+KOBBNMMVrLITue?=
 =?iso-8859-1?Q?RBT12e5zi/NyhZv6oUO6aGbuOxtSn0L8zHquYCWurG/XhEJTlpBjtYM36X?=
 =?iso-8859-1?Q?L5C475iuJE0ZhGeDM0MXtRVx+cLXxD5lUHlLHwmUc3drBsHEpB3RgrZni5?=
 =?iso-8859-1?Q?DS74nkI1uXLOfJxXwUy/7yy9dr9jzLN471OAUNespJhibBPW3nknxgacbZ?=
 =?iso-8859-1?Q?a9rHx1xXT5zrXtQ7t9dOAc0kof+tXwYdqiRvbL1/0ozrzO4JSeMB8qjj3S?=
 =?iso-8859-1?Q?7FYZSlYKb3yq3DxHLhVLZbCwcxWBSgXD9bd8O6JlpZXTXUU7v5DU66KCee?=
 =?iso-8859-1?Q?HYHH7ijWfjlifNvf0vNfWcSu/i5irHdMhlqzxJJbRKEK2gfjIOeXQJvbyY?=
 =?iso-8859-1?Q?et9JxGpwC+Tp2I7MU+lX5odXcSGHIWKkFqbL60eWo1ZnKSr/lR2kvgsRIn?=
 =?iso-8859-1?Q?kNJGuE/PsIFYuctFOYHa2EOSBB3AHVIQxFYen2g7W3Sa5WGznfbcWrztc6?=
 =?iso-8859-1?Q?09LdXyGseXBfWZC55+pTEOHPHKH1bt/fCbCx6e7yOo0hHOwXEUAUTU+Rx1?=
 =?iso-8859-1?Q?qA1Bbj9dcDrQdNF+6VPWGAZb1B0rZAROjnuYbbKRxvYpiyK+goiI6Vy6zn?=
 =?iso-8859-1?Q?dSFDWz12ekd4xpdnETICkjdiad7QUinSCMPn9Kit4NKAmP0uPou1MlXUJL?=
 =?iso-8859-1?Q?5R3b20+7bXDzfy84HxGsf98Rky0ULtdZEovevCxarsQNYQ7cKYWVBkfLgS?=
 =?iso-8859-1?Q?sLyzJSTcljSOcQaVTUIIdfqpLDf3nSihBcLDaATCUNd85Tvw7HpgKybjhx?=
 =?iso-8859-1?Q?Qxd696qSdnLHFqsJ4OWPM3eY/S9B3t7fWkjDT10kB78Zb9VpsdKMFECoNf?=
 =?iso-8859-1?Q?f13yPfZBha9KD0+N1TJQcOXZD5RQi6o44NvVV6OknW1KJ9138k1xmp/UGo?=
 =?iso-8859-1?Q?dhUbfvqNIbkKAT9XeyEctJ7WJiFvKySW4IBFsP6zjIyxtu5apwRusF6+5X?=
 =?iso-8859-1?Q?nBI8OIo8f1rTQVF8or1wgWE1WPv/5jqo9xvyB2YOZzg7pzevNjInIAo222?=
 =?iso-8859-1?Q?ME1QYvEkg6krkFEx58ON5AEQmd+3GmHcXemea7zM4HAunMmH03HGooOeyI?=
 =?iso-8859-1?Q?T8rzOEv48lJ/o/fKZ5ZtsK2Yfl9uN0XGsV2/rNDxgDfIsN6G+j6oaRqVB5?=
 =?iso-8859-1?Q?yYQPg/LswNulTG2duk04FmeskTh27e6pcqkUC+yfcAO7BB7P77fw4Sq7eR?=
 =?iso-8859-1?Q?17lyh+WvV/2ByISfThb67/16KMbwmQ9FQOABaENv2XOcGVViEeKTKVIdgS?=
 =?iso-8859-1?Q?9I3hFV3LkJ7x3dwwtXF6jLkLJFTEZCEjo+c/bijtd6reFEzAb+pGVjk1AR?=
 =?iso-8859-1?Q?6AG21d7Z2FRP6JhsmpYykSG5A4NUtAy0b68J1IOTTFRMGfqoDGcFtmWInt?=
 =?iso-8859-1?Q?KmyodpPT3wmr7Ii3WWF8R3pDcyKOKJPwqLHuQ6popjwIuGVe5M/zuvy4wu?=
 =?iso-8859-1?Q?V4tX/bwGPpmHBUB3CUA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f709e853-c660-4e9d-315f-08ddcac26843
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:27.0308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqC9B32+jspn3XwAMH5sA1vMqtzRBgERF+6abEO+0dOoelycZjBmQBlvPfBNikTWxMapZfFgw6zD0tBm+J8EioP5xUvUmbDnOv32OjMXURw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8370

To properly deactivate guest interrupts and allow them to be retriggered
after the initial trigger, the LR needs to be updated. The current
implementation ignores interrupts outside the range specified by the mask
0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
eSPI interrupts, this patch updates the mask to 0x13FF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 7f769b38e3..2c02ddd287 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -206,7 +206,11 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
+#ifndef CONFIG_GICV3_ESPI
 #define ICH_LR_PHYSICAL_MASK         0x3ff
+#else
+#define ICH_LR_PHYSICAL_MASK         0x13ff
+#endif
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

