Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F369C9642D
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 09:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175610.1500229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzfO-0000UB-R8; Mon, 01 Dec 2025 08:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175610.1500229; Mon, 01 Dec 2025 08:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPzfO-0000SK-Nz; Mon, 01 Dec 2025 08:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1175610;
 Mon, 01 Dec 2025 08:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isLO=6H=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vPzfN-0000SE-Hv
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 08:53:53 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 416c46f3-ce93-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 09:53:51 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SA0PR12MB4414.namprd12.prod.outlook.com (2603:10b6:806:9a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 08:53:47 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 08:53:46 +0000
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
X-Inumbo-ID: 416c46f3-ce93-11f0-9d19-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=topv71GpBOuZUJs1G0i1VUMrB3O/4hP7lkjmy+eSxUwrdexm0Uj3mS9G+h+B/J5Uapub92FzX/70Cw2ndwgLfko3wqd45vQqlJEEYyoCbD7ehJWd9zXvLv+P3slnYJ3u4Xhr/s0L6s2oC+0gXBMfhtfZymh9zpjJgFkqLahyjYebQseSUWLGu9ThsWrK19Bvc9+3kK102Px6s7VQEAAwzsbnrL0hblvki4l670AkBz3Yha5OKuudkF/OL+ZTvHzmGLGO5to8eqeI625o9zZWpgb4yQ0AF6geIwNQXcq7k0caqiyK7IGt9a8ty5l120/UBAJEl3wKgH9qL32075lJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ+a5g+YtArrRSTJGHzBJ8/9SvIuV61iAPhwfeK451s=;
 b=MFf23QqnsChV8/lIyLzou3Jc+qXWBb/7EJcRikJ4g+8+pejA2GQwhyaYQASEDo3W/Zq+L6b96vuTmV6LrW+w4qwqhyTvx3Vbf5qZtDTmj4vVnH7XeaVhQI3roxiiqFUzIZyACG5fqsAQOxEDMmfFj6K2wufM0NCNtVEQjN0rQib7Qf7EkIbEFIL3bCLCHOMyxXWMmcMv0gX5/XW6rx4ADpXPEhqPpTTlO/5Di8/hy3TFORcZmA0xgtYSoexuj+cDM2odziRSZ1XC2h4KfgaZ+iTRE2t20f7wnQkHrdH5PchZ+NPBatBBgFwrlSwLukUaDxihIV8c0HWVNg2eSPTN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ+a5g+YtArrRSTJGHzBJ8/9SvIuV61iAPhwfeK451s=;
 b=QJcb7uXJhDrJAFewm4ZWrwjQAOUB1iq3L4HTppTnZMKZWc9CofI0+DdbfdV9/Owzd2188x2PJw0Nf7FH+u64pcSLKGkuVgAuxj4cFlTe7NQVbjbGOPsrLq96xUUH6RvIv6urGb6mypMxtPqk11eX+TmAIvG7LGXxU5aPxVR8EjU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related
 domctl op with CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcWtXdwWaFTRetvk29bNPbH/CVXLUDjQOAgAjznsA=
Date: Mon, 1 Dec 2025 08:53:46 +0000
Message-ID:
 <DM4PR12MB84515158689F4064F314B7DFE1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-15-Penny.Zheng@amd.com>
 <6e1dd697-7276-4d1b-841c-a9b1594fa858@suse.com>
In-Reply-To: <6e1dd697-7276-4d1b-841c-a9b1594fa858@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-01T08:53:39.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SA0PR12MB4414:EE_
x-ms-office365-filtering-correlation-id: d17a98c6-72f3-4bbe-8841-08de30b723a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MFlpVVdpUU42QlFqZkEzWnFvWTAzbmpXRGJ4ZWVXK3FhUVMxQVhjbXVqQmJV?=
 =?utf-8?B?dVBhV3I2eVp3RWRCVWNqcUdlTUxhK1craUtJTUZYTW5CTklVQXNXeXVMYmN6?=
 =?utf-8?B?SXJmTzJOSHRXSzJhMDZhVUVCOVMyMVhLanRkZkJQRVI3M2Y1UlRZQlpkdHc4?=
 =?utf-8?B?aGNQVkdZU3kyL1g1NnUxMG8vemZvSE9yaDdpclVaWVhqengzZmVqeW8vdzN1?=
 =?utf-8?B?d0swY2RNYkp1TmpzY09zbkJJL0YrdHcvNHhrVFQzdWxkL1FjUkVRSGhmZDVq?=
 =?utf-8?B?UUVRRUpqMUkrQ000NzBUdEViNnBGanNTeEhKeTc3SmpwMVFYdnNyK2RCY25s?=
 =?utf-8?B?UER6MEVEQnNZUFVPeFhEMWtwdkpNdmlKUzhIRzB5VVRla0h2THhoYWg4N1lX?=
 =?utf-8?B?QmFkYXJvaG5ackhtMEVjK21WaUcxVU12MHZoSXJrUkhnVzdEWVBldXZCdExy?=
 =?utf-8?B?NSt4QmRMTDdHREprMmRNb2hBN2toT3JKYndCUkh4Wm5QUGprMlFvVXdSOE1x?=
 =?utf-8?B?Vmp0WlpmVHZVdjNMQzZ3NjhmNnhMUVJISUpaSW91cWFsdW1wcjBRR3ROQnpw?=
 =?utf-8?B?WGpzaDk0cmcvZjlMV1JoQmJtTnh2NjB4ZmVTYXB0NVhlQmh1MkdYVEpZTDYr?=
 =?utf-8?B?Yzh6NTgrVzFFdnkxbDJjRHgwK1ozTnN5MGlVdXhGNHVGM1RUVjU4cEV0MGhs?=
 =?utf-8?B?R3FKVGlUOEJ4eFFJSlhLaWFoNzF5V01Cd25BVGo5T1laZjl1R0szeW00UnIx?=
 =?utf-8?B?UFhIZVRFZDA2Q1FCL08xbzI0ZUVYVXJEYVBTZk00aWFhUVZiOGgybXhFVUxq?=
 =?utf-8?B?VTd0VGMya0o0SDdScnJPK2RhYUpZTldQNGdYYjRoU1FTQVdCbDF2bnhMVDA0?=
 =?utf-8?B?dnAyOGRxdFE3bkExZ2VkSE9JUW5iUm1BcDFLdWFObDNJaVF3NGZTWjFmTWdl?=
 =?utf-8?B?Mmx1UUJ3K1hzbnNCWGJtZjRTNmI2UWtHcm1PNFVzSXZwRUVaVTczZ1ZxaHVo?=
 =?utf-8?B?VTBJeWpKY3ZZUWJSQ2JENElIMXBsNTRxTDM2ZnhzbktUQitKdFdSUnRCcGhK?=
 =?utf-8?B?MzF1ZUlIT3BDajcrTEFQQnZEQkp4cWZHSS9tUG91MDlVcCs3eG9OUkxiajNL?=
 =?utf-8?B?blVHdDJxVlUvUVFYVnNiS1lWazllejRmaEtrU0Qydk9MbVVjWU43RXk5L2kz?=
 =?utf-8?B?WkdVSzI1cDJ2UVBUMUVWd2MvWVBTNDVDNUFDeEc2OWtkcTFYQ0MxVXgvVWV1?=
 =?utf-8?B?QUFhQXd5cGNKUCsvZkF3b25NZ05HdG5PNm1BZzM2WThNaDUyRFFIM2t0c1di?=
 =?utf-8?B?YStvSlNsdk1sVis2bktwRmcvQ0Y5NGp4TFN4NFR0dU42cDlPaElORzA3Ukl3?=
 =?utf-8?B?L0kwdzUyUk4ya1ErK3V0N05uRk1KL0Y5aDFtTG5xbDQvQkpJZUZtTlJpZEFv?=
 =?utf-8?B?S3F4NUxzZjFvRWY0MUxReTc0Mks5Z3pJMXNTd0J5M2VGN3pPRW9XVGZwUEdy?=
 =?utf-8?B?bE5ESjI1cUUzUHhaSEpOSDVzZC8rcURQN3g4T1phdjlhbTlPM2hFU2xDemln?=
 =?utf-8?B?b1dmclNxOTQzelhwVEg0RDQ3eUhqQWxDR0NUREdHWGV1MTdMUXlaL0NLM3hG?=
 =?utf-8?B?aWxCVk4weUU5bVlSTEM4MlRTTURjemlHVHBYMk4wNEhoVFhYTWxSbnFOMXMx?=
 =?utf-8?B?Q0hES2dGczkrVWUyaVFKZmdUNzNXL1NWL083amtpbGhiaHlHTitENnkyZnM5?=
 =?utf-8?B?RGp6MEZFNjRVTDZjMnR4b01iaGk3TFlzWm55bG04d0c2RnNiNkRUVEY1STBR?=
 =?utf-8?B?dGpuK2FOUERHNy94UFdLY2hENkxlMHcvZnFUdVRiRm9nRHZzWVNJRFFxTi9Y?=
 =?utf-8?B?ZU5WMWt4RUJicWhEMVBJVFdrZ0EvekNUYUZrWUFtSXQzK2VFa0piaFB5OXdG?=
 =?utf-8?B?UzRWQzVPZDJFbUVvcmRnSUo0MWNjZkl3TERrUzJtZ1hPMGgxTGNGQjNTaU02?=
 =?utf-8?B?TTRWWGs4SWtWQmsyMDgwSHMvNGFqWlpndzUzUXVDK29kcklSZkt6N2IwOG5v?=
 =?utf-8?Q?zA25xq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzhNN0Vjd1RtNGFidUJxQzQ4MWtjWnFHMVlTWkxBTXdEdjVFZ1pGcVJrc212?=
 =?utf-8?B?QVFQVDZvdk1NQUk0M3dKbGZldXdOVkpocU9iUUR1Y0hTeElYRDkvSWFWS1gz?=
 =?utf-8?B?bkJpVHNLUzJKSzFFdzlwaW15RUpuTzd6UElqTksxZzBDMjFrYllCOGd6Y3hz?=
 =?utf-8?B?UEcxV29HVEVTUkp2SnZUcC80SytYbW8reXd1TlR6dmxxTXVlZGcrMHBMYkU5?=
 =?utf-8?B?cm9LVTVDRW9qZENobHhodG0rQVFTOEp4cUFvaUdyMGR0bDhUeHI2Ny9kSGZt?=
 =?utf-8?B?RnY5bmd1ejFubGhONUVobjRndDBUZUNab3F4ZmhiNWVhQlFmSDhET2Vuc1Br?=
 =?utf-8?B?MGhKUHExSnRKbmtxSFpSVXJXWXRtUlpxUm44SUFvbll4cWpiMUczcC9JRmVL?=
 =?utf-8?B?SmNXWjlHQkd4S21xckFET2FRME85YzM3cTlqci8wTkRyOTZVdVNpVEluNk16?=
 =?utf-8?B?ejgwbDdwcE1nUG5MeCs1VlordGUwd0pKZDRwazFuZDZ1SFltN1h2MXMzM0lm?=
 =?utf-8?B?WXFjUnprRm1VN0JHcVdLVTUvS2d5Qi9wdW1JY2dRZHV4cElzU1pxTVZyV3Rr?=
 =?utf-8?B?ZVdwdWY1TjJjeEQwWS9XK0dlM0VVMDFFdVFleHdyL21lc3NUdlpzbWI1eVov?=
 =?utf-8?B?VEJlUnMzUTFQRTNTT3ZqSG1NRGNGTTRqQXpvOUtwekpQRUtUczlrS09rMC92?=
 =?utf-8?B?dE03dW9JWWJvaGs5cnFHd2ZJOWI3UGdPa0ZmVWNGVno1em80ajdjUWJLOElN?=
 =?utf-8?B?eVJta3l4OEluV0NJeUFIYVZMOHFtOHp2bGY3cHp1OGFkdUJ2OXREMjhUbThp?=
 =?utf-8?B?K2JMTEdRZ0h6SmpXZXh0MENJSm5id3VXK0pYM05oMzFFV003d2huUlgwTVZI?=
 =?utf-8?B?M0VYcFZwNmNXdit4Y0NiUmpRSVRDZ3loS1Zzd3RZSmh4enhIU3JERldRdSs3?=
 =?utf-8?B?L2FPbCtRMVNaYkFTZzdkMjBPM2l1Sm42N2ovSHlkT05zUm9nak8zenowNENC?=
 =?utf-8?B?dTBaZ1pPTnZRaGNSMEhieUxRZmQ2YmlWc0lPMUFjTVRQR212azNxRXh6Z0wy?=
 =?utf-8?B?MWgyUjhJUG94YVQzd05uMDhQL1AvdEN1Znp3clhHaTZmbkQ1Zjl2ZjcwZ25W?=
 =?utf-8?B?NG9yN0IwYm5tendaVTJ5dkErWU50N1czNUNZOUw3aWc0cHc1bkpTNW4wOVRE?=
 =?utf-8?B?cFB4RGtTdGZ3ZDFON2xwY21JSzd6WU1DREpmaTREaVoxekEyZE5BMUNUL3VS?=
 =?utf-8?B?KzRRUlIwVmgvSE4wa1dsWDFPLzJSTHlOSVZiU0pKdEhyRTBodGJnQ0tlVmNG?=
 =?utf-8?B?dW5jSldHUDQvb3RZOG9mVGFFSkFTUk1DNnFoanhXdm9qM1NzditueHNUbzE0?=
 =?utf-8?B?dzhzZy8xd3JXN0s0UGlmUWtwSklpYUplS2UrZjM1YUJxZXFjeXQza3ZUamUw?=
 =?utf-8?B?T2JiTVY3T3FPY3E1eFJ2NnU4UjF6eDlEcmh5ME9QSGlVcllmRXkxNDNsekE3?=
 =?utf-8?B?NDRFTXY1N3pDVDBLY2JFb1hBZ1NZRkVVcGlRbCtYL0wwOUl0WUdCa2JELzY2?=
 =?utf-8?B?aEZNdWUzY3VSeVo5a245VVVLcmhIU1czVmp1ZWtBbCtTYnhtL1M3aFNyRUFX?=
 =?utf-8?B?U255cnpZY0h1d1NTbGZES3ZHTUJYV2NpUVVsRlRtK1J5MkZEQWRoaE1HU3hC?=
 =?utf-8?B?NjY4eEhzTzExMStnaklMNkVYZ0pFQkpPU1kwaEtyN0ZxaWxCd2h5Z2xVSWJu?=
 =?utf-8?B?N0l5SVRIemJLVEdIbUlkRy8rc1N6K29GZE9KbnhZenNkSFlER05pQnlBbk9s?=
 =?utf-8?B?WUFHVkxsZDVadVd6TGo1TDNqL3lweXB0WHpyUzlGQlJBQ2srcUlzODdDOFlT?=
 =?utf-8?B?Y1F5NGRoVE5iamlSNzJrTVVERFh0ZXZXMWY4OVkrTTNaY0lhYmVIdFdnWWI4?=
 =?utf-8?B?VnBpM0Y0aDJpZlNTb1ZwcTA0alhuSXhiZ0lhc0toZjg3ZTZ1b2FsMUtZR28x?=
 =?utf-8?B?eCszRThITEhidGVha3RRVkNRd0NQZG9IVjQ5K0ZtbURFVXpvK0xhU3I4aXBG?=
 =?utf-8?B?K3NwUUh4Qy9GWlNhMDV5RUo1OGlUeWhhYm5BM1oyWTdRWkxxaVF1NGxGNWd2?=
 =?utf-8?Q?1sKU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17a98c6-72f3-4bbe-8841-08de30b723a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 08:53:46.8003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpQ9XmZm+CF4C9FthKRN75YQ+Udtiw9KjHIVkgodCcaUxLWFQF+Uc/4C72RSh/kqAHQbNfKu9JdwK2EHCdlWtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4414

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI1LCAy
MDI1IDExOjM3IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+
IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IGdyeWdvcmlpX3N0cmFzaGtvQGVw
YW0uY29tOyBBbmRyZXcNCj4gQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ow0KPiBBbmRyeXVrLCBKYXNvbiA8
SmFzb24uQW5kcnl1a0BhbWQuY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+IDxkcHNtaXRoQGFwZXJ0
dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjQgMTQvMjRdIHhlbi9kb21jdGw6IHdyYXAgcGNpLXN1YnNldCBpb21t
dS1yZWxhdGVkIGRvbWN0bA0KPiBvcCB3aXRoIENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4NCj4g
T24gMjEuMTEuMjAyNSAxMTo1NywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgfCAyMCArKysrLS0tLQ0KPiA+ICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAgICAgICAgICAgICAgIHwgNTIgKysrKysrKysrKyst
LS0tLS0tLS0tDQo+ID4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAg
ICAgfCAgNiArKy0NCj4gPiAgeGVuL2luY2x1ZGUveHNtL2R1bW15LmggICAgICAgICAgICAgICAg
ICAgICB8ICA2ICsrLQ0KPiA+ICB4ZW4vaW5jbHVkZS94c20veHNtLmggICAgICAgICAgICAgICAg
ICAgICAgIHwgMTIgKysrLS0NCj4gPiAgeGVuL3hzbS9kdW1teS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA2ICsrLQ0KPiA+ICB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTIgKysrLS0NCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCA2OCBpbnNlcnRp
b25zKCspLCA0NiBkZWxldGlvbnMoLSkNCj4NCj4gV2l0aCB0aGlzIGRpZmZzdGF0IGFuZCB0aGVy
ZSBiZWluZyBxdWl0ZSBhIGZldyBIQVNfUENJIHVuZGVyDQo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FybS8sIHdoYXQncyB0aGUgKFBDSSkgZGVhbCB0aGVyZT8NCg0KSW4gYXJtLCB3ZSBoYXZl
IHRoZSBmb2xsb3dpbmcgc2VsZWN0IGNoYWluOg0KSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCBpZiBQ
Q0lfUEFTU1RIUk9VR0ggLT4gSEFTX1ZQQ0kgLT4gSEFTX1BDSQ0KU28gaWYgd2UgbWFrZSBQQ0lf
UEFTU1RIUk9VR0ggbGF0ZXIgZGVwZW5kIG9uIE1HTVRfSFlQRVJDQUxMUywgdGhlIFBDSS1zdWJz
ZXQgZm9yIGFybSB3aWxsIGFsc28gYmUgZ3VhcmRlZCB0b28uDQpJJ2xsIGFkZCBkZXNjcmlwdGlv
biBpbiBjb21taXQgbWVzc2FnZQ0KDQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveHNtL2R1bW15LmgN
Cj4gPiArKysgYi94ZW4vaW5jbHVkZS94c20vZHVtbXkuaA0KPiA+IEBAIC00MDcsNyArNDA3LDgg
QEAgc3RhdGljIFhTTV9JTkxJTkUgaW50IGNmX2NoZWNrIHhzbV9nZXRfdm51bWFpbmZvKA0KPiA+
ICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihhY3Rpb24sIGN1cnJlbnQtPmRvbWFpbiwg
ZCk7ICB9DQo+ID4NCj4gPiAtI2lmIGRlZmluZWQoQ09ORklHX0hBU19QQVNTVEhST1VHSCkgJiYg
ZGVmaW5lZChDT05GSUdfSEFTX1BDSSkNCj4gPiArI2lmIGRlZmluZWQoQ09ORklHX0hBU19QQVNT
VEhST1VHSCkgJiYNCj4gPiArZGVmaW5lZChDT05GSUdfTUdNVF9IWVBFUkNBTExTKSAjaWZkZWYg
Q09ORklHX0hBU19QQ0kNCj4NCj4gV2h5IHRoZSBzZXBhcmF0ZSAjaWZkZWY/IENhbid0IHRoYXQg
YmUgZm9sZGVkIHdpdGggdGhlICNpZj8gQXJlIHRoZXJlIGZ1cnRoZXIgY2hhbmdlcw0KPiB0byBi
ZSBwdXQgaW5zaWRlIHRoZSBvdXRlciAjaWY/IChBcHBsaWVzIGFnYWluIGZ1cnRoZXIgZG93biBh
cyB3ZWxsLikNCj4NCg0KQmVjYXVzZSBsYXRlciBpbiBEVC1zdWJzZXQsIHdlIHdhbnQgc29tZXRo
aW5nIGxpa2UgdGhlIGZvbGxvd2luZzoNCmBgYA0KI2lmIGRlZmluZWQoQ09ORklHX0hBU19QQVNT
VEhST1VHSCkgJiYgZGVmaW5lZChDT05GSUdfTUdNVF9IWVBFUkNBTExTKQ0KI2lmZGVmIENPTkZJ
R19IQVNfUENJDQouLi4NCiNlbmRpZg0KI2lmZGVmIENPTkZJR19IQVNfREVWSUNFX1RSRUVfRElT
Q09WRVJZDQouLi4NCiNlbmRpZg0KI2VuZGlmIC8qIEhBU19QQVNTVEhST1VHSCAgJiYgTUdNVF9I
WVBFUkNBTExTICAqLw0KTGV0dGluZyBIQVNfUEFTU1RIUk9VR0ggICYmIE1HTVRfSFlQRVJDQUxM
UyBiZWluZyBvdXRlciB3cmFwcGVyIGFuZCBhIHNlcGFyYXRlICNpZmRlZiBDT05GSUdfSEFTX1BD
SSBoZXJlIGNvdWxkIGF2b2lkIGV4dHJhIGNoYW5nZXMgaW4gRFQgY29tbWl0Lg0KDQo+ID4gIHN0
YXRpYyBYU01fSU5MSU5FIGludCBjZl9jaGVjayB4c21fZ2V0X2RldmljZV9ncm91cCgNCj4gPiAg
ICAgIFhTTV9ERUZBVUxUX0FSRyB1aW50MzJfdCBtYWNoaW5lX2JkZikgIHsgQEAgLTQyOSw3ICs0
MzAsOCBAQA0KPiA+IHN0YXRpYyBYU01fSU5MSU5FIGludCBjZl9jaGVjayB4c21fZGVhc3NpZ25f
ZGV2aWNlKA0KPiA+ICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihhY3Rpb24sIGN1cnJl
bnQtPmRvbWFpbiwgZCk7ICB9DQo+ID4NCj4gPiAtI2VuZGlmIC8qIEhBU19QQVNTVEhST1VHSCAm
JiBIQVNfUENJICovDQo+ID4gKyNlbmRpZiAvKiBDT05GSUdfSEFTX1BDSSAqLw0KPiA+ICsjZW5k
aWYgLyogSEFTX1BBU1NUSFJPVUdIICYmIE1HTVRfSFlQRVJDQUxMUyAqLw0KPiA+DQo+ID4gICNp
ZiBkZWZpbmVkKENPTkZJR19IQVNfUEFTU1RIUk9VR0gpICYmDQo+ID4gZGVmaW5lZChDT05GSUdf
SEFTX0RFVklDRV9UUkVFX0RJU0NPVkVSWSkNCj4gPiAgc3RhdGljIFhTTV9JTkxJTkUgaW50IGNm
X2NoZWNrIHhzbV9hc3NpZ25fZHRkZXZpY2UoDQo+DQo+IFRoZSBEVCBjb3VudGVycGFydCwgb3Rv
aCwgaXMgc2VwYXJhdGUgYW55d2F5Lg0KPg0KPiBKYW4NCg==

