Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2AC4FAD3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 21:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159409.1487742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIun4-0001ea-B2; Tue, 11 Nov 2025 20:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159409.1487742; Tue, 11 Nov 2025 20:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIun4-0001c9-7w; Tue, 11 Nov 2025 20:16:34 +0000
Received: by outflank-mailman (input) for mailman id 1159409;
 Tue, 11 Nov 2025 20:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiuT=5T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vIun3-0001c3-1I
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 20:16:33 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5030467b-bf3b-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 21:16:32 +0100 (CET)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AS2PR03MB10060.eurprd03.prod.outlook.com
 (2603:10a6:20b:64f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:16:28 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:16:28 +0000
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
X-Inumbo-ID: 5030467b-bf3b-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWEhgwYcZAKLbAiIgOtlrPftY9mCVsW8d/ToZzWuX5SUzjuX4/vitOYD2s2ey4XhyCzts63oKsxU7JyGIIc8l6zr78dovseY/Qi/RZfOgn46bB/at7vTDunSDOwLUUttayJD6jJFT7ndc8MbnRa+fN7cg/E89FZvdo4xCjlma2zreeXfmjnthQCa/QS1qejbGg/gY82ly/OqbdXy2w4fbSdEc/iNzzRkH1dJuhdnGlkU5cZs40IbliRDPH/Kol7QeTteA4uzcJ6ZUt5Yv3B2yLIkwW9KpJiAtvp8pMlRADjnNKoWjS5EjIS/prGSVGbSjsFuSkIwhXVvlUa0CXnOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm02RrJ+Zmog2LO5aBkDGYRaTMo3FfGlxm9+jCriFPg=;
 b=XUqlk62JGmvgKFWa4IEkg2UZwq8CkdQHrHUWMfWvMX6sqlEuRMttppLcgQe/THbs6bgxyPzGtJiZTwpUGIT/fXwbMKgPmQZF2NBu50MFF5Ku8oulcmgROxZ334L+JFHGqzAdJkXObwHNm9g7gedhlNMCbpgZneM4uaxeAOzQtvyjBns6h3pzvT0K7S1XrkLyptwdLoPLXxtma5/DRC/YokbicqeRBheJ6HFL/iAuWosXIcm49OCALvD6AsIEKkkLXUTTWbh/pZrJjH8Nuv4+oAKQ1qGv/iFu2k5V/ylyL+AnAZrAtr3CAMt3d4kvWs5Sz3KYmlkFC90H7d+hHsWpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm02RrJ+Zmog2LO5aBkDGYRaTMo3FfGlxm9+jCriFPg=;
 b=HDrFeZqaNtgDTta1B+C1nEIf8lh1Zb4yeGAfU15PCHWxD2rtkWR5iyOZdcX1SWNz2IAdmBEqKpegZBgzVGgCfLRfbtipRWxFeM1+/pHF4U/uvYpIZ9jnO6MA0S7ke03l8awdndq/W7nOxt4bUVPF3FgQReL2a6wA/2ltddxCpvxfiWtaYNrrqtJ5lWXBE4IGwQiutA6HWQL5VswjXcIRTarDxJyXzApOEi0LTy1/SzetTpr2aw7qV1kDTlUHZZr+rqZOhJQ7NZopaLQsOXvN5qdTyWjlaY1+698sYbAa5v+AS+wiOUcrvsyoXDIukWzUpguAGIjMDniiHAau60jwEA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN][PATCH] xen/domctl: add XEN_DOMCTL_CDF_ALL mask
Thread-Topic: [XEN][PATCH] xen/domctl: add XEN_DOMCTL_CDF_ALL mask
Thread-Index: AQHcU0gPJuvEPEXhnkuhV+1ykI6wJw==
Date: Tue, 11 Nov 2025 20:16:27 +0000
Message-ID: <20251111201627.3579504-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|AS2PR03MB10060:EE_
x-ms-office365-filtering-correlation-id: a8678701-6705-45cd-2d89-08de215f3233
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3b0qhO/WWfkpYCyn47selaNBygn6OcLK+lGATzHaIv1UDDvqNvyo4Vxohn?=
 =?iso-8859-1?Q?0rPs3oUvKjQNC5Nf4EyoCX+MRvzMGdyE5GXNz9eImnOjghXXuNJtXXz+9L?=
 =?iso-8859-1?Q?J3Tr4RKLjI6P/vlvvaT+S6ZE/GJA7liFiPLjKzB5JtTLxGf3H9F64ClOtO?=
 =?iso-8859-1?Q?ITBkAfxfZLt5B+fmoNqCbgCzYB2mWDb0z+24yPlkOli2TtE09MaSuqEwqo?=
 =?iso-8859-1?Q?UPsn4N+0u0SZLQva+uExeQpf9g9nM3yRFrqAaEcKBZCaERu2FmKj6kvhN/?=
 =?iso-8859-1?Q?y7Id4qlDm4XBB9Eu/PNsyJJt+O06XBu3IM5HskWD63rQbIkBSQv0y04F8e?=
 =?iso-8859-1?Q?s1YMea2m9jhlk8qaNeRvkTVNhp6vF3q4jRWOeQ+GX9K/LJFqtZLQLNiTHm?=
 =?iso-8859-1?Q?F4lZ539cI9P6Q+tGsWtT/qwW476A3LKDIEwn0W8utZ5VMVaCtFv/yQ8eeJ?=
 =?iso-8859-1?Q?JOAB0PkI45b5x6iCr9oRWDbkfjz0E0QfLqFVRrOmX5XZEL5yqdr9KrUetP?=
 =?iso-8859-1?Q?+3UCWq/V6IsNvWS8pYoEXmlvmLX5eU1FS40O3T2LETzt7H8XgcEbjj5vKO?=
 =?iso-8859-1?Q?FX+xLHvGKc3cIwKX8iw0N8HZ+bc5aQKR1F1BniKa7JqggJ2XTOf61imo+e?=
 =?iso-8859-1?Q?SWQ0vWW88at38n7Sji4smabSV9ACALEWP9/gs18PuZCynJsKjiQQoLrR65?=
 =?iso-8859-1?Q?1Et/SB/gCiGyhqJhyqm9qi5vhKHoHjiUV9D35RsA0e8uYDacK1nw1jPznW?=
 =?iso-8859-1?Q?KwSq5jcoovPADySSztuZYJy25+LZt4q1ukFJ5I6hFfIT2tJHCvlIKoVGKa?=
 =?iso-8859-1?Q?Xa/2Nep2zMhoPiTNyDZsh1AM2sM79zl/C8XcP4lw4OangfIjd7JXIniB+H?=
 =?iso-8859-1?Q?tH/cf3nLwcy4DweldF4Whhkd/uX2atTAhHCS8meGXYpWxSdLTk7aIakE4X?=
 =?iso-8859-1?Q?bOG3BuZwbuHKcsGIauYaRxb4ZXh1W/N0rJxu64h+gzaGLXwfgy9y/PtKit?=
 =?iso-8859-1?Q?CWKwDuRD3Jaa7DLpVr5nyALHTrkq7KYt3+0gUVSxT+fFSlGsrrSsjxTbvb?=
 =?iso-8859-1?Q?1YpOQqCpZ9HJCj2XeOomd8oQsNg7BzuoquV3QI6mv4RVnUISTXZYlj9day?=
 =?iso-8859-1?Q?NkE8e64mIySd9K7GiqKZCfhRq4pRyjhPdqig9srrdUrD4lRzt4HlIvyB48?=
 =?iso-8859-1?Q?RUIDpR+JxQ6vljh32/UvXqZpS1lHC77S2cFZ2f8/oLtqxH8BHJc9h87bi1?=
 =?iso-8859-1?Q?xTrync/ShGqlfubIKqW8hCIl/riSbM+Rsin+bmZoJO92Qc7qjhSnPYEkuK?=
 =?iso-8859-1?Q?md1F+fRI7iQJWPeLxd3p3fUTlNP1P7sgezfeUBXq4Y5K6hp588igP5RTel?=
 =?iso-8859-1?Q?AqBGgwK2Tyflb7uwmsxtaqEKb57p48AUev3VfZyn/jGprwwZNjMr9mPDMr?=
 =?iso-8859-1?Q?sdchwCDo4YUYmgv986y6GlJi49JRJlP4t7JVxLXx4gkFT6m5iiOsKVa5jM?=
 =?iso-8859-1?Q?DNPC7r1jDxBOUaEDn7orKdMxEZ139KBldwRdp51fcXCo6fq4igeq9sme+F?=
 =?iso-8859-1?Q?wV1E/1WiWb6EAYV7HvS7da6t2mGl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fHj2GWghF/EiuVDSXB8ROVq6uIpHk0EiXkSBSmtXNPoew/N8EFFedy6NjS?=
 =?iso-8859-1?Q?qsegFE5MPHRD3rXhoE2ZSY9SJMiOnmGLJ5sKi3LGdMf8I+nNm17jkF/5Ug?=
 =?iso-8859-1?Q?kYJOBcZ92NBwJu4HwCq4yPQ10cPpO7Mej7qM1vEyXJSNbDmJvV6h2NXzvi?=
 =?iso-8859-1?Q?U5VWY12UoMObwhVJd8VAw63RFQ2JfWl+v4Db+upoJnORppwJ5aXSWwB+ls?=
 =?iso-8859-1?Q?ZZhiCx+WeDd4RUmDPjJQOVSwLVqXfzF4vbI5bE2A6P9L6KiyEmCT2b2z4a?=
 =?iso-8859-1?Q?5SJWcw0CcmTl3db6whYW950Ow/MDbnl8EQ53eBIdr5TMzY0cFXs51N+qxG?=
 =?iso-8859-1?Q?pisMQpTou3XDABjF5il6Mfwqlai3BJt1vbDW5BXzhsDV8dJMWuHw3yiUTZ?=
 =?iso-8859-1?Q?Dw9K2jYLaeLnWaOE0HO/ohOiLYEBFA2AKWY1M+ljLj0KTs0WaBcOfmoM4S?=
 =?iso-8859-1?Q?TRfJYqj9poTnn2FsxjQzl3g9ska9pvEjmgNdipe9nysC+BCAU+GRjo6gXY?=
 =?iso-8859-1?Q?LfYKw+zpLFKjp0knSADVacVfPm+o1zfLpGAtqqV6BYWtP19kjwXCTURyJr?=
 =?iso-8859-1?Q?rplvY9Y3vPcWkmzzRMjcvCbfl7sgLdKjcEiPy4tkO4wGsd0JkJzwf0706g?=
 =?iso-8859-1?Q?pBKhR/Ww+OVX1nZZHB0oBOI6Q8FcrKR1zQHuUqvC2JPj06N08bOF2E2vyF?=
 =?iso-8859-1?Q?X5I7xnuEhQk5QqUCu3XuSPTa14AOXLkGOTo0SbhuzD1De9iYk3dxOdZg7z?=
 =?iso-8859-1?Q?ez8681HXzOmWLgm1BHt/fdGLoFjrYIaBsz8X/XEBsazkaEQopTtYCwaWWF?=
 =?iso-8859-1?Q?dSUJ/mrIc7hfVQbJ3r4AJMwa1lU6vcIRx5EuO+6x+SpICvfrKJ+02ueE39?=
 =?iso-8859-1?Q?sSMub/YoWdIG4z2sWuSSZoPKrUTgbFviXTtkMJbsc0FoIWxWwFOj54MTUL?=
 =?iso-8859-1?Q?s3ghJ22bRgcbdtbCn1OZtcTNdsxIJa8LueEIAbuDjNM+FdJVUi4hPzq0AR?=
 =?iso-8859-1?Q?1DsIYZLZHZ01H1KxO1GZwCbmHTjUExUFl8DwCHXENanyCnVbFBJV3zktQf?=
 =?iso-8859-1?Q?c4F84wAWFLuHw01oHBEHyV/00pD2czoqkJPBBbeDps6pdsZeJ+rWSHt6jp?=
 =?iso-8859-1?Q?XRX1uqTNhJ0brAS1Yq2hyqNj8L4uUzYnQSJMecI/wZojQp+xKbvpLzx8Te?=
 =?iso-8859-1?Q?cz/HyocBkeJv4u8JccUuYl834VuyJBdwZd+3jqRuIWJBfcKIl/ieu4pWqN?=
 =?iso-8859-1?Q?tM6tHnoGgKkQ7DRhIp0fII7F8I8haT9MW1hGgfcL6x0TrLN0CbSL7yKF3a?=
 =?iso-8859-1?Q?lcq6QemhH/Gf+SbNTYUB8cth8xdv3t/H/uHzZ36Ne/vGk8jzfY0S1lLGHB?=
 =?iso-8859-1?Q?zaiF2KUJFHDP3tKrhXE5LFn3RYr3n5ytiz7MYozxCEvtGKi0t81fzhAfd1?=
 =?iso-8859-1?Q?kwTtn2VGPwWqsR+xs0lnJP3PucV0khu95RwKPSP/HXW7CACA1IiLxoUPGG?=
 =?iso-8859-1?Q?b8YWrFqDrjnQN0Y66nofc2V6uc3/afslD4MxKiGiPqKXKXmvXpg+HEUR0U?=
 =?iso-8859-1?Q?1fS90aOLISYeWEU9lrvaY8ZBiiP+pp22R+6nJnZVpZZ1Rza2NBxjuscOHo?=
 =?iso-8859-1?Q?w4d1vHbXmzlJhnDVTdxU+wK987di3mRlC27a46vx5gK/3SwBgyzcnjJQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8678701-6705-45cd-2d89-08de215f3233
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 20:16:28.0150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lWlqYpjIBQkdO8QuW7MzYp/LUuX1X5KABPwgb5O9WTJpA2BCMy3GwRmvVXXXH4KGzM1a7TS0OF5xisqOV70gzFKvqUkz6iZks4wRd+ZL7gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10060

From: Grygorii Strashko <grygorii_strashko@epam.com>

Every XEN_DOMCTL_CDF_x flag:
- is defined in public/domctl.h
- explicitly listed in sanitise_domain_config() (common/domain.c) to form
mask containing all supported DOMCTL_CDF flags for "Unknown CDF flags"
check.

So, it is required to modify two files every time XEN_DOMCTL_CDF_x flags
set is modified.

Simplify the things by introducing XEN_DOMCTL_CDF_ALL mask, so
sanitise_domain_config() no need to be modified any more.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/common/domain.c         | 7 +------
 xen/include/public/domctl.h | 7 +++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 775c33928585..4f91316ad93e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -730,12 +730,7 @@ static int sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
     bool iommu =3D config->flags & XEN_DOMCTL_CDF_iommu;
     bool vpmu =3D config->flags & XEN_DOMCTL_CDF_vpmu;
=20
-    if ( config->flags &
-         ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
-           XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
-           XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
-           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
+    if ( config->flags & ~XEN_DOMCTL_CDF_ALL )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7cd..94a8e3042cbf 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -72,6 +72,13 @@ struct xen_domctl_createdomain {
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
 #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
=20
+#define XEN_DOMCTL_CDF_ALL                                                =
     \
+        (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |                        =
     \
+         XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |           =
     \
+         XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |                =
     \
+         XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |               =
     \
+         XEN_DOMCTL_CDF_trap_unmapped_accesses)
+
     uint32_t flags;
=20
 #define _XEN_DOMCTL_IOMMU_no_sharept  0
--=20
2.34.1

