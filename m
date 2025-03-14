Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3558A612C7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914588.1320321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bi-00042x-H0; Fri, 14 Mar 2025 13:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914588.1320321; Fri, 14 Mar 2025 13:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bi-000400-CK; Fri, 14 Mar 2025 13:34:58 +0000
Received: by outflank-mailman (input) for mailman id 914588;
 Fri, 14 Mar 2025 13:34:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bg-0003Jp-Ex
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:56 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6a46df-00d9-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 14:34:55 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:51 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:51 +0000
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
X-Inumbo-ID: 1d6a46df-00d9-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuS0BskdvjXgNGmjlnKVEgcB3XzNFYBbyb0CxqlOcnzLReh+is3W+MI7TV5yx44IigNBfcU17XteQvYOB8niNVo++k+nc4tRu52A+4Md5b+9IzB0pi5mxRFit025O925F5izYlmvPN/gPuJiaubsIUcY1aRA9K8QN/8Ke9mqWoPoTmC4uRc4EJq3Chikjt0ZWfVxZE+pLnM9hIBM/FnB457P4vJU2WPlVHMa2XeFpAU8S9XSBAvLxm63WqZE3HH62Jwgs7DMjBvx6THWAJTR1PR4KRhl2hJCq/rhtfEnIh4P0Q+NMrZZwAKG91pCiiB51rYQcoD9Fuo3y07Vmipc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMWq/RIZ8Sv+e5l/RmuzHBIUH1oPPE/Mvx8WzQabMZ4=;
 b=cMqTzBrwQRqJ9j7j59/+n8qp4fEYPqHCU+QSVVQBprhPrvf6ufM0imXJ6B+brw//oN9JSI2dVxJdI+kg2H7sCP9kj+cvArkz20RXSvzfnFTwJWfJxJmSERLGOle0ZPLFJ5TYyvFNU21XE8BgN7WkDvw/sNiIJMBp0r2EHGDfF1puTaHiNTMrh0uCi3u2tSIi5a5fZJgIynEB3bn3zeoAGAaFK4F/FRskS0I+f9MY/o7cbG8TVgCZ2kwtqJMUNOgJqZtmIKjvisKcGyEJ8e/GXWvBEcx2ap4Tvs+xijpBSAOQqsp+OvFVRW75Iv6vzXU+2+SUr3Ptbm4fvJCIm/wKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMWq/RIZ8Sv+e5l/RmuzHBIUH1oPPE/Mvx8WzQabMZ4=;
 b=uvpjKPtBU+rfGTLhwlEhZ1bID9nbKPE1vN6refCjdKaPsbKrKxrmw89xe5P3Bef91yP1h2fFTIInUY5lNEYDTniThApbFEt6kQQCqZL38K8wU7oIue6sjdrQ1v/1gwKGmNlQxSjAseYECLUGH+4XischsWbL3gMwtLE9dDeWtUhTJh/yyh2nXnpaY2Z4anbaFUiAFeml2/lUQXPEl6w/71g58mrqXJRwClRAObcKzDIiHtYmGncnMD0KI7hSlNskDhKhZUbheg511LygGLSz648OcY/tPDxXoZt4dwwRNJXgXxWxZtGDqbW//qFk3sWwUVZTVsj2iX5arB941v6sPw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v9 3/8] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Topic: [PATCH v9 3/8] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Index: AQHblOXciFlCTG2d9UO3pZAlFjZPOg==
Date: Fri, 14 Mar 2025 13:34:50 +0000
Message-ID:
 <f9954a18b28b2233ef1478855994ce979a779e76.1741958647.git.mykyta_poturai@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741958647.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: 5c33cf1c-0b4e-4ac6-9148-08dd62fcff39
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nJbHMB7gLCW+0tg+z3a4MqjQvA+cgMlwh2w2fymm2cij+EZVxFlYvrhBkN?=
 =?iso-8859-1?Q?SoY0I04YAC3yoY3cYE0dwvSIxGvtvsUM1wlfMuBOB9aLF4BE3AZTfdH1eZ?=
 =?iso-8859-1?Q?jZwBazXbaRunX+jTvs5sJD+yP7fpBDqCoc0g0Niew41vi+cFjsWLiW7Cav?=
 =?iso-8859-1?Q?A2id6pRad8tdxsRAxC9YhbXYgmFwhfNkHvUUUYzw1RO0Yi+N4LWpVOXGpP?=
 =?iso-8859-1?Q?hYQat8oDAj/YYcd32uAisV0tc8Vjk30BvCw4G9biTrrUzcWblAHUu05RtX?=
 =?iso-8859-1?Q?PYq65DS1frOTx10zv8TwFR5jZOqNnoSCRxtSGc5/fM5ylUM3X35c4rNgYA?=
 =?iso-8859-1?Q?1BauRLHf12pFLDWiqFwOgXGBMzmpES2x3VbqjBbzodo/gsfTq71fw1B58f?=
 =?iso-8859-1?Q?R7o0uZxweg83nuQc4ebMX5OYNk7jlaWd1HwinvOFy71M65u5/P4GJjC9or?=
 =?iso-8859-1?Q?//00jgGT2QEDu+Neql3qJTcPw+ohLbXC8SXqTR/PfjiukjTTvegfnfDOOk?=
 =?iso-8859-1?Q?+IL5XW0xW195lm8Q0T9p1jJsjk5WNo49p6x5S6MUg3NFKd4msHgqRgplpk?=
 =?iso-8859-1?Q?1nfkwOBe5TQ+8W42h43dt92INiwfXdOJ6n9hcDCJWHgSuyro+YCozfUTZQ?=
 =?iso-8859-1?Q?DYS9pQPY+jAcUIzhmiCo5zKb4/KVJgX/sh/4SdmS5dUcXZNtJZkEHoMBcW?=
 =?iso-8859-1?Q?dzg+dnXWnCDsi0Eb6DzRhGx4CEYjZw0wIHYvKQK8JiZMtfJSfXIYPAqqqn?=
 =?iso-8859-1?Q?XnmXdJ+OmufsMV+Y63zD1hVfQcdaybLcQD+oxzFrdc3YJ70RjJ432Buz58?=
 =?iso-8859-1?Q?KmA7EN66pbsuzoZAtQkdrMZLzPnLGviUlxKGJgeVgINzue6y0XiyC6qIy3?=
 =?iso-8859-1?Q?P/cD2YJgMfjCx6Aj549V6uU/ugl75x1uT334RwSxGJ+5LjZerv5zRRlq5q?=
 =?iso-8859-1?Q?xSJmImWBnMJQCWPv8S07HTG7J/c3WJ7CTrNDLA3VvC6Nyzsq+Q4g5MxCK4?=
 =?iso-8859-1?Q?tGBPtpfTIwgZ2xJZt1Q3zBjQxgtTc32aJkO7SkEFfb76+XglBoMgdy9ZEu?=
 =?iso-8859-1?Q?vmiZyW3UmVfJnKAUKDgIWzMvflZm/P6Gm4fHCsFaV4f6RZr6rLal+ccKAH?=
 =?iso-8859-1?Q?4oUnX7j6uAzF+TE2xZIo7OkyZfpvc9B/8P5u1ttxrUhBqeIOBOV5PoJ83M?=
 =?iso-8859-1?Q?Z0Oy4m0fNQQguvlzr2IXis8d4tDM+z+B0BmmTy07cXWBjzBCAlhctd3Hgd?=
 =?iso-8859-1?Q?GeIkjDQmutzYdmYulzZlaMxYC11D1olvnMFpT9WJMQyjkVCE4Gq5vaROQk?=
 =?iso-8859-1?Q?1emx750eHm0DsDTbl7NfZet1dSnc4veZDfkt4yHfZBjZaYBUkKNWB/ZYwB?=
 =?iso-8859-1?Q?1jmj5diNE0q1+IAU5dZV5fPM4QgYnroA/Oh7cupSC4nzYY9rz0m6KBZai3?=
 =?iso-8859-1?Q?o1RngKQ8VY+PvdtaBoOTYXOgEIRUef7YM8YnVyebS7t/3AY1bSVPjqg7yo?=
 =?iso-8859-1?Q?dMPB/2zRn0aebGJ5Bo/vMZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Bn3MjBRYhd+6cPCxa7Z6ajj+h+wsUxLMUYVkB9Eb0q2X1V1Nlzc0jtULNq?=
 =?iso-8859-1?Q?NchPi7IGcvRKd64v8bZeepUU62T2+qj7FCK64cT+u4dafPezsxL7yzgU6Z?=
 =?iso-8859-1?Q?sl1aRqhlk9dL8aXzBC2mb0Wl1I5ifLhXE/O0KuwFlg0VamvungPPc2YXuv?=
 =?iso-8859-1?Q?GE+uuPc+SttVtsXsW5HRn6MlNEt1NWRM7kYpJeSeBb4aKYw+AK4jOe1npo?=
 =?iso-8859-1?Q?B1tB7g8v5wvMihSMdA73hAEqF9azPC5ud5moZFsj9S4K8wKAqNSmTJth5P?=
 =?iso-8859-1?Q?wJeZOmLIQidYhxD+pAXb1Clx2Bwlx2SBWTgnIjTrOdY4taeO+4lk69LWQ/?=
 =?iso-8859-1?Q?zPe6QdgPCf0BB37LcmE92EJby8ZpjVbso2yyBHzPk50wkAig1nPXQ+p2yd?=
 =?iso-8859-1?Q?EAIYEb2EmVEV4+4JLRcegtezR+dRclHnfD7qC7Ml8TK3TTY2qNtpdq/5+a?=
 =?iso-8859-1?Q?SAkK2A93NJgLA3KQVBH/IYxSkVCQ3Ht1kHvvfY5UcclmSpSXmCg4XkM/jd?=
 =?iso-8859-1?Q?ZiCkizjbE3vCG3H8aLyqp0yeUSXTn8lTMyPsDwmFX0pQ01Fe9HQS07Eo9w?=
 =?iso-8859-1?Q?xjLrKa3cBsAnRWQgHGNXQwrilydBa5jQoI4Dga6hGCBojiULmgeqo+BHyT?=
 =?iso-8859-1?Q?zpu3TQ0Pv/ta/z7DgkDjFqkBIoEc5CraAMJKBwSIJAFIgaY3gi8PAjF7n5?=
 =?iso-8859-1?Q?EhqcxvEtCG+0HLiS2vF3EscgDXzuvcMxkXJWup1I0gXKsA0HWcGGA58Ku3?=
 =?iso-8859-1?Q?enL7wKtq6TsNt0Vzce4mPx8IlYSJoWLEm+LWZO4Oae/PxLx2cC3zQYuq5f?=
 =?iso-8859-1?Q?nHPq+axBQSon62fJLiD6g2xHrn/pxEyMbcS4ZcRIxIqbJ5yyomk2uTlS5F?=
 =?iso-8859-1?Q?GRVLEgddKYZCq/CqweOWdyjgjEa2ysKTQ310pE8K+YsyVdKcxJm205fEo8?=
 =?iso-8859-1?Q?Ksq9G3voBj60FjuoNwBcVhNskWKutQIhLIvCgbV6qSa0rlgWvUUPGb6EUO?=
 =?iso-8859-1?Q?dShlrnC3UE/luOpnmFR9KwMjIKlVKfHw4DJxwzWvBTF4Surxm9isqyWY0D?=
 =?iso-8859-1?Q?3Py2r4fY9+hex+QPfXd1OWfHcXD4m9UiWgkNKaANBmlgYl7Xgi2e7rFRyf?=
 =?iso-8859-1?Q?gnmvFUdPiWZvv1WKufUUz3hBwOqM7LTi7BYzacWPlC/T1CiboeYLajCuc5?=
 =?iso-8859-1?Q?ElIGaGCEbgR1eqH+i/+jSvfYwYJkiMHxOzP7EkzIi7zAqdCO0wtaudHmE3?=
 =?iso-8859-1?Q?j5GlIHWHFG0X10Ej52OeGQpZX65qvTMiLM2qPNuUnjyP/NUzjesWroJRaq?=
 =?iso-8859-1?Q?2lCuALReh5ojdHlmR5xw5jpW+gGScH0xseCsyk5XQTfwG3Li4IppSm6Nb0?=
 =?iso-8859-1?Q?aW3c4OJ4EFokanDkBek3O/hoIPVwtS81Qh9h3tC6KNdxZxIM97IZVjrDre?=
 =?iso-8859-1?Q?31RowFhgwkaVTF3aHR9DH+g5023mKw9zmgeCiBbXyDrzwKV2tbl8rP3i0J?=
 =?iso-8859-1?Q?yioHMyfIAGBCe2O7c+4GHWaysQPJ3pytMxE3Ykg8cSP8U0Qh39m5sHVvf2?=
 =?iso-8859-1?Q?fZ8eAEgfZvrivEZS2GojpUBAJ4gTuVM8ZK9Fvz41nETawKU3oP+Jbg6Z/G?=
 =?iso-8859-1?Q?VTxJm6ujYt9BRqyoiWlYG3SZKRdWLr0tE1yLuxIuRSq91VMYt4ENkvVw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c33cf1c-0b4e-4ac6-9148-08dd62fcff39
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:50.9215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fkxst15m7dLcDTeNQHQy5kJdRKgkiBf4hWrSP0FWl2sbKbBkqE6LHAJcnseSphPJBhdLOC2436S8p1bhQwJvJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stre=
am ID
mapping in DT could allow phantom devices (i.e. devices with phantom functi=
ons)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-io=
mmu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v8->v9:
* replace DT_NO_IOMMU with 1

v7->v8:
* no change

v6->v7:
* no change

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* s/iommu_dt_pci_map_id/dt_map_id/

v2->v3:
* new patch title (was: iommu/arm: iommu_add_dt_pci_device phantom handling=
)
* rework loop to reduce duplication
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* new patch

---
TODO: investigate Jan's comment [2]
[2] https://lore.kernel.org/xen-devel/806a2978-19fb-4d31-ab6a-35ea7317c8de@=
suse.com/
---
 xen/drivers/passthrough/device_tree.c | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 37e1437b65..f5850a2607 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -169,6 +169,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev =3D pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc;
+    unsigned int devfn =3D pdev->devfn;
=20
     if ( !iommu_enabled )
         return 1;
@@ -183,21 +184,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pde=
v)
     if ( !np )
         return -ENODEV;
=20
-    /*
-     * According to the Documentation/devicetree/bindings/pci/pci-iommu.tx=
t
-     * from Linux.
-     */
-    rc =3D dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
-                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
-    if ( rc )
-        return (rc =3D=3D -ENODEV) ? 1 : rc;
+    do {
+        /*
+         * According to the Documentation/devicetree/bindings/pci/pci-iomm=
u.txt
+         * from Linux.
+         */
+        rc =3D dt_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                       "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+            return (rc =3D=3D -ENODEV) ? 1 : rc;
=20
-    rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
-    if ( rc < 0 )
-    {
-        iommu_fwspec_free(dev);
-        return -EINVAL;
+        rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
+        if ( rc < 0 )
+        {
+            iommu_fwspec_free(dev);
+            return -EINVAL;
+        }
+
+        devfn +=3D pdev->phantom_stride;
     }
+    while ( (devfn !=3D pdev->devfn) &&
+            (PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn)) );
=20
     return rc;
 }
--=20
2.34.1

