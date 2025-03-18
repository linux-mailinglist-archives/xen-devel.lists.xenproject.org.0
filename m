Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D354A66659
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 03:35:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918401.1323101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMml-0004yl-HK; Tue, 18 Mar 2025 02:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918401.1323101; Tue, 18 Mar 2025 02:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuMml-0004vy-Df; Tue, 18 Mar 2025 02:34:31 +0000
Received: by outflank-mailman (input) for mailman id 918401;
 Tue, 18 Mar 2025 02:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvL5=WF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tuMmj-0004hg-2n
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 02:34:29 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82da0c81-03a1-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 03:34:26 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI0PR03MB10565.eurprd03.prod.outlook.com
 (2603:10a6:800:20c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 02:34:21 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 02:34:21 +0000
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
X-Inumbo-ID: 82da0c81-03a1-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDteRfNGZSm2Q38ZWFz0xjnUSS9KiNqPc7TvEFrwieWQpcL237vTfZPSr0dOfrfZyQMdoFpoHTlwd4X9FUv1lRFKWn97P/azNQbUlH0O6WY2EUdiroJ/zuXtKaDGjUvhzpUtDTKOGFQzu40JNOz7TLKqq6LCg4s05JdxgD1tgLnXUtKRA2PQavp2JxHoAadoJ252Mu3equGbJ0O6goo/xEu1f8IWZxtoGXsubyQN3WCXDY1L8HQxdkJovn0wQMA8/MEUZFcoZQrgqcHQl8Bw1k86t7JI+MLQa8YB+NI/va1ql4rzKl+qvvD7C1Vnp06LCvdN6VLTmsG59j/oD3IQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAjFD8BqC1vYq04XoxY+Cb+N9OF/55bTRtBeKvPa714=;
 b=J3ixr6PWd0h3bTuupw4JrRClcRkOm8nSVKAxIsMSihyCOuP5q1OSTIGEUE0n0Z70/s+8EQT+sfv7kw2Hp9Ym3hI0O2ha+HiTbZCh8v4esQH3oDTdC1IGz8BqhP74r5afOscWyi/dlIogdsGO2bAGk6htBqLjkvdXHo2rgIYaPWoNFbv5ySz1rRziplSsnPemyuobQ6amfQv1oNPyW1KaRuWuqxYNYETjYELWiETqwjhMw79WT+NwvJy3X3OG8mQQM/OLQ9Yt0Y3UFfk5RJh68uf6z4KoW0ThTN8fdukxfBaluJlPfWQh6j9AgskuWmWhIAW1m9+JUA7bzvjDCXFL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAjFD8BqC1vYq04XoxY+Cb+N9OF/55bTRtBeKvPa714=;
 b=Ka5qx9mjekFPSIK0Dbvq6AchkCi4TLErIL8y+iTrNQ4CnhmmtOwmVEQNePFbCj4UjvGB4zU2Zau7hYvJxDhmAG+pdL0aHcg3xKIHeiAYNXhpJSR/ZuXuvJ7REIENAZ/pywGho4Xj4gOpvHWUuxlyPprQof/dg/ljWAq6JAWV+O989p3bXflI63HktjrvgBAPkKAHRWurIbnTLNpV7JJMbBJfiJtH5/gmrB1dEV/2jqiJhg3w10aFhEGHAvSpnVeZyiGoB+HMAFkOpmF3qO/8g7rbH1pKgmq1A9TWBldBq64aF3opt/ZBzXQMYSM+tliyL2UGgT2BWgkRwaU8rcwqXg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v7 3/3] CHANGELOG.md: Mention stack-protector feature
Thread-Topic: [PATCH v7 3/3] CHANGELOG.md: Mention stack-protector feature
Thread-Index: AQHbl64+FXgZ6yIaLUGTQJ+kcSw+Sw==
Date: Tue, 18 Mar 2025 02:34:17 +0000
Message-ID: <20250318023234.1210659-4-volodymyr_babchuk@epam.com>
References: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI0PR03MB10565:EE_
x-ms-office365-filtering-correlation-id: 3d0194d4-ea6d-4a1e-48b4-08dd65c563e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Mav4UMXl8ueIpP78v86Wfxjo6NxO1MFsurC0D2HrwUp27Ni23jXBuCWrcP?=
 =?iso-8859-1?Q?ZDyTaXmFvP85wAUOP1rEwsGGlYJFRmn6rIlwBAwozgLggvbL1HVo8s9N0u?=
 =?iso-8859-1?Q?Ewi+j96XLt1mR/e9+SXJg3AuxF1z6y4DP98Xph8bIaldvM6/o1khmwDeD6?=
 =?iso-8859-1?Q?uXO8S5sFbn6MBn1MJ4kZtUOBv022yxrz34uvArzua0RBspo4rNHBPsKmjq?=
 =?iso-8859-1?Q?rE4LB8f6uCKQ+gGS2ji3BHKVvy2LTdYbmBjumLBthd8YjER8Pj7FehLUhe?=
 =?iso-8859-1?Q?wtbfCYIa++VH1qUC8x819YDfXs5tQfIXstqpu6u57I62TlzOPdcLJyrmaV?=
 =?iso-8859-1?Q?rCVhuAoAV29KTfDty/ALg5+jUAfcruJygo6NPbju3BoXwgxZ9k3ExzMJhu?=
 =?iso-8859-1?Q?VJtSeZy8ST65DeHR/r9jMI0k/pfYfs6cZzAA/xPVKlEnEPFLVMYx7VAsWt?=
 =?iso-8859-1?Q?ml//P27yN0WAxKm1HVqLqdTc61p3HoZlV8fRohlOFT/CUQjyk5lmuqq1uV?=
 =?iso-8859-1?Q?u+vt5Kii2MSsw2HlKCNphgXmXhJ7FK0SGC8WTbhkXhSukUmLqk3+cpz96g?=
 =?iso-8859-1?Q?M0/zo8HyojEbgf5eB/M8fHku2Way8Wr32YwDPMSZGaunn96pc0kx/uMDDg?=
 =?iso-8859-1?Q?XglZfhLUs/T8luABpZwdjuIWvNsvG0peMDB2kX5A/MUkuiHJT27B+AAH/k?=
 =?iso-8859-1?Q?MMyZN+vkIdsQWFw6Ne7O584hcYicYi0PIRIHVIhH1H/Jy+V8sI/5RThK0i?=
 =?iso-8859-1?Q?YuUjrsCM5hWtWVQwGzT3tMZpeB5eyAc1pJn/6iPe/q2/02paAVg3NhsZlm?=
 =?iso-8859-1?Q?/VPn2KoTw2HSQ2SJnPv+knh05cphbT01FJhuD6PaO/WVloi1HHi1kU5But?=
 =?iso-8859-1?Q?kdhGPtWXKjETThvQVtx07vidbWLvZowYRIKTRD/dkjhnDOiMaWPfjcXOKA?=
 =?iso-8859-1?Q?lp4wWyLeqSVxRiZhA02Q+lC2NrFVRYez+a8q4brr3n7oARoCRMgVukPuaW?=
 =?iso-8859-1?Q?MESc4/NRbV22s4vgsR4VtIjztGLmVQv/nwZhCDRn/bQ7j6zYNmX9nogl5t?=
 =?iso-8859-1?Q?gpaSNSStJNb+KPw0/gAunH3qxq0ScIpHL9705uSZcc654RvjXaLXwJQumN?=
 =?iso-8859-1?Q?x/enbFJcuj8ulzl/Cop7EzSlrZq49b6XUOcTs9B23DWNv6LeDbTDxwy0e6?=
 =?iso-8859-1?Q?BxPj5EKrvMnYE9bI8tts6O8ojOyvsUFftNV99GA50+a7Z5oasqF4aT9oWE?=
 =?iso-8859-1?Q?KdEC8BvK4YBdNltdb9wXDwQHCNQuaOShpjjyeaN5JTm8KUU0kNiE4ZFpEw?=
 =?iso-8859-1?Q?JDVNWiuofcLEC7DfODbTtQcLojYh+HDesZc5zEIX/x6gWfLMB+VsZIJjvn?=
 =?iso-8859-1?Q?HElzznUGQan86lYAW+xJ7ZvD4j9UkRpMW3IjUNP7vy+s17Ox1v73BHpUTD?=
 =?iso-8859-1?Q?R7kD9J3BqCi40WqZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ohcsdl8wDXheF9Ktna4Vc8xf3IOPWylORX/rFQ2Z5YofM8Z3up02yZZTK0?=
 =?iso-8859-1?Q?6MTRwBXEkbXfz/0b6iYa88VWhwKhcGxc1e0DVuZpOhF2zsbSz0VLzy2NwN?=
 =?iso-8859-1?Q?kVPHjfYBHu/CraqNcSNMtkEJXy5puv7eCgjuleGdrgKm01C+L+RIZneeP7?=
 =?iso-8859-1?Q?7GFKMy7cwHdG4HXTQviZPr9J5b6Fxz1z1g/qknCQkxRXZW0gG5eGQy5Ijn?=
 =?iso-8859-1?Q?Mp6eqgDuYgFmfRnq7TNT8jkKIYN0q30a75mkSLspi11wVYTftq/e0ERVZA?=
 =?iso-8859-1?Q?bOCqyFr65Pt9+7joibJnh3RtkKEBphXzCQK0JRm/ROquae9hQ5HXos6Ur0?=
 =?iso-8859-1?Q?Z5QzvA7HDIEiQcRPegmCCUsYOoSJUauHzJXcXNr0Azci7g2PYn+KaA+tmb?=
 =?iso-8859-1?Q?68xkokDpfZB3qeahUrD/pVR7eq4j1m//BdHsLIfQP/2qS7KlrzZfLooRaD?=
 =?iso-8859-1?Q?6pOaFg0qZEXHMQIpa4X1MzlpS3Lt2nP6FHNINBQxenphJLR/Vwd6qH/SY/?=
 =?iso-8859-1?Q?eeYGvYk9FkC8o7cMIsOJjwSzixJFttccTWmTc7szgEJ1T5ck8tx3IPLJ68?=
 =?iso-8859-1?Q?RIbjyT90uYobwvJHvBadY0KEwHSRJ5bfZYWG0Zvb00RE093hF7bRx9ok4l?=
 =?iso-8859-1?Q?3i6+G1pcd3FmMXhoF+Ahv0d+EjgHstK7MOwJxKhR6zbY6ryGgieeBrIlFY?=
 =?iso-8859-1?Q?NdEk2hCY8GGNcVpl3dC84k76/GFnHVmfZvlRgT4hnJiSxLEMrFo1nIRMx4?=
 =?iso-8859-1?Q?YutlXutPf465Rmx+2kQ9uLJl14pFQmSJksDppRJwIjxJ5mo9QoJ5dHZUYF?=
 =?iso-8859-1?Q?me+c/STblDG//0PC9ETbZTXKS/P75fjTXsGk4iQqb+lpMER7IonOJjmxqq?=
 =?iso-8859-1?Q?emhSN2LqGNaSrAQ5fWxt3OdNiBxqXlkAaU/uv4G6ttl5Y4mjK2XiSleQDI?=
 =?iso-8859-1?Q?f5Vrd+n19LAEMB1L2XCNIYJFwiE/XDKjRy2VbyabqkloQuinGKBMFYpt5j?=
 =?iso-8859-1?Q?hIIGfS/Hz8wlRHOK6pPUy5ir1jrqx7FF5F0b3d6xYJmJAZLheQu0hyT0e0?=
 =?iso-8859-1?Q?RGhlA8FiBa/Obs+/qYHDnGkpE4sayWZpt9h/0MLVxbXg/dMclogJzdCbQo?=
 =?iso-8859-1?Q?Y3T6qt8e6wUkRZwJHXvgPpmENyJMXstyToJ+wb63bZJxCSP26TkcQnsGg0?=
 =?iso-8859-1?Q?U3KNHRlsM/gmEvzZKkyoAoRnqDX1dmHLEEWxAoK3YVyQ6TjwqnJELIA2rO?=
 =?iso-8859-1?Q?ri2pbWgSOuUMx2MyBbtdJOK59T/BI0ZYKXnOZ6Mc1bPqhFGdXfqO+G2TMU?=
 =?iso-8859-1?Q?GPOAhQq6GiygRblw7/b5XEwXb5gQo2ub4ddCdiSc3Q3Upi101j9ChUuv4C?=
 =?iso-8859-1?Q?MpYh1Fr7TU6YVJvn/UAIYIZIMAyeNLtYfWr+2SHtnWg7fKq0tmV4ZZ6FHw?=
 =?iso-8859-1?Q?JRFoLTS0lmpcexjuPfrMO1BiAif6LCg1YjGx2DhvIIcsIjVQC3qwStf44e?=
 =?iso-8859-1?Q?rB9rZhPSCsn0W1WnhOmqyNtR5Fh7bC5/GcyPomDajU0FU9WxDbBVvb1YKV?=
 =?iso-8859-1?Q?jjKSvVVFbJ5VjV1zOKLtwWJBnp4KOpdHTOuZrLKOF8nlp6uK9FtnYvVaDy?=
 =?iso-8859-1?Q?vJhsJPvhYxciVoUhUNjyqLpRCaMhj+4/9xqD1+5fzymFGbbYTOwwe70w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0194d4-ea6d-4a1e-48b4-08dd65c563e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 02:34:17.1584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMnO3pHARRCqdbMa7yg+gxlEBUfMtzak7N7uODclKcBXfGlKkGgaBkVgEdDc0E3A9A7NEhMtc6crAkUNLSnu2Bj4f3zrfuIz36jTI/C4Ae0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10565

Stack protector is meant to be enabled on all architectures, but
currently it is tested (and enabled) only on ARM, so mention it in ARM
section.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

---

Changes in v7:
 - Moved the change to v4.21
 - Added Oleksii's acked-by tag

Changes in v6:
 - Dropped Andrew's R-b tag because there is little chance that this
 series will be included in 4.20, so this patch should be reworked for
 4.21
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7201c484f8..9605f670f6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
+ - On Arm:
+    - Ability to enable stack protector
=20
 ### Removed
=20
--=20
2.48.1

