Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921BEC56AE2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 10:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160835.1488889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTx4-00065t-IN; Thu, 13 Nov 2025 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160835.1488889; Thu, 13 Nov 2025 09:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJTx4-000648-Do; Thu, 13 Nov 2025 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1160835;
 Thu, 13 Nov 2025 09:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MRe4=5V=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vJTx3-0005lH-9B
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 09:49:13 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 019c6599-c076-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 10:49:11 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV2PR03MB9451.eurprd03.prod.outlook.com
 (2603:10a6:150:d8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 09:49:02 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 09:49:02 +0000
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
X-Inumbo-ID: 019c6599-c076-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIG7sT0rvFh7m+1N6DRDwu3VfHezgQPZBaYS2Xo1q82PWKQtMdY59+QBWGmzcRKOsF835Sw/KQa7sfjYEJw7HW9v0rLh/0lv4FhFOeEk46QOwAZlv7HGCiyF9MnMtS88z7L5eUA779d9bR+AzJv62klN9jitok66hs0eyvJtz0fDBw/cnPGlwPlI+u+B/AFPmXNvuohsJowyRxwm6PjT7sl6fQUVoO+KRmCLaOoT0+9Vq3s29OH+DotL5kqeqYmJANvPPrcqnUNP1g8taf0RtmWnh20pS7KN8WgTIMzlcRfjyy0NvmJiRaYhYXnOoMQuP3Tt/1zQy6X1XGtIPO4wag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocok5+6KyO2CnExoU/r9C98Mtul8NiQfKINon8RrYPk=;
 b=fnJv8BpAW6cZi8siTywnyxfFF6R1LDUtpUGXsvZK9SrW89U8qcC3aygRUW6ySLDx/+a10bRulf/Iyn/i/H+5PNgMFXyI572BPz1t/EQtfFx0rlxR+zdVD10PAvKs5KIFbbnq6fzUiKcINLAqhLBCExYNj1FTBMxg6xm0gi2EFBHs38wlnWNt67tV6ofWGzIHkkO7WJAys3PXZki+xxEyHuENhO1KPOq6VqB1wtdeI2ovz/P7qAPstol4yqIB1FdzHGlua/WKVbhRmaT1Bnrbp08U6Px0O42m1uWsJXkaivfl39InfyrFoT+iOG+l3CWLtfww47f85i3Pddk8GyqZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocok5+6KyO2CnExoU/r9C98Mtul8NiQfKINon8RrYPk=;
 b=mZDmAZObPH/+gW1YeqwleI2T5rhLGnxEKUAq6JXeAFW+/BEmPVGFjBoSMDP0lEQCNbRE/xLFY0QQy7GiEx8UpfUlEgINpzP/swxY7IUy55F1RC6GMfK1tbgYavTN/w+D0Ao2wdhon/svGPqRytymvrSm2m/Mer0ymYnxA5tG3X9MqjgRrza9tk1rYS4QloXzhvme33Eyt6n2pLqjtBjQV51cDbj0HLr5Esz1HCZs3v+dLDIkaIY/jq2tn6GTIMoHT0JOHiledPLkvVgTlexSXGycKfRefMmStcMXRx+Orf/GfwTMa4J/Ff2IYqvgL7ZCTevPGHiXpZ+Ye6LirMX5pw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 5/8] xen/pci: introduce has_vpci_bridge
Thread-Topic: [PATCH v1 5/8] xen/pci: introduce has_vpci_bridge
Thread-Index: AQHcLSkjUCcQVsMHP0qfA2BNpZwKybTl064AgArXagA=
Date: Thu, 13 Nov 2025 09:49:01 +0000
Message-ID: <b287a8ec-0f85-409c-b133-b709026028d2@epam.com>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <acb8da959fac97fbec7bc086b921e31dd52d44f6.1758618839.git.mykyta_poturai@epam.com>
 <39458e03-31c1-4aa6-8b66-f6d72ec8bdd9@suse.com>
In-Reply-To: <39458e03-31c1-4aa6-8b66-f6d72ec8bdd9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV2PR03MB9451:EE_
x-ms-office365-filtering-correlation-id: 15b03532-afb0-447d-3d35-08de2299e027
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHcza3ZPM0VENjB2VEpOSktVS3hPOHkvbmZPSklmTGM2Y0JqVXA1cm5vbXB0?=
 =?utf-8?B?WTYzWUhqZ3NsMFJnN1htUFBBb2J6T0RyeVJsUzRPazZVMUJuZ1RKbWptbSt4?=
 =?utf-8?B?endtSVg4RitLTjZDUXJPWlJyV0FmQzB3MVV1bkZhalh3Q3lrSHpkSkp4Mkdw?=
 =?utf-8?B?MDNKV3ZDZVRsR0tTTjAveDNoUWl6QUlveTFBblhRYTdaWWNwSTFDOU0rVTFK?=
 =?utf-8?B?RThOdkdZZzY4YWk2R0ZuUFgyS2lmN2N0Ni9tMXNMNTNVblFTMlh6TE8zall6?=
 =?utf-8?B?dFF1QUpBWlZKTkh0Uldqc0FObU9vM2x0a20rUmIxVVNGOCtRZ05JdE1wWGlu?=
 =?utf-8?B?UExQRWNqRmtCYm1NNnBwbVdSN1MvejJUWUx3SThsazV2NXdnQnJRS05lbGZp?=
 =?utf-8?B?WlNTZTNYNUpxRWFqYXFrWi9CdHg3dXVpYnNmMEwrS1VpblNiUkljV0tldWxV?=
 =?utf-8?B?ek5GRnE5NTJsYmhIV0dFK3ZiZyt3K0gxQVFXSnVzSkliK25lOWtadG5nZWtW?=
 =?utf-8?B?N25hcUZQb2F5OW13WWpGZ0dxVkJOV3d1NEZyTC9HS1NaSGNjYTJheUhKY085?=
 =?utf-8?B?bzhHdFhhZ2VsOE1kckRQUnZWN1o0UTdGYzhpNDBVL05xVWM5RHBkVUg1MXNo?=
 =?utf-8?B?SklQKzhiUlAxOHZnU1N4REhmZUsrdDhRaU83YVJlV3JQUDMrMGJHSWt3ZEFq?=
 =?utf-8?B?VGVwek4rSHJvdmxjeWhCRWwyZ1pvQlJ6NEFEUU5jM01nUmdiRXZwWTFHaytv?=
 =?utf-8?B?VXlMMmJVUzZyaFljR0tEVFBvY0ZBZkJubnhncEVqTVVPdWhuZm9nQ04zM21T?=
 =?utf-8?B?eW5VTTJMbXc1TDdVKzUvdi9JbGlaakZKZ1JaWWlUdHVCWHFOTUREbmluTWUz?=
 =?utf-8?B?Mlc0Y0ZsUW9FNGhIUjVKUTFaQkovUUxoSzZLZjB0dUZwczFSUVdzVnY1SDhS?=
 =?utf-8?B?U2tlY2hJK3FNR1hKUkNWbkc0aGlQYk5JWnBVVDRmR0FVUmtRa1F2LytpQjQy?=
 =?utf-8?B?RUloNkMrMUFpUWRYSGRuWDFJZXo0dVppQTdiTmVBdVFvMlBiTXprSFcwSSt3?=
 =?utf-8?B?TWhvd2s3MGRJbUlWOU5BLzZWamFmV2ViUk1iS1Y3Rk04Wi9ZaitTc041a0Rn?=
 =?utf-8?B?TUpjQzhQUlUxcFpaTE52c0hYaVV6SXpDa2Vsdm5tTGNZbHJwekF6NmhNNVNL?=
 =?utf-8?B?aVNMNVIrWmpyZmErSlBNZWJRL2picitjZUwxL292STU1OEdVcmRQN2wzSnlD?=
 =?utf-8?B?U2k5eGJJd24ybG56bWs4TWhhcHo0QjBJMWlsdUE2WlNSWEQwSWMrbUxrcno4?=
 =?utf-8?B?VnhZVmR6VDBTUDRKM2Z1ZExiMlFQVVhUMzQyL1ZlSm9XaFZCYmJ6YnZLRkJw?=
 =?utf-8?B?MEpqU3kwdDdHTGFyRzh5RnJUREVvaDNLMGhRV1FkQ284K043emdLdnJ0UlFE?=
 =?utf-8?B?RUNZMjEzMGQ4MWp6SjZqN0xhS0Z4UEY4dXc2YWdxNWlLaTMvSDMxZWUveGMy?=
 =?utf-8?B?TkJRczgrWVIyRXNYYjVFYVMxaHE0TVFIUjR2WGNkMGtIREhLRlBFdjBEa1Fy?=
 =?utf-8?B?V1hTSnY4NmxEUVMrK0tvNXcrU0txK29POUVTTUxaanVzVVhhdjAwMlZXdUdQ?=
 =?utf-8?B?Y1hLYTBpTXp4WHMvYmpOMFZLem9PM2hwYVhwQ0hwU3hHSi95MWdZOXBFYXF6?=
 =?utf-8?B?WUs3U0RBbUxsejJJUEd6ZE82ZXF6aXJpdWNvWUlscmo3OEdNSEVoMldIblZs?=
 =?utf-8?B?WkRtU1BiNFhudGxta0ROLzFwUlBxNkZlVnZ3MDNqTmhoVDZ3UGJncDIzVWRz?=
 =?utf-8?B?UVhBZlFDZ2VqOEVDR1dDd25zcFRXV1NmTWlSQkRUTVZWdWFlZ3VvVWpWTmVl?=
 =?utf-8?B?VmpMS3dxVXI1emwxVmhFazlTOHlIU0I5UGlBTitnazBEZTA2bGwrd2dpYnNU?=
 =?utf-8?B?RmhFYSt2enExRERkcGdLb2pRL1FUYXNIM25udWttcS83VXp4UEY0ZmRNcDEy?=
 =?utf-8?B?bVdoUVlsTzlhbzV5dlg4YXpud2luMFdLZ3dRRmVvOWpOb1JaV1N4WEJUbUp0?=
 =?utf-8?Q?+twr48?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFh6M1lNSk5hR3ZTU1ZuQkQ5UjkzQkxwTTA2L1dUSkJuZ2haUW9PUjlRbTY0?=
 =?utf-8?B?ZVEwSnEyMkQzdVc5bDM5OTYxN3FSVjZQekY5ZE01ZnZxcUcxVUZHbU91QW1P?=
 =?utf-8?B?Q0N6V2ZHeVhGd01nREZHWUQ4aktPOUFVbVZjS3kwZllyQWc0SUdzTzg5c291?=
 =?utf-8?B?UnJ6Q042Y3FtcXBOMVF6RDYxVlY0bkY4ZmdXemFmZ1NPOU5ma0FneGVTazIy?=
 =?utf-8?B?ekJHYzI3SVVRemluZldYZGxCWjloOW9QYm5yTXRQT1VKZnNURG4xVzh5WC9l?=
 =?utf-8?B?YVUzaDVoSEgxNGtHa3NRUk1ycElJcFRzTFFsN1Nxb2pYS2czdGxVSVh3aElQ?=
 =?utf-8?B?R3NyMG1DZkhrR1k1VWRlVFZiYVBCRUo2RUpZOGJPR0ZBdHdUQ203b1VKdHdO?=
 =?utf-8?B?c0hPRW1EVEZ1WTlVTEVNYkNHcGlZbU5NUC8rYkhvMDZnQ3BrNVZuM2NsMzJ5?=
 =?utf-8?B?UVZ3RGFxVW9CNEUrVi9nelZudmpVOFJkL2pHbEJpZ2VBZnZWQVZ1cDg3T3Vr?=
 =?utf-8?B?ODZLUFhhcFk2bmtBdGlMVS9Tb09NUFl0bjI1TklJeHA2MHdBVFpWVkdNT2M2?=
 =?utf-8?B?SkdkWk43S3ZUVE9ubkt2dGNXVEhZNHFodVVTUmlpbW5BR2F0NWdTcGtPQjhw?=
 =?utf-8?B?ZTRLd2RvekpzaGM1UzZhU3lVMmg2UEpjeEJ5VGZSR092VnVLT1Uvak42UnFC?=
 =?utf-8?B?WkJwczhDQi9leS9YbUxOelM3OXVQWG14YVlZNnFlb1BZUGdWdHBadjl4Mkls?=
 =?utf-8?B?Q0lGV2tYQk0vbXZmMGtIRVR0ek5RSU9ORGQzRkRSc2NUUytIcDVIUTZQcndD?=
 =?utf-8?B?MXNadFdYNDJnQWZva2h1blZKVHA3a3ZiMndjOERZSkhzMk0rbnZpd05vUHg5?=
 =?utf-8?B?cmtrNjVuZDJvUWYvWE9NVmFhTUlvSlNZWXZCd0ZTOWtWU2ZWekt6MzRPWjZC?=
 =?utf-8?B?WGlaL0VaNzR0bkFWV0IzSjlldWdsVmNGT1kvUTJBWWgrVGxFb2ppZWM4WmM2?=
 =?utf-8?B?dDJOekRRd25tRDlZTlduYm9xL1FpRHl5M29LRWRUTEtJK0YrQWhmNWxiNkFl?=
 =?utf-8?B?aTZlOEtoZVlMVWE3ZmV2MUkrTCtTMno3T0FWbmp3bldRMDdMeklzSzBBWlZZ?=
 =?utf-8?B?Skkycm1mVXU1U2dwQ2RLKzN1YWI1TzRGWUo2TXFDZi84WHF6NXU3Mjk4eWVo?=
 =?utf-8?B?RlNxbS9zOXJrRzdHamM4REp5QlhvSUIxK25kNndWTURJSWFuUEdGN21jOWoy?=
 =?utf-8?B?UVprSzF5elBhK2ljZE9weElEb2RVZFYzRHlZaFNyNEkwY2xGN2JqdHpIZlBr?=
 =?utf-8?B?ckdHVlVTKzB0Q0RjUFV1amhyRVBxUi9WZ2hBeFE2SnA2VnVJNXlma1RkckM0?=
 =?utf-8?B?dWVBeWxZK1diYk1zSk1sdVMzL3F3SnVpQVJGMWlFVGRNODJpS1BRTENXOHJ3?=
 =?utf-8?B?N0Zudm9iNDMzYnBQd0Q0Sm1lOEF1VWVyWkl2UVJ4L0JwVlg1UW9CQmhrNkxE?=
 =?utf-8?B?YndrYXVVMzBZNHhUNDBnd2c0THZ2V0wyTEdsUHkrd2liaUxnRFR1eDlhck91?=
 =?utf-8?B?VjFIQlJkTUV5L0dldXRnZmpTNVZuWjBsUnU5elNJQTlPTURiN0pOVmhIdkpH?=
 =?utf-8?B?MnUzQlBucTNwRVNCWitNbGNJMFN4bnZFT2xWMUdlWFFCY0FEQlkyTjZEMEx2?=
 =?utf-8?B?Ky9JcXBrdlhFallKQjZyd1lJRFFkWlBQaUdlMzRpM1hlalU3cElBUElWQTJC?=
 =?utf-8?B?TUdIWG0yZ3RlQVJrbDVSazBjMnZDeXVPUTd4UDJOMU1ReXdzRklBM1VnWm1z?=
 =?utf-8?B?eVB1RjJVZW5iY01aRHNuQXdWWkRReE1DNnNoTG1yaDMyS2ZTcmxuOWVsc2xO?=
 =?utf-8?B?NzBhVWR6RUltWDZFUGZQbSttQ3NmVkhGdUtScGx2WmJraWh0ZW5xbjY2bVRu?=
 =?utf-8?B?cXE1TjNpQjhuRU9uZUVmQjdTeXZNYlNsUjNVcTRGaEZOMVZWK0V4MW9tMG1D?=
 =?utf-8?B?NUdNU2d1aDI2WEV5R3pXbDJ0bWZ4M1QwMHZyNGI4eEVEMW9mN05Na0Z1QWJk?=
 =?utf-8?B?Tkh0MjJDcHQxTEdDTnZyT3pvV1dFQUVud2d5emd4ZmVxODZrZ05PZmlMQ0Fz?=
 =?utf-8?B?VktseWhkd0FEQk41cWdlUHhET0lXaHlwclExV3B6eVV1TE5YREV6UEtkdmln?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AFD8119D7508A4EBD7B329CDC4059E7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b03532-afb0-447d-3d35-08de2299e027
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 09:49:01.8377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtRz3UNKhT5AoQtdK0Wxsxbqi7nwm5k4rpT8FiKC5yJxNW8x551Xd2SQBWDhU7C74XQXJn6Q77nVkTmLIECztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9451

T24gMDYuMTEuMjUgMTQ6MTUsIEphbiBCZXVsaWNoIHdyb3RlOj4gT24gMjQuMDkuMjAyNSAwOTo1
OSwgTXlreXRhIA0KUG90dXJhaSB3cm90ZToNCiA+PiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPg0KID4+DQogPj4gaGFzX3ZwY2lfYnJpZGdlIGlz
IGEgbWFjcm8gdG8gY2hlY2sgaWYgdGhlIGRvbWFpbiBpcyBhIGRvbVUgb3IgaXMgZG9tMA0KID4+
IHdpdGggdlBDSSAocGNpLXNjYW49eWVzKSBlbmFibGVkLg0KID4NCiA+IEhtbS4gV2h5IHdvdWxk
IERvbVUtcywgbm93IGFuZCBmb3JldmVyLCBub3QgaGF2ZSAodmlydHVhbCkgYnJpZGdlcz8gDQpX
YXNuJ3QgdGhlbQ0KID4gZ2FpbmluZyAodmlydHVhbCkgYnJpZGdlcyBhY3R1YWxseSB0aGUgbG9u
Z2VyLXRlcm0gcGxhbj8NCiA+DQoNClNlZW1zIGxpa2UgdGhlcmUgaXMgYSBtaXN1bmRlcnN0YW5k
aW5nIGhlcmUuIEluZGVlZCBpdCBpcyB0aGUgcGxhbiBmb3IgDQpEb21VcyB0byBoYXZlIHZpcnR1
YWwgYnJpZGdlcyBhbmQgdGhpcyBjaGVjayBpcyBkZXNpZ25lZCB0byANCmRpZmZlcmVudGlhdGUg
dHdvIGNhdGVnb3JpZXMgb2YgZG9tYWlucy4NCjEuIEFsbCBEb21VcyArIERvbTAgd2l0aCB0aGUg
dmlydHVhbCBicmlkZ2UuDQoyLiBEb20wIHdpdGggSFcgYnJpZGdlLg0KDQpJIHdpbGwgdHJ5IHRv
IHJlcGhyYXNlIHRoZSBjb21taXQgbWVzc2FnZSB0byBiZSBtb3JlIGNsZWFyLg0KDQogPj4gQEAg
LTg2Niw3ICs4NjYsNyBAQCBpbnQgdnBjaV9pbml0X2hlYWRlcihzdHJ1Y3QgcGNpX2RldiAqcGRl
dikNCiA+PiAgICAgICBzdHJ1Y3QgdnBjaV9oZWFkZXIgKmhlYWRlciA9ICZwZGV2LT52cGNpLT5o
ZWFkZXI7DQogPj4gICAgICAgc3RydWN0IHZwY2lfYmFyICpiYXJzID0gaGVhZGVyLT5iYXJzOw0K
ID4+ICAgICAgIGludCByYzsNCiA+PiAtICAgIGJvb2wgaXNfaHdkb20gPSBpc19oYXJkd2FyZV9k
b21haW4ocGRldi0+ZG9tYWluKTsNCiA+PiArICAgIGJvb2wgaXNfaHdkb20gPSAhaGFzX3ZwY2lf
YnJpZGdlKHBkZXYtPmRvbWFpbik7DQogPj4NCiA+PiAgICAgICBBU1NFUlQocndfaXNfd3JpdGVf
bG9ja2VkKCZwZGV2LT5kb21haW4tPnBjaV9sb2NrKSk7DQogPg0KID4gRm9yIG5vbmUgb2YgdGhl
IGNoYW5nZXMgKGFsc28gZnVydGhlciBvbmVzKSBpdCBpcyBjbGVhciAodG8gbWUpIHdoeSB0aGUN
CiA+IHN1YnN0aXR1dGlvbiBpcyAobG9naWNhbGx5KSBjb3JyZWN0LiBGb3IgdGhpcyBsYXN0IGlu
c3RhbmNlIHRoZSB2YXJpYWJsZQ0KID4gbmFtZSBhbHNvIGVuZHMgdXAgd3JvbmcgYWZ0ZXIgdGhl
IHJlcGxhY2VtZW50Lg0KID4+IEphbg0KDQpUaGUgZ2VuZXJhbCBsb2dpYyBmb3IgdGhpcyBjaGFu
Z2UgaXMgdGhhdCBiZWZvcmUgaXQgd2UgYXNzdW1lZCB0aGF0IA0KaHdkb20gYWx3YXlzIHVzZXMg
SFcgYnJpZGdlLiBOb3cgaXQgaXMgbm90IGFsd2F5cyB0cnVlIGFuZCBod2RvbSBjYW4gDQphbHNv
IHVzZSBhIHZpcnR1YWwgYnJpZGdlLCBzbyBpdCBuZWVkcyB0byBiZSB0cmVhdGVkIHRoZSBzYW1l
IHdheSBhcyANCkRvbVVzIGFyZS4NCg0KWW91IGFsc28gbWVudGlvbmVkIG9uIGEgcHJldmlvdXMg
c2VyaWVzDQoNCiA+IEhlcmUgYW5kIHBlcmhhcHMgZXZlcnl3aGVyZSBlbHNlIEkgd29uZGVyOiBJ
cyB0aGlzIHJlYWxseSBhbiANCmFwcHJvcHJpYXRlbHkNCiA+IG5hbWVkIHByZWRpY2F0ZSBmb3Ig
dGhlIHB1cnBvc2UgLyBjb250ZXh0Pw0KDQpNYXliZSB5b3UgaGF2ZSBzb21lIGlkZWFzIG9mIGEg
YmV0dGVyIG5hbWU/IEZyb20gd2hhdCBJIGNhbWUgdXAgd2l0aCANCnRoaXMgc2VlbXMgbGlrZSB0
aGUgYmVzdCBvbmUuDQoNCi0tIA0KTXlreXRh

