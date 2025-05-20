Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAE4ABD9E7
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 15:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990757.1374677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNK3-0006Aq-RX; Tue, 20 May 2025 13:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990757.1374677; Tue, 20 May 2025 13:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNK3-00068J-Oq; Tue, 20 May 2025 13:47:59 +0000
Received: by outflank-mailman (input) for mailman id 990757;
 Tue, 20 May 2025 13:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v48c=YE=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1uHNK2-0005f0-99
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 13:47:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f403:2613::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0837a347-3581-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 15:47:56 +0200 (CEST)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DU2PR03MB7895.eurprd03.prod.outlook.com (2603:10a6:10:2d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 13:47:53 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 13:47:53 +0000
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
X-Inumbo-ID: 0837a347-3581-11f0-a2fa-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyCIZfCnQtoQUegrDrkQZrbhay7mQFr4R8mkaCQhkd6pZlwo7oILRu7cBzh5T1J774XYg6Gcxo3CwypCt+fhjjqbW1VPrdb1iXSk+cTkeAEwxsh3W8PQSxqKK0A4cWayFOMJ+p1IowN6fKLvbJBfCljHO/nno5aYSZMqZM1fvcShLsu44qMrDj5ZJtBJVLbitPbWQEO+mvbKzE08yjbv25Flr1nwkexbzQqqUlNLx/Q62fKUEW9JWRu8He0cZk2/hKf/m/yjlQ/MbvEfcQGNPSrultsf/89il1Vd+YX+jC6AehyJfPt3f8NpXDFzRXQ9qXNnADZkZWA1/gqdOrkSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gv320cKpVHu9ZqS2VbG6u2IhE8QZWqYFIV6gaZm8cCY=;
 b=WuoStJoNIG5GrikCy3wHaErPATK8fSFhlvRuKWs184Y6L5+x76bB8KHlFaz79xRKoUs1VMKIWBNOaDzFm/wK1QrcgjjXCSPf0aGc2laW0TEOVASW/gNNcJUSyUDtc2KAM90pufRJDy9v7EES4ZgrtA6d4iiYOxhQ6nP3tq09I/aV3Me0db3l21pkUoJ/T4DKtq4kkEC25GfPx3l55kEStOkbx+60iegM0Vh/rJVyz2jRx3WYZ+ctYrriTLUdbBU1Nyt8g9FfR89eXpOPixtsAUbvOnqLfxnI7m0oawYwJaejsMqazm+DoKb1Qioas0aRQe926mafGennOr62CS8znw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv320cKpVHu9ZqS2VbG6u2IhE8QZWqYFIV6gaZm8cCY=;
 b=JChDb1biAgE/O1SrAJq5rCF3Pd4PZDXhpdcxA67/EeUOHUaBmbJel+pHl9vFLmlhXCd0aERVs7UFMwdB2KSm216xChyXTqlVDsMJZK8DT4Jje78YCRfEGdNCYwZyrxd8eFiYT2OJLyetHtvfl+4O9rm+2Zd5nkebahkwOh6FpJbd2L18l9+3u1zL10Oi9cDyJoXubG1WaCCfYYfX1qHXssTw+AeSxI0obD29iPBDEH61Nr3RZscGPyXBGD9M8JssgGb5EerNs3atgmXLGC1aHQ0G0h1TNquMWR5TXr4T3v3q7O5CmUiA60ZEiOtX8euSwiqWCfnPGV8A7zpXG5QZOw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Topic: [PATCH] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Index: AQHbyY3It6QrN0GxI0mChLdwI1GDxA==
Date: Tue, 20 May 2025 13:47:53 +0000
Message-ID: <20250520134751.1460968-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DU2PR03MB7895:EE_
x-ms-office365-filtering-correlation-id: efcccdf3-6c3e-48fd-a8e5-08dd97a4eb4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Jpq4AqTrpyfJHA2TwT+vNHcGyL452IoamyfxotgOBHiM6qIP219K9tAMom?=
 =?iso-8859-1?Q?hD29FQBHs4ncxc9MvNZt+rOLxrsZiESEeyS5QiAR7DHrGooIiU0MVvnDV6?=
 =?iso-8859-1?Q?ggVe00/zGPDpvi+WCyTbo0hPF5WZnXfNUNNpmsMQ0Ay+XJLrkkNernO3kM?=
 =?iso-8859-1?Q?9bPj161uVIV9UzLRHzPTkG4Bv97CGx0XRb75xcj1U3zzzJ3tPAq4gHnV4P?=
 =?iso-8859-1?Q?KLaEG9Cy3YE+SOcBZcqUh2H7vuU47t6wI/SF4tYWNAg2aDpGLPglIeCgI0?=
 =?iso-8859-1?Q?Wxw2zHw2wU4Z7hCb7MxxBR3sV/U8v2VARGdJ8jDGV+T4gKURvY3CcJ72k9?=
 =?iso-8859-1?Q?csWS5es8Eec26v6y5sbBjg15iVdkSTAQ51QzMZ4my2cyZbc+WUlX+8gIgW?=
 =?iso-8859-1?Q?R/tdFdNxhSk775rEXhVZbtZFf0ZOvQEK5+3N6QLtBYLTcb9CPtZ+sJC5VP?=
 =?iso-8859-1?Q?UCh4FQyYLNBVmeF8B66tGz3zmh4hJgI9KlOdlD1d+dw6lHu6QI+V2z8TwG?=
 =?iso-8859-1?Q?oOgGQ2oS7ZVxlQ4JgMaFxjs0fWaSbrIR2Wm2ptXZ4W9STgQD/ih0VEVuIb?=
 =?iso-8859-1?Q?J7Ms5hYg3QEravNCJfkLFiuzMGbveI91RdHyppu/MvH1yrDt8NYpQUgQC9?=
 =?iso-8859-1?Q?EMPWCBAM1ItXr84LPFoRC4a37t1tK8DS+cbIrJQI05v2x5bfOKZxxbWdq8?=
 =?iso-8859-1?Q?B4WGEORqAvIANhE76yGnHTUSDzXJDEQznXgTx135LZGMSA8b0hqrEU0LPR?=
 =?iso-8859-1?Q?PrWt9UPJa9RKHzR1V6VeTmXV3WcGZfyrY1Pk5mK5/fcVhXDtHYCumUTNPB?=
 =?iso-8859-1?Q?0tPKX10IvOaGKQXXia4g9O5kji6icjMpXK6x3wsqVhErIPdLL6M77lXRpU?=
 =?iso-8859-1?Q?RqBy8/T/kfILyZP9B5xEbrtk8Azh0km9qtpb0I1docEoZ18DhKiF01sMKM?=
 =?iso-8859-1?Q?2P4xP0c6PLVWv8BFVvybMVe7ATtdNZK0+n/wtld3etHPDssCnXwOuUl9LT?=
 =?iso-8859-1?Q?qqzARaIBAB4CL9V/17rD/UzDra5NbyAAeRTfAbZ7QCLM5uw2Y+F2/pWrpk?=
 =?iso-8859-1?Q?1DeGI1DusjzsmWA+GV22nWe06dUnsQv6Yzb8/F1c2FCm2QQpkTJdGuyFsu?=
 =?iso-8859-1?Q?eYUpaBFI67IrAXh1fjQYUJ99Ziagf7SMEZfZ9wIsoK6p0zht6Wkn9U9ueA?=
 =?iso-8859-1?Q?3tIgYs2JsBFqVAgjww6E6+EmAMLMS3rvcsWSWafJ4h1cesAhAIw3iCXj12?=
 =?iso-8859-1?Q?R0SHAMHins+EQRduiDEiFtfBhLDQjzMwBWsD5md0ISkBYrdPsNSGGndUUs?=
 =?iso-8859-1?Q?GbE4fOe+c06iH5VumvmwKHJdGflkEDwyfiIX0hOHnpuhdO8cetqRG6YxXm?=
 =?iso-8859-1?Q?7ZWTHpJQjEvn56n3kSa4mOheoBaIxjNE23JSg4cxxtbuIy+Fz8gBFq1BMk?=
 =?iso-8859-1?Q?R76BsxsGQnLoaIPXN+Yof6j/vZqZ5ZHMLvdILmESVml9cemP6gZUFMKpeN?=
 =?iso-8859-1?Q?BXOA93VIn5rWve2PuV7b5j3x2G2J0BsTN6JMjru1FIM7fOxPLr16FCrIG0?=
 =?iso-8859-1?Q?VLyfgtc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZMUdmgI4Ry5fcsgadFSwq6EqIKm593S1x6aS7EZEzdsv5Zks6W5VrMmKQc?=
 =?iso-8859-1?Q?j1QfEexUiV+7L4nR9NeuuFGKmom/flGyh/moYFi2414UzTjT2h3cJV0aUq?=
 =?iso-8859-1?Q?KfGLWSrB9IB8DOd6a5sO5UPCiwuAXgw8ZG10RQXsn0g7yyGKdU7aBPttSH?=
 =?iso-8859-1?Q?aNh1yF+Dn9ZGwcDK3LCkeikvv2yIcYhNWXDbNYgiXMM5b3hlF0QLQPj3je?=
 =?iso-8859-1?Q?jW7Uy9KcSyPcVH0b7dS46nkJF3Thmd0H65XnastgLcqXt5ufx4jujFJIuK?=
 =?iso-8859-1?Q?fg+uop0d91Kj9BPI45riZdU9s+gkf2pD6WeYDjuPCrzP4E2VH/1FOoXUhL?=
 =?iso-8859-1?Q?BgWcJN8RlLvAMO2ZBUeVll8Aqjxe+d/QVqzI5lAGJqFrGeVC3+4BYYHA8G?=
 =?iso-8859-1?Q?+REZDSdMdsTRtLJkb66CXCn8mviJiL53V+lVMqthuw3Ox+EwsispguvZB4?=
 =?iso-8859-1?Q?zrHA/CGfsUg8wznFiJcpMz6DL1x0EJQU1iRANf19s+Km2EqtfCeMv+WYr4?=
 =?iso-8859-1?Q?qNePMrHttGopstpZjI2iRSvMtPB1IXy6eFFY/Mz4WadNfkHryBcoSTXeYa?=
 =?iso-8859-1?Q?SDGiJOmTnBhfp7/ZiHdPiku3HaHiC8dffIjoGna5nH0s8MPLzq1wOyBNg4?=
 =?iso-8859-1?Q?pb+J9q65ihFxK89uQR8L8gqKMnT42c6kxXlV1DW4JRifpefa3+8pFKpTbn?=
 =?iso-8859-1?Q?wMZVw6OvClFVmuF7wbNoQ+5UjqKxjNPePY/4lzjnoJQyLdVL5xuHUrdTe3?=
 =?iso-8859-1?Q?UbC4lLYJx/E2tubPiPpk3SXVpggnDQkSaq0npRgJ59n2K+8zrTDR//9wUr?=
 =?iso-8859-1?Q?7fQrLVqrTeYSw6u29z5lqMNligYj2VG3r/30YViaclb+dGlMRJdq+22/0i?=
 =?iso-8859-1?Q?vMgUJvkZbdL0oXNYNhrRjQwsi4MkfHq4kAIlPMqDkrZA7uI4QrdN1CnM8c?=
 =?iso-8859-1?Q?cApzh+IcIOWuYIsFYz04pTpunaVKFYl5hKMIHah7iPne7U1EHnO1N/EknD?=
 =?iso-8859-1?Q?0ccYli5BjT5KkYiXZ3ByCB8skMztlU4CXL4LPjmwhMK3NDOhO5IqMOY23V?=
 =?iso-8859-1?Q?dpIqscWJWSQY4vpOC/Qqb5jPLdR6TzGiJr1G0agP2Ro7iSegra5aKdSQjB?=
 =?iso-8859-1?Q?Rt7Vla4n//LOzInDcY3A2OfVXelyVI/JVMDGs/OmLBfjXLOQA4sqH8oXsP?=
 =?iso-8859-1?Q?hLYPBGSPVrQ6x7uvlf2y5KGdyuvFGeIrj5uVgTH8kS0BW0dhykRb92cNz9?=
 =?iso-8859-1?Q?BpZwmeO0HOohDbpR4+nc91JWF7YiYzui7f+lMEGFacAEZqDLiN9jd2dS9f?=
 =?iso-8859-1?Q?iWhwrrl3raCCgUzwerWbco3rra/N8jnBBhsXpsbtAvRuhYg8fmDE6PttTL?=
 =?iso-8859-1?Q?OntxOkp3kj8gfXDkpR4gNv/idnUIUVkb9dY6tOHEkgVHox33DCo9mkpFX8?=
 =?iso-8859-1?Q?FkrTitlsiKVzxnXwtA+5sVdisMSyT9obZ8m60DLgtWBmxnyEbA25f/36gl?=
 =?iso-8859-1?Q?mydwdGCCll2ExBkrsRT4xpDxptJWWIEQj3lW8E8FVZlKYwRNYAD76TxJYQ?=
 =?iso-8859-1?Q?buWJBu1cGjw6QO9kAdW3jFV0hIlJK8lyZ2ezbHgGL00cRCwVzx1XG6Qf2l?=
 =?iso-8859-1?Q?jsDSGwo23FEsykcUWKDnyoThTNiPx/nJG4dCAwTNeevryRhPXrP52UVTsB?=
 =?iso-8859-1?Q?PP2pTb0aJKGxCBcRkmo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efcccdf3-6c3e-48fd-a8e5-08dd97a4eb4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 13:47:53.4049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OE2tdP94gOaewCoM/GnU7mDbK5vGWZstJASJzUm6AcdkyIUgxSoA2lpsSLRo/U5y1CNoUivpOGCYtR8/5VJCyXDF1ZQITBN1M9IuGebR72U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7895

An attempt to write access the register (i.e. GICR_PROPBASER, GICR_PENDBASE=
R)
which should be ignored (i.e. no virtual ITS present) causes the data about
due to incorrect check at the write_ignore_64 label. The check should be
inverted.

Fixes: c4d6bbdc12e5 ("xen/arm: vgic-v3: Support 32-bit access for 64-bit re=
gisters")
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 2eaa48fadb..b366b046a2 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -649,7 +649,7 @@ bad_width:
     return 0;
=20
 write_ignore_64:
-    if ( vgic_reg64_check_access(dabt) ) goto bad_width;
+    if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
     return 1;
=20
 write_ignore_32:
--=20
2.34.1

