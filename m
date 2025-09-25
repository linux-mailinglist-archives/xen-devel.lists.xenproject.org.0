Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B055B9DE28
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130117.1469745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gdQ-0001YX-7K; Thu, 25 Sep 2025 07:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130117.1469745; Thu, 25 Sep 2025 07:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gdQ-0001Vv-4W; Thu, 25 Sep 2025 07:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1130117;
 Thu, 25 Sep 2025 07:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIiA=4E=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v1gdO-0001VW-AS
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:43:22 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bfe76ea-99e3-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 09:43:16 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB5973.namprd12.prod.outlook.com (2603:10b6:510:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 07:43:11 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 07:43:11 +0000
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
X-Inumbo-ID: 4bfe76ea-99e3-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9xZ+QjAqh6LzqoLVbmBPDKc+sJ4jEifS8x9fNvjl5pEngGoR/nIX9eEnDCc9tkzNfM3vx/Yc3lpOX1VRPRLcxQGcQzcHXFUwbNklpyJyVjmLk0ydTD8if9t62+yw+Evqyrkke00/cV0TzYiGXzo3khYFwMaybHwM2DxwQDsAg/Uvy1JzOvhp9gHTeyHWcmbU8OEX2MY3s8Mo2KxlxxgWjNwVQA0hZrKOBin85Vn0gBgSrsuxO/reiY/NBxOaIp55Fi3EAA4I8Bef84vd+mp6K5mtW4cO1uJy0Eo7hbjBFXGKQULtxPE9fMCj7P+azfRns11m1vDVMht2nZy5eAneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwIPbeGfZniNvdyIZumgValRYfibb1bd9mmv50BqNpk=;
 b=pyPB9VFpPGqOOLh++yyi6fHOShUpttbVFGKh3cVp2x47I/UBNwIkOHlm41HhzLvg9GAJOpG+J9LO3DUcefmPztmSTYLctaWGdnZKD+uGz8vN/WKn0bbf9dn2cW0DEVnMg+cHQk3YaMmr+6XHynL/9vKQQ9zuMOuC84D5D6YFnV6lPlRBZ4EkTvFyZvNVqQ4LST/c7AzyWeis3u0rbEAhS4c296gNwkNZeDukV7GT2ia4NNt/05CAoW8KUuJ9ME4a7QjpD+9vUJ2onVj9H6w+eQy6n4qPRVPxo8W608TrXTi5Gh5747J+ObR0DpNyrjlCR2osmjYMrUhWbNyvlZELaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwIPbeGfZniNvdyIZumgValRYfibb1bd9mmv50BqNpk=;
 b=0e4RYuGWYe1LXaLFivH8HwNesjWsJcpl/OZ7ovW6OM7TYqSdmQR9vLIKLCRr8gnZf74CMSLV2smpVBAs46BWGL4Ffr4C2XtSk4OCPxJ/svye9V9quYUQgaCJUMuvMmTifgMxkVShqi1rmZYIaxs8ofpJGM1Kujzdy6/S85A2k9c=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 15/26] xen/domctl: wrap
 xsm_{irq_permission,iomem_permission} with CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 15/26] xen/domctl: wrap
 xsm_{irq_permission,iomem_permission} with CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYTs0Y1R/o960quInjC4q0w67SN0scAgBXIIBA=
Date: Thu, 25 Sep 2025 07:43:11 +0000
Message-ID:
 <DM4PR12MB8451B3FDE9110E5AFEDC2192E11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-16-Penny.Zheng@amd.com>
 <1bb90323-6071-4aec-9f6f-33163e6f769d@suse.com>
In-Reply-To: <1bb90323-6071-4aec-9f6f-33163e6f769d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-25T07:42:43.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB5973:EE_
x-ms-office365-filtering-correlation-id: be27e34c-b174-4d27-4f30-08ddfc072d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVNwVVpHWXYwdlVjbThnOGw1R1FnMnZuK3B5TWNCbFM0ZkFsQUZHSFhTMmY5?=
 =?utf-8?B?Z01XM0dTSDJqeG9hOFgvMTFqK3Rvb0cyb0ZFY2pnVlVnQkFVdFFkdGJlRENR?=
 =?utf-8?B?bXBQQ3pOVXFzNFo1ZkRDVFZ3UkJ3dThNYTRRdUVBeDdBQWljeWVyQzNFMFk4?=
 =?utf-8?B?Yk90dVpLWC91dElIZHJNaVN3M2pEdUF0QVN6VVVGY2lrVnFZY1hiSDEwR3Ey?=
 =?utf-8?B?NDhyS1UrSmhWUVp6WHpvSTNrNzNEbEZyWGovajNpZWgxS3Iwc0xwa1JrRlNm?=
 =?utf-8?B?TkdoNThrTmpHQTNFUUg2OHc0V1I3UXBQZHltRHFpdmlBOUhyUk0rVXdsK09X?=
 =?utf-8?B?ejg0NVU1bHQ5dEMyUjJHcExFUDlKb0tSVnFPSVFncHNzNTM2RFptT0ZXa2hN?=
 =?utf-8?B?OUJvUFBHRHU1Q3gyNEVRVXMxTDJ4QmNCTXZ0NU9TMk1FZFFrMXFpNmkwWUky?=
 =?utf-8?B?SFdPckJsQXdrYlgvb0lLUWd3RitmYjdEajQvdW1pbG5kOWJmTTVybVBFMU9X?=
 =?utf-8?B?a1A3R3lWK1NyemliUWFaYkZ3VG92S0RkNm1hQjFZZk5yV3lYWW1PNzhROWZk?=
 =?utf-8?B?OStsR3RGOVBSUGEwOUxhOVM4N2Rla2Rsc3NrN0JIdXFGbDRYTi9jYm5MbXEr?=
 =?utf-8?B?bUp6WFQzWFE0cHc5dzhwbGc0RUVudzRYd0toVThubTBjZTY4bERtQ2l4aWZz?=
 =?utf-8?B?Y2RwMGovZzNWWmZYTG8xNkpWNnZGanVKVU4zQmNpOXZTVjJsLzB4eWM5cUZn?=
 =?utf-8?B?K3M4b0RoczZYZWt2Wk8zaFdXK24rZXNGVmM0NktPbHdDSllMTkZUZklKWFNw?=
 =?utf-8?B?OGt1K05tazZuVis1M2ZkWTRqcTlENjRiR096eUdJbmpETTdQZ3haSjZJYnNB?=
 =?utf-8?B?Y216V2tDUHVUdDgzek1TN21XZmhqelZLekRIYmRXb2EvWFB0TlYyTmF0NFVM?=
 =?utf-8?B?dnJLYzVxN2ZzRlc1N1JDcFNjQnRuN3RzdDl3OW1NdVJwa1RpdE1iNy8rSDJI?=
 =?utf-8?B?OFlrL0FVU0NWdG5VclpJRjBUNnk3MTdBcGhNdmx5TDUxWWZVWVA4U3pEeE13?=
 =?utf-8?B?L0IzcitKU3cySUlEeG5FMG9hK3NVeDRFby9IWHpLM1BIK2hObkhkVEE5RTFZ?=
 =?utf-8?B?M0JyM2hGK3NobXJGdTNTNUpmbUdxbjhtTzFiS0tQbFRPcklYeCs0U3UrVG5O?=
 =?utf-8?B?dWNwQ2pLOUI2WnErM1FITzVSNGdlbEI1WUJ6djNDTkdlZnA4T2ZYMks1RnM4?=
 =?utf-8?B?bGVmZ3pIVldhemowd0lnYkhueC9XRnpGTWJwTTBoK0ZVUVR1enJndmcxZi9t?=
 =?utf-8?B?Ukh3YWlzVzVSL0N5OVBtVkc2ZTY2b3BkMGtlaE9YK0lTRGlsazRucmI1SU02?=
 =?utf-8?B?NGFvOW9LckpUY0YxS0RwWFBaOENsVklxaVg2Vm44QlZKcHJldHB2VEdhWTA3?=
 =?utf-8?B?UDg3M1Q3MkZNQkY5TkowTmRQQVVvckJJa0lIR1RmdlR6dkxjSkR6VjFFajZC?=
 =?utf-8?B?ZVp3SHFUL2ZmQ2RaVkVVZjNwRnEvTExPdGNnbnd6WXR1azBFd1FmWjhXU2py?=
 =?utf-8?B?TmxFczVLTnFTQ2xSYThqNVpoQXpWcnhwbzMxWXdoQzRrUmZVL0pGc1d6TElx?=
 =?utf-8?B?MUJoWm9GNkllUDM3cWhmbkFFTmhUN0FzOExpUFpVUTdnL2hSOGZTV2tEOEw0?=
 =?utf-8?B?Yng5Yy9xbFVPYnpYMU16bWJ0UXpTUEs2SmpTbDRvNFh0N25jRjRDK0VrZThB?=
 =?utf-8?B?ZEp4TnExZ0F0d1hucWpkeERUS0F3Vzl3Q1JjZ3R5dG9zdFJKU0N4Zmw2ZG4r?=
 =?utf-8?B?TE1ldDZEekphaDk1cnhWM1lyL3VTUHp3T2gxa2pJUVRZUGl2a2RTSlc3bVMz?=
 =?utf-8?B?UUFTVmp4Ykh4eFF3U21HQmJWdDh5blIraW1SL0Qvb29pYW85QVR1Zkl2UEE3?=
 =?utf-8?B?VFoyZ0tuR0czMDFJRzU5TXZSUWwwZytZNzYxb1FTN0xoUDJ1YVV1czdlUzhT?=
 =?utf-8?B?ZjYrODAyYmVrR1Z1NHN5TGd1VWtHT2RnTVUyamdOOWk4UlpCbit5K1ZXZDhQ?=
 =?utf-8?Q?Yu+/Pa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dG56SWJqM013MmFpdW40OXFUSDB3b1AxK21ZME9QS0VmWHVYdnZEY2lrM0pY?=
 =?utf-8?B?RFRad2dkWndwM1hDRStXbnN5b0xlaWcvM3JWdHJuTnJtcm5IZEE1T1VJbTNs?=
 =?utf-8?B?MllWRlI2alRuNWliN09uMm5vY01jTEZkTVpHQ0RCZHZneCtBMWJmM0tUYmtl?=
 =?utf-8?B?REVFTHR6S0VWTFFwU1kwdWhzQUNqN0RqeG4xNS83TXdVd1VIY3JBOHlwMXdQ?=
 =?utf-8?B?TnpoVGVUbmFoaGFVbi8vYjFXaDFuRGRPMktCVFRUdXpZVUtCT3VnYmNJMG1V?=
 =?utf-8?B?R25mak0rK016REE3dWsrZTRUeGtHeGowRmpuODl2UlRYS1dsU2hPdFhlVlR5?=
 =?utf-8?B?bjR5cVJscHdKWjZjbTNxbmU5am5jenRDU0FCZWhEQm13ZjJJaUxkUnl5Z2Y4?=
 =?utf-8?B?bmxzaFh0Wmtldy90QUU0NXRFeXBMdHhVdWFNZURqSFBES0pYOHRpUmJUalhh?=
 =?utf-8?B?V2dSdVR0NjU1U0MvUm5JM2xnMk1zejU5OCtpenRLOVdKNXQ5dEJUTlRrSVR0?=
 =?utf-8?B?amhLWnJPaXBURGltNXhseERoN2VkcTdraEZVakcxWkx5U0dKcnA5YUxaek1H?=
 =?utf-8?B?K3RUbHFONm9rR2lxVEx4bWNvK1lHK28rMW9BNVFTcEF4dWZXNTUrN2J0Z1FJ?=
 =?utf-8?B?YXRlWjFKZ3gxOVFuV3R4eDN3N205RTdIM1RBQSt6MUVXcUdLVEt6WDhZaktl?=
 =?utf-8?B?aVltUERWWVdMTkJNYnVxVmF3YzdNR0Fpb1JPYkpWa3JONGNRSlZzc1c3UHpZ?=
 =?utf-8?B?VHdKbU54alBhQlhTUExBbEFRSktwU1FmQlowSHRhckpzbjUxTXdRbkRvQUx4?=
 =?utf-8?B?WWh1M1lrUVV6dC9tcnBleXZiMFMxNVBLQzd5OW1OcU82b0xNK3R2SUV4Z3FT?=
 =?utf-8?B?RWI1cUVFZkFsa0F4K3BOUjNoRXVLNUJzV09aTG1MdjltWmwwU0s0QUV5cDZP?=
 =?utf-8?B?OTJ2YlRTMzR1L2pyL3BJL0VZMCtWZG1VZlVLZUg2V1BSRjZQNXJ4ekZURlBv?=
 =?utf-8?B?bFgvbnFKNEpmSldLY21WZkFzaDRPYndmUXN0OGw5VUtEdHRSenJsN3pzSnNn?=
 =?utf-8?B?bC9nRzgrcE50YWZHL2MyTEJaRFR1bUo1OUI2TUFWWkUzNzhRL09Vc0xMd2tU?=
 =?utf-8?B?aDQ2Y1JLd0dya3NEd1hPNHhhK094RHVDZy9zc1ZhWk1DSmlGVy94NXNiSEl5?=
 =?utf-8?B?alh4NSs5UWRpSXpKVXd5OFJKNXlSam10aXhWVkVXazNKazk4MWJsa2oySFZo?=
 =?utf-8?B?eUI4M3dieFJWTjNFR1RPcmhNUk5NQTRZZlNnYW1leGZUNEZUNjQrRkIrV1lX?=
 =?utf-8?B?RmlNUy9jc1VON1M5RlpobWNSeFh3MHQxMUY5Y2R5MFdaTUNuMTMvRUF5TTZ6?=
 =?utf-8?B?QzRyVTF2MW5BOVVady9HWWEyNmNGa2lEeDhZRGZLL3J6aHh6RzNMY1Nidk9B?=
 =?utf-8?B?M1pDaXpyb3ExTUhrd3JGR2U4Rm5wQk0xaXUzY2VhamN3eXZMYzNEZHB4TW55?=
 =?utf-8?B?SHFjVUtjUXl2WllFTEoyY29EK0xXVGJBTlpqc1c2anNyU1hDUDlBLzQyQkg1?=
 =?utf-8?B?ZXlVSllIT3RuNWhIc1JTSGk5VDVkRHZ4MGJQYzE5cWZCMzNMTVgzTXkrRndl?=
 =?utf-8?B?ZlZvR3lPeExOck83UTNpZFJzVFptLy9TOTJoTjBYWDVRYjNrcWdoU2dLc3N0?=
 =?utf-8?B?ZW53ckJCK0Y1a2NlSHNkOEZMTHRQenNrdmpLZ3dRZGRybjA3NWZQaEZuNDhv?=
 =?utf-8?B?RFZSNERia212S3MvOENaRFdRSnlTTXpMWWRGaGxEZmh3dGFxTWh2VExZZS95?=
 =?utf-8?B?RVgwNGdqNjJzZFZBU29pQ1lkdC9pU3IrVUV6VUpEWHFwYVlHYnpLMnc1dVQz?=
 =?utf-8?B?Q3lLa3MrMWFwMDhTL2phTDJYZGcrTXhJQTRWRnlqWTFkcGpGbXVQZlhzUi85?=
 =?utf-8?B?U29CaG5GZFZXbUhMZWdLZVZUdTNCYVg2UTYvTkxuNWFTamltL2MyYzZidW9H?=
 =?utf-8?B?Z1FFOU9JNHhZZzdvZkJCZnB6SHltMTg0ZFVWWFRhaHNuanFaR0I1aGYyWm9C?=
 =?utf-8?B?QmxtdUdTeHJ0dGdyRGl0M0hFdlNQNFhKM3dON3htV1k0R1FQbTJrZ1ZsL1A5?=
 =?utf-8?Q?oIj4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be27e34c-b174-4d27-4f30-08ddfc072d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 07:43:11.5905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8awVM6GHkDwC35RViHgR6rmsbKzneJgLVhIGY19dU42hGtG1vJGvEs5UT/W4l2Pv+klmoBXb9yoDqegV3YBqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5973

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTEs
IDIwMjUgNzowMiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPjsg
RGFuaWVsIFAuIFNtaXRoDQo+IDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxNS8yNl0geGVuL2RvbWN0bDogd3JhcA0K
PiB4c21fe2lycV9wZXJtaXNzaW9uLGlvbWVtX3Blcm1pc3Npb259IHdpdGggQ09ORklHX01HTVRf
SFlQRVJDQUxMUw0KPg0KPiBPbiAxMC4wOS4yMDI1IDA5OjM4LCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPiAtLS0gYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCj4gPiArKysgYi94ZW4veHNtL2ZsYXNr
L2hvb2tzLmMNCj4gPiBAQCAtMTExMSwxMiArMTExMSwxNCBAQCBzdGF0aWMgaW50IGNmX2NoZWNr
IGZsYXNrX3VuYmluZF9wdF9pcnEoDQo+ID4gICAgICByZXR1cm4gY3VycmVudF9oYXNfcGVybShk
LCBTRUNDTEFTU19SRVNPVVJDRSwNCj4gUkVTT1VSQ0VfX1JFTU9WRSk7DQo+ID4gfQ0KPiA+DQo+
ID4gKyNpZmRlZiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+ID4gIHN0YXRpYyBpbnQgY2ZfY2hl
Y2sgZmxhc2tfaXJxX3Blcm1pc3Npb24oDQo+ID4gICAgICBzdHJ1Y3QgZG9tYWluICpkLCBpbnQg
cGlycSwgdWludDhfdCBhY2Nlc3MpICB7DQo+ID4gICAgICAvKiB0aGUgUElSUSBudW1iZXIgaXMg
bm90IHVzZWZ1bDsgcmVhbCBJUlEgaXMgY2hlY2tlZCBkdXJpbmcgbWFwcGluZyAqLw0KPiA+ICAg
ICAgcmV0dXJuIGN1cnJlbnRfaGFzX3Blcm0oZCwgU0VDQ0xBU1NfUkVTT1VSQ0UsDQo+ID4gcmVz
b3VyY2VfdG9fcGVybShhY2Nlc3MpKTsgIH0NCj4gPiArI2VuZGlmIC8qIENPTkZJR19NR01UX0hZ
UEVSQ0FMTFMgKi8NCj4gPg0KPiA+ICBzdHJ1Y3QgaW9tZW1faGFzX3Blcm1fZGF0YSB7DQo+ID4g
ICAgICB1aW50MzJfdCBzc2lkOw0KPiA+IEBAIC0xOTQzLDggKzE5NDUsMTAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB4c21fb3BzIF9faW5pdGNvbnN0X2NmX2Nsb2JiZXINCj4gZmxhc2tfb3BzID0g
ew0KPiA+ICAgICAgLnVubWFwX2RvbWFpbl9pcnEgPSBmbGFza191bm1hcF9kb21haW5faXJxLA0K
PiA+ICAgICAgLmJpbmRfcHRfaXJxID0gZmxhc2tfYmluZF9wdF9pcnEsDQo+ID4gICAgICAudW5i
aW5kX3B0X2lycSA9IGZsYXNrX3VuYmluZF9wdF9pcnEsDQo+ID4gKyNpZmRlZiBDT05GSUdfTUdN
VF9IWVBFUkNBTExTDQo+ID4gICAgICAuaXJxX3Blcm1pc3Npb24gPSBmbGFza19pcnFfcGVybWlz
c2lvbiwNCj4gPiAgICAgIC5pb21lbV9wZXJtaXNzaW9uID0gZmxhc2tfaW9tZW1fcGVybWlzc2lv
biwNCj4gPiArI2VuZGlmDQo+ID4gICAgICAuaW9tZW1fbWFwcGluZyA9IGZsYXNrX2lvbWVtX21h
cHBpbmcsDQo+ID4gICAgICAucGNpX2NvbmZpZ19wZXJtaXNzaW9uID0gZmxhc2tfcGNpX2NvbmZp
Z19wZXJtaXNzaW9uLA0KPiA+DQo+DQo+IEl0J3Mgb2RkIHRoYXQgZmxhc2tfaW9tZW1fcGVybWlz
c2lvbigpIHJlbWFpbnMgYXMgYSBmdW5jdGlvbiwgYnV0IGZvciB0aGUgbW9tZW50DQo+IHRoYXQg
bG9va3MgdG8gYmUgbmVjZXNzYXJ5LCBhcyBpdCdzIChvZGRseSBlbm91Z2gpIGNhbGxlZCBmcm9t
DQo+IGZsYXNrX2lvbWVtX21hcHBpbmcoKS4gSG93ZXZlciwgZm9yIHRoYXQgb25lIEkgYWdhaW4g
Y2FuJ3QgZHJpdmUgZnJvbSB0aXRsZXMgb2YNCj4gc3Vic2VxdWVudCBwYXRjaGVzIHdoZXJlIGl0
IHdvdWxkIGJlIHRha2VuIGNhcmUgb2YuDQo+DQo+IERhbmllbCAtIGlzIHRoaXMgbGF5ZXJpbmcg
YWN0dWFsbHkgaGVscGZ1bD8gQ2FuJ3Qgd2UgZWl0aGVyIGRyb3ANCj4gZmxhc2tfaW9tZW1fbWFw
cGluZygpICh3aXRoIHRoZSBiZW5lZml0IG9mIGEgY2ZfY2hlY2sgZGlzYXBwZWFyaW5nKSwgb3Ig
aGF2ZSBpdCBkbw0KPiBkaXJlY3RseSB3aGF0IGl0IHdhbnRzIGRvbmUsIHJhdGhlciB0aGFuIGNh
bGxpbmcgdGhlIG90aGVyIGhvb2sgZnVuY3Rpb24/DQo+DQoNCklmIHdpdGggbm8gZXhwbGljaXQg
d29ycmllcywgSSdsbCBjcmVhdGUgYSBuZXcgY29tbWl0IGluIG5leHQgc2VyaWUgdG8gcmVtb3Zl
IHJlZHVuZGFudCB4c21faW9tZW1fbWFwcGluZygpLiBUaGVuIGhlcmUsIHdlIG9ubHkgc2hhbGwg
dGFrZSBjYXJlIG9mICB4c21faXJxX3Blcm1pc3Npb24oKQ0KDQo+IEhhdmluZyByZWFjaGVkIHRo
ZSBib3R0b20gb2YgdGhlIHBhdGNoIC0gd2hhdCBhYm91dCB4c20vZHVtbXkuaD8NCj4NCj4gSmFu
DQo=

