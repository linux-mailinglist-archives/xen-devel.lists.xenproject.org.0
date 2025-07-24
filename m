Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89367B106C3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055560.1423956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesVF-0002jy-2O; Thu, 24 Jul 2025 09:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055560.1423956; Thu, 24 Jul 2025 09:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesVE-0002iH-V7; Thu, 24 Jul 2025 09:44:40 +0000
Received: by outflank-mailman (input) for mailman id 1055560;
 Thu, 24 Jul 2025 09:44:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4HJ=2F=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uesVE-0002Sr-DU
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:44:40 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b0815d-6872-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 11:44:38 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8003.eurprd03.prod.outlook.com
 (2603:10a6:20b:42a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:44:36 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 09:44:36 +0000
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
X-Inumbo-ID: d0b0815d-6872-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0xb6zvDMda9Ul4kOGvTIec2vFijuGtrm+I6kRl2eNkrGvp+5ZAPKBziF0UYroh+J1c4w0gpfydsB/1BZAK0uGc4H4qCU6lWsTq/bgqwk4guNni8xBXKC3hFW0bW4/NqcF0OFVPQe9mc0dT5k34lB9/fVab+G3wyGsTnMXm8BD9/HNKXeKstHYcNllJZHnClGteHALnmouBbLjiIbZTL1SB+lL+qDyiXumWouPlIGyqi9k71UtorZPxtQXh6p12EqF363RX3LEZxBFjO93JpQ13IP0GjMPaE3CGNjXJS8ic+JacSNCS1KwXFFizZFmwKlo9xEzbJkZPdcovt5geAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3Lzd6Ut+0ZWOMVOO4BXgKBe6Ygl66u/G3PvJNdmwTE=;
 b=sQftOSJu+/SGhEIGR9veFFxRFn36SKP4uH/yfmaAGEgylZDis9NMFl7xGznv9IkasKQRMhWbn0IR5/g/kShJS/n0GiAAIuScs+4JfH7IxZbpTsSZXVrLl73ZfTFhxTUTIogYundW+yWG+xL3ljloVSsYQv7t2G8qTHvaqTv4+f7Yp+H3X95L/36RueedWVib0afETjl6IKyYDeOX4Xure/to+9trZqXnSZTselEsv2ycF7/qJSnZavuWISOxThpW50wMHQ+P08Bkf28KPRGvlNUgKWvWs0TZhZ6S6TC+VcHtcKQAhi7bIfMLWHF4QJI/LRKMMHqsJQve9t05oRQtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3Lzd6Ut+0ZWOMVOO4BXgKBe6Ygl66u/G3PvJNdmwTE=;
 b=hUy5dBBjyBL5Nx2+o/G1sho36D13kDHmg6EZZSFGUmAiDSr1vHFvPiaS4bR1iw5RRg+7FQVWKGdILfsLucWyiIkE+ogO1/PZW6pCT9dpOVh1CS+26GeWZSakQ7W2rwJDMTNoiMvivK0vQpxWdlVDZ80rtRqXF3katXLy+QfdBFTD1XLuN5ytuJs6/bSBNpVwxvx8HvZhaxXET7aNKPZKOChua0x/fZMuaa0AoNXXHe759uiahGMGuJGB8yVVsCxKtw4j/99YFSmcxU6Et/gX6JPT4f886u64tv+z5qf5SA3CxDmGvgbkKTTIkT9jRMy81kyEIO/m0hjeGnTiglXG3A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v14 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
Thread-Topic: [PATCH v14 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
Thread-Index: AQHb/H+RZz72CuYaAEmAjKB8JLwIEg==
Date: Thu, 24 Jul 2025 09:44:36 +0000
Message-ID:
 <5a6bc670f5874ff7015668f25392e5001bdb2414.1753348261.git.mykyta_poturai@epam.com>
References: <cover.1753348261.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753348261.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8003:EE_
x-ms-office365-filtering-correlation-id: 1eb0a5c3-6d4e-4882-217c-08ddca96b39a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lFdUBD1CNAb8OYyqSyIDJYf5BNOGeSD7E58l8RTSivMa6Ebgjh0pJyIUUG?=
 =?iso-8859-1?Q?rJiMpSe1VLXva7mZrxQ/That+gfcXM4G1hh6maIY4vcbH775eN+Lt/5zD9?=
 =?iso-8859-1?Q?iaLEcf0Ifugb0ywJw39k4Vtac01GA547p4teRVDYnMCV9N4LIQqgufSTxl?=
 =?iso-8859-1?Q?d8LXcFnKQfmAG6eo8SCUrIt76L2sk1HiTtjLp445qdQ2kwC1P8uSFqqIPo?=
 =?iso-8859-1?Q?4vI1f1eiS718Yu31vUPY0SyBqaU2RjjLbFWxgLzGTDBV/fb87rRI7SD3o0?=
 =?iso-8859-1?Q?YE8Yh/oA2IkqiLRwGTb8v1cwQReZBMmbEFiiOzMthQxFFvfmMlCGyVk9L3?=
 =?iso-8859-1?Q?XN07XOBxrOCFGxnzrocJEZr0rU2YHSCZTZ4AAgmNPrVp3ZS8T0DM5KtWun?=
 =?iso-8859-1?Q?ReSGv0/GZyeCub2chkFmCBjy3bdCIBurZYHeB2zMuiTXo+kaUkINuEofqM?=
 =?iso-8859-1?Q?imvG90DHEM7pR6qSUg50EjAVXc/aHQ72x75huCfn0CM4+04yVEPwwz9EA/?=
 =?iso-8859-1?Q?ecgMxCPX9le2ysVNqfCgBW0oeetj57yJNAd9CzF1jMfbJxybR2JAx302GR?=
 =?iso-8859-1?Q?7RE5Km02qSYswkyN98lDT4k5Pk892Ar21Ya8SQnNyZME40hpaGMnTSuUxK?=
 =?iso-8859-1?Q?T8arvCCAtH0qV1HBTvDQMh9Zw/1r+crIyEx0dU4tmCIPJg+pdREQoi78yi?=
 =?iso-8859-1?Q?DGV50Ojwt8Yysb1AvIo5DmAykhllkOtEZuzTIhERDYouMEcvNZVDOlEJV/?=
 =?iso-8859-1?Q?Gndh/WzqJBlAF/lPquXRPn2NX3grpzd2xXH9uh5eo336chi/CT5dX0QR6P?=
 =?iso-8859-1?Q?I7cPx9e5IAeFn3zVZS4EuJAJvsocsgkk+RMjUV30jnZXIR913Q7CyXcU7W?=
 =?iso-8859-1?Q?QHl7F5cc7ypJOUMBMw+VGrxiUMVI1kgbvtnQSraXjDz4/ot7vV/YBYN4ua?=
 =?iso-8859-1?Q?tvoR9y1JMLEK3JZ3jlx7JKvFFw9FKVwuIW38qhE/vSDcxYIqDLgeDt/BHO?=
 =?iso-8859-1?Q?b3/Yse+Jsn9tz/1dd1q60GQxlGBDWq2q9y8xP4WTZespjdV2oR0C79F2C+?=
 =?iso-8859-1?Q?2zT7BSGEepkiEv11i/OZSUpWlPhCszIgica7jESKvqD++IX8u0qOrGswAN?=
 =?iso-8859-1?Q?7cnPN/H+//k+HMoNFENY+a8oEcubR75XMxVhOZ4ou3dJ+g+WH0mgCJNw7K?=
 =?iso-8859-1?Q?Yw7a387VnLHDS/4RnoVMglo4BbRTGX+Nf4q2uV+5nsgh8xIJlUrDgFzThh?=
 =?iso-8859-1?Q?UhQAprN24VpCmfBmSHjYIJCRKJUBPcnlH/iLfVQr+YfV0j0psLIU9U1Mxp?=
 =?iso-8859-1?Q?GTgjKirxGrpDdsfVTzRfJi0iiCDZDvfsBRriZmx+95GICriw6KKTvlkXlz?=
 =?iso-8859-1?Q?OiPvW4v3dXyGljfcVt4zk3G36t+YMe+ddXGV/KQ2WQfPXYtDEYsWymf4sV?=
 =?iso-8859-1?Q?Bx5x/h5d5uUlxyXeHPlANQy2PmtLCTgSJDmjvDpCzifoDvnUnUrnqnYOAb?=
 =?iso-8859-1?Q?DBHzN2jtkpEH2Teh4R5Bgdzp9x6fz+iEo4+NhSIfwAeA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CDnw386Z2WOO6mc4lkhcdGntZ45lFVOPQW3bceRMzWWe36lqf9EQs1o57X?=
 =?iso-8859-1?Q?SFM18qdM+kviwGv5T5/jRtzyEaIQOHwyt6NArzKBOSCHxN4fxBPXZHSCao?=
 =?iso-8859-1?Q?2mInN/6XRm8HhEZ8q3nDoiSOkFLgF6fH3/jO/PZFb4I4HhHVRR+Pg1QKSa?=
 =?iso-8859-1?Q?Fp4iyuO6vlSgpxMIiPl8WKie4k6Y7WvIXYXS1NRtGBc9NtQ2KoRWqMXqrk?=
 =?iso-8859-1?Q?LHn6Qfq1VbLjI6Y3msMCZV/RThAcYaPLCHlUKOX6F6EKnsdyIpSvOvi++F?=
 =?iso-8859-1?Q?mMWXgwirkpiCN1DPE0Ho7L+W2aIcO6tV3u8pP2+JbQ5/RgHDxYp5craTjG?=
 =?iso-8859-1?Q?YO0KTDzYmlHHF5K3WteP4GHZgkPIIMufdRMJrq9W4zCV7068hFCWa0uWnz?=
 =?iso-8859-1?Q?w2ORjlLLcclKHlbee3oIiNH4NilTJ47WLvr4KwgRHw5BrtRAXuOHK6F1Cq?=
 =?iso-8859-1?Q?Z3g/Gb+sccr4KvzcqQV6tMN/zQaDkcrP6LwBZF2jgAzwubhO3sIFs9BdRK?=
 =?iso-8859-1?Q?LVzyEZ/cFFFA7bvi07opcdMyRBDIk8fodY/H7PvN8oU9Pg7d7HTLqzWorS?=
 =?iso-8859-1?Q?Mf+TIMF6/+8IzvgnJubN7sN6qBeqLQ+mRbS8i3Rp045Xp2Y899oKmCoSqb?=
 =?iso-8859-1?Q?DxIMraWOrRgPR0DufYOtoUXrTGru3X3nk0R2cGphSga0f5J5psbzhwyeWy?=
 =?iso-8859-1?Q?AerW28quPpWb52ycnBMbQ0MsdWhkFTo0+P2/w2oMtZITiLgUzd+3SrJj5E?=
 =?iso-8859-1?Q?Y8ZXCfKzgPPbtx1UpL5EMfmWMq88E1FDmhJq7kPh6QwhMDpMpyyk6s5DuY?=
 =?iso-8859-1?Q?3Ql9w7WrqoHIxojs1VG8nZ+O/qepQN5OHn7EwJut+t8/qQgJvH/9dcIGO8?=
 =?iso-8859-1?Q?V/0E6SuryZUO4sUG2zZ0YcpT2Gkd3Tgcd3quzPLOieJ7i407+DSmYJWHGy?=
 =?iso-8859-1?Q?eO0J7bVKio9yVABhqgGrecgwAVAKGC/PrDANS7YbQmHf1QI8WYxiAsiKC8?=
 =?iso-8859-1?Q?JC+upbU+slVEpka1+8rnau/USBbroI5IoR924eMKdZPDW2L4/e+hbPq9lM?=
 =?iso-8859-1?Q?tiBvVSL8t4tk6pPRc8kYwiGNpE5BwekOqI53mpm0j5Tmx57/b1cYerptwc?=
 =?iso-8859-1?Q?TSyzQHQXywKxcG/W29Zcl5MH9/0kDqGQJIQL2lCKQ6ncFPv4B0vzBAHQ6b?=
 =?iso-8859-1?Q?rpxwVk3ywrG1R14wgwEZC+vIlFoDwgXvGtSAeDddicIeIzZHai6nC7NXPn?=
 =?iso-8859-1?Q?Xq1xBJH8vmQSZE4STe7J6lKsiJbpWBDONywZA487LTX38PNiNMHf5p7EpV?=
 =?iso-8859-1?Q?acYl4P8l6yKRpTR333sPonS1JOB4/bXM4UmX0cvD1Vjumv/eU6v6jOVPh/?=
 =?iso-8859-1?Q?Ld9j5BM7V63iRsHyct5BquzM4Jn3ZclzjhNilJnG+hpEGguw/0W6HB/mhd?=
 =?iso-8859-1?Q?NInFKq+UPojiRSx6F4AF3Zi1VC6BckLn6EZImjeU4SXGA+RokfC+5SYAMq?=
 =?iso-8859-1?Q?ixWGct1TBLjm+HTo7MLLKIfkBYxlxR9FqJBVAUh/CFOYg/1v3UtCpuAXSY?=
 =?iso-8859-1?Q?69I8HM8COCPSoDUOt/6mKIhzKjXy8SQ+31qEa8sL1fU+ESwlp+qssuP9Rk?=
 =?iso-8859-1?Q?GfjaZg3MPWxi21+9ISYGUEmB1kZ1is0r5WarR9qoER0m7V7awd2yGBAg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb0a5c3-6d4e-4882-217c-08ddca96b39a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 09:44:36.3473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZf6HGgGCEsObTxhQMnux5e8Y2TWiGoWfq2kdQxOhORXF6/4K8ujFfK/inv5UDWXN5a+JFrSvgvGmxwFraLL7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8003

On Arm without pci-passthrough=3Don Xen does not know anything about
present PCI devices due to PHYSDEVOP_pci_device_add not executing. This
causes PHYSDEVOP_pci_device_reset to fail when trying to find the device
that is being reset and return ENODEV.

Add explicit is_pci_passthrough_enabled check to return a more
meaningful EOPNOTSUPP code.
This change should not affect x86 behavior as pci-passthrough is always
enabled there.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v13->v14:
* clarify the commit message

v13:
* new patch
---
 xen/drivers/pci/physdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..78de67ec64 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -74,6 +74,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev *pdev;
         pci_sbdf_t sbdf;
=20
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
         ret =3D -EFAULT;
         if ( copy_from_guest(&dev_reset, arg, 1) !=3D 0 )
             break;
--=20
2.34.1

