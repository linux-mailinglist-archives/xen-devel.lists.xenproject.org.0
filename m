Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C45AAD39A
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 04:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978112.1364974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCUrf-0006Dj-2q; Wed, 07 May 2025 02:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978112.1364974; Wed, 07 May 2025 02:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCUrf-0006BK-08; Wed, 07 May 2025 02:50:31 +0000
Received: by outflank-mailman (input) for mailman id 978112;
 Wed, 07 May 2025 02:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCUrd-0006BC-Ub
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 02:50:29 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087cf8cc-2aee-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 04:50:28 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 02:50:19 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 02:50:19 +0000
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
X-Inumbo-ID: 087cf8cc-2aee-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQft6yhcAAvpAlK8aBfQ+g2eljX+QhigfH/XYjHHeGyzSickQnK8qesxsry/LqAFPYSiBBG4ZQPdg6P77ozYe4RfW11CYOkgLXHmABo7DEAj6o4p9BdAwW5TS7GLVEUiono5w/iFSz0DaQ3fpG3TAdtmSQYpwAThe0lq9dgUdZuB7okym6Zev2bRpDD1VAsM0BWM3CyqKK3ziRtYqfqNcHAkgaUufa615D4smjOIyuL3CGG2HD/zPSGbI6tHgfTsPLrH2WLNZ6704//7jXrb6Fq5HbAtTR6cMgiYKYV/p8XN/MjmWVWy17oU0RUpIeTPYor+Weu6r2JokI4EYuueIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhQ+or2CjMpMGn7G1uA69vlG590bZ040e5Cz/LDHhaY=;
 b=iAxQaVhB+q07P2yIBFhpmZwCwVb1WEDwzHYw5LD3VMz/94C0GmbB40x1MHLtae0u8FDkClaFIaD9DsPIhXhyvPnj8OqnTn2PefcoC4YY5Si/c3VRiwLpGfyqjpOPX712r5eWFh+x9bEBsS6dJ9D05zPpGd2V8bSINVTGwhYFwt2UlEI/V8H1AM3+TNg9qdAsLUCWEy0R9DB9pEzDQtY0kDRwxhWMFN+2YbAO6bOvbBhcw1uU4VLtvzNShGdbbvUb9D+OlYSucF5CSu8vMUyZbZt4jrTMM+D1NtyZI49sswrzCFP8A+dpWnJeJdUK4QTV+TPDNIWA8EnISnQNmvE58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhQ+or2CjMpMGn7G1uA69vlG590bZ040e5Cz/LDHhaY=;
 b=H5T+GXopw03ZXbrPkZxiYSJ5Dkyyq4uWtHIVwgf/5YWNtvJvmcjEukh6FY6g/cHuBacdMKHGm3OSudFXydEsRKaP3SwQ2fbcDDKo1oII2+Q9hgsRaq4dPZkNnbX0mFOd9mEExKbI+Gy7rlmOLIe+vtqQ1FGxJ4XWQMUazfhV/Io=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Topic: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
Thread-Index: AQHbsoVY0As/JNC0IkWc2g8aH+9wh7PFtqAAgAFbx4CAAAPaAA==
Date: Wed, 7 May 2025 02:50:19 +0000
Message-ID:
 <BL1PR12MB58490A8F756885F404C68951E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com> <aBoTqCf5y_LXzZdb@macbook.lan>
 <BL1PR12MB5849A7D00734B43A38F14D10E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To:
 <BL1PR12MB5849A7D00734B43A38F14D10E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ1PR12MB6266:EE_
x-ms-office365-filtering-correlation-id: c16f5310-c8d0-4538-2317-08dd8d11e764
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eklvVHBna1BTV29uZ0pibWl2cVkrNWM2QWVBNHE4WUN3RnptMkZDMXFBL2di?=
 =?utf-8?B?bWNyby9aOXVPUzFTMjl5bW9kVURlMXltaWFvZ3AvUHFmK1c0Zzlqdnh4QUEw?=
 =?utf-8?B?NWhWdVV5blJTa253OHRSVmFBcHdtUFJUSFF5eGptZVdPMjdXS1R3Q3R0R3pk?=
 =?utf-8?B?dHJubGZwbGRNL09NK0h5RWllbGppVG5sK1ZxVDUyTGVCVG5GRGhjQjlKWFRB?=
 =?utf-8?B?Ymx1N0dWa0tnR2VjY1oweWY4MzVFYi9EYWtlUW81YkVKeEhENkZSZTVUV2E0?=
 =?utf-8?B?U0lkbDVGcm44akJLYXlRcGNHNlM1RFNUcnBjeFJ0ZUZMOCtZN2k5QkNGUUpP?=
 =?utf-8?B?YjAxUEpqQ3QxQmhMVUlnNkRCdjJQTjdYNy96YjRqZXpYS3FmUEVVd1NULzRt?=
 =?utf-8?B?VFlXNitFQ3Jicnd1UXZwN1FFaXJTMXJldnJyQ3ZBWnZYUUFBd1d5UW01UEtP?=
 =?utf-8?B?TExjeTIzRTduMVBnaFliNEZTWklrOHU5QUVmZ04xVllHVzgybms4Szg5cERJ?=
 =?utf-8?B?dHVLZ3kvaVVSSVVyeklvOWNZY0dvRTNaVDBvekhFRlpjZlJSYzVCTlNzWHFD?=
 =?utf-8?B?dWdwNHRqUWZiMTlKRDdSVnZpSGZJYkpPWUNUcFgydU9WVlp6aXo3c3J3aVlK?=
 =?utf-8?B?QzRKUGkrOE05Yk9oM1hUdEUzWlowVFZIaFFvRUpreEdDMjQwN3hENytHK21j?=
 =?utf-8?B?RkRnMXFVK3pVSHpCMS9Yd254MEpKSk1LRGpDczBpYW9UdFpyZmI4Q3JZNGRI?=
 =?utf-8?B?TUtJdURwV2VZZGJTN3ZsUk9GWFB3ZzVLeCt3bmpCYW5PRWY4djFmK1NNL1pQ?=
 =?utf-8?B?MXVrcWgwd3hnYjRQUDN3aElSNW5CZytiZWpRbVMyUkVDV3FIRjg0L3BpRFpL?=
 =?utf-8?B?VWZ1NHNKeXkxbUtMQ0t6alBMTitzN24zWlFuQkFLN1FTVkl5M2VlUk1KTEhn?=
 =?utf-8?B?andyVGh3N0tqcEJOVExwYzQrZjFlanFISUUzcytqZkt4dlBjbHRBZVhDdEQ5?=
 =?utf-8?B?OGhYRDRnejRQWVJtMTRhT2wrMzF4cisxUDRqNEtvVjVEM20xcEZuSFhla1Y2?=
 =?utf-8?B?bGluZ21Ia3h3WThZVDgvaUQ5L3Flek5QREJDQ1gxWTNLRGhtWTV0RWNqS0hC?=
 =?utf-8?B?M2FXRW5GM2liNXdEM2lCazlhbnJjZTRKTmN2YURSN2w3bTNDWVIvOWZ6WnJD?=
 =?utf-8?B?Vmt1MXF5YUcyRzl0VEtyN3NyQjRlMUUxK09lUUhtZkxJYW9uZW5vUmNsOW5Q?=
 =?utf-8?B?VGVWaW9GVTZMNmJxQzlYZDgzcWJMYkU5ZGpyekl2ZDc4OW1URTVicEt1RHlD?=
 =?utf-8?B?ajNTRHVVa3FDTkRBTkh1ek1WRzFubkQwUDgzcHVHTzBYL3pEaW1JU2tCV1VV?=
 =?utf-8?B?am5seTNpWno3eW9LcGdOeEdzUEZjRmUxWFg0a2gzeUNCd1h0eUljSXFlMHlU?=
 =?utf-8?B?QmdpV2VBM2tKTE44N0pXQmZsR1hEdElMRmlXT1hCTmRraXFhdmMvQjhna3Ux?=
 =?utf-8?B?b05qS0RrTGhKNG1rWUZwWXoyOEZDcGZuQURPb1NnUUdnTDltNE5uT1kyclRP?=
 =?utf-8?B?TmpsQkp5aTN4S1J5RXE4SmRSemM3SEFPY3cwM2N5QzdKRWg4NExlZlp5UUpy?=
 =?utf-8?B?elo4alJocytQWkErNGZLNzhTVHhhRm4zeWhib0pvRzlFaWNHNTZhdHp0UmdU?=
 =?utf-8?B?SHlwSFQ5a0tzM2w2cjNrc1lucHk1SWJsVk1PeStnaFkyMUVydUR2VW5QL3lq?=
 =?utf-8?B?cWlsM2dpMThMRkpvMnJ0dVFkclJUWFJFMnZHN2hBYUExSHUzODF1YXhqT0NR?=
 =?utf-8?B?VkVaaTZuK1lBV1R0bDFJT1NLVjRMbG1xUmorVFdYb3RxWHl0VnJzU2l3a3M1?=
 =?utf-8?B?YXVIcWVQMmlLQXkwODdIK3R1dWFaWXowTDlVNExwdVN3L0dReTZoMnI1MjdU?=
 =?utf-8?B?azFRNDNiSEEwSnNPMHRiNU1Xczl2WEN2TVR4aUZZUEIyS1pjR09vL2owY1pB?=
 =?utf-8?Q?nJV3J15UW3TMTxlR66xCm63XyDE1z4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDEyeEdNT0M1bW80WVdKYW45N0xnV1hpK2JUbmVnbDU2UysxdXkxSUZOc1Er?=
 =?utf-8?B?YnZSVUxueFhkb0lVUnVxZklBNDRCb25aVjJmeWRYak90RG9WaEx5YStBOXhh?=
 =?utf-8?B?K1VTZVdyOUpKWk5QcmxZbVA1NjIzbGlOWWppSGgzZkVTOURIL2lSVUFma0w3?=
 =?utf-8?B?MzRmZWdzUWhEK2NZYnhkWnNjZ0d0NUxGVXA4dTlEc0pIREVaaU1kQ0xTcE5j?=
 =?utf-8?B?TjcvR3lMZXVzZjlDdEVyRTNMbFZxQm5PWm1vSm82dzFkbHVxKzAza0hRNS9x?=
 =?utf-8?B?UFd3NHVCTkcrOHhWUVFjOUNQcUNaOFNDRDl6SVorVGpWcDhycThqby9Vd3NQ?=
 =?utf-8?B?QTdJNjVqQnE5bXlwbGYrRUc3aUErQVVaRHVZTzR2a2M0aEYwQ3FZRnBUVTVs?=
 =?utf-8?B?L3J3Sy9ja3luK0hoS1BKbnhBeExiQW9MR1VlLzM3NkpBcldNYm1HaXpDUWF3?=
 =?utf-8?B?b21GOTNxTDhWMWZrTk5UNGlmQ3ZBK3Z2N3ZISzV0Z3BDN2xmVlBraS90ZWMz?=
 =?utf-8?B?VzNSV081Y3hBdVdPNDVpem1FVzVEdmVhVDVVTU12Zmp4MWQ5bGVNTGdsQ1Ro?=
 =?utf-8?B?MTlneFU3NWhlVTV4K1ZhNUdpdEVHSzVWbTllY1pUS1BxaTBhaGRjUHZkSmRp?=
 =?utf-8?B?UHgvVDV3eVI0YXR5WnRqakpWVkMxTXBjVmdoZE9JWHdnVjhvRU1TY2pIdDAw?=
 =?utf-8?B?NHVReFdDS2lyaUZCckFCYm16NE5uenBad0ZERXdZOTdYRHFDWUt6ZC92OUI1?=
 =?utf-8?B?eXR5cy92TFd2U2hhWDBLd0duVFhzeXZzMUNJSlRFbVl3M0Q0RlBDeFNoRUZY?=
 =?utf-8?B?bzdFOG0yaU5hcjdmOVJ0WXNDa25WZjFoRVlJbHlWR2FmUE9YZ29ZeUw2TTRq?=
 =?utf-8?B?SzlsdDBEbFl1cUhTSVgweEQ0TmVjTk9NWXJadkNtWnQ3cUJ2NnBmZUFtUUFN?=
 =?utf-8?B?UXZ0blBSeTk2Tm8wWjQxVVhaTkllMk82Mml3K0JiZmRDOTVjNEhUZzJoajZz?=
 =?utf-8?B?a1NsTTh3WGJHV05TRWdYbVVPQldjTmltQU1jZk56WkttYkdSa2VOZE1ha3pj?=
 =?utf-8?B?azRZYm9vUjB1YmU3MEF0S0I3V0YvZUREZHpZVWswcWhHK2p0cWZkeHpNQTdB?=
 =?utf-8?B?TGlrQnlpa3N2a1lqQWoxTVgxUjVmSmhETnF4VndNVDQydUxyU2UyMkZIS09s?=
 =?utf-8?B?WXNuVzlXYk55clJsVWZJMmpXOVZFQ0VTTG1xQm5rajhuaE9mUGI5RitRbHlj?=
 =?utf-8?B?SElZR1JxZVg1aDVJYmw0OWV3bGhEcmFRUFFSaGNwTXV6bHp0dUxwV3VoRjJM?=
 =?utf-8?B?UjdKZUdrTjFXQmNUbWJKS1N0Yys3eWV1OVJneFBVVjAxd0RKeWZxYmZVS3hr?=
 =?utf-8?B?QU9WRmQwejdta0UwWlRyQlhicGt4MS96MkxUK2RHV3M4dDdaTkx4SHlQQTlk?=
 =?utf-8?B?d0xpQzFhYVNtcTRJVnBrbncrZDVCUFU1aGl2MWlPOFFQenVHUnlmNmREcnZU?=
 =?utf-8?B?OUdkVDNRYUo3SDBPWHJnNFlKTzVQUzhPMmxVZTQ1cW1RUzU1ZlRZRlpWWG1j?=
 =?utf-8?B?K1hDS3ZuWXAwRVFOQ3VSQUFsYVRzVUpheG1rMGk3bkVVVGVBV0FHYytiRXRC?=
 =?utf-8?B?QjdDRkpFRUVadTNjTE5FYkFuUlBuQlZqdEFmVHRiQmRuRElMVENlVC9pSkhM?=
 =?utf-8?B?L2ZDMysrckFQVlUxS01nTFlhSWJWZUpHbzhqQ2x4OFN1WmRZZ0V0bkVmRDAx?=
 =?utf-8?B?eGpxL09sSy95ejZBaUdqcGFHcHFiTjFqUzBGaEJXZWd3Vk5CRWVwTGxTRUNj?=
 =?utf-8?B?QktvS2NTUlNnTEVJSDJ0V1BId2cvU2RYZVV6ZzJlMkcrajc2Sko5dWsrM2F3?=
 =?utf-8?B?Yy80bnV0Y1hwUTJMYVJkSnJ2MG5IN1VZaVVsOWdJSlpDMGVtYmtnVy8rNjFL?=
 =?utf-8?B?Um1Md2tKWVF2YTliVUVybVBvQkVVSHdvNThOTE9IZUZlaGhmUGNuYWpTR3FL?=
 =?utf-8?B?V1lYKzl2aTdQR0R6azUxZy9oWTEwdWk0Tk12VWhUZWhwYlJ2VmJkM0craTdF?=
 =?utf-8?B?c1RGQW40UmlIUE5zY2JhTTRWUTRRQ1VTM1NXSGhLR3BSTi9tcUNtbXh0akZ0?=
 =?utf-8?Q?9QBA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E874C84B3E4FB4CAD1DDBECCF0EC189@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16f5310-c8d0-4538-2317-08dd8d11e764
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 02:50:19.2009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cy4RyCTkVHtkGVKEEZeyqF+jP5UEeKbgqkNHrcGTpI6ZLrO2l9uj1iNCBZyPMMpCA/U1jrtWePFtoXExmI2dxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266

T24gMjAyNS81LzcgMTA6NDYsIENoZW4sIEppcWlhbiB3cm90ZToNCj4gT24gMjAyNS81LzYgMjE6
NTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBNb24sIEFwciAyMSwgMjAyNSBhdCAw
MjoxODo1NVBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+PiBDdXJyZW50IGxvZ2ljIG9m
IGVtdWxhdGluZyBsZWdhY3kgY2FwYWJpbGl0eSBsaXN0IGlzIG9ubHkgZm9yIGRvbVUuDQo+Pj4g
U28sIGV4cGFuZCBpdCB0byBlbXVsYXRlIGZvciBkb20wIHRvby4gVGhlbiBpdCB3aWxsIGJlIGVh
c3kgdG8gaGlkZQ0KPj4+IGEgY2FwYWJpbGl0eSB3aG9zZSBpbml0aWFsaXphdGlvbiBmYWlscyBp
biBhIGZ1bmN0aW9uLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlh
bi5DaGVuQGFtZC5jb20+DQo+Pg0KPj4gU29ycnksIG9uZSBuaXQgSSd2ZSBub3RpY2VkIHdoaWxl
IGxvb2tpbmcgYXQgdGhlIG5leHQgcGF0Y2guDQo+Pg0KPj4+IEBAIC03ODYsMTMgKzc4NywxNSBA
QCBzdGF0aWMgaW50IHZwY2lfaW5pdF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQo+Pj4gIA0KPj4+ICAgICAgICAgICAgICBuZXh0ID0gcGNpX2ZpbmRfbmV4dF9jYXBfdHRs
KHBkZXYtPnNiZGYsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG9zICsgUENJX0NBUF9MSVNUX05FWFQsDQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3VwcG9ydGVkX2NhcHMsDQo+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShzdXBwb3J0ZWRfY2FwcyksICZ0dGwp
Ow0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhcHMsIG4s
ICZ0dGwpOw0KPj4+ICANCj4+PiAtICAgICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3Rlcihw
ZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQ4LCBOVUxMLA0KPiBUaGUgc2FtZSBoZXJlLCBOVUxMIC0+
IHZwY2lfaHdfd3JpdGU4LCBJIHRoaW5rLg0KPiANCj4+PiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQsIDEsIE5VTEwpOw0KPj4+IC0gICAg
ICAgICAgICBpZiAoIHJjICkNCj4+PiAtICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4+PiAr
ICAgICAgICAgICAgaWYgKCAhaXNfaHdkb20gKQ0KPj4+ICsgICAgICAgICAgICB7DQo+Pj4gKyAg
ICAgICAgICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdf
cmVhZDgsIE5VTEwsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBvcyArIFBDSV9DQVBfTElTVF9JRCwgMSwgTlVMTCk7DQo+Pj4gKyAgICAgICAgICAgICAgICBp
ZiAoIHJjICkNCj4+PiArICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQo+Pj4gKyAgICAg
ICAgICAgIH0NCj4+PiAgDQo+Pj4gICAgICAgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIo
cGRldi0+dnBjaSwgdnBjaV9yZWFkX3ZhbCwgTlVMTCwNCj4+DQo+PiBGb3IgdGhlIGhhcmR3YXJl
IGRvbWFpbiB0aGUgd3JpdGUgaGFuZGxlciBzaG91bGQgYmUgdnBjaV9od193cml0ZTgNCj4+IGlu
c3RlYWQgb2YgTlVMTC4NCj4gT0ssIEkgdGhpbmsgSSBuZWVkIHRvIGFkZCBkZWZpbml0aW9uIG9m
IHZwY2lfaHdfd3JpdGU4Lg0KPiBCdXQgSSBoYXZlIGEgcXVlc3Rpb24sIGlmIGhhcmR3YXJlIGRv
bWFpbiB3cml0ZSB0aGlzIHJlZ2lzdGVyIHRocm91Z2ggdnBjaV9od193cml0ZTgsDQo+IHRoZW4g
dGhlICJuZXh0IGFkZHJlc3MgZGF0YSIgb2YgaGFyZHdhcmUgd2lsbCBiZSBpbiBjb25zaXN0ZW50
IHdpdGggdnBjaS4NCmJlIGluIGNvbnNpc3RlbnQgd2l0aCAtPiBiZSBpbmNvbnNpc3RlbnQgd2l0
aA0KSSBhbSBzb3JyeS4NCg0KPiBJcyBpdCBmaW5lPyBPciBzaG91bGQgSSB1cGRhdGUgdnBjaSdz
IGNhY2hlPw0KPiANCj4+DQo+PiBUaGFua3MsIFJvZ2VyLg0KPiANCg0KLS0gDQpCZXN0IHJlZ2Fy
ZHMsDQpKaXFpYW4gQ2hlbi4NCg==

