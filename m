Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1364B1DD11
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073327.1436300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Ox-0000hb-MR; Thu, 07 Aug 2025 18:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073327.1436300; Thu, 07 Aug 2025 18:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Ox-0000dv-In; Thu, 07 Aug 2025 18:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1073327;
 Thu, 07 Aug 2025 16:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3vd-00075A-6t
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:57:21 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a8af35-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:57:20 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:57:18 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:57:18 +0000
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
X-Inumbo-ID: 94a8af35-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiu/W6u4v+RMGD6E3wI9Cg5Wodnq5NTBJBi5iG2J1vv2YuELzlA29SDC81GXv1tFUd/znF/Gby00IKqldtQz0d2lrze3hSePR18RCE/lvy3fbk+4Ck+MXZWl8X40nY0Lo5ZDcwWbylUn9bi2fv58EHDmez2rgpC8vR4BnELA0MwgP28QwXAwg7trtEAhb6LZg6qfh5PPTYUSfXIo+mKgzXPv5xYHhmK0LF/Y4Juj6SxCuUgYmJkpxn5U4fJV7Fwqwbk6ToZbW2a+vCzYtfmJHEsI0ELzmx5YH1tNRSvgxG5V44TNuNvptHzfxP2fX9D/AxTZV2gcIs4ufZnsFmQ+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UM1qtAcBbUUXfA0PSZHA3rf9UWzJXGhA0wCTFpz1jc=;
 b=pwKIE2Bms5tv8T+pZu0/ETWoYux9TY/G5vE79Mwj7w47diwCCKOwmSsYVMHXg56ZFr3oYrdVZvhj3DfL5oUka8jD+FSBm5xGmsfjcoGr0qtzuik+ut10iUbzVyMbmbk+rdrfxW8TZVG8WXRHsPrlv27ZHpVDxKwKtB9MuccT6ruNQvJ6nsB7qPmBdktbP64ReuFJCdxegPJJh6JXHQWfxaz3r39JuW6vpLDNYZPxJbe1dDSoiMvkO40GNMgtdPGoOEFV9vE6b68gxuA5CVtFVly3D7yf7Jb9lK2K46Sb0g1SmvZj1mzbUqlA/IqzAjWoyKwhecicWsJTxz5ckByKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UM1qtAcBbUUXfA0PSZHA3rf9UWzJXGhA0wCTFpz1jc=;
 b=plqXWDIL4egukZpdFDz/IdqiEea4t0EoOcSK1OVLX0U1oHOniXqsG9wb93cQS1rMVvlR85r3TMkntdyZKZPjLAo8t7PZKyPeHH0NgbkXe/ZQ2R0xFArFUu2RMU4CFkn9TALnUHT7SOk/EsB28xX3F+axqUCXOUzCh0pbO1zUQNGAVs8Qfmxd6U6eVVz5b7vo2E0lPFSpRoI49YDbfm3o0Jc+Fku+2jT/ZAMpCRQPz9I+6tk1bZaxuNnLU/LcGdFzPKT8GnqwKKyevjd2hHUwMAIDh/bPKxe06wctZd9IUujakJC2WHAZXVeW0odaDB4jedkkMfu4+R289Y/quiJDIw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jean-Philippe Brucker <jean-philippe@linaro.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Eric Auger
	<eric.auger@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>, Will Deacon
	<will@kernel.org>, Joerg Roedel <jroedel@suse.de>
Subject: [PATCH 01/20] xen/arm: smmuv3: Maintain a SID->device structure
Thread-Topic: [PATCH 01/20] xen/arm: smmuv3: Maintain a SID->device structure
Thread-Index: AQHcB7xVBFFhVx5ypUmf6S+XKba4xQ==
Date: Thu, 7 Aug 2025 16:57:18 +0000
Message-ID:
 <1b9f56697cec0380c7bd1591405beed7d2bbddab.1754580687.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 6381b6d9-1233-4c20-8540-08ddd5d377e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?upCwRgjqt5d15yoIXoUeHh8jEIkYoQc28U5TyUKIkFUAcIY7fRhgfOuJZB?=
 =?iso-8859-1?Q?7D8TNW9GA0f9XFXKauPgLhHZmXDuxvKda8IvCNqha3MX2a3RyUrd3wAYrI?=
 =?iso-8859-1?Q?d9Q91put0uFFLbtOO0+Llcio2T9vKvl4qKUSzqLA0tkp+hHqZNnYOacj0j?=
 =?iso-8859-1?Q?od88NrqcVQk7vqhMjYpg2+woSmEYK/C/tSvCcKGNKl+Is8THPlqUn3kIgJ?=
 =?iso-8859-1?Q?Fanuhi0QBa7P/fBAjnzJPJ3ZwuhF3zzLnanL0ri3WgTP2bqUmoTfRwM6eq?=
 =?iso-8859-1?Q?9Wa/cipUwPU84Du4VY4s60kIrwMzsgZ0i7Xo9AJ9a8/SOOUnapWJOC8xuA?=
 =?iso-8859-1?Q?KKPfUe04BXQNtxNbv2J8bgfhDucvLtvC/PmWbIp7HvHvv0/sdSYmfxMWU9?=
 =?iso-8859-1?Q?6sMnLGDHxc80B9QPTAJk5nT8/pyTURvNChfnltlvdGU9vQjlZvLIeggbQw?=
 =?iso-8859-1?Q?hSOBlPrWfxF4euaEMRr3HT1SXXb5xfL0XUy6gjLJHGZUnYDQQXD5mwO7hp?=
 =?iso-8859-1?Q?pEesbMIqBas1gUiwQh6SV55BFFmwXEDnC5lSri8NqgFJN8HWAfok9J6fwC?=
 =?iso-8859-1?Q?LXdOYaoEeSJCC1YGGdLAznNIEAJoLBMA+RsZRN1rRtV2s2ca1JfhC01iVv?=
 =?iso-8859-1?Q?5eDXqr05d+/6vcM1egX+O8vZJiXgv1ZxWr9lpLM+UWB+gK3UYTk4odCAP9?=
 =?iso-8859-1?Q?5TqbCVzk20C+SrcRk+RGLQUbtKiecN7ZonGlw+4TNvqClCz2NEHwXRypNo?=
 =?iso-8859-1?Q?oGHfTgeudLS94tw+sOKLhGIRjmTHKGiNnNCNUcVSsR/Evks0pcJn1unMmb?=
 =?iso-8859-1?Q?Ry8oWy0Marhgu5ZW5j2gI7fgziJEAHW2spRqDy+m1Fx+i4vziYA7k2GaA5?=
 =?iso-8859-1?Q?scjaTSSw7p32g/lfxkl+9A7P+BJPyPdslUr5w5DOe8fmFhKVD5sjY7RHOH?=
 =?iso-8859-1?Q?KExpBU//2afe4+ETLQagC3A6H6DzLqTk7D8X1UqEoIluiUNyC2N/LCk5LE?=
 =?iso-8859-1?Q?T6mF4m87D7nSusH6HKN6eSzRMXCtpY7dX0O3PNQwkv/QSLL/QkEC91zUI0?=
 =?iso-8859-1?Q?OJFCD0DtlVKw+MBHp7oikbM7PwRSIX4mWH6x2gmM1fsXXqfiYRTrtxtDHZ?=
 =?iso-8859-1?Q?VUeCrLSJBZIBsBg0vs9ZahH24FH+Ou1bHWG57/LkW7D8ihaSsQnSqoK+B7?=
 =?iso-8859-1?Q?bTVFzEVgFkgl8c3IqUbl84jgH1FCjhuz8FT5x2CArrd98/95iLLJ/WZrb2?=
 =?iso-8859-1?Q?XL3wchxpzyKOUm/YwyZppZwI7MgjiQWnov1mMi/5ijVVvgfVDYsRVPlNFA?=
 =?iso-8859-1?Q?VBDSA7UkHadejqtvWeZxiNZQdjjrp/8/WXPTwsXgu8FyirPal9PMIv3sEa?=
 =?iso-8859-1?Q?oCBk77JAtd4mcjCQHz5GUo/+tqeAbXI6yh1rNtirfVgg5xORvmWuqe56KQ?=
 =?iso-8859-1?Q?zDqSW763YRSdhuk1/FKToURf3MDF+ay6BU8VtNpJP3riTRQG8bCEs/JODY?=
 =?iso-8859-1?Q?5dAeHjjYlZstbapXKPn2E4x7JQOoyBoD5hOcp0Q7cO5emz4cEnWSyF9N0f?=
 =?iso-8859-1?Q?VpM1/Dg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uh2Yoo12Yn++fdeYFNeTaiu9AkkqEBmxA8WEiL1UHX9QQ3ERVOhVF3s5+E?=
 =?iso-8859-1?Q?fV3RYOIHjmvp3Uk7IusfUMmNNet/NcKIPw4kxMQDLxPMTJUBoN1j5QXOJS?=
 =?iso-8859-1?Q?tHoBWwmPF4zBVKgh1j9VIOVxpGlMhSDQhncU3GdKPQttrM8viFcA2cvoik?=
 =?iso-8859-1?Q?ERVqYJpweFi5joJ5MVsjGp9aIfTkTdiXxzGC6COcA2ggYOkJo28EueCY2f?=
 =?iso-8859-1?Q?/48+nRtXvx7bT9WuJCMjvhmRqfuwzfVgIKL+E8kvAt5J5gldjFgt42gba8?=
 =?iso-8859-1?Q?zagJKGMridb2UbKGiGD8UDoqcIZLDODRHy9KYuqIdLinApCSsnpeEP5IPH?=
 =?iso-8859-1?Q?q/F85Y8EtYzUDVG6oMm7atM7b3MD/IBWpVXvaPyeASvboF+FSAEESpSs/3?=
 =?iso-8859-1?Q?fbyt9y1P/t0ysPeMGldJ8gDAkylX3t7qo5GpL3cA35G0L/zxfkoVQ6F/0u?=
 =?iso-8859-1?Q?qV+VkyQ6KJGTddGBuOK/vES+ZHGr1Fk5t3xjAPknskBBZTtmmTGiSDPFzc?=
 =?iso-8859-1?Q?o9w6/uA1CQjrNspiVQcCLGutqiA+Ty/Ik/RqNdrHow5Z8T2Yi6wF00ekMx?=
 =?iso-8859-1?Q?qbObvaUWXl/9oKGia7PIODkz6fhkB1b+reth8XYPBtf5/bwzs0YfXJIir9?=
 =?iso-8859-1?Q?Vx38eh8ju8GXnkb4Bq4uGpPHhNp09Y1PdDFuQ2gSadMivIS2pzs3BFR24e?=
 =?iso-8859-1?Q?x2QzNM+xqGPRpNnKw3T65DQML+Dw90rx80+ep07IQ0Sk9c2jbVvJD5u0CY?=
 =?iso-8859-1?Q?tcjXASBNQDEVhQm/yHg+7Fb6XZSDek75QiAMl+8H0IDFeeDX3l/Bc85M2/?=
 =?iso-8859-1?Q?3CaGzz4rLSiTv4f5OxasPl2zpdQJEeAWdLAzRJ5wIG8k7mKsm7Xs5ImU4p?=
 =?iso-8859-1?Q?mdFn2VKqRMf06azbyHmTNX59aENYvSpJyDeRczwg2ijhJ/zXfmYMZUJEbJ?=
 =?iso-8859-1?Q?6AxkdG21LbywetFh6oQv+86AVTJ/Sj0UcwVOuS68n5SZIh7THhgzdoRx8+?=
 =?iso-8859-1?Q?DiuGmgQS79XNb4u5fBfnujutiGuaVZkmLKo3SnbtGz1Cl/w/JqjfEI+XVW?=
 =?iso-8859-1?Q?lfYpyHNJNM/Bhl9PvRP9FzwwpkvL8eS1JhUt6qO/+ShUmkNt8Y+L7H21/A?=
 =?iso-8859-1?Q?N7DmAWJyMrQuuk1GVWcDrazZIOHkLmhgWEBPXiw1ojgm5kLXZQJEG3f/eF?=
 =?iso-8859-1?Q?rjrcwM8hRYDPxfPy1oTJgx6GCe+Mtl9DM+8qIHfPAlWduCA+5vIX7ifIJA?=
 =?iso-8859-1?Q?asBKe3ZDuB4KhSBDf1ds3MnmKOrCHQ+CIUFWtMk4yB7Efd4t/iClnuTm3V?=
 =?iso-8859-1?Q?EO1suVZV4LqNIqviStVdG9sDVeh1YXlLM3AeXcepc0Sq8Z9wbXNKuDI9ab?=
 =?iso-8859-1?Q?s68QyDaKP/uwbQfUzWtAnrp0qEasvPAZnEQC+K4VBj+nX39nNMIyiT02/b?=
 =?iso-8859-1?Q?3d+c+qwMJQWE693DisHlqgi3OQh5PrfrKRbAEWbQbgSQ2xKFM8PRAuVYE5?=
 =?iso-8859-1?Q?q3wstTzlHf3DqabTPCQYhHtqb09DhPh+9GvTz2Rlpi93bJL8aGfnIBPMgQ?=
 =?iso-8859-1?Q?QX1b+Mu4srC5D/qEviI4XJrQszvQD1D/LJLkSsaOIHx25G78/1o+QZxQ7v?=
 =?iso-8859-1?Q?+6vJudfrVCSyMif09nVG0Ps44/QYpUhC8O?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6381b6d9-1233-4c20-8540-08ddd5d377e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:57:18.2614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0HZ7JWChDPkC/eJbAkw+KGTR1Fx4/s+OtEpCGdXiJ/kFYK6JMKgtq2y9YRKFPhGz5nG/0Wenc9al/lPGlIBPzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Backport Linux commit cdf315f907d4. This is the clean backport without
any changes.

When handling faults from the event or PRI queue, we need to find the
struct device associated with a SID. Add a rb_tree to keep track of
SIDs.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Acked-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20210401154718.307519-8-jean-philippe@linar=
o.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cd=
f315f907d4
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 131 +++++++++++++++++++++-----
 xen/drivers/passthrough/arm/smmu-v3.h |  13 ++-
 2 files changed, 118 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 5e9e3e048e..307057ad8a 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -793,6 +793,27 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_dev=
ice *smmu, u32 sid)
 	return 0;
 }
=20
+__maybe_unused
+static struct arm_smmu_master *
+arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct rb_node *node;
+	struct arm_smmu_stream *stream;
+
+	node =3D smmu->streams.rb_node;
+	while (node) {
+		stream =3D rb_entry(node, struct arm_smmu_stream, node);
+		if (stream->id < sid)
+			node =3D node->rb_right;
+		else if (stream->id > sid)
+			node =3D node->rb_left;
+		else
+			return stream->master;
+	}
+
+	return NULL;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
@@ -1026,8 +1047,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_ma=
ster *master,
 	if (!master->ats_enabled)
 		return 0;
=20
-	for (i =3D 0; i < master->num_sids; i++) {
-		cmd->atc.sid =3D master->sids[i];
+	for (i =3D 0; i < master->num_streams; i++) {
+		cmd->atc.sid =3D master->streams[i].id;
 		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
 	}
=20
@@ -1255,13 +1276,13 @@ static void arm_smmu_install_ste_for_dev(struct arm=
_smmu_master *master)
 	int i, j;
 	struct arm_smmu_device *smmu =3D master->smmu;
=20
-	for (i =3D 0; i < master->num_sids; ++i) {
-		u32 sid =3D master->sids[i];
+    for (i =3D 0; i < master->num_streams; ++i) {
+		u32 sid =3D master->streams[i].id;
 		__le64 *step =3D arm_smmu_get_step_for_sid(smmu, sid);
=20
 		/* Bridged PCI devices may end up with duplicated IDs */
 		for (j =3D 0; j < i; j++)
-			if (master->sids[j] =3D=3D sid)
+			if (master->streams[j].id =3D=3D sid)
 				break;
 		if (j < i)
 			continue;
@@ -1470,6 +1491,80 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_de=
vice *smmu, u32 sid)
=20
 	return sid < limit;
 }
+
+static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
+				  struct arm_smmu_master *master)
+{
+	int i;
+	int ret =3D 0;
+	struct arm_smmu_stream *new_stream, *cur_stream;
+	struct rb_node **new_node, *parent_node =3D NULL;
+	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(master->dev);
+
+	master->streams =3D _xzalloc_array(sizeof(*master->streams), sizeof(void =
*),
+					fwspec->num_ids);
+	if (!master->streams)
+		return -ENOMEM;
+	master->num_streams =3D fwspec->num_ids;
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i =3D 0; i < fwspec->num_ids; i++) {
+		u32 sid =3D fwspec->ids[i];
+
+		new_stream =3D &master->streams[i];
+		new_stream->id =3D sid;
+		new_stream->master =3D master;
+
+		/*
+		 * Check the SIDs are in range of the SMMU and our stream table
+		 */
+		if (!arm_smmu_sid_in_range(smmu, sid)) {
+			ret =3D -ERANGE;
+			break;
+		}
+
+		/* Ensure l2 strtab is initialised */
+		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
+			if (ret)
+				break;
+		}
+
+		/* Insert into SID tree */
+		new_node =3D &(smmu->streams.rb_node);
+		while (*new_node) {
+			cur_stream =3D rb_entry(*new_node, struct arm_smmu_stream,
+					      node);
+			parent_node =3D *new_node;
+			if (cur_stream->id > new_stream->id) {
+				new_node =3D &((*new_node)->rb_left);
+			} else if (cur_stream->id < new_stream->id) {
+				new_node =3D &((*new_node)->rb_right);
+			} else {
+				dev_warn(master->dev,
+					 "stream %u already in tree\n",
+					 cur_stream->id);
+				ret =3D -EINVAL;
+				break;
+			}
+		}
+		if (ret)
+			break;
+
+		rb_link_node(&new_stream->node, parent_node, new_node);
+		rb_insert_color(&new_stream->node, &smmu->streams);
+	}
+
+	if (ret) {
+		for (i--; i >=3D 0; i--)
+			rb_erase(&master->streams[i].node, &smmu->streams);
+		xfree(master->streams);
+	}
+	mutex_unlock(&smmu->streams_mutex);
+
+	return ret;
+}
+
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *de=
v);
 static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *=
dev,
@@ -1479,7 +1574,7 @@ static int arm_smmu_deassign_dev(struct domain *d, ui=
nt8_t devfn,
=20
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
-	int i, ret;
+	int ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
 	struct iommu_fwspec *fwspec;
@@ -1516,26 +1611,11 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
ice *dev)
=20
 	master->dev =3D dev;
 	master->smmu =3D smmu;
-	master->sids =3D fwspec->ids;
-	master->num_sids =3D fwspec->num_ids;
 	dev_iommu_priv_set(dev, master);
=20
-	/* Check the SIDs are in range of the SMMU and our stream table */
-	for (i =3D 0; i < master->num_sids; i++) {
-		u32 sid =3D master->sids[i];
-
-		if (!arm_smmu_sid_in_range(smmu, sid)) {
-			ret =3D -ERANGE;
-			goto err_free_master;
-		}
-
-		/* Ensure l2 strtab is initialised */
-		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
-			if (ret)
-				goto err_free_master;
-		}
-	}
+	ret =3D arm_smmu_insert_master(smmu, master);
+	if (ret)
+		goto err_free_master;
=20
 	/*
 	 * Note that PASID must be enabled before, and disabled after ATS:
@@ -1777,6 +1857,9 @@ static int __init arm_smmu_init_structures(struct arm=
_smmu_device *smmu)
 {
 	int ret;
=20
+	mutex_init(&smmu->streams_mutex);
+	smmu->streams =3D RB_ROOT;
+
 	ret =3D arm_smmu_init_queues(smmu);
 	if (ret)
 		return ret;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index f09048812c..fe651ca5a7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -636,6 +636,15 @@ struct arm_smmu_device {
 	struct tasklet		evtq_irq_tasklet;
 	struct tasklet		priq_irq_tasklet;
 	struct tasklet		combined_irq_tasklet;
+
+	struct rb_root		streams;
+	struct mutex		streams_mutex;
+};
+
+struct arm_smmu_stream {
+	u32							id;
+	struct arm_smmu_master		*master;
+	struct rb_node				node;
 };
=20
 /* SMMU private data for each master */
@@ -644,8 +653,8 @@ struct arm_smmu_master {
 	struct device			*dev;
 	struct arm_smmu_domain		*domain;
 	struct list_head		domain_head;
-	u32				*sids;
-	unsigned int			num_sids;
+	struct arm_smmu_stream		*streams;
+	unsigned int				num_streams;
 	bool				ats_enabled;
 };
=20
--=20
2.43.0

