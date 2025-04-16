Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA26A8B975
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 14:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955976.1349518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u525p-0001vQ-Kx; Wed, 16 Apr 2025 12:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955976.1349518; Wed, 16 Apr 2025 12:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u525p-0001tk-Ht; Wed, 16 Apr 2025 12:42:17 +0000
Received: by outflank-mailman (input) for mailman id 955976;
 Wed, 16 Apr 2025 12:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIlj=XC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u525o-0001ZY-76
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 12:42:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2418::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d951c9-1ac0-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 14:42:14 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.21; Wed, 16 Apr 2025 12:42:10 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 12:42:10 +0000
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
X-Inumbo-ID: 38d951c9-1ac0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjGCPprzcGyXKRzyONTwXMlm2PIVL3FH+W07NpzrrRDhE2BMzVUJ8rMNhbiqgqhFLhIkpGFlNvzsiZC8Rh1G1gIm695IEcMRRSt71L54Aqb05fJffcKCGfyeFtL7cZ0sG+PnPiqeWdZWsaVXX+1OFc+OOIPvcvGuYcXgDMJenqAQzoVFQob85PI4mmO9FhFk12UePoKH35r4rAwQjHNXD5tvtgdJlYwBS1ao+pHU6SH431hAteTmiRXC+NsasW03ZUGD5+JSlJQHPKjBra/qzTW8i+4VTcGNIQuIGe4AF/BURio45JFPQ/KuAD7ZbHIYWL4TghhNKOvWWfwVKvq+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYNKPEWu0pVbkv4BB1tMxqyMIveOWb+p3Rg1Xl6ao8k=;
 b=hrALo4ReTcpM8sIhf/CEAWUF0k0lps/LtcLnOozYEYRfkl3C3VH4WdFNzMYgO8RB8I0y+XqXJxY19qCVRJyeK0nVEuVOfq2kmBvDU6QFHkFMFKxRKzTw3i9kTmBuMvjPVlNIBNGUbddanTSsvpPnEwe2WwDyhlaXekHmWQF7umY3tuZRVCzwepkpE1kXgf7G+cJGooJp6v7f40g/xyQR7Dce+vJJTakfrj++5fTYouEFm+Ml9tGKa5ZKHztD0ZcAUJ++c++d8SoHvRQbVHS8AobOSF51ws2RcKkROuF9WCQZwEOhxMoI6WIw6tWiUhEJue/8xef7xx4Z6ij3+b49iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYNKPEWu0pVbkv4BB1tMxqyMIveOWb+p3Rg1Xl6ao8k=;
 b=k7VvwKwSQgXxiyQdko99j76mjcSbc+mkFHM2kg+PxF08UFR4CXDTpUSMpUQjt6jKzvvpNR0vA9TTMiljzxfLxPqBdCOV7ak5nwrQQWvB5hqgYChJHQnqqQWInz/w7fAtPzeUAIlHqHYtb5dz2sAr7hSsrWwGFBLWnVbO+JQF/aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <22a7f8b1-6614-4354-830e-30dbf6210ec8@amd.com>
Date: Wed, 16 Apr 2025 14:42:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] arm/mpu: Introduce utility functions for the pr_t
 type
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-4-luca.fancellu@arm.com>
 <d2b51729-e5dd-4325-9275-615ab1cbb68d@amd.com>
 <0877268B-138F-4FC9-B95E-544699D8AD91@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0877268B-138F-4FC9-B95E-544699D8AD91@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 33644e09-0298-45d7-08ca-08dd7ce41ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2xjeG9hcFJ2UVZZQ1dKajIzZWxMYXJ6My9hY2w1TGtBU0pEeXZicENoVHBr?=
 =?utf-8?B?RFZWMDR6MmFVeXpQZ2Y5TFgrL0pKalVXa1BCcVNXRC9PNGNpQnZTcjFRSmND?=
 =?utf-8?B?Y0xZWTY2QlkxY2JaNlp0RUhWVzFBdHpMZWYxYjZwWVFOV1pVenBtQ2xEU1R2?=
 =?utf-8?B?d0xUNldHZE1HYmRHWnQ3eGdzakM0TzI0TGR2djhvNzBFOXo0blNkbFhqKytZ?=
 =?utf-8?B?UGRFVVExekYzQ0pHeWd4OWFoMkkrYXFPaW00NnYwK21CZGw0ME4vVmt5bDBG?=
 =?utf-8?B?VVpvNXZFM0JtK1ZtQXBiRCs2dGVnOUE0NWZzVzNnbWhiOGpsbW8rZFIxaWNs?=
 =?utf-8?B?MkFleXB5amQzVkxSWGpoU0d5NlYvUlA0L0NSTXFjblFBbjdkQzhIWFRuM0pu?=
 =?utf-8?B?dzc3bk81Q2NqNVNQZC9sQ0tKZ3JOTXFLYTB0Y3l0dkZYL1N3UGZ1OVRaM2Z4?=
 =?utf-8?B?aWVWUmloRTdiTzUwenhlcDVJR0d6eHYwdkVZSlZkWmQyL01vbzlxdGdMVG10?=
 =?utf-8?B?MTQ1KzB2VWlzSlN1VHNBRmRLcmlmOHVBaWdKWDZFN3hoa1N0SU92YlFwWSti?=
 =?utf-8?B?WjBYeHl4NTFyVC9tby9XSCtpZGxneDM2MFc0UVI1dXdhYStFU1R4dDB2bElv?=
 =?utf-8?B?VGxzTW9tMm9yQmNld1BOZmkramJrSE1lUFNiTklqRGFtTFMzMmNqQnhUUTdn?=
 =?utf-8?B?Ylk2dCs5YTF6b1NKa1hiOU95QnBKWi9wSlN1VHUxcnQxZ1NSTUhCa21mU2xB?=
 =?utf-8?B?MElLLzhqcjNiaTM3ZnZBVzhBbHhwUlRLYUk1a2E4NFhUV0RGVmtpQ1JtY2NC?=
 =?utf-8?B?SGJMQVNYUCsySDhWVnl6RnhPY1pkRlFrWmZ5UWN2SHViVEJ0ZzBqc1FJb2M0?=
 =?utf-8?B?MnV5eHU3STdjL2lyVmZrOEo2VlM2bENnbkFqdEoxV0hYcGJQWngyVkhnTW1q?=
 =?utf-8?B?dWU0N2NqbUhvY01ENFkzaVBEVVV1eUFQVEY5VEoyOEJpSGdYZ1gyalI0Wjhz?=
 =?utf-8?B?ckx3LzZmMWFNd0dGUEU5LzIvSStOMVhCdGZlVCtWbmZQYVBmMVEzWVN3eG1Y?=
 =?utf-8?B?U1hPOHRZZE1ReUdtb1kwWWFMdENOSVorekFIL0Nhc1BjZUNSNmlJaVBNV0k3?=
 =?utf-8?B?NUwzcUxreWkwS1dVUGh2T1ZnaTkzWkZ2WjFKc3c5eVo0amk0WnlkVzVuMEVk?=
 =?utf-8?B?bE1sdS9vK2RIcTA4U1g2cktWR2RSVUN4UEl2SUZqNTJYQmFPSFN6YnBCamJ5?=
 =?utf-8?B?MEcwc0xnY3dRYW00SVA4NEcxTExSamx5U09KT2ZqdVV0ZGd4TlRVdngvbmxT?=
 =?utf-8?B?SUdKTHlCcjBsQ1JXRkJHUWl6MlMzN0F2YXU4Z1llV1JEVUxodTJ4dmpSWWJG?=
 =?utf-8?B?R1pJbjlBZHpTWlp5LzgwSXRzYUZ2bCs3RlBQK2dSZlUvMENFTkEwaXdZcElS?=
 =?utf-8?B?WitkOWYzd1hqR0lTVW9qanZjREpxc1dKL2pvQTBuZUMzQ05WcGZ5dlhrTUN3?=
 =?utf-8?B?MkxIdTJmSnhiT2RwbDRjTzA5N0VReUQvdGpRbEJCd21va2pNZ2RMdktJYUdU?=
 =?utf-8?B?dUdQc0ZRV1plR1ZVY1VLTmZraFRtaHNaTHVaeTRmNnREOVhmZ09pSHRZMW1o?=
 =?utf-8?B?S2wrSUFaT2VQbjB0TmltY2huM255QWtqNjRoZFJNQVR1M2RLcHBPK0M0VG5u?=
 =?utf-8?B?bk1nMTdnajkvdi9QSUxNTkZBMW1xbnh4VXBBNlBJVXEzemYyZWJsMHB2ZlRt?=
 =?utf-8?B?ejRRWEZoSm1PRFRqVjFhRGV5bSszTXp5cGFyeE5xVWNKTU51cFh6V05ZNVF5?=
 =?utf-8?B?RHhla28wOEhYdjRQazhCVU84dXJ6QWpubVRJUG5UZFpiYjVnWmhla2toNlV1?=
 =?utf-8?B?RWR4ZnRMSmlEUmd3NzV1aTBsWDBMR1BxMVdpMWVpTGhjSFZqTkFYSzEveTlP?=
 =?utf-8?Q?a0r/j6j6WCk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWR5aDFiZ2tjSFFueHhGdGZHMzRGUDZndEk0STVJemdMMXJwemlrQTkzU1kw?=
 =?utf-8?B?Qzc4c2VXQjVFSVJBM1hhZWxhRndhNjc4Qk93UFVHUDdkc0lEOTRFMXRUbkpL?=
 =?utf-8?B?bGFCaXFPSEFPV2Z2M2tWdFIwTXJpZUJnZGlleXI1elR2ZXhIQ0o4U1dTK0tC?=
 =?utf-8?B?azB6S0NpOGljMWZZbE9zTGZxWjgwNTFXSGd0OVZjZGZrYzF5RDZZTTNRTmZq?=
 =?utf-8?B?OEtaVkRUUVhKeVgzTk84ODFnbW9wc3p0TlI3Yjlib0ozNlNncjM3S1Axc2gv?=
 =?utf-8?B?Uzk3ZlU5SXRjOTVyTkp0TkJ5TjA4d3VQM2M5UHhBeFV6N3I1c3A1OEk4UHc0?=
 =?utf-8?B?UkZZaU90OWl6c2RlcFUveHpFSENyb0gyVDVrQ1ZQYXR5eDZoelMrZG4rVWV0?=
 =?utf-8?B?Z2lqckEvaHIrQ0M4Z0tKQytlYU9mYjZFWXQ2R0hZN0FMTlZrS25hampFT1Nx?=
 =?utf-8?B?S1NTaGhpUlR3TjRHeFhsb0g0aFVIYUNjNUxDL1BvQmtkQWN4d1ZJb002OWlm?=
 =?utf-8?B?RUtCdEp3ZERaNWFzMGUxK2xJMDA4Z3FGYjBhU1BBUTAvVTZEbDhQaDFGR043?=
 =?utf-8?B?aUFzQVhVMmdvZ3crZG5pTVNKTGhnU254WjVycXBRb1BkSHQybk81UkQ0S3lj?=
 =?utf-8?B?aEdPalp4aE03Vm5SZThFNWZLWG9zM3l6ZitKdDNGcnZWYWt5SUZmbkF6MEY0?=
 =?utf-8?B?TFpaMGZ2UEtGYVhqcldhSWhXaitZZFg4YkpmeHVSeDBoMjI3Wnl5UzU3Y3JJ?=
 =?utf-8?B?Mlc5V0w1ZEF3ZmpjWFhyeE0xNlZ5Y2VPSy9abVhVSWp2bktEZjY2bE12d1k1?=
 =?utf-8?B?ejlxWXNkUnlKTzNRaVBiMW50aXBIaWZycUU0cmpuS2RuR3BORVdOK29RZjJO?=
 =?utf-8?B?RFI2ckRMVmR6SE5Ea2Q2ajJnSFJYWWxvSU9Cb0VXTWw1WnFuUjVQTXNNQWZB?=
 =?utf-8?B?SWYvS1BNdDBPQnlJbVhkK1VyeXpqbjkyM3JqL0xFZW8zWk1CYWNJNzlaTDI0?=
 =?utf-8?B?T0JjWTY2RVI1dC9iL3hsb3JjeWhWL0lFKzhVMzl5QnJWUnloa2EySEw0QVVU?=
 =?utf-8?B?Y3FNa0V5UlIwanlxMVl2amZlRUF6WHQ5UnRLRWNIYkVXSjZKVmc3SjBxbTJK?=
 =?utf-8?B?VmZNbDhFUi9nUDRkSnp1Mk1oaDB5d3l6TkpxdksxUWtkZHZDMEI4NXI3NmtT?=
 =?utf-8?B?aFFMbys3Y1pFY2h3QS83OUt6TzZ2OWNVZXNXNUd4K09scTZaOTJ6SGhLbm1R?=
 =?utf-8?B?ZXI1M1hKYk4zQlJIY25EcXBhelp4a2tuV09GQUh5dWo0U1hvZ29yM20rTHpp?=
 =?utf-8?B?cFY2Sm9YZE5GOFhXcXJIcGp1bHBBUmxoMldLajBYeldMajJ4aWtob1QvZHVR?=
 =?utf-8?B?dzQ0Y1dkcnp1N1BvQUU0M01RbG1tSkE5cU1jWTFrdXBRSmhUU1g5QzlCY2Nj?=
 =?utf-8?B?RmZkMjlqNVllT2FDejJtL0NkdWdNaDBTbldDUGRQaWY4YXd2ZjdGZ0tZNHE4?=
 =?utf-8?B?dk8wamgvb3h0WWZCQXlJblBlQS9HNjNIUk5VK09YUGJUY3FuTkxaUVEzS0ZV?=
 =?utf-8?B?cE5VN0tlNVh0S1NlaDFYVloxQXNIeUREZVRRc3M3RzJJTXRZdlVPQm5CbFIv?=
 =?utf-8?B?cVE1ZWl1TmdqL2hTOTZzWjhiSUV5OHpkdEUxdVBXWlNSTFJzaEEyMVpieStu?=
 =?utf-8?B?eWlmK2hIVmlxRHJTMjVNcEpWVUxiNmRZQ3c3NjhFVDNSdWd4ejdnNCtQc1FE?=
 =?utf-8?B?Q1dpNk1EdUo2VXRBV2kxb2c3VVhVT1pvdmhQK09kV3dPckw4RGxhOFQyR01y?=
 =?utf-8?B?Y2U0NTdiRXV1Q2VKbm9zY1k1UTBhUG1LbUdTcnRTczdTSHF2RDI1czNKdjdX?=
 =?utf-8?B?eUFQSi9INktKdFJVdmh3cDNENEk4OS8vVDhscGxLL1BuNUJNTTRwSHFYOEc2?=
 =?utf-8?B?MXRDeFlnVFZLTlFHbVMxeVdKZGgvUDJ3TGpzZ0Y1Q0xjWkwrL1RyLzV2dURR?=
 =?utf-8?B?dDlsSGthaTkvRno2UTd3OEpTUE5wUXI5QytmLy9HU0VyVVVGeWVaaGhPbmJa?=
 =?utf-8?B?MjlUNzkvc01HVjYyYk15cUFJZmx5bGN0cERYRnZwYnV6YUpXU3FLbEE4NjRE?=
 =?utf-8?Q?HA2E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33644e09-0298-45d7-08ca-08dd7ce41ac2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:42:10.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gw6eaeT7cnvY5FeHlofiAGE0MrUj1rwnv4IyZh7/rr03SkeH9G0LV4SrzVyFxiBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446



On 16/04/2025 14:31, Luca Fancellu wrote:
> Hi Michal,
> 
>> On 16 Apr 2025, at 11:50, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>
>>
>>
>> On 11/04/2025 16:56, Luca Fancellu wrote:
>>> Introduce few utility function to manipulate and handle the
>>> pr_t type.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/arch/arm/include/asm/mpu.h | 40 ++++++++++++++++++++++++++++++++++
>>> 1 file changed, 40 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
>>> index 59ff22c804c1..6971507457fb 100644
>>> --- a/xen/arch/arm/include/asm/mpu.h
>>> +++ b/xen/arch/arm/include/asm/mpu.h
>>> @@ -20,6 +20,46 @@
>>> #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>>> #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
>>>
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +/* Set base address of MPU protection region(pr_t). */
>> What's the use of (pr_t) in this comment? pr_t is a data type. If at all, it
>> would want to be ...region @pr but I think you can skip it.
> 
> ok
> 
>>
>>> +static inline void pr_set_base(pr_t *pr, paddr_t base)
>>> +{
>>> +    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
>> Looking at pr_t definition, base/limit is 46 bits wide. However the spec says
>> that last 4bits are reserved (i.e. you should not write to them) unless FEAT_LPA
>> is implemented. What's our plan here?
> 
> So we’re currently supporting max 1TB, so probably this one needs to be on the
> case when FEAT_LPA is considered not implemented, so I’ll change and if we will
> later support more than 42 bit we could do something?
I think yes.

> 
>>
>>> +}
>>> +
>>> +/* Set limit address of MPU protection region(pr_t). */
>>> +static inline void pr_set_limit(pr_t *pr, paddr_t limit)
>>> +{
>>> +    pr->prlar.reg.limit = ((limit - 1) >> MPU_REGION_SHIFT);
>> Why -1? AFAIR these registers take inclusive addresses, so is it because you
>> want caller to pass limit as exclusive and you convert it to inclusive? I think
>> it's quite error prone.
> 
> Yes it’s meant to be used with exclusive range, shall we document it or use
> Inclusive range instead?
What's the expected behavior of callers? Are we going to set up protection
region based on regular start+size pair (like with MMU) or start+end? If the
latter for some reason (with size there are less issues), then end usually is
inclusive and you would not need conversion.

~Michal


