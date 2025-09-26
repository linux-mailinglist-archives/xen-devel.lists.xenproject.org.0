Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D706BA2ED3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 10:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131315.1470461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23ia-0004JO-1K; Fri, 26 Sep 2025 08:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131315.1470461; Fri, 26 Sep 2025 08:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23iZ-0004Gp-U3; Fri, 26 Sep 2025 08:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1131315;
 Fri, 26 Sep 2025 08:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cR/D=4F=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v23iY-0004Gj-5A
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 08:22:14 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e632fd19-9ab1-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 10:22:12 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 08:22:07 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 08:22:07 +0000
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
X-Inumbo-ID: e632fd19-9ab1-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfwxKKtJFpENHGTe4sbxsg6qpbTUNTx1N7H81E2Zf4q7KbeS5T4kEgK71CouTYBYwXiHHXYtJ1VzXfwaYQx0NWiCvV/LM3W+M+HQ6Ieqo01JrrBg6Aj0aR67mWm7BO77Vu/9OH/3heZ4c+9/A2Q2WG+Uhib2z6mx95DqVWywp8c+WWFlcVixi1IfrhQlFwv9BZ2MFE7xqcAeCaYu7NqGPTD4UPvdyDTdnSOD15256LZFsCLMdV3W0uaVBjjnCIQob3Qbt06NMNvk1ErkRE6VYg2c8Aih0OhanppYIxgqz62r1tS/18ILXLez1fH1NgZTvwJSadNLnGG3f2aTtU/DKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Paqch4I5Kcn8DfAi0HYDjktgrDAoMBsu+0Mz67qe/Vc=;
 b=Yri0UfMKy//0u9xIG8ChFwEuqYV/h35JNEQwxuRifZ0Q0IZPbvuuqLojuC/v2rK1nQPVfvooAxi/0a1vzNdZHscQa2Bw/yL6ebZ6MtmbaN2YAl6OgqH8t8cvBYUdtmxQTx/B+zUvE+gUDGrxryI4yTt0pd+eHDRgN9k032EXpPNGPD2j0J3uAp+OaoM0Ws5UoQAaUpXkPjWGp25rPJyUoXVPrgAg1iNEzyH/8BKHlYqDN9FhOfqN8EAsTPJZmO8EnNL5EbY/xlxKELAt68/6LwdHQfqh4wUM/5mau+4esEqBnnEXDvMV2RRkjN8Nj23/rchTQlyOxza2UoEv5Q3KBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Paqch4I5Kcn8DfAi0HYDjktgrDAoMBsu+0Mz67qe/Vc=;
 b=mxotUTmbfmMdGoTBhd1HDaWGjiDUBq63vs05kwjlQpv/Af8G/YzA4BxsTrkWfhx69xKb/cJhCb01FV4AslFLLESUPlwNRJo6rLVNxSBi6Ry0NGssc9bmu6dXzpkLrg268VY+VNsKKiDUDO8s9mFhEm9uOBfFW/Je9QOjX+sbjBo=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Andryuk, Jason" <Jason.Andryuk@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: RE: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index:
 AQHcIiYYEaVyPVCsmkah0K573htVM7SN/BaAgBWuJICAAGLSAIAA6DCQgAAq/ICAAADyQIAABM8AgAAQxiA=
Date: Fri, 26 Sep 2025 08:22:07 +0000
Message-ID:
 <DM4PR12MB845154E8F43D440FEADFF59BE11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com>
 <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <af57c032-541d-4956-85de-269066c50cd3@suse.com>
 <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <a5224376-f89d-4a2f-8a74-e5256352f754@suse.com>
In-Reply-To: <a5224376-f89d-4a2f-8a74-e5256352f754@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-26T08:14:15.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ1PR12MB6195:EE_
x-ms-office365-filtering-correlation-id: 37e70026-fe1e-4d16-a1e3-08ddfcd5c81b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QVFjcnNuN05DLzJOMWlSdU81Q2RVcmx4MmpOU0I5V3AvSWIwSkpZMUFoQWZr?=
 =?utf-8?B?Zy9DSjlDaDNBOE1LM0w5VGk2a3dEUFNwdCtUZlBqRjd0UXhMZnpDQ2hZRTVs?=
 =?utf-8?B?RWliWWY0NGhDbVNjUjEvYnlOaENPakRTb3BaSXRMZUFmdWprTE5ybW5xcTIw?=
 =?utf-8?B?MnN6Y0pNWjV2aWdFRUpGT2VCc1Y2enFVR0VlZWxUVW1hWDJzTEhrWW4rVmFI?=
 =?utf-8?B?K2tLdHZBRlplYi9yYjUwWWZBWXFGQXowUnNNWTF2VnZNeWxySFVvZC9tUjN2?=
 =?utf-8?B?dGRNQWoxL2hod2ZyRSt4SExGRElZVEJJTDRXNHZrTnlqN081czM1Z1ZHNW9j?=
 =?utf-8?B?bjRqdTZvL2ZKSVdHZUx2R2kxOENTREJzeU5ETDNmNmtJckUzbldzOEE4azJm?=
 =?utf-8?B?azhsaGhPSWRLLy9pMVVTTjltWVpLY0dSaU1mSEQyWWtDOXplQ0U5U1ZDOGFY?=
 =?utf-8?B?RGVxYUQ3c28xWERnRUw5WnZrWVJqcU1Rc0xjZ3ZwSWdlaDZpYWtjL283TWlK?=
 =?utf-8?B?SUZsb2hySDFNSXhkM2pmWlg0UVhHU250UFQ2ZXdxN0NyR0N4MVpkK1RMeWVG?=
 =?utf-8?B?a1J2UHcrOWdaVXdFcW5FcjkydEViMzRXbTVXRU9VTmxoN3djRXFBWkxvN3Vr?=
 =?utf-8?B?ejM3NEI4SkJDVE1BSWNPbjBHZlcvOUY4dWFmdkNwWjE5OXZFcTJ1MmliYnBJ?=
 =?utf-8?B?MDI4eXBYbXV1M1RxV3YxN3YxZy9LZW9SREdnZ3dvdUIrMFhtR0h5cnZhZ2F0?=
 =?utf-8?B?MXQxa2h3VGtBelZ6NU52RWNQU01FM0JFVGFLSHFxY2tFdE45QytvMW9UdHVs?=
 =?utf-8?B?U0dhUHNzSER1anowSTR5UjQvSisweXIzckxpelppRGQ5L0VpRWlYcHU1NkFy?=
 =?utf-8?B?VFRpdFo0a0F6cSthUytDTEJFVGl1SVpPWFIwZ055Z2Y4dG1ZcGw1cVJVRHQz?=
 =?utf-8?B?cE5TU3htQWpJeUZiMHFBczZzNXBKbGNXbXBZSnV4VlJJaHFpTjR0NXIxanpr?=
 =?utf-8?B?TmE3ZVpzMFNQY0VvNnQzTWg0ZDRCc0JDTk0rZWhQb20vWEl5OW9lQWFDek0v?=
 =?utf-8?B?dmQybWJPTGlsS09VSFBLMDh3NklXZERwcXU0WG5SOC8waitNSGY2aEFKRGFh?=
 =?utf-8?B?N1grTmZsK01MS3YxbWY0SmlsLyt6N3Z0czRmSytsbzRiR2ZIa3R0Z09YNXdD?=
 =?utf-8?B?RVVDUE4vQmVLRVVDWkJPby9kYlJlTnpBTHpJNGJBRHYvck1DWXA2ZHNZVXh5?=
 =?utf-8?B?RDVUZ0c3SnBrT3ZDNS9BSDJtK0hGZXZUVGoyQnNFVVZ2aHB2U3NlZG4rWjdU?=
 =?utf-8?B?bDBuRHFVV2ZoNzJGa21xSDRTTTMxZ3hGSFhpMk85WjBpNWFMbElHVEt3Rmhp?=
 =?utf-8?B?MW9vZVF2cjFIbmRHa1JLdWpBTGxPbUJ4TWVmekEvUEM2bXF4WCs0aFRBaVlo?=
 =?utf-8?B?U2l1bmcyak05QVUxb1VtNWV6cS9ZL01Ec2w0TVBXVmI5VDVsZU1DSUJLVEwz?=
 =?utf-8?B?TmhrR2FUeTJpZU54MEFzbHliWmpmVXNnaUJaQnRVU1NjR3Y0c0dMdklVWHo1?=
 =?utf-8?B?KzZwS3gyT0dkZ1FWKzk2cXBmQmdxNmN3dmp6QjFPR0pRWXM0bDJQK21RWGFF?=
 =?utf-8?B?azJSZU02d1hROVY5aGwwTUZtNFZQN3hPb2FnOEhwYktsWjBzd3daL0hTbXA3?=
 =?utf-8?B?a3lNOVIwazZ4WXY1VmZXZmlsSko4Y1ZtUFhRc3ZUN3hpTmhHWUhubFNremRL?=
 =?utf-8?B?RStZU1BuYm5jVGhBNW9GbWlLL0hHNTV0ZDhCVWxmcDExUlFqeVppQmVGSzVV?=
 =?utf-8?B?K3JPdlV1V04vekwyVE91NTZNSkVEeTlFYlo3RG1qTU5rUFdrczRsS1hRenNP?=
 =?utf-8?B?Q2JtNDBCRVg2RzRpd3JDV2M4UE1KemtxZjh5d0o0TnpudFV3WDFaenJtaVRI?=
 =?utf-8?B?dkNWZ2d0QzhNVGttYnVJL3JnMlY2L2I1bFVhbE5YOHp2NmZtN1NlR09xU1l0?=
 =?utf-8?B?TGp2bkczRUdKbXczdU5pNVhOdENSU1lDQXoxTVBwb0M2ejBabng1OVJWN2J1?=
 =?utf-8?Q?ogCGYb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlhhWm9ta3pTOURwdW5YSnRCS0pUNWFwOWVod1pqNEd6cDJYT1ZlVk5lKy9G?=
 =?utf-8?B?SU5nc3RleFlXOVhpUFNWQ2lkcGR2TFM3L0tRYmFpRGZUbVRnay9WR3N4eVhz?=
 =?utf-8?B?UTJJSkZtMHlNaUg5cWpiK1l2ZGRwVU1xNm9jR3FscW1kQXpwdUZCMHpLU09G?=
 =?utf-8?B?NUlxQTNzczRJcWlFa2tKUzI0dmsxRTRXN0xoc1ZPNlA3Q0ptY3BLN2VuZkRO?=
 =?utf-8?B?OXFtOHBUeUFoTVF2VVkzUDlrVHZGbjFFTTY4VC82eGtnSGNWcWswYlpyeUVy?=
 =?utf-8?B?a1BQeXNTbk1QNll6cDdqNWpuWlNadldHV3d2biswbU82aVl6cFJyeFZQemhJ?=
 =?utf-8?B?VUgzd1JHRlE1MlhMRjB3bG9ndW1qKzdNRWdaR09FYy9pMk9USnd1NjNvTUhq?=
 =?utf-8?B?QlkrMEMrV1RyR1dad29XZUJxcmZpUTd6ckZ2allhcEJxSVcwQTRrZWJKL08z?=
 =?utf-8?B?L0JwNWhsT2lhTTY2d1FFdmVOZWg1bG5lL3cwN0NNQ2FSa2pxekcvbkozOUcr?=
 =?utf-8?B?dE5mL0hjQ1VLVW1LYTlGaUdZZHZhL0gvWi82MEpPelR4d3hKWTBhT0wxdExO?=
 =?utf-8?B?ampYbWFCZDNXVEdZL2FUTllpWXdDVWZzUFdRM0VrOE1lcE40MmhwSGxRNE9q?=
 =?utf-8?B?NWRPYTJXYkYvOTExMDc4aUhpUFVndnN0elZpU29xWFRqL1Vxeng0ZjdVL0VO?=
 =?utf-8?B?SkVwWVBhZW1qVEczOFArM0lrRmVCNEErZWtWcUYxckdYOWF6ZVFQMFc3SnIx?=
 =?utf-8?B?eURrUytOMnVpenpsdTlUV2tXa05SVGc0bXJBT05LczZ0RFJUeUkyOE1nTWdv?=
 =?utf-8?B?Q2NOWVRKNWp3aDVEcG9JUGgzOTRiVWJzeUxudWFmazk2bkVvZkZaQ0tyTVdh?=
 =?utf-8?B?MWs5TTcxdkg2Qm5CWTZULy9tbitaeVY5M3h0Tk8rQnJpYmsxYlEzMDk2cmlm?=
 =?utf-8?B?dlNuMEhaQU42K1QyTTM1SmlmS3lVVWVHNWE0c1VDYTVERlpnekI1R0crSkEv?=
 =?utf-8?B?dnVlWHEraVp1ajlMZEY5bVZSQWpkTjRNWnQxb1dyZlF2R0JZNDVvZjY5Q2E3?=
 =?utf-8?B?dXIvZVMyMVZKSzh1ZFVTUTN4YytjUVdTaTNZdm0wN1BRdzIyTERNa3BzMnRa?=
 =?utf-8?B?UWgxL1RqVm1UUStsS1luV1BJcHpsQ2x1SGhjcFUwN0x6OG9qU25JQ1MzS2ZS?=
 =?utf-8?B?MzQzbDMvUklwdTEyZGorVW9VOHhOSDRHbWtkaTB5L2l3NXJvQU9pSkcxVDVP?=
 =?utf-8?B?dUFKWFBSQVg2L0FmUkxqOTBHMHRmSHFkTUJYbWxQZTAzS3ZMMFVCdUZPZ1pj?=
 =?utf-8?B?MWVXNG9LNkFNRmNXS1B3RnIvMlY1SU9GNWtCUlpiRTJqMmR3MG41Z3BRWlZX?=
 =?utf-8?B?Qlhkb1FzVEw1Q3hETERMYlZXNWE2aXdETWlaK0NMSGtKd3phL0ZWa1FSeWpF?=
 =?utf-8?B?Ylp1dVM1ZG51QmZ5a0M0NFBwOXRxT0FaZ0xCRFNMVjJCNytWMlJNSmZFSWhp?=
 =?utf-8?B?Y3JYSER1MGhyZU9qdVR1SG5YakVYVSsxR24relRmVGd6NUduQzVqT2RHdlNo?=
 =?utf-8?B?WmgxS3BHdzZ0aUpJclcyR2hwYkVQcFMvWC9JNDlkWDhGL3NXUzFCWjVjOWFl?=
 =?utf-8?B?Q2ZQN3crRE9FZUdXeldDRStkQ0c4L3Z1dUU3WGtaYTEwcXpoUm8xOHNXeEMz?=
 =?utf-8?B?dTBVS2llbGJDRHpYVnAyN1pSL281YkJPUTlLNmI5VExGcUVNcUJYeWN4cExl?=
 =?utf-8?B?VzVXUDVaa3lOVWx1UEx1KzdQaE9xS2xBQ3A1YmZQNmdJMTZYZktiQXZqcjZ2?=
 =?utf-8?B?bHlGVzlJYnJMRHlQYWxIMlpMNWVQRnRRTy8zOXpMM1NrUDJ6Q05BZ1dZampv?=
 =?utf-8?B?OEsxVkgxVjFPOTJOVmQ3bFNQdFJ5TVJpaG1GbzdlWFZsWXBjcWFNbHJzalFY?=
 =?utf-8?B?WElrYkJZMEtFZ01KM203NENtRUhYV0hyc3FKYjUwNzBBenFDVVpxREgxSHN5?=
 =?utf-8?B?a0pJZDBXYmovOVdlNUNYT2ZIZzB2cXZHWHFKaDJPWmxEOG5qMDVQUTIrMnNR?=
 =?utf-8?B?cFhhSzBtalpRS3VMRUUwTHBGWkVheDg4MHhHMEwwQUxhKzRrSXNsMm1jTGxx?=
 =?utf-8?Q?UvFo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e70026-fe1e-4d16-a1e3-08ddfcd5c81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 08:22:07.1477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7fc8IYLV+PkOM/BkrOLwHNX/SYAskbrn4lcz4AT9/ierhsNKMIKQncxfY6kiV1IUwmCsj01ai1c8XCpCEcKXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDI2LCAy
MDI1IDM6MTQgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+IDxk
cHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBBbmRyeXVrLCBKYXNvbg0KPiA8SmFzb24uQW5kcnl1a0BhbWQuY29tPjsgQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBB
bnRob255DQo+IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNo
YWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsNCj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBPbGVrc2lpIEt1cm9jaGtvDQo+IDxvbGVrc2lpLmt1cm9jaGtvQGdtYWls
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxOC8yNl0geGVuL2RvbWN0bDogd3JhcCB4
c21fZ2V0ZG9tYWluaW5mbygpIHdpdGgNCj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBP
biAyNi4wOS4yMDI1IDA4OjU3LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMjUgMjo1MyBQTQ0KPiA+Pg0K
PiA+PiBPbiAyNi4wOS4yMDI1IDA2OjQxLCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4+Pj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyNSwgMjAyNSAx
MDoyOSBQTQ0KPiA+Pj4+DQo+ID4+Pj4gT24gMjUuMDkuMjAyNSAxMTo0MSwgUGVubnksIFpoZW5n
IHdyb3RlOg0KPiA+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4+IEZy
b206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+Pj4+IFNlbnQ6IFRodXJz
ZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjUgOTozMCBQTQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIDEw
LjA5LjIwMjUgMDk6MzgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+Pj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hzbS94c20uaA0KPiA+Pj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hzbS94c20uaA0K
PiA+Pj4+Pj4+IEBAIC01NSw4ICs1NSw4IEBAIHN0cnVjdCB4c21fb3BzIHsNCj4gPj4+Pj4+PiAg
ICAgIHZvaWQgKCpzZWN1cml0eV9kb21haW5pbmZvKShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2dl
dGRvbWFpbmluZm8gKmluZm8pOw0KPiA+Pj4+Pj4+ICAgICAgaW50ICgqZG9tYWluX2NyZWF0ZSko
c3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3Qgc3NpZHJlZik7DQo+ID4+Pj4+Pj4gLSAgICBpbnQg
KCpnZXRkb21haW5pbmZvKShzdHJ1Y3QgZG9tYWluICpkKTsNCj4gPj4+Pj4+PiAgI2lmZGVmIENP
TkZJR19NR01UX0hZUEVSQ0FMTFMNCj4gPj4+Pj4+PiArICAgIGludCAoKmdldGRvbWFpbmluZm8p
KHN0cnVjdCBkb21haW4gKmQpOw0KPiA+Pj4+Pj4+ICAgICAgaW50ICgqZG9tY3RsX3NjaGVkdWxl
cl9vcCkoc3RydWN0IGRvbWFpbiAqZCwgaW50IG9wKTsNCj4gPj4+Pj4+PiAgICAgIGludCAoKnN5
c2N0bF9zY2hlZHVsZXJfb3ApKGludCBvcCk7DQo+ID4+Pj4+Pj4gICAgICBpbnQgKCpzZXRfdGFy
Z2V0KShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICplKTsgQEANCj4gPj4+Pj4+PiAt
MjM0LDcNCj4gPj4+Pj4+PiArMjM0LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IHhzbV9kb21haW5f
Y3JlYXRlKA0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gIHN0YXRpYyBpbmxpbmUgaW50IHhzbV9nZXRk
b21haW5pbmZvKHhzbV9kZWZhdWx0X3QgZGVmLCBzdHJ1Y3QNCj4gPj4+Pj4+PiBkb21haW4NCj4g
Pj4+Pj4+PiAqZCkgIHsNCj4gPj4+Pj4+PiArI2lmZGVmIENPTkZJR19NR01UX0hZUEVSQ0FMTFMN
Cj4gPj4+Pj4+PiAgICAgIHJldHVybiBhbHRlcm5hdGl2ZV9jYWxsKHhzbV9vcHMuZ2V0ZG9tYWlu
aW5mbywgZCk7DQo+ID4+Pj4+Pj4gKyNlbHNlDQo+ID4+Pj4+Pj4gKyAgICByZXR1cm4gLUVPUE5P
VFNVUFA7DQo+ID4+Pj4+Pj4gKyNlbmRpZg0KPiA+Pj4+Pj4+ICB9DQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gVGhpcyBpcyBpbiB1c2UgYnkgYSBYZW5zdG9yZSBzeXNjdGwgYW5kIGEgWGVuc3RvcmUgZG9t
Y3RsLiBUaGUNCj4gPj4+Pj4+IHN5c2N0bCBpcyBoZW5jZSBhbHJlYWR5IGJyb2tlbiB3aXRoIHRo
ZSBlYXJsaWVyIHNlcmllcy4gTm93IHRoZQ0KPiA+Pj4+Pj4gZG9tY3RsIGlzIGFsc28gYmVpbmcg
c2NyZXdlZCB1cC4gSSBkb24ndCB0aGluayBNR01UX0hZUEVSQ0FMTFMNCj4gPj4+Pj4+IHJlYWxs
eSBvdWdodCB0byBleHRlbmQgdG8gYW55IG9wZXJhdGlvbnMgYXZhaWxhYmxlIHRvIG90aGVyIHRo
YW4NCj4gPj4+Pj4+IHRoZSBjb3JlDQo+ID4+IHRvb2xzdGFjay4NCj4gPj4+Pj4+IFRoYXQncyB0
aGUgWGVuc3RvcmUgb25lcyBoZXJlLCBidXQgYWxzbyB0aGUgb25lcyB1c2VkIGJ5IHFlbXUNCj4g
Pj4+Pj4+ICh3aGV0aGVyIHJ1biBpbg0KPiA+Pj4+IERvbTAgb3IgYSBzdHViZG9tKS4NCj4gPj4+
Pj4NCj4gPj4+Pj4gTWF5YmUgbm90IG9ubHkgbGltaXRlZCB0byB0aGUgY29yZSB0b29sc3RhY2su
IEluDQo+ID4+Pj4+IGRvbTBsZXNzL2h5cGVybGF1bmNoZWQNCj4gPj4+PiBzY2VuYXJpb3MsIGh5
cGVyY2FsbHMgYXJlIHN0cmljdGx5IGxpbWl0ZWQuIFFFTVUgaXMgYWxzbyBsaW1pdGVkIHRvDQo+
ID4+Pj4gcHZoIG1hY2hpbmUgdHlwZSBhbmQgd2l0aCB2ZXJ5IHJlc3RyaWN0ZWQgZnVuY3Rpb25h
bGl0eSgsIG9ubHkNCj4gPj4+PiBhY3RpbmcgYXMgYSBmZXcgdmlydGlvLXBjaSBkZXZpY2VzIGJh
Y2tlbmQpLiBAQW5kcnl1aywgSmFzb24NCj4gPj4+PiBAU3RhYmVsbGluaSwgU3RlZmFubyBBbSBJ
IHVuZGVyc3RhbmRpbmcgY29ycmVjdGx5IGFuZCB0aG9yb3VnaGx5DQo+ID4+Pj4gYWJvdXQgb3Vy
IHNjZW5hcmlvIGhlcmUgZm9yDQo+ID4+IHVwc3RyZWFtPw0KPiA+Pj4+PiBUcmFja2luZyB0aGUg
Y29kZXMsIGlmIFhlbnN0b3JlIGlzIGNyZWF0ZWQgYXMgYSBzdHViIGRvbWFpbiwgaXQNCj4gPj4+
Pj4gcmVxdWlyZXMNCj4gPj4+PiBnZXRkb21haW5pbmZvLWRvbWN0bCB0byBhY3F1aXJlIHJlbGF0
ZWQgaW5mby4gIFNvcnJ5LCBJIGhhdmVuJ3QNCj4gPj4+PiBmb3VuZCBob3cgaXQgd2FzIGNhbGxl
ZCBpbiBRRU1VLi4uDQo+ID4+Pj4NCj4gPj4+PiBJdCdzIG5vdCAiaXQiOyBpdCdzIGRpZmZlcmVu
dCBvbmVzLiBGaXJzdCBhbmQgZm9yZW1vc3QgSSB3YXMNCj4gPj4+PiB0aGlua2luZyBvZg0KPiA+
Pj4+ICAqIFhFTl9ET01DVExfaW9wb3J0X21hcHBpbmcNCj4gPj4+PiAgKiBYRU5fRE9NQ1RMX21l
bW9yeV9tYXBwaW5nDQo+ID4+Pj4gICogWEVOX0RPTUNUTF9iaW5kX3B0X2lycQ0KPiA+Pj4+ICAq
IFhFTl9ET01DVExfdW5iaW5kX3B0X2lycQ0KPiA+Pj4+IGJ1dCB0aGVyZSBtYXkgYmUgb3RoZXJz
IChhbGJlaXQgcGVyIHRoZSBkdW1teSB4c21fZG9tY3RsKCkgdGhpcyBpcw0KPiA+Pj4+IHRoZSBm
dWxsIHNldCkuIEFzIGEgZ2VuZXJhbCBjcml0ZXJpYSwgYW55dGhpbmcgdXNpbmcgWFNNX0RNX1BS
SVYNCj4gPj4+PiBjaGVja2luZyBjYW4gaW4gcHJpbmNpcGxlIGJlIGNhbGxlZCBieSBxZW11Lg0K
PiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gVW5kZXJzdG9vZC4NCj4gPj4+IEkgYXNzdW1lIHRoYXQgdGhl
eSBhcmUgYWxsIGZvciBkZXZpY2UgcGFzc3Rocm91Z2guIFdlIGFyZSBub3QNCj4gPj4+IGFjY2Vw
dGluZyBkZXZpY2UNCj4gPj4gcGFzc3Rocm91Z2ggdmlhIGNvcmUgdG9vbHN0YWNrIGluIGRvbTBs
ZXNzL2h5cGVybGF1bmNoLWVkIHNjZW5hcmlvcy4NCj4gPj4gSmFzb24gaGFzIGRldmVsb3BlZCBk
ZXZpY2UgcGFzc3Rocm91Z2ggdGhyb3VnaCBkZXZpY2UgdHJlZSB0byBvbmx5DQo+ID4+IGFjY2Vw
dCAic3RhdGljIGNvbmZpZ3VyZWQiIHBhc3N0aHJvdWdoIGluIGRvbTBsZXNzL2h5cGVybGF1bmNo
LWVkDQo+ID4+IHNjZW5hcmlvLCB3aGlsZSBpdCBpcyBzdGlsbCBpbnRlcm5hbCAsIGl0IG1heSBi
ZSB0aGUgb25seSBhY2NlcHQgd2F5DQo+ID4+IHRvIGRvIGRldmljZSBwYXNzdGhyb3VnaCBpbiBk
b20wbGVzcy9oeXBlcmxhdW5jaC1lZCBzY2VuYXJpby4NCj4gPj4NCj4gPj4gUmlnaHQsIGJ1dCBu
byBtYXR0ZXIgd2hhdCB5b3VyIGdvYWxzLCB0aGUgdXBzdHJlYW0gY29udHJpYnV0aW9ucyBuZWVk
DQo+ID4+IHRvIGJlIHNlbGYtIGNvbnNpc3RlbnQuIEkuZS4gbm90IChyaXNrIHRvKSBicmVhayBv
dGhlciBmdW5jdGlvbmFsaXR5Lg0KPiA+PiAoUmVhbGx5IHRoZSBmb3VyIGRvbWN0bC1zIG1lbnRp
b25lZCBhYm92ZSBtaWdodCBiZXR0ZXIgaGF2ZSBiZWVuIHB1dA0KPiA+PiBlbHNld2hlcmUsIGUu
Zy4gYXMgZG0tb3BzLiBNb3ZpbmcgdGhlbSBtYXkgYmUgYW4gb3B0aW9uIGhlcmUuKQ0KPiA+DQo+
ID4gVW5kZXJzdG9vZC4NCj4gPiBJJ2xsIG1vdmUgdGhlbSBhbGwgdG8gdGhlIGRtLW9wcw0KPg0K
PiBCZWZvcmUgeW91IGRvIHNvLCBwbGVhc2UgY29uc2lkZXIgdGhlIGNvbnNlcXVlbmNlcywgdGhv
dWdoIChJIHNhaWQgIm1heSIgZm9yIGENCj4gcmVhc29uKS4gQWxzbyBwbGVhc2UgYWxsb3cgb3Ro
ZXJzIHRvIGNoaW1lIGluLiAoSW4gdGhpcyBjb250ZXh0IEkgbm90aWNlIHRoYXQgc2V2ZXJhbA0K
PiBSRVNUIG1haW50YWluZXJzIHdlcmVuJ3QgZXZlbiBDYy1lZCBoZXJlLCBhbmQgaGVuY2UgbWF5
IG5vdCBoYXZlIHNlZW4gdGhlDQo+IGVhcmxpZXIgZGlzY3Vzc2lvbi4pDQo+DQoNClNvcnJ5LCB3
aGF0IEkgcmVhbGx5IG1lYW4gaXMgdGhhdCBJJ20gZ29pbmcgdG8gaW52ZXN0aWdhdGUgdGhlIGFj
dHVhbCB3b3JrIHJlcXVpcmVkIGZvciBtb3ZpbmcgdGhlc2UgZm91ciBoeXBlcmNhbGxzIHRvIGRt
LW9wcy4gVGhlbiBJIGNvdWxkIGdvIGJhY2sgdG8gdGhlIGRpc2N1c3Npb24gdG8gaGF2ZSBhIGNs
ZWFyZXIgdmlldy4gVG8gYmUgY2xlYXIsIHlvdSBhcmUgc3VnZ2VzdGluZyBBQkkgY2hhbmdlLCBs
aWtlIFhFTl9ET01DVExfaW9wb3J0X21hcHBpbmcgdG8gWEVOX0RNT1BfaW9wb3J0X21hcHBpbmcs
IG9yIG5ldyBBQkkgYWRkZWQ/DQoNCj4gT25lIHRoaW5nIHNlZW1zIHByZXR0eSBjbGVhciB0byBt
ZTogVGhpcyB3b3JrIGxpa2VseSBpc24ndCBnb2luZyB0byBiZSBzdWl0YWJsZSBmb3INCj4gNC4y
MSBhbnltb3JlLiBIZW5jZSB3ZSdyZSBiYWNrIHRvIGNvbnNpZGVyaW5nIGFsdGVybmF0aXZlcyB0
byBhZGRyZXNzIHRoZSBzdGlsbA0KPiBwZW5kaW5nIGJ1aWxkIGlzc3VlLiAoTXkgdGFrZSBvbiBp
dCByZW1haW5zOiBSZXZlcnQgdGhlIHRhaWwgb2YgdGhlIHN5c2N0bCB3b3JrLikNCj4gQWRkaW5n
IE9sZWtzaWkgdG8gQ2MgYXMgd2VsbC4NCj4NCj4gSmFuDQo=

