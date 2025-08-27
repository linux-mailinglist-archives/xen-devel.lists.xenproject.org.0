Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E5B38264
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 14:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095994.1450814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urFJg-0003Gt-Mu; Wed, 27 Aug 2025 12:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095994.1450814; Wed, 27 Aug 2025 12:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urFJg-0003FQ-K9; Wed, 27 Aug 2025 12:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1095994;
 Wed, 27 Aug 2025 12:31:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrvt=3H=arm.com=Hari.Limaye@srs-se1.protection.inumbo.net>)
 id 1urFJe-0003FK-KH
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 12:31:50 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd93b7aa-8341-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 14:31:49 +0200 (CEST)
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by DU5PR08MB10703.eurprd08.prod.outlook.com
 (2603:10a6:10:520::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 12:31:43 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::2b) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 12:31:42 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Wed, 27 Aug 2025 12:31:43 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 by GVXPR08MB10863.eurprd08.prod.outlook.com (2603:10a6:150:154::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 12:31:07 +0000
Received: from AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5]) by AS2PR08MB8745.eurprd08.prod.outlook.com
 ([fe80::a4bd:fd62:e7f:76d5%5]) with mapi id 15.20.9031.019; Wed, 27 Aug 2025
 12:31:07 +0000
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
X-Inumbo-ID: cd93b7aa-8341-11f0-aeb2-fb57b961d000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oreq64/PJO3gD5HD4KcNWBlJVzSm/pXoZ7mNCNcQBv0Kaw1Npp55W0U5Q7jAfu8wrdZM5w6ZNHEQEqaaPUGxYRrbX5E2BLK0JHMsIrCp4qED6SSc12/KFuzfvgEHeL5Aq8Uj2rB40iJth29CBxg8YmlGGhvCUjcc0gLJUYQsMupWAMjb4TshpAK9qJa1AMuiCTSlcCtUvuVzIyLcWNQCqwt/vl0aM9H4IMSR8mKcH/L7uQE1FKGN91p+Qd/xkH6YIyGcEY2YomRcgcGQEbrZd6fmON8TI+LkiNICPHVebdwmM4K9q092ifEAR8Co2ytAa2vyQa+TRUv0NryinaBmvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0auZJzDScxk9QiMWFC6lY8/ipGiWJgaq1IQH/u4StOU=;
 b=NtrMjREC2gn6ZjwGGFz53MistWIyq6URaLtByBO1iwzYZzs41rmhNUIf9i9XU+/VlymqbsQT1o6uP9MD4qqdqAXgnuMX1FsPjp1KZ6tT5kOCuS8qAGeK+9HgimSgvvXnVVffFW9H2RsZnUN/pOoTjogbNOCGQn4vHG5VJOUXXB8KM+npjyqqqq3iJTpfdgwxkQ8bXLeLS+99D5yOPABbLrwDRpEJ5Bf4Iai/u+X2Il7lHbWIcU0Afyzg75t4Fs6gcExfWdEO/7zlBI6Pzyd+siYJzHv/t1IVaEbalKhsjaE8+ZmO0bSwlZy0xiaMe2s3TrKNUcdKozEH4sWsvK4rnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0auZJzDScxk9QiMWFC6lY8/ipGiWJgaq1IQH/u4StOU=;
 b=KYgirwkr35uaLKymyE91tW4UCNB4riM85CiMxkc8S2pjM6R2f2AYlsEugx8GXE11UXUjFFT3NuZIJeedtGtekqNw3Vu0+uDUxsb+BC+yjf+TFz6kFUySjDmKpxETf/27rOzADJLSTZRdWLZyjBbx3SwBp3CK/B3wHpYF7zPSBkQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmNo+i8XDnTxoqUVa1TG0SwnhJzhlofS7uGaF91WhYy7v5EISXlK2XH/OUhufVmb+4TW5MIGJkb82RmLeuPgz8BUs8aXu8GQGL4BVw115rXy9TvPXbFHvijR8+CVGN88aaM7gEKVvKwh5oNcPUvleuk/1O4aA749aoQHFc9I1et+jz6FW4xX9Pyboia1cXpKd4ka9YU6WElY4ERNYcsutpE/YnCUHWAy13f8HgKu6Lwhg0t88usf/EVdE4KInJBdomWEt5CcEGVFzLiI9p+oHZCNEonwwahEz4t+S50SzTnedky9pTw9i19nbPiuKz5YWkU6mSaCw65BgSyMPBn84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0auZJzDScxk9QiMWFC6lY8/ipGiWJgaq1IQH/u4StOU=;
 b=w4pyWlqkvaKcRbCXYwGU1Y+2yi+CoqAYiA0dH5I5sUPe82Sj9WZVoejeTb/JDBfBOPBeP8x6NUXmijBW205ZgKB2+iSG+kLXPkRVqr/YmSDsLw5lO44wnfQzca57yMO2M0xFAUzvHkf9XNtTfev/0ijQRc3wuNcw5gfFhB+TF5QCTkolrhQo5L0XvCanRrbc4jt37hBIXh5K1VTLvI8xnVhYlVhdNEqso/xjSEaUyPykbeeEZI+zazYEDZYtKImiJetRbmKaF2Duxxy29NNbZizbC/oOoj6VwyPIH2ePm8ibKsqqbThTJglN8SEMM/79Vb76p5cZpOu/qFWYR0rn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0auZJzDScxk9QiMWFC6lY8/ipGiWJgaq1IQH/u4StOU=;
 b=KYgirwkr35uaLKymyE91tW4UCNB4riM85CiMxkc8S2pjM6R2f2AYlsEugx8GXE11UXUjFFT3NuZIJeedtGtekqNw3Vu0+uDUxsb+BC+yjf+TFz6kFUySjDmKpxETf/27rOzADJLSTZRdWLZyjBbx3SwBp3CK/B3wHpYF7zPSBkQ=
From: Hari Limaye <Hari.Limaye@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 5/5] xen/arm: map static memory on demand
Thread-Topic: [PATCH 5/5] xen/arm: map static memory on demand
Thread-Index: AQHcEzlqos7dHoCXP0W7s7Rjj8N/SbR2dmwA
Date: Wed, 27 Aug 2025 12:31:07 +0000
Message-ID: <7EDCD060-4EC7-4727-B524-225A5FB7A0B7@arm.com>
References: <cover.1753864612.git.hari.limaye@arm.com>
 <c85ac9d6da3c13dabd26627faac90ea95feb3f95.1753864612.git.hari.limaye@arm.com>
 <b12b9c9c-069c-4c45-adc6-5b7026f812f7@amd.com>
In-Reply-To: <b12b9c9c-069c-4c45-adc6-5b7026f812f7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|GVXPR08MB10863:EE_|DB5PEPF00014B96:EE_|DU5PR08MB10703:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9676c3-31f5-4dd1-fa73-08dde565ae3c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?ADpjoRBy/PaXjB1+Bbh78g7cP819zYqsku9cXHKdcyMxfL79n1slO71AWE?=
 =?iso-8859-1?Q?1ujhzQIuvaB+NOxqmXcua2ooqDskIepn6PM8ZSe8IAZtsrCQ8GAuOGmzLp?=
 =?iso-8859-1?Q?BqN6FLkDcZ3P/OCm6rVQ30m/9G1V/WaXOS3saUPRQ8WRsmzB22HlaY6Anv?=
 =?iso-8859-1?Q?x1L0K8djs9sReewFvFoKup4sRnwQFoXvstXUI2KFHukKSGYk/y7JoDdPtB?=
 =?iso-8859-1?Q?wnqeWhjoNFFuS0iEin6NCEZFCbyqA/iNHpIY5b6ffe4H1g9zVMOmETu9gH?=
 =?iso-8859-1?Q?2DPMZnMcfzLd8kPoslXvj+KIEDgen3irt0Hwdi4aSi+IBHuSBWpji55jYC?=
 =?iso-8859-1?Q?Egc1jtJ9DhsM0GsBa/sYATpdwxvHgChmHCbZAyW8eV2RmMu30zq/bb7qXp?=
 =?iso-8859-1?Q?hg99Ma2QoD0tNw4GBgx6cMdzvnBf7RwqkLLJ+DwecHCJLGxgFbqtj6u3aF?=
 =?iso-8859-1?Q?0gRIcJWJBmCI1BY7/UCw6CnhcY2R7/BFgnDxE/JwCzLJqEj1w1pGFFvsYn?=
 =?iso-8859-1?Q?x02NIfe98oz5kgoiIa4MwKEJMv3V67X50YT7tyr4pqzqEJASu7SE2PHx1B?=
 =?iso-8859-1?Q?pLFu5qruiyqijKFmISYKZn5mK2JYZ2zeCgKuxeBBNXNTrNnWfgSaxvAMvX?=
 =?iso-8859-1?Q?r9ZhrCcq0PSP2w44glFgYiVaoq6VAFVk7711AhKdUmMQj6Fl8Ba5JjWD9/?=
 =?iso-8859-1?Q?QGzX4oRxA0uNfrB2rIsCltZDyAZ3Xbm7BwLpyJBkf76TDWJR48bVDVyoly?=
 =?iso-8859-1?Q?W2sHmeR2AT/73bM7kiTm+3Nse1/sASax5aGZ6Z0Pw9ExRKTUGj18iWZ84g?=
 =?iso-8859-1?Q?8rZRCx1zWjvrz7aprdUXzrFKAP0/d1U2Z1ltFJWaafbjDagZVo7hJaTqaW?=
 =?iso-8859-1?Q?qdcXW8AJkEEG8+a2s6TfIvpRiNx0yZ1ithsOAgvztqISv5LhLLMjGmRrqq?=
 =?iso-8859-1?Q?WIa2TIyQRhLBLDHwRniGXxNSvoKOv7uE3QNhQ15pV0PIfPBdN6bTI2bLUT?=
 =?iso-8859-1?Q?gPTgj+JS866rVvOSyM2/QfF0mi+fpEw6C5KUFhiX6YDbWPa4xmb0eoTnIv?=
 =?iso-8859-1?Q?GdERlnXK3Xx444CKnLJfhET/h2x4RyCtmIPXQQhuX2u/iAjlSL2iHVIv8P?=
 =?iso-8859-1?Q?ktW1F84RGADywItP8P5t23xvomwHbVhvVlWPCQtVjXtFWwdjXZtdTR2vVv?=
 =?iso-8859-1?Q?AHVkIChJCPlgKD+918s24uESdswT2DKJQHAMdzx+HRlTU68Tr6bYEGyxNQ?=
 =?iso-8859-1?Q?XiE2hrrT1GPJuy6pD1xxyU2bjdvh4oxo+lD3MrL2bcJU9jV66UJoTEJGOM?=
 =?iso-8859-1?Q?I2S8mG4fTacrySmQEzvYGhdGJR3vWaebU53baPevnuKMnHgB36AQZJHVOy?=
 =?iso-8859-1?Q?piFqqWGTfhEGpewxH9Zcu6oOM12tkUF0LveS5Rr7rCutDuQbNe5bj1e+Y2?=
 =?iso-8859-1?Q?yIhW4LjazBKIaeVH0Zs4W05Bebln4UnF9ifEbOox7ft2c/ueprYqeTfQCL?=
 =?iso-8859-1?Q?FDous52oE/9FMS7OhPKLQ2gIpcbtBgJL3vK0svGohYHA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BEA81DF110A0E24FA746DAF73238F3CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10863
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	201c0440-9b56-4571-c237-08dde56598cb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?EhSOn1VegX9lDorN2PwlFNjfeBMeV7SuJF85cFsFHZC1l1yW26d6eNVmS+?=
 =?iso-8859-1?Q?C3P1FxYSWFnVHwfXZ5ZZ/MJihWq+nZO2cR68dRsDGtw4SaWoIx83a2NG/V?=
 =?iso-8859-1?Q?ZVClISDOVe4kRMulYxGTpmREeiavZLw1TmEVpAmKnvNFYVUTbT6KxnSz8X?=
 =?iso-8859-1?Q?sZf8FqR3NvK6V3ihtPoQzBlJpEmT4HtoSnw6Vf8nXmZGcB+Hu8NBag4t9e?=
 =?iso-8859-1?Q?YDjiLpSnIa1bhwwEpFVyc2r77mOHrxDWXTAZT+ZLvx0FQo3MpAwWUloKaR?=
 =?iso-8859-1?Q?2y2ePMLZnmCLdHOtr2ridtuBz98U+dtSp9o9eCVccqTayy9E+gFeZWbsQ7?=
 =?iso-8859-1?Q?Idr0K6Ozpm4+jkcF7n4+0Oxu7UN9oCP+bVUYqbtO52qQ/1ITSdK+BnxrFB?=
 =?iso-8859-1?Q?0gkZiIzEtNbEYZ0t3GidSZ9z/4b5gr9UiAh4PCuwQiqbdQTkWol9E7JhUg?=
 =?iso-8859-1?Q?XEMsXmlmZIZ1axlpAnscUGAyhf8ltM1GRkg7zSbJoHIHCzDOOsNblmpeBY?=
 =?iso-8859-1?Q?4gnpo297iZF9VAnXIq+4S6pr/M3mMaahYFjcp2/v2ojfFbYXJO8IOf0vBk?=
 =?iso-8859-1?Q?aaEM+dGrNK/XJs7zQ1WdjK2SaSgOnPyolnzOWtT9okt1cOoDH8R4COwvq0?=
 =?iso-8859-1?Q?lIP1eaphlf0KVeplT+3Y6LytFVfpdd3Z4F/Npi4T2OZeAe3EIOkDUKv2qv?=
 =?iso-8859-1?Q?7lUxdxxsb6yLp3N9hm3/ShldvM+ju+pY2Sbioyz6dNrls0uZYP4VJbsYU4?=
 =?iso-8859-1?Q?OFi3rObW3Y30IYG9BqMDPHYw9qtL5P2AqQMef+VgJyY66tDmrbjtrwvn6g?=
 =?iso-8859-1?Q?usyqVlGUX5HUtO7+kgYFQiInXPiIQer2CGjMLI7BV84Jp2WrZGyRasSp10?=
 =?iso-8859-1?Q?+0EKv/rJT6BjhP2ppxZK39Vb8Wu797i6ObP7xA0HoZyP9jQLQuOz5aZEvs?=
 =?iso-8859-1?Q?wyMiQE+9J1s3FmE7H0spmR9vkiSIBT3z4cYw8uXtEWcFoYd3RvXh9I6cRY?=
 =?iso-8859-1?Q?tiiEKUrDYSqK8QNA8yAsyhfEtHmbBUipk5erJHnV5Cfgdtz6RAAe9+B9MX?=
 =?iso-8859-1?Q?qkELesUqNNtj9RulFwoggluRHYdR2xs59OysLRmljwKZCfk7zuplRfplUO?=
 =?iso-8859-1?Q?QP964T9MG4P78E49DEDMk5jLw5Ho1q2UstAFYXF4A07qzEiiV9fVfefNAG?=
 =?iso-8859-1?Q?eS34j3iErbOM5Npn6bwhQ9P4qvXsrMfhzK3DwfiEioB5bPPTvFYuwNVz1K?=
 =?iso-8859-1?Q?uT78pti2c0axHBkqTX3B4quERrm6WXtKI9czxzHJRaPPTWa3jSqFa/RB8w?=
 =?iso-8859-1?Q?IYPMJHvYklJHGEgl2kcUn9mG6cbE1hk4SaUdo7/pNW4yLFGbmcEDU+43g5?=
 =?iso-8859-1?Q?ubaF3NQZp/v4wtZEEGkitqma8471+SL3BWUM0ZaGFU6FgSNuxyu0MNE4kh?=
 =?iso-8859-1?Q?0BiUk8T99F+1T5Neu4Fusi7PAjODyNQw/gge0FB7/Yjqwn6ncQ53bMP3Vz?=
 =?iso-8859-1?Q?MDVvSIS3q/ZzNNbc/1AVP3Pgtquh4SB+7D/MDGMQS03V5xtNlS+GW7242C?=
 =?iso-8859-1?Q?OWGsaHbYxttNrMtHfXBFoaDN8SCN?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:31:43.3186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9676c3-31f5-4dd1-fa73-08dde565ae3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10703

Hi Michal,

> On 22 Aug 2025, at 08:50, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 30/07/2025 10:45, Hari Limaye wrote:
>> From: Penny Zheng <Penny.Zheng@arm.com>
>>=20
>> In the function `init_staticmem_pages` we need to have mapped static
>> memory banks for initialization. Unlike on an MMU system, we cannot map
>> the entire RAM on an MPU system as we have a limited number of MPU
>> memory regions. To solve this, transiently map the static memory banks
>> for initialization.
> How does this correspond to Arm32 MPU (R52), where all of the RAM will be
> covered? I don't think 'transient' mappings will be needed there but all =
of your
> work targets common (i.e. not only Arm64) MPU code.
>=20
> ~Michal
>=20

Hm fair point - when this series was submitted to the ML, I had no knowledg=
e of the intention for all of the RAM to be mapped on Arm32 MPU systems and=
 imagined that things would be more aligned here.=20

Are happy for this to remain common for now? Or would you prefer it to be s=
plit off?

Many thanks,
Hari=

