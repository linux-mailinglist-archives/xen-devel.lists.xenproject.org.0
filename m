Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558CEBFC517
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 15:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148087.1480309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKO-000891-SC; Wed, 22 Oct 2025 13:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148087.1480309; Wed, 22 Oct 2025 13:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBZKO-00086w-Mc; Wed, 22 Oct 2025 13:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1148087;
 Wed, 22 Oct 2025 13:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J7Y=47=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vBZKM-0007mO-QI
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 13:56:34 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea15af82-af4e-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 15:56:33 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by AS8PR03MB7207.eurprd03.prod.outlook.com
 (2603:10a6:20b:2ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:56:26 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:56:26 +0000
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
X-Inumbo-ID: ea15af82-af4e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMY3PpVDSvx51PdS7R0p6hIiC6DzOEWdBqvhDoUj0GLDMs6SEFzi5TELQiPKWuyOJ0uMBiblyHK9b/BqM1MXXVnqc5Wx5QwflkXsXPdMiaxMqjt2ekbQLEJI4npJAB1JISPuEadEmu7dgbBVcpvB8zALa8u9pWHsJRRC8p0DaXmo/XoxSeRN6XlVZlZsoVxu9HXf/i/uhqPLlfOhHOxjXhbuCtaHJPy/NCn5zfqLAQntwAEwxjHKPaEvCUsiYTC0S4+mH3Are1z05hfgUeKgl2e3BH0IWMKB0DJKXAMacjiP8wclqD+Aw0ctW33nMl1dljFb8lXHjCZrUzMeMyajNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV3ooUt4bMxJtw+E9mpooKcv/os9pQmtGpE5zfwbG5Q=;
 b=kqH8yjiRe5p6yZZHc1qspKpvlFIz3FL5WUl/sVtU0Aj763VrhZe0klktY/Fmd6kYLtI8ux/scs0Lw+AoUSsAlwh1nmdimnMeBYD9j1mB1ZY2/yZJzFuoHlm7NDUoqlP6qW7Vc/+tln0sE8wL6iTa8Sh2QEAQBgKMtyHh9mS7qzwmRLz8EYk2gDRS2bGW1KgQuiaknq3DVvu4Z8KaL+XoSx9Agz/8w+nikbWkO4gQjUhJe8aHyjK1kFshhai/E/UuiJTCYVakDbRMQG5TTsLBYzLmtW7f4Gj0jq4mXXRFmvgCphbV4FlQFDZFoZehBNpUOM948QCoFa63LhrmpTmGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV3ooUt4bMxJtw+E9mpooKcv/os9pQmtGpE5zfwbG5Q=;
 b=BhHb06vA2NdMVDbMwCWv8MUObJkwdQlDNLCow7XkLI0iIy4e+4MbZDzlVTG909sHri0Uo0wgXzvpqO/7gBtLG0wjNNu/rf1hcLvv2jZPH3KAcsW57xQTGuFjis0pa/OFjVHjWanGG8SKFFFhraAE8HDZbxzwEJX5Z7NTp8kX0WiiQUjY0x3LVPNbO7phJvt114MSINfyneNcQ/XbnehNCttgMNHV5FCclI9HYuhrZg2kqTvDNysYqHruQCUvX28mKHpLL3V/cN7cZcxhO3VsSe0qDVxWcLagFsM+Y3eqg+jxE/0EHwJE55xX9ngWqgreCz9gIiywx0o1QM/VOugXVg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 7/7] arm/pci: enable vpci for hwdom when pci-scan is
 enabled
Thread-Topic: [PATCH v2 7/7] arm/pci: enable vpci for hwdom when pci-scan is
 enabled
Thread-Index: AQHcQ1ulGNmnLElVGE6aNZhUnk8W2g==
Date: Wed, 22 Oct 2025 13:56:21 +0000
Message-ID:
 <854d66486f316a6449a422e72204e870cd1933f0.1761134829.git.mykyta_poturai@epam.com>
References: <cover.1761134829.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1761134829.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|AS8PR03MB7207:EE_
x-ms-office365-filtering-correlation-id: a738e794-1522-40a5-3b37-08de1172cad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fGCyB3/1ttJ4ltfN4EdegW4mylaV2y9iOMPd3AsMYzmNNSJZ0oqpdSLl7F?=
 =?iso-8859-1?Q?UfuZIiLk5O+poXSUg2siz+TxoGlOUvLMKhyQdHAA/rfmB5Q7qiJ1Cr3ixY?=
 =?iso-8859-1?Q?YUATHXMCVu1gK/Mh8CfnZjiChhiY5epInz5zuonYwqgMf6BXPRxprfVhe9?=
 =?iso-8859-1?Q?dxknkuyGUXN48MBCccWADYbD/wiJLre3Sz1n1q6Byfnprxg2YtoVwjitlp?=
 =?iso-8859-1?Q?2KLT6EHjng69hlK46gyaIV1FKUIjw7rVEoNX4OTAxQHHMyxtT4z+prNeMj?=
 =?iso-8859-1?Q?cWwafiFipfvXzV8LnIWD78bhxOQoHSHh2yrw0FAiNpvn8YGFILBMr8Be7X?=
 =?iso-8859-1?Q?t336CwzULOC3ftRjI7hC8n+WlEaOeyReVEHPsuUEm1MlidNutcdbninMuB?=
 =?iso-8859-1?Q?eSUfruthDUf2R1FSc4U6gFuR5PJbuB1PhKhVfJMwVCFrKfpwEXGx/Vo5VI?=
 =?iso-8859-1?Q?x4En59BFceyXdYAD3NkJLmcF07i6RxNA/23JXHZzp6ilgoaiqb3hxhtoaj?=
 =?iso-8859-1?Q?Tafdnss68GEAp8jq1O+ANE4B1VdLXCQDaqz1Vh7/3GpdwA0a3xW8cLGDfL?=
 =?iso-8859-1?Q?y01aJVnV6g4KYw+aL6GK3jDZfjPu/vOAzVRr8VIkZUFie7eZwf+EdTqxaw?=
 =?iso-8859-1?Q?ia8BvP/uk5jtj/h20k3BA9/O9t6YsCZso6Qppg2mOiE5scE+fo9Scli2fg?=
 =?iso-8859-1?Q?ZzFEIMJzS0Wqry9czJ/7SARsgiFfbe9rGEtvCxxzk9ruO+LZ3Pu3RmVb1E?=
 =?iso-8859-1?Q?/540ybBIv4oIB+NE5hglrgJKiR+6G5y/5Vvf3duq+iu5sYbc+djrXTcaWd?=
 =?iso-8859-1?Q?TV32xGEe5uFrImdT6m4oprB7ZbTdFYE2yQyDk6D/2rSUJ11sE6TVIpAi4b?=
 =?iso-8859-1?Q?CSuHnL0O5VL2Ex3PYd+BzqLBR0GKCNczJdGLyDzb7x1Q83mDet+eEaiZav?=
 =?iso-8859-1?Q?g1IRyqUfPWHEJ7OeGVzSHq2krBi7rPFaC94T6XlzIsE0kv7kyIe2kfNDuz?=
 =?iso-8859-1?Q?/iI7uf0DcdJ68MbjAVP0k5xQo6LwZg9y1UGgeqvBN8+/LWKsegGyaWE4I3?=
 =?iso-8859-1?Q?aNPAYxTBYevB3G9+PsI75gda/eT3cim1QBBOMueLH3/sN4o0osFKltmG+T?=
 =?iso-8859-1?Q?kwOCRhXnT/B+8vSooDMwL/3HB7N6LBE4jTcXCzQPV/V7/TeX77P1kUwdo5?=
 =?iso-8859-1?Q?0JddzFYs4u/TLrqi2zLnxsNmlZdfmGN/3GAHsP65ABfNd+eKLrDGYrnBni?=
 =?iso-8859-1?Q?ZMlW1qzOavdX6vUo3DfebF1ryza2mE0VMARALf4NcnETt2YFZ8TsVQyIrW?=
 =?iso-8859-1?Q?/0JaSaacPfY2Fkf6r2Tbp0WKsxSpChB6Ei1wMsrPmOciFkgoJHDH17Ioj5?=
 =?iso-8859-1?Q?ATnxW9fkUZ5jKKwoqQLpUEgH1pjwxDNY8qnCappOWLtOPx/kB3BqkaYq1T?=
 =?iso-8859-1?Q?+GZtVFNMclPuzT/l3QIs8S7Ka0uqgCb54AOD1KkaqvP1s+3E1stm63iSqo?=
 =?iso-8859-1?Q?623k7RLY4VDRlueDioAJy72dNUKt+dBc0+AcQCt0tB5VLNs/pC/khZz6SN?=
 =?iso-8859-1?Q?4OAUWykOCCK7tgp5m/uDcaig3q4M?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CuCmb7cKEnQ/FjX8MVE1l7AX/xdMp6OKV1nQTvMwTbVqNPgk7z2ws+/k2U?=
 =?iso-8859-1?Q?mdJlAwnVK0opufiuzRQGcMCxjm40AjeNhuAbO252gYi+IV9JafcoUZcQ8m?=
 =?iso-8859-1?Q?13etVRrByGCVDmRa8kZ0ofmEL6qM997lUVpsKV+3HfSMZl+VsdX/md7d4S?=
 =?iso-8859-1?Q?KuBBASW4MzLw2eTXWEeUz917QqpQ+ZIsVVK2nXVv0CxhcMBjBjEbLHUOzb?=
 =?iso-8859-1?Q?AHRD+JkgDGqbGxmImJl0L49H25/krK+qPmOxLxWaG9x7fMd1hTwnAC0jBp?=
 =?iso-8859-1?Q?pVNYf3IzfjYFJ4xk3TGtYCYDQcxbiTHJkRouB9+R+0xHXhlYLU4mlX9/FI?=
 =?iso-8859-1?Q?bw8Ioyg0jjdq0dFS0cBynzHEy4jV9CLMxr/DM4+nThL3uZQB2RTmVro5g3?=
 =?iso-8859-1?Q?ytMrBHbRuJHMRflgUyqjq2qx6yOFiKaWl37Xc93CuXuZpyCytTUcv1CZe3?=
 =?iso-8859-1?Q?goqtaaX+BGHTCnDyqcfcVKlztaqMVJ7XwrMdl3gaUc05NI70wmOpk9rkxK?=
 =?iso-8859-1?Q?QCim+QCJCQOydfdnryD//cmAlHsbAPo3F5k+urmgjbyYDCkSLchMfK9p4L?=
 =?iso-8859-1?Q?0g9++sEl6jtw2/cpZY3gipqWZ7Dk+Oz/sAjfFCcUM/yOdfwu1FHcfsx1SP?=
 =?iso-8859-1?Q?quqK4FP7Mtuh00JUQv0+4X8Dy72sXNONMElydZDiMzYD666RNOfYWjroXw?=
 =?iso-8859-1?Q?uCAvzFNO2IFCZc7a2TJ7zd7ldyLhdkF1J0+7L+l1GOVsYBFag801nYq8QJ?=
 =?iso-8859-1?Q?he4KmVUun53akxPk2HnAlJT1l3UrT7VL/bI3RBgwpcBXmFRoVKVyc0sHyR?=
 =?iso-8859-1?Q?ZgSCHIRLHv9ulB6LoIcgOtMYvdIBABMkqkgvoOrNGF4H8dvqbw0fl+fWn6?=
 =?iso-8859-1?Q?DnMQG+b5WEy932Az28HNdIb/xDQVRFKSCssgjLsYaq+W0MYv1+JdALgK4T?=
 =?iso-8859-1?Q?clytvxD60Y5IyTE61ALK6VsZ+ML1jwLpHHnDD91m29PX+UsOU+CPM/hxMa?=
 =?iso-8859-1?Q?BoRiV33XZc/4OSXZTSp7Pjbc/RB1V+3aT8bIm+EyRQzZkr3jYJYC6fjb8R?=
 =?iso-8859-1?Q?uTjoPSsMGtRpgFDEmQacDe1RTG33CGT7Nk/YqIInj9L8bUFF6JmQ/Ou2as?=
 =?iso-8859-1?Q?7GeE7GkxcwOPeyB+ylLYUELrD5N6Sj2lyLLdI/59usuMaH3TRYBKdxYa2n?=
 =?iso-8859-1?Q?XlYLBorEdPZSH675sF4CbUpADu7RwhUaFezJubQHscTPXu+GahnVEvMQ22?=
 =?iso-8859-1?Q?PIZPG+Mgu40Fxa4crKGM4bPU08JUVGMwbyuegBLz2G6yNVj8mxygxcdKRS?=
 =?iso-8859-1?Q?yq5umwJb9ab2uyTgdBL5UtPlfOFTxkgwPh2CLlL0QnBnpcWRnCJ4gUnOD2?=
 =?iso-8859-1?Q?0ncGya2KnnCVxdXk5rWgPlCvcUhzD3lM20IqrHBGo+2OIkZvXaXw+i19is?=
 =?iso-8859-1?Q?k3JtgRO8kTpGHPYQK7IbtVLS5gCTodYQ3pxTZiEhk09Zx24srJOXtZTfAD?=
 =?iso-8859-1?Q?+uCkyzUfXQ2oGVMZfWO7lYlJso20qWqOQEKh01VEOfSQpjiAyIvvYUY+Hb?=
 =?iso-8859-1?Q?ZqfKnzZWqflCvG/9i4Lj3n90t9fesmboD5WB3jNKhNO7gemgfU1JzFtJJu?=
 =?iso-8859-1?Q?M9Cj6RqleKM4YHhP7rLjMtmcv8umzKiCcV4ZoYUQZP5UsHiSGDW68uew?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a738e794-1522-40a5-3b37-08de1172cad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 13:56:21.5618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QC3PcECq2he6HowsslGzPYiz7xEu4ba8y2Z7AEi3UMVw46vfOHq1cpZPkpjbGfiEuu9V3J502YSSffpIaLcoEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7207

With pci-scan implemented it is now possible to use vpci for hardware
domains. Update has_vpci to reflect this change.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v1->v2:
* fix typo in commit message
---
 xen/arch/arm/include/asm/domain.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index af3e168374..dbe3347cea 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -305,8 +305,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
=20
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_f=
lag)
=20
-/* vPCI is not available on Arm */
-#define has_vpci(d)    ({ (void)(d); false; })
+#define has_vpci(d)    (is_hardware_domain(d) && hwdom_uses_vpci())
=20
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
--=20
2.34.1

