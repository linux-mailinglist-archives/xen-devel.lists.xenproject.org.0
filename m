Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4DAFF400
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 23:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038669.1410945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUj-0000wO-Ro; Wed, 09 Jul 2025 21:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038669.1410945; Wed, 09 Jul 2025 21:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUj-0000rp-OT; Wed, 09 Jul 2025 21:38:25 +0000
Received: by outflank-mailman (input) for mailman id 1038669;
 Wed, 09 Jul 2025 21:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxYN=ZW=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZcUi-0000ps-V0
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 21:38:24 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a2401b4-5d0d-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 23:38:23 +0200 (CEST)
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 by AS8PR03MB7461.eurprd03.prod.outlook.com (2603:10a6:20b:2eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 21:38:17 +0000
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30]) by DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 21:38:17 +0000
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
X-Inumbo-ID: 0a2401b4-5d0d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qp56G6l0+XlnLKxrOWPXcYIcdYg3CotWIJf5NRvo8sknNkO+YnPqIBjBBOUyEMnnNLGXqWHmPEpjj6Eaxy+gSemaEee91CD6UpH0lzwKZXdaFsYErlBPydG3Z2afMbfPWSus91VeQv2diZBmJYoGWui7wYAf0fvk2UwPWIxdXoOLpNOSGaXdb8nJzs3LxMo9M35IjpwMvQPJqs4FYuH/j9o/fZf5v0V5Gji3c5WgJgmEEvzjOzkhB1UMutOCnXzEpc86fJxdXAhmsF734r4hU/LpEuGqQtBawutjbpVsbgHWY32KGTrBZNuE1F2nacrCWwtDVwdWPldmNISbOR6TVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJBgeEt4lGLc7WqUzZFKhOlmgPxJA6j+zHarfJZKliU=;
 b=jOeTOCSFhcL7+AtL5uOMC4M9XWgpRo8Ds8+7GH2P0beo6aIkWptnvehSI1WC9HiHecP4LA1BGwsRsml0FgaabCu39WFV/jHTqhCTnQy5HJsZsXeNm8AgjDEG1EVDvBDIfUcXeras/4dqgxaLadP7a1R97JiWVvdVz/KiHejnc21/h9c0Dy31lRiq5HTAOaJs3HMliiYxqDv0pAVQEB1x03xVlzUnHOg4GK3XoTaRKNtcnnWY+KiJLhb8ddc0j0COzsGMd5ptcjnzIozGmWK5Qga+Mga5oHrFqKYc0JBz+cYHZcWqB3vixHBtf4ZGizN2wcswlHeymIF2w6wIcLi53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJBgeEt4lGLc7WqUzZFKhOlmgPxJA6j+zHarfJZKliU=;
 b=GrO8lhDs2bF/l/Nrik5tgzkZekqTPgNQDjJul25xz2E1pHlqF8712hgMdirCl62LovJjmf1G1jwJt48gYoSHyw87Th7U9DMgsKuO/I32DcDcKmbMdB0pQQbHgWISkw34eyPaVaNy7TPQV8ATGZcMcA4jDmCCeq7wdRv+BjT6sqIeM396Df4slKpYOZJhHRTZ/NcBs211dkDBGsQI1RrzY043Re1c4F0oXIfz3cuyn5GxjWzjHIp7oQ58TbQoOLDS30jATwdrZbM9h/hn8YxqKM4Am8hhkNiL8Wvkt7ShdBb5UlFgnc04G1twAojgqH6W9wb44DXroHO8fs6CjEXZIg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v2 1/3] iommu: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 1/3] iommu: address violation of MISRA C Rule 5.5
Thread-Index: AQHb8RnHknh9PmNpckO7ne8U6W29yA==
Date: Wed, 9 Jul 2025 21:38:16 +0000
Message-ID:
 <0a7a954cdf899845f51427fa6b44915f28b2cb90.1752096263.git.dmytro_prokopchuk1@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR03MB9556:EE_|AS8PR03MB7461:EE_
x-ms-office365-filtering-correlation-id: 41c66aa0-ee7a-41a8-9e41-08ddbf30ea78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?J1xRGQRumN8GcVC1nEmxliTimgSJbtj8RCKIVrnljh9Y0GnTAncP5R6i5Y?=
 =?iso-8859-1?Q?hSYyAv+25O/gnAA+Aj8kAwCTlG1NT9k9PGgj4DS1pdXlML2VRowIXbajYk?=
 =?iso-8859-1?Q?6v1U2Mp0q6tQZ2nZYpBxY+J9we5PEI4VB8IuhG+eneCPWQnpViCcQHzTOM?=
 =?iso-8859-1?Q?Hf5pN6g2CF+bb1z9piYciA1M3ft2uP1sYrHSl/VBaJNhUsDzjxKv5VE8/r?=
 =?iso-8859-1?Q?yCBXBDE6vom3bNngSsXoPdkE1B1FCkj1NFBB0RVO68CRal2K3gCbXwp4JH?=
 =?iso-8859-1?Q?eViK8w46TkSmJIUuQ6OPPrKuy/UeSXNeGZzNiXpbj2ag3/+6OcQkvkuWkU?=
 =?iso-8859-1?Q?Aymtm1hQKVYK3RhXBzzVpIrB0ZLNej9PBLbx2qAIfdl9dlKfpi4/LNHQJe?=
 =?iso-8859-1?Q?LCJQGx9+CWA6YVNKnk0d+CrgVpJ8ek/joRb9Wi26DOFHGZ3nl523C7p4+7?=
 =?iso-8859-1?Q?t/A749UymweVmeKZjHAI348Tr4LJdpJxgGaJmjTYXnu7iPJw3R0VidUrUL?=
 =?iso-8859-1?Q?gGLJ9zakpNJv6VyWxHJlBpCJPYWqHDqmLodhTlo+FRAvicpMV+cs1z9Jzj?=
 =?iso-8859-1?Q?WwuaqNXYXvQcUTJxZo37p4QWBsT/zqP72jvFl013ky/OlALIqIxRs+8fWz?=
 =?iso-8859-1?Q?AMsEZ5jHMvOVP+lc8q1eTXLOSDovyFJaTTz5W7B8VgnFvYX8eYsjboKiuR?=
 =?iso-8859-1?Q?8XgZnHJ/rqmkpqdIIVLa5fUoAt86ERBtIb95AwjXWV/OBz/lNLwGmAi/0e?=
 =?iso-8859-1?Q?RRDVFxhwLOXR6a0gtO9fEHQXo2rrBrCamCJBuiUeTEys7Kf7aBrUxfgC5K?=
 =?iso-8859-1?Q?J+0pUfrv5jAls5mbQMfqaob/80XG9cY/BaPlgwey0SKPj0J8QLAJVkl3lc?=
 =?iso-8859-1?Q?KvsgJJOmSmJoPVg5232DA0iWjW6XzecFIFPZoGmPU5UNv5tESHwVmdwY1X?=
 =?iso-8859-1?Q?8Q+2a2I1R0rGQO28G7RlIVsJJIkjR2+7f8ayMKMCkWREcuu/EjtZ7qPnHY?=
 =?iso-8859-1?Q?9MQuu5UZ5BmPi7F3731SY+xILNwS+aVHDu3e2E5lafzJYvo457s2maV+yl?=
 =?iso-8859-1?Q?dDqKwIBe8lETMgBO3/OqoeeLGD7RkHM/SUstjCpNJDDHlQgRb9gvzSCQdc?=
 =?iso-8859-1?Q?2W3B3aJUU5jW0b2qfMe1gW9rvE0UbMZdIXyKnMv6RP/ZQ5bPD+9mMGawBZ?=
 =?iso-8859-1?Q?4LG6i/d6EW2XflREez2cavfBYt1rK2Xz12+EPlrB2P4A/9rLt63BLkEzUa?=
 =?iso-8859-1?Q?ep9qXgcdk1brAjMST5NrQTh3lnt8sx3R4GhlOvBltOYRf+Eu/WNv78lPb6?=
 =?iso-8859-1?Q?08qlQUWS1kLfJq2DKLspv5D4PYEiveKq7qzX4060GRD7lHUz5kBx06oVj7?=
 =?iso-8859-1?Q?d1qkNP9m5u6AGS/Sts/kFxXFl03cFpzzQAQEeapeb2az9J3i7c71A5udXP?=
 =?iso-8859-1?Q?TXHu8xni9PVOfHDuJPvKYpMJI9OiUYxfyWiAroBMi83tgxXNzlWC0TlubY?=
 =?iso-8859-1?Q?aJ/BcbuUw4oHDiu3I0L8V6LdW9DK67auzMtq1GqQSZAA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR03MB9556.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RC7LPlV1jioN+ZJ+GbzKBtNGwaUN6cYIJs+8Qj+cb1DncOGWJLR+3GJjpy?=
 =?iso-8859-1?Q?VeJJsWtDEEKFrWRRA6+Ox8136S+QMbrHINarZVtn8vJrx4JO5B9gg5Cq3C?=
 =?iso-8859-1?Q?sn8ebBFk+Fp9tpHBWOXWHZBTHLG88f3V3cOxEO8+bVndarLW8G7TeJ5V4r?=
 =?iso-8859-1?Q?AQQibq+9/x43uGfhV1N7t6Xdg8uV5x/ckTCrqWIDKVERjl58q6D2L0JhBe?=
 =?iso-8859-1?Q?bb5v4GPt0ozjcd6jgCDwJK5yZlgE6C8gDEtmZ59Wn9/kQnU84AR8nx4fqj?=
 =?iso-8859-1?Q?1W+bNWBiezd515Gx7R7V/5sthKHXl+VRdTDjB7y6bZGojjb6rCuVViesCC?=
 =?iso-8859-1?Q?/8PW8T5A0g5Y6MXLAqkTiRLT/BXEcmwaSpxyYkRz9W3cQxi1k2APUsmIx7?=
 =?iso-8859-1?Q?ksbhcLhSw4m0h1omKI5802DSs0izO6v13uDLdeisdwfh+h0slGSPwslu79?=
 =?iso-8859-1?Q?JZ7mnzkxgJ/jVoTzDkjsA+Xx5G1raf+O0nqRM44/y0BHz1L6qGUKV7oJup?=
 =?iso-8859-1?Q?lM88CWdl4nSlWNles39RV0YmPVmIGurSBk+8Nc2RLNu7IB5gDkvpZpsT0y?=
 =?iso-8859-1?Q?EaeGeudlwfQ5fyGFvche9ygzzBP4fnCf1chCVWLzra0DIsCEWgPK6p5BVd?=
 =?iso-8859-1?Q?8namR5vIMPbyq+tkfTKogSE29AawcD8MBGKikPE6LKfp1qkTUVG+qOAGsd?=
 =?iso-8859-1?Q?CJMJHV2dm8S2M2pazFomY8zoEhaxdEfKJjSJGHH3p7/MNYo5mKtSpWQPcN?=
 =?iso-8859-1?Q?dbHhPUtuEqOp61zHnpBKecCS82Z6MeEUpTc0/DBnf8dFN8BjJyQ4hxNEIw?=
 =?iso-8859-1?Q?E9UHK4x+xk9ber8qXpiP2mqYxdstwEXnkRBw2+0E/3b6L0J7xy1nZL+piw?=
 =?iso-8859-1?Q?3nnodo64JAka3mPZB5+Kv35geh41HUTkgzbLUGGUS3giyJUXuRKOY/lkS1?=
 =?iso-8859-1?Q?Xi8iselXpFcy72D2VhwchFN+bgsNAcSLkHFi8lxU6nbB6UNiln9enuYNLu?=
 =?iso-8859-1?Q?ZjEWr092KZKp3wqPiA294Y2ML3VPInz3SQucCVD+HS80rcZNmtmX55yqH5?=
 =?iso-8859-1?Q?2ll556bUlw92EBZu4C5fi2H1q05KWYjCmasiRPlQqkhx1w0uXXd5Ndwc3C?=
 =?iso-8859-1?Q?dcv3qy/O2onjJ2WCp3rvZS9RiXNzjj6hn137QB8jLjHA32Gz9Jmn1Ak2PW?=
 =?iso-8859-1?Q?UJ6Dr+hJm59REyuI462KMsIESbKZajH3xdYN/7govQu4qjm6tTdJznd9N3?=
 =?iso-8859-1?Q?MO3Vw7u6CZ7QnSkWkClIK7HMSeaU4AGecVL4EiTe2ydrtaQu1Gl9eklS29?=
 =?iso-8859-1?Q?2TnFjbt/+oFf1lIfanlVcZk4Cfbvz2PnStzX9dto1sSB3gutmcltq/1NPm?=
 =?iso-8859-1?Q?uK1BllralsIHOqt32eAhnGSlEdcTYR8aFLserWvKrbjzcu47mi61bHsVzU?=
 =?iso-8859-1?Q?BJuQzDJsyetdnplexowECyoncFui2dmj0TJ/g0xq2fP8NpA9RnbEX6r8Mr?=
 =?iso-8859-1?Q?/i1TRU3hC8TjqWQSxBWZVex1bt1kVmFlOeIizSmlosaQJ6vAVr/3iZFasy?=
 =?iso-8859-1?Q?XqlS3pFgH49WL1N6HVQJn+D3MIWZipNYvMtUQlT6YSXJjxrQADMfCppFuY?=
 =?iso-8859-1?Q?MBeHT6fCbLCT0HV9FLnUgk4Z26gBpcWdxLkPB4XQFXvrq/bmCbCTJ3pg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR03MB9556.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c66aa0-ee7a-41a8-9e41-08ddbf30ea78
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 21:38:16.8993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c2nYvHdeEVM+tJ97Cg5nz2c9pTgNnuK4mdxBrUM3ftW+jNsVO6ENaeV6ICqr/q23MHNswbklIWFq6h9OCw0Jqki1MHG2s9H+QZDnk8/o91c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7461

Address a violation of MISRA C:2012 Rule 5.5:
"Identifiers shall be distinct from macro names".

Reports for service MC3A2.R5.5:
xen/drivers/passthrough/iommu.c: non-compliant macro 'iommu_quarantine'
xen/include/xen/iommu.h: non-compliant variable 'iommu_quarantine'

There is a clash between function name and macro.
Add an 'extern' declaration for 'iommu_quarantine'
under the same preprocessor condition (#ifdef CONFIG_HAS_PCI).
This ensures that the declaration is consistent
and only exposed when CONFIG_HAS_PCI is defined.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/include/xen/iommu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 3205e49990..57f338e2a0 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -53,7 +53,9 @@ static inline bool dfn_eq(dfn_t x, dfn_t y)
 extern bool iommu_enable, iommu_enabled;
 extern bool force_iommu, iommu_verbose;
 /* Boolean except for the specific purposes of drivers/passthrough/iommu.c=
. */
+#ifdef CONFIG_HAS_PCI
 extern uint8_t iommu_quarantine;
+#endif /* CONFIG_HAS_PCI */
 #else
 #define iommu_enabled false
 #endif
--=20
2.43.0

