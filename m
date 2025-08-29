Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC9EB3C043
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101655.1454675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cV-000873-Tx; Fri, 29 Aug 2025 16:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101655.1454675; Fri, 29 Aug 2025 16:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cV-00083x-PN; Fri, 29 Aug 2025 16:06:31 +0000
Received: by outflank-mailman (input) for mailman id 1101655;
 Fri, 29 Aug 2025 16:06:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cT-0006O9-Ih
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:29 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb1142f-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:28 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:26 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:26 +0000
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
X-Inumbo-ID: 1eb1142f-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FS8bHCz/O82+a3qvXR+0w06AMgO3YGYbivb83dix4cBPj5yELvZX7csIjne57ZZc132XsVW/up0Zz9Y54Uzy9kyBQaOJ/IMRqQA13vPJjfzkwlPMdeqDTWKYK2NH93S+sIBef30kY4yzN7eKeKVn5CHqlURhf9wP7mVJg4KstGG1pAjHk/4ma9vtN8Dfp+OyqU8jQlfBKUkzdFciiVj0vjnHTBGSL5tzYUkA7PVBbOvfkwt9ZqJgdNg+C0pWI3r23QYn1UyQ6tgRd9AkkxBGYptlaEhCdx7NeKoS1tWrOjs6XmmuNq25RUfnVImgqCuXshl0U8CAnC9scEAzgNM8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMgOHXZt8/GuF5BwMPodPqG6Kq/EPwOK0n+W+0/lAO8=;
 b=KQ9mJv4JlRt31R9YfbQGSdjXj3+DsqLfX8o9fPn4ncGn3aKBxi6MLQIdE9sJj8e84fu3owRRFLTScSw4ygpjTX5e3ph2aJYxwSPuN2N52GignKoj0tK9ePiJMPza7vCsZR7PwYfYnPJdBjCAlVUc4LWUm954tK99E5qbKaDDF2vYZgdh9aGkcGjeJpExk7BYhFI1A9GuWv0Kb9TXM6gRG9CH9lhVBeRI7cYCD58EYOc4mlqhavgg4E3ZU5fFEeksmEoh1xg+DYS2HpNPnqnHvKve4lX6H/OibcMpiIk7kI3D0D2uXt5CV7EGGs8EHPqK6Yr2nn1bloQ04lvki9FTtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMgOHXZt8/GuF5BwMPodPqG6Kq/EPwOK0n+W+0/lAO8=;
 b=ko2pr2oOu7Qnbanzfk9x3j7uwYS9G6Hr2HvZsPUQTWNt4+4PyEbQiBhJh3MtaBa/ELY5JEOeXHoW1EFwf8HfErOmh7+X9E956+qOVvMYSNUhy1Y+EMJFBvwAq2Vhp1f8zE8lppZZ+hOuzBh5kp279n5c/lbF3KEb7kpTNf37yd/1+z8LvgyGFx5ASrO/ALWqtgOZ5iU796e+s3PAYKnsnzVpajnJkJLoeToTND69BuyJXQlxWGKLGEgk4yYcP1Eslx+0mLpUXW28DcA4eq6Hb4Ikz/F3hoXEv+XIhvz8aNjb2G7uIHPxiEEthZpHPFd3AeEtjDXcrBXz14SEV1/mhQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow
 eSPI processing
Thread-Topic: [PATCH v5 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Thread-Index: AQHcGP7fr2aNz8WgzkeaOcGbW6a0ZQ==
Date: Fri, 29 Aug 2025 16:06:26 +0000
Message-ID:
 <34b86693e1031a3ec786a38a0510f047c6c708da.1756481577.git.leonid_komarianskyi@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756481577.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8676:EE_|VI1PR03MB6317:EE_
x-ms-office365-filtering-correlation-id: 9aff33c1-90d2-40ab-079e-08dde71601f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xmzVBgkN5cJhyW8JCptWGOHnE1rK6aovA0RvwBTAVMBMaHupr7dNzfivLm?=
 =?iso-8859-1?Q?jHMbvzT+Sj+VbbFfx/Vu57dCpnMg5z3W7VkNL0tcS73b7UbJDh8pLcs2I3?=
 =?iso-8859-1?Q?L98bpSBW0JqeBh3RU2U6EVnNfICyHM2Eo2P/7dnCSXaccVnvew4ddgnvzY?=
 =?iso-8859-1?Q?eEe8pSa6qYvepCW05u66CGCZMrB1qDPBlJi0I1K99tsLz5ntCRCgiUOc+5?=
 =?iso-8859-1?Q?1zklgDOu6bS7RZL/lpJiK3TtVvI8qfdc3em8wqBM9c0AKffOnZ9VMxh92z?=
 =?iso-8859-1?Q?U8tC5xX+vqa5iJmaDod3n2/sb8QrIEfylpgcZmTx9xEt8bbaUAgaQNnkNq?=
 =?iso-8859-1?Q?QV6a0B1QoJgUI2wEBzkC2ZInxGPDaE/NmRAdNJmTGbYrhzvLXub8ie8e8/?=
 =?iso-8859-1?Q?6NK1avENpWP2ZJ5X/geMGzieN7+QGLXhMe2mn9a7xcx87lwGc7Ns7pypNf?=
 =?iso-8859-1?Q?V3GcJAztthJugbiPcGDq3kUG8QJlfM8kDrMzOMopWKJdYYpmV5l1+U37Ry?=
 =?iso-8859-1?Q?0fhbFgh+6U0swMwz+xbVRcesca5Z63TS2Ib/HzOToMaPxqP1LwBV2yB2oI?=
 =?iso-8859-1?Q?Arxkph/J4Rr0AXfUVnaKYmIsBmEEatLTt+kmyX1bDdbBMQ/ee92aKFtL04?=
 =?iso-8859-1?Q?ta0jySQykcJB9DN7F+FIKxk7yzKY7dpzA9ld2NaiJNmr/HXrCJDlXpevB5?=
 =?iso-8859-1?Q?/fvwFYSgH/4PiAN4EtQH4SRtdE5jYvhUSzp+CIooYyGaVqAsqOjA9/0IBm?=
 =?iso-8859-1?Q?2DwuR7rlkJjeXH53wySkkksBV0x/t/TW+wDf3BU1I8X60V2ioTVPDCFskX?=
 =?iso-8859-1?Q?winn4eAGFiAxgu7dQnjTx3Zcu5V9YlBZdqaPC/f/8uds2fOeTICC8Yzf4y?=
 =?iso-8859-1?Q?2bTHwyhC0Wf4REVeYLSjEZ1mCSySS5QppQta1RQfmt/AUaCvOJQ5ycEB8K?=
 =?iso-8859-1?Q?cb1goG/zjEDVcZYeDP3OBv3jzvBipbNBDnTMBw3d02+G85gxyGiIr7TAQN?=
 =?iso-8859-1?Q?Driu7BPZsT5aVJ49UlSUavIG2P71HzgYL0n5BOpSwKKe4cDi8+xNyO3nK4?=
 =?iso-8859-1?Q?Qax9a76xRQRsO4phnRqCqtXfcSMH2woWrIOEuzmJ6MelltgpynGdMTQXPh?=
 =?iso-8859-1?Q?EJEp/RmdHLPvdrTF8h+bnLOp7b6BqAZQ6URZ8wILLiYL4V6DZP/s9gSEUK?=
 =?iso-8859-1?Q?qcn5tNeMdtYeEGkB+kmBqL9YlyGWthhuos30DduHDIdUSdMYuIZRQNm+3s?=
 =?iso-8859-1?Q?PD1HS2aDIlz/RJyZzWIR+pOSt9ZAcnnJk/5L40wML2k4d7BtUOABdTTEWS?=
 =?iso-8859-1?Q?wENjaEvtTtCsWykt/z2NqALZhlTydpjlwCi2E+l9GeAtrSvrb69YYGe6NU?=
 =?iso-8859-1?Q?ELGO5L1T6qagOePGexP+1DwiKa5Efy0lULMguzDSwOoVq+T5XCKmP8yj6W?=
 =?iso-8859-1?Q?fvlDVnF587C4FxqsgLBoCGSrOYC7LWsuP/ElArb9YG4bLQsR8m92ZcdSBT?=
 =?iso-8859-1?Q?x5jwD0816swilTMEFrnjjnVdaILerhMzUTUJDDY22tZQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3cLXN9PMBQMalXvKtoxOAGofzXDEvELfrSgpR6HNC9QBkmr5utsK1/qZTo?=
 =?iso-8859-1?Q?KjB5k+nEMy0/FLzBMgzGVxPGHaACl14Ka1bk3Cy1ru499Je0Cmf3n1eTuD?=
 =?iso-8859-1?Q?U/vwNKnYGBvpybnR5IsORVAKQkXPP8kttFJKapI5nfx92JG3yAo0TqxxxB?=
 =?iso-8859-1?Q?9IJFUGxVhkhoBb9g9VQWtCgWxvcvZXr0Z9vitVNXhkaQeDQTGnxDRRKOJs?=
 =?iso-8859-1?Q?PCqFmXruaKXKDsxLT7cI8b4h1ji8Wuvyy6ktsibjlSc/sQ1PbiZL3Qrmeh?=
 =?iso-8859-1?Q?8vSDi9jB8oTYKLnHmZjda1gNZ22tUum1i5h7+tbCkdVNxkI/caOKhv1dHG?=
 =?iso-8859-1?Q?S5pWk6lh/b4EcvMIhAWePYjnKGN9Ov8F26t4CmL+iN1msYUS81gV9RdM/D?=
 =?iso-8859-1?Q?JyON9gKCHawlbUc9vSUFMrAs7cIPN2CNDpQh4qkoosZpg1FsxpDfgWxvPJ?=
 =?iso-8859-1?Q?E+KUpKG9CMMeQEelqUlyfA+M2U2pREBOdPZ8naV4bUKA3jgS2hrbu46CC2?=
 =?iso-8859-1?Q?PoFO4b3G/PdE+OyxAUErCej3d1HanuOmpHq9CjFwZCn4w3ZSXf/SdAhh+w?=
 =?iso-8859-1?Q?lkV1F5vrtbb6w5snYJIFO3Zqk2hJsZ/SEPm3IQ+IUYqJwGZzvJoqdn+xs6?=
 =?iso-8859-1?Q?K2Awna05HEZXjt4nQG3tSRDgmMuwJjSw72pmANu24BwObwgGVye7o0Slrh?=
 =?iso-8859-1?Q?vveqkQepf9UynlrGHqZimWMR85auZ/CaZzgYvbVU2z2I51MyRnkDyIxoFU?=
 =?iso-8859-1?Q?A75R7Mb2OLf9VMiaW9lQ34JQfq3l0IolK7dVMiC5VXKqh0xgvrqK9FgkUO?=
 =?iso-8859-1?Q?/RjSWsZ88V5AltR83tMGWFMi76xP+RbPYATtx907vHsofGJpJfiEhQleXD?=
 =?iso-8859-1?Q?RHZVMEFCEwnCMN5OC2jd6RqTK1CO6FVTrKWCv7fTfsiLI+ay1orFbHBkd/?=
 =?iso-8859-1?Q?4f+YQ5QJ+EZvL33oaLZO2l3+0q0WVT1hOGsEelIucm+9MZxg/bMkjr24Op?=
 =?iso-8859-1?Q?HNyul4mkp9ityU+k5innud/Ruw4rAUrqbhpCh/7a/Yspn00K41Y+YtLhOW?=
 =?iso-8859-1?Q?lpQ/wUvpJnPmPxXAJnd+amUJw7q13lbrifDK2ZT6vmiALGNLZkGuVF2YAX?=
 =?iso-8859-1?Q?2Zog25Zt0uop53M0dkvPvR1YRjATUx8xrR6j4tNQuQhGxgTIUOGNKmInhz?=
 =?iso-8859-1?Q?gqFsruy00bHJ8HnvNPKRJPFR+RdFoUylPPJQU7M7dEK3eZHIA6oLTLc5b7?=
 =?iso-8859-1?Q?fmymjT5WB/yX5y46/Ds4sG5VUtcD5H+5DMeALuSkUIM67Gqj6AzPiVPG4M?=
 =?iso-8859-1?Q?ZZsVdLA65T1MFC1aLg4JRkM24c/tf82x9+t6V2iH4S7R7hlxqd2KnK0WSn?=
 =?iso-8859-1?Q?TB3ggaQB8KcUGqcKQLiHizVPHUVWykN1yMeC0N/jRnLbPtHU8rfmXbiB1m?=
 =?iso-8859-1?Q?NoarSH2CGxiBukuRz9sIqLpoTf8Pjt0PDNvfp1xC+niAYJKajkGK/LBdoD?=
 =?iso-8859-1?Q?/Nyax8VwnHhssZ66VefA8PrX+1kH9N5igDSkYPv8PeMFscIAKZdcnZY2rM?=
 =?iso-8859-1?Q?WvA1n9Ce5Uyec35nD6yLCxHX/7kEjbZNHOgSgvktgpicw80COn9LUJWKEB?=
 =?iso-8859-1?Q?LcLl2wfaIw7RUWUm1fV20pvJfRtxSG138vqDonzjpejBn3CcYfVEI7VcGi?=
 =?iso-8859-1?Q?+Ve97DtI99EtNC7lLbE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aff33c1-90d2-40ab-079e-08dde71601f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:26.4411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhzG9IRW7C5Ch0glLZB8s5OR/k4C4FeXNBKkngl01kPshXKBqt/KXXz9W2ibgZlHk2ngLxOXtU8GEj4/b66cxPoLPaWgZarawGMctEF3o0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

To properly deactivate guest interrupts and allow them to be retriggered
after the initial trigger, the LR needs to be updated. The current
implementation ignores interrupts outside the range specified by the mask
0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
eSPI interrupts, this patch updates the mask to 0x13FF.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V5:
- no changes

Changes in V4:
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- remove unnecessary CONFIG_GICV3_ESPI ifdef guard
---
 xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/=
asm/gic_v3_defs.h
index 3370b4cd52..e70c1a5675 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -211,7 +211,7 @@
 #define ICH_LR_VIRTUAL_SHIFT         0
 #define ICH_LR_CPUID_MASK            0x7
 #define ICH_LR_CPUID_SHIFT           10
-#define ICH_LR_PHYSICAL_MASK         0x3ff
+#define ICH_LR_PHYSICAL_MASK         0x13ff
 #define ICH_LR_PHYSICAL_SHIFT        32
 #define ICH_LR_STATE_MASK            0x3
 #define ICH_LR_STATE_SHIFT           62
--=20
2.34.1

