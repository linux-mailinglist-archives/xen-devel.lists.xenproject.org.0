Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46883B1B029
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 10:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070134.1433789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujD0u-0003ZM-Hu; Tue, 05 Aug 2025 08:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070134.1433789; Tue, 05 Aug 2025 08:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujD0u-0003XN-ES; Tue, 05 Aug 2025 08:27:16 +0000
Received: by outflank-mailman (input) for mailman id 1070134;
 Tue, 05 Aug 2025 08:27:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSY8=2R=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ujD0t-0003X0-9J
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 08:27:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2416::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb82b387-71d5-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 10:27:12 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 5 Aug
 2025 08:27:08 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 08:27:07 +0000
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
X-Inumbo-ID: fb82b387-71d5-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxgKPGZGC/h+hmpTWhglI/wQ40K4+JlLdjs8AQ1e0MFXzJn1KpV+V0+ITqV7TQ9gWnfvOplWPxrmvhSUVl9XcBKzOyUChP8lk43OLD1ClmsTx2Ex0AKXRpffbrPojPnhwcbWVHD1tThdpJnMBHHUwuUDH0O+lwhdDiOSJREdmD3SIMDL/kCUazZMJsYxJeNb0omgbkCMyuGVXW3ANVh6K/Yx/duSDd8GiZmaMzsjv5V/spyZMG+UzX2WiksYC8MceXe0FeAxLNea/v0znbgjc1N2VGrr0KpYs0RxLUPERjJPkWCgoTlFIWB1a6FonTkJgUAj7Fe8LBiAjDh+c8W88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJR8f4d+flu5k5ui2ewShyxLCpZ2wcpirVVpVUDbxf0=;
 b=gCgwMH4XMfmXHOFmaI15w2YffYqhwsWZR+L3sLnxHiHTiXXqfmMfls4NnNsofzv0YZCV1xtSVIACG7bsAXyQx1G0IhHn2LZcJkuyDHqaVdDii4jVrgXlTxrAv0lnjsmTmB2NWQ7LVx8TsMOEko1vFSSXw+syCWFGLVxaDVvXQ+bWy6qkt2rxvmoVi/F6/3XbzNO1zFKlHYyp75/mPYDL5HMamNQ2R4EmTS+KMjdCkzoKilEXXvaBlZ05WF8oqYLwoa4rDhDIutQbw5GCxwVqazntSERd7b9xeqAngtRsNRSEce7sYkwFZigTHs/5pyvBNCu8+oh26H48DdtrHm2evw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJR8f4d+flu5k5ui2ewShyxLCpZ2wcpirVVpVUDbxf0=;
 b=l3tVlSuJSyLaW/WqLoZepQXD+r+CnA0R3IRDw9zf+2vcB6evr7WL9buTUHN+j0dZrEn6fs68xjwVCvlkItZzZf+2pTqmC4aHhEHXsOywNWle87Zj4irKNn4TGXVLPC9c3+O+KvqBsftSVF1asVr7qbamZ1mP/o7zg6n+Efg460M=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Topic: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Index: AQHcBbvzKmM00rEmukmd//khB9ysKbRTtXeAgACIQQA=
Date: Tue, 5 Aug 2025 08:27:07 +0000
Message-ID:
 <BL1PR12MB5849F389E5CC38582EE9DBD9E722A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <889e32d2-b50f-4d61-b04b-6c73472abf23@suse.com>
In-Reply-To: <889e32d2-b50f-4d61-b04b-6c73472abf23@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8989.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL3PR12MB6473:EE_
x-ms-office365-filtering-correlation-id: bf698dac-b000-478e-bbc9-08ddd3f9dd8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2ErVUQwUEZrcEFpUTlJaDNqeXduOHV1dmUxd0dBdVpGUzc4QUNKZ0dGMFZu?=
 =?utf-8?B?YnVDODREZW4wNGFBMFdVTlM5emliOFI5ZTFSa0d0R3dnYVlmMEd4RVA0bjdV?=
 =?utf-8?B?czlwaExISk9id0hDMGFWaWkzd0xacmtjMDNtQ0tDVU9wQURHV1lDTXNYMytj?=
 =?utf-8?B?OTRZOERCVGd6ekVmSkNUWHptV2IzYWxKbmdENTdVdEhTalEybVNYYmh0bER0?=
 =?utf-8?B?bjJLUnlzMjFrMzZNcnFMdUlnUWsxV2lzWnEvcmxhdnJTTUtUOFNJOXZ3ZjJt?=
 =?utf-8?B?Q2hCR3lZejZTLzA2S09NdWtSRjU5QWhFdWJSQjRLQXdSazA4VWxLTE1HZW1W?=
 =?utf-8?B?MDNzMmdTcE14bk12RFoyNG5Ib0RNY2paTVcrVjcvSUhhdGRhQ1JlamJ0UzUv?=
 =?utf-8?B?RCtzNytUM3AzV1dSVlUzZjA3QkN1bVVYR0JWcVBLVklhSTAycnRvNjIxUUNO?=
 =?utf-8?B?Nk0xbFEzVEE4L2pqc1VrYlBiRjJLZEc1bTMzWFNDTkhzTzRmcEJ4T2dDSUli?=
 =?utf-8?B?bm9iV2lUc1NUazFwR2dSN1h1dVB1cjZOcXJLeEZGaXd0RnpEYWZIOXpTMUJM?=
 =?utf-8?B?NVdhT291dWZhSTQzdEcwS3k4bldwR042a1pTbVV3aXN6YWRtVHdTWUpydW5T?=
 =?utf-8?B?WlJURWVaWHo2SEpmTnpTK0tpbFZoZTA1VVkwcGlISmwyd1V6MEEveEV0RmQz?=
 =?utf-8?B?LzNSUlBWZVhOZDV3QmxkVkM1UXhJTHRMZHBpcFRLVTAxcnc1YmhYSlNGU0w2?=
 =?utf-8?B?RWNDQ2dlaXNlV0RxUEdHd0tnUXU1YmdHaVhFa3RDQ3h3aVR4c25uNGk5SVpB?=
 =?utf-8?B?N1BHNWlHdktOejVLd1JtQVdyUkZWNXE5V2U0eDl3ZVRoSXFHaFpRUnZySWVE?=
 =?utf-8?B?ZzRZZHc0QXJWNElxZ0tCRGc0cXZnOGtHYUJlYkhMTjZFUVBLWXhoUWFaWExw?=
 =?utf-8?B?SG0xSnlRYUhRMTY5QVI5YmF4QWFUM3NpWFFpcTJCUlZ6VEhhNzVoNEVuYVdT?=
 =?utf-8?B?elNadGdLQjEwcGx6Nm05YVczMXFkcjAvVnZDYUlSMUdPWXR0ZGJqTHlNSkJT?=
 =?utf-8?B?UTBCSXF0dmNVSWRERVNvLzhrdUg3RDhzaitkTWlFR1BBZk5CRW8zdlAxSlM1?=
 =?utf-8?B?QTlZUWpSMmR0VzZSQ0l6aXBMbTVrSnJTZDFlMXJKNlUwYnF3Z2crOEYvM1ZI?=
 =?utf-8?B?a1ZSNWlaUSt0MVhLMmpIb1VvWjlGeE9OYTRqb3FrenBWU1JuWE9IWkVrSnpr?=
 =?utf-8?B?NVcyVTB2bDZ3T1pTYmx0dkk5ajFvc0NtSTNObjNIdi9PeHpRYmRNTDV6bUVt?=
 =?utf-8?B?ZjVMYnoyNnpMNTlrQ0taVXRlZGxTUlNFakxFSmkwblNuVkhtM1lyKzNzVDJP?=
 =?utf-8?B?ODV5Q1YxZjdOQVhja0NubExYWnczUnh6YnhOTUhjQXlONU84SzRSSDkxYkdC?=
 =?utf-8?B?bkNEVFUyZTZUekhLYXhBNEVNNFRFYjhIY0FpcE9Wb0s0MXNwaWovdnd0OFVI?=
 =?utf-8?B?SW94eFcwQm91eDBTL25Wa0o2RkFSb2tYeFRRcWZ1UGVTVlN2RDFsU3FEdktC?=
 =?utf-8?B?eHZjOExwVXFrWWx4WTRFSUdtR08rWDV2TGI0YXpuM1ZyTmVoMmMwdHVDT0kz?=
 =?utf-8?B?Wkh1ZTU0T3UzN3FYZm1CTlRqckZRY2RCUU96NVFoZC9VYU90Nm5YQVlrOHBj?=
 =?utf-8?B?V3o0NVo0b09QRHkxbmgvcXdhL0huWHBqS1puVXFCMGxocFNJZ0I4RWZTSnRL?=
 =?utf-8?B?YzBBZjZXYWlFaUV5M3d4VjN0L1lJTXIxQXpxRzRIWTk3dXEvZk8zUmNZazZD?=
 =?utf-8?B?dm9LMDZDVEFqbUY4aHQwNG0rTlBuRkhUNGNyWWdJZ2tYMjdtRGhPOHFNYTBz?=
 =?utf-8?B?K2pWSXRXUXBvdzRQOGNsamVCNWVFRlIxVEZ2TEkyUnpQVUM1aXV4bFpNckJB?=
 =?utf-8?B?Zk5RMFRYc1FjdCt6azV2UjJSMkxRM29Nam5HZXYwN05Xa1BUaTFtN3FCZ2w5?=
 =?utf-8?Q?WiQ3/WK+UeLYrTE0h5W3izr+rlPnpI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1A5aXNsOVVyYjZiZ2ptVHZxRHFCN1ZVNzlkSFV1bkpDUDV6T1lSQ0hvRXht?=
 =?utf-8?B?dVVPZ0IwSXVuWmZEMDdvSDRvdHEvN01DSXZjeWYrc1R4UTBKOHdTd09Ub09y?=
 =?utf-8?B?Z2NNWWJjQWVrNXdESTczbVdUUmR1ZG1NOXZxU3FQbHNybFpwYWxhQkVrTUg3?=
 =?utf-8?B?WHVuVnBDZXJPa01zN0drcnpwd0JSbjc2Z0NVNDNEc3JKa0Q2SjRpZWRnRGlS?=
 =?utf-8?B?STg2N25FeUZFeHlpNEtYSm1sSC9IQmoxbU1ndFpqRkZ0OXE5YzJuMkg2dUNB?=
 =?utf-8?B?N0o0WTc5RlNzYjRhVXEvTFJiYXJ6bDRobVoySXZOZ3dKTnNEVERFUWtxV29I?=
 =?utf-8?B?OWFkRlZiWitWcnZoU3NkR1lDVnZ6Y2tjbUNKOVlBY3duM01FTEVQckpTV3Rq?=
 =?utf-8?B?RzluZHRIcGNFZEF1aml0VmdxS295ckoxQ1crSXQxUldhOWtyTHZybWhQQ2Rn?=
 =?utf-8?B?ZGFzNUxPOENMWTNaZTB0QTVGTFdreUU1YlJ0bGpEaUhGb25KcExmR0lRQ2cz?=
 =?utf-8?B?bkRIMjcvdkd1Q1laeGRJQkZpSjcvQ3JmNkZ5cTZjZjM5WWl1blpyd09DTlE3?=
 =?utf-8?B?VXFnYXU0VGNMM3VoREthcGRybVdQbGVKcjUybmErSURxQko3Y21rZFdxS0VV?=
 =?utf-8?B?aExVak4vOHhKOHJGaEJLWWdmN1VZZ1BIOHAyNmxPZE9iSGdyYzRCZ3J3Ynpx?=
 =?utf-8?B?MWozclMzQlRWL2MrWWdiNzQwajJ2YzlhM01SeGFOVjdoak9rYWJIV1VXY2JL?=
 =?utf-8?B?UW5WL1ZSbjllbWtseCtBVFN1YjV2L2UxenVieTJCRGc3ZlpkQ0NudmFncGtk?=
 =?utf-8?B?ZnkrSThMSjIvcC9uYnc1aVJ5bWp4MVk5NzdFS0xRaTlyekJyWWhKb1R6aEh2?=
 =?utf-8?B?bkM5MjNLelZSOWVldk8zZzA2bFRZejdYOER6VE1JTjFpM2JwVit2SEpkWStJ?=
 =?utf-8?B?Q0VHb0tWRFRDN2FEVkJKVDg3NURxMjFsTkVlTWhyVXRXNHczTWQvaXZIREJC?=
 =?utf-8?B?L2ovYS9yN1ZKOUY5aU52dWFYSFJHQzBTdGpNSmRwelFlU0NRaVc1ZXhOcXIx?=
 =?utf-8?B?bWxLWTlqUmdiZTZFVVErODc4OUhqNVR5RDZsK29veHBhSHdKdENNQzFvM216?=
 =?utf-8?B?eDZGd1phb0RGZHY5OXZ1V2JGRUc5dEp2ajdCUjhLOGdHZ3liK2paY0xpUWRU?=
 =?utf-8?B?eGZlRUh5b2lFNnJEbkpNSUI0ekNMbk9MQndmdkRNeUt2dDNBNE1abE5LVlp4?=
 =?utf-8?B?a1ZpMHNpM3U0UkYzcTdIK0gzemkrSU9WSXlkSVpyZk5VaFBMSHFnYTNkSi85?=
 =?utf-8?B?T3ZiaUJHSXVqelZVSFBrRW5tc09PQkxwUFZ3RUVCRDFOSjkzbVNtUGhyK1Fv?=
 =?utf-8?B?bXRrME5hNjBlYitRc2lSbnNrRXExT2FnS3Z1djZQc1FQT1BqNnJKVm1SelNZ?=
 =?utf-8?B?T3loNkR6aVZWcWFTQ1ZGa01sUFpuRllvQ1RYbnBZNXR3N3lzaWFUeTZHUVgx?=
 =?utf-8?B?d2Fya3ZZZU44QVZUb1VUa2NKTlE0MGpqUkN4QWtvTGJJNlE1aDZlblRLbzh1?=
 =?utf-8?B?UnRvZ3YvcmNBdEcrZ0ZBUnd0ZmtxQVk0VXVXU0xMRFpoR0JYd3hnaE0vaWVi?=
 =?utf-8?B?ekRPVFdpR25hSWpiRmp0RWFCVlBFdG9XM205ZXFXNFc0MURyVmxYcEpCR3l3?=
 =?utf-8?B?U2l3SVl3Mkt1Y1NubW1ya3lxdVNjMHk4VTNvMlh3OFp2MkVOMExaV0pxZjdI?=
 =?utf-8?B?ZEJ2TVFnczBlZWh4TXBhY2NIQXVTVnJSZEc5N0JHNG51QmRBUVZoWkZEeFBx?=
 =?utf-8?B?bzRWSXlhaEo1MW16NUJBQUw4dVo5NmxkM3lVWS9WNFU5Wk0zQ0IweWcyYzA5?=
 =?utf-8?B?a0lTT0NpUEFHSFRXUmpPTVM1WG1pMDd5elQ1ZnlxVTViM1MzSlE5bVBoTzkz?=
 =?utf-8?B?TU1UYVcxdU5VMzVCUzA0WHloSlJxdDZ3VGxnOXhXVkZ1QndXcUM4QzBHQlVU?=
 =?utf-8?B?MHFsOVFWaWsvVHBNL0Yxd3JMaWRzMjlBT08vekovcEJpc2gyVTRwNUUwS2s3?=
 =?utf-8?B?K2Q4SVMwWE1mWjVqWWk4Z3NUazlRc2xXRzNpdjJwa01ab3puUnZBQ0F1VUFK?=
 =?utf-8?Q?7+Pw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CAF7CDEDF9D5B4B88B94E0FEA1F00C3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf698dac-b000-478e-bbc9-08ddd3f9dd8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 08:27:07.3209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ps+oSWIhSci4aStfOsacSZV/WmAIWxA07kFQE5crq1bpawsZn50sdr6kqtGNsvXUVmfZ0n129oNzLAD+kCl12g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

T24gMjAyNS84LzUgMTY6MTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wOC4yMDI1IDA1
OjQ5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdoZW4gTVNJLVggaW5pdGlhbGl6YXRpb24gZmFp
bHMgdlBDSSB3aWxsIGhpZGUgdGhlIGNhcGFiaWxpdHksIGJ1dA0KPj4gcmVtb3ZlIG9mIGhhbmRs
ZXJzIGFuZCBkYXRhIHdvbid0IGJlIHBlcmZvcm1lZCB1bnRpbCB0aGUgZGV2aWNlIGlzDQo+PiBk
ZWFzc2lnbmVkLiAgSW50cm9kdWNlIGEgTVNJLVggY2xlYW51cCBob29rIHRoYXQgd2lsbCBiZSBj
YWxsZWQgd2hlbg0KPj4gaW5pdGlhbGl6YXRpb24gZmFpbHMgdG8gY2xlYW51cCBNU0ktWCByZWxh
dGVkIGhvb2tzIGFuZCBmcmVlIGl0J3MNCj4+IGFzc29jaWF0ZWQgZGF0YS4NCj4+DQo+PiBBcyBh
bGwgc3VwcG9ydGVkIGNhcGFiaWxpdGllcyBoYXZlIGJlZW4gc3dpdGNoZWQgdG8gdXNlIHRoZSBj
bGVhbnVwDQo+PiBob29rcyBjYWxsIHRob3NlIGZyb20gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKSBp
bnN0ZWFkIG9mIG9wZW4tY29kZSB0aGUNCj4+IGNhcGFiaWxpdHkgc3BlY2lmaWMgY2xlYW51cCBp
biB0aGVyZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5A
YW1kLmNvbT4NCj4+IC0tLQ0KPj4gY2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+PiAtLS0NCj4+IHY5LT52MTAgY2hhbmdlczoNCj4+ICogQ2FsbCBhbGwgY2xl
YW51cCBob29rIGluIHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkgaW5zdGVhZCBvZiBjbGVhbnVwX21z
aXgoKS4NCj4gDQo+IElzbid0IHRoaXMgcmF0aGVyIGFuIG9taXNzaW9uIGluIGFuIGVhcmxpZXIg
Y2hhbmdlLCBhbmQgaGVuY2UgbWF5IHdhbnQgdG8NCj4gY29tZSBzZXBhcmF0ZWx5IGFuZCB3aXRo
IGEgRml4ZXM6IHRhZz8NClRoaXMgaXMgbm90IHJlYWxseSBhbiBvbWlzc2lvbiwgYWZ0ZXIgYWxs
LCBhbGwgdGhlIGNsZWFudXAgaG9va3Mgd2VyZSBpbXBsZW1lbnRlZCBhdCB0aGUgZW5kIG9mIHRo
aXMgc2VyaWVzLg0KQW5kIGp1ZGdpbmcgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2Uod2hpY2ggd2Fz
IHdyaXR0ZW4gYnkgUm9nZXIgaW4gdjgpLCBSb2dlciBhbHNvIGFncmVlZCB0byBhZGQgdGhlbSBp
biB0aGlzIHBhdGNoLg0KDQo+IA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+
ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBAQCAtMzIxLDYgKzMyMSwyNyBAQCB2
b2lkIHZwY2lfZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAg
ICAgICAgICAgICAgICAgJnBkZXYtPmRvbWFpbi0+dnBjaV9kZXZfYXNzaWduZWRfbWFwKTsNCj4+
ICAjZW5kaWYNCj4+ICANCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBOVU1fVlBDSV9JTklUOyBp
KysgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY2Fw
YWJpbGl0eSA9ICZfX3N0YXJ0X3ZwY2lfYXJyYXlbaV07DQo+PiArICAgICAgICBjb25zdCB1bnNp
Z25lZCBpbnQgY2FwID0gY2FwYWJpbGl0eS0+aWQ7DQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQg
cG9zID0gMDsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIWNhcGFiaWxpdHktPmlzX2V4dCApDQo+
PiArICAgICAgICAgICAgcG9zID0gcGNpX2ZpbmRfY2FwX29mZnNldChwZGV2LT5zYmRmLCBjYXAp
Ow0KPj4gKyAgICAgICAgZWxzZSBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4p
ICkNCj4+ICsgICAgICAgICAgICBwb3MgPSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwZGV2LT5z
YmRmLCBjYXApOw0KPiANCj4gV2hhdCdzIHRoZSBwb2ludCBvZiBkb2luZyB0aGlzIHdoZW4gLi4u
DQo+IA0KPj4gKyAgICAgICAgaWYgKCBwb3MgJiYgY2FwYWJpbGl0eS0+Y2xlYW51cCApDQo+IA0K
PiAuLi4gLT5jbGVhbnVwIGlzIE5VTEw/IERvbid0IHlvdSB3YW50IHRvIGhhdmUNCj4gDQo+ICAg
ICAgICAgaWYgKCAhY2FwYWJpbGl0eS0+Y2xlYW51cCApDQo+ICAgICAgICAgICAgIGNvbnRpbnVl
Ow0KPiANCj4gZWFybGllciBvbj8NCldpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCg0KPiAN
Cj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

