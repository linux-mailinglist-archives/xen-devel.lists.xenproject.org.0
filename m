Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B46AAD646
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 08:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978231.1365063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCYQj-0006FE-Ar; Wed, 07 May 2025 06:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978231.1365063; Wed, 07 May 2025 06:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCYQj-0006CY-79; Wed, 07 May 2025 06:38:57 +0000
Received: by outflank-mailman (input) for mailman id 978231;
 Wed, 07 May 2025 06:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCYQh-0006CS-GC
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 06:38:55 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:2408::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0ea0ae3-2b0d-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 08:38:53 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 06:38:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 06:38:45 +0000
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
X-Inumbo-ID: f0ea0ae3-2b0d-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVWruMlseEladLSKTHa8h4OrXyuGXZw/T3o/WVaixBSZyu3Kox4ZgymjWw7x5fIZ1/WK7oL2cOiB6SEhsNFIuhLvHcR1IROWXRYZpaxFkgx9GKP5X09dkANgc8xPHVEdFicNjUUlnJ9POotZYFfadj1yiFaWLnEwEljXAvnkGNzv9TR6ICySdtFOUi81gB1DQAzMvs4guOCtQI9e1e5WVBvQI1RWiwMFkOsm2SJM5Oqd978TvRkldBEQuf+YxbLA2E3gfdtKf2/Tm5qyIAUYSBoWE9tGclmSPuYEsv1AQqjmdpPoFMOW/xdHY3WtR54m9fNa4LDd2GlOsTov62kh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwkAs43S/m1z911xvuJVlLqjpdYUmRzz39cFacztYhc=;
 b=AAg0osqCtvBTXv6h5rz/x1oJACqZyVbM6TUjo+ASbIoFuvkKDWTsAv1QbpOGr4DXg3T19WL6zCOZsHemA6TzXW/Iu/ugzQw4eUyOagpfOMjxTnOS2He2P69/BmN+2VDB9fxG+dJAmoWXmJWco0kkeNRpRgcVmO4Ifw7R7pZFiLRC2U6Jf40Bbo2Yah1rbNrPXbp2iMWgNbjwYOHJdHzil9Kt3VchuEtRELwenO6u3/6qYo6ZCeQy/ra/mio+WQBOARC7nHIpialcjGr1TCX+XRqbsO7nEcmQARv80bJ5ZKs8Hhys8oIdTkszff5lUmYarfond8FfnEgLou+BGesdng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwkAs43S/m1z911xvuJVlLqjpdYUmRzz39cFacztYhc=;
 b=Rf3dAVV55gwwRfFfoAHNv1vgtw/11d5Z7Lj6a9XEKBIX2E1X2yf9j+XRCbFbZIkayqyDGz78j1HzzDh/yyWPxqjZBIfr0ATBZ/C72F4rCY7v/5j+gPxZLCsQjgR3vamZp2RX1Bvzysx+T68zX9MWKuXJzeL4rhr+nfdJUvyJi0Q=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 06/11] vpci: Hide legacy capability when it fails to
 initialize
Thread-Topic: [PATCH v3 06/11] vpci: Hide legacy capability when it fails to
 initialize
Thread-Index: AQHbsoVckJ4au36tTkiHt4pmnYtEWrPF2tMAgAF6HgA=
Date: Wed, 7 May 2025 06:38:45 +0000
Message-ID:
 <BL1PR12MB5849C99BAC94BC5754897CB4E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-7-Jiqian.Chen@amd.com> <aBoyBlRFG8W8wJla@macbook.lan>
In-Reply-To: <aBoyBlRFG8W8wJla@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH2PR12MB4150:EE_
x-ms-office365-filtering-correlation-id: 6909f7ac-91df-43dc-aad5-08dd8d31d0f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ajlRVUh0dEtoenJOajZKY0lDN0ZLdFduU0F3S2kxRWVhbnVMUXNmSkpJdFln?=
 =?utf-8?B?Mk1mTU4vVXNHUVR1TW0zenlQN0tidE8vVEY4d3kvNWNUTjBOSjVnV1pIczdZ?=
 =?utf-8?B?Z1BTRkxPSS9ENkhwY0UxTEZ1MmdvNTNSc3lEekI3b1UvZ3hzY3VsbW8rSEpn?=
 =?utf-8?B?WHBQYWYyWjVLWmNRY25sVS9MVmNqTmFpZmJDa3FWSXVpVXpUK085UXlFb1lw?=
 =?utf-8?B?b0hNK0lCUU1TYzFlMDl3MGpXTzR0eDFNQUt2SHdzc3NQTTl1L1NwbUZYL25q?=
 =?utf-8?B?YVZoTTBWTURSSUNpbGJRZDdEVUJqMGlBalp6MGpjMmpIMU9OZ2I4TzE5L3Vq?=
 =?utf-8?B?Z0E2VzJ0VGpvVGpMd0tDQ0NNdXFhVWJDUFBpbWVsQzZGbFZ2elRSa2FBWmZR?=
 =?utf-8?B?VzQyZUZ3L1RaR2NiQWh1ZUhuOURhbERPczdlZERrdDF5cEtndzZxU0tGSDV3?=
 =?utf-8?B?OFd1VGZxWUhkWTVITEZvemt5Y084ZWNZS1E0ODQ2WlpIY29rbzhjK3kxVkp6?=
 =?utf-8?B?YnMvQ0IvSWRVOUhoWnNvVGkrUUFHNFpCQnB3RzR5aXA5Y3NpckVlZlk0VEtH?=
 =?utf-8?B?R0grNDlYZkJZeFZQMkFLN0o3dE80aW9jZ2hFZG5oNTZadlo1UDNHL2hzcHFG?=
 =?utf-8?B?Rld1S2MrbDlSQVJ6OFJoV1g3aTdNY2g3QTl6ZFpYTC9VLzFZNzlFUDlWWXU0?=
 =?utf-8?B?UHNWOFIvbmErYVkwREdBLzZCb0RvUXhqbS8wYnZWSGF5enp3dGxpSVNBYVJZ?=
 =?utf-8?B?Vko2aDJpSFhZWkpxUjBUWitnWmRnQmpnS3RXaitVS0lIYXV2Und0QU15dzk3?=
 =?utf-8?B?bklBd2pmcTQxaCtjakNIMnRpNGR4MU1PUnNaOU04NlpuYzk4TGZrZHV1WHph?=
 =?utf-8?B?ZG5hMHRxaHc2Mm9rdGxPWTNhT0FaLzlOd3Vpb2laTU9LU1pTUWg2aGNadTla?=
 =?utf-8?B?SW1zSEFxMThWcEdDUW84cEd4cjByNE9odHNCT0ZMb1c1QzJsUm9HSDFQdWsr?=
 =?utf-8?B?ektFSzRTdGVrRzdiKzk0RWZlalpKSHJhRmphb3QrcGZnbFAxZTF3M0RlUlAw?=
 =?utf-8?B?Q1h6aUR1ZkRMbWpIUnF6Yk9ienVWbi9OaEprTXh5S1ZiV3A4TURnNDB4UTJF?=
 =?utf-8?B?MGpEeE8wbnN5T1VGNUtpNmR0ZlJLMG9ncVdnYW93aWVYM0E1VXZZZ08wOWts?=
 =?utf-8?B?aHZTNElheUQ1aUZhRDlDWGhzZy8yeFd6TEV4QjhpQTJiMkFTeTgrWjBCOCtm?=
 =?utf-8?B?UTM5cTlxOFBNWFhUUEpxcW1GMHUydXVZbmphSFRRRXFUMFlXcmQ1aG9Jd3Q3?=
 =?utf-8?B?ZGw3TmxWZHdyM3B5dTE2WXhOdDgvSWhYSjFDcVRHWDdTYzRqL0dvQm5qQUhQ?=
 =?utf-8?B?MEpybTNWMC91UGZWeWlnRUhSQk5FdWZ6TldFbS9aOVBwbWl6TkRQR3pNeU9u?=
 =?utf-8?B?L3FDTDlkR2treDFFQjJkL0VuWXk1ejFHZWZTU1VqSWpWWnN1Y3BNT1B1aTJT?=
 =?utf-8?B?R0JDQStwUFZWbkZTTXpGa2lSM1pibmFyMjFZa3VqUEZSTWhkRzBGaGJLWkds?=
 =?utf-8?B?dVkvWHNVVHpvNkJ5dnhvd0hMK1huS0hDVWE0SnVJRm1OWEpPdVU3eVlIRERU?=
 =?utf-8?B?aEMwUVc5RW1FVEpOQWttMll0ZzZmZlR5ZElDVllEQXcxd1A0djd3NHJOcVBs?=
 =?utf-8?B?KzZNUWtrUnFoWGk0YlZ3SW5iMi9KbXVvcVQxUW8yeEtzTU82OW02dkwxRnNW?=
 =?utf-8?B?KzYyWGFqTGh2UzdZMGl0NE1kUzVzTGlDY3lWQnQ0QTR4WVpLRjNMSXJveDNZ?=
 =?utf-8?B?Sy9CRGNQODM0YUV4cExobmZUR2xFaVIyM0VIaFBkRFcwdU8yWFNaRThETVJv?=
 =?utf-8?B?THhYVlBrd0psNjdod2x6OW8veGd3WTh4OERIQnVESC9NVkZsOWcrTG1PSFlz?=
 =?utf-8?B?MDE3RFE0Q3BBSG9xSjJDTmYwdk5uWW1pUEQ1bUV1czg2MG94U2tGbDFHWGZY?=
 =?utf-8?Q?2GhzrZlpDwXEqg9rMn08tBoa1WtuJA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnVjQ2NYNjdGYThqV0hvaU9OdlAyMW9wUGZMR0NtcWdBbzhLTzNzeEJEbUJH?=
 =?utf-8?B?Z3MzMEVMUnp2WVhqT0tUKzl1WXN3UW4wbUNKVUYrV2tIdm9HRUo5SGNnSkJt?=
 =?utf-8?B?MHRsVDRuRFdFV0lFaTlsS2EwbWs2Vk5YTGQxNDl0cy81VHBZaTJ3RzJKMmpZ?=
 =?utf-8?B?eHNNTlhKVzlBMHI0clg4Z2V2aTkwRmNrRjlSYzlwektaWEdrcUhFTXQ2VXV5?=
 =?utf-8?B?eGhGRm9BcWhReGZtZFdsN1BtQ2Nmd2dBdHRjVjlGVzUvcEJXUEpaMWtTYWhG?=
 =?utf-8?B?Ykt1cUl4dlFHQzJqa3o3RDZUb0tIZ0R6NmgvdjBZVHVnVDBBOGpjZ1JQWlNY?=
 =?utf-8?B?SnhJMWxaeGg1ZTBiRXgvTFZHS2JjZithdzNwSFFQRmVsTkRjV1ppUjB2T3JX?=
 =?utf-8?B?SWV4RDlsRDV1ZTJHb0xhbXU2U3JLRS8zSlQySHlQU1FXaC82eHAxMWhtcEZy?=
 =?utf-8?B?MHBrZXcxZjJpaTM5eG1zOGJOUUx2TFd2VnMraTI3b2xLUGJsRENvc3U5N1FY?=
 =?utf-8?B?NDMrdWR5RUd5aFZiVDdtZGMySFppbklaOHpKbjE0MTJDK0p3VWY3UXZtYlRR?=
 =?utf-8?B?NWxvUmtvTEZsUlVENGhMZDJ1S0h4S1JUYWcrR0JJMGV6M1JINm1OQmpsNlB3?=
 =?utf-8?B?bFcwY0hLYXB0eWpJNlB6aHp4TDRFUXc2VmJHU2l2K0I4YjFMZ2t4cTJXVHJr?=
 =?utf-8?B?SEl3am9vVlBvUEZCNGNleWVCL1lzeDBOVG0rb0J0S0ExcFlXUW5hK3BFQTJn?=
 =?utf-8?B?Rng0OW15NnFjWU9uQnpmaWl4TE01eW5YbysxNzJockxkT2lkYkJ4TEVUdWx6?=
 =?utf-8?B?UmxNQ0pWc1E5b3FYUzVJMGZpcnBsUzV6MnZvOURsZWg1TVd4M0xHUHRzS0hM?=
 =?utf-8?B?VjM0dHZBbnZpNnpXNVVOSW1zMFJCcXRLdS93MHAveFh4NDdyMjlrMHp0VVBy?=
 =?utf-8?B?SFpWTzFRL0U4SzhWWHo0V1hYNUJhN0U0VEsxSGd1SFpDZjRkSGtWdDZpenh6?=
 =?utf-8?B?SEsxVWZZbjJDMlNralVyZG41SDFJYUZ2L2V5ekZtdWJ3QkM0NVM0M2l2UGxB?=
 =?utf-8?B?NEFPTDJPbTNRYWo0ZjhqcTBWY00zVDlnMlNjY1pna3gyTjMxclYvODRSbjFa?=
 =?utf-8?B?QzhpQXVTUDU5aHN6L1dkeGZ3VmJBd1pLMjh4MmJtRVlkazBpbXFiZkFTenAw?=
 =?utf-8?B?dkYzbmJnQ3M2dURHdUpreEl2aCt1YmtwUmNXdm9yd1c4TXVnRmYyUmdnL1Zs?=
 =?utf-8?B?QjlkZmp4eDlFMWRNVkZiNmY0MndVZjk1Um53YXRUTHJXcEUzSTc0dytFTjhQ?=
 =?utf-8?B?dWtUQk9rNUNFRTllRWVUbGlSRjR4YndVajFSbUtJV1J1MUkwVFlabldIbTV4?=
 =?utf-8?B?Vk03ZmZGOXZrOXVTOSt5ZHgydm4yT1FNKy9pVmRIMkQ2cGE5a3JmRk5GMFRp?=
 =?utf-8?B?SEVxZkkxbW9NbE83SURPWnVHbUdpenQ3aFVONjRqTC9zVWwwTkROb0FhVThQ?=
 =?utf-8?B?WTN2VWpMb2tPbEoyUzFZMjIvRzkwK2RYWUdjRGw3YU5PZ3hNQm1aWm42Nm16?=
 =?utf-8?B?UnRreEZKQ2lYd1FRblN0YU53dTFTUFk0V3lVTk1UcTBwOUtwZTlHbDZjZkxv?=
 =?utf-8?B?VXdycDRjeExaazRhTnNtQ0QyMFQ0cVNmcXhpalRDeUdlL3hOcTR5YVMxdDBz?=
 =?utf-8?B?SW5EblJ2ckpwV3FFRmdlTzE5YUYwSWk1QWN4ejUxTzlYZExEOEdGNktJcmhw?=
 =?utf-8?B?R21taTcrTFpZNlYweUlINW9DOGtLeHhKUnppSlJRSFFGQXJlUHNlYXVZLzJa?=
 =?utf-8?B?YXkxZVowNmRhRkROQlk3NlJob2dNSytFUDcrc2VidXVSbHQwQXVDVENYeWls?=
 =?utf-8?B?RUZFUTJGT3Z3bFI4OUFwbXpuYytaRUV5ZlN1bmw0TDJqVW8rU3dUdjlZNWxn?=
 =?utf-8?B?eFc2TlM0KzhTb00vUE5RV0o0S29pYTlwMFZTWGNVclVZRE4vVVFlVVY0bTE1?=
 =?utf-8?B?cFRzcFdXM0JlZjNRdE1nNWZDWGNucnlPbGw0azVMY0tKRUEzVXNvNkdqSXJH?=
 =?utf-8?B?WUFwdkVjUm5OSW96cFplYjdYQVNrZk5pK0c0V2VoaTV0SkZxN3k5NFNlRXNt?=
 =?utf-8?Q?TFf0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F63FA3BB7AA1E429AB0DB669D86E361@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6909f7ac-91df-43dc-aad5-08dd8d31d0f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 06:38:45.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uLdqc5U9Ftr0UB0ld7dzY5qkt4zoI5BjwJZcSktAAGOpoPI2VJCHGkToah2+mqbOw/Ly9CZNrD1HZYBCfx9OPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150

T24gMjAyNS81LzcgMDA6MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE4OjU4UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biB2cGNpIGZhaWxzIHRvIGluaXRpYWxpemUgYSBsZWdhY3kgY2FwYWJpbGl0eSBvZiBkZXZpY2Us
IGl0IGp1c3QNCj4+IHJldHVybiBlcnJvciBpbnN0ZWFkIG9mIGNhdGNoaW5nIGFuZCBwcm9jZXNz
aW5nIGV4Y2VwdGlvbi4gVGhhdCBtYWtlcw0KPj4gdGhlIGVudGlyZSBkZXZpY2UgdW51c2FibGUu
DQo+IA0KPiBJIHRoaW5rICJjYXRjaGluZyBhbmQgcHJvY2Vzc2luZyBleGNlcHRpb24iIGlzIGEg
d2VpcmQgdGVybWlub2xvZ3kgdG8NCj4gdXNlIHdoZW4gd3JpdGluZyBDLiAgSXQncyBJTW8gbW9y
ZSBhY2N1cmF0ZSB0byB1c2U6DQo+IA0KPiAiV2hlbiB2cGNpIGZhaWxzIHRvIGluaXRpYWxpemUg
YSBsZWdhY3kgY2FwYWJpbGl0eSBvZiBkZXZpY2UsIGl0IGp1c3QNCj4gcmV0dXJucyBhbiBlcnJv
ciBhbmQgdlBDSSBnZXRzIGRpc2FibGVkIGZvciB0aGUgd2hvbGUgZGV2aWNlLiAgVGhhdA0KPiBt
b3N0IGxpa2VseSByZW5kZXJzIHRoZSBkZXZpY2UgdW51c2FibGUsIHBsdXMgcG9zc2libHkgY2F1
c2luZyBpc3N1ZXMNCj4gdG8gWGVuIGl0c2VsZiBpZiBndWVzdCBhdHRlbXB0cyB0byBwcm9ncmFt
IHRoZSBuYXRpdmUgTVNJIG9yIE1TSS1YDQo+IGNhcGFiaWxpdGllcyBpZiBwcmVzZW50LiINClRo
YW5rcywgd2lsbCBjaGFuZ2UuDQoNCj4gDQo+PiBTbywgYWRkIG5ldyBhIGZ1bmN0aW9uIHRvIGhp
ZGUgbGVnYWN5IGNhcGFiaWxpdHkgd2hlbiBpbml0aWFsaXphdGlvbg0KPj4gZmFpbHMuIEFuZCBy
ZW1vdmUgdGhlIGZhaWxlZCBsZWdhY3kgY2FwYWJpbGl0eSBmcm9tIHRoZSB2cGNpIGVtdWxhdGVk
DQo+PiBsZWdhY3kgY2FwYWJpbGl0eSBsaXN0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlh
biBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBN
b25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjItPnYzIGNoYW5nZXM6
DQo+PiAqIFNlcGFyYXRlZCBmcm9tIHRoZSBsYXN0IHZlcnNpb24gcGF0Y2ggInZwY2k6IEhpZGUg
Y2FwYWJpbGl0eSB3aGVuIGl0IGZhaWxzIHRvIGluaXRpYWxpemUiDQo+PiAqIFdob2xlIGltcGxl
bWVudGF0aW9uIGNoYW5nZWQgYmVjYXVzZSBsYXN0IHZlcnNpb24gaXMgd3JvbmcuDQo+PiAgIFRo
aXMgdmVyc2lvbiBhZGRzIGEgbmV3IGhlbHBlciBmdW5jdGlvbiB2cGNpX2dldF9yZWdpc3Rlcigp
IGFuZCB1c2VzIGl0IHRvIGdldA0KPj4gICB0YXJnZXQgaGFuZGxlciBhbmQgcHJldmlvdXMgaGFu
ZGxlciBmcm9tIHZwY2ktPmhhbmRsZXJzLCB0aGVuIHJlbW92ZSB0aGUgdGFyZ2V0Lg0KPj4NCj4+
IHYxLT52MiBjaGFuZ2VzOg0KPj4gKiBSZW1vdmVkIHRoZSAicHJpb3JpdGllcyIgb2YgaW5pdGlh
bGl6aW5nIGNhcGFiaWxpdGllcyBzaW5jZSBpdCBpc24ndCB1c2VkIGFueW1vcmUuDQo+PiAqIEFk
ZGVkIG5ldyBmdW5jdGlvbiB2cGNpX2NhcGFiaWxpdHlfbWFzaygpIGFuZCB2cGNpX2V4dF9jYXBh
YmlsaXR5X21hc2soKSB0bw0KPj4gICByZW1vdmUgZmFpbGVkIGNhcGFiaWxpdHkgZnJvbSBsaXN0
Lg0KPj4gKiBDYWxsZWQgdnBjaV9tYWtlX21zaXhfaG9sZSgpIGluIHRoZSBlbmQgb2YgaW5pdF9t
c2l4KCkuDQo+Pg0KPj4gQmVzdCByZWdhcmRzLA0KPj4gSmlxaWFuIENoZW4uDQo+PiAtLS0NCj4+
ICB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyB8IDEzMyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS92cGNp
LmMgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gaW5kZXggNTQ3NGI2NjY2OGMxLi5mOTdj
N2NjNDYwYTAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysr
IGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+IEBAIC0zNSw2ICszNSwyMiBAQCBzdHJ1Y3Qg
dnBjaV9yZWdpc3RlciB7DQo+PiAgICAgIHVpbnQzMl90IHJzdmR6X21hc2s7DQo+PiAgfTsNCj4+
ICANCj4+ICtzdGF0aWMgaW50IHZwY2lfcmVnaXN0ZXJfY21wKGNvbnN0IHN0cnVjdCB2cGNpX3Jl
Z2lzdGVyICpyMSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCB2cGNpX3JlZ2lzdGVyICpyMikNCj4+ICt7DQo+PiArICAgIC8qIFJldHVybiAwIGlmIHJlZ2lz
dGVycyBvdmVybGFwLiAqLw0KPj4gKyAgICBpZiAoIHIxLT5vZmZzZXQgPCByMi0+b2Zmc2V0ICsg
cjItPnNpemUgJiYNCj4+ICsgICAgICAgICByMi0+b2Zmc2V0IDwgcjEtPm9mZnNldCArIHIxLT5z
aXplICkNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKyAgICBpZiAoIHIxLT5vZmZzZXQgPCBy
Mi0+b2Zmc2V0ICkNCj4+ICsgICAgICAgIHJldHVybiAtMTsNCj4+ICsgICAgaWYgKCByMS0+b2Zm
c2V0ID4gcjItPm9mZnNldCApDQo+PiArICAgICAgICByZXR1cm4gMTsNCj4+ICsNCj4+ICsgICAg
QVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+
ICAjaWZkZWYgX19YRU5fXw0KPj4gIGV4dGVybiB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgX19z
dGFydF92cGNpX2FycmF5W107DQo+PiAgZXh0ZXJuIHZwY2lfY2FwYWJpbGl0eV90ICpjb25zdCBf
X2VuZF92cGNpX2FycmF5W107DQo+PiBAQCAtODMsNyArOTksOTEgQEAgc3RhdGljIGludCBhc3Np
Z25fdmlydHVhbF9zYmRmKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIA0KPj4gICNlbmRpZiAv
KiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCAqLw0KPj4gIA0KPj4gLXN0YXRpYyBpbnQg
dnBjaV9pbml0X2NhcGFiaWxpdGllcyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICtzdGF0aWMg
c3RydWN0IHZwY2lfcmVnaXN0ZXIgKnZwY2lfZ2V0X3JlZ2lzdGVyKHN0cnVjdCB2cGNpICp2cGNp
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgdW5zaWduZWQgaW50IG9mZnNldCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBzaXplKQ0KPiANCj4gV2UgZG9u
J3QgdXN1YWxseSB1c2UgY29uc3QgYXR0cmlidXRlcyBmb3Igc2NhbGFyIGZ1bmN0aW9uIHBhcmFt
ZXRlcnMuDQo+IA0KPj4gK3sNCj4+ICsgICAgY29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgciA9
IHsgLm9mZnNldCA9IG9mZnNldCwgLnNpemUgPSBzaXplIH07DQo+PiArICAgIHN0cnVjdCB2cGNp
X3JlZ2lzdGVyICpybTsNCj4+ICsNCj4+ICsgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZ2cGNp
LT5sb2NrKSk7DQo+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBybSwgJnZwY2ktPmhhbmRs
ZXJzLCBub2RlICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgaW50IGNtcCA9IHZwY2lfcmVnaXN0
ZXJfY21wKCZyLCBybSk7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFjbXAgJiYgcm0tPm9mZnNl
dCA9PSBvZmZzZXQgJiYgcm0tPnNpemUgPT0gc2l6ZSApDQo+PiArICAgICAgICAgICAgcmV0dXJu
IHJtOw0KPj4gKyAgICAgICAgaWYgKCBjbXAgPD0gMCApDQo+PiArICAgICAgICAgICAgYnJlYWs7
DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIE5VTEw7DQo+PiArfQ0KPj4gKw0KPj4g
K3N0YXRpYyBzdHJ1Y3QgdnBjaV9yZWdpc3RlciAqdnBjaV9nZXRfcHJldmlvdXNfY2FwX3JlZ2lz
dGVyDQo+PiArICAgICAgICAgICAgICAgIChzdHJ1Y3QgdnBjaSAqdnBjaSwgY29uc3QgdW5zaWdu
ZWQgaW50IG9mZnNldCkNCj4gDQo+IFRoZSBzdHlsZSBwcmVmZXJlbmNlIGhlcmUgd291bGQgYmU6
DQo+IA0KPiBzdGF0aWMgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnZwY2lfZ2V0X3ByZXZpb3VzX2Nh
cF9yZWdpc3RlcigNCj4gICAgIHN0cnVjdCB2cGNpICp2cGNpLCB1bnNpZ25lZCBpbnQgb2Zmc2V0
KQ0KPiB7DQo+IC4uLg0KPiANCj4+ICt7DQo+PiArICAgIHVpbnQzMl90IG5leHQ7DQo+PiArICAg
IHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpyOw0KPj4gKw0KPj4gKyAgICBpZiAoIG9mZnNldCA8IDB4
NDAgKQ0KPiANCj4gSSB3b3VsZCBwb3NzaWJseSBhZGQgYW4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkg
aGVyZSwgYXMgYXR0ZW1wdGluZyB0bw0KPiBwYXNzIGFuIG9mZnNldCBiZWxvdyAweDQwIGlzIGEg
c2lnbiBvZiBhIGJ1ZyBlbHNld2hlcmU/DQpQcm9iYWJseSB5ZXMsIEkgd2lsbCBhZGQgYW4gQVNT
RVJUX1VOUkVBQ0hBQkxFKCkgaGVyZS4NCg0KPiANCj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0K
Pj4gKw0KPj4gKyAgICByID0gdnBjaV9nZXRfcmVnaXN0ZXIodnBjaSwgUENJX0NBUEFCSUxJVFlf
TElTVCwgMSk7DQo+PiArICAgIEFTU0VSVChyKTsNCj4+ICsNCj4+ICsgICAgbmV4dCA9ICh1aW50
MzJfdCkodWludHB0cl90KXItPnByaXZhdGU7DQo+PiArICAgIHdoaWxlICggbmV4dCA+PSAweDQw
ICYmIG5leHQgIT0gb2Zmc2V0ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgciA9IHZwY2lfZ2V0
X3JlZ2lzdGVyKHZwY2ksIG5leHQgKyBQQ0lfQ0FQX0xJU1RfTkVYVCwgMSk7DQo+PiArICAgICAg
ICBBU1NFUlQocik7DQo+PiArICAgICAgICBuZXh0ID0gKHVpbnQzMl90KSh1aW50cHRyX3Qpci0+
cHJpdmF0ZTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAoIG5leHQgPCAweDQwICkNCj4+
ICsgICAgICAgIHJldHVybiBOVUxMOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gcjsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIHZvaWQgdnBjaV9jYXBhYmlsaXR5X21hc2soc3RydWN0IHBjaV9kZXYg
KnBkZXYsDQo+IA0KPiBUaGlzIHBvc3NpYmx5IG5lZWRzIHRvIHJldHVybiBhbiBlcnJvciBjb2Rl
LCBhcyBpdCBjYW4gZmFpbCwgYW5kIGp1c3QNCj4gYWRkaW5nIEFTU0VSVHMgYWxsIGFyb3VuZCBz
ZWVtcyBhIGJpdCBjbHVtc3ksIHBsdXMgd2UgbWlnaHQgcmVhbGx5DQo+IHdhbnQgdG8gcHJldmVu
dCBhc3NpZ25pbmcgdGhlIGRldmljZSB0byB0aGUgZG9tYWluIGlmDQo+IHZwY2lfY2FwYWJpbGl0
eV9tYXNrKCkgZmFpbHMgZm9yIHdoYXRldmVyIHJlYXNvbi4NCk1ha2Ugc2Vuc2UuIFdpbGwgY2hh
bmdlIHRvIHJldHVybiBlcnJvciBpbnN0ZWFkIG9mIEFTU0VSVC4NCg0KPiANCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgY2FwKQ0KPj4gK3sN
Cj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG9mZnNldCA9IHBjaV9maW5kX2NhcF9vZmZzZXQo
cGRldi0+c2JkZiwgY2FwKTsNCj4+ICsgICAgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnByZXZfbmV4
dF9yLCAqbmV4dF9yOw0KPj4gKyAgICBzdHJ1Y3QgdnBjaSAqdnBjaSA9IHBkZXYtPnZwY2k7DQo+
PiArDQo+PiArICAgIHNwaW5fbG9jaygmdnBjaS0+bG9jayk7DQo+PiArICAgIG5leHRfciA9IHZw
Y2lfZ2V0X3JlZ2lzdGVyKHZwY2ksIG9mZnNldCArIFBDSV9DQVBfTElTVF9ORVhULCAxKTsNCj4+
ICsgICAgaWYgKCAhbmV4dF9yICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgc3Bpbl91bmxvY2so
JnZwY2ktPmxvY2spOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+PiAr
ICAgIHByZXZfbmV4dF9yID0gdnBjaV9nZXRfcHJldmlvdXNfY2FwX3JlZ2lzdGVyKHZwY2ksIG9m
ZnNldCk7DQo+PiArICAgIEFTU0VSVChwcmV2X25leHRfcik7DQo+PiArDQo+PiArICAgIHByZXZf
bmV4dF9yLT5wcml2YXRlID0gbmV4dF9yLT5wcml2YXRlOw0KPj4gKw0KPj4gKyAgICBpZiAoICFp
c19oYXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWluKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAg
IHN0cnVjdCB2cGNpX3JlZ2lzdGVyICppZF9yID0NCj4+ICsgICAgICAgICAgICB2cGNpX2dldF9y
ZWdpc3Rlcih2cGNpLCBvZmZzZXQgKyBQQ0lfQ0FQX0xJU1RfSUQsIDEpOw0KPj4gKw0KPj4gKyAg
ICAgICAgQVNTRVJUKGlkX3IpOw0KPj4gKyAgICAgICAgLyogUENJX0NBUF9MSVNUX0lEIHJlZ2lz
dGVyIG9mIHRhcmdldCBjYXBhYmlsaXR5ICovDQo+PiArICAgICAgICBsaXN0X2RlbCgmaWRfci0+
bm9kZSk7DQo+PiArICAgICAgICB4ZnJlZShpZF9yKTsNCj4gDQo+IFlvdSBjb3VsZCB1c2UgdnBj
aV9yZW1vdmVfcmVnaXN0ZXIoKSBoZXJlPw0KUmlnaHQuDQoNCj4gDQo+PiArICAgIH0NCj4+ICsN
Cj4+ICsgICAgLyogUENJX0NBUF9MSVNUX05FWFQgcmVnaXN0ZXIgb2YgdGFyZ2V0IGNhcGFiaWxp
dHkgKi8NCj4+ICsgICAgbGlzdF9kZWwoJm5leHRfci0+bm9kZSk7DQo+PiArICAgIHNwaW5fdW5s
b2NrKCZ2cGNpLT5sb2NrKTsNCj4+ICsgICAgeGZyZWUobmV4dF9yKTsNCj4gDQo+IEhlcmUgdnBj
aV9yZW1vdmVfcmVnaXN0ZXIoKSBjb3VsZCBhbHNvIGJlIHVzZWQsIGJ1dCBpdCB3aWxsIGludm9s
dmUNCj4gc2VhcmNoaW5nIGFnYWluIGZvciB0aGUgcmVnaXN0ZXIgdG8gcmVtb3ZlLCB3aGljaCBp
cyBhIGJpdCBwb2ludGxlc3MuDQpZZXMsIHNvIGp1c3Qga2VlcGluZyB0aGluZ3MgaGVyZSBpbnN0
ZWFkIG9mIGNhbGxpbmcgdnBjaV9yZW1vdmVfcmVnaXN0ZXIoKT8NCg0KPiANCj4+ICt9DQo+PiAr
DQo+PiArc3RhdGljIHZvaWQgdnBjaV9pbml0X2NhcGFiaWxpdGllcyhzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCj4+ICB7DQo+PiAgICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsgaSA8IE5VTV9W
UENJX0lOSVQ7IGkrKyApDQo+PiAgICAgIHsNCj4+IEBAIC0xMDcsMTAgKzIwNywxNyBAQCBzdGF0
aWMgaW50IHZwY2lfaW5pdF9jYXBhYmlsaXRpZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAg
ICAgICAgICByYyA9IGNhcGFiaWxpdHktPmluaXQocGRldik7DQo+PiAgDQo+PiAgICAgICAgICBp
ZiAoIHJjICkNCj4+IC0gICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICB7DQo+PiAr
ICAgICAgICAgICAgaWYgKCBjYXBhYmlsaXR5LT5maW5pICkNCj4+ICsgICAgICAgICAgICAgICAg
Y2FwYWJpbGl0eS0+ZmluaShwZGV2KTsNCj4+ICsNCj4+ICsgICAgICAgICAgICBwcmludGsoWEVO
TE9HX1dBUk5JTkcgIiVwZCAlcHA6ICVzIGNhcCAldSBpbml0IGZhaWwgcmM9JWQsIG1hc2sgaXRc
biIsDQo+IA0KPiBCZXN0IHRvIHNwbGl0IHRvIG5leHQgbGluZToNCj4gDQo+ICAgICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+IAkgICAgICAgICAgICAgIiVwZCAlcHA6ICVzIGNh
cCAldSBpbml0IGZhaWwgcmM9JWQsIG1hc2sgaXRcbiIsDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

