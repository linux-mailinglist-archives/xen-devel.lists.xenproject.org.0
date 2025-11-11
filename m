Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE2C4FAA3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159305.1487683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufV-0004kX-Mh; Tue, 11 Nov 2025 20:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159305.1487683; Tue, 11 Nov 2025 20:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIufV-0004hv-Ih; Tue, 11 Nov 2025 20:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1159305;
 Tue, 11 Nov 2025 20:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIufU-0004GQ-5U
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:08:44 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 387452a8-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:08:42 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:08:26 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:08:26 +0000
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
X-Inumbo-ID: 387452a8-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GChkTFZjWg0jioLvr2XJAI3ae4bgAA8OsViHVrMfzhLJu8sms/Pd71QN56KO+N4JagVtYGeQ9qc5gFqtOElwUlsPRB1bqJTVmkjLCBqnbjjtwL9fj6kfdKjfe9mZsSdBuVJfxOkBSWt3ARWGoK4oSDx4wxiijCFAeWNiWGRwoSRlJDRtscUhKA859DgZamTnWafvlisChZcN/0wvGpBVyJf3DQWEDhNzilAUv7OxrxRxVZ6sJopkDRZA8U2OSIuNEb8fvyTuio4+Xk7/EeXn1oLwA1eZFTZbxR/D39Fdp0aXWC6GgU4U55QE6UoDonnDHl7UMJM5aKgCBagctiCrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgVfk4FXoNNmttOjLxewhjRJ89Pbkd84LjmcffM1nvg=;
 b=X4WtQE45+41Bpd7xpv5XZu9oSUNNdJ8gZoJC34pIO1JzaUn3xypiZf0PmzsVaabIebqt77OlacNFy8zeT/F4EjRQFgw5cdQRntpS4DEdj+TWYR0JLil/5nWM4DyBCUfeeYBIpPoV4S1w27CQKStLx6ms38yylaqtmGtbAU01QBGvQf9394otgnheu9+udPq1+UihSSZcj49oImK5OAsKoj4LqYeZX19DqvCqj8lrV6l6ZGHRpBwVDmC/sc3b5Ox9iW/Gr0FvmB08ya4PXYwPY4gXz52FhTda2JcDeLQHeL8OOVwULkWaaNDynUMmLT2f78TC2lVXivrj/7eobtCagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgVfk4FXoNNmttOjLxewhjRJ89Pbkd84LjmcffM1nvg=;
 b=CdMR8gZSBXg6B9vxcxmk9jH+QlwBpdRV7p/cranQtSgQTd36PY7MAXRPn3YvtnxJyF0umiu1RW57yU1wxlVgMBGKa5iXm3W0mR47I5EFaXzaoe+ypSP6jmqs8mIBWEGvSP4K6XK8TA2k6jdXHgF275KwaSwsyPo/OtBykuo1UtXSW5na8yasKaiA+JRhzit8Bk6bxQLmWJ0L+0fc6fOW0jd8btbk7WdgD9jcqFTjrBH+9OYYKPOMr2BdRbqPjlQtP/GS5rnsgCWDdloq+Gm1FZGOuq+8aYe8+JWZCPBg1qNLqNfC8BS7qIvdLlxNFaAx9jfIffo4Jyr2jRXGz6hpMQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RESEND PATCH v2 2/3] x86/hvm: vmx: account for SHADOW_PAGING when
 use hvm_shadow_handle_cd()
Thread-Topic: [RESEND PATCH v2 2/3] x86/hvm: vmx: account for SHADOW_PAGING
 when use hvm_shadow_handle_cd()
Thread-Index: AQHcU0bwAk/DeRt/Z0ykYoQbMThuGw==
Date: Tue, 11 Nov 2025 20:08:26 +0000
Message-ID: <20251111200754.3575866-3-grygorii_strashko@epam.com>
References: <20251111200754.3575866-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111200754.3575866-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: 7e9e3bd6-9374-4b35-921b-08de215e1339
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1eN7LXCnyNy7x6DKMW63D+MiAgNqcnaQrhLEH1SdAaFQgaOG6Di5nhQBIg?=
 =?iso-8859-1?Q?3eMizkEycsu8Z517kzQLOjTg20kU59LNpHAZVrxcEoRptUlccFhPO3z9hk?=
 =?iso-8859-1?Q?rVhKNSyMdjORHFz4NbO2XY/UME61+LJb69+0XPBOu+OVn0+D27e0ZUmFT+?=
 =?iso-8859-1?Q?/ddRrE32675Y5+MNo6REWzALNvW+byFi3+ExtVzxLKT8cQmI8r1hhwFMMS?=
 =?iso-8859-1?Q?1br3VTLOWXxTRQsunDukT6/QQzZGCzOGoQqi/4pYIFnTis0K0GWZ4QoW6t?=
 =?iso-8859-1?Q?dQ2fmmFF0QQSdSKyfpmcqWKa998uF9/vDKaOd7jy5KbJJfJTy38qQPUioC?=
 =?iso-8859-1?Q?vFpdFy0d6451gMidx7i4F0ywdoQQIGbIqsA3wF2USob6GETIc5NoXVdyB9?=
 =?iso-8859-1?Q?1h+LBwYsTc1lu0EVJGT+TdVi5WU94TY5etLlPB3fMdrrkeFxbKFOU+knGM?=
 =?iso-8859-1?Q?ZaruqBo7Dbk/mxKd6+48iDTwgyGdYfbWYZ9N9yo6seSrUgBdxo8kgKiBbs?=
 =?iso-8859-1?Q?ySofVGCargF9KV1793ONqESEuWk1u7ntNaQvV0KJYUvLk3M+MHwVsePakx?=
 =?iso-8859-1?Q?fhYf4fSvim86MmIggmd4fyXzMn3cWTjEhDCkLhnKeFej9MI2cFrfbhF7La?=
 =?iso-8859-1?Q?AuYuL7ElnBSFqcW3+f/ZfoROV7WPoKGec88SHUsaDx+rguYGTMBAAS/kz0?=
 =?iso-8859-1?Q?p/wflPxA8qCD8zxq0/ndgRfR59LViYFLiCEnTTX8ByKPXstuGTFwAfel9b?=
 =?iso-8859-1?Q?xOzrgRfmFM+xVPwzIBg4JP/QPPfTpyLXRnHAPmD5i7OMHerzFC8JwAihcf?=
 =?iso-8859-1?Q?uqUSaUJyCHcupWDQYuUr7R9WhworFufZqM9EWasCgX3kPeudDTFUa1KHAV?=
 =?iso-8859-1?Q?e8F+E4hBYoofLSseS8pQ1cUmtjFlA4qTAKMIL1SsQnIFJ+QyGpKTuHkPEj?=
 =?iso-8859-1?Q?skBpsUsjg7H8RvNOp4vsyirPvqZ49W8QReMqmP89kYBn6oUuKoFG/00Q+7?=
 =?iso-8859-1?Q?t0bVkNosEbYdLo1CpMphpvFMLskssurPJfhCG8Be5uDxAz+9aUy1/5Ig1c?=
 =?iso-8859-1?Q?cQjGTU9kk5zsMf55FK5J/M8XDQw+OOIwDk3myicbRVR88UghSbgICKgLir?=
 =?iso-8859-1?Q?NWTRPOiUZTF2pfEgQPhMafdLvyHuxva6AmDgv2LXp+wui+3zOq5FmR3Z1H?=
 =?iso-8859-1?Q?kTwlbkcT+SNBrYflxRUVYnGNET0oYBdX9MzQmhN8sni8DtgMZcFYgPcr+N?=
 =?iso-8859-1?Q?lSu9EiX02mjVNOqZLIKkMyzBlumgsQAdi/A49X677T67xPkuCWOg9rmvmP?=
 =?iso-8859-1?Q?zE82qAyQ3HyfF0hTb1O6YWcJfP2NfUMf3MF/5VV2g3SLNpClGKPRo6qIry?=
 =?iso-8859-1?Q?PcBGwXsH0aPkCnPPLB0XPqnX/WHamTvr74BCqhkm+igEz1RsDtVYTVsjGU?=
 =?iso-8859-1?Q?w6hxKxNsaVFEfR820IdRAvmubU0a4/4MnkLmkYwERbWUWb6JF8XZEFKZMq?=
 =?iso-8859-1?Q?NwxOr5X8F5s2mxyiy5YOv13IQNLB7zqYVDj99lZca2LKdlfsnhrY4yXKmM?=
 =?iso-8859-1?Q?/EBwVQR034t6Ab7uDt0pMeNl7wkT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XoHkZAdZz02/e03j0tWQ+InhZFJeQ16PLlGs/jlIPxZAEfbw68wkqqxksi?=
 =?iso-8859-1?Q?S9r9Pp3QG0uvNzcYFppJs39A94757fjd4R9jffR7U/2+ZCmGbgMc33LLLF?=
 =?iso-8859-1?Q?WdioyRyvBOHx8h/IuIzlQWhdiTK5MXdOZU2eh/lT//dSMUqg0LsMlELAo3?=
 =?iso-8859-1?Q?+JRoj2VY2aL27PKkss8/1voLF3kil33JGZHEHbSRKbwO0DNjTbEcgw3qes?=
 =?iso-8859-1?Q?KAkv/6D+7FYDeM4BoqT7He9LMiPVoPQOVH3aVOEmFocF0pGoE6St9BQxI3?=
 =?iso-8859-1?Q?ipnaY4pnWQ3yr2UY+JhNFni8VTve8WG50S483I/Twl/m68aBhzwQRpzBBr?=
 =?iso-8859-1?Q?hx5v2gVcF9qYm+8wnsqfiLhVv1Gvzp0RWf71QouMDvyi/ZQO8vx2q4Ke+8?=
 =?iso-8859-1?Q?iwwv8L561J0vNWPAYT9OxDpttId9S7ZUM4PPQyrRKgGLcx05cycerprKzi?=
 =?iso-8859-1?Q?jkQXUkyXlGcFct84oIOMAh5za52TMtom02cbfpUKw/pZYOfZCc0qYb/Dtl?=
 =?iso-8859-1?Q?o/0YHgoiOQbtRdpJIgCj7r9H8JBx26y/KP43zdfXbPrvPUzombP3wsyhzY?=
 =?iso-8859-1?Q?T+bTei6aptvtP430YzO7LKYNDi8SpuK4gbh8wSwJocTPW2K8YMoEKHLgqN?=
 =?iso-8859-1?Q?dCQyzMcrRddHqHyJy3xJsi9kS8yF7cy15jjUtzte8IfjcIQesr6ZYDGC3L?=
 =?iso-8859-1?Q?GJDieQO4ufZ6KYotKYz0RuvtjqMMUWg6In+kpP9gyXPAALQSB+rvzm9j99?=
 =?iso-8859-1?Q?qO7t5nbYxNzbxGyH6rrJ6dWFyWrhSUa9WW90XKdv9TWPdOXH9IK9lvID9p?=
 =?iso-8859-1?Q?Xu390/mU+yVDh2W3cV1uc3/ntyqki7DBrMh3t/+Tef6SlNuNEMH8dw3tER?=
 =?iso-8859-1?Q?13D/7lcOziPmazbSOQCDDNd1CuoMJbmaxMEw4MOmVIVwjL5kanyo3Uze04?=
 =?iso-8859-1?Q?bEgFhdc2H9LztBk7D1epfxvKe0/qTaL//dvA7lalf0ggqfcU2D4AL0Y5Rc?=
 =?iso-8859-1?Q?9LrrU8f6n+o+1DCXMh4mZQdBTYx8WDbTWi854N7Z2rtBA2IcdzwNH0UDH4?=
 =?iso-8859-1?Q?X9WPOoFOPRyr9qDfL8EMifI+1nspMrMcy8uQ5ErdgtVQKX51nv0gemgzbB?=
 =?iso-8859-1?Q?bOEPcXVyGeWGQpJXB0dHD8zvkvnFK+e6VnvU/pdyqcwkNj/Wail/KSJbhY?=
 =?iso-8859-1?Q?xMop1QjmvpZ3US52M6Tj+zDoMzixhwq2ezU6GcYZ+PE1mWXk9oZ4uWzwe1?=
 =?iso-8859-1?Q?4WAFbSCqyTfoK9f3CVIND9GaC+wwaglK28kOTn1ZkhTNhR/6Y+CHLWSDXZ?=
 =?iso-8859-1?Q?sr3ndTXxIo9SbibI7Z0pdHAngT3yA2OZESC0o9xL/vr6wCV3/tDmkfcmqo?=
 =?iso-8859-1?Q?qmNDyC6DzjTdvmIqMNPC6ytl4sCEY0ThtFFq9mY0079zSwFoYAkAdS7Waf?=
 =?iso-8859-1?Q?86hIdLbN4qwC7bla3Z9ogc54/Kc9UFqpqIBGW8WGfKxV7RJbJMqN3TfBM8?=
 =?iso-8859-1?Q?nnL2F1e7JBUlvuU0MmT0vEJR9ZLkENjzO8ijL76U8V+gf1SMcH5WhPv7U/?=
 =?iso-8859-1?Q?geDo5VAY/0iIFpSGas3dNAjXFTT0hb6GbM2AHD6ewdVTBZpH3kH7H6kQ0Q?=
 =?iso-8859-1?Q?afbQyxecSfGtgVOc7z7bFrBfChZlqjLFqa7II5f7HDc8acnqYlqmijEg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9e3bd6-9374-4b35-921b-08de215e1339
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:08:26.5729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CIPFWV0bXXtKZjdPTA40fQZp/IzIIKn9zcgyLywzhWef8HX5ynWVdDnpiGBVJ2KZAA1YOkhE5NgJktUsPtIyN30UMAdnPTwqC48+2SjGWmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7758

From: Grygorii Strashko <grygorii_strashko@epam.com>

The hvm_shadow_handle_cd() can be used only with SHADOW_PAGING=3Dy, so guar=
d
hvm_shadow_handle_cd() call with paging_mode_shadow() which accounts for
SHADOW_PAGING state.

bloat-o-meter
 add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-290 (-290)

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
changes in v2:
- s/!paging_mode_hap()/paging_mode_shadow()

 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d7efd0a73add..67861bc8bccf 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1514,7 +1514,7 @@ static void hvm_shadow_handle_cd(struct vcpu *v, unsi=
gned long value)
=20
 static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 {
-    if ( !paging_mode_hap(v->domain) )
+    if ( paging_mode_shadow(v->domain) )
     {
         /*
          * For shadow, 'load IA32_PAT' VM-entry control is 0, so it cannot
--=20
2.34.1

