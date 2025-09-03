Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DAB423C7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108476.1458645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoW8-0004BK-4v; Wed, 03 Sep 2025 14:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108476.1458645; Wed, 03 Sep 2025 14:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoW7-00045r-TP; Wed, 03 Sep 2025 14:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1108476;
 Wed, 03 Sep 2025 14:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoVL-0006B7-MO
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:31 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89614348-88d2-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 16:30:29 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB7844.eurprd03.prod.outlook.com (2603:10a6:20b:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:30:25 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:30:25 +0000
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
X-Inumbo-ID: 89614348-88d2-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBVCcbVA6eC6D1piIimZ2U6kpZ6dMJLnET+5HhFpWXb2EbduRq8Fs5PP6tW3Gnyj9dCdebm0XbxNnOG/5eYhJdTwUcl4zeX09ES8/jeFRnRa99Vb6J0M7bJvCCCv0X5ntHWCQDvdRG4FVHdk0depC44PgEPgtd9HMMGg6XqUwPlxH3344Gmr1/TVHWdBxQStMbapwBQ2hO+1+K+ySePbdf8IUXZ4Hq1g39LF79pUAHlGdhLyHtwfl9AvVkPDrub/KpvCsgK7ZgZVbOL9zOwPNpeFR/3lkyDqpFm4mChGODY/pT+iTklaNiQ/RQx/B/8O3ahul0YjbqQvMu/f/WReAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3NrOPn8zFlka5eJv+Rl5yy68/xDlMmoUaUQ1spR/Uw=;
 b=hufCOt8EFQXJuETDey2FqzMn7iys4cskBGWc6zCUHm4ZGOUD5ALp9slMmvgvFNpJ1E105b3KjXCpHMxEhSycuIvJ45CRoUPlInpFJ5hqWX9gV1iFHtuy/K1OdHbkYQ8gzFDQuH0zPgzMho5YHSKbHVppqZXBbRao6wNAi1MOO1n5ZT7PMMy8tTLNj5tZUrfRvxjy5RNM30kUvVMG9DpJPWnDM75WfHa+gdUb2Ol1oh9g63RP4JZGyDyXQ7rhID5xPdswMaphXlYvD2t8jEAwbT9gd/NPw2t1j2nF693XMppX+Q5tLVSnSjAhvyiwzrZIaB/z66F8RHewX4T6wSQL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3NrOPn8zFlka5eJv+Rl5yy68/xDlMmoUaUQ1spR/Uw=;
 b=pPbMr/bAgJOTDRRCYHVW6A4fM8MxZcq6gNuDrQPNG83LjHUisNK8aJDzuB6oEc5gDwYI6HTwDHEJo8Yk67uugjSPHG0Wh36TbVXxxAFz6//wo53BL8klpqo2OsudaMmX7xq7y1AEjnOB3I8RN2KvaiJA5TDb9kmBRHGp6Ednoo7cHRi+nvK/2Liwebf8hI9JkzHiPlgzn09UfudLeFEigwmoAt3On8hPJdSalSdaB29O96eZN0bsYbC8I5sGRy+hn7y9fdBoIvPPG4Hiu779v9GCyUWui/RhK6qyOazua+jVSVqBLk1Ri5Ldom4H3dblhOiXJOjOUkVlpIH/G7/bWw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v6 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI support
Thread-Topic: [PATCH v6 12/12] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
Thread-Index: AQHcHN9JAyQfw4t69UeYZUaq3Hk3PA==
Date: Wed, 3 Sep 2025 14:30:25 +0000
Message-ID:
 <607ddcbf90a16c460a1c4ad8c3242e420e16fef8.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB7844:EE_
x-ms-office365-filtering-correlation-id: 14c75104-e888-4290-7885-08ddeaf66c61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SYvtTW/EjTYkLZNr+AxP0wH6M8xLgKLokOypvMWhJWIslc7JLv/tSZQES4?=
 =?iso-8859-1?Q?sv4i12ecZkv9WNsbF5o2qWPG3A5zj22/WdKx+EN9CNyTGKIz6abCaXYoGO?=
 =?iso-8859-1?Q?UGRoWwAdcJQewESIHIxhpMfZugczWGpkQfVXjyO4VwpVsisuQL+6brGp/a?=
 =?iso-8859-1?Q?GO9Mzc5LcWzLX6pdb+whjjlLR4WuObJWgCNE2taWhhVVkdjr+cREf2l8hs?=
 =?iso-8859-1?Q?TisX2/k+SGbYN4trrzPAynvk/X/FkfQ0r1/YRKwSrpRL6lwYlErrllE/wj?=
 =?iso-8859-1?Q?gXhcXhZYPWtYsdUd5EOOODtkgfG3JGbutG361+5unHIhb2eYhEb3lilH6q?=
 =?iso-8859-1?Q?7af2+ipYVfALZEal6UYOocYNuIR8rchq0lxk39ZTRzgtmUe7ciPYKPoe5r?=
 =?iso-8859-1?Q?Vwg4JeV94NROIrZ6cWlvJCQa/puuZ7+68nJjjEM/ahlpmm0ZJ0OmeqIVPV?=
 =?iso-8859-1?Q?GuouWqO8pgwLWDFRaUAH/rAn65ydYksLXjaHJT1mqdQub8oFm88r4fqB/F?=
 =?iso-8859-1?Q?IkVAGABtx6Nj5zPYcgkR/+XQJAPYblai1mfeFjaYmN6s/OMPevrMuia20f?=
 =?iso-8859-1?Q?UOu3sGUb5aeuHIq4teuvIrmQ5Al/ClsNKYUWfphiBL537LgfCvS60mEwO4?=
 =?iso-8859-1?Q?5LRY5ZTlmuNWIY7sv4fP5RLOoDHSvFFIODxI4QmNF/Leelargx757plSty?=
 =?iso-8859-1?Q?nksSjJGb38Xr62ktqs+Va1aVUOUTiW/wL0C5nGxExaAnHfGEeF0WnIFyK3?=
 =?iso-8859-1?Q?XPs9rWPER95sctwc0j6HFzhxqqd/jCViCEJAKZi5+xVK39F3KxwFb+/qat?=
 =?iso-8859-1?Q?lBbBU8ltN9YqLkg5ahLSpNULUEiyPi9QhEqsUy439GwgI4h8kV7a/9uYLW?=
 =?iso-8859-1?Q?sWwoSq/h6lIOJVzWCs24ZTjZzn/inSPxI6Mx+q0u1a8+Ox4OAvxttJmz1s?=
 =?iso-8859-1?Q?nfSNGZvMocVRPzLkz16jKJP8q+zSF2b5pz/FysfQmMOC2Y8Wmnz+lMOAZU?=
 =?iso-8859-1?Q?WX2g9NNyw+pDc2AP1TL01WhAdgyOJ9AEvtCRyxafFlsaTq+uLZ+/b8my7U?=
 =?iso-8859-1?Q?xISOssdyAG2SGXBYn0syJQ99LjyZPtiItp8lXS603fI0LBRjICiItY2yK1?=
 =?iso-8859-1?Q?y/AXwB1RGkphZfulDkN783QiRzuD+lKjO5x2Ie3PbIFTFDNkckwxSajDeb?=
 =?iso-8859-1?Q?5eWkxAFAeDnGF6LGCdPyu4kXid4fEFRrBU0hrexjIlMGgvBpj53KgtceTf?=
 =?iso-8859-1?Q?eiwvmskCIO9lPx0gTp/lsw5xkMQ4FvQl4TNTEi2SqY3mNGwu8LpaC9C5EC?=
 =?iso-8859-1?Q?1xW7jjEUe4RY6SJqj50hDHXPQqutBlSAwk/DpCGz8jcdNr/fKU0qFY0MH9?=
 =?iso-8859-1?Q?HWWBCqRaiPTYFDWzV7ymmrC3SDdDcVcWsICQ/Dg1rNwXy5QFwm+5lUNqWA?=
 =?iso-8859-1?Q?CXlZix33FnZAA0GosLJez23gpbsgP28KJ/SHt8wMkOryWghP7pbociFVzC?=
 =?iso-8859-1?Q?E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1GgDm0+UsgK67l+Bd+BOZC550JsJ3nZ1ckp4QOrNHJZNZmxAm37h/ZSXIb?=
 =?iso-8859-1?Q?/jPerpVcfziWyH19JCAFI3/jtZea1GF+f+5omupc/Fr9MDB/lzuxAqqB3Z?=
 =?iso-8859-1?Q?Knyll0+vn1OK23EaOmfOwYX0tMFrxMgvw42Ou4tBjn+0kSYTRkTFsK50aE?=
 =?iso-8859-1?Q?pHmyiP7qCLkB1ihu2G2Snpkki+kEIhO+eT3ZlLGaQrFliB+wGW/9ofMAQ5?=
 =?iso-8859-1?Q?YDGsJOKXVfHa6Vi2oCVMzWv4ONkxvcT/KEJYGWqH01KxVO9b8W22iGuWH5?=
 =?iso-8859-1?Q?Q8AOCNohOzB4Xw3gOdIFU4DSZ/1gxVZHdiSCyVK/6o22VSAhUG/hmpXf6T?=
 =?iso-8859-1?Q?7ZUkITdnCOi8IytmgyMoJAexyYO1dzUD8cILx6FaKgtde803LsjaFNOBmj?=
 =?iso-8859-1?Q?cuWZWAjiDC6kMvIwbXGPLID63bhGD+jCVE7jhZAI+0DwmP7PuDpiiLvFIu?=
 =?iso-8859-1?Q?0Ok2P9FmsVLgkID71pqUZj6tPlIv5zq9T5M/PUF4GqxO9yglcjJ1kZB9IF?=
 =?iso-8859-1?Q?GZOZGlNFChRF9ox3Sm3DU1CRT+eNpl+NZvBVunBA98FLe9OKdruvg8s/4r?=
 =?iso-8859-1?Q?9CfEnZ5g/XLj5a5f2aySanDEktvN6Rbp/ybPf0dCAkEsBxzb33TDF6wc7P?=
 =?iso-8859-1?Q?PMQaNOFfNYmsoY6t7jlak52U1zCe725I8afjvgu1G4WVc78sIbXeZHzJQe?=
 =?iso-8859-1?Q?X1+9TxVdFuqWcc6Rd9sDlHdX6GPr5K3tos5D53aATmTMkipJz27gT+EHyH?=
 =?iso-8859-1?Q?eVnhjxqU+Md3rHSEAPE1U2thK9bsqgzgoZaVw2w+e2WgFhn7Jb6B7uXwP6?=
 =?iso-8859-1?Q?totpY22o+vOhfFa8ZreXGQtE7dtI1bCaFEEOBBo4oeaPFY83i5I6jHt0fu?=
 =?iso-8859-1?Q?2AZv1/9DQNbLkK3H0VZRuZXV/gWw+PiS7FqPzO+jZ+azMR7k2/Hg0y4N7w?=
 =?iso-8859-1?Q?5dJyKHHN+Dv64b50HQOtVhsVkH/DLghMHcYNymluXOjIiwXSLBK2aalMsR?=
 =?iso-8859-1?Q?z0bRqFeLx2KrLu2Lyw5CQSaW2klsr4MZT4bC3XliZ5XBMfVwMkYbc8a57B?=
 =?iso-8859-1?Q?XSHPOgav3GdvmJMQFw1KgZ8BW5rtf3ez5nGEppWIKLfJmGYdNyDlAfB/lL?=
 =?iso-8859-1?Q?+r8w65Si9d2e+JDhxH8IpRtiXA+SFaMr9/BdCMc5tsAp1K+LdADFAzE1lm?=
 =?iso-8859-1?Q?E8nuxxWqwQl4is9r91qkeHd++TGa2C4seqO1CSCO/rPI3ZzeSr4QnWaG6C?=
 =?iso-8859-1?Q?29kPGnmtDcuiIUPuyu14/ihBGTmf2CQfzFDobtOMaECD6RqHEbTgpfeCbO?=
 =?iso-8859-1?Q?ZmNaEuLpiMJGHh0u2MbewTdF4QUHx5syrt69zs4tET88/2vN43u9nnDe1j?=
 =?iso-8859-1?Q?+qE77R5cKyvhT4p7AhM+4QCAQ8CcrUK3ogNUaEJxoTEtw3ZPbuCX+feqPk?=
 =?iso-8859-1?Q?pwPnzga0zddI6cRKeiZJxQ5+mla5tljsLp9YLP5nCeio6wYxdInkGl3T+q?=
 =?iso-8859-1?Q?dDsDvJZjKc6mxCMuUObUjilZLzgcouIB+T9U77TE+nW72tP6T3HuosAdQq?=
 =?iso-8859-1?Q?mEhoYGDsUhYgGhpSazd3hi0OvKpiSk4tkHSGkMm9rwwWYMnUUahFmpdEFi?=
 =?iso-8859-1?Q?pQBzhMZHXPo+3XakeVWyrq98N+HOAcvUwVNXVkkpxDirj428P0M56wIAIg?=
 =?iso-8859-1?Q?7bK5AgAs1lvTdc0l2fc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c75104-e888-4290-7885-08ddeaf66c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:30:25.7608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njUmRyD9eI4KsX9qxPOzMt/Fqtinu9bB0tSj6j7t/4+MuSBJ+V8MzV5Fp+xy65IcOCyQQ+2tkgMJsontZTjCCu79x/YSROyuup+SCx/Q4M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7844

The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
already supported with CONFIG_GICV3_ESPI enabled, so this feature should
be mentioned in CHANGELOG.md.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

---
Changes in V6:
- no changes

Changes in V5:
- extended changelog update with a brief explanation of what eSPI is
- added acked-by from Oleksii Kurochko, which was received for V3:
  https://lore.kernel.org/xen-devel/bce5e07c-eee7-481b-a833-4d5d8bbce78f@gm=
ail.com/

Changes in V4:
- no changes

Changes in V3:
- introduced this patch
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..31b4ded444 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
=20
  - On Arm:
     - Ability to enable stack protector
+    - GICv3.1 eSPI (Extended Shared Peripheral Interrupts) support for Xen
+      and guest domains.
=20
 ### Removed
  - On x86:
--=20
2.34.1

