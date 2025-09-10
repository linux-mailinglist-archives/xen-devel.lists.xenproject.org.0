Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA6DB5126F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 11:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117991.1463937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwH4w-00021R-Rl; Wed, 10 Sep 2025 09:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117991.1463937; Wed, 10 Sep 2025 09:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwH4w-0001zL-P2; Wed, 10 Sep 2025 09:25:26 +0000
Received: by outflank-mailman (input) for mailman id 1117991;
 Wed, 10 Sep 2025 09:25:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=golU=3V=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uwH4v-0001zF-27
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 09:25:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2009::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13479e52-8e28-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 11:25:23 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:25:20 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:25:20 +0000
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
X-Inumbo-ID: 13479e52-8e28-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ440w2BYxgIR3agI/W1iaJhvAwzRHo8YksXEWL0WfY2xdf1lE8kUFVYkh+F2MNiXpfkbw488aGAUx8G9MpVHK+cmEFvJJaMSNADFXuWo/cuP8X85BC4sgKKPTgbzSjf1rqJmQ7rH/hcK77HjtTDWlRpCXyqJrpT8qayRkdUPMDp3blCMMyEFLvEJLcw+v367qab/HcxYxZ+pzTs7QymC2Tgsvj8P2EzMt/otK155ipmwyXpDvPQO4BGqQLhsA3jkvTlsRKj6xBBwqLm7Z4KsIY0iQw5N/B9zXyPz2FOloBovMcqMLYp/S3Ot0uyv6PvQXbeUCVy2uxKsamvZQsnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXn1NxGUVUtecb88czaS+9Dinrt3d0ISxjrBELIvCWg=;
 b=DGiIrNtO9hffzj7hkSgcLb2GeNZPpPjxvpG97Lu2DDlb3T5fK/V0CUuVsIZeuZI18aTahsE5TGVrQMWGnqCr5n4Ebdc6tRNpeKsdvjHp1G9s4YX8F8ZcmF8L0A9sc09R4tzJ23AZf62CLtoPldeIk1oiShB3nahhsPou/FF0YCljxDiXbPZzRdDNPNzZPj11yWk2Hr/JwUVuHoZsJ3GolOPM4QMJ6p9TyOrPPgB8UAQKYdEFFJ6uk7nttHiOAvGtEUbjnsDwtb+FmwDs8qkt+7C4QRsKeFNd/BuZTsRdXPtoXAtnX0cuiUAJt7QnwHP8fonOc8jZ/dVOOJMWb2qG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXn1NxGUVUtecb88czaS+9Dinrt3d0ISxjrBELIvCWg=;
 b=SLylhIJ44uuZjel0U5HGVBD8wTJvAupx6wHJDuMQ5VIa25rX4osdtfj97JllWHjmpJUez7nsgVCzfK4VrcBH17Z2hHXlw8gbT9KNLA73f2BjXcpcPAG5SizDxE2IEAamFLqgsE9lJuhmns9JOD//qOz2tRVOWm2we0dzJKTFDqU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH 0/5] xen/vpci: miscellaneous fixes
Thread-Topic: [PATCH 0/5] xen/vpci: miscellaneous fixes
Thread-Index: AQHcDTURKj5JMcHd/UWxKXg/kyCmwrSM00uA
Date: Wed, 10 Sep 2025 09:25:19 +0000
Message-ID:
 <BL1PR12MB58492CEF8AFE02EF4E6B5B6AE70EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250814160358.95543-1-roger.pau@citrix.com>
In-Reply-To: <20250814160358.95543-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9094.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN2PR12MB4287:EE_
x-ms-office365-filtering-correlation-id: 2602ace3-091e-45a5-f68c-08ddf04bf628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eDlmbzdJWmhkZ0d6bk9lK0pRYVpRaXZvZjBVMjh5WGswUWdZRmlndHVHeFdL?=
 =?utf-8?B?Z3hmMmp1S0p6OVptTUtvZ1hidWJ5LzNWVVdLakRucyt5L2MyMStncEloVkRo?=
 =?utf-8?B?U1VqR1B3Q2MvQytJMk5wb0ExZXFOTDl5T3g1THBydzZpVXhMcEZrb0lwVVVm?=
 =?utf-8?B?VjdqQUtUdlBPZzJVSzY0cDQxZEZBaTBIam01cEdUU2pwQXYxTThKNEhHOEwr?=
 =?utf-8?B?NXFvZ3hCT0FoTGhtS2NWbEMzd09zK25Nc01wUVc5WXhuRWwrOGpkQ094TnJ4?=
 =?utf-8?B?dDhJWGk5TGs5MUtZT1N0bXdKVkVKZ1pKVHVGZVdmRDVQam5wRjQ3cXFzQkhW?=
 =?utf-8?B?dW9ScFJIWEkxT2syWWlFTFNvTDJvNzV6N1RsamdoTndhZXVCemczRHZFYmVD?=
 =?utf-8?B?cXZySy92M3NsbFhaMkVwUldFaG9ZZDRyMHBWeDRlemhvQkx3bUVJWnZUZ0xo?=
 =?utf-8?B?TFdFeVVPOW5naHRvb2VtdHc1eXJrdksyMkc3VjRjZk0zcVBvcTQ3V2NEc0tB?=
 =?utf-8?B?akN4ZnFNa3FSeWR5TEt2ajBxYTVYOTNXd2FvdDZ6cmkrWjZibmtYcGRrZWpo?=
 =?utf-8?B?VDlZOUlqcDd3N3lzajhOQjMyMWVlZnBWenBIWFNVWk55VmM5bk1DUGR2cUFK?=
 =?utf-8?B?bFBKbkxHUUU1TlV4V2ZWZHRSWTZOMTdicGdtUkFXeFpEbjZjSzFmTmtFYUdR?=
 =?utf-8?B?clFZMWhFenBpRVhITjc3MSsybjhjOUw3Yk5CeUlhbzBUb1VyVVNPaHlNZFVZ?=
 =?utf-8?B?cGFHajd4cUJ5VjFWUkowbDAvV21ueE9FMmF6QkNVRmN5WnRhQ3FmWnlRd0Jr?=
 =?utf-8?B?ZGNLOFNmVlY2M01jN2tocjNIZlBQa1hMSmh4OHpyVGZLNkVncW91VkVFeVRF?=
 =?utf-8?B?TTU3U05KaVBUUS9wc0szY0JBNWdhTTl2MFl4bkpWUUc3Q1ByQVVoMXJhU0Mw?=
 =?utf-8?B?TkRCemhyYVpKc1Qvamw4RlI2M1NuZUNTVlRQS3lVYUQrY0ZSRStmd09EQUlr?=
 =?utf-8?B?Ykh0ZFZ0dFhXVkVmb0VhWUk3eDlsUGRxN2piTC9tU1pyTzRiMjdtQVVKTHdO?=
 =?utf-8?B?dC8wL3NFQnh3T2tSOVRTOElNcVEzdVdoeHk1ZGNHRE1YZlBTRlV1N3VaU1F2?=
 =?utf-8?B?QUpVUWFmOWpybEtLY3dLaFZXQnBVNGhxdm5CTzVCRDZBQjZJU1lyYmt0eE5x?=
 =?utf-8?B?U01RNzlMNzhTSVI1NHZKb0ZHNU9hRzlVTXZQVkZ6bzl2MWtGWDc2ajdVRGtn?=
 =?utf-8?B?akFpUXdNQnErdGpGOVVUUEdBOGdleWkrRnpmU1V2Qkk3VDhrNXRmNzBTcGhw?=
 =?utf-8?B?blY3c1NQa2R1RHl2allmSHpvQXpjZGFoelZYQmRXMHluOUtBc0ZSUDBBRUto?=
 =?utf-8?B?Y0ZaVlk4WXVwL29xR0pTNWU0RWo2VmE0WFF4bEJMS2FZTVJXbE9Idm0xQlpX?=
 =?utf-8?B?cnk3UDBPNnYwRG44QXdMVHRsY0xxdW1lUkp1M3doc3doTzFPOTF6M0FTZytP?=
 =?utf-8?B?OEgrT1hqR1M5Z1REd1hmUXI1VGFJTmUwbXMvcnM1c3pQYk11TWhXckhqUWU5?=
 =?utf-8?B?NytuTE5jeVNUWG9GeFAxQU5HSEowdk5CUkVzaExCc2ptYWtKaDVtOXNqUmhx?=
 =?utf-8?B?c3BEVVhyb2Z0UHp5bTFBcU5yZDhJMUFGaW8xUlJGVjVKVnd3aXFDVjNYamRx?=
 =?utf-8?B?VStsMEdlOGd4TmRHWUQ5LzBGWkI2d1pKb2ZZT2wzZHZITXB1a2J0OWEzcnM5?=
 =?utf-8?B?OW5jcENiM1hXNFQvRTNDQlpBdzFvREZ6ZzlMMDdKc0pMZC9ZeDZXZFJOUUNi?=
 =?utf-8?B?SHBzYy9hNUhjdUpJaUlxeGtOZWlUNzhMY2RHdHpwVDlqMkw4U25nOUhkYTR0?=
 =?utf-8?B?b05kUSt6Sk51VWZwLzBuQnRadGxiWXdmc0ZyaThUNFJTWUFYQnhoN1ZOR3RB?=
 =?utf-8?B?cUZjaSs2SjEvdkVsRC83RHhqZ3RIRC9pbU5MSXdGMmYvdTRxUCs0YU00WjBn?=
 =?utf-8?Q?xbIOvXclBgWNj2gOJHhJur9XiMO4VE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THRkQ2toRWJNYkJEZkIwTHhENS9OUUtrWk9CQkhOUVFZbDlvRFMzdGk1ZERq?=
 =?utf-8?B?U2RWd2NyU0pVNEgyeVRIRDVQeDZMY0VpUTVvb1U2cEt6YWtuNnRzQ29PZXZC?=
 =?utf-8?B?U1VzYjdNU09ub3VtSFI4Zk1DNjJWRTVpM3kyem9BeC9xNXB0K3FLQ3NSZ2NB?=
 =?utf-8?B?N0JOVkpRZWJFbHFmRk8yL1h1UWlSaVBYdnFGYktPSHUycDQ3MjZuWnJNWDhq?=
 =?utf-8?B?M2JZdGl1SEFqOHdSRk12Q2FEMUFMU2JjWW9FcUpxRVUyclNZMlFaaXEvNW9m?=
 =?utf-8?B?OHFjWWJLTUV0REdXT3J3QWJYU3JqTUhDVUdlcU5HQ1RsY04waG1UMWZvQTZ3?=
 =?utf-8?B?NWtUN05BaDdqcWJMdXk1U2IwcFNudFJTTkJjazB1dm1UL0JHdTFudVN3R2R2?=
 =?utf-8?B?cmZLTlpqRmhLQ2RVdkdKTllWY1RWbnF0YmdrNFF5eTVqT3FnTytIRGM0NE0v?=
 =?utf-8?B?QWRjaFBDa1VBM2U5eGNNQkUyQzM0OHBSTDV6aHVnRnpxNWlkVXpwNkQ5OUlw?=
 =?utf-8?B?eFUxS3BuY1FaVndoOENlRDIyUlAyVlZrZVplY2JlQ0NOUUl5NEZwLzZBS0Jp?=
 =?utf-8?B?aFRkUzR1UU40MHBRd3FWWXl2R2JmL05CT3hjS292NXFLajJ3ZzFRcnpWREV5?=
 =?utf-8?B?UTNwK2xTa1YraW05WjM3akhFSHNVVHd5aDhQTDUwZk9LbjA2RGEyTWJLdlZ6?=
 =?utf-8?B?YTVoT3NRSVlMd0xEa3A0bThRc2YwUzVaeklMbHR1Y0JRVEVPRHZXZGFBaVNM?=
 =?utf-8?B?WjRsOTg5Z1huK2o3QTdhODNuM08yOUp1WEYzdERIODRJRjJjVXJYRHpkYWxY?=
 =?utf-8?B?djFmUm1OSHBabWYrYVNMNklUS24rN3liSEdFYkxKL1dJU21ibXRpVVpuQ3R0?=
 =?utf-8?B?L1Z5M0huaWYzS0QrWUhQQXlEMUl2MWdCbTRCVjd6MEdMemFjczJpTWpGd2dF?=
 =?utf-8?B?SDIxRjJZeWI5YU50TFdGd3RkNXZwbnlpekRIRUhsWlFXaFNTbXBKbEpxWW9X?=
 =?utf-8?B?NUpBS05pbktmRmlxbEgxM1RNbXB6UE9PYUVtdm16UXFkLzZicFY3RnlyTEI2?=
 =?utf-8?B?aDBCMGFpeTV6NEVCWDM0SGttSjlaZG9OczhpNGRPSWpHV0UySUdHYytpTkll?=
 =?utf-8?B?YWg2TFdoay9ZWTkvRm5YMUxmUy9oTlFFUGpEQlRXd3EwbFdaaTgzMDhqTDhz?=
 =?utf-8?B?b010aVdla0FxNkNtdVpFRnlCNDZyUHBGaHk1ZTRaKzVDTU5aV3o0TmFPZ3Zh?=
 =?utf-8?B?MWErVjBMTGVpdGg5eFlrTnFDd1hsUk9YRk11OTBlMG5QRVFYelErOHNFaGFj?=
 =?utf-8?B?UEVEdnFKc1dEUm9ETDdubHBSMFNEYTBXWnZEMDM2YnQ1UzhWL0IrSnBTVzRH?=
 =?utf-8?B?Rjl5ays0R3R2VkFpb2dZdXhoTGN4ZzRRZ2xHNzJMdUZualA2eUxKaVVPUGVK?=
 =?utf-8?B?RnBoektMdWloaFdlYzJJSkFrQy9tTWE4NVBBUUl1MTJZa0dWVkF2N3pvVFNu?=
 =?utf-8?B?QWVFNFpFVmIvMUdiZDFkM215bUlWQmk5eERNNXlWOGM3UFphMkU3T2JjVDFZ?=
 =?utf-8?B?NlhrNk43cVpGbkwwelIraHJTZ2Q0NmgzcUxKbWdrcWZJYTlxVEgzV21wRWVQ?=
 =?utf-8?B?TUZiKy9Bem9wUjRqaEIrWEU5YzA3azh0d3RyNSswK1RWUnVzRGdjWUtGOUd5?=
 =?utf-8?B?Z1lvMU8vMEQyUnpSdytsYklFZVlucFZkZnFHRmF3WkpCWHdJVlBITEs3K1By?=
 =?utf-8?B?ZFF6eVJLc3FkcEVlRTVYZG1OcWJXQkt3eDV4UTFjQkRMWUdEZndVVERGNmZP?=
 =?utf-8?B?Sm8xN1JrMHg3U1pQaXVzaFZmczlHSHJsZC9TV0IxWHh2VGMrS2dhOXlGWWpo?=
 =?utf-8?B?bmF5c2NpeU02YnA1YUs4WDU4OE9QNFhZZUtuNGtZOFBETDZiN1A4RXVZcHFF?=
 =?utf-8?B?Z25sK1dySFk5bk44YXpXL1p6UTBWcXJqcC9pYVRQb2ZSV01ZK3FOSlc1b2xQ?=
 =?utf-8?B?dC9aZDdpMGt2Nm9kMWdYdUM3V2ZQNjcwVDZDZ3VPS2VFMmUvNFYwdDZYUE51?=
 =?utf-8?B?QSszYU03UzcxVGVmYWxnUUgxaVNBWkt1ZzN1VjArSEl5V3FVSWpQcUh5a3hO?=
 =?utf-8?Q?0W14=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A40C82DB61CDB4FA4125B8ED973A71B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2602ace3-091e-45a5-f68c-08ddf04bf628
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 09:25:19.9003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7eITj2/dYGVIlTSiwG6g1Cr2Mkjac0PEHhIIzfh3cjs+AB0tFmmFCze7bGdsRGp1yQVibiShlqCEk5nZMS5qcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287

T24gMjAyNS84LzE1IDAwOjAzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+IEhlbGxvLA0KPiAN
Cj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgc3RhcnRlZCB3aXRoIHRoZSByZXBvcnQgaW46DQo+IA0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvZGJjMDAzYTItOTIwMi00NmVjLWJm
ODctMjgyOWQ4YTYzZDUzQGNpdHJpeC5jb20vDQo+IA0KPiBBbmQgZW5kZWQgdXAgZG9pbmcgYSBi
aXQgb2YgY2xlYW51cCBvbiB0aGUgd2F5LiAgSSB0aGluayB0aGUgb3ZlcmFsbA0KPiByZXN1bHQg
aXMgbmljZXIsIEkgbmV2ZXIgcmVhbGx5IGxpa2VkIHRoZSBkZWZlcnJhbCBvZiB0aGUgc2V0dGlu
ZyBvZiB0aGUNCj4gY29tbWFuZCBhbmQgUk9NIEJBUiByZWdpc3RlcnMsIGFzIGl0IG1ha2VzIHRo
ZSBsb2dpYyBtdWNoIGhhcmRlciB0bw0KPiBmb2xsb3cuICBJJ3ZlIGRvbmUgc29tZSB0ZXN0aW5n
LCBidXQgSSB3aWxsIHByb2JhYmx5IGRvIHNvbWUNCj4gc3BlY2lmaWMgdGVzdGluZyB0byBlbnN1
cmUgdGhlIGVycm9yIHBhdGhzIHdvcmsgYXMgZXhwZWN0ZWQgLSBhcyBJIGRvbid0DQo+IGhhdmUg
YSBzeXN0ZW0gdGhhdCB0cmlnZ2VyIHRob3NlLiANCkkgaGF2ZSBhcHBsaWVkIHRoaXMgc2VyaWVz
IHRvIG15IGxvY2FsIGVudmlyb25tZW50IGFuZCBydW4gc29tZSBub3JtYWwgZ3JhcGhpY3MgYXBw
cyB3aXRob3V0IGZpbmRpbmcgZXJyb3JzIGN1cnJlbnRseS4NCklmIHlvdSBuZWVkIHRvIGRvIHNv
bWUgc3BlY2lmaWMgdGVzdHMsIEkgYW0gaGFwcHkgdG8gaGVscCB0ZXN0aW5nLg0KDQo+IFBvc3Rp
bmcgaXQgYWhlYWQgYmVjYXVzZSBzb21lIHBhdGNoZXMgYXJlIGZhaXJseSB0cml2aWFsLCBhbmQg
dG8gZ2V0IGZlZWRiYWNrIG9uIHRoZSBhcHByb2FjaC4NCj4gDQo+IFRoYW5rcywgUm9nZXIuDQo+
IA0KPiBSb2dlciBQYXUgTW9ubmUgKDUpOg0KPiAgIHhlbi92cGNpOiBwdXJnZSBCQVIgcmFuZ2Vz
ZXQgY29udGVudHMgYmVmb3JlIHVzZQ0KPiAgIHhlbi92cGNpOiBtYWtlIEJBUiBtYXBwaW5nIG1v
cmUgcmVzaWxpZW50IGZvciB0aGUgaGFyZHdhcmUgZG9tYWluDQo+ICAgeGVuL3ZwY2k6IHNpbXBs
aWZ5IGhhbmRsaW5nIG9mIG1lbW9yeSBkZWNvZGluZyBhbmQgUk9NIGVuYWJsZSB3cml0ZXMNCj4g
ICB2cGNpL21zaXg6IG1vdmUgTVNJLVggaG9sZSBwdW5jaGluZyBhcyBhIHJlc3VsdCBvZiBtZW1v
cnkgZGVjb2RpbmcNCj4gICAgIGVuYWJsZQ0KPiAgIHhlbi92cGNpOiBvbmx5IGNoZWNrIEJBUiB2
YWxpZGl0eSBvbmNlDQo+IA0KPiAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDE4NiArKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgeGVuL2luY2x1ZGUveGVuL3Zw
Y2kuaCAgICB8ICAgNSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDEw
OSBkZWxldGlvbnMoLSkNCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQoN
Cg==

