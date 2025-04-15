Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6DDA895C0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952222.1347740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4b9H-00063F-Ps; Tue, 15 Apr 2025 07:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952222.1347740; Tue, 15 Apr 2025 07:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4b9H-000609-Lr; Tue, 15 Apr 2025 07:56:03 +0000
Received: by outflank-mailman (input) for mailman id 952222;
 Tue, 15 Apr 2025 07:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JN3i=XB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u4b9G-0005zx-2f
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:56:02 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f7695fc-19cf-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 09:55:56 +0200 (CEST)
Received: from AM0PR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::16) by AM9PR08MB6099.eurprd08.prod.outlook.com
 (2603:10a6:20b:286::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 07:55:50 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:208:168:cafe::63) by AM0PR01CA0111.outlook.office365.com
 (2603:10a6:208:168::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Tue,
 15 Apr 2025 07:55:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 07:55:49 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS2PR08MB9474.eurprd08.prod.outlook.com (2603:10a6:20b:5e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 07:55:17 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 07:55:16 +0000
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
X-Inumbo-ID: 0f7695fc-19cf-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pxfv9bblthxMq/mmOkSFvCX0ko3V7HhV8MaPgCHWI6fHQXHjqeQIz06zOYh45LMHZPmiLM/gyyoOPR5WvU1DmR/x8WH1RuUBKYSoIgND1qdvhzPDJ9+gJh+cEfNfs63ejGnCevHcVN7G6uSdVsqEHfYxPv6sbSxJGP4hkbD32G5gXT2WWBv9Ek/9w0NBtZk95cNqrwdH6kr535pXYyoDIdF0BQCTV9FZDCVtt+LbHSGcJnSxFwzTzjXxoA++sF5QvOWXNmxfyZe5n0omLjqYjmyfOstf0Frqb8Qowsi0rAoVzVBqrR8VHuyU3OdRYcAHYZxN2wS9MOfotn01l3sV4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2fKqZ5wnNPzUBs4RD7wTwKYGvs3QOO9TxGt/wG8g08=;
 b=STsHQhkiqYVia/kyjRIfg2MrU9+zhq2Sb8hCHSKxzNraMmebQ4kF5+N/gyX9jmYaH+j1zEBUfX+Gl0B8UeS8EDLJ1Fzf5qzbATgIU85KgGP8R7ao65VFXDG26fNUA42UTb86zlHMqcd9KJi58I/I1zUEI/baAbJytBtJgkbcCyvdiOaYK5srj1bF8acuXRA8SBS98UWt8COv9c29uxbYhL5cK9+jAjsa6dENW/owVkAwiV37gwyRNcyY8y7Fa0KIrEv++EXlqzHvZAa3VDYqksHlZbYv3ATgurDkSVaFxYpF5+zlN3pVImNeLJnKPxA88F4BlTHMD6ixdgQXdGG2jw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2fKqZ5wnNPzUBs4RD7wTwKYGvs3QOO9TxGt/wG8g08=;
 b=ISsSnblHvvxMGGLU4GoilifI+xDJeGSKvl2aD7xkzdoOwW+xqqeYtXz88uWPr3HcXnpq3iyxrTI+aLZbhIASVc0lS2dv1zZC10wARdtvHVla+N3BQOcaF0wnaP3S3amNK2eDpynn0weQjVqIqLPVYF9uajaXQgAT1kdEmPNhqJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDDjOA6m+AqvZ38NVh7VmlrzjRWTAT/2nh5ZGw7AGOrzq4NDxmLlK+tvEbHYZ6Hg+vR/fO5BacQFnkiOL1WsVLWGhT1iyFW6q4SqaXkJWRs98NRj9ZgUPkiqBwZYnWlkLXb4KggOcNFHo/DmB6pfb7qycejg0Rr9jKDkfebU8gBJ42RJVcCCnxIoSg9ROReSxd2XsYpjpz1gNS5lqpvhbTZpsfISKahaWDtUFI53m2wVUVfiPInA0mKxbYRTXVAn7Tul7X0rfuImfDvd8dLIfyfjNU10G9UuFODQ1O9sBTBzU5I1Zj6kNOqqhQ78eVmPp/dYjRcZVtxPwbAqz5IvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2fKqZ5wnNPzUBs4RD7wTwKYGvs3QOO9TxGt/wG8g08=;
 b=GDeGhgUWs9/uThmwXm4pRSTwv316vh2DOkf20Be68/OAp9OrlU43dP+fib1G8sxqCHVqyTq8eTxkWAg/pFGjxhdhzfaVCgsmqqtiBJz6rs0DBrVKi0vaBbqoPnuca/3RfXWQJeRkKzFAT/7+6YfZPyFBJSGqEfrGVnSU7Ya3quEW5FQ89Xhb4ebS0wr8iW60pELpI7h/RdSK5qb1uWuFb2HgItRvQjkjDJLlXCrIGPKbyYGjdkoBXFjDojqv9rig9H1q5vMFHkrYXIdAVAJ4G22mXc/lk6KlrUJoi9q0HjRwaOfj7zckb9RAP6vKj5ncZNzbSi7ZbuwkDUevyxeP/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2fKqZ5wnNPzUBs4RD7wTwKYGvs3QOO9TxGt/wG8g08=;
 b=ISsSnblHvvxMGGLU4GoilifI+xDJeGSKvl2aD7xkzdoOwW+xqqeYtXz88uWPr3HcXnpq3iyxrTI+aLZbhIASVc0lS2dv1zZC10wARdtvHVla+N3BQOcaF0wnaP3S3amNK2eDpynn0weQjVqIqLPVYF9uajaXQgAT1kdEmPNhqJk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Topic: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Thread-Index: AQHbqvIOcqFIKG0Dnkidmosr/dM7hLOjFvuAgAAzsICAAJ2ngIAAeRkA
Date: Tue, 15 Apr 2025 07:55:16 +0000
Message-ID: <A053DC71-B301-4D64-8EDB-C225E2ED3FA7@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-8-luca.fancellu@arm.com>
 <923a2fc0-4eeb-4e09-a56d-7471a56fe3bf@xen.org>
 <4771188E-B307-4452-A900-2ACACC1CE333@arm.com>
 <fcacc6b6-ea4b-4917-ac46-5264ac3e4039@xen.org>
In-Reply-To: <fcacc6b6-ea4b-4917-ac46-5264ac3e4039@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS2PR08MB9474:EE_|AMS0EPF000001B2:EE_|AM9PR08MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 5858de2b-8714-4688-1862-08dd7bf2f051
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bmFMSjByR0VxblF0eSsvdmFXM29MTDhkQVhMV2FsN2crSmptYUt6T3RxS3lL?=
 =?utf-8?B?cmk1eCtCUlVrWHk1cTl0VElLNWpEYXhKbUlyc3d0Zy9oU0xoSUhWZlpnWm9o?=
 =?utf-8?B?M0sxT3NuL3p5T1ROWE5uS3BSM2pNdTNkTzkwQUZNRHkxUk55c2t0R2lFQk1h?=
 =?utf-8?B?dWxHN0hWMzEyZW0zNVBFNTBuVWx0S3JpUmNJWlpvTDk0Ky85QjNTY3ZYelFS?=
 =?utf-8?B?UWtGZjNGUlR5T3RWaUZDTDVxd25OZS9rKzRLYmYvUXcxR3hmOGxkUURhZzZC?=
 =?utf-8?B?aFR2bFE0SkM2NHVUZUprbmZGUVVIblI5ODM3eS9EVUk2RzZkcVRmQVZyOFdJ?=
 =?utf-8?B?N09Zb3ZnTmNTZGJYdDhydnFnMjA4cnhLRHlFUEdqaXZvKzJIdFVBbm5KeXQv?=
 =?utf-8?B?eVhkRys2VU9wenhXWG9MQ2FRNlBVakVlRmVzQUp1S05jcmhORk00VVJZK1Ru?=
 =?utf-8?B?RmxMWk9wS29UMHFoL0F6b0h4U2VNRHU3V3dQMmU1VTBveU9kMUREdGlOdVJ1?=
 =?utf-8?B?bHZkdjJTTEx6bVArbkxvd3RDczl3cXZodlRGMjZDNzJXVFdxYTJRWlZqZHBZ?=
 =?utf-8?B?UlZyblU1cmxEMkFKakQvZzU0RVhLOXZrWkVwYjRnRlhMWUhpZ3RGTFNGRXBK?=
 =?utf-8?B?ZUdvNUdyUzdYWDFUaHliVmo3Rkc5S2x0Q3hwN3ZtR1pjVzI2VFB6czk0dlha?=
 =?utf-8?B?bzZEcGhSWmRXV0tRd0ZBNUR5NjhtUmFJcFAwRzF2ZVQ5ZEJVdXJOTHM4VE9v?=
 =?utf-8?B?NmtYWnRMTmJZR1VxVkY1QTYzN1BiZlZDQjU2ZlFpakdhYWtyNnMzb0t2TFhz?=
 =?utf-8?B?WWh2UkU2RzNxcDY5YTlNY3YxUit1ajNuZFNuZ1hlVjBKei90RGlMZDFUcGVi?=
 =?utf-8?B?a3JwNmwxYzFvVC9yNHUzMUwvMFlVV1MweHdqNkg0bi9XRmxLOXNZL1RYN2hP?=
 =?utf-8?B?TTk2U3Q2QjJhQy9VYU9rZHAybXVYWWtIK2dPU3BZcWx0L3AyQWR6TDdVYTJ1?=
 =?utf-8?B?OEtZWTBWUFlObEhqN2tFOVBtb004dHBaNFM1amlKeHoxcFhKamJYTnluLzNI?=
 =?utf-8?B?NDF1bDEwREVqS1JxNmY0SkVMNFYzM094bGE5b2swWE01SDRVRkY5T0wrMkov?=
 =?utf-8?B?NTAzRlRwTFBFZTRRT2hWL29PU2ZyRHF2QVJGc1UxeDRtcXlQb1RhVTZqc1ZJ?=
 =?utf-8?B?T0o3bFpPRWhubTJWbTY1RitqNlpwd0NUcjlHTElNK0ZhbGhFVHJ5ajZlcUNj?=
 =?utf-8?B?ZjZUd2ZodG0vUFprUm5mWDE2Y0gyOHYvb1pTR255b0xad1lUeUl0b3I3YTRT?=
 =?utf-8?B?ZkxqelN5MEJIQk5aME00Y0JFdWV0TkJUVXJRK3ZXbk9KdnV3aGJVclcvMzlI?=
 =?utf-8?B?T3M2MFV6aUdCVWR2aCt4TzBzSlJKdk5LWFYxOGl3WTdKY3E1Y2xSQUJPZ3FG?=
 =?utf-8?B?QkJLL0k2bkRCVzhkdm1WMEFkdXhuYlFMWkpxd3B1Y1N3VWlFeTdtU0plcHZs?=
 =?utf-8?B?b1RmZy9kdmExZnhwZFF3OVhDQ0s5RmZSVXRMSmc3RkdpM0pwVklueDl4YUlL?=
 =?utf-8?B?allRajhCZWt4a3JKZ3NKcjBLZzdUTU9peGdudUM2bkRnYXFxV1o2TkxkOE9m?=
 =?utf-8?B?Mk9VOGl0bUhheHpTUmo2bFd6bDMzY3hWdTUzV2NuUVUrZnJGa2xNUElaR00w?=
 =?utf-8?B?RFNaL0I3dERDLzZIMS9pYUtZUHdaM0hGZUxUdjdwZCsxeWlMdFVFVnNqRHVZ?=
 =?utf-8?B?dS8zZjNtS2ZHTk5hYzE2ckxuUjFGRm5VZmUrYzVPanAwTTZqN3p3TE1tQlhR?=
 =?utf-8?B?MkZBdnpZcDhpQUQ5akhJZ0JVSXVuSFFQVSs4UWs2RW41TDZqTkx1Vjk1V1Mv?=
 =?utf-8?B?cS9UZG4yeEdJd2hIZ3A2cGFHMDQ4NXY4ZFZEK1o4a3lnRkduby9JT1cwaWNm?=
 =?utf-8?B?aktMR1VBNTR5eGpXZGJweHh2OW04aWk1cXFBNDdEWDY5N0N6NmVDbHdoNGRw?=
 =?utf-8?B?dVl6dU90WmNRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9973B1466AB8EB48BE599C4166B48289@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9474
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e26ec59d-5dbc-4bd0-fa02-08dd7bf2dc89
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTVtWkpHRWRjaTdOZDM0NVd0eUpZNmpRTDZ6YVhjenVpVmIwRzZoN0t3Ukxl?=
 =?utf-8?B?Ums5Q2cwRlgwdnFIL21YQkg3V21KVHBRb1lhUTR4ZHRmKzNRV1JqQjBjRDZK?=
 =?utf-8?B?azhxV1h1d2ppMFdZUmRDclNVOG5GcTFaRDQxTDJMWXdSSExjdEVCbHpDemRO?=
 =?utf-8?B?Sjg0SzluUThRR0RZMFVrTzc3NHhZTURHWVpRcmJjQVo5NlYwZVo5S3dEOTJr?=
 =?utf-8?B?MURyYkE3UTFveTBzS3lmK0tjT0YzYzJuRFhLNHJVb2R3dkdEclRac0NQYWc4?=
 =?utf-8?B?UTlXS3VZbDJuY2FSRlVUekVtTDFGWWlvajN3YW14M21Ib2hXTXVyOE82SFdn?=
 =?utf-8?B?anhrMXNpS0dHcXFlYURNL3NWQlNMYS8wWGMxZkY3WU1hbk54RDZiZ2FGNUxN?=
 =?utf-8?B?ckRLMmFKd2JZSXJkeHIrb1Rvbkh0dVB4VDdRUzhYaCs3VlF5TTRSR3N3Njdj?=
 =?utf-8?B?Q0pjZDhPdWFKQ2FwSFY5V0x0QitDSk9pS0VqckdGaWw3a3JTald0RHc4Y0Rn?=
 =?utf-8?B?RWFEVEtyTDhQRHd5MUVTcW9MOWZlcFpsWGYreWNib2RFeU4zR1RJSW9UTU1C?=
 =?utf-8?B?aGRHa3pzMVBRVXNZRXlzMnVBOGh6V0dBTmlOeXZrVUxldjQ1V1lRTGJ1WldQ?=
 =?utf-8?B?QlQ3TDdDN2VBVmEzcUtDQ2d0aUd0VllvTVgwY3QwKzB5UjgvS2s2TTA3MjJQ?=
 =?utf-8?B?M3RyYk9KMjlmSHpKeUFQWlJMMXhhVGM1Nmc3cHRLODg2MUJCOEQwdHBGbkZC?=
 =?utf-8?B?Z2JjUGF6U2VEM1p5L204dWJ2K0dPSDVLVExQSnJoalRCeGgzWWt0VUs0am9i?=
 =?utf-8?B?aFdxV05Kc2dXTG9kTURjWkV6Z2dmaWtKSThRTEg5SGNteTlDejZMeUpid1Zt?=
 =?utf-8?B?ZnJqMWhnQVlDbWJyQmtrS2d2Nmx4R29UYlc0Ti82dDNDaldMRHNMYWxBZng5?=
 =?utf-8?B?cHB2SU1xbG0xcDdib1k0UFI2S1ZjRGRVNVdHbjUwZjAraEx3NTdXWFhJbGhT?=
 =?utf-8?B?WGNmYk9PS1VNZUlnbm1Lc1h5WDdhYXBMd090NURQZXAyOGZnS0Y4NXhwRVY0?=
 =?utf-8?B?bmNxUWJ6ZHZCOXdCb05WWEh2RVUzenZmYUNvZlVyQWNZQWw4RmtnZDkyZ2Rq?=
 =?utf-8?B?YmNZMVpRSVVjYzFkZlRKemxpVlhsY1pibVAycDBaeFZzMkoxMGZqNVB5UnA4?=
 =?utf-8?B?dUdYR3hPR0tpNENMZUkrZVlNN3MwSGN4R0NiUkhEenRhSjBFK2MwOHhqa1Va?=
 =?utf-8?B?a2RjYVRlR0VPdVRoSW1Kck5DVFFlZWZCd2hYYUpvZ08ra2dQaEUxdUxLM2ZF?=
 =?utf-8?B?N2ZsbGlQeUwrM0ZnK1dRWnRrdGZuUmtsWGU0SDFNSXNzeEd5eWhzQWhZT2ZC?=
 =?utf-8?B?MnRpbDFBa0VvZmFlaGFyLzROZ08yY2FtaDVaVzFzTTFPUklYYzhHdTBYVVFD?=
 =?utf-8?B?dG5Ebnp4ekV3UHNocGIreXdrbE5LSDFsUlRnekh1M05HTC9EVUJHMzV2MVB6?=
 =?utf-8?B?WjdDTXZHOTl3NVVMemRDZkRlRVhlajJKN1ByKzV1Z0I1cG91d2RTZTRYSVg5?=
 =?utf-8?B?NG1UcGVmNzFlTGpuaC81OUZzN01oYmxCZUFjMmJIZ0ZWRGE2NGNUWHFLajEy?=
 =?utf-8?B?djRiMnBycUNsbGgyMDk5bGNCcC9NWm90dUFRNnNCVWo0SzBsbUtIRENPRDda?=
 =?utf-8?B?bDNPZUFSSzFmUFZoSzZHaFBuQVl6T29ZWXNld2xSSXFJY1pXa0xDWk9qQ04y?=
 =?utf-8?B?dkMrQzI3SWNvcnhncm1HNG9NTUFLTWFPZEw2MCs2VVNobkxVM1dHYm9UbnFM?=
 =?utf-8?B?NFdweWZBUERqVC9hc1hEMzJvd0c5OTcxc25ycXJKK1BBT1Uya25qVUE1OVdz?=
 =?utf-8?B?Z2pzajZyZzlicmEzREpxcUJXaUxialZaaHZxbFRpdXc0YmFubEdNVFNSL1dZ?=
 =?utf-8?B?M0sxNjZaMlM3SDFaVFllVUh2Q3pmaWFRUXRMMWZQTzlEUGxPRkxobjlzZ2ZZ?=
 =?utf-8?B?T1NpSjFTZ0tEb2QwR1ZlVHczTnN0eStPZDY2ZUlpNGRRR0dHSXpyOUNZRVBv?=
 =?utf-8?Q?wIu5/p?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:55:49.9689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5858de2b-8714-4688-1862-08dd7bf2f051
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6099

SGkgSnVsaWVuLA0KDQo+Pj4+ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbXB1KHZvaWQpDQo+
Pj4+ICt7DQo+Pj4+ICsgICAgcmVnaXN0ZXJfdCBwcmVucjsNCj4+Pj4gKyAgICB1bnNpZ25lZCBp
bnQgaSA9IDA7DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIE1QVUlSX0VMMi5S
ZWdpb25bMDo3XSBpZGVudGlmaWVzIHRoZSBudW1iZXIgb2YgcmVnaW9ucyBzdXBwb3J0ZWQgYnkN
Cj4+Pj4gKyAgICAgKiB0aGUgRUwyIE1QVS4NCj4+Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICBtYXhf
eGVuX21wdW1hcCA9ICh1aW50OF90KShSRUFEX1NZU1JFRyhNUFVJUl9FTDIpICYgTlVNX01QVV9S
RUdJT05TX01BU0spOw0KPj4+PiArDQo+Pj4+ICsgICAgLyogUFJFTlJfRUwyIGhhcyB0aGUgTiBi
aXQgc2V0IGlmIHRoZSBOIHJlZ2lvbiBpcyBlbmFibGVkLCBOIDwgMzIgKi8NCj4+Pj4gKyAgICBw
cmVuciA9IChSRUFEX1NZU1JFRyhQUkVOUl9FTDIpICYgUFJFTlJfTUFTSyk7DQo+Pj4+ICsNCj4+
Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIFNldCB0aGUgYml0ZmllbGQgZm9yIHJlZ2lvbnMgZW5h
YmxlZCBpbiBhc3NlbWJseSBib290LXRpbWUuDQo+Pj4+ICsgICAgICogVGhpcyBjb2RlIHdvcmtz
IHVuZGVyIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhlIGNvZGUgaW4gaGVhZC5TIGhhcw0KPj4+PiAr
ICAgICAqIGFsbG9jYXRlZCBhbmQgZW5hYmxlZCByZWdpb25zIGJlbG93IDMyIChOIDwgMzIpLg0K
Pj4+PiArDQo+Pj4gVGhpcyBpcyBhIGJpdCBmcmFnaWxlLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJl
dHRlciBpZiB0aGUgYml0bWFwIGlzIHNldCBieSBoZWFkLlMgYXMgd2UgYWRkIHRoZSByZWdpb25z
LiBTYW1lIGZvciAuLi4NCj4+IFNvLCBJIHdhcyB0cnlpbmcgdG8gYXZvaWQgdGhhdCBiZWNhdXNl
IGluIHRoYXQgY2FzZSB3ZSBuZWVkIHRvIHBsYWNlIHhlbl9tcHVtYXAgb3V0IG9mIHRoZSBCU1Mg
YW5kIHN0YXJ0DQo+PiBtYW5pcHVsYXRpbmcgdGhlIGJpdG1hcCBmcm9tIGFzbSwgaW5zdGVhZCBJ
IHdhcyBob3BpbmcgdG8gdXNlIHRoZSBDIGNvZGUsIEkgdW5kZXJzdGFuZCB0aGF0IGlmIHNvbWVv
bmUNCj4+IHdhbnRzIHRvIGhhdmUgbW9yZSB0aGFuIDMxIHJlZ2lvbiBhcyBib290IHJlZ2lvbiB0
aGlzIG1pZ2h0IGJyZWFrLCBidXQgaXTigJlzIGFsc28gYSBiaXQgdW5saWtlbHk/DQo+IA0KPiBU
aGUgMzEgaXMgb25seSBwYXJ0IG9mIHRoZSBwcm9ibGVtLiBUaGUgb3RoZXIgcHJvYmxlbSBpcyB0
aGVyZSBpcyBhdCBsZWFzdCBvbmUgb3RoZXIgcGxhY2VzIGluIFhlbiAoaS5lLiBhcyBlYXJseV9m
ZHRfbWFwKCkpIHdoaWNoIHdpbGwgYWxzbyBjcmVhdGUgYW4gZW50cnkgaW4gdGhlIE1QVSBiZWZv
cmUgc2V0dXBfbW0oKS9zZXR1cF9tcHUoKSBpcyBjYWxsZWQuIEkgYW0gYSBiaXQgY29uY2VybmVk
IHRoYXQgdGhlIGFzc3VtcHRpb24gaXMgZ29pbmcgdG8gc3ByZWFkIGFuZCB5ZXQgd2UgaGF2ZSBu
byB3YXkgdG8gcHJvZ3JhbW1hdGljYWxseSBjaGVjayBpZiB0aGlzIHdpbGwgYmUgYnJva2VuLg0K
DQpJZiB3ZSB3b3VsZCBsaWtlIHRvIGZpbmQgd2F5cywgd2UgY291bGQgY2hlY2sgZXZlbnR1YWxs
eSBmb3IgY2xhc2hlcyBvbiBlbmFibGVkIE1QVSByZWdpb25zOw0Kc28gdGhlIG9ubHkgcGFydCB3
aGVyZSBhIHJlZ2lvbiBpcyBjcmVhdGVkIGluIHRoZSBDIHdvcmxkIHdpdGhvdXQgdGhlIGFzc2lz
dGFuY2Ugb2YgeGVuX21wdW1hcCBpcyBlYXJseV9mZHRfbWFwKCksDQphc3NlcnRzIGV0YyBjb3Vs
ZCBiZSB1c2VkIGluIG9uZSBvciBib3RoIHNldHVwX21wdSBhbmQgZWFybHlfZmR0X21hcCB0byBw
cmV2ZW50IGJyZWFrYWdlLg0KDQo+IA0KPiBGdXJ0aGVybW9yZSwgcmlnaHQgbm93LCB5b3UgYXJl
IGhhcmRjb2RpbmcgdGhlIHNsb3QgdXNlZCBhbmQgdXBkYXRpbmcgdGhlIE1QVS4gQnV0IGlmIHlv
dSBoYWQgdGhlIGJpdG1hcCB1cGRhdGVkLCB5b3UgY291bGQganVzdCBsb29rIHVwIGZvciBhIGZy
ZWUgc2xvdC4NCg0Kb2YgY291cnNlLCBidXQgc3RpbGwgdGhlIGVhcmx5IERUQiBtYXAgaXMgdGVt
cG9yYXJ5IGFuZCBpdCB3aWxsIGJlIGdvbmUgYWZ0ZXIgYm9vdCwgc28gaXQgd29u4oCZdCBpbXBh
Y3QgbXVjaCB1bmxlc3MgSeKAmW0NCm1pc3Npbmcgc29tZXRoaW5nLiANCg0KPiANCj4+IFNvIEkg
d2FzIGJhbGFuY2luZyB0aGUgcHJvcyB0byBtYW5pcHVsYXRlIGV2ZXJ5dGhpbmcgZnJvbSB0aGUg
QyB3b3JsZCBhZ2FpbnN0IHRoZSBjb25zIChib290IHJlZ2lvbiA+IDMxKS4NCj4+IElzIGl0IHN0
aWxsIHlvdXIgcHJlZmVycmVkIHdheSB0byBoYW5kbGUgZXZlcnl0aGluZyBmcm9tIGFzbT8NCj4g
DQo+IFllcy4gSSBkb24ndCB0aGluayB0aGUgY2hhbmdlIGluIGFzbSB3aWxsIGJlIGxhcmdlIGFu
ZCB0aGlzIHdvdWxkIGFsbG93IHRvIHJlbW92ZSBvdGhlciBhc3N1bXB0aW9ucyAobGlrZSBpbiB0
aGUgRkRUIG1hcHBpbmcgY29kZSkuDQoNCm5vdCBsYXJnZSwgYnV0IHN0aWxsIHNvbWV0aGluZyB0
byBiZSBtYWludGFpbmVkLCB3ZSB3aWxsIG5lZWQgYXJtNjQvYXJtMzIgY29kZSB0byBzZXQvY2xl
YXIgYml0cyBvbiB0aGUgYml0bWFwDQooY2F1c2luZyBkdXBsaWNhdGlvbiB3aXRoIGJpdG9wcy5j
KSwgY29kZSB0byBzYXZlIHRoaW5ncyBvbiB0aGUgeGVuX21wdW1hcCwgY29kZSB0byBjbGVhbi9p
bnZhbGlkYXRlIGRjYWNoZSBmb3IgdGhlIGVudHJpZXMgaW4geGVuX21wdW1hcCBhbmQgZmluYWxs
eSB3ZSB3aWxsIG5lZWQgdG8ga2VlcCB0aGUgY29kZSBhbGlnbmVkIHRvIHRoZSBpbXBsZW1lbnRh
dGlvbiBvZiB0aGUgYml0bWFwDQood2hpY2ggaXMgZmFpcmx5IHN0YWJsZSwgYnV0IHN0aWxsIG5l
ZWRzIHRvIGJlIHRha2VuIGludG8gYWNjb3VudCkuDQoNCj4gDQo+IEFzIGEgc2lkZSBub3RlLCBJ
IG5vdGljZWQgdGhhdCB0aGUgTVBVIGVudHJpZXMgYXJlIG5vdCBjbGVhcmVkIGJlZm9yZSB3ZSBl
bmFibGUgdGhlIE1QVS4gSXMgdGhlcmUgYW55dGhpbmcgaW4gdGhlIGJvb3QgcHJvdG9jb2wgdGhh
dCBndWFyYW50ZWUgYWxsIHRoZSBlbnRyaWVzIHdpbGwgYmUgaW52YWxpZD8gSWYgbm90LCB0aGVu
IEkgdGhpbmsgd2UgbmVlZCB0byBjbGVhciB0aGUgZW50cmllcy4NCj4gDQo+IE90aGVyd2lzZSwg
eW91ciBjdXJyZW50IGxvZ2ljIGRvZXNuJ3Qgd29yay4gVGhhdCBzYWlkLCBJIHRoaW5rIGl0IHdv
dWxkIHN0aWxsIGJlIG5lY2Vzc2FyeSBldmVuIGlmIHdlIGdldCByaWQgb2YgeW91ciBsb2dpYyBi
ZWNhdXNlIHdlIGRvbid0IGtub3cgdGhlIGNvbnRlbnQgb2YgdGhlIE1QVSBlbnRyaWVzLg0KDQpU
aGUgUFJMQVIuRU4gYml0IHJlc2V0cyB0byB6ZXJvIG9uIGEgd2FybSByZXNldCwgc28gYW55IHJl
Z2lvbiB3aWxsIGJlIGFsd2F5cyBkaXNhYmxlZCB1bmxlc3MgcHJvZ3JhbW1lZCwgSSB0aG91Z2h0
IGl0IGlzIGVub3VnaC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

