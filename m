Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640DADC01D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 06:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017668.1394659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRNgf-0003W9-TN; Tue, 17 Jun 2025 04:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017668.1394659; Tue, 17 Jun 2025 04:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRNgf-0003Tj-Qh; Tue, 17 Jun 2025 04:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1017668;
 Tue, 17 Jun 2025 04:12:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zxid=ZA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uRNge-0003Td-DU
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 04:12:40 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2405::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e32598b-4b31-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 06:12:38 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:12:35 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 04:12:35 +0000
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
X-Inumbo-ID: 4e32598b-4b31-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZduzlPCuMu9rBrvqPJk6WNEj1s2tUYX00TKjDRlXH7Fubsi3yVSTOn16PzptDvhnVCpS2PBf7oIrGPt6xaR2viiYK/EBcB6sXgn3K17lyootqPrgd9tqWu2NORj5ZrhekUZuxbiQ1CTGDFm+W3ZhHppHKV/X9vI/Hv2BuJ8AR01XFwH2fJbKR1/dH7hWwYSz/8WrxetmYkt6DIjyXonvbyCGwrtK94Y2DQh9sBRTuzleeQakITCyMxq16MSz6KDCEouxsqBN5cy/iiSeApfJM+qVAkr+fPFEFbJyi3eCNjbkGPhiZVVG9TLXoNBihDnQufq0PN++kQ1FV1cIBPa1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk0xlGTq5pzlkgXqyM5YgTpnYBf/brnDSmoj+Cn1hdE=;
 b=j4JULHu125lEUL2dxoKHPfqaBuzx2V+7RUAn2JtZ/n9ztwK54IFWSB+wfK8MhIFMyv53zFw91FZ2f8rtJQZIc1skH+m4Jnhb4MUM3OWud3tYtmadsn2FXf1sTrhHYMkRZZQffnGt4SlnFfhiDUiu9P+hTEhigspZpzCRLTn2g3eNIpPaFUvAPBEbKXzL/3e6omeX7/tCK+XL5+DpyWh/Eh3oOlogirrHGbniteLfm+R+LsMUeoiyHDW+ljUzn0/oK7YrlSo6ho9FIrf5P2rWQCw12VcDiX1JmcvTriIlgoUrGm8kheyLwRw0MO5QatVQCzUHKNbzjlitBe+c4MFC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk0xlGTq5pzlkgXqyM5YgTpnYBf/brnDSmoj+Cn1hdE=;
 b=Y1yVxSTz3wflF5aTzmcr3ikDcFzXDtLEKeGXUr89D4C4Pn4HD7YQ9p8+ua2NrTpm9VHTLFmvKe3JjDnW49cOtGhjsgdL4coPFiQ6YSFU+pNu4QN8r5d8K/tvrg4bU9BSkxKk/mwA+aL4E3Pqy05Cm5x6/ViGjU26W9g63Dply3s=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Topic: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Index: AQHbzuQ7tkLRAfE4aEeQu239amEhMrP+LqUAgAdzEsCAAAj3gIABLclw
Date: Tue, 17 Jun 2025 04:12:35 +0000
Message-ID:
 <DM4PR12MB8451236776D6F83C5B38A527E173A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-4-Penny.Zheng@amd.com>
 <005a0e3a-dc8f-480f-8bb9-fd8eb164eb02@suse.com>
 <DM4PR12MB84516E8BD6E4C48D48273C93E170A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <824a8aa5-c603-47e8-8688-a324152329a9@suse.com>
In-Reply-To: <824a8aa5-c603-47e8-8688-a324152329a9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-17T04:12:28.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB6163:EE_
x-ms-office365-filtering-correlation-id: ce2b4d42-c7e2-4a5b-ae63-08ddad55304c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TzNJNndmblUzWWMrd1dWWlVqTVBXZ3l2d3VIYlFjSkgraUozakJuNmtTOVBX?=
 =?utf-8?B?TytYbVYvQzBvdEVWMHVjbHdBbFE4c1dmTllxdTNjRE11MVdleGl2K2xyOXlB?=
 =?utf-8?B?b05kakJXZm9rL1QvcGE0RVc3MktzbS9SNnVpNGVPcjlSR1FJeXdsemxmYi92?=
 =?utf-8?B?VmpnOTIyb3Z2L3NlMWNxcFdzeUpvL0pvbEhpSkEzQkNLVVlqRWRUajdONjQ4?=
 =?utf-8?B?Z3A0czRJUVY0MlZFSEN3OWJ2YUxIWnpLVnRsSlpHOG1oenFkZ3BXRklNOFlj?=
 =?utf-8?B?WGQyU2VtalUrSkR5ejN3QTljME5Zc2MyWllKNEduNTJlZStNeDRVS3pqUDFF?=
 =?utf-8?B?bUU1RUVuNkM0MGN0dVNoeWRzRHYvYTBGSE5XVjJjWlU2eGdta1dTbGFuaGNC?=
 =?utf-8?B?TldmclpTUVBBaElBVWp0WnFFb1grenJlcTRwcEVUU292UEp4aFJEOFpkRUMv?=
 =?utf-8?B?SFlwTHBsbVVVQkhla25RcUU3VmUrc042TnZoNVJpUE5Cb05nTGhaWDA5bnkv?=
 =?utf-8?B?ck5LaFkwRGloM3lPZjJIMUJZWnZrVTIvMlFXSDU3U2hDdXMvTVpZM1YxOG9T?=
 =?utf-8?B?TDMrWjBWbFB0QU9yeWZsZlhsRzEvM1pSNFZYUkFjWjNLTThmTTdlelV3Zlk3?=
 =?utf-8?B?eWlPR0cxOG9JcmJsTU9hSTNvbXRXUCtHclJ0QmJGV0R3Qm1HUHR5SHAvVU8v?=
 =?utf-8?B?ZW4xaEkxZjV4WE0xaXRCbjIxbEh5UFJQUnQya2FTTDNjMDhkNnlqVXRKd3FQ?=
 =?utf-8?B?SGdjL3dwdSs2by9UM3hHZUtYZC81cjZSMXMyVytMWitrbDBkY1EreUF2UDlR?=
 =?utf-8?B?L3dQanVVdVRyNGRRa3k3Vlp4ZjczTVgwUkczQnBYZnFBeFBpbFQzY3dNRERx?=
 =?utf-8?B?SHlGMGRZNFhqZlQrY2hLSURJaitGUmpabDByNWtMWE1ENlFoZmU0M1JYTnVH?=
 =?utf-8?B?WlVGSzN3enl6K2VYMFNNalVjYmhzRDR2cDV3MSswWXF5N2ZZT1lRdEVnZ0RR?=
 =?utf-8?B?RlhwMjdOa2huV21BV25yb2ZETVFNbTU1aUZhcWE4N095Q3RVaE8zQVVnT3cz?=
 =?utf-8?B?bnVIVmsvNytsTjNrK2lhYXZUQkJlUjVCaWJpUUZRZTBoZW9rU2lzejIzV3BP?=
 =?utf-8?B?K201aDBZcVlhL2RxaGl2MDJFSlJYc1ozSzdqM3N5V1Nza3grcnQ3NFlVaUl6?=
 =?utf-8?B?ZWkxdlRkM3piREl5L0ZPalc0aUg2WnhSeE5ndXN4UjdicFdDQmNTc093M21S?=
 =?utf-8?B?STl4MFFIbXlWZXdHR3BvbFpFNWxQbmc0M2UwT0pGWlBKQ1UvcEZ5dy9Rb00z?=
 =?utf-8?B?N2pMWHdBb3JiMWlQUWhYY1o2RHRXR1h2YnJ5dWhGZnZGRjlKT3dQNS9GWUpZ?=
 =?utf-8?B?VWNUbjJ5WUZSazhIbTk2dFdmVzVxbmh5QjFaenI1VzAvQ042T1JDTXVadGNS?=
 =?utf-8?B?ZnNtZ1k5M2ZZeFRkU1dGekNBRGc3Qm42dTdsUG5vOVdmYW1NRm9QcmpURlk2?=
 =?utf-8?B?OFFIZ1VyaHJHbHR5WW0xaUtHZU90ckN0SXk5OHQxQXA0aG5LejVjMXpIaEpH?=
 =?utf-8?B?UjZ0TWZxMUdGS3VETjQ5Vll2MHR4K3dhYWk0dVY3Yzk3b295NUx2eEFaNll2?=
 =?utf-8?B?TEYvSXhBN0hSRnNJY1UvWEVMaHV1bXJoRmZobVI2dVZXNWZiRFlTK040ODkx?=
 =?utf-8?B?MmM1S0VVWU5rRitsR1BxR2RoYnlJUTAzSFdvMjVhNko5bjNKdkRwRUROSHdF?=
 =?utf-8?B?aTFKZklMb25mRkVVZFpYUjZ0bVIwUjFCTzAvTlBNK2NYSUpWQ2ZHazZjeUx6?=
 =?utf-8?B?bXZlSnJ2QzV4ZXY4MzN2dmJXcWVJRU50M3AzczVOeXI2cFhJWkpVL1hBbjQ3?=
 =?utf-8?B?d1NGVmxmT2RJS2RTZUluUE81UGUvM29PQWlrMnc4QnQ3MDlWRlJLYmR1YlFO?=
 =?utf-8?B?aVBpVTFEZ3g5RmJCVDV4ejAwVEtjRUVWV2d2aU85MHVmZTVTenJQS0dudTlt?=
 =?utf-8?Q?hrWU4pCVjT+yOqLl8tzX7S8U42Sqak=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWtpRUl2SHdGd2JWY0k3YXprcjJwSUdaZGJaVms3YTBicWlKd05uSWhJcE14?=
 =?utf-8?B?NE45MzF6Q1VwYkdmaE44NXBQVlNPcGV4eGVtaWlFT2licTdJdXlrRVoxU253?=
 =?utf-8?B?S3d4NUg5N21RRmFDWFVaVnd5bGR1RjhTbVV2UENiK2MzbnZvNkI2TmxmVHJL?=
 =?utf-8?B?U1hsbXNHVk1RYmRFRFVwaWhPdkV1bkdaeW41U3NrdjF4WFUyaFlwN0U4U0pN?=
 =?utf-8?B?V1pyS3FsWGxHa09oUmF1SVNwYlB0T3ZvOEdBUkpIRDdybjZBMXZhUHNYVm1X?=
 =?utf-8?B?dWswN2tqdFRCNnBnMU1qbkxuZ00zbWw0V1VnMFZzTmpmVld4SHdubWFOUEdS?=
 =?utf-8?B?d0VKc3R5dHRYVE5jQzdiaDNqUkR5M20xVFc3M3dkRGtPMTQyZWpHN2xVVDJ4?=
 =?utf-8?B?eVhUV2NiSS9pRmo4SWZnVy8zcW5IblhyV0hiRE9Md0k4WHlscDJyYnA0YTU0?=
 =?utf-8?B?eEk4OGx6bHo4V2lWZXkzVUYvY0tnRXh3dm1BcFRsemErNkYxTDFUTGtSY0tj?=
 =?utf-8?B?K2QrTm00RHEveEE3TEJrU2FTdWZTaCs4S0M0K0Y1VVBGSW1CVktYcVQ5bG9E?=
 =?utf-8?B?MEd4ZnFleHpLNW16M1NER0tpTlZKa0ZyTXNuZ3V4YzM2a2I5RUlCeENSZjY2?=
 =?utf-8?B?djJBWVJSckMxb2l1K0ZHUTNqSnVudUhjbW4yWWxySjdaRjNiTmFHL1dBTWIz?=
 =?utf-8?B?VDN6QzlCSytIWmtGTnViUmxacktValdwT0YwNEJ0ZWRMNHVnNWlUTlV1UnNs?=
 =?utf-8?B?RWhUcS8rdnY0bkZCOHlVU09mTEVHNmRGMmdzTVpjZUdlU3pZYk9WUWRVdmp2?=
 =?utf-8?B?U0tlRkdRVXhaQktJdnYrY2cwYVVlM0xBRldESEJqUWhYb1VpTVM0T2FVT3di?=
 =?utf-8?B?aDlqVjFxdk8vWmovZmdhRDBUUzVveVlJMEYxL3JXaDRwMWRJU2FrazJjL3pL?=
 =?utf-8?B?eXNabDFCUnJPVWJpY2N2MkR3SzEyZUxJZm5yYzIya2xDYk5BUDdOVzlvbnhH?=
 =?utf-8?B?TEpqMFZGcFpuc3Nia2RKOE14VFVEL2s4eE5Zb0hWZ3FvdllmOEQyUHZyTDNE?=
 =?utf-8?B?djZKNnJQSnlZVHk4SDluL2gwSFloN1ZDeGU1bnYyckxZVlRMaEFXL0xwNjJP?=
 =?utf-8?B?WWdMMXZPWVpTQWR6NnMyOHUrd09MeVFSN1NtMzVOOWRLeUMxWHI1M0J5VGRl?=
 =?utf-8?B?YzNEQTN5TlVycnZHQXJDWEd0RTl2VkdpL3RhL2NPSnZHOGY2NGFicTZ1ODlz?=
 =?utf-8?B?L2RyY0N4UE5rWWJMMTJWajI1aHJERUQrWU93eTgrZDVKUDZ3V2Nuanlzc09N?=
 =?utf-8?B?R1FMYklFclhJOWNGSXhBZzFwOGNOSnVnbGVRakZ5S1MxUElLYmZxUDdkZzJm?=
 =?utf-8?B?OG9WcE5qNmJ3Nmx5UEFlNW1vVzNaL3lOOTYxWjdZaHNONWw1clB3SHpoeDQz?=
 =?utf-8?B?Qzd0bTNBelhZcTErd3c1MmtlOTBBUUx4bDZGQWlNRFF6R0pTUjIzTUNvb2lp?=
 =?utf-8?B?THhGaERKYlN6Q2RHeTQ2M203WjBJeU9XWHBSUXZmUTFIOXBxR3EzZEFrUGQ1?=
 =?utf-8?B?UUppWElPOVFIT1lvckQzcWJ2SVlsOVBvTjJBQUhET0lwRGhYd2c2MWJVeTV4?=
 =?utf-8?B?RWl3VDZwd3AzUGl0UUQ2YXVxN0JwYWNhckUrRXlWc2UrZ0lFV3oxR3V2SFVE?=
 =?utf-8?B?UlZvUnNpMXVPNVRRTXJvdXBaNjV4SHVjb0lyQ2NRVHlsbWZkQmlMbVZyOEhJ?=
 =?utf-8?B?NjgwQzdicDhTbVJSajQrYTZ2L0V5MXlzb0lreExjQnU3OUpNbjFkTU9VWTNM?=
 =?utf-8?B?THhFY2MzeXhHZktnbldhRy9rTGlsWlIzQjFDM2JjMjM5UXM3dGNqdXA4U2dJ?=
 =?utf-8?B?RW50bWhRUXR6Y2Jma1hDMVkwZXRlWDF0NDFRVmtYbFRZSHBqa3l5ZEgrU2pr?=
 =?utf-8?B?SzUyMnRadEVvRFlQbllKdEkwOWZHR3k3MFJQcHcyenhYSkY0QTBtZ00zeUx0?=
 =?utf-8?B?dkVFMWdTYTBreXpDeTBzK3IwVmYwSk1ZVCtGRjkvUk1ERlJGbWRNUmtreXdr?=
 =?utf-8?B?amxwNWFPRUFpWENNTVZFeU42N0JWRVI0NkwyTDBmK1Zob2VEYWxrY1RhTE05?=
 =?utf-8?Q?lVh4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2b4d42-c7e2-4a5b-ae63-08ddad55304c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 04:12:35.0346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZXg6+XqLJ1W70yjwulvj8mLdQshggCumJWPRuebpUlY3IOdEHcaxKksStlW78wnibuZ3yRYkW6bppVcmrKREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAxNiwgMjAyNSA1
OjUxIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAzLzE4XSB4ZW4vY3B1ZnJlcTogZXh0cmFj
dCBfUFNEIGluZm8gZnJvbSAic3RydWN0DQo+IHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2UiDQo+
DQo+IE9uIDE2LjA2LjIwMjUgMTE6NDMsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbUHVibGlj
XQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEx
LCAyMDI1IDExOjM0IFBNDQo+ID4+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5j
b20+DQo+ID4+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAzLzE4XSB4
ZW4vY3B1ZnJlcTogZXh0cmFjdCBfUFNEIGluZm8gZnJvbQ0KPiA+PiAic3RydWN0IHhlbl9wcm9j
ZXNzb3JfcGVyZm9ybWFuY2UiDQo+ID4+DQo+ID4+IE9uIDI3LjA1LjIwMjUgMTA6NDgsIFBlbm55
IFpoZW5nIHdyb3RlOg0KPiA+Pj4gQEAgLTU0NSwxNCArNTk3LDkgQEAgaW50IHNldF9weF9wbWlu
Zm8odWludDMyX3QgYWNwaV9pZCwgc3RydWN0DQo+ID4+PiB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1h
bmNlICpwZXJmKQ0KPiA+Pj4NCj4gPj4+ICAgICAgaWYgKCBwZXJmLT5mbGFncyAmIFhFTl9QWF9Q
U0QgKQ0KPiA+Pj4gICAgICB7DQo+ID4+PiAtICAgICAgICAvKiBjaGVjayBkb21haW4gY29vcmRp
bmF0aW9uICovDQo+ID4+PiAtICAgICAgICBpZiAoIHBlcmYtPnNoYXJlZF90eXBlICE9IENQVUZS
RVFfU0hBUkVEX1RZUEVfQUxMICYmDQo+ID4+PiAtICAgICAgICAgICAgIHBlcmYtPnNoYXJlZF90
eXBlICE9IENQVUZSRVFfU0hBUkVEX1RZUEVfQU5ZICYmDQo+ID4+PiAtICAgICAgICAgICAgIHBl
cmYtPnNoYXJlZF90eXBlICE9IENQVUZSRVFfU0hBUkVEX1RZUEVfSFcgKQ0KPiA+Pj4gLSAgICAg
ICAgew0KPiA+Pj4gLSAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4+PiArICAgICAgICBy
ZXQgPSBjaGVja19wc2RfcG1pbmZvKHBlcmYtPnNoYXJlZF90eXBlKTsNCj4gPj4+ICsgICAgICAg
IGlmICggcmV0ICkNCj4gPj4+ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPj4+IC0gICAgICAg
IH0NCj4gPj4+DQo+ID4+PiAgICAgICAgICBweHB0LT5zaGFyZWRfdHlwZSA9IHBlcmYtPnNoYXJl
ZF90eXBlOw0KPiA+Pj4gICAgICAgICAgbWVtY3B5KCZweHB0LT5kb21haW5faW5mbywgJnBlcmYt
PmRvbWFpbl9pbmZvLA0KPiA+Pg0KPiA+PiAuLi4gdGhlIG5lZWQgZm9yIHRoaXMgY2hhbmdlLiBB
bmQgZXZlbiBpZiB0aGVyZSBpcyBhIG5lZWQsIGENCj4gPj4gZm9sbG93LW9uIHF1ZXN0aW9uIHdv
dWxkIGJlIGhvdyB0aGlzIHJlbGF0ZXMgdG8gdGhlIHN1YmplY3Qgb2YgdGhpcyBwYXRjaC4NCj4g
Pg0KPiA+IEkgZXh0cmFjdGVkIHRoaXMgc25pcHBldCBvdXQgZm9yIHNoYXJpbmcgdGhlIHNhbWUg
Y2hlY2tpbmcgbG9naWMgYm90aA0KPiA+IGluIFB4IGFuZCBsYXRlciBDUFBDLiBUaGV5IGJvdGgg
bmVlZCBfUFNEIGluZm8NCj4NCj4gUmlnaHQsIGFuZCB0aGF0IChpaXJjKSBiZWNvbWVzIHZpc2li
bGUgbGF0ZXIgaW4gdGhlIHNlcmllcy4gQnV0IGl0IG5lZWRzIHNheWluZyBoZXJlLiBBcw0KPiBp
dCBzdGFuZHMgdGhlIGRlc2NyaXB0aW9uIHRhbGtzIG9mIG9ubHkgZ2V0X3BzZF9pbmZvKCkgcmln
aHQgbm93LiBBbmQgdGhlIGNoYW5nZQ0KPiBhYm92ZSBpcyBhbHNvIHVucmVsYXRlZCB0byB0aGUg
ImV4dHJhY3QiIG1lbnRpb25lZCBpbiB0aGUgdGl0bGUuDQo+DQo+ID4gSSBjb3VsZCBjaGFuZ2Ug
dGl0bGUgdG8gInhlbi9jcHVmcmVxOiBtYWtlIF9QU0QgaW5mbyBjb21tb24iIGFuZCBhbHNvDQo+
ID4gYWRkIGRlc2NyaXB0aW9uIGluIGNvbW1pdCBtZXNzYWdlIGZvciBpbnRyb2R1Y2luZyBjaGVj
a19wc2RfcG1pbmZvKCkNCj4NCj4gVGhlIHRpdGxlIHdhcyBwcm9iYWJseSBmaW5lOyBpdCdzIHRo
ZSBkZXNjcmlwdGlvbiB3aGljaCB3YXMgbGFja2luZy4gSW4gZmFjdCBJJ2QgZGVlbQ0KPiAibWFr
ZSAuLi4gY29tbW9uIiBtaXNsZWFkaW5nIHdoZW4gdGhlcmUncyBubyAybmQgdXNlciAoeWV0KS4N
Cj4NCg0KSG93IGFib3V0Og0KIg0KVGl0bGU6IHhlbi9jcHVmcmVxOiBleHBvcnQgX1BTRCBpbmZv
IGFuZCBjaGVja2luZw0KDQpfUFNEIGluZm8sIGNvbnNpc3RlZCBvZiAic2hhcmVkX3R5cGUiIGFu
ZCAic3RydWN0IHhlbl9wc2RfcGFja2FnZSIsIHdpbGwgbm90DQpvbmx5IGJlIHByb3ZpZGVkIGZy
b20gcHgtc3BlY2lmaWMgInN0cnVjdCB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlIiwgYnV0IGFs
c28NCmluIENQUEMgZGF0YS4NCg0KSW4gY3B1ZnJlcV9hZGQvZGVsX2NwdSgpLCBhIG5ldyBoZWxw
ZXIgZ2V0X3BzZF9pbmZvKCkgaXMgaW50cm9kdWNlZCB0bw0KZXhwb3J0IF9QU0QgaW5mby4gV2hp
bGUgaW4gc2V0X3B4X3BtaW5mbygpLCBjaGVja19wc2RfcG1pbmZvKCkgaXMgYWxzbyBpbnRyb2R1
Y2VkIHRvDQpleHBvcnQgX1BTRCB2YWx1ZSBjaGVja2luZy4NCmluIHRoZSBtZWFudGltZSwgdGhl
IGZvbGxvd2luZyBzdHlsZSBjb3JyZWN0aW9ucyBnZXQgYXBwbGllZCBhdCB0aGUgc2FtZSB0aW1l
OiAuLi4uLi4uLg0KYGBgDQoNCj4gSmFuDQo=

