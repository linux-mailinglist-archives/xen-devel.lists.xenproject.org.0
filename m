Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14DB1C80B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 17:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071901.1435251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfbZ-0005jN-Rp; Wed, 06 Aug 2025 14:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071901.1435251; Wed, 06 Aug 2025 14:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujfbZ-0005ga-P8; Wed, 06 Aug 2025 14:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1071901;
 Wed, 06 Aug 2025 14:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHpH=2S=epam.com=Dmytro_Firsov@srs-se1.protection.inumbo.net>)
 id 1ujfbY-0005gS-47
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 14:59:00 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e11621ef-72d5-11f0-a323-13f23c93f187;
 Wed, 06 Aug 2025 16:58:58 +0200 (CEST)
Received: from DB9PR03MB8327.eurprd03.prod.outlook.com (2603:10a6:10:37f::12)
 by DB3PR0302MB9206.eurprd03.prod.outlook.com (2603:10a6:10:43c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 14:58:55 +0000
Received: from DB9PR03MB8327.eurprd03.prod.outlook.com
 ([fe80::b7f:9b2d:242e:f7f0]) by DB9PR03MB8327.eurprd03.prod.outlook.com
 ([fe80::b7f:9b2d:242e:f7f0%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 14:58:55 +0000
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
X-Inumbo-ID: e11621ef-72d5-11f0-a323-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6Bc53H2B2648t4bDshHlFLhRst0wi0/rZxiOD3hLazKQ3V66NvTijGyTqJQTagEBZUy2N3M0sXBm8Ii/VLqioWW7YQ8mZC1SmIMvSsqsaQbGg4CyLFyHzHHR7qcjiESU8yEO7RTZzQ+1zyxDlHtM7KlvTbEWEbScv0KW0znvhx/7SPCX1VadtspvYBPv2yPOaUrYpnoh7OCVkDfMwew1jbzOWNV1X68NSfm3vO6JoD6vludLENuQfgmO13G7yD7iUbRsU+rBKk4XKZe6Q17wLsr8aWQ2cKYjP8eUtH6Lem9MqLv7cui9MYlWZvp/yGfKsSCfcOG+7i6Tte4SKiRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYhpCbpdRqtHQG0qWN9E2ZSljMfq2rfgBTqMs/d2TRg=;
 b=Ovvj1916yHz++4f7xhtPHXS14ToC1g2H1d1unVTaqJjLw17bp8GAqfzV8HGytPMI0jQ6CZle4SAy1TMI6StmZbH/Rxmw8weDsAmE4bTc3SccAj5LekdA2RY7kL5WpTyBkR9Z1T9yA7Ysr1A8p34ihBwIVhBDNZGd1Oik/zIp1Tx/5vpWEgdvoqqcqWYPMqNEXyHZ5ZWwzEuwfNjRvekIyemvH7KBiewy3UMDy8DJGf5S2nEJfDGH9ZYA8aebnzBIqTYbVS1Fib6ME9mUjh2F/4mJibHYlegIGRdxkJ2sY5/wof3gu1ZJDXybNxx/la5522o4Y8QaEX57RGRu2xwikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYhpCbpdRqtHQG0qWN9E2ZSljMfq2rfgBTqMs/d2TRg=;
 b=nXEAxa4733/BGq2cxcEcqvQN8s2gZTgmym7o9Lz2FU4DI1HgUzo9Y+WXr54gKGmmp0I3QgmUuqlfyN3NkPwVjREQrvjlawT2JppbV73RyYjlQdMLMouXTsFHMWJVMXKa9TngCwYUBe46IzXFBHaYcHETSi5htacry9LQ6oUuD621xn7bxy8470G6dl/g31NM4QEN7vtNQRbf0GeGge1tzfDPG6AsOaN614Fgagx25pZUp8ySS7ipUEgyim/J/lAOvOpIx6/j1XDVCoRn8u0DBIhG92vkFjxnyoJKNpfqBYfOdvpCsnEcxPAQIzPFgNr3UF+mdy12yqmzP7VeyGD8nw==
From: Dmytro Firsov <Dmytro_Firsov@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Firsov <Dmytro_Firsov@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent SMMU
 queues
Thread-Topic: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
Thread-Index: AQHcBuKhRQAjcpitXUCHafCQJ8zznQ==
Date: Wed, 6 Aug 2025 14:58:55 +0000
Message-ID:
 <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR03MB8327:EE_|DB3PR0302MB9206:EE_
x-ms-office365-filtering-correlation-id: 182a360d-2273-469e-71aa-08ddd4f9c3f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?g7wtv9qkQhW0Y7rq6cMcGJ9gxBy+F57eNp3QEiUgEcweiTRuVXZhVkVgYx?=
 =?iso-8859-1?Q?H3tc8X4jr0C5xZ22TwlsDDe6UooYhii2reSAN+8okKRtsVNjBv7aywcTAA?=
 =?iso-8859-1?Q?wH4q1iVNsBnRsareMzk5VDzhjdv4EiZj/Dg9Qa/XsWTLJjY7PGYlrppSe1?=
 =?iso-8859-1?Q?2nPrSS8YA3r/ny9KFe/W6dT9n+BVB8wCi9plODybmUhbmSi/Lf/fv/JghV?=
 =?iso-8859-1?Q?tsY7U55hFoJ3HkFzBOEDbp8z3lviRKUF427txyX3pVmo8Al/q8blPONVD5?=
 =?iso-8859-1?Q?JQUpVZYGYYURgRtuOILDhEOvJKlbA1wdgzcvOtWuCkUN0vb1WgkgAVu7fS?=
 =?iso-8859-1?Q?k7LX0T3amHwjvK7kLo5OhgwWlXaxPpBTzXydYNgGZoyHRSSuXMEQIqZntX?=
 =?iso-8859-1?Q?4fdCA3aLTdw3Ss6oCjJRLDoU+1j2q+Q0+uUzTLU9BuwWGXnmHj25MKLM07?=
 =?iso-8859-1?Q?CF7VDuSzG7Bs3MTuQzThG9joxtaUnK5qvwYXq/FuHSKPHjne9oJT7ryIW/?=
 =?iso-8859-1?Q?LdCHb0Hs7KK4OR0vYNwtpd+cpuZNLZgd50mS4qalUQmxk2Jz1Nxd1CPByo?=
 =?iso-8859-1?Q?cZeOWux+0Qs0ia3vwXlwqd6B3trVFyPMyejutxCPy8h45ghbOfLpICZqnV?=
 =?iso-8859-1?Q?0yekD6jUNHKrOtipVIlKnCzAL2zdHUWLLORlHndyvHrQNz56gl1Mrl8spd?=
 =?iso-8859-1?Q?IbNQ3wApjGs7Mm0XedvyMu4mvTDVD7NULQetpHn02whThemq1D1NbfA3wB?=
 =?iso-8859-1?Q?eQIhTIMGyV/+8ZVsAohWaC9lL4PiCaLALv0YgItsdIzJw5Re69rQ7Z5l7E?=
 =?iso-8859-1?Q?VtAoZ95t3y5WFiD1WPDuE/FPJhQv+a6q6K5HB6OFqzDw31Nr04DGjTsTk5?=
 =?iso-8859-1?Q?l45KvKKJ2ortyyriqcnaiYZ2G6sLG0MpEDsIouP9oSghZnR/aTJMNR69hJ?=
 =?iso-8859-1?Q?uKoCinbq242G3ZqjeHzOpu7V1g216LJuaBsCfRS5QkCj5PD8e+v5BZsVbh?=
 =?iso-8859-1?Q?WJ+qF7+LnkxjkjsCikNZAnsB2tQAF2+0b6LncKwP8t29MTT43qC5YPFzLI?=
 =?iso-8859-1?Q?CSSXkhvwkPATYYBOzRnRzLRBz97gzvSYduvFBf2JhhLL/0UvXG7yrvwdo9?=
 =?iso-8859-1?Q?DCf5ZshqTjYjUjnfh/McZXWel4aurs3JJwkBlbrkD40X2omdasQidJ3Fbk?=
 =?iso-8859-1?Q?Yr4dujHqCOLzmwdnDNtyTx1TUQz745E9ymQWWghM2wxOK2h14IvhTmxWis?=
 =?iso-8859-1?Q?1UPWX57dRfvrSgeEvD0fJczT9rv11qw0Zk00J56VO+FcsCtREDI9ESf95E?=
 =?iso-8859-1?Q?kGPSlScXC1gKiQJi2z3n49IFzSxuCYgqUj+I0dryxvbnCNQUinbSVg6Sp5?=
 =?iso-8859-1?Q?jmki+qNqyX7liV7eTmwSZUURvBaVRZwmtG0ZGLWR0H1RO8PT0aUYlQSbcW?=
 =?iso-8859-1?Q?URK3mKVBtjpcWSPXj3wbqqdtksC9ouXF1NzNocFM0t3jRfQdUniT7tofdF?=
 =?iso-8859-1?Q?/8tLg6izEirjeOsTptl0sR5qNVVxOnEZK5ZqGVvIsL6A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8327.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UY7Ik3MJ5hfDZ5X4JbPscjnVpta5R+qd8Y5lp6yXvSqTtVZKrbamF2Leue?=
 =?iso-8859-1?Q?kljgn5GNILowVsGi1GicQj9HSSGGQlEqgdGpox1e3TcLoMBku3Lh3cSGO3?=
 =?iso-8859-1?Q?yUZSeyHSMyax6bgXRC9UPw0tnjl6ZCGXVzxev93O12UV4yHM7QPi138oeQ?=
 =?iso-8859-1?Q?/iHoF8n+Cf+K7jMgzsBP0KTfoEBMAomE2qYjBb1VtvMV3D4WUyMVRmleDL?=
 =?iso-8859-1?Q?0FUKN007LJD1SOCV4lrS7rfs7j3EBEOszmaI5nmY+VFrN3es5sfoubdzmU?=
 =?iso-8859-1?Q?XytVTqIrNZPqB95qfTn0GSQOLzjIYUGjEd+mtgCVFTEuZ9DMRjh6UfuriP?=
 =?iso-8859-1?Q?wEfXRnB9rpeZL0GbVKxO94JsiRwJNupR7SgozsH1qUg+vCuhb1BQ7d63Hf?=
 =?iso-8859-1?Q?CA8gvQAjIGeLnrhhJlyrZAcIgAUiTxi1kZ+v7AIKZn3kuY16vnjhwrrSWF?=
 =?iso-8859-1?Q?9HsmU5IL5bajw0k99Mb560IhtMdV3oGnRI6BHf/5QzKx0aRZkRUThfXrbq?=
 =?iso-8859-1?Q?3sIDTiasO7nPFaq46o76UpviKAqw70/v8tgIvO3/N9wSiNXydjjgf8us32?=
 =?iso-8859-1?Q?io90TJT97YnnzxzzjpiUyQev8K/jsLna73uqMcWZV+hH3+ZKao/ebhrUar?=
 =?iso-8859-1?Q?qLrU090jKy7OFB75sWQ7pA+bjVFRhBYtbp/EQN6yXkUKzVy+cGzG6/Ul7q?=
 =?iso-8859-1?Q?a4f++jKrFhSPBESBUUed4RW+tHunqYbRbsqVFpH1JzWIeIRtSGKliaEo6K?=
 =?iso-8859-1?Q?gZNURhTEiV8OAu0t/fwYfPm4XDyz2TP239q5+lodc2ATZytra+Gn9vW9OY?=
 =?iso-8859-1?Q?gDIqOaOkbR7kWlVJFa+8ExP+ONLccgO6ymun04V8kZlkVUQxM4xkWhxNAk?=
 =?iso-8859-1?Q?yu/RqzvUwXMTvSL9qr7BIWb6VdNsPDFvR/vsrPvWg26H9r6pLsWbhBtiqn?=
 =?iso-8859-1?Q?8VZq2Zca/LbOPAnqmbIUpIVKF4HAWMye+jc/TWvbo3ZCPCrayRcYatNXsW?=
 =?iso-8859-1?Q?IBaXQpfaYeiTH0GCCU2yqF2HRaRW2BS+FE9ULL/YXRbLvqJgSahjteCCC0?=
 =?iso-8859-1?Q?nN63t+NkLWdR4ov4aQyynUOaM9HV/2DPx5gO4cfmCxUjDWt6K3EXQALP+r?=
 =?iso-8859-1?Q?0sOEiEOApzykYKrHc0rdyW1/uKRhWIzG+8uxfmHdbZfEVHctB6xZg6ojAa?=
 =?iso-8859-1?Q?H9hUguo1pT/NwICBiOFeYd/USxvn2JafDDUvQQSWPge1R465iiP/YCqPCg?=
 =?iso-8859-1?Q?rmJ+FsSfYfL5avHSKQSv4sbUmBMNiTC/KR4bVm8bwqXVvrqUJ5cDb7zIHv?=
 =?iso-8859-1?Q?7DiL5QGOPQw8K8YIs9+uhaBjYtCrB+jYjVWDU4od83esKSSKJccyOzzfC0?=
 =?iso-8859-1?Q?a8WP9N3gtHFyVATy0Nc8Airj4mLPuzzeeZlb5wNyn4NHNNyuEd8dwb+/Id?=
 =?iso-8859-1?Q?rR+dsRQsH3rfs/YqC1rMdNfsaW2X1vz2PO8yWeX8aXjpap8t7kpJMhoF9+?=
 =?iso-8859-1?Q?msmMiB4uMF8gUkMYi4Ho9TBKeMZSkN0nxtKFmM2C9TJhpB01C0RNtoZzCf?=
 =?iso-8859-1?Q?WJXwkjmKfuHCO6Rsoqy5Fel43yOXPxsGDlp27q9L9fT/M+OyYJ5i6wt7MT?=
 =?iso-8859-1?Q?XCGE8tinyrRywzDa5MXCn0fla49NNEMv30zfJb8Ovr4MJdf7IfqXYjVA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8327.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182a360d-2273-469e-71aa-08ddd4f9c3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 14:58:55.5199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gLWok0+Td+9QBQ0gJtVRxqmEFqgx+xa+n8lqOF+xIGql0NiZXyc2wPLUcSC1ZnFCcYqYttFgIKbVTBP8NCLC+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9206

According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
SMMU(s) that is/are non-coherent to the PE (processing element). In such
cases, memory accesses from the PE should be either non-cached or be
augmented with manual cache maintenance. SMMU cache coherency is reported
by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
Xen driver. However, the current implementation is not aware of cache
maintenance for memory that is shared between the PE and non-coherent
SMMUs. It contains dmam_alloc_coherent() function, that is added during
Linux driver porting. But it is actually a wrapper for _xzalloc(), that
returns normal writeback memory (which is OK for coherent SMMUs).

During Xen bring-up on a system with non-coherent SMMUs, the driver did
not work properly - the SMMU was not functional and halted initialization
at the very beginning due to a timeout while waiting for CMD_SYNC
completion:

  (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
  (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout

To properly handle such scenarios, add the non_coherent flag to the
arm_smmu_queue struct. It is initialized using features reported by the
SMMU HW and will be used for triggering cache clean/invalidate operations.
This flag is not queue-specific (it is applicable to the whole SMMU), but
adding it to arm_smmu_queue allows us to not change function signatures
and simplify the patch (smmu->features, which contains the required flag,
are not available in code parts that require cache maintenance).

Signed-off-by: Dmytro Firsov <dmytro_firsov@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h |  7 +++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 5e9e3e048e..bf153227db 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -346,10 +346,14 @@ static void queue_write(__le64 *dst, u64 *src, size_t=
 n_dwords)
=20
 static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
 {
+	__le64 *q_addr =3D Q_ENT(q, q->llq.prod);
+
 	if (queue_full(&q->llq))
 		return -ENOSPC;
=20
-	queue_write(Q_ENT(q, q->llq.prod), ent, q->ent_dwords);
+	queue_write(q_addr, ent, q->ent_dwords);
+	if (q->non_coherent)
+		clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
 	queue_inc_prod(&q->llq);
 	queue_sync_prod_out(q);
 	return 0;
@@ -365,10 +369,15 @@ static void queue_read(u64 *dst, __le64 *src, size_t =
n_dwords)
=20
 static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
 {
+	__le64 *q_addr =3D Q_ENT(q, q->llq.cons);
+
 	if (queue_empty(&q->llq))
 		return -EAGAIN;
=20
-	queue_read(ent, Q_ENT(q, q->llq.cons), q->ent_dwords);
+	if (q->non_coherent)
+		invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
+
+	queue_read(ent, q_addr, q->ent_dwords);
 	queue_inc_cons(&q->llq);
 	queue_sync_cons_out(q);
 	return 0;
@@ -463,6 +472,7 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_devi=
ce *smmu)
 	struct arm_smmu_queue *q =3D &smmu->cmdq.q;
 	u32 cons =3D readl_relaxed(q->cons_reg);
 	u32 idx =3D FIELD_GET(CMDQ_CONS_ERR, cons);
+	__le64 *q_addr =3D Q_ENT(q, cons);
 	struct arm_smmu_cmdq_ent cmd_sync =3D {
 		.opcode =3D CMDQ_OP_CMD_SYNC,
 	};
@@ -489,11 +499,14 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_de=
vice *smmu)
 		break;
 	}
=20
+	if (q->non_coherent)
+		invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
+
 	/*
 	 * We may have concurrent producers, so we need to be careful
 	 * not to touch any of the shadow cmdq state.
 	 */
-	queue_read(cmd, Q_ENT(q, cons), q->ent_dwords);
+	queue_read(cmd, q_addr, q->ent_dwords);
 	dev_err(smmu->dev, "skipping command in error state:\n");
 	for (i =3D 0; i < ARRAY_SIZE(cmd); ++i)
 		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd[i]);
@@ -504,7 +517,10 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_dev=
ice *smmu)
 		return;
 	}
=20
-	queue_write(Q_ENT(q, cons), cmd, q->ent_dwords);
+	queue_write(q_addr, cmd, q->ent_dwords);
+
+	if (q->non_coherent)
+		clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
 }
=20
 static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, u64 *cm=
d)
@@ -1634,6 +1650,9 @@ static int __init arm_smmu_init_one_queue(struct arm_=
smmu_device *smmu,
 	q->q_base |=3D FIELD_PREP(Q_BASE_LOG2SIZE, q->llq.max_n_shift);
=20
 	q->llq.prod =3D q->llq.cons =3D 0;
+
+	q->non_coherent =3D !(smmu->features & ARM_SMMU_FEAT_COHERENCY);
+
 	return 0;
 }
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index f09048812c..db936b9bd4 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -522,6 +522,13 @@ struct arm_smmu_queue {
=20
 	u32 __iomem			*prod_reg;
 	u32 __iomem			*cons_reg;
+
+	/*
+	 * According to SMMU spec section 3.16, some systems may have
+	 * SMMUs, that are non-coherent to PE (processing elements).
+	 * In such case manual cache management is needed.
+	 */
+	bool				non_coherent;
 };
=20
 struct arm_smmu_cmdq {
--=20
2.50.1

