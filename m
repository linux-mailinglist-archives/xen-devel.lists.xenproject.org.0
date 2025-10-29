Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDEBC1DD4E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 00:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153177.1483640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0O-0002sd-Ld; Wed, 29 Oct 2025 23:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153177.1483640; Wed, 29 Oct 2025 23:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEG0O-0002pU-IF; Wed, 29 Oct 2025 23:55:04 +0000
Received: by outflank-mailman (input) for mailman id 1153177;
 Wed, 29 Oct 2025 23:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xz0O=5G=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEG0N-0002OI-F6
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 23:55:03 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aef872f3-b522-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 00:55:01 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by VI1PR03MB6336.eurprd03.prod.outlook.com (2603:10a6:800:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Wed, 29 Oct
 2025 23:54:57 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 23:54:57 +0000
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
X-Inumbo-ID: aef872f3-b522-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcxCSQfGO8gg9C1NU8/p35k35tD+1JgSu48U6Ts+/ie7kjynb5PAMX+tMPZGxi91f7zc8zGHRZoCV/zrZRm+4ANDlG3uX5h5OIAzgKTXSQE1YUMyqCSEE08t8pgb3oXae1cx18BItUcxInM06hkmfW38Dt1570Qw4fTaFA2uC3QzU612S3WJ8ld3nwJ+souv7Zkt2jAiQza/DOdqbEzjGpqIVBLmo01tAkLBz+rwxlq9cV3nQI+jpYklwwjtnE2SYiJeyCSOrQlnaT4hbC+fBWi5t3SHXC3bMi/+zBHjTTwt/vFxoH8GbzxjkI7ha3QtvHYMfqw/ihBGMn8uHh4QZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CW854e/emRIA+lob0OlKUhQFAX79JYtdj6gRsLxNMYM=;
 b=M1Ueg5+ruUW/WOyQAIWLZbo4dZefVJQHrCSknxl8m0d1O1vdgAoelQWAky19mT/Bz1FfZFVGK06tRxataThlTN4RK4A+SUUu7ZEcDwP/NtcH2VMl4lxuATKlXz+k6+naSKzhLSqS0q1eyF6jT6Q6hcnc7eWoTlKDMwvTpny4HSbWzODEYcJDXN/kE6UbrsnMPuPLwKBlBL8oFXKS3J4g2E4SHoJAECvNdefIbbWpkLgJmW9rRifeFJFh4wq2KeUqGXmYbHpKFRnBisR2MKQ2VIzraF0H9lc/GwgZuxr9QEx4YR8ruQDi0BxGO9oNLtZIODyLNHmx3H6CQzPahJFWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW854e/emRIA+lob0OlKUhQFAX79JYtdj6gRsLxNMYM=;
 b=bAg8BOCGI08NBSzEqTDP64vwcxXh7L5FAWrdySeIGcn+S3y7Am5Ihc+lCm+0Rb484M1cZdgHbyj1noGsoxq/TVdphEUeG3IuBadbG4O3NxnjTUSXovXiQYX4av4dWTNwfn6zP9RyOImJaHS/u9X7BYrwOAWDwAwUS791i9KOkrdcZ+XPGq+gtFHpJNWV/6u0njTZO65WJvyabAl2ttbOBGXawZl7GRnidWX9gvUcq4szYQAsgXAPJgHOeMrdCFQeisoHFspcDePuTkelg55XOvMXbZc6MKYP6VSimCEJ/K6AEg4V+qLXkCDyjTG7NcKUwwgO4Ifl7CrQV7LQ+wxRfA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [XEN][PATCH 2/3] x86/hvm: vmx: account for SHADOW_PAGING when use
 hvm_shadow_handle_cd()
Thread-Topic: [XEN][PATCH 2/3] x86/hvm: vmx: account for SHADOW_PAGING when
 use hvm_shadow_handle_cd()
Thread-Index: AQHcSS9urzbDquX9/E6h94nu5/XwxA==
Date: Wed, 29 Oct 2025 23:54:57 +0000
Message-ID: <20251029235448.602380-3-grygorii_strashko@epam.com>
References: <20251029235448.602380-1-grygorii_strashko@epam.com>
In-Reply-To: <20251029235448.602380-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|VI1PR03MB6336:EE_
x-ms-office365-filtering-correlation-id: 9f56000a-9eaf-4a49-aad6-08de17469086
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?01FMMst9OQXs0jlF6o14b5VlQ3E6onxMZuu0Q6byHaFY+RkGNCPcYa8juX?=
 =?iso-8859-1?Q?fCg8gDeScP5kSTAIlIjVlbvj8Wi++Oe/n9DW2diBHFdtwkxE0d9l6ijnV8?=
 =?iso-8859-1?Q?6ClDuE3Vg5itEbTpb50xecoQY9ciqoP8roQb70Et/ZIHURoNTgWfurPnzW?=
 =?iso-8859-1?Q?dnS3uBRgdyqf24jAo5MdA1AgK3lMK7mppsD7rzDXMobXrc4FiE/GqndtS5?=
 =?iso-8859-1?Q?UTxy7o2alaIOc0pkTWHmDFuUpO1h4H5XeCwCvX25A9j8vs6XDfrJ4209Ul?=
 =?iso-8859-1?Q?lD3w2ZksNm5zSDa+pMvdJAiIhNbJ8c53+BmO6OgGfQeiq/7aRkoakXAP57?=
 =?iso-8859-1?Q?KGdXUqKvv1Y6JHlCVIQVgKoLHd1x+gaTyvlbBUeYjpB+nE01YeI7DKeOhJ?=
 =?iso-8859-1?Q?Ab7YRfThYwdfR/vBrK6CB0BR0f5o0lXgW4LhbGVcw/aXNCHWAE6J+nXH/l?=
 =?iso-8859-1?Q?c/5If/drt1+2aB+bigPcs6BH3hWysICvgtv8qcIFoiwuw15YFkiYz3Afeu?=
 =?iso-8859-1?Q?DnijyJhSeg2S/wBGtjABtJ/vwmp4IIfCOecG2WdciDoxeNB0c8jU9cchwr?=
 =?iso-8859-1?Q?ni+u4mz15n0WuSAEO1Rv36X+3fG5FbkaXInzgTit+WPiPTqR1ShhAD6Ksy?=
 =?iso-8859-1?Q?kZrJfwcMdKKrCXVmAD/3f/KLF1aW0TsKg6SgaRrlIBd21ke8Jkw7p5RK9K?=
 =?iso-8859-1?Q?yJ8iBWvndiQcO1luyT85cN202EAZQGM9kDO7us9x9Piwbco4/quyqgX5eB?=
 =?iso-8859-1?Q?C/ERr1jKINXftdB/unNvgM4wxSOh3iv+UV9xRlHRFO87xnFTGPE2yGBK4L?=
 =?iso-8859-1?Q?vaOxBb+6cBZKDSzcdN0ZZFnX6eIWZ7jJIxB+XefdMyq9BvHOpuPqutC5yx?=
 =?iso-8859-1?Q?Q/l6dWMfIqmhvXsZzX5UM6JNy9lLbeq9rMCqAN47nk0Ygt0SSIuikUOrAH?=
 =?iso-8859-1?Q?9XBl9tLrolhj4lH9dFlKc0ia/c7w3K60E2Ry8Y16k05QzmdOxkLbdxJAYC?=
 =?iso-8859-1?Q?MTGL3n0vNAoxbM09bZwgeMFAnENyaQX2HOwg0NHHNveZqamU0/rpjB7pxA?=
 =?iso-8859-1?Q?q4E/g7zjBQNmmCFY7QAdFWyLO/s7fCfe8bzvb0Z0OVmeCqa558XoOOzlVZ?=
 =?iso-8859-1?Q?cxWr9IQ/pKrhW2ntgMe01UWl1R+MlvS2Z9xhMGGzSQRYOuUd8dmmPG9M/j?=
 =?iso-8859-1?Q?abkx6ssp9524m6GlbpMyDQD90CAVx2R5wGs9f5BHRswvufWGM4poQB6Zb1?=
 =?iso-8859-1?Q?7MOKfHK4STFUWD/fdwkv+82ZMOwpcVImVO+Bi+n3FQGo2z8rv8RcCnyr4v?=
 =?iso-8859-1?Q?mVsrZNtbYy1BQyiR4hFbqwCDPilvjk0pxiSoCcKfxdx22xyTDYSQb+KYCU?=
 =?iso-8859-1?Q?xk0olMnOqMJo+kPGyq1fQk45HPp34TrTc4nyPoZ3S//Lc5b2mmnRpXY4bY?=
 =?iso-8859-1?Q?K8Xj9A0BBsaxd5OCUdmC/jsMvkyYThVRJcT/StN9tzZUTPQX1LYbHi5Hp4?=
 =?iso-8859-1?Q?GbHwJK3zvB9ldT5n0rBC04oY/NS6qSR2RLUfUds4J6rP6dwpYZQyZsKYDP?=
 =?iso-8859-1?Q?fKd6kGw9P8Ea1yZZT+DXj46meg53?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9bqH/wfW2E7+tsC+D6p3uL+UoRnPQJ6QhjsWeKrlOEhvC/FbmbcJ5vJ6AH?=
 =?iso-8859-1?Q?Ki1UvM3sM25HGb6AH+r328mGs4epprxolW16gMtvDY7ubZYVAzFAyy5W9Z?=
 =?iso-8859-1?Q?BmEQaEyLtFBQdW+oHmwDVWC1teXoTHjZyLQlgdr92BhULojJx3rkOFeOv7?=
 =?iso-8859-1?Q?esxUCgmJgpp21P8NfO6xQPSl5Eb/WiCvsl5LQZ6NyS3rHKF2TeaOvjrDnv?=
 =?iso-8859-1?Q?RBITn12uCMJ/NLocMIH+RclY1hgvkHRMuJwD7qJmOndVESpQqJNC076uPn?=
 =?iso-8859-1?Q?FsxMku56U2yALdJ/5pbO+EEs+frwC8MYUg8mbi71f5d0nUwQC+L4OjERTG?=
 =?iso-8859-1?Q?DBqh0ZWpqRD22GH6/d1gxhHLPdutW35MwbfySNqjR1rG+20svQPIzaczz0?=
 =?iso-8859-1?Q?v5x4DNvz1EiglmW14Nh2NQSd2sW5q1Hm/mnPbVXdjrkpa3RxR4b4CUYUAL?=
 =?iso-8859-1?Q?yqEt74YBEkWgPdJr14vfu2EJFa3mcaZa60VGfVaRQ14kyq7d9yqfPHvTiq?=
 =?iso-8859-1?Q?OjnHDkS3IL+PhphoCaW3CUuea0xXygrWdcsLCExK+eEC2mJPJACtaMGG3z?=
 =?iso-8859-1?Q?y9P5MLApfTHfMr8ygx+fbGs3P1GXxwsOiKmsYusZy8Sy0LVAHn6z97F4rK?=
 =?iso-8859-1?Q?aXZLT2SiBw+NQEi8XOEcJvvdX0GLx6G26UEb4jAjm0Lpz6qcrIUvsKAFpL?=
 =?iso-8859-1?Q?z3fwNojDLByZJPPwzkwyU1lcaz5RhTGgoAmBIgRLZYj59E8genGGcNasXI?=
 =?iso-8859-1?Q?OtdySy39ECZxdJiNRWFrLnDUX8kQxXYVoutJbyIoCYl6TZLSiXRr/xIfAT?=
 =?iso-8859-1?Q?6agkL/vFhwX9mvviXBCGtfLNF7iuT/h6x5LNJwjj4qt3bgagTGQIcF7Ciz?=
 =?iso-8859-1?Q?27teBOfyC2O0VdMiJt7JcQOyT5+a0OXFTIOr0RbTSRhsaAt1doFQotk1Xk?=
 =?iso-8859-1?Q?c8tS+HaX0nxfJbu+fr3vCWMecr62aqHehR8TZRTyqM5pbBTfeU8Alxo2R3?=
 =?iso-8859-1?Q?JJOQKOezuSrnHmX7bfUv2YeyNl34RxVJnna1r3pIk6Hc6Te7K0EGj/TP/G?=
 =?iso-8859-1?Q?/NOQFoy2zTiPH2rt9QCQjkjbnq8nNhWoTtLBBrA6kVDppGPf3bfUnWxRhQ?=
 =?iso-8859-1?Q?07kvmUiWWkIpMIfekPnl4Nl6asxSDRqcex2ektAvjQGRKsMX7mhmvkO/jU?=
 =?iso-8859-1?Q?EC6YPGC7x60UvIpZU4taL6BiG+41w9z3kIxRGFWzwY0Mu9BGPexcEFl1x2?=
 =?iso-8859-1?Q?TOuDbbla0DHiMdRkoy/xeUOxLwS65w1hArbi/U1CeuuzXhI8ob2MHYoz19?=
 =?iso-8859-1?Q?bLrZPE4v2ikydqnXsbQe+ZxCAmkDn0HrZC8ltk0NgO6WhlsGHaaoI4QVVK?=
 =?iso-8859-1?Q?5m44K92l+Pm/wNhXWho7JIlnM6+iq+Kvh3dsSYmyhP2Co1+0xxUsHpgWGG?=
 =?iso-8859-1?Q?Ejvzu8VfD78Qb6JdhezGEwA9HRHDQaHNSK/tcD/Y28v7taQmkugYuL60ar?=
 =?iso-8859-1?Q?KQFuaVMcbmTSiQC+B/f6IMloEydVJ5P+CjnmzyAlS0elMI3h+eBVQaqGdN?=
 =?iso-8859-1?Q?YnrMrm+4WsFTidwN6/ZkZMDcr6cda+FGm8Ew4Xt2TT6dgMlKcXpRxW0ddT?=
 =?iso-8859-1?Q?enMCjSijePncR2lYBN7n0J5FEeeXl/SwSd2k4dGy6cPpfPLUPC7iflccCQ?=
 =?iso-8859-1?Q?UfJZjnKCuCvPa2RXuWM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f56000a-9eaf-4a49-aad6-08de17469086
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 23:54:57.2941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xPjaxHLQx2h44NOwOohqXzAuMWjhlmde1SHmLNGhKhb4jtS9PTydNSd/4wNiyD2PE6LWh+pfJ5Oq+D4PDQO63qowvs63RxMPQYs4MTQ4V7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6336

From: Grygorii Strashko <grygorii_strashko@epam.com>

The hvm_shadow_handle_cd() can be used only with SHADOW_PAGING=3Dy,
so guard hvm_shadow_handle_cd() call with IS_ENABLED(CONFIG_SHADOW_PAGING).

bloat-o-meter
 add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-290 (-290)

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index a7ee0519957a..05b394840e59 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1506,7 +1506,7 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v,=
 u64 *gpat)
=20
 static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
-    if ( !paging_mode_hap(v->domain) )
+    if ( IS_ENABLED(CONFIG_SHADOW_PAGING) && !paging_mode_hap(v->domain) )
     {
         /*
          * For shadow, 'load IA32_PAT' VM-entry control is 0, so it cannot
--=20
2.34.1

