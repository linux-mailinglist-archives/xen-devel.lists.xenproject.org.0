Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E72AFDB03
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 00:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037461.1410085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZGj3-0001yL-7f; Tue, 08 Jul 2025 22:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037461.1410085; Tue, 08 Jul 2025 22:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZGj3-0001x4-4x; Tue, 08 Jul 2025 22:23:45 +0000
Received: by outflank-mailman (input) for mailman id 1037461;
 Tue, 08 Jul 2025 22:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zIuV=ZV=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZGj1-0001wy-1k
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 22:23:43 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31263930-5c4a-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 00:23:37 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB6950.eurprd03.prod.outlook.com (2603:10a6:20b:23e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 22:23:34 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 22:23:34 +0000
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
X-Inumbo-ID: 31263930-5c4a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhvFrcFhBP5tFlHR16WF1iI0ROf+s3Rdg7KlcH7/F0cgKG30wGA6Div8+Uxc7GXqtMVER7VwzXF3dLvbETC/5zZ96Mg+1kAEngXfaQRLt4F15de6/VyJtsfjIPnqn5aGLE5uaOdc7ImOSQNsT7u8DKrKCirqOTOw3W+xbuWjZosZX6MOGRdg5lI1uzADh3sDW34SxIteUmNMyrmYkkGRqg1rrb8bXC689ZmJdrMCytm4JIiZL8smDnDWdGI3wo82a9oj7aSjAVi56dfp+ASUEObO+SHukV9JyFSrZnQj7NJGEKTbcVyR2dSVB3CmdZR5qDMvTVQVRjy7sRbpFfGABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSL+nBlysWAjeF9RWZBIhKqiPxkIVA8fOZOEHWD/5dY=;
 b=KIx16YXNj3TFYYCRrttwaAcuubSiF4ca35mCvgrTxP7AxAaKD/+yESDm1sM2L2028npTmm0N3ib2P1Hfe1EIDcM5MxKJxPUI+b7XjWfZ9oIversfLnxCXvTw7xmQN9xF3jrWLFUCEPasl0dsaOOoJRDTETzu4fXNH9XpKRdDtyByPyTMSnoHWQJsOhYGi/gxyzTvM9EK5hbqxaYPzB5oi5rn8iYBxTDei2x7qduYaJfVRDUE4ENly+XjG3gtirhQeamy6SdICZmm42vfUnbggTjplaRm8xVP9VJz+VSleJvPZU9qcYPcjUksC3krVkV3Vtug/J7KpT/RvOh5lXJtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSL+nBlysWAjeF9RWZBIhKqiPxkIVA8fOZOEHWD/5dY=;
 b=k3Jg728+6XEfy0XykeZH6lmREJDh8sMjuHxhKNxpV4kWoXbvvOkN1ffZuvte9fgpLcdqPeLhDHfUR/sJU4uze4hwR3Qo9b/0WISgAQrhqefRpAy1v252jT+qmxHl6BvFzg7QpuHkLxRaHw04vYRaOH1YL5cjarjDhZhdEAN7ZVvZEPu8uGG7pwyMr4TZQAu058SXZsAYGHYqV1DFm88Y+1yqyrEed6IvxI+QH7zPdyOpneK8y7XCDXzU7mIU3UdVhdIIC4lbLVNr0TL8IdMIK06YNtZqWEYJQEfqbxpXytRAey46heh9yadLF5t8OhfXq3wO77fWV4eDcFEZuq5PZQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH] iommu: remove unused external variables
Thread-Topic: [XEN PATCH] iommu: remove unused external variables
Thread-Index: AQHb8FbxvFY9lxhN0UqQVfttDSVR2w==
Date: Tue, 8 Jul 2025 22:23:34 +0000
Message-ID:
 <7e74f3da4e5529e33a4ec5426c0aaa7ca603a1c5.1752013287.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB6950:EE_
x-ms-office365-filtering-correlation-id: 544af76f-c199-4666-ed23-08ddbe6e13ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?t/h4MXrvLDEffx3fDHULjgC84bbjhNH4JgaoVmRKjIoWpq3N+3j96J2Z1O?=
 =?iso-8859-1?Q?8wHDWY+V4v8pe3O0BSp609Jl2iws6680F4Oiwb+aaDJyjd+NrAJnz8SxLD?=
 =?iso-8859-1?Q?vHJkS6S3hEJALZZqcdglf3PP9lzSJPo+MD9VQ0b62A9GflKHopknsK++7U?=
 =?iso-8859-1?Q?BkFkcKIqd0BBIXeHR2OZObXejv1sRIj+iJJ31yjfFECWiD8/n6iNlJyMYl?=
 =?iso-8859-1?Q?coG8tLFyuAUObJH28BJU6Hs6AvlynNBG1j4D/lK85T6SIGUqmZI0VftnMT?=
 =?iso-8859-1?Q?FebE0YO0Jy1o7SVtXaB1oAUI2lP9Wwjb2PQ07X+josoruylbkKtqZZibyc?=
 =?iso-8859-1?Q?VTbgjJbusioSrYwD5LR/n+V1a5WFY2OV86k72HKNT6TS2XoA6h7izE62A1?=
 =?iso-8859-1?Q?rTsPYT0na5sCPgLJAiE9mqZrrOB6AThihLklc4gEv3jAnhvN3xeDbOz8Dh?=
 =?iso-8859-1?Q?nbAYB0/mm5swvl/KV6Ge0b57u73+6xZ3wdmwxJGo8ocq10Omfa66oSwFYB?=
 =?iso-8859-1?Q?CrTlpHNWWfqky8U1RZBucBfV6zg9//ddAP1g5AI+jLpJVyry1pYE615tqZ?=
 =?iso-8859-1?Q?0WIZWUHuP2ESALx0o+23MQh7EMMH9jae/0VSo2xMztjw7POpj09lJdmhE+?=
 =?iso-8859-1?Q?EFTFJgjadRZk5rl4its1HMS0Eq3jmy0xG5DyRTh5oAAtzzzm+YiXVyI0MV?=
 =?iso-8859-1?Q?yl3YHwCLZmWtSAZOgSb8f7wc/Ec3Cg9cavZ4hIairIe23lCWb43L7ogYpc?=
 =?iso-8859-1?Q?LGCeGgllMmOKeB2rkiUTiplt2abrXWSsCYK3IYhWjvLfjk0OqlDSdPnz+E?=
 =?iso-8859-1?Q?y0toE/lECAzt3h/Y3On8TFRL9MNI5MOYrFHL86VNNpvGFaQZfieD2BKsLQ?=
 =?iso-8859-1?Q?g284n6f41B88hSqmP4BRHvV4rAprxAY/h8UlzNS3ZTsLnHgzhuvvMm7xYe?=
 =?iso-8859-1?Q?nmpbBdr1LhA3/401MWwrbdIfcILSalLSLZ9t5jp9kwi2ZMQxffwo8NBFHA?=
 =?iso-8859-1?Q?by5d91xqyFxFGB0U4fjU0XohBskHJdhOn94dughyAqaqjQ57NKI36FUye+?=
 =?iso-8859-1?Q?wiq4G9tRkoIo6TzNa3EiEj4RTBDEo8CYULSf4ELEjAv9kblfyIjd5Ot79b?=
 =?iso-8859-1?Q?hRRdMquLXqypn3z7OzC0SMjPYmEn88NjEHa8xRXNm+Me6n9xaj59xNPg9w?=
 =?iso-8859-1?Q?A50GB9etiyg3xeWHrlPmlpYfR9umUj5MXlki3wv1aAFp4+GN8V9tSN4/Gr?=
 =?iso-8859-1?Q?Wf8Ox5R/pYvLqRRy96CTJyC1tC+PbWZNguyqEbSytrJ85lBSWy367eezzo?=
 =?iso-8859-1?Q?Xp4m/MdgfwA8DeHbhQ56DE7qIQF0V8U1XRUcF/i4Ad6tNFYUciyukhAgfB?=
 =?iso-8859-1?Q?paPxjvkW3KP8EpBChCApFnb58z2Ed0vHIegoNTAbG+Z964w3okm24octXb?=
 =?iso-8859-1?Q?dH8c9cHPxVs7s2Or7Krjhtp4lavILkBguMfi1UO0aUby1iVLoUcACoM09F?=
 =?iso-8859-1?Q?i7+BkmYLGySWy7UOYb85REZVVKgfwAUeZfYpdmj4AXUw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tolKZiVmXPk8beIa+WDcQZHEPaFlBDRYCT+vy+YX25oqlUUzRvuzBraXhl?=
 =?iso-8859-1?Q?MXQW6y1+/uQ4ODtaCmB3QcXcavB15jKoDYae2WHXjsGr8j/3RUUxefbIJD?=
 =?iso-8859-1?Q?X85E6C17iFM1KdJjsQb2IFL/B5auLI9Zd2Kr1X0/Iv59v12dL0+OwxrPkJ?=
 =?iso-8859-1?Q?zv4TdTp/bidRS6CK8UuC4+abWVfmWp42U2sIPXUVKj8+Wzl7i2E26o78yk?=
 =?iso-8859-1?Q?GEBdhpriPuBxgZ3pKgMo/fnjQUbPg5+cJWy5Gh5or4b4eaSHfnQg7UOwk9?=
 =?iso-8859-1?Q?4Dk5SWN0Um/couBa24OOdVvf400L/0rokXA1hDfZuN0w2idi+DpQ6gB3s+?=
 =?iso-8859-1?Q?/YLVnQuSxQSuC9tH/yVpvXSAGkKeg2+4dRTQQEHwJcUJWFiphPn1vPGrxZ?=
 =?iso-8859-1?Q?h7l1xFbr+xtsqKKYugZSygjQnwcGsbN7BXvp9BUPXvNJjXgUevRt8s/PUr?=
 =?iso-8859-1?Q?6ciuWh9YO2cfM1Ul/+peWbnW1OlZOybEElyqJHJXhIij0gc6n2W8XaNB2i?=
 =?iso-8859-1?Q?lVDiBwntKXbYq7jHM/Lyg5xTGYH4HHA8MuUAip6Q2p+MgcJFGv51ZvJEGR?=
 =?iso-8859-1?Q?JKt7+5V3bO4FwnTQ6M1PTZkkGHgEYUSzeQLz+qMR3dQhSqlidCKGXcKB2K?=
 =?iso-8859-1?Q?LpukCh7qB11/Px5LavCwc+eO8eTCOH/8jBY1VLGw/8C+Vu3i1uMjA1pq2s?=
 =?iso-8859-1?Q?cNszICpVBzmUuvCQ/zw6rqo8o1rd8zMKIOOscI91YhknijKRVGCT2DWg9h?=
 =?iso-8859-1?Q?bJZ6iVg+jN4tKcJsB27bSXVTRY8hHnIEuiRd/WfCXHCsWtoela6eDoPEqD?=
 =?iso-8859-1?Q?vLjKSHCzx1++zZqFdi5gQfWdx8mOEzYX6C4zWduro5ajKieV9e5uIWg3uC?=
 =?iso-8859-1?Q?9cz6XS9PDt+xLo9SvPSF2UlR5sXUWmjmelwf4dyXrHXTJF6KEy0cPhUKFT?=
 =?iso-8859-1?Q?fH+4bVylIWvFjX0JaA5iB5Z46RxZgZD2nrUqeUOZtbDMn8znWynxclfquR?=
 =?iso-8859-1?Q?sm/GpJPDyYRyEo4s5CyQy1gMWfhbFzmdFXAPb9UYg0KI7aO5T+fSANn9zc?=
 =?iso-8859-1?Q?D7hF6Y023TqEpiImQiMSd+3o4XVr/VNlMT6SIokMzQasHQa7yf/Ka0fwSz?=
 =?iso-8859-1?Q?j2wV5c9YBeKk6hIT2PohUWVenLC0/KtX+VKB0hnqv6X7ORvujtQGypnUTu?=
 =?iso-8859-1?Q?Pon9MEOiWBLrXRYDSw3Y2Ln05MPPLBbR8TRGB+325SbtNaUpjJjvckmK8R?=
 =?iso-8859-1?Q?d309dV7JwgvlLClDPuO5zSNnWjMQpoHrD6j/D/OKa03ytnKYfBIF7aQlZI?=
 =?iso-8859-1?Q?9M3Zsdg0wmsFbvbuNXzmBPPmZzKuVXZaK/hba46LpYDj1wUaeRoR4ZOuFj?=
 =?iso-8859-1?Q?+qrasBtudmVf07J36HDQe78Zif06hRxI6N2HjEpESVORShAMRvxjJEdLvE?=
 =?iso-8859-1?Q?lPmICTwGflCVqwUttkeRhT8Ab4cEYKBU03M3xeLkC2N0dVp0Fv74GUjr5Z?=
 =?iso-8859-1?Q?rIJuZxuspd3HdUYlPwwecz4E3fN4QQ+ebDQS2uHzl/V+nhwkVjtOL6xhcK?=
 =?iso-8859-1?Q?7Um7PDdIMqQOoTpPGp2X4njXciGsr3H38JP8i+knIJxYVTMvquN9Tq9m8B?=
 =?iso-8859-1?Q?wxYvhfH5Sj3LzLvfuRNgQnU77aeDY4Z7WstQ3OTd0gC2hGkCvbWWreWg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544af76f-c199-4666-ed23-08ddbe6e13ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 22:23:34.6412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cYJIKVUZqS6mlK/qSWJiypwL9CkXTYrzBs86un3sJCI2v6xNSr2HilXYoOQbYA/8Hfrg2HZgIgYp87J2ZOWrYoS6Wu1tiHjLWMuvZzeEgmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6950

These external variables ('iommu_pt_cleanup_lock'
and 'iommu_pt_cleanup_list') are no longer used
in the codebase. Remove them.

Fixes: b5622eb627 (iommu: remove unused iommu_ops method and tasklet, 2020-=
09-22)
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/include/xen/iommu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index ebfada1d88..3205e49990 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -500,9 +500,6 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, st=
ruct pci_dev *pdev);
  */
 DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
=20
-extern struct spinlock iommu_pt_cleanup_lock;
-extern struct page_list_head iommu_pt_cleanup_list;
-
 bool arch_iommu_use_permitted(const struct domain *d);
=20
 #ifdef CONFIG_X86
--=20
2.43.0

