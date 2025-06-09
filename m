Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369CAD194D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 09:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010126.1388257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOXH5-0002VT-17; Mon, 09 Jun 2025 07:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010126.1388257; Mon, 09 Jun 2025 07:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOXH4-0002SP-U3; Mon, 09 Jun 2025 07:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1010126;
 Mon, 09 Jun 2025 07:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLUs=YY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uOXH2-0002SJ-T9
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 07:50:29 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66f602f0-4506-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 09:50:26 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Mon, 9 Jun
 2025 07:50:22 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8792.034; Mon, 9 Jun 2025
 07:50:21 +0000
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
X-Inumbo-ID: 66f602f0-4506-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lV8838/isRcgM8PDKODHwtBgS8AXAOvigH4uDRBGnL56KY9dSXiNaDEnnHxgZ+MZjRVTd48gVf7YmP1ACdF+l+5LT8eKlyXz01FgaPT8Ryx20D1kxZeV9U3i6nkHT09ItQ+H5vzJsiuRHQZnx2FQGfCWLf3G4IUAYjjzKxmYZ9NZCf7VBlJhIKzzfS3zfeNXwU1IgrtjiONVeHK5ilQlOuLzT6CZ+4r64ynhePghXO7Ps5xwCAdTlly0B6dNFNVm5Hlok90uHPcUNkOXGEzXtsT38dXhJSVykyeo0UlnpvIRCo+LuKqwKMlY0KXPJt7JTNEY9w8lMX4ttWzRr1j2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDxaw/c+RqHUnZ8gksJuimafw04no1Sl+VNFdaQb/DU=;
 b=Tva3Hjen3EYsuSj2Eg2Yo2tCYLvEhtSIcvWb59nTu7NGlt7tP5jirZ9crqejdtfBI9nctRFb3QFevaSBd911CSQ2cMsH+b/uL/WysV8ut6B2rcc9wra/sdlLzRyZjoUA28Mg+wAD1fB5qKlzwQqEIbH9oy0fh9LfDZIM9fmSUb3wnYPZdlAAhsbPbIeYGgUNL8Dc4RSQ5cJcc1sYQoYpMar3UD2hNLOgTvxDjjeh0HEqADn1lJ/FKZFa8AI0qGkzE0OQyw8SLXapVj77lQ46VoNIKZH/0uNstEnmjhGcpbmmKKgkleGk6mjRtvuMFYF2grnI/1C7djo0keUkeTOKLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDxaw/c+RqHUnZ8gksJuimafw04no1Sl+VNFdaQb/DU=;
 b=o6iXFmECe+kWYVmYu7R/yIvfbkGI/5Mxh/KweJQncrg+xRu/rwZKWO68F4gU3y7EwuwSB0PVEBXfjkW3ty4kTadkLa4i2LO4YFyyQWIrx9QjioL6WVOFI2EBQNJyNDaKB1UFwsEW48aDDXcfn8gplcSDs6Kdi8ApO2/71LMdwIs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian"
	<Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHbziMOHCuaHG697kCTYWoBETQpzrP0lKSAgAGsWwD//4WWAIAAI9IAgAUkMwA=
Date: Mon, 9 Jun 2025 07:50:21 +0000
Message-ID:
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
In-Reply-To: <aEKxWLdDDyzmNvGF@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8792.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB6491:EE_
x-ms-office365-filtering-correlation-id: 132bc3bf-33a6-4b4a-5497-08dda72a496f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bEl4em5VdkVVeUdoWmgzQS9WdEFraXJEZjl3V2pVZFYyWEcrQ0JZeFlYZk5l?=
 =?utf-8?B?UUVJVG5VU2hvc2tQbTJtRC9PZFNRdDhXbUMwbE5BTmtMaFdkTnZ6enhHajlh?=
 =?utf-8?B?YktVM2xWZFZWUHRkajJTRTVidS9QN3hweFJ2eTUvM25oZVZXYVA4cFNRbWM0?=
 =?utf-8?B?NmRWNkZnTzBoNVZsZEl6RXZ5aDZRR3VUQ1NxNldLSW9hekVVZW9iN1ViUmhx?=
 =?utf-8?B?SVltc0NQem8zdktmbjAzZllUTFhKN01nb2hxeGlyR0F5Nmdpd2NBckxyNlZt?=
 =?utf-8?B?cnkwRWJYNVRvK21pRUpMNzdkNVd3Y2FMQXFsdGRIRDZvbjRQZThmMkJYc1dU?=
 =?utf-8?B?aFFhUUZqZEJQVmQxMnhtajNBQXhIaUNrTjJReE4wMHV3cm9WdCt2UEpuZk82?=
 =?utf-8?B?L2cweGE1Vmd5aWJ6RUxNMXhSZ1RWTmw1UlNlZXo0bHluaThScmU3ZTB2L3Zj?=
 =?utf-8?B?Q3Frd0M2c2JoYlJqdHFzQ1IvN0hXRGY0ZUc0WWxRSm8yRm8yM1hTY2ltSVQx?=
 =?utf-8?B?ZjdyeGRYa2cwdDhnZG9lb1Z1Mm5lSXBjN005a1kzazNxd3orbGtzVnlVMzJL?=
 =?utf-8?B?Nlkrem1MM1REMkVEcGt5ZTRhanl0Sm01T1pJbXdUa1VmemJEUXVsN0thcEp5?=
 =?utf-8?B?ajRlV1cvSFVOUHRwMHhIVlpLSG5vaFRIdWJVMEpwaEFnRy9KQ2Z6aHQ1SmYw?=
 =?utf-8?B?eU8zMFJHREVQbXkvNXA1MkpDZHVKL1ZndHQ5eUd6YVhIZ3NzOExqbHczT28r?=
 =?utf-8?B?cEdXWVpOZTdueDd1TWl0S3YraXcwZmNDTlJ0S0J2OFdwK2h1OGora2M0ZHdz?=
 =?utf-8?B?SVVrYWlET2JoRzJxMFdhYm5ONXpoVEQveEVUSzRXQzNyNHpoTkVrdmhTQTVq?=
 =?utf-8?B?c0UxUGZJdUJ4aWp3Tkova0dnbU9KeG1SZjUybHE3bDFzeGtjbGUvL0lrOTJs?=
 =?utf-8?B?WFBWNVFQYlh0MHVBYnNQMzNRSnRRY25lUVJuZjlqNnVRM290N3JqWnAwZkJu?=
 =?utf-8?B?MVZ2bG5Bc2F5aEhhaHNiemZ6N3F4L3VrNlVXMzVtYlJmUFRBMGliaDVNU3Ji?=
 =?utf-8?B?bldhS2tuYVBSRXI3dWM4b0RiRUl4NWp4WTRQS2xaNDFxeEJud0l3a0g2bWRJ?=
 =?utf-8?B?TTBnQkxsU3A0UEl2RlVxcmJGSHN4bWxaK1ArWm5SMWkwSW5JMDM5aFVPTHdj?=
 =?utf-8?B?M0VpeDBwNTF5eUp4MCtSci9aK0cyOVZpblZ1cE9JRXQvL3NGVUtJdVNOWlJY?=
 =?utf-8?B?dTY1K2ZSaHRWQXUvQnZNemRxRk51dGpwc2I2Z2xyTW9waFA2a3ppWFl3RzMz?=
 =?utf-8?B?Rk0vOEdxdGhFWG1kYldkUjVQTGk0THZ6UEU4MnFrejlqWXN5QXRIbzhkS2c0?=
 =?utf-8?B?RS9zRFR3U1IyclRZbG9rcWhLS3N3OXJaRkJWTFFIelhjN1U4KzdKa05uQmpk?=
 =?utf-8?B?UHhGWjJibWpMYm5ONjFGWTE2eVA3ZFZIVmZ2L25RcStIYmp5S3B4Z0dhalcx?=
 =?utf-8?B?RkdnZnF0R0JFSE8wZ3BCaXBOOU0yMmlVa1RudzVXbmk3aHFvcW56OE8yaHZt?=
 =?utf-8?B?a0ljbFBlTGh6b2VML1JnV1J0Tjc5QVdBbFEyRWlLSk9JVDY0c1l2Sk5qWDE2?=
 =?utf-8?B?TURSZEdiaE14YWZFMzcvK212MDhYQ25UYTEyS2JNcTBCYW5RMUtIeTNIOU84?=
 =?utf-8?B?UEt2dEErcEhCeWxyQjVuZU9uNE9RNFlQbnVmUGFLZVQrTXRVNDRXZFZFdk9K?=
 =?utf-8?B?WE5JaDRBdkhwWEkzdXZ1cm91MnRFQTN0a2Vjb3k5a1RmRjBxSldvdTgvanRX?=
 =?utf-8?B?ODU2SUl2dE1HemExcW1sRHhKMTBlTGloTTBvejkxM1I1a2tSWmdGRWhxN2Ew?=
 =?utf-8?B?K0RseXowQVdxa3Y2ZnRYR1B2dnRHMVBPZi9RbzAwQlJtNGxtMUcveW5Ha09n?=
 =?utf-8?B?eENJYzA5TUQvYTRVL01Nek1EbUxuMEQ4MEdTSWxWVmNkSU82S0R0eUk0YUM5?=
 =?utf-8?B?YnFJSDlPbVZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTBFYU1yWCtCcHM4ZGNYQ3hwYmNVVzVNMU5haHZ6NnAxSGh0a2JpbUlGTGky?=
 =?utf-8?B?MDZ2VnZCYTB1QThmdFlmZHljRWcwbXhYa2VHbmdHZlR1SnQzRDRKNmIzc3F6?=
 =?utf-8?B?a000UVZTZ1djaUQ2L1FjTEtkSk4wZDBKS2N3ZHFmSy9ERFpHSFJIaGprcjhU?=
 =?utf-8?B?TFZqdkdGWVpwdlhHdnFqNm05ODlRZm9QZ3NsTEtYRWFWaXVCYnFlODBUSjla?=
 =?utf-8?B?dVdEYzlpQ0JXamN5dmlxckk2WmoyWGkxczZ2cGRmNExHeDg4UVRXemc0NkhH?=
 =?utf-8?B?b3dzMnZGNHdjRitTdjVQdWk5VHFIdW12eWxQVTk5WlVvWTQxVWtKSzFIYWFT?=
 =?utf-8?B?TGd0QlBiYTZuUHlrM21tb0t0N2hRRFZXeFNtbFAwaEVPVFBKRVJjcEtQd2tZ?=
 =?utf-8?B?NnlEMkRaZE1wcWdNVVV1NG8rSjFhM3BvRXhuRlVET1ljdFBSWTc0aHcwZHli?=
 =?utf-8?B?YXJ4OTA0NThrTjVBRTdic2Y3Tzd2QnQ2OUtYcUExdG1qTWZXVDNvM0FjYUk0?=
 =?utf-8?B?MHRYYm5xVFRpeHJEcVBUWkUvZEJPMk9pdTBEcnVPWkpNa2l4aEpYT0hWMHNk?=
 =?utf-8?B?S1RwVE9Fa3Y0aEIxME51SW92UWYxSkNkcDEybVJXUmQ1KzVJRTZUbnREaXJE?=
 =?utf-8?B?Z2FDME1mY2JKQVo2cjh2T1N6UWZmQmlQM0dhb2d2eWwyWUZxSW12Ry9CUGpj?=
 =?utf-8?B?RnpOd1VMWDh1ZXpzWlZJbTlVTksxM1ZBR2dPTWhRWmQzVldPdHZXb0xTMloy?=
 =?utf-8?B?ZTdZNDkwTURUbi81WGxKTngvbjZkOUFDVlE0aXhPZTRKaE4vRkJhK0padDNR?=
 =?utf-8?B?MWRkVStiMG5vVG44NkNLZUQyYnJETWVrMktWSjB1UW5LNFRpUSsvb3FpQ1J4?=
 =?utf-8?B?RjFDNVVoZHJxSU5wQ2NnR3JqeENnbFJkd01aQjVHSVlKanRWYWxtNVhzUnU2?=
 =?utf-8?B?UlIvNGwveFZYR3hWeEZaMWMyTmsyc3VLeWY5NzMzN3NISGk5bVFHVWVGZWQw?=
 =?utf-8?B?dDh5THZPd0J2U2xvNjhHSFBFK21IaUhMUUEvaGZpQk5MYzcvSC9GRStEQWpp?=
 =?utf-8?B?WlViNHhvT1ZFRkF2bTdTWWt5dkhlWHNTTklYUC9JZTh4WmhYMEVwWjg2V2JZ?=
 =?utf-8?B?R2o1VWhLdFdaNnJIaUR3UUVSOEowWVJ6SFB6bTZPeGpJczJOdjhaZExaQ0F5?=
 =?utf-8?B?Y0JPbkhzbDA3N29yLzBLbmh1SWRmKzB1WDgyRjFJNlVyNE92OUxGM1ROM1Vt?=
 =?utf-8?B?WWhrK1pOWmNOQVJlTnJQVEFlb0hsUGluOXhiRG1JTTgya1Z2MzZWTCs1TGJH?=
 =?utf-8?B?RitLMVd6a0s0UXlPaVRTZEpOaXpZVmZoZTdncnYySFBpck1tSlJ0VFVBdGZl?=
 =?utf-8?B?UGJjaEhpOXdZaE1XSzd3Q0JqR2piR0E5YzJQdTJyalJHTWNtSnZDbFRjQ2lZ?=
 =?utf-8?B?cnVQN3NvYmtyOUp1NnNvUjlEMDJxbkRmajVITkdpMCtrM0tiUG5qQnZnQWQ3?=
 =?utf-8?B?bzdXVjFkcEFTbHlPT1Rta3ZPcGtNTDlybnJGTUJnbFFJS0R0Y3hMSmE4T1Vq?=
 =?utf-8?B?RGRmWGhxYkhzcnBON2g4YUdkZEEvVWNFZ0dUditHYk9wUmpQeUY0L2IvbUN0?=
 =?utf-8?B?YUxpVFloUWswMTRBMFEvWWwzdThpemhJUUNRTFkzaFVBU3F0ejQ3OHFBVkhv?=
 =?utf-8?B?T24wSGd0YWZZM0V2THpFSVo2cXhJTjFoRTl3R1BQcGZKRFFhdnJhT2dxVFJF?=
 =?utf-8?B?d0JxdThYU1pPK3NCTnJ3Y2QxeE0rajNQWkpvcWo2aGxDNXRZczVoQWlsbkM3?=
 =?utf-8?B?L3VLYUZCSTd1YmhzTkduUWJiZkxSbCtBZkhpWldpVDdXQlU2bkxxR0svb2Z6?=
 =?utf-8?B?dElzOS9kTlViZHVjSDVKV2JpNzBuQVFLTGlRVXVJN0dBOFMrSFZRM0drbU9l?=
 =?utf-8?B?K3o5ZzZxK0tQS2xTQk13dHhNMTAwNmpvSGpUdlJKMHo2VlovNXBKcEx4YWhU?=
 =?utf-8?B?dGw5QlYyYkJmY1ptSmtQcGpmR0FLL0JQWEJlazgyYnVzMmk0eGdCajlHbkMr?=
 =?utf-8?B?Uys5ckprK1A3bi9vcG9GZnV0S0k2N0wxZVpXYlNzakQrM0R5Snc5YVB2Y3pD?=
 =?utf-8?Q?esXw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4355642E3E1139448B27D97C77AADB25@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132bc3bf-33a6-4b4a-5497-08dda72a496f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 07:50:21.8543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l0GJYLN3FB1vASO4HYJScxd5eMdqc+UzxAt3hGe5jSxQ7rYSoS90Pti2j1JIUc4xSEXGs8ikgmaod3temIOMbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491

T24gMjAyNS82LzYgMTc6MTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIEZyaSwgSnVu
IDA2LCAyMDI1IGF0IDA5OjA1OjQ4QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24g
MDYuMDYuMjAyNSAwODoyOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+IE9uIDIwMjUvNi81IDIw
OjUwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBPbiBNb24sIE1heSAyNiwgMjAyNSBh
dCAwNTo0NTo1M1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZTogDQo+Pj4+PiArICB9OyBcDQo+
Pj4+PiArICBzdGF0aWMgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0IyNfZW50cnkgIFwN
Cj4+Pj4+ICsgICAgICAgICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEudnBjaSIpID0gJmZp
bml0IyNfdA0KPj4+Pg0KPj4+PiBJTU8gdGhpcyBzaG91bGQgYmV0dGVyIHVzZSAucm9kYXRhIGlu
c3RlYWQgb2YgLmRhdGEuIA0KPj4+IElzIGJlbG93IGNoYW5nZSBjb3JyZWN0Pw0KPj4+DQo+Pj4g
KyAgICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0IyNfZW50cnkg
IFwNCj4+PiArICAgICAgICBfX3VzZWRfc2VjdGlvbigiLnJvZGF0YSIpID0gJmZpbml0IyNfdA0K
Pj4NCj4+IE5vLCBzcGVjaWZpY2FsbHkgYmVjYXVzZSAuLi4NCj4+DQo+Pj4+IE5vdCB0aGF0IGl0
IG1hdHRlcnMgbXVjaCBpbiBwcmFjdGljZSwgYXMgd2UgcGxhY2UgaXQgaW4gLnJvZGF0YSBhbnl3
YXkuICBOb3RlDQo+Pj4+IGhvd2V2ZXIgeW91IHdpbGwgaGF2ZSB0byBtb3ZlIHRoZSBwbGFjZW1l
bnQgb2YgdGhlIFZQQ0lfQVJSQVkgaW4gdGhlDQo+Pj4+IGxpbmtlciBzY3JpcHQgYWhlYWQgb2Yg
Kigucm9kYXRhLiopLCBvdGhlcndpc2UgdGhhdCBzZWN0aW9uIG1hdGNoIHdpbGwNCj4+Pj4gY29u
c3VtZSB0aGUgdlBDSSBkYXRhLg0KPj4+IEkgYW0gc29ycnksIGhvdyB0byBtb3ZlIGl0IGFoZWFk
IG9mICooLnJvZGF0YS4qKSA/DQo+Pj4gSXMgYmVsb3cgY2hhbmdlIGNvcnJlY3Q/DQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3hlbi5sZHMuaCBiL3hlbi9pbmNsdWRlL3hl
bi94ZW4ubGRzLmgNCj4+PiBpbmRleCA3OTNkMGUxMTQ1MGMuLjM4MTc2NDIxMzVhYSAxMDA2NDQN
Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4veGVuLmxkcy5oDQo+Pj4gKysrIGIveGVuL2luY2x1
ZGUveGVuL3hlbi5sZHMuaA0KPj4+IEBAIC0xODgsNyArMTg4LDcgQEANCj4+PiAgI2RlZmluZSBW
UENJX0FSUkFZICAgICAgICAgICAgICAgXA0KPj4+ICAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJf
QUxJR04pOyBcDQo+Pj4gICAgICAgICBfX3N0YXJ0X3ZwY2lfYXJyYXkgPSAuOyAgIFwNCj4+PiAt
ICAgICAgICooU09SVCguZGF0YS52cGNpLiopKSAgICAgXA0KPj4+ICsgICAgICAgKigucm9kYXRh
KSAgICAgICAgICAgICBcDQo+Pg0KPj4gLi4uIHRoaXMgaXNuJ3QgLSB5b3UnZCBtb3ZlIF9hbGxf
IG9mIC5yb2RhdGEgaW50byBoZXJlLCB3aGljaCBkZWZpbml0ZWx5DQo+PiBpc24ndCB3aGF0IHlv
dSB3YW50LiBXaGF0IEkgdW5kZXJzdGFuZCBSb2dlciBtZWFudCB3YXMgYSAucm9kYXRhLWxpa2UN
Cj4+IHNlY3Rpb24sIGUuZy4gLnJvZGF0YS52cGNpLiogKG11Y2ggbGlrZSBpdCB3YXMgLmRhdGEu
dnBjaS4qIGJlZm9yZSkuDQo+IA0KPiBJbmRlZWQsIG15IHN1Z2dlc3Rpb24gd2FzIG1lcmVseSB0
byB1c2UgLnJvZGF0YSBpbnN0ZWFkIG9mIC5kYXRhLCBhcw0KPiB0aGF0J3MgbW9yZSBhY2N1cmF0
ZSBJTU8uICBJIHRoaW5rIGl0IHNob3VsZCBiZSAqKC5yb2RhdGEudnBjaSkgKGFuZA0KPiBzYW1l
IHNlY3Rpb24gY2hhbmdlIGZvciB0aGUgX191c2VkX3NlY3Rpb24oKSBhdHRyaWJ1dGUuDQoNCklm
IEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZSBuZXh0IHZlcnNpb24gd2lsbCBiZToNCg0KKyAg
ICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0IyNfZW50cnkgIFwN
CisgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIucm9kYXRhLnZwY2kiKSA9ICZmaW5pdCMjX3QNCisN
Cg0KYW5kDQoNCiAjZGVmaW5lIFZQQ0lfQVJSQVkgICAgICAgICAgICAgICBcDQogICAgICAgIC4g
PSBBTElHTihQT0lOVEVSX0FMSUdOKTsgXA0KICAgICAgICBfX3N0YXJ0X3ZwY2lfYXJyYXkgPSAu
OyAgIFwNCi0gICAgICAgKihTT1JUKC5kYXRhLnZwY2kuKikpICAgICBcDQorICAgICAgICooLnJv
ZGF0YS52cGNpKSAgICAgICAgICAgXA0KICAgICAgICBfX2VuZF92cGNpX2FycmF5ID0gLjsNCg0K
QnV0LCB0aGF0IGVuY291bnRlcmVkIGFuIHdhcm5pbmcgd2hlbiBjb21waWxpbmcuDQoiIHtzdGFu
ZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNzYWdlczoNCntzdGFuZGFyZCBpbnB1dH06MTE2MDog
V2FybmluZzogc2V0dGluZyBpbmNvcnJlY3Qgc2VjdGlvbiBhdHRyaWJ1dGVzIGZvciAucm9kYXRh
LnZwY2kNCntzdGFuZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNzYWdlczoNCntzdGFuZGFyZCBp
bnB1dH06MzAzNDogV2FybmluZzogc2V0dGluZyBpbmNvcnJlY3Qgc2VjdGlvbiBhdHRyaWJ1dGVz
IGZvciAucm9kYXRhLnZwY2kNCntzdGFuZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNzYWdlczoN
CntzdGFuZGFyZCBpbnB1dH06NjY4NjogV2FybmluZzogc2V0dGluZyBpbmNvcnJlY3Qgc2VjdGlv
biBhdHRyaWJ1dGVzIGZvciAucm9kYXRhLnZwY2kgIg0KDQpBbmQsIGR1cmluZyBib290aW5nIFhl
biwgYWxsIHZhbHVlIG9mIF9fc3RhcnRfdnBjaV9hcnJheSBpcyBpbmNvcnJlY3QuDQpEbyBJIG1p
c3MgYW55dGhpbmc/DQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=

