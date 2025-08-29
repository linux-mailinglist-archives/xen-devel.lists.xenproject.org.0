Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D48DB3C046
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101648.1454616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cI-0006Qi-Pq; Fri, 29 Aug 2025 16:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101648.1454616; Fri, 29 Aug 2025 16:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cI-0006OR-Mu; Fri, 29 Aug 2025 16:06:18 +0000
Received: by outflank-mailman (input) for mailman id 1101648;
 Fri, 29 Aug 2025 16:06:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cH-0006O9-SK
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:17 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17349156-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:15 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:10 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:10 +0000
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
X-Inumbo-ID: 17349156-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQIWUEsXqjsjmivdRX8ItIl1VdfKIjYGOlfpKEh11iakmW0aqj11CAmy4IY7EiabtcNKLs6vBDL80SRVtY/6L3gOKABWeIht5eL5EYiyZwg1uYZtxqPspwR2Xhzy2NB1v7JPIZBQ5mTY4x+5NNOwOeKrF1mLmDvnAiWZjjNYzrx5rxVz3irbUgAqdUCs+B6l4eFs2/MZ+Mw8naM3GUnm9rEdJ98YnZ1FNNlJxkENrN9SqexTBSnWVYPXaa9SmwknaTe3lWXCgOOkFj4l3/0tukND03U7i5ftvtoFFf/k9Z+B50jBm4N01TSkhihbE3ZUgpcg940baITLUFI1J3/hjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcLF7BAT9Ubkvibmfe7nlNrM08Cmevf1ChCCx9+RNdM=;
 b=NhNVieFnZ+62GdW0AZQk9pkgNFxi2bXn84ZOvyDi7crqxY7f2O8ADqrWAs2YG0+rR2IhYWiLXVnl1O2BWbeFNqHjGkIYhB+qZOB5xMCM8VW8jn87mCru2yQaqloueQFCrM9mWMgCYqb4jd8ac6sNS4U94DeY0k2PtVMivPCohEK4Nttkx28x+44IkL4EgQhwEqqSzXOp9VIAtAf9CS8T7Hr453Xf7RV+X1oSTUPDmBel8yBa17cTIeGdEOlechQmQ5fiRZ4l6qGYj1XttlcVp3BGoIegO6Nk1sI04uFjNusiV4Yy8Rr9J7Kv3B3S1LJTF8rH4VgtgGeKko9AY48MNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcLF7BAT9Ubkvibmfe7nlNrM08Cmevf1ChCCx9+RNdM=;
 b=TQYLKqIzu+e/6Ig0s+RykxY0eocG3RTq5sxDfE3yoIJzp6u47UJwfXZ4x6ummUau71f5bUGmz7ptMVHXtAguq/OKsz0FRBJy2BvCQo4qT9nQ8Yt0mecJPgeQgA7lpzAHtlCBOOfXgdvbzvBBwwwWIGxigrvxkWMr6Sm5dsHbutmS0P2MhvLVbr89elbr2IlMcST2xUrCuVDi/j/BtKq5xF6eqHVXgxBbTXvr5SilnqKO60+eCgr9PwDaMIIaBCaew7gok3S0IYlyTv1jtkcrwFtGj/gc1fQ5BT16j/WEIFD8Rz4H9lJBYeO4FG4amhI/bwr5z67OTaHiMHnuplrMhA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 01/12] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH v5 01/12] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcGP7VA43rYFd/50W5xNx+fBJnNg==
Date: Fri, 29 Aug 2025 16:06:10 +0000
Message-ID:
 <7da58b5a27d61f75eaebb749a7ab4c72655a12cb.1756481577.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: 74f34297-b6f6-40f1-982a-08dde715f82d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jStG808AHCWL0GjeG0jgn/JEANu1jdgvlW9DNfVfSQFrQBTwwXfg9w87OM?=
 =?iso-8859-1?Q?4ZbePdNguj/2T3xsla6DT2B8KTAdYM7NdvTXnKvmY80raMqOfVE0vR4VYA?=
 =?iso-8859-1?Q?lqh0GMNsUbVXRaWmy2g12s9rlEC4+c8QO9YvkR0iaozTrbDPyRPNC/xVzi?=
 =?iso-8859-1?Q?WljJMZJh04gGHDJY0S0hMfbfFIFjwHktOvYxluseOM1exip23ZTi3B0L1e?=
 =?iso-8859-1?Q?JkxqAPXmhIrc3FqbXIMt9QdWnO3jsLZLUftRbKylHQwl3M2nGLkKDNk0k3?=
 =?iso-8859-1?Q?9OGV8ap53UpJ0VSH+9SvYnDYQu21Jq1wlfa0cSRaeKzX2dCJSVKHMFrxz4?=
 =?iso-8859-1?Q?sIZjyCWHhRBlh+qMhjqYLJbNR6SOZY8l2Ae3CHQAmgPkVpdV9A6hqNi24e?=
 =?iso-8859-1?Q?ZeADbaaZrSK9SY1a8eZ+1Eg7bjyhvME+HsImJqbI4QvR0N8m5CZE3J1h8N?=
 =?iso-8859-1?Q?J1XJbld2Y5XN5v6YQ9tS/f2Ga8kkRAfh1eTBQKSdvjvKwWqXGBEFL3MS9W?=
 =?iso-8859-1?Q?zflSO7iGO43O5OfLMWiFrRsM0JIwgFzwTwLJ5KPzlWsXkEQ+jrgiePG8T1?=
 =?iso-8859-1?Q?sQgf+wWf5GgkEZ+XaA9h+sJi3BKSzJDd+6vNZ1ZvoGdgG/BStESvQxL4WI?=
 =?iso-8859-1?Q?0Grk8MN9uapuyP9puzo/H4KFdEhM8svlhYbGzOmXISLSy9oeo+30VqGEaj?=
 =?iso-8859-1?Q?g19tIMJHZ7twwXzergagNCixJjkjYUwh9o7dzulu7fQvyO/KdxW4XiE8Qq?=
 =?iso-8859-1?Q?6nYk1kUzp5/wG3dSkrXCecDKaDXLCHZpUKWQ9bPdw2Q6yhgJ1YrS5pO6qw?=
 =?iso-8859-1?Q?QD+y4ydxt717jHW7cZRZgDVbC0bAyEkP7KFHqYXrpBlfQR2R4r76ZCbP9c?=
 =?iso-8859-1?Q?3sZL912Zw0Q+mP7xXDiH0LI7HjZzm17Pr/hq71lnJ6CJxBJPcJCN7TepwQ?=
 =?iso-8859-1?Q?QCZKUgaKWXzfiYJcAp3cxtU/oIM8B5vNOCFdjh6aphmAp71fmuCfBvjG4+?=
 =?iso-8859-1?Q?OcsE7IqdejeHa3x4OwwdM40fRRi4jv7DDnGq4bIOcKGdSyu3g/bGLgqb7N?=
 =?iso-8859-1?Q?+jloui+dLfMhLDmRPXFPBzKRi4lqtjhd09MJ08mK/IwwekeMNyzgBhEGgi?=
 =?iso-8859-1?Q?WMjq3M2zGmgf/kh930dUTaPBNdacE/uwezuwgdf6Ge/FzpUU2098gJoWxF?=
 =?iso-8859-1?Q?IvTsSzwr0SHlq0vvC0lk2K2kbicmMSqRQNHdsWAIxjwTJ+Khd2OP2QgV+M?=
 =?iso-8859-1?Q?WXFirGI+FJkW6prRKLRgpiaFSKzk3sJrVyLkLbNMcf8jpuykyZ0WQjPtb3?=
 =?iso-8859-1?Q?D1G2oBToJG++eCwaNiqCH1mHg/dcGdA3IKEh57+3ZP5oflIg4sGR6zudSL?=
 =?iso-8859-1?Q?XvP7dN/SVXRd9PHBB32NqB2PrLIrIrO2vDQNk+jHbNH8KwuoA2yJNec5o4?=
 =?iso-8859-1?Q?rnlxdlTKsxVYVfjD/l4Wcd8Vatz6clHrn3qVrN1FwlDSMxUL/bDAGApXfE?=
 =?iso-8859-1?Q?Q7ECjzS6MWzv+7OHTRl4lGoqLqmgp/yrVuRWrNFFNZrA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4xh2Fef/qdLg78s0SnhF/StCTVVnCyeG3T12OunXPSnt0TCf255p6IuuJ5?=
 =?iso-8859-1?Q?cSnfwe/lGEj5nlCVoiN4um/w6j0pbHMvcU06EQmhMvIcn0J54u+uzeeEqm?=
 =?iso-8859-1?Q?MtKBHo3bsDcaScxMrsG+hnoYnkH8I/rx721fh4FdxgT3p5umPBkBRENVQC?=
 =?iso-8859-1?Q?TIQvMXjl1WIxg1Ra1zFLGcobq+cN2u6TxR5A2sbLgCqkrjCgiG7RfiTewX?=
 =?iso-8859-1?Q?eaiQqNEJeKhA0lPbJ0qniIo7uQvaStlFXXiZsvrY4EdiyF0lg6e7J43zBb?=
 =?iso-8859-1?Q?wDi3x6crsqxz9EUh1FWodN8t+BPaHUpA8KJJBnnWKo16m+sQ/2hBzb51bE?=
 =?iso-8859-1?Q?90meOs0D26oOugBDY0x38oIzlIO5yJVqWalh0kamq7nVqRWR9b/N/KrczN?=
 =?iso-8859-1?Q?N3N2HxqEg9C25nzXnkqw8eHaNU/EJRlTmRjIn4OWPmHgmCToRC94+f7evv?=
 =?iso-8859-1?Q?aG+iynP1eYhVqC6ty+TGtktd4NY5+sfi1v5mKR+q9sOzP6w7OAy6YE1qZx?=
 =?iso-8859-1?Q?YtWv3LYzs1tvYJ9VjoYUs0Oxv9nPBHVP5I4EMjmXY/0cERQZuO0k1xJ6Bl?=
 =?iso-8859-1?Q?pAGO/tOutSQOftTiBrbI0v587V6GRpdV2Ed/9FjHrvVrAHAMiUwYkEhEuS?=
 =?iso-8859-1?Q?KdKlUZwqGXWDK8Nb5YghO/rs22IK5VZXjmX07hmUcSomB20uEecJ/vfCrA?=
 =?iso-8859-1?Q?6qQzrj3r1Bwrm67KolvjrUnwWSlzNQi1653f2p/Hai42xF1dM2HEowfnVe?=
 =?iso-8859-1?Q?2rnJYud1gfWQzsfQA1DsB4pbF8aUnzBKcljr9m8/4PedRR3TXXU6h7Y8Yt?=
 =?iso-8859-1?Q?a2CwDvk1JJeS3zU8W5QqNQY04+4T4rV1OqU2itj8oy+SkpKQyALeR9UVnZ?=
 =?iso-8859-1?Q?2n56oAkfgB+ilGwVEHI/+VQfIkcRBT1t78KiTQB/S1sbmM5gmnB3M6vvto?=
 =?iso-8859-1?Q?dCkKR/a5/9M31W6xXaKh8avYZY8xqMDHb8vTlmlwTV9g06oObSL/my+wv6?=
 =?iso-8859-1?Q?bA4dDX3IWk4oGToDrGETMYQIML3I4U8IczPU26r3/GmWALQuBHT7NSJKoo?=
 =?iso-8859-1?Q?aZfoHTj7ele+mh+e88vQjjqoQJ3w7O01aoJVecYh963TG8B1D82Aakah17?=
 =?iso-8859-1?Q?gxJVR0eSgNzz4ZzvTytEJIM5/hkyvFjmn5/gtJATx5MO92CQjeH8SjHE2T?=
 =?iso-8859-1?Q?xoYHqDou1dezITOzl0BlTS660rt9TprevVfdi3pjt2lJ8R4GIeFacIr0jM?=
 =?iso-8859-1?Q?VRt4b5KsVhCSbR0vwpYJpGTbsG4WcBbt7HpwlaMaXQn3Ecudc8MkzYcPm0?=
 =?iso-8859-1?Q?xvwRmViBSFyBwHrI2gwarjtYc2KrvXKkicmXFQ1F8K457iXDWXiCUp7GL0?=
 =?iso-8859-1?Q?LWg5qVjMQx60lTLOAGErDVqpAnhnKLMFCD2v4tG19vc2r0Ym7ayuA06qdd?=
 =?iso-8859-1?Q?DpOnLAeiUHp432GzZow2/bZUCn9S+1CEkyjRVCOAnkPAeOUlbmMgFWEWHj?=
 =?iso-8859-1?Q?X5zve/dFY6SE8WjBxMNWkziMnv8PPKQXsQpVmCw7dpmZffcVu1RKKMNzQo?=
 =?iso-8859-1?Q?NwM37yWoXxr6e5o4clW/1G+QXJQYFuaTkkFFIOECiSvXCVty1vmdAIcVA4?=
 =?iso-8859-1?Q?UOGCZGcnpcYapLODQJnCnoXH1Pas3BEIY2FF7QdRws6H1Hpam7zyNGMwn/?=
 =?iso-8859-1?Q?HBshiFSHLp+fY3WmtSg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f34297-b6f6-40f1-982a-08dde715f82d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:10.0376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbqN9XlEA4znltUzACnOT0VyOqFZNFbMyFn5AFXK7uKjaxtKsC22OeAsYNg6HHkUf8wTF8wxoX9/veciIvBc0C8ytwX3KKzpCAyCn9mCI98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

Currently, many common functions perform the same operations to calculate
GIC register addresses. This patch consolidates the similar code into
a separate helper function to improve maintainability and reduce duplicatio=
n.
This refactoring also simplifies the implementation of eSPI support in futu=
re
changes.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V5:
- fixed a minor nit: changed %d to %u in the warning message because the
  IRQ number cannot be less than zero
- added acked-by from Julien Grall

Changes in V4:
- no changes

Changes in V3:
- changed panic() in get_addr_by_offset() to printing warning and
  ASSERT_UNREACHABLE()
- added verification of return pointer from get_addr_by_offset() in the
  callers
- moved invocation of get_addr_by_offset() from spinlock guards, since
  it is not necessarry
- added RB from Volodymyr Babchuk

Changes in V2:
- no changes
---
 xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
 xen/arch/arm/include/asm/irq.h |   1 +
 2 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..29b7f68cba 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
     }
 }
=20
+static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)
+{
+    switch ( irqd->irq )
+    {
+    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD_RDIST_SGI_BASE + offset);
+        case GICD_ICFGR:
+            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
+        case GICD_IPRIORITYR:
+            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
+        default:
+            break;
+        }
+    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD + offset + (irqd->irq / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTER + irqd->irq * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYR + irqd->irq);
+        default:
+            break;
+        }
+    default:
+        break;
+    }
+
+    /* Something went wrong, we shouldn't be able to reach here */
+    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%u"=
,
+           offset, irqd->irq);
+    ASSERT_UNREACHABLE();
+
+    return NULL;
+}
+
 static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_fo=
r_rwp)
 {
     u32 mask =3D 1U << (irqd->irq % 32);
-    void __iomem *base;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
-        base =3D GICD_RDIST_SGI_BASE;
-    else
-        base =3D GICD;
+    if ( addr =3D=3D NULL )
+        return;
=20
-    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
+    writel_relaxed(mask, addr);
=20
     if ( wait_for_rwp )
         gicv3_wait_for_rwp(irqd->irq);
@@ -463,15 +513,12 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32=
 offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + (irq / 32) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE;
+    if ( addr =3D=3D NULL )
+        return false;
=20
-    return !!(readl(base + offset) & (1U << (irq % 32)));
+    return !!(readl(addr) & (1U << (irqd->irq % 32)));
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +605,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
u)
 static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
 {
     uint32_t cfg, actual, edgebit;
-    void __iomem *base;
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
-    ASSERT(irq >=3D NR_GIC_SGI);
+    ASSERT(desc->irq >=3D NR_GIC_SGI);
=20
-    spin_lock(&gicv3.lock);
+    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
+    if ( addr =3D=3D NULL )
+        return;
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
+    spin_lock(&gicv3.lock);
=20
-    cfg =3D readl_relaxed(base);
+    cfg =3D readl_relaxed(addr);
=20
-    edgebit =3D 2u << (2 * (irq % 16));
+    edgebit =3D 2u << (2 * (desc->irq % 16));
     if ( type & IRQ_TYPE_LEVEL_MASK )
         cfg &=3D ~edgebit;
     else if ( type & IRQ_TYPE_EDGE_BOTH )
         cfg |=3D edgebit;
=20
-    writel_relaxed(cfg, base);
+    writel_relaxed(cfg, addr);
=20
-    actual =3D readl_relaxed(base);
+    actual =3D readl_relaxed(addr);
     if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
     {
         printk(XENLOG_WARNING "GICv3: WARNING: "
@@ -600,16 +645,13 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
=20
-    spin_lock(&gicv3.lock);
-
-    /* Set priority */
-    if ( irq < NR_GIC_LOCAL_IRQS )
-        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + =
irq);
-    else
-        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
+    if ( addr =3D=3D NULL )
+        return;
=20
+    spin_lock(&gicv3.lock);
+    writeb_relaxed(priority, addr);
     spin_unlock(&gicv3.lock);
 }
=20
@@ -1273,6 +1315,10 @@ static void gicv3_irq_set_affinity(struct irq_desc *=
desc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
+
+    if ( addr =3D=3D NULL )
+        return;
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1284,7 +1330,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
=20
     if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+        writeq_relaxed_non_atomic(affinity, addr);
=20
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index fce7e42a33..5bc6475eb4 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -29,6 +29,7 @@ struct arch_irq_desc {
  */
 #define NR_IRQS		1024
=20
+#define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
--=20
2.34.1

