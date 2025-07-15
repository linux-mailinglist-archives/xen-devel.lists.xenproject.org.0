Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD11B05569
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043867.1413911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbOd-0007Qa-Pg; Tue, 15 Jul 2025 08:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043867.1413911; Tue, 15 Jul 2025 08:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbOd-0007NN-Mv; Tue, 15 Jul 2025 08:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1043867;
 Tue, 15 Jul 2025 08:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Lhd=Z4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubbOc-00069a-Gs
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:52:18 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20629.outbound.protection.outlook.com
 [2a01:111:f403:2405::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 021b3dc8-6159-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 10:52:17 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS5PPF5A66AFD1C.namprd12.prod.outlook.com (2603:10b6:f:fc00::64d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 08:52:14 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:52:14 +0000
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
X-Inumbo-ID: 021b3dc8-6159-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcFksNX3gGU76KP9UPxHahdG/wwzxHzYnhxO/wLV2tobRwQNGZ7y532W0P5w5wnjxhMP8ap9PqXfa1rI9KPYbWao+LK+YNNGrDjo+t+or1cI1MU3RUY4Nm2OcH4uI+O9cdroaLvmAXrNqUXko0GYrR2NG8vHBSI1E0/iDedzoHoiTKxtuCdxzqixPxHVLRGkioj8H8vv9DdZzQxDInZ2qIcMvzbV9vkPqcQ43bBgvBn+B9la4gor0P5ZpKbpjiMWJpQHI+q92fBIJ6xUU+zRk6aDvg5Sqqk5MwKzuUCBYT8yq9tzO30BjEUCdeFpd42VnEbto8MHyl0byaCVUyJjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qfr5+Weu4GZHfSxJW43vEPwD8JEb5fSwiBj4tmAvf7k=;
 b=M7zFRuTtPuwhZa4o4bAnCmKl6swKT5fF5OMZm3+hZsLrqyOunU/SYxuZMBnc0o1Lt0Aj8yR5qbUcPjHP7lc+yMtpLQ+6l3jYzvJfrm/xEUqlG4Zpj65Jdg58xXSZqtcvzTd10p/3EcDHpoE9aMQKUOSSEsUVX0Hd/AbLY1pk/T4qpo879HQGBzz7DbfRsiGHdW90e48KbRP8x6yAeekuvq2KhKRB+IA4ZRlycIJWDm1ySKuSTDs1JVRMqP92zGEgWHzGzKxhR2kGjOHbA8FaoeD8YsEpmbsR6sFYCgvoC+R1tpEc35yJyPc4QkPhH3I7BwPOr+Kvi9mylx4lJWphVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qfr5+Weu4GZHfSxJW43vEPwD8JEb5fSwiBj4tmAvf7k=;
 b=pvZtSTfMVFg+HLn83cCKbnrZ+Kn34gJ7Lp7XIK3xpEsgi78B5zRUi6TN0q1tEEE8s5awIqVAk/3sVh8jFrDF2FXmF5jU7gUTkAk0XgIZ+QDrCYpq92m/C7DQWuc1jcPs7EffzM0BdHCsg5wsz/w3L9r8QIDTJV6nXOrK6DqB1aQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fc87f85b-6794-4810-95ae-92936f881411@amd.com>
Date: Tue, 15 Jul 2025 10:52:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm/mpu: Populate a new region in Xen MPU mapping
 table
To: Hari Limaye <Hari.Limaye@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <fad3dbb1cfcb33b5b1fecae92f57a5883ad1c19f.1752565274.git.hari.limaye@arm.com>
 <3986f8e9-224f-42d1-84c3-8c171501dd62@amd.com>
 <AEF47928-6662-4507-882E-C4000F62463B@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <AEF47928-6662-4507-882E-C4000F62463B@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS5PPF5A66AFD1C:EE_
X-MS-Office365-Filtering-Correlation-Id: 178b5c84-7d29-4864-9ed4-08ddc37ce4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekU2OTBXM2h5V3ExTHVFTWhQRFV3NVZlVXQxSmFxd0NZVldKSGNtMzNpbUQ3?=
 =?utf-8?B?OXdJL0pTN0EwQW5TTGR0MzBlMDJZRzhhWHJadW5yMlFSRVJaMTZTMy95eEVS?=
 =?utf-8?B?K2k0cHNPTDVCY2gzWXNIc1U5RGNLYUtZaTV1YmJvSExSTVVGemxyUE5hTG52?=
 =?utf-8?B?Qk56blJIQ2REcE1ubTFzQjQzblcwRUJsUmRxRldSSVJyYUZITUVkZGRRQXNB?=
 =?utf-8?B?UkwzMGE2TFdZS2FscXVvMXdyZ2gyQkFZanBQeFdteWVJQjd4c2xvZ01SYmQ0?=
 =?utf-8?B?MFRsbyt6ZkRTbUZYS1lHcGxpQWtKbnpyaXA3QUtvMVIwUWphRWpZZ2paSnNr?=
 =?utf-8?B?R3d2OU9TS2pUclVHVU0xbVZVZFNpRGJvQnVMQW0raEFvRjdqbmYvUVV5Z0pq?=
 =?utf-8?B?bnBkd2ZlenpGTGRVYjNITEFHWGZGUTFUNnM0L094bEdjbDh5Vm5xck9TdDE1?=
 =?utf-8?B?dkx5eDlWb3lhSVR4Q1hTUGNOSGJ6YXlQdVRRYVJtUnZFcC83N0lrQlJOdDZJ?=
 =?utf-8?B?MWpsVmlLTnlwL0VncVlxNU5KVkIvTnNsSzVPdWlneUNDTmk1MExWV2hWM2Iv?=
 =?utf-8?B?Yk5WNVNKL2lTWEN6WTZ4QWRWODRnVzZNT282QitsNjU4MEJTdGdySWF1V0tS?=
 =?utf-8?B?MjVFNFUxeEtGQm5BbVA5MG95T0xhYVVrVURVa09HdGNqR3VVbDQ4UXY1ckQy?=
 =?utf-8?B?aENtNzJ5QVdPaWJoTTk3VjdHa2hxUVdPbGk1VU43cjNURGZqWWcvWEpQZDdH?=
 =?utf-8?B?WEgwbkF3YlUvUlcwR1RqenFMdmxLTXlUVWxKWXRBS1VyM29RSWZIc0craXBs?=
 =?utf-8?B?Q0FPeisrSTRyUzd6Rk1EY0ZtYTlsYjR6TlpKZDRIc24zaVNYM2ZSZmNQcjln?=
 =?utf-8?B?bDhrbzhQLzdYMm5MK1BRc3VZLzBvSWprVjJOY1RMNDRFa1JzKzNCUXlaMGZa?=
 =?utf-8?B?YnhTVHoxQy9RV3B4d0E5ZjRteFRTRW96WmhjUjdySXl3WXNYNXFkd0N2MSs1?=
 =?utf-8?B?QW1MQSs5NFhFUEVlMFBSQkRpeHpPVm5jYkN3Y2F1OGFwdFNxYTVPM083dHQ1?=
 =?utf-8?B?R2hCNWQrTlg4Mk1lWmtFLzRjTk95MVg0VnpZNXc1UXV6c2x4K0R1V2FPUG11?=
 =?utf-8?B?N1Bvanl1d20wTWJya1czY2F3ZmRLd2hMMXhkVllTT0w4b25YbnZobFZISHA5?=
 =?utf-8?B?U1hVdFpKUVgzeDZsZ2xKSExOU0FJMjJVb3htcWlua1hZWm9yTEVRajRNaUpO?=
 =?utf-8?B?TG1aVkdib2NNYjFkeXl0OFYvdkdBcjcyQ2dqU3JxeUxlZitQNVM1dUY5NnAw?=
 =?utf-8?B?Sm9HMWcyazJSdE9ORDRMVG41NldiTDU1RFpkWjVkVFdrTGNCa281QWRzbVlH?=
 =?utf-8?B?aXVUQTZsOXQyMDRrWDE2d3V5elphTGxlOGU5ZjVzK24zMUMrZGM5RHZzRXRO?=
 =?utf-8?B?NW9hMDFpdFNCR2crSEZoT0lCYnpGNDRDVzM3eGhGSWljM256TlRwTGdlb3kw?=
 =?utf-8?B?bXBBSzk0V2xKS2E3VmhCbmFJSXp1dDNwWlZtRDY1MDJUMkQzajJkTHBLYmla?=
 =?utf-8?B?ZU91QnBZSElXNWs0QnBKUnIxeUpBWndub0Zhalg2WDY0cUhmd1hzZ01HaGd5?=
 =?utf-8?B?NFc1M3BhTzJwNWZSMmNIVndCSkFTdEdzTkJXTDVvVVI2a1RrWXRnd0NnUVVF?=
 =?utf-8?B?MVZkelkxRE9YQ2ZzZmpWaU5zUFpiaUtES3JUajdjZElYQ0I5a1hOakk1WE1E?=
 =?utf-8?B?Ylh6UTFPWElNSmkyenpFam9nRmRPaEpPWHVaUkhIVDd5NlM0bGtUN3gxaG9w?=
 =?utf-8?B?dnhJbGRjWU5sNE41MW9YWjBGbm9KZXdaRmVraHNGNWRWQ21RakFyQ0ZQV0Rw?=
 =?utf-8?B?RDZSQmF4UHZPSE1Ud08zUjFyUDdOSC9ZRHBDaHVXOVByNHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0l4cnoyK2xBWXR1c1NZak1wb1Z0UmhoS25PQnhNQ0RXL1JJTGNOcVVkaHY5?=
 =?utf-8?B?UnpPUysxQ2NhSGJkYVF3RDd1aTNlNjJxVCtJOG9ray9QTGwya3pOcmdnc2Rj?=
 =?utf-8?B?WDV3cWxwemxHalFUUjVxZ2lrMjBqaU84K1d2bXNoWXlvU1VRckNSWlpQOXFn?=
 =?utf-8?B?cDY2bTlhZndRRjYrUHR2dWxycFZXWFlIMmYzNmFpVnNJQm0xQXQzQm9pUHd0?=
 =?utf-8?B?U2NteDBMMHdNZ012N2EvNVh2TW5qd2NBYjFHOTNETUF0dmljVUg4Nmh5dWpF?=
 =?utf-8?B?aVIyU1A0bFFlM1QrKzFBVG90MGxaZExab3Y2dzh4QktvN0xTbHJ1cVA2anVJ?=
 =?utf-8?B?RFFYZ1Zva1krckxSZXFKdmtob0MvL2VTS3JWd3o0cXp2OUdtcmVNU1Z0TXlB?=
 =?utf-8?B?NUZMdUZaU2pIMFkxZEVtSlN6bXRPSk9MREhRaWNRUlJBWlhZTVVvS2xZWG1s?=
 =?utf-8?B?T1dqY1lOY29vclNjK0o4Myt2K0ZNWEw5U3BGWVQxRThESitYb09RV1BYNXlv?=
 =?utf-8?B?ZE01b1UzQjhBblo3aDRoRUlVR3I1OXJZcDNUVk5XWW9OYjBMcUY5emtKTmpw?=
 =?utf-8?B?RWZpRXNqR3pSL3VwL0hXUGJQQis4ckNsQml2MHFOcVhnRTFqWlVqbWFZaU9K?=
 =?utf-8?B?dmJvRUphVjNnUFJUU1BsKzMxVm00b0EvV2gvLy81MnN3M3NaTnZzNXNNZ1kz?=
 =?utf-8?B?a1NmMVJyYlNtS3dKdzVpZEZnTTM4VVVxbjRBTTNuZm42K2lXQUNmT2F1RDdI?=
 =?utf-8?B?cXVidjVwbWxkRnMzUTRXWkpHUzJQNHorenVsQ1kzVVpzMGdaY2pPOUJRS3Nt?=
 =?utf-8?B?a0xvRnN2TFpFWUw0L21rZEFqTDcxd3RYelFuajNMNFArbTArYlIrMll3bUxF?=
 =?utf-8?B?SGZOa0g1RHhOK3lBYy9pZWFGUG52SWI3ZlQ2TjVYTXVnV2ZOb0QxTEJiQlpx?=
 =?utf-8?B?N3VHbGJqRFlJTDRIM1NPNWVBcUxBOGRzZFptVEdackcrNW5SNWdSMzA0a1pS?=
 =?utf-8?B?ZXVzUGpNR3J5dkoxK1NuVk9WekgyNFFTZ0JWQTY2bWNzeHd4UXRGbDVKVlA5?=
 =?utf-8?B?Z3pnUEZ4UVI4QUlOVGRJNjRBNDI5dTlVcC9xYlNEM1d3bitHWUxENEZhcDdy?=
 =?utf-8?B?clpUVFJkV3FvbEFzcysxZnBlUkpsYUJkWmxGNnh3cUk5Z0M5MGVUSHI3SkQy?=
 =?utf-8?B?SFl3NmZ2NWMvbzZXZ21va3hYUGdrbGw0MXZUdGtFMDRlR3VmRW9jNi81Z1V2?=
 =?utf-8?B?QU8xS0psU2I5ekg0RUpQbGdVUmxQby9mWERzT0kvbXk3TWZFVlNrWHAxak12?=
 =?utf-8?B?NWlPa0Y2cHF5THBWZ3Y2a2FCbVdIcENCcWNTSzJxVkY1cjNMby9IT2RuSWVL?=
 =?utf-8?B?c3N0ZW9xdTNJVHhaUTAyT0E0NHdLTkpZczZtQWJ0RnFnTjdoL2dhRmdjb0RM?=
 =?utf-8?B?djcrbFpxOEtuMlMzN3JGeFpKWFFCZnZWMDVpWXFuTGVtZ1VFTVFFbVJDVDI2?=
 =?utf-8?B?a3ppOGlOUnZxOVVBN3lTMFlVcWpNR0wxU0RlaEtDSlhQZ25xcjdCeWNYWTBD?=
 =?utf-8?B?V0h6UzV0bkRsUGdlM1pLVkMzV3RZN0NRMXFpUm4rdnltN2tHbVhXL2VzMmpW?=
 =?utf-8?B?VFlsR3QySUdrTjh1VVFRL1N6NzV4V0lhejUwaldJbnBranluY1FtREVCWEVl?=
 =?utf-8?B?eEJ0bHk1bDFuSU8zK2MzV0lsUnRsNnpONmlKN1ZkaXpZZS91eFU0QUhReklI?=
 =?utf-8?B?YmdvY0VDVi85YTJPbjZ2d3QwbXJwOHpRS28wRzNjcG53UHFTaXBMNWNRWUJt?=
 =?utf-8?B?c29vclEyTHRTSmVFOGRZSW5Zdk5XQlFEZktGZktlamM3NHB6NWFYV2FONGhW?=
 =?utf-8?B?WUxWSkRzSi8xb1NkNjV1QTlTeldoYkZhQXRXNlFxVTZpblIxWmhHYW9EMWNr?=
 =?utf-8?B?NVlEa2hOM2JHQzFtYTVIb2dCUCtWZm80dWh0NEJna3plNzl2R3k2djdzUHBi?=
 =?utf-8?B?ZlN3T0dheTA1R1lVTitoWk5OR0hkTEVxdit1QWtLOHQvWDgydVNpK2MyYzZz?=
 =?utf-8?B?czNQdlhhRys1MEF5U282S1czQktXb1pZTFMxQml4T3VBbTAzdGVuSU4vN3Nn?=
 =?utf-8?Q?wuVY0KEbeUugGyHIGVQOpAHaI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178b5c84-7d29-4864-9ed4-08ddc37ce4cb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:52:14.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpTc9NnRow2F6TjligDq9O8l+/gJOlEFtkELteDdJisp33Y6l9vMMc+v2SbLtsnw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5A66AFD1C



On 15/07/2025 10:51, Hari Limaye wrote:
> Hi Michal.
> 
>>> +    if ( base >= limit )
>> Given that limit is exclusive, to prevent empty regions, you would need to check
>> for base >= (limit - 1), even though it's not really possible because today we
>> require page aligned addresses (limit must be at least bigger or equal than base
>> + PAGE_SIZE). That said, it can change one day, so I would suggest to modify the
>> check. With that:
>>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> ~Michal
>>
> 
> I think that this one is maybe also fine as-is?
Yes.

~Michal


