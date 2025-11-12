Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D07C516C8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 10:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159613.1487929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7PJ-0003MX-Va; Wed, 12 Nov 2025 09:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159613.1487929; Wed, 12 Nov 2025 09:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ7PJ-0003JT-Sv; Wed, 12 Nov 2025 09:44:53 +0000
Received: by outflank-mailman (input) for mailman id 1159613;
 Wed, 12 Nov 2025 09:44:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8ume=5U=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vJ7PI-0003J7-BL
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 09:44:52 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 385a2f01-bfac-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 10:44:46 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU0PR03MB9633.eurprd03.prod.outlook.com (2603:10a6:10:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 09:44:40 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::d976:7403:c89d:4677%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 09:44:39 +0000
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
X-Inumbo-ID: 385a2f01-bfac-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfiDm+vnXjJzbKAUd2W+u3+yIlBfLwYzXNXoDSYyfUIhYFbPNMJRZv8t9lUd4hgVLFLKI8tLuZ8xh/Aqjb74sHAgvAbAKTK9dKvOTfFbkbgqwO0IpHCPvrjC7FRNSjvJ/Vuy/DsT883qO9JqqiLMNNcyka/brP4W6Jd6CHock9scYZyICEK6QFF+Aw/FiUBK3GgPJDKXNwfUIsv1kpEHDZKkES5umltRLIi9CJ1GJxl515x7VBKICFCaNdcb37tCeUE2+FY/zOEz4G7lC1AAETUq0UnG0g5WVnJxKKolVYwj6bbKxRTCejysy93h+t3ox7w67hWR8+m917SMuvYW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3rppuRjFLdgutdboEhEFyRp6WDVMVwOaTRGpKaELhA=;
 b=pjOWWsRQv01uR55bm6+imDJiAJ3Ee6kgMosyFL33MRVydr2HJtGWZiJ+hk8o3Odh1rcH0bnJSIVw3Os7yUlLuEIsqa9Uz3Oc12+GxTT3BDXBF+Wj4hwSShQ0OKqHqLXzQJf1Poc0v5Y1kZ/cIAzV97S1b9ZiFarijVdJAzp9nTiLv0M9yNG9XyXSRakCXGu6z7HAth3ZGwUQ8KkMkZdBzrMOumeM08Ck58cgiPWuPiZ3zfbh0lhsDMBsCG/a8Ht2NzEh7tADPJeZx+7puBcUr0Rz2w71+RJ80K4dKNek+IbWhtL2WR6YaDZe4GA7m7VenCzeSYMVWtv9ki1BX70+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3rppuRjFLdgutdboEhEFyRp6WDVMVwOaTRGpKaELhA=;
 b=OrQj9wnnH8XrojQ1F+o8lb8UyZh9rUqEyildm9HVk/180jUnNemNgCTuPukyaoP9t3CqFmWf6Thkfi7IVX7QHoLB3Y/KB8lkQJhmpzzoJMOtFkYS/8Pc8vy+up2hQ5L6QXKsuJqURBUNodrgKUsWfLr3t9tn4voSWM6VZAregFmvjZpbe8rIhZUYCRRcR0IvI76p4AJRX1OBGtiJbSjr1Tz+vifeuP6wE+7z+QMaD37eB7SO5v+efKpm6K2zFHioNkpAJu26b1M/7A43RJRUF7YxB9hYPSwmSyLnsE05WQOxrcHzKCQcwxvaNcv2y+HqieSvrFvclM9/LumoWBsBxg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local macro
Thread-Topic: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local
 macro
Thread-Index: AQHcU6MU9r1SyxgepkCxXro0WqQYWrTuqdCAgAAH5wCAAANfAIAAFY8A
Date: Wed, 12 Nov 2025 09:44:39 +0000
Message-ID: <f628e8af-0fa6-4585-9bf8-8449ffc636b7@epam.com>
References:
 <464fb509cc7f66934689d9e2d3a77bf5fcd45c24.1762931200.git.dmytro_prokopchuk1@epam.com>
 <80431F4E-4512-478F-94B0-1CDDC5E8B6E7@arm.com>
 <e91c18fe-37f0-4890-a8c0-96ec73470b88@amd.com>
 <105ce473-93e9-4ccb-9cb9-938cd5fd3f29@suse.com>
In-Reply-To: <105ce473-93e9-4ccb-9cb9-938cd5fd3f29@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU0PR03MB9633:EE_
x-ms-office365-filtering-correlation-id: 094058a6-e5c7-4be3-c8e3-08de21d01967
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RU9xWEpWbE1kdVlXanJ1STU3ZUVqK3c1Z3lsdzVQT3IvNS83SzJWZlZ2YUVZ?=
 =?utf-8?B?U21sTEFybW5NZlliZm5ncjIxT0JmQnhpZ1RZMDVDT3lZWGRQR1J5QW12RlRt?=
 =?utf-8?B?cUFPR3lsSDlCS2JXVVJGZHN2bmpJeDNnZHpFWEZ5UlNzb043ODdhUHpBSlBp?=
 =?utf-8?B?aFBMUC9za3VteTFQMlBFUTRRUGZaMjJWYlhrc29Ndm9XVmJveDgvMHFrYm9U?=
 =?utf-8?B?ZTZyM29YRWVnUVpDTHNjOGJpZEhGL2VEUHhiQ1hUWnl4cWJPUzFPMTJnQ00z?=
 =?utf-8?B?OHJmWWFkanJzZEIycHErdWFPdDVnMW1tY2xRZzk4RnhsNHJ6bDdQaEFPT0FZ?=
 =?utf-8?B?L1VXQldUNFBnTERVQkZTbDRXTVZ6bFFxTTJTc1kxaXdJMUtFemxORU4rSW50?=
 =?utf-8?B?RjVXUHVLTU0xTnlrSzF6aEpkVXdLM0p6NGdDMWFpWkxURDYxS0t1VlI4OW5m?=
 =?utf-8?B?QVFzc1h2TmIwTWMxWUc2MjhxUHNtRHh1cDlYcGxYU3hBWFlkRkx1Vkh5dzB2?=
 =?utf-8?B?d3JvOVhmeUpTL1J2UWoyS2dvUHNBQ2JXKzg3c0VmWnYyaWhraXZxRjExZUN0?=
 =?utf-8?B?bG5kbjRwN0tVZXVpY1FCc2ZMcTVuYzlKMUwxNlk3WTV2SU9JaUoraENJbVlj?=
 =?utf-8?B?UzJyeHJJT2FrMkNaaVhjNzdIZVRLeTRZSndEcDJSVk9oR0E4YzVUUjNXd1hq?=
 =?utf-8?B?Y3ZlV0I2SERaaVRaaDY4K3lsYm9rRXhEMHpnZU9PUUVLM0RJdEJsR3l3MGgy?=
 =?utf-8?B?N2tNa3dYakdMKzZ5NHAxSTNTR3llaFlkN2grc1FVMmZ3M2F0RSttSFNCd0Fk?=
 =?utf-8?B?WVR6ZmVaYi84MkJRRmloUkJwWEd0N2RVR29HSC8vNHZwZXQvYTV0eUgvY3VD?=
 =?utf-8?B?ei9adlJSMXBncDY5d0hoY1ZrVkcveXJISUNxSElTYThXVjNTbVNpdThCSGpF?=
 =?utf-8?B?aERzWXEweE5IVmxRTW82Sk5uK2JkbGYvSFJJY25ER0RpRHRoSHBtSTNnQmRv?=
 =?utf-8?B?SEY5eTE4SGY0L0d3YldXckNKY21aY2pQQVMrS29hQ1lSRG1zZUhVMVkwZ2VI?=
 =?utf-8?B?cmk0SjZndm9sOFlOMVVnS3ZuWGRHcGR5b0Y2K1FFeEFIY0xUVVVJZUVYdWM2?=
 =?utf-8?B?ekdjUk9Ma0M5djVPV0JWa0lwdk1EQXZtanRhamZ1MFdYSHd5Y1dPOEVoOFpt?=
 =?utf-8?B?THFUcWpSVjVnaThBeW5QT2UvVncxUnhoeVNCdEZtRkEwYmMydnhvN1B2a2NC?=
 =?utf-8?B?dkRES0Z6Zk14UEVjNTdJdGptV09KYW5UUm13QmtYWm0wNXpMTTU1dGt4cytI?=
 =?utf-8?B?eEtFdmFlLzJBQlJJSVJWejBJUGlsK2l0a0NZNWhJRk9GMVF4eDhENHZEMnBt?=
 =?utf-8?B?M1hWd0ZSTmpHU1FPdHI0RHJleml4RktzbWplbWp0YjcyZC90N2EyN1pJVk9R?=
 =?utf-8?B?V0lTUzJmWFJFWW51bytrU05JYzB6TWwxZFdWYmFkR0k3cDlFL0xxUFlxMnFS?=
 =?utf-8?B?andVaGx1dklJV0NocVJyV2hCbkV3UmlUdC96RjRyUW1WSm1WSldpVS9XOFZi?=
 =?utf-8?B?MHlmNENKYnlMM200clh0bmtncThSbWlTK1lnNFlFbnIyaW5BbGcrR0dUL25X?=
 =?utf-8?B?QWxjQUJwZ3BpME5XRXFuVEpUMmhSSGpmSjkweXBvaEZsVGduOXpkQ0U3VmdR?=
 =?utf-8?B?emNVZ1d6Y1JQa2V6K21vbU5Hc1h2NGVTR1ZxTkFORnVkUVhwYWRBOTVEWCth?=
 =?utf-8?B?ODQrc2pTckY5U29yWUM0NU9NMit4b0NVQVBRQTlpcjFLZWZlVHdSSFIzNENu?=
 =?utf-8?B?eHZNdUMwM3BsMTQ1OWF1U2dVaEdreGFGSkRPeCtUYXVtMVFoYStreGdJTU1r?=
 =?utf-8?B?VGlSb1d6aW0yNEJIWDhBSElwZWtnbnVoaTk2c3I3SC84d0FJVWoyWmxRUmlK?=
 =?utf-8?B?d1FOTWZMS05TaWxBdXdtcHk0ays0b1FibFE5TGZCVTNlcHhhaUNESDFKcjJ3?=
 =?utf-8?B?MFFaUlJXTEg1TXFXK0h5ckpidXc1LzV0VllSSlV4dVU3SnROQUNucnUralo1?=
 =?utf-8?Q?6NcoR6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTRBb2U4V2xTcFVDMzQ5NzdOV04xUGMzUmIwZHdWOVZ6Mk5CaThsQ2krTnhG?=
 =?utf-8?B?S0J1VU1oYUlDOUhPbkd3Y0FjZ0kxMDJsWGY1eUFrNnREZlRjTkJUZnovWTVm?=
 =?utf-8?B?UkVvMUJVR3dSY2ZQTEx2L1dIZ0RFL2hmTFcvTit3T2tYNDRKUjNmbTVLRzlU?=
 =?utf-8?B?OHl1U3BmUlNVYUJMdjF5RjhGdXAxQUNLRWJoMlVjSThDZFk0S2VsS1QzdTVo?=
 =?utf-8?B?V0M3aGJMK2NvQnNEV2twT2NzdldqSkNzRmhQRUYxam1uYkVMbXdSTmVEWC9z?=
 =?utf-8?B?bGVWcnFNVHBRc1pxR2o3b2JlWkZnWkpqcmJtRk0rU3dFcEo3bTVvYTdpR3pt?=
 =?utf-8?B?cHhQTnpoN2F1dlYyOE5CUjVOcHVVRWd6d0ZrcXgzMFNlanhXSVdCRG9JVHMv?=
 =?utf-8?B?TTJzVi8xdnNsZ0NSOUdVZjFiNU9DcE9iY0pkazBxNjBJSkFXT3BDcnlsY2ZU?=
 =?utf-8?B?ajF0clc3aUNpeGNocHhVYkJ0djRjVEtSZVdHMExlNzdrYTFLLzZ2NDMwakNY?=
 =?utf-8?B?eTIrRFZpMThQVlovSGhpdEZJMHZQU2ZFVUNFRW5LK3JkQ0d3MjVUbGkvRjEv?=
 =?utf-8?B?eTlubnpiN0k5dkk0M3VDVFMwcnN0Mll1c0xTM29RL2VGV3lURVJ5QWtFVkg3?=
 =?utf-8?B?Sm1yNVdjTEk1Z0FrRlVxWE9uRXZReUZIOWRPcXUvNUZ0dFhGazNOV1ptTzlY?=
 =?utf-8?B?VXJ4N1NJakZOREJ1UmZhV0FabWpPUndxaVNxLzEvZzZaKzM4UGN3VmNxYm4y?=
 =?utf-8?B?ZEtneFN6OWhmd2Y5Wk1DMjhaWGU1TjFxekFaTG1BSlFKaUZOdllJRkRFQlVK?=
 =?utf-8?B?MFBFVlJRajkrZUVMQktrVHhwaVNzSzJHeGtlRDFhT1FEbFE5dzMweHhWWEdD?=
 =?utf-8?B?eXVXTUpPbzVmeTNRZUdtc3JTS3pRaGxSUnQ4SmtiWkZDaHdnYmFjRDJSbXJY?=
 =?utf-8?B?U1BOWDYrS05YUk10SURCSVpKRXJuTkx4SWh1OWJRWmQ1NlFsL2crYU9UZUgw?=
 =?utf-8?B?aHdIdWJpR2JOM3BtVXVZMDQvaWltOGxOMkdDMnhhT1B2WVFBeFVFb1ZqRXVH?=
 =?utf-8?B?cFE2R1QwREQwM255dkprdUhVVExML0lUNVFHTER1amZhSW1reWViSUs2RFBw?=
 =?utf-8?B?cFMxVFZvT1VMMlRGQisxaUtCNEg3KzFYNmVOenRldC9HYUhBTTg3cmdVcWFh?=
 =?utf-8?B?NXQ0K2NHamRHaGZuTUszMythU200SGUwNit1M205bmNYM0FnKy9rRzJJblhP?=
 =?utf-8?B?QVh5SU9OcE5IQnNOYzNZc2xvZFQzNHY0M090N3hRSkJZZU5nb2dWVlhFNndB?=
 =?utf-8?B?cTV1SERpdXlNSy9LbUVxSzZORXc4ZmVZTVZQa3BKaU80Ny9BbWMva0RLbk1E?=
 =?utf-8?B?MjJ5NERnU1QzMHBIZVYwc1M5clNITDZwcVIvT1o2Qm83a09rak1VbjFDNmJS?=
 =?utf-8?B?dkVNNU4reURUaXNHbUlwL1ZqOVU4S0VwZnprWncvWXZYR24vWnVSUEdGUno5?=
 =?utf-8?B?Z0JwRnRzTFZHRkR6YkdPRmNPd3A5ZlF5KzJOVHhsMEtFc05rODRiYU5xRVRr?=
 =?utf-8?B?M2tPRmp0SVd1S1dDd0F0S2JScUNhNlRNQUZmOFM4YU5ldXh4U1N5S3BnbEdR?=
 =?utf-8?B?L0FoWGh6TStFaG5TNzhWVVA2NEpKT28rZ1M5cWJCRHVDbTdQVTY2SnoxeTNE?=
 =?utf-8?B?SlhhbG11SUErZUZnUFJFM0xjMjU1U2RJM0FxZEpyTTZlTkgwZ3AzQ1gyWnRy?=
 =?utf-8?B?Z2NpaTIrWWhaOGp5UHFaUmF3aUYwMFFtWngyM3NPQ2h2ZEFycVVPSC9USTVZ?=
 =?utf-8?B?WHZJdWlmL1VGbmtvMFFTWGZRL05CYnA2c0d1djdUcFIveHBvcFZHWnhyajFO?=
 =?utf-8?B?R0U0VU93NzkzZVBsNmFNZEl6OTZudzdUaTBlV0pUT0p3NUxFbXhKRkM3Z0Jq?=
 =?utf-8?B?MmVsT25OSG1USHk2NzM4WmVVTW1jK3NXSlJPS25jNVRYZUtCYk1RZHJFM3JU?=
 =?utf-8?B?NkV3QkhLVmI0dklMeXBBNXE4N2Nla0hCM2RnTjBuK2lHWGFuMmNnTTN6bTlU?=
 =?utf-8?B?Nlp0Y3NZZ2xwajR5Zk8rdnhLRzRYNW5YL1RQamxiaG90Wi85SVdtZG9paVpG?=
 =?utf-8?B?RWN2VmkxQXlNUnFKeC9KcVc3TURuaXBNQ21laVJKT1crR3hETmNhODRMVmVO?=
 =?utf-8?B?YVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A6F209BBD2C6049B4D59CE00F539FA0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094058a6-e5c7-4be3-c8e3-08de21d01967
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 09:44:39.6164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b45h/X+I8csMGtTdAvk0sROaLSJcCFAeKwopup/23GTHbwFyeCHF0mJebPtjbOTYAIhXbtQv69alXQiDOLBfsDPYttMGK7b8K7SgEQ67ZhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9633

DQoNCk9uIDExLzEyLzI1IDEwOjI3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMTEuMjAy
NSAwOToxNSwgT3J6ZWwsIE1pY2hhbCB3cm90ZToNCj4+IE9uIDEyLzExLzIwMjUgMDg6NDcsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IE9uIDEyIE5vdiAyMDI1LCBhdCAwNzowOCwgRG15dHJv
IFByb2tvcGNodWsxIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+IHdyb3RlOg0KPj4+Pg0K
Pj4+PiBSZW1vdmUgdGhlIHJlZHVuZGFudCBsb2NhbCAnRFRCX01BR0lDJyBkZWZpbml0aW9uIGFu
ZCByZXBsYWNlIGl0cyB1c2FnZQ0KPj4+PiB3aXRoIHRoZSBjYW5vbmljYWwgJ0ZEVF9NQUdJQycg
ZnJvbSAnbGliZmR0Jy4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDY2ZWRlYjJlMzk3MiAoYXJtOiBjb3B5
IERUQiBhcHBlbmRlZCB0byB6SW1hZ2UpDQo+PiBOSVQ6IEZpeGVzIGlzIGZvciBidWdzLiBSZWR1
bmRhbnQgbWFjcm8gaXMgbm90IGEgYnVnIEkgYmVsaWV2ZS4NCj4gDQo+IE1heWJlIHVzZSB0aGUg
cmVsYXRpdmVseSBuZXcgQW1lbmRzOiBoZXJlIGluc3RlYWQ/DQo+IA0KPiBKYW4NCg0KWWVzLCBz
dXJlLiAiQW1lbmRzOiIgdGFnIHNob3VsZCBiZSB1c2VkIGhlcmUuDQpUaGFua3MuDQpEbXl0cm8u

