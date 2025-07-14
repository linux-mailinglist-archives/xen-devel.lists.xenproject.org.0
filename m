Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35986B046EE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 19:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043029.1413144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubNMh-0002NT-Eu; Mon, 14 Jul 2025 17:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043029.1413144; Mon, 14 Jul 2025 17:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubNMh-0002Lz-Ao; Mon, 14 Jul 2025 17:53:23 +0000
Received: by outflank-mailman (input) for mailman id 1043029;
 Mon, 14 Jul 2025 17:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UiLu=Z3=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ubNMf-0002Lt-1v
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 17:53:21 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d324c96-60db-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 19:53:19 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB7734.eurprd03.prod.outlook.com (2603:10a6:20b:404::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 17:53:15 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Mon, 14 Jul 2025
 17:53:14 +0000
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
X-Inumbo-ID: 6d324c96-60db-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/aW4Nxme1W44iWG8ngMFMnRFq9/CZy7pG4aomYHCwEjGtO6h1xTOzGCz7RhJKicYI6mMFuee8ynTamoR4Od4MFsQLxRqigRwOWhtNk6O+dcKW6BajtwSE9DojAPbHCcWtVBJ3awj4SBMZt3d67P9O1y4Zfj39kBZNBsqaXF7PJy0zHybv0rwsEhble3VDLNErnNpSr64NWdHQwiFGcuHTth74bZUBS4eUSCJKL5eoGH4Jm9u2N9/mL3tYn4i8AThEHhP94rIlrRunxUAVc3wZSHCx7LnX/TllHrqHprwM2jycoCpSW3SE/pERwbM2oklNKYLYHUgId1u8DdjVvjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFKiBeev21Qa6EzGoTQGtypb6+5ZM89P/3NeVyRBQNc=;
 b=A+HFpB4HLZeT3xN4urR5DA3BBeAFmbgmJIVUO1Wg7WVGSpXH6NYiRm09E0KXYYrnkfcem78Qdma4oPzYTm1/tb4pVnWteLABwYU+sxsU/8pEa8d6PmQFz832vP653bX56HCsNg8zfuAcNUokMJSNW/r8XUYQEyAOJigDm9jzRa8b+RkVXo4g/DZ2cm7ldsq0js2UmQiuY78VFbkV2Wl8oIyiEkzX9GRtvYp8++8OpmgOQn9m/KMOxsz8Fqy/n6A4bDfhcw283dZOLh7dEi+Sp5UJ1pj1GadUXuh0CFwzLpif3yQBA24xACiL8/hgpay/2K9WDQe13b7/JYKpk84w2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFKiBeev21Qa6EzGoTQGtypb6+5ZM89P/3NeVyRBQNc=;
 b=APtmtVjTpyZM8+AXW4oJb2lPoi+IDmOY2klokn47oHeReVPY3H4MkTdvIuFVDGwXOA4J800HHLSqQGsRXDREZBe8QKOrbFB3U+kT1c8Ud8p/vxDNe+xWxTLrpJ6uhigqYDrE+9aakR3+vlFpFAnYYo0SckXuusLSt/kQSsFnM/wkrAKAi7ADPtrQT2RDffVDCLz8V3mLvjv8zJ2FJ8mQwPHkG07LMic6BFI8Bu75VIYtbtIb2shKLSaFb2L+UVDPjHsHOFdSok+Vbr8ap8xQAcKC9Zc96+H9nZzwneEDsdxrAPlWrSA9+FwWNNzgB3CTfUy0+WL1O4wvqNya/nIywQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v4] misra: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH v4] misra: address violation of MISRA C Rule 10.1
Thread-Index: AQHb9OgsRqNi5WFnCE6c8dgGwDI16g==
Date: Mon, 14 Jul 2025 17:53:14 +0000
Message-ID:
 <5da6c3af9bf59e6116fc57f48ec7612883771f0b.1752514332.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB7734:EE_
x-ms-office365-filtering-correlation-id: d5ad07ad-f2ef-466b-5120-08ddc2ff4eac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0s6g7sfPhiOvmbS9nsDFcsGom3cpTzKO77mvDI7d4rAkuitupFDRKRlUb7?=
 =?iso-8859-1?Q?G7H7fLnVMXiXYU+czSfImWoUCMv7fqKTjMBnaId000azInM0ckI+30lLHN?=
 =?iso-8859-1?Q?iamnchwKLzw53VySoZLAEWfi2+kj5v8nKXsMYEsXGxXtSgROw0zuXI4XGk?=
 =?iso-8859-1?Q?xs3yNc119/ijhDyS0olqB3Z/KdiB6MJrlr97NqbhnZ9Isc4qafuqriupWx?=
 =?iso-8859-1?Q?KO4gOJ8656Q2UpZ0UTMmFohbNGbeWOXtYNz5MgJC6J6IacKd1/gQl4IUgS?=
 =?iso-8859-1?Q?O/qwFby8LtVeocchmpe5MkeRk67dtBWAZPWVnr2gFbrxIH1C2/u3UUHRBf?=
 =?iso-8859-1?Q?p+SJw4EVbkMSkUwsNU2/7Ztp7krBu6ilkZmZF3KX4dCAHlh1JD1QrVL1uv?=
 =?iso-8859-1?Q?Txg2FlRFREbX90XhcxHl86Lq3UB/4PGmW/m7Gxq8Q5ctQ24+aZkp0zu+RB?=
 =?iso-8859-1?Q?wh5vEvHDpukOg3QvGUN5VfSGrTVuFOMfFPwtq45c2Lzh9frcq1+zPbSfiI?=
 =?iso-8859-1?Q?aFE9rvIpzO6CqnKl7KThHEOmA6P3iIda0J2Gquo8ur6phnB65DyfuV/9wF?=
 =?iso-8859-1?Q?r+Lb/mB3+nQxNZrDmvmORUerAnhJhf39Nkf1VkD+ADxDjkQHIfovDUjPCM?=
 =?iso-8859-1?Q?O0KTIbV8psthib/XWkU+cAZ5v09bddc3a8OKOLbRvT+E5EQPuizaE6CJux?=
 =?iso-8859-1?Q?mrEhbuJDrYueUcifWtGCfiAiBDgskmfdVKMKzoI2AnBT3DW2vi6JCU5ZfM?=
 =?iso-8859-1?Q?56esXadups6rKg40j1cSw5feFnwtOSexjwDZooD5aRKVn0MjUk5hseJ7iF?=
 =?iso-8859-1?Q?zopdov6/OMDb8liSVb9WfapaBZKP4TVtwtSY3ggvuj2rGESJU8GgzDEfWW?=
 =?iso-8859-1?Q?CAm9FkJ8nDqfhpoGB2hQBtv9hTAGhwh5jDoQhC11+9DSHSIV1vxk0u3t91?=
 =?iso-8859-1?Q?4KTAzVC8Qw1DeMqXJNOLtJjga4dHnD5qqALzD/iFddedmZzJ+HaHpRCIy8?=
 =?iso-8859-1?Q?LleS8OQUbXUhLOH8jz/Y3zOnkNoYIoflKLNrsZ6qyk/qHl0Or5THr582VY?=
 =?iso-8859-1?Q?vxD30gpqF6NUCZcboaabaCoRi3ODIvbE8k3+19FaKEPZj3HMJIeLxev1rD?=
 =?iso-8859-1?Q?nlY2ykvyC6s4BBSS/X8pWCqz9fRmq2JRGd+8esxC1DZMXveKx2H0wFKT9A?=
 =?iso-8859-1?Q?fZjDckRPLumxWEgH3Q+be9BaeOgsF/SzgCQku8kqmFrKJIUzVNvVpGkerG?=
 =?iso-8859-1?Q?ssWJu1tqXltC1VX3UBWKbIqpQpYDLYQgvH7/wzJATeVBkgOrmc5A8q69l2?=
 =?iso-8859-1?Q?FdEt7lZMugTgrLjQR8Dt5ttEHRezWoWhjlL8o8q0b7LrcqoNAasapDISYo?=
 =?iso-8859-1?Q?JhskX+biX2qZB/+f7GFQmBhh2O9NB+ZpAROzCOi9b/Su4HXfg/6mexVIvW?=
 =?iso-8859-1?Q?WkAMxxUyhWXw1Ohls20nHWgPnUC2/ZJGVLAGfMI0rxdfG7bARajxSqRP89?=
 =?iso-8859-1?Q?0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sBmiA53fMkY0fQAbrz9ml7d2C7bLlO1/VzciaCMw9NYZIBsLdjIKC/DGJj?=
 =?iso-8859-1?Q?lcAIAEEk5hS2jD1wzdnXYifNJhuCX+s7nnk1JcM4y76vvVTK/JXSTKyaUS?=
 =?iso-8859-1?Q?bi+nf//OsaYBbk6u+9loS9Rz2iUdPokfQiiOj41Rqj3dNPN7r3VYPQrCuo?=
 =?iso-8859-1?Q?Mg0FlsZDMCSvTn7JRej2MOf+K990ZyrA0PfG1GN7oDCxVOoBFG+KdS0MDF?=
 =?iso-8859-1?Q?rRMp4M/rSVjtbeyRfJQV8zH3XD0Ih1zpQuhDUNzoQbVwgQSfcQq0fhsdSr?=
 =?iso-8859-1?Q?wAqN7ANeKoPWD8vMRD/rspOlrSdF6qCaO3Zu2bDY6hCAzsyNZoGmJDcXKg?=
 =?iso-8859-1?Q?z7LGs48Rv1X1ArRIHdao4VgSSYzLp9dp6wOlzH4864E8VoVRiXlMlmT2Ch?=
 =?iso-8859-1?Q?LmhR4mhWg5adTPFiLgQqT2fAsAp57KhlnYVAWht0zctXfHtP5KfK2FQEE1?=
 =?iso-8859-1?Q?EvcXCTXObZSa6IIEJ2SWzBZQ4wy6r947cQZzWklf8VM9/GtPOHM0k+G1Iq?=
 =?iso-8859-1?Q?tt+wMd6/xVy60l0J734vXGiS4DPXecxDxSwoJkXVH6C0xPSoecOsPLaMJ0?=
 =?iso-8859-1?Q?CgdHPGUZfFgMxpu+joRes86t9fzG4EAnpDK2DrRd3m4oNjV0dku3rIeQ2W?=
 =?iso-8859-1?Q?lWYWdoV21WYQ/UKnaywfhd0zZUxfpss2rCBYZsPm5R1ggCpEMQVjMn4Dwe?=
 =?iso-8859-1?Q?Q3gxHkjvur+7s8grv9sjtFuP1wxInZpuVvJRXOWrjVSQG/L6TmsvDiXfpF?=
 =?iso-8859-1?Q?La77FmzQpSlVa/obkG/fR3zrcg5wUOGCsC3tPpjJtE32Azs9G8fX5xNAq6?=
 =?iso-8859-1?Q?k4VNaVuvxpKglysl11q/oEYveCKv652F1dK8Rdr4zW3miqVbwGS8nN1a15?=
 =?iso-8859-1?Q?cL238HquYvQ8jrT44O1wnivZEhPtN08V1gsREyAxD17MGvmaTM/CAcAeKw?=
 =?iso-8859-1?Q?7RLzAG5F18E7cjuwYoKBCRKK0PHzK/okIb1kfEyAEtQgZRb3AaUtxqeTtx?=
 =?iso-8859-1?Q?krLSfa9MCl6qLTdA+qlH3EwqIxCVTD38RDCT26mFdZQViAEh0WsfstfsTy?=
 =?iso-8859-1?Q?+uH0T3P/+o4KvpEUvsVd+w3AUwCWSBqTAJDGnuoRbpiUhHWQNb2m/4jnp5?=
 =?iso-8859-1?Q?UMvtdaDRTRl8uHjhNXFoDBrq3saDg5VfLlnVahoErT8x7lkJ/J0Wdl+lk0?=
 =?iso-8859-1?Q?HZJ3TSeiu91MLOjs9lzh5HnAo5/7DuXdw4keu3sVSqAzFC9mk7Q08mbt37?=
 =?iso-8859-1?Q?Y+8ktISfDFKyhx7/EPlBY4XjHOzssP85B3zZN5CBcU1XTbyeXzQ9hMy736?=
 =?iso-8859-1?Q?6B2jlQBdBmtarNdhpzTancZe2QGFpvPcrMFsC0+1Wt/mnVqedq0Em0RqD5?=
 =?iso-8859-1?Q?16bmXTyFE9r3es+0o2gxalWc3erRjl+1a0L38jJx1ELaAy3rB35/3gt/L1?=
 =?iso-8859-1?Q?w2Kb524BLlPSkFwGVAhh1lhiFyMmffYtvxHyUnbqIRTdiCX3OZKwFwJHqm?=
 =?iso-8859-1?Q?iF1GQWcEBnpOZ/e4Iicq6NBFoSY7mOu4wATKH0zXhnsL+uoLw5YOivg6yV?=
 =?iso-8859-1?Q?is7eeiKLbOgaiBojbv3s88deIHSUE15hoT4mJykob4LL750bvpudavquoA?=
 =?iso-8859-1?Q?98L/stgTLtjXhRrtxe7cnmyAnbPMFGOc46TAizTj5YQS35otDRpE3Wmg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ad07ad-f2ef-466b-5120-08ddc2ff4eac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 17:53:14.8388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgzVeDH/f+VnrqrPkRvmK/jjQowZJraHUndBZIGJTT2/TXJrl+TxJ1uKEQRdXEUh/FMihhnVOUqzQ1t39QnXVU6lp8y9aeh+2J+ujRL1N2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7734

Rule 10.1: Operands shall not be of an
inappropriate essential type

The following are non-compliant:
- boolean used as a numeric value.

The result of the '__isleap' macro is a boolean.
Suppress analyser tool finding.

The result of 'NOW() > timeout' is a boolean,
which is compared to a numeric value. Fix this.
Regression was introdiced by commit:
be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen functions.)

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes since v3:
- added a SAF comment instead of using ternary operator
- removed pointless cast
- updated commit message

CI: https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen=
-project/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/106781=
98209/PROJECT.ecd;/by_service.html#service&kind
---
 docs/misra/safe.json                  | 8 ++++++++
 xen/common/time.c                     | 3 ++-
 xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e3489dba8e..964f8344ce 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -116,6 +116,14 @@
         },
         {
             "id": "SAF-14-safe",
+            "analyser": {
+                "eclair": "MC3A2.R10.1"
+            },
+            "name": "Rule 10.1: use boolean as an array index",
+            "text": "Using a boolean type as an array index is safe becaus=
e the array size equals exactly two."
+        },
+        {
+            "id": "SAF-15-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/time.c b/xen/common/time.c
index 92f7b72464..c873b5731b 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -84,7 +84,8 @@ struct tm gmtime(unsigned long t)
     }
     tbuf.tm_year =3D y - 1900;
     tbuf.tm_yday =3D days;
-    ip =3D (const unsigned short int *)__mon_lengths[__isleap(y)];
+    /* SAF-14-safe use boolean as an array index */
+    ip =3D __mon_lengths[__isleap(y)];
     for ( y =3D 0; days >=3D ip[y]; ++y )
         days -=3D ip[y];
     tbuf.tm_mon =3D y;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index df16235057..4058b18f2c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -315,7 +315,7 @@ static int queue_poll_cons(struct arm_smmu_queue *q, bo=
ol sync, bool wfe)
=20
 	while (queue_sync_cons_in(q),
 	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
-		if ((NOW() > timeout) > 0)
+		if (NOW() > timeout)
 			return -ETIMEDOUT;
=20
 		if (wfe) {
--=20
2.43.0

