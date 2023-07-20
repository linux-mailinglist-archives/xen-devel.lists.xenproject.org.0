Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0634E75A37D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566263.884926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHbA-0003g6-Bq; Thu, 20 Jul 2023 00:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566263.884926; Thu, 20 Jul 2023 00:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb9-0003OM-Lf; Thu, 20 Jul 2023 00:32:51 +0000
Received: by outflank-mailman (input) for mailman id 566263;
 Thu, 20 Jul 2023 00:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb4-0001JI-Ns
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0ffb643-2694-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:32:44 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JJCjt3031890
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:43 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgcw1sme-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:35 +0000
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
X-Inumbo-ID: f0ffb643-2694-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmM4Ni51K9+lPW5CTwQ3iRc6+CBnX1wRg4Cz9ZuCUNG0mesjkS7AFqOniuH5vWgKHFGhX8uGBfX6uRxPI+tUq113lzXDIx6o7aGSKNszlYm/7FQyoKSOkDlQkDSnzveGogU1xcA1uyIghyi89x/PmdPrkwUQB/osELWDFNAWnHMNLsyHQSya0eFSPbl9V+aYLvmzVq+snxGL1gjG3cWP7ahMgHEz6XKD190CoLDxrIR4bxoym8OqV0C9L+TztVr1ttOBaGXY8r7hnjJjt0tQMoxcgiTWQ0s/z9IiIQWNs3/bgXo12ioCgH8n23wgBlvOpb0qzI3CQZkt1tIn929IrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFkYMNZ/YSdMjIjhyT2BLIGgyk/+pe/n0+TIrOCbGnw=;
 b=dWUqfBegTH1Pmxrns1UUxQnJQYXDvFMhvxQyz1qXY3CDMa1fgzt1yK98MugOZ+FeBLIqlPDq2s6LfdJcKCm6vJwQ5F+U1vouTw6HCsBCRsvi6iFbjOKDVMwBg5vIXMJaiQQIYucCIF9QsPk3acl+Gw0yEIS9LA1G/ckbWDCsh5sPwLqWHNEXqAeguc3253RKi5utUt86T70hS4m1h2VReuw0/F4hiVjaQPkZfPcH7yf31qp10qL3EEN3rlkL4Yl8PYztuoCPNYXfIs8JCiA4ZIgmMIxNHIOn+dVD5gDMoYFA/hLJzN6sYyr9UletxZ4PwZofe8HYk2vCEq2STAl0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFkYMNZ/YSdMjIjhyT2BLIGgyk/+pe/n0+TIrOCbGnw=;
 b=rBMwZrAyw/RiXMDkWz+4L0lEW4IvPoG2jEgCFYzHh+e+jbksxL6rsUqk+ospORvrACCe6O0bl7v6A3sReEjZbAInV8Rh5PBRgl5MAGO+RsloM40rGpTczZnZ76r2U1w0bPrlPylhKHQNegLZMLMq5BKt8gqUJq0vh6uYdRAj3BxxriflVeR89PJL+hhIARSmfqMlz1ZGkTkg/PzT+bgBJW7amXnU5P3TsQlj2X49BkM3cScbCUmzKe5q86/doCZLLAC+/muTR+flxgvlKQAxcBT687WMuMzgM7NkCHLwTiqfF+BltbreJVkTQ1RcoWPbiYg1dsVSWg3Fsh4P9canRQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 10/13] vpci/header: reset the command register when adding
 devices
Thread-Topic: [PATCH v8 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: AQHZuqGsniCLpx4fUkKP62aGMajP0g==
Date: Thu, 20 Jul 2023 00:32:33 +0000
Message-ID: <20230720003205.1828537-11-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 8d9b9ea6-8c06-4c54-993f-08db88b8d09e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3nzE4mzoivnSuO+5z+hvlH4XcbbJTSxzQcGi/0oBuZE/ZtX0uiQzB80I6ojQxM2/T0zfufWs3qYBsURI86j4FFaT7T/8gyI9I0Lv9fyUv1PabAeHLbXgzohJI7CU/lzKcOTlfsBL6Yi7VCLMJCA4rJOcZCSCAfO4Yj/Knzbkz2IZv25Dymt3hLvCM2O+Le8pC3UrBMVwqClKK3NAPSnEsiNdL8s5BojczF0VlzNVM+lVacKDvyIWcaQTSWUhTDyL98RZdzFT0/UMpE8GTsDCCg6jow9YLcStFKln/9ros41ilo59EfpDy0ud2Y55rprdHMBkO8Wn3FzgFbooQjoGL92r8NKm/Szwi411xIRekasZ+lV9dZ8EiOkRd8mje2tRHek83ORsEFP0tvmThfL1HTIcYXlbaMneZj8U/1YgVMJ6F+T8884RM7sVaVkgifgyniQQudaGOV4TumB7HejKkIAbZXtc/WBJElpz5muDTd8F2fJUCKMmgCOKmAwpv/geTym0B00ZE8gwF/Bsxuw9VQ917u2ma5S1OPvOVBqmy80J9mfWKgc9oB2O05VApMSG2XATOx+EErszbU2ziT6BuctYZo1v5XSWohZdB9GnPiMALqBO9vgx9lVKVajVAuoX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ewHhk/zGIZ08Be8V9upuaLYFTiZDW2rx2zmulvCSzHmVwP1n5RLGZG7eNo?=
 =?iso-8859-1?Q?irKnXRA6SvJyBYpdXaBk+awdR/Xb9dmAIdYk4X0+cpg4rXhhb6qF0c44jn?=
 =?iso-8859-1?Q?FqpAUl0QlAA5uG1CelZUTwj4RGjXgVNeePaPhc4NZJU5xroUSOFAdq93ht?=
 =?iso-8859-1?Q?ZFhVMHkSCpSuBQHivInP1YAndm3BwrnaS6/hREsuzxv7WT9aSq7apqnVuV?=
 =?iso-8859-1?Q?/hyTIsttMXNW+/zzKR7egbaHmOVQn+Kxyzf5NJ8PdlWPznGbIkLUkLHhGA?=
 =?iso-8859-1?Q?WPgn/GqwBFr4p1BsRc7zwjeZHKqJLqHV2jJhNIUhYhcd8/42Ef/UnvUA9o?=
 =?iso-8859-1?Q?oF5cTitk7d/EETxtykqjd7rdCwZXL4VywHHVEmpYa8bKNTKxUvuxNAlhtX?=
 =?iso-8859-1?Q?IoQ8zl1MTAxRFZmuecBEIVg3rc39j/yRd3rQPM62Fgs0rXCcYI9FfQgkOT?=
 =?iso-8859-1?Q?TBTItiPL2jf6CVXk4uAFVrH5dqL/Q6cZ3nnuTB97e+ZHT0kXH1p/rs7xK5?=
 =?iso-8859-1?Q?uKZWQNMbVMvllwoLz44jpu09jF2uWxcV6NLlX+ZiHQyl8KoR3rEHZo586V?=
 =?iso-8859-1?Q?mAspX83Ihp7L5m8ei5tF4L5Fn0rcTegwZ0F4pUFv8gNr9OH+qnOehWtt1V?=
 =?iso-8859-1?Q?FgrQDKT2xAGDNciT9achmGgs1vtPyzLeumKGby+FLPR3pEhgm8Dxsm5TPz?=
 =?iso-8859-1?Q?VPeCtnjCPlz0pMiD3H3aOLz6GA333Tq7qpbO5Czk59OiiRPiZ+p0vgymEM?=
 =?iso-8859-1?Q?nnEo4XQ07r9fV5qzrbVxw8yYerp55cheat0ULFuvIeVDexkp1DgqHtSPPH?=
 =?iso-8859-1?Q?eGhpANjW94rMPIQtPD38jA8k7mI2DJnszAfM46riFTuvnO3eMHSJFl8Ps1?=
 =?iso-8859-1?Q?3i3dNB/7u4L1BiGtEXo1mLSZh9LKgpK6EEJe86Joqv1E/2LQg0KOGkgTus?=
 =?iso-8859-1?Q?QhBsQ+8Pjpjd8aFFPt/W/vEPOkNNPg5nqS/xIDmjD9xorArVETBweb7num?=
 =?iso-8859-1?Q?QXfgH0SVJT8M+RyvKQSY5ceCdxHUZIFcZr8S15D30trWxGylto/hmNrM7w?=
 =?iso-8859-1?Q?GJFWEyUobBlWPwvQ8be87l/ku/8bR7Pco0O2oLJk6UyhXXLeZYydjGQGuc?=
 =?iso-8859-1?Q?Ue84oFC/2kvufxHCQW/5EDm1Pp0PJyoVjVb3QrETyvm/6+kbJllAoA3Lmm?=
 =?iso-8859-1?Q?G+/JX0kkR8DpmFiU/EESykHLYXb92s8QEiCTZgh0wDCBF9gHtpbZSaVoFo?=
 =?iso-8859-1?Q?C7jVo1HrhfC3+P3/B493iLEFCUotXeZlUzFBTRNtDAZUOyOG86lzCO5tiB?=
 =?iso-8859-1?Q?6fNB9yQvJFrWhUvDWQO6H0EgOzoL4aey1KPfZ82sKhRcZIa9WrQKoBiZsW?=
 =?iso-8859-1?Q?rxwSQARNPTV0gd56MRuJqIgUuAbhSfQ7lgRfRM7yjoEVy7OzufUgf8B71m?=
 =?iso-8859-1?Q?gCn58sAlfElPtC3yerquTVSdnHLuP/GvnlxAk0A2l9drYObVW4O54EgNdZ?=
 =?iso-8859-1?Q?xTNZjAkmZ4kccyRZkvn8izsZVsSwgR7KjzQkHDj2z8sN0efXarcvWEFTLm?=
 =?iso-8859-1?Q?pjit8foO5zfYqMh1iNBvGIg/dY7qRWi/WiotuF8/mpckMIldGzN6rhR2Db?=
 =?iso-8859-1?Q?0fYrdrvyXyMj21b1Gjct9WpdEY7qJ+o43nlF6lwMD50c1WGLV5I64S6g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9b9ea6-8c06-4c54-993f-08db88b8d09e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:33.7654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wfDbTiZneEZiF7NSFGM1VA+CihzfriT78UIupWekvD1JyjNHFjuRqUOSOD6nO2R3WjDRzYmSR3EplkVheqrOqrRIVmT68tnBoHboBBmabS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: lMPdmvqFV_0bNMCojSfKJrzaUh83neHB
X-Proofpoint-GUID: lMPdmvqFV_0bNMCojSfKJrzaUh83neHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when assigning a PCI device to a guest:
according to the PCI spec the PCI_COMMAND register is typically all 0's
after reset, but this might not be true for the guest as it needs
to respect host's settings.
For that reason, do not write 0 to the PCI_COMMAND register directly,
but go through the corresponding emulation layer (cmd_write), which
will take care about the actual bits written.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- use cmd_write directly without introducing emulate_cmd_reg
- update commit message with more description on all 0's in PCI_COMMAND
Since v5:
- updated commit message
Since v1:
 - do not write 0 to the command register, but respect host settings.
---
 xen/drivers/vpci/header.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ae05d242a5..44a9940fb9 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -749,6 +749,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
      */
     ASSERT(header->guest_cmd =3D=3D 0);
=20
+    /* Reset the command register for guests. */
+    if ( !is_hwdom )
+        cmd_write(pdev, PCI_COMMAND, 0, header);
+
     /* Setup a handler for the command register. */
     rc =3D vpci_add_register(pdev->vpci, cmd_read, cmd_write, PCI_COMMAND,
                            2, header);
--=20
2.41.0

