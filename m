Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCBFA2C168
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 12:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883564.1293526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMOE-00053B-A9; Fri, 07 Feb 2025 11:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883564.1293526; Fri, 07 Feb 2025 11:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMOE-00051f-7J; Fri, 07 Feb 2025 11:19:18 +0000
Received: by outflank-mailman (input) for mailman id 883564;
 Fri, 07 Feb 2025 11:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMDZ=U6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tgMOD-00051Z-2n
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 11:19:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2414::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d050e66-e545-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 12:19:15 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 11:19:12 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 11:19:12 +0000
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
X-Inumbo-ID: 5d050e66-e545-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQhmF8zemp0dRWSeVBdNhO4/4ToVYW5dqoUZ21hfyqnZBINHpHjQckel46JQSw60UDPmFhP3wFXJPNbRZLr/udR3dfkjuQubsTUs2N5Be1mL0g79mkZEaLt+YO3U1bxeWmUUuRidzycnhCjzPrQLgHv7cyXz2g/HO6EffhlK3sMTLc8eGAI+muRX69jBQ7YvKAme2EzC86K6LRla8L5bFFhcmVIrNQcDJ25Ll4z8YOIRB9MjeQ3x9jUGMFkPDr4AEhLV9gCrTS0Icua5H6MfMfTBabgxLqA+F+p2lYYh6v4uZbEHZtiWBJy/4vV7Ov5Lvib/psQc/qAinMOXmLBZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nae2WaHQR/92w3fGWuklo8mDWySE1GV9TgcLYpuACTk=;
 b=Q+SNaWSLPJWYm8GoWIYx287NO88ho5z4s7DSjzxYjk/3iZp86zBkrCk4C3W/ktfA+L27slSyNqeMtIgt5MCmJAgJZx0NzVAEnAl1ha3BjjnuuSSUkHgbZMjGPb3tV8uZ8jiqd6jMSAqyaOdcXf4p589lsWnk+dcQgpWirIOsZPqJ4jivyTYl/xvZXQ9F6pS1RnV4KnYydCnfd/Tp7veZmMXuJGrCxIh9QXy+job1lSqyy6JCuis6qEt0OxBPdV+m/aGJy1bHq5u8PQTW/rQ4jRHe4GvNeiNGvgaAWDlRpteDjaaW9EMhbI3ZE3mC5RP2v3fdP3fLQMsBbass9TnZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nae2WaHQR/92w3fGWuklo8mDWySE1GV9TgcLYpuACTk=;
 b=VwUO2cvUG7++K533wsoRUWb+aCtDTageVY1X2S8iwN7FTrkRcK3bwxYLmY3orO5ksONtSfYSfUrki+/QcZjekTWc0zOM7b7gNfKE+F9hopvt45ZGi2BZUmhDiEz23Kjekyav3a7XuKzo+6WwgXzQE7JpvCdHYf64FTeBDrutD10=
From: "Orzel, Michal" <Michal.Orzel@amd.com>
To: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 4/7] automation: add ping test to static-mem test
Thread-Topic: [PATCH v6 4/7] automation: add ping test to static-mem test
Thread-Index: AQHbeQMm5DJ6+hFzOUSL3W2gwcy8h7M7sjKA
Date: Fri, 7 Feb 2025 11:19:12 +0000
Message-ID: <4a07a11b-a1c4-4aba-b2fe-f62ccb5f7d69@amd.com>
References:
 <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
 <20250207015341.1208429-4-stefano.stabellini@amd.com>
In-Reply-To: <20250207015341.1208429-4-stefano.stabellini@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5273:EE_|IA1PR12MB9064:EE_
x-ms-office365-filtering-correlation-id: 536fa7ac-e82d-4a67-d4f9-08dd47693fc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGt1NXJnNG9MTTh4RnB4c3h0QWtVQkdhZ2dEUEg2SjU4RElvang3MHZXeUIw?=
 =?utf-8?B?RytEbzMwY05NSmMrdzFHSGpEOFpZMXFzUEVza3I2c3NjbFQvcWoxblBhdG1F?=
 =?utf-8?B?R20yb2Evbm5ydkdTcmNvczdJcXhhdjVFd091cVhpWkczOHFwaTkrVGRPR2Vj?=
 =?utf-8?B?T0ZSeG05MVN6NEZYc2Z1aXBNdzc5WWNYVjZwRUlwaVB5VVVZd0p6ZTZ6Nm9B?=
 =?utf-8?B?RnJqTDNtMDBtMVc0UzZUTnR5SEN1MXprTkw2QWpvM1lMOVBMN3F0S1hIYkh1?=
 =?utf-8?B?OVBkZ1FMcGN6a2VNQllCRjQwZ05UQVFzRVhCdUx2Zk5WWklqV1pnYWpBOTdo?=
 =?utf-8?B?ZGIyaEVCak51NnE0dGN1NGdNdklGdVh5RVRWa2g0YlVzVVU1akJqSmQraGpI?=
 =?utf-8?B?UkFoVUhDQklRK2lJcHRKa0hhMkNnRnBaYXZtMUIxdW1LLzdjTERycVJYTTBr?=
 =?utf-8?B?V1V3ek1NU0FFZm5kNi84SFVwUml3WWpCUi9ScnAyOUhma0taMlJwOWt4SFU3?=
 =?utf-8?B?ektyeHZuc1NleVhZTGhIZkQ5RWU3NUJ5NkdzN0RiNm5uSzkxdGhyVVQrVFZO?=
 =?utf-8?B?UkVIb1h2b2RqR0k1NGxDeXB6ZzNjVXExc3k4YWRVS0NmQ0lKcjJ1T201TVRq?=
 =?utf-8?B?RHBNdHkybEpmZ2RtVzlieWlmczJXczdWWm1aR3E0REVnQlRhZXdkWUFLMEpm?=
 =?utf-8?B?VUVUdXhWNDJNUHlOcXZlOTNYcmppLy9kRktVaTRLTG4vQ3hZdTQwY0hhQXRt?=
 =?utf-8?B?MXMwdTRDMEhzenhNNy9hdTZlMzdzTUtPUStibVVIRS9BRUpoT2kwWlFVdmtG?=
 =?utf-8?B?L2E5YUtxVTIvVWk5SHRwbi8vY0FUVWx5OWJ6MEIxUVA5REZ2WVk2QWtkaVJv?=
 =?utf-8?B?Z2p6Y2I1UGdxV2ptTmpuRkhYQThjOW5qZ3FBM2JuVkFnOWhmVXlGUWhVRlVL?=
 =?utf-8?B?Mnd5clljcHNCeGZGNTVYVXFMdDR2NXd2NG5wQWFwVlRlVHJOamFSc0REd0dV?=
 =?utf-8?B?MVRnM25BaysrSHkvazl5Y0JiSlZyME8xS094amo1eDNwNjROenQyelBYL3Za?=
 =?utf-8?B?QzhnZEpWUkdyUXR4UzhwdmpXMFh3UXBWeCt4d25wa01kMGlZSmdjc2RlSnM2?=
 =?utf-8?B?SzdrWWZtdjZVMndOYzZIWTNYTFBGMWo3NVVNS3NTY25YaUlIQ3lIdEdrVEwv?=
 =?utf-8?B?TTlVZ2E4MThzTEt5c2xGcUxxcE5IaFgzRStvYjlZOGNHWWdLaWVVcGJMblc0?=
 =?utf-8?B?c1ArK2xoblVRWHIvTkJySG4zMDg3SmVWSm95SXN4UzNQRWdCZzA3UmRucW9k?=
 =?utf-8?B?aHR0OElZcjFVNUVobG1mOEd3OXdudWdkTkVMQW5RaGZtMk9rdkxCYXRZYlAv?=
 =?utf-8?B?cElKQzRLazYzRE92a21Yb3owalpXaFZiSWdRVURmdUN2MXpCMGFKUVhKbTJh?=
 =?utf-8?B?NHdWWHhJSnpmNmM5eUxXQW12cHBRVnhROVlHdmpQb09lQTNsejBDdXhmZWdL?=
 =?utf-8?B?R0kzNGp3RTA4bGoyR29ZTHY2UkFtc0thSmExT3FoWDZLcnhaSXNROFBna2VG?=
 =?utf-8?B?aW5abGh1MGcxTENhaWxueFp3QjlCWmNGOEJDVnQyT244aUM2czRZRERFVzRa?=
 =?utf-8?B?OVkzU0NoR0RuYkE3dmZHSzlxZWNNRCtSVFc0UHVoMFQ5Uk1PUVM2bVdSN29o?=
 =?utf-8?B?b1hBVnJucW1DWVRsUEFqVzBqVUdUMmg2enJlazdOVnU1Y2w2N1BBTjN5MnYv?=
 =?utf-8?B?NUVxU3JsZWpoREZVcUdKK1RmUUJhTWZJQ2JSMHNybCtxenl6YlVwRmUrUzVa?=
 =?utf-8?B?NVhFYW5qaFhLNkxzQ0hQYWppTWc1UHhidW5qWWNHMlVyb1N3Q3BmYVRiVXBT?=
 =?utf-8?B?d1RUVzhqVVRrbWdBQkVQQXBxanNXVU5IaktKME9JRzUwOXpJWnNIM25hdmlP?=
 =?utf-8?Q?WhhojPcuP4c5Og8vVgYjSeskCo3gSh1Z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUpZVXE3YlZ5V0dyVldjUk1aZXdkeHNVSnhXV1I0emVQT05ZYy9DTDFsMkhE?=
 =?utf-8?B?d1Z1T3BBcVpFcnNPLzVQYTBLeDJnWnpua0M0TXlLTGRMaVRWdVpsSDJaY3RR?=
 =?utf-8?B?TExncGV5MCt2UTNrZ2MvZUQ1ekJLUncvSUdYK2dXS1RKWVlXVTVsVG9BRTIz?=
 =?utf-8?B?bDRJWlBiMWgyNzBlR0VEdDUwSU1zbi9FbmdDRjkrQ210Z0hnVEZWNWd0ZEwv?=
 =?utf-8?B?N25GM2xJZzBSZjE3Vnd3alZsV2VSTXU0Z2VrbHpQV0Y1U2Z0cjVmaDk5Mlkr?=
 =?utf-8?B?UjRPSEdNa3ZJaTVyVWxIWi8yTnZjUVlPZlRKWGpDbmZhTU1kRWJZN3lNeURq?=
 =?utf-8?B?d3YwM2x6ZmVncmJUOHFJOHFqbUJoYUMwTkdEemlrS20xeXBBY3JwbEEzdHRO?=
 =?utf-8?B?N25mRzY2dkhFUWhXdDR1YmxDWTMvN3dqM2FqcHIwZ1VMVmI4Y093N25pY0d6?=
 =?utf-8?B?UFFuWTNRL2tDaTNOb29NejFTVHRKZWhJOUgrMUNlQ2FMMXVIYzBIT2VxVWhm?=
 =?utf-8?B?TVhsWThCekZNRDc3Ni9xNkxrMXJuVGoyaXJmRVZrVFlIRzdiZDZzZHVBWncv?=
 =?utf-8?B?RzA5bDByc2FVUzRQdmtUNWV3eGRidm1KajBFdDZodWdHbVQ4UFpkQks0WDc0?=
 =?utf-8?B?TmttYVVWZVdXZnUxRGZ6T2ViQkREQUZRUytqZVpDMWUxejl2SWw0d1RVZzlo?=
 =?utf-8?B?eHU2ZnlKRFlLenV0L0FNcWxyaFcwc2hEcFloTmlOck01WStqVlAvMEE1T2Yx?=
 =?utf-8?B?WDFaa3VwNjU2TFYya2JIQTlnQWMvR0hBdTdkcWdNM0lhTXFqTHplblZMbWxq?=
 =?utf-8?B?MzhrVTRuUk5qSkNmR1BZcGluSUsrZmtZemdwb1pMODlEZnBzU2xJK3R2RUZ1?=
 =?utf-8?B?MEFBYXFIUFp6M3JCZVh4eGxxL1Z6Rmhob1FBNVJlMEZ1SU5OUUl5N3pxUkZI?=
 =?utf-8?B?ZTJySGhvOWRqOW5mdUsxR1JtN0FoUDhueGxVWkVVZTBlV1VaQ2F1Z1JqV3Rj?=
 =?utf-8?B?TldTcjBsZGYxaFlNcDFuN2dMKzRTblhzTEh5alN6aGlQaVIvbXptWGJ6NXBo?=
 =?utf-8?B?K0NUVHBlQXRaeERreitGZ3pkalFYNkNLSmNDbndjU3pEdXlvVGM2ZklWN3RB?=
 =?utf-8?B?WUl5Wnd6Tlc5ZVBWcy9WMXZkMkVPc1BqOUlMQXVoUjlNNEtaME9WZ3RqbWNS?=
 =?utf-8?B?ZnBPS3pFR2hVbFpCSkx6cmZSSGJEM0ZITnVYaFU2aWtFTmdNbzJlMFpVbndK?=
 =?utf-8?B?a1dDNllzS0oyNG9CSDdkWS9wR1gwTDlINzhidDA0aDFSMXBqOUg0VTl6VVN3?=
 =?utf-8?B?TGRXRTNIaGFpQTkrRmE3NzNHSUZoclduUDhpdjBYODdtb25KUDBZQ2pUcnBP?=
 =?utf-8?B?TGc1RGRqeEFLTHl4a1JXdmtvQmxLd3o4MGwzTVhtWVA0Zk5wVFhSNUVINXNO?=
 =?utf-8?B?aUY0RG9MVnF2REVkM1BzQmF0NlVNbUVKMnFMc3NHb2V0UERRc1VkZUxVbFJp?=
 =?utf-8?B?NXprMkhSWU5KYkg3aHo5UUtlQjR3cnlrNGJySU43TDZOSnN5NVhUc1BnQ2wz?=
 =?utf-8?B?Z25xQWhEQmFhTVVhbmtONGpJSy9Zc2ZEaGF1eDluektpbHI1QThCZzlPd3RJ?=
 =?utf-8?B?ZU1mcFI5eG51WDcvcFZCS3U3TW9kNlhqUXc3OWJZNVdtclN4UGhncEZRajgr?=
 =?utf-8?B?NTVHb0lIcnBWVGhnRWVibXhEbHZsd1gyRHVXdjVtREhUdnE1Sm5KeEdCNWtx?=
 =?utf-8?B?Qk4ycEthZjltTzZYMFlBaVdJblFNVFVaWVNoYnNZb1pnb0VXeUJoOUFxYmla?=
 =?utf-8?B?eGlkVHp0RngvakJNajlKdHBwTnAxRGcvTWRTS2xUME5XU3VHVlhRUmlLcTA2?=
 =?utf-8?B?WDlPcnp2VmcwUjIzZEl3b1cvZDk2N210ODltY1R2K1hubHRhaGVwVEZjWkVi?=
 =?utf-8?B?eEVUeEdIWU9qeGUrUm4wNzVFSE1rNVczSzQ3NTc0TFBrWm0zOGhKMHpCcDIz?=
 =?utf-8?B?NHFFSFlmcXFBb1J2MmRHN3BtbWNwcGNWWFFXZi90QVJQSEFjU2R4OWo0RDU4?=
 =?utf-8?B?RXBObndqTWc3c3RxK0NvZUFtY0dxeUhQMjRnNU40dWJpa1NqMlFETEJGeGgw?=
 =?utf-8?Q?pbaE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A79C06C18FB55445934733AD5AF1F048@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 536fa7ac-e82d-4a67-d4f9-08dd47693fc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 11:19:12.3460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDzTevGQ76S6mYng2agNRSJAVeaCr+RcEFslZZW5R3f+O6A5SlSzp9n5b+IXxcBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064

DQoNCk9uIDA3LzAyLzIwMjUgMDI6NTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gV2l0
aCB0aGUgcmVjZW50IGZpeGVzLCBEb20wbGVzcyBkaXJlY3QgbWFwcGVkIGRvbWFpbnMgY2FuIHVz
ZSBQVg0KPiBkcml2ZXJzLiBFeHRlbmQgdGhlIGV4aXN0aW5nIFBWIG5ldHdvcmsgcGluZyB0ZXN0
cyB0byBkaXJlY3QgbWFwcGVkDQo+IGd1ZXN0cy4NCk5JVDogSXQgcmVhZHMgYXMgaWYgdGhlICJw
aW5nIHRlc3QiIChkZWZhdWx0KSB3YXMgZXh0ZW5kZWQgd2hpbGUgaW4gcmVhbGl0eQ0KeW91IGV4
dGVuZCBzdGF0aWMtbWVtIHRlc3Qgd2l0aCBhZGRpdGlvbmFsIHBpbmcgdGVzdCB0byB0ZXN0IFBW
IG5ldHdvcmsuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNo
YWwub3J6ZWxAYW1kLmNvbT4NCg0Kfk1pY2hhbA0KDQo=

