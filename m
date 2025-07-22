Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DBB0D870
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052282.1420930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNV-0003Ol-Qw; Tue, 22 Jul 2025 11:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052282.1420930; Tue, 22 Jul 2025 11:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNV-0003MW-N8; Tue, 22 Jul 2025 11:41:49 +0000
Received: by outflank-mailman (input) for mailman id 1052282;
 Tue, 22 Jul 2025 11:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNU-0002RD-2V
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:48 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d91cea4e-66f0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:41:47 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS2PR03MB10194.eurprd03.prod.outlook.com (2603:10a6:20b:5fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 11:41:42 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:42 +0000
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
X-Inumbo-ID: d91cea4e-66f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT57Ow7KmSUB1Sr4zJXXgPSWsSZjaWAyOf/OKvCLHMavDWfwjn6vUQb1NOiS5aOr+IeH9wVDAojCHXkrnIA3r55+V5iwjuHcWoGSvd0fnhemRucYKH03BJxQZynikiKhVj6S8YykcWTF6+VThfCf7H048b41MAgHXeTeTeu3k1ZaDaWVn8Igu5e+DU3povz/oopS/lYoC0Q78xaP+e/YDYKPT4pyPqtHn5zd4BsihsnbZdej8rLN/Mzibq6GAeYUTAse+ncI+wBIzF71uHinw35QDo6GEzY0/Qj911rLVcTqRIbvRCt+mIg7WflCl2IyMysgmykdT6n4aeRx0aPkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUvvV+20T1UDiyfQPM2cyTTSiGchXAevlCVyA+kQh4I=;
 b=ZKCqXmtJ+U929zFlrE+0u1tmFOeyXZLMBcKAK9bU+6cpAF8Bi5gDK1faHe1B0miFcKNhlXKh9Cnr2ty4cckfkr0WwyK1p+Q7qQENC5VBdaG7fKiiNGEd9v9FmJuUG/LmD1jyl41iTj2fUYGdICTVAYC4xHEcESReuIq+8FPXpzXOQl2IjLmFTegtSjboUTX9dxeDVneEH20cPPwI1XWHCxtB/gLnSyzMw28ZJmJuPFUfiQEH6Hj0Yyl+bI/ZFk5O9TOjBLOBHpE64PuUykNaASeoWXeSAJI1uBOp+TkMgXj7ZwciVp9INSbYayXppcPYKuMgHss59pjbudSt6a9iDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUvvV+20T1UDiyfQPM2cyTTSiGchXAevlCVyA+kQh4I=;
 b=ZECGgcWpI1ATSgv8mHhX9r4WDbxifNV/vsgRHC8aP/NEg+m60YB5Tph1H/7r1jtkUktczSggV6X68sATnK73Nqig3LVHpp/06vW6r9qkH93YG1kIZJFjS5wWLeGnyEaXH84spb395O/pOsa5Vo62tFpWu+kb9GHNVohBHVnHiRZkyEgrUp8vIxtJZq4ei8gJuE4i8zq8zFHWKWnfQqzZ2tEpkvvW4q+Ahbw9NYUfev/H8zYf0kKderrqy2wCusvmAYmxzP51G7o8pvRDcqgmV1YLMPg+DH6cDoAmkNzxxrxOAMBZhyk1iYsCiniJInwyuV4VioOzNXcjowPgIMEqBw==
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
Subject: [RFC PATCH v5 07/10] xen: arm: smccc: add INVALID_PARAMETER error
 code
Thread-Topic: [RFC PATCH v5 07/10] xen: arm: smccc: add INVALID_PARAMETER
 error code
Thread-Index: AQHb+v2XkapJpHUkb0u7p4MhQIJSwA==
Date: Tue, 22 Jul 2025 11:41:40 +0000
Message-ID:
 <f763b85857c7b97c427c1bb4f80e66b45eebbac3.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS2PR03MB10194:EE_
x-ms-office365-filtering-correlation-id: 52d7740d-1116-45fd-8808-08ddc914bae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8vy2vamGdHOHgeoS1MApeiECp/8jO7ad75Q2VkxSDxgrfuFGl7SDpx4p6A?=
 =?iso-8859-1?Q?DkOQqFpgGpFbkqgPtuzLMSsottiO1TEEaGtuKvNhO4RyTlDU+oU/pZZnC8?=
 =?iso-8859-1?Q?smnGqvRUGdOruPFzzrWpPYLlUWuUZk3pySy9lJLGfChCvavUE3R3XddvF8?=
 =?iso-8859-1?Q?Xx6eUsKwSsGehZIxAL9RuxLegKq7da7bRGMXijjzM8uHi/0TptZW3C/iCo?=
 =?iso-8859-1?Q?5CtyKhqGKTeIfuua3wv9IS/zZwcF3JKYsVRQURAfHAzsjuyk8Ja2ODPZAs?=
 =?iso-8859-1?Q?eiW+n9mis8E7+TpxmOMOkxROXuepTRGwYb8fv6OEpiBxBj2O9TwZLj4bC6?=
 =?iso-8859-1?Q?/Qs4a1CKm4EXqVbpOZf0aPKrQXFDsUOCNzIT05pRMeYUCRsmXsdcoqd2fM?=
 =?iso-8859-1?Q?jbwC40xqZ2uQHIi5R9u8PhjLK46GAc7tJScFoNPPDddVyyyga7NjewrVZU?=
 =?iso-8859-1?Q?Xlvjwaeo45QC/Y06eV8zzD/daCspvQYhg5HkABDGbAbayD6LbLg7xczztU?=
 =?iso-8859-1?Q?S9NkMhqQZUhLU3EjS+X0E8gkeG423wDUZaFYynrNWpiO+w7ysSgvxiehVJ?=
 =?iso-8859-1?Q?iNUrihZkSzQBwkmkk150MK52fBD3Jc2lBc56CM56OuWl8FoiPPuHzocjbl?=
 =?iso-8859-1?Q?edFeM588A0d5k6KcVxb9PmITVgLBibirVYKqig9uY0iCzXthr8VW2u+FXQ?=
 =?iso-8859-1?Q?9BcJMXJyzl8pSiXWzoViEDcYFo7IsdGqPVaQAUcpHlamr/d8HB9BQave9q?=
 =?iso-8859-1?Q?gM7m7/ErYWHECvZklet47Z/7HAgsytwP2iDBYPo420ZJyzuWhu9sFSwGyu?=
 =?iso-8859-1?Q?ZBO2kubF25+4DTlj0Z2xUzH5zlFVunUe1IguXsYfM6ozCP5PQ5J6fK0R/k?=
 =?iso-8859-1?Q?piAENXfZ2hVQHqm8IZ2dCKN+mr4fP2HZj0JUkM6NZuFe4NsFDaofy9aGbz?=
 =?iso-8859-1?Q?j3n5L24xBMlXDCqzO5ZdxAsa92kHtGOMAV37E8nuIhO5kssfu17aK+pUGJ?=
 =?iso-8859-1?Q?k5MPX+AlNjVhlw9d8UpgwVU/1WcD3xuMOvw9bXDdryEsiJxPDiLyYZ+Nkn?=
 =?iso-8859-1?Q?GQ0JLzt78gpc9SlKkwkJ3W2pdiX/suGA4IwHQ+nME7m37wPic+bUYE5z8B?=
 =?iso-8859-1?Q?s2tJOf9EDb7j6ECcMglx3Xv0itvSFDRlGQFAnads1V5fBeQODY8rpfIJoO?=
 =?iso-8859-1?Q?7Th8enaZBRfnJmcGPVWGqkMVDMbmwu7PjB2l65nQDoOwT04QiVooVWQXmF?=
 =?iso-8859-1?Q?T4DZYIeDowJkOn7hXtZDMfya9FIJPZuEU6M+a46hDYPTce2s+K6I2p0uOX?=
 =?iso-8859-1?Q?puAHq5RUMgJO1we+17J3/+D3JjtLgPmXowTLgDSISLLcQwz6+p1D+XJAMv?=
 =?iso-8859-1?Q?NXgXnIS+dWF1V6PT6ZbqQ09iOBS1+kbmtcstFPHpqDmIs6DSpIoCdTdgAa?=
 =?iso-8859-1?Q?rp9gyx1W0gvTM6iwTuJR+ZZ+aSui2kcUBB4pTXoi6l21kjS1C03xPlGlyL?=
 =?iso-8859-1?Q?KqmhiV43aMxPWuqQvpfQubrLU3oxdMqNRO7kqewKsIsBGm2UnLMa+OGBjb?=
 =?iso-8859-1?Q?ne+9QmQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?O36M/kqY2fQkczcwomOPhV5s4DpC09mozjus1Mf5o+pYEtvz72pOCLv6v3?=
 =?iso-8859-1?Q?O9ep3DfTee+hJYd6wCkaDOphdr0+gvUmTkBWpjNax62kvFzf+t2ncRXqJl?=
 =?iso-8859-1?Q?LaPa8e9+NonQH5aWOcZcngp3rTQ1uO0/8oRHLPV6+YZouFVgbS6KLgGvJy?=
 =?iso-8859-1?Q?kW7QeIOZLfrFBjPEIYOBVBRV2ZSWuQXTPYrRHsz4r50I1O89WXdUV8mH6z?=
 =?iso-8859-1?Q?ebUlX4bci1t/LctK6isOEi92Pv4uk1MLUa/b1Qao/SuD5Q67B8AOKvziyv?=
 =?iso-8859-1?Q?K05zABJRvwYPabJhw4bHrRkhVey5Hm84PQUdviQU7MA3UlgZmiiAHC2ZFL?=
 =?iso-8859-1?Q?hkWG6U4lSNSr9EZLGxaZBhYSG+NFL0bNL6HwO1FMp0HMQ6cko4wijEBv8x?=
 =?iso-8859-1?Q?kYxmfNOZt9zpCi1eGMfjsLZunx+fWb8+z8pItH7VIgfe9FkHSgJmhnQdjN?=
 =?iso-8859-1?Q?d/S+0EBGu5pyWhBLYeKlG+ngnPHTjDqwDJO5Wv82K9USPNnALsVrQovGXh?=
 =?iso-8859-1?Q?ogLz2w7b0fxP89RcVCDCLd6M+C6KfNUyoQUQ0H2OI/VAwlRGJ7cPV6Zymg?=
 =?iso-8859-1?Q?ue2CxidBnRDJaUeZlJStyRSow0Sr22mQys64uQUcl3/zqX+4JrDd1hpPQs?=
 =?iso-8859-1?Q?GhKTCR6687VhRobBSnNJ21Yx2PrIB43VRlXU3VxcD45bsyrbDJROAUAKQL?=
 =?iso-8859-1?Q?knGDQoPpNc/FObANVtrCRDZgdweU8jYirl+lJ+/2mrIhhNFiM61YquXea6?=
 =?iso-8859-1?Q?1SnWd8KI2PcZ965uSMi5C4jkkbTT9n8g25HzgYvYeNaMPED0J9cIYo/c8H?=
 =?iso-8859-1?Q?VKbG1pnqHat4nRjtoiLC2g/V6/LMLgagdnqcGooUjHA3xQVrQiWJYc5gHJ?=
 =?iso-8859-1?Q?g63M4Emcilj9M7k+aCwdXMlJ967fN35LDGHck/NuhLmarm0xM4+nJcFKTO?=
 =?iso-8859-1?Q?tcAH2PJIm/ABgelfp6DLHsl5r45IWSstLOKrSRok97AH+TOlSShyuDtGTo?=
 =?iso-8859-1?Q?/wJnl0ViZKd65FEmjVMSTGhEsEHwZAnnTdQeJQFhgz7jtION+JxSmq4set?=
 =?iso-8859-1?Q?zp7AvlDpCZrrpFb76B9dr55VEgPQTQsYVrAlj+GioXL+oS/Xwl/2y8xZju?=
 =?iso-8859-1?Q?glB8D1fZk+q0yPTEzyou8Y21572hw1cgrj/L5++ftQxiDMaERuvX1CgrJC?=
 =?iso-8859-1?Q?m2pxk8povKBDCMDesBZv9DEB6EgEpJ7uKr7O6DYI4S890bjve/jVA8RduT?=
 =?iso-8859-1?Q?UDYgnsfoumlh4bHfZe65OTaOIOpM7L/qz+MBWVkwz7bNvIB6EdZJQUQ1Kq?=
 =?iso-8859-1?Q?fAsag8vrVb1fk+QAzmwDGX4XWe3SZqdmaXfcKz2F/0FQukBhkwn4wNYSyi?=
 =?iso-8859-1?Q?3etz6uIJoOwM1Hi0OsjDT7LRAtZ95C6CXA6462OQwbQKRnI5TDc+MvQ2lB?=
 =?iso-8859-1?Q?0lhYWjwIwZpSaDHdE1ZVvpTKHXyTBrdjF2utQFLbUFkQwoFCwQ1JgcstSZ?=
 =?iso-8859-1?Q?v+CVneTXw8DafU6f6e8xRbK8DfZf2J8tdYcxMEsERWO3A+eB38/LAKalE5?=
 =?iso-8859-1?Q?5Jv5ibLeTP+T02zgV4skkvgBSRdINSmjaQAIq01LVMvnQ3jYpCZQLd6Cfd?=
 =?iso-8859-1?Q?1F+9h2Akai2KVBe0GkGyBi+nTPr/hkb92qlVBo7s2VTkD3CufBcVcATQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d7740d-1116-45fd-8808-08ddc914bae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:40.8165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJ5zuTK7cDi0KJq2OgSrfU2S8ehfspMNI6RUHaRHbPBZHxDw7EB17/gwAbASCuYeZBHXjSzwy6gP5u15wY5jeIIfXQ9ZzSm9U7TXttxF3Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10194

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

