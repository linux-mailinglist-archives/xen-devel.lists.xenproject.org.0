Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F38A8B02B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 08:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955099.1348931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4w8m-0007DJ-F0; Wed, 16 Apr 2025 06:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955099.1348931; Wed, 16 Apr 2025 06:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4w8m-0007Bd-CC; Wed, 16 Apr 2025 06:20:56 +0000
Received: by outflank-mailman (input) for mailman id 955099;
 Wed, 16 Apr 2025 06:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2j5z=XC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4w8k-0007BX-QB
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 06:20:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2417::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f279f442-1a8a-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 08:20:53 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS4PR12MB9682.namprd12.prod.outlook.com (2603:10b6:8:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 06:20:50 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 06:20:50 +0000
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
X-Inumbo-ID: f279f442-1a8a-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTiys+6W4Bb7dHEAaseXG0bFx2+SnQnow8EUbuiGpQk1U5lgNQZULak3ZgjRVAJrr9liPdC8w70A1PqbO3AHs5E9avzi+Srs9A+f5vlr5OuyLVCCyfG3aaBd652D4oL5Lar7Z4gEGr6Abtg5MvYKaBWjpghlO/HlfHnHn/vQN8Xq+5whb2DFp8Pv2ZyslmVoI+bTZZvPMGbqj2kBkIcADQLEZjmgIv5efCdEvjVpm1zwTM1c35uBVo3Qk3GV8GUIFlEajDYJxxH6dl/eMjd0He28JKkz4Oz5pGQWkTgVpR/uuyK3aIKutrjcgDOpWEJhU1gRy/1tJEBz5j6yRzbFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7KoVPMJGj+TeGrFibLZ8EOb1lUH/KODT0U82ClKO7s=;
 b=pqwbBBqPFkfBfesnn8TYyDMNk+/Nj7yFGjtXJWkr/G/lZEwmUvw7AMJ20mxHaJ5a0aC4mEsorxVG7ZugA744i0HCq+pnA1R2QBFoKOjKZjlyAZ1ssdkDY1+iH+aUOXCqFBXyll6sGNxvWUy/diZCGt/e00NKUq4vExoUgmSIguhKgZ0S9aZ4oKT3m0ivxsSR7LRKSft/s7lW91VdnZE7M9KdaeIROgJCeYg7pBqaILv6gW71FaZw3utfQn5I8RUwxdUamPhshKFu00uDmDI3WI4gRvqJcuAxWcEd/ZySMEaNhCREgVvQVzm2HHuhdvSqbh9qE4d92B8S9swA7AUImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7KoVPMJGj+TeGrFibLZ8EOb1lUH/KODT0U82ClKO7s=;
 b=tdu3GKVCOQKw4kH3XJaASAWApoSksdqHrINBfgACfmHHHPHUC64ox8FmR/G4kEWo6LjuvGnXsYUMOFxnZXiWeNLNVI3wS6EGFApkvf823FsyJw+N/vCm4tW52NuNwuiFgrhUdJ5d7TDHHlPBN7Ip6d8IOOM3VzaCtstbcG4a51U=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
Thread-Topic: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
Thread-Index: AQHbqRsh+jmpxStIakeU85xhe5CvZrOkxwqAgAGb44A=
Date: Wed, 16 Apr 2025 06:20:50 +0000
Message-ID:
 <BL1PR12MB5849577B78D50821733B6D6BE7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-9-Jiqian.Chen@amd.com> <Z_5i7zZJ7lRjFr7G@macbook.lan>
In-Reply-To: <Z_5i7zZJ7lRjFr7G@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8655.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS4PR12MB9682:EE_
x-ms-office365-filtering-correlation-id: b54e5d31-3bf8-4b22-ef65-08dd7caed571
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1RXSjhsWVJOa29aNVRod3Axd3lLSnkwUlRVUElPTHVrRTRvQWZ2aVFNU1pr?=
 =?utf-8?B?d3k5RHZwNm1qTldQYWRDdmk1QWh1aFRGcnV0N0ZlM3dDWjhTN25ZSXlDWDFL?=
 =?utf-8?B?WThMeXNYQ1BMMSsxVCtoTm1wM1RUNzlkdnJvVzJIQnBlU3U3b3lYaGMyMWE0?=
 =?utf-8?B?eFROSlFNYlNBU242VGl5aWs2Q0VQQVdvRUE5WHhnOGRZK3lDUkxnWVRQeDc1?=
 =?utf-8?B?VWV5Sm5QWFJrK0tJWWN4VHg3T1lGMFlrNTVOUTE4MGJiYUtMbUFLcTJGdnNi?=
 =?utf-8?B?Rk8wRDJ4RStTWHNHcWNoQ3J5di9PbnJ2Wk0xSUwrbzhQaXJJY0k2ZWNBRytZ?=
 =?utf-8?B?U1BTa3NSQzlTQWE0SjlsQnNxcHBxM3VDQks5QzMyYjcxVFNjVW8zTHUxaXlE?=
 =?utf-8?B?cG9Cc2N2MjNPcFFmUWt0RDZ5c0hSWjd0eGQzZkZhVlhmak5vUUFsdFM3RzYy?=
 =?utf-8?B?bjVGQ2wyWEo3UzdTTElyTVJnanVHVk52V3BZVVRoMVR2Y0YxV0hDRFFMQzMz?=
 =?utf-8?B?cjZBWk9VK0pZZ204M3l1QkU4dFpmZzFpMmx0cjNZdGVOMDFMT2Y2VXFjbk4v?=
 =?utf-8?B?ZjNyQzlhU1JGRSs4MVBZMmExcUlOaC83dVV2MmJEVmJCUDF0NHIwQWtpVDRj?=
 =?utf-8?B?dUlFV0x6VDVWbnN1QVRiVlBWVFNhalZlQzdRc2M2OUpFVXlYQXpzN01TQTYw?=
 =?utf-8?B?RURsYXgzZ0Y1eDBwM25xM1IwRTZ3MTZ5dUR6djZKTW40azVCNVY4TEoyWllJ?=
 =?utf-8?B?VnNTVDNqTlJ0NlptbVVVa0M2RTd5ZmtHS3VjSkdjRS9SRTZkcDYvL3dlNVJS?=
 =?utf-8?B?TmVWUUJDY3V2SWQvNWlRRllzOVBDVVJKTXBXU2srdi9CeXBuS0ovenZlVits?=
 =?utf-8?B?clFFT1owUC9CMHZ5RkFPakIzcEVUdkhFK0hjOFNyQUwycXdEWDFWWERIakVB?=
 =?utf-8?B?YXlMVGcyZnR2UUZmODVZSlAyQ29zSFpLN1RNV3RGNXkzWEFsT2VKRUdMYUpS?=
 =?utf-8?B?MDg3ZkphaHdVRVJPN3M3dUM0ZU85ZVJSOXdqeE0rWTZtWGZlVFhRcG5JTWMz?=
 =?utf-8?B?Um9RUHJndmhqRHQ1WGxTMWR5dGNJZWM2Wm5VYXk5Wkx4bUpZbi9VSVo0WHQv?=
 =?utf-8?B?TkI5SFo3NHpZb1M2QUxab01KWTE2NkFucGl0azFNcFFZcmVoTWRCcG05cjZG?=
 =?utf-8?B?aDFiQitXVC9Da1ZDNTBlS0h1aEg4bkR1b1dsRHZ3cFlUYlFHTWVOMlJhZHBO?=
 =?utf-8?B?S0FjY09JT0J5aGdkaTVmcGZnYmZ6U2xiZHpkSXVPdi9paWdQSG5iM0tFQnB4?=
 =?utf-8?B?V25TSGh3blZjWnh1N3ZSZXN4T1VYMSt3ZDFaZUQ0T0ZFTnVTZmJ4a1dYMHh4?=
 =?utf-8?B?TTZIa0pKa2J2QjB3RWpHdWptSCswSmVQSUlWZ1VFemJleFcyWWhpNkNOa01y?=
 =?utf-8?B?VC9CT1FqekZGTURQSThSeDdRNjFhbjdGbjF6MEs3Q0pncEVmR1RzakVQUEFm?=
 =?utf-8?B?RjFzRmFtVU5kL3BjSUV0TWhqMmVQb3VkMEJPWTFWelBJOGdxcWt0Q1UrV2Zx?=
 =?utf-8?B?UzJWMEZVaHhJeFRkT0ZhZlkxTDZqdlpreEdOdnljdDVQRUUzanl6ajRqcitT?=
 =?utf-8?B?VlJjbTYyRUNJcTB3a25qclpuY1BOQjNZRDExV2FGK21vS0dvQ1U2SmFpZ2Fl?=
 =?utf-8?B?MnpGcEx4SGl3R2hwRTJWK3dORk5za0lEb1owQk9jbnNlZng2Q0RidFROMzdz?=
 =?utf-8?B?dFBHdFBDaUV1MFhXd1NCenN3MjR3MGptVEpWV2RjRU00c2RTUWNobEhKdFpy?=
 =?utf-8?B?bUc1Zzdoc0huTXk2RDJPVDJrcjdhSkFGVGJvNUxzTGlORDZjSU1LTERta3Iv?=
 =?utf-8?B?d1NvblhXenJ6SlIrYU9KUXYxdWNISEd5dmxobUUzWjlDNUJoMmRTT0tRcXha?=
 =?utf-8?B?TUJ2VVRJYUtEdlAwQ2xhbGliNi9TcGtwaEZ0SlJLa0R6em9GUlgzNjd4elBh?=
 =?utf-8?Q?dgLZzzW7jz9dDobXxzPYDJd8n6X0/I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NU9CbVVGUUxFRG9NMFVhM1pydGNPUmRNNGdZYkFIU0hNd3FVVUd6by9pUFlU?=
 =?utf-8?B?bVYvckhaaGxvalpjekxkVTIzaFJoK0lNQ2RRR0R3Z1NBZjNVTlowVUp5L2pO?=
 =?utf-8?B?SGxOQVBOaFN6L3NNSyswT0NSV3RGOWtZQXN0WCs0VlpFNVNxTVdPVUNJdE9q?=
 =?utf-8?B?S2g3SXRiUTdlQ0FGWjN5cHJoMkFIR01DWjRTNXZ5QWN6dnB1Nk11MzhLS2hZ?=
 =?utf-8?B?U3o3Y0ozRUhibGdKazMwWmlEZ0JDZGVYUmZiL2IvbVhiVHF6TytEK0twYXlr?=
 =?utf-8?B?OFNpRkwvTWR6dWxYQ2dNcjVoTDlKM1paV1dxNk1RZm12VEpiQy9lemJkUGxu?=
 =?utf-8?B?NTRiWHRoUXpXZnFLOGVkMXhzNkVLcGd2RWtVdGVQNFZVaUN4QittUlR4ZzY1?=
 =?utf-8?B?RUgxYzdwVkkwMmdGdC9QYmxXbmZFSWlJMjZnYjdtUGxmcTNVTkEvdVl5WHI5?=
 =?utf-8?B?ZnAvZC9mZWVtUDNzZklJSFU0bkFQVEFNUmlQT1lUU0g2N0VISlAvTDFkd1I5?=
 =?utf-8?B?Umh6bkNXdFZ2dXovT2wweE5wUmp5V2xITWFnbks5SUtYRXhYcTNJR3RmeTNr?=
 =?utf-8?B?WnNUMkd2cUN3N1hVckUya2puVUdTQ2wwb1k0eDZxMEZPTE5ZWU9pb0pCeGZw?=
 =?utf-8?B?K0ZneStrNVhnWi9iZnp1WldvaGhRRjMraGlTUUU0VUFvalZ4UVR3YmdiU2xW?=
 =?utf-8?B?MnhVU3VQSFFXQUZxRmkxcFVkRWhVMzUvUnBkYU1mV0lmMFhpR3lNQmU3TDdC?=
 =?utf-8?B?MFdzMCtxQmtLVGFaazNrdU5HODVkWXg3WkVCQk44YzYxSXBIaWFwazFGbENz?=
 =?utf-8?B?RUg1Y3prZWZldHpsTlc2V2UxTjNJazZ0WDBaUHJqS3RuUzRyQXhZZlRCV3NP?=
 =?utf-8?B?dEh6cS85dHpqNElWTEw4SXp2WnVURXk1UElzNE5YRXAzT1RwaTFmTTh2ZWx2?=
 =?utf-8?B?Y2xhejBUSUVUcUFzTzhRdUVUV0RTSGM1S3IwZ3daSnFkQWE4a2RGQkhxOG9a?=
 =?utf-8?B?WDBVMWJCY3EwQkVwaVp0c285K1NTbE4vZTg2REIyYlZnZnI2K1dkemJSVWRC?=
 =?utf-8?B?dzJ5M3g3NUlaZ05ScktkRWpWSGU4dmZKa3AvR21Ea0tKalVnKytPalpKb1Jv?=
 =?utf-8?B?YW9SaDRlSWVYMUtHaG0vVGtTL0NkNHhwcFovNGxrdjZMWWJsUmlJVzFXcVF2?=
 =?utf-8?B?YzNobFltQ3IxZytJM2tOczlGN0t2c1F3VGZrazU4M3ZrLzZBTEcyY2ZqTE13?=
 =?utf-8?B?bDhQL3EycXNmY2pFVERFTU5Ub1UrWFJYY0syOGt3RTI2UHRzOEtBNzE5MUI5?=
 =?utf-8?B?TmMyeEZMaGRMQUxlRHB2MlhjNXVZdkEzTDNIaVYrVUdHWlkvT01YMnZzY1V5?=
 =?utf-8?B?Tng3RlBSTW9leWtGeHZyWDlNZkVQRjVqYkpmOUNUeVhHN1N5aVV5STVWcjND?=
 =?utf-8?B?WmlXZXhmRWIzaEtxbHdwcmxZbzlvZ296emR0VU5DK0RjQ015RWtoQzA2RmpU?=
 =?utf-8?B?K0hGemRvUUlzbU1qUU44T2N1aXJQbUNGZE83WXYzSWpvaFI4dVdXdGRORXUr?=
 =?utf-8?B?UGFHaEtNUnU5dElBN0ZKOEFoQktXTXBTd1h0emNJbHdpRVhnTEU3aVFwT01u?=
 =?utf-8?B?c1lmTnhjaXdtcThyOWtvczVXclpyWEN1blZjSTlNeS93akF4YTZjdmpNaEdV?=
 =?utf-8?B?OFBGR1ZCWDk4NlV2MHpZVFR3SDMwQ1hSQkZIK3gzQ0hHeVNSaDhaUFpJN0k2?=
 =?utf-8?B?N1RaRktWZmJLREE4UWdkU3Y0MmxJL29sN0hjNlRpMnljNS8yVjFFaUxwNDdl?=
 =?utf-8?B?S2dHUXQwR3dCOFYvbjc5K0JHSDlKQUo4dFNZRmxkeE01azgxbkhyeDlXRzJt?=
 =?utf-8?B?RzRsMGp2cG1mempFRS9YbGlsYURxc1Q4OHpKWWE1aGs2a0dNOXNXWHJCWWw4?=
 =?utf-8?B?UC9QSWVoRmYxRWVGcUdjMlVjcGxPOUVNdzB2QWFlSWt5aGZka2tHMDBoSmE5?=
 =?utf-8?B?OGhBcStCZHlMeW9nQTJyLzd5cC9wZ0FaZExtWmhCT0hlTTFFUzNUZUF6d2du?=
 =?utf-8?B?bklGRDlmQ0dHa1ViRmlqV2JBaktCSGdMRVR1aVB1dEl2VkoxdCtKckFDTWZz?=
 =?utf-8?Q?l9oM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E533D1A8928A4F43AB6B572012C69367@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54e5d31-3bf8-4b22-ef65-08dd7caed571
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:20:50.3553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S8tyYaIozS/WLy+c2MGFkibbNMA2rGE3yeffIV863k6hWp8CCHQtRPKODkMqNEinruvPgpGMulizK7jk7QeErQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9682

T24gMjAyNS80LzE1IDIxOjQ1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAwOSwgMjAyNSBhdCAwMjo0NToyOFBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZTogDQo+PiAr
DQo+PiArICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsgaSA8IEFSUkFZX1NJWkUodnBjaS0+
bXNpeC0+dGFibGUpOyBpKysgKQ0KPj4gKyAgICAgICAgaWYgKCB2cGNpLT5tc2l4LT50YWJsZVtp
XSApDQo+PiArICAgICAgICAgICAgaW91bm1hcCh2cGNpLT5tc2l4LT50YWJsZVtpXSk7DQo+IA0K
PiBUaGUgTVNJLVggaW5pdCBmdW5jdGlvbiBuZXZlciBtYXBzIHRhYmxlcywgc28gdGhlIGNvZGUg
aGVyZSAoZ2l2ZW4NCj4gaXQncyBjdXJyZW50IHVzYWdlKSB3aWxsIGFsc28gbmV2ZXIgdW5tYXAg
YW55dGhpbmcuICBIb3dldmVyIEkgd291bGQNCj4gYWxzbyBsaWtlIHRvIHVzZSB0aGlzIGNvZGUg
Zm9yIHZQQ0kgZGVhc3NpbmcsIGF0IHdoaWNoIHBvaW50IHRoZSBsb2dpYw0KPiB3aWxsIGdldCB1
c2VkLg0KU28sIEkgc3RpbGwgbmVlZCB0byBrZWVwIHRoaXMgcGFydCwgcmlnaHQ/DQoNCj4gDQo+
IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

