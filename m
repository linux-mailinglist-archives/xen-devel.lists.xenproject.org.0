Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E3FB94F48
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 10:20:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128285.1468696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yFk-0007De-8K; Tue, 23 Sep 2025 08:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128285.1468696; Tue, 23 Sep 2025 08:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0yFk-0007BQ-5N; Tue, 23 Sep 2025 08:20:00 +0000
Received: by outflank-mailman (input) for mailman id 1128285;
 Tue, 23 Sep 2025 08:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0yFi-0007BK-AT
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 08:19:58 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15b70326-9856-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 10:19:56 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Tue, 23 Sep 2025 08:19:51 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9137.017; Tue, 23 Sep 2025
 08:19:51 +0000
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
X-Inumbo-ID: 15b70326-9856-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNzMKpqyvE6DgsoQ90OHb55nVF0RhTuaZ0l8Vz4EKTOBkafpQFNRHAmn3nucYXFqnJ2D9mDxDn5hwtoETeshL1+qkN/D9+Yd3P2nYw91ac7HeS5OugmkDMsVTE4xyrQ8SO0sarD+GWnq3FmsS9/tby5DkccIF2BjbjjJV8m4cdoGgUNnyQPp+1i+ajmfbczmPb1K6J/byiUkehZefBjAFAZrkzapfidQRq2PwwPqYO5eUhkWTp3K69dAvb1bxbwZ9y9V2u4R7HJuTebMe2wtuPlPBYqQXNQ/Yn6p8VVcpEYLFcFWL6p5QWjivy8B60nK+3lfvLEKBggBlhluwk3VyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGBIt+yqnDvo4Z89ejw7xFiF0qp1iXvx2DrNNYc/YfA=;
 b=q83YbKpkzHMzUFRld0bp/x+cUxbxgIW3BjTJ4rSdEP0P0fGrql3K8CYQBNr9Wpe5etJtFVEP/fHzBwVyN5Fmu1lIGCV7sN0hX0aR8ykzMRSGlA90EBZsZOCGzpwNRwWzPGCUv2ab/kEjgZYXcXTgZy/G50yay4Ii/wK9bXLBVakTgcs2v4hjD9jrU5MqXgysxv+YC1cJTnaG0SAkH5ZpevSeJqxspOMc6gZCsy9i2PGJYKTKd5vV8jIdl6i5m8REFNa6cAGMyBbCzBQYLtO2PktrdjXNyitTb2ePM05KH86gbFAhF7nDO7NNZcTT0kt+jgEpDW6hgv5brswq0f5+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGBIt+yqnDvo4Z89ejw7xFiF0qp1iXvx2DrNNYc/YfA=;
 b=eEvymT9BkdBzvILcImD7roGnSTbw8pDpN/OcoN8JQco49RGP2JzPcunBSnoeTYK85KPXH3fogAN++ZgbEGOX67sLib2KzN36d5ar8pd7n/QVMVtv9gCagLN9ww0jCSoV9lh6eBWjx7JKxPhjkV6f1v/bAPZId33ORIUiO0n26co=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: RE: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
Thread-Topic: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
Thread-Index: AQHcI6ElsmPyKgPhO0m7bb5S2YBG5bSPJskAgBE+WYA=
Date: Tue, 23 Sep 2025 08:19:51 +0000
Message-ID:
 <DM4PR12MB8451FAC5FB96133C64325DEDE11DA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250912045254.3731398-1-Penny.Zheng@amd.com>
 <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
In-Reply-To: <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-23T08:19:44.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB8160:EE_
x-ms-office365-filtering-correlation-id: a31bc470-ee9b-4b8c-6130-08ddfa79f7f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RmxNa3FtUjNHeThpYmk3QTJ3WHMycXdMQlM5MTIrS2s2YmNjZkl0Uy9PMWR1?=
 =?utf-8?B?ZXdKKy9ZTVdjM2l2VlRDbW8zVDVxYU1VcnNRQUxPeDZZQ0s1Y3ZQY0pGUU54?=
 =?utf-8?B?NExySjR0L3hxZmhoc3hwc3ZuTEVRUi9heUMrR2g4d21rMnVQUjZUd1RIa0JX?=
 =?utf-8?B?UTRSTVRTSDBtRWVHTUhjZU9zeVBQQkdvYldFNGcwei91a0Y3TXNxSWcybGNi?=
 =?utf-8?B?bjdTMHNvNGZFdlcreDhwTHArL3dnbERBcGpPTmhuN2UrQzlkRXFUMEZJR0po?=
 =?utf-8?B?UVMyQktHMzhxTC9pMzRiVTZLcXBmWXJobG1pS1hjNVI4TldWMUN5aGxmcW05?=
 =?utf-8?B?elkwK3U1WXlDVGFMbEFBZkxvQUlvMllUUFozMGduOUloQjgwQWF3YjRPczVC?=
 =?utf-8?B?QUVGbGw5SERNNGlyeFhLZ2ZodmlkZG9KUFg5SVRiVnRBdFN2UkttOUpxbExM?=
 =?utf-8?B?dHROTlZObmVHSEgzR1M3RGVFUkJDOVVUNnpwT0hwNGRGT0dyaGtVZTczSDFX?=
 =?utf-8?B?eUc5Z1NuYkQ2bHZSMW9YMUJiYUxTdWtwUkpMZ0F2KzVhYThRVFJJK1hQS1dC?=
 =?utf-8?B?bWRkLy9qS2hvKysvUVZZOFA0WUtWVE52WDVvU0JUUmtQbGdqcmZzZ2VhMklZ?=
 =?utf-8?B?MlNGcUZkT3BoMmtSU0FtYlVVaUFvQjZVcWJDdWhhd0JBSllaeVE3T043WFJC?=
 =?utf-8?B?Z1g0R3ZwT2hHS0VnUUdGYXMzSGpBcUxubVI2NHNaTlF0SW9lMW81QXBybWVk?=
 =?utf-8?B?ODlldVF6SGtwYnVXbTlyRDMraWgrVWtNbGhwSjJSSy8weHBzMy84a3krakNn?=
 =?utf-8?B?cjZEbG54OCtWbjVWVzZEbVBqYWRoUURzYU5DMExDTG5zSGZjcG1yU3ViM2d2?=
 =?utf-8?B?ak44dlpZR2VRMUVrSFpkODRsaE9QM09sRXBjVkc4bjFmejZTMWlNcHFEM2F3?=
 =?utf-8?B?c2xMcGVRTTJlTFBuejVEZ2k4ZzhseTFpUEVHY2RIUExaSHRVYmpxSk54QTNF?=
 =?utf-8?B?MmVCQUNIZXZHWHFPblRZMnpnOU9qYmJCNHc3cG11N051V1VCREZFaldCYWU1?=
 =?utf-8?B?ZjlUaVNnTHh1M0hXMkZFSTM2S1BWN2FBeEhrTTFTdFFadUpGMlIvQ1FiNTJ5?=
 =?utf-8?B?OEVuMUNQaWJFUE8wMm1BNmZ6YjBEYVBsUm9Ra3UvelcxY3FGU2RRWWwyV3Y0?=
 =?utf-8?B?emhqVnZDa2xLYjROY0RoTEhYUUlTVHVSY0w2QlFMc1didks1d3FiS1FLREh5?=
 =?utf-8?B?dW5TL2dQeFNhM1lyTGF2MmNPeTZ6N2xFenJQNUtUKy9RTG9JZUxnWVFWK3lp?=
 =?utf-8?B?Lzl3djFBUWZxL3hubWQ0NHdNRGNHbktMejBlajFEZ0NkSjhCVkpjZWhDV3lS?=
 =?utf-8?B?bzNNdzVRU0Q0ZGhlUkZ0SmpMVlpJaE0xREIxdTNnN0l5Si95U09meHpUZXpS?=
 =?utf-8?B?YjJ5MnZMTzdEUFVEWW92QVhQS3NLZENQaWJBZmVIdVgxc1RFcGNJTGdESGxQ?=
 =?utf-8?B?U2hPdVA5d2tjRnU5bTNvb29Ndk8vY2ttK2w4bC93R2xuV1JDN08yeG11dC9w?=
 =?utf-8?B?eGVPNEloSmgxdXl6R3AzeFUzODJRWExrUjlqeFF1VjVaekZLcGgvMGdxSUgy?=
 =?utf-8?B?Y3p3SUtCNUFuU0ZRV2JiVHVKRklWeGV2cnBGQmducmU2K1FGUWphbE9Ec1lE?=
 =?utf-8?B?TWF5KzMyWnppV3g0SVlPWHVhR0ZJY0hSdEsxOVlkL2pWNzc3U3VsOWp1MDVL?=
 =?utf-8?B?Z09VcUl2blFFdGVQZWxSL3VyTHVxb25zRjFHdVZ6UmFaL0YxUHVKWG51QkVr?=
 =?utf-8?B?VTk0SlNEaFczQjhqbnZhQWpPNEd0MDM1bVRJMGNPYVNWL0N6WjRmelRMSnhr?=
 =?utf-8?B?c0I4NTcxNWlVdU9tNGUyZkxzTnF4dGovZE1iTmxVQWxpaS9YZkJUZklyTGMv?=
 =?utf-8?B?Slp4cENmNEJwY2I1ODBwaXQzb3E2NXViT2V2bFZYWlNNbkRsVHlCMnNRY3Ny?=
 =?utf-8?B?S0Q3TjZrMDdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGFDZVkwanZHaGVaSmxYUlFiRmtwazFsV042bzEwUXFsVFo4NEtBUWI4QjRa?=
 =?utf-8?B?UnFEbFhxUy96S2o0NmlXd2E0N0xTVVRYdy9JOE9SMGVPK2p1NlJXVXp4b1Zz?=
 =?utf-8?B?UW1TVzJ1Y3paZ29Bald2bEp3RHRwSmZGWTh0aFQ1b0pmUEtaTkE2aDdSUEt4?=
 =?utf-8?B?YkJLNC9RRmpyVmtHa1pkU3doWFQ1TURpSGhabkNlbk1hWklVYVU1V0pxbVhr?=
 =?utf-8?B?RjByL1lPRHZnWDVhNEVoMjI2UXZidjlydmpYUk9wT1l2dndqR2tPL1IyTzBx?=
 =?utf-8?B?T3pkNHp0K2Q5ZFYzMGh0YjFVQkhBSGNWRTBIY0xwdXZVd2w2NSs5eVZQK1Uz?=
 =?utf-8?B?S3B1M1ZSa1kzbUZFU3ZXV2h2NWhKSGFBS01QYlc2cG5RZWE1RTRiaElNOW1P?=
 =?utf-8?B?SVl5bWh4TXJyRVVWMXgydEdRajZ6eEQ0dEpUWFAyazZhNVErNjN3RnhGam9D?=
 =?utf-8?B?Mlp0M2dTTm5MR2FFM2RHVytJeTZSTGdjR3hJMXhGWWpMWUNwY0MzUGtEL1Y3?=
 =?utf-8?B?VzhuQUtPVWZpeVhrVjZoSlZiUEtKZXQ0YWNwSWUrdGY3V2Zna0svN3BGTzJw?=
 =?utf-8?B?SXlqVFJNNjg5eCtJRmY1QjluMElhdFZIdWtuckZxYkdKcHQwV2tDQy91MUtH?=
 =?utf-8?B?a2MxZFcrQUhsKys5ODdnNXBId1FmVStsQ3hVaFJlc21OcFVRTnJDaG1PNVFj?=
 =?utf-8?B?b2pzL0ZPVHZSQThibmZhamZCTmd5cHc3UEpWUTBBM29aV01ueCtHREVMVENZ?=
 =?utf-8?B?ZThQajQ5WkVjRnU5VmhEYW5TRHFESWZvS2xSeDZiME8zVFNOaHZTMXkvellv?=
 =?utf-8?B?cy9KaysyMkxWR0dleC9OcG45dmpXeVBpZUtCOFVUVDBmREtEOFhYRElmT2Fi?=
 =?utf-8?B?dEZGR2RpOUNicGVYdUY2S0dqL00rdGY2YmhmZWJZNXRHL0xETklpazhRRUVi?=
 =?utf-8?B?VExNa3ZFQnRZcWltK2J0cGphanYweE9TMVRZTkZveFhrZGVLVlRYV01oNUZB?=
 =?utf-8?B?N254QUdTN0VlVGpqTDJQbXovMUdzR1RvUGRkYUlWdkVSOW10R29xdFdxQkFr?=
 =?utf-8?B?VWpJbnFpdjVxSThKU2tjajg2YTBESExpY1RwZnZtTEFTQ21uUVFkWU0vQ0cr?=
 =?utf-8?B?WVgzc2RrN2h6VTNlWE44em9VMjk0ZDJXay9CbGdYTHZ4TkhhdHkxMEtGWGVN?=
 =?utf-8?B?bmhtZUp4TEJZb3JDQW5rODBBM3kwSlAvWjgvdUhVYjcrelZWaDFNeUN6R0Jv?=
 =?utf-8?B?Yms0cnlVRk8vR3lBenViWVNsRHYwMERKNjVIK3NZVGdhRG1JT0lNM2dtM1NW?=
 =?utf-8?B?SERkdjJ0TDVhb1o4cmNLTTZJNS9nQ1FzY0xTMEdQWkhyNG9oQ3FyQzEvU1Rz?=
 =?utf-8?B?V1p1K28zZ2xDcXlPU2V1cmltVkpKTEtyOUk2UHQ3MmxoZnQrSjhLbXl5RlYz?=
 =?utf-8?B?S0IzVUtBZWNvdGlmVG9RTkU2MTBFODJEeTVURW8rWEdpWm8xbnFjWU5YZE1L?=
 =?utf-8?B?Rzgxa1lJQjNTSXczaG9naW1IZGNSOWR1bjFzV2djWnBZMHNQM1Y1ek15VzBj?=
 =?utf-8?B?SjA4bVNnQncvVGRFZXpvZ3dxUS80MWdwOHJqeXNNeU1oRTBNRE1IMVc2STZI?=
 =?utf-8?B?S1UzV3pxRzFJeXBrSUF0OFNqVG1JSVI4ak9sV3lPdlZLa3hFc0VpdHVlUld4?=
 =?utf-8?B?MDBmVElIL0ZOR0dlczNsQWYrQVBsbDhIR0NtMkg0eFVnSWZiZGxYWmxGZUtk?=
 =?utf-8?B?S1EzeFRHZFpFeHpiSVY3NEFtb2p5b3V2b2lBRHpGT1AxR0krS1RXelB3Nkl5?=
 =?utf-8?B?a0RhZXdlNDU3M2RaODlTWUtOY3RKaGd6OTBOMEZBamRZVi9hMzJNYWN4ZXY4?=
 =?utf-8?B?cC9oK2Q2QTNqcnE0WXpSZnhKUnJRYzdJeHlMd1JISU0rVmRKZ3AxcVZtWGxn?=
 =?utf-8?B?cmNkOHdjWWJPdTA4ODZzZWozZDUya2M5YWwxUGRzS3hHbjRGdW5rUU1kaWFD?=
 =?utf-8?B?ZUUrQWkzTXRCdzIzNWFVcFE4clN3U0VyNFl5Si91YXBDM3dkd3NUdk1Od3VP?=
 =?utf-8?B?VmE0UE9kcHp2T0dxeUd2QjhyVTVaY2t2dEFGRTBvZTJTWHVZaEFYNnhpNVVB?=
 =?utf-8?Q?gxQw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31bc470-ee9b-4b8c-6130-08ddfa79f7f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 08:19:51.4160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsOUjZ9w5vRUyWOqjCMXaSRZnkEhOrcqEmZWFv4JW7pDmhCqeU25VYGyRdP/d/sdrdncUSLNbnR6nZepNtm2JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDEyLCAy
MDI1IDM6MzAgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT47IFRh
bWFzIEsgTGVuZ3llbA0KPiA8dGFtYXNAdGtsZW5neWVsLmNvbT4NCj4gQ2M6IEh1YW5nLCBSYXkg
PFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsNCj4gQWxl
eGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+OyBQZXRyZSBQaXJjYWxhYnUN
Cj4gPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBPbGVrc2lpIEt1cm9jaGtvDQo+IDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL3ZtX2V2ZW50OiBpbnRyb2R1Y2Ugdm1fZXZlbnRf
aXNfZW5hYmxlZCgpDQo+DQo+IE9uIDEyLjA5LjIwMjUgMDY6NTIsIFBlbm55IFpoZW5nIHdyb3Rl
Og0KPiA+IEBAIC0yNDYyLDkgKzI0NjEsOCBAQCBpbnQgaHZtX3NldF9jcjModW5zaWduZWQgbG9u
ZyB2YWx1ZSwgYm9vbCBub2ZsdXNoLA0KPiBib29sIG1heV9kZWZlcikNCj4gPiAgICAgIGlmICgg
bWF5X2RlZmVyICYmIHVubGlrZWx5KGN1cnJkLT5hcmNoLm1vbml0b3Iud3JpdGVfY3RybHJlZ19l
bmFibGVkICYNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1vbml0b3JfY3Ry
bHJlZ19iaXRtYXNrKFZNX0VWRU5UX1g4Nl9DUjMpKSApDQo+ID4gICAgICB7DQo+ID4gLSAgICAg
ICAgQVNTRVJUKGN1cnItPmFyY2gudm1fZXZlbnQpOw0KPiA+IC0NCj4gPiAtICAgICAgICBpZiAo
IGh2bV9tb25pdG9yX2NyWChDUjMsIHZhbHVlLCBjdXJyLT5hcmNoLmh2bS5ndWVzdF9jclszXSkg
KQ0KPiA+ICsgICAgICAgIGlmICggdm1fZXZlbnRfaXNfZW5hYmxlZChjdXJyKSAmJg0KPiA+ICsg
ICAgICAgICAgICAgaHZtX21vbml0b3JfY3JYKENSMywgdmFsdWUsIGN1cnItPmFyY2guaHZtLmd1
ZXN0X2NyWzNdKQ0KPiA+ICsgKQ0KPiA+ICAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgLyog
VGhlIGFjdHVhbCB3cml0ZSB3aWxsIG9jY3VyIGluIGh2bV9kb19yZXN1bWUoKSwgaWYgcGVybWl0
dGVkLiAqLw0KPiA+ICAgICAgICAgICAgICBjdXJyLT5hcmNoLnZtX2V2ZW50LT53cml0ZV9kYXRh
LmRvX3dyaXRlLmNyMyA9IDE7IEBADQo+ID4gLTI1NDQsOSArMjU0Miw3IEBAIGludCBodm1fc2V0
X2NyNCh1bnNpZ25lZCBsb25nIHZhbHVlLCBib29sIG1heV9kZWZlcikNCj4gPiAgICAgIGlmICgg
bWF5X2RlZmVyICYmIHVubGlrZWx5KHYtPmRvbWFpbi0+YXJjaC5tb25pdG9yLndyaXRlX2N0cmxy
ZWdfZW5hYmxlZCAmDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb25pdG9y
X2N0cmxyZWdfYml0bWFzayhWTV9FVkVOVF9YODZfQ1I0KSkgKQ0KPiA+ICAgICAgew0KPiA+IC0g
ICAgICAgIEFTU0VSVCh2LT5hcmNoLnZtX2V2ZW50KTsNCj4gPiAtDQo+ID4gLSAgICAgICAgaWYg
KCBodm1fbW9uaXRvcl9jclgoQ1I0LCB2YWx1ZSwgb2xkX2NyKSApDQo+ID4gKyAgICAgICAgaWYg
KCB2bV9ldmVudF9pc19lbmFibGVkKHYpICYmIGh2bV9tb25pdG9yX2NyWChDUjQsIHZhbHVlLA0K
PiA+ICsgb2xkX2NyKSApDQo+ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICAvKiBUaGUg
YWN0dWFsIHdyaXRlIHdpbGwgb2NjdXIgaW4gaHZtX2RvX3Jlc3VtZSgpLCBpZiBwZXJtaXR0ZWQu
ICovDQo+ID4gICAgICAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEuZG9fd3Jp
dGUuY3I0ID0gMTsgQEAgLTM0MDcsNw0KPiA+ICszNDAzLDcgQEAgc3RhdGljIGVudW0gaHZtX3Ry
YW5zbGF0aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KA0KPiA+ICAgICAgICAgICAgICByZXR1cm4gSFZN
VFJBTlNfYmFkX2dmbl90b19tZm47DQo+ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICAg
aWYgKCB1bmxpa2VseSh2LT5hcmNoLnZtX2V2ZW50KSAmJg0KPiA+ICsgICAgICAgIGlmICggdW5s
aWtlbHkodm1fZXZlbnRfaXNfZW5hYmxlZCh2KSkgJiYNCj4gPiAgICAgICAgICAgICAgIChmbGFn
cyAmIEhWTUNPUFlfbGluZWFyKSAmJg0KPiA+ICAgICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVu
dC0+c2VuZF9ldmVudCAmJg0KPiA+ICAgICAgICAgICAgICAgaHZtX21vbml0b3JfY2hlY2tfcDJt
KGFkZHIsIGdmbiwgcGZlYywNCj4gPiBucGZlY19raW5kX3dpdGhfZ2xhKSApIEBAIC0zNTM4LDYg
KzM1MzQsNyBAQCBpbnQgaHZtX3ZtZXhpdF9jcHVpZChzdHJ1Y3QNCj4gY3B1X3VzZXJfcmVncyAq
cmVncywgdW5zaWduZWQgaW50IGluc3RfbGVuKQ0KPiA+ICAgICAgc3RydWN0IHZjcHUgKmN1cnIg
PSBjdXJyZW50Ow0KPiA+ICAgICAgdW5zaWduZWQgaW50IGxlYWYgPSByZWdzLT5lYXgsIHN1Ymxl
YWYgPSByZWdzLT5lY3g7DQo+ID4gICAgICBzdHJ1Y3QgY3B1aWRfbGVhZiByZXM7DQo+ID4gKyAg
ICBpbnQgcmV0ID0gMDsNCj4gPg0KPiA+ICAgICAgaWYgKCBjdXJyLT5hcmNoLm1zcnMtPm1pc2Nf
ZmVhdHVyZXNfZW5hYmxlcy5jcHVpZF9mYXVsdGluZyAmJg0KPiA+ICAgICAgICAgICBodm1fZ2V0
X2NwbChjdXJyKSA+IDAgKQ0KPiA+IEBAIC0zNTU0LDcgKzM1NTEsMTAgQEAgaW50IGh2bV92bWV4
aXRfY3B1aWQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsDQo+IHVuc2lnbmVkIGludCBpbnN0
X2xlbikNCj4gPiAgICAgIHJlZ3MtPnJjeCA9IHJlcy5jOw0KPiA+ICAgICAgcmVncy0+cmR4ID0g
cmVzLmQ7DQo+ID4NCj4gPiAtICAgIHJldHVybiBodm1fbW9uaXRvcl9jcHVpZChpbnN0X2xlbiwg
bGVhZiwgc3VibGVhZik7DQo+ID4gKyAgICBpZiAoIHZtX2V2ZW50X2lzX2VuYWJsZWQoY3Vycikg
KQ0KPiA+ICsgICAgICAgIHJldCA9IGh2bV9tb25pdG9yX2NwdWlkKGluc3RfbGVuLCBsZWFmLCBz
dWJsZWFmKTsNCj4gPiArDQo+ID4gKyAgICByZXR1cm4gcmV0Ow0KPiA+ICB9DQo+ID4NCj4gPiAg
dm9pZCBodm1fcmR0c2NfaW50ZXJjZXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKSBAQCAt
MzY5NCw5DQo+ID4gKzM2OTQsOCBAQCBpbnQgaHZtX21zcl93cml0ZV9pbnRlcmNlcHQodW5zaWdu
ZWQgaW50IG1zciwgdWludDY0X3QNCj4gbXNyX2NvbnRlbnQsDQo+ID4gICAgICAgICAgaWYgKCBy
ZXQgIT0gWDg2RU1VTF9PS0FZICkNCj4gPiAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPg0K
PiA+IC0gICAgICAgIEFTU0VSVCh2LT5hcmNoLnZtX2V2ZW50KTsNCj4gPiAtDQo+ID4gLSAgICAg
ICAgaWYgKCBodm1fbW9uaXRvcl9tc3IobXNyLCBtc3JfY29udGVudCwgbXNyX29sZF9jb250ZW50
KSApDQo+ID4gKyAgICAgICAgaWYgKCB2bV9ldmVudF9pc19lbmFibGVkKHYpICYmDQo+ID4gKyAg
ICAgICAgICAgICBodm1fbW9uaXRvcl9tc3IobXNyLCBtc3JfY29udGVudCwgbXNyX29sZF9jb250
ZW50KSApDQo+ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICAvKiBUaGUgYWN0dWFsIHdy
aXRlIHdpbGwgb2NjdXIgaW4gaHZtX2RvX3Jlc3VtZSgpLCBpZiBwZXJtaXR0ZWQuICovDQo+ID4g
ICAgICAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEuZG9fd3JpdGUubXNyID0g
MTsgQEANCj4gPiAtMzg1NCwxMiArMzg1MywxMCBAQCBpbnQgaHZtX2Rlc2NyaXB0b3JfYWNjZXNz
X2ludGVyY2VwdCh1aW50NjRfdCBleGl0X2luZm8sDQo+ID4gICAgICBzdHJ1Y3QgdmNwdSAqY3Vy
ciA9IGN1cnJlbnQ7DQo+ID4gICAgICBzdHJ1Y3QgZG9tYWluICpjdXJyZCA9IGN1cnItPmRvbWFp
bjsNCj4gPg0KPiA+IC0gICAgaWYgKCBjdXJyZC0+YXJjaC5tb25pdG9yLmRlc2NyaXB0b3JfYWNj
ZXNzX2VuYWJsZWQgKQ0KPiA+IC0gICAgew0KPiA+IC0gICAgICAgIEFTU0VSVChjdXJyLT5hcmNo
LnZtX2V2ZW50KTsNCj4gPiArICAgIGlmICggY3VycmQtPmFyY2gubW9uaXRvci5kZXNjcmlwdG9y
X2FjY2Vzc19lbmFibGVkICYmDQo+ID4gKyAgICAgICAgIHZtX2V2ZW50X2lzX2VuYWJsZWQoY3Vy
cikgKQ0KPiA+ICAgICAgICAgIGh2bV9tb25pdG9yX2Rlc2NyaXB0b3JfYWNjZXNzKGV4aXRfaW5m
bywgdm14X2V4aXRfcXVhbGlmaWNhdGlvbiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkZXNjcmlwdG9yLCBpc193cml0ZSk7DQo+ID4gLSAgICB9DQo+ID4gICAg
ICBlbHNlIGlmICggIWh2bV9lbXVsYXRlX29uZV9pbnNuKGlzX3N5c2Rlc2NfYWNjZXNzLCAic3lz
ZGVzYyBhY2Nlc3MiKSApDQo+ID4gICAgICAgICAgZG9tYWluX2NyYXNoKGN1cnJkKTsNCj4NCj4g
Rm9sbG93aW5nICJ4ZW46IGNvbnNvbGlkYXRlIENPTkZJR19WTV9FVkVOVCIgdGhpcyBmdW5jdGlv
biBpcyBhY3R1YWxseQ0KPiB1bnJlYWNoYWJsZSB3aGVuIFZNX0VWRU5UPW4sIHNvIG5vIGNoYW5n
ZSBzaG91bGQgYmUgbmVlZGVkIGhlcmUuIEl0J3MgaW5zdGVhZA0KPiB0aGUgdW5yZWFjaGFiaWxp
dHkgd2hpY2ggbmVlZHMgcHJvcGVybHkgdGFraW5nIGNhcmUgb2YgKHRvIHNhdGlzZnkgTWlzcmEN
Cj4gcmVxdWlyZW1lbnRzKSB0aGVyZS4NCj4NCg0KSSdtIGEgYml0IGNvbmZ1c2VkIGFuZCBtYXkg
bm90IHVuZGVyc3RhbmQgeW91IGNvcnJlY3RseSBoZXJlLg0KSnVzdCBiZWNhdXNlIHRoYXQgaHZt
X21vbml0b3JfZGVzY3JpcHRvcl9hY2Nlc3MoKSB3aWxsIGJlY29tZSB1bnJlYWNoYWJsZSBjb2Rl
cyB3aGVuIFZNX0VWRU5UPW4sIGFuZCB0byBhdm9pZCB3cml0aW5nIHN0dWJzLCB3ZSBhZGRlZCB0
aGUgdm1fZXZlbnRfeHh4IGNoZWNrIGhlcmUuIE9yIG1heWJlIHlvdSB3YW50IG1lIHRvIGFkZCBk
ZXNjcmlwdGlvbiB0byBzYXkgdGhlIG5ldyBjaGVja2luZyBhbHNvIGhlbHBzIGNvbXBpbGluZyBv
dXQgdW5yZWFjaGFibGUgY29kZXM/DQoNCj4NCj4gSmFuDQo=

