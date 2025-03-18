Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F9A6634C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 01:01:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918294.1323001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKOp-0003f9-0q; Tue, 18 Mar 2025 00:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918294.1323001; Tue, 18 Mar 2025 00:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKOo-0003cx-T8; Tue, 18 Mar 2025 00:01:38 +0000
Received: by outflank-mailman (input) for mailman id 918294;
 Tue, 18 Mar 2025 00:01:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AvL5=WF=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tuKOn-0003cr-Fu
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 00:01:37 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 283c1a2d-038c-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 01:01:35 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM7PR03MB6402.eurprd03.prod.outlook.com
 (2603:10a6:20b:1b7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 00:01:32 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 00:01:32 +0000
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
X-Inumbo-ID: 283c1a2d-038c-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jczmebZFAnbfr6WTzh3wlpQwzQ404fObSTjxBKpiaRO2/4nL1MNzWwVTbZKB6gd4kW2S4oeV4NGnOhfWW5IWHPQWRGGky64WmIX0ynMtdT8ui/s9O1/cqgW/l28eFdiyMhXZ60aoVGk0XaiCMf0kp1j8frNpRFKr70RMkh+0yfXJoWrD8ux2Xqi204kBuwxKjlMTqcEv3cf1fxXZFI8bLjlQq1N6r02zalSV1F4CGbbqZKljfienchZBKJeheY5h0jOEXnOZroNYdaJ72V5j8Fr0RvSCwx4T9Sh0vfNoFX2N8bPYy8MS+sIptXAUOHWPIiNyK7c/635tU5h4ExxQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwg8UilKfhmy8wFwabXdkkalXgLIcgjszTNTiImO1RI=;
 b=hwERyhjiOWXfBK50kW2XKTmFQ//uN3Hz3GDyM97MPYihDYePa9uddpDmZR3alMt5aqycpTrcmFOhbOVBchCGMfevEFRjULR+siPowV/ufxku+GVVuTHEJQqjzSGu8I5XvkXZwGs1eNx5bQHfiT6qZYhVSh3R6SpPN8t/sTM/7IfSvx8VQJR5b6CR2+Xs2PWtZjetHjlWZy/58Ljng5Mxg3ubK12EjiGhDYS9h0R4mKTH7/LF0Dwe1rCZZ1qyE0oIhETBLXykBQ1L80WP/UwxlEndVOTn0W5ehufWfd7ChBc+TGhcZNNqbfj841kdkpN+lLkXLsBhw6dgt37af6OMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwg8UilKfhmy8wFwabXdkkalXgLIcgjszTNTiImO1RI=;
 b=VEa6kmHwnKyo1AMlpn7ikFyIcFCauPUmfLnOLrXgcUpumSO6th5Q1YW39A0Ee1NwIsprCASo9rvaLSylC6pThgGUOrh8F1I1cJc892YvmghRJPN/mHilGu8XLb/Pha7Cmj9uj0oMI5J0lnV3Mkj0qxPWw0LeEDazVHFthenKThHYk7ehECeaCTjPcS5ewkEWzaQ4Iwvr7EvN2NWKf5BtVOyP/Jjn9T7EVrhAf6Qz88oxofxG3Z4QGsm47wrGp0w7UAJsv9iOYu0tIWU+VAxoom4tB9qZDlVvXN/azl3aQqCX/Rqpvbh7w9CrG8GOEPfKOg9CyYKsfBo0zG8OF8UaOw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH] xen: vm_event: do not do vm_event_op for an invalid
 domain
Thread-Topic: [PATCH] xen: vm_event: do not do vm_event_op for an invalid
 domain
Thread-Index: AQHbl5FytTUpgHIInUKTmFbOO0oHkQ==
Date: Tue, 18 Mar 2025 00:01:31 +0000
Message-ID: <87senbi4v9.fsf@epam.com>
References: <20250317230806.1179478-1-volodymyr_babchuk@epam.com>
	<CABfawhkjGAytjnJ8U5vx_baHdxZmpRdPpdwLdUfAa=ujOOvbYQ@mail.gmail.com>
In-Reply-To:
 <CABfawhkjGAytjnJ8U5vx_baHdxZmpRdPpdwLdUfAa=ujOOvbYQ@mail.gmail.com>	(Tamas
 K. Lengyel's message of "Mon, 17 Mar 2025 19:51:58 -0400")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM7PR03MB6402:EE_
x-ms-office365-filtering-correlation-id: 53267f55-ac33-4792-be1b-08dd65b00a67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MWVhT3c1Nm4rdUZVbExaK1RCWVZBc2ZsUUx3dFdaaElPdStROW1Wek56dzZD?=
 =?utf-8?B?OTRRZ01WZ1J1ZzNrRWZtUjZxeFY2WDN4dGdpYmNVcWZJVUVDaDdPMEdWZWdi?=
 =?utf-8?B?Rk9HU0RDYkZZdi9CTjlYd2dGNHpEV3dpR0hMYkdWaTBzZkM2TmJ1MS8ycUU1?=
 =?utf-8?B?VFBZR0VtOXYyZFA3ajBKOXZ1ZFQyUThIZkxJOU04SXU5ZGxvcjhHOUJZQXNa?=
 =?utf-8?B?TnNVdWlkZUtKWXBpVGF0QWVuOXdTTWlxZytZNTdhay9qN1pFWWRkUTBKU2Va?=
 =?utf-8?B?eWNuaWN3MUJ1UWJQQ1doSWpjUm92Z1R0TDRBZFF6R3F6UVJhTEhtMytzV09F?=
 =?utf-8?B?VmhCMkQxMmtvK1o5dU44YXlZaGdrNXZXcE96RS8xZWEvcGtDZUM5ZDBQM3NY?=
 =?utf-8?B?MUNzUWhLQllKbFR1NWd2emtNbjBYNnNuUC9XZk5SQUFob3NGRXBuWDdDdUla?=
 =?utf-8?B?NmkzSkZ5WERRUHFSNkN1SmVsUkpkZ3ZsNVRqeE0xWXExdldTbXpMRkZwdUlj?=
 =?utf-8?B?Q09PZTc5eGNVbVhBOHZYUFlHekhaSUVadWY5YXJBRHBCK2xNZXAxNUl5S04y?=
 =?utf-8?B?TGY3V3F1aVh1UW5rR3FNQXovdEhIMnJINitDZEhObUxTY3NyajJWd1MxcDFk?=
 =?utf-8?B?NWEvTjExTzRyT0JJVERBY01xZ1U5Q2VwUkNHOHFjbEtVU0F2Y2dNbk9MWGxS?=
 =?utf-8?B?NE03cUZlL3d4WWhhNitEM3hudnV1NVp2S1Y4cGQ1WlE0OEJ2RlNCM3Ewek9W?=
 =?utf-8?B?bUFvb2hJcncvdVlrd0dTREdRaUxGay9CWUdmS2tYRFRPeDcwR3VMd1RLN2VF?=
 =?utf-8?B?cktuemdxSjZ6NGZ5elVOTWRiWEF2RHVuTE5IRWp6MG1vemtHdFdlQkxlM1VX?=
 =?utf-8?B?VnJRU1ZvZ3RhVUxURlFsZ1ZGK0ZCWW8vcmdCbTZSMHNEZjN6amU4TUY0UXZS?=
 =?utf-8?B?MzMwWUF6NmU0MjUyamYrQVVYamJIV0xNVXhvVlNCNWJ5RjdiOFk5MEpsZ3k0?=
 =?utf-8?B?LzZ1b0g1ZDdnSUNYOTQzWGdGTW5xWld3a2xJQ1V4V21xZW5MOWRUTyt0bHFR?=
 =?utf-8?B?NzhUMEQvZ3pqeUxjUjdLK3dpNHNlY2VmK3Z6NEs1b092OW9oenNvaXFRUS9s?=
 =?utf-8?B?bHNCQThrMHpQRFFhUnRqZDBlZ0ZyanQ2TWh3OEtrSnZMRDdlbnlEdG5iMHZF?=
 =?utf-8?B?NTFrcDJ5aDV2S09UQzhrc3Znck5YYSttTFkvSmRMR25oc1pEbkZaMlluMSsw?=
 =?utf-8?B?eVpYbWxZdW9YeGRmQXZnUFphUWZqZjJOd202cnExT3k2THlMU2xZVUt1T1Rj?=
 =?utf-8?B?dWVlay9zd2pjU2JjVE1JN3JEbTFFOWFtK3F1QTQvdEE5cU54ZXlidlk0SStU?=
 =?utf-8?B?U0xtWVNXaUg5Um9INExCZk80Q3hBL2dNbHlvclhxZy9xMnRFRXhORnFlaTh5?=
 =?utf-8?B?M3NzOFFyK1JMUEhhSW5QZ1JJckd6Mm5rK0NNdDRKUGNkdjhyZ1c5K011QXNw?=
 =?utf-8?B?cTJhZUNWK2JJbGdqVEdNZmxCOHpDUURhVWFaYTM0TTJKNmNaTlVxaGE5ZDJk?=
 =?utf-8?B?aHlLaTVENlpnUlF5YStyK3JIaHZrSi9BMUVuMEFhUDVPVkdQUHluR2RpU0FG?=
 =?utf-8?B?bEhVNHlaQUkvYWlsUW5EVVJSbjQ2OElXenVGK05zRi9OeGhGZlBCMzRZN1lO?=
 =?utf-8?B?ajd5YUNpWXV5SkpwdTNnclNmQmlvTUJ6QzQ1ODNFWWlVcDl2bkk3UzA2SE1T?=
 =?utf-8?B?bzh5UlZScHlvUzJmYit2OFcwc2VjemhwN3g0cHpLdzJOU29hQjBiQy8xTU9v?=
 =?utf-8?B?RndudlZEazFTcEtGb09rclRja1dHa2VYSWo2M1RvbmtmRlowTEZ6YnF1eFR5?=
 =?utf-8?B?SllJUnhEVWl3cVVrS3hBdTVOVG5WVkp4ZCtSZDFxZmFiZkdHczBUZTVrT2JE?=
 =?utf-8?Q?8gmMseFPKxX4B2jm1kzP/WkZWNE4Apbl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VElvS1lsajRNQ1lkS2t4a1d3amx2ajZQbDdjRXlZZ3EwSFRXQlNkRHRTM2Nl?=
 =?utf-8?B?VDJLYmZ2RlhYUW1Hb1g4d1lubzUyR2FJM3hyVzNGTU9PdVhpYXIyZ24xTmNy?=
 =?utf-8?B?eG9oVGFtUWQrODBLVVkwcGR5WEM1TXBZM0VlY3JPZWszOXdRcVNoNWZHUUlZ?=
 =?utf-8?B?Vnh0Qnh4TmNROE9JZEluOWJWTkMrQUJqV1BYV1hKZE5pckNsRnFQWStEN2JS?=
 =?utf-8?B?SXcvVWV2dWg0M1ZleCtLMVhLTklwMmdjU2c3Yy9ERTBNbHdaemVVWktRMHM0?=
 =?utf-8?B?alVUREg3L2RoK1RickhNMUo0YnFpajFoSmxaTUJabVdDVEsrZ21uYjJYclNn?=
 =?utf-8?B?Qys5cjVaYnMzajNPcEFld09EQlZ6Z1h3SEZrMllObEIxV0pKQnN4eUJwOUk2?=
 =?utf-8?B?TE9yVk0yNE9Wd2JtbkVibVNSUU5halp0VU9pdUM4YjlUb2k0STVCTVZLTVYv?=
 =?utf-8?B?Wkw2ZDh0cnJKNU9kOCtwajdzRUxQRU1Lb29FYkdBbVZ6NUNiZy9jTitpRjF5?=
 =?utf-8?B?enJOTzI0T2NFdC8zVW1DRnRpME40UU5Uc0xRRnc0UXN3WENhQ3ZPVUpNdUJl?=
 =?utf-8?B?YnN3SVVueklYeXJmcmwzUHphR1RXYndxbEM5dHJsV0k3QzNsckVZWlNOaTl6?=
 =?utf-8?B?NU12SWJBcGZTMER1V1RDSzIzSXRBN1NVaVY4aWtDeVBwdm5WSkQ5b1VzbE1w?=
 =?utf-8?B?OExteS94c01QVVdYRGNmZDhBY3Iyd1RTS1oyR0F0ZmdGQ21HWEZ2azR5NExI?=
 =?utf-8?B?TytJaTcvK3N4YXlnQjdIdW0wUEFVczFRRmF2NGQvZUNIcXZDUHFweXJKVkJx?=
 =?utf-8?B?VVVaZ1BsRGowbFJjdE91TTY2T0ZGRllGcm5IdndNVVgrbkhQeGE2TU5nSURQ?=
 =?utf-8?B?RGNhdWg4OUozVGt4SS9NdTB2dWNHeWtIZzFNVHhBV1Vqb29EK2hWd0ZFWml3?=
 =?utf-8?B?Z1hzMGcwWFdzdzQrQUN1UWVkbFM5WWZqcVFESUdMVVJXYnh1ekJhRTg4Mndl?=
 =?utf-8?B?d0VySks5M3l5YW1lUFAwZ2FwZVlRcGd1QThPK1ZEemtVcE1ZYnI2bFF5TlZ1?=
 =?utf-8?B?SHUzd2lMV0xoNnQyK0lBU0M1Z0wrOHFPUVYwRjVNNHRETHJ2SGI5Ui9sTURM?=
 =?utf-8?B?N3QvT3dVNmYrUzJMNDRSWDh1Um4zdExNZ3NDRFVoQTlXbU8zL3FUeCtKeFNy?=
 =?utf-8?B?SXFPUm53ZkFySlhaZlEwNnd4MVF2UlNHaExqUmwzN3pvMldReUJsT0YyeUti?=
 =?utf-8?B?R2pGYmpLc0FqaXExYjFMS3pIdE1oS3lPaUN0M0lCK2lqTTNoSUticlJ1Znlu?=
 =?utf-8?B?YlF1QU8xSDFicUFFVmFERmhGYVNJM2FKRmcyUFJybXFuVUwycDEwS1F0LzJB?=
 =?utf-8?B?eTRPK25HOFlLSTVwb1BwdUpPRS81ZU5KZldWamxDM3ZNUUJlaWNsYnJJeG1W?=
 =?utf-8?B?WENsZ0ROWDRobGNEdmNWbEc3OUZmMkhuT1NQdkFtaVF6T0lEWHkxWDZGdFh1?=
 =?utf-8?B?VGRyZ3ErYnZOenp6bDN6QVlyaEJrL1cxVUhkWEhFd2RvTGdnR3lSWEFOay95?=
 =?utf-8?B?SFpwRmk1b1Zaa1FXbTE5eG5PYXg0SXlYOE9yRThxWUdzam5oNFJBYk54LzM2?=
 =?utf-8?B?aExKR1E1Z3JHcXJKMm9YYTVXOWRsaFA0b2dHZDB0SVBWaG9LOGVLTWhsVGM0?=
 =?utf-8?B?cldwYzNKN0JXeVJYVFhFYU10ZDluNDRXU1h5YVJoS3lZaHVTNEhjdWxyVEd3?=
 =?utf-8?B?Mnk3OVB6MXhUSFByWlVvanV0M29rMjdYY3hPQnNOMEZtK0tEaHlIcUxoYkUv?=
 =?utf-8?B?TzhHT3gvbFJRN0x0MUZJa1BvYTQ0V3hBM1Y4OEJZbGxtaS9nV0MxZjBMR3VM?=
 =?utf-8?B?MVh3K3pEVVJTdUovMHhIRnRFSDJaWnh3STlhcXRuTnYyVTZxMlYzZC9NQVgy?=
 =?utf-8?B?VmR3N0V5MW9UZFFIZzQyeHBDNVRIWEhQMndKMEowUTBPaXBQelk5UHFiSjFm?=
 =?utf-8?B?RUNobk5KZzB4WFYxZkh2MTJTRXcxakpXTWdBWWV3RTVnSHk0OFBESlVZWlJP?=
 =?utf-8?B?QWRlMnNLeVUxSjNVdkxrazRHQjNPZC83T205cnRRMEMvL3RIemVMYzNjSEJW?=
 =?utf-8?B?bEE2VkVaSVhWMm1YVnpFK253MjRqWmtUa0xPeXE3aHkrcWFCRnJyQ1ZDNFd4?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <970527DA4693C647922466C95F6B70C7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53267f55-ac33-4792-be1b-08dd65b00a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 00:01:31.9151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: siFdzQDwHCAvWDmRgB4lvIUthTEWNRjX+QmsG2ZGAPmC2noI5ucNFKWfSzgrpj/IzX/tDXsnlKukHlD7JHPYtZtL5R0hKbQdjSwHxBWBjQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6402

SGkgVGFtYXMsDQoNCg0KVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cml0
ZXM6DQoNCj4gT24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgNzowOOKAr1BNIFZvbG9keW15ciBCYWJj
aHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gQSBwcml2
aWxlZ2VkIGRvbWFpbiBjYW4gaXNzdWUgWEVOX0RPTUNUTF92bV9ldmVudF9vcCB3aXRoDQo+PiBv
cC0+ZG9tYWluID09IERPTUlEX0lOVkFMSUQuIEluIHRoaXMgY2FzZSB2bV9ldmVudF9kb21jdGwo
KQ0KPj4gZnVuY3Rpb24gd2lsbCBnZXQgTlVMTCBhcyB0aGUgZmlyc3QgcGFyYW1ldGVyIGFuZCB0
aGlzIHdpbGwNCj4+IGNhdXNlIGh5cGVydmlzb3IgcGFuaWMsIGFzIGl0IHRyaWVzIHRvIGRlcmVm
ZXIgdGhpcyBwb2ludGVyLg0KPj4NCj4+IEZpeCB0aGUgaXNzdWUgYnkgY2hlY2tpbmcgaWYgdmFs
aWQgZG9tYWluIGlzIHBhc3NlZCBpbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIg
QmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+Pg0KPj4g
VGhpcyBpc3N1ZSB3YXMgZm91bmQgYnkgdGhlIHhlbiBmdXp6ZXIgKFsxXSkNCj4+DQo+PiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMzE1MDAzNTQ0LjExMDE0ODgtMS12b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbS8NCj4+IC0tLQ0KPj4gIHhlbi9jb21tb24vdm1fZXZlbnQu
YyB8IDcgKysrKysrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi92bV9ldmVudC5jIGIveGVuL2NvbW1vbi92bV9ldmVu
dC5jDQo+PiBpbmRleCBmYmYxYWEwODQ4Li5hNGMyMzNkZTUyIDEwMDY0NA0KPj4gLS0tIGEveGVu
L2NvbW1vbi92bV9ldmVudC5jDQo+PiArKysgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMNCj4+IEBA
IC02MDAsNiArNjAwLDEzIEBAIGludCB2bV9ldmVudF9kb21jdGwoc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IHhlbl9kb21jdGxfdm1fZXZlbnRfb3AgKnZlYykNCj4+ICAgICAgICAgIHJldHVybiAw
Ow0KPj4gICAgICB9DQo+Pg0KPj4gKyAgICBpZiAoIHVubGlrZWx5KCFkKSApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLA0KPj4gKyAgICAgICAgICAgICAgICAg
IlRyaWVkIHRvIGRvIGEgbWVtb3J5IGV2ZW50IG9wIG9uIGludmFsaWQgZG9tYWluXG4iKTsNCj4N
Cj4gVGhpcyBpcyBub3QgYSBtZW1vcnkgZXZlbnQgb3A/DQoNCk9oLCB0aGlzIGlzIGdvb2QgY2F0
Y2guIEkgYWJzZW50IG1pbmRlZGx5IGNvcGllZCBhbiBlcnJvciBtZXNzYWdlIGZyb20gYQ0KY291
cGxlIG9mIGxpbmVzIGJlbG93LiBMb29rcyBsaWtlIHdlIG5lZWQgYW5vdGhlciBwYXRjaCB0aGF0
IGZpeGVzIGVycm9yDQptZXNzYWdlcy4NCg0KDQotLQ0KV0JSLCBWb2xvZHlteXINCg==

