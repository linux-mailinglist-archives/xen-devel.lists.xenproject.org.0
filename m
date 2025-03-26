Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A0A7144F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 11:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927467.1330208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNYD-0004z9-7q; Wed, 26 Mar 2025 09:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927467.1330208; Wed, 26 Mar 2025 09:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNYD-0004we-5F; Wed, 26 Mar 2025 09:59:57 +0000
Received: by outflank-mailman (input) for mailman id 927467;
 Wed, 26 Mar 2025 09:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+/s=WN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1txNYB-0004wW-Nw
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:59:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2416::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f5177a5-0a29-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 10:59:53 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 09:59:48 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:59:48 +0000
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
X-Inumbo-ID: 0f5177a5-0a29-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoLLBp3qJ5qsvbq2pBxafe/jqQzQJwFOLAN2lAROl4SdcpFwrObbH3ZUc8ma47CtiWe6zZnnoUwSFJneDDzGynhn1x4wsz2+MAMouBgsmAU2YsmrdyhfW8kCyjaOvtiJ+xU/a12reQdVGfS8mYbCu8JG8OH8lan8JvG9jBWX0a26qZC08HJwO6TuDGw7b8vM3xqMkTlvE5I4qrgeaq+JTwAtqvhZq/4vm5RBtNo8+WNLKSsu1IJ//8uHTVrRK5QN222eLLFKBbJFwmc9Hu/i78merxCs3bHEznADgL0/9Bo6DQ7oGNELsGl2PIAXGI4+5cUq/ky4a4RnDpTSA8jrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiBQJFD1PwRCMiYsIydQN0wvdz6TU6xqT6I69/+mfSE=;
 b=ORBRTS7TF8W+ymWS8TQ1eV9zq3JljcYZ+G+6dF+Txwvv1MWXYtr0fx4OHA6qPO/4RTaK5EYzHQxu4T4clocGWSSQxIzsOQB9bKTIhoiNpqo3MCLg0crJtOJRdBxQCUvrStxV0hQ2oCmPdy7ri/NG4jT5TJ6KGzSEU5KWlFyqP0BGVBp5d5O3Sv/ufpbhAvJks3pVx1JLGr4FwAI4ylEEuPoMV09NA5u3YQVkuRM9VD9PP3UAGeB2Si9nbszjUsJDvcmeoBC1sWuGYRJpvhDBoPP91Uk+Y0+HEc6Fn/eViGg7qJUNtjMU3QW+eWaXgVNkFpXrOf631MxyjTQodoIvGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiBQJFD1PwRCMiYsIydQN0wvdz6TU6xqT6I69/+mfSE=;
 b=Nf0lrYzxNCn563RF3NYTnIEgBeR5bdRxkqX1frbFr49LYR3ROsfBGQH4fv9qsVgTeIXGDWgsLFde7HrN7NjPAlfOFZv3SU6zi5+JVkVkx05qo+XjPndzOw2Jgtu+2yHHuDGSOLpcRGjjkbplqvpizZFFG1zek0uzsCQ0f8KFMU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e44de603-c2f7-47cf-8c7c-0f63227b723d@amd.com>
Date: Wed, 26 Mar 2025 10:59:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
 <136cf1c5-d1e5-471d-b560-51632b444e41@gmail.com>
 <94865aea-043b-4f52-adb8-d2d78dba293b@suse.com>
 <0957c74f-a53d-4107-bc8d-e13d7c308d39@amd.com>
 <8c160573-ca40-4bf0-bf67-ee905fe9fb12@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8c160573-ca40-4bf0-bf67-ee905fe9fb12@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 550d5282-3b3b-4198-318d-08dd6c4cf16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NS8zMXJWVnpvOHQyTU9KelkwbEs4Z2lQWUdQU2NKQTBtQkZ3MDFLNnRRRHk2?=
 =?utf-8?B?VlkwWlc2MExoZEdUOXZQQUl5ZVE3OUtlYnJlckw0TjZ6ejQ4bUg3ZlIzT1ph?=
 =?utf-8?B?QXRsZjdQU0tEbS9TdFQ2bkNYWGh4d1NvMUl4QTUzaG5zSmpQeFVIQk9CMU45?=
 =?utf-8?B?S3R0SkZjR01qbmVaMVMvMGgxUjBhN1RrM3RZbEhrTzYwVk16Vnk4VDExdVJS?=
 =?utf-8?B?eGtFQnNoRXE2NmttMjlNT0J5dUFTaVBXdXJkMWVQaXUrUXY2R3dMakRmSi9Q?=
 =?utf-8?B?ZkZoV245MXl3VUhPUE96RWdDU0hlSEdETGc0bzZ0U0pTdDdKR1hTZXM0ZnNX?=
 =?utf-8?B?Q0JaamUzSWxqQks4MDNKV1lLWFZuZURiTTNaWjYrYWZkZHUrb04ycXlaTGxZ?=
 =?utf-8?B?a3c2ZDRERUJNWk9JYXJvSVIwY1NZSjZZbGl2RWtjU1ZYOXE3c3VYR2pRRGNT?=
 =?utf-8?B?R2piajQvZTdQUzlXcXpsN1J1aC9wMmxYNUJXbjJQYjNick9SYjdOcVArc0lP?=
 =?utf-8?B?Y0ZBakF6blFoaEZQaUxyRkJlSXNmNW5heFF3dXlKQUYyU1NBVVlBb0F2bE1F?=
 =?utf-8?B?cE1NcGQ0dzg5KzhINEJBNVd1MGQ2eVVlNGxQMXBxQU0wRU9qeE9tNHMxaVdq?=
 =?utf-8?B?bWp0ODZhL1ZOZHkxb2ZoSWh1S0Zzd0NuczlIYWJ5Q3R5SlI4UmFaMVBYYldZ?=
 =?utf-8?B?TDhkaVRzUWZONFRIcGFkTmNicXk5YzRNTjlKaW1RMTNsM3pzSlpPQXhpWDBQ?=
 =?utf-8?B?K0d3R3E4RzlvZUpvYTU1ZXFJWXdUVk94V2s3QjNrVWpyYmljRE04WGc4RVA4?=
 =?utf-8?B?QWpNWFNSVTF0cE9pNnpVTW9JalAxcS9uMmxkTDZzRkRhdzBVMnROSVh2L0FR?=
 =?utf-8?B?MTJGaGxEWVpmcWhkOXEyVXlGb2k0R0FXZlJTRzBXUFdBcHFzQkFGSk8vUFg5?=
 =?utf-8?B?V0dpYTlYQmk2eDRzamxHQUh0dEpBcjk0QStpL1phTHBzSnVsakNRRXlLbTh5?=
 =?utf-8?B?cVExSEdwRXZ6KzR3VmtOcHZDOFNPVzVURS9DZHJzTEpNa3oyK3JaYnFYSjBR?=
 =?utf-8?B?UXNwWm1xOTh1TC9SVVdWZDFoYURLbXlnaUh6cCtPQ2hSdXd4aldkbzV4UlRE?=
 =?utf-8?B?NFN6Q0E3UlRtdTV3S0s0R042aGhDOThlNnVxVHlKZlU3L01PcVhycFNBZndQ?=
 =?utf-8?B?OXdDU3o1eHV2SE1DbFBCL01CY2hsNWxUdTVoQTE1ZjFUSEpFOUZVdnFHdEVl?=
 =?utf-8?B?emhsKzlwYll6a0NtZHY5NWRLWmkyR2ppV3l5R3ZydjJsNzJwRWZYQkxBSncx?=
 =?utf-8?B?YXUvdjh0bzZKQy9nMzBvQy83M28ycW4vejFpczhuZzY4Q1NhQnlRQkZuVmlV?=
 =?utf-8?B?UmI2Uyt1Yjg0akRuL2hEMGJYRVJOam1ieXFXcmcxOFFmMUVnVjYzRTdhVDFR?=
 =?utf-8?B?VkFOd3ZUSGkwTGdnTktlVUpzY1J1SjJ5KzQweXpodGVTYVFXWUFFNGI3K3Ji?=
 =?utf-8?B?R2VWRU5iN1BiZ0o1ai9nMmVqSlZpM1NBRU4xYXAxOTBjQ08vTlA1QU9GVmpE?=
 =?utf-8?B?ckFtbXRpUFVGV2JWNXhoaUpJakhwdU44UWwraGxObldKdVg0c1V6d2FNZWhS?=
 =?utf-8?B?d05aby9MaEZVR3ErRmlTdGpnT0dTMVJFVzhWeEJOUUNMVlhPZEZOQWZ0VCtE?=
 =?utf-8?B?Rlc2ZDhmeVdINk1vcEpQRWEwdVpFRVQ1ZnRPYmIzeXVheE5Hc3RVNGFtbVky?=
 =?utf-8?B?ZFE0dzNUK25JdHViSkpka01UQmU4dzkwWm1HUVNiWlAyYzY4YjRCVzY0dGFO?=
 =?utf-8?B?M0I3VVJWYVNHNnVaUGoxK0Y3djA0cDllRkY1VTJnUFJnUFNRVFJOaVpPRWVx?=
 =?utf-8?B?TVJLZ2h1N3VONmE2RWowd2IySVNVTWRzZFlnb0xQTEVVc29KMFQwdGowNlRP?=
 =?utf-8?Q?anOBQeBkVPTLunh1vmympXRQIVAcmUTP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZtMHVHN245Z0liaDVwZ2FMek84eXMwWElxTGlDSU1TOVRodW1kYVRjWDBm?=
 =?utf-8?B?OEUvVUU4N2pBRVliL1d5R0JQL2t1UDgrRnM0UkwxdWE1a0VTZ3NoZE0xcElZ?=
 =?utf-8?B?NzFLMXI2S0RZNWVsRjB0TSt6ZXQ0Nld5YzdFZ1RwcDZhQ0FDbFc0MGhLM1VT?=
 =?utf-8?B?M1BJRGdjSTVNcXRQeW83RS9URzNsY28wRUtlSHFTRzBlRTkySUxDQ0RZVEk4?=
 =?utf-8?B?QVRqeE1RZXRzTDF1Tk9aTllPVWE1bEI2VHpocnRRM1p3R29vRHM3S1hua1Ny?=
 =?utf-8?B?aXlqKzRJTUVuVWV6THB3VmZ5QTF5cjQ0eWE2STJHQmE4T2JEa0F6V01BK2ZL?=
 =?utf-8?B?UnM4TFlYUTBXYWM2M2VSSmtlTWxLQlRCdm41M3Q5SU45NWdQeWNRQ2RSUW1F?=
 =?utf-8?B?VnFxc1RwRmJ6bEFFRFg5UFFzYW1vT0l4ekNBUXRTaGNRTk1vR1AzemcwWmR5?=
 =?utf-8?B?K0Y1ZGJyc1BQR3JQUDc5Y2RVOFlJbVBEUUhSZGMxZTlqNnllZGVsTUwwWW1k?=
 =?utf-8?B?Snl0c2t3NE04T1NmeTJMZU1QUllJMGMyMmdOdTlNUUYzOXp2SVBVMnhkZVNP?=
 =?utf-8?B?M0I3SEJWWkl0ZlBRR2FzdG5GMXZ0OFR1eFV2NUV5VXR4MGpsRFY5enFNaS9H?=
 =?utf-8?B?L0N4cWlUUCtFVnJZNDNMaEpYWU15bmZFdGdlMFkvUi9LYk9UU1hWY2RUTEtP?=
 =?utf-8?B?Yjg3Q2NHbjhOdHVCWFVoMjdpYWJQZFZ5VWpBYVFremtYOFJCcWZzR29vNWlw?=
 =?utf-8?B?YVhTcGpxZWtPQ0ZucWl2Z2FUbnpkTm15Q05Xa3J4WVNYMzREZTIvNS9uRkJn?=
 =?utf-8?B?Z1RXNlhlT2xIODNuMTBIYnBpWnd4ck1ER3JkcG9uUHBwdWxKWVptRkxIK3Fn?=
 =?utf-8?B?RVFvZy9BM3RGejd2bkFORmlVdXRzUXFJWUExT1NpS1lYc0FrVmhQbXdaVU45?=
 =?utf-8?B?NFpJdkZFK3JUdi9iR043c25pUkY3N1hKc1ZQL2llTG8zT0NHL2t1THgwVENa?=
 =?utf-8?B?MWN6WE81cjRra1VyMi9YWnZEQndQcUpNUERSMDJGYzNXdEhqaUFuelBQc0hN?=
 =?utf-8?B?Q0MwMzZNT0hHK0pZNk15dVhQOGVvbTE4U1BPa0hncmtZRU1mRjJaNXJFaWMy?=
 =?utf-8?B?YkhnVkhJeCtRSFJhM0NCSVFZSzlBZGlOV1lQZGIrdFJIY2ttcmNqTGY2a2Jp?=
 =?utf-8?B?ZTgzTTZ4NTdoVk1pR2RvUk1EdVpXWDFWa0pKYUpralF4Z1d2bkhraERVTkRo?=
 =?utf-8?B?MHFhYUpvZ0U4bHh5YWFNZVlJcTZ1RFpHT2ZRNXhZeFBER1VUcWVwZVVLNSs4?=
 =?utf-8?B?Sk9JaFRSM1RXZ20vcEw0R1U5VnJiTWNmdVo4Y1RxditDUHV4R2h2TGQzV1Qr?=
 =?utf-8?B?LzBnMTRFc0krLytYTmZUa0ozNDNGbkt5WDFPN01oUkxnS3FTOGF4dmFBUWRT?=
 =?utf-8?B?K0c1OTdMVjBXakFiM3BwTjZzUi90T3hUR0cwUEFGN0NkN1dKNG44bEZKNDVV?=
 =?utf-8?B?R2xZS1pjNTlXSC9mbjYwQ25YQUsrcFAwT1hGdFRPRi85V3B1endNNE94ZGFO?=
 =?utf-8?B?U0k2OC9kYm5vU1Npb0VBbWptamdsQk1Vd29OUCtvYmsyY0N6dWlhZkEwOWE3?=
 =?utf-8?B?RkFwV0JZZE1BODhWaG9JdFVRbWRRaW9peUhmbGhEUzc1WjRVTjlRdkFIS3Rz?=
 =?utf-8?B?dk1hTlY4bW9DNkNhV29jNVBKMDVZNVpDYjJnaExEazVkeElSYTlQS2N2VW9z?=
 =?utf-8?B?eEVTa0VDaFFhS3JtQkdxUVBPYXVOL0xCRzZ3K3JPbnZTQy9mRDhrVlpGdEpw?=
 =?utf-8?B?Y3Z4aUU2VUpTVjNmYmovTlg4VnRGQjU2MjZDZXNmMEd3ajladkl3SFBSd1pi?=
 =?utf-8?B?dUxZVkJJZG5RMFlzVlR6eWVBQkZGUi9lNUl4eDlKdk1aM2VjcTlobU1YcFFn?=
 =?utf-8?B?ZGgvV25IU3RRcEkyUFg2NXVjRXo3N2RvcTJ6MW4xcEdYT0Q2Tk85b3lXbm9J?=
 =?utf-8?B?WW1iY1EwN1dXZE9rMkl5U3owNlhYR0l5SXVFNEo5NllmK042cms1TzlxWG9L?=
 =?utf-8?B?dk5SY0prTnU0TXVoRDFwWU90OW4yTGhHbXJvTmlrZ21OaU8vZE45di8vVzF4?=
 =?utf-8?Q?idapzachOmIrMankGWehWDC9Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 550d5282-3b3b-4198-318d-08dd6c4cf16d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:59:48.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU5m3Ugnht4tYIdZy+HiKJ0ymQfZI/xroa3p1e9bMIscIAq0QQMxglpn7Vg6fULe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169



On 26/03/2025 10:54, Jan Beulich wrote:
> 
> 
> On 26.03.2025 10:39, Orzel, Michal wrote:
>>
>>
>> On 20/03/2025 08:32, Jan Beulich wrote:
>>>
>>>
>>> On 19.03.2025 17:31, Oleksii Kurochko wrote:
>>>>
>>>> On 3/19/25 12:35 PM, Jan Beulich wrote:
>>>>> On 18.03.2025 14:05, Oleksii Kurochko wrote:
>>>>>> On 3/17/25 9:07 PM, Luca Fancellu wrote:
>>>>>>> From: Penny Zheng<Penny.Zheng@arm.com>
>>>>>>>
>>>>>>> ARM MPU system doesn't need to use paging memory pool, as MPU memory
>>>>>>> mapping table at most takes only one 4KB page, which is enough to
>>>>>>> manage the maximum 255 MPU memory regions, for all EL2 stage 1
>>>>>>> translation and EL1 stage 2 translation.
>>>>>>>
>>>>>>> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
>>>>>>> MMU systems, x86 and RISC-V.
>>>>>>>
>>>>>>> Wrap the code inside 'construct_domU' that deal with p2m paging
>>>>>>> allocation in a new function 'domain_p2m_set_allocation', protected
>>>>>>> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
>>>>>>> the former function with #ifdefs and improve readability
>>>>>>>
>>>>>>> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
>>>>>>> with !ARCH_PAGING_MEMPOOL.
>>>>>>>
>>>>>>> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
>>>>>>> field is not required.
>>>>>>>
>>>>>>> Signed-off-by: Penny Zheng<penny.zheng@arm.com>
>>>>>>> Signed-off-by: Wei Chen<wei.chen@arm.com>
>>>>>>> Signed-off-by: Luca Fancellu<luca.fancellu@arm.com>
>>>>>>> ---
>>>>>>> v3 changes:
>>>>>>>    - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
>>>>>>> v2 changes:
>>>>>>>    - make Kconfig HAS_PAGING_MEMPOOL common
>>>>>>>    - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>>>>>>>    - do not define p2m_teardown{_allocation} in this patch
>>>>>>>    - change commit message
>>>>>>> ---
>>>>>>>    xen/arch/arm/Kconfig              |  1 +
>>>>>>>    xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>>>>>>>    xen/arch/arm/include/asm/domain.h |  2 +
>>>>>>>    xen/arch/riscv/Kconfig            |  1 +
>>>>>>>    xen/arch/x86/Kconfig              |  1 +
>>>>>>>    xen/common/Kconfig                |  3 ++
>>>>>>>    xen/include/xen/domain.h          | 17 +++++++
>>>>>>>    7 files changed, 73 insertions(+), 26 deletions(-)
>>>>>> For RISC-V:
>>>>>>    Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>> Mind me asking then why RISC-V needs this at this point? The stubs surely
>>>>> were added to address some build issue, not because they are actively
>>>>> meaningful?
>>>>
>>>> Only because we have stubs and not to have redefinition compilation
>>>> error. And, yes, they are not actively meaningful now, at least. I am
>>>> okay with not enabling of this config for RISC-V but then seems to me we
>>>> have to drop stubs in riscv/stubs.c. ~ Oleksii
>>>
>>> Well, I don't think it's "have to", but I agree that dropping them would
>>> make sense then (and be desirable).
>> @Jan, @Oleksii, is there anything blocking this patch to be committed (Luca
>> question does not seem to be answered)? Other patches in the series are ready to
>> be merged.
> 
> While I think Oleksii's reply has sufficiently clarified things, I still wonder:
> What question of Luca are you referring to? There's none visible in context here
> afaics. The two questions that are visible were raised by me, and answered by
> Oleksii (also visible in context above). There was an implication to draw from
> that, yes, which Oleksii has now made explicit in his reply to your mail.
Sure thing. I'll clarify. Here Luca asks question to you if it is possible for
RISCV guys to handle it afterwards:
https://lore.kernel.org/xen-devel/D86D58F5-1EDD-4362-B163-5AD25C5DCC51@arm.com/
https://lore.kernel.org/xen-devel/F827A271-0E9B-4240-BB1E-C039E9EE5656@arm.com/
and you did not answer to these e-mails.

> 
> And then, formally this still didn't have a REST ack (you limited your R-b to
> Arm) nor an x86 one.
That's why I asked: "is there anything blocking". Missing REST ack fits into my
query.

~Michal


