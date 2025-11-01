Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7914AC27D2D
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 12:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154894.1484559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEE-0002nD-QA; Sat, 01 Nov 2025 11:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154894.1484559; Sat, 01 Nov 2025 11:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEE-0002iE-MO; Sat, 01 Nov 2025 11:57:06 +0000
Received: by outflank-mailman (input) for mailman id 1154894;
 Sat, 01 Nov 2025 11:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLmn=5J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vFAED-0002Ar-GT
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 11:57:05 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1c4a788-b719-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 12:57:03 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by DBBPR03MB7130.eurprd03.prod.outlook.com (2603:10a6:10:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Sat, 1 Nov
 2025 11:56:56 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:56:56 +0000
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
X-Inumbo-ID: e1c4a788-b719-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jri189mBFag8FhDcfy3TmD9GrO29VgCVLZcGK/R/SAQaZq7v6h+p/tCAVVYhFg7DUHiqozTwULYMfvHZT1WH+rCvtHKZlQuav9EyMwFG4gLeI3aPLOL8gjVX8CcxQ6Uh7vBRUSHPiuBbjj9xNSots7mRIS+CG3ItfhgobrLvyKwT8TlTYnQbkPi5VLRfgcTSgRq4X4H2REt0FFgnsMF5zu5ju1MFOnchEYQmv7CBVJDqBmD4XvvG85zB/OQi9ZaARvjROcI6igEcCXSKP3hRriDdu6P/BII5SY1pSpnm+ccQDl2eK6qpfiiHe8CpfbzRplceIkXaFKu5SXInWX5W4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUvvV+20T1UDiyfQPM2cyTTSiGchXAevlCVyA+kQh4I=;
 b=aRiAOFlb/f5W21MYtYnYy4+ZKhOEKfMdq0L1e6aI3Lqm9LJvTjdvdpAjOsmCdNBEybdVs506a4HhM5CCykJzdJGwlY/bTadID3x79Md6N/sVTKdiziEgoIizYGz36HDG/vASnIWDCnwFGjsYxAeKlw+rvgTRvnEW2h8M1MCD+KUokZBHCRYdMvFHLrYPUbJIFhKJgIIO4wSlxb/G1P/qB9K5ee2iNCo/jsIhDXJZ0hMPycQKLDnchm0Wsxa0CMEpbEihbtAIjT7DLslouCCPm6Mnu7Id1eiypNHZbr0rhiRp96mmf7flaX0xgIswAAgZhb8zENRD3REii2n7zilYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUvvV+20T1UDiyfQPM2cyTTSiGchXAevlCVyA+kQh4I=;
 b=NXn2fAXYsj3BOd1ntHDLhTtBYx2snRtyGaCLG804MPYZPoEHqANEoWxB4HP1NoFyXBlBM5VDJ7/KbfbpOJoPEgFPE2WSVTJ09WxJlH0vzGoECrwzpJ5KMosH6O7DVmbWsDLnANmsneNJuKEiO6v5DBC26XnifDiBzK9/8DSBLQYA8ypwgUnBnWUAR5uV6ekPP5VJgakMEn2lYyyOWA9TK2tojGS0XKTCVyEeRDL+6/Yw2HjuO5eezF6ThEmh8W0W0FyZXBGX96JKjhZy5WZEorNMPDuCvgo+4eYnDvXjpj0isQlWx/gtYOAwjQMtdE3QEvWpmlEk4VgnXeILnyr85g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v6 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v6 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Index: AQHcSyafAwJzYUogvkSNS1XBVcix4A==
Date: Sat, 1 Nov 2025 11:56:56 +0000
Message-ID:
 <1134e144eab87f645c5c1e6e60ba26886d77044f.1761998077.git.oleksii_moisieiev@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1761998077.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|DBBPR03MB7130:EE_
x-ms-office365-filtering-correlation-id: b6dab78e-54f1-4b34-6335-08de193dc1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HAxodcUN/SkkOY8tYQ78MpY/ussK70Se88RzR+THk/ZmJqnnMnegx8yYp9?=
 =?iso-8859-1?Q?a16lvJM1K9F/pnubScnVsbMfUkt/SlLobDfExGDROfIFFBopz6t2EA1Hfd?=
 =?iso-8859-1?Q?j7Bd1f9HAJhm4hbjDXqqRIYJTPh5WB00ewr6U+jIbdWB8Fe0tS2YLF3UBC?=
 =?iso-8859-1?Q?lt8QA3628TqoSdAwrrD1B3HM3eEzl4S/C8RE6Wk+hCCzGQmGu2APZCP1hd?=
 =?iso-8859-1?Q?dqgMispxawXimilyM4F0DzXaSRJ4Mk/5zzDIKPWX0bPlPW/bxKsd3IxqDV?=
 =?iso-8859-1?Q?MWt6fnhDm4v1jpDA4nnR4xG3jd//ZkH28CPhQb5GsAR4arq5gO6DVLGwPl?=
 =?iso-8859-1?Q?i6a0BCkZlyhvglQv7kgbe7w3DNf6KH5WF8gFrx26OV39OZZx6IyVQwINkl?=
 =?iso-8859-1?Q?T9hL2Km4S5i9javzRwSmJajh59feSOfWcjYxOqtlFmLlyJn9Uarsm4uYvn?=
 =?iso-8859-1?Q?wL8q5pB5SJsUfR2qnK59JF480HGbGPJrvIL5oEXg5jjfh4QNvXxPpQvBdI?=
 =?iso-8859-1?Q?EaFtcOw7Q5EIVJI/dKSs9tBuqN5GvuyNJ7HyThWRwIFWVWqiYHsdcwyrpy?=
 =?iso-8859-1?Q?yRc0uWyO3mVQycxXwzjHi/8PNx4PW862n2pdMqFOxRG3GFEbhUY+JrRaUF?=
 =?iso-8859-1?Q?dh1xtpAtf5pVn/dTQzysQ7oQdK8/9BPLvVv6x7kHz9JlmuZDAtnR3hATGN?=
 =?iso-8859-1?Q?JjFuSxL7WluEA14tqYN01+NKfm60sV3VgNtbrdzNCMezYtpqoeR27DzA6R?=
 =?iso-8859-1?Q?ZEgDRM6ORge0Cx4PaaXUomoBehzX+Y/qo8mKbKQ8y9dzYTd4CW6QB0GGyi?=
 =?iso-8859-1?Q?Ua3+Drjfk+fcag6KkFxs15BQjfysuuJWbj4o4hWx7nEDCqIoJqPCZmHaxK?=
 =?iso-8859-1?Q?IaublL2McM4wNdPSooXxK5ax2G4p1S63y3KUbXIdgKW13AuaSjCTM3HZ+q?=
 =?iso-8859-1?Q?3IoVj4S33ACH2tkiFqqrC4DyWvDu3SrDK2OM93HRDUKm2u0douKoBfoHLP?=
 =?iso-8859-1?Q?g31pr40UFhiWW+0IdDFtEFRpvmijIxPNo4aaHZ8HaCeVeir4tD6+6cqrEQ?=
 =?iso-8859-1?Q?h7cjlkE+/muC1rzlZsAk1K0R9SLi4icQyXsXuGocnEKOr8bJvx7hW1ANlA?=
 =?iso-8859-1?Q?HV9/zyZhLevbTXxuUzxE0nMiuSd4pv4hFu0rZ5o2ee85jWpzhRerWlsBXh?=
 =?iso-8859-1?Q?RpcXQBlMtHI5D9v6BqWZz9oWZ2tjeCFKjiWCK34rJ8NFWdy44tObUOIDZU?=
 =?iso-8859-1?Q?HOMeecamUichJD8cGBam7L50+iNNWem58t30jIvBy/OUaLNoyQBekiQ7yf?=
 =?iso-8859-1?Q?Ja/zOz7uorYo8vFvXa3FRLKW++0ClMoeghKVI5+Ve/FfiMpRYiULV+GFXR?=
 =?iso-8859-1?Q?ndqfCrKsRM/4ojVnD1q9qtyb5LRfeiAXy1JpyaOxdtV2y+ASMycZsjkOBD?=
 =?iso-8859-1?Q?vQD0+gaP0iI/43zQCi83M6QQIrzPtVkubcXin8OenqJ2jxWXyTeVe2IZ16?=
 =?iso-8859-1?Q?GYoK6LoREtIdxW3SSY8b5y7KUtziqR2ITDr5yBm6sMt8xryiU2wjthTHS2?=
 =?iso-8859-1?Q?x8NTa+5sO8TlF0QsIkWYTcncmE+/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TGczb823Tix0x6W373DtM894ru+CnnZtNSNcPxp/O1aQpVpr/cqNS5wMem?=
 =?iso-8859-1?Q?Kjr5c+txxhSIyzZoIw9JrWPO2QTn2jTeHnbeTjtbrLi6iIPtiCNJvYcMB/?=
 =?iso-8859-1?Q?WUG9xjWt/Vu6FRv334TWUQVbcge6Jd2yKAoCzLioEKUI/QqnGXM34kYMyA?=
 =?iso-8859-1?Q?RwwcgWlBD/LFE0+TaOPwTKIWVLFzWRxszbfLOgQC6xHTXw0CiOn+1oKlFz?=
 =?iso-8859-1?Q?uBm45UTGV8As9XoHZEtV3HLffXJXrsWKLG3aUFuItN0i3sOCole8n/j4wL?=
 =?iso-8859-1?Q?hmt7b3vdUv2OOUtJVSYOVTPDqcuXR/vrYxGzfq3WI8dw0qgunL0PQCm44+?=
 =?iso-8859-1?Q?RfJd/Sl3ng1CB97LyK/IhYfT2IOWS6ZIDYSBbCwCGAozoC04XarJoG8ayw?=
 =?iso-8859-1?Q?5cAouDjTieNQEKbXUiQbTcnHTujo9jJ27XjtCIoVatI7rFhq7xBhh4Vz6G?=
 =?iso-8859-1?Q?l5Dx9k5I6obTCT4os5XjwWkGCx1WhKNNDcQn71adeJ+cY6gt1zrFQUPHbK?=
 =?iso-8859-1?Q?zVtwg/I86on3ePAASiXPOrHW+yWE8gbeqBEozpGzk8GIIU4vYbXGBwZGNG?=
 =?iso-8859-1?Q?HMt1gskG88seKByB3ZMuGPGjw5uY9IW+tRvvdb8tkAJ7CaoEDkZBZpVXJ7?=
 =?iso-8859-1?Q?j/HMt4PAHINbUnC5gnEI9bbefYouGA6yZskCBOAt5ejA69AkvcxcWQiSkt?=
 =?iso-8859-1?Q?2nVMt21xzTVj6fYeSaUGW3mVfSAc7lLRDymyi6vtLdrwbBeQmqZStO+Z35?=
 =?iso-8859-1?Q?J79oaP5BEZDw30/r2eoiFlrr0LxEMR/jSKYX4k5HKvgBMD2w6RBQRn/vw2?=
 =?iso-8859-1?Q?5AU0Jh1JWql2u/wBgwN+vQQVgB2JyzopQSXC0Z7Ogp4pj8xAn9F+49yMpB?=
 =?iso-8859-1?Q?KKMzkZsoAzp5URUZc6YT7a9HUt2FeQIh/wKJD8tDW8xUpkd+Dm7EY+kzvh?=
 =?iso-8859-1?Q?m8N/DNPb9SsOck26Nms/sV95RAwDCHgz+qKXExZ5L+vnYRsnm1xFcgr1GB?=
 =?iso-8859-1?Q?33UPIplyrUtQdARDnlODAHRUkHUcziOIUsVIW8cnYfy594yuqzRPxqlpb9?=
 =?iso-8859-1?Q?JE03KS/ZTPYAP4pcJmSvBP+XqY4b7PUYilrgimGl2HkaBzP7AlV+myNK24?=
 =?iso-8859-1?Q?3AB8y/Nch1rdFRVeLo4ioJxDcyyWtF10jn6fs9107rQhWm7WiSNtEMNmsG?=
 =?iso-8859-1?Q?T/JMAyRwZryGrxyvFi31Wir//1jgRg+zzHz3Hiz5VRdv5uX9gxQiBr9bNz?=
 =?iso-8859-1?Q?pgtwMjJMJZi45q6B3nFecDVxgq+ufXYg9gLVSMxCuAk7A47+ozV66tNr17?=
 =?iso-8859-1?Q?boIgvojubm5HhtOKSO9OPv9kCSoTycwc+Muxv7zKUCWiD06I8ONkjHPFQO?=
 =?iso-8859-1?Q?Bi64GDl84sae7j3jMjUYwIuJAz8zLlKJyVfKb0ac0qHZ70tq8jtE30siGm?=
 =?iso-8859-1?Q?kTPtx571XWlF98GaYRqNjHPUUhiCOsn4LfSPFAmzxQLy9D/qnkkRKw/KUl?=
 =?iso-8859-1?Q?hKXiSbviQ1itQQSVJSWq87ZvejvAxkX0DYj2wueeWYs++ZNzjEGC3+j6At?=
 =?iso-8859-1?Q?8MsELrp7e4uxCQnQK5GZvH9FqB1PzEeW7TWs2kP+RCtKxTPfKyU5EhOKkb?=
 =?iso-8859-1?Q?LqANBUHV3WD0PJyvIVQn5wuuTYX2cVDTfwk1OFqTj/X85rAmqLLIOPmw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dab78e-54f1-4b34-6335-08de193dc1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2025 11:56:56.7960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2ucjCilb8ajYH7jROvjly4qU6nGR2i2OFe9PB+It+xjHhJ+WwCZP8subZ1x9ILS8CiQDrCKWz/tlgzmWFL2nCP3InYBDl15rl5OE76yVEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7130

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

