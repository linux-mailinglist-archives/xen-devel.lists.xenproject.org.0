Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CFB1DD17
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073346.1436375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P2-000279-8s; Thu, 07 Aug 2025 18:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073346.1436375; Thu, 07 Aug 2025 18:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P1-0001yP-Pc; Thu, 07 Aug 2025 18:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1073346;
 Thu, 07 Aug 2025 16:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xj-000773-Ir
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:31 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e228405c-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:30 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:25 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:25 +0000
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
X-Inumbo-ID: e228405c-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwiiK0UZ9l9AYmpHENDXYNXghLJzjqFTTxlo44NojLCrJDreYzZvHaMePXbdcM6E+/e5MeuQLCY89w/2kyNtqNF3BXjsjAIxQuPFzxjm4YXeb9vk6m8bADaNAarTItrXiU9hkQlwZor0L67DBhIFpEsF8/wj8r6PcSq6hA0FBxxu5CciOISXnNhEajuGLiRnvfuef3b7LO1+20Y/xLiL4BcwersRj0ULC8NGr8gWJINHCZp6R8kWDaaSznwO4k1o/cIq6yQ/4g17NjXBz8UT9lceM3CtMnwx+FCqURca4zStUUmnF8rNSdxSM5Ek50Kqcv6fWdnQ6Tz5I9bTyk68RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VELNmVszE9BQTzKi1GRSdq0FFYAOcApUP1MBVb3E+KU=;
 b=wdfN7G3by9fa3QoYYfN9wyAjEtpkHUs0GkXM5J1+WSRpd/9HwOsZIjY2xJltLGIgDKhQMnTDcjcNhXNrr90fM2A+Erl6ItkRUclzMkoDwCSa7rkGJPMdI2jmcCa+u7gN6oX1Ofni8tuAUWueV9JoyzjJsAAAqdtJ5ZWxeD1h5VaY2hDJ9y4zjby/4Zt/6tcl54XB1/GeT0/dcvNgWLFVb4UQP2MUwad0EgeQ5L6oImHs5tyq/RJgynciBOIbb2j1wwkX4hMmJdvPIT6MzYOBDl5A9G+Yr0dbuGuJCpsgMGiQwCC+i1RW6OmKLcfklP/Qf1BG1mpmTYXizJSY3PBNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VELNmVszE9BQTzKi1GRSdq0FFYAOcApUP1MBVb3E+KU=;
 b=sz7vp/uq9GxEo4PhfzQuZVkr4AIGDQxuLOniINfORp4MkxexT4DLaGCM/+N32oONrc33WFQF5ZGCIeNyyOoJQVSQwiE9PcFlegDjpikA5udeL8QGiQ1ncRsz3eSj+DRpXNMWE2QivBzCBSyF8O79gaJjgYCsZ+6/mFPwpFOaV+e3s6o/zt8o75a34vMa2iNf7609/n2EH/p2Amwm9Qtc+2Za/jlW+2Bwm/U9xK4ZyC9L/2mYO6FPYs0ri4dFDpxzyvTenf9xmwvA/80Epw2ny0EuGYriecZaIhdQzfJQ2zgQqr2CG2ZXO0BOGMHzL6QIpaVd4uWiUyy1yndt+Y8fDg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 10/20] xen/arm: vsmmuv3: Add support for command CMD_CFGI_STE
Thread-Topic: [PATCH 10/20] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Index: AQHcB7yhsDZE5DA1DUCoBRmJXjwGPQ==
Date: Thu, 7 Aug 2025 16:59:25 +0000
Message-ID:
 <ceceae0e4d996d44922977fefc88e56e58d4b9e8.1754580688.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 6804eb4a-da0a-4e1c-d7c3-08ddd5d3c38e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d4TW02nd0V9+cEWH5jvRUxgFilAUEiufhtI8A2HLZ79519S5hOKDnCqSLb?=
 =?iso-8859-1?Q?vXyQnijlgn7Kd7iYtYVyps8+2zCGksc4xbv9pHKKZ0nv385aRfunWkHFLo?=
 =?iso-8859-1?Q?SA4QaR/GEe2CMuB2Amb4HsyB3C2c39ckkl++64qj0olKK9Ou9erOwZSjn1?=
 =?iso-8859-1?Q?qk9nykgnitFf8ErzBNW0EgQr+optIbdtWgHPcTdMHQ9grzRRTNi3urokvq?=
 =?iso-8859-1?Q?h8RV8w8EyJ/hVcVBB9ofheFg9u1VNAY1X42znxudfQf4YJTpGG1/gHtYAN?=
 =?iso-8859-1?Q?Iy4CYldjREpqYTtjpNquO11gHY4FAQyIIlPB2bJMJtJIdfXev82d+NOeil?=
 =?iso-8859-1?Q?5K2yt5hn4GR0WPXhfURjjC86qxEcZ2OtVY4OTde41M52IscE15UckJ8dwz?=
 =?iso-8859-1?Q?gR5lite9Y6yZRxeqE0oE6BpgNBWQAVyr55trQ5Df68Hg4mArMlwDLIs10l?=
 =?iso-8859-1?Q?AxJK6/8EMR/Vx8ubmNjyPp72gC3ZIboCcffXKHUjDsexdqw/rDjayA7Adj?=
 =?iso-8859-1?Q?1jpP+BFVO5ILDTywrSlQUtAF3EcYIByXesxUo448lsxaswCILdnmNqBBx3?=
 =?iso-8859-1?Q?TsfHbueDbXM8MoEoiQh2cnhBE3FZxcQbQR2gNhJGVKgvV56UPktmp7f3NS?=
 =?iso-8859-1?Q?N2YK4xr1FfyVCFr+QlEz9UeGneYj88qkJkMm35Z/HuqkgVM2L7LCQxHbaI?=
 =?iso-8859-1?Q?TT+u7lheNJnqKbRWVkfxcy+vzjkiGkqPf1tzMSjbu+pi+eKe59Gmhua/w8?=
 =?iso-8859-1?Q?Uz8MNLiphWrIZGzWp1rohcZKV3j3/53d9Ceyd7RCSE1UJVEWUFsQSmEpLt?=
 =?iso-8859-1?Q?TADSUaIanyCHhZR5rk3a+ZkzGF71jKa2jkp/+eUCrla1V0pvf+mbRVCkA7?=
 =?iso-8859-1?Q?CoA+DeP9UY1utBEQ5lcDXtKd6t4kkgJC1WXy6eG/Xi3qK9Nyc7R9vKFks6?=
 =?iso-8859-1?Q?DXzCMmz6TTRS4oT/Zi0xO7A+rPKhedekRfm9Ofc+KpLpU9y89i8TJ7OT0y?=
 =?iso-8859-1?Q?f/CMa8Qxya5TkUMzhVP0Y/HiQuUO2cLvcVaifafgs1RXhyNV+iQuITQvoU?=
 =?iso-8859-1?Q?OmyIjWxNpnDCo8nbXig5ZcEXcZ3Sj62j3Ux2AYcBAcUpXTKYTI52Uo+IcF?=
 =?iso-8859-1?Q?SHx+h0Xrjyn5v2ffuTFOnUQbcNCa3bLZag8glvA/kAUMrSrRlomtwFVqUP?=
 =?iso-8859-1?Q?e/zKmYfHApuFoyMsmBUhDo7oWhGrAzs2BvtYEJ3vNzFVeVxUvW6Ysgmm7f?=
 =?iso-8859-1?Q?jL38LCybC06nkzMhzqWzMTlURRFbfSzija8t71FM3Wx/9sUsIhGCQj0oHF?=
 =?iso-8859-1?Q?AKAQnbmXffS3jAdFnfLMPCINAYyn6FqHYKlMip98AzS2ECTbp83yBsjJad?=
 =?iso-8859-1?Q?LcVuLJPjjcUdl9Mx3xM1uh9W7t7BnvVibaJ+uvHyhLzE1Tg0vyNnGt1PaG?=
 =?iso-8859-1?Q?6MZQZSK8Hu8aWsa4YvfFoNL5x+Tqoy7ybkKKAKhEHjgIzfTxPMiayNngR8?=
 =?iso-8859-1?Q?hVBfscjT+1TL9mx1H81Nxsdaw1TS3QxJuMGoQphFezKA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lV/fZtTz5sfuRM5zl8rzzpHu1wCAMQdT0GTn6rrFHMyGNtsYEbgTlTQ3Mg?=
 =?iso-8859-1?Q?/mQZy+MnE42rKmIGHsk2yFX6g/dcbqnWRWN7CuGq+WWPzozjMFpIwT584c?=
 =?iso-8859-1?Q?7pEBsZuYTsvx1mNgKsbbO0/nvrOTjigDXXqmB6Bu7IK4SJbWKzRYx31Ys+?=
 =?iso-8859-1?Q?ZCZdH3Y0ujO1GzPuA0uavMC62BS6tcDnvEsCJ7+QkzJ+Ez1XRAxlPKnd7J?=
 =?iso-8859-1?Q?HdsuQ64RzxfRUGkfUV13JVFHyY2F9u/PeIC+4TBg9rrgTdK3qiAKWHMk+c?=
 =?iso-8859-1?Q?G3hjDdzKrGi5QwkaB5awzsVcTo1VoW8yDqHjv2vNh3f1CBE2cdsONiHuum?=
 =?iso-8859-1?Q?ZcohnyT3Z2hwwfc9f8MfJAIJl9r3vJUC8VbYivFQXs0HGSivR8osagJ2Q6?=
 =?iso-8859-1?Q?YRhrIDI79lKjpD7A74EAsk+A2/mX94Pu3GgRlKk2vPL/n0OopSLEY4oefl?=
 =?iso-8859-1?Q?9hYSb/5fOSt9l4Biykqtmx3b7Uik+ymFUFlry/WeRrjcfFLBHDq9gCE+gX?=
 =?iso-8859-1?Q?L7+syq2PSLC8Lgs5DyLxvU2650o35tJIpOSitjMbk+nN8N3J/SzInxu13+?=
 =?iso-8859-1?Q?qFVwQaLP4UlVKcOpS71NLXEKZDK62Rrzj4SrbP+t3KAv1/RjN/FHqDjP8Q?=
 =?iso-8859-1?Q?tizXiHgQO0412Lj2uzUwpbCyKjngTOH5MgJ7EGxQd/QsSM9OHP6erNJy6o?=
 =?iso-8859-1?Q?a4rLHNdoGmbOyYIK37gC/W9LmNoTFkjlX+a1rx4rhqSq/GUb2aOkVm03Ej?=
 =?iso-8859-1?Q?qGYo0QPTs26u0ErIHAA+/jwTf6PuU/lsswDL9bgtmZ3v7D2CFMG/i5bIQ4?=
 =?iso-8859-1?Q?xSF0Dev3xmVKI8Yv5ACoXzoUvVNK0trM1OViTarUUNguj6uevxlQRuyTul?=
 =?iso-8859-1?Q?S2qPaSCdOpAUlRcaYQmbmuA7NYHcKoiRLWVAmzz+sprfLfaiD1icgnpGdg?=
 =?iso-8859-1?Q?4bqrUz62z0ymBH8QikfZqE6Q//84y6halGNHpcG9VdaikN1to7xON7rPJN?=
 =?iso-8859-1?Q?zT1E66toSVqPwixsVMygETjNzj+QG6pz1MnXzhr3RdVrsT3HOPhMpdrdcY?=
 =?iso-8859-1?Q?v0mn0z8C3dpLc8EAaQrGxn0FaaC9O+dISgsdP3bvyHhe11zI+rO7ZeNDxs?=
 =?iso-8859-1?Q?QWTYAKvszqD5liaZ5KM48qk653h6UEk49+cYphKPQ5GHsEQFgaB3wunLGe?=
 =?iso-8859-1?Q?2cSdOo24J8eRcpF3Cpoz2ZiKZHIrxkQySPW5aRujOUwzDCPb7dqpprBN3y?=
 =?iso-8859-1?Q?UgrFSsfj0wRXWykh7KpljiQ5badAEPkMg7qRZOpaZfmnUr1fTHKthEcutp?=
 =?iso-8859-1?Q?t4JJKXfNRn1Mk9NB0RDef/anLleYymedzMxB7DrShAcSD3V3vxiN/K2OWn?=
 =?iso-8859-1?Q?5D2vJcmZPCAEOKoEe5B1xZxCPRkDOL6dWcYH0s6uIIqSvR7BZNJXzj1hoR?=
 =?iso-8859-1?Q?vJ9wSLP2Zuq734BB2cAUKYZsy8+52UolUJTbaYWSk50AcJUqjv6sW2h+ug?=
 =?iso-8859-1?Q?NrDXqlW+JCkXr/FPEannbDfE68mJWQ2oXrCgohlaFOqhu/sE2S3O59IG1/?=
 =?iso-8859-1?Q?yY5Wz5TW+/WX3BiRtj0HFS3yodsvL5kVxuGhHq1gduR8PlJ5T7smwx2wP0?=
 =?iso-8859-1?Q?c/3hIc7XDZ2Ttb396YPHPpJhMsu6BQrUOmxeKR4lrezuLD7UosIFvrUw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6804eb4a-da0a-4e1c-d7c3-08ddd5d3c38e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:25.1712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EMqOcWNGynaw6EUwGDpDoaKf95ykeT45Z8tk6aEI4O1w5WUcDsdw1JZBalMJ8u301cPxrn9vUbbWhgOeEw5hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
driver in XEN will read the STE from the guest memory space and capture
the Stage-1 configuration required to support nested translation.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 148 +++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 84bd1f7327..3ecbe4861b 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -45,6 +45,21 @@ extern const struct viommu_desc __read_mostly *cur_viomm=
u;
 /* Helper Macros */
 #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
+#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
+#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
+#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
+#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
+                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
+
+/* stage-1 translation configuration */
+struct arm_vsmmu_s1_trans_cfg {
+    paddr_t s1ctxptr;
+    uint8_t s1fmt;
+    uint8_t s1cdmax;
+    bool    bypassed;             /* translation is bypassed */
+    bool    aborted;              /* translation is aborted */
+};
=20
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
@@ -91,6 +106,138 @@ static void dump_smmu_command(uint64_t *command)
     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
+                              uint64_t *ste)
+{
+    paddr_t addr, strtab_base;
+    struct domain *d =3D smmu->d;
+    uint32_t log2size;
+    int strtab_size_shift;
+    int ret;
+
+    log2size =3D FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg=
);
+
+    if ( sid >=3D (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
+        return -EINVAL;
+
+    if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
+    {
+        int idx, max_l2_ste, span;
+        paddr_t l1ptr, l2ptr;
+        uint64_t l1std;
+
+        strtab_size_shift =3D MAX(5, (int)log2size - smmu->sid_split - 1 +=
 3);
+        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                        ~GENMASK_ULL(strtab_size_shift, 0);
+        idx =3D (sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS;
+        l1ptr =3D (paddr_t)(strtab_base + idx * sizeof(l1std));
+
+        ret =3D access_guest_memory_by_ipa(d, l1ptr, &l1std,
+                                         sizeof(l1std), false);
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
+            return ret;
+        }
+
+        span =3D FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
+        if ( !span )
+        {
+            gdprintk(XENLOG_ERR, "Bad StreamID span\n");
+            return -EINVAL;
+        }
+
+        max_l2_ste =3D (1 << span) - 1;
+        l2ptr =3D FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
+                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
+        idx =3D sid & ((1 << smmu->sid_split) - 1);
+        if ( idx > max_l2_ste )
+        {
+            gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
+                     idx, max_l2_ste);
+            return -EINVAL;
+        }
+        addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    else
+    {
+        strtab_size_shift =3D log2size + 5;
+        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                      ~GENMASK_ULL(strtab_size_shift, 0);
+        addr =3D strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    ret =3D access_guest_memory_by_ipa(d, addr, ste, sizeof(*ste), false);
+    if ( ret )
+    {
+        gdprintk(XENLOG_ERR,
+                "Cannot fetch pte at address=3D0x%"PRIx64"\n", addr);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
+                                struct arm_vsmmu_s1_trans_cfg *cfg,
+                                uint64_t *ste)
+{
+    uint64_t val =3D ste[0];
+
+    if ( !(val & STRTAB_STE_0_V) )
+        return -EAGAIN;
+
+    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
+    {
+    case STRTAB_STE_0_CFG_BYPASS:
+        cfg->bypassed =3D true;
+        return 0;
+    case STRTAB_STE_0_CFG_ABORT:
+        cfg->aborted =3D true;
+        return 0;
+    case STRTAB_STE_0_CFG_S1_TRANS:
+        break;
+    case STRTAB_STE_0_CFG_S2_TRANS:
+        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
+        goto bad_ste;
+    default:
+        BUG(); /* STE corruption */
+    }
+
+    cfg->s1ctxptr =3D smmu_get_ste_s1ctxptr(val);
+    cfg->s1fmt =3D smmu_get_ste_s1fmt(val);
+    cfg->s1cdmax =3D smmu_get_ste_s1cdmax(val);
+    if ( cfg->s1cdmax !=3D 0 )
+    {
+        gdprintk(XENLOG_ERR,
+                 "vSMMUv3 does not support multiple context descriptors\n"=
);
+        goto bad_ste;
+    }
+
+    return 0;
+
+bad_ste:
+    return -EINVAL;
+}
+
+static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmd=
ptr)
+{
+    int ret;
+    uint64_t ste[STRTAB_STE_DWORDS];
+    struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
+    uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
+
+    ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
+    if ( ret )
+        return ret;
+
+    ret =3D arm_vsmmu_decode_ste(smmu, sid, &s1_cfg, ste);
+    if ( ret )
+        return (ret =3D=3D -EAGAIN ) ? 0 : ret;
+
+    return 0;
+}
+
 static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
 {
     struct arm_vsmmu_queue *q =3D &smmu->cmdq;
@@ -114,6 +261,7 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu=
)
         switch ( smmu_cmd_get_command(command[0]) )
         {
         case CMDQ_OP_CFGI_STE:
+            ret =3D arm_vsmmu_handle_cfgi_ste(smmu, command);
             break;
         case CMDQ_OP_PREFETCH_CFG:
         case CMDQ_OP_CFGI_CD:
--=20
2.43.0

