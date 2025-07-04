Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D2EAF8CE4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033062.1406477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcDK-0000c1-Kj; Fri, 04 Jul 2025 08:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033062.1406477; Fri, 04 Jul 2025 08:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcDK-0000aB-Hk; Fri, 04 Jul 2025 08:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1033062;
 Fri, 04 Jul 2025 08:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXcDJ-0000a5-12
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:56:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2413::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8054afa-58b4-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 10:56:06 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Fri, 4 Jul 2025 08:56:01 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 08:56:01 +0000
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
X-Inumbo-ID: b8054afa-58b4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smBaHpvMl15JYahjztU5YNaOGT4+DnkywLGqluhrmXgedDEKbP0zd1BJPx7Qk/k1n9KoVvqcGntvJsRtF5slh3XSzqhN+tMgtI4MY+eGha/HbWjcLAgHqYuN4YrqvDyrLoQxJHl1Myu6ZPSU41fjALiFOMYFplzBon/1iqpu0swGpNu9wQzIfWsre8fMNLIyE6cnGwyWYr00jccYYTMTPcFVJlKBIaIQprmjBNXADz2seI7t5zAzuGEsCCw4mZ+i4TLFw2ePDxZzGnpPj8TDQiC0Rb3DJKBTFP3NKl4JdYW61bktgBegl0lehwWtLVgPllV9x/f/Wxgt5ZvxkvwbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67JXjwvjwRjN9BTle6oURYf7zq9CondmlBg3RPTui84=;
 b=ZtAzsKH5AOz1vaLglZR7VIrEzxW86Ak45OqWyLf5zQiIf78UKOp0HolsqCWutaa1NyTwXlQ95DTVgT77cY5E/lf4qXsE3UQ50u9IavC60vj3+CsOS5ZZvuMZmKKwFLO3FJP15XCztwRF4UeZwwowGX0JgIxQVI3xntC3uIR6XIC31mOy9a4yUVO81qyvVRfW0vJVNNdfRKgimbTE1EH/cmkHwLW/4x4JPruH3s46Y+XfZ9JpexMtrlIwEx2Lmf/DzlSNSPR84GyfxYRp8Azyw0NPQZKxRXlNO1SbC5URT+d3LDRmEJ+70oRs7bPsY4AWNQaxJKrmC+ImCx3eoSO3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67JXjwvjwRjN9BTle6oURYf7zq9CondmlBg3RPTui84=;
 b=GKDupiG6MSsLdDUc0eC6spq+8MZXjwfIpqrGziif8ug8jpAS1HzNZUBuIZgpGIG3+pvG3fvTm/9uRMnHts94mnITVOvE8AXpCB0D6ZoWBvFB92+KKnpTjNZ4ep+aomuYVnXjTAmlaFMdz6Vm6WN/5zmTSS/S5Pi3PSiFaW8wo6A=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
Thread-Topic: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
Thread-Index: AQHbzuRKQ5+TGdD3B0+TZYuot60QS7QHQcCAgBqT2LCAAAkNgIAAAq7Q
Date: Fri, 4 Jul 2025 08:56:01 +0000
Message-ID:
 <DM4PR12MB845185414637BC1CE87A3309E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
 <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
 <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
In-Reply-To: <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-04T08:54:11.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MN0PR12MB5932:EE_
x-ms-office365-filtering-correlation-id: da4e637a-b452-44b6-0809-08ddbad89a14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TldGRjhqUnR4U0p0NjJLSWFJbWlsOExIZytSTXYzc3NlQXBkVTk0bk1LaUIy?=
 =?utf-8?B?Z2VNNW04R1NDWkJ2SzM3b20zMEoyU0JyVlp0U29ZR254M0VHZkpoTjVrTDR4?=
 =?utf-8?B?T1NZRkRWUE9IYXVNNDlNK3RhbzYzdWNmeU9jU3FrdmwrTzhJQUV3bWM2NzJs?=
 =?utf-8?B?OFRuZFV2ZlgxZzJ3eDNJQUp4a2NDMUtyNWtZUVl6N2xlMHV0RlBJNERtQXU3?=
 =?utf-8?B?MlZYZFA4RXp4ZDQxNVcvQmJnUTcxQy9Ec1pKZzR6cE5NZVQ5RWFWWVY3SEtZ?=
 =?utf-8?B?M2NTK0V6L1ZzNjZISFpvN1NKaVpJTExQTXB2eHJaSDJMQUVCd29lVjRHenVV?=
 =?utf-8?B?VXNQSmxVdTZEVG03TXdkL3BVNU1nZ2M4UkZUNVVSa09JQjNlVE1nbXE3Rm5T?=
 =?utf-8?B?UGhGSGZSRkJaVmM4MXo3OFcvdUhsSnJWZmFXQjcvZEFVN21uY1d6UmdxUG01?=
 =?utf-8?B?bkRxcDVoMmltRnNndVVQSVhxek9ENjVveEIra2lLZVNYejk1eXJCVlliQk5F?=
 =?utf-8?B?VXd4QVJEVWJDM3VBTlRUa3dLVGZ2cU9URVMvZDFhNXo3VkN1am45bWlJWXlt?=
 =?utf-8?B?RFo2OTlHZWdvMDZVaXptc21JTU0ydzJCb2RKNk1hVkxQdTYwdXdUSjVKNm9y?=
 =?utf-8?B?QXM4OFZUd0kyWUZOamFRMVRoSGgxRlpqbTRpRHRzMk9HMDAxc25odkpJUGNj?=
 =?utf-8?B?U1JCU1VxRXVLYVI5ZzhDajhNdGxQUzh2LytYd3NMT0x3dmtZZFptTHArU3lW?=
 =?utf-8?B?RVRaMFNHL3VHSklhOW42emhUSUxyeGxDaEVqUitIcjA5OFI1QytoV0g0dUU1?=
 =?utf-8?B?UzVUL1FINGlCWmNMWktPT1JQSmdSdkRxaEV3eEhaVGRJdDNDcXhoV0dZNkcv?=
 =?utf-8?B?cEc4UHhpcWx0OWxmSWJja3MwSklFSnBzZlBOclpSUEJ3Rmh2TnZiNVpCU3JX?=
 =?utf-8?B?MVhqRy9MMmZIeEVSVHh2dkl4bTBmaHdtWWhJZUpnUThzOTBFd1JpTytMRVYw?=
 =?utf-8?B?WEdyQk4yVWFrWXV3Zm42dTV4WDdySEYxdGRZWi9QazNIZWtjZ0tPVXpsKzE4?=
 =?utf-8?B?RWxidzhLYTZzekRadmVRY1NUam8rOElFWGIyc2VNRjlvMzRpeFY3LysyOXNC?=
 =?utf-8?B?UXYxeEVDY3VhNWxmc21ITGFxZ0xjNmgyaG42ZGMvV28wY0dSbmI4VXZ0dXZl?=
 =?utf-8?B?b0gzWVhmNDBhdm84aWU1aW9sSDhIMnZKMzMzd0Y5V3FXZ3JsN2hyTjNrYWFn?=
 =?utf-8?B?cTFsODNVTUkyQmQycFZJRUo3ZENFQnd1MWFIQTdOcGhpWWZZMnpTOVRVa2Rw?=
 =?utf-8?B?L2E3REZacUNhSUNydS82SHo2WnZnRlNOUzlndU5GdlkzVGxhaFVvR2orNGp4?=
 =?utf-8?B?SHozcDBuc0dJZlZ5VHhsS21XVkh1eHM4RHhZbnNLYzJNTjdQblBSTkFyNGN1?=
 =?utf-8?B?MlM1TTdXc3lYYm5KcE5XL1ZFSTdWU3FhblgrL1hIRGNweXArWlRHK2ZncVJU?=
 =?utf-8?B?bldBMHJLQ2hlUzUzU2FGNjgwZDc0MHlOcnFkSEEzWVZJekYyL2orYTRxbmVk?=
 =?utf-8?B?T0FyUFp2RFFtRzkrR09ydDRraURYMXQxcVFKWkpqWGdHRVBMRU9XQ3JvUjZr?=
 =?utf-8?B?Qm9YeVhhNDdQNDQzY2dibXlJT3l5cjNvSTJsTjV1dmlzbjhiT3BhUzU0N3RB?=
 =?utf-8?B?MndKbDBKTGxsVythZ3A4YXlBVlJ4VGd1cVNJYmZXRGFIZWt0V296aDRVYW5B?=
 =?utf-8?B?aURWTGgxZGo2MWpzbVJhOVE5cFBrakF6RHE5NzdUV1g1ci9OaE5uc21pVWRz?=
 =?utf-8?B?MTNkWGUvM3IzMGFseTBaK2d4eGc4NjduMFlsQThwK25pa091WHFBSkxvbXpB?=
 =?utf-8?B?aTBDa2VjY3MwU3ZuNUR5Q1N3WmRYU2RsbStoV2xwdS9ZSE1iWmxWSTRDR1c4?=
 =?utf-8?B?SitEbnlKTXorc2F4RVdDelUzaEF5OFFwNFM3Q0tESWQ2RUYxWVlUTVhQNW8v?=
 =?utf-8?Q?MqQNfEliUztieOy0ckvPBcNSmeXix8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDhsekZ4L216cnRoN3FLZXVEemFsc0xDaWlHa24yNnFqN24zSkZwZlVWdjdF?=
 =?utf-8?B?cGVFbC8wZ3R3WWZhQytQY0VPR0xEK25sOUJGdVR4S1E1cXRZL0ZRa1FKREVO?=
 =?utf-8?B?R094RlM5di96UFVUNVEydEFqbSsvWEdoUEw4MXUrd2dPbDA3VDhUZXFaS0dC?=
 =?utf-8?B?M3JyUi91eHl0RHFOU0t0VUNwdlJTNUhXQnNVbnhPckJvY2gvTVhvbDhQSWxl?=
 =?utf-8?B?V08yalNmMkJGbkxhMmI5U1NGUFhtNGttTmtYVHd2a29QZkJNRncyVWJrbjJr?=
 =?utf-8?B?VE95RmcyeW9UYkRFa3lLd1NLYmhJOXBhcEhqcFg0djdJWk9WYkc5c1FrSlZC?=
 =?utf-8?B?SmJubFR2ZS9XR1E4SjE4L1c5NTJNQS90MVJ4ZkNyVVFNOU1vMjM0VUpnNzdV?=
 =?utf-8?B?QkZnTEdqZlVVc05FYk5OVk14UW0yUU93dExUTk9DQm1KZmwranQ3Ym5GQzl2?=
 =?utf-8?B?YVF4aUZxR29Cd3c4Y21FMnl5ejhlV2NoMWExclljcGhWUHhlZWtUaEQwK1Nv?=
 =?utf-8?B?N0pRM3NJSVdiWmVHc3cvYWVrSUswdndCSWVvaFlLTzZQTlRpZjVveGhPWWJ3?=
 =?utf-8?B?a01SLzdQMEdVZjlWUWFwaFlGUFduQWZvR3BWNzkzYjBYZ09TaG90c0dnbTZ6?=
 =?utf-8?B?bkowTmhqT0Q1aXBWbDI4S2VXOGQ5RmxyRjRGeTJoWWpsMFBvMzJ0dTdyRklh?=
 =?utf-8?B?QU1GL0c2SzBqQUhpY1JBT2FTQk5waTNBT2x0eDRkejFkZklvR0w3WTVqdFZD?=
 =?utf-8?B?a2Y0V2RCRjU1bElxUUpabDA4ak1JQkRpMGVDR0VoQW1WYlRHa2VVS3JJS252?=
 =?utf-8?B?Y3ppL0F6MkY5WGhmNENTOEViZFZFV3VyOFE3cmtQZEFhRERqTDA2NU1EMWdB?=
 =?utf-8?B?ZTExbXVYY0g0Ny8vd3ZMR09hOVNaaWphMDc3clpJS1RMVUxsa0RuR3l4am8x?=
 =?utf-8?B?VjczRG9JN21ScW8yWjBJb2hOelNiSWp0d3NkRnJ4b0twWTgvZzhLRTRXenho?=
 =?utf-8?B?cVQ1Vnh1QWpXeTJQNzZqVkRvTWNqdmZRb25lTVBwZnZrYnBCRHF0KzBONWpH?=
 =?utf-8?B?YWFTMlJxZGFHZ3lkcEZaSWFlQlF5Ynp0REdmT0xQblZxQ1FWd1V0MjdLS1Zr?=
 =?utf-8?B?ck9JQ2ZvVkUzdzJlc0YxN2w4Rm96VEJWOEFQNWkxekNpVFVZdUZYMCtIRVJs?=
 =?utf-8?B?MEV1eWdVRUlvOGswT2N5aFhFaS9samdEbzFaWC9oQ3FwbzJlcDNoUXlZdlpW?=
 =?utf-8?B?cGtWRWdyZWhENVh6NnBVb2hTZFc5U1gvUnBWZzYxU1dEVmtTRmdtRFpuS0F1?=
 =?utf-8?B?WTFQajB0c2FwR3FqNEhOOHJQSzJSbktBdXpXY1ZtQ0grYXkxejVZNGdOTDRk?=
 =?utf-8?B?ZW0wSGtoTVBVZWtLeVlQNGNieUdVVEJBNzY1aGhWN1BZWkZWWU5oR0ZzWThh?=
 =?utf-8?B?bDVEYnFHQ2d1VldUK2FMdHZHWGt3Tml6SDhUeXRIQWJ5elhYUXB6V1JxajF6?=
 =?utf-8?B?amQzQVdiaFh6OFpsclR2VVo2NCtpaEdJNW1XUFZ3T0JzSllUMkx6TENraU1o?=
 =?utf-8?B?ZG9SYTl1ZFhpWFBhRWIxS1RpUkVQNzlWdWp1MHhpczF5eks2RnZ6QmZoRUhJ?=
 =?utf-8?B?SFdHSjJNSVBEK3JQQnVvcTB3OWc2UlgvdjlPWmd4YWZQdE1iNFlWaklidXZm?=
 =?utf-8?B?L25TekxnSTZQQ04zTUsxYS9QdzN0MHQwMm9Rd3d2dzZFRDhDVG5DMUdGYmVU?=
 =?utf-8?B?UVdsOW9NMmQ0OHRWV053NGRETm15RnN6cDFmblpmOEg3b2dabUxkMGtYTWUw?=
 =?utf-8?B?Nml5NEVnUFNSR09IM3JtK3llRHI2MHUwUmFMK0gwenVaUWk5dllVV3F6eElU?=
 =?utf-8?B?cTBCdVpVYzBRS0JHTzg5bjM3UlR4c3pEMDJOZzR4aWdnZ00yVk9mdEZFTmdm?=
 =?utf-8?B?SnMwTE5WUFhwYmZIMGxIdnF6NEVHWEVEVERrVWE2L0lpS2tIczdjUi9BbmVi?=
 =?utf-8?B?aTNiL1BIbDNHQUgzN2Vxa1cwN1IyVFZndVlJZzZuajJBWTBpRXBZWGpLVE5Y?=
 =?utf-8?B?b255c1hxbStnNytNZmNhUGpueTJJL3Nrdm9pcVRObXJtdWVjTTBPMk1Ca1hX?=
 =?utf-8?Q?DfP8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4e637a-b452-44b6-0809-08ddbad89a14
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 08:56:01.7076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ql8XkDdxbkwezjsNAK8HfUoDqmLK9hSFRlnb7sePon0Ew0ET6Wa/xqNVESGIj7Gx2j88+6tGnI/nhtNHpyvLTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSA0LCAyMDI1IDQ6
MzMgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT47IEFuZHJ5dWss
IEphc29uDQo+IDxKYXNvbi5BbmRyeXVrQGFtZC5jb20+DQo+IENjOiBIdWFuZywgUmF5IDxSYXku
SHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRob255LnBlcmFyZEB2YXRlcy50
ZWNoPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPjsgQW5kcmV3DQo+IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBh
bWQuY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjUgMTQvMThdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgR0VUX0NQVUZS
RVFfQ1BQQyBzdWItDQo+IGNtZA0KPg0KPiBPbiAwNC4wNy4yMDI1IDEwOjEzLCBQZW5ueSwgWmhl
bmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNl
bnQ6IFR1ZXNkYXksIEp1bmUgMTcsIDIwMjUgNjowOCBQTQ0KPiA+PiBUbzogUGVubnksIFpoZW5n
IDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFt
ZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA+PiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IEFuZHJldw0KPiA+PiBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBPcnplbCwgTWljaGFsDQo+ID4+IDxNaWNoYWwuT3J6
ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4g
Pj4gTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+
PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDE0LzE4XSB4ZW4vY3B1ZnJlcTogaW50cm9k
dWNlIEdFVF9DUFVGUkVRX0NQUEMNCj4gPj4gc3ViLSBjbWQNCj4gPj4NCj4gPj4gT24gMjcuMDUu
MjAyNSAxMDo0OCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiAtLS0gYS90b29scy9taXNjL3hl
bnBtLmMNCj4gPj4+ICsrKyBiL3Rvb2xzL21pc2MveGVucG0uYw0KPiA+Pj4gQEAgLTY5LDYgKzY5
LDcgQEAgdm9pZCBzaG93X2hlbHAodm9pZCkNCj4gPj4+ICAgICAgICAgICAgICAiIHNldC1tYXgt
Y3N0YXRlICAgICAgICA8bnVtPnwndW5saW1pdGVkJyBbPG51bTI+fCd1bmxpbWl0ZWQnXVxuIg0K
PiA+Pj4gICAgICAgICAgICAgICIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2V0IHRoZSBDLVN0YXRlIGxpbWl0YXRpb24gKDxudW0+ID49IDApDQo+IGFuZFxuIg0KPiA+Pj4g
ICAgICAgICAgICAgICIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9u
YWxseSB0aGUgQy1zdWItc3RhdGUgbGltaXRhdGlvbg0KPiA+PiAoPG51bTI+ID49IDApXG4iDQo+
ID4+PiArICAgICAgICAgICAgIiBnZXQtY3B1ZnJlcS1jcHBjICAgICAgW2NwdWlkXSAgICAgICBs
aXN0IGNwdSBjcHBjIHBhcmFtZXRlciBvZiBDUFUNCj4gPj4gPGNwdWlkPiBvciBhbGxcbiINCj4g
Pj4+ICAgICAgICAgICAgICAiIHNldC1jcHVmcmVxLWNwcGMgICAgICBbY3B1aWRdIFtiYWxhbmNl
fHBlcmZvcm1hbmNlfHBvd2Vyc2F2ZV0NCj4gPj4gPHBhcmFtOnZhbD4qXG4iDQo+ID4+PiAgICAg
ICAgICAgICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXQgSGFyZHdh
cmUgUC1TdGF0ZSAoSFdQKSBwYXJhbWV0ZXJzXG4iDQo+ID4+PiAgICAgICAgICAgICAgIiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbiBDUFUgPGNwdWlkPiBvciBhbGwgaWYg
b21pdHRlZC5cbiINCj4gPj4+IEBAIC04MTIsMzMgKzgxMyw3IEBAIHN0YXRpYyB2b2lkIHByaW50
X2NwdWZyZXFfcGFyYShpbnQgY3B1aWQsDQo+ID4+PiBzdHJ1Y3QgeGNfZ2V0X2NwdWZyZXFfcGFy
YSAqcF9jcHVmcmVxKQ0KPiA+Pj4NCj4gPj4+ICAgICAgcHJpbnRmKCJzY2FsaW5nX2RyaXZlciAg
ICAgICA6ICVzXG4iLCBwX2NwdWZyZXEtPnNjYWxpbmdfZHJpdmVyKTsNCj4gPj4+DQo+ID4+PiAt
ICAgIGlmICggaHdwICkNCj4gPj4+IC0gICAgew0KPiA+Pj4gLSAgICAgICAgY29uc3QgeGNfY3Bw
Y19wYXJhX3QgKmNwcGMgPSAmcF9jcHVmcmVxLT51LmNwcGNfcGFyYTsNCj4gPj4+IC0NCj4gPj4+
IC0gICAgICAgIHByaW50ZigiY3BwYyB2YXJpYWJsZXMgICAgICAgOlxuIik7DQo+ID4+PiAtICAg
ICAgICBwcmludGYoIiAgaGFyZHdhcmUgbGltaXRzICAgIDogbG93ZXN0IFslIlBSSXUzMiJdIGxv
d2VzdCBub25saW5lYXINCj4gPj4gWyUiUFJJdTMyIl1cbiIsDQo+ID4+PiAtICAgICAgICAgICAg
ICAgY3BwYy0+bG93ZXN0LCBjcHBjLT5sb3dlc3Rfbm9ubGluZWFyKTsNCj4gPj4+IC0gICAgICAg
IHByaW50ZigiICAgICAgICAgICAgICAgICAgICAgOiBub21pbmFsIFslIlBSSXUzMiJdIGhpZ2hl
c3QgWyUiUFJJdTMyIl1cbiIsDQo+ID4+PiAtICAgICAgICAgICAgICAgY3BwYy0+bm9taW5hbCwg
Y3BwYy0+aGlnaGVzdCk7DQo+ID4+PiAtICAgICAgICBwcmludGYoIiAgY29uZmlndXJlZCBsaW1p
dHMgIDogbWluIFslIlBSSXUzMiJdIG1heCBbJSJQUkl1MzIiXSBlbmVyZ3kNCj4gcGVyZg0KPiA+
PiBbJSJQUkl1MzIiXVxuIiwNCj4gPj4+IC0gICAgICAgICAgICAgICBjcHBjLT5taW5pbXVtLCBj
cHBjLT5tYXhpbXVtLCBjcHBjLT5lbmVyZ3lfcGVyZik7DQo+ID4+PiAtDQo+ID4+PiAtICAgICAg
ICBpZiAoIGNwcGMtPmZlYXR1cmVzICYgWEVOX1NZU0NUTF9DUFBDX0ZFQVRfQUNUX1dJTkRPVyAp
DQo+ID4+PiAtICAgICAgICB7DQo+ID4+PiAtICAgICAgICAgICAgdW5zaWduZWQgaW50IGFjdGl2
aXR5X3dpbmRvdzsNCj4gPj4+IC0gICAgICAgICAgICBjb25zdCBjaGFyICp1bml0czsNCj4gPj4+
IC0NCj4gPj4+IC0gICAgICAgICAgICBhY3Rpdml0eV93aW5kb3cgPSBjYWxjdWxhdGVfYWN0aXZp
dHlfd2luZG93KGNwcGMsICZ1bml0cyk7DQo+ID4+PiAtICAgICAgICAgICAgcHJpbnRmKCIgICAg
ICAgICAgICAgICAgICAgICA6IGFjdGl2aXR5X3dpbmRvdyBbJSJQUkl1MzIiICVzXVxuIiwNCj4g
Pj4+IC0gICAgICAgICAgICAgICAgICAgYWN0aXZpdHlfd2luZG93LCB1bml0cyk7DQo+ID4+PiAt
ICAgICAgICB9DQo+ID4+PiAtDQo+ID4+PiAtICAgICAgICBwcmludGYoIiAgICAgICAgICAgICAg
ICAgICAgIDogZGVzaXJlZCBbJSJQUkl1MzIiJXNdXG4iLA0KPiA+Pj4gLSAgICAgICAgICAgICAg
IGNwcGMtPmRlc2lyZWQsDQo+ID4+PiAtICAgICAgICAgICAgICAgY3BwYy0+ZGVzaXJlZCA/ICIi
IDogIiBodyBhdXRvbm9tb3VzIik7DQo+ID4+PiAtICAgIH0NCj4gPj4+IC0gICAgZWxzZQ0KPiA+
Pj4gKyAgICBpZiAoICFod3AgKQ0KPiA+Pj4gICAgICB7DQo+ID4+PiAgICAgICAgICBpZiAoIHBf
Y3B1ZnJlcS0+Z292X251bSApDQo+ID4+PiAgICAgICAgICAgICAgcHJpbnRmKCJzY2FsaW5nX2F2
YWlsX2dvdiAgICA6ICVzXG4iLA0KPiA+Pg0KPiA+PiBJJ20gbm90IHN1cmUgaXQgaXMgYSBnb29k
IGlkZWEgdG8gYWx0ZXIgd2hhdCBpcyBiZWluZyBvdXRwdXQgZm9yIGdldC1jcHVmcmVxLXBhcmEu
DQo+ID4+IFBlb3BsZSBtYXkgc2ltcGx5IG1pc3MgdGhhdCBvdXRwdXQgdGhlbiwgd2l0aG91dCBo
YXZpbmcgYW55DQo+ID4+IGluZGljYXRpb24gd2hlcmUgaXQgd2VudC4NCj4gPg0KPiA+IEh3cCBp
cyBtb3JlIGxpa2UgYW1kLWNwcGMgaW4gYWN0aXZlIG1vZGUuIEl0IGFsc28gZG9lcyBub3QgcmVs
eSBvbiBYZW4NCj4gPiBnb3Zlcm5vciB0byBkbyBwZXJmb3JtYW5jZSB0dW5pbmcsIHNvIGluIHBy
ZXZpb3VzIGRlc2lnbiwgd2UgY291bGQgYm9ycm93DQo+IGdvdmVybm9yIGZpbGVkIHRvIG91dHB1
dCBjcHBjIGluZm8gSG93ZXZlciBhZnRlciBpbnRyb2R1Y2luZyBhbWQtY3BwYyBwYXNzaXZlDQo+
IG1vZGUsIHdlIGhhdmUgcmVxdWVzdCB0byBvdXRwdXQgYm90aCBnb3Zlcm5vciBhbmQgQ1BQQyBp
bmZvLiBBbmQgaWYgY29udGludWluZw0KPiBleHBhbmRpbmcgZ2V0LWNwdWZyZXEtcGFyYSB0byBp
bmNsdWRlIENQUEMgaW5mbywgaXQgd2lsbCBtYWtlIHRoZSBwYXJlbnQgc3R1Y3QNCj4geGVuX3N5
c2N0bC51IGV4Y2VlZCBleGNlZWQgMTI4IGJ5dGVzLg0KPg0KPiBIb3cgaXMgdGhlIHhlbnBtIGNv
bW1hbmQgImdldC1jcHVmcmVxLXBhcmEiIHJlbGF0ZWQgdG8gdGhlIHN5c2N0bCBpbnRlcmZhY2Ug
c3RydWN0DQo+IHNpemU/IElmIHlvdSBuZWVkIHRvIGludm9rZSB0d28gc3lzY3RsIHN1Yi1vcHMg
dG8gcHJvZHVjZSBhbGwgcmVsZXZhbnQgImdldC1jcHVmcmVxLQ0KPiBwYXJhIiBvdXRwdXQsIHNv
IGJlIGl0IEkgd291bGQgc2F5Lg0KPg0KDQpCZWNhdXNlIHdlIGFyZSBsaW1pdGluZyBlYWNoIHN5
c2N0bC1zdWJjbWQtc3RydWN0LCBzdWNoIGFzICIgc3RydWN0IHhlbl9zeXNjdGxfcG1fb3AgIiwg
MTI4IGJ5dGVzIGluICJzdHJ1Y3QgeGVuX3N5c2N0bCLvvIxUaGV5IGFyZSBhbGwgY29tYmluZWQg
YXMgYSB1bmlvbi4NCkFsc28sIGluICJzdHJ1Y3QgeGVuX3N5c2N0bF9wbV9vcCIsIGl0cyBkZXNj
ZW5kaW5nIHN1Yi1vcCBzdHJ1Y3RzLCBpbmNsdWRpbmcgInN0cnVjdCB4ZW5fZ2V0X2NwdWZyZXFf
cGFyYSIsIGFyZSBhbGwgY29tYmluZWQgYXMgdW5pb24gdG9vDQpgYGANCnN0cnVjdCB4ZW5fc3lz
Y3RsX3BtX29wIHsNCiAgICAuLi4gLi4uDQogICAgdW5pb24gew0KICAgICAgICBzdHJ1Y3QgeGVu
X2dldF9jcHVmcmVxX3BhcmEgZ2V0X3BhcmE7DQogICAgICAgIHN0cnVjdCB4ZW5fc2V0X2NwdWZy
ZXFfZ292ICBzZXRfZ292Ow0KICAgICAgICBzdHJ1Y3QgeGVuX3NldF9jcHVmcmVxX3BhcmEgc2V0
X3BhcmE7DQogICAgICAgIHN0cnVjdCB4ZW5fc2V0X2NwcGNfcGFyYSAgICBzZXRfY3BwYzsNCiAg
ICAgICAgdWludDY0X2FsaWduZWRfdCBnZXRfYXZnZnJlcTsNCiAgICAgICAgdWludDMyX3QgICAg
ICAgICAgICAgICAgICAgIHNldF9zY2hlZF9vcHRfc210Ow0KI2RlZmluZSBYRU5fU1lTQ1RMX0NY
X1VOTElNSVRFRCAweGZmZmZmZmZmVQ0KICAgICAgICB1aW50MzJfdCAgICAgICAgICAgICAgICAg
ICAgZ2V0X21heF9jc3RhdGU7DQogICAgICAgIHVpbnQzMl90ICAgICAgICAgICAgICAgICAgICBz
ZXRfbWF4X2NzdGF0ZTsNCiAgICB9IHU7DQp9DQpgYGANCkl0IGNvdWxkIGRlZHVjZSB0aGF0ICJz
dHJ1Y3QgeGVuX2dldF9jcHVmcmVxX3BhcmEiIGlzIGxpbWl0ZWQgdG8gMTI4IGJ5dGVzIChJIHRo
aW5rIGFjdHVhbCBsaW1pdCBpcyBzbWFsbGVyIHRoYW4gMTI4KS4uLi4NCg0KDQo+ID4gU28gSSdt
IGxlZnQgdG8gY3JlYXRlIGEgbmV3IHN1YmNtZCB0byBzcGVjaWZpY2FsbHkgZGVhbCB3aXRoIENQ
UEMgaW5mbw0KPiA+IEkgY291bGQgbGVhdmUgYWJvdmUgb3V0cHV0IGZvciBnZXQtY3B1ZnJlcS1w
YXJhIHVuY2hhbmdlZC4gVGhlbiB3ZSB3aWxsIGhhdmUNCj4gZHVwbGljYXRlIENQUEMgaW5mbyBp
biB0d28gY29tbWFuZHMuIE9yIGlzIGl0IGZpbmUgdG8gZG8gdGhhdD8NCj4NCj4gRHVwbGljYXRl
IGluZm9ybWF0aW9uIChpbiBkaXN0aW5jdCBjb21tYW5kcykgaXNuJ3QgYSBwcm9ibGVtIGVpdGhl
ciwgaW1vLg0KPg0KPiBKYXNvbiwgeW91IGRpZCB0aGUgSFdQIHdvcmsgaGVyZSAtIGFueSB0aG91
Z2h0cz8NCj4NCj4gSmFuDQo=

