Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461AAFDF3E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037639.1410185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNNH-0008PW-UN; Wed, 09 Jul 2025 05:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037639.1410185; Wed, 09 Jul 2025 05:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNNH-0008NZ-Rb; Wed, 09 Jul 2025 05:29:43 +0000
Received: by outflank-mailman (input) for mailman id 1037639;
 Wed, 09 Jul 2025 05:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJyx=ZW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uZNNF-0008NT-Uj
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:29:42 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2413::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ff82d7-5c85-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 07:29:39 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8987.namprd12.prod.outlook.com (2603:10b6:806:386::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Wed, 9 Jul
 2025 05:29:35 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 05:29:35 +0000
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
X-Inumbo-ID: b4ff82d7-5c85-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIjgV96YeUczZa8RyHiQQt7cU5g+NZvVXJkYrt8nIYYVTeDcIFgvk77GsM9VUDj+uIK9pYQaMtrhZVlf4PZl+YtywWvK6VTTEVSjW6yHxlAt2Kf6eIkap6KV90JPdRvAFTlJ6nq5iXFiCUOPd3EPtrvTKHicWhs5Twt8A66+nxCjmS20LqkJ1e2guK19VXprXoplGAh/mVCXX8tLDz/qT42nF5RP6POjXtVXUd/w34OAZZ+08g1ornknmGR/KvUlG6sUgbPv+vtKu5ZB2m+c//mhAmaPf6TeOLaGmeear5Aetdlhos4tfOTc+Ct4GPHMmuWSDVh4/o/1bFdN23+8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo9LeadlGJqiQLbMFXYvkmr7/qCVtAAv4WiAP6eg3E4=;
 b=QU/kWQXXVwQ8BqQqaNjY1BKKofg7gTPGKCYI8DYhm0NwnkX3M+n4/AFJAJ7D5+GnTbXCVX+65+mMxolYYdvHM5ukjF70kpTjVdjQxbOmEA7NCr1C7B8+SW2WSoTfbD9Umu6tbE19JMDMu5KrI3pVUkY3Xg2gjmOgW+Yf50Er3wC9juwin+oB86wWaQmU8raqogKwP3AV+PZ1Wx076OPOkK2TMDvly/x/5pzczgOWKLG95cRW1YFfaph+dz244nHf+sfp6RSd+JULfsLYgl14IXTs+SSW5n7Ba7W+NLNM869IGkaWZPwL3WAIAhYofuhYZzw7NkBOALYv1+QNSYDXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo9LeadlGJqiQLbMFXYvkmr7/qCVtAAv4WiAP6eg3E4=;
 b=RXOeQjTutRK1pTFTjwZY3Uvtz2h9Vh4t10SsjcKX4gs4VQZT6K6CJDqfu7SLxn0sUP6Rzd5u+Mfd8FuvmIsj/I3LiKqMNoEiavmD7AWgJAo0duBZGP37EvigCj+Qj6CwF4gfNkLxu48m+4HT3u8ab4xqbyutCPIPmg6K6c4OTV8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Topic: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Index: AQHb7LJxCAe3dwZ41UCqlD5sc7if87QoStWAgAGGGIA=
Date: Wed, 9 Jul 2025 05:29:35 +0000
Message-ID:
 <BL1PR12MB5849CD51AE6C1D7DE46EAD89E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-2-Jiqian.Chen@amd.com>
 <dd44b55a-eb9d-454a-836b-25dc7195a5ac@suse.com>
In-Reply-To: <dd44b55a-eb9d-454a-836b-25dc7195a5ac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8901.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8987:EE_
x-ms-office365-filtering-correlation-id: 054df189-3eaa-4e9d-00ff-08ddbea99765
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0U5aDR4MEZWWTVWSnVldHlTRDdMcENOUnlyRWwzSjVKOVdMcjF4TFlWeUIr?=
 =?utf-8?B?VzZEUjhOd3JhR0o2ZEhqVDIvSVRQOUZXNFY1K0pzVVZ0MlpiSVVVZlRtN2xm?=
 =?utf-8?B?ZlNTaVAzRVZZN2NVYlBJNVg4dDlPR2J0YjVjc3VJenFNRDdacnI4S1l4bGNR?=
 =?utf-8?B?NTF1NXlCR1JEdHZucVVpYUUyVFh5azR6VzAreDM0VHMxU2pIREZqalJmRmZx?=
 =?utf-8?B?VW15MVcrUVFNUGd3Z0EyMWtCUVVZY3o1SGc4UXMvVU1yVHNOUDFPaFI3dzY4?=
 =?utf-8?B?bmZzQ2hGZGRrOFlEKzJ4WkRuYlN4SW5XY1p4ZnkwSjgzeXdmeVNwcVI5Qmpi?=
 =?utf-8?B?ckFhTWVlZ3ZhblQ1dHhKS2lWQ1VaQVRkV2phRW8zQnQvc0VxUjRia2RJWEh1?=
 =?utf-8?B?d1YwL1BFRVFpdVlWaWJPbTFhRnZXdHpzelpaZmhsNitCYTZxVmVWSW1RMkZz?=
 =?utf-8?B?QXVvUGNldS9pViswRUN5REZCVk0rdFlBSU51N3RUOEpRMXRnNmwxNDhDdk1Z?=
 =?utf-8?B?dXl2bE84VnNXT29OYUExN0J4Rit1WlFBV1BxMk5KaXZjZi9xcUtIelVUcDBm?=
 =?utf-8?B?ZFhWRlU2SUxwRFpYOXppKzdHYVZUMExpZE5IRGdjQjdUVUxLM1dUV2hsTFU2?=
 =?utf-8?B?dGdmZGJKa3pONjVEYkh0OElPSG80Umh2c29hQTFmV0VLZVdyZC9TMnBPWE54?=
 =?utf-8?B?OEx1bHI4UThVbVJUT0s3VWZyQmpwWkRXT0I4djJ6bWtudjhKbFBoMmxUdHZn?=
 =?utf-8?B?SkFvY1h5WkFvRzNvZmRjR0NXVTZMK2loeE1wNzVrM1FqSEZ2S29zM1RFRnVv?=
 =?utf-8?B?dXEwcTVKV3RBbk1XSUtDamo0RWU4amsySWF3TFJvb2lkNkhkdFQyemhXa2I1?=
 =?utf-8?B?RmNISjVUWFFKbDFNVW9SUTlobW4zaG9LNldYWWRaclRrSVN6Ri9kL0pFTW4y?=
 =?utf-8?B?ZXV1R2IxNFp6ODNrZTlkeVkrbmhRbCtYbENDcU54NUZVd1BsUGNEZDJCMkdE?=
 =?utf-8?B?ZE5UUUxlOUZ0Y1NHTGtuYnVGWVpRWDFQajBnZ1R1dFNjbjdYdnhncThnOHRZ?=
 =?utf-8?B?UDBhbmFkUnRpNkx2V1JXZ2JYN3g0bVRkN1FKRGVxMnBHYmxBeFF6MllSY0x2?=
 =?utf-8?B?S2IyYm5WK05xVjJ0cTFQZUt2dWRsa3QrT0RTaFZ5d1lsblEwaDJlVVFuRTEr?=
 =?utf-8?B?RENxK1c3ZXFoWkovSzB1UFZybC91WTg4bDRWYlVKWiswM0pjSkhBdHlsTXNL?=
 =?utf-8?B?SHJDaTdwTy81RndWODNEU0c2MDYxRG1NZjZFOWd2WXNmTVYyNnRPbnRYS25a?=
 =?utf-8?B?YXVTMW12UVJtU2RSN2JqVjhlVGxDRWRTSkVzeHAySmdFUU9tSkYvVVdwVXgr?=
 =?utf-8?B?QjM0Q1F2SFlSUzBVSEZYTDIwSHF1Sk9RUEJpOExEcUpYZFh2Y2JsZVNOd1Iz?=
 =?utf-8?B?QjBhdFpYcE4yak1yMVF3dDNCS2lrdzBDemlBSVBqd1ZzRmV3b2R0TTY1bGhl?=
 =?utf-8?B?c0p6WVRkdUZKZytmRExnQWVGZ0J4VmFyMS85dml6NytmYyt0L3VWK0p0Uks4?=
 =?utf-8?B?RUxBanNUTlVqcWJhUU1VSzQyK2FtMmJsVlluYUtqTnJxZ2RQVjk2VDljZXBl?=
 =?utf-8?B?MEMrQmxhTWJuY1Z4cTN5aXNwTUp2NVBkKzRzZzF2NUtiUmJ1UFdmTnJYT1FJ?=
 =?utf-8?B?aGhvdVBQMjJmclUyZGh0bXBYOGlMVWlyNlhQaTViYmYvQ0d0TDRDV3UwYjRu?=
 =?utf-8?B?cGZkZmhYb01JUjJKNjVhdjMzemhOZ1dGMTFZbHJvNXcyUGZaQlQramhUV1U5?=
 =?utf-8?B?aEhLYVZNUHFweU14WXhCaERZS1BuMlkxODRMY3BoMlNBNDNRSDRNQjhZSDVB?=
 =?utf-8?B?Q1pBRFFwQm0vQ29YbE1lamxuRnlFdVBsU0Vqa3YxVnBYdkJ2ZmZUM0NsWElV?=
 =?utf-8?B?VzhEM3FValBlbHFaT0xFYTA3Z21wQkFUUXlyOFpyMnk1S2xtSjlsck1lazFn?=
 =?utf-8?B?Rjk0Y1FsaHd3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkQzY1NvWFlQOVpFSWt6dllxVHBuQjZSaDBDYTRhM2cxcjJYU2xaUG9Razlu?=
 =?utf-8?B?UFZzdmwxYnRpSXpVcFgxSms3V3MrNnoyclA1ZVR6MVlwUmFMMW90WDI1Zitk?=
 =?utf-8?B?UkZxYktkczM0dUQvV3M5elg1bkhaOTFabXI0eExmdjZTYmp1VXlaNGhrbzZP?=
 =?utf-8?B?cFRSRFJ3UWU4cG9JcFdIK1EzL0RWU3c5cW1CNGRELzlyNktKT043NWFhNm9z?=
 =?utf-8?B?ODA5NjhKNUtFSk45d1JvNk1Oc2Z4QzJUY1JsTkpIVmxvMFQ0STZrTWI4Uzll?=
 =?utf-8?B?clVPMmtIWXUzMCtBeVZnM1MydkpPdlo0NEo0LzR5MVFIYjRLV3QvZWVxcnNX?=
 =?utf-8?B?M091UnFrbnlZRFJpbVFxTldwTU5YUXNPRURPekVkU3JZMTdwcmxLTllXQ0tj?=
 =?utf-8?B?WEZiNkQ3R01zN01jOVFRbktSTkpUcTdnR2lPWm45d3pPYXJRb3lGNXZvak5P?=
 =?utf-8?B?Umd1T1hXT3doaXRESDdDdFoyaXdnMFhTaHJKZVFyTGJyc0hpRXdCSHJubXhu?=
 =?utf-8?B?ZHJmbmIvRlFsQWhRWmpwT3phaU9iVE9GNzZiTXVmWElndEc2eFVhN3YvOWJl?=
 =?utf-8?B?RDhTb0ZJd204akJVNEZvZFVkRnlrc212NXlDYUw5eU9zU1Q2emFJYStUTlVt?=
 =?utf-8?B?QnFLekYzR1hCck5Ibnl0SUphMElQNHZEVkw5UVNORnhsUmtRVEhyamxCeHlZ?=
 =?utf-8?B?ZHFxZDk2NDVyMTJRN3ZyS2hqYjhnZExRMGgzL0RtVGpqSjQ3REFTWUlOZnVF?=
 =?utf-8?B?MktjRFJRYmxuUGs0SFM1OTZxS25lQytKNzBGQmNnblFDSlBOQXpxN3l6NkJ5?=
 =?utf-8?B?d3FBYWJYbXNJWERuZWMxOU1rOHVnNUFzbzQ2VWZzeFRRVFZ6NlNTMlU5OFBv?=
 =?utf-8?B?ZXE3MkhsRENmK29PZlhvWmF0ZUhoTlhleWIyaW1hS3dQckIvNkIveVhsUUhI?=
 =?utf-8?B?Rjl3OW1kbjh1Mmh2aXQxSHVGQlVjSmswVGZncExrRER0R3ZLUGMvZUFSNDRw?=
 =?utf-8?B?SEN4N25UL1h5TGh5K0VqY2s0eU4zZjBUM2ZWNm4yNVIzMytieUtYRGJFVmp4?=
 =?utf-8?B?eWpaM1B0em1UZVUvb3pkaENYb21UNjRsNlppdW5MNUo5RlUzeWI4d3pocmFG?=
 =?utf-8?B?cW1XWG1lQXhKenRDeDBUSlYwZmdFQU44L1NpTUpEL0hIVVA0MGdBdW5GcmFS?=
 =?utf-8?B?WlNTNlJBMmVJQzBPMmNIam40MmRZelhkZnZxazZvNyswSWFQaU1DbGk4bDdj?=
 =?utf-8?B?eUdHR042bHRqU1JDbitlT3I0UzhsWHN4WFVZdGdXV1lBK2RXaDhsem8yUnNx?=
 =?utf-8?B?LzBOV2tJQ2pkRi9UYXMyamFiVTZ5WC9rVm4yQ01NbmJuNEhyM0FFU3lVZFFC?=
 =?utf-8?B?cUlyZTBvNFk2UEp2R1JkSzcvckJrUFk4dTN2MnhKenI3N25HS0ZudWNocTJE?=
 =?utf-8?B?cU1IcnhxakQ1c0xUNCtpcDR0eTNvQXJlR3E4MFhFOEV1M2h3RHlRSnZ0RHpq?=
 =?utf-8?B?MHBMb3lUenF3alBWUVN1ZkQveVd3T2wrNHAwWWlyTUJkV1p4aDZkSTFidy8x?=
 =?utf-8?B?c0xSNXNsYmJXRmpuMXJ4d2ExNXRFaWJpUldTTElrYW5QWDRpSUdVYlh6V1Vn?=
 =?utf-8?B?SnNSRURoc0FFbC9ZL09YRjFmZjZoYk91dVVEVVYxUEYwQ3E4WEdGQk1rd29j?=
 =?utf-8?B?eFppM2VOaEJvVjhSVE5aZDM0YjRrc3dMaGsvL1Z1RXhqTlpFcmNJaW1HM1ZP?=
 =?utf-8?B?SmlPaGh6TTVtSHkxSVlEOVYydnZRUUh2a29vS0tJdngya29ERFFXTVBSSTRW?=
 =?utf-8?B?dDdYUG4xM21NbkxOZE84TkduK1ArTXlLNUVQSk4wMEdnWXRyWktrOEVxV1h2?=
 =?utf-8?B?UHRkelM4bmg3SjBoU0FqUm1mVTh4WDlJazlWM2RwT3BWM1E2TklXSjJDdTdR?=
 =?utf-8?B?cmFIczhiN01SWExHQjFzZXpxeE9NVjdERytldjhTS0gxZEMxbjFoNTErOXJK?=
 =?utf-8?B?dGFrd3NiWUNIbUUweVl4Tk80NlFLdjdXYUk3WjFHUGVqUDMxLzRPTXhURnpN?=
 =?utf-8?B?WWVucjdRTG5nKzQvV1orcFBLUzdMQitqTE9SZzducWFGenhsSDBpSUNneGdL?=
 =?utf-8?Q?T+ao=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D59970E9E759464C8641C4B66D94F955@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054df189-3eaa-4e9d-00ff-08ddbea99765
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 05:29:35.4991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bOvswcdpg2gcBOOXJagQT0jBwqlMWhe/z8CXxYpwc839KKSW19Lf94UfHWMho5Tv8Avz8jN3BJqgxs6sGVvntA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987

T24gMjAyNS83LzggMjI6MTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wNy4yMDI1IDA5
OjA3LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVy
LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC04MzYsNiArODM2
LDM5IEBAIHN0YXRpYyBpbnQgdnBjaV9pbml0X2NhcGFiaWxpdHlfbGlzdChzdHJ1Y3QgcGNpX2Rl
diAqcGRldikNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NUQVRV
U19SU1ZEWl9NQVNLKTsNCj4+ICB9DQo+PiAgDQo+PiArc3RhdGljIGludCB2cGNpX2luaXRfZXh0
X2NhcGFiaWxpdHlfbGlzdChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiAr
ICAgIHVuc2lnbmVkIGludCBwb3MgPSBQQ0lfQ0ZHX1NQQUNFX1NJWkU7DQo+PiArDQo+PiArICAg
IGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4pICkNCj4+ICsgICAgICAgIC8q
IEV4dGVuZGVkIGNhcGFiaWxpdGllcyByZWFkIGFzIHplcm8sIHdyaXRlIGlnbm9yZSBmb3IgRG9t
VSAqLw0KPj4gKyAgICAgICAgcmV0dXJuIHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZw
Y2lfcmVhZF92YWwsIE5VTEwsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cG9zLCA0LCAodm9pZCAqKTApOw0KPj4gKw0KPj4gKyAgICBkbw0KPj4gKyAgICB7DQo+PiArICAg
ICAgICB1aW50MzJfdCBoZWFkZXIgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcG9zKTsN
Cj4+ICsgICAgICAgIGludCByYzsNCj4+ICsNCj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVn
aXN0ZXIocGRldi0+dnBjaSwgdnBjaV9yZWFkX3ZhbCwgdnBjaV9od193cml0ZTMyLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MsIDQsICh2b2lkICopKHVpbnRwdHJfdClo
ZWFkZXIpOw0KPiANCj4gSWYgaXQgd2Fzbid0IGZvciB0aGlzIHVzZSBvZiB2cGNpX2h3X3dyaXRl
MzIoKSwgSSdkIGJlIGhhcHB5IHRvIHByb3ZpZGUgbXkNCj4gUi1iLiBCdXQgdGhpcyBjb250aW51
ZXMgdG8gbG9vayBib2d1cyB0byBtZTogV2hhdCB1c2UgaXMgaXQgdG8gYWxsb3cgd3JpdGVzDQo+
IHdoZW4gRG9tMCB0aGVuIGNhbid0IHJlYWQgYmFjayBhbnkgcG9zc2libGUgZWZmZWN0IG9mIHN1
Y2ggYSB3cml0ZSAoaW4gdGhlDQo+IHVuZXhwZWN0ZWQgZXZlbnQgdGhhdCBzb21lIG9mIHRoZSBi
aXRzIHdlcmUgaW5kZWVkIHdyaXRhYmxlKT8NCk9oLCBJIGdvdCB5b3VyIGNvbmNlcm4uDQpXaGF0
IGRvIHlvdSB0aGluayBhYm91dCB1cGRhdGluZyB0aGUgaGVhZGVyIHZhbHVlIGFmdGVyIHdyaXRp
bmcgdG8gaGFyZHdhcmUgaW4gd3JpdGUgZnVuY3Rpb24/DQpPciB5b3UgcHJlZmVyIHRvIHBhc3Mg
TlVMTCBoZXJlPw0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hl
bi4NCg==

