Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2376D20D1C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 19:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203675.1518755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5cx-0006F8-Qj; Wed, 14 Jan 2026 18:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203675.1518755; Wed, 14 Jan 2026 18:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg5cx-000681-Jp; Wed, 14 Jan 2026 18:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1203675;
 Wed, 14 Jan 2026 18:29:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1I=7T=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vg5cw-0005zq-Qr
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 18:29:54 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04ebd2ab-f177-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 19:29:53 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS2PR03MB9465.eurprd03.prod.outlook.com (2603:10a6:20b:59e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 18:29:48 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:29:48 +0000
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
X-Inumbo-ID: 04ebd2ab-f177-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pa+7XcSUBIsYEt3gqbuG0PlTFH+fNYyH9TXCMphW3D2Xv+kaWQwms5UhT9lygqjoYeWyPwzBamGzhFbxb/O0U/bQUc7UDtY3xBWFvq3eGvBTQYPRKNxl6DxpmW/24N36wDOfPCM5RWZ7C+kNNTpCbzDsNntKdBaZmfb1JKd5aCEKfYHBM/8OrGDdEg/P4SgMB6NAJ+cP/nrl4sqmOi/e4fTcO9sV3dKEq7fAHjYr9kkBNNVw/VPKvmJ1FJGSH6tH2Hf5b+9KBIBcofez3bJYS92o+AjStxLEcO5AGO+6SGCvSYcGpfBE9JedvEzdw00QbXU88oQQOnWzaGDymaZ8Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUvvV+20T1UDiyfQPM2cyTTSiGchXAevlCVyA+kQh4I=;
 b=ikkSiEP4cdbIt+59H79vliqJD7BViH5Pd5FzGmRdqMdZiP7QXAUInte5guL+BAl+SbpZ51mWL62egjqCoGbx0tsg1wbrG11j8AwDV/zwQPbaueQgZ+/e7L12u57R2D3YcmlE/ngW7ffLhJzvGIOjP2w4lAFGsA+6yygeG0aqoYdnV/l17fWLeDlmvDJlfXVt7xaJlFay9Yga2PRTWEgryflfCfjegvtR4X80YJhurJWg23l82xlChy+m57djxHsgwLGXIghjn2gZN/SJRFZ9PEHYQCyP3MkpM5Jh6Vbj6r5UCV59sDqY3W9n8KTHhzJt0ceW6GFZhmy14lNxXtHO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUvvV+20T1UDiyfQPM2cyTTSiGchXAevlCVyA+kQh4I=;
 b=GhPso1d5o7ttLzQDpZdvTYQo6QT/N1zfFoBLKyPeGEi279YG3dAoiN9Pk7q3OhO2EEAwlqDnoiwF65UdJXawOZMNigIHk0rey4gb2SBNxhzClZdm5YftasaPWYnNXqQDToI9+lVMHiGvGze7LsWXAgNmPTMsRY007G7WzMYcTgVVd5dQouAyEwYBpq4oodyQ/u2GSqnx0rPSNQ2csLrwwB79uMKdmZbAIT2Httwu6S69GdgLxL7Qs9zGOaitzHeRo6+qZNdx1b+BYcGm4+zWF7LAjCOcx8/bSn3mhHo5fp2jY0iinFc1gAnTde3awLOgCYJuYdP60gOSSiDnRAcZZw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v7 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v7 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Index: AQHchYPDOaISZ8hXnEiYuxB1nnqaDQ==
Date: Wed, 14 Jan 2026 18:29:48 +0000
Message-ID:
 <3ab46b8b5ceae264f26ad70ac2266a2ae56d02bc.1768415200.git.oleksii_moisieiev@epam.com>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1768415200.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS2PR03MB9465:EE_
x-ms-office365-filtering-correlation-id: 834be4e1-2f7a-4407-ff45-08de539ae640
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SLwU5IsgcrEywgCdlOthsp2pzzxCqXFBjltlHwrGXi4ORgsb+VRugh90MB?=
 =?iso-8859-1?Q?FAEDdOmB0FmSoAdYOV2ESk0hsFoUCa3vOauC3oEL3eE6bKlfCwMS6pS9Ol?=
 =?iso-8859-1?Q?b/Gr/Cpb537JbpRNndiYY/nHdM3Bb0uf1MMkE6hUdfYABRj1vih8nM//rt?=
 =?iso-8859-1?Q?VUdA0p38ToJgE3mUFXSq6+sharuN6COAs8+LdfQqRRXpSCqF9dQ+cF43Zo?=
 =?iso-8859-1?Q?FjlpcIkY+YjtcgZQ8vxLT/IwNjJCmbWnAlse3cz5WZAeBYlALdbs+OczoR?=
 =?iso-8859-1?Q?AGRb4jEWprqXiBERhYiK/bXKx9ZrNr0QJudf2MIJ1vLgNQ4SF1y9UjKQzv?=
 =?iso-8859-1?Q?KBWQnyE06G/TIynGK8/H8d5XtzH+s4NRSQjos+bUHTukdDW0UqXSneYpMB?=
 =?iso-8859-1?Q?5Rrg1LpADV/u5F33Uuaf16uE2kL1G0KXdWuFYMnl3E48vTixPGYJ4G3mAG?=
 =?iso-8859-1?Q?bb/GXqL6w2cb15gaRxM8+KUWnxFniSkDqwCKSQr/SLsntYpSHeUyF5PFhb?=
 =?iso-8859-1?Q?in92hJH1SWoHWrFeC6SpbhVU1LJthJzA8E1I1FkdBJ1+miW0+MFe0VPdQs?=
 =?iso-8859-1?Q?bNtQXl1R8kyQ5BfJ59mVxwf0e7SZgJLeEJzeDU4xUJzY1r3cLgCixcwLii?=
 =?iso-8859-1?Q?q3dgnpfSENsvriPQWxdpKU0hgRcnhIKn2fhehX54V6CwvUqqkPMsAN4ldo?=
 =?iso-8859-1?Q?Js1760+ZyPNJgnnLbCASp6fOql1opzd/kpZajE4EIAXnrc7t6187o0DaZD?=
 =?iso-8859-1?Q?Hk/QNR04YXkyAT11q6FOSrttOuVMeCt48VO5AZXMK2tVgsIehbTNqsKDif?=
 =?iso-8859-1?Q?4wwG/bFRTM+2DcIJOrrEQDu2c8tfXb7jO68K+/pU2MNhTLiD5712fjINLq?=
 =?iso-8859-1?Q?/Nmrm2MEVe+J5k/lefzNAgFNBviMEhRol6qWC2QM2q7N1CeRxq0In3zEYl?=
 =?iso-8859-1?Q?Ehtkyhd+X9pmDSrj6egMoOX+uOIY1yr+Q+7nbgSc6Gw03Wf61Hv3GjzWEu?=
 =?iso-8859-1?Q?2qpJZUUstNSXToda6LiFnq+t5Dl55xuMWwbxe+tpqS5JWVuyFffYdYC37m?=
 =?iso-8859-1?Q?Cu7tcV81inc9Ws53c9XD+/2MkT25ChGpGO0qB9laPszQQbtP4iKS6Pz/uh?=
 =?iso-8859-1?Q?m30rpAcgacBXKmaGBiOvzfvLIpgqSj8lg/TRVOyXq/jkbR6+zlyK+Dv1S9?=
 =?iso-8859-1?Q?2O6P+balmbkydQ3no5Ry29mU8BHmUG8YEZL3heO9Kib1i/RlLeoH4xVahu?=
 =?iso-8859-1?Q?p+GTeBXoIcgK7RzTIAKZJ4paxfZ8YXKQAfxTxnhEk/JXukgHGQnmxXe51g?=
 =?iso-8859-1?Q?++nvVurEP2xbkUwylzd+v9Fsu8wAAK9XOyxtbfOFlqavFcJD55qKf6jATB?=
 =?iso-8859-1?Q?iIqjadDh74ZLFaMPvOSuENrhZD7ZOl9JxOcX+hwyoNWiVt5THTeXZQuZ0T?=
 =?iso-8859-1?Q?74+tboPho92+IOsbRxSA4Zi3LYW0baylW+mzmCI8xPWhZTpy9tRVHh9yHC?=
 =?iso-8859-1?Q?OmK/L363ALyjQK/DwYy9IaV/Qp12l4lrwl8VTd3fjJEBxdXE4bKNqZ5A/Y?=
 =?iso-8859-1?Q?Tgfe2Gg04Q7z01eXyQZ6AHl1dWxiHYxSUUnLl8AJHEz4MOJYnl900RvzQn?=
 =?iso-8859-1?Q?utdX/EzCkbHISJbRQXZJLfKLXguOKSrBnaQU1x9DRIK23/tNcV3Rd5Nk5u?=
 =?iso-8859-1?Q?Izin3WMwBmoCMDamxlA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kR4a49bGbu4koxZPKhrBccGogo+H3b88dZLB096EhXv91SuiIrrA/kwpug?=
 =?iso-8859-1?Q?0QGto0JFP9eyrLakM6s0J8o+yB3l+JORtR52yP94KDeb46G4rEpjMPgHpY?=
 =?iso-8859-1?Q?TeziX3ieFWbu/5sVj29qqwUAAjOMl6SE2pMoj2pykuqhTwmjHf3r5Mo+wy?=
 =?iso-8859-1?Q?UIApk6E0LarZzOfUEpAVndC6EmwqaxV+s7nCntB04/HrcBH+EO98LGtpSk?=
 =?iso-8859-1?Q?ClGmPgG84oufnohTwllQL3B1XD3To3hP4CizGd9Qy9CBLsmdWzuHyJ0kKA?=
 =?iso-8859-1?Q?+VDiZkKgeRUbSbayYr0fH+dwqOyZmdEHDxCgztOszG6dorAflulGtgSfrj?=
 =?iso-8859-1?Q?P14OpF69edNiVLVxoxPKdI7C3jrIbQDep7Q+K4KxF5bzM17UrGSabMPJ3Z?=
 =?iso-8859-1?Q?TzVv1YAff93cIK5c0rkaHMWqSB8a9e5+X1ejgT0ljHVjbVW2hBkpluZXGb?=
 =?iso-8859-1?Q?7ivAi8sOPYpKm95iEl6R6R/QlTU5HPFb4Y6/4BNPHYP6WjHr6LlCG0AQh4?=
 =?iso-8859-1?Q?JEXphLrsIZ4E0555yHZnZgmxFAi9dtXNRXCAiehZhSrqnGK3ugvNrG9KZI?=
 =?iso-8859-1?Q?YagfWIq6z3t9PCoM5sbLc914TC/2eY/+b5oVs7laXbKvlgJQMzg8wth2aG?=
 =?iso-8859-1?Q?VrXN5X2YvxigePdaMY2AF4skpN/EWybf9vU/omZHhXgirdVeupGPNYLw+7?=
 =?iso-8859-1?Q?tOw5Wad1UDRoSJt8TKjpVf8RhHYSnvuwOghqiyL0y7WNqaXXg0VI1pyQS+?=
 =?iso-8859-1?Q?utYgtlBgFkl9axgnD/pb8CTA+XxrvdD5fe0pRDGkHRUjqjKcnzVFKqGHyx?=
 =?iso-8859-1?Q?S7BBzmtbf8a7ikDzIHpaIZmlpmQZ5REAiWR2jHrIdD8EfVb4HosAc08C0G?=
 =?iso-8859-1?Q?ZetO0OyFmiWxxIG6Mr0NA3yNNP8L6kmnDgdVbDaIhtwtH5y3JkhZ+Am/yx?=
 =?iso-8859-1?Q?iKyGsyYdBiMpl8pcm/GCxWvDBIHDNhwIEwhXU6KvR0go+bqRF/Vw2PtpGy?=
 =?iso-8859-1?Q?3X/IyjXqeRb93XG5qTn3chDwj+6fQF+iGGHMaRix0gplSu+bsbCV5LrY+A?=
 =?iso-8859-1?Q?Pn5Aicq/h+dXxY1ZKJL22dy0gbLvW3UsT5Fzbv5u6W7cBWwmPDQqj6CxG+?=
 =?iso-8859-1?Q?PYq4+PN/Dr6PpfqRdNNJRm4dprZnQEh/Lone1mkBOkwntEecbxi0mu38ma?=
 =?iso-8859-1?Q?p2trjtdogGlr/IO6vNp33LeZ55XkOHAjKpWQWjevMQL+aqq32QMQbVBQlt?=
 =?iso-8859-1?Q?xlBb3lwlRe8adAAr9eKfmOnCkTq0pn6b8wi1JSSm9XbmKTZvoZQRhe/idq?=
 =?iso-8859-1?Q?ATLOilWLAklFsxX7/mbOG7CEvewgJFTbdBIMrvlp3qoIg985pwkmHUCAo+?=
 =?iso-8859-1?Q?kV0m+x53+3iaFzV00K08ULkMW46TU5SJAPOT6WnxMi5bPWmxwtUFOwkgqL?=
 =?iso-8859-1?Q?Quh+tr5o9e/gvIYU9vpYP2XDIFvObeO7ePxGRNGEXs+nMfFEB4BSxgzwFs?=
 =?iso-8859-1?Q?G+Jsp6ouE3ahuiVUVt1syclxcuXWi/k00AsgnNcQnDGwPpZWhVYVpq5v9s?=
 =?iso-8859-1?Q?vQWHKpxdLEsXPEGaYx5I9un6AOE9cMuEvrr7jxcLQLflSnFCIAFdmeG0hD?=
 =?iso-8859-1?Q?oY7rfraIv5JV/P8kpf9AVzMRuc3rwLZzH/Tmm16eg/vOi17kF0ina31ih6?=
 =?iso-8859-1?Q?HbVCrdlz/3BB6a13BZJj81I7DnzR7e4mQA5HzCJsU5cF3zH1uYy3TynCQ6?=
 =?iso-8859-1?Q?fsQ3H40Iw5DW5eX2jRmoHE6/Xb50xt1daP6qFBmcA5g05HpxpsK9TxBaq1?=
 =?iso-8859-1?Q?4LF7EXuipHkhE3Taf7mfBgHCy130kM0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834be4e1-2f7a-4407-ff45-08de539ae640
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 18:29:48.4518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2k8d3grFZ4n8FRASEN+OaLh7DrhGRpbXGcInfs+/tz3PZgLckG0xFUg2qLP0aHzIs2duHkzvX/bPbLP4ugw99IqmCI31rXOZqBEPACiEp7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9465

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index a289c48b7f..dc6af94db1 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.34.1

