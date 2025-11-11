Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E7DC4FAC7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159344.1487719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugq-0007cp-4H; Tue, 11 Nov 2025 20:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159344.1487719; Tue, 11 Nov 2025 20:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIugp-0007Vz-VE; Tue, 11 Nov 2025 20:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1159344;
 Tue, 11 Nov 2025 20:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIugn-0006ga-KP
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:10:05 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 690612a1-bf3a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:10:03 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB7758.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:10:02 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:10:02 +0000
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
X-Inumbo-ID: 690612a1-bf3a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQvmiwF5qlQIJEAJzLS05w/fQIf6++lZh8KsfosEXoNDUdh1ZsgHI+Cg9Yf10SrL9Z/mnx9/0j/1Xz6rZJ+01E2cggArDdCX8eDQ5iYHatl+oI/rnSVroKVRJJubM4Qg4cWkaK/kOn7715NLRQ0dN4NonQ62Istc+PPCdW83Sv8PP9dS+p/PoBcdTg5GhyDwVra5Wbt8ym9k6cz3whNai5acerm010SB7xtFoshAPTko4mrfmp7+RPcAwi1jkcGoyVvwC3u+lD/kfzhwfraKawux2HpnZn1c6CQ5N2049mFqEtKdJYyDVeeoHQ+YgqK0sX44r+XTOzT/pjbEQm3OEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgVfk4FXoNNmttOjLxewhjRJ89Pbkd84LjmcffM1nvg=;
 b=juw/umd5P0NcIEXo1UtUT2+NmZYQVAQ6hp33nt403aoYYbBUwtLW2r8lLMVhStNoRjGASiX1ZQC/fXn7mitXWQP5DnAGJG80yto6EZPYdCi+rTufzoBxS1LyoGx5NbwCQzAHyR3bEq9em+fDTzFTfHF6wpcbsUigJKmEVMU9fRefWflD2WQeW8huCGiPu3wesq0xoErSSdkHVOFIhKby5Z3G4vkRSHT8axrUCBm1rakOchMyhMaGbEItXRPqvrb7mFXknsPaADx703OchxP7FQ6XNXqFf40OYXcD6jSXmZrRgca/RBkS2c19mvnGJpazXtGlhi1dCSa7U+0OUJf2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgVfk4FXoNNmttOjLxewhjRJ89Pbkd84LjmcffM1nvg=;
 b=HlJvOBC0iw1iXR4Y7OcQCkiK9g4Tr+XK54lMUBUGzxoRFIEQtwc5QvLiON2onZs10iMMKlT14cnCXCwrs2k97vx/OP4HQSchXCWeQeJZrQOMtejPqmBbiBYAtxbBHZPPwzhTucNdb0yD0C1dnTTYq0y157KLfYhmZnrDSjaPTwFqBmfI8UQRjqpkRvo9SFp3II/tV5CgMu1tD6WyGw5zbYoZ1j/huHMaZhm22ms2z07W90U34LF+PQy8mMkaBBIvF/TDUr/4IbI5OXpDTXQr877PYCZMpeLc/Ign4d5cbyrf6yGjOmdt7LK4Vx3dh5pX9VmLpqE7CHGcU1oBv5OVdg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [RESEND PATCH v2 2/3] x86/hvm: vmx: account for SHADOW_PAGING when
 use hvm_shadow_handle_cd()
Thread-Topic: [RESEND PATCH v2 2/3] x86/hvm: vmx: account for SHADOW_PAGING
 when use hvm_shadow_handle_cd()
Thread-Index: AQHcU0cp8fef9PeSd06dFSU8qlXKnA==
Date: Tue, 11 Nov 2025 20:10:01 +0000
Message-ID: <20251111200958.3576341-3-grygorii_strashko@epam.com>
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
In-Reply-To: <20251111200958.3576341-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AM9PR03MB7758:EE_
x-ms-office365-filtering-correlation-id: 9804fbff-d443-483a-80e7-08de215e4c26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MEStXg8xfWqdGND2k2ik0o1WWOIjULtK0pthDJMuX2GFzjw4jGhZFocjhU?=
 =?iso-8859-1?Q?kAZOZgxVl+LffY36P4PapdeyzEeib2l5KzRYqHOOkGRlCWnhQ1NggqWWLk?=
 =?iso-8859-1?Q?GOBUYf5YUCasn3qCcO57QUGEJtb1TJ8Plhjw+u5fLpsOkpdU9hr35HyM61?=
 =?iso-8859-1?Q?t+Hs4GuZwsJiFwPffoivj9TE2jujcE2XSNbDgx0N3jhjEE4Km/H+CK20GC?=
 =?iso-8859-1?Q?+Vpv90eMDEWvvsuqeHtgpXx6inGDiqJu0nXr35RGEK+Or9hDc/EkiJ7lYA?=
 =?iso-8859-1?Q?BU3DDjQJjr+hKk9DPQdiwUT4HkoVR0J3DB35YocSotZZL7e1X6pguZ2Pio?=
 =?iso-8859-1?Q?GgLcPMWbsjFk6UL5rujYfxU2nfW9MMpqd0glVTlBK9raJJSMARG2BC6T/a?=
 =?iso-8859-1?Q?0xampA89mei9S78zKKpSsXCtXNjQzv7Yx0JaR9bNDuzkliRYB6jcDDy17d?=
 =?iso-8859-1?Q?CcIribm2mEmFcJ5peUwPgfW+dmJ/TVZS+nTd31mCBbBaWoPMPI0dI6nSrm?=
 =?iso-8859-1?Q?am1beXFwKylq5iW08ZUHBp/X85vOtYkiZ3XLgNSw6tRlU6ozE2UaGM3HQ/?=
 =?iso-8859-1?Q?dNcreOAoaiShU+zfhOHNtVJYx37TfdRq+/rb8YhSp3qGdPzak+xK4KgpmG?=
 =?iso-8859-1?Q?HbFkBMZD6iAjAwt3U8PoaM86WofAnrxtA9KyAio5qaSepZeYmZLsmLZ4Q3?=
 =?iso-8859-1?Q?pRbAwxWDk7XDCLd+rgk6hzmtfjJGzoouLI2/0tGdsQ8gJhRSpnUyxA1fVx?=
 =?iso-8859-1?Q?j5GeExjFha7EiF6HmzoPiSdtH6Kski6LJLry1IlaUWC/77OFITxE13S6Qy?=
 =?iso-8859-1?Q?wlGvj03Hw1582iz4BGOCvru34bcIgUoqk+2pvmC5D8II2uyF3EOgdXR0tI?=
 =?iso-8859-1?Q?Ja7/LArz+jyI3rUugYx0aUkqpu+btJmiUA04VqPUUSoLqQ85WbC0/weBBZ?=
 =?iso-8859-1?Q?AG5MuZaQfPIQtDfAfI7sHLVmaSpFsaCig2AS61ek8gNvToNZ2SvGM+jBLO?=
 =?iso-8859-1?Q?vMRB3bFLlJlQ9fLT7OpLcwt1DSLMC0y6wzIFNZ2wMpCuZMF6i0MS9A+dMO?=
 =?iso-8859-1?Q?0skr/Mg8oLfbDqTK8s6M3CaKCsXmgpWpvrXWq4fgkY1gUSgQ6hEvZOLNEi?=
 =?iso-8859-1?Q?ZhSYGe8TasMR5dCpgqsuobw6GZHJDaMjtI2qCYCwgXNoK3TR1z+cegpDms?=
 =?iso-8859-1?Q?RL1cGPf7XdXEKu2N3uNN2nVLopJ/3hFnl3J57z3ihLwB9KinoHZYY2H8w3?=
 =?iso-8859-1?Q?UTqVrXzBcgyw+1l1eHn1/i9d0ToZwRK1LckED1NpLAKukcyEUjDk3HA36u?=
 =?iso-8859-1?Q?pC+gUlY9yvFWMcAvx0znxjOKDn7KgH5KGirPWehM4y0vldeBJX7nZlWN6S?=
 =?iso-8859-1?Q?1j5qB2wywZFBG9XEyNC/saW6Kcez3F0zWLh/6RzI/EYy3pzZIDCHX9Zf6J?=
 =?iso-8859-1?Q?XymTay0W1EJ01h3mAvWbX0F2dC7nGpQPMBYWMwKtm2+XCYQ07iSBcV4C0r?=
 =?iso-8859-1?Q?K6WhOuQApSo9ujcGgLVLlNePksgWIBDny9yTR2EttAKGF2UglSFR5NcuEM?=
 =?iso-8859-1?Q?KWu0IfPHLW4/gdZMeZAcku/UDtlh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xayXg3kV+7TQdoIomv1Mivng5U7GE0qcKjrlgUlItpbbsZM3q8e9L4eAJ4?=
 =?iso-8859-1?Q?EdlSoTeu5g3qSCWR2Z/MgkawvfYAl6vQCGpTZYZbbMoZHVvk9qdTY0exEh?=
 =?iso-8859-1?Q?pyibktg45SJwqXtTa9IaPXdJHxcGZNZnWXuVRISTbmwRXaMEYF3covI1Ki?=
 =?iso-8859-1?Q?MLuVhN4LcJaR1cJZRLw+IxVfjloC+mHgct8XDC7GD67pyQApIjPqEXnNCQ?=
 =?iso-8859-1?Q?LzXrnmXGUAeOeypOxREC4/8GD0KZ3gwovlf+zL6lzPLHb8/KsI7uAkzoGD?=
 =?iso-8859-1?Q?I4vS/gkUTrczhRWly0Z0WTreUOGzta49REuamkOk7pNdA1jKeb7OcSXD1v?=
 =?iso-8859-1?Q?lZZus1zPyEgrhPNO0P76txOKGQY0qmijaFE1nQgXwrgd11YdjbcUdGS6Vy?=
 =?iso-8859-1?Q?Es/68madtrVCGlkhMFmY2M2WMfSsm5qJQRUx0DdlEDxGpMQGG7lVyEDhEA?=
 =?iso-8859-1?Q?s+fuhfM+ufz9Vt25+gQRBOdOQHLDWT1S4fMTfwqYGJrOgM5KL3iwuM3dLe?=
 =?iso-8859-1?Q?A/I8zcd4DHPAW+hmYJGeRZILPGzP4pk+H/GFayQ0anoaCsxydcG3GwfqPL?=
 =?iso-8859-1?Q?ak2NxxO8sZ3d2NGtUU+7dDRhSTbVmZSbY1NMAidR1AGasnyDIPIjGOZCO2?=
 =?iso-8859-1?Q?227CAjNfJi2QSY7mHKPIwvVBIysHk0vhMGXQnHrnBMfDnIG/K4nyu2JGYh?=
 =?iso-8859-1?Q?sHrC3yukhCWHxCAZ6PWpfGud4hEKzAW9oxF4Br/Ko6WXCCPCn6fk4xPMni?=
 =?iso-8859-1?Q?lawVra0y0W6d4eJca7PChpQ1T6487oGD8fIEsFhNqsPxb5x8ZW2wONF3IX?=
 =?iso-8859-1?Q?aOaAxmTw1unW1VC7o7CeXuoFDvVBZIYbmh2VrTKc33M4rWmH3G4yjWSYKn?=
 =?iso-8859-1?Q?1qF1+QGWiLSYPwP8n0EVDcUrpEbezy5zPtumXM7F3t9KgGBU+IPHxkoqRR?=
 =?iso-8859-1?Q?sLLQZQbI4SvqJiZ2/txENF2UADG7Eo8Ee55CViqnBL+NoaOGaCHLkkU1fe?=
 =?iso-8859-1?Q?XmYXCwK+eKVkJJq3F2xW+ujg1DFSSkkgQIoJtW6/6neVLTI4UiMzU718m6?=
 =?iso-8859-1?Q?582YCnX1PSTq+D1U6hppG8VJY/s3Nx/o6MU7FnN/o1S7U8mIjPthEOS1WY?=
 =?iso-8859-1?Q?SJ/XRrIs2+Oax8wCMkGF5YHhG+QiGxDuiIILOeACzHRxIFoH/Z8iy8VQ4N?=
 =?iso-8859-1?Q?Jwagzk0yOoh87jnWaSWFSYktUdZgzr2ITIBhJWUTjdvzruBK+KHX6FjYjX?=
 =?iso-8859-1?Q?4aIZ0Hr4QKUOkgmBIDQ6pj9BxjMmpXp7qZwlWqnA0rAGMrY4wy4a8Oxx2T?=
 =?iso-8859-1?Q?CZPH7lVxumrJ8mMa6pANvsILHTNW+Oj5vTd4wbdtIbSe6Z4RqzO4G5uc21?=
 =?iso-8859-1?Q?KWX9ovQWlqg4JTDndwJxglFGGs0M4hEWrQBw3yDh4IwXnh2wr1/F4+DQ/R?=
 =?iso-8859-1?Q?Vqk2vNvOOunFhHtszRfKGnq2wXyRrgQVU82JW3tRtlEpblali1lfewNJUz?=
 =?iso-8859-1?Q?D2BgM8eebBExbVvBOFsbpVTIUv7PyS4CAgXe4VmyDgSgQeZnqjXNbKtIAT?=
 =?iso-8859-1?Q?jV/8+FQqQJnTqbHCkI79QHBWlS1xRoYUkzbDoQng+0WqGcFqNDnjH+hiDw?=
 =?iso-8859-1?Q?TlIPkRlrf1uMBbK+gP8zGtfx0atdNqQJM6Nf/jCa7o4ZGtCFw5DYqyEg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9804fbff-d443-483a-80e7-08de215e4c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:10:01.0607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vBRJE6kz8KVVvSkVutDpRvuN5DoJDC74RkaWFG36ocPOe4ccPuT/d68bbCG/LZbBEXe/pdw9V7CJHiqCiHGskydUz5HXUvkTOXhIWA1NaU=
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

