Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7924AE5D51
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023161.1399086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxej-0004DR-9m; Tue, 24 Jun 2025 07:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023161.1399086; Tue, 24 Jun 2025 07:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxej-0004Bk-6X; Tue, 24 Jun 2025 07:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1023161;
 Tue, 24 Jun 2025 07:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uTxeg-0004Be-Rf
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:01:19 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2412::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04c31ec4-50c9-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 09:01:16 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB6936.namprd12.prod.outlook.com (2603:10b6:510:1ba::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 24 Jun
 2025 07:01:10 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 07:01:10 +0000
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
X-Inumbo-ID: 04c31ec4-50c9-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHCTXoyU4979xWvloFyR/hj85+jCLgOwsUa15QCm0mY4mgqv5Y2mp3+c68JqmIfxL6uEoINwvZGPcThPoZHt2suu1sXEV8rXnbJcP+Ugd3p4oORKQP/hmzYVjJQIp+W2mLd8vX++mHM2D+ScPm08loi3grjfwCgKSSKYmNKm/ODuVM6kXcF8p6gIKGoiXd2BeIPYtKmM11XN1FeLtgL/TFp9ROM9Fpvijw5ULsIdDij3wvGZQlgtvWpi6g5cfguF/ofm64kb9Y4uxyZNxFADLhNZ9qifHq+Kuo+f0Sw+14Nf8KcDJ8zcNBSqHvvAtsyffrPUBG5LLcNcwICsQnOy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0G8RpxyseQ+LwX4bSHiNKqzn/0U9DNZI25y3B63mNI=;
 b=MeoQJKugsd33elynreIwy53dVKlj04/ccZpQDc6U8khGAS+PliQlzAaPaAUT6dgAuWrJ7PULmHywfovXSNxYvsNMYownyNVp+yc2IAWDcJ9BAeIrArW8zbbHbLwSHYjamTtxXDswUP2+l5bIbRRrVtkTouaqUvQA3XZ8FWZ9B45f3OXv9f8kJlGMknDy3rzapDBGm3ZKbiyL+NVKVG0EVSLC9E/jJIqL0i0KHOZqoNShsCoI5e/F5fW8GjCyxdNC6SlJbkD8qN1AnCaoaQBTA70GksbThYDKbxSxyFnbmdpjjTUGmwnUGbzk16tFdjJqQrD2Ig3pvS7tjVWuZNu8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0G8RpxyseQ+LwX4bSHiNKqzn/0U9DNZI25y3B63mNI=;
 b=X2nVWw+c4QOs9mzgfTjztxON1xkBrx33vDXivSV3TNp/61WhPQu1JhB5SS5a8gm4m8Cs5S3z0EYPTXU4Ho8xWVabtoOLdg+rX1lmXJ2i3+ukYyWjnmHBvCxF2SiEaoysMWrlHjWcVCqVGytT+cSUlTv0uNc2PGa1ybh9JClsQB4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Topic: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Index: AQHb23yZHYwoBN0glE68BnOedByoqrQI+ZKAgAFXGYCAAVGyAIAG16sA
Date: Tue, 24 Jun 2025 07:01:10 +0000
Message-ID:
 <BL1PR12MB5849022F40DDD22BABBC27A5E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-2-Jiqian.Chen@amd.com>
 <669877f5-ef34-4552-9cfc-e097d40d444a@suse.com>
 <BL1PR12MB58492A07F1E9491B1F8D8E00E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d8095395-fd6b-49a4-86c8-0a3d6c5a1a71@suse.com>
In-Reply-To: <d8095395-fd6b-49a4-86c8-0a3d6c5a1a71@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB6936:EE_
x-ms-office365-filtering-correlation-id: 399fe74a-0dca-48cc-e79c-08ddb2ece693
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OVRZZmh6QnN0NGJoUjNuTHNLZ0ZZTTRKYm4yUlBNYUhsbWNSbDExMXVlN2Z6?=
 =?utf-8?B?TDdUbHFwcVFYOUM2N0dwQ3hwQ1RDanZjR05LRjNtTjFNT25ud0RIZHR1eTJK?=
 =?utf-8?B?dzVrcTE5VDg3Ym5BcThjeDNjNytRdExXZ3BJL3k5bXpVTm9WanhqYUtDU1FS?=
 =?utf-8?B?cHdid2ljeGZnVWp5WjFYeklIWnZFZEJyTUdrNGloL1c5MC8xekRHRUY1dU1Q?=
 =?utf-8?B?THBuSHpieTRYOVpnOGMvRTArcWdHY2V0cHQxL0QwRldrdXlSNmNYZTBNd2w3?=
 =?utf-8?B?VnJOYXpYakprdzlxTTBxdUxBd2JVZFRmNFBEWHNxNkx3cWIxREtDaUNIdjY5?=
 =?utf-8?B?TWtsVW95aDd6K1BIVVNKZzNINnRCQkdoemdBNFl6Qmx3SzZlczBBNDQzRXV5?=
 =?utf-8?B?WjM2UmZBT3d1QnVURndrUUpMNTgzMVRUTHFZeUVPTXBNazEyVzcvaEY1Mlh2?=
 =?utf-8?B?YzJYYzhDS3VQZ1VtNkYwMExaU3pTSjhZckpuNWlYejdxcnlHMk50dDdiK2Rr?=
 =?utf-8?B?cVdQOGI5eGRXd3JzZWdIQ1dvTDUrbVdqNGRlT1lQYTVOQmtLWVdKUTk2M1pQ?=
 =?utf-8?B?akUzOFA1aHpUWnk5YkR1YWhrN0RhS3JIZEQyU3VtUFRNODdiaUFLNjlTd2kz?=
 =?utf-8?B?MVpycm1BVDZDaE5ZSjdibjJnUlZxOUViZzNpbGgrSk1KS2NueGd5MjEvU3JF?=
 =?utf-8?B?RkpXbmQ1aHVzbURIcVdxZXdacnZBV2pWZU04MG4xb3NCbGtBYWZzb2ZwZkdN?=
 =?utf-8?B?MVovaU8yKytDQmhxU1RObG9EbjEvOXdtK1JzVXl6WU82TjNzOWhsQThRMEty?=
 =?utf-8?B?aHNUczQ4NnFpZEh5VkNzaFVHY09iaDdpaTZFY0IxSzhFWFRiNCtYOGZqWUpY?=
 =?utf-8?B?ZlNvS25VZk1mVXhKZUVCMGNSb2VTTDkyQnd2ZzBNUTJlc1VIWUhzQngyNjVm?=
 =?utf-8?B?cjVCOXRXbmdPN1NxaG5sdklWN0t2OGFxbS9mTFJOaTFuRlhTMXBiMUZuNE1I?=
 =?utf-8?B?TjhheWJJaUc4d1FmWGlsL1prRWVoZHlEUEM3WkM1RHZ0eWtJUEl4cDVNeGx6?=
 =?utf-8?B?Vy9ndmV6K0FpdnlvK291TzFkQlo3QnNOU1lPa2l6UmI3VkNQbHlPY3pGb3hq?=
 =?utf-8?B?YjVuVE9lSFFmMkJqbkRqa01aQnRhUkpKbkZHeVFpOTJ0L2FXU09Pb2VlRlk3?=
 =?utf-8?B?UmhTRlVkc3dJV0VhbDVVMGFYb2xqenFnbm5RUG9HYjJGVk5ySDVJQUZxaGVp?=
 =?utf-8?B?ZUdXd1BmTmdYbWM0eU9pMEdyaFVBMXdENDg3TmltVHgwYnk4RUFDc1IvV3Rl?=
 =?utf-8?B?cnl3ZEtsQWxISXZ6V01JeDk4UlFsdm9ubW9SU2VGenc2RmQ4YWtnbm9nU0hL?=
 =?utf-8?B?U0NPR2U4L0p6YlpPcEhjTkFyZC8xTW9udWN0T1VrWEFHVFNkNVNwdGZ1dk80?=
 =?utf-8?B?QWlQZTlJeExLc2x4NUNPa2RJMUh0MUtGQjBIaVBxUWxmR1c1czZ4YXgwZnNi?=
 =?utf-8?B?c2I2RFFBYzFqQUJBdEs5ZFUvdGJxNWRwaFNveXF6WUNWRFMrMFZhbDFkaEJX?=
 =?utf-8?B?T296VHZoRXBCL2RCbjZwUnIrT0MzUUNjNFZURmVrdXkyamxNanlkVEVQcTQy?=
 =?utf-8?B?Wm1waGVoRFF5eDZvY3VqK1oyVDlLUk93UXp6cGJXVWM2WFNuM3lLY25COW1G?=
 =?utf-8?B?bHNUd3hBVmhtTXQyWnhxUmtNdEZaMzNJZkpaL1FOM0IzTUlPN1BFMlpEL0xB?=
 =?utf-8?B?K3Y4L0J2dVVjMnRMc1hROVhxTFB5OGE5UU9sODhtR042ZzdtUFV4aHl4QVhB?=
 =?utf-8?B?N3NERlFRMVNPclN6WmcxdGJHbzlQTlFTam5tcVExQmIwaWwvUmhVdzJnMmYx?=
 =?utf-8?B?TnNqWHVGWTN1NEVkR1NnSWxNQXBJcVdGalFaL3dXc3pBU1lIb1V5c1VLSk5v?=
 =?utf-8?B?TTIzZTFZR0dvQ212RzJ5b1NrRngwVVVKL2RvemdneFhTRWhHZ2dCSExTMlhO?=
 =?utf-8?Q?rHi6lJ+GrdTEmohOB0epWefnjosr1A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nm5nTXZJYS9CN2FVTy9Icm5FS2hhQTBvN0kvSzVoQlNISjRZZDdJUGVoblZQ?=
 =?utf-8?B?aWNKTmoyOFI4anBuZ1NJSkVIbGFSU2NOeGZSSENQeW1SRzA0VUcxc2RPazNK?=
 =?utf-8?B?ajlpaHE0blJiL0huYlAyV2traTQ1L2l4SGxNMlRGWDFPUzBZUGo4WWQ2VndM?=
 =?utf-8?B?L1NnYmxPckZHUEhxOGFrTk84Q2NhSnk2a0N1L3FicjBnU1VHWW1VVGVFbHYz?=
 =?utf-8?B?SWs2SlBKNHRPOTc2UzBXU0ZDMnE3UVdzbS9iTXlqVE5FRkpKelN3VVZwQ1Yz?=
 =?utf-8?B?WVl6d1JLcmJIRjU2SFJSUHdkQ20zOTQrVElKMmNlSTNpUjFnSml4NkpjbFIy?=
 =?utf-8?B?b3hacjgxK21CRXgzZkw0aDZRRXpLaitvb1pmdHc5czl6dG43N2xwL1ppdEVK?=
 =?utf-8?B?NVpjV1ZsY3N2NzZuVWxUOUZrWFpJMkdQSkJCZzFyZ2ZpUnU3RlhuNVEzamh4?=
 =?utf-8?B?UThJRkpBTXo5bGRKMXdQZWxud0JsYVczN05UZ3pnblR5Y2VmdDBYeitjNDcr?=
 =?utf-8?B?SHkrS251TzZpSTV6SG5yWFkvZVRoSVFSWEtocWF0bEhHMUZFclNXa21jcmdj?=
 =?utf-8?B?bkh3WXJ0eDFLdGdFNkJwblNYWXVJdmtTMHE5MmF4ZFU1MlZYMFYreHFXaU1R?=
 =?utf-8?B?QnBhZXZhemtmZEFhdzQxcmgzS0dlWEhBSXYzWGJvdm1DV0Y5S0NaM2lhQ0Rz?=
 =?utf-8?B?Q1NMbnduZkZFeHlQSjV6b1ZweXFlUkVrSjBrYllTWFltcnk3RHZFeUdCYmF6?=
 =?utf-8?B?ZFpvY0FlK3o0ZmNwZWpOL01CM2t1YnVNaWljbGg4b1dzUXlHRmczdGV0NWhm?=
 =?utf-8?B?TjA2TmoyVVQ0eFBoYmFOclNzT3RaYnZJZ2xRV050dUFSclh4bnZTZFhjTllr?=
 =?utf-8?B?SmJDQWpOaFlJeWFiWWFuTlllVndXSnRLUDlDeHNqM3J6WHhIT09DMk12MVpT?=
 =?utf-8?B?WWxPN3UzYjNFL2RTdXZ5TXRwU1BjengxYkRiMndFenRZbE05RjBoSWRVcXRi?=
 =?utf-8?B?R3ZWYllTZTJZbkZQWVpJaGc3SWM3dGdRbSthNlZCQm1rakt0VG1sQVFCNTNr?=
 =?utf-8?B?UVJnQ1RxanBJemNtcWoxdDQzRFpSMWVXVTFyVlk5UjZ0OHBYbWc4a2ZjQVJP?=
 =?utf-8?B?OW04UmkrTUNiSytVcTg1U2hmcGE2blhSeGFCb2xSQ05iUndwVHg2YzNnZXpB?=
 =?utf-8?B?aGZ3TGlIaUkzclU1YWxyS3hHUkhUYmdIQnE2SUFndGFyZ05KaTB3aCt2SUhC?=
 =?utf-8?B?QmtLM1UwWmdjL2l6MXc2K3hPOXA4WUhxK2hmcUZkdWUxWnlVeEFlWGR2MzVz?=
 =?utf-8?B?eTVEQ1pLN1hhNVV0SUt0Qzl3ZWlOYitiRCtWeUxhRWgzczJ1TWtKMDRBN3la?=
 =?utf-8?B?NTVtdzZUWXNqVmVsYWxndDVnSDNHbHNVR1VWWlgrUFQ2NEFnbGhuNlR4SkVn?=
 =?utf-8?B?ZmJsQkNYZGFybGZkZHpPcm92SnNnMWR4RURzWDUxTzBCVkszK0gwUUFYRWN0?=
 =?utf-8?B?dFIvWGE2bUQwQ2o2eWh6T2hVcnV6UGZEdFJrSElkNVY5OG1vcjlOUTRNSDBK?=
 =?utf-8?B?QzgwcSs2TmJCTFExYmNrTENLMUJMYnNKV0NLU3lpS21WeUxOQTVlY2c1MHJC?=
 =?utf-8?B?aVZya21taHRQZlRsK2tGa1BhdzVXYjRmNjBPOGhaYlhXZSsyci9Pd1E3UTAx?=
 =?utf-8?B?OVRxOG9LbG1kNWpYK3hWUmcyRnZ1aHR1eGQzamsra2NGbGpUYitUQXg0K2lH?=
 =?utf-8?B?M0hNMDBsbWE1NmpnQkZLcFJiNXZJR2Y2QmJnS3RUVEVWRUlKb2pGMVE2RnhK?=
 =?utf-8?B?djB6VFZ1WnBPY2JCS1RpaFMweHFsdm5EYys1aDE0bnNHdnUrZElUYi81cld6?=
 =?utf-8?B?a083cDVQN2YxYmZMTk5VSm5DRGFaODEyb0k0QXhnYXdTU1VBZEw0TE5ya0c3?=
 =?utf-8?B?MHgwTm1oZno3VUU4N0wwNms2MHF3QWpSZEtHOXEzY0dSczA0dWFPcEFTR1ZZ?=
 =?utf-8?B?eXlxMkI5amRMa0lnYWlVeWVsdTFhdzRoeU9BUjV1V2RhUTJFZEdMekNpb0ZQ?=
 =?utf-8?B?ZDRENzRETVNBVVh5UXJUK3BodGd4ZXNBSEJYQmFiY1d3KzRxUE5wRkViQnRh?=
 =?utf-8?Q?lLYw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63FAC9A06786224BA7AAE2721DFC0395@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399fe74a-0dca-48cc-e79c-08ddb2ece693
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 07:01:10.6502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D6+u5ewYS3GJfmIMrR1XK0MX2PCIhL0TT+9MrM3f26UQMGoY1atcMs3Xe/vCi82bRj0AI7jBH8XhAgps8VaXfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6936

T24gMjAyNS82LzIwIDE0OjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDYuMjAyNSAw
NDoyOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzE4IDIxOjUyLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+PiArKysgYi94ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jDQo+Pj4+IEBAIC04MzYsNiArODM2LDQyIEBAIHN0YXRpYyBpbnQg
dnBjaV9pbml0X2NhcGFiaWxpdHlfbGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfU1RBVFVTX1JTVkRaX01BU0spOw0K
Pj4+PiAgfQ0KPj4+PiAgDQo+Pj4+ICtzdGF0aWMgaW50IHZwY2lfaW5pdF9leHRfY2FwYWJpbGl0
eV9saXN0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiArew0KPj4+PiArICAgIHVuc2lnbmVk
IGludCBwb3MgPSBQQ0lfQ0ZHX1NQQUNFX1NJWkU7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoICFp
c19oYXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWluKSApDQo+Pj4+ICsgICAgICAgIC8qIEV4dGVu
ZGVkIGNhcGFiaWxpdGllcyByZWFkIGFzIHplcm8sIHdyaXRlIGlnbm9yZSBmb3IgZ3Vlc3QgKi8N
Cj4+Pg0KPj4+IHMvZ3Vlc3QvRG9tVS8gPw0KPj4gV2lsbCBkby4NCj4+DQo+Pj4NCj4+Pj4gKyAg
ICAgICAgcmV0dXJuIHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWws
IE5VTEwsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MsIDQsICh2
b2lkICopMCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICB3aGlsZSAoIHBvcyA+PSBQQ0lfQ0ZHX1NQQUNF
X1NJWkUgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgdWludDMyX3QgaGVhZGVyID0gcGNp
X2NvbmZfcmVhZDMyKHBkZXYtPnNiZGYsIHBvcyk7DQo+Pj4+ICsgICAgICAgIGludCByYzsNCj4+
Pj4gKw0KPj4+PiArICAgICAgICBpZiAoICFoZWFkZXIgKQ0KPj4+PiArICAgICAgICAgICAgcmV0
dXJuIDA7DQo+Pj4NCj4+PiBJcyB0aGlzIGEgdmFsaWQgY2hlY2sgdG8gbWFrZSBmb3IgYW55dGhp
bmcgb3RoZXIgdGhhbiB0aGUgZmlyc3QgcmVhZD8gQW5kIGV2ZW4NCj4+PiBpZiB2YWxpZCBmb3Ig
dGhlIGZpcnN0IG9uZSwgc2hvdWxkbid0IHRoYXQgYWxzbyBnbyB0aHJvdWdoIC4uLg0KPj4+DQo+
Pj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9yZWFk
X3ZhbCwgdnBjaV9od193cml0ZTMyLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBvcywgNCwgKHZvaWQgKikodWludHB0cl90KWhlYWRlcik7DQo+Pj4NCj4+PiAuLi4gaGVy
ZT8NCj4+IElmIGhlYWRlciBvZiBmaXJzdCBpcyB6ZXJvLiBUaGVyZSBpcyBubyBuZWVkIHRvIGFk
ZCBhIHJlZ2lzdGVyIEkgdGhpbmssIHNpbmNlIHRoZSBkb20wIGNhbiByZWFkL3dyaXRlIGRpcmVj
dGx5Lg0KPiANCj4gV2VsbCwgbXkgcmVtYXJrIG9mIGNvdXJzZSBkaWQgZ28gYWxvbmcgd2l0aCB0
aGF0IGZ1cnRoZXIgZG93bi4gUGx1cyBJIHdvbmRlcg0KPiB3aHkgdGhlIGVudGlyZSBmaWVsZCBi
ZWluZyB6ZXJvIGlzIHNwZWNpYWwsIGJ1dCB0aGUgZmllbGQgaG9sZGluZywgc2F5LA0KPiAweDAw
MDEwMDAwIGlzbid0LiBZZXMsIHRoZSBzcGVjIGNhbGxzIG91dCB6ZXJvZXMgaW4gYWxsIGZpZWxk
cyBzcGVjaWFsbHksDQo+IHlldCBhdCB0aGUgc2FtZSB0aW1lIGl0IGRvZXMgc2F5IG5vdGhpbmcg
YWJvdXQgY2VydGFpbiBvdGhlciBzcGVjaWFsIHZhbHVlcy4NCklmIHdhbnQgdG8gY292ZXIgdGhl
c2Ugc3BlY2lhbCB2YWx1ZXMuDQpTaG91bGQgSSBuZWVkIHRvIGNoYW5nZSB0aGUgY2hlY2sgZnJv
bSAiIWhlYWRlciIgdG8gIiEgUENJX0VYVF9DQVBfSUQoaGVhZGVyKSIgPw0KDQo+IA0KPiBKYW4N
Cj4gDQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+ICsrKyBiL3hlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IEBAIC0yNjcsNiArMjY3LDEyIEBAIHZvaWQgY2ZfY2hl
Y2sgdnBjaV9od193cml0ZTE2KA0KPj4+PiAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2Jk
ZiwgcmVnLCB2YWwpOw0KPj4+PiAgfQ0KPj4+PiAgDQo+Pj4+ICt2b2lkIGNmX2NoZWNrIHZwY2lf
aHdfd3JpdGUzMigNCj4+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWdu
ZWQgaW50IHJlZywgdWludDMyX3QgdmFsLCB2b2lkICpkYXRhKQ0KPj4+PiArew0KPj4+PiArICAg
IHBjaV9jb25mX3dyaXRlMzIocGRldi0+c2JkZiwgcmVnLCB2YWwpOw0KPj4+PiArfQ0KPj4+DQo+
Pj4gSWlyYyB3ZSd2ZSBiZWVuIHRoZXJlIGJlZm9yZSwgeWV0IEkgY29udGludWUgdG8gd29uZGVy
IHdoZXRoZXIgd2UncmUgZG9pbmcNCj4+PiBvdXJzZWx2ZXMgYW55IGdvb2QgaW4gYWxsb3dpbmcg
d3JpdGVzIHRvIHNvbWV0aGluZyB0aGF0IGNlcnRhaW5seSBiZXR0ZXINCj4+PiB3b3VsZG4ndCBj
aGFuZ2UuIEV2ZW4gaWYgd2UgbGltaXQgdGhpcyB0byBEb20wLg0KPj4gSSByZW1lbWJlciB0aGlz
IHdhcyBzdWdnZXN0ZWQgYnkgUm9nZXIgaW4gVjIsIHNpbmNlIHRoZSBEb20wIGhhcyBubyBsaW1p
dGF0aW9ucyB0byB3cml0ZSB0aGUgZXh0ZW5kZWQgcmVnaXN0ZXIuDQo+Pg0KPj4+DQo+Pj4gSmFu
DQo+Pg0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

