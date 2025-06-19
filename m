Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BECEADFD86
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 08:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019690.1396223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS8Xw-0004Il-7u; Thu, 19 Jun 2025 06:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019690.1396223; Thu, 19 Jun 2025 06:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uS8Xw-0004Fj-4m; Thu, 19 Jun 2025 06:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1019690;
 Thu, 19 Jun 2025 06:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+aO=ZC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uS8Xu-0004FW-NI
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 06:14:46 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:240a::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09f8d9c-4cd4-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 08:14:43 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 06:14:38 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 06:14:38 +0000
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
X-Inumbo-ID: b09f8d9c-4cd4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mihsqB1vWk+3wZE44ya0EpSyCUSMgevBhg9CluASWPg8YrRp4ZhUT79Hz1Oyql3jAQJ46rwxzORFaj8l7eEb3co42hCN+8jJl7bcW3tA5S6L1Au+0jxX4vetL1dqKTg9jCiOOngD8DNsj2L2bunRpAkw/HCWCauEFbVy6y5iRX8GzQw4ZEwyH6zj6zEQi5N768WK9ZuQipdJqHG1lsAVdxIMioS6rWfXYo6JqEPci7ZpuEdktPxuIJCEM4KQCWDv5poe2uSObMy3euANuwRXhbBF4JfBXsSpUcyrkMXzgpR4k30qc/DNpxVdaJk/9qHOc1QxGBC2iA/3QZm4r4mSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2r8Na2cNk1ynXA/naaI2cd0FLTjugwUwwl2Dhl4eFI=;
 b=gdPYGzvti1vMg5vp85GxrRx19sJKMtNQtQQHGC3waiXKPka80GdiSFa2s+uMoYSXNFJFNjqhnFR9u9GF/NkPeLIPvMJ1GApBmAyRwFDlXVmfaua/UdxDhLtIog40lQqfsQz110EbfrS/lIJXMFszqQCEll/7gGmIRWMY5TchtlMjtJqnOMgbePq25FqzwkFlIYIgEbpJ2aU5qLgWM5auqK06kQIjvl/EYt+MrGGtqYtMvulalMXReAp9FOh9jPYMVd2lOfdxv7CcZtsUSiAGATkeWyxVuQYOIomqCtqExc+EP5X0iRXGDISXS381Dai45RW49TWZ+SlAVQ7VzRPC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2r8Na2cNk1ynXA/naaI2cd0FLTjugwUwwl2Dhl4eFI=;
 b=XGGM3DCz0cKZtDG0JLYY+rtgqWfVcfXChAWwiphGpNxjqbWRtX4PWs5f2lExquqEOqz24hVLOS923TqDbxA5w755ToxrN+TBWl6ohxaHsFf+XWdkfJFDNyvUc1KX2ByKlZkQM9LflSvu80DPxNKlkHxiRuMJ03lqQdsn0GnSexI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHb23yakGdVC9XxvEWnYcnp8zrTt7QJBRKAgAGLVIA=
Date: Thu, 19 Jun 2025 06:14:38 +0000
Message-ID:
 <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
In-Reply-To: <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7436:EE_
x-ms-office365-filtering-correlation-id: a76c9afe-68f2-4fee-8156-08ddaef8922c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RzZhcGVISE1jQUFLQkhnNy9USmlTYjd6NFZsN2lxdk9VM1lNdVd2aFFIWmhu?=
 =?utf-8?B?enhtZmtyVHI0blVEbU5tQ2l0MzN0SHdSRHc2cGxJdnUxRzRjUjloRU8vYUlC?=
 =?utf-8?B?dE92eTBOektYOUlpMGJOYk5BZmg0UUZzUHRoUGdPZUE1b1F2TktiWmZTMks5?=
 =?utf-8?B?eGdZaUNKZGVnZktSWTMxcHFWNzlCYkc3dHpJV0JueTFiTGdZMXlITFNvSXE2?=
 =?utf-8?B?QXkwcGt5SUZEbFpIWjhibGdocjZ4M1RiT21TUFJQZDUrZ0hYdjdQMFpRL2FM?=
 =?utf-8?B?Szh2UFlPR1FpUkVnL3BsMGRCUFQveFI5clFqdENDZEJzKzkyYWMrVVJjVFFJ?=
 =?utf-8?B?TmdXQ1Q0RFR5RlNaT1F0bWlUbklFUU91NzU4RkR1M3Mva1o2WEZ6VDYvYVpa?=
 =?utf-8?B?TjNNYzVaam9FcDdlblFNdWcwblpPV0Y2eGUwTm9vWEdEb1A1bFlSaVp1alVs?=
 =?utf-8?B?UGZwVjJiRVh4VUJNYmtkYXhmbzZwUUlBNmR4VmhWK2RCZHRyTi9zaFBpcHJV?=
 =?utf-8?B?WFZLcU1hVjdmT3VOME5ZcTZKMlNqclRtRTIwMzh5dlhTYmcrWG03aVRhUk0y?=
 =?utf-8?B?WVRpVVFqY2xMME5VR21ZWmo4elIrSGpkT0dWWE1IZTJnUlFaWk8xRzhpYTla?=
 =?utf-8?B?SHJ3R2hBTXNtN2Zya3FtUS9lMSt6clBObDFza3NCdmhQTHZSNWl3RTllOER5?=
 =?utf-8?B?MjExMThTZzh3VUI2dythQ3ZFSDFkYm5oTnlWSjUwQnNER0xHUVpONnh3eTdE?=
 =?utf-8?B?K2JNSDRmSXROUmVTbUNtR25rcUxEK0JkQitUeVFFVkh6RVcxWkZCKytRSG8x?=
 =?utf-8?B?eHhsNGhiV2VoT3JRdm5YNk4rVkdHT2UxUFdYcDdlbkV3Um1oK3V0VVRZSWd5?=
 =?utf-8?B?QU5oYUpNM3RvdHkyRnRnK0xpRW11T1pqQkVYMDNQNWFoZURjWS9wQzBGYnhh?=
 =?utf-8?B?dmwxSmZBV25vSlYwWjRSVjlhaU1HTTI1bFBoeWVlZTdjM1JzTDN5YldGUklY?=
 =?utf-8?B?Q29nSWZVMTd1ZzBIem5zTVNXYkJLUmwvU2FtZ3JXN0Ficit2aGJWUWhZaTcv?=
 =?utf-8?B?azNZODNNcy9HZVhTNVBTVnJJWFhhejQ0VWxmb2tPSnYwanVIZmhSRWNpeW10?=
 =?utf-8?B?clc3NlJtREluV05WR3U5Yk9OM0xEWmt0bGJRY3RGeVFVYnZVRGh5bXpXVTkz?=
 =?utf-8?B?YkRYSGJEYVhDS0xZWUhBRGoyRVFvVC9FWGxEWTFSbVdHRktkUXJuRkwxOWdo?=
 =?utf-8?B?STZLV3dXdHlnK2pWdjJJRUNVK2pvMFNtVlhxRFlkaTQ4bTJId1AwalJhZHZ6?=
 =?utf-8?B?VmNyVUJNbmcra1ZxcTNucWd2T0M1eTJEaGd4NjdDUjcwN3Z1YkcrdG1ZU0x0?=
 =?utf-8?B?RnpPNGFsZnhKMVVWTEFlUmdLVUJBRE4xR1ZTU3JkSlZXMEhvQmZPTGlXUTky?=
 =?utf-8?B?TVNOSXA2Zytqc1JORnl4NWhjVWhKbjdwUmVOQUVvVzJOOFJvZk1hVDduN0lr?=
 =?utf-8?B?OVM1VFk0Zm44dHNOZURvWDlYRGM5cjhMeElXcDR0eFVTWW5mUmtTcEVkTlJZ?=
 =?utf-8?B?MnFzZDEvcWIyVDY0MFFjdC81RjN4cndXeEg4Mm8zY3MxVkxhTUlwVDFBVmlh?=
 =?utf-8?B?ajBDOWFPQmVUTVpKa3lBdWtxeFAxRW9zWFUzd1IxRjdKV2xDT3hmVDZoWlVr?=
 =?utf-8?B?bnhoQzB2R25xOHJyclhNZHhEVWNaUUdScXR2djZCNlFyMU1NVmJtbndMTFdi?=
 =?utf-8?B?MEdQcXJLSHhpQmd2OXQzZm13eXdoQ0xEYi9Gakt2T2FUUEQ2R1l4NE83N2dH?=
 =?utf-8?B?WUYvWEVkL1RGM1plekZvWkJLQnRzU3ZZS2oxUTFkSUpMa0NuOUl0RE1ReWE4?=
 =?utf-8?B?S2Z6eDV3UHYzWmdGRncrUFBaRFdrakNTWGxnVURXUXNnVUV2M045QTczVkVG?=
 =?utf-8?B?OGVWYUVRK1dLbXVQQlRxU3lEOUxJZ2FLOGVOTEI5QU1UaVRYeWs3TWVLUW1F?=
 =?utf-8?Q?TjUmaCDp6zEtXjsBaXm3JDYD39Jc3Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHFsbE9xWENMczByamhJRzIyRStMR20xc1ZQL2JicFp0Y3o1d1dzb0JwSTlY?=
 =?utf-8?B?aDB2eXNJS1YrOGpTWkF3YjRzczRPS3VvZjBaN3BsRlF1QlpSb05IaUFhNDU5?=
 =?utf-8?B?YWZPZDRTNUNzN09Oazh3Z0hFSHp6WHBMMmNVZVRaM2ZJNWtLcFRIQUR6MWll?=
 =?utf-8?B?V0ZKbGUycDE3YUdTb1BlWGRGN2hCRTVxSjdJVVVrb01vRVZmN2k5UHNPVUtD?=
 =?utf-8?B?MXlmdkRiUTNpb21jL3g2UmJjV3hrNUcvQkE0YXBFS0RJbUNBSWd1UURQR3lF?=
 =?utf-8?B?WDk3T3VaSWkybVBDazJjVGNsVkp6TGx5cU1iZDVqYWhzcUQ1eU9ORlBHRUFy?=
 =?utf-8?B?U2ZTd3A0QkVidXZaQzFYKzdVNThHNjJ4YWZFWE5mYU5xSDE2WElPV0JVUXYx?=
 =?utf-8?B?dEVUNU9xdi82bThOWVR6RmZNY1Bvc3pVYmNHMGllSk1oV29BeEQvMnZ4NFln?=
 =?utf-8?B?L21KYThqOUM3Z3JmS1ZKbVU1ZVM4dVhaS1M4SzhlUnFKSVZBR0NRYm9EZFdE?=
 =?utf-8?B?MEVWZ2dGQk9WMmpjRnVDUFl2NGhhVWEvZ1dTM2ZMNGcwZm1jZGM3ODhYYlEx?=
 =?utf-8?B?RTI1ZW9uc3pKZ2NqWElNZnRYSTRobmRYTE9Bci91eHA1aGM5TDFuV2U3aU1j?=
 =?utf-8?B?V1FVK1N3SVhPa1diMXMzOVZNV3RHQ0tCdTFXRHpwZng1SFF2b3BlWmJDUWRW?=
 =?utf-8?B?VTRwSVl5U25oSE12TmlHWFo5R2g1cEJGT3hKZUVWTzJqcGQxYXAzRFlscklq?=
 =?utf-8?B?by9uWm02bXFwT0NJdmcyeTdFbUJxMGpGMnlCd0FtU0FlSFc5enR1emtwQUZ2?=
 =?utf-8?B?WlZxeWRGOUNJclBhaG0wSml5bXV3M1owaW5acys5UWt0ZW5RYkJpYnhISU5P?=
 =?utf-8?B?L1I4L1BmZEQyQlhkakVIcy9RUkF6OVRKbzUzK2hPd2Y5QXFLeEs3S3RWU3NU?=
 =?utf-8?B?M3ozd3hULytFcFVFd1pGaExLT2VldXdGdFJiYks2M2ZYVU5xUXNLdjlMOW5p?=
 =?utf-8?B?RjF2WDlrL2l6TXRCRWlNR1BHL0dhWFhWM3BXcW5iQ2VsUU9rMzQ2czRvaElU?=
 =?utf-8?B?bENWM2s1YVRxNGM5eE0xT0xmTEtNajdUYjVVWFMzMDdqbFNrZjkxcnd0Rnh6?=
 =?utf-8?B?TzA0YXBWcHJlQkQrTTAwa2EyRU1RSXhlRjFxbTloSFRKa2w4SlNNUFlra0Zj?=
 =?utf-8?B?UUVKQ3pxV0FxZnBqbnZxajZFY1krY3NyM0JpRlpyRGdHdE5MZE9QZkNqR1pB?=
 =?utf-8?B?dGVwaXlSYUNkSW4vL2dGdUVXeVI5b2RWS0w4Vk45N1RLNDE3ZUJhQ244Q1Jz?=
 =?utf-8?B?NjdEV0VWK29mVGdaenNnYnZ6VXpIMS95ODZLbzFHTWpTd0JJYW1MRWxkeUli?=
 =?utf-8?B?QWJYa0ZiVS9jc3RsS3UyN052VDM2U3o5b2lzT0NyTGZzNzVMWlpiOUpkaWNS?=
 =?utf-8?B?a3pHeDI3SERKMHFBeXdBNEFhc3ArOFRZejA1T3NHN25xZFJJZE5tWnFVZk04?=
 =?utf-8?B?RnZjL0ZJQUVhR1VvbisxY2svNjRBdDljZXJxQTVEeWVMQ0pCNWNJSGJYU01u?=
 =?utf-8?B?SWZ6Uzg1cUd4WEZ4cHNxU0JwWmlHUWlFWUNFaCtvZ3h1UDU3eUZ2VWxtVDA4?=
 =?utf-8?B?eTFyaTJ4ZTVRNUVRenI0U0JqSm13bUVOaGZLZU9HckR6RVdtYTU4cy9IRVBu?=
 =?utf-8?B?ekZrV3ZOY1lXY0VxRzRZMVR4RUV4QUZ0TW1kdUR1aDVRVEJtRzA0UDZ3UEhm?=
 =?utf-8?B?djdTdE1JQVVTWkxpVGlhK0lTOG84VjNiY2taeWFEeUZYQjd0WXI2eVg3WDJO?=
 =?utf-8?B?b2hiTU5RV1Uzck9xdTJKQjhrYnBBVDk0OUZreUNkUlVHRWFwT20rUkkreXFk?=
 =?utf-8?B?VXVzelZSRlBMQWhwNkNDd2N6V3IxOE54UWwrL3EvNFBlWGxuV0EzcWl1dDZ3?=
 =?utf-8?B?QllaM3FRZmQ0eEszTXNpWDRMNGt2NEhib0pkSUx4Vit6cWxSWnRRa3BIR0JG?=
 =?utf-8?B?VzRzTjMyejQ5ZnJqcW1uaWtEQVhMcVNPQjBLNDJDMWJYYlUyZXRMeU1aNE1V?=
 =?utf-8?B?bjhmaVppZmM5Yk9aYXVxMFlqSDJqanBZQzdVa2d2RTBIbjZCVWhiVW95Skh2?=
 =?utf-8?Q?8kh0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E3D7E281AE512488196C34436807B8C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76c9afe-68f2-4fee-8156-08ddaef8922c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 06:14:38.3416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yo2OuGgYb3yl5qVfwddnzfBgT0VpKzFcMJoAUnVMONZ74B8uFt/c28A1a59nPOkVwU+Cs+8In55+umSN3ayXyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436

T24gMjAyNS82LzE4IDIyOjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNSAx
MToyOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5o
DQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBAQCAtMTMsMTEgKzEzLDEyIEBA
IHR5cGVkZWYgdWludDMyX3QgdnBjaV9yZWFkX3QoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYs
IHVuc2lnbmVkIGludCByZWcsDQo+PiAgdHlwZWRlZiB2b2lkIHZwY2lfd3JpdGVfdChjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0YSk7DQo+PiAgDQo+PiAtdHlwZWRl
ZiBpbnQgdnBjaV9yZWdpc3Rlcl9pbml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiAtDQo+
PiAtI2RlZmluZSBWUENJX1BSSU9SSVRZX0hJR0ggICAgICAiMSINCj4+IC0jZGVmaW5lIFZQQ0lf
UFJJT1JJVFlfTUlERExFICAgICI1Ig0KPj4gLSNkZWZpbmUgVlBDSV9QUklPUklUWV9MT1cgICAg
ICAgIjkiDQo+PiArdHlwZWRlZiBzdHJ1Y3Qgew0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaWQ7DQo+
PiArICAgIGJvb2wgaXNfZXh0Ow0KPj4gKyAgICBpbnQgKCppbml0KShzdHJ1Y3QgcGNpX2RldiAq
cGRldik7DQo+PiArICAgIGludCAoKmNsZWFudXApKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4g
DQo+IElzIGNvbnN0IHJlYWxseSBub3QgcG9zc2libGUgdG8gYWRkIHRvIGF0IGxlYXN0IG9uZSBv
ZiB0aGVzZSB0d28/DQpXaWxsIGNoYW5nZSB0byBiZSA6DQoNCnR5cGVkZWYgc3RydWN0IHsNCiAg
ICB1bnNpZ25lZCBpbnQgaWQ7DQogICAgYm9vbCBpc19leHQ7DQogICAgaW50ICgqIGNvbnN0IGlu
aXQpKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCiAgICBpbnQgKCogY29uc3QgY2xlYW51cCkoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpOw0KfSB2cGNpX2NhcGFiaWxpdHlfdDsNCg0KPiANCj4+ICt9IHZw
Y2lfY2FwYWJpbGl0eV90Ow0KPiANCj4gQXMgeW91IGhhdmUgaXQgaGVyZSwgLi4uDQo+IA0KPj4g
QEAgLTI5LDkgKzMwLDIyIEBAIHR5cGVkZWYgaW50IHZwY2lfcmVnaXN0ZXJfaW5pdF90KHN0cnVj
dCBwY2lfZGV2ICpkZXYpOw0KPj4gICAqLw0KPj4gICNkZWZpbmUgVlBDSV9NQVhfVklSVF9ERVYg
ICAgICAgKFBDSV9TTE9UKH4wKSArIDEpDQo+PiAgDQo+PiAtI2RlZmluZSBSRUdJU1RFUl9WUENJ
X0lOSVQoeCwgcCkgICAgICAgICAgICAgICAgXA0KPj4gLSAgc3RhdGljIHZwY2lfcmVnaXN0ZXJf
aW5pdF90ICpjb25zdCB4IyNfZW50cnkgIFwNCj4+IC0gICAgICAgICAgICAgICBfX3VzZWRfc2Vj
dGlvbigiLmRhdGEudnBjaS4iIHApID0gKHgpDQo+PiArI2RlZmluZSBSRUdJU1RFUl9WUENJX0NB
UEFCSUxJVFkoY2FwLCBmaW5pdCwgZmNsZWFuLCBleHQpIFwNCj4+ICsgICAgc3RhdGljIGNvbnN0
IHZwY2lfY2FwYWJpbGl0eV90IGZpbml0IyNfdCA9IHsgXA0KPiANCj4gLi4uIF90IHN1ZmZpeGVz
IGdlbmVyYWxseSBkZXNpZ25hdGUgdHlwZXMuIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFidXNl
DQo+IHRoYXQgc3VmZml4IGZvciBhbiBpZGVudGlmaWVyIG9mIGEgdmFyaWFibGUuDQpXaGF0IGRv
IHlvdSB0aGluayBJIHNob3VsZCBjaGFuZ2UgdG8/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3Qg
cmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

